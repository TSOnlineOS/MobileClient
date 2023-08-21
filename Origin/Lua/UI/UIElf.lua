UIElf = {}
local this = UIElf;

this.name = "UIElf";
this.uiController = nil;

local transform_FrameRect;

local scrollContent_List;
local scrollItems_List = {};
local slider_Exp;
local gameObject_Team;
local gameObjec_UnTeam;
local text_Name;
local text_Lv;
local text_Count;
local text_Total;
local text_ExpValue;
local text_ExpFullValue;
local text_BaseContent;
local text_SpecContent = {};
local fightElfNo = 0; --出戰的小精靈no
local feedCount = 0;
local currentElfNo = 0;
local orgExpGod = 999;  --原本預設的福神
local maxExpGod = 65535;  --最大可餵食福神數量
local expGodId = 46037;  --福神
local expBigGodId = 46038;  --大福神
local expExtraGodId = 46234;  --真福神
local elfSave = {}; --save傳下來的elf資料

function UIElf.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;
  
  text_Name = uiController:FindText("Text_Name");
  text_Lv = uiController:FindText("Text_Lv");
  text_Count = uiController:FindText("Text_Count");
  text_Total = uiController:FindText("Text_Total");
  text_BaseContent = uiController:FindText("Text_BaseContent");
  text_ExpFullValue = uiController:FindText("Text_T5_ExpValue");
  text_ExpValue = uiController:FindText("Text_T5_ExpFullValue");
  gameObject_Team = uiController:FindGameObject("Image_Team");
  gameObjec_UnTeam = uiController:FindGameObject("Image_UnTeam");
  
  for i = 1, 3 do
    text_SpecContent[i] = uiController:FindText(string.Concat("Text_SpecContent_", i));
  end
  
  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;
  scrollContent_List = uiController:FindScrollContent("ScrollContent_List");
  scrollContent_List.onInitialize = this.OnInitialize_ScrollContent_List;
  scrollContent_List.onItemChange = this.OnItemChange_ScrollContent_List;
  scrollContent_List:Initialize(1);
  
  slider_Exp = uiController:FindSlider("Slider_Exp");
  
  local tempEvent;
  tempEvent = uiController:FindEvent("Image_Team");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Team);
  
  tempEvent = uiController:FindEvent("Image_UnTeam");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_UnTeam);
  
  tempEvent = uiController:FindEvent("Image_Feed");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Feed);
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
end

function UIElf.OnVisible(visible)
  if visible then
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    UIFrame.Active(transform_FrameRect, string.Get(23713), this.OnClick_Close, this.OnClick_Help);
    this.UpdateUI();
  end
end

function UIElf.OnClick_Help(checkShow)
  if checkShow ~= true then
    UI.Open(UITutorialHint, 77, this);
  end
  
  return true;
end

--C:107-005 <查詢所有小精靈資料>
function UIElf.OnOpen()
  elfSave = {};
  Network.Send(107, 5, sendBuffer);
  
  gameObjec_UnTeam:SetActive(false);
  gameObject_Team:SetActive(true);
  
  this.ClearAttText();
  
  for i, v in pairs(scrollItems_List) do
    v.selected.gameObject:SetActive(false);
  end
  
  text_Total.text = string.format(string.Get(23749), this.GetTotalElfCount());
  
  return true;
end

function UIElf.GetTotalElfCount()
  local count = 0;
  for k, v in pairs(elfDatas) do
    if BitFlag.Get(v.flag) then
      count = count + 1;
    end
  end
  
  return count;
end

function UIElf.UpdateUI()
  scrollContent_List:Refresh(table.Count(elfDatas));
end

function UIElf.UpdateExp(lv, exp, maxLv)
  text_ExpFullValue.text = "";
  text_ExpValue.text = "";
  
  if lv <= 0 then
    slider_Exp.value = 0;
    return;
  end
  
  local expData = elfExpDatas[lv];
  
  if expData == nil then
    slider_Exp.value = 0;
    return;
  end
  
  if maxLv ~= nil and lv >= maxLv then
    text_ExpValue.text = string.Get(40475);
    text_ExpFullValue.text = "100%";
    slider_Exp.value = 1;
  else
    local expValue = exp / expData.exp;
    text_ExpValue.text = string.Concat(exp, "/", expData.exp);
    text_ExpFullValue.text = string.Concat(math.round(expValue * 100), "%");
    slider_Exp.value = expValue;
  end
  
  text_Lv.text = string.Concat("Lv: ", lv);
end

function UIElf.UpdateSpecContent(attr, value, index, color, openString)
  if attr > 0 and value > 0 then
    text_SpecContent[index].text = string.GetColorText(string.Concat(ItemData.GetAttrText(attr), " + ", value, openString), color);
  else
    text_SpecContent[index].text = "";
  end
end

function UIElf.OnClick_Close()
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
---  --1--------------------------------------------------------------
  --  if LuaHelper.CheckDefine("DemoCode") then
  --    local code = DemoCode.GetBitxor(20);
  --    code = code * 10;
  --  end
  --  ---2--------------------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
---  --1--------------------------------------------------------------
  --  if LuaHelper.CheckDefine("DemoCode") then
  --    local code = DemoCode.GetBitxor(20);
  --    code = code * 10;
  --  end
  --  ---2--------------------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  currentElfNo = 0;
  UI.Close(UIElf);

  return true;
end

function UIElf.ClearAttText()
  text_BaseContent.text = "";
  for i = 1, 3 do
    text_SpecContent[i].text = "";
  end
  
  this.UpdateExp(0, 0);
  
  text_Name.text = "";
  text_Lv.text = "";
  text_Count.text = string.format(string.Get(21019), Role.player.data.godMission);
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
end

function UIElf.SendFeed(itemId, itemCount, needCount)
  if needCount <= 0 then
    ShowCenterMessage(string.Get(80124));
    return;
  end
  
  local maxCount = math.min( needCount, itemCount);
  ShowCountInput( string.Concat(string.Get(40314), itemDatas[itemId]:GetName(true, true)), 1, maxCount,
    function(text)
      if text == nil then return end
      local useCount = tonumber(text);
      if useCount == 0 then return end
  
      ShowCheckMessage(
        function(result)
          if result then
            --C:107-004<餵食> 小精靈no(2) +L(1) +<<bagIndex(2) +數量(2)>>
            local items = Item.GetAllItemIndex(itemId, useCount);
            local sendItems = {};
            sendBuffer:Clear();
            sendBuffer:WriteUInt16(currentElfNo);
  
            for i, v in pairs(items) do
              if v ~= 0 then
                sendItems[i] = v;
              end
            end
            
            sendBuffer:WriteByte(table.Count(sendItems));
            for k, v in pairs(sendItems) do
              sendBuffer:WriteUInt16(k);
              sendBuffer:WriteUInt16(v);
            end
            Network.Send(107, 4, sendBuffer);
          end
        end,
        string.format(string.Get(23753), string.Concat(itemDatas[itemId]:GetName(true, true), "* ", useCount)),
        Role.player
      );
    end
  );
end

function UIElf.RefreshElf()
  if UI.IsVisible(UIElf) then
    this.UpdateInfo(currentElfNo);
  end
end

function UIElf.CheckExpIsFull(elfNo)
  if elfSave[elfNo] == nil then return false end
  if elfDatas[elfNo] == nil then return false end
  
  local currentLv = elfSave[elfNo].lv;
  local maxLv = elfDatas[elfNo].lv;
  if currentLv >= maxLv then
    return true;
  end
  
  return false;
end

function UIElf.OnClick_Feed()
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end
  
  if currentElfNo == orgExpGod then
    ShowCenterMessage(string.Get(23755))
    return;
  end
  
  if currentElfNo <= 0 then
    ShowCenterMessage(string.Get(23754))
    return;
  end

  if elfSave[currentElfNo] == nil then
    ShowCenterMessage(string.Get(23759));
    return;
  end
  
  if Role.player.data.godMission >= 65535 then
    ShowCenterMessage(string.Get(80124));
    return;
  end
  
  local currentLv = elfSave[currentElfNo].lv;
  local maxLv = elfDatas[currentElfNo].lv;
  if currentLv >= maxLv then
    ShowCenterMessage(string.Get(23756));
    return;
  end
  
  local needExp = 0;
  local currentNeed = elfExpDatas[currentLv].exp - elfSave[currentElfNo].exp;
  
  for k, v in pairs(elfExpDatas) do
    if k > currentLv and k < maxLv then
      needExp = needExp + v.exp;
    end
  end
  
  local needExp = needExp + currentNeed;
  local itemCount = 0;
  local skillLink = itemDatas[expGodId].skillLink;
  local needCount;
  
  itemCount = math.min( Item.GetItemCount(expGodId), math.ceil(needExp / skillLink));  --福神
  if itemCount > 0 then
    needCount = math.min(math.floor((maxExpGod - Role.player.data.godMission) / skillLink), 999);
    this.SendFeed(expGodId, itemCount, needCount);
    return;
  end
  
  skillLink = itemDatas[expBigGodId].skillLink;
  itemCount = math.min( Item.GetItemCount(expBigGodId), math.ceil(needExp / skillLink));  --大福神
  
  if itemCount > 0 then
    needCount = math.min(math.floor((maxExpGod - Role.player.data.godMission) / skillLink), 999);
    this.SendFeed(expBigGodId, itemCount, needCount);
    return;
  end
  
  skillLink = itemDatas[expExtraGodId].skillLink;
  itemCount = math.min( Item.GetItemCount(expExtraGodId), math.ceil(needExp / skillLink));  --真福神
  if itemCount > 0 then
    needCount = math.min(math.floor((maxExpGod - Role.player.data.godMission) / skillLink), 999);
    this.SendFeed(expExtraGodId, itemCount, needCount);
    return;
  end

  ShowCenterMessage(string.Get(23757));
end

function UIElf.OnClick_Team()
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end
  
  if fightElfNo == currentElfNo then return end
  
  if currentElfNo <= 0 then
    ShowCenterMessage(string.Get(23754));
    return;
  end
  
  if currentElfNo == orgExpGod then
    --C:107-002<編制出戰> +小精靈no(2)
    sendBuffer:Clear();
    sendBuffer:WriteUInt16(currentElfNo);
    Network.Send(107, 2, sendBuffer);
  else
    local elfData = elfDatas[currentElfNo];
    if elfData == nil then return end
  
    if not BitFlag.Get(elfData.flag) then
      ShowCenterMessage(string.Get(23759));
      return;
    end
  
    --C:107-002<編制出戰> +小精靈no(2)
    sendBuffer:Clear();
    sendBuffer:WriteUInt16(currentElfNo);
    Network.Send(107, 2, sendBuffer);
  end
end

function UIElf.OnClick_UnTeam()
  if currentElfNo <= 0 then return end
  
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end
  
  if currentElfNo == orgExpGod then
    ShowCenterMessage(string.Get(23760))
    return
  end
  
  --C:107-003<取消出戰> +小精靈no(2)
  sendBuffer:Clear();
  sendBuffer:WriteUInt16(currentElfNo);
  Network.Send(107, 3, sendBuffer);
end

function UIElf.OnClick_Elf(uiEvent)
  this.UpdateClickedElf(uiEvent.parameter);
end

function UIElf.UpdateClickedElf(index)
  currentElfNo = this.GetElfNo(index);
  
  this.UpdateInfo(index);
  
  for i, v in pairs(scrollItems_List) do
    v.selected.gameObject:SetActive(false);
  end
  
  if scrollItems_List[index - 1] ~= nil then
    scrollItems_List[index - 1].selected.gameObject:SetActive(true);
  end
end

function UIElf.GetElfNo(index)
  local result = orgExpGod;
  for k, v in pairs(elfDatas) do
    if index == v.no then
      result = v.no;
      break;
    end
  end
  
  return result;
end

function UIElf.UpdateCount()
  text_Count.text = string.format(string.Get(23746), Role.player.data.godMission);
end

function UIElf.UpdateInfo(index)
  local elfData = elfDatas[index];
  if elfData == nil then return end
  
  if elfData.baseExp > 100 then
    text_BaseContent.text = string.format(string.Get(23750), (elfData.baseExp - 100) / 100);
  elseif elfData.baseExp == 100 then
    text_BaseContent.text = string.format(string.Get(23750), 1);
  else
    text_BaseContent.text = string.format(string.Get(24362), (100 - elfData.baseExp) / 100);
  end
  
  local lv, exp = 0;
  local saveData = elfSave[elfData.no];
  local openString = "";
  if saveData ~= nil then
    lv =  saveData.lv;
    exp = saveData.exp;
    for i = 1, 3 do
      local attr = elfData.attr[i];
      local val = elfData.value[i];
      
      if lv >= elfData.openLv[i] then
        this.UpdateSpecContent(attr, val, i, Color.DarkGreen, openString);
      else
        openString = string.format(string.Get(24124), elfData.openLv[i])
        this.UpdateSpecContent(attr, val, i, Color.DarkGray, openString);
      end
    end
    
    this.UpdateExp(lv, exp, elfData.lv);
    text_Lv.text = string.Concat(string.Get(49070), saveData.lv);
  else
    for i = 1, 3 do
      openString = string.format(string.Get(24124), elfData.openLv[i])
      this.UpdateSpecContent(elfData.attr[i], elfData.value[i], i, Color.DarkGray, openString);
    end
    
    this.UpdateExp(0, 0);
    text_Lv.text = "";
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  end
  
  text_Name.text = string.Concat(string.Get(elfData.name));
  text_Count.text = string.format(string.Get(23746), Role.player.data.godMission);
  
  if fightElfNo == currentElfNo then
    gameObjec_UnTeam:SetActive(true);
    gameObject_Team:SetActive(false);
  else
    gameObjec_UnTeam:SetActive(false);
    gameObject_Team:SetActive(true);
  end
end

function UIElf.OnInitialize_ScrollContent_List(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_List[itemIndex] = {};
    scrollItems_List[itemIndex].event_BG = scrollItems[itemIndex]:GetComponent("UIEvent");
    scrollItems_List[itemIndex].event_BG:SetListener(EventTriggerType.PointerClick, this.OnClick_Elf);
    scrollItems_List[itemIndex].event_BG.parameter = itemIndex + 1;
    scrollItems_List[itemIndex].image_Elf = scrollItems[itemIndex]:Find("Image_Elf"):GetComponent("UIRawImage");
    scrollItems_List[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_List[itemIndex].used = scrollItems[itemIndex]:Find("Image_Used");
    scrollItems_List[itemIndex].selected = scrollItems[itemIndex]:Find("Image_Selected");
  end
end

function UIElf.OnItemChange_ScrollContent_List(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local elfData = elfDatas[index];

  if elfData == nil then return true end
  
  TextureManager.SetPng(ETextureUseType.None, string.Concat("elf", elfData.Id, "_2"), scrollItems_List[itemIndex].image_Elf);
  scrollItems_List[itemIndex].image_Elf.rectTransform.sizeDelta = Vector2.one * scrollItems_List[itemIndex].image_Elf.texture.width;
  scrollItems_List[itemIndex].image_Elf:ShiftUV(1, 4, 0.5);
  scrollItems_List[itemIndex].image_Elf.enabled = true;
  if BitFlag.Get(elfData.flag) or elfData.no == orgExpGod then
    scrollItems_List[itemIndex].image_Elf.color = Color.White;
  else
    scrollItems_List[itemIndex].image_Elf.color = Color.MountsGray;
  end
  scrollItems_List[itemIndex].used.gameObject:SetActive(fightElfNo == elfData.no);
  scrollItems_List[itemIndex].text_Name.text = string.Get(elfData.name);
  scrollItems_List[itemIndex].event_BG.parameter = index;

  return true;
end

--S:107-002<編制出戰> +小精靈no(2) +結果(1)
function UIElf.RecElfTeam(data)
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  local elfNo = data:ReadUInt16();
  local result = data:ReadByte();
  
  if result == 1 then
    fightElfNo = elfNo;
    ShowCenterMessage(string.Get(20189));
    this.UpdateUI();
    this.UpdateInfo(elfNo);
  end
end

--S:107-003<取消出戰> +小精靈no(2) +結果(1)
function UIElf.RecElfUnTeam(data)
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  local elfNo = data:ReadUInt16();
  local result = data:ReadByte();
  
  if result == 1 then
    fightElfNo = orgExpGod;
    ShowCenterMessage(string.Get(23752));
    this.UpdateUI();
    this.UpdateInfo(elfNo);
  end
end

--S:107-005 <查詢所有小精靈資料> +出戰的小精靈no(2) +餵食量(4)  +數量(1) <<+小精靈no(2) +lv(2) +Exp(4)>>
function UIElf.RecElfSave(data)
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  fightElfNo = data:ReadUInt16();
  feedCount = data:ReadInt32();
  local count = data:ReadByte();
  
  for i = 1, count do
    local no = data:ReadUInt16();
    elfSave[no] = {};
    elfSave[no].lv = data:ReadUInt16();
    elfSave[no].exp = data:ReadInt32();
  end
  
  if UI.IsVisible(UIElf) then
    if fightElfNo ~= nil and fightElfNo > 0 then
      this.UpdateClickedElf(fightElfNo);
    end

    this.UpdateUI();
  end
end

--S:107-006 <更新小精靈資料> +小精靈no(2) +lv(2) +Exp(4)
function UIElf.UpdateElfSave(data)
  local elfNo = data:ReadUInt16();
  local lv = data:ReadUInt16();
  local exp = data:ReadInt32();
  
  if elfSave[elfNo] == nil then
    elfSave[elfNo] = {};
  end
  
  elfSave[elfNo].lv = lv;
  elfSave[elfNo].exp = exp;
  
  if UI.IsVisible(UIElf) then
    if elfNo == currentElfNo then
      local elfData = elfDatas[elfNo];
      if elfData ~= nil then
        this.UpdateExp(lv, exp, elfData.lv);
      else
        this.UpdateExp(lv, exp);
      end
    end
  end
end