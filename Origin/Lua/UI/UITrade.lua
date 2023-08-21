EUITrade = {
  Item = 1,
  Npc = 2,
}

UITrade = {}
local this = UITrade;

this.name = "UITrade";
this.uiController = nil;

local gameObject_TargetItem;
local gameObject_TargetNpc;
local gameObject_SelfNpc;

local image_Check;
local image_Trade;

local text_Check;
local text_Trade;
local text_TargetName;
local text_TargetGold;
local text_SelfName;
local inputField_SelfGold;

--Item
local item_TradeItems = {};

--Npc
local text_TargetNpcName;
local text_TargetNpcLv;
local text_TargetNpcHp;

local text_SelfNpcName;
local text_SelfNpcLv;
local text_SelfNpcHp;

local jmpDrawer_TargetNpc;
local item_TargetEquips = {};

local jmpDrawer_SelfNpc;
local item_SelfEquips = {};

local currentKind = EUITrade.Item;
local currentFollowIndex = 0;
local tradeRole = nil;
local checked = false;

function UITrade.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  
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
  local tempEvent;

  gameObject_TargetItem = uiController:FindGameObject("Image_TargetItemBG");
  gameObject_TargetNpc = uiController:FindGameObject("Image_TargetNpcBG");
  gameObject_SelfNpc = uiController:FindGameObject("Image_SelfNpcBG");

  image_Check = uiController:FindImage("Image_Check");
  image_Trade = uiController:FindImage("Image_Trade");

  text_Check = uiController:FindText("Text_Check");
  text_Trade = uiController:FindText("Text_Trade");
  text_TargetName = uiController:FindText("Text_TargetName");
  text_TargetGold = uiController:FindText("Text_TargetGold");
  text_SelfName = uiController:FindText("Text_SelfName");
  inputField_SelfGold = uiController:FindInputField("InputField_SelfGold");

  --Item
  for i = 1, Item.MaxThingGrid do
    item_TradeItems[i] = UIItemController.New(gameObject_TargetItem.transform:Find(string.Concat("Image_Item (", i, ")")), this.OnClick_Item, i);
  end

  --Npc
  text_TargetNpcName = uiController:FindText("Text_TargetNpcName");
  text_TargetNpcLv = uiController:FindText("Text_TargetNpcLv");
  text_TargetNpcHp = uiController:FindText("Text_TargetNpcHp");

  text_SelfNpcName = uiController:FindText("Text_SelfNpcName");
  text_SelfNpcLv = uiController:FindText("Text_SelfNpcLv");
  text_SelfNpcHp = uiController:FindText("Text_SelfNpcHp");

  jmpDrawer_TargetNpc = uiController:FindRawImage("RawImage_TargetNpc").gameObject:AddComponent(typeof(JmpDrawer));
  for i = 1, 5 do
    item_TargetEquips[i] = UIItemController.New(uiController:FindGameObject(string.Concat("Image_TargetEquipBG (", i, ")")).transform);
  end

  jmpDrawer_SelfNpc = uiController:FindRawImage("RawImage_SelfNpc").gameObject:AddComponent(typeof(JmpDrawer));
  for i = 1, 5 do
    item_SelfEquips[i] = UIItemController.New(uiController:FindGameObject(string.Concat("Image_SelfEquipBG (", i, ")")).transform);
  end

  tempEvent = uiController:FindEvent("Image_Close");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);

  tempEvent = uiController:FindEvent("Image_Check");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Check);

  tempEvent = uiController:FindEvent("Image_Trade");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Trade);

  tempEvent = uiController:FindEvent("Image_PrevNpc");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_SwitchNpc);
  tempEvent.parameter = -1;

  tempEvent = uiController:FindEvent("Image_NextNpc");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_SwitchNpc);
  tempEvent.parameter = 1;
end

function UITrade.OnOpen(kind, roleId)
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
  tradeRole = Role.players[roleId];

  if tradeRole == nil then return false end

  currentKind = kind;
  currentFollowIndex = 0;
  checked = false;

  if currentKind == EUITrade.Item then
    gameObject_TargetItem:SetActive(true);

    UI.Open(UIBag,
      function(selections)
      end,
      Vector2.New(102.5, 17),
      false,
      Item.MaxThingGrid,
      function(itemSave)
        if itemSave.isDeliver then return false end
        if itemDatas[itemSave.Id] == nil then return false end
        if bit.band(itemDatas[itemSave.Id].restrict, 2) == 2 and bit.band(itemSave.specialKind, 1) ~= 1 then return false end
        if (itemDatas[itemSave.Id].kind == 53 or bit.band(itemDatas[itemSave.Id].restrict2, 1) == 1) and Role.player.data.orgId ~= tradeRole.data.orgId then return false end
        
        return true;
      end
    );

    gameObject_TargetNpc:SetActive(false);
    gameObject_SelfNpc:SetActive(false);
  elseif currentKind == EUITrade.Npc then
    gameObject_TargetItem:SetActive(false);

    UI.Close(UIBag);

    gameObject_TargetNpc:SetActive(true);
    gameObject_SelfNpc:SetActive(true);
  end

  text_TargetName.text = tradeRole.name;
  text_SelfName.text = Role.player.name;

  this.UpdateCheck();
  this.UpdateTarget();
  this.UpdateSelf();
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------

  return true;
end

function UITrade.OnClose()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  jmpDrawer_TargetNpc:Disable();
  jmpDrawer_SelfNpc:Disable();

  if currentKind == EUITrade.Item then
    UI.Close(UIBag);

    --C:025-003 <交易物品確認> +結果(1)
    sendBuffer:Clear();
    sendBuffer:WriteByte(2);
    Network.Send(25, 3, sendBuffer);
  elseif currentKind == EUITrade.Npc then
    --C:025-012 <交易武將確認> +結果(1)
    sendBuffer:Clear();
    sendBuffer:WriteByte(2);
    Network.Send(25, 12, sendBuffer);
  end
end

function UITrade.UpdateCheck()
  if checked then
    inputField_SelfGold.interactable = false;

    LuaHelper.SetColor(image_Check, Color.Gray);
    LuaHelper.SetColor(text_Check, Color.Gray);
    LuaHelper.SetColor(image_Trade, Color.White);
    LuaHelper.SetColor(text_Trade, Color.White);
  else
    inputField_SelfGold.interactable = true;
    
    LuaHelper.SetColor(image_Check, Color.White);
    LuaHelper.SetColor(text_Check, Color.White);
    LuaHelper.SetColor(image_Trade, Color.Gray);
    LuaHelper.SetColor(text_Trade, Color.Gray);
  end

  if currentKind == EUITrade.Item then
    UIBag.SetInteractable(not checked);
  elseif currentKind == EUITrade.Npc then
  end
end

function UITrade.UpdateTarget(data)
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if currentKind == EUITrade.Item then
    if data ~= nil then
      --S:025-003 <交易物品確認> +金錢(4) <<+物品ID(2) +數量(1) +損壞度(1) +屬性(1) +屬性值(1) +抵抗(1) +成長值(4)>>
      text_TargetGold.text = data:ReadInt32();

      local index = 1;
      for i = 1, 25 do
        if data.length > 0 then
          local itemSave = ThingData.New(data);

          item_TradeItems[i]:SetItem(itemSave.Id, count, itemSave);
        else
          item_TradeItems[i]:SetItem(0);
        end
      end
    else
      for i = 1, 25 do
        item_TradeItems[i]:SetItem(0);
      end
    end
  elseif currentKind == EUITrade.Npc then
    if data ~= nil then
      --S:025-012 <交易武將確認> +金錢(4) +NPCID(2) +等級(1) +MaxHp(2) +Hp(2) +MaxSp(2) +Sp(2) +L(1) +名字(L) +忠誠度(1) +昇華丹(1) +sp丹(1) +hp丹(1) +裝備數量(1) <<+物品ID(2) +損壞度(1) +屬性(1) +屬性值(1) +抵抗(1) +成長值(4)>>
      text_TargetGold.text = data:ReadInt32();
      
      local npcId = data:ReadUInt16();

      local npcData = npcDatas[npcId];
      if npcData ~= nil then
        local level = data:ReadByte();
        local maxHp = data:ReadUInt16();
        local hp = data:ReadUInt16();
        local maxSp = data:ReadUInt16();
        local sp = data:ReadUInt16();
        local name = data:ReadString(data:ReadByte());
        local faith = data:ReadByte();
        local sublimeCount = data:ReadByte();
        local spPillCount = data:ReadByte();
        local hpPillCount = data:ReadByte();
        local count = data:ReadByte();
        local equips = {};
        for i = 1, count do
          local equip = ThingData.New(data);
          
          local fitType = 0;
          if itemDatas[equip.Id] ~= nil then
            fitType = itemDatas[equip.Id].fitType;
          end

          equips[fitType] = equip;
        end

        --Info
        text_TargetNpcName.text = name;
        text_TargetNpcLv.text = level;
        text_TargetNpcHp.text = string.Concat(hp, "/", maxHp);

        --Show
        local offsetX, offsetY = npcData:GetOffset();
        
        jmpDrawer_TargetNpc:GenerateAndDraw(npcData:GetAtlasParams(ERolePose.Prepare + 1));
        jmpDrawer_TargetNpc.offsetY = offsetY;

        --Equip
        for i = 1, 5 do
          if equips[i] ~= nil and itemDatas[equips[i].Id] ~= nil then
            item_TargetEquips[i]:SetItem(equips[i].Id);
          else
            item_TargetEquips[i]:SetItem(0);
          end
        end
      else
        text_TargetNpcName.text = "";
        text_TargetNpcLv.text = "";
        text_TargetNpcHp.text = "";

        jmpDrawer_TargetNpc:Disable();

        for i = 1, 5 do
          item_TargetEquips[i]:SetItem(0);
        end
      end
    else
      text_TargetGold.text = 0;

      text_TargetNpcName.text = "";
      text_TargetNpcLv.text = "";
      text_TargetNpcHp.text = "";

      jmpDrawer_TargetNpc:Disable();

      for i = 1, 5 do
        item_TargetEquips[i]:SetItem(0);
      end
    end
  end
end

function UITrade.SetTargetEquipYube(index, yube)
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
end

function UITrade.UpdateSelf()
  if currentKind == EUITrade.Item then
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
  elseif currentKind == EUITrade.Npc then
    inputField_SelfGold.text = 0;

    local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, currentFollowIndex);

    if followNpc ~= nil then
      --Info
      text_SelfNpcName.text = followNpc.name;
      text_SelfNpcLv.text = followNpc:GetAttribute(EAttribute.Lv);
      text_SelfNpcHp.text = string.Concat(followNpc:GetAttribute(EAttribute.Hp), "/", followNpc:GetAttribute(EAttribute.MaxHp));

      --Show
      local npcData = npcDatas[followNpc.npcId];
      local offsetX, offsetY = npcData:GetOffset();

      jmpDrawer_SelfNpc:GenerateAndDraw(npcData:GetAtlasParams(ERolePose.Prepare + 1));
      jmpDrawer_SelfNpc.offsetY = offsetY;

      --Equip
      for i = 1, 5 do
        local itemSave = Item.GetBagItem(EThings.Equip, i, followNpc.index);
        if itemSave ~= nil then
          item_SelfEquips[i]:SetItem(itemSave.Id);
        else
          item_SelfEquips[i]:SetItem(0);
        end
      end
    else
      text_SelfNpcName.text = "";
      text_SelfNpcLv.text = "";
      text_SelfNpcHp.text = "";

      jmpDrawer_SelfNpc:Disable();

      for i = 1, 5 do
        item_SelfEquips[i]:SetItem(0);
      end
    end
  end
end

function UITrade.OnClick_Close()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  UI.Close(UITrade);
end

function UITrade.OnClick_Check()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if checked then return end

  checked = true;

  this.UpdateCheck();

  if currentKind == EUITrade.Item then
    local selections = UIBag.GetSelect();

    --C:025-002 <交易物品上傳> +交易金額(4) <<+交易物品背包索引(2)>>
    sendBuffer:Clear();
    sendBuffer:WriteInt32(tonumber(inputField_SelfGold.text));

    for i = 1, Item.MaxThingGrid do
      if selections[i] then
        sendBuffer:WriteUInt16(i);
      end
    end

    Network.Send(25, 2, sendBuffer);
  elseif currentKind == EUITrade.Npc then
    --C:025-011 <交易武將上傳> +交易金額(4)+交易武將索引(1)
    sendBuffer:Clear();
    sendBuffer:WriteInt32(tonumber(inputField_SelfGold.text));
    sendBuffer:WriteByte(currentFollowIndex);
    Network.Send(25, 11, sendBuffer);
  end
end

function UITrade.OnClick_Trade()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if not checked then return end
  
  if currentKind == EUITrade.Item then
    --C:025-003 <交易物品確認> +結果(1)
    sendBuffer:Clear();
    sendBuffer:WriteByte(1);
    Network.Send(25, 3, sendBuffer);
  elseif currentKind == EUITrade.Npc then
    --C:025-012 <交易武將確認> +結果(1)
    sendBuffer:Clear();
    sendBuffer:WriteByte(1);
    Network.Send(25, 12, sendBuffer);
  end
end

function UITrade.OnClick_SwitchNpc(uiEvent)
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if checked then return end
  
  if uiEvent.parameter > 0 then
    if currentFollowIndex == Role.maxFollowNpc then return end
  end

  if uiEvent.parameter < 0 then
    if currentFollowIndex == 0 then return end
  end

  currentFollowIndex = currentFollowIndex + uiEvent.parameter;

  this.UpdateSelf();
end
