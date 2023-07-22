
UIHouseEditor = {}
local this = UIHouseEditor;

this.name = "UIHouseEditor";
this.uiController = nil;

--Common
local transform_FurnitureKind;
local transform_Switch;

local event_ShowEditorUI;
local event_Search;
local image_AutoGenerate;
local inputField_Name;
local transform_InputFieldName;
local inputFieldOriginalWidth;
local scrollItem_FurnituresOriginalWidth;
local furnitureKindOriginalX;
local furnitureKindGroupTotalWidth;

--MainKind
local image_FurnishingMainKind;
local image_DecorateMainKind;
local event_FurnishingMainKind;
local event_DecorateMainKind;

--FirstSubKind
local transform_FirstSubKind;
local transform_ScrollFirstSubKind;
local scrollContent_FirstSubKind;
local scrollItems_FirstSubKind = {};

--SecondSubKind
local transform_SecondSubKind;
local transform_ScrollSecondSubKind;
local scrollContent_SecondSubKind;
local scrollItems_SecondSubKind = {};

--Furnitures
local transform_Furnitures;
local transform_ScrollFurnitures;

local furnituresOriginalY;
local furnituresOriginalHeight;
local scrollContent_Furnitures;
local scrollItems_Furnitures = {};

--螢幕操作
local touches = {};
local mouseScrollSensitivity = 10;
local image_Mask;
local event_Panel;

local panelStartPosition = Vector2.zero;

local cameraOriginalPosition;
local cameraMaxSize = 400;
local cameraMinSize = 250;
local cameraSize;
local cameraPosition;

local touchOld1 = Vector2.zero;
local touchOld2 = Vector2.zero;
local touchNew1 = Vector2.zero;
local touchNew2 = Vector2.zero;
local zoomTouchSensitivity = 1;
local minTouchMoveValue = 45;

--FurnitureInfo
local gameObject_FurnitureInfo;
local transform_FurnitureInfo;
local furnitureInfoOriginalX;
local furnitureInfoOriginalY;
local furnitureInfoWidth;
local transform_FurnitureImage;
local image_FurnitureInfo;
local transform_ImageFurnitureInfo;
local jmpDrawer_FurnitureInfo;
local event_Gacha;
local image_Gacha;
local text_Gacha;
local text_NameInfo;
local text_DecorateScoreInfo;
local text_OccupyInfo;
local text_KindInfo;

--Score
local transform_Score;
local scoreOriginalX;
local scoreOriginalY;
local text_ScoreInfo;

--FurnitureAmountLimit
local text_FurnitureAmountLimit;

local current_MainKind;
local current_FirstSubKind;
local current_SecondSubKind;
local current_Furniture;
local showEditorUI = true;
local autoGenerate = false;
local goGaCha = false;
local current_Name = "";

local firstSubKindDatas = {};
local secondSubKindDatas = {};
local furnituresDatas = {};

local onClickString = "L";
local notOnClickString = "D";

function UIHouseEditor.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;

  image_Mask = uiController:FindImage("Image_Mask");
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
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

  event_Panel = uiController:FindEvent("Image_Mask");
  event_Panel:SetPassEvent(EventTriggerType.PointerClick);
  event_Panel:SetListener(EventTriggerType.PointerDown, this.OnPress_Panel);
  event_Panel:SetListener(EventTriggerType.PointerUp, this.OnRelease_Panel);

  --common
  transform_FurnitureKind = uiController:FindGameObject("FurnitureKind"):GetComponent("RectTransform");
  furnitureKindOriginalX = transform_FurnitureKind.anchoredPosition.x;
  transform_Switch = uiController:FindGameObject("Image_Switch"):GetComponent("RectTransform");

  image_FurnishingMainKind = uiController:FindImage("Image_FurnishingMainKind");
  image_DecorateMainKind = uiController:FindImage("Image_DecorateMainKind");

  event_FurnishingMainKind = uiController:FindEvent("Image_FurnishingMainKind");
  event_FurnishingMainKind:SetListener(EventTriggerType.PointerClick, this.OnClick_FurnishingMainKind);

  event_DecorateMainKind = uiController:FindEvent("Image_DecorateMainKind");
  event_DecorateMainKind:SetListener(EventTriggerType.PointerClick, this.OnClick_DecorateMainKind);

  event_ShowEditorUI = uiController:FindEvent("Image_Switch");
  event_ShowEditorUI:SetListener(EventTriggerType.PointerClick, this.OnClick_ShowEditorUI);

  local tempEvent;
  tempEvent = uiController:FindEvent("Image_CloseEditorMode");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_CloseEditorMode);

  event_Search = uiController:FindEvent("Image_Search");
  event_Search:SetListener(EventTriggerType.PointerClick, this.OnClick_Search);
  event_Search.parameter = true;

  tempEvent = uiController:FindEvent("Image_ReceiveAll");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ReceiveAll);

  tempEvent = uiController:FindEvent("Image_Photo");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Photo);

  image_AutoGenerate = uiController:FindImage("Image_AutoGenerate");
  tempEvent = uiController:FindEvent("Image_AutoGenerate");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_AutoGenerate);

  --FirstSubKind
  transform_FirstSubKind = uiController:FindGameObject("ScrollRect_FirstSubKind"):GetComponent("RectTransform");
  transform_ScrollFirstSubKind = uiController:FindGameObject("ScrollContent_FirstSubKind"):GetComponent("RectTransform");
  furnitureKindGroupTotalWidth = transform_FirstSubKind.anchoredPosition.x + transform_FirstSubKind.rect.width;

  scrollContent_FirstSubKind = uiController:FindScrollContent("ScrollContent_FirstSubKind");
  scrollContent_FirstSubKind.onInitialize = this.OnInitialize_ScrollContent_FirstSubKind;
  scrollContent_FirstSubKind.onItemChange = this.OnItemChange_ScrollContent_FirstSubKind;
  scrollContent_FirstSubKind:Initialize(1);

  --SecondSubKind
  transform_SecondSubKind = uiController:FindGameObject("ScrollRect_SecondSubKind"):GetComponent("RectTransform");
  transform_ScrollSecondSubKind = uiController:FindGameObject("ScrollContent_SecondSubKind"):GetComponent("RectTransform");

  scrollContent_SecondSubKind = uiController:FindScrollContent("ScrollContent_SecondSubKind");
  scrollContent_SecondSubKind.onInitialize = this.OnInitialize_ScrollContent_SecondSubKind;
  scrollContent_SecondSubKind.onItemChange = this.OnItemChange_ScrollContent_SecondSubKind;
  scrollContent_SecondSubKind:Initialize(1);

  --Furnitures
  transform_Furnitures = uiController:FindGameObject("Furnitures"):GetComponent("RectTransform");
  transform_ScrollFurnitures = uiController:FindGameObject("ScrollContent_Furnitures"):GetComponent("RectTransform");

  furnituresOriginalY = transform_Furnitures.anchoredPosition.y;
  furnituresOriginalHeight = transform_Furnitures.rect.height;

  scrollContent_Furnitures = uiController:FindScrollContent("ScrollContent_Furnitures");
  scrollContent_Furnitures.onInitialize = this.OnInitialize_ScrollContent_Furnitures;
  scrollContent_Furnitures.onItemChange = this.OnItemChange_ScrollContent_Furnitures;
  scrollContent_Furnitures:Initialize(1);

  scrollItem_FurnituresOriginalWidth = scrollContent_Furnitures.gameObject.transform:Find("ScrollItem"):GetComponent("RectTransform").rect.width;

  --FurnitureInfo
  gameObject_FurnitureInfo = uiController:FindGameObject("FurnitureInfo");
  transform_FurnitureInfo = gameObject_FurnitureInfo:GetComponent("RectTransform");
  furnitureInfoOriginalX = transform_FurnitureInfo.anchoredPosition.x;
  furnitureInfoOriginalY = transform_FurnitureInfo.anchoredPosition.y;
  furnitureInfoWidth = transform_FurnitureInfo.rect.width
  transform_FurnitureImage = uiController:FindGameObject("FurnitureImage"):GetComponent("RectTransform");

  image_FurnitureInfo = uiController:FindRawImage("Image_FurnitureInfo");
  image_FurnitureInfo.enabled = true;
  image_FurnitureInfo.raycastTarget = true;

  transform_ImageFurnitureInfo = image_FurnitureInfo:GetComponent("RectTransform")

  jmpDrawer_FurnitureInfo = uiController:FindGameObject("Image_FurnitureInfo"):GetComponent(typeof(JmpDrawer));
  jmpDrawer_FurnitureInfo.enabled = false;
  jmpDrawer_FurnitureInfo.luaListener = function()
    jmpDrawer_FurnitureInfo:Draw(0, 0);
    image_FurnitureInfo:SetNativeSize();
    this.SetTextureTransform(transform_ImageFurnitureInfo, transform_FurnitureImage.rect.width);
  end

  image_Gacha = uiController:FindImage("Image_Gacha");
  event_Gacha = uiController:FindEvent("Image_Gacha");
  event_Gacha:SetListener(EventTriggerType.PointerClick, this.OnClick_GaCha);
  event_Gacha.parameter = true;
  text_Gacha = uiController:FindText("Text_Gacha");
  text_NameInfo = uiController:FindText("Text_NameInfo");
  text_DecorateScoreInfo = uiController:FindText("Text_DecorateScoreInfo");
  text_OccupyInfo = uiController:FindText("Text_OccupyInfo");
  text_KindInfo = uiController:FindText("Text_KindInfo");
  
  --Score
  transform_Score = uiController:FindGameObject("Score"):GetComponent("RectTransform");
  scoreOriginalX = transform_Score.anchoredPosition.x;
  scoreOriginalY = transform_Score.anchoredPosition.y;
  text_ScoreInfo = uiController:FindText("Text_ScoreInfo");

  inputField_Name = uiController:FindInputField("InputField_Name");
  inputField_Name:AddListener(this.OnInputValueChanged);
  transform_InputFieldName = inputField_Name:GetComponent("RectTransform");
  inputFieldOriginalWidth = transform_InputFieldName.rect.width;

  --FurnitureAmountLimit
  text_FurnitureAmountLimit = uiController:FindText("Text_FurnitureAmountLimit");
end

function UIHouseEditor.OnOpen()
  if not HouseManager.IsInHouse() then return false end
  cameraSize = Scene.CameraDefaultSize;
  cameraOriginalPosition = Scene.cameraPosition:Clone();
  gameObject_FurnitureInfo:SetActive(false);
  this.ShowFurnitureInfoUIAnimation(false);
  this.SetMainKind(EHouseEditorMainKind.FurnishingKind);
  this.Initialize_InputFieldName();
  FurnitureManager.UpdateFurnituresScoreOnScene();
  FurnitureManager.UpdateFurnituresAmountOnScene();
  goGaCha = false;
  return true
end

function UIHouseEditor.OnClose()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
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
  local cameraCurrentOriginalPosition = Vector2.New(cameraOriginalPosition.x, cameraOriginalPosition.y + Scene.playerOffsetY);
  Scene.UpdateCamera(cameraCurrentOriginalPosition);
  Scene.SetCameraSize(Scene.CameraDefaultSize);
  WarriorInHouse.CheckScore();
  current_MainKind = nil;
  current_FirstSubKind = nil;
  current_SecondSubKind = nil;
  current_Furniture = nil;
end

function UIHouseEditor.ExitScene()
  this.OnDestroy_ScrollContent_SecondSubKind();
  this.OnDestroy_ScrollContent_Furnitures();
end

--region PanelControl
function UIHouseEditor.OnPress_Panel(uiEvent)
  panelStartPosition = ConvertPositionToUIScene(this.uiController.transform, uiEvent.eventData.position, this.uiController.canvas.worldCamera);
  cameraPosition = Scene.cameraPosition:Clone();
  touches[uiEvent.eventData.pointerId] = uiEvent.eventData.position;

  if table.Count(touches) == 1 then
    if not CGTimer.ContainsListener(this.OnDrag_Panel) then
      CGTimer.AddListener(this.OnDrag_Panel, 0, true);
      CGTimer.RemoveListener(this.OnZoom_DoubleTouch);
    end
  elseif (Input.touchCount > 1) then
    if not CGTimer.ContainsListener(this.OnZoom_DoubleTouch) then
      CGTimer.AddListener(this.OnZoom_DoubleTouch, 0, true);
      CGTimer.RemoveListener(this.OnDrag_Panel);
    end
  end
end

function UIHouseEditor.OnDrag_Panel()
  local touchPosition = ConvertPositionToUIScene(this.uiController.transform, Input.mousePosition, this.uiController.canvas.worldCamera);
  local distance = panelStartPosition - touchPosition;
  local position = Vector2.New(cameraPosition.x+distance.x, cameraPosition.y - distance.y + Scene.playerOffsetY);
  Scene.UpdateCamera(position);
end

function UIHouseEditor.OnRelease_Panel(uiEvent)
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
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
  touches[uiEvent.eventData.pointerId] = nil;
  CGTimer.RemoveListener(this.OnDrag_Panel);
  CGTimer.RemoveListener(this.OnZoom_DoubleTouch);
  touchOld1 = Vector2.zero;
  touchOld2 = Vector2.zero;
  touchNew1 = Vector2.zero;
  touchNew2 = Vector2.zero;
end

function UIHouseEditor.Update()
  if Input.mouseScrollDelta.y ~= 0 then
    local zoomValue = Input.mouseScrollDelta.y * mouseScrollSensitivity;
    this.OnZoom_Panel(zoomValue);
  end
end

function UIHouseEditor.OnZoom_Panel(zoomValue)
  cameraSize = cameraSize - zoomValue;

  if cameraSize > cameraMaxSize then
    cameraSize = cameraMaxSize;
  elseif cameraSize < cameraMinSize then
    cameraSize = cameraMinSize;
  end

  Scene.SetCameraSize(cameraSize);
  Scene.UpdateCamera(Vector2.New(Scene.cameraPosition.x, Scene.cameraPosition.y + Scene.playerOffsetY));

  if UI.IsVisible(UIFurnitureInteractive) then
    UIFurnitureInteractive.UpdateUIPosition();
  end
end

function UIHouseEditor.OnZoom_DoubleTouch()
  touchNew1 = Input.GetTouch(0).position;
  touchNew2 = Input.GetTouch(1).position;
  local zoomOld = touchOld2 - touchOld1;
  local zoomNew = touchNew2 - touchNew1;
  local change = zoomNew - zoomOld;

  if change.magnitude > minTouchMoveValue then
    local magnitudeDiff = zoomNew.magnitude - zoomOld.magnitude;
    touchOld1 = touchNew1:Clone();
    touchOld2 = touchNew2:Clone();

    if zoomOld == Vector2.zero then return end
    this.OnZoom_Panel(magnitudeDiff / zoomTouchSensitivity);
  end
end
--endregion

function UIHouseEditor.OnInitialize_ScrollContent_FirstSubKind(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_FirstSubKind[itemIndex] = {};
    scrollItems_FirstSubKind[itemIndex].event_OnClick = scrollItems[itemIndex]:GetComponent("UIEvent");
    scrollItems_FirstSubKind[itemIndex].event_OnClick:SetListener(EventTriggerType.PointerClick, this.OnClick_FirstSubKind);
    scrollItems_FirstSubKind[itemIndex].text = scrollItems[itemIndex]:Find("Text"):GetComponent("Text");
    scrollItems_FirstSubKind[itemIndex].textOutline = scrollItems[itemIndex]:Find("Text"):GetComponent("Outline8");
  end
end

function UIHouseEditor.OnItemChange_ScrollContent_FirstSubKind(dataIndex, itemIndex)
  local firstSubKindId = firstSubKindDatas[dataIndex + 1];
  local stringId = 23459;
  scrollItems_FirstSubKind[itemIndex].event_OnClick.parameter = firstSubKindId;

  if scrollItems_FirstSubKind[itemIndex].event_OnClick.parameter == current_FirstSubKind then
    scrollItems_FirstSubKind[itemIndex].text.color = Color.White;
    scrollItems_FirstSubKind[itemIndex].textOutline.enabled = true;
  else
    scrollItems_FirstSubKind[itemIndex].text.color = Color.HouseGrayBlue;
    scrollItems_FirstSubKind[itemIndex].textOutline.enabled = false;
  end

  if current_MainKind == EHouseEditorMainKind.FurnishingKind then
    if firstSubKindId == EFurnishingSubKind.Series then
      stringId = 23461;
    elseif firstSubKindId == EFurnishingSubKind.FurnitureKind then
      stringId = 23459;
    elseif firstSubKindId == EFurnishingSubKind.OrnamentKind then
      stringId = 23460;
    end
  elseif current_MainKind == EHouseEditorMainKind.DecorateKind then
    if firstSubKindId == EDecorateSubKind.DecorateKind then
      stringId = 23615;
    end
  end

  scrollItems_FirstSubKind[itemIndex].text.text = string.Get(stringId);
  return true
end

function UIHouseEditor.OnInitialize_ScrollContent_SecondSubKind(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_SecondSubKind[itemIndex] = {};
    scrollItems_SecondSubKind[itemIndex].image_BG = scrollItems[itemIndex]:Find("Image_BG"):GetComponent("Image");
    scrollItems_SecondSubKind[itemIndex].event_OnClick = scrollItems[itemIndex]:GetComponent("UIEvent");
    scrollItems_SecondSubKind[itemIndex].event_OnClick:SetListener(EventTriggerType.PointerClick, this.OnClick_SecondSubKind);
  end
end

function UIHouseEditor.OnItemChange_ScrollContent_SecondSubKind(dataIndex, itemIndex)
  local secondSubKindId = secondSubKindDatas[dataIndex + 1].Id;

  scrollItems_SecondSubKind[itemIndex].event_OnClick.parameter = secondSubKindId;
  scrollItems_SecondSubKind[itemIndex].pictureName = secondSubKindDatas[dataIndex + 1].pictureName;

  if scrollItems_SecondSubKind[itemIndex].event_OnClick.parameter == current_SecondSubKind then
    scrollItems_SecondSubKind[itemIndex].image_BG.sprite = UI.GetSprite(string.Concat(scrollItems_SecondSubKind[itemIndex].pictureName, onClickString))
  else
    scrollItems_SecondSubKind[itemIndex].image_BG.sprite = UI.GetSprite(string.Concat(scrollItems_SecondSubKind[itemIndex].pictureName, notOnClickString))
  end

  return true
end

function UIHouseEditor.OnDestroy_ScrollContent_SecondSubKind()
  for k, v in pairs(scrollItems_SecondSubKind) do
    if v.jmpDrawer_Body ~= nil then
      v.jmpDrawer_Body:Disable();
    end
  end
end

function UIHouseEditor.OnInitialize_ScrollContent_Furnitures(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Furnitures[itemIndex] = {};
    scrollItems_Furnitures[itemIndex].image_BG = scrollItems[itemIndex]:Find("Image_BG"):GetComponent("Image");
    scrollItems_Furnitures[itemIndex].image_Select = scrollItems[itemIndex]:Find("Image_Select"):GetComponent("RawImage");
    scrollItems_Furnitures[itemIndex].image_Furniture = scrollItems[itemIndex]:Find("Image_Furniture"):GetComponent("RawImage");
    scrollItems_Furnitures[itemIndex].transform_ImageFurniture = scrollItems[itemIndex]:Find("Image_Furniture"):GetComponent("RectTransform");
    scrollItems_Furnitures[itemIndex].jmpDrawer_Body = scrollItems[itemIndex]:Find("Image_Furniture"):GetComponent(typeof(JmpDrawer));
    scrollItems_Furnitures[itemIndex].jmpDrawer_Body.enabled = false;
    scrollItems_Furnitures[itemIndex].jmpDrawer_Body.luaListener = function()
      scrollItems_Furnitures[itemIndex].jmpDrawer_Body:Draw(0, 0);
      this.SetTextureTransform(scrollItems_Furnitures[itemIndex].transform_ImageFurniture, scrollItem_FurnituresOriginalWidth);
    end
    scrollItems_Furnitures[itemIndex].event_OnClick = scrollItems[itemIndex]:GetComponent("UIEvent");
    scrollItems_Furnitures[itemIndex].event_OnClick:SetListener(EventTriggerType.PointerClick, this.OnClick_Furnitures);

    scrollItems_Furnitures[itemIndex].amountText = scrollItems[itemIndex]:Find("Text"):GetComponent("Text");
  end
end

function UIHouseEditor.OnItemChange_ScrollContent_Furnitures(dataIndex, itemIndex)
  local furnitureKindId = furnituresDatas[dataIndex + 1].Id;
  local furnitureAmount = FurnitureManager.GetFurnitureAmount(furnitureKindId);

  scrollItems_Furnitures[itemIndex].event_OnClick.parameter = furnitureKindId;

  if scrollItems_Furnitures[itemIndex].jmpDrawer_Body ~= nil then
    scrollItems_Furnitures[itemIndex].jmpDrawer_Body:GenerateAndDraw(npcDatas[furnitureKindId]:GetAtlasParams());
  end

  if furnitureAmount > 0 then
    scrollItems_Furnitures[itemIndex].image_Furniture.color = Color.White;
    scrollItems_Furnitures[itemIndex].image_BG.sprite = UI.GetSprite("bod023");
    scrollItems_Furnitures[itemIndex].amountText.text = furnitureAmount;
  else
    scrollItems_Furnitures[itemIndex].image_Furniture.color = Color.Gray;
    scrollItems_Furnitures[itemIndex].image_BG.sprite = UI.GetSprite("bod159");
    scrollItems_Furnitures[itemIndex].amountText.text = furnitureAmount;
  end

  if scrollItems_Furnitures[itemIndex].event_OnClick.parameter == current_Furniture then
    scrollItems_Furnitures[itemIndex].image_Select.enabled = true;
  else
    scrollItems_Furnitures[itemIndex].image_Select.enabled = false;
  end

  return true
end

function UIHouseEditor.OnDestroy_ScrollContent_Furnitures()
  for k, v in pairs(scrollItems_Furnitures) do
    if v.jmpDrawer_Body ~= nil then
      v.jmpDrawer_Body:Disable();
    end
  end
end

function UIHouseEditor.UpdateFirstSubKind()
  local tempTable = {};
  table.Clear(firstSubKindDatas);

  if current_MainKind == EHouseEditorMainKind.DecorateKind then
    tempTable = EDecorateSubKind;
  elseif current_MainKind == EHouseEditorMainKind.FurnishingKind then
    tempTable = EFurnishingSubKind;
  end

  for k, v in pairs(tempTable) do
    table.insert(firstSubKindDatas, v);
  end

  transform_ScrollFirstSubKind.anchoredPosition = Vector3.zero;
  scrollContent_FirstSubKind:Refresh(table.Count(firstSubKindDatas));
  this.SetFirstSubKind(scrollItems_FirstSubKind[0].event_OnClick.parameter);
end

function UIHouseEditor.UpdateSecondSubKind()
  table.Clear(secondSubKindDatas);

  for k, v in pairs(furnitureKindDatas) do
    if table.Contains(v.mainKinds, current_MainKind) then
      if table.Contains(v.furnishingSubKinds, current_FirstSubKind) or table.Contains(v.decorateSubKinds, current_FirstSubKind) then
        table.insert(secondSubKindDatas, v);
      end
    end
  end

  transform_ScrollSecondSubKind.anchoredPosition = Vector3.zero;
  scrollContent_SecondSubKind:Refresh(table.Count(secondSubKindDatas));
  this.SetSecondSubKind(scrollItems_SecondSubKind[0].event_OnClick.parameter);
end

function UIHouseEditor.UpdateFurnitures()
  table.Clear(furnituresDatas);

  for k, v in pairs(furnitureDatas) do
    if this.ConditionOfUpdateFurnitures(v) then
      table.insert(furnituresDatas, v);
    end
  end

  this.SortFurnituresTable(furnituresDatas);
  transform_ScrollFurnitures.anchoredPosition = Vector3.zero;
  scrollContent_Furnitures:Refresh(table.Count(furnituresDatas));
end

function UIHouseEditor.UpdateFurnituresByCurrentSecondSubKind()
  this.UpdateFurnitures();
end

function UIHouseEditor.OnClick_FurnishingMainKind()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
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
  this.SetMainKind(EHouseEditorMainKind.FurnishingKind);
  this.CloseInputFieldName();
end

function UIHouseEditor.OnClick_DecorateMainKind()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
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
  this.SetMainKind(EHouseEditorMainKind.DecorateKind);
  this.CloseInputFieldName();
end

function UIHouseEditor.OnClick_FirstSubKind(uiEvent)
  this.SetFirstSubKind(uiEvent.parameter);
  this.CloseInputFieldName();
end

function UIHouseEditor.OnClick_SecondSubKind(uiEvent)
  this.SetSecondSubKind(uiEvent.parameter);
  this.CloseInputFieldName();
end

function UIHouseEditor.OnClick_Furnitures(uiEvent)
  local id = uiEvent.parameter;
  current_Furniture = id;

  this.GenerateFurniture(id);
  this.UpdateFurnitureInfo(id);

  for k, v in pairs(scrollItems_Furnitures) do
    if v.event_OnClick.parameter == current_Furniture then
      v.image_Select.enabled = true;
    else
      v.image_Select.enabled = false;
    end
  end
end

function UIHouseEditor.GenerateFurniture(id)
  if FurnitureManager.GetFurnitureAmount(id) > 0 and FurnitureManager.CanPlaceFurniture(id) then
    FurnitureManager.CreateFurniture(id, true);
    FurnitureManager.AddFurnitureAmount(id, -1);
    this.ShowEditorUI(false);
  else
    this.ShowEditorUI(true);
    this.ShowFurnitureInfoUIAnimation(true);
  end
end

function UIHouseEditor.OnClick_ShowEditorUI()
  local showUI = not showEditorUI;
  this.ShowEditorUI(showUI);
  this.ShowFurnitureInfoUIAnimation(showUI);
end

function UIHouseEditor.OnClick_CloseEditorMode()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
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
  FurnitureManager.SendFurnitureData();
end

function UIHouseEditor.OnClick_Search(uiEvent)
  if uiEvent.parameter then
    LuaHelper.DoTweenAnchoredPosition(transform_InputFieldName, Vector2.zero, 0.5);
    event_Search.parameter = false;
  else
    this.CloseInputFieldName();
  end
end

function UIHouseEditor.OnClick_ReceiveAll()
  ShowCheckMessage(
          function(result)
            if result then
              FurnitureManager.ReceiveAllFurnituresOnScene();
              HouseEditorManager.UpdateAllBlockState();
            end
          end,
          string.Concat(string.Get(23541), "\n" ,"(" ,string.Get(23618), ")")
  );
end

function UIHouseEditor.OnClick_Photo()
  logError("UIHouseEditor.Photo");
end

function UIHouseEditor.OnClick_AutoGenerate()
  autoGenerate = not autoGenerate;
  if autoGenerate then
    image_AutoGenerate.sprite = UI.GetSprite("but258L");
  else
    image_AutoGenerate.sprite = UI.GetSprite("but258D");
  end
end

function UIHouseEditor.OnClick_GaCha(uiEvent)
  if uiEvent.parameter then
    this.OnClick_CloseEditorMode();
    goGaCha = true;
  end
end

function UIHouseEditor.IsGoGaCha()
  return goGaCha;
end

function UIHouseEditor.SetMainKind(mainKind)
  if current_MainKind == mainKind then return end
  current_MainKind = mainKind;

  this.UpdateUIMainKindTexture();
  FurnitureManager.SetFurnitureTransParent(current_MainKind);
  this.UpdateFirstSubKind();
end

function UIHouseEditor.SetFirstSubKind(firstSubKind)
  current_FirstSubKind = firstSubKind;

  this.UpdateScrollItemFirstSubKindUI();
  this.UpdateSecondSubKind();
end

function UIHouseEditor.SetSecondSubKind(SecondSubKind)
  current_SecondSubKind = SecondSubKind;

  this.UpdateScrollItemSecondSubKindUI();
  this.UpdateFurnitures();
end

function UIHouseEditor.UpdateUIMainKindTexture()
  local furnishingString = onClickString;
  local decorateString = onClickString;

  if current_MainKind == EHouseEditorMainKind.FurnishingKind then
    decorateString = notOnClickString;
  elseif current_MainKind == EHouseEditorMainKind.DecorateKind then
    furnishingString = notOnClickString;
  end

  image_FurnishingMainKind.sprite = UI.GetSprite(string.Concat("but246", furnishingString));
  image_DecorateMainKind.sprite = UI.GetSprite(string.Concat("but247", decorateString));
end

function UIHouseEditor.UpdateScrollItemFirstSubKindUI()
  for k, v in pairs(scrollItems_FirstSubKind) do
    if v.event_OnClick.parameter == current_FirstSubKind then
      v.text.color = Color.White;
      v.textOutline.enabled = true;
    else
      v.text.color = Color.HouseGrayBlue;
      v.textOutline.enabled = false;
    end
  end
end

function UIHouseEditor.UpdateScrollItemSecondSubKindUI()
  for k, v in pairs(scrollItems_SecondSubKind) do
    if v.event_OnClick.parameter ~= nil then
      if v.event_OnClick.parameter == current_SecondSubKind then
        v.image_BG.sprite = UI.GetSprite(string.Concat(v.pictureName, onClickString));
      else
        v.image_BG.sprite = UI.GetSprite(string.Concat(v.pictureName, notOnClickString));
      end
    end
  end
end

function UIHouseEditor.UpdateFurnitureInfo(Id)
  if furnitureDatas[Id] == nil then return end

  local furnitureData = furnitureDatas[Id];
  local furnitureName = npcDatas[Id]:GetName();
  local kindName;
  local typeName;

  for k, v in pairs(furnitureKindDatas) do
    if v.Id == furnitureData.kind then
      kindName = v.kindName;
    end

    if v.Id == furnitureData.seriesNumber and furnitureData.seriesNumber ~= 0 then
      furnitureName = string.Concat(v.kindName, "\n", furnitureName);
      break;
    end
  end

  if furnitureData.type == EFurnitureType.Ground then
    typeName = string.Get(23467);
  elseif furnitureData.type == EFurnitureType.Wall then
    typeName = string.Get(23468);
  end

  if jmpDrawer_FurnitureInfo ~= nil then
    jmpDrawer_FurnitureInfo:GenerateAndDraw(npcDatas[Id]:GetAtlasParams());
  end

  if furnitureData.limited == 1 then
    image_Gacha.color = LuaHelper.GetColor(255, 0, 0, 200);
    event_Gacha.parameter = false;
    text_Gacha.text = string.Get(23622);
  elseif furnitureData.level == 5 then
    event_Gacha.parameter = false;
    text_Gacha.text = "NFT商品";
  else
    image_Gacha.color = Color.White;
    event_Gacha.parameter = true;
    text_Gacha.text = string.Concat(string.Get(99712), string.Get(21647));
  end

  text_NameInfo.text = furnitureName;
  text_DecorateScoreInfo.text = string.Concat(string.Get(23462), ": ", furnitureData.decorateScore);
  text_OccupyInfo.text = string.Concat(string.Get(23463), ": ", furnitureData.occupyBlockX, "x", furnitureData.occupyBlockY);
  text_KindInfo.text = string.Concat(string.Get(23464), ": ", kindName);
  gameObject_FurnitureInfo:SetActive(true);
end

function UIHouseEditor.UpdateScoreInfo()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
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
  local text_decorateScore = string.Get(23466);
  text_ScoreInfo.text = string.Concat(text_decorateScore, ": ", HouseManager.GetCurrentFloorScore());
end

function UIHouseEditor.UpdateAmountInfo()
  local tempText = string.Concat(string.Get(23558),"：");
  tempText = string.Concat(tempText, FurnitureManager.attributes[EFurnitureAttribute.FurnituresWithoutDecorateOnScene], "/", HouseEditorManager.maxAmountOfFurnitureOnScene);
  text_FurnitureAmountLimit.text = tempText;
end

--將圖片依比例縮放至方框裡
function UIHouseEditor.SetTextureTransform(imageTransform, maxSize)
  local width = imageTransform.rect.width;
  local height = imageTransform.rect.height;
  local left = 0;
  local right = 0;
  local top = 0;
  local bottom = 0;

  if width >= height then
    top = (maxSize - (height / width) * maxSize) / 2;
    bottom = (maxSize - (height / width) * maxSize) / 2;
  elseif height >= width then
    left = (maxSize - (width / height) * maxSize) / 2;
    right = (maxSize - (width / height) * maxSize) / 2;
  end

  imageTransform.anchorMin = Vector2.zero;
  imageTransform.anchorMax = Vector2.one;
  imageTransform.pivot = Vector2.New(0.5, 0.5);
  imageTransform.offsetMin = Vector2.New(left, bottom);
  imageTransform.offsetMax = Vector2.New(-right, -top);
end

function UIHouseEditor.ShowEditorUIAnimation()
  if showEditorUI then
    --初始位置
    transform_Switch.localScale = Vector3.New(-1, 1, 1);
    LuaHelper.DoTweenAnchoredPosition(transform_FurnitureKind, Vector2.New(furnitureKindOriginalX, transform_FurnitureKind.offsetMax.y), 0.5);
    LuaHelper.DoTweenAnchoredPosition(transform_Furnitures, Vector2.New(transform_Furnitures.offsetMin.x, furnituresOriginalY), 0.5);
    LuaHelper.DoTweenAnchoredPosition(transform_Score, Vector2.New(scoreOriginalX, scoreOriginalY), 0.5);
  else
    --移動到的位置
    transform_Switch.localScale = Vector3.one;
    LuaHelper.DoTweenAnchoredPosition(transform_FurnitureKind, Vector2.New(-furnitureKindGroupTotalWidth, transform_FurnitureKind.offsetMax.y), 0.5);
    LuaHelper.DoTweenAnchoredPosition(transform_Furnitures, Vector2.New(transform_Furnitures.offsetMin.x, -(furnituresOriginalY + furnituresOriginalHeight)), 0.5);
    LuaHelper.DoTweenAnchoredPosition(transform_Score, Vector2.New(scoreOriginalX - furnitureKindGroupTotalWidth, scoreOriginalY), 0.5);
  end
end

function UIHouseEditor.ShowFurnitureInfoUIAnimation(show)
  if show then
    LuaHelper.DoTweenAnchoredPosition(transform_FurnitureInfo, Vector2.New(furnitureInfoOriginalX, furnitureInfoOriginalY), 0.5);
  else
    LuaHelper.DoTweenAnchoredPosition(transform_FurnitureInfo, Vector2.New(furnitureInfoWidth - furnitureInfoOriginalX, furnitureInfoOriginalY), 0.5);
  end
end

function UIHouseEditor.ShowEditorUI(isShow)
  showEditorUI = isShow;
  this.ShowEditorUIAnimation();
end

function UIHouseEditor.OnInputValueChanged()
  current_Name = inputField_Name.text;
  this.SearchFurniture();
end

function UIHouseEditor.Initialize_InputFieldName()
  transform_InputFieldName.anchoredPosition = Vector2.New(200, 0);
  this.CloseInputFieldName();
end

function UIHouseEditor.CloseInputFieldName()
  current_Name = "";
  inputField_Name.text = "";
  LuaHelper.DoTweenAnchoredPosition(transform_InputFieldName, Vector2.New(inputFieldOriginalWidth, 0), 0.5);
  event_Search.parameter = true;
  FurnitureManager.SetFurnitureTransParent(current_MainKind);
end

function UIHouseEditor.SearchFurniture()
  FurnitureManager.SetFurnitureTransParentByName(current_Name);
  this.UpdateFurnitures();
end

function UIHouseEditor.SortFurnituresTable(furnituresDatasTable)
  --品質 > 分數 > Id
  if table.Count(furnituresDatasTable) < 2 then return end
  table.sort(furnituresDatasTable, function(a, b)
    if FurnitureManager.GetFurnitureLevel(a.Id) ~= FurnitureManager.GetFurnitureLevel(b.Id) then
      return FurnitureManager.GetFurnitureLevel(a.Id) > FurnitureManager.GetFurnitureLevel(b.Id);
    elseif a.decorateScore ~= b.decorateScore then
      return a.decorateScore > b.decorateScore;
    else
      return a.Id > b.Id;
    end
  end);
end

function UIHouseEditor.ConditionOfUpdateFurnitures(furnitureData)
  if furnitureData == nil then return end

  if current_Name ~= "" then
    if string.find(npcDatas[furnitureData.Id]:GetName(), current_Name) ~= nil then
      return true;
    end
  elseif furnitureData.kind == current_SecondSubKind then
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
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
    return true;
  elseif current_SecondSubKind ~= 0 and furnitureData.seriesNumber == current_SecondSubKind then
    return true;
  elseif current_SecondSubKind == 0 and FurnitureManager.GetFurnitureAmount(furnitureData.Id) > 0 then
    --FirstSubKind裡，所有擁有的家具
    local tempSecondSubKindDatas = {};

    for k, v in pairs(furnitureKindDatas) do
      if table.Contains(v.mainKinds, current_MainKind) then
        if table.Contains(v.furnishingSubKinds, current_FirstSubKind) or table.Contains(v.decorateSubKinds, current_FirstSubKind) then
          table.insert(tempSecondSubKindDatas, v.Id);
        end
      end
    end

    if table.Contains(tempSecondSubKindDatas, furnitureData.kind) then
      return true;
    end

    if furnitureData.seriesNumber ~= 0 and table.Contains(tempSecondSubKindDatas, furnitureData.seriesNumber) then
      return true;
    end
  end

  return false;
end

function UIHouseEditor.IsAutoGenerate()
  return autoGenerate;
end

function UIHouseEditor.GetCurrentFurnitureID()
  return current_Furniture;
end