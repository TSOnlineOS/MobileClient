UIInn = {}
local this = UIInn;

this.name = "UIInn";
this.uiController = nil;

--ui
local image_Mask;
local rawImage_Sleep;

--var
local texture_Sleeps = {};
local step = 0;
local updateTime = 0;
local callback;
local innStyle = 1;

function UIInn.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;

  this.uiController:SetFadeIn(0.7, this.FadeIn);
  this.uiController:SetFadeOut(1, this.FadeOut);

  image_Mask = uiController:FindImage("Image_Mask");

  rawImage_Sleep = uiController:FindRawImage("RawImage_Sleep");

  texture_Sleeps[1] = {};
  texture_Sleeps[1][1] = "InnSleep_1";
  texture_Sleeps[1][2] = "InnSleep_2";
  texture_Sleeps[1][3] = "InnSleep_3";
  texture_Sleeps[1][4] = "InnSleep_4";
  texture_Sleeps[1][5] = "InnSleep_5";

  texture_Sleeps[2] = {};
  texture_Sleeps[2][1] = "ItemSleep_1";
  texture_Sleeps[2][2] = "ItemSleep_2";
  texture_Sleeps[2][3] = "ItemSleep_3";
  texture_Sleeps[2][4] = "ItemSleep_4";
  texture_Sleeps[2][5] = "ItemSleep_5";
end

function UIInn.OnOpen(callbackFunction, style)
  step = 0;
  updateTime = 0;
  callback = callbackFunction;

  if not Contains(style, 1, 2) then
    innStyle = 1;
  else
    innStyle = style;
  end

  TextureManager.SetPng(ETextureUseType.None, texture_Sleeps[innStyle][1], rawImage_Sleep);
  return true;
end

function UIInn.OnClose()
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

  return true;
end

function UIInn.Update()
  if updateTime == 0 then return end
  if updateTime > CGTimer.time then return end

  updateTime = CGTimer.time + 0.4;

  if step > 9 then
    UI.Close(UIInn);
    step = 0;
  elseif step > 8 then
    TextureManager.SetPng(ETextureUseType.None, texture_Sleeps[innStyle][5], rawImage_Sleep);
    step = step + 1;
  elseif step > 0 then
    TextureManager.SetPng(ETextureUseType.None, texture_Sleeps[innStyle][((step - 1) % 4) + 1], rawImage_Sleep);
    step = step + 1;
  end
end

function UIInn.FadeIn(progress)
  image_Mask:CrossFadeAlpha(progress, 0, true);
  rawImage_Sleep:CrossFadeAlpha(progress, 0, true);

  if progress == 1 then
    step = 1;
    updateTime = CGTimer.time;
  end
end

function UIInn.FadeOut(progress)
  image_Mask:CrossFadeAlpha(1 - progress, 0, true);
  rawImage_Sleep:CrossFadeAlpha(1 - progress, 0, true);

  if progress == 1 then
    if callback ~= nil then
      callback();
    end
    
    callback = nil;
  end
end