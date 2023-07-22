EUIMountsTag = {
  Status = 1,
  Level = 2,
  Attribute = 3,
  Equip = 4,
  Collection = 5,
}

UIMounts = {}
local this = UIMounts;

this.name = "UIMounts";
this.uiController = nil;

local transform_FrameRect;

local gameObject_Common;
local gameObject_Status;
local gameObject_Level;
local gameObject_Attribute;
local gameObject_Equip;
local gameObject_Collection;
local gameObject_LevelRequire;

--Common
local text_Level;
local text_Name;

local jmpDrawer_Mounts;
local item_Equips = {};

--Status
local text_Status;
local text_StatusFormula;

--Level
local text_CurrentLv;
local text_CurrentSpeed;
local text_UpLv;
local text_UpSpeed;
local text_LevelItem;
local text_LevelMoney;

local item_LevelItem;

--Attribute
local slider_Attriutes = {}

local text_AttributeUpAll;
local text_Attributes = {};
local text_AttributeLvs = {};
local image_AttributeArrows = {};

local item_AttributeItems = {};

local event_AttributeUpAll;

--Collection
local text_CollectionInfo;

local scrollContent_Collection;
local scrollItems_Collection = {};

local currentTag = EUIMountsTag.Status;

local collections = {};

local attributeUping = false;
local attributeUpKind = 0;
local attributeDefaultValue = 0;
local attributeUpValue = 0;
local attributeUpTime = 0;
local attributeUpDuration = 0.1;

local tagDatas = {};
local mainTag;

function UIMounts.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;
  this.uiController.onClose = this.OnClose;

  local tempEvent;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;

  gameObject_Common = uiController:FindGameObject("Common");
  gameObject_Status = uiController:FindGameObject("Status");
  gameObject_Level = uiController:FindGameObject("Level");
  gameObject_Attribute = uiController:FindGameObject("Attribute");
  gameObject_Equip = uiController:FindGameObject("Equip");
  gameObject_Collection = uiController:FindGameObject("Collection");
  gameObject_LevelRequire = uiController:FindGameObject("LevelRequire");
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------

  --Common
  text_Level = uiController:FindText("Text_Level");
  text_Name = uiController:FindText("Text_Name");

  jmpDrawer_Mounts = uiController:FindRawImage("RawImage_Mounts").gameObject:AddComponent(typeof(JmpDrawer));

  for i = 1, 5 do
    item_Equips[i] = UIItemController.New(uiController:FindGameObject(string.Concat("Image_EquipBG (", i, ")")).transform, this.OnClick_Equip, i);
  end

  --Status
  text_Status = uiController:FindText("Text_Status");
  text_StatusFormula = uiController:FindText("Text_StatusFormula");

  --Level
  text_CurrentLv = uiController:FindText("Text_CurrentLv");
  text_CurrentSpeed = uiController:FindText("Text_CurrentSpeed");
  text_UpLv = uiController:FindText("Text_UpLv");
  text_UpSpeed = uiController:FindText("Text_UpSpeed");
  text_LevelItem = uiController:FindText("Text_LevelItem");
  text_LevelMoney = uiController:FindText("Text_LevelMoney");

  item_LevelItem = UIItemController.New(uiController:FindGameObject("Image_LevelItemBG").transform);

  --Attribute
  text_AttributeUpAll = uiController:FindText("Text_AttributeUpAll");
  for i = 1, 5 do
    slider_Attriutes[i] = uiController:FindSlider(string.Concat("Slider_Attribute (", i, ")"));
    text_Attributes[i] = slider_Attriutes[i].transform:Find("Text_Attribute"):GetComponent("Text");
    image_AttributeArrows[i] = text_Attributes[i].transform:Find("Image_"):GetComponent("Image");
    text_AttributeLvs[i] = slider_Attriutes[i].transform:Find("Text_AttributeLv"):GetComponent("Text");
    item_AttributeItems[i] = UIItemController.New(uiController:FindGameObject(string.Concat("Image_AttributeItemBG (", i, ")")).transform, this.OnClick_AttributeUp, i);
  end

  --Collection
  text_CollectionInfo = uiController:FindText("Text_CollectionInfo");

  scrollContent_Collection = uiController:FindScrollContent("ScrollContent_Collection");
  scrollContent_Collection.onInitialize = this.OnInitialize_ScrollContent_Collection;
  scrollContent_Collection.onItemChange = this.OnItemChange_ScrollContent_Collection;
  scrollContent_Collection:Initialize(1);

  tempEvent = uiController:FindEvent("Image_LevelUp");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_LevelUp);

  event_AttributeUpAll = uiController:FindEvent("Image_AttributeUpAll");
  event_AttributeUpAll:SetListener(EventTriggerType.PointerClick, this.OnClick_AttributeUpAll);

  --tag
  tagDatas[1] = { string.Get(20262), nil };
  tagDatas[2] = { string.Get(20031), nil };
  tagDatas[3] = { string.Get(99652), nil };
  tagDatas[4] = { string.Get(20165), nil };
  tagDatas[5] = { string.Get(99653), nil };
end

function UIMounts.OnOpen()
  attributeUping = false;
  currentTag = EUIMountsTag.Status;
  
  table.Clear(collections);
  for k, v in pairs(mountsDatas) do
    table.insert(collections, k);
  end

  return true;
end

function UIMounts.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(99651), this.OnClick_Close, this.OnClick_Help, this.OnClick_Tag, tagDatas, currentTag, 1, this.CheckRedDot);

    this.UpdateUI(false);
  end
end

function UIMounts.OnClose()
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  attributeUping = false;

  if currentTag == EUIMountsTag.Equip then
    UI.Close(UIBag);
  end

  jmpDrawer_Mounts:Disable();
  for k, v in pairs(scrollItems_Collection) do
    for i = 1, 6 do
      v.jmpDrawer_Mounts:Disable();
    end
  end

  return true;
end

function UIMounts.Update()
  if attributeUpTime ~= 0 then
    this.UpdateAttribute(attributeUpKind, attributeDefaultValue + attributeUpValue * math.min((CGTimer.time - attributeUpTime) / attributeUpDuration, 1));

    if CGTimer.time - attributeUpTime > attributeUpDuration then
      attributeUpTime = 0;
      
      if attributeUping then
        if Role.player.war == EWar.None then
          for i = attributeUpKind, 5 do
            if Mounts.AttributeUp(i, false) then
              this.UpdateUI();
              return;
            end
          end
        else
          ShowCenterMessage(string.Get(80099));
        end

        attributeUping = false;
      end
      
      this.UpdateUI();
    end
  end
end


function UIMounts.CheckRedDot(mTag, subTag)
  if mainTag == mTag then
    return false;
  else
    mainTag = mTag;
  end
  
  if mainTag == EUIMountsTag.Level then
    return RedDot.Check(ERedDot.MountLevel);
  elseif mainTag == EUIMountsTag.Attribute then
    return RedDot.Check(ERedDot.MountAttribute);
  elseif mainTag == EUIMountsTag.Collection then
    return RedDot.Check(ERedDot.MountCollect);
  end

  return false;
end

function UIMounts.UpdateUI(refresh)
  gameObject_Common:SetActive(currentTag ~= EUIMountsTag.Collection);
  gameObject_Status:SetActive(currentTag == EUIMountsTag.Status);
  gameObject_Level:SetActive(currentTag == EUIMountsTag.Level);
  gameObject_Attribute:SetActive(currentTag == EUIMountsTag.Attribute);
  gameObject_Equip:SetActive(currentTag == EUIMountsTag.Equip);
  gameObject_Collection:SetActive(currentTag == EUIMountsTag.Collection);

  UI.Close(UIBag);

  local mountsLv = Mounts.level;
  local updateCurrent = false;
  local bonus = Mounts.collectionBonus;

  if currentTag == EUIMountsTag.Status then
    updateCurrent = true;

    local speed = 0;

    if mountsGrowDatas[mountsLv] ~= nil then
      speed = mountsGrowDatas[mountsLv].speed;
    end
    
    local attributeText = mountsLv;
    local attributeFormulaText = "";
    local attributeValue = 0;

    --Atk
    attributeValue = Mounts.GetAttribute(EAttribute.Atk) + Mounts.GetAttribute(EAttribute.EquipAtk);
    attributeText = string.Concat(attributeText, "\n", math.floor(attributeValue * bonus));
    attributeFormulaText = string.Concat(attributeFormulaText, "\n(", attributeValue, "*", bonus, ")");

    --Int
    attributeValue = Mounts.GetAttribute(EAttribute.Int) + Mounts.GetAttribute(EAttribute.EquipInt);
    attributeText = string.Concat(attributeText, "\n", math.floor(attributeValue * bonus));
    attributeFormulaText = string.Concat(attributeFormulaText, "\n(", attributeValue, "*", bonus, ")");

    --Def
    attributeValue = Mounts.GetAttribute(EAttribute.Def) + Mounts.GetAttribute(EAttribute.EquipDef);
    attributeText = string.Concat(attributeText, "\n", math.floor(attributeValue * bonus));
    attributeFormulaText = string.Concat(attributeFormulaText, "\n(", attributeValue, "*", bonus, ")");

    --Hp
    attributeValue = Mounts.GetAttribute(EAttribute.ExtraHp) + Mounts.GetAttribute(EAttribute.EquipMaxHp);
    attributeText = string.Concat(attributeText, "\n", math.floor(attributeValue * bonus));
    attributeFormulaText = string.Concat(attributeFormulaText, "\n(", attributeValue, "*", bonus, ")");

    --Sp
    attributeValue = Mounts.GetAttribute(EAttribute.ExtraSp) + Mounts.GetAttribute(EAttribute.EquipMaxSp);
    attributeText = string.Concat(attributeText, "\n", math.floor(attributeValue * bonus));
    attributeFormulaText = string.Concat(attributeFormulaText, "\n(", attributeValue, "*", bonus, ")");

    --Show
    text_Status.text = string.Concat(attributeText, "\n", speed, "\n", bonus);
    text_StatusFormula.text = string.Concat(attributeFormulaText, "\n\n");

  elseif currentTag == EUIMountsTag.Level then
    RedDot.Remove(ERedDot.MountLevel);
    updateCurrent = true;
    
    text_CurrentLv.text = mountsLv;
  
    text_LevelItem.text = "-- / --";
    text_LevelMoney.text = "--";
  
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --4-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      for i = 1, 3 do
        DemoCode.SetColorNum(i);
      end
      local area =  DemoCode.CalTriangleArea(1, 1);
      local currentOptio = area;
      local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --4-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      for i = 1, 3 do
        DemoCode.SetColorNum(i);
      end
      local area =  DemoCode.CalTriangleArea(1, 1);
      local currentOptio = area;
      local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------

    item_LevelItem:SetItem(0);

    if mountsGrowDatas[mountsLv] ~= nil then
      text_CurrentSpeed.text = string.Concat(string.Get(99654), " ", mountsGrowDatas[mountsLv].speed);

      if mountsGrowDatas[mountsLv].upMoney > 0 then
        text_LevelMoney.text = mountsGrowDatas[mountsLv].upMoney;
      end

      if itemDatas[mountsGrowDatas[mountsLv].upItemId] ~= nil and mountsGrowDatas[mountsLv].upItemCount > 0 then
        text_LevelItem.text = string.Concat(Item.GetItemCount(mountsGrowDatas[mountsLv].upItemId), " / ", mountsGrowDatas[mountsLv].upItemCount);

        item_LevelItem:SetItem(mountsGrowDatas[mountsLv].upItemId);
      end
    end

    if mountsGrowDatas[mountsLv + 1] ~= nil then
      text_UpLv.text = mountsLv + 1;
      text_UpSpeed.text = string.Concat(string.Get(99654), " ", mountsGrowDatas[mountsLv + 1].speed);

      gameObject_LevelRequire:SetActive(true);
    else
      text_UpLv.text = "MAX";
      text_UpSpeed.text = string.Get(20582);
      
      gameObject_LevelRequire:SetActive(false);
    end
    
  elseif currentTag == EUIMountsTag.Attribute then
    RedDot.Remove(ERedDot.MountAttribute);
    updateCurrent = true;
    
    for i = 1, 5 do
      this.UpdateAttribute(i, Mounts.GetAttributePoint(i));
    end

    if attributeUping then
      text_AttributeUpAll.text = string.Get(20706);
    else
      text_AttributeUpAll.text = string.Get(99660);
    end

    local canUp = false;
    for i = 1, 5 do
      if Mounts.AttributeUp(i, false, true) then
        canUp = true;
        break;
      end
    end

    event_AttributeUpAll.gameObject:SetActive(canUp);

  elseif currentTag == EUIMountsTag.Equip then
    updateCurrent = true;
    
    UI.Open(UIBag,
      function(bagIndex, itemId)
        UI.Open(UIItemInfo, EThings.Bag, bagIndex, 0,
          string.Get(20165),
          function(bagKind, bagIndex, followIndex)
            if not Define.MountsEquip then
              ShowCenterMessage(string.Get(20126));
              return;
            end
            
            if Role.player.war ~= EWar.None then
              ShowCenterMessage(string.Get(80099));
              return;
            end

            local itemSave = Item.GetBagItem(bagKind, bagIndex, followIndex);
            if itemSave ~= nil then
              Item.SaveEquipMessage(itemSave.Id);
            end
            
            --C:079-005 <座騎穿裝> +背包索引(2)
            sendBuffer:Clear();
            sendBuffer:WriteUInt16(bagIndex);
            Network.Send(79, 5, sendBuffer);
          end
        );
      end,
      Vector2.New(260, -25),
      false,
      nil,
      function(itemSave)
        return itemDatas[itemSave.Id].kind == EItemKind.MountsEquip;
      end,
      false
    );

  elseif currentTag == EUIMountsTag.Collection then
    RedDot.Remove(ERedDot.MountCollect);

    table.sort(collections,
      function(a, b)
        local aCollected = Mounts.HaveCollection(a);
        local bCollected = Mounts.HaveCollection(b);
        if aCollected and not bCollected then
          return true;
        elseif not aCollected and bCollected then
          return false;
        else
          return mountsDatas[a].flagId > mountsDatas[b].flagId;
        end
      end
    );

    if refresh ~= false then
      scrollContent_Collection:Refresh();
    else
      scrollContent_Collection:Reset(table.maxn(collections));
    end
    
    text_CollectionInfo.text = string.Concat(string.Get(99658), ":", Mounts.collectionCount, " ", string.Get(99655), ":", bonus);
  end

  if updateCurrent then
    if mountsDatas[Mounts.currentNpcId] ~= nil and npcDatas[Mounts.currentNpcId] ~= nil then
      local npcData = npcDatas[Mounts.currentNpcId];
      local offsetX, offsetY = npcData:GetOffset();

      jmpDrawer_Mounts:GenerateAndDraw(npcData:GetAtlasParams(ERolePose.Prepare + 1));
      jmpDrawer_Mounts.offsetY = -32 + offsetY;

      text_Level.text = mountsLv;
      text_Name.text = npcData.name;
    else
      text_Level.text = 1;
      text_Name.text = "";
    end
    
    for i = 1, 5 do
      local itemSave = Item.GetBagItem(EThings.Mounts, i);

      if itemSave ~= nil and itemDatas[itemSave.Id] ~= nil then
        item_Equips[i]:SetItem(itemSave.Id, 1, itemSave);
      else
        item_Equips[i]:SetItem(0);
      end
      
      if not Define.MountsEquip then
        item_Equips[i]:SetLock(true);
      end
    end
  end
end

function UIMounts.UpdateAttribute(kind, point)
  if slider_Attriutes[kind] == nil then return end

  local attributeLv, value, maxValue = Mounts.GetAttributeProgress(kind, point);

  slider_Attriutes[kind].maxValue = maxValue;
  slider_Attriutes[kind].value = value;
  
  if mountsGrowDatas[attributeLv] ~= nil then
    text_Attributes[kind].text = string.Concat("+", mountsGrowDatas[attributeLv].attributes[kind].addValue);
  else
    text_Attributes[kind].text = "+0";
  end

  if mountsGrowDatas[attributeLv + 1] ~= nil then
    if itemDatas[mountsGrowDatas[attributeLv + 1].attributes[kind].upItemId] ~= nil then
      item_AttributeItems[kind]:SetItem(mountsGrowDatas[attributeLv + 1].attributes[kind].upItemId, Item.GetItemCount(mountsGrowDatas[attributeLv + 1].attributes[kind].upItemId), nil, true);
    else
      item_AttributeItems[kind]:SetItem(0);
    end

    text_Attributes[kind].text = string.Concat(text_Attributes[kind].text, "       +", mountsGrowDatas[attributeLv + 1].attributes[kind].addValue);
    image_AttributeArrows[kind].gameObject:SetActive(true);
  else
    text_Attributes[kind].text = string.Concat(text_Attributes[kind].text, "(MAX)");
    image_AttributeArrows[kind].gameObject:SetActive(false);

    item_AttributeItems[kind]:SetItem(0);
  end

  --text_AttributeLvs[kind].text = string.Concat("Lv.", attributeLv);
  text_AttributeLvs[kind].text = string.Concat(string.Get(22447), attributeLv);
end

function UIMounts.OnAttributeAdd(kind, upValue, upLevel)
  if upValue > 4 then
    ShowCenterMessage(string.Get(80317), 1);
  else
    ShowCenterMessage(string.Get(20188), 1);
  end

  attributeUpKind = kind;
  attributeDefaultValue = Mounts.GetAttributePoint(kind) - upValue;
  attributeUpValue = upValue;
  attributeUpTime = CGTimer.time;
end

function UIMounts.OnClick_Close()
  UI.Close(UIMounts);

  return true;
end

function UIMounts.OnClick_Help(checkShow)
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  if checkShow ~= true then
    UI.Open(UITutorialHint, 32, this);
  end

  return true;
end

function UIMounts.OnClick_Tag(mainTag, subTag)
  if attributeUping then
    ShowCenterMessage(string.Get(20707));
    return false;
  end

  currentTag = mainTag;

  this.UpdateUI(false);

  return true;
end

function UIMounts.OnClick_LevelUp()
  if attributeUping then
    ShowCenterMessage(string.Get(20707));
    return;
  end

  Mounts.LevelUp();
end

function UIMounts.OnClick_AttributeUp(uiEvent)
  if attributeUping then
    ShowCenterMessage(string.Get(20707));
    return;
  end

  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end

  Mounts.AttributeUp(uiEvent.parameter, true);
end

function UIMounts.OnClick_AttributeUpAll()
  if attributeUping then
    attributeUping = false;
    this.UpdateUI();
    return;
  end
  
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end

  attributeUping = true;

  for i = 1, 5 do
    if Mounts.AttributeUp(i, false) then
      this.UpdateUI();
      return;
    end
  end

  attributeUping = false;
  this.UpdateUI();
end

function UIMounts.OnClick_Equip(uiEvent)
  if not Define.MountsEquip then
    ShowCenterMessage(string.Get(20126));
    return;
  end

  if attributeUping then
    ShowCenterMessage(string.Get(20707));
    return;
  end
  
  UI.Open(UIItemInfo, EThings.Mounts, uiEvent.parameter, 0,
    string.Get(98003),
    function(bagKind, bagIndex, followIndex)
      if Role.player.war ~= EWar.None then
        ShowCenterMessage(string.Get(80099));
        return;
      end

      local itemSave = Item.GetBagItem(bagKind, bagIndex, followIndex);
      if itemSave ~= nil then
        Item.SaveEquipMessage(itemSave.Id);
      end
      
      --C:079-006 <座騎脫裝> +裝備部位(1) +背包索引(2)
      sendBuffer:Clear()
      sendBuffer:WriteByte(bagIndex);
      sendBuffer:WriteUInt16(Item.ThingFindEmpty());
      Network.Send(79, 6, sendBuffer);
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --4-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        for i = 1, 3 do
          DemoCode.SetColorNum(i);
        end
        local area =  DemoCode.CalTriangleArea(1, 1);
        local currentOptio = area;
        local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --4-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        for i = 1, 3 do
          DemoCode.SetColorNum(i);
        end
        local area =  DemoCode.CalTriangleArea(1, 1);
        local currentOptio = area;
        local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  );
end

function UIMounts.OnClick_Switch(uiEvent)
  if attributeUping then
    ShowCenterMessage(string.Get(20707));
    return;
  end

  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end

  --C:079-007 <座騎切換> +NPCID(2)
  sendBuffer:Clear();
  sendBuffer:WriteUInt16(uiEvent.parameter);
  Network.Send(79, 7, sendBuffer);
end

function UIMounts.OnInitialize_ScrollContent_Collection(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Collection[itemIndex] = {};

    scrollItems_Collection[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_Collection[itemIndex].text_NameOutline = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Outline8");
    scrollItems_Collection[itemIndex].text_Source = scrollItems[itemIndex]:Find("Text_Source"):GetComponent("Text");
    scrollItems_Collection[itemIndex].jmpDrawer_Mounts = scrollItems[itemIndex]:Find("RawImage_Mounts"):GetComponent("RawImage").gameObject:AddComponent(typeof(JmpDrawer));
    scrollItems_Collection[itemIndex].bg = scrollItems[itemIndex]:GetComponent("Image");
    
    scrollItems_Collection[itemIndex].event_Use = scrollItems[itemIndex]:Find("Image_Use"):GetComponent("UIEvent");
    scrollItems_Collection[itemIndex].event_Use:SetListener(EventTriggerType.PointerClick, this.OnClick_Switch);
  end
end

function UIMounts.OnItemChange_ScrollContent_Collection(dataIndex, itemIndex)
  local npcId = collections[dataIndex + 1];
  local mountsData = mountsDatas[npcId];
  local npcData = npcDatas[npcId];

  if mountsData ~= nil and npcData ~= nil then
    local offsetX, offsetY = npcData:GetOffset();
    
    scrollItems_Collection[itemIndex].jmpDrawer_Mounts:GenerateAndDraw(npcData:GetAtlasParams(ERolePose.Prepare + 1));
    scrollItems_Collection[itemIndex].jmpDrawer_Mounts.offsetY = -32 + offsetY;

    scrollItems_Collection[itemIndex].text_Name.text = npcData.name;
    
    if mountsData.source == 80350 then
      scrollItems_Collection[itemIndex].text_Name.color = Color.White;
      scrollItems_Collection[itemIndex].text_NameOutline.enabled = true;
    else
      scrollItems_Collection[itemIndex].text_Name.color = Color.Black;
      scrollItems_Collection[itemIndex].text_NameOutline.enabled = false;
    end
    
    if Mounts.HaveCollection(npcId) then
      scrollItems_Collection[itemIndex].jmpDrawer_Mounts.color = Color.White;
      scrollItems_Collection[itemIndex].bg.color = Color.MountCollect;
      
      if Mounts.currentNpcId == npcId then
        scrollItems_Collection[itemIndex].text_Source.text = string.Get(99661);

        scrollItems_Collection[itemIndex].event_Use.gameObject:SetActive(false);
        scrollItems_Collection[itemIndex].event_Use.parameter = nil;
      else
        scrollItems_Collection[itemIndex].text_Source.text = "";

        scrollItems_Collection[itemIndex].event_Use.gameObject:SetActive(true);
        scrollItems_Collection[itemIndex].event_Use.parameter = npcId;
      end
    else
      scrollItems_Collection[itemIndex].jmpDrawer_Mounts.color = Color.MountsGray;
      scrollItems_Collection[itemIndex].bg.color = Color.MountNotCollect;
      
      scrollItems_Collection[itemIndex].text_Source.text = string.Concat(string.Get(98019), string.Get(mountsData.source));

      scrollItems_Collection[itemIndex].event_Use.gameObject:SetActive(false);
      scrollItems_Collection[itemIndex].event_Use.parameter = nil;
    end
  else
    scrollItems_Collection[itemIndex].jmpDrawer_Mounts:Disable();

    scrollItems_Collection[itemIndex].text_Name.text = "";
    scrollItems_Collection[itemIndex].text_Name.color = Color.Black;
    scrollItems_Collection[itemIndex].text_NameOutline.enabled = false;
    scrollItems_Collection[itemIndex].text_Source.text = "";

    scrollItems_Collection[itemIndex].event_Use.gameObject:SetActive(false);
    scrollItems_Collection[itemIndex].event_Use.parameter = nil;
  end

  return true;
end