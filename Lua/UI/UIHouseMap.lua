UIHouseMap = {}
local this = UIHouseMap;

this.name = "UIHouseMap";
this.uiController = nil;

--ui
local transform_FrameRect;

local rawImage_BG;

--var
local house = {};
local click = 1;
local animationOffset = 10;
local animationSpeed = 0.5;
local isUp = true;
local pointOriginPos;

function UIHouseMap.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;
  this.uiController.onClose = this.OnClose;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;

  house.object = {};
  house.event = {};
  house.point = {};
  house.pointRectTransform = {};
  house.lock = {};
  house.lockBG = {};
  house.canOpen = {};
  house.isOpen = {};
  house.openHint = {};
  house.hintText = {};

  local gameObjectTemp;
  gameObjectTemp = uiController:FindGameObject("Image_House1");
  table.insert(house.object, gameObjectTemp);
  gameObjectTemp = uiController:FindGameObject("Image_House2");
  table.insert(house.object, gameObjectTemp);
  gameObjectTemp = uiController:FindGameObject("Image_House3");
  table.insert(house.object, gameObjectTemp);
  gameObjectTemp = uiController:FindGameObject("Image_House4");
  table.insert(house.object, gameObjectTemp);

  for k, v in pairs(house.object) do
    house.event[k] = v:GetComponent("UIEvent");
    house.event[k]:SetListener(EventTriggerType.PointerClick, this.OnClick_GoHouse);
    house.event[k].parameter = k;

    house.point[k] = v.transform:Find("Image_Here"):GetComponent("Image");
    house.point[k].enabled = false;

    house.pointRectTransform[k] = house.point[k]:GetComponent("RectTransform");
    pointOriginPos = house.pointRectTransform[k].anchoredPosition;

    house.lock[k] = v.transform:Find("Image_Lock"):GetComponent("Image");
    house.lock[k].enabled = true;

    house.lockBG[k] = v:GetComponent("Image");

    house.openHint[k] = v.transform:Find("Image_Hint").gameObject;
    house.hintText[k] = house.openHint[k].transform:Find("Text_"):GetComponent("Text");

    house.canOpen[k] = v.transform:Find("Image_CanOpen").gameObject;

  end

  rawImage_BG = this.uiController:FindRawImage("RawImage_BG");

end

function UIHouseMap.OnOpen()
  HouseManager.SendAskHouseTotalLevel();
  CGTimer.AddListener(this.PointAnimation, 0, true);
  TextureManager.SetPng(ETextureUseType.UI, "pic_018",  rawImage_BG);
  this.SetHouseOpen();
  return true;
end

function UIHouseMap.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(23455), this.OnClick_Close, this.OnClick_Help, nil);
    this.UpdateUI();
  end
end

function UIHouseMap.OnClick_Help(checkShow)
  if checkShow ~= true then
    UI.Open(UITutorialHint, 0, this, string.Get(23455), string.Get(23602));
  end

  return true;
end

function UIHouseMap.OnClose()
  this.PointAnimationEnd();
  return true;
end

function UIHouseMap.OnClick_Close()
  UI.Close(UIHouseMap);
end

function UIHouseMap.SetHouseOpen()
  for k = 1, table.Count(EHouseBuilding) do
    house.isOpen[k] = HouseManager.HouseIsOpen(k);
  end
end

function UIHouseMap.UpdateUI()
  for k = 1, table.Count(EHouseBuilding) do
    house.lock[k].enabled = not house.isOpen[k];
    house.canOpen[k]:SetActive(HouseManager.HouseCanOpen(k) and not house.isOpen[k] and HouseManager.IsMyHouse());
    house.openHint[k]:SetActive(false);
    house.hintText[k].text = string.format(string.Get(23577), k - 1, "\n");

    if house.isOpen[k] then
      house.lockBG[k].color = Color.White;
    else
      house.lockBG[k].color = Color.Gray;
    end

    if k == HouseManager.GetCurrentBuilding() then
      house.point[k].enabled = true;
    else
      house.point[k].enabled = false;
    end
  end
end

function UIHouseMap.OnClick_GoHouse(uiEvent)
  click = uiEvent.parameter;

  if house.isOpen[click] and HouseManager.GetCurrentBuilding() ~= click then
    HouseManager.ChangeHouse(click, EHouseFloor.FirstFloor);
    UIHouseMap.UpdateUI();
    UI.Close(UIHouseMap);
  else
    if HouseManager.HouseCanOpen(click) and HouseManager.IsMyHouse() then
      HouseManager.ShowCheckExpandMessage(EHouseFloorLevel.FirstUnExpanded, click);
    elseif not HouseManager.HouseCanOpen(click) and not HouseManager.IsMyHouse() then
      ShowCenterMessage(string.Get(40466));
    end
  end

  if HouseManager.IsMyHouse() then
    for i = 1, table.Count(EHouseBuilding) do
      if i == click then
        house.openHint[i]:SetActive(not house.openHint[i].activeSelf and not HouseManager.HouseCanOpen(i));
      else
        house.openHint[i]:SetActive(false);
      end
    end
  end
end

function UIHouseMap.UnlockHouse(number, isOpen)
  house.isOpen[number] = isOpen;
  this.UpdateUI();
end

function UIHouseMap.PointAnimation()
  local currentHouse = HouseManager.GetCurrentBuilding();

  if isUp then
    if house.pointRectTransform[currentHouse].anchoredPosition.y < pointOriginPos.y + animationOffset then
      house.pointRectTransform[currentHouse].anchoredPosition = Vector2.New(pointOriginPos.x, house.pointRectTransform[currentHouse].anchoredPosition.y + animationSpeed);
    end

    if house.pointRectTransform[currentHouse].anchoredPosition.y >= pointOriginPos.y + animationOffset then
      isUp = false;
    end
  else
    if house.pointRectTransform[currentHouse].anchoredPosition.y > pointOriginPos.y then
      house.pointRectTransform[currentHouse].anchoredPosition = Vector2.New(pointOriginPos.x, house.pointRectTransform[currentHouse].anchoredPosition.y - animationSpeed);
    end

    if house.pointRectTransform[currentHouse].anchoredPosition.y <= pointOriginPos.y then
      isUp = true;
    end
  end
end

function UIHouseMap.PointAnimationEnd()
  for i = 1, table.Count(EHouseBuilding) do
    house.pointRectTransform[i].anchoredPosition = pointOriginPos;
  end

  isUp = true;
  CGTimer.RemoveListener(this.PointAnimation);
end

