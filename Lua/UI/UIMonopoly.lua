UIMonopoly = {}
local this = UIMonopoly;
this.name = "UIMonopoly";

EMonopolyCellImageKind = {
  normal = 1,
  special = 2
}

EMonopolyCellEventTrigger = {
  pass = 1,
  arrive = 2,
  teleport = 3,
  enter = 4,
  leave = 5
}

local currentFestival;

--region UI Variable

local uiController;
local openFlag = false;
local uiHelpID = 56;

local event_DisableButton;
local event_RollDiceButton;

local gameObject_Dice;
local gameObject_TokenLeftSteps;

local image_RollDiceButton;
local image_DisableButton;
local image_BgGradientColor;
local image_AutoSwitch;

local rawImage_MapBG;
local rawImage_RollingDice;
local rawImage_StillDice;
local rawImage_RefreshButton;
local rawImage_PushButton;

local text_Time;
local text_Title;
local text_LeftDiceCount;
local text_TokenLeftSteps;
local text_Round;

local tokenLeftStepsTextOffset = Vector3.New(0, 110, 0);
--endregion

--region token Variable
local token;
local updateInterval = 1;
local moveStep = 8;
local tokenCanvasSortingOrder;
local tokenBuffer = Vector3.New(50, 150, 0);
local tokenMoving = false;
--endregion

--region Cell Variable
local originCell;
local originPosition;
local xUnitCell;
local yUnitCell;
local xAxisUnitVector;
local yAxisUnitVector;

local cellSize;
local cellBuffer;
local allCells = {};
local cellImageName = {
  "but210",
  "but211",
  "but212"
};

--endregion

--region Map Variable
local mapKeys = {};
local mapRoot;
local mapRect;
local boardRect;
local mapImageRect;
local viewPortSize;
local boardBound = {};
local mapBuffer;
local contentRectMinPosition;
local contentRectMaxPosition;
--endregion

--region Dice Variable
local diceResultImageName = "SceneEffect_0003";
local diceResultImagePage = 6;

local diceRollingEffectName = "SceneEffect_0002";
local diceRollingEffectPage = 8;
local diceRollingEffectDefaultRect = Rect.New(0, 1 / diceRollingEffectPage, 1, 1 / diceRollingEffectPage);

local diceSize = 90;
local diceEffectInterval = 0.08;
local diceCountTextID = 23427;
local diceUVRect = {};
--endregion

--region RollDiceButton Variable

local ERollDiceButtonType =
{
  rollDice = 1,
  disable = 2,
  refresh = 3,
  push = 4
}

local autoRoll = false;
local diceRollingTextID = 23423

local rollDiceButtonImageName = "but209D";
local disableButtonImageName = "but209H";

local rollDiceButtonType = {};
local buttonRefreshEffectName = "SceneEffect_0004";
local buttonRefreshEffectPage = 8;
local buttonRefreshEffectInterval = 0.1;
local buttonRefreshEffectDefaultRect = Rect.New(0, 1 / buttonRefreshEffectPage, 1, 1 / buttonRefreshEffectPage);

local buttonPushEffectName = "SceneEffect_0001";
local buttonPushEffectPage = 8;
local buttonPushEffectInterval = 0.1;
local buttonPushEffectDefaultRect = Rect.New(0, 1 / buttonPushEffectPage, 1, 1 / buttonPushEffectPage);

local buttonSize = Vector2.New(110, 100);
--endregion

--region UI
function UIMonopoly.Initialize(go)
  uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  this.uiController.onVisible = this.OnVisible;

  local tempEvent = uiController:FindEvent("Image_Help");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Help);
  tempEvent = uiController:FindEvent("Image_Close");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);

  tokenCanvasSortingOrder = uiController.canvas.sortingOrder + 2;

  mapRoot = uiController:FindGameObject("ScrollContent_MonopolyMap");
  mapRect = mapRoot:GetComponent("RectTransform");
  rawImage_MapBG = uiController:FindRawImage("ScrollContent_MonopolyMap");

  boardRect = uiController:FindGameObject("Board"):GetComponent("RectTransform");

  local viewPort = uiController:FindGameObject("ScrollRect_ViewPort");
  viewPortSize = viewPort:GetComponent("RectTransform").sizeDelta;

  originCell = uiController:FindGameObject("Image_OriginCell");
  local cellRectTransform = originCell:GetComponent("RectTransform");
  cellSize = cellRectTransform.sizeDelta;
  cellBuffer = Vector3(cellSize.x, cellSize.y, 0);

  xUnitCell = uiController:FindGameObject("Image_XUnitCell");
  yUnitCell = uiController:FindGameObject("Image_YUnitCell");
  originPosition = originCell.transform.localPosition;
  xAxisUnitVector = xUnitCell.transform.localPosition - originPosition;
  yAxisUnitVector = yUnitCell.transform.localPosition - originPosition;

  local coordinates = Monopoly.GetMapCoordinates();
  this.CreateMap(coordinates);
  Monopoly.SetStartingPoint();

  originCell:SetActive(false);
  xUnitCell:SetActive(false);
  yUnitCell:SetActive(false);

  image_RollDiceButton = uiController:FindImage("Image_RollDiceButton");
  image_RollDiceButton.rectTransform.sizeDelta = buttonSize;
  event_RollDiceButton = uiController:FindEvent("Image_RollDiceButton");
  event_RollDiceButton:SetListener(EventTriggerType.PointerClick, this.OnClick_RollDice);
  table.insert(rollDiceButtonType, ERollDiceButtonType.rollDice, image_RollDiceButton);

  image_DisableButton = uiController:FindImage("Image_DisableButton");
  image_DisableButton.rectTransform.sizeDelta = buttonSize;
  event_DisableButton = uiController:FindEvent("Image_DisableButton");
  event_DisableButton:SetListener(EventTriggerType.PointerClick, this.OnClick_RollDice);
  table.insert(rollDiceButtonType, ERollDiceButtonType.disable, image_DisableButton);

  rawImage_RefreshButton = uiController:FindRawImage("RawImage_RefreshButton");
  rawImage_RefreshButton.rectTransform.sizeDelta = buttonSize;
  rawImage_RefreshButton.enabled = false;
  table.insert(rollDiceButtonType, ERollDiceButtonType.refresh, rawImage_RefreshButton);

  rawImage_PushButton = uiController:FindRawImage("RawImage_PushButton");
  rawImage_PushButton.rectTransform.sizeDelta = buttonSize;
  rawImage_PushButton.enabled = false;
  table.insert(rollDiceButtonType, ERollDiceButtonType.push, rawImage_PushButton);

  gameObject_Dice = uiController:FindGameObject("Dice");
  gameObject_Dice.transform:SetParent(boardRect.transform);
  gameObject_Dice.transform.localPosition = Vector3.zero;

  rawImage_RollingDice = uiController:FindRawImage("RawImage_RollingDice");
  rawImage_RollingDice.enabled = false;
  rawImage_RollingDice.rectTransform.sizeDelta = Vector2.New(diceSize, diceSize);

  rawImage_StillDice = uiController:FindRawImage("RawImage_StillDice");
  rawImage_StillDice.enabled = false;
  rawImage_StillDice.rectTransform.sizeDelta = Vector2.New(diceSize, diceSize);

  for index = 1, diceResultImagePage do
    diceUVRect[index] = Rect.New(0, (diceResultImagePage - index) / diceResultImagePage, 1, 1 / diceResultImagePage);
  end

  text_Time = uiController:FindText("Text_Time");
  text_Time.gameObject:SetActive(false);
  text_Title = uiController:FindText("Text_Title");
  text_LeftDiceCount = uiController:FindText("Text_LeftDiceCount");
  text_Round = uiController:FindText("Text_Round");

  text_TokenLeftSteps = uiController:FindText("Text_TokenLeftSteps");
  gameObject_TokenLeftSteps = uiController:FindGameObject("Text_TokenLeftSteps");

  image_BgGradientColor = uiController:FindGameObject("Image_BG"):GetComponent("GradientColor");
  image_BgGradientColor.enabled = false;

  image_AutoSwitch = uiController:FindImage("Image_Auto");
  image_AutoSwitch.sprite = UI.GetSwitchSprite(false);
  tempEvent = uiController:FindEvent("Image_Auto");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_AutoSwitch);

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
end

function UIMonopoly.Update()
  this.UpdateToken(token);
end

function UIMonopoly.OnOpen(festivalData)
  if festivalData ~= nil then
    currentFestival = festivalData;
    text_Title.text = string.Get(festivalData.title);
    Network.Send(1, 16);
    CGTimer.AddListener(this.UpdateTime, 1);
    this.UpdateBGImage(festivalData);
    text_Time.gameObject:SetActive(true);
  end
  if Monopoly.GetProgressResult() ~= nil then
    return false
  end

  local oriRole = Role.player;
  if token == nil then
    token = UIMonopoly.CreateToken(oriRole);
  else
    token:UpdateViewJMP(oriRole);
  end
  this.UpdateUI();
  CGTimer.AddListener(this.Update, updateInterval, true);
  text_TokenLeftSteps.text = "";
  this.SwitchRollDiceButtonType(ERollDiceButtonType.rollDice);
  openFlag = true;
  this.UpdateProgress();
  return true
end

function UIMonopoly.OnClick_Close()
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
  if tokenMoving then
    return
  end
  CGTimer.RemoveListener(this.Update);
  CGTimer.RemoveListener(this.UpdateTime);
  openFlag = false;
  UI.Close(this);
  return true;
end

function UIMonopoly.OnClick_Help()
  UI.Open(UITutorialHint, uiHelpID, this);
  return true;
end

function UIMonopoly.OnClick_RollDice()
  if tokenMoving == true then
    ShowCenterMessage(string.Get(diceRollingTextID));
    return
  end
  UICenterMessage.Clear();
  this.SetTokenMoveFlag(true);
  Monopoly.RollDice();
  
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
end

function UIMonopoly.UpdateTime()
  local status, leftTimeText = UIFestival.GetFestivalStatus(currentFestival);
  if status == EFestivalStatus.Open then
    text_Time.text = leftTimeText;
  else
    UI.Close(this);
  end
end

function UIMonopoly.UpdateProgress()
  if openFlag == false then return end
  Monopoly.RefreshAllCells();
  this.TeleportToken(Monopoly.GetCurrentCell(), false);
end

function UIMonopoly.UpdateBGImage(festivalData)
  TextureManager.SetPng(ETextureUseType.UI, string.Concat("pic_", string.format("%03d", festivalData.rolePicture)), rawImage_MapBG);
  local mapBGSize = Vector2.New(festivalData.roleW, festivalData.roleH);
  local boardPosition = Vector2.New(festivalData.roleX, festivalData.roleY);
  this.SetMapBGImage(mapBGSize, boardPosition);
  image_BgGradientColor.enabled = true;
  image_BgGradientColor.colorTop = LuaHelper.GetColor( festivalData.topR, festivalData.topG, festivalData.topB, 255 );
  image_BgGradientColor.colorBottom = LuaHelper.GetColor( festivalData.bottomR, festivalData.bottomG, festivalData.bottomB, 255 );
end

function UIMonopoly.SetMapBGImage(size, position)
  if size ~= nil then
    mapRect.sizeDelta = size;
    this.UpdateViewMap();
  end
  if position ~= nil then
    local mapCenter = this.GetMapLocalPosition(mapRect.sizeDelta * 0.5);
    boardRect.transform.localPosition = mapCenter + this.GetMapLocalPosition(position);
    this.TeleportToken(Monopoly.GetCurrentCell());
  end
end

function UIMonopoly.GetMapImageInfo()
  local mapCenter = this.GetMapLocalPosition(mapRect.sizeDelta * 0.5);
  local width = mapImageRect.sizeDelta.x;
  local height = mapImageRect.sizeDelta.y;
  local posX = mapImageRect.localPosition.x - mapCenter.x;
  local posY = mapImageRect.localPosition.y - mapCenter.y;
  return width, height, posX, posY;
end

function UIMonopoly.UpdateUI()
  image_RollDiceButton.sprite = UI.GetSprite(rollDiceButtonImageName);
  image_DisableButton.sprite = UI.GetSprite(disableButtonImageName);
  image_AutoSwitch.sprite = UI.GetSwitchSprite(autoRoll);
  TextureManager.SetPng(ETextureUseType.None, buttonRefreshEffectName, rawImage_RefreshButton);
  TextureManager.SetPng(ETextureUseType.None, buttonPushEffectName, rawImage_PushButton);
  TextureManager.SetPng(ETextureUseType.None, diceRollingEffectName, rawImage_RollingDice);
  TextureManager.SetPng(ETextureUseType.None, diceResultImageName, rawImage_StillDice);
  this.UpdateDiceCount();
  this.UpdateRound();
end

function UIMonopoly.UpdateRound()
  if not UI.IsVisible(UIMonopoly) then
    return
  end
  text_Round.text = string.format(string.Get(24061), RoleCount.Get(ERoleCount.MonopolyRound));
end
--endregion

--region Cell
function UIMonopoly.CreateCell(coordinate, prefab)
  if allCells[coordinate.x] == nil then
    allCells[coordinate.x] = {};
  end
  if allCells[coordinate.x][coordinate.y] == nil then
    allCells[coordinate.x][coordinate.y] = {};
    allCells[coordinate.x][coordinate.y].cellExist = false;
  end

  if allCells[coordinate.x][coordinate.y].cellExist == false then
    local cell = {};
    allCells[coordinate.x][coordinate.y].cellExist = true;
    allCells[coordinate.x][coordinate.y].cell = cell;

    cell.go = newObject(prefab);
    cell.go.transform:SetParent(boardRect.transform);
    cell.go:GetComponent("RectTransform").localScale = Vector3.one;
    cell.relativePosition = xAxisUnitVector * coordinate.x + yAxisUnitVector * coordinate.y;
    cell.go.transform.localPosition = originPosition + cell.relativePosition;
    cell.go.name = string.Concat("Cell_", "(", coordinate.x, ", ", coordinate.y, ")");
    cell.cellImage = cell.go.transform:Find("Image_CellImage"):GetComponent("Image");
    cell.occupiedCellImage = cell.go.transform:Find("Image_OccupiedCellImage"):GetComponent("Image");
    cell.occupiedCellImage.enabled = false;
    cell.cellImageType = 0;
    cell.cellRectTransform = cell.go:GetComponent("RectTransform");
    this.UpdateMapBound(cell.cellRectTransform);
    cell.itemImage = cell.go.transform:Find("Image_Item");
    cell.item = UIItemController.New(cell.itemImage);
    cell.eventFunctions = {};
    cell.occupied = false;
    return true;
  else
    return false;
  end
end

function UIMonopoly.GetCell(cellID)
  if mapKeys[cellID] == nil then
    return nil
  end
  
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
  local key = mapKeys[cellID];
  return allCells[key.x][key.y].cell;
end

function UIMonopoly.SetCellReward(cellID, rewardItemID, rewardItemCount)
  local cell = this.GetCell(cellID);
  if cell == nil then
    return
  end
  local cellItem = cell.item;
  if rewardItemID == nil or rewardItemCount == nil then
    cell.item:Destroy();
    return
  end

  if cellItem.itemId == rewardItemID and cellItem.itemQuant == rewardItemCount then
    return
  end
  cell.item:Destroy();
  cell.item = UIItemController.New(cell.itemImage);
  cell.item:SetItem(rewardItemID, rewardItemCount);
  local item = itemDatas[rewardItemID];
  if item.specialAbility == EItemUseKind.ItemUse_216 or item.kind == EItemKind.DoroCard then
    return
  end
  local itemName = itemDatas[rewardItemID]:GetName();
  cell.rewardMessage = Monopoly.GetReceiveRewardMessage(itemName, rewardItemCount);
  cell.chatRewardMessage = Monopoly.GetReceiveRewardChatMessage(itemName, rewardItemCount);
end

function UIMonopoly.SetCellType(cellID, cellType)
  if cellID == nil or cellType == nil then
    return
  end
  this.GetCell(cellID).cellType = cellType;
end

function UIMonopoly.SetCellImage(cellID, imageType)
  local cell = this.GetCell(cellID);
  if cell == nil then
    return
  end

  local imageName;
  if imageType ~= nil then
    imageName = cellImageName[imageType];
  else
    imageName = cellImageName[2];
  end
  if imageName == nil then
    return
  end

  if cell.cellImageType == imageType then
    return
  end
  local emptyCellImageName = string.Concat(imageName, "D");
  local OccupiedCellImageName = string.Concat(imageName, "L");
  cell.cellImage.sprite = UI.GetSprite(emptyCellImageName);
  cell.occupiedCellImage.sprite = UI.GetSprite(OccupiedCellImageName);
end

function UIMonopoly.AddCellEvent(cellID, eventFunction, eventKind)
  local cell = this.GetCell(cellID);
  if cell.eventFunctions[eventKind] == nil then
    cell.eventFunctions[eventKind] = {};
  end
  table.insert(cell.eventFunctions[eventKind], eventFunction);
end

function UIMonopoly.ClearCellEvent(cellID)
  this.GetCell(cellID).eventFunctions = {};
end

function UIMonopoly.TriggerCellEvent(cell, eventKind)
  if cell.eventFunctions[eventKind] ~= nil then
    for _, v in ipairs(cell.eventFunctions[eventKind]) do
      v(cell);
    end
  end
end

function UIMonopoly.TokenLeaveCell(cell)
  cell.occupied = false;
  cell.cellImage.enabled = true;
  cell.occupiedCellImage.enabled = false;
end

function UIMonopoly.TokenEnterCell(cell)
  cell.occupied = true;
  cell.cellImage.enabled = false;
  cell.occupiedCellImage.enabled = true;
end

function UIMonopoly.SetNextCell(cellID, nextCellID)
  local cell = this.GetCell(cellID);
  cell.nextCell = this.GetCell(nextCellID);
  this.GetCell(nextCellID).prevCell = cell;
  local direction = cell.nextCell.go.transform.position - cell.go.transform.position;
  cell.boundary = Vector3.Distance(cell.nextCell.go.transform.position, cell.go.transform.position)/2;
  this.SetCellDefaultDirection(cellID, direction);
end

function UIMonopoly.SetCellDefaultDirection(cellID, direction)
  local defaultDir = direction;
  defaultDir = this.GetMapLocalPosition(defaultDir);
  this.GetCell(cellID).defaultDirection = defaultDir;
end

function UIMonopoly.SetStep(step)
  if type(step)~="number" or (math.floor(step) ~= step) or step <= 1 or step == moveStep then return end
  moveStep = step;
end
--endregion

--region Map
function UIMonopoly.CreateMap(coordinates)
  this.InitBoardBound(originCell.transform);
  local cellVisualOrder = {};
  for i, v in ipairs(coordinates) do
    mapKeys[i] = v;
    cellVisualOrder[i] = v;
    --sort by distance to get correct visual overlap
    table.sort(cellVisualOrder, Monopoly.CoordinateSort);
  end

  for _, v in ipairs(cellVisualOrder) do
    this.CreateCell(v, originCell);
  end

  --Board can only be move because cell size and aspect are fix
  this.CreateBoard();
  this.UpdateViewMap();

  for index = 1, table.Count(mapKeys) do
    this.SetNextCell(index, Monopoly.GetNextCell(index));
    this.AddCellEvent(index, this.UpdateLeftStep, EMonopolyCellEventTrigger.pass);
    this.AddCellEvent(index, this.ShowChatRewardMessage, EMonopolyCellEventTrigger.arrive);
    this.AddCellEvent(index, this.ShowRewardMessage, EMonopolyCellEventTrigger.arrive);
    this.AddCellEvent(index, this.HideLeftStep, EMonopolyCellEventTrigger.arrive);
    this.AddCellEvent(index, this.TokenEnterCell, EMonopolyCellEventTrigger.enter);
    this.AddCellEvent(index, this.TokenLeaveCell, EMonopolyCellEventTrigger.leave);
  end
end

function UIMonopoly.InitBoardBound(originTransform)
  boardBound.left = originTransform.localPosition.x;
  boardBound.right = originTransform.localPosition.x;
  boardBound.top = originTransform.localPosition.y;
  boardBound.down = originTransform.localPosition.y;
end

function UIMonopoly.UpdateMapBound(transform)
  boardBound.right = Mathf.Max(transform.localPosition.x, boardBound.right);
  boardBound.left = Mathf.Min(transform.localPosition.x, boardBound.left);
  boardBound.top = Mathf.Max(transform.localPosition.y, boardBound.top);
  boardBound.down = Mathf.Min(transform.localPosition.y, boardBound.down);
end

function UIMonopoly.CreateBoard()
  local mapHeight = boardBound.top - boardBound.down;
  local mapWidth = boardBound.right - boardBound.left;
  boardRect.sizeDelta = Vector2.New(mapWidth, mapHeight) + cellBuffer;
  local boardCenter = Vector3.New(boardBound.left + boardBound.right, boardBound.down + boardBound.top, 0) * 0.5;
  local cellOffset = boardCenter - originPosition;
  for index = 1, table.Count(mapKeys) do
    local cell = this.GetCell(index);
    cell.go.transform.localPosition = cell.relativePosition - cellOffset;
  end
end

function UIMonopoly.UpdateViewMap()
  mapBuffer = Vector3.Max(cellBuffer, tokenBuffer);

  contentRectMinPosition = viewPortSize * 0.5;
  contentRectMinPosition = this.GetMapLocalPosition(contentRectMinPosition);
  contentRectMinPosition = this.GetMapFocusPosition(contentRectMinPosition);

  contentRectMaxPosition = mapRect.sizeDelta - viewPortSize * 0.5;
  contentRectMaxPosition = this.GetMapLocalPosition(contentRectMaxPosition);
  contentRectMaxPosition = this.GetMapFocusPosition(contentRectMaxPosition);
end

function UIMonopoly.GetMapLocalPosition(position)
  position.y = - position.y;
  return position
end

--move content rect opposite direction
function UIMonopoly.GetMapFocusPosition(position)
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
  return -position;
end
--endregion

--region token
function UIMonopoly.CreateToken(role)
  local newToken = RoleController.Copy(role);
  newToken:UpdateViewVisible();
  newToken.gameObject.layer = LayerMask.NameToLayer("UI");
  newToken.transform:SetParent(mapRect.transform);
  newToken.transform.localScale = Vector3.one;
  newToken.transform.localPosition = Vector3.zero;
  newToken.canvas.sortingOrder = tokenCanvasSortingOrder;
  newToken.rawImage_Body.enabled = true;
  newToken.tokenRect = newToken.rawImage_Body:GetComponent("RectTransform");
  local rayCast = newToken.gameObject:GetComponent("GraphicRaycaster");
  newToken.hudObject:SetActive(false);
  rayCast.enabled = false;
  gameObject_TokenLeftSteps.transform:SetParent(newToken.transform);
  gameObject_TokenLeftSteps.transform.localPosition = tokenLeftStepsTextOffset;
  gameObject_TokenLeftSteps.transform.localScale = Vector3.one;
  newToken.text_Name.enabled = false;
  text_TokenLeftSteps.text = "";
  newToken.movePath = Queue.New();
  return newToken;
end

function UIMonopoly.UpdateToken(moveToken)
  if moveToken == nil then
    return
  end
  if moveToken.target == nil then
    UIMonopoly.CheckTokenInSight(mapRect.transform.localPosition, moveToken.transform.localPosition);
    return
  end

  if moveToken.step == nil then
    return
  end

  local targetPosition = moveToken.target.go.transform.position;
  local moveDir = targetPosition - moveToken.transform.position;
  local distance = Vector3.Distance(targetPosition, moveToken.transform.position);
  if distance <= moveToken.currentCell.boundary then
    this.TokenCrossCell(moveToken, moveToken.target);
  end

  moveToken.step = moveToken.step + 1;
  if moveToken.step >= moveStep then
    this.TokenReachTarget(moveToken, targetPosition);
  else
    this.MoveToken(moveToken, moveDir, moveToken.target);
  end
end

function UIMonopoly.StartMoveToken()
  if token == nil or token.movePath == nil then
    return
  end
  if token.target == nil then
    token.target = token.movePath:Dequeue();
  end
  if token.target ~= nil then
    this.SetFocus(token.transform.localPosition);
    this.CheckTokenInSight(mapRect.transform.localPosition, token.transform.localPosition);
    this.SetTokenMoveFlag(true);
    token.step = 0;
  end
end

function UIMonopoly.MoveToken(moveToken, moveDir, target)
  moveToken.transform.position = Vector3.Lerp(target.prevCell.go.transform.position, target.go.transform.position, moveToken.step / moveStep);
  this.SetFocus(moveToken.transform.localPosition);
  moveToken.position = Vector2.zero;
  moveDir = this.GetMapLocalPosition(moveDir);
  moveToken:FaceTo(moveDir, true);
  moveToken:SetAnimationForceId(ERolePose.Walk);
  moveToken:UpdateShow(false, 1);
  this.SetFocus(moveToken.transform.localPosition);
end

function UIMonopoly.TokenCrossCell(moveToken, targetCell)
  if moveToken.currentCell ~= nil then
    this.TriggerCellEvent(moveToken.currentCell, EMonopolyCellEventTrigger.leave);
  end
  moveToken.currentCell = targetCell;
  this.TriggerCellEvent(moveToken.currentCell, EMonopolyCellEventTrigger.enter);
end

function UIMonopoly.TokenReachTarget(moveToken, targetPosition)
  moveToken.transform.position = targetPosition;
  local target = moveToken.target;
  moveToken.target = moveToken.movePath:Dequeue();
  if moveToken.target == nil then
    this.TriggerCellEvent(target, EMonopolyCellEventTrigger.arrive);
    this.EndMoveToken(moveToken);
  else
    moveToken.step = 0;
    this.TriggerCellEvent(target, EMonopolyCellEventTrigger.pass);
  end
end

function UIMonopoly.TeleportToken(cellID, triggerEvent)
  if token == nil or cellID == nil then
    return
  end
  token.target, token.movePath = nil;
  local targetCell = this.GetCell(cellID);
  token.transform.position = targetCell.go.transform.position;
  this.TokenCrossCell(token, targetCell);

  this.SetFocusCell(targetCell);
  token:FaceTo(targetCell.defaultDirection, true);
  this.CheckTokenInSight(mapRect.transform.localPosition, token.transform.localPosition);
  this.EndMoveToken(token);
  if triggerEvent then
    this.TriggerCellEvent(targetCell, EMonopolyCellEventTrigger.teleport);
  end
end

function UIMonopoly.EndMoveToken(moveToken)
  moveToken.step = nil;
  moveToken:SetAnimationForceId(ERolePose.Stand);
  moveToken:UpdateShow(false, 1);
  moveToken.rawImage_Body.enabled = true;
  rawImage_StillDice.enabled = false;
  this.UpdateRollDiceButton();
  if autoRoll == true then
    Monopoly.RollDice();
  else
    this.SetTokenMoveFlag(false);
  end
end

function UIMonopoly.SetTokenMoveFlag(flag)
  tokenMoving = flag;
end

function UIMonopoly.SetTokenPath(path, clearPath)
  if token == nil or path == nil then
    return
  end
  if clearPath == true then
    token.movePath = path;
    token.Target = nil;
  else
    local pathCount = path.Count;
    if token.movePath == nil then
      token.movePath = path;
    else
      for _ = 1, pathCount do
        token.movePath:Enqueue(path:Dequeue());
      end
    end
  end
end
--endregion

--region Dice
function UIMonopoly.StartDiceEffect(diceResult)
  rawImage_RollingDice.uvRect = diceRollingEffectDefaultRect;
  rawImage_RollingDice.enabled = true;
  rawImage_StillDice.enabled = false;
  this.PlayRawImageEffect(rawImage_RollingDice, diceRollingEffectPage, diceEffectInterval,
    function()
      UIMonopoly.EndDiceEffect(diceResult);
      UIMonopoly.SetLeftStepText(diceResult);
      UIMonopoly.StartMoveToken();
      end
  )
end

function UIMonopoly.EndDiceEffect(diceResult)
  rawImage_RollingDice:StopShiftUV();
  rawImage_RollingDice.enabled = false;
  rawImage_StillDice.enabled = true;
  local result = math.clamp(diceResult, 1, diceResultImagePage);
  rawImage_StillDice.uvRect = diceUVRect[result];
end

function UIMonopoly.UpdateDiceCount()
  if not UI.IsVisible(UIMonopoly) then
    return
  end
  local diceCount = RoleCount.Get(ERoleCount.MonopolyDice);
  text_LeftDiceCount.text = string.format(string.Get(diceCountTextID), diceCount);
end
--endregion

--region RollDiceButton

function UIMonopoly.SwitchRollDiceButtonType(type)
  for index = 1, table.Count(rollDiceButtonType) do
    rollDiceButtonType[index].enabled = index == type;
  end
end

function UIMonopoly.UpdateRollDiceButton()
  local resultMessage = Monopoly.CheckRollDiceAvailable();
  local rollDiceAvailable = resultMessage == nil;
  if rollDiceAvailable then
    this.PlayRefreshButton();
  else
    this.SwitchRollDiceButtonType(ERollDiceButtonType.rollDice);
  end
end

function UIMonopoly.PlayRefreshButton()
  rawImage_RefreshButton.uvRect = buttonRefreshEffectDefaultRect;
  this.SwitchRollDiceButtonType(ERollDiceButtonType.refresh);
  this.PlayRawImageEffect(rawImage_RefreshButton, buttonRefreshEffectPage, buttonRefreshEffectInterval,
    function()
      this.SwitchRollDiceButtonType(ERollDiceButtonType.rollDice);
      rawImage_RefreshButton:StopShiftUV();
    end
  )
end

function UIMonopoly.PlayPushButton()
  rawImage_PushButton.uvRect = buttonPushEffectDefaultRect;
  this.SwitchRollDiceButtonType(ERollDiceButtonType.push);
  this.PlayRawImageEffect(rawImage_PushButton, buttonPushEffectPage, buttonPushEffectInterval,
    function()
      this.SwitchRollDiceButtonType(ERollDiceButtonType.disable);
      rawImage_PushButton:StopShiftUV();
    end
  )
end

function UIMonopoly.OnClick_AutoSwitch(uiEvent)
  this.SetAutoRoll();
end

function UIMonopoly.SetAutoRoll(state)
  if state == nil then
    autoRoll = not autoRoll;
  else
    autoRoll = state;
  end
  if tokenMoving and autoRoll then
    autoRoll = false;
  end
  if image_AutoSwitch ~= nil then
    image_AutoSwitch.sprite = UI.GetSwitchSprite(autoRoll);
  end
end
--endregion

--region View
function UIMonopoly.SetFocus(localPosition)
  local mapPosition = this.GetMapFocusPosition(localPosition);
  local x = Mathf.Clamp(mapPosition.x, contentRectMaxPosition.x, contentRectMinPosition.x);
  local y = Mathf.Clamp(mapPosition.y, contentRectMinPosition.y, contentRectMaxPosition.y);
  mapRect.transform.localPosition = Vector2.New(x, y);
end

function UIMonopoly.SetFocusCell(cell)
  local target = cell.cellRectTransform.localPosition;
  this.SetFocus(target);
end

function UIMonopoly.CheckTokenInSight(mapPosition, tokenPosition)
  local viewPortPosition = -mapPosition;
  local tokenCenter = tokenPosition + Vector3.New(0, token.tokenRect.sizeDelta.y * 0.5, 0);
  local xOffset = Mathf.Abs(viewPortPosition.x - tokenCenter.x);
  local yOffset = Mathf.Abs(viewPortPosition.y - tokenCenter.y);
  local tolerance = (viewPortSize - token.tokenRect.sizeDelta) * 0.5;
  if xOffset <= tolerance.x and yOffset <= tolerance.y then
    token.gameObject:SetActive(true);
    token:SetAnimationForceId(ERolePose.Stand);
    token:UpdateShow(false, 1);
  else
    token.gameObject:SetActive(false);
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
  end
end

function UIMonopoly.PlayRawImageEffect(rawImage, effectPage, effectInterval, callBack)
  rawImage:ShiftUV(1, effectPage, effectInterval);
  CGTimer.DoFunctionDelay(effectPage * effectInterval, callBack);
end

function UIMonopoly.ShowRewardMessage(cell)
  if cell.rewardMessage ~= nil then
    UICenterMessage.Clear();
    ShowCenterMessage(cell.rewardMessage);
  end
end

function UIMonopoly.ShowChatRewardMessage(cell)
  if cell.rewardMessage ~= nil then
    Chat.AddMessage(EChannel.System, cell.chatRewardMessage);
  end
end

function UIMonopoly.SetLeftStepText(steps)
  if steps == nil then return end
  text_TokenLeftSteps.text = steps;
end

function UIMonopoly.UpdateLeftStep()
  text_TokenLeftSteps.text = text_TokenLeftSteps.text - 1;
end

function UIMonopoly.HideLeftStep()
  text_TokenLeftSteps.text = "";
end

function UIMonopoly.ForceSetTokenPosition(offset)
  token.transform.position = token.transform.position + offset;
end

--endregion
