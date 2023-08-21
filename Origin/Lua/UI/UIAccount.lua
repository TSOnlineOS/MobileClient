UIAccount = {}
local this = UIAccount;

this.name = "UIAccount";
this.uiController = nil;

local transform_FrameRect;

local text_Kind;
local text_Account;

local image_FBLock;
local image_GoogleLock;

local event_FB;
local event_Google;

function UIAccount.Initialize(go)
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;
  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;

  text_Kind = uiController:FindText("Text_Kind");
  text_Account = uiController:FindText("Text_Account");

  image_FBLock = uiController:FindImage("Image_FBLock");
  image_GoogleLock = uiController:FindImage("Image_GoogleLock");

  event_FB = uiController:FindEvent("Image_FB");
  event_FB:SetListener(EventTriggerType.PointerClick, this.OnClick_Bind);
  event_FB.parameter = EAccount.FB;
  
  event_Google = uiController:FindEvent("Image_Google");
  event_Google:SetListener(EventTriggerType.PointerClick, this.OnClick_Bind);
  event_Google.parameter = EAccount.Google;
end

function UIAccount.OnOpen()
  return true;
end

function UIAccount.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(21088), this.OnClick_Close);
    this.UpdateUI();
  end
end

function UIAccount.UpdateUI()
  text_Account.text = Network.account;

  if Network.accountKind == EAccount.FB then
    text_Kind.text = string.Get(21129);

    image_FBLock.gameObject:SetActive(true);
    event_FB:SetColor(Color.LightGray);
  elseif Network.accountKind == EAccount.Google then
    image_GoogleLock.gameObject:SetActive(true);
    event_Google:SetColor(Color.LightGray);
  else
    if string.find(Network.account, "@fast") ~= nil then
      text_Kind.text = string.Get(21128);
  
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
      
    else
      text_Kind.text = string.Get(21127);
    end

    image_FBLock.gameObject:SetActive(false);
    image_GoogleLock.gameObject:SetActive(false);
    event_FB:SetColor(Color.White);
    event_Google:SetColor(Color.White);
  end
  
  event_Google.gameObject:SetActive(false);  --google綁定的功能server未完成所以先關閉
  
end

function UIAccount.OnClick_Close(uiEvent)
  UI.Close(UIAccount);
  return true;
end

function UIAccount.OnClick_Bind(uiEvent)
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if Network.accountKind == uiEvent.parameter then return end
  
  if uiEvent.parameter == EAccount.FB then
    CGFacebook.Login(
      function(errorMessage)
        if string.IsNullOrEmpty(errorMessage) then
          logError(CGFacebook.userId);
          logError(CGFacebook.accessToken);
          
          --C:001-003 <帳號綁定> +綁定方式(1)
          --綁定方式 1:FB +L(1) +UserId(L) +L(1) +AccessToken(L)
          sendBuffer:Clear();
          sendBuffer:WriteByte(EAccount.FB);
          sendBuffer:WriteStringWithWordL(CGFacebook.userId);
          sendBuffer:WriteStringWithWordL(CGFacebook.accessToken);
          Network.Send(1, 3, sendBuffer);
        else
          logError(errorMessage);
        end
      end,
      "public_profile"
    );
  elseif uiEvent.parameter == EAccount.Google then
    CGGoogleSignIn.Login(
      function(errorMessage)
        if string.IsNullOrEmpty(errorMessage) then
          if Define.IsDebugMode() then
            logError("Google Id : ".. CGGoogleSignIn.Id);
            logError("Google Token : ".. CGGoogleSignIn.Token);
          end
  
          --C:001-003 <帳號綁定> +綁定方式(1)
          --綁定方式 1:Google +L(1) +Id(L) +L(1) +Token(L)
          sendBuffer:Clear();
          sendBuffer:WriteByte(EAccount.Google);
          sendBuffer:WriteStringWithWordL(CGGoogleSignIn.Id);
          sendBuffer:WriteStringWithWordL(CGGoogleSignIn.Token);
          Network.Send(1, 3, sendBuffer);
        else
          logError(errorMessage);
        end
      end
    );
  end
end