EUIMarketTag = {
  Upload = 1,
  Withdraw = 2,
}

EUIMarketCategory = {
  Soul = 1,
  MythEquip = 2,
  Card = 3,
  Outfit = 4,
  Mount = 5,
  Furniture = 6,
  WarriorScroll = 7,
  Warrior = 8,
}

ESoulDetailCategory = {
  All = 0,
  Earth = 1,
  Water = 2,
  Fire = 3,
  Wind = 4,
  Light = 5, --表上為7
  Dark = 6, --表上為8
}

UIMarket = {}
local this = UIMarket;
local uiController;

this.name = "UIMarket";
this.uiController = nil;
local transform_FrameRect;
local text_MarketSlotSpace;
local text_MarketSlotSpaceInWarrior;
local text_WarningTitle;
local text_WarningSubTitle;
local text_Gold;
local text_WithdrawGold;
local text_WebSlotSpace;
local text_WarriorMarket;
local text_MarketSlot;
local text_MarketCanTradeCount;
local text_WarriorCanTradeCount;

local scrollContent_BackPack;
local scrollItems_BackPack = {};
local scrollContent_MarketSlot;
local scrollItems_MarketSlot = {};
local scrollContent_WebSlot;
local scrollItems_WebSlot = {};
local scrollContent_FailSlot;
local scrollItems_FailSlot = {};
local scrollContent_WarriorUpload;
local scrollItems_WarriorUpload = {};
local scrollContent_FollowWarrior;
local scrollItems_FollowWarrior = {};
local scrollContent_WarriorInWeb;
local scrollItems_WarriorInWeb = {};

local imageCategory = {};
local tagDatas = {};

local gameObject_Upload;
local gameObject_DetailCategory;
local gameObject_MarketSlot;
local gameObject_BackPack;
local gameObject_Warrior;
local gameObject_TextMarketSlotSpace;
local gameObject_TextWarriorMarketSpace;
local gameObject_GoWebButton;

local gameObject_Withdraw;
local gameObject_WebSlot;
local gameObject_WarriorInWeb;

local gameObject_Warning;
local gameObject_WarningSubTitle;
local gameObject_WarningFailSlot;
local sizeFitter_ContentBG;
local sizeFitter_TitleText;
local sizeFitter_SubTitleText;

local dropdown_DetailCategory;

--var
local withDrawSetCategory = false;
local currentCategory = EUIMarketCategory.MythEquip;
local currentTag = EUIMarketTag.Upload;
local detailCategory = ESoulDetailCategory.All;
local currentBag = {};
local uploadSlot = {};
local followWarrior = {};

function UIMarket.Initialize(go)
  uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;
  this.uiController.onClose = this.OnClose;
  
  tagDatas[1] = { string.Get(23716), nil };
  tagDatas[2] = { string.Get(23717), nil };
  
  transform_FrameRect = uiController:FindGameObject("FrameRect"):GetComponent("RectTransform");
  
  --Warrior
  text_MarketSlotSpaceInWarrior = uiController:FindText("Text_WarriorMarketSpace");
  gameObject_TextWarriorMarketSpace = uiController:FindGameObject("Text_WarriorMarketSpace");
  text_WarriorMarket = uiController:FindText("Text_WarriorMarket");
  text_WarriorCanTradeCount = uiController:FindText("Text_WarriorUploadCount");
  
  scrollContent_WarriorUpload = uiController:FindScrollContent("ScrollContent_WarriorUpload");
  scrollContent_WarriorUpload.onInitialize = this.OnInitialize_scrollContent_WarriorUpload;
  scrollContent_WarriorUpload.onItemChange = this.OnItemChange_scrollContent_WarriorUpload
  scrollContent_WarriorUpload:Initialize(1);
  
  scrollContent_FollowWarrior = uiController:FindScrollContent("ScrollContent_FollowWarrior");
  scrollContent_FollowWarrior.onInitialize = this.OnInitialize_scrollContent_FollowWarrior;
  scrollContent_FollowWarrior.onItemChange = this.OnItemChange_scrollContent_FollowWarrior
  scrollContent_FollowWarrior:Initialize(1);
  
  local tempEvent;
  tempEvent = uiController:FindEvent("Image_Soul");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Category);
  tempEvent.parameter = EUIMarketCategory.Soul;
  tempEvent = uiController:FindEvent("Image_MythEquip");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Category);
  tempEvent.parameter = EUIMarketCategory.MythEquip;
  tempEvent = uiController:FindEvent("Image_Card");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Category);
  tempEvent.parameter = EUIMarketCategory.Card;
  tempEvent = uiController:FindEvent("Image_Outfit");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Category);
  tempEvent.parameter = EUIMarketCategory.Outfit;
  tempEvent = uiController:FindEvent("Image_Mount");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Category);
  tempEvent.parameter = EUIMarketCategory.Mount;
  tempEvent = uiController:FindEvent("Image_Furniture");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Category);
  tempEvent.parameter = EUIMarketCategory.Furniture;
  tempEvent = uiController:FindEvent("Image_WarriorScroll");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Category);
  tempEvent.parameter = EUIMarketCategory.WarriorScroll;
  tempEvent = uiController:FindEvent("Image_Warrior");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Category);
  tempEvent.parameter = EUIMarketCategory.Warrior;
  tempEvent = uiController:FindEvent("Image_GoWeb");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_GoWeb);

  imageCategory[EUIMarketCategory.Soul] = uiController:FindImage("Image_Soul");
  imageCategory[EUIMarketCategory.MythEquip] = uiController:FindImage("Image_MythEquip");
  imageCategory[EUIMarketCategory.Card] = uiController:FindImage("Image_Card");
  imageCategory[EUIMarketCategory.Outfit] = uiController:FindImage("Image_Outfit");
  imageCategory[EUIMarketCategory.Mount] = uiController:FindImage("Image_Mount");
  imageCategory[EUIMarketCategory.Furniture] = uiController:FindImage("Image_Furniture");
  imageCategory[EUIMarketCategory.WarriorScroll] = uiController:FindImage("Image_WarriorScroll");
  imageCategory[EUIMarketCategory.Warrior] = uiController:FindImage("Image_Warrior");
  
  gameObject_Warrior = uiController:FindGameObject("Warrior");
  gameObject_GoWebButton = uiController:FindGameObject("Image_GoWeb");
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
  this.IntiUpload();
  this.IntiWithdraw();
  this.IntiWarning();
end

function UIMarket.IntiUpload()
  text_MarketSlotSpace = uiController:FindText("Text_MarketSlotSpace");
  text_MarketCanTradeCount = uiController:FindText("Text_MarketUploadCount");
  gameObject_TextMarketSlotSpace = uiController:FindGameObject("Text_MarketSlotSpace");
  text_Gold = uiController:FindText("Text_Gold");
  text_MarketSlot = uiController:FindText("Text_MarketSlot");
  
  scrollContent_BackPack = uiController:FindScrollContent("ScrollContent_BackPack");
  scrollContent_BackPack.onInitialize = this.OnInitialize_ScrollContent_BackPack;
  scrollContent_BackPack.onItemChange = this.OnItemChange_ScrollContent_BackPack;
  scrollContent_BackPack:Initialize(1);
  
  scrollContent_MarketSlot = uiController:FindScrollContent("ScrollContent_MarketSlot");
  scrollContent_MarketSlot.onInitialize = this.OnInitialize_ScrollContent_MarketSlot;
  scrollContent_MarketSlot.onItemChange = this.OnItemChange_ScrollContent_MarketSlot;
  scrollContent_MarketSlot:Initialize(1);
  
  dropdown_DetailCategory = uiController:FindDropdown("Dropdown_DetailCategory");
  dropdown_DetailCategory:AddOption(string.Get(99684));
  dropdown_DetailCategory:AddOption(string.Get(20002));
  dropdown_DetailCategory:AddOption(string.Get(20003));
  dropdown_DetailCategory:AddOption(string.Get(20004));
  dropdown_DetailCategory:AddOption(string.Get(20005));
  dropdown_DetailCategory:AddOption(string.Get(20922));
  dropdown_DetailCategory:AddOption(string.Get(20923));
  dropdown_DetailCategory:AddListener(this.OnDropChange_DetailCategory);
  
  local tempEvent;
  tempEvent = uiController:FindEvent("Image_Upload");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Upload);
  tempEvent = uiController:FindEvent("Image_Clear");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Clear);
  tempEvent = uiController:FindEvent("Image_ AddGold");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_AddGold);
  
  gameObject_Upload = uiController:FindGameObject("Upload");
  gameObject_MarketSlot = uiController:FindGameObject("MarketSlot");
  gameObject_BackPack = uiController:FindGameObject("BackPack");
  gameObject_DetailCategory = uiController:FindGameObject("DetailCategory");
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
end

function UIMarket.IntiWithdraw()
  text_WithdrawGold = uiController:FindText("Text_WithdrawGold");
  text_WebSlotSpace = uiController:FindText("Text_WebSlotSpace");
  
  local tempEvent;
  tempEvent = uiController:FindEvent("Image_Withdraw");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_WithdrawAll);
  
  scrollContent_WebSlot = uiController:FindScrollContent("ScrollContent_WebSlot");
  scrollContent_WebSlot.onInitialize = this.OnInitialize_ScrollContent_WebSlot;
  scrollContent_WebSlot.onItemChange = this.OnItemChange_ScrollContent_WebSlot;
  scrollContent_WebSlot:Initialize(1);
  
  scrollContent_WarriorInWeb = uiController:FindScrollContent("ScrollContent_WarriorInWeb");
  scrollContent_WarriorInWeb.onInitialize = this.OnInitialize_scrollContent_WarriorInWeb;
  scrollContent_WarriorInWeb.onItemChange = this.OnItemChange_scrollContent_WarriorInWeb;
  scrollContent_WarriorInWeb:Initialize(1);
  
  gameObject_Withdraw = uiController:FindGameObject("Withdraw");
  gameObject_WebSlot = uiController:FindGameObject("WebSlot");
  gameObject_WarriorInWeb = uiController:FindGameObject("WarriorInWeb");
end

function UIMarket.IntiWarning()
  text_WarningTitle = uiController:FindText("Title");
  sizeFitter_TitleText = uiController:FindText("Title"):GetComponent("ContentSizeFitter");
  text_WarningSubTitle = uiController:FindText("SubTitle");
  sizeFitter_SubTitleText = uiController:FindText("SubTitle"):GetComponent("ContentSizeFitter");
  
  scrollContent_FailSlot = uiController:FindScrollContent("ScrollContent_FailSlot");
  scrollContent_FailSlot.onInitialize = this.OnInitialize_ScrollContent_FailSlot;
  scrollContent_FailSlot.onItemChange = this.OnItemChange_ScrollContent_FailSlot;
  scrollContent_FailSlot:Initialize(1);
  
  sizeFitter_ContentBG = uiController:FindImage("Image_ContentBG"):GetComponent("LayoutGroup");
  
  local tempEvent;
  tempEvent = uiController:FindEvent("Image_Checked");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Checked);
  
  gameObject_Warning = uiController:FindGameObject("Warning");
  gameObject_WarningSubTitle = uiController:FindGameObject("SubTitle");
  gameObject_WarningFailSlot = uiController:FindGameObject("WarningFailSlot");
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
end

function UIMarket.OnOpen()
  currentTag = EUIMarketTag.Upload;
  currentCategory = EUIMarketCategory.Soul;
  detailCategory = ESoulDetailCategory.All;
  dropdown_DetailCategory.value = ESoulDetailCategory.All;
  gameObject_Warning:SetActive(false);
  gameObject_GoWebButton:SetActive(LuaHelper.IsStandalone);
  
  if not Market.IsCallFromTutorial() then
    Market.RequireUploadLimit();
  end
  
  this.UpdateUI(true);
  
  return true;
end

function UIMarket.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(23715), this.OnClick_Close, this.OnClick_Help, this.OnClick_Tag, tagDatas, currentTag, 1);
  end
end

function UIMarket.OnClick_Help(checkShow)
  if currentTag == EUIMarketTag.Upload or currentTag == EUIMarketTag.Withdraw then
    if checkShow ~= true then
      UI.Open(UITutorialHint, 61, this);
    end
  else
    return false;
  end
  
  return true;
end

function UIMarket.OnClose()
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
  Market.ChangeCallFromTutorial(false);
  Market.ClearAllTable();
  Market.ClearWithdraw();
  Market.gotWebData = false;
end

function UIMarket.OnClick_Tag(mainTag, subTag)
  if currentTag ~= mainTag then
    currentCategory = EUIMarketCategory.Soul;
    detailCategory = ESoulDetailCategory.All;
    dropdown_DetailCategory.value = ESoulDetailCategory.All;
  end
  
  if currentTag ~= EUIMarketTag.Withdraw and mainTag == EUIMarketTag.Withdraw then
    if not Market.IsCallFromTutorial() then
      Market.RequireWebInfo();
    end
  end
  
  currentTag = mainTag;
  
  this.UpdateUI(true);
  
  return true;
end

function UIMarket.UpdateUI(reset)
  gameObject_Upload:SetActive(currentTag == EUIMarketTag.Upload);
  gameObject_Withdraw:SetActive(currentTag == EUIMarketTag.Withdraw);
  
  this.UpdateUploadUI(reset);
  this.UpdatWithdrawUI(reset);
  this.UpdateCategoryIcon();
end

function UIMarket.UpdateUploadUI(reset)
  if currentTag ~= EUIMarketTag.Upload then return end
  
  gameObject_MarketSlot:SetActive(currentCategory ~= EUIMarketCategory.Warrior);
  gameObject_BackPack:SetActive(currentCategory ~= EUIMarketCategory.Warrior);
  gameObject_Warrior:SetActive(currentCategory == EUIMarketCategory.Warrior);
  
  if currentCategory ~= EUIMarketCategory.Soul and currentCategory ~= EUIMarketCategory.Warrior then
    currentBag = Item.GetBagByFilter(function(itemSave)
      if itemDatas[itemSave.Id] == nil then return false end
      if itemSave.isVender then return false end
      if itemSave.isDeliver then return false end
      if itemSave.isLock then return false end
      if Item.ConditionNFT(itemSave.Id) and this.CheckFitCategory(itemSave) then
        if Market.NeedCheckQuant(itemSave) then
          return true;
        else
          return not Market.CheckInWebSlot(itemSave.Id, itemSave.bagIndex);
        end
      end
      
      return false;
    end);
    
    Market.RemoveZeroQuant(currentBag);
  elseif currentCategory == EUIMarketCategory.Soul then
    currentBag = Item.GetBagByFilter(function(itemSave)
      if itemDatas[itemSave.Id] == nil then return false end
      if itemSave.isLock then return false end
      if itemSave.isMining then return false end
      if Item.ConditionNFT(itemSave.Id) and this.CheckFitCategory(itemSave) then
        return not Market.CheckSoulInWebSlot(itemSave.Id, itemSave.sn);
      end
    end
    , EThingsCategory.None, EThings.Soul);
  elseif currentCategory == EUIMarketCategory.Warrior then
    followWarrior = Market.GetAllFollowWarrior();
  end
  
  uploadSlot = Market.GetUploadBag();
  
  text_Gold.text = Market.GetUploadGold();
  text_MarketCanTradeCount.text = string.format(string.Get(23883), Market.GetCanTradeCount());
  text_WarriorCanTradeCount.text = string.format(string.Get(23883), Market.GetCanTradeCount());
  
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
  local bagPackCount = table.Count(currentBag);
  local canUseCount = Market.webItemLimit;
  local usedCount = this.GetUsedCount();
  
  gameObject_TextMarketSlotSpace:SetActive(Market.gotWebData);
  gameObject_TextWarriorMarketSpace:SetActive(Market.gotWebData);
  text_MarketSlotSpace.text = string.Concat(usedCount, "/", canUseCount);
  text_MarketSlotSpaceInWarrior.text = string.Concat(usedCount, "/", canUseCount);

  if Market.gotWebData then
    text_MarketSlot.text = string.Get(23722);
    text_WarriorMarket.text = string.Get(23722);
  else
    text_MarketSlot.text = string.Get(23751);
    text_WarriorMarket.text = string.Get(23751);
  end
  
  if currentCategory ~= EUIMarketCategory.Warrior then
    if reset then
      if bagPackCount < Market.maxWebItemLimit then
        bagPackCount = Market.maxWebItemLimit;
      else
        bagPackCount = 5 * math.ceil(bagPackCount / 5);
      end
      scrollContent_BackPack:Reset(bagPackCount);
      scrollContent_MarketSlot:Reset(Market.maxWebItemLimit);
    else
      scrollContent_BackPack:Refresh();
      scrollContent_MarketSlot:Refresh();
    end
  else
    if reset then
      scrollContent_WarriorUpload:Reset(Role.maxFollowNpc);
      scrollContent_FollowWarrior:Reset(Role.maxFollowNpc);
    else
      scrollContent_WarriorUpload:Refresh();
      scrollContent_FollowWarrior:Refresh();
    end
  end
end

function UIMarket.UpdatWithdrawUI(reset)
  if currentTag ~= EUIMarketTag.Withdraw then return end
  
  gameObject_WebSlot:SetActive(currentCategory ~= EUIMarketCategory.Warrior);
  gameObject_WarriorInWeb:SetActive(currentCategory == EUIMarketCategory.Warrior);
  
  local useCount = Item.GetBagCount(EThings.Web);
  text_WebSlotSpace.text = string.Concat(useCount, "/", Market.maxWebItemLimit);
  
  text_WithdrawGold.text = Market.GetWebTsGold();
  
  local warriorInWeb = Market.GetWarriorInWeb();
  local warriorCount = table.Count(warriorInWeb);
  if warriorCount < Role.maxFollowNpc then warriorCount = Role.maxFollowNpc end;
  
  if reset then
    scrollContent_WebSlot:Reset(Market.maxWebItemLimit);
    scrollContent_WarriorInWeb:Reset(warriorCount);
  else
    scrollContent_WebSlot:Refresh();
    scrollContent_WarriorInWeb:Refresh();
  end
end

function UIMarket.OnClick_Close()
  UI.Close(UIMarket);
  
  return true;
end

function UIMarket.OnInitialize_ScrollContent_BackPack(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_BackPack[itemIndex] = UIItemController.New(scrollItems[itemIndex]);
  end
end

function UIMarket.OnItemChange_ScrollContent_BackPack(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local itemSave = currentBag[index];
  local itemCount;
  if itemSave ~= nil and itemDatas[itemSave.Id] ~= nil then
    if Market.NeedCheckQuant(itemSave) then
      if Market.CheckInWebSlot(itemSave.Id, itemSave.bagIndex) then
        itemCount = Market.GetItemInWebSlotCount(itemSave.Id, itemSave.bagIndex);
        if (itemSave.quant - itemCount) == 0 then
          itemSave.sort = 0;
          scrollItems_BackPack[itemIndex]:SetItem(itemSave.Id, (itemSave.quant - itemCount), itemSave);
          scrollItems_BackPack[itemIndex]:SetEvent(this.OnClick_BackPackItem, itemSave);
        else
          scrollItems_BackPack[itemIndex]:SetItem(itemSave.Id, (itemSave.quant - itemCount), itemSave);
          scrollItems_BackPack[itemIndex]:SetEvent(this.OnClick_BackPackItem, itemSave);
        end
      else
        scrollItems_BackPack[itemIndex]:SetItem(itemSave.Id, itemSave.quant, itemSave);
        scrollItems_BackPack[itemIndex]:SetEvent(this.OnClick_BackPackItem, itemSave);
      end
    else
      scrollItems_BackPack[itemIndex]:SetItem(itemSave.Id, itemSave.quant, itemSave);
      scrollItems_BackPack[itemIndex]:SetEvent(this.OnClick_BackPackItem, itemSave);
    end
  else
    scrollItems_BackPack[itemIndex]:SetItem(0);
    scrollItems_BackPack[itemIndex]:SetEvent(this.OnClick_BackPackItem);
  end
  
  return true;
end

function UIMarket.OnInitialize_ScrollContent_MarketSlot(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_MarketSlot[itemIndex] = UIItemController.New(scrollItems[itemIndex]);
  end
end

function UIMarket.OnItemChange_ScrollContent_MarketSlot(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local itemSave = uploadSlot[index];
  
  if itemSave ~= nil and itemDatas[itemSave.Id] ~= nil then
    scrollItems_MarketSlot[itemIndex]:SetItem(itemSave.Id, itemSave.quant, itemSave);
    scrollItems_MarketSlot[itemIndex]:SetEvent(this.OnClick_MaketSlotItem, itemSave.uploadIndex);
  else
    scrollItems_MarketSlot[itemIndex]:SetItem(0);
    scrollItems_MarketSlot[itemIndex]:SetEvent(this.OnClick_MaketSlotItem);
  end
  
  return true;
end

function UIMarket.UpdateCategoryIcon()
  imageCategory[EUIMarketCategory.Warrior].sprite = UI.GetSprite("but284D");
  imageCategory[EUIMarketCategory.Card].sprite = UI.GetSprite("but280D");
  imageCategory[EUIMarketCategory.Mount].sprite = UI.GetSprite("but282D");
  imageCategory[EUIMarketCategory.Outfit].sprite = UI.GetSprite("but281D");
  imageCategory[EUIMarketCategory.Furniture].sprite = UI.GetSprite("but283D");
  imageCategory[EUIMarketCategory.Soul].sprite = UI.GetSprite("but278D");
  imageCategory[EUIMarketCategory.MythEquip].sprite = UI.GetSprite("but268D");
  imageCategory[EUIMarketCategory.WarriorScroll].sprite = UI.GetSprite("but279D");
  
  gameObject_DetailCategory:SetActive(currentCategory == EUIMarketCategory.Soul);
  
  if currentCategory == EUIMarketCategory.Warrior then
    imageCategory[EUIMarketCategory.Warrior].sprite = UI.GetSprite("but284L");
  elseif currentCategory == EUIMarketCategory.Card then
    imageCategory[EUIMarketCategory.Card].sprite = UI.GetSprite("but280L");
  elseif currentCategory == EUIMarketCategory.Mount then
    imageCategory[EUIMarketCategory.Mount].sprite = UI.GetSprite("but282L");
  elseif currentCategory == EUIMarketCategory.Outfit then
    imageCategory[EUIMarketCategory.Outfit].sprite = UI.GetSprite("but281L");
  elseif currentCategory == EUIMarketCategory.Furniture then
    imageCategory[EUIMarketCategory.Furniture].sprite = UI.GetSprite("but283L");
  elseif currentCategory == EUIMarketCategory.Soul then
    imageCategory[EUIMarketCategory.Soul].sprite = UI.GetSprite("but278L");
  elseif currentCategory == EUIMarketCategory.MythEquip then
    imageCategory[EUIMarketCategory.MythEquip].sprite = UI.GetSprite("but268L");
  elseif currentCategory == EUIMarketCategory.WarriorScroll then
    imageCategory[EUIMarketCategory.WarriorScroll].sprite = UI.GetSprite("but279L");
  end
end

function UIMarket.CheckFitCategory(itemSave)
  local itemData = itemDatas[itemSave.Id];
  if currentCategory == EUIMarketCategory.MythEquip then
    return itemData.kind == EItemKind.Myth;
  elseif currentCategory == EUIMarketCategory.Soul then --靈魂還要加屬性分類
    if itemData.kind == EItemKind.Soul then
      if detailCategory == ESoulDetailCategory.All then
        return true
      else
        return itemSave.element == detailCategory;
      end
    else
      return false;
    end
  elseif currentCategory == EUIMarketCategory.Outfit then
    return itemData.kind == EItemKind.Item_68
  elseif currentCategory == EUIMarketCategory.Card then
    return itemData.kind == EItemKind.DoroCard
  elseif currentCategory == EUIMarketCategory.Furniture then
    return itemData.kind == EItemKind.Furniture
  elseif currentCategory == EUIMarketCategory.Mount then
    return itemData.kind == EItemKind.SpecialAbility and itemData.specialAbility == EItemUseKind.Mounts
  elseif currentCategory == EUIMarketCategory.WarriorScroll then
    return itemData.kind == EItemKind.SpecialAbility and itemData.specialAbility == EItemUseKind.NpcPicture
  end
  
  return false;
end

function UIMarket.ResetWithdrawCategory()
  withDrawSetCategory = false;
end

function UIMarket.SetWithdrawCategory(eWebMarketKind, itemSave)
  if withDrawSetCategory == true then
    if eWebMarketKind == EWebMarketKind.Soul then
      currentCategory = EUIMarketCategory.Soul
    elseif eWebMarketKind == EWebMarketKind.BagItem then
      local itemData = itemDatas[itemSave.Id];
      if currentCategory == EUIMarketCategory.Soul then
        return;
      elseif itemData.kind == EItemKind.Myth and currentCategory > EUIMarketCategory.MythEquip then
        currentCategory = EUIMarketCategory.MythEquip;
      elseif itemData.kind == EItemKind.Item_68 and currentCategory > EUIMarketCategory.Outfit then
        currentCategory = EUIMarketCategory.Outfit;
      elseif itemData.kind == EItemKind.DoroCard and currentCategory > EUIMarketCategory.Card then
        currentCategory = EUIMarketCategory.Card;
      elseif itemData.kind == EItemKind.Furniture and currentCategory > EUIMarketCategory.Furniture then
        currentCategory = EUIMarketCategory.Furniture;
      elseif itemData.kind == EItemKind.SpecialAbility and itemData.specialAbility == EItemUseKind.Mounts and currentCategory > EUIMarketCategory.Mount then
        currentCategory = EUIMarketCategory.Mount;
      elseif itemData.kind == EItemKind.SpecialAbility and itemData.specialAbility == EItemUseKind.NpcPicture and currentCategory > EUIMarketCategory.WarriorScroll then
        currentCategory = EUIMarketCategory.WarriorScroll;
      end
    elseif eWebMarketKind == EWebMarketKind.Npc and currentCategory == EUIMarketCategory.Soul then
      currentCategory = EUIMarketCategory.Warrior;
    end
  else
    if eWebMarketKind == EWebMarketKind.Soul then
      currentCategory = EUIMarketCategory.Soul
    elseif eWebMarketKind == EWebMarketKind.BagItem then
      local itemData = itemDatas[itemSave.Id];
      if itemData.kind == EItemKind.Myth then
        currentCategory = EUIMarketCategory.MythEquip;
      elseif itemData.kind == EItemKind.Item_68 then
        currentCategory = EUIMarketCategory.Outfit;
      elseif itemData.kind == EItemKind.DoroCard then
        currentCategory = EUIMarketCategory.Card;
      elseif itemData.kind == EItemKind.Furniture then
        currentCategory = EUIMarketCategory.Furniture;
      elseif itemData.kind == EItemKind.SpecialAbility and itemData.specialAbility == EItemUseKind.Mounts then
        currentCategory = EUIMarketCategory.Mount;
      elseif itemData.kind == EItemKind.SpecialAbility and itemData.specialAbility == EItemUseKind.NpcPicture then
        currentCategory = EUIMarketCategory.WarriorScroll;
      end
    elseif eWebMarketKind == EWebMarketKind.Npc then
      currentCategory = EUIMarketCategory.Warrior
    end
  
    withDrawSetCategory = true;
  end
end

function UIMarket.OnClick_Category(uiEvent)
  local index = uiEvent.parameter;
  if currentCategory == index then return end;
  
  currentCategory = index;
  
  this.UpdateUI(true);
end

function UIMarket.OnClick_GoWeb()
  if LuaHelper.CheckDefine("ReleaseTest") then
    Application.OpenURL("https://testtsn-trade.chinesegamer.net/login.aspx");
  elseif LuaHelper.CheckDefine("Release") then
    Application.OpenURL("https://tstrade.chinesegamer.net/index.aspx");
  else
    Application.OpenURL("http://m1-event.chinesegamer.net/tsmmarket/login.aspx");
  end
end

function UIMarket.OnClick_Clear()
  Market.ClearUploadSlots();
  
  this.UpdateUI(true);
end

function UIMarket.OnClick_AddGold()
  if Market.CheckTSGoldUploadReachLimit() then
    ShowCenterMessage(string.Get(23988));
  elseif Role.GetPlayerCurrency(ECurrency.TS) ~= 0 and Market.gotWebData then
    ShowUploadWebTSCoin(string.Get(30023), string.Get(98224), 0, Market.GetTSGoldUploadLimit(), function(text)
      if string.IsNullOrEmpty(text) then return end
      local count = tonumber(text);
      
      Market.SetUploadGold(count);
      this.UpdateUI();
    end);
  else
    ShowCenterMessage(string.Get(20075))
  end
end

function UIMarket.OnClick_Upload()
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end
  
  Market.UploadToWeb();
end

function UIMarket.OnClick_BackPackItem(uiEvent)
  local itemSave = uiEvent.parameter;
  local itemData = itemDatas[itemSave.Id];
  if itemData == nil then return end
  local usedCount = this.GetUsedCount();
  local itemInSlotIndex = Item.GetItemIndex(itemSave.Id, EThings.WebUpload, itemSave.bagIndex);
  local slotItem = Item.GetBagItem(EThings.WebUpload, itemInSlotIndex);
  local slotCount = Item.GetBagCount(EThings.WebUpload);
  local uploadFuc;
  local actQuant;
  if Market.CheckInWebSlot(itemSave.Id, itemSave.bagIndex) then
    actQuant = itemSave.quant - Market.GetItemInWebSlotCount(itemSave.Id, itemSave.bagIndex);
  else
    actQuant = itemSave.quant;
  end
  
  if usedCount >= Market.webItemLimit or not Market.gotWebData then
    if itemData.kind == EItemKind.Soul then
      if not Market.gotWebData then
        uploadFuc = function() ShowCenterMessage(string.Get(23751)) end
      else
        uploadFuc = function() ShowCenterMessage(string.Get(23733)) end
      end
    else
      uploadFuc = nil;
    end
  elseif Market.NeedCheckQuant(itemSave) and actQuant > 1 then --可堆疊物品且多於一個要輸入數量
    uploadFuc = function()
      this.InputUploadQuant(itemSave);
    end;
  elseif Market.NeedCheckQuant(itemSave) then --可堆疊物品要算堆疊數量
    uploadFuc = function()
      if slotItem == nil then
        local item = ThingData.CopyForMarket(itemSave, itemSave.bagIndex);
        Item.SetBagItem(EThings.WebUpload, item.bagIndex, item, false)
      else
        local item = ThingData.CopyForMarket(itemSave, itemSave.bagIndex);
        slotItem.quant = slotItem.quant + actQuant;
        Item.SetBagItem(EThings.WebUpload, itemInSlotIndex, slotItem, false)
      end
      
      UI.Close(UIItemInfo);
      this.UpdateUI(true);
    end;
  else
    uploadFuc = function()
      local item;
      if itemData.kind ~= EItemKind.Soul then
        item = ThingData.CopyForMarket(itemSave, itemSave.bagIndex);
      elseif itemData.kind == EItemKind.Soul then
        item = SoulThing.CopyForMarket(itemSave, itemSave.bagIndex);
      end
      Item.SetBagItem(EThings.WebUpload, slotCount + 1, item, false)
      
      if itemData.kind ~= EItemKind.Soul and UI.IsVisible(UIItemInfo) then
        UI.Close(UIItemInfo);
      elseif itemData.kind == EItemKind.Soul and UI.IsVisible(UISoulInfo) then
        UI.Close(UISoulInfo);
      end
      
      this.UpdateUI(true);
    end;
  end
  
  if itemData.kind == EItemKind.Soul then
    UI.Open(UISoulInfo, itemSave, ESoulAction.Upload, uploadFuc, itemSave.bagIndex);
  else
    UI.Open(UIItemInfo, EThings.Bag, itemSave.bagIndex, nil, string.Get(30023), uploadFuc);
  end
end

function UIMarket.OnClick_MaketSlotItem(uiEvent)
  local actBag = Item.GetBag(EThings.WebUpload);
  local itemSave = actBag[uiEvent.parameter];
  local itemData = itemDatas[itemSave.Id];
  if itemData == nil then return end
  local maketSlotFuc;
  
  if Market.NeedCheckQuant(itemSave) and itemSave.quant > 1 then --可堆疊物品且多於一個要輸入數量
    maketSlotFuc = function()
      this.InputRemoveQuant(uiEvent.parameter);
    end;
  else
    maketSlotFuc = function()
      Item.DelBagItem(EThings.WebUpload, uiEvent.parameter, nil, 0, false)
      
      if itemData.kind ~= EItemKind.Soul and UI.IsVisible(UIItemInfo) then
        UI.Close(UIItemInfo);
      elseif itemData.kind == EItemKind.Soul and UI.IsVisible(UISoulInfo) then
        UI.Close(UISoulInfo);
      end
      
      this.UpdateUI(true);
    end;
  end
  
  if itemData.kind == EItemKind.Soul then
    UI.Open(UISoulInfo, itemSave, ESoulAction.TakeOut, maketSlotFuc, itemSave.bagIndex);
  else
    UI.Open(UIItemInfo, EThings.WebUpload, uiEvent.parameter, nil, string.Get(21413), maketSlotFuc);
  end
end

function UIMarket.OnDropChange_DetailCategory()
  if dropdown_DetailCategory.value < ESoulDetailCategory.Light then
    detailCategory = dropdown_DetailCategory.value;
  elseif dropdown_DetailCategory.value >= ESoulDetailCategory.Light then
    detailCategory = dropdown_DetailCategory.value + 2; --靈魂沒有屬性5, 6
  end
  
  this.UpdateUI();
end

function UIMarket.InputUploadQuant(itemSave)
  local quantMax;
  if Market.CheckInWebSlot(itemSave.Id, itemSave.bagIndex) then
    quantMax = itemSave.quant - Market.GetItemInWebSlotCount(itemSave.Id, itemSave.bagIndex);
  else
    quantMax = itemSave.quant;
  end
  ShowCountInput(string.Get(30023), 1, quantMax,
    function(text)
      if text == nil then return end
      
      local quant = tonumber(text);
      if quant == 0 then quant = 1 end;
      
      local itemInSlotIndex = Item.GetItemIndex(itemSave.Id, EThings.WebUpload, itemSave.bagIndex);
      local slotItem = Item.GetBagItem(EThings.WebUpload, itemInSlotIndex);
      local slotCount = Item.GetBagCount(EThings.WebUpload);
      
      if quant == itemSave.quant and slotItem == nil then
        local item = ThingData.CopyForMarket(itemSave, itemSave.bagIndex);
        Item.SetBagItem(EThings.WebUpload, slotCount + 1, item, false)
      elseif slotItem ~= nil then
        slotItem.quant = slotItem.quant + quant;
        Item.SetBagItem(EThings.WebUpload, itemInSlotIndex, slotItem, false)
      else
        local item = ThingData.CopyForMarket(itemSave, itemSave.bagIndex);
        item.quant = quant;
        Item.SetBagItem(EThings.WebUpload, slotCount + 1, item, false)
      end
      
      if UI.IsVisible(UIItemInfo) then
        UI.Close(UIItemInfo);
      end
      
      this.UpdateUI(true);
    end);
end

function UIMarket.InputRemoveQuant(slotId)
  local actBag = Item.GetBag(EThings.WebUpload);
  local itemSave = actBag[slotId];
  ShowCountInput(string.Get(21413), 1, itemSave.quant,
    function(text)
      if text == nil then return end
      
      local quant = tonumber(text);
      if quant == 0 then quant = 1 end;
      
      local bagItem = Item.GetBagItem(EThings.Bag, itemSave.bagIndex);
      
      if quant == itemSave.quant and bagItem == nil then
        Item.DelBagItem(EThings.WebUpload, slotId, nil, 0, false)
      else
        Item.DelBagItem(EThings.WebUpload, slotId, quant, 0, false)
      end
      
      if UI.IsVisible(UIItemInfo) then
        UI.Close(UIItemInfo);
      end
      
      this.UpdateUI(true);
    end);
end

function UIMarket.GetUsedCount()
  local usedCount = Item.GetBagCount(EThings.WebUpload) + Market.GetWarriorSlotCount();
  return usedCount;
end

--region Withdraw
function UIMarket.OnInitialize_ScrollContent_WebSlot(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_WebSlot[itemIndex] = UIItemController.New(scrollItems[itemIndex]);
  end
end

function UIMarket.OnItemChange_ScrollContent_WebSlot(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local bag = Item.GetBagByFilter(function(itemSave)
    if itemDatas[itemSave.Id] == nil then return false end
    return this.CheckFitCategory(itemSave)
  end
  , EThingsCategory.None, EThings.Web);
  local itemSave = bag[index];
  
  if itemSave ~= nil and itemDatas[itemSave.Id] ~= nil then
    scrollItems_WebSlot[itemIndex]:SetItem(itemSave.Id, itemSave.quant, itemSave);
    scrollItems_WebSlot[itemIndex]:SetEvent(this.OnClick_WebSlotItem, itemSave.bagIndex);
  else
    scrollItems_WebSlot[itemIndex]:SetItem(0);
    scrollItems_WebSlot[itemIndex]:SetEvent(this.OnClick_WebSlotItem);
  end
  
  return true;
end

function UIMarket.OnInitialize_scrollContent_WarriorInWeb(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_WarriorInWeb[itemIndex] = {};
    scrollItems_WarriorInWeb[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_WarriorInWeb[itemIndex].text_Hp = scrollItems[itemIndex]:Find("Text_Hp"):GetComponent("Text");
    scrollItems_WarriorInWeb[itemIndex].text_Lv = scrollItems[itemIndex]:Find("Text_Lv"):GetComponent("Text");
    scrollItems_WarriorInWeb[itemIndex].text_Atk = scrollItems[itemIndex]:Find("Text_Atk"):GetComponent("Text");
    scrollItems_WarriorInWeb[itemIndex].text_Int = scrollItems[itemIndex]:Find("Text_Int"):GetComponent("Text");
    scrollItems_WarriorInWeb[itemIndex].uiCareer = UICareerController.New(scrollItems[itemIndex]:Find("GameObject_Career"));
    scrollItems_WarriorInWeb[itemIndex].image_Empty = scrollItems[itemIndex]:Find("Image_Empty"):GetComponent("Image");
    scrollItems_WarriorInWeb[itemIndex].image_Take = scrollItems[itemIndex]:Find("Image_Take"):GetComponent("Image");
    scrollItems_WarriorInWeb[itemIndex].text_Take = scrollItems_WarriorInWeb[itemIndex].image_Take.transform:Find("Text_"):GetComponent("Text");
    
    scrollItems_WarriorInWeb[itemIndex].event_Take = scrollItems[itemIndex]:Find("Image_Take"):GetComponent("UIEvent");
    scrollItems_WarriorInWeb[itemIndex].event_Take:SetListener(EventTriggerType.PointerClick, this.OnClick_WithdrawWarrior);
  end
end

function UIMarket.OnItemChange_scrollContent_WarriorInWeb(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local warriorInWeb = Market.GetWarriorInWeb();
  
  if warriorInWeb[index] ~= nil then
    scrollItems_WarriorInWeb[itemIndex].text_Name.text = npcDatas[warriorInWeb[index].npcId].name;
    scrollItems_WarriorInWeb[itemIndex].text_Hp.gameObject:SetActive(true);
    scrollItems_WarriorInWeb[itemIndex].text_Hp.text = warriorInWeb[index].hpExpend;
    scrollItems_WarriorInWeb[itemIndex].text_Lv.gameObject:SetActive(true);
    scrollItems_WarriorInWeb[itemIndex].text_Lv.text = warriorInWeb[index].level;
    scrollItems_WarriorInWeb[itemIndex].text_Atk.gameObject:SetActive(true);
    scrollItems_WarriorInWeb[itemIndex].text_Atk.text = warriorInWeb[index].atk;
    scrollItems_WarriorInWeb[itemIndex].text_Int.gameObject:SetActive(true);
    scrollItems_WarriorInWeb[itemIndex].text_Int.text = warriorInWeb[index].int;
    
    local npcData = npcDatas[warriorInWeb[index].npcId];
    if npcData ~= nil then
      scrollItems_WarriorInWeb[itemIndex].uiCareer:SetCareer(npcData.turn, npcData.element, ECareer.None, true);
      scrollItems_WarriorInWeb[itemIndex].image_Empty.enabled = false;
    else
      scrollItems_WarriorInWeb[itemIndex].uiCareer:SetCareer();
      scrollItems_WarriorInWeb[itemIndex].image_Empty.enabled = true;
    end
    scrollItems_WarriorInWeb[itemIndex].image_Take.sprite = UI.GetSprite("but064D");
    scrollItems_WarriorInWeb[itemIndex].text_Take.text = string.Get(30022);
    scrollItems_WarriorInWeb[itemIndex].event_Take.gameObject:SetActive(true);
    scrollItems_WarriorInWeb[itemIndex].event_Take.parameter = warriorInWeb[index];
  else
    scrollItems_WarriorInWeb[itemIndex].text_Name.text = "";
    scrollItems_WarriorInWeb[itemIndex].text_Hp.gameObject:SetActive(false);
    scrollItems_WarriorInWeb[itemIndex].text_Hp.text = "";
    scrollItems_WarriorInWeb[itemIndex].text_Lv.gameObject:SetActive(false);
    scrollItems_WarriorInWeb[itemIndex].text_Lv.text = "";
    scrollItems_WarriorInWeb[itemIndex].text_Atk.gameObject:SetActive(false);
    scrollItems_WarriorInWeb[itemIndex].text_Atk.text = "";
    scrollItems_WarriorInWeb[itemIndex].text_Int.gameObject:SetActive(false);
    scrollItems_WarriorInWeb[itemIndex].text_Int.text = "";
    scrollItems_WarriorInWeb[itemIndex].uiCareer:SetCareer();
    scrollItems_WarriorInWeb[itemIndex].image_Empty.enabled = true;
    scrollItems_WarriorInWeb[itemIndex].event_Take.gameObject:SetActive(false);
    scrollItems_WarriorInWeb[itemIndex].event_Take.parameter = nil;
  end
  
  return true;
end

function UIMarket.OnClick_WebSlotItem(uiEvent)
  local bag = Item.GetBag(EThings.Web);
  local itemSave = bag[uiEvent.parameter];
  local itemData = itemDatas[itemSave.Id];
  local itemSN = itemSave.webSN;
  local withdrawFun = function()
    Market.Withdraw(false, itemSN);
    
    if UI.IsVisible(UIItemInfo) then
      UI.Close(UIItemInfo);
    elseif UI.IsVisible(UISoulInfo) then
      UI.Close(UISoulInfo);
    end
    
    this.UpdateUI(true);
  end
  
  if itemData.kind == EItemKind.Soul then
    UI.Open(UISoulInfo, itemSave, ESoulAction.Preview, withdrawFun, nil);
  else
    UI.Open(UIItemInfo, EThings.Web, uiEvent.parameter, nil, string.Get(21413), withdrawFun);
  end
end

function UIMarket.OnClick_WithdrawAll()
  if Market.CheckWebHaveItem() then
    Market.Withdraw(true);
    
    this.UpdateUI(true);
  end
end

function UIMarket.OnClick_WithdrawWarrior(uiEvent)
  local npcId = uiEvent.parameter.npcId;
  if Market.CheckHaveWarrior(npcId) then
    UIMarket.OpenWarning(string.Get(23725),string.GetColorText(string.Get(23726), Color.Red));
    return;
  end
  
  local webSN = uiEvent.parameter.webSN;
  Market.Withdraw(false, webSN);
  
  this.UpdateUI(true);
end
--endregion

--region WarriorUpload
function UIMarket.OnInitialize_scrollContent_WarriorUpload(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_WarriorUpload[itemIndex] = {};
    scrollItems_WarriorUpload[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_WarriorUpload[itemIndex].text_Hp = scrollItems[itemIndex]:Find("Text_Hp"):GetComponent("Text");
    scrollItems_WarriorUpload[itemIndex].text_Lv = scrollItems[itemIndex]:Find("Text_Lv"):GetComponent("Text");
    scrollItems_WarriorUpload[itemIndex].text_Atk = scrollItems[itemIndex]:Find("Text_Atk"):GetComponent("Text");
    scrollItems_WarriorUpload[itemIndex].text_Int = scrollItems[itemIndex]:Find("Text_Int"):GetComponent("Text");
    scrollItems_WarriorUpload[itemIndex].uiCareer = UICareerController.New(scrollItems[itemIndex]:Find("GameObject_Career"));
    scrollItems_WarriorUpload[itemIndex].image_Empty = scrollItems[itemIndex]:Find("Image_Empty"):GetComponent("Image");
    
    scrollItems_WarriorUpload[itemIndex].image_Take = scrollItems[itemIndex]:Find("Image_Take"):GetComponent("Image");
    scrollItems_WarriorUpload[itemIndex].text_Take = scrollItems_WarriorUpload[itemIndex].image_Take.transform:Find("Text_"):GetComponent("Text");
    
    scrollItems_WarriorUpload[itemIndex].event_Take = scrollItems[itemIndex]:Find("Image_Take"):GetComponent("UIEvent");
    scrollItems_WarriorUpload[itemIndex].event_Take:SetListener(EventTriggerType.PointerClick, this.OnClick_TakeWarrior);
  end
end

function UIMarket.OnItemChange_scrollContent_WarriorUpload(dataIndex, itemIndex)
  local uploadIndex = dataIndex + 1;
  local warriorSlot = Market.GetWarriorSlot();
  
  if warriorSlot[uploadIndex] ~= nil then
    scrollItems_WarriorUpload[itemIndex].text_Name.text = warriorSlot[uploadIndex].name;
    scrollItems_WarriorUpload[itemIndex].text_Hp.gameObject:SetActive(true);
    scrollItems_WarriorUpload[itemIndex].text_Hp.text = warriorSlot[uploadIndex]:GetAttribute(EAttribute.Hp);
    scrollItems_WarriorUpload[itemIndex].text_Lv.gameObject:SetActive(true);
    scrollItems_WarriorUpload[itemIndex].text_Lv.text = warriorSlot[uploadIndex]:GetAttribute(EAttribute.Lv);
    scrollItems_WarriorUpload[itemIndex].text_Atk.gameObject:SetActive(true);
    scrollItems_WarriorUpload[itemIndex].text_Atk.text = warriorSlot[uploadIndex]:GetAttribute(EAttribute.Atk);
    scrollItems_WarriorUpload[itemIndex].text_Int.gameObject:SetActive(true);
    scrollItems_WarriorUpload[itemIndex].text_Int.text = warriorSlot[uploadIndex]:GetAttribute(EAttribute.Int);
    
    local npcData = npcDatas[warriorSlot[uploadIndex].npcId];
    if npcData ~= nil then
      scrollItems_WarriorUpload[itemIndex].uiCareer:SetCareer(npcData.turn, npcData.element, ECareer.None, true);
      scrollItems_WarriorUpload[itemIndex].image_Empty.enabled = false;
    else
      scrollItems_WarriorUpload[itemIndex].uiCareer:SetCareer();
      scrollItems_WarriorUpload[itemIndex].image_Empty.enabled = true;
    end
    
    scrollItems_WarriorUpload[itemIndex].image_Take.sprite = UI.GetSprite("but064D");
    scrollItems_WarriorUpload[itemIndex].text_Take.text = string.Get(30022);
    scrollItems_WarriorUpload[itemIndex].event_Take.gameObject:SetActive(true);
    scrollItems_WarriorUpload[itemIndex].event_Take.parameter = uploadIndex;
  else
    scrollItems_WarriorUpload[itemIndex].text_Name.text = "";
    scrollItems_WarriorUpload[itemIndex].text_Hp.gameObject:SetActive(false);
    scrollItems_WarriorUpload[itemIndex].text_Hp.text = "";
    scrollItems_WarriorUpload[itemIndex].text_Lv.gameObject:SetActive(false);
    scrollItems_WarriorUpload[itemIndex].text_Lv.text = "";
    scrollItems_WarriorUpload[itemIndex].text_Atk.gameObject:SetActive(false);
    scrollItems_WarriorUpload[itemIndex].text_Atk.text = "";
    scrollItems_WarriorUpload[itemIndex].text_Int.gameObject:SetActive(false);
    scrollItems_WarriorUpload[itemIndex].text_Int.text = "";
    scrollItems_WarriorUpload[itemIndex].uiCareer:SetCareer();
    scrollItems_WarriorUpload[itemIndex].image_Empty.enabled = true;
    
    scrollItems_WarriorUpload[itemIndex].event_Take.gameObject:SetActive(false);
    scrollItems_WarriorUpload[itemIndex].event_Take.parameter = nil;
  end
  
  return true;
end

function UIMarket.OnInitialize_scrollContent_FollowWarrior(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_FollowWarrior[itemIndex] = {};
    scrollItems_FollowWarrior[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_FollowWarrior[itemIndex].text_Hp = scrollItems[itemIndex]:Find("Text_Hp"):GetComponent("Text");
    scrollItems_FollowWarrior[itemIndex].text_Lv = scrollItems[itemIndex]:Find("Text_Lv"):GetComponent("Text");
    scrollItems_FollowWarrior[itemIndex].text_Atk = scrollItems[itemIndex]:Find("Text_Atk"):GetComponent("Text");
    scrollItems_FollowWarrior[itemIndex].text_Int = scrollItems[itemIndex]:Find("Text_Int"):GetComponent("Text");
    scrollItems_FollowWarrior[itemIndex].uiCareer = UICareerController.New(scrollItems[itemIndex]:Find("GameObject_Career"));
    scrollItems_FollowWarrior[itemIndex].image_Empty = scrollItems[itemIndex]:Find("Image_Empty"):GetComponent("Image");
    
    scrollItems_FollowWarrior[itemIndex].image_Take = scrollItems[itemIndex]:Find("Image_Take"):GetComponent("Image");
    scrollItems_FollowWarrior[itemIndex].text_Take = scrollItems_FollowWarrior[itemIndex].image_Take.transform:Find("Text_"):GetComponent("Text");
    
    scrollItems_FollowWarrior[itemIndex].event_Take = scrollItems[itemIndex]:Find("Image_Take"):GetComponent("UIEvent");
    scrollItems_FollowWarrior[itemIndex].event_Take:SetListener(EventTriggerType.PointerClick, this.OnClick_UploadWarrior);
  end
end

function UIMarket.OnItemChange_scrollContent_FollowWarrior(dataIndex, itemIndex)
  local followIndex = dataIndex + 1;
  
  if followWarrior[followIndex] ~= nil then
    scrollItems_FollowWarrior[itemIndex].text_Name.text = followWarrior[followIndex].name;
    scrollItems_FollowWarrior[itemIndex].text_Hp.gameObject:SetActive(true);
    scrollItems_FollowWarrior[itemIndex].text_Hp.text = followWarrior[followIndex]:GetAttribute(EAttribute.Hp);
    scrollItems_FollowWarrior[itemIndex].text_Lv.gameObject:SetActive(true);
    scrollItems_FollowWarrior[itemIndex].text_Lv.text = followWarrior[followIndex]:GetAttribute(EAttribute.Lv);
    scrollItems_FollowWarrior[itemIndex].text_Atk.gameObject:SetActive(true);
    scrollItems_FollowWarrior[itemIndex].text_Atk.text = followWarrior[followIndex]:GetAttribute(EAttribute.Atk);
    scrollItems_FollowWarrior[itemIndex].text_Int.gameObject:SetActive(true);
    scrollItems_FollowWarrior[itemIndex].text_Int.text = followWarrior[followIndex]:GetAttribute(EAttribute.Int);
    
    local npcData = npcDatas[followWarrior[followIndex].npcId];
    if npcData ~= nil then
      scrollItems_FollowWarrior[itemIndex].uiCareer:SetCareer(npcData.turn, npcData.element, ECareer.None, true);
      scrollItems_FollowWarrior[itemIndex].image_Empty.enabled = false;
    else
      scrollItems_FollowWarrior[itemIndex].uiCareer:SetCareer();
      scrollItems_FollowWarrior[itemIndex].image_Empty.enabled = true;
    end
    
    scrollItems_FollowWarrior[itemIndex].image_Take.sprite = UI.GetSprite("but064D");
    scrollItems_FollowWarrior[itemIndex].text_Take.text = string.Get(30023);
    local usedCount = this.GetUsedCount();
    if usedCount >= Market.webItemLimit or not Market.gotWebData then
      scrollItems_FollowWarrior[itemIndex].event_Take.gameObject:SetActive(false);
    else
      scrollItems_FollowWarrior[itemIndex].event_Take.gameObject:SetActive(true);
    end
    scrollItems_FollowWarrior[itemIndex].event_Take.parameter = followIndex;
  else
    scrollItems_FollowWarrior[itemIndex].text_Name.text = "";
    scrollItems_FollowWarrior[itemIndex].text_Hp.gameObject:SetActive(false);
    scrollItems_FollowWarrior[itemIndex].text_Hp.text = "";
    scrollItems_FollowWarrior[itemIndex].text_Lv.gameObject:SetActive(false);
    scrollItems_FollowWarrior[itemIndex].text_Lv.text = "";
    scrollItems_FollowWarrior[itemIndex].text_Atk.gameObject:SetActive(false);
    scrollItems_FollowWarrior[itemIndex].text_Atk.text = "";
    scrollItems_FollowWarrior[itemIndex].text_Int.gameObject:SetActive(false);
    scrollItems_FollowWarrior[itemIndex].text_Int.text = "";
    scrollItems_FollowWarrior[itemIndex].uiCareer:SetCareer();
    scrollItems_FollowWarrior[itemIndex].image_Empty.enabled = true;
    
    scrollItems_FollowWarrior[itemIndex].event_Take.gameObject:SetActive(false);
    scrollItems_FollowWarrior[itemIndex].event_Take.parameter = nil;
  end
  
  return true;
end

function UIMarket.OnClick_TakeWarrior(uiEvent)
  local slotIndex = uiEvent.parameter;
  Market.RemoveWarriorInSlot(slotIndex)
  
  this.UpdateUI(true);
end

function UIMarket.OnClick_UploadWarrior(uiEvent)
  local followIndex = uiEvent.parameter;
  Market.UploadWarriorToSlot(followIndex);
  
  this.UpdateUI(true);
end
--endregion

--region Warning
function UIMarket.OnInitialize_ScrollContent_FailSlot(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_FailSlot[itemIndex] = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
  end
end

function UIMarket.OnItemChange_ScrollContent_FailSlot(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local bag = Market.GetFailUploadBag();
  scrollItems_FailSlot[itemIndex].text = string.Concat(bag[index], string.GetColorText(string.Get(23763), Color.Red));
  return true;
end

function UIMarket.OpenWarning(title, subTitle, isFailUpload)
  gameObject_Warning:SetActive(true);
  
  if title ~= nil then
    text_WarningTitle.text = title;
  end
  
  if subTitle ~= nil then
    gameObject_WarningSubTitle:SetActive(true);
    text_WarningSubTitle.text = subTitle;
  else
    gameObject_WarningSubTitle:SetActive(false);
  end
  
  if isFailUpload ~= nil then
    gameObject_WarningFailSlot:SetActive(true);
    scrollContent_FailSlot:Reset(Market.GetFailUploadBagCount());
  else
    gameObject_WarningFailSlot:SetActive(false);
  end
  
  sizeFitter_SubTitleText:SetLayoutVertical();
  sizeFitter_TitleText:SetLayoutVertical();
  sizeFitter_ContentBG:SetLayoutVertical();
end

function UIMarket.OnClick_Checked()
  gameObject_Warning:SetActive(false);
  Market.ClearFailUploadBag();
  
  this.UpdateUI();
end
--endregion
