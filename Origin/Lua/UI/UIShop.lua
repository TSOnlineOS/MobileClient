EUIShop = {
  Shop = 1, --
  KillPoint = 2, --殺敵點兌換
  Vender = 3,
}

UIShop = {}
local this = UIShop;

this.name = "UIShop";
this.uiController = nil;

local transform_FrameRect;

local scrollContent_Shop;
local scrollItems_Shop = {};

--var
local currentKind = EUIShop.Shop;

function UIShop.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;
  this.uiController.onClose = this.OnClose;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;

  text_Name = uiController:FindText("Text_Name");

  scrollContent_Shop = uiController:FindScrollContent("ScrollContent_Shop");
  scrollContent_Shop.onInitialize = this.OnInitialize_ScrollContent_Shop;
  scrollContent_Shop.onItemChange = this.OnItemChange_ScrollContent_Shop;
  scrollContent_Shop:Initialize(1);
end

function UIShop.OnOpen(kind, options)
  currentKind = kind;
  currentOptions = options;
  currentOption = 0;
  
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

function UIShop.OnVisible(visible)
  if visible then
    local uiName = "";
    if currentKind == EUIShop.Shop then
      uiName = string.Get(98022);
    elseif currentKind == EUIShop.KillPoint then
      uiName = string.Get(98022);
    elseif currentKind == EUIShop.Vender then
      uiName = string.Get(50306);
    end
  
    UIFrame.Active(transform_FrameRect, uiName, this.OnClick_Close);
    
    this.UpdateUI();
  end
end

function UIShop.OnClose()
  if UI.IsVisible(UIAlert) then
    UI.Close(UIAlert);
  end
  
  if currentKind == EUIShop.Shop then
    EventManager.SelectEvent(40);

  elseif currentKind == EUIShop.KillPoint then
    EventManager.SetConduct(true);
  elseif currentKind == EUIShop.Vender then
  end
  
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
end

function UIShop.UpdateUI(refresh)
  if refresh then
    scrollContent_Shop:Refresh();
  else
    scrollContent_Shop:Reset(table.maxn(currentOptions));
  end
end

function UIShop.OnClick_Close()
  UI.Close(UIShop);

  return true;
end

function UIShop.OnClick_Submit(value)
  if value == nil then return end
  if tonumber(value) == 0 then return end
  
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------

  if currentKind == EUIShop.Shop then
    if currentOption == 0 then return end

    --C:027-001 <向NPC買東西> +索引(1) +數量(4)
    sendBuffer:Clear();
    sendBuffer:WriteByte(currentOption - 1);
    sendBuffer:WriteInt32(tonumber(value));
    Network.Send(27, 1, sendBuffer);

  elseif currentKind == EUIShop.KillPoint then
    if currentOption == 0 then return end

    local itemId = string.match(currentOptions[currentOption], "(%d+) (.+)");

    itemId = tonumber(itemId);

    if itemDatas[itemId] == nil then return end

    if Battle.accumulateKillPoint < itemDatas[itemId].giftDot then
      ShowCenterMessage(string.Get(71070), 1.2);
      return;
    end

    if Item.ThingFindEmpty() == 0 then
      ShowCenterMessage(string.Get(71071), 1.2);
      return;
    end

    --C:063-001 <殺敵點兌換> +物品ID(2)
    sendBuffer:Clear();
    sendBuffer:WriteUInt16(itemId);
    Network.Send(63, 1, sendBuffer);

  elseif currentKind == EUIShop.Vender then
    if currentOption == 0 then return end

    local itemSave = Item.GetBagItem(EThings.Vender, currentOption);

    --C:023-033 <購買擺攤> +玩家ID(8) +商品索引(1) +購買數量(1)
    sendBuffer:Clear()
    sendBuffer:WriteInt64(itemSave.userId);
    sendBuffer:WriteByte(itemSave.bagIndex);
    sendBuffer:WriteByte(tonumber(value));
    Network.Send(23, 33, sendBuffer);
  end
end

function UIShop.OnClick_Shop(uiEvent)
  currentOption = uiEvent.parameter;
  
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------

  if currentOption == 0 then return end

  if currentKind == EUIShop.Shop then
    local itemId, effectString = string.match(currentOptions[currentOption], "(%d+) (.+)");

    itemId = tonumber(itemId);

    ShowStoreInput(itemId, Item.MaxThingGridQuant, ECurrency.Money, -itemDatas[itemId].price, this.OnClick_Submit);

  elseif currentKind == EUIShop.KillPoint then
    local itemId, effectString = string.match(currentOptions[currentOption], "(%d+) (.+)");

    itemId = tonumber(itemId);

    ShowStoreInput(itemId, Item.MaxThingGridQuant, ECurrency.GiftDot, -itemDatas[itemId].giftDot, this.OnClick_Submit);

  elseif currentKind == EUIShop.Vender then
    local itemSave = Item.GetBagItem(EThings.Vender, currentOption);

    ShowStoreInput(itemSave.Id, ECurrency.Money, itemSave.quant, -itemSave.price, this.OnClick_Submit);
  end
end

function UIShop.OnInitialize_ScrollContent_Shop(scrollItems)
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Shop[itemIndex] = {};

    scrollItems_Shop[itemIndex] = {};
    scrollItems_Shop[itemIndex].gameObject = scrollItems[itemIndex].gameObject;
    scrollItems_Shop[itemIndex].event_BG = scrollItems[itemIndex]:GetComponent("UIEvent");
    scrollItems_Shop[itemIndex].event_BG:SetListener(EventTriggerType.PointerClick, this.OnClick_Shop);

    scrollItems_Shop[itemIndex].item = UIItemController.New(scrollItems[itemIndex]:Find("Image_Item"));
    scrollItems_Shop[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_Shop[itemIndex].text_Description = scrollItems[itemIndex]:Find("Text_Description"):GetComponent("Text");
    scrollItems_Shop[itemIndex].text_Price = scrollItems[itemIndex]:Find("Text_Price"):GetComponent("Text");
  end
end

function UIShop.OnItemChange_ScrollContent_Shop(dataIndex, itemIndex)
  if currentOptions[dataIndex + 1] == nil then return false end

  local option = currentOptions[dataIndex + 1];

  if option ~= nil then
    scrollItems_Shop[itemIndex].gameObject:SetActive(true);
    scrollItems_Shop[itemIndex].event_BG.parameter = dataIndex + 1;
  
    local itemId, effectString = string.match(option, "(%d+) (.+)");
  
    itemId = tonumber(itemId);
  
    if itemDatas[itemId] ~= nil then
      scrollItems_Shop[itemIndex].item:SetItem(itemId);
      scrollItems_Shop[itemIndex].text_Name.text = itemDatas[itemId]:GetName(true);
  
      if currentKind == EUIShop.Shop then
        scrollItems_Shop[itemIndex].text_Price.text = itemDatas[itemId].price;
      elseif currentKind == EUIShop.KillPoint then
        scrollItems_Shop[itemIndex].text_Price.text = itemDatas[itemId].giftDot;
      elseif currentKind == EUIShop.Vender then
        local item = Item.GetBagItem(EThings.Vender, dataIndex + 1);
        if item ~= nil then
          scrollItems_Shop[itemIndex].text_Price.text = item.price;
        else
          scrollItems_Shop[itemIndex].text_Price.text = itemDatas[itemId].price;
        end  
      else
        scrollItems_Shop[itemIndex].text_Price.text = "";
      end
    else
      scrollItems_Shop[itemIndex].item:SetItem(0);
      
      scrollItems_Shop[itemIndex].text_Name.text = "";
      scrollItems_Shop[itemIndex].text_Price.text = "";
    end
  
    scrollItems_Shop[itemIndex].text_Description.text = effectString;
  else
    scrollItems_Shop[itemIndex].gameObject:SetActive(false);
  end
  
  return true;
end