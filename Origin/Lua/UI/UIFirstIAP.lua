UIFirstIAP = {}
local this = UIFirstIAP;

this.name = "UIFirstIAP";
this.uiController = nil;

this.times = 1;
this.stored = false;

local text_Description;
local text_Deposit;

local rawImage_Title;
local rawImage_Role;
local transform_Role;

local event_Deposit;
local event_Close;

function UIFirstIAP.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;

  text_Description = uiController:FindText("Text_Description");
  text_Deposit = uiController:FindText("Text_Deposit");
  rawImage_Title = uiController:FindRawImage("Image_Title");
  rawImage_Role = uiController:FindRawImage("Image_Role");
  transform_Role = rawImage_Role.gameObject:GetComponent("RectTransform");

  event_Deposit = uiController:FindEvent("Image_Deposit");
  event_Deposit:SetListener(EventTriggerType.PointerClick, this.OnClickDeposit);
  event_Close = uiController:FindEvent("Image_Close");
  event_Close:SetListener(EventTriggerType.PointerClick, this.OnClickClose);

end

function UIFirstIAP.OnOpen()
  TextureManager.SetPng(ETextureUseType.UI, "common0_bod057", rawImage_Title);
  this.CheckIAPTimes();
  
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

function UIFirstIAP.OnClickDeposit()
  if this.stored then
    this.stored = not this.stored;
    text_Deposit.text = "Store Now";
    ShowCenterMessage("Success", 3);
    this.times = math.fmod(this.times, 3) + 1;
    this.CheckIAPTimes();
  else
    this.stored = not this.stored;
    text_Deposit.text = "Get Award";
    ShowCenterMessage("Success", 3);
  end
end

function UIFirstIAP.OnClickClose()
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
    UI.Close(this);
    return true;
end

function UIFirstIAP.CheckIAPTimes()
  if this.times == 1 then
    TextureManager.SetPng(ETextureUseType.UI, "common0_bod055", rawImage_Role);
    transform_Role.localPosition = Vector2.New(-335.8, 32.3);
    transform_Role.sizeDelta = Vector2.New(385, 504);
  elseif this.times == 2 then
    TextureManager.SetPng(ETextureUseType.UI, "common0_bod058", rawImage_Role);
    transform_Role.localPosition = Vector2.New(-330.6, 22.7);
    transform_Role.sizeDelta = Vector2.New(394, 446);
  elseif this.times == 3 then
    TextureManager.SetPng(ETextureUseType.UI, "common0_bod059", rawImage_Role);
    transform_Role.localPosition = Vector2.New(-260.8, 58);
    transform_Role.sizeDelta = Vector2.New(294, 406);
  end
end