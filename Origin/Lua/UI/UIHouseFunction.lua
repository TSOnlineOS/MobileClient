EHouseWelfare =
{
  Normal = 1, --一般家具扭蛋
  Advanced = 2, --高級家具扭蛋
}

UIHouseFunction = {}
local this = UIHouseFunction;
this.name = "UIHouseFunction";
this.uiController = nil;

local gameObject_FirstFloor;
local image_FirstFloor;
local text_FirstFloor;
local text_FirstFloorOutline;

local gameObject_SecondFloor;
local image_SecondFloor;
local text_SecondFloor;
local text_SecondFloorOutline;
local image_RedDot;

local gameObject_AdvancedWelfare;
local image_AdvancedWelfare;
local gameObject_NormalWelfare;
local image_NormalWelfare;
local hasNormalWelfare = false;
local hasAdvancedWelfare = false;
local onclickKind;

function UIHouseFunction.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;

  local tempEvent;
  gameObject_FirstFloor = uiController:FindGameObject("FirstFloor");
  image_FirstFloor = gameObject_FirstFloor.transform:Find("Image_BG"):GetComponent("Image");

  tempEvent = gameObject_FirstFloor.transform:Find("Image_BG"):GetComponent("UIEvent");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Floor);
  tempEvent.parameter = EHouseFloor.FirstFloor;

  text_FirstFloor = gameObject_FirstFloor.transform:Find("Text"):GetComponent("Text");
  text_FirstFloorOutline = gameObject_FirstFloor.transform:Find("Text"):GetComponent("Outline8");

  gameObject_SecondFloor = uiController:FindGameObject("SecondFloor");
  image_SecondFloor = gameObject_SecondFloor.transform:Find("Image_BG"):GetComponent("Image");

  tempEvent = gameObject_SecondFloor.transform:Find("Image_BG"):GetComponent("UIEvent");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Floor);
  tempEvent.parameter = EHouseFloor.SecondFloor;

  text_SecondFloor = gameObject_SecondFloor.transform:Find("Text"):GetComponent("Text");
  text_SecondFloorOutline = gameObject_SecondFloor.transform:Find("Text"):GetComponent("Outline8");

  gameObject_AdvancedWelfare = uiController:FindGameObject("Advanced");
  image_AdvancedWelfare = gameObject_AdvancedWelfare.transform:Find("Image_BG"):GetComponent("Image");

  tempEvent = gameObject_AdvancedWelfare.transform:Find("Image_BG"):GetComponent("UIEvent");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Welfare);
  tempEvent.parameter = EHouseWelfare.Advanced;

  gameObject_NormalWelfare = uiController:FindGameObject("Normal");
  image_NormalWelfare = gameObject_NormalWelfare.transform:Find("Image_BG"):GetComponent("Image");

  tempEvent = gameObject_NormalWelfare.transform:Find("Image_BG"):GetComponent("UIEvent");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Welfare);
  tempEvent.parameter = EHouseWelfare.Normal;

  image_RedDot = gameObject_SecondFloor.transform:Find("Image_Dot"):GetComponent("Image");
  image_RedDot.gameObject:SetActive(false);
end

function UIHouseFunction.OnOpen()
  local floor = HouseManager.GetCurrentFloor();
  this.ChangeUIFloor(floor);
  gameObject_NormalWelfare:SetActive(hasNormalWelfare);
  gameObject_AdvancedWelfare:SetActive(hasAdvancedWelfare);
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
end

function UIHouseFunction.OnClick_Floor(uiEvent)
  if uiEvent.parameter == HouseManager.GetCurrentFloor() then return end
  HouseManager.OnClick_ChangeFloor(uiEvent.parameter);
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

function UIHouseFunction.OnClick_Welfare(uiEvent)
  onclickKind = uiEvent.parameter;
  if onclickKind == nil then return end
  if Item.CheckBagIsFull(true) then return end

  --C:106-011 <領取轉蛋卷> +房屋主人ID(8) +kind(1) +房屋編號(1) +樓層(1)
  sendBuffer:Clear();
  sendBuffer:WriteInt64(HouseManager.GetHouseOwnerId());
  sendBuffer:WriteByte(onclickKind);
  sendBuffer:WriteByte(HouseManager.GetCurrentBuilding());
  sendBuffer:WriteByte(HouseManager.GetCurrentFloor());
  Network.Send(106, 11, sendBuffer);
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

function UIHouseFunction.ChangeUIFloor(floor)
  if floor == EHouseFloor.FirstFloor then
    text_FirstFloorOutline.enabled = true;
    text_FirstFloor.color = Color.White;
    text_SecondFloorOutline.enabled = false;
    text_SecondFloor.color = Color.HouseGrayBlue;
  elseif floor == EHouseFloor.SecondFloor  then
    text_FirstFloorOutline.enabled = false;
    text_FirstFloor.color = Color.HouseGrayBlue;
    text_SecondFloorOutline.enabled = true;
    text_SecondFloor.color = Color.White;
  end
end

function UIHouseFunction.ReceiveWelfareData(state, welfare)
  local active = false;

  if state == 1 then
    active = true;
  end

  if welfare == EHouseWelfare.Normal then
    hasNormalWelfare = active;
    if gameObject_NormalWelfare ~= nil then
      gameObject_NormalWelfare:SetActive(hasNormalWelfare)
    end
  elseif welfare == EHouseWelfare.Advanced then
    hasAdvancedWelfare = active;
    if gameObject_AdvancedWelfare ~= nil then
      gameObject_AdvancedWelfare:SetActive(hasAdvancedWelfare)
    end
  end
end

function UIHouseFunction.ReceiveResult()
  if onclickKind == EHouseWelfare.Normal then
    hasNormalWelfare = false;
    if gameObject_NormalWelfare ~= nil then
      gameObject_NormalWelfare:SetActive(hasNormalWelfare)
    end
  elseif onclickKind == EHouseWelfare.Advanced then
    hasAdvancedWelfare = false;
    if gameObject_AdvancedWelfare ~= nil then
      gameObject_AdvancedWelfare:SetActive(hasAdvancedWelfare)
    end
  end
  onclickKind = nil;
end

function UIHouseFunction.CheckRedDot()
  RedDot.Remove(ERedDot.OtherHouse);
  image_RedDot.gameObject:SetActive(false);
  if not HouseManager.IsMyHouse() then return end
  local houseTotalLevel = HouseManager.GetTotalLevel();
  local amountOfFurnitureKind, goldSpend = HouseManager.GetSpendElement();
  local newHouse, newFloorLevel = HouseExpandConditionData.GetBuildingAndFloorLevel(houseTotalLevel + 1);

  if amountOfFurnitureKind == nil or goldSpend == nil then return end
  if FurnitureCollection.GetCollectAttribute(EFurnitureCollectAttribute.FurnitureKindCount) == nil then return end

  if amountOfFurnitureKind <= FurnitureCollection.GetCollectAttribute(EFurnitureCollectAttribute.FurnitureKindCount) and goldSpend * 10000 <= Role.playerData.gold then
    if newHouse == HouseManager.GetCurrentBuildingLevel() + 1 then
      RedDot.Add(ERedDot.OtherHouse);
    elseif newFloorLevel > HouseManager.GetCurrentFloorLevel() then
      image_RedDot.gameObject:SetActive(true);
    end
  end
end