UIMall = {}
local this = UIMall;

this.name = "UIMall";
this.uiController = nil;

local transform_FrameRect;

local gameObject_SaleItem;
local gameObject_Sale2Item;
local gameObject_NTDItem;
local gameObject_NTD2Item;
local gameObject_CashItem;

local scrollContent_SaleItem;
local scrollItems_SaleItem = {};

local scrollContent_Sale2Item;
local scrollItems_Sale2Item = {};
local image_CurrencyBg;
local image_CurrencyIcon;
local text_CurrencyVaule;
local image_SendRefresh; 

local scrollContent_NTDItem;
local scrollItems_NTDItem = {};

local scrollContent_NTD2Item;
local scrollItems_NTD2Item = {};

local scrollContent_CashItem;
local scrollItems_CashItem = {};

local currentStoreKind; --目前商店種類
local currentMainPageIndex; --各種類商店販售主頁籤索引
local mainPage;

local currentMainPage = 1; --介面頁籤顯示索引
local currentSubPage = 1;
local currentItemPage = 1;
local currentItemIndex = 0;

local text_NoItem;

local image_Recipt;

local tagDatas = {};
local gacha = false;

function UIMall.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;
  this.uiController.onClose = this.OnClose;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;

  gameObject_SaleItem = uiController:FindGameObject("GameObject_SaleItem");
  gameObject_Sale2Item = uiController:FindGameObject("GameObject_Sale2Item");
  gameObject_NTDItem = uiController:FindGameObject("GameObject_NTDItem");
  gameObject_NTD2Item = uiController:FindGameObject("GameObject_NTD2Item");
  gameObject_CashItem = uiController:FindGameObject("GameObject_CashItem");
  

  scrollContent_SaleItem = uiController:FindScrollContent("ScrollContent_SaleItem");
  scrollContent_SaleItem.onInitialize = this.OnInitialize_ScrollContent_SaleItem;
  scrollContent_SaleItem.onItemChange = this.OnItemChange_ScrollContent_SaleItem;
  scrollContent_SaleItem:Initialize(1);

  scrollContent_Sale2Item = uiController:FindScrollContent("ScrollContent_Sale2Item");
  scrollContent_Sale2Item.onInitialize = this.OnInitialize_ScrollContent_Sale2Item;
  scrollContent_Sale2Item.onItemChange = this.OnItemChange_ScrollContent_Sale2Item;
  scrollContent_Sale2Item:Initialize(1);

  scrollContent_NTDItem = uiController:FindScrollContent("ScrollContent_NTDItem");
  scrollContent_NTDItem.onInitialize = this.OnInitialize_ScrollContent_NTDItem;
  scrollContent_NTDItem.onItemChange = this.OnItemChange_ScrollContent_NTDItem;
  scrollContent_NTDItem:Initialize(1);

  scrollContent_NTD2Item = uiController:FindScrollContent("ScrollContent_NTD2Item");
  scrollContent_NTD2Item.onInitialize = this.OnInitialize_ScrollContent_NTD2Item;
  scrollContent_NTD2Item.onItemChange = this.OnItemChange_ScrollContent_NTD2Item;
  scrollContent_NTD2Item:Initialize(1);

  scrollContent_CashItem = uiController:FindScrollContent("ScrollContent_CashItem");
  scrollContent_CashItem.onInitialize = this.OnInitialize_ScrollContent_CashItem;
  scrollContent_CashItem.onItemChange = this.OnItemChange_ScrollContent_CashItem;
  scrollContent_CashItem:Initialize(1);

  text_NoItem = uiController:FindText("Text_NoItem");
  text_CurrencyVaule = uiController:FindText("Text_CurrencyVaule");

  image_Recipt = uiController:FindImage("Image_Recipt");
  image_CurrencyBg = uiController:FindImage("Image_CurrencyBg");
  image_CurrencyIcon = uiController:FindImage("Image_CurrencyIcon"); 
   

  local tempEvent;
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

  tempEvent = uiController:FindEvent("Image_Recipt");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Recipt); 
  
  image_SendRefresh = uiController:FindEvent("Image_SendRefresh"); 
  image_SendRefresh:SetListener(EventTriggerType.PointerClick, this.OnClick_SendRefresh); 
end

function UIMall.OnInitialize_ScrollContent_SaleItem(scrollItems)
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
  
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_SaleItem[itemIndex] = {};
    scrollItems_SaleItem[itemIndex].event = scrollItems[itemIndex]:Find("Image_BG"):GetComponent("UIEvent");
    scrollItems_SaleItem[itemIndex].event:SetListener(EventTriggerType.PointerClick, this.OnClick_ItemBG); 
    scrollItems_SaleItem[itemIndex].name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_SaleItem[itemIndex].dayCount = scrollItems[itemIndex]:Find("Text_DayCount"):GetComponent("Text");
    scrollItems_SaleItem[itemIndex].memo = scrollItems[itemIndex]:Find("Image_Memo"):GetComponent("Image");
    scrollItems_SaleItem[itemIndex].gold = scrollItems[itemIndex]:Find("Image_Gold"):GetComponent("Image");
    scrollItems_SaleItem[itemIndex].point = scrollItems_SaleItem[itemIndex].gold.transform:Find("Text_Point"):GetComponent("Text");
    scrollItems_SaleItem[itemIndex].item = UIItemController.New(scrollItems[itemIndex]:Find("Image_ItemBG"));
    scrollItems_SaleItem[itemIndex].showGold = scrollItems[itemIndex]:Find("Image_ShowGold"):GetComponent("Image");
    scrollItems_SaleItem[itemIndex].showCredit = scrollItems_SaleItem[itemIndex].showGold.transform:Find("Text_ShowCredit"):GetComponent("Text");
  end 
end

function UIMall.OnItemChange_ScrollContent_SaleItem(dataIndex, itemIndex)
  local pageItemIndex = dataIndex + 1;
  local sellData = Mall.GetSellData(pageItemIndex);

  if sellData == nil then
    logError("sellData == nil")
    return false;
  end

  local itemData = itemDatas[sellData.Id];
  if itemData == nil then
    logError("itemData == nil")
    return false;
  end

  scrollItems_SaleItem[itemIndex].event.parameter = pageItemIndex;
  scrollItems_SaleItem[itemIndex].name.text = itemData:GetName(true);
  scrollItems_SaleItem[itemIndex].point.text = sellData.saleCredit;
  scrollItems_SaleItem[itemIndex].gold.sprite = UI.GetCurrencySprite(sellData.currencyKind);

  scrollItems_SaleItem[itemIndex].dayCount.text = sellData:GetLimitString(RoleCount.Get(sellData.flag));

  if sellData.memo == 0 then
    scrollItems_SaleItem[itemIndex].memo.gameObject:SetActive(false);
  else
    scrollItems_SaleItem[itemIndex].memo.gameObject:SetActive(true);
    scrollItems_SaleItem[itemIndex].memo.sprite = UI.GetMallMemoSprite(sellData.memo);
    scrollItems_SaleItem[itemIndex].showGold.sprite = UI.GetCurrencySprite(sellData.currencyKind);
  end

  scrollItems_SaleItem[itemIndex].showGold.gameObject:SetActive(sellData.saleCredit ~= sellData.showCredit);
  scrollItems_SaleItem[itemIndex].showCredit.text = sellData.showCredit;

  scrollItems_SaleItem[itemIndex].item:SetItem(sellData.Id, sellData.value);
  scrollItems_SaleItem[itemIndex].item:SetEvent(this.OnClick_ItemInfo, pageItemIndex);

  return true;
end

function UIMall.OnInitialize_ScrollContent_Sale2Item(scrollItems) 
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Sale2Item[itemIndex] = {};
    scrollItems_Sale2Item[itemIndex].event = scrollItems[itemIndex]:Find("Image_BG"):GetComponent("UIEvent");
    scrollItems_Sale2Item[itemIndex].event:SetListener(EventTriggerType.PointerClick, this.OnClick_ItemBG); 
    scrollItems_Sale2Item[itemIndex].name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_Sale2Item[itemIndex].dayCount = scrollItems[itemIndex]:Find("Text_DayCount"):GetComponent("Text");
    scrollItems_Sale2Item[itemIndex].memo = scrollItems[itemIndex]:Find("Image_Memo"):GetComponent("Image");
    scrollItems_Sale2Item[itemIndex].gold = scrollItems[itemIndex]:Find("Image_Gold"):GetComponent("Image");
    scrollItems_Sale2Item[itemIndex].point = scrollItems_Sale2Item[itemIndex].gold.transform:Find("Text_Point"):GetComponent("Text");
    scrollItems_Sale2Item[itemIndex].item = UIItemController.New(scrollItems[itemIndex]:Find("Image_ItemBG"));
    scrollItems_Sale2Item[itemIndex].showGold = scrollItems[itemIndex]:Find("Image_ShowGold"):GetComponent("Image");
    scrollItems_Sale2Item[itemIndex].showCredit = scrollItems_Sale2Item[itemIndex].showGold.transform:Find("Text_ShowCredit"):GetComponent("Text");
  end
end

function UIMall.OnItemChange_ScrollContent_Sale2Item(dataIndex, itemIndex)
  local pageItemIndex = dataIndex + 1;
  local sellData = Mall.GetSellData(pageItemIndex); 
  if sellData == nil then
    logError("sellData == nil")
    return false;
  end

  local itemData = itemDatas[sellData.Id];
  if itemData == nil then
    logError("itemData == nil")
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
    
    return false;
  end

  scrollItems_Sale2Item[itemIndex].event.parameter = pageItemIndex;
  scrollItems_Sale2Item[itemIndex].name.text = itemData:GetName(true);
  scrollItems_Sale2Item[itemIndex].point.text = sellData.saleCredit;
  scrollItems_Sale2Item[itemIndex].gold.sprite = UI.GetCurrencySprite(sellData.currencyKind);

  scrollItems_Sale2Item[itemIndex].dayCount.text = sellData:GetLimitString(RoleCount.Get(sellData.flag));

  if sellData.memo == 0 then
    scrollItems_Sale2Item[itemIndex].memo.gameObject:SetActive(false);
  else
    scrollItems_Sale2Item[itemIndex].memo.gameObject:SetActive(true);
    scrollItems_Sale2Item[itemIndex].memo.sprite = UI.GetMallMemoSprite(sellData.memo);
    scrollItems_Sale2Item[itemIndex].showGold.sprite = UI.GetCurrencySprite(sellData.currencyKind);
  end

  scrollItems_Sale2Item[itemIndex].showGold.gameObject:SetActive(sellData.saleCredit ~= sellData.showCredit);
  scrollItems_Sale2Item[itemIndex].showCredit.text = sellData.showCredit; 
  scrollItems_Sale2Item[itemIndex].item:SetItem(sellData.Id, sellData.value);
  scrollItems_Sale2Item[itemIndex].item:SetEvent(this.OnClick_ItemInfo, pageItemIndex);
 
  if sellData.dayCount ~= 0 and RoleCount.Get(sellData.flag) >= sellData.dayCount then --不是送審才檢查每日限購 
    image_SendRefresh.gameObject:SetActive(true); 
  end
  return true;
end

function UIMall.ScrollContent_Sale2ItemPagInfo()
  local sellData = Mall.GetSellData(1);

  if sellData == nil then
    image_CurrencyBg.gameObject:SetActive(false);
    logError("sellData == nil")
    return;
  end
  if sellData.currencyKind ~= 0 then
    image_CurrencyBg.gameObject:SetActive(true);
    image_CurrencyIcon.sprite = UI.GetCurrencySprite(sellData.currencyKind);
    text_CurrencyVaule.text = Role.GetPlayerCurrency(sellData.currencyKind); 
  else
    image_CurrencyBg.gameObject:SetActive(false);
  end
end

function UIMall.OnInitialize_ScrollContent_NTDItem(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_NTDItem[itemIndex] = {};
    scrollItems_NTDItem[itemIndex].name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_NTDItem[itemIndex].item = UIItemController.New(scrollItems[itemIndex]:Find("Image_ItemBG"));
    scrollItems_NTDItem[itemIndex].box = scrollItems[itemIndex]:Find("RawImage_Box"):GetComponent("RawImage");
    scrollItems_NTDItem[itemIndex].dayCount = scrollItems[itemIndex]:Find("Text_DayCount"):GetComponent("Text");
    scrollItems_NTDItem[itemIndex].limitTime = scrollItems[itemIndex]:Find("Text_LimitTIme"):GetComponent("Text");
    scrollItems_NTDItem[itemIndex].smallTagBG = scrollItems[itemIndex]:Find("Image_SmallTagBG"):GetComponent("Image");
    scrollItems_NTDItem[itemIndex].smallTag = scrollItems[itemIndex]:Find("Text_SmallTag"):GetComponent("Text");
    scrollItems_NTDItem[itemIndex].image_Gold = scrollItems[itemIndex]:Find("Image_Gold"):GetComponent("Image");
    scrollItems_NTDItem[itemIndex].image_Memo = scrollItems[itemIndex]:Find("Image_Memo"):GetComponent("Image");
    scrollItems_NTDItem[itemIndex].image_BonusTarget = scrollItems[itemIndex]:Find("Image_BonusTarget"):GetComponent("RawImage");
    scrollItems_NTDItem[itemIndex].price = scrollItems[itemIndex]:Find("Text_Price"):GetComponent("Text");
    scrollItems_NTDItem[itemIndex].specialEvent = scrollItems[itemIndex]:Find("Text_SpecialEvent"):GetComponent("Text");
    scrollItems_NTDItem[itemIndex].furniture = scrollItems[itemIndex]:Find("Image_FurnitureBg");
    scrollItems_NTDItem[itemIndex].text_furniture = scrollItems[itemIndex]:Find("Image_FurnitureBg"):Find("Text_Furniture"):GetComponent("Text");
    scrollItems_NTDItem[itemIndex].image_furniture = scrollItems[itemIndex]:Find("Image_FurnitureBg"):Find("Image_Furniture"):GetComponent("Image");
    scrollItems_NTDItem[itemIndex].event = scrollItems[itemIndex]:Find("RawImage_Box"):GetComponent("UIEvent");
    scrollItems_NTDItem[itemIndex].event:SetListener(EventTriggerType.PointerClick, this.OnClick_BuyNTD);
  end
end

function UIMall.OnItemChange_ScrollContent_NTDItem(dataIndex, itemIndex)
  if currentStoreKind == EStoreKind.NTD then
    return this.UpdateNTDScrollContent(dataIndex, itemIndex);
  elseif currentStoreKind == EStoreKind.Doro then
    return this.UpdateDoroScrollContent(dataIndex, itemIndex);
  end

  return true;
end

function UIMall.UpdateNTDScrollContent(dataIndex, itemIndex)
  local pageItemIndex = dataIndex + 1;
  local sellData = Mall.GetSellData(pageItemIndex);

  if sellData == nil then
    logError("sellData == nil")
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
    return false;
  end

  local itemData = itemDatas[sellData.Id];
  if itemData == nil then
    logError("itemData == nil")
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
    return false;
  end

  scrollItems_NTDItem[itemIndex].item:SetItem(sellData.Id);
  scrollItems_NTDItem[itemIndex].item:SetEvent(this.OnClick_ItemInfo, pageItemIndex);

  TextureManager.SetPng(ETextureUseType.UI, string.format("GS_%03d", sellData.showCredit), scrollItems_NTDItem[itemIndex].box);

  scrollItems_NTDItem[itemIndex].name.text = itemData:GetName(true);

  scrollItems_NTDItem[itemIndex].dayCount.text = sellData:GetLimitString(RoleCount.Get(sellData.flag));
  scrollItems_NTDItem[itemIndex].limitTime.text = sellData:GetSpecLimitTimeString();
  
  scrollItems_NTDItem[itemIndex].image_Gold.gameObject:SetActive(sellData.currencyKind ~= 0);
  scrollItems_NTDItem[itemIndex].image_Gold.sprite = UI.GetCurrencySprite(sellData.currencyKind);

  if sellData.memo == 0 then
    scrollItems_NTDItem[itemIndex].image_Memo.gameObject:SetActive(false);
  else
    scrollItems_NTDItem[itemIndex].image_Memo.gameObject:SetActive(true);
    scrollItems_NTDItem[itemIndex].image_Memo.sprite = UI.GetMallMemoSprite(sellData.memo);
  end
  
  if sellData.smallTag == 0 then
    scrollItems_NTDItem[itemIndex].smallTag.gameObject:SetActive(false);
    scrollItems_NTDItem[itemIndex].smallTagBG.gameObject:SetActive(false);
  else
    scrollItems_NTDItem[itemIndex].smallTag.gameObject:SetActive(true);
    scrollItems_NTDItem[itemIndex].smallTagBG.gameObject:SetActive(true);
    scrollItems_NTDItem[itemIndex].smallTag.text = string.Get(sellData.smallTag);
  end
  
  if sellData.specialEvent == 0 then
    scrollItems_NTDItem[itemIndex].specialEvent.gameObject:SetActive(false);
  else
    scrollItems_NTDItem[itemIndex].specialEvent.gameObject:SetActive(true);
    scrollItems_NTDItem[itemIndex].specialEvent.text = string.Get(sellData.specialEvent);
  end
  
  local storeValueData = StoreValue.GetData(sellData.saleCredit);
  scrollItems_NTDItem[itemIndex].price.transform.localPosition =  Vector3.New(90, scrollItems_NTDItem[itemIndex].price.transform.localPosition.y, scrollItems_NTDItem[itemIndex].price.transform.localPosition.z);
  if storeValueData == nil then
    scrollItems_NTDItem[itemIndex].price.text = "";
  else
    scrollItems_NTDItem[itemIndex].price.text = string.format( string.Get(storeValueData.showText), storeValueData.showPrice * 0.01 );    
  end

  if LuaHelper.CheckDefine("ThirdParty") then
    scrollItems_NTDItem[itemIndex].price.fontSize = 20;
  else
    scrollItems_NTDItem[itemIndex].price.fontSize = 25;
  end

  if storeValueData.bonusTarget == 1 then
    scrollItems_NTDItem[itemIndex].image_BonusTarget.gameObject:SetActive(true);
  else
    scrollItems_NTDItem[itemIndex].image_BonusTarget.gameObject:SetActive(false);
  end

  scrollItems_NTDItem[itemIndex].event.parameter = pageItemIndex;
  
  scrollItems_NTDItem[itemIndex].furniture.gameObject:SetActive(false);

  return true;
end

function UIMall.UpdateDoroScrollContent(dataIndex, itemIndex)
  local pageItemIndex = dataIndex + 1;
  local sellData = Mall.GetSellData(pageItemIndex);

  if sellData == nil then
    logError("sellData == nil")
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
    return false;
  end

  local itemData = itemDatas[sellData.Id];
  if itemData == nil then
    logError("itemData == nil")
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
    return false;
  end

  scrollItems_NTDItem[itemIndex].item:SetItem(sellData.Id);
  scrollItems_NTDItem[itemIndex].item:SetEvent(this.OnClick_ItemInfo, pageItemIndex);

  TextureManager.SetPng(ETextureUseType.UI, string.format("GS_%03d", sellData.showCredit), scrollItems_NTDItem[itemIndex].box);

  scrollItems_NTDItem[itemIndex].name.text = itemData:GetName(true);

  scrollItems_NTDItem[itemIndex].dayCount.text = sellData:GetLimitString(RoleCount.Get(sellData.flag));
  scrollItems_NTDItem[itemIndex].limitTime.text = sellData:GetSpecLimitTimeString();

  scrollItems_NTDItem[itemIndex].image_Gold.gameObject:SetActive(sellData.currencyKind ~= 0);
  scrollItems_NTDItem[itemIndex].image_Gold.sprite = UI.GetCurrencySprite(sellData.currencyKind);

  scrollItems_NTDItem[itemIndex].image_Memo.gameObject:SetActive(false);
  
  if sellData.smallTag == 0 then
    scrollItems_NTDItem[itemIndex].smallTag.gameObject:SetActive(false);
    scrollItems_NTDItem[itemIndex].smallTagBG.gameObject:SetActive(false);
  else
    scrollItems_NTDItem[itemIndex].smallTag.gameObject:SetActive(true);
    scrollItems_NTDItem[itemIndex].smallTagBG.gameObject:SetActive(true);
    scrollItems_NTDItem[itemIndex].smallTag.text = string.Get(sellData.smallTag);
  end
  
  if sellData.specialEvent == 0 then
    scrollItems_NTDItem[itemIndex].specialEvent.gameObject:SetActive(false);
  else
    scrollItems_NTDItem[itemIndex].specialEvent.gameObject:SetActive(true);
    scrollItems_NTDItem[itemIndex].specialEvent.text = string.Get(sellData.specialEvent);
  end
  
  scrollItems_NTDItem[itemIndex].price.text = sellData.saleCredit;
  scrollItems_NTDItem[itemIndex].price.transform.localPosition =  Vector2.New(58, scrollItems_NTDItem[itemIndex].price.transform.localPosition.y, scrollItems_NTDItem[itemIndex].price.transform.localPosition.y, scrollItems_NTDItem[itemIndex].price.transform.localPosition.z);

  scrollItems_NTDItem[itemIndex].event.parameter = pageItemIndex;

  scrollItems_NTDItem[itemIndex].image_BonusTarget.gameObject:SetActive(false);

  if Contains(sellData.currencyKind, ECurrency.furnitureAdvanced, ECurrency.furnitureNormal, ECurrency.Elf, ECurrency.Soul, ECurrency.ColorSoul, ECurrency.WarriorTicket, ECurrency.CardTicket, ECurrency.ExclusiveWeaponTicket, ECurrency.OutfitTicket) then
    scrollItems_NTDItem[itemIndex].furniture.gameObject:SetActive(true);
    scrollItems_NTDItem[itemIndex].image_furniture.sprite = UI.GetCurrencySprite(sellData.currencyKind);
    scrollItems_NTDItem[itemIndex].text_furniture.text = Role.GetPlayerCurrency(sellData.currencyKind);
  else
    scrollItems_NTDItem[itemIndex].furniture.gameObject:SetActive(false);
  end

  return true;
end

function UIMall.OnInitialize_ScrollContent_NTD2Item(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_NTD2Item[itemIndex] = {};

    scrollItems_NTD2Item[itemIndex].price = {};
    scrollItems_NTD2Item[itemIndex].priceBg = {};
    scrollItems_NTD2Item[itemIndex].message = {};
    scrollItems_NTD2Item[itemIndex].button = {};
    scrollItems_NTD2Item[itemIndex].buttonevent = {};
    scrollItems_NTD2Item[itemIndex].item = {};

    for idx = 1, 4 do
      scrollItems_NTD2Item[itemIndex].price[idx] = scrollItems[itemIndex]:Find(string.Concat("Text_Price_", idx)):GetComponent("Text");
      scrollItems_NTD2Item[itemIndex].priceBg[idx] =  scrollItems_NTD2Item[itemIndex].price[idx].transform:Find("Image"):GetComponent("Image");
    end

    for idx = 1, 5 do
      scrollItems_NTD2Item[itemIndex].message[idx] = scrollItems[itemIndex]:Find(string.Concat("Text_Message_", idx)):GetComponent("Text");
    end

    for idx = 1, 4 do
      scrollItems_NTD2Item[itemIndex].button[idx] = scrollItems[itemIndex]:Find(string.Concat("Image_Button_", idx)).gameObject;
      scrollItems_NTD2Item[itemIndex].buttonevent[idx] = scrollItems[itemIndex]:Find(string.Concat("Image_Button_", idx)):GetComponent("UIEvent");
    end

    for idx = 1, 14 do
      scrollItems_NTD2Item[itemIndex].item[idx] = UIItemController.New(scrollItems[itemIndex].transform:Find(string.Concat("Image_ItemBG_", idx)));  
    end

    scrollItems_NTD2Item[itemIndex].box = scrollItems[itemIndex]:Find("RawImage_BoxBG"):GetComponent("RawImage");
  end
end

function UIMall.OnItemChange_ScrollContent_NTD2Item(dataIndex, itemIndex)
  local pageItemIndex = dataIndex + 1;

  local sellData = Mall.GetSellData(pageItemIndex);

  if sellData == nil then
    logError("sellData == nil")
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
    return false;
  end
  local itemData = itemDatas[sellData.Id];
  
  if sellData.saleCredit ~= BattlePass.battlePassStorValueIndex then --通行證超值禮包頁面不檢查物品
    if itemData == nil then
      logError("itemData == nil")
      return false;
    end
  end

  TextureManager.SetPng(ETextureUseType.UI, string.format("GS_%03d", sellData.showCredit), scrollItems_NTD2Item[itemIndex].box);

  local gsActivity = gsActivityDatas[pageItemIndex];

  if gsActivity == nil then 
    logError("gsActivity == nil")
    return false;
  end

  --顯示介面物品
  for idx = 1, 14 do
    if gsActivity.items[idx] ~= nil and gsActivity.items[idx].Id ~= 0 then
      scrollItems_NTD2Item[itemIndex].item[idx].transform.parent.gameObject:SetActive(true);
      scrollItems_NTD2Item[itemIndex].item[idx].transform.parent.anchoredPosition = Vector2.New( gsActivity.items[idx].x, gsActivity.items[idx].y );
      scrollItems_NTD2Item[itemIndex].item[idx]:SetItem( gsActivity.items[idx].Id, gsActivity.items[idx].count );
      scrollItems_NTD2Item[itemIndex].item[idx]:SetEvent( this.OnClick_ItemInfoByItemID, { gsActivity.items[idx].Id, gsActivity.Id, gsActivity.items[idx].flag } );
        
      if gsActivity.Id == EGSActivityKind.HalfMonthCard then
        scrollItems_NTD2Item[itemIndex].item[idx]:SetCheckMark( StoreValue.GetHalfMonthCardTotalDay() >= idx );
      end
    else
      scrollItems_NTD2Item[itemIndex].item[idx].transform.parent.gameObject:SetActive(false);
    end
  end

  --物品資訊
  for idx = 1, 5 do
    scrollItems_NTD2Item[itemIndex].message[idx].text = "";
    if gsActivity.messages[idx] ~= nil and gsActivity.messages[idx].Id ~= 0 then
      scrollItems_NTD2Item[itemIndex].message[idx].transform.localPosition = Vector2.New( gsActivity.messages[idx].x, gsActivity.messages[idx].y );    
      scrollItems_NTD2Item[itemIndex].message[idx].fontSize = gsActivity.messages[idx].fontSize;

      if gsActivity.messages[idx].showKind == 1 then
        scrollItems_NTD2Item[itemIndex].message[idx].text = itemDatas[gsActivity.messages[idx].Id]:GetName(true);
      elseif gsActivity.messages[idx].showKind == 2 then
        scrollItems_NTD2Item[itemIndex].message[idx].text = itemDatas[gsActivity.messages[idx].Id].description;
      elseif gsActivity.messages[idx].showKind == 3 then
        scrollItems_NTD2Item[itemIndex].message[idx].text = string.Get( gsActivity.messages[idx].Id );
      end
    end
  end

  --售價資訊
  for idx = 1, 4 do
    scrollItems_NTD2Item[itemIndex].priceBg[idx].enabled = ( gsActivity.Id == EGSActivityKind.SavePoint );
  end

  local storeValueData = StoreValue.GetData(sellData.saleCredit);
  for idx = 1, 4 do
    scrollItems_NTD2Item[itemIndex].price[idx].text = "";   
    if gsActivity.prices[idx] ~= nil then
      scrollItems_NTD2Item[itemIndex].price[idx].transform.localPosition = Vector2.New( gsActivity.prices[idx].x, gsActivity.prices[idx].y);

      if gsActivity.prices[idx].showKind == 1 then
        scrollItems_NTD2Item[itemIndex].price[idx].text = string.format( string.Get(storeValueData.showText), storeValueData.showPrice * 0.01 );
      elseif gsActivity.prices[idx].showKind == 2 then
        scrollItems_NTD2Item[itemIndex].price[idx].text = string.Get( gsActivity.prices[idx].Id );
      elseif gsActivity.prices[idx].showKind == 3 then
        scrollItems_NTD2Item[itemIndex].price[idx].text = string.format( "                %d(%d)", RoleCount.Get( 708 ),  RoleCount.Get( 170 ));
      elseif gsActivity.prices[idx].showKind == 4 then
        local viptime = DrugBuff.GetTimeBuff(ETimeBuff.VipBenefit);
        if viptime ~= nil then
          scrollItems_NTD2Item[itemIndex].price[idx].text = string.format( string.Get( 21580 ), viptime:ToString("yyyy/MM/dd HH:mm:ss") );
        end
      elseif gsActivity.prices[idx].showKind == 5 then
        if LuaHelper.CheckDefine("ThirdParty") and ( LuaHelper.CheckDefine("HK") or LuaHelper.CheckDefine("TW") ) then
          scrollItems_NTD2Item[itemIndex].price[idx].transform.localPosition = Vector2.New(256, gsActivity.prices[idx].y);
        end

        if Mall.IsCanBuy(currentStoreKind, sellData) then
          scrollItems_NTD2Item[itemIndex].price[idx].text = string.format( string.Get( storeValueData.showText ), storeValueData.showPrice * 0.01 );
        else
          if not StoreValue.IsHalfMonthCardStart() then --活動沒開始
            scrollItems_NTD2Item[itemIndex].price[idx].text = string.Get( 20376 );
          elseif StoreValue.IsHalfMonthCardEnd() then --活動結束
            scrollItems_NTD2Item[itemIndex].price[idx].text = string.Get( 20377 );
          else
            scrollItems_NTD2Item[itemIndex].price[idx].text = string.Get( 21230 );
          end
        end       
      end
    end
  end

  --按鈕顯示
  for idx = 1, 4 do
    scrollItems_NTD2Item[itemIndex].button[idx].transform.gameObject:SetActive(false);
    if gsActivity.buttons[idx] ~= nil then
      scrollItems_NTD2Item[itemIndex].button[idx].transform.localPosition = Vector2.New( gsActivity.buttons[idx].x, gsActivity.buttons[idx].y );

      if gsActivity.buttons[idx].buttonKind == 1 and Mall.IsCanBuy(currentStoreKind, sellData) then
        scrollItems_NTD2Item[itemIndex].button[idx].transform.gameObject:SetActive(true);
        scrollItems_NTD2Item[itemIndex].button[idx].transform:Find("Text_Msg"):GetComponent("Text").text = string.Get( gsActivity.buttons[idx].Id );

        scrollItems_NTD2Item[itemIndex].buttonevent[idx]:ClearListener();
        scrollItems_NTD2Item[itemIndex].buttonevent[idx]:SetListener( EventTriggerType.PointerClick, this.OnClick_BuyNTD );
        scrollItems_NTD2Item[itemIndex].buttonevent[idx].parameter = pageItemIndex;
      elseif gsActivity.buttons[idx].buttonKind == 2 then
        if gsActivity.buttons[idx].getKind == 1 and RoleCount.Get(708) >= gsActivity.buttons[idx].value then
          scrollItems_NTD2Item[itemIndex].button[idx].transform.gameObject:SetActive(true);
          if BitFlag.Get( gsActivity.buttons[idx].flag ) then
            scrollItems_NTD2Item[itemIndex].button[idx].transform:Find("Text_Msg"):GetComponent("Text").text = string.Get( gsActivity.buttons[idx].Id2 );
          else
            scrollItems_NTD2Item[itemIndex].button[idx].transform:Find("Text_Msg"):GetComponent("Text").text = string.Get( gsActivity.buttons[idx].Id );
            scrollItems_NTD2Item[itemIndex].buttonevent[idx]:ClearListener();
            scrollItems_NTD2Item[itemIndex].buttonevent[idx]:SetListener( EventTriggerType.PointerClick, this.OnClick_GetAward );
            scrollItems_NTD2Item[itemIndex].buttonevent[idx].parameter = { gsActivity.Id, gsActivity.buttons[idx].value };
          end
        end
      elseif gsActivity.buttons[idx].buttonKind == 3 then
        scrollItems_NTD2Item[itemIndex].button[idx].transform.gameObject:SetActive(true);
        scrollItems_NTD2Item[itemIndex].button[idx].transform:Find("Text_Msg"):GetComponent("Text").text = string.Get( gsActivity.buttons[idx].Id );
  
        scrollItems_NTD2Item[itemIndex].buttonevent[idx]:ClearListener();
        scrollItems_NTD2Item[itemIndex].buttonevent[idx]:SetListener( EventTriggerType.PointerClick, this.OnClick_BuyBattlePass );
      end
    end
  end

  return true;
end

function UIMall.OnInitialize_ScrollContent_CashItem(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_CashItem[itemIndex] = {};

    for i = 1, StoreValue.pageItemCount do
      scrollItems_CashItem[itemIndex][i] = {};
      scrollItems_CashItem[itemIndex][i].transform = scrollItems[itemIndex]:Find(string.Concat("ScrollItem (", i, ")"));
      scrollItems_CashItem[itemIndex][i].event = scrollItems_CashItem[itemIndex][i].transform:Find("Image_BG"):GetComponent("UIEvent");
      scrollItems_CashItem[itemIndex][i].event:SetListener(EventTriggerType.PointerClick, this.OnClick_BuyCash);
      scrollItems_CashItem[itemIndex][i].gold = scrollItems_CashItem[itemIndex][i].transform:Find("Text_Gold"):GetComponent("Text");
      scrollItems_CashItem[itemIndex][i].price = scrollItems_CashItem[itemIndex][i].transform:Find("Text_Price"):GetComponent("Text");
      scrollItems_CashItem[itemIndex][i].boxBG = scrollItems_CashItem[itemIndex][i].transform:Find("RawImage_BoxBG"):GetComponent("RawImage");
      scrollItems_CashItem[itemIndex][i].image_Double = scrollItems_CashItem[itemIndex][i].transform:Find("Image_Double"):GetComponent("Image");
      scrollItems_CashItem[itemIndex][i].storeText = scrollItems_CashItem[itemIndex][i].transform:Find("Text_StoreText"):GetComponent("Text");
    end
  end
end

function UIMall.OnItemChange_ScrollContent_CashItem(dataIndex, itemIndex)
  local index;
  local data;

  for i = 1, StoreValue.pageItemCount do
    index = dataIndex * StoreValue.pageItemCount + i;
    data = StoreValue.GetShowData(index)
    if data ~= nil then
      scrollItems_CashItem[itemIndex][i].transform.gameObject:SetActive(true);
      scrollItems_CashItem[itemIndex][i].price.text = string.format( string.Get(data.showText), data.showPrice * 0.01 );
      UI.SetIcon(string.Concat("common0_icon0", data.textureId), scrollItems_CashItem[itemIndex][i].boxBG);
      scrollItems_CashItem[itemIndex][i].boxBG:SetNativeSize();
      scrollItems_CashItem[itemIndex][i].event.parameter = index;

      if data.flag ~= 0 and not BitFlag.Get(data.flag) and not Network.CheckServerSwitch(EServerSwitch.Review) then
        scrollItems_CashItem[itemIndex][i].image_Double.gameObject:SetActive(true);
        scrollItems_CashItem[itemIndex][i].gold.text = data.totalGold.."+"..data.gold;
      else
        scrollItems_CashItem[itemIndex][i].image_Double.gameObject:SetActive(false);
        scrollItems_CashItem[itemIndex][i].gold.text = data.totalGold;
      end

      scrollItems_CashItem[itemIndex][i].storeText.text = StoreValue.GetStoreName(data.platform);     
    else
      scrollItems_CashItem[itemIndex][i].transform.gameObject:SetActive(false);
    end
  end

  return true;
end

function UIMall.OnOpen(mainPage, subPage, openGacha)
  Network.Send(1, 16);
  
  this.UpdateTagData(openGacha);
  
  Mall.ClearDoro();
  StoreValue.Init();

  if openGacha then
    currentMainPage = EStoreKind.Doro - 1;
    currentSubPage = 1;
  else
    if mainPage == 0 or mainPage == nil then
      currentMainPage = 1;
    else
      currentMainPage = mainPage;
    end
  
    if subPage == 0 or subPage == nil then
      currentSubPage = 1;
    else
      currentSubPage = subPage;
    end
  end

  currentItemPage = 1;

  UIMall.UpdateRecipt();

  return true;
end

function UIMall.UpdateTagData(openGacha)
  gacha = openGacha;
  
  tagDatas = {};
  if gacha then
    if Network.CheckServerSwitch(EServerSwitch.Review) then
      tagDatas[1] = {};
      tagDatas[1][1] = Mall.GetMainTagNameByKind(EStoreKind.NTD2);
      tagDatas[1][2] = {};
    
      tagDatas[2] = {};
      tagDatas[2][1] = Mall.GetMainTagNameByKind(EStoreKind.Cash);
      tagDatas[2][2] = {};
    else
      local tagName = Mall.GetGachaMainTagName();
      tagDatas = {};
      for k, v in pairs(tagName) do
        tagDatas[k] = { v, nil };
      end
    end
  
    RedDot.Remove(ERedDot.Gacha);
  else
    if Network.CheckServerSwitch(EServerSwitch.Review) then
      tagDatas[1] = {};
      tagDatas[1][1] = Mall.GetMainTagNameByKind(EStoreKind.NTD2);
      tagDatas[1][2] = {};
      tagDatas[2] = {};
      tagDatas[2][1] = Mall.GetMainTagNameByKind(EStoreKind.Cash);
      tagDatas[2][2] = {};
    else
      local totalMainPageCount = Mall.GetMainPageCount();
      for i = 1, totalMainPageCount do
        local subPageCount = Mall.GetSubPageCount(i);
        tagDatas[i] = {};
        tagDatas[i][1] = Mall.GetMainTagName(i);
        tagDatas[i][2] = {};
        for j = 1, subPageCount do
          tagDatas[i][2][j] = Mall.GetSubTagName(i, j);
        end
      end
    end
  end
end

function UIMall.OnClose()
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
  if UI.IsVisible(UIAlert) then
    UI.Close(UIAlert);
  end
end

function UIMall.OnVisible(visible)
  if visible then
    if gacha then
      UIFrame.Active(transform_FrameRect, string.Get(10085), this.OnClick_Close, nil, this.OnClick_Tag, tagDatas, 1, 1, this.UpdateRedot);
    else
      UIFrame.Active(transform_FrameRect, string.Get(10085), this.OnClick_Close, nil, this.OnClick_Tag, tagDatas, currentMainPage, currentSubPage, this.UpdateRedot);
    end

    this.SetSaleItemData();
    this.UpdateItemPage();
  end
end

function UIMall.UpdateRedot(mainPageIndex, subPageIndex)
  if not gacha then
    if mainPage == mainPageIndex then
      return false;
    else
      mainPage = mainPageIndex;
    end
  
    if Mall.GetMallKind(mainPage) == EStoreKind.NTD2 then
      return Mall.IsGSSavePointCanGet();
    elseif Mall.GetMallKind(mainPage) == EStoreKind.Doro then
      return not Mall.IsDoroCheck();
    elseif Mall.GetMallKind(mainPage) == EStoreKind.Mall then
      return not Mall.IsMallCheck();
    end
  end

  return false;
end

function UIMall.UpdateRecipt()
  image_Recipt.gameObject:SetActive( false );
end

function UIMall.SetSaleItemData()
  currentStoreKind = Mall.GetMallKind(currentMainPage);
  currentMainPageIndex = Mall.GetMainPageIndex(currentMainPage);

  Mall.ResetPageSellData(currentStoreKind, currentMainPageIndex, currentSubPage);
end

function UIMall.UpdateItemPage()
  gameObject_SaleItem:SetActive(currentStoreKind == EStoreKind.Mall or currentStoreKind == EStoreKind.Organization);
  gameObject_Sale2Item:SetActive(currentStoreKind == EStoreKind.PVP); 
  gameObject_NTDItem:SetActive(currentStoreKind == EStoreKind.NTD or currentStoreKind == EStoreKind.Doro);
  gameObject_CashItem:SetActive(currentStoreKind == EStoreKind.Cash);
  gameObject_NTD2Item:SetActive(currentStoreKind == EStoreKind.NTD2);

  local count = 0;

  if currentStoreKind == EStoreKind.NTD or currentStoreKind == EStoreKind.Doro then
    count = Mall.GetTotalPageCount(currentStoreKind);
    scrollContent_NTDItem:Reset( count );
  elseif currentStoreKind == EStoreKind.NTD2 then
    count = Mall.GetTotalPageCount(currentStoreKind)
    scrollContent_NTD2Item:Reset( count );
  elseif currentStoreKind == EStoreKind.Cash then
    count = StoreValue.GetTotalPageCount();
    scrollContent_CashItem:Reset( StoreValue.GetTotalPageCount() );
  elseif currentStoreKind == EStoreKind.Mall or currentStoreKind == EStoreKind.Organization then
    count = Mall.GetTotalPageCount(currentStoreKind);
    scrollContent_SaleItem:Reset( count );
  elseif currentStoreKind == EStoreKind.PVP then
    image_SendRefresh.gameObject:SetActive(false);
    count = Mall.GetTotalPageCount(currentStoreKind);
    scrollContent_Sale2Item:Reset( count );
    this.ScrollContent_Sale2ItemPagInfo();
  end

  if count <= 0 then
    text_NoItem.text = string.Get( 22312 );
  else
    text_NoItem.text = "";
  end
end

function UIMall.RefreshItemPage()
  if currentStoreKind == EStoreKind.NTD or currentStoreKind == EStoreKind.Doro then
    scrollContent_NTDItem:Refresh();
  elseif currentStoreKind == EStoreKind.NTD2 then
    scrollContent_NTD2Item:Refresh();
  elseif currentStoreKind == EStoreKind.Cash then
    scrollContent_CashItem:Refresh();
  elseif currentStoreKind == EStoreKind.Mall or currentStoreKind == EStoreKind.Organization then
    scrollContent_SaleItem:Refresh();
  elseif currentStoreKind == EStoreKind.PVP then
    image_SendRefresh.gameObject:SetActive(false);
    scrollContent_Sale2Item:Refresh();
    this.ScrollContent_Sale2ItemPagInfo();
  end
end

function UIMall.OnClick_Close()
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
  UI.Close(UIMall);

  return true;
end

function UIMall.OnClick_Tag(mainTag, subTag)
  if gacha then
    currentMainPage = EStoreKind.Doro - 1;
    currentSubPage = mainTag;
    currentItemPage = 1;
    currentItemIndex = 0;
  
    this.SetSaleItemData()
    this.UpdateItemPage();
  
    if Mall.GetMallKind(currentMainPage) == EStoreKind.Doro then
      Mall.SetDoroCheck();
      Mall.IsRedDot();
    end
  else
    currentMainPage = mainTag;
    currentSubPage = subTag;
    currentItemPage = 1;
    currentItemIndex = 0;
  
    this.SetSaleItemData()
    this.UpdateItemPage();
  
    if Mall.GetMallKind(currentMainPage) == EStoreKind.Doro then
      Mall.SetDoroCheck();
      Mall.IsRedDot();
    elseif Mall.GetMallKind(currentMainPage) == EStoreKind.Mall then
      Mall.SetMallCheck();
      Mall.IsRedDot();
    end
  end

  return true;
end

function UIMall.OnClick_SendRefresh(uiEvent)
  
  if Mall.GetMallKind(currentMainPage) ~= EStoreKind.PVP then
    return;
  end
  --[[local aCanRef = false;
  local aCount = Mall.GetSellDataCount();
  if aCount <= 0 then 
     return;
  end
  for idx = 0, aCount do
    local sellData = Mall.GetSellData(idx);
    if sellData ~= nil then 
    if not Network.CheckServerSwitch(EServerSwitch.Review) and sellData.dayCount ~= 0 and RoleCount.Get(sellData.flag) >= sellData.dayCount then --不是送審才檢查每日限購 
      aCanRef = true;
    end  
    if aCanRef then 
      break;
    end
  end
  if aCanRef then 
    UISell.Launch(55, nil, currentStoreKind, currentSubPage, currentItemPage);
  end ]]
  UISell.Launch(55, nil, currentStoreKind, currentSubPage, currentItemPage); 
end

function UIMall.OnClick_ItemInfo(uiEvent)
  currentItemIndex = uiEvent.parameter;

  local sellData = Mall.GetSellData(currentItemIndex);
  if sellData == nil then return end

  UIItemInfo.Show(sellData.Id);
end

function UIMall.OnClick_ItemInfoByItemID(uiEvent)
  local id = uiEvent.parameter[1];
  local pageIdx = uiEvent.parameter[2];
  local check = uiEvent.parameter[3];

  if pageIdx == EGSActivityKind.SavePoint and  Mall.IsGSSavePointCanGet() then --儲值滿額領獎
    UIMall.OnClick_GetAward( { ["parameter"] = { pageIdx, check, id } } )
    return;
  end

  UIItemInfo.Show(id);
end

function UIMall.OnClick_ItemBG(uiEvent)
  this.BuyItem(uiEvent.parameter);
end

function UIMall.BuyItem(index)
  currentItemIndex = index;
  this.Buy();
end

function UIMall.Buy(isDoro)
  UI.Close(UIItemInfo);

  local sellData = Mall.GetSellData(currentItemIndex);

  if sellData == nil then return end

  if not sellData:IsInSaleTime() then
    ShowCenterMessage( string.Get(22156) );
    return;
  end

  if sellData.buyLimitFlag ~= 0 and not BitFlag.Get(sellData.buyLimitFlag) then
    ShowCenterMessage( string.Get(22155) );
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
    return;
  end

  if Item.CheckBagIsFull() then
    if UI.IsVisible(UIDoro) then
      UIDoro.OnClick_Close();
    end
    
    return;
  end

  if not Mall.IsCanBuy(currentStoreKind, sellData) then return end

  if currentStoreKind == EStoreKind.Doro then
    local itemSpare3 = itemDatas[sellData.Id].spare3;
  
    if itemSpare3 == nil then
      logError("itemDatas spare3 is nil")
      return;
    end

    Mall.SetDoroKind(itemSpare3);

    if Contains(itemSpare3, Mall.EDoroKind.Warrior, Mall.EDoroKind.ExclusiveWeapon, Mall.EDoroKind.Outfit) or sellData.Id == 34434 then
      if Item.GetBagLeftCount(EThings.Bag) < sellData.value then
        ShowCenterMessage(string.Get(30039));
        return;
      end
    end

    if itemSpare3 == Mall.EDoroKind.Soul and Item.GetBagCount(EThings.Soul) >= 50 then
      ShowCenterMessage(string.Get(23708));
      if UI.IsVisible(UIDoro) then
        UIDoro.OnClick_Close();
      end
      
      return;
    end
  
    if isDoro ~= nil then
      Mall.SendBuyItem(currentStoreKind, currentMainPageIndex, currentSubPage, currentItemIndex, 1, isDoro);
    else
      Mall.SendBuyItem(currentStoreKind, currentMainPageIndex, currentSubPage, currentItemIndex, 1, true);
    end

  else
    local quant = 999;
    if sellData.dayCount ~= 0 then
      quant = sellData.dayCount - RoleCount.Get(sellData.flag);
    end

    ShowStoreInput(sellData.Id, quant, sellData.currencyKind, -sellData.saleCredit,
      function(value)
        if value == nil then return end
        if tonumber(value) == 0 then return end
        if UIPurchaseFree.CheckPurchaseFreeMax() and (sellData.currencyKind == 1) then
          ShowCheckMessage(  
            function(text)
              if UIPurchaseFree.GetActivityOpen() then
                Mall.SendBuyItem(currentStoreKind, currentMainPageIndex, currentSubPage, currentItemIndex, tonumber(value), false, text);
              else
                ShowCenterMessage(string.Get(20377));
              end
            end
          , UIPurchaseFree.GetPurchaseFreeString(), Role.player);
        else
          Mall.SendBuyItem(currentStoreKind, currentMainPageIndex, currentSubPage, currentItemIndex, tonumber(value));
        end
      end, sellData.value); --Role.player
  end
end

function UIMall.GetCurrentBuyValue()
  local sellData = Mall.GetSellData(currentItemIndex);
  
  if sellData ~= nil then
    return sellData.value;
  end

  return 0;
end

function UIMall.OnClick_BuyCash(uiEvent)
  local index = uiEvent.parameter;
  local showData = StoreValue.GetShowData(index);

  --購買MyCard點卡 TradeType 固定 1
  StoreValue.Buy(showData.platform, showData.index, IAPData.TradeType);
end

local currentNTDsellData;
local currentNTDstoreValueData;

function UIMall.OnClick_BuyNTD(uiEvent)
  local index = uiEvent.parameter;

  local sellData = Mall.GetSellData(index);
  if sellData  == nil then return end

  if not sellData:IsInSaleTime() then
    ShowCenterMessage( string.Get(22156) );
    return;
  end

  local itemData = itemDatas[sellData.Id];
  if itemData  == nil then return end

  if currentStoreKind == EStoreKind.Doro then
    ShowCheckMessage(
      function(result)
        if result then
          this.BuyItem(uiEvent.parameter)
        end
      end,
      string.format( string.Get(21447), sellData.saleCredit, string.GetCurrency(sellData.currencyKind), itemData:GetName(true) )
    );
  else
    local storeValueData = StoreValue.GetData(sellData.saleCredit);

    if storeValueData  == nil then return end

    if not Mall.IsCanBuy(currentStoreKind, sellData) then return end

    currentNTDsellData = nil;
    currentNTDstoreValueData = nil;

    if LuaHelper.CheckDefine("ThirdParty") and LuaHelper.CheckDefine("HK") and 
      (sellData.saleCredit == 110 or sellData.saleCredit == 112) then --港版購買暢遊卡、限時好禮

      currentNTDsellData = sellData;
      currentNTDstoreValueData = storeValueData;

      ShowOptionMessage( UIMall.SelectIAPPlatform, string.Get(21674), { string.Get(21571), string.Get(21574) } );
    else
      --購買MyCard現金禮包 TradeType 照串表訂值
      StoreValue.Buy( StoreValue.GetCurrentPlatform(), sellData.saleCredit, storeValueData.cashIndex );
    end
  end
end

function UIMall.OnClick_BuyBattlePass()
  BattlePass.RequireCheckBattlePassFunction(EBattlePassReuireState.OpenUI)
end

function UIMall.SelectIAPPlatform(result)
  --暢遊卡儲值串表 串表索引110  給Cash編號304
  if result == 1 then --MyCard
    StoreValue.Buy(EPlatform.MyCard, currentNTDsellData.saleCredit, currentNTDstoreValueData.cashIndex); 
  elseif result == 2 then --Alipay
    StoreValue.Buy(EPlatform.AliPay, currentNTDsellData.saleCredit);
  end
end

function UIMall.OnClick_GetAward(uiEvent)
  local pageIdx = uiEvent.parameter[1];
  local check = uiEvent.parameter[2];
  local id = uiEvent.parameter[3];

  local gsActivity = GSActivityData.GetActivityData(pageIdx);
  if gsActivity == nil then return end

  for idx = 1, 4 do
    if gsActivity.buttons[idx].getKind == 1 then
      if gsActivity.buttons[idx].value == check and not BitFlag.Get( gsActivity.buttons[idx].flag ) and RoleCount.Get(708) >= check then
        sendBuffer:Clear()
        sendBuffer:WriteByte(EAward.SaveGift);
        sendBuffer:WriteUInt32(check);
        sendBuffer:WriteByte(1);
        Network.Send(87, 2, sendBuffer);
      else
        UIItemInfo.Show(id);
      end
    end
  end
end

function UIMall.OnClick_Recipt()
  UI.Open(UIReciptHelper);
end