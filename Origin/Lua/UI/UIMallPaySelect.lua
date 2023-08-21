UIMallPaySelect = {}
local this = UIMallPaySelect;

this.name = "UIMallPaySelect";
this.uiController = nil;

local gameObject_PaySelect;
local gameObject_Mycard;
local gameObject_Neweb;
local text_Mycard;
local text_Neweb;
local currentIndex;

function UIMallPaySelect.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  
  gameObject_PaySelect = uiController:FindGameObject("GameObject_PaySelect");
  gameObject_Mycard = uiController:FindGameObject("Image_Mycard");
  gameObject_Neweb = uiController:FindGameObject("Image_Neweb");
  
  text_Mycard = uiController:FindText("Text_Mycard");
  text_Neweb = uiController:FindText("Text_Neweb");
  
  local tempEvent = uiController:FindEvent("Image_PaySelectMask");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);
  
  tempEvent = uiController:FindEvent("Image_Mycard");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_PcBuyMycard);
  
  tempEvent = uiController:FindEvent("Image_Neweb");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_PcBuyNewb);
end

function UIMallPaySelect.OnOpen(index)
  currentIndex = index;
  return true;
end

function UIMallPaySelect.OnClick_Close()
  UI.Close(UIMallPaySelect);
end

function UIMallPaySelect.OnClick_PcBuyMycard()
  MyCard.PcBuy(currentIndex);
  UI.Close(UIMallPaySelect);
end

function UIMallPaySelect.OnClick_PcBuyNewb()
  MyCard.NewebPay(currentIndex);
  UI.Close(UIMallPaySelect);
end