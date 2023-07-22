UIUseContract = {};
local this = UIUseContract;

this.name = "UIUseContract";
this.uiController = nil;

this.ContractName = "Contract";
this.PrivacyName = "Privacy";

local scroll_ContentRect;

local image_Agree;
local image_Checkmark;

local text_Title;
local text_Content;

local checkMark;

function UIUseContract.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;

  image_Agree = uiController:FindImage("Image_Agree");
  image_Checkmark = uiController:FindImage("Image_Checkmark");

  text_Title = uiController:FindText("Text_T1_Title");
  text_Content = uiController:FindText("Text_Content");

  scroll_ContentRect = uiController:FindGameObject("ScrollContent"):GetComponent("RectTransform");

  local tempEvent;

  tempEvent = uiController:FindEvent("Image_Agree");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Agree);

  tempEvent = uiController:FindEvent("Toggle_Agree");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Check);
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
end

function UIUseContract.OnOpen()
  checkMark = false;

  image_Agree.gameObject:SetActive(checkMark);
  image_Checkmark.gameObject:SetActive(checkMark);

  if CGResourceManager.ReadText(UIUseContract.ContractName) == "" then
    text_Title.text = string.Get(20867);
    if LuaHelper.CheckDefine("NFT") then
      text_Content.text = string.Get(23896);
    else
      text_Content.text = string.Get(20726);
    end
  elseif CGResourceManager.ReadText(UIUseContract.PrivacyName) == "" then
    text_Title.text = string.Get(20868);
    text_Content.text = string.Get(20727);
  end

  scroll_ContentRect.anchoredPosition = Vector2.New(0, 0);

  return true;
end

function UIUseContract.OnClick_Agree()
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
  if not checkMark then return end

  if CGResourceManager.ReadText(UIUseContract.ContractName) == "" then
    CGResourceManager.WriteText(this.ContractName, "1");

    this.ReOpen();

    return
  elseif CGResourceManager.ReadText(UIUseContract.PrivacyName) == "" then
    CGResourceManager.WriteText(this.PrivacyName, "1");
  end

  UI.Close(this);

  UI.Open(UILogin);
end

function UIUseContract.ReOpen()
  UI.Close(this);
  CGTimer.AddListener(this.ReOpenListener, 0.2, false);  
end

function UIUseContract.ReOpenListener()
  UI.Open(UIUseContract);
  CGTimer.RemoveListener(this.ReOpenListener);  
end

function UIUseContract.OnClick_Check()
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
  checkMark = not checkMark;

  image_Agree.gameObject:SetActive(checkMark);
  image_Checkmark.gameObject:SetActive(checkMark);
end