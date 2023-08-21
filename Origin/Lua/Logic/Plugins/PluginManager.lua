PluginManager = {}
local this = PluginManager;

local EPluginNotify = {
  GameStart = 1,
  Login = 2,
  ViewUI = 3,
  SetLevel = 4,
  StoreIAP = 5,
  QuitGame = 6,
  UISell = 7,
  StartDownLoadResource = 8, 
  DownLoadResourceDone = 9,
  SetServer = 10, 
};

local notify = {
  [EPluginNotify.GameStart] = {};
  [EPluginNotify.Login] = {};
  [EPluginNotify.SetServer] = {};
  [EPluginNotify.ViewUI] = {};
  [EPluginNotify.SetLevel] = {};
  [EPluginNotify.StoreIAP] = {};
  [EPluginNotify.QuitGame] = {};
  [EPluginNotify.UISell] = {};
  [EPluginNotify.StartDownLoadResource] = {};
  [EPluginNotify.DownLoadResourceDone] = {};
};

local init = false;

function PluginManager.EndOfLine()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function PluginManager.Init()
  if init then return end

  if LuaHelper.CheckDefine("NFT") then
    PluginManager.RegisterTW();
  end

  init = true;
end

function PluginManager.GameStart()
  for k, startFunction in pairs(notify[EPluginNotify.GameStart]) do
    startFunction();
  end
  
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
end

function PluginManager.Login(id)
  for k, loginFunction in pairs(notify[EPluginNotify.Login]) do
    loginFunction(id);
  end
end

function PluginManager.EndOfLine2()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function PluginManager.EndOfLine3()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function PluginManager.EndOfLine4()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function PluginManager.SetServer(serverId)
  for k, loginFunction in pairs(notify[EPluginNotify.SetServer]) do
    loginFunction(serverId);
  end
end

function PluginManager.ViewUI(name)
  for k, viewFunction in pairs(notify[EPluginNotify.ViewUI]) do
    viewFunction(name);
  end
end

function PluginManager.SetLevel(level)
  -- 玩家轉生，每一轉多200級
  local lv = Role.player:GetAttribute(EAttribute.Turn) * Role.playerMaxLv + level;

  for k, setFunction in pairs(notify[EPluginNotify.SetLevel]) do
    setFunction(lv);
  end
end

function PluginManager.StoreIAP(orderId, productId)
  local index = PluginManager.GetProductIndex(productId);

  local data = StoreValue.GetData(index);

  if data == nil then return end

  for k, IAPFunction in pairs(notify[EPluginNotify.StoreIAP]) do
    if data.flag ~= 0 and not BitFlag.Get(data.flag) then
      IAPFunction(orderId, productId, data.price, EurrencyType.TWD, (data.totalGold + data.gold), this.GetPaymentType());
    else
      IAPFunction(orderId, productId, data.price, EurrencyType.TWD, data.totalGold, this.GetPaymentType());
    end
  end
end

function PluginManager.EndOfLine5()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function PluginManager.EndOfLine6()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function PluginManager.EndOfLine7()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function PluginManager.GetProductIndex(productName)
  for k,v in pairs(IAPData.GetProductName()) do
    if productName == v then
      return k;
    end
  end

  return 0;
end

function PluginManager.QuitGame()
  for k, quitFunction in pairs(notify[EPluginNotify.QuitGame]) do
    quitFunction();
  end
end

function PluginManager.UISell(name)
  for k, func in pairs(notify[EPluginNotify.UISell]) do
    func(name);
  end
end

function PluginManager.StartDownload(name)
  for k, func in pairs(notify[EPluginNotify.StartDownLoadResource]) do
    func(name);
  end
end

function PluginManager.DownloadDone(name)
  for k, func in pairs(notify[EPluginNotify.DownLoadResourceDone]) do
    func(name);
  end
end

function PluginManager.GetPaymentType()
  if LuaHelper.IsAndroidPlatform then
    return EPaymenyType.GoogleIAP;
  elseif LuaHelper.IsApplePlatform then
    return EPaymenyType.IOSIAP;
  end

  return "";
end

function PluginManager.ReciveMessageToken(token)
  log(string.Concat("MessageToken : ", token));
end

function PluginManager.RegisterRemoteMessage()
  if LuaHelper.IsAndroidPlatform or LuaHelper.IsApplePlatform then
    LuaHelper.GetFirebaseMessagingToken(PluginManager.ReciveMessageToken);
  end
end

function PluginManager.EndOfLine8()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function PluginManager.EndOfLin9e()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

local registerTW = {};

registerTW[EPluginNotify.GameStart] = function ()
  local notifyReference = notify[EPluginNotify.GameStart];
  table.insert(notifyReference, TalkingDataPlugin.OnStart);             --TalkingData
  table.insert(notifyReference, IAP.Init);                              --IAP
  if LuaHelper.CheckDefine("MyCard") and LuaHelper.IsAndroidPlatform then
    table.insert(notifyReference, GoogleAnalytics.GameStart);             --GoogleAnalytics
  end
end

registerTW[EPluginNotify.Login] = function ()
  local notifyReference = notify[EPluginNotify.Login];

  table.insert(notifyReference, TalkingDataPlugin.SetAccount);        --TalkingData
  if LuaHelper.CheckDefine("MyCard") and LuaHelper.IsAndroidPlatform then
    table.insert(notifyReference, GoogleAnalytics.Login);               --GoogleAnalytics
  end
end

registerTW[EPluginNotify.SetServer] = function ()
  local notifyReference = notify[EPluginNotify.SetServer];

  table.insert(notifyReference, TalkingDataPlugin.SetServer);        --TalkingData
end

registerTW[EPluginNotify.ViewUI] = function ()
  local notifyReference = notify[EPluginNotify.ViewUI];

  --table.insert(notifyReference, GoogleAnalytics.ViewUI);      --GoogleAnalytics
end

registerTW[EPluginNotify.SetLevel] = function ()
  local notifyReference = notify[EPluginNotify.SetLevel];

  table.insert(notifyReference, TalkingDataPlugin.SetLevel);  --TalkingData
end

registerTW[EPluginNotify.StoreIAP] = function ()
  local notifyReference = notify[EPluginNotify.StoreIAP];

  table.insert(notifyReference, TalkingDataPlugin.OnCharge);        --TalkingData
end

registerTW[EPluginNotify.QuitGame] = function ()
  local notifyReference = notify[EPluginNotify.QuitGame];

  table.insert(notifyReference, TalkingDataPlugin.OnEnd);     --TalkingData
end

registerTW[EPluginNotify.UISell] = function ()
  local notifyReference = notify[EPluginNotify.UISell];

  --table.insert(notifyReference, GoogleAnalytics.UISell);
end

registerTW[EPluginNotify.StartDownLoadResource] = function ()
  local notifyReference = notify[EPluginNotify.StartDownLoadResource];

  --table.insert(notifyReference, GoogleAnalytics.StartDownload);
end

registerTW[EPluginNotify.DownLoadResourceDone] = function ()
  local notifyReference = notify[EPluginNotify.DownLoadResourceDone];

  --table.insert(notifyReference, GoogleAnalytics.DownloadDone);
end

function PluginManager.RegisterTW()
  for k, v in pairs(EPluginNotify) do
    if registerTW[v] ~= nil then
      registerTW[v]();
    end
  end
end

function PluginManager.EndOfLine11()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function PluginManager.EndOfLine12()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end