
UIAuctionSell = {}
local this = UIAuctionSell;

this.name = "UIAuctionSell";
this.uiController = nil;

--ui
local uiItem;
local text_ItemName;
local text_ItemDescription;

local uiCareer;
local text_NpcName;
local text_NpcLv;

local text_Count;
local text_SinglePrice;
local text_TotalPrice;
local text_Current;

local image_Count;
local image_TotalPrice;

--var
local currentKind = EAuctionProduct.None;
local currentIndex = 0;
local currentEdit = nil;
local currentCount = 1;
local currentPrice = 10;
local currentValue = 0;
local edited = false;

local maxCount = 0;
local maxPrice = 999999999;

function UIAuctionSell.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;

  local tempEvent;

  uiItem = UIItemController.New(uiController:FindGameObject("Image_ItemBG").transform);
  text_ItemName = uiController:FindText("Text_ItemName");
  text_ItemDescription = uiController:FindText("Text_ItemDescription");

  uiCareer = UICareerController.New(uiController:FindGameObject("Career"));
  text_NpcName = uiController:FindText("Text_NpcName");
  text_NpcLv = uiController:FindText("Text_NpcLv");

  text_Count = uiController:FindText("Text_Count");
  text_SinglePrice = uiController:FindText("Text_SinglePrice");
  text_TotalPrice = uiController:FindText("Text_TotalPrice");
  text_Current = uiController:FindText("Text_Current");

  tempEvent = uiController:FindEvent("Image_Count");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_EditCount);
  image_Count = tempEvent.transform:GetComponent("Image");

  tempEvent = uiController:FindEvent("Image_TotalPrice");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_EditPrice);
  image_TotalPrice = tempEvent.transform:GetComponent("Image");

  tempEvent = uiController:FindEvent("Image_Dec");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Dec);

  tempEvent = uiController:FindEvent("Image_Add");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Add);

  tempEvent = uiController:FindEvent("Image_Cancel");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Cancel);

  tempEvent = uiController:FindEvent("Image_Submit");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Submit);

  tempEvent = uiController:FindEvent("Image_Max");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Max);

  tempEvent = uiController:FindEvent("Image_Backspace");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Backspace);

  for i = 0, 9 do
    tempEvent = uiController:FindEvent(string.Concat("Image_Key (", i, ")"));
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Keyboard);
    tempEvent.parameter = i;
  end
end

function UIAuctionSell.OnOpen(kind, index)
  maxCount = 1;

  currentKind = kind;
  currentIndex = index;
  currentCount = 1;
  currentPrice = 10;

  if kind == EAuctionProduct.Item then
    local itemSave = Item.GetBagItem(EThings.Bag, index);
    if itemSave == nil then return false end
    local itemData = itemDatas[itemSave.Id];
    if itemData == nil then return false end

    uiItem.transform.parent.gameObject:SetActive(true);
    uiCareer.transform.parent.gameObject:SetActive(false);

    uiItem:SetItem(itemSave.Id, itemSave.quant);
    text_ItemName.text = itemData:GetName(true, false);
    text_ItemDescription.text = itemData.description;

    if not Item.IsTypeOfEquips(itemData.fitType) then
      maxCount = itemSave.quant;
      this.OnClick_EditCount();
    else
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
      this.OnClick_EditPrice();
    end

  elseif kind == EAuctionProduct.Npc then
    local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, index);
    if followNpc == nil then return false end
    local npcData = npcDatas[followNpc.npcId];
    if npcData == nil then return false end

    uiItem.transform.parent.gameObject:SetActive(false);
    uiCareer.transform.parent.gameObject:SetActive(true);

    uiCareer:SetCareer(npcData.turn, npcData.element, ECareer.None, true);
    text_NpcName.text = npcData.name;
    text_NpcLv.text = followNpc:GetAttribute(EAttribute.Lv);

    this.OnClick_EditPrice();
  end

  return true;
end

function UIAuctionSell.UpdateUI()
  if currentEdit == text_Count then
    image_Count.sprite = UI.GetSprite("bod037");
    image_TotalPrice.sprite = UI.GetSprite("bod034");

    currentValue = math.clamp(currentValue, 0, maxCount);
    currentCount = math.clamp(currentValue, 1, maxCount);
  else
    image_Count.sprite = UI.GetSprite("bod034");
    image_TotalPrice.sprite = UI.GetSprite("bod037");

    currentValue = math.clamp(currentValue, 0, maxPrice);
    currentPrice = math.clamp(currentValue, 10, maxPrice);
  end

  text_Count.text = currentCount;
  text_SinglePrice.text = string.format("%0.2f", currentPrice / currentCount);
  text_TotalPrice.text = currentPrice;

  if currentValue == 0 then
    text_Current.text = "";
  else
    text_Current.text = currentValue;
  end
end

function UIAuctionSell.OnClick_EditCount()
  if currentKind == EAuctionProduct.Npc then return end
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
  currentEdit = text_Count;
  currentValue = currentCount;

  edited = false;
  this.UpdateUI();
end

function UIAuctionSell.OnClick_EditPrice()
  currentEdit = text_TotalPrice;
  currentValue = currentPrice;

  edited = false;
  this.UpdateUI();
end

function UIAuctionSell.OnClick_Dec()
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
  currentValue = currentValue - 1;

  edited = true;
  this.UpdateUI();
end

function UIAuctionSell.OnClick_Add()
  currentValue = currentValue + 1;

  edited = true;
  this.UpdateUI();
end

function UIAuctionSell.OnClick_Max()
  if currentEdit == text_Count then
    currentValue = maxCount;
  else
    currentValue = maxPrice;
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

  edited = false;
  this.UpdateUI();
end

function UIAuctionSell.OnClick_Backspace()
  currentValue = math.floor(currentValue / 10);

  edited = true;
  this.UpdateUI();
end

function UIAuctionSell.OnClick_Keyboard(uiEvent)
  if not edited then
    currentValue = uiEvent.parameter;
  else
    currentValue = currentValue * 10 + uiEvent.parameter;
  end

  edited = true;
  this.UpdateUI();
end

function UIAuctionSell.OnClick_Cancel()
  UI.Close(UIAuctionSell);
end

function UIAuctionSell.OnClick_Submit()
  --C:096-001 <上架商品> +商品種類(1)
  --  商品種類 1:物品 +背包索引(2) +數量(2) +價格(4)
  --  商品種類 2:武將 +武將索引(1) +價格(4)
  if currentKind == EAuctionProduct.Item then
    sendBuffer:Clear();
    sendBuffer:WriteByte(EAuctionProduct.Item);
    sendBuffer:WriteUInt16(currentIndex);
    sendBuffer:WriteUInt16(currentCount);
    sendBuffer:WriteUInt32(currentPrice);
    Network.Send(96, 1, sendBuffer);

  elseif currentKind == EAuctionProduct.Npc then
    sendBuffer:Clear();
    sendBuffer:WriteByte(EAuctionProduct.Npc);
    sendBuffer:WriteByte(currentIndex);
    sendBuffer:WriteUInt32(currentPrice);
    Network.Send(96, 1, sendBuffer);
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

  --Test Code
  ShowCenterMessage("Test Sell OK !!");
  UI.Close(UIAuctionSell);
  --]]Test Code
end