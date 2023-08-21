
UIDragonBoat = {}
local this = UIDragonBoat;

this.name = "UIDragonBoat";
this.uiController = nil;

--ui
local rawImage_State;
local text_Count;

local event_Row;

--var
local startTime = nil;
local showTime = 0;
local state = 0; --0:無 1:倒數 2:開始 3:結束

function UIDragonBoat.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;

  rawImage_State = uiController:FindRawImage("RawImage_State");
  rawImage_State.enabled = false;

  text_Count = uiController:FindText("Text_Count");

  event_Row = uiController:FindEvent("Image_Row");
  event_Row:SetListener(EventTriggerType.PointerDown, this.OnDown_Row);
  event_Row:SetListener(EventTriggerType.PointerUp, this.OnUp_Row);
end

function UIDragonBoat.OnOpen()
  this.UpdateUI();

  return true;
end

function UIDragonBoat.OnClose()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if SceneManager.dragonBoatEffect ~= nil then
    SceneManager.dragonBoatEffect:Stop();
  end

  return true;
end

function UIDragonBoat.Update()
  if state ~= 1 then return end
  if startTime == nil then return end
  if showTime == math.ceil(startTime - CGTimer.time) then return end
  
  if startTime <= CGTimer.time then
    startTime = nil;
    state = 2;
  end

  this.UpdateUI();
end

function UIDragonBoat.UpdateUI()
  if this.uiController == nil then return end

  if state == 1 then
    TextureManager.SetPng(ETextureUseType.UI, "DragonBoat_Start", rawImage_State);
    rawImage_State:SetNativeSize();
    rawImage_State.enabled = true;

    showTime = math.ceil(startTime - CGTimer.time);
    text_Count.text = showTime;

    event_Row.gameObject:SetActive(false);

  elseif state == 2 then
    rawImage_State.texture = nil;
    rawImage_State.enabled = false;

    text_Count.text = "";

    event_Row.gameObject:SetActive(true);

  elseif state == 3 then
    TextureManager.SetPng(ETextureUseType.UI, "L10788", rawImage_State);
    rawImage_State:SetNativeSize();
    rawImage_State.enabled = true;

    text_Count.text = "";

    event_Row.gameObject:SetActive(false);

  else
    rawImage_State.texture = nil;
    rawImage_State.enabled = false;

    text_Count.text = "";
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    
    event_Row.gameObject:SetActive(false);
  end
end

function UIDragonBoat.OnDown_Row()
  --C:070-001 <龍舟按下>
  Network.Send(70, 1);

  if SceneManager.dragonBoatEffect ~= nil then
    SceneManager.dragonBoatEffect:Stop();
  end

  SceneManager.dragonBoatEffect = EffectLight.New(10327, math.random(80, 110), 7, 1, 7, EEffectLightTracer.Child, 0, 0, 32);
  SceneManager.dragonBoatEffect.rectTransform:SetParent(Role.player.transform);
  SceneManager.dragonBoatEffect.rectTransform.localPosition = Vector3.New(-SceneManager.dragonBoatEffect.width * 0.5, SceneManager.dragonBoatEffect.height - 33);
  SceneManager.dragonBoatEffect.rectTransform.localScale = Vector3.one;
end

function UIDragonBoat.OnUp_Row()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --C:070-002 <龍舟放開>
  Network.Send(70, 2);

  if SceneManager.dragonBoatEffect ~= nil then
    SceneManager.dragonBoatEffect:Stop();
  end
end

function UIDragonBoat.RaceCountDown()
  startTime = CGTimer.time + 5;
  state = 1;

  this.UpdateUI();
end

function UIDragonBoat.RaceEnd()
  startTime = nil;
  state = 3;

  this.UpdateUI();
end