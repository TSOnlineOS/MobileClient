UICityScramble = {}
local this = UICityScramble;

this.name = "UICityScramble";
this.uiController = nil;

CityScrambleInfoSprite = { 
  [1] = {"common0_icon108","common0_icon109","common0_icon107"};
  [2] = {"common0_icon115","common0_icon116","common0_icon114"};
  [3] = {"common0_icon112","common0_icon113","common0_icon110"};
  [4] = {"common0_icon106"};
}

local CITYSCARMBLEINDEX = 85;
local ONEPAGEITEM = 3;
local CITYSCRAMBLEAMOUNT = 37;
local CITYSCRAMBLETURN = 1;
local CITYSCRAMBLELV = 120;
local PIEWEDGEAMOUNT = 3;

local fractionItems = {};
local cityItems = {};
local fractionOccupied = {};
local feverTimes = {};
local grounds = {};
local neightbor = {};

local gameObject_SingleCity;
local gameObject_MultiCity;
local gameObject_FeverTime;
local gameObject_OccupiedEffect;
local transform_Ground;
local gameObject_DetailObject;
local image_DetailPanel;
local image_Stake;
local rawImage_BackTexture;
local rawImage_FeverTime;
local image_Pie;

local text_ActivityTimer;
local text_StakeNum;
local text_ChallengeRightNum;
local text_PlayerFraction;
local text_PersonalNum;
local text_CityName;
local text_CityFraction;
local text_Detail;

local event_Close;
local event_Help;
local event_Pie;
local event_PlaceStake;
local event_Return;
local event_Panel;
local event_StakeDetail;
local event_DetailMask;

local chooseCityID=0;
local priorCityID=0;
local cityTime;
local votableNum=0;
local cityOriginalFraction;
local challengeRightNum=0;
local pieShow = false;
local feverIdx = 1;
local playerFraction = 0;

local infoItems;
local infoImage;
local infoWarningObject;
local infoPlaceStakeObject;
local infoFractionObject;
local infoFractionVotes = {};
local infoFractionStakes;
local infoPrizeObject;
local infoPrizeItem = {};

local HEXSIZE = 4;
local gridHeight = 11;
local gridWidth = 17;
local hexHeight = 126;
local hexWidth = 112;
local gap = 0;
local startX = 0;
local startY = 0;
local gridIndex = 1;
local hexIndex = 1;
local hexGrid = {};

local sizeFitter_BG;
local sizeFitter_ContentBG;

local panelStartPosition = Vector2.zero;
local moveDirection = Vector2.zero;

local zoomValue = 0;
local zoomMagnitude = 0.1;
local zoomTouchValue = 500.0;
local currentScale = 0;
local zoomMax = 2.0;
local zoomMin = 0.7;
local newSize = 1.0;

local minTouchMoveValue = 45.0;
local dragMagnitude = 150.0;

local touchs = {};
local touchOld1 = Vector2.zero;
local touchOld2 = Vector2.zero;
local touchNew1 = Vector2.zero;
local touchNew2 = Vector2.zero;

local moveMin;
local moveMax;

local multiPos;
local screenW;
local screenH;

local isOpen = false;

function UICityScramble.Initialize(go)
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  this.uiController.onVisible = this.OnVisible;

  this.InitializePage(uiController);
end

function UICityScramble.InitializePage(uiController)
  -- 城鎮查看物件
  gameObject_SingleCity = uiController:FindGameObject("SingleCityItem");
  gameObject_MultiCity = uiController:FindImage("MultiCityItem");
  image_Pie = uiController:FindImage("Image_Pie");
  gameObject_FeverTime = uiController:FindGameObject("Image_FeverTime");
  transform_Ground = uiController:FindGameObject("GroundObject").transform;
  gameObject_OccupiedEffect = uiController:FindGameObject("Image_OccupiedEffect");
  gameObject_DetailObject = uiController:FindGameObject("DetailPanel");
  image_DetailPanel = uiController:FindImage("DetailPanel");
  image_Stake = uiController:FindImage("Image_Stake");
  
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  
  -- 初始化介面字串
  text_ActivityTimer = uiController:FindText("Text_ActivityTime");
  text_StakeNum = uiController:FindText("Text_StakeNum");
  text_ChallengeRightNum = uiController:FindText("Text_ChallengeRightNum");
  text_PlayerFraction = uiController:FindText("Text_PlayerFraction");
  text_PersonalNum = uiController:FindText("Text_PersonalNum");
  text_CityName = uiController:FindText("Text_CityName");
  text_CityFraction = uiController:FindText("Text_CityFraction");
  text_Detail = image_DetailPanel.transform:Find("Text_Detail"):GetComponent("Text");

  rawImage_BackTexture = uiController:FindRawImage("Image_BackTexture");
  TextureManager.SetPng(ETextureUseType.UI, "common0_com075", rawImage_BackTexture);
  rawImage_FeverTime = uiController:FindRawImage("Image_FeverTime");
  TextureManager.SetPng(ETextureUseType.UI, "common0_icon101", rawImage_FeverTime);

  rawImage_FeverTime.rectTransform.sizeDelta = Vector2.New(rawImage_FeverTime.texture.width, rawImage_FeverTime.texture.height/5);
  rawImage_FeverTime:ShiftUV(1, 5, 0.1, -1);
  rawImage_FeverTime.enabled = true


  -- 3個陣營佔領數量
  local fractionTransform = uiController:FindGameObject("Image_FractionBG").transform;
  fractionItems = {};
  fractionItems.fractionObject = {};
  fractionItems.fractionNum = {};
  for i = 1, ONEPAGEITEM do
    fractionItems[i] = fractionTransform:Find(string.format("FractionItem (%d)", i));
    fractionItems.fractionObject[i] = fractionItems[i].gameObject;
    fractionItems.fractionNum[i] = fractionItems[i]:Find("Text_FractionNum"):GetComponent("Text");
  end

  this.LoadGround();

  --中央六角形佔領狀況
  cityItems = {};
  cityItems.cityObject = {};
  cityItems.hexObject = {};
  cityItems.cityID = {};
  cityItems.cityName = {};
  cityItems.occupiedFraction = {};
  cityItems.fraction = {};
  cityItems.chooseEvent = {};
  cityItems.pieObject = {};
  cityItems.pieObject.pie = {};
  for i = 1, CITYSCRAMBLEAMOUNT do
    cityItems[i] = grounds[hexGrid[i]];
    local cityData = cityScrambleCityDatas[i];
    cityItems.cityObject[i] = cityItems[i].clickObject;
    if (cityData ~= nil) then
      local cityType = cityData.cityType;
      cityType = math.floor(cityType / 2);
      cityItems[i]:SetIcon(cityType, cityData.spriteType);
    end
    cityItems.hexObject[i] = grounds[hexGrid[i]].gameObject;
    cityItems.cityName[i] = grounds[hexGrid[i]].cityText;
    cityItems.fraction[i] = cityItems.hexObject[i].transform:Find("Image_Grass"):GetComponent("Image");
    cityItems.cityID = i;
    --cityItems.cityName[i].text = cityScrambleCityDatas[i].cityName;
    cityItems.chooseEvent[i] = cityItems.cityObject[i]:GetComponent("UIEvent");
    if (cityData ~= nil) and (cityData.cityType ~= 0)  then
      cityItems[i].grassImage.sprite = UI.GetSprite("but204");
      cityItems.chooseEvent[i]:SetListener(EventTriggerType.PointerClick, function() this.OnClick_ChooseCity(i) end);
    end

    cityItems.pieObject[i] = {};
    cityItems.pieObject.pie[i] = grounds[hexGrid[i]].pieObject;
    cityItems.pieObject.pie[i]:SetActive(true);
    cityItems.pieObject[i].wedge = {};
    cityItems.pieObject[i].fill = {};
    for j = 1, PIEWEDGEAMOUNT do
      local wedge = cityItems.pieObject.pie[i].transform:Find(string.format("Wedge (%d)", j)).gameObject; 
      cityItems.pieObject[i].wedge[j] = wedge;
      cityItems.pieObject[i].fill[j] = cityItems.pieObject[i].wedge[j]:GetComponent("Image");
      local pieColor = Color.CityScramble[j];
      cityItems.pieObject[i].fill[j].color = pieColor;
    end
    cityItems.pieObject.pie[i]:SetActive(false);
    pieShow = false;
  end    

  neightbor.currentFraction = {};
  neightbor.rightUp = {};
  neightbor.right = {};
  neightbor.rightDown = {};  
  neightbor.leftUp = {};
  neightbor.left = {};
  neightbor.leftDown = {};
  for i = 1, CITYSCRAMBLEAMOUNT do    
    neightbor.currentFraction[i] = 0;
    this.SetNeightbor(i);
  end

  --單獨城鎮的占領資訊
  infoItems = gameObject_SingleCity.transform:Find("Image_BG");
  local inner = infoItems:Find("Image_ContentBG");
  infoImage = inner:Find("Image_CityDetail"):GetComponent("RawImage");
  local cityObject = inner:Find("CityInfoObject");
  infoCityNameText = cityObject:Find("Text_CityName"):GetComponent("Text");
  infoCityFractionText = cityObject:Find("Text_CityFraction"):GetComponent("Text");
  infoWarningObject = cityObject:Find("Text_Warning").gameObject;
  infoPlaceStakeObject = inner:Find("Image_PlaceStake").gameObject;
  infoFractionStakes = inner:Find("Page_List").gameObject;
  infoFractionObject = inner:Find("Page_List"):Find("Image_FractionBG").gameObject;
  infoPrizeObject = inner:Find("PrizeItem").gameObject;
  for i = 1, ONEPAGEITEM do
    infoFractionVotes[i] = infoFractionObject.transform:Find(string.format("FractionItem (%d)", i)):Find("Text_FractionNum"):GetComponent("Text");
    infoPrizeItem[i] = UIItemController.New(infoPrizeObject.transform:Find("PrizeItem").transform:Find(string.Concat("Image_Award (", i, ")")).transform);
  end
  
  -- 初始化按鈕事件
  event_Close = uiController:FindEvent("Image_Close");
  event_Close:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);
  event_Help = uiController:FindEvent("Image_Help");
  event_Help:SetListener(EventTriggerType.PointerClick, this.OnClick_Help);
  event_Pie = uiController:FindEvent("Image_Pie");
  event_Pie:SetListener(EventTriggerType.PointerClick, this.OnClick_Pie);
  event_PlaceStake = uiController:FindEvent("Image_PlaceStake");
  event_PlaceStake:SetListener(EventTriggerType.PointerClick, this.OnClick_PlaceStake);
  event_Return = uiController:FindEvent("Image_Mask");
  event_Return:SetListener(EventTriggerType.PointerClick, this.ShowMultiCity);  
  event_StakeDetail = uiController:FindEvent("Image_Stake");
  event_StakeDetail:SetListener(EventTriggerType.PointerClick, this.ShowStakeDetail); 
  event_DetailMask = uiController:FindEvent("Image_DetailMask");
  event_DetailMask:SetListener(EventTriggerType.PointerClick, this.CloseDetail); 
  event_DetailMask.gameObject:SetActive(false);
  event_Panel = uiController:FindEvent("Panel_Drag");
  event_Panel:SetPassEvent(EventTriggerType.PointerClick);
  event_Panel:SetListener(EventTriggerType.PointerDown, this.OnPress_Panel);
  event_Panel:SetListener(EventTriggerType.PointerUp, this.OnRelease_Panel);

  for i = 1, 3 do 
    fractionOccupied[i] = {};
    fractionOccupied[i] = 0;
  end
  sizeFitter_BG = uiController:FindImage("Image_BG"):GetComponent("ContentSizeFitter");
  sizeFitter_ContentBG = uiController:FindImage("Image_ContentBG"):GetComponent("ContentSizeFitter"); 

  gameObject_SingleCity:SetActive(false);
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------

  for i = 1, #activityFeverTimes[CITYSCARMBLEINDEX] do
    feverTimes[i] = activityFeverTimes[CITYSCARMBLEINDEX][i];
  end

  image_Pie.sprite = UI.GetSprite("but202");
  this.CloseDetail();
  isOpen = true;
end

function UICityScramble.OnOpen()  
  gameObject_MultiCity.rectTransform.localScale = Vector2.New(1, 1);
  gameObject_MultiCity.rectTransform.anchorMin = Vector2.New(0.5, 0.5); 
  gameObject_MultiCity.rectTransform.anchorMax = Vector2.New(0.5, 0.5); 
  gameObject_MultiCity.rectTransform.pivot = Vector2.New(0.5, 0.5); 
  gameObject_MultiCity.rectTransform.anchoredPosition = Vector2.zero; 
  this.ShowMultiCity();
  sendBuffer:Clear();  
  sendBuffer:WriteByte(1);
  Network.Send(23, 123, sendBuffer);
  sendBuffer:Clear();  
  sendBuffer:WriteByte(2);
  Network.Send(23, 123, sendBuffer);
  sendBuffer:Clear();  
  sendBuffer:WriteByte(3);
  Network.Send(23, 123, sendBuffer); 
  if not CGTimer.ContainsListener(this.UpdateActivityTimer) then 
    CGTimer.AddListener(this.UpdateActivityTimer, 1);
  end  
  return true;
end

function UICityScramble.Update()
  gameObject_FeverTime:SetActive(this.IsFeverTimeActive());  
  if table.Count(touchs) == 1 then
    this.OnDrag_Panel(Input.mousePosition);
  end

  if Input.mouseScrollDelta.y ~= 0 then
    zoomValue = Input.mouseScrollDelta.y * zoomMagnitude;
    this.OnZoom_Panel(zoomValue);
  end

  if (Input.touchCount > 1) then
    touchs[-1] = Input.GetTouch(0);
    touchs[-2] = Input.GetTouch(1);
    this.OnZoom_DoubleClick();
  end
end

function UICityScramble.OnZoom_DoubleClick()
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  
  touchNew1 = touchs[-1];
  touchNew2 = touchs[-2];
  touchNew2 = Vector2.New(UI.width/2, UI.height/2);
  local zoomOld = touchOld2 - touchOld1;
  local zoomNew = touchNew2 - touchNew1;
  local change = zoomNew - zoomOld;
  if change.magnitude > minTouchMoveValue then
    touchOld1 = touchNew1;
    touchOld2 = touchNew2;
  end
  if zoomOld == Vector2.zero then return end
  local magnitudeDiff = zoomNew.magnitude - zoomOld.magnitude;
  this.OnZoom_Panel(magnitudeDiff / zoomTouchValue);
end

function UICityScramble.OnZoom_Panel(zoom)  
  currentScale = gameObject_MultiCity.rectTransform.localScale.x;
  newSize = currentScale + zoom;
  if newSize < zoomMin then
    newSize = zoomMin;
  elseif newSize > zoomMax then
    newSize = zoomMax;
  end
  gameObject_MultiCity.rectTransform.localScale = Vector2.New(newSize, newSize);
end

local clampMin = Vector2.zero;
local clampMax = Vector2.zero;

function UICityScramble.OnPress_Panel(uiEvent)
  panelStartPosition = ConvertPositionToUIScene(this.uiController.transform, uiEvent.eventData.position, this.uiController.canvas.worldCamera);  
  multiPos = gameObject_MultiCity.rectTransform.anchoredPosition;
  screenW = math.ceil(hexWidth*0.25/newSize + UI.width/2);
  screenH = math.ceil(hexHeight*0.25/2/newSize + UI.height/2);
  touchs[uiEvent.eventData.pointerId] = uiEvent.eventData.position;
  clampMin.x = moveMin.x*newSize+screenW;
  clampMax.x = moveMax.x*newSize-screenW;
  clampMin.y = moveMax.y*newSize+screenH;
  clampMax.y = moveMin.y*newSize-screenH
end

function UICityScramble.OnRelease_Panel(uiEvent)
  touchs[uiEvent.eventData.pointerId] = nil;
  touchOld1 = Vector2.zero;
  touchOld2 = Vector2.zero;
  touchNew1 = Vector2.zero;
  touchNew2 = Vector2.zero;
end

local pivotChange = false;
local pivotPosDiff = Vector2.zero;

function UICityScramble.OnDrag_Panel(touchPosition)
  touchPosition = ConvertPositionToUIScene(this.uiController.transform, touchPosition, this.uiController.canvas.worldCamera);

  if touchPosition == panelStartPosition then return end

  moveDirection = touchPosition - panelStartPosition;
  if moveDirection.magnitude < minTouchMoveValue then return end

  gameObject_MultiCity.rectTransform.pivot = Vector2.New(0.5, 0.5);
  gameObject_MultiCity.rectTransform.anchorMin = Vector2.New(0.5, 0.5);
  gameObject_MultiCity.rectTransform.anchorMax = Vector2.New(0.5, 0.5);
  gameObject_MultiCity.rectTransform.anchoredPosition = multiPos; 

  local pos = multiPos + Vector2.ClampMagnitude(moveDirection, dragMagnitude);
  pos.x = Mathf.Clamp(pos.x, clampMin.x, clampMax.x);
  pos.y = Mathf.Clamp(pos.y, clampMin.y, clampMax.y);
  panelStartPosition = touchPosition;

  multiPos = pos;
  gameObject_MultiCity.rectTransform.anchoredPosition = pos; 
  --this.SetMultiAnchor(pos);
end

function UICityScramble.SetMultiAnchor(pos)
  local newAnchor = Vector2.New(0.5, 0.5);
  local newPos = pos;
  if pos.x == clampMax.x then
    newAnchor.x = 0;
    newPos.x = 0;
  elseif pos.x == clampMin.x then
    newAnchor.x = 1;
    newPos.x = 0; 
  end

  if pos.y == clampMax.y then
    newAnchor.y = 0;
    newPos.y = 0; 
  elseif pos.y == clampMin.y then
    newAnchor.y = 1;
    newPos.y = 0; 
  end
  if newAnchor ~= Vector2.New(0.5, 0.5) then
    pivotChange = true;
  end
  gameObject_MultiCity.rectTransform.pivot = newAnchor;
  gameObject_MultiCity.rectTransform.anchorMin = newAnchor;
  gameObject_MultiCity.rectTransform.anchorMax = newAnchor;
  gameObject_MultiCity.rectTransform.anchoredPosition = newPos; 
end

function UICityScramble.LoadGround()
  hexGrid.posX = {};
  hexGrid.posY = {};

  hexHeight = hexHeight + gap;
  hexWidth = hexWidth + gap;

  local offset = 0;
  if gridHeight/2%2 ~= 0 then
    offset = hexWidth;
  end
  startX = -hexWidth * ((gridWidth / 2)-0.5) - offset;
  startY = hexHeight * 0.75 * ((gridHeight/2)+0.5);
  this.CreateGrid();
  gameObject_MultiCity.rectTransform.sizeDelta = Vector2.New(moveMax.x*2 + hexWidth, moveMin.y*2 + hexHeight*0.4);
end

function UICityScramble.CalculatePos(posX, posY)
  local offset = 0;
  if posY%2 ~= 0 then
    offset = hexWidth/2;
  end
  local x = startX + posX * hexWidth + offset;
  local y = startY - posY * hexHeight * 0.75;
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  
  return Vector2.New(x, y);
end

function UICityScramble.CreateGrid()
  for y = 1, gridHeight do
    local xWidth = gridWidth;
    if y%2 ~= 0 then
      xWidth = xWidth -1;
    end
    for x = 1, xWidth do
      local position = this.CalculatePos(x, y);
      if (x == 1) and (y == 1) then
        moveMin = position;
      elseif (x == xWidth) and (y == gridHeight) then
        moveMax = position;
      end
      grounds[gridIndex] = UICityScrambleGroundController.New(transform_Ground, position, gridIndex);
      this.CheckAddHex(y, x, position.y, position.x, gridIndex);
      gridIndex = gridIndex+1;  
    end
  end
end

function UICityScramble.CheckAddHex(y, x, posY, posX, index)
  local diffY = math.abs((gridHeight+1)/2-y);
  local isHex = false;
  if HEXSIZE > diffY then
    local diffX;
    local checkX;
    if diffY%2 == 0 then
      diffX = (HEXSIZE*2+1-diffY)/2;
      checkX = math.abs((gridWidth+1)/2-x)+1;
    else
      diffX = (HEXSIZE*2-diffY)/2;
      checkX = math.abs(gridWidth/2-x);
    end

    if diffX > checkX then      
      isHex = true;
      hexGrid[hexIndex] = gridIndex;
      hexGrid.posX[hexIndex] = posX;
      hexGrid.posY[hexIndex] = posY;
    end
  end
  
  if (isHex == false) or (cityScrambleCityDatas[hexIndex] == nil) or (cityScrambleCityDatas[hexIndex].cityType == 0) then
    local clickEvent = grounds[gridIndex].clickObject:GetComponent("UIEvent");
    clickEvent:SetListener(EventTriggerType.PointerClick, function() this.SetRestrict(index) end);    
  end

  if isHex then    
    hexIndex = hexIndex+1;
  end
end

function UICityScramble.SetRestrict(index)
  if grounds[priorCityID] ~= nil then
    grounds[priorCityID]:ClearRestrict();
  end
  priorCityID = index;
  grounds[index]:SetRestrict();  

  if not CGTimer.ContainsListener(this.FadeRestrict) then 
    CGTimer.AddListener(this.FadeRestrict, 0.01, false);
  end
end

function UICityScramble.FadeRestrict()   
  local newColor = grounds[priorCityID].restrictImage.color;
  newColor.a = newColor.a - 0.01; 
  if (newColor.a < 0.05) then
    grounds[priorCityID]:ClearRestrict();
    CGTimer.RemoveListener(this.FadeRestrict);
  else
    grounds[priorCityID].restrictImage.color = newColor;
  end
end

function UICityScramble.OnClose()
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  this.ShowMultiCity();
  for i = 1, ONEPAGEITEM do
    fractionItems.fractionNum[i].text = "";
  end
  CGTimer.RemoveListener(this.UpdateActivityTimer);
  return true;
end

function UICityScramble.OnClick_Close()
  UI.Close(this);
  return true;
end

function UICityScramble.OnClick_ClosePrize()
  gameObject_Prize:SetActive(false);
end

function UICityScramble.OnClick_Help()
  UI.Open(UITutorialHint, 0, this, string.Get(22943), string.Get(24163));
end

function UICityScramble.OnClick_PlaceStake()   
  if challengeRightNum <= 0 then
    this.BuyChallengeRight();
  else
    sendBuffer:Clear();  
    sendBuffer:WriteByte(9);
    Network.Send(23, 123, sendBuffer);    
  end
end

function UICityScramble.OnClick_Pie()
  if pieShow then
    for i = 1, CITYSCRAMBLEAMOUNT do
      cityItems.pieObject.pie[i]:SetActive(false);
    end  
    pieShow = false;
    image_Pie.sprite = UI.GetSprite("but202");
  else
    sendBuffer:Clear();  
    sendBuffer:WriteByte(8);
    Network.Send(23, 123, sendBuffer); 
    image_Pie.sprite = UI.GetSprite("but203");
  end
end

function UICityScramble.OnClick_ChooseCity(index)
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  cityItems[index]:SetClick(true);
  local cityData = cityScrambleCityDatas[index];
  if cityData ~= nil then
    local spriteType = cityData.spriteType;
    if spriteType > 4 then
      spriteType = 4;
    end
    local info = CityScrambleInfoSprite[spriteType];
    local cityType = cityData.cityType;
    cityType = math.floor(cityType/2);    
    if (cityType == 0) or (spriteType == 4) then
      TextureManager.SetPng(ETextureUseType.UI, CityScrambleInfoSprite[4][1], infoImage);
    else
      TextureManager.SetPng(ETextureUseType.UI, info[cityType], infoImage);
    end
  end
  chooseCityID = index;
  text_CityName.text = cityScrambleCityDatas[index].cityName;
  sendBuffer:Clear();
  sendBuffer:WriteByte(4);
  sendBuffer:WriteInt32(index);
  Network.Send(23, 123, sendBuffer);  
  if pieShow then
    this.OnClick_Pie();
  end  
end

function UICityScramble.UpdateFever()
  feverIdx = feverIdx +1;
  if feverIdx > 5 then
    feverIdx = 1;
  end
end

function UICityScramble.IsFeverTimeActive()
  for i = 1, #feverTimes do
    if feverTimes[i]:IsActive() then
      return true;
    end
  end
  return false;
end

function UICityScramble.UpdatePlayerInfo(fractionId, votes, stake, right) 
  playerFraction = fractionId;
  text_PersonalNum.text = votes;
  text_PlayerFraction.text = this.GetFractionText(fractionId);
  text_StakeNum.text = stake;
  text_ChallengeRightNum.text = string.Concat(right, "/", RoleCount.Max(ERoleCount.CityScramble_ChallengeRight));
  challengeRightNum = right;
end

function UICityScramble.SetVotableNum(votable)
  votableNum = votable;
  ShowCountInput(string.Get(22952), 1, votableNum,
    function(text)
      if text == nil then return end
  
      local quant = tonumber(text);
      if quant == 0 then return end
      sendBuffer:Clear();
      sendBuffer:WriteByte(6);
      sendBuffer:WriteUInt32(quant);
      sendBuffer:WriteUInt16(chooseCityID);
      Network.Send(23, 123, sendBuffer);
    end
  );  
end

function UICityScramble.UpdateCityInfo(cityId, fractionId)
  if isOpen == false then return end
  cityItems.cityObject[cityId]:SetActive(true);
  cityItems.hexObject[cityId]:SetActive(true);
  neightbor.currentFraction[cityId] = fractionId;
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
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

function UICityScramble.UpdatePie(data)
  local cityCount = data:ReadByte();
  local portion = {};
  portion.fraction = {};
  portion.votes = {};
  for i = 1, cityCount do
    local cityId = data:ReadUInt16();
    local fractionCount = data:ReadByte();
    local total = 0;
    portion[i]=cityId;

    for j = 1, fractionCount do
      local fraction = data:ReadByte();
      local votes = data:ReadUInt32();
      portion.fraction[j] = fraction;
      portion.votes[j] = votes;
      total = total + votes;
    end

    local quater = 0;
    for j = 1, fractionCount do
      local percentage
      if total ~= 0 then
        percentage = portion.votes[j] / total;
      else
        percentage = 1/fractionCount;
      end
      cityItems.pieObject[cityId].fill[j].fillAmount = percentage;      
      cityItems.pieObject[cityId].wedge[j].transform.rotation = Quaternion.Euler(0, 0, 360*quater);
      quater = quater - percentage;
    end

    cityItems.pieObject.pie[cityId]:SetActive(true);
  end
  pieShow = true;
end

function UICityScramble.UpdateCitySingleInfo(cityId, fractionId, originalFraction)
  infoCityNameText = cityScrambleCityDatas[cityId].cityName;
  infoCityFractionText.text = this.GetFractionText(fractionId);
  local isMain = false;
  local id = cityScrambleCityDatas[cityId].cityType;
  if (id == 2) or (id == 4) or (id == 6) then
    isMain = true;
  end
  infoFractionStakes:SetActive(not isMain);
  infoPrizeObject:SetActive((originalFraction == playerFraction)  or (not isMain));
  infoWarningObject:SetActive((originalFraction ~= playerFraction) and isMain);
  neightbor.currentFraction[cityId] = fractionId;
  cityOriginalFraction = originalFraction;
end

function UICityScramble.GetFractionText(fractionId)
  if fractionId == 1 then
    return string.Get(23082);
  elseif fractionId == 2 then
    return string.Get(23083);
  elseif fractionId == 3 then
    return string.Get(23084);
  else
    return "";
  end
end

function UICityScramble.UpdateFractionInfo(fractionId, count)  
  if isOpen == false then return end
  fractionOccupied[fractionId] = count;
  fractionItems.fractionObject[fractionId]:SetActive(true); 
  fractionItems.fractionNum[fractionId].text = count;
end

function UICityScramble.UpdateCityVoteInfo(fractionId, count)   
  infoFractionVotes[fractionId].text = count;
end

function UICityScramble.UpdatePlaceStakeClick(canVote)
  infoPlaceStakeObject:SetActive(canVote);
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
end

function UICityScramble.SetCityTime(leftTime)  
  text_StakeTimer.text = '';
  if leftTime > 0 then
    cityTime = DateTime.FromOADate(leftTime);
    if not CGTimer.ContainsListener(this.UpdateCityTimer) then 
      CGTimer.AddListener(this.UpdateCityTimer, 1);
    end
  else
    this.ClearCityTimer();
  end
end

function UICityScramble.UpdateCityTimer()
  if DateTime.Compare(CGTimer.serverTime, cityTime) < 0 then 
    text_StakeTimer.text = string.GetSecondSymbol(math.ceil(DateTime.Subtract(cityTime, CGTimer.serverTime).TotalSeconds));
  else
    this.ClearCityTimer();
  end
end

function UICityScramble.UpdateActivityTimer()
  local actTime = activityTimes[CITYSCARMBLEINDEX];
  if DateTime.Compare(CGTimer.serverTime, actTime[1].serverCloseTime) < 0 then 
    text_ActivityTimer.text = string.GetSecondText(math.ceil(DateTime.Subtract(actTime[1].serverCloseTime, CGTimer.serverTime).TotalSeconds));
  else
    text_ActivityTimer.text = string.Concat("0", string.Get(40145));
    CGTimer.RemoveListener(this.UpdateActivityTimer);
  end
end

function UICityScramble.ShowMultiCity()  
  gameObject_SingleCity:SetActive(false);  
  if chooseCityID ~= nil then
    if cityItems[chooseCityID] ~= nil then
      cityItems[chooseCityID]:SetClick(false);
    end
  end
end

function UICityScramble.ShowSingleCity()
  this.SetPrizes();
  sizeFitter_ContentBG:SetLayoutVertical();
  sizeFitter_BG:SetLayoutVertical();
  gameObject_SingleCity:SetActive(true);
end

function UICityScramble.BuyChallengeRight()  
  UISell.Launch(61);
end

function UICityScramble.DoFight()
  UI.Close(UICityScramble);
  sendBuffer:Clear();
  sendBuffer:WriteByte(7);
  Network.Send(23, 123, sendBuffer);
end

function UICityScramble.CheckQualification()
  --需要滿一轉120等才可以
  if Role.player:GetAttribute(EAttribute.Turn) == CITYSCRAMBLETURN then
    if Role.player:GetAttribute(EAttribute.Lv) >= CITYSCRAMBLELV then
      return true;
    end
  else
    if Role.player:GetAttribute(EAttribute.Turn) > CITYSCRAMBLETURN then
      return true;
    end
  end
  return false;
end

function UICityScramble.SetPrizes()    
  if playerFraction ~= nil then
    for i = 1, 3 do
      if cityOriginalFraction == playerFraction then
        infoPrizeItem[i]:SetItem(cityScrambleCityRewardDatas[chooseCityID][0].rewards[i].itemID, cityScrambleCityRewardDatas[chooseCityID][0].rewards[i].itemCount);
      else
        infoPrizeItem[i]:SetItem(cityScrambleCityRewardDatas[chooseCityID][1].rewards[i].itemID, cityScrambleCityRewardDatas[chooseCityID][1].rewards[i].itemCount);
      end
    end
  end
end

function UICityScramble.ShowAddVoteSuccess()
  -- 播放"成功插樁"動畫
  --AnimationController.Play(10, gameObject_OccupiedEffect.transform, nil , nil, nil);  --煙火特效
  --AnimationController.Play(11, gameObject_OccupiedEffect.transform, nil , nil, nil);  --煙火特效
  AnimationController.Play(12, gameObject_OccupiedEffect.transform, nil , nil, nil);
end

function UICityScramble.SetNeightbor(id)  
  local aCheck = false;
  local aUp = false;
  local aCity2 = 0;
  local aRowNum = 0;
  local aRowIdx = 0;
  local aRowAdd = 0;
  local aFormer = 0; --上兩行最後一位
  local aCurrent = 0; --上一行最後一位
  local aLater = 0;  --這一行最後一位
  while (aLater == 0) or (aRowIdx == 0) or (aRowNum == 0) do --取得屬於第幾列的第幾個數
    aRowNum = aRowNum + 1;
    aLater = aLater + aRowAdd + HEXSIZE;

    if aLater >= id then   --求城鎮是位於這行第幾個數
      aCheck = true;
      aRowIdx = id - aCurrent;
    end

    if not aCheck then
      if HEXSIZE > 1 then
        if aRowNum > 1 then
          aFormer = aCurrent;
        else
          aFormer = 0;
        end
      else
        aFormer = 0;
      end
    end

    if not aCheck then
      aCurrent = aLater;
      if aRowNum < HEXSIZE then
        aRowAdd = aRowAdd + 1;             --六角形上半部，每行增加
      else
        aRowAdd = aRowAdd - 1;             --六角形下半部，每行減少
      end
    end
  end;

  if aRowNum <= HEXSIZE then
    aUp = true;
  end

  if (aLater-id) > 0 then --右
    aCity2 = id + 1;
    neightbor.right[id] = aCity2;
  end;

  if (aRowIdx > 1) then --左
    aCity2 = id - 1;
    neightbor.left[id] = aCity2;
  end;

  if (aRowNum > 1) then --右上
    if (aUp and (aLater > id))
    or (not aUp) then
      
      aCity2 = aFormer + aRowIdx;
      if not aUp then
        aCity2 = aCity2 + 1;
      end
      neightbor.rightUp[id] = aCity2;
    end
  end

  if (aRowNum > 1) then --左上
    if (aUp and (aRowIdx > 1))     --上半
    or (not aUp) then              --下半
      aCity2 = aFormer + aRowIdx;
      if aUp then
        aCity2 = aCity2 -1;
      end
      neightbor.leftUp[id] = aCity2;
    end
  end

  if aRowNum < (HEXSIZE*2-1) then --右下
    if (aUp and (aRowNum ~= HEXSIZE))       --上半
    or ((aRowNum == HEXSIZE) and (aLater > id))           --中
    or ((not aUp) and (aLater - id > 0) and (aRowNum ~= (HEXSIZE*2-1)))then   --下半
      aCity2 = aLater + aRowIdx;
      if aUp then
        if aRowNum ~= HEXSIZE then
          aCity2 = aCity2+1;
        end
      end
      neightbor.rightDown[id] = aCity2;
    end
  end

  if aRowNum < (HEXSIZE*2-1) then --左下
    if (aUp and (aRowNum ~= HEXSIZE))                  --上半
    or ((aRowNum == HEXSIZE) and (aRowIdx > 1))        --中
    or ((not aUp) and (aRowIdx > 1) and (aRowNum ~= (HEXSIZE*2-1))) then     --下半
      aCity2 = aLater + aRowIdx;
      if aUp then
        if aRowNum == HEXSIZE then
          aCity2 = aCity2 -1;
        end
      else
          aCity2 = aCity2 -1;
      end
      neightbor.leftDown[id] = aCity2;
    end
  end
end

function UICityScramble.GetBoundaryType(id)  
  local count = 0;
  --右上
  if neightbor.currentFraction[id] ~= neightbor.currentFraction[neightbor.rightUp[id]] then
    count = count + 1; 
  end

  --右
  if neightbor.currentFraction[id] ~= neightbor.currentFraction[neightbor.right[id]] then
    count = count + 2; 
  end

  --右下
  if neightbor.currentFraction[id] ~= neightbor.currentFraction[neightbor.rightDown[id]] then
    count = count + 4; 
  end

  --左下
  if neightbor.currentFraction[id] ~= neightbor.currentFraction[neightbor.leftDown[id]] then
    count = count + 8; 
  end

  --左
  if neightbor.currentFraction[id] ~= neightbor.currentFraction[neightbor.left[id]] then
    count = count + 16; 
  end

  --左上
  if neightbor.currentFraction[id] ~= neightbor.currentFraction[neightbor.leftUp[id]] then
    count = count + 32; 
  end
  return count;
end

function UICityScramble.SetAllBoundary()  
  if isOpen == false then return end
  for i = 1, CITYSCRAMBLEAMOUNT do
    local num = this.GetBoundaryType(i);
    cityItems[i]:SetBoundary(num, neightbor.currentFraction[i], i);
  end
end

function UICityScramble.ShowStakeDetail()
  text_Detail.text = string.Get(23188);
  local stakeRect = Vector2.New(0, image_Stake.rectTransform.rect.height/2);
  image_DetailPanel.rectTransform.anchoredPosition = image_Stake.rectTransform.anchoredPosition - stakeRect;
  event_DetailMask.gameObject:SetActive(true);
  gameObject_DetailObject:SetActive(true);
  
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
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

function UICityScramble.CloseDetail()
  event_DetailMask.gameObject:SetActive(false);
  gameObject_DetailObject:SetActive(false);
end