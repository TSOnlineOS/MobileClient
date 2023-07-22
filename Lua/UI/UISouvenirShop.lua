EUIGetGiftFrom = {
  Shop = 1,
  Bag = 2,
}

UISouvenirShop = {}
local this = UISouvenirShop;

this.name = "UISouvenirShop";
this.uiController = nil;

local transform_FrameRect;

local scrollContent_Store;
local scrollItems_Store = {};
local scrollContent_Bag;
local scrollItems_Bag = {};
local scrollContent_Quant;
local scrollItems_Quant = {};
local gameObject_GiftShop;
local gameObject_Bag;
local text_Gold;
local text_Point;
local scrollContent_Tag;
local scrollItems_Tag = {};

--var
local quantityIndex = 1;
local quantity;                         --選擇的數量，預設為1
local chosenGift;                       --選擇的禮物
local chosenGiftIndex;                  --選擇的禮物index
local giftFrom = EUIGetGiftFrom.Shop;
local playerId = nil;
local tagCount = 2;
local quantNum = {};

function UISouvenirShop.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;

  gameObject_GiftShop = uiController:FindGameObject("ScrollRect_Store");
  gameObject_Bag = uiController:FindGameObject("ScrollRect_Bag");

  text_Gold = uiController:FindText("Text_Gold (1)");
  text_Point = uiController:FindText("Text_Gold (3)");

  scrollContent_Bag = uiController:FindScrollContent("ScrollContent_Bag");
  scrollContent_Bag.onInitialize = this.OnInitialize_ScrollContent_Bag;
  scrollContent_Bag.onItemChange = this.OnItemChange_ScrollContent_Bag;
  scrollContent_Bag:Initialize(1);

  scrollContent_Store = uiController:FindScrollContent("ScrollContent_Store");
  scrollContent_Store.onInitialize = this.OnInitialize_ScrollContent_Store;
  scrollContent_Store.onItemChange = this.OnItemChange_ScrollContent_Store;
  scrollContent_Store:Initialize(1);

  scrollContent_Quant = uiController:FindScrollContent("ScrollContent_Quantity");
  scrollContent_Quant.onInitialize = this.OnInitialize_ScrollContent_Quant;
  scrollContent_Quant.onItemChange = this.OnItemChange_ScrollContent_Quant;
  scrollContent_Quant:Initialize(1);

  scrollContent_Tag = uiController:FindScrollContent("ScrollContent_Tag");
  scrollContent_Tag.onInitialize = this.OnInitialize_ScrollContent_Tag;
  scrollContent_Tag.onItemChange = this.OnItemChange_ScrollContent_Tag;
  scrollContent_Tag:Initialize(1);

  local tempEvent = uiController:FindEvent("Image_SendGift");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Send);

  quantNum[1] = 1;
  quantNum[2] = 10;
  quantNum[3] = 30;
  quantNum[4] = 50;
  quantNum[5] = 99;

end

function UISouvenirShop.OnOpen(roleId)
  if roleId == nil then return false end
  
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
  playerId = roleId;
  giftFrom = EUIGetGiftFrom.Shop;
  quantityIndex = 1;
  chosenGift = nil;
  SouvenirShop.SetSouvenirList();

  return true;
end

function UISouvenirShop.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(23370), this.OnClick_Close,nil);

    this.UpdateUI(true);
  end
end

function UISouvenirShop.OnClick_Close()
  UI.Close(UISouvenirShop);
end

function UISouvenirShop.OnInitialize_ScrollContent_Bag(scrollItems)
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
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Bag[itemIndex] = {};
    scrollItems_Bag[itemIndex] = UIItemController.New(scrollItems[itemIndex]);
    scrollItems_Bag[itemIndex].image_Chosen = scrollItems[itemIndex]:Find("Image_Chosen"):GetComponent("Image");
  end
end

function UISouvenirShop.OnItemChange_ScrollContent_Bag(dataIndex, itemIndex)
  local giftIndex = dataIndex + 1;
  local itemSave = SouvenirShop.giftsList[giftIndex];

  if itemSave ~= nil then
    scrollItems_Bag[itemIndex]:SetItem(itemSave.Id, itemSave.quant);
    scrollItems_Bag[itemIndex]:SetEvent(this.OnClick_Item, giftIndex);
    scrollItems_Bag[itemIndex]:SetRedDot(false);
  else
    return false;
  end

  return true;
end

function UISouvenirShop.OnInitialize_ScrollContent_Store(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Store[itemIndex] = {};
    scrollItems_Store[itemIndex].item = UIItemController.New(scrollItems[itemIndex]:Find("Image_BG"):Find("Image_Item"));
    scrollItems_Store[itemIndex].text_Name = scrollItems[itemIndex]:Find("Image_BG"):Find("Text_ItemName"):GetComponent("Text");
    scrollItems_Store[itemIndex].text_Price = scrollItems[itemIndex]:Find("Image_PriceBG"):Find("Text_price"):GetComponent("Text");
    scrollItems_Store[itemIndex].image_BG = scrollItems[itemIndex]:Find("Image_BG"):GetComponent("Image");
    scrollItems_Store[itemIndex].image_chip = scrollItems[itemIndex]:Find("Image_PriceBG"):Find("Image_Chip"):GetComponent("Image");
    scrollItems_Store[itemIndex].image_Named = scrollItems[itemIndex]:Find("Image_BG"):Find("Image_Named"):GetComponent("Image");
    scrollItems_Store[itemIndex].image_Broadcast = scrollItems[itemIndex]:Find("Image_BG"):Find("Image_Broadcast"):GetComponent("Image");
    scrollItems_Store[itemIndex].image_Chosen = scrollItems[itemIndex]:Find("Image_BG"):Find("Image_IsChosen"):GetComponent("Image");
    scrollItems_Store[itemIndex].event_Check = scrollItems[itemIndex]:Find("Image_BG"):Find("Image_Check"):GetComponent("UIEvent");
    scrollItems_Store[itemIndex].event_Check:SetListener(EventTriggerType.PointerClick, this.OnClick_Check);
    scrollItems_Store[itemIndex].event = scrollItems[itemIndex]:GetComponent("UIEvent");
    scrollItems_Store[itemIndex].event:SetListener(EventTriggerType.PointerClick, this.OnClick_Item);
  end
end

function UISouvenirShop.OnItemChange_ScrollContent_Store(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local itemSave = SouvenirShop.souvenirList[index];

  if itemSave == nil then
    return false;
  else
    scrollItems_Store[itemIndex].item:SetItem(itemSave.Id, 1, nil);
    scrollItems_Store[itemIndex].item:SetEvent(this.OnClick_Item, index);
    scrollItems_Store[itemIndex].text_Name.text = itemDatas[itemSave.Id]:GetName();
    scrollItems_Store[itemIndex].text_Price.text = itemSave.price;
    scrollItems_Store[itemIndex].image_BG.sprite = itemSave:GetQualityColor();
    scrollItems_Store[itemIndex].image_chip.sprite = itemSave:GetCurrencySprite();
    scrollItems_Store[itemIndex].image_Named.enabled = itemSave:CanNamed();
    scrollItems_Store[itemIndex].image_Broadcast.enabled = itemSave:CanBroadcast();
    scrollItems_Store[itemIndex].event.parameter = index;
    scrollItems_Store[itemIndex].event_Check.parameter = index;
  end

  return true;
end

function UISouvenirShop.OnInitialize_ScrollContent_Tag(scrollItems)
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
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Tag[itemIndex] = {};
    scrollItems_Tag[itemIndex].image_tag = {};
    scrollItems_Tag[itemIndex].text_tag = {};
    scrollItems_Tag[itemIndex].outline_tag = {};
    scrollItems_Tag[itemIndex].event = {};

    for i = 1, tagCount do
      scrollItems_Tag[itemIndex].image_tag[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Tag", i)):GetComponent("Image");
      scrollItems_Tag[itemIndex].text_tag[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Tag", i)):Find(string.Concat("Text_Tag", i)):GetComponent("Text");
      scrollItems_Tag[itemIndex].outline_tag[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Tag", i)):Find(string.Concat("Text_Tag", i)):GetComponent("Outline8");
      scrollItems_Tag[itemIndex].event[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Tag", i)):GetComponent("UIEvent");
      scrollItems_Tag[itemIndex].event[i]:SetListener(EventTriggerType.PointerClick, this.OnClick_Tag);
      scrollItems_Tag[itemIndex].event[i].parameter = i;
    end

  end
end

function UISouvenirShop.OnItemChange_ScrollContent_Tag(dataIndex, itemIndex)
  for i = 1, tagCount do
    if i == giftFrom then
      scrollItems_Tag[itemIndex].image_tag[i].color = Color.White;
      scrollItems_Tag[itemIndex].text_tag[i].color = Color.White;
      scrollItems_Tag[itemIndex].outline_tag[i].enabled = true;
    else
      scrollItems_Tag[itemIndex].image_tag[i].color = LuaHelper.GetColor(188, 188, 188, 80);
      scrollItems_Tag[itemIndex].text_tag[i].color = LuaHelper.GetColor(150, 150, 150, 255);
      scrollItems_Tag[itemIndex].outline_tag[i].enabled = false;
    end
  end

  return true;
end

function UISouvenirShop.OnInitialize_ScrollContent_Quant(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Quant[itemIndex] = {};
    scrollItems_Quant[itemIndex].image_Button = {};
    scrollItems_Quant[itemIndex].text_Int = {};
    scrollItems_Quant[itemIndex].event = {};

    for i = 1, 5 do
      scrollItems_Quant[itemIndex].image_Button[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Quantity", i)):GetComponent("Image");
      scrollItems_Quant[itemIndex].text_Int[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Quantity", i)):Find("Text_Int"):GetComponent("Text");
      scrollItems_Quant[itemIndex].event[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Quantity", i)):GetComponent("UIEvent");
    end
  end
end

function UISouvenirShop.OnItemChange_ScrollContent_Quant(dataIndex, itemIndex)
  for i = 1, 5 do
    scrollItems_Quant[itemIndex].text_Int[i].text = string.Concat("x", quantNum[i]);

    if i == quantityIndex then
      scrollItems_Quant[itemIndex].image_Button[i].sprite = UI.GetSprite("but062L");
      scrollItems_Quant[itemIndex].text_Int[i].color = LuaHelper.GetColor(125, 174, 178, 255);
      quantity = quantNum[i];
    else
      scrollItems_Quant[itemIndex].image_Button[i].sprite = UI.GetSprite("but062D");
      scrollItems_Quant[itemIndex].text_Int[i].color = Color.White;
    end

    scrollItems_Quant[itemIndex].event[i]:SetListener(EventTriggerType.PointerClick, this.OnClick_Quantity);
    scrollItems_Quant[itemIndex].event[i].parameter = i;
  end
  return true;
end

function UISouvenirShop.UpdateUI(reset)
  this.SwitchTag();
  this.UpdateItem(reset);
  this.UpdateMoney();
  this.UpdateQuantButton();
end

function UISouvenirShop.UpdateItem(reset)
  if giftFrom == EUIGetGiftFrom.Bag then
    this.UpdateBag(reset);
  elseif giftFrom == EUIGetGiftFrom.Shop then
    this.UpdateShop(reset);
  end
end

function UISouvenirShop.UpdateShop(reset)
  local shopItemCount = table.Count(SouvenirShop.souvenirList);

  if chosenGift == nil then
    chosenGiftIndex = 1;
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
  end

  chosenGift = SouvenirShop.souvenirList[chosenGiftIndex];

  if reset then
    scrollContent_Store:Reset(shopItemCount);
  end

  this.SetChosenImage(scrollItems_Store);
end

function UISouvenirShop.UpdateBag(reset)
  SouvenirShop.SetListOfGiftsInBag();
  local bagItemCount = table.Count(SouvenirShop.giftsList);

  if bagItemCount == 0 then
    ShowCenterMessage(string.Get(23408));
    chosenGift = nil;
    chosenGiftIndex = 0;
  else
    if chosenGiftIndex > table.Count(SouvenirShop.giftsList) then
      chosenGiftIndex = table.Count(SouvenirShop.giftsList);
    end

    if chosenGift == nil then
      chosenGiftIndex = 1;
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
    end

    chosenGift = souvenirDatas[SouvenirShop.giftsList[chosenGiftIndex].Id];

    this.SetChosenImage(scrollItems_Bag);
  end

  if reset then
    scrollContent_Bag:Reset(bagItemCount);
  else
    scrollContent_Bag:Refresh(bagItemCount);
  end
end

function UISouvenirShop.UpdateQuantButton()
  scrollContent_Quant:Refresh();
end

function UISouvenirShop.UpdateMoney()
  text_Gold.text = Role.GetPlayerGold();
  text_Point.text = Role.GetPoint();
end

function UISouvenirShop.OnClick_Quantity(uiEvent)
  local index = uiEvent.parameter;
  if quantityIndex == index then return end

  quantityIndex = index;
  this.UpdateQuantButton();
end

function UISouvenirShop.OnClick_Tag(uiEvent)
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
  local tag = uiEvent.parameter;
  if giftFrom == tag then return end

  giftFrom= tag;
  quantityIndex = 1;
  chosenGift = nil;
  this.UpdateUI(true);
end

function UISouvenirShop.OnClick_Item(uiEvent)
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
  local index = uiEvent.parameter;
  if chosenGiftIndex == index then return end

  chosenGiftIndex = index;
  this.UpdateItem();
end

function UISouvenirShop.OnClick_Check(uiEvent)
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
  local index = uiEvent.parameter;
  --chosenGiftIndex = index;

  local itemId = SouvenirShop.souvenirList[index].Id;

  UIItemInfo.Show(itemId, nil);
  --this.UpdateItem();
end

function UISouvenirShop.OnClick_Send()
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
  if chosenGift == nil then return end

  --C:105-003 <送禮> +對象ID(4) +禮物ID(2) +數量(1) +kind(1)
  sendBuffer:Clear();
  sendBuffer:WriteInt64(playerId);
  sendBuffer:WriteUInt16(chosenGift.Id);
  sendBuffer:WriteByte(quantity);

  --商店
  if giftFrom == EUIGetGiftFrom.Shop then
    sendBuffer:WriteByte(EUIGetGiftFrom.Shop);

    local currency;
    local playerCurrency;
    local paymentType = chosenGift.payment;

    local totalCost = chosenGift.price * quantity;

    if paymentType == ECurrency.Money then
      currency = string.Get(10099);
      playerCurrency = Role.GetPlayerGold();

      if RoleCount.Get(ERoleCount.BuyGiftMaxMoney) + totalCost >= RoleCount.Max(ERoleCount.BuyGiftMaxMoney) then
        ShowCenterMessage(string.Get(23554));
        return ;
      end
    elseif paymentType == ECurrency.Gold then
      currency = string.Get(10097);
      playerCurrency = Role.GetPoint();
    end

    if not Role.CheckCurrency(paymentType, totalCost) then
      ShowCenterMessage(string.Get(23402));
      return ;
    end

    --確認視窗
    ShowCheckMessage(
      function(send)
        if send then
          Network.Send(105, 3, sendBuffer);
        end
      end,
      string.format(string.Get(23401), totalCost, currency, itemDatas[chosenGift.Id]:GetName(), quantity),
      nil
    );

    --背包
  elseif giftFrom == EUIGetGiftFrom.Bag then
    sendBuffer:WriteByte(EUIGetGiftFrom.Bag);

    if SouvenirShop.giftsList[chosenGiftIndex].quant < quantity then
      ShowCenterMessage(string.Get(20075));
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
      return ;
    end

    Network.Send(105, 3, sendBuffer);

  end
end

function UISouvenirShop.SendSuccess()
  ShowCenterMessage(string.Get(20510));

  --C:105-001 <要求玩家個人資料> +玩家ID(8)(取送禮後的好友親密度)
  HouseBoard.SendDataRequest(playerId, 1);

  quantityIndex = 1;
  this.UpdateUI();
  UICharmFeedback.CheckRedDot();
end

function UISouvenirShop.SetChosenImage(scrollItems)
  --scrollItems初始為0
  for k, v in pairs(scrollItems) do
    v.image_Chosen.enabled = (k + 1 == chosenGiftIndex);
  end
end

function UISouvenirShop.SwitchTag()
  gameObject_GiftShop:SetActive(giftFrom == EUIGetGiftFrom.Shop);
  gameObject_Bag:SetActive(giftFrom == EUIGetGiftFrom.Bag);
  scrollContent_Tag:Refresh();
end