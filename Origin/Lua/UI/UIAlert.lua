EUIAlertType = {
  Standard = 0,
  Autocorrected = 1,
  IntegerNumber = 2,
  DecimalNumber = 3,
  Alphanumeric = 4,
  Name = 5,
  EmailAddress = 6,
  Password = 7,
  Pin = 8,
  CheckBox = 9,
  ChatChanel = 10
}
          
UIAlert = {};
local this = UIAlert;

this.name = "UIAlert";
this.uiController = nil;

local gameObject_Store;
local gameObject_ToggleLayout;
local gameObject_Submit;
local gameObject_Cancel;
local gameObject_TotalPrice;
local gameObject_SubmitButtomLayout;
local gameObject_SubTitle;

local rectTransform_SmallInput;

local sizeFitter_BG;
local sizeFitter_ContentBG

local image_Currency;
local image_CheckBox;
local image_TotalCurrency;

local text_Hint;
local text_Store;
local text_Price;
local text_TotalPrice;
local text_ToggleHint;
local text_CenterHint;
local text_SubTitle;

local item_StoreItem;

local inputField_Small;
local inputField_Big;

local event_Min;
local event_Max;
local event_Cancel;

local currentKind = EUIAlertType.IntegerNumber;
local currentClickEvent;
local currentHint;
local currentMin = nil;
local currentMax = nil;
local currentPrice = 0;
local bool_CheckBox = false;

local gameObject_Channels = {};

function UIAlert.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;

  gameObject_Store = uiController:FindGameObject("Store");
  gameObject_ToggleLayout = uiController:FindGameObject("ToggleLayout");
  gameObject_Channels[1] = uiController:FindGameObject("Image_Chanel (1)");
  gameObject_Channels[6] = uiController:FindGameObject("Image_Chanel (6)");
  gameObject_Submit = uiController:FindGameObject("Image_Submit");
  gameObject_Cancel = uiController:FindGameObject("Image_Cancel");
  gameObject_TotalPrice = uiController:FindGameObject("TotalPrice");
  gameObject_SubmitButtomLayout = uiController:FindGameObject("SubmitButtomLayout");
  gameObject_SubTitle = uiController:FindGameObject("SubTitle");

  rectTransform_SmallInput = uiController:FindGameObject("SmallInput"):GetComponent("RectTransform");
  
  sizeFitter_BG = uiController:FindImage("Image_BG"):GetComponent("ContentSizeFitter");
  sizeFitter_ContentBG = uiController:FindImage("Image_ContentBG"):GetComponent("ContentSizeFitter"); 

  image_Currency = uiController:FindImage("Image_Currency");
  image_TotalCurrency = uiController:FindImage("Image_TotalCurrency");
  image_CheckBox = uiController:FindImage("Image_CheckBox");

  text_Hint = uiController:FindText("Text_T26_Hint");
  text_Store = uiController:FindText("Text_T26_Store");
  text_Price = uiController:FindText("Text_Price");
  text_TotalPrice = uiController:FindText("Text_T6_TotalPrice");
  text_ToggleHint = uiController:FindText("Text_T26_ToggleHint");
  text_CenterHint = uiController:FindText("Text_T26_CenterHint");
  text_SubTitle = uiController:FindText("Text_SubTitle");

  item_StoreItem = UIItemController.New(uiController:FindGameObject("Image_ItemBG").transform, this.OnClick_Item);

  inputField_Small = uiController:FindInputField("InputField_Small"):GetComponent("UIInputField");
  inputField_Small:AddListener(this.OnChange_Content);

  inputField_Big = uiController:FindInputField("InputField_Big"):GetComponent("UIInputField");
  --inputField_Big:AddListener(this.OnChange_Content);

  local tempEvent;
  tempEvent = uiController:FindEvent("Image_Submit");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Submit);
  
  tempEvent = uiController:FindEvent("Image_Cancel");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Cancel);
  
  tempEvent = uiController:FindEvent("Image_Mask");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);
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
  

  tempEvent = uiController:FindEvent("Image_CheckBox");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClickToogle);

  tempEvent = uiController:FindEvent("Image_Chanel (1)");
  tempEvent.parameter = EChannel.World;
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClickChannel);

  tempEvent = uiController:FindEvent("Image_Chanel (6)");
  tempEvent.parameter = EChannel.Organization;
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClickChannel);

  event_Min = uiController:FindEvent("Image_Min");
  event_Min:SetListener(EventTriggerType.PointerClick, this.OnClick_Min);

  event_Max = uiController:FindEvent("Image_Max");
  event_Max:SetListener(EventTriggerType.PointerClick, this.OnClick_Max);
end

function ShowStoreInput(itemId, quant, currency, price, eventHandler, itemCount)
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  UI.Open(UIAlert, EUIAlertType.IntegerNumber,
    eventHandler,
    string.Get(98224),
    "",
    1,
    quant,
    itemId,
    currency,
    price, 
    nil,
    itemCount
  );
end

function ShowNameInput(hint, eventHandler, maxChinese)
  if maxChinese == nil then
    maxChinese = 7;
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
  
  UI.Open(UIAlert, EUIAlertType.Standard, 
    eventHandler,
    string.format(string.Get(20105), hint),
    "",
    1,
    maxChinese * 2
  );
end

function ShowPlayerInfoInput(hint, eventHandler ,maxChinese)
  if maxChinese == nil then
    maxChinese = 5;
  end

  UI.Open(UIAlert, EUIAlertType.Standard,
          eventHandler,
          hint,
          "",
          1,
          maxChinese * 2
  );
end

function ShowStrInput(str, eventHandler)
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  UI.Open(UIAlert, EUIAlertType.Standard, 
    eventHandler,
    str,
    "",
    1,
    14
  );
end

function ShowCountInput(hint, min, max, eventHandler)
  UI.Open(UIAlert, EUIAlertType.IntegerNumber, 
    eventHandler,
    string.format(string.Get(20106), hint),
    "",
    min,
    max
  );
end

function ShowCheckBoxAlert(mainTitle, subtitle ,eventHandler)
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
  
  
  UI.Open(UIAlert, EUIAlertType.CheckBox, 
    eventHandler,
    mainTitle,
    subtitle
  );
end

function ShowChatChannelList(mainTitle, eventHandler)
  UI.Open(UIAlert, EUIAlertType.ChatChanel, 
  eventHandler,
  mainTitle,
  "", 0, 0, -1, nil, 0, true
  );
  
end

function ShowHouseInfoInput(hint, eventHandler ,maxChinese)
  if maxChinese == nil then
    maxChinese = 12;
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
  
  UI.Open(UIAlert, EUIAlertType.Standard,
    eventHandler,
    hint,
    "",
    1,
    maxChinese * 2
  );
end

function ShowConfirmDeleteAccount(hint, secondhint, eventHandler, cancelFunc)
  UI.Open(UIAlert, EUIAlertType.Standard,
    eventHandler,
    hint,
    "",
    nil, nil, nil, nil, nil, false, nil, secondhint,true, cancelFunc
  );
end

function ShowUploadWebTSCoin(hint, secondhint, min, max, eventHandler)
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  UI.Open(UIAlert, EUIAlertType.IntegerNumber,
    eventHandler,
    hint,
    "",
    min,
    max,
    nil, nil, nil, false, nil, secondhint
  );
end

function UIAlert.OnClickToogle(uiEvent)
  bool_CheckBox = not bool_CheckBox;
  this.UpdateCheckBox();
end

function UIAlert.OnOpen(kind, positiveFunc, mainTitle, toggleTitile, minLimit, maxLimit, itemId, currency, price, channels, itemCount, subTitle, needCancel, cancelFunc)
  currentKind = kind;
  currentClickEvent = positiveFunc;
  currentMin = minLimit;
  currentMax = maxLimit;
  currentPrice = price;
  event_Cancel = cancelFunc;

  inputField_Small.placeholder.text = "";
  inputField_Small.text = "";
  text_TotalPrice.text = 0;

  inputField_Big.gameObject:SetActive(false);
  inputField_Small.gameObject:SetActive(currentKind ~= EUIAlertType.CheckBox and not channels);
  gameObject_ToggleLayout:SetActive(currentKind == EUIAlertType.CheckBox);
  gameObject_Channels[1]:SetActive(channels); 
  gameObject_Channels[6]:SetActive(channels);
  gameObject_Submit:SetActive(not channels);
  gameObject_Cancel:SetActive(needCancel);
  if not channels or needCancel then
    gameObject_SubmitButtomLayout:SetActive(true);
  else
    gameObject_SubmitButtomLayout:SetActive(false);
  end

  rectTransform_SmallInput.sizeDelta = Vector2.New(270, 50);
  event_Min.gameObject:SetActive(false);
  event_Max.gameObject:SetActive(false);

  if currentKind == EUIAlertType.Autocorrected then
    inputField_Small.contentType = InputField.ContentType.Autocorrected;

  elseif currentKind == EUIAlertType.IntegerNumber then
    inputField_Small.contentType = InputField.ContentType.IntegerNumber;

    if currentMin ~= nil and currentMax ~= nil then
      inputField_Small.placeholder.text = string.Concat(currentMin, " ～ ", currentMax);

      rectTransform_SmallInput.sizeDelta = Vector2.New(160, 50);
      event_Min.gameObject:SetActive(true);
      event_Max.gameObject:SetActive(true);
    end

  elseif currentKind == EUIAlertType.DecimalNumber then
    inputField_Small.contentType = InputField.ContentType.DecimalNumber;

  elseif currentKind == EUIAlertType.Alphanumeric then
    inputField_Small.contentType = InputField.ContentType.Alphanumeric;

  elseif currentKind == EUIAlertType.Name then
    inputField_Small.contentType = InputField.ContentType.Name;

    if currentMin ~= nil and currentMax ~= nil then
      inputField_Small.placeholder.text = string.Concat(currentMin, " ～ ", math.floor(currentMax / 2), string.Get(20120));
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


  elseif currentKind == EUIAlertType.EmailAddress then
    inputField_Small.contentType = InputField.ContentType.EmailAddress;

  elseif currentKind == EUIAlertType.Password then
    inputField_Small.contentType = InputField.ContentType.Password;

  elseif currentKind == EUIAlertType.Pin then
    inputField_Small.contentType = InputField.ContentType.Pin;
  
  elseif currentKind == EUIAlertType.CheckBox then
    
  else
    inputField_Small.contentType = InputField.ContentType.Standard;

    if currentMin ~= nil and currentMax ~= nil then
      inputField_Small.placeholder.text = string.Concat(currentMin, " ～ ", math.floor(currentMax / 2), string.Get(20120));
    end
  end
  
  if mainTitle ~= nil then
    if itemDatas[itemId] ~= nil then
      text_Hint.text = mainTitle;
      text_CenterHint.text = "";
    else
      text_Hint.text = "";
      text_CenterHint.text = mainTitle;
    end
  else
    text_Hint.text = "";
    text_CenterHint.text = "";
  end

  if toggleTitile ~= nil then
    text_ToggleHint.text = toggleTitile;
  else
    text_ToggleHint.text = "";
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
  
  
  
  if subTitle ~= nil then
    gameObject_SubTitle:SetActive(true);
    text_SubTitle.text = subTitle;
  else
    gameObject_SubTitle:SetActive(false);
    text_SubTitle.text = "";
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

  if itemDatas[itemId] ~= nil then
    gameObject_Store:SetActive(true);
    gameObject_TotalPrice:SetActive(true);

    if itemCount == nil then itemCount = 1 end
    item_StoreItem:SetItem(itemId, itemCount);

    if price > 0 then
      text_Store.text = string.Get(20070);
    elseif price < 0 then
      text_Store.text = string.Get(40430);
    else
      text_Store.text = string.Get(98025);
    end

    image_Currency.sprite = UI.GetCurrencySprite(currency);
    image_TotalCurrency.sprite = image_Currency.sprite;
    text_Price.text = math.abs(price);
  else
    gameObject_Store:SetActive(false);
    gameObject_TotalPrice:SetActive(false);
  end

  sizeFitter_ContentBG:SetLayoutVertical();
  sizeFitter_BG:SetLayoutVertical();

  return true;
end

function UIAlert.OnChange_Content(text)
  if string.IsNullOrEmpty(text) then return end

  if currentKind == EUIAlertType.Autocorrected then
  elseif currentKind == EUIAlertType.IntegerNumber then
    if currentMin ~= nil and tonumber(text) < currentMin then
      inputField_Small.text = tostring(currentMin);
      if currentMin ~= nil and currentPrice ~= nil then
        text_TotalPrice.text = tostring(math.abs(currentMin * currentPrice));
      end
    elseif currentMax ~= nil and tonumber(text) > currentMax then
      inputField_Small.text = tostring(currentMax);
      if currentMax ~= nil and currentPrice ~= nil then
        text_TotalPrice.text = tostring(math.abs(currentMax * currentPrice));
      end
    else
      if currentPrice ~= nil then
        text_TotalPrice.text  = math.abs(tonumber(text) * tonumber(currentPrice));
      end
    end

  elseif currentKind == EUIAlertType.DecimalNumber then
  elseif currentKind == EUIAlertType.Alphanumeric then
  elseif currentKind == EUIAlertType.Name then
    if currentMax ~= nil and currentMax > 0 then
      local convertedString = LuaHelper.StringToBytes(DataManager.encoding_Big5, inputField_Small.text);

      if string.len(convertedString) > currentMax then
        convertedString = string.sub(convertedString, 1, currentMax);
        inputField_Small.text = LuaHelper.BytesToString(DataManager.encoding_Big5, convertedString);
      end
    end
    
  elseif currentKind == EUIAlertType.EmailAddress then
  elseif currentKind == EUIAlertType.Password then
  elseif currentKind == EUIAlertType.Pin then
  else
    if currentMax ~= nil and currentMax > 0 then
      local convertedString = LuaHelper.StringToBytes(DataManager.encoding_Big5, inputField_Small.text);

      if string.len(convertedString) > currentMax then
        convertedString = string.sub(convertedString, 1, currentMax);
        inputField_Small.text = LuaHelper.BytesToString(DataManager.encoding_Big5, convertedString);
      end
    end
  end
end

function UIAlert.OnClick_Close()
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
  
  
  if currentClickEvent ~= nil then
    currentClickEvent(nil);
  end

  UI.Close(UIAlert);
end

function UIAlert.OnClick_Submit()
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
  
  
  if currentClickEvent ~= nil then
    if currentKind == EUIAlertType.IntegerNumber and string.IsNullOrEmpty(inputField_Small.text) and currentMin ~= nil then
      currentClickEvent(tostring(currentMin));
    elseif currentKind == EUIAlertType.CheckBox then
      currentClickEvent(bool_CheckBox);
    else
      currentClickEvent(inputField_Small.text);
    end
  end

  UI.Close(UIAlert);
end

function UIAlert.OnClickChannel(uiEvent)
  if currentClickEvent ~= nil then
    currentClickEvent(uiEvent);
  end
  UI.Close(UIAlert);
end

function UIAlert.UpdateCheckBox()
  image_CheckBox.sprite = UI.GetCheckBoxSprite(bool_CheckBox);
end

function UIAlert.OnClick_Min()
  inputField_Small.text = currentMin;
end

function UIAlert.OnClick_Max()
  inputField_Small.text = currentMax;
end

function UIAlert.OnClick_Item(uiEvent)
  return;
end

function UIAlert.OnClick_Cancel()
  if event_Cancel ~= nil then
    event_Cancel(uiEvent);
  end
  UI.Close(UIAlert);
end