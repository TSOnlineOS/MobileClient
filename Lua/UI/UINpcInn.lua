
UINpcInn = {}
local this = UINpcInn;

this.name = "UINpcInn";
this.uiController = nil;

local transform_FrameRect;

local text_NpcSpace;

local scrollContent_Npc;
local scrollItems_Npc = {};

local followNpcs = {};

local innNpcs = {};

local addSpaceData = {};

local allFull = false;
local exchangeInnIndex = 0;
local exchangeFollowIndex = 0;

function UINpcInn.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;
  this.uiController.onClose = this.OnClose;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;

  local tempEvent;

  tempEvent = uiController:FindEvent("Image_AddNpcSpace");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_AddSpace);

  text_NpcSpace = uiController:FindText("Text_NpcSpace");

  scrollContent_Npc = uiController:FindScrollContent("ScrollContent_Npc");
  scrollContent_Npc.onInitialize = this.OnInitialize_ScrollContent_Npc;
  scrollContent_Npc.onItemChange = this.OnItemChange_ScrollContent_Npc
  scrollContent_Npc:Initialize(1);

  tempObject = uiController:FindGameObject("Image_FollowBG");
  for i = 1, Role.maxFollowNpc do
    local child = tempObject.transform:Find(string.Concat("Image_FollowNpc (", i, ")"));

    followNpcs[i] = {};
    followNpcs[i].text_Name = child:Find("Text_Name"):GetComponent("Text");
    followNpcs[i].text_Hp = child:Find("Text_Hp"):GetComponent("Text");
    followNpcs[i].text_Lv = child:Find("Text_Lv"):GetComponent("Text");
    followNpcs[i].uiCareer = UICareerController.New(child:Find("GameObject_Career"));
    followNpcs[i].image_State = followNpcs[i].text_Lv.transform:Find("Image_State"):GetComponent("Image");
    followNpcs[i].image_Empty = child:Find("Image_Empty"):GetComponent("Image");

    followNpcs[i].image_Save = child:Find("Image_Save"):GetComponent("Image");
    followNpcs[i].text_Save = followNpcs[i].image_Save.transform:Find("Text_"):GetComponent("Text");

    tempEvent = child:Find("Image_Save"):GetComponent("UIEvent");
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Save);
    tempEvent.parameter = i;
  end
end

function UINpcInn.OnOpen(kind)
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  return true;
end

function UINpcInn.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(10074), this.OnClick_Close);

    this.UpdateUI(true);
  end
end

function UINpcInn.OnClose()
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  EventManager.SetConduct(true);

  --C:031-010 <關閉隨身客讚棧>
  Network.Send(31, 10);
end

function UINpcInn.UpdateUI(reset)
  table.Clear(innNpcs);
  for i = 1, Inn.maxSpace do
    if Inn.npcs[i] ~= nil then
      table.insert(innNpcs, i);
    end
  end

  allFull = table.Count(innNpcs) >= Inn.currentSpace and table.Count(Role.GetFollowNpcs(Role.playerId)) >= Role.maxFollowNpc;
  exchangeInnIndex = 0;
  exchangeFollowIndex = 0;

  this.UpdateFollowNpc();

  if reset == true then
    scrollContent_Npc:Reset(Inn.maxSpace);
  else
    scrollContent_Npc:Refresh(Inn.maxSpace);
  end

  text_NpcSpace.text = string.Concat(table.Count(innNpcs), "/", tostring(Inn.currentSpace));
end

function UINpcInn.UpdateFollowNpc()
  for i = 1, Role.maxFollowNpc do
    local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, i);

    if followNpc ~= nil then
      if followNpc.data.canGrow == 0 then
        followNpcs[i].text_Name.text = string.GetColorText(followNpc.name, Color.Orange);
        followNpcs[i].image_Save.gameObject:SetActive(false);
      elseif followNpc.data.canGrow == 2 then
        followNpcs[i].text_Name.text = string.GetColorText(followNpc.name, Color.MissionNPC);
        followNpcs[i].image_Save.gameObject:SetActive(false);
      else
        followNpcs[i].text_Name.text = followNpc.name;
        followNpcs[i].image_Save.gameObject:SetActive(true);

        if allFull then
          if i == exchangeFollowIndex then
            followNpcs[i].image_Save.sprite = UI.GetSprite("but167D");
          else
            followNpcs[i].image_Save.sprite = UI.GetSprite("but064D");
          end

          followNpcs[i].text_Save.text = string.Get(21669);
        else
          followNpcs[i].image_Save.sprite = UI.GetSprite("but064D");
          followNpcs[i].text_Save.text = string.Get(30023);
        end
      end

      followNpcs[i].text_Hp.text = followNpc:GetAttribute(EAttribute.Hp);
      followNpcs[i].text_Lv.text = followNpc:GetAttribute(EAttribute.Lv);
      followNpcs[i].uiCareer:SetCareer(followNpc:GetAttribute(EAttribute.Turn), followNpc:GetAttribute(EAttribute.Element), followNpc:GetAttribute(EAttribute.Career), true);
      followNpcs[i].image_State.gameObject:SetActive(followNpc == Role.fightNpc);
      followNpcs[i].image_Empty.enabled = false;
    else
      followNpcs[i].text_Name.text = "";
      followNpcs[i].text_Hp.text = "";
      followNpcs[i].text_Lv.text = "";
      followNpcs[i].uiCareer:SetCareer();
      followNpcs[i].image_State.gameObject:SetActive(false);
      followNpcs[i].image_Save.gameObject:SetActive(false);
      followNpcs[i].image_Empty.enabled = true;
    end
  end
end

function UINpcInn.OnClick_Close()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  UI.Close(UINpcInn);

  return true;
end

function UINpcInn.OnClick_AddSpace()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  UISell.Launch(2);
end

function UINpcInn.OnClick_Take(uiEvent)
  local innIndex = uiEvent.parameter;
  if Inn.npcs[innIndex].status == ENpcInnStatus.Dispatch then return end

  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end

  if allFull then
    if exchangeFollowIndex ~= 0 then
      --C:031-004 <客棧交換武將> +客棧索引(1) +身上索引(1)
      sendBuffer:Clear();
      sendBuffer:WriteByte(innIndex);
      sendBuffer:WriteByte(exchangeFollowIndex);
      Network.Send(31, 4, sendBuffer);
    else
      if exchangeInnIndex == innIndex then
        exchangeInnIndex = 0;
      else
        exchangeInnIndex = innIndex;
      end

      scrollContent_Npc:Refresh(Inn.maxSpace);
    end
  else
    local isFull = true;
    for i = 1, Role.maxFollowNpc do
      if Role.GetRole(EHuman.FollowNpc, Role.playerId, i) == nil then
        isFull = false;
        break;
      end
    end
  
    if isFull then
      ShowCenterMessage(string.Get(71184));
      return;
    end

    --C:031-002 <客棧領武將> +客棧索引(1)
    sendBuffer:Clear();
    sendBuffer:WriteByte(innIndex);
    Network.Send(31, 2, sendBuffer);
  end
end

function UINpcInn.OnClick_Save(uiEvent)
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  local followIndex = uiEvent.parameter;
  local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, followIndex);
  if followNpc == nil then return end

  if Contains(followNpc.data.canGrow, 0, 2) then
    ShowCenterMessage(string.Get(21760));
    return;
  end

  if followNpc.data.isRetire then
    ShowCenterMessage(string.Get(71314));
    return;
  end

  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end

  if followNpc.npcId == Role.rebornNpcId then
    ShowCenterMessage(string.Get(71291));
    return;
  end
  
  if allFull then
    if exchangeInnIndex ~= 0 then
      --C:031-004 <客棧交換武將> +客棧索引(1) +身上索引(1)
      sendBuffer:Clear();
      sendBuffer:WriteByte(exchangeInnIndex);
      sendBuffer:WriteByte(followIndex);
      Network.Send(31, 4, sendBuffer);
    else
      if exchangeFollowIndex == followIndex then
        exchangeFollowIndex = 0;
      else
        exchangeFollowIndex = followIndex;
      end

      this.UpdateFollowNpc();
    end
  else
    if table.Count(innNpcs) >= Inn.currentSpace then
      ShowCenterMessage(string.Get(71276));
      return;
    end
  
    --C:031-003 <客棧存武將> +身上索引(1)
    sendBuffer:Clear();
    sendBuffer:WriteByte(followIndex);
    Network.Send(31, 3, sendBuffer);
  end
end

function UINpcInn.OnInitialize_ScrollContent_Npc(scrollItems)
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Npc[itemIndex] = {};
    scrollItems_Npc[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_Npc[itemIndex].text_Hp = scrollItems[itemIndex]:Find("Text_Hp"):GetComponent("Text");
    scrollItems_Npc[itemIndex].text_Lv = scrollItems[itemIndex]:Find("Text_Lv"):GetComponent("Text");
    scrollItems_Npc[itemIndex].uiCareer = UICareerController.New(scrollItems[itemIndex]:Find("GameObject_Career"));
    scrollItems_Npc[itemIndex].image_Lock = scrollItems[itemIndex]:Find("Image_Lock"):GetComponent("Image");
    scrollItems_Npc[itemIndex].image_Dispatch = scrollItems[itemIndex]:Find("Image_Dispatch"):GetComponent("Image");
    scrollItems_Npc[itemIndex].image_Empty = scrollItems[itemIndex]:Find("Image_Empty"):GetComponent("Image");

    local tempEvent = scrollItems[itemIndex]:Find("Image_Lock"):GetComponent("UIEvent");
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_AddSpace);

    scrollItems_Npc[itemIndex].image_Take = scrollItems[itemIndex]:Find("Image_Take"):GetComponent("Image");
    scrollItems_Npc[itemIndex].text_Take = scrollItems_Npc[itemIndex].image_Take.transform:Find("Text_"):GetComponent("Text");

    scrollItems_Npc[itemIndex].event_Take = scrollItems[itemIndex]:Find("Image_Take"):GetComponent("UIEvent");
    scrollItems_Npc[itemIndex].event_Take:SetListener(EventTriggerType.PointerClick, this.OnClick_Take);
  end
end

function UINpcInn.OnItemChange_ScrollContent_Npc(dataIndex, itemIndex)
  local innIndex = innNpcs[dataIndex + 1];

  if innIndex ~= nil and Inn.npcs[innIndex] ~= nil then
    scrollItems_Npc[itemIndex].text_Name.text = Inn.npcs[innIndex].name;
    scrollItems_Npc[itemIndex].text_Hp.text = Inn.npcs[innIndex].hp;
    scrollItems_Npc[itemIndex].text_Lv.text = Inn.npcs[innIndex].level;

    local npcData = npcDatas[Inn.npcs[innIndex].npcId];
    if npcData ~= nil then
      scrollItems_Npc[itemIndex].uiCareer:SetCareer(npcData.turn, npcData.element, ECareer.None, true);
      scrollItems_Npc[itemIndex].image_Empty.enabled = false;
    else
      scrollItems_Npc[itemIndex].uiCareer:SetCareer();
      scrollItems_Npc[itemIndex].image_Empty.enabled = true;
    end

    scrollItems_Npc[itemIndex].image_Dispatch.gameObject:SetActive(Inn.npcs[innIndex].status == ENpcInnStatus.Dispatch);

    if allFull then
      if innIndex == exchangeInnIndex then
        scrollItems_Npc[itemIndex].image_Take.sprite = UI.GetSprite("but167D");
      else
        scrollItems_Npc[itemIndex].image_Take.sprite = UI.GetSprite("but064D");
      end

      scrollItems_Npc[itemIndex].text_Take.text = string.Get(21669);
    else
      scrollItems_Npc[itemIndex].image_Take.sprite = UI.GetSprite("but064D");
      scrollItems_Npc[itemIndex].text_Take.text = string.Get(30022);
    end

    scrollItems_Npc[itemIndex].event_Take.gameObject:SetActive(Inn.npcs[innIndex].status ~= ENpcInnStatus.Dispatch);
    scrollItems_Npc[itemIndex].event_Take.parameter = innIndex;
  else
    scrollItems_Npc[itemIndex].text_Name.text = "";
    scrollItems_Npc[itemIndex].text_Hp.text = "";
    scrollItems_Npc[itemIndex].text_Lv.text = "";
    scrollItems_Npc[itemIndex].uiCareer:SetCareer();
    scrollItems_Npc[itemIndex].image_Empty.enabled = true;

    scrollItems_Npc[itemIndex].image_Dispatch.gameObject:SetActive(false);

    scrollItems_Npc[itemIndex].event_Take.gameObject:SetActive(false);
    scrollItems_Npc[itemIndex].event_Take.parameter = nil;
  end
  
  scrollItems_Npc[itemIndex].image_Lock.gameObject:SetActive(dataIndex + 1 > Inn.currentSpace);
  
  return true;
end