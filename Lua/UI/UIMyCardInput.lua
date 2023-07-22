EMyCardInputKind = {
  BattlePass = 1,
  Others = 2,
}

UIMyCardInput = {}
local this = UIMyCardInput;
local uiController;

this.name = "UIMyCardInput";
this.uiController = nil;

local inputField_Number;
local inputField_Password;
local gameObject_Input;
local currentPlatform;
local currentKind;

function UIMyCardInput.Initialize(go)
  uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  
  gameObject_Input = uiController:FindGameObject("GameObject_MyCardInput");
  inputField_Number = uiController:FindInputField("InputField_Number");
  inputField_Password = uiController:FindInputField("InputField_Password");
  
  local tempEvent;
  tempEvent = uiController:FindEvent("Image_InputMask");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_InputMask);
  
  tempEvent = uiController:FindEvent("Image_Send");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Send);
end

function UIMyCardInput.OnOpen(platform, kind)
  currentPlatform = platform;
  currentKind = kind;
  return true;
end

function UIMyCardInput.OnClose()
  currentPlatform = nil;
  currentKind = nil;
  inputField_Number.text = "";
  inputField_Password.text = "";
  return true;
end

function UIMyCardInput.OnClick_InputMask(uiEvent)
  UI.Close(this);
end

function UIMyCardInput.OnClick_Send()
  if currentPlatform == nil or currentKind == nil then
    logError("Unknow platform or inputkind.")
    return;
  elseif currentKind == EMyCardInputKind.Others then
    StoreValue.BuyPointCard(currentPlatform, inputField_Number.text, inputField_Password.text);
  elseif currentKind == EMyCardInputKind.BattlePass then
    BattlePass.RequireCheckBattlePassFunctionByMyCard(inputField_Number.text, inputField_Password.text)
  else
    logError("Out of known inputkind.")
    return;
  end
  UI.Close(this);
end

