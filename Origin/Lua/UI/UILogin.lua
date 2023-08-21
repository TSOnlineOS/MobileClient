UILogin = {}
local this = UILogin;

this.name = "UILogin";
this.uiController = nil;
this.loginKind = 0;
this.loginToken = 0;

--ui
local gameObjcet_Server;
local gameObject_Account;
local gameObject_LastRecordBG
local gameObject_CGLogin;
local gameObject_LoginInfo;
local gameObject_Warning;
local gameObject_WebInfo;

local inputField_Account;
local inputField_Password;

local scrollContent_Server;
local scrollItems_Server = {};

local rawImage_BG;
local rawImage_FG;
local rawImage_Cloud_1;
local rawImage_Cloud_2;
local rawImage_ServerBG;

local text_Version;
local text_ServerTittle;
local text_LastServer;
local text_Cancel;

--var
local lastServerIndex = 0;
local currentIndex = 0;
local nowAccount;
local WarningFlag = nil;

local webLoginInterval = 2;

function UILogin.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;

  gameObjcet_Server = uiController:FindGameObject("RawImage_ServerBG");
  gameObject_Account = uiController:FindGameObject("Image_AccountBG");
  gameObject_LastRecordBG = uiController:FindGameObject("Image_LastRecordBG");
  
  gameObject_CGLogin = uiController:FindGameObject("CGLogin");
  gameObject_LoginInfo = uiController:FindGameObject("Login_Info");
  gameObject_WebInfo = uiController:FindGameObject("Text_WebInfo");
  gameObject_Warning = uiController:FindGameObject("Warning");

  rawImage_BG = uiController:FindRawImage("RawImage_BG");
  rawImage_FG = uiController:FindRawImage("RawImage_FG");
  rawImage_Cloud_1 = uiController:FindRawImage("RawImage_Cloud_1");
  rawImage_Cloud_2 = uiController:FindRawImage("RawImage_Cloud_2");
  rawImage_ServerBG = uiController:FindRawImage("RawImage_ServerBG");

  inputField_Account = uiController:FindInputField("InputField_Account"):GetComponent("UIInputField");
  inputField_Password = uiController:FindInputField("InputField_Password");

  text_Version = uiController:FindText("Text_Version");
  text_ServerTittle = uiController:FindText("Text_ServerTittle");
  text_LastServer = uiController:FindText("Text_LastServer");
  text_Cancel = uiController:FindText("Text_Cancel");

  scrollContent_Server = uiController:FindScrollContent("ScrollContent_Server");
  scrollContent_Server.onInitialize = this.OnInitialize_ScrollContent_Server;
  scrollContent_Server.onItemChange = this.OnItemChange_ScrollContent_Server;
  scrollContent_Server:Initialize(1);
  
  local tempEvent = uiController:FindEvent("Image_CG");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_CGLogin);
  local flag = CGResourceManager.DownloadText("CGLogin.dat", false);
  if flag ~= nil and flag == "1" then
    tempEvent.gameObject:SetActive(true);
  else
    tempEvent.gameObject:SetActive(false);
  end
  
  local tempEvent = uiController:FindEvent("Image_Guest");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Guest);
  local flag = CGResourceManager.DownloadText("GustLogin.dat", false);
  if flag ~= nil and flag == "1" then
    tempEvent.gameObject:SetActive(true);
  else
    tempEvent.gameObject:SetActive(false);
  end

  local tempEvent = uiController:FindEvent("Image_FB");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_FB);

  local tempEvent = uiController:FindEvent("Image_Apple");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Apple);
  if LuaHelper.IsApplePlatform then
    local mainVersion;
    local version = LuaHelper.GetiOSversion();
    for i in string.gmatch(version, "[^%.]+") do
      mainVersion = tonumber(i);
      break;
    end
    if mainVersion == nil then
      tempEvent.gameObject:SetActive(false);
    else
      tempEvent.gameObject:SetActive(mainVersion >= 13);
    end
  elseif LuaHelper.IsStandalone then
    tempEvent.gameObject:SetActive(true);
  else
    tempEvent.gameObject:SetActive(false);
  end
  
  local tempEvent = uiController:FindEvent("Image_Google");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Google);
  tempEvent.gameObject:SetActive(LuaHelper.IsAndroidPlatform or LuaHelper.IsStandalone);
  
  local tempEvent = uiController:FindEvent("Image_Connect");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Connect);

  tempEvent = uiController:FindEvent("Image_Cancel");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Cancel);

  this.ForIphoneXScreen();
end

function UILogin.OnOpen()
  local loadingGO = GameObject.Find("UI_Loading");
  if loadingGO ~= nil then
    loadingGO:SetActive(false);
  end
  
  gameObject_Warning:SetActive(false);
  
  WarningFlag = CGResourceManager.DownloadText("Warning.dat", false);
  if WarningFlag ~= nil and WarningFlag == "1" then
    if Setting.client.lastLoginKind == ELogin.AccPwd then
      gameObject_Warning:SetActive(true);
    end
  end
  
  AudioManager.PlayStartMusic();
  if LuaHelper.IsStandalone then
    WebLogin.AuthorizeInterval = webLoginInterval;
  end

  Network.Disconnect();

  --上次登入資訊
  inputField_Account.text = Setting.client.lastAccount;
  inputField_Password.text = Setting.client.lastPassword;

  lastServerIndex = 0;
  currentIndex = 0;
  for k, v in pairs(Network.servers) do
    if v.id == Setting.client.lastServerId then
      lastServerIndex = k;
      currentIndex = k;
    end
  end

  --版本資訊
  local exeVersion = "";
  if LuaHelper.CheckDefine("ReleaseTest") then
    exeVersion = "_ReleaseTest";
  elseif LuaHelper.CheckDefine("QA") then
    exeVersion = "_QA";
  elseif LuaHelper.CheckDefine("Debug") then
    exeVersion = "_Debug";
  end

  if LuaHelper.IsAndroidPlatform then
    if LuaHelper.CheckDefine("MyCard") then
      exeVersion = exeVersion.."_MyCard";
    else
      exeVersion = exeVersion.."_Android";
    end
  elseif LuaHelper.IsApplePlatform then
    exeVersion = exeVersion.."_IOS";
  end
  
  local gameVer = string.Concat(" (", string.gsub(LuaHelper.GetVersion(), "_%a+", "", 1), ")");
  text_Version.text = string.format( string.Get(20345), CGResourceManager.resourceVersion .. exeVersion .. gameVer );

  this.UpdateUI();

  return true;
end

function UILogin.Update()
  CGAppleSignIn.ExecuteCallbacks();
end

function UILogin.UpdateUI()
  TextureManager.SetPng(ETextureUseType.UI, "common0_bod040", rawImage_BG);
  TextureManager.SetPng(ETextureUseType.UI, "common0_bod152", rawImage_FG);
  TextureManager.SetPng(ETextureUseType.UI, "common0_bod102", rawImage_Cloud_1);
  TextureManager.SetPng(ETextureUseType.UI, "common0_bod102", rawImage_Cloud_2);

  if currentIndex > 0 then
    --輸入帳密
    gameObjcet_Server:SetActive(false);
    gameObject_Account:SetActive(true);

    text_ServerTittle.text = Network.servers[currentIndex].name;
  else
    --伺服器列表
    gameObjcet_Server:SetActive(true);
    gameObject_Account:SetActive(false);
    
    scrollContent_Server:Reset(table.maxn(Network.servers));

    text_ServerTittle.text = string.Get(20798);
  end

  gameObject_LastRecordBG:SetActive(lastServerIndex > 0);
  if lastServerIndex > 0 then
    text_LastServer.text = string.Concat(string.Get(20799), ":",  Network.servers[lastServerIndex].name);
  end

  if Network.connecting then
    text_Cancel.text = string.Get(20991);
  else
    text_Cancel.text = string.Get(21506);
  end
  
  local lastLoginKind = Setting.client.lastLoginKind;
  this.UpdateLoginInfo(lastLoginKind);
end

function UILogin.UpdateLoginInfo(loginKind)
  if loginKind == ELogin.AccPwd then
    gameObject_CGLogin:SetActive(true);
    gameObject_LoginInfo:SetActive(false);
    if WarningFlag ~= nil and WarningFlag == "1" then
      gameObject_Warning:SetActive(true);
    end
  else
    gameObject_CGLogin:SetActive(false);
    gameObject_LoginInfo:SetActive(true);
    gameObject_WebInfo:SetActive(false);
    gameObject_Warning:SetActive(false);
  end
end

function UILogin.OnInitialize_ScrollContent_Server(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Server[itemIndex] = {};
    scrollItems_Server[itemIndex].image_BG = scrollItems[itemIndex]:GetComponent("Image");
    scrollItems_Server[itemIndex].event_BG = scrollItems[itemIndex]:GetComponent("UIEvent");
    scrollItems_Server[itemIndex].event_BG:SetListener(EventTriggerType.PointerClick, this.OnClick_Server);
    scrollItems_Server[itemIndex].image_State = scrollItems[itemIndex]:Find("Image_State"):GetComponent("Image");
    scrollItems_Server[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
  end
end

function UILogin.OnItemChange_ScrollContent_Server(dataIndex, itemIndex)
  local serverInfo = Network.servers[dataIndex + 1];

  if serverInfo == nil then return false end

  scrollItems_Server[itemIndex].event_BG.parameter = dataIndex + 1;
  scrollItems_Server[itemIndex].image_State.sprite = UI.GetSeverLight(serverInfo.lightKind);
  scrollItems_Server[itemIndex].text_Name.text = serverInfo.name;

  return true;
end

function UILogin.OnClick_Server(uiEvent)
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
  currentIndex = uiEvent.parameter;

  this.UpdateUI();
end

function UILogin.OnClick_CGLogin()
  this.UpdateLoginInfo(ELogin.AccPwd);
  
  if WarningFlag ~= nil and WarningFlag == "1" then
    gameObject_Warning:SetActive(true);
  end
  
end

function UILogin.OnClick_Guest()
  if Network.connecting then return end
  if Network.servers[currentIndex] == nil then return end

  if string.find(Setting.client.lastAccount, "@fast") ~= nil then
    ShowCheckMessage(this.GuestLogin, string.Get(22176));
  else
    this.GuestLogin(true);
  end
end

function UILogin.GuestLogin(create)
  if create then
    this.loginKind = ELogin.Guest;
    Network.loginKind = ELogin.Guest;
    Network.account = "";
    Network.password = "";
  else
    this.loginKind = ELogin.AccPwd;
    Network.loginKind = ELogin.AccPwd;
    Network.account = Setting.client.lastAccount;
    Network.password = Setting.client.lastPassword;
  end

  Network.serverId = Network.servers[currentIndex].id;
  Network.host = Network.servers[currentIndex].host;
  Network.port = Network.servers[currentIndex].port;
  Network.connectCode = 0;

  Network.Connect();

  this.UpdateUI();
end

function UILogin.OnClick_FB()
  if Network.connecting then return end
  if Network.servers[currentIndex] == nil then return end
  
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
  this.UpdateLoginInfo(ELogin.FB);

  if this.CheckAuthorizing() then
    ShowCenterMessage(string.Get(24116));
    return
  end

  if LuaHelper.IsStandalone then
    gameObject_WebInfo:SetActive(true);
  end

  CGFacebook.Login(
    function(errorMessage)
      if string.IsNullOrEmpty(errorMessage) then
        if Define.IsDebugMode() then
          logError("Facebook id"..CGFacebook.userId);
          logError("Facebook token : "..CGFacebook.accessToken);
        end

        if LuaHelper.IsStandalone then
          gameObject_WebInfo:SetActive(false);
        end

        this.loginKind = ELogin.FB;
        this.loginToken = CGFacebook.accessToken;
        Setting.client.lastLoginKind = ELogin.FB;
        Network.loginKind = ELogin.FB;
        Network.account = CGFacebook.userId;
        Network.password = CGFacebook.accessToken;
        Network.serverId = Network.servers[currentIndex].id;
        Network.host = Network.servers[currentIndex].host;
        Network.port = Network.servers[currentIndex].port;
        Network.connectCode = 0;

        Network.Connect();

        this.UpdateUI();
      else
        logError(errorMessage);
      end
    end,
    "public_profile"
  );
end

function UILogin.OnClick_Apple()
  if Network.connecting then return end
  if Network.servers[currentIndex] == nil then return end

  if this.CheckAuthorizing() then
    ShowCenterMessage(string.Get(24116));
    return
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
  this.UpdateLoginInfo(ELogin.Apple);

  if LuaHelper.IsStandalone then
    gameObject_WebInfo:SetActive(true);
  end
  
  CGAppleSignIn.Login(
    function(errorMessage)
      if string.IsNullOrEmpty(errorMessage) then
        if Define.IsDebugMode() then
          logError("Apple id : "..CGAppleSignIn.Id);
          logError("Apple token : "..CGAppleSignIn.Token);
        end

        if LuaHelper.IsStandalone then
          gameObject_WebInfo:SetActive(false);
        end

        this.loginKind = ELogin.Apple;
        this.loginToken = CGAppleSignIn.Token;
        Setting.client.lastLoginKind = ELogin.Apple;
        Network.loginKind = ELogin.Apple;
        Network.account = CGAppleSignIn.Id;
        Network.password = CGAppleSignIn.Token;
        Network.serverId = Network.servers[currentIndex].id;
        Network.host = Network.servers[currentIndex].host;
        Network.port = Network.servers[currentIndex].port;
        Network.connectCode = 0;

        Network.Connect();

        this.UpdateUI();
      else
        logError(errorMessage);
      end
    end
  );
end

function UILogin.OnClick_Google()
  if Network.connecting then return end
  if Network.servers[currentIndex] == nil then return end
  
  this.UpdateLoginInfo(ELogin.Google);

  if this.CheckAuthorizing() then
    ShowCenterMessage(string.Get(24116));
    return
  end

  if LuaHelper.IsStandalone then
    gameObject_WebInfo:SetActive(true);
  end

  CGGoogleSignIn.Login(
    function(errorMessage)
      if string.IsNullOrEmpty(errorMessage) then
        if Define.IsDebugMode() then
          logError("Google Id : "..CGGoogleSignIn.Id);
          logError("Google Token : "..CGGoogleSignIn.Token);
        end

        if LuaHelper.IsStandalone then
          gameObject_WebInfo:SetActive(false);
        end

        this.loginKind = ELogin.Google;
        this.loginToken = CGGoogleSignIn.Token;
        Network.loginKind = ELogin.Google;
        Network.account = CGGoogleSignIn.Id;
        Network.password = CGGoogleSignIn.Token;
        Network.serverId = Network.servers[currentIndex].id;
        Network.host = Network.servers[currentIndex].host;
        Network.port = Network.servers[currentIndex].port;
        Network.connectCode = 0;

        Network.Connect();

        this.UpdateUI();
      else
        if LuaHelper.IsStandalone then
          ShowCenterMessage("登入失敗");
        end
        logError(errorMessage);
      end
    end
  );
end

function UILogin.CheckAuthorizing()
  if LuaHelper.IsStandalone then
    return CGFacebook.Authorizing or CGAppleSignIn.Authorizing or CGGoogleSignIn.Authorizing
  else
    return false
  end
end

function UILogin.OnClick_Connect()
  if Network.connecting then return end
  if Network.servers[currentIndex] == nil then return end
  if string.len(inputField_Account.text) == 0 then ShowCenterMessage(string.Get(20934)); return end
  if string.len(inputField_Password.text) == 0 then ShowCenterMessage(string.Get(20935)); return end

  nowAccount = inputField_Account.text;
  
  this.loginKind = ELogin.AccPwd;
  Network.loginKind = ELogin.AccPwd;
  Network.account = inputField_Account.text;
  Network.password = inputField_Password.text;
  Network.serverId = Network.servers[currentIndex].id;
  Network.host = Network.servers[currentIndex].host;
  Network.port = Network.servers[currentIndex].port;
  Network.connectCode = 0;

  Network.Connect();

  --this.UpdateUI();
end

function UILogin.OnClick_Cancel()
  if Network.connecting then
    Network.Disconnect();
  else
    currentIndex = 0;
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
  
  this.UpdateUI();
end

function UILogin.LoginFail()
  Network.Disconnect();

  this.UpdateUI();
end

function UILogin.ForIphoneXScreen()
  if not table.Contains(UIInsetScreen, SystemInfo.deviceModel) then
    return
  end

  text_Version.transform.localPosition = Vector3.New(-606, text_Version.transform.localPosition.y, text_Version.transform.localPosition.z);
  gameObject_LastRecordBG.transform.localPosition = Vector3.New(-606, gameObject_LastRecordBG.transform.localPosition.y, gameObject_LastRecordBG.transform.localPosition.z);
end

function UILogin.ClearInputField()
  inputField_Account.text = "";
  inputField_Password.text = "";
end