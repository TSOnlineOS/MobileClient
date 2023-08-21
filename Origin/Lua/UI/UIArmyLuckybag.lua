UIArmyLuckybag = {}
local this = UIArmyLuckybag;

this.name = "UIArmyLuckybag";
this.uiController = nil;

local gameObject_NoLuckybag;

local rawImage_Character;
local rawImage_NoLuckybag;
local rawImage_Cloud;
local image_BgGradientColor;

local scrollContent_ArmyLuckybag;
local scrollItems_ArmyLuckybag = {};

local pageItemIndex;
local bagData;
local min;
local max;

local uiState; --1.AymyLuckyBag 2.ServerLuckybag
local helpEvent;

function UIArmyLuckybag.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;

  gameObject_NoLuckybag = uiController:FindGameObject("GameObject_NoLuckybag");

  rawImage_Character = uiController:FindRawImage("RawImage_Character"):GetComponent("RawImage");
  rawImage_NoLuckybag = uiController:FindRawImage("RawImage_NoLuckybag"):GetComponent("RawImage");
  rawImage_Cloud = uiController:FindRawImage("RawImage_Cloud"):GetComponent("RawImage");
  image_BgGradientColor = uiController:FindGameObject("Image_BG"):GetComponent("GradientColor");

  scrollContent_ArmyLuckybag = uiController:FindScrollContent("ScrollContent_ArmyLuckybag");
  scrollContent_ArmyLuckybag.onInitialize = this.OnInitialize_ScrollContent_ArmyLuckybag;
  scrollContent_ArmyLuckybag.onItemChange = this.OnItemChange_ScrollContent_ArmyLuckybag;
  scrollContent_ArmyLuckybag:Initialize(1);
  
  local tempEvent;

  tempEvent = uiController:FindEvent("Image_Close");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);

  helpEvent = uiController:FindEvent("Image_Help");
  helpEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Help);
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

function UIArmyLuckybag.OnInitialize_ScrollContent_ArmyLuckybag(scrollItems) 
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_ArmyLuckybag[itemIndex] = {};
    scrollItems_ArmyLuckybag[itemIndex].eventLuckybag = scrollItems[itemIndex]:Find("Image_Luckybag"):GetComponent("UIEvent");
    scrollItems_ArmyLuckybag[itemIndex].eventLuckybag:SetListener(EventTriggerType.PointerClick, this.OnClick_Luckybag); 
    scrollItems_ArmyLuckybag[itemIndex].eventGetLuckybag = scrollItems[itemIndex]:Find("Image_Exchange"):GetComponent("UIEvent");
    scrollItems_ArmyLuckybag[itemIndex].eventGetLuckybag:SetListener(EventTriggerType.PointerClick, this.OnClick_GetLuckybag);
    scrollItems_ArmyLuckybag[itemIndex].eventplayerInfo = scrollItems[itemIndex]:Find("Image_ShowInfo"):GetComponent("UIEvent");
    scrollItems_ArmyLuckybag[itemIndex].eventplayerInfo:SetListener(EventTriggerType.PointerClick, this.OnClick_ShowInfo);
    scrollItems_ArmyLuckybag[itemIndex].rawImage = scrollItems[itemIndex]:Find("Image_Luckybag"):GetComponent("RawImage");
    scrollItems_ArmyLuckybag[itemIndex].name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_ArmyLuckybag[itemIndex].time = scrollItems[itemIndex]:Find("Text_Time"):GetComponent("Text");
    scrollItems_ArmyLuckybag[itemIndex].btnImage = scrollItems[itemIndex]:Find("Image_Exchange"):GetComponent("UIRawImage");
    scrollItems_ArmyLuckybag[itemIndex].btnText = scrollItems[itemIndex]:Find("Text_Exchange"):GetComponent("Text");
    scrollItems_ArmyLuckybag[itemIndex].itemNameText = scrollItems[itemIndex]:Find("Text_ItemName"):GetComponent("Text");
  end
end

function UIArmyLuckybag.OnItemChange_ScrollContent_ArmyLuckybag(dataIndex, itemIndex)
  pageItemIndex = dataIndex + 1;
  bagData = ArmyLuckyBag.GetLuckyBagDataByShowDataIdx(pageItemIndex);
  if bagData == nil then return false end

  scrollItems_ArmyLuckybag[itemIndex].name.text = bagData.name;
  scrollItems_ArmyLuckybag[itemIndex].time.text = string.Concat( string.Get(80098), string.GetSecondSymbol( math.ceil( (bagData.time - CGTimer.serverTime).TotalSeconds ) ) );

  if bagData.prizeKind == 0 then
    scrollItems_ArmyLuckybag[itemIndex].itemNameText.text = itemDatas[bagData.itemId]:GetName(false, false, true);
  elseif (bagData.prizeKind == 2) or (bagData.prizeKind == 3) then
    local luckyBagData = luckyBagDatas[bagData.itemId];
    scrollItems_ArmyLuckybag[itemIndex].itemNameText.text = luckyBagData:GetName();
  end

  --判斷領取顯示
  if (bagData.count <= 0) or (bagData.kind == 1) then
    --不能領
    TextureManager.SetPng(ETextureUseType.UI, "common0_icon120",  scrollItems_ArmyLuckybag[itemIndex].btnImage);
    scrollItems_ArmyLuckybag[itemIndex].btnImage:StopShiftUV();
    scrollItems_ArmyLuckybag[itemIndex].btnImage.uvRect = Rect.New(0,0,1,1);
    scrollItems_ArmyLuckybag[itemIndex].btnImage.rectTransform.sizeDelta = Vector2.New(120, scrollItems_ArmyLuckybag[itemIndex].btnImage.rectTransform.sizeDelta.y);
    if bagData.count <= 0 then
      scrollItems_ArmyLuckybag[itemIndex].btnText.text = string.Get(23205);
    elseif bagData.kind == 1 then
      scrollItems_ArmyLuckybag[itemIndex].btnText.text = string.Get(20901);
    end
    scrollItems_ArmyLuckybag[itemIndex].btnText.rectTransform.localPosition = Vector3.New(253, -18, 0);
  else
    --能領
    if bagData.LuckBagKind == 1 then
      --舊軍團紅包
      TextureManager.SetPng(ETextureUseType.UI, "common0_icon117",  scrollItems_ArmyLuckybag[itemIndex].btnImage);
      scrollItems_ArmyLuckybag[itemIndex].btnText.text = string.Get(23202);
    elseif bagData.LuckBagKind == 2 then
      --新紅包
      if bagData.target == 1 then
        --伺服器紅包
        TextureManager.SetPng(ETextureUseType.UI, "common0_icon118",  scrollItems_ArmyLuckybag[itemIndex].btnImage);
        scrollItems_ArmyLuckybag[itemIndex].btnText.text  = string.Get(23203);
      elseif  bagData.target == 2 then
        --新軍團紅包
        TextureManager.SetPng(ETextureUseType.UI, "common0_icon117",  scrollItems_ArmyLuckybag[itemIndex].btnImage);
        scrollItems_ArmyLuckybag[itemIndex].btnText.text = string.Get(23202);
      end
    end
    scrollItems_ArmyLuckybag[itemIndex].btnText.rectTransform.localPosition = Vector3.New(263, -15, 0);
    scrollItems_ArmyLuckybag[itemIndex].btnImage.rectTransform.sizeDelta = Vector2.New(72, scrollItems_ArmyLuckybag[itemIndex].btnImage.rectTransform.sizeDelta.y);
    scrollItems_ArmyLuckybag[itemIndex].btnImage:ShiftUV(1, 6, 0.16, -1);
  end

  --伺服器紅包判斷發送人顯示按鈕
  if bagData.LuckBagKind == 2 then
    if Role.playerId == bagData.UID then
      scrollItems_ArmyLuckybag[itemIndex].eventplayerInfo.gameObject:SetActive(false);
      scrollItems_ArmyLuckybag[itemIndex].btnImage.gameObject:SetActive(false);
      scrollItems_ArmyLuckybag[itemIndex].btnText.gameObject:SetActive(false);
    else
      scrollItems_ArmyLuckybag[itemIndex].eventplayerInfo.gameObject:SetActive(true);
      scrollItems_ArmyLuckybag[itemIndex].btnImage.gameObject:SetActive(true);
      scrollItems_ArmyLuckybag[itemIndex].btnText.gameObject:SetActive(true);
    end
  elseif bagData.LuckBagKind == 1 then
    scrollItems_ArmyLuckybag[itemIndex].eventplayerInfo.gameObject:SetActive(true);
    scrollItems_ArmyLuckybag[itemIndex].btnImage.gameObject:SetActive(true);
    scrollItems_ArmyLuckybag[itemIndex].btnText.gameObject:SetActive(true);
  end

  TextureManager.SetPng(ETextureUseType.UI, "common0_icon119",  scrollItems_ArmyLuckybag[itemIndex].rawImage);
  scrollItems_ArmyLuckybag[itemIndex].eventLuckybag.parameter = pageItemIndex;
  scrollItems_ArmyLuckybag[itemIndex].eventGetLuckybag.parameter = pageItemIndex;
  scrollItems_ArmyLuckybag[itemIndex].eventplayerInfo.parameter = pageItemIndex;
  return true;
end

function UIArmyLuckybag.OnOpen(uiKind)
  --開介面時先去要一次Sever時間校正
  Network.Send(1, 16);
  uiState = uiKind;
  this.UpdateUI();
  CGTimer.AddListener(this.RefreshBagList, 2, true);
  ArmyLuckyBag.SetUIState(uiKind);
  if uiState == 1 then
    helpEvent.gameObject:SetActive(true);
    RedDot.Remove(ERedDot.ArmyLuckyBag);
  elseif uiState == 2 then
    helpEvent.gameObject:SetActive(false);
    RedDot.Remove(ERedDot.ServerLuckyBag);
  end

--更新福袋顯示
  ArmyLuckyBag.ResetShowData(false, uiState);
  scrollContent_ArmyLuckybag:Refresh(ArmyLuckyBag.GetLuckyBagCount());
  gameObject_NoLuckybag:SetActive( ArmyLuckyBag.GetLuckyBagCount() <= 0 );
  return true;
end

function UIArmyLuckybag.OnClose()
  CGTimer.RemoveListener(this.RefreshBagList);
  ArmyLuckyBag.SetUIState(0);
  return true;
end

function UIArmyLuckybag.UpdateUI()
  TextureManager.SetPng(ETextureUseType.UI, "common0_bod102", rawImage_Cloud);
  TextureManager.SetPng(ETextureUseType.UI, "common0_icon120", rawImage_NoLuckybag);
  TextureManager.SetPng(ETextureUseType.UI, "common0_bod144", rawImage_Character);
  rawImage_Character.gameObject:GetComponent("RectTransform").sizeDelta = Vector3.New(380, 554);
  rawImage_Character.gameObject:GetComponent("RectTransform").localPosition = Vector2.New(-270, 32);
  
  image_BgGradientColor.enabled = true;
  image_BgGradientColor.colorTop = LuaHelper.GetColor(223, 231, 235, 255);
  image_BgGradientColor.colorBottom = LuaHelper.GetColor(235, 165, 154, 255);
  
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

function UIArmyLuckybag.ResetBagList()
  scrollContent_ArmyLuckybag:Reset( ArmyLuckyBag.GetLuckyBagCount() );
  gameObject_NoLuckybag:SetActive( ArmyLuckyBag.GetLuckyBagCount() <= 0 );
end

function UIArmyLuckybag.RefreshBagList()
  if ArmyLuckyBag.CheckTimeIsEnd() then
    ArmyLuckyBag.ResetShowData(true, uiState);
  end
  scrollContent_ArmyLuckybag:Refresh(ArmyLuckyBag.GetLuckyBagCount());
  --this.ResetBagList();
end

function UIArmyLuckybag.OnClick_Close()
  
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
  UI.Close(this);

  return true;
end

function UIArmyLuckybag.OnClick_Help()
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
  UI.Open(UITutorialHint, 51, this);
end

function UIArmyLuckybag.OnClick_Luckybag(uiEvent)
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
  local index = uiEvent.parameter;

  local data = ArmyLuckyBag.GetLuckyBagDataByShowDataIdx(uiEvent.parameter)
  ShowCenterMessage( string.format( string.Get(22894), data.count) );
end

function UIArmyLuckybag.OnClick_GetLuckybag(uiEvent)
  local index = uiEvent.parameter;
  local temp = ArmyLuckyBag.GetLuckyBagDataByShowDataIdx(index);
  if ArmyLuckyBag.GetLuckyBagKind(index) == 1 then
    ArmyLuckyBag.SendGetLuckybag(temp.index);
  elseif ArmyLuckyBag.GetLuckyBagKind(index) == 2 then
    ArmyLuckyBag.SendGetServerLuckybag(temp.index);
  end
end

function UIArmyLuckybag.OnClick_ShowInfo(uiEvent)
  local index = uiEvent.parameter;
  ArmyLuckyBag.ShowPlayerInfo(index);
end