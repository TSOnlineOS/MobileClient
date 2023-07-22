local json = require "cjson"

require "Common/define"
require "Common/protocal"
require "Common/functions"
require "Common/ByteBuffer"

Event = require 'events'

sendBuffer = ByteBuffer.New();

ELogin = {
  AccPwd = 1,
  Guest = 2,
  FB = 3,
  Google = 4,
  Apple = 7,
  Unbounded = 255,
}

EAccount = {
  Guest = 0,
  FB = 1,
  Google = 48,
}

EServerSwitch = {
  Review = 1, --送審
  GameShow = 2, --電玩展
}

--[[
And the man had connection with Eve his wife, and she became with child and gave birth to Cain, and said, I have got a man from the Lord.
Then again she became with child and gave birth to Abel, his brother. And Abel was a keeper of sheep, but Cain was a farmer.
And after a time, Cain gave to the Lord an offering of the fruits of the earth.
And Abel gave an offering of the young lambs of his flock and of their fat. And the Lord was pleased with Abel's offering;
But in Cain and his offering he had no pleasure. And Cain was angry and his face became sad.
And the Lord said to Cain, Why are you angry? and why is your face sad?
If you do well, will you not have honour? and if you do wrong, sin is waiting at the door, desiring to have you, but do not let it be your master.
And Cain said to his brother, Let us go into the field: and when they were in the field, Cain made an attack on his brother Abel and put him to death.
And the Lord said to Cain, Where is your brother Abel? And he said, I have no idea: am I my brother's keeper?
And he said, What have you done? the voice of your brother's blood is crying to me from the earth.
And now you are cursed from the earth, whose mouth is open to take your brother's blood from your hand;
No longer will the earth give you her fruit as the reward of your work; you will be a wanderer in flight over the earth.
And Cain said, My punishment is greater than my strength.
You have sent me out this day from the face of the earth and from before your face; I will be a wanderer in flight over the earth, and whoever sees me will put me to death.
And the Lord said, Truly, if Cain is put to death, seven lives will be taken for his. And the Lord put a mark on Cain so that no one might put him to death.
And Cain went away from before the face of the Lord, and made his living-place in the land of Nod on the east of Eden.
And Cain had connection with his wife and she became with child and gave birth to Enoch: and he made a town, and gave the town the name of Enoch after his son.
And Enoch had a son Irad: and Irad became the father of Mehujael: and Mehujael became the father of Methushael: and Methushael became the father of Lamech.
And Lamech had two wives; the name of the one was Adah, and the name of the other Zillah.
And Adah gave birth to Jabal: he was the father of such as are living in tents and keep cattle.
And his brother's name was Jubal: he was the father of all players on instruments of music.
And Zillah gave birth to Tubal-cain, who is the father of every maker of cutting instruments of brass and iron: and the sister of Tubal-cain was Naamah.
And Lamech said to his wives, Adah and Zillah, give ear to my voice; you wives of Lamech, give attention to my words, for I would put a man to death for a wound, and a young man for a blow;
If seven lives are to be taken as punishment for Cain's death, seventy-seven will be taken for Lamech's.
And Adam had connection with his wife again, and she gave birth to a son to whom she gave the name of Seth: for she said, God has given me another seed in place of Abel, whom Cain put to death.
--]]


Network = {};
local this = Network;

local version = 258;

--const
this.cheatSoftXOR = 123; --檢查碼的xor

this.activityAndCode = {
  29 ,232,121,183,148,50 ,79 ,213,205,6  ,
  227,169,167,118,19 ,114,223,199,103,165,
  37 ,75 ,210,56 ,124,23 ,245,30 ,162,176,
  62 ,43 ,208,101,219,26 ,244,164,91 ,134,
  126,88 ,2  ,9  ,157,146,179,186,128,117,
  113,14 ,105,80 ,243,138,142,237,89 ,15 ,
  135,196,247,110,163,20 ,104,4  ,211,35 ,
  36 ,31 ,254,67 ,83 ,49 ,33 ,51 ,40 ,72 ,
  240,28 ,216,93 ,107,94 ,116,226,125,182,
  65 ,235,90 ,218,96 ,60 ,78 ,181,92 ,177,
  13 ,11 ,204,173,98 ,53 ,123,95 ,172,48 ,
  191,21 ,175,159,139,133,209,129,236,252,
  58 ,111,174,140,86 ,34 ,74 ,131,99 ,192,
  59 ,233,27 ,249,97 ,255,201,38 ,82 ,200,
  202,85 ,57 ,68 ,166,158,81 ,215,246,39 ,
  149,66 ,161,242,115,16 ,184,198,160,32 ,
  69 ,12 ,41 ,238,112,102,106,217,5  ,203,
  25 ,87 ,130,52 ,212,22 ,151,143,24 ,195,
  47 ,171,137,222,187,190,194,17 ,170,10 ,
  220,234,45 ,206,253,71 ,230,18 ,141,197,
  73 ,64 ,229,188,61 ,122,44 ,189,147,42 ,
  63 ,153,239,248,46 ,77 ,145,185,136,144,
  221,180,120,3  ,108,150,225,100,84 ,193,
  55 ,168,231,154,119,7  ,70 ,241,214,8  ,
  76 ,132,54 ,1  ,207,228,178,250,224,152,
  127,155,109,251,156
}

this.activityXorCode = {
  102,33 ,229,231,191,86 ,68 ,177,50 ,210,
  79 ,159,184,58 ,201,46 ,10 ,73 ,99 ,250,
  71 ,228,185,74 ,182,252,211,70 ,64 ,100,
  135,138,194,207,42 ,31 ,246,116,81 ,28 ,
  219,151,4  ,106,248,66 ,243,90 ,233,18 ,
  51 ,121,133,224,167,112,140,24 ,160,127,
  173,239,117,183,20 ,125,105,57 ,23 ,205,
  155,163,158,198,136,7  ,186,171,2  ,84 ,
  169,255,38 ,242,241,36 ,32 ,180,103,80 ,
  237,60 ,40 ,254,44 ,14 ,134,124,47 ,146,
  62 ,107,176,141,88 ,238,206,215,21 ,48 ,
  120,25 ,87 ,221,130,225,16 ,142,240,235,
  137,193,119,172,126,190,37 ,129,85 ,89 ,
  161,244,214,222,95 ,149,108,245,181,152,
  98 ,247,192,54 ,72 ,67 ,132,253,249,150,
  216,122,78 ,92 ,75 ,232,26 ,195,199,83 ,
  157,148,143,139,94 ,204,164,144,115,82 ,
  226,53 ,162,91 ,77 ,1  ,236,131,35 ,174,
  27 ,166,147,6  ,15 ,175,197,19 ,30 ,97 ,
  101,111,52 ,39 ,165,49 ,208,187,56 ,220,
  8  ,154,76 ,156,45 ,17 ,178,63 ,200,61 ,
  251,29 ,22 ,189,11 ,209,168,104,5  ,65 ,
  170,227,179,12 ,118,3  ,114,188,9  ,96 ,
  217,55 ,13 ,145,110,113,196,93 ,41 ,223,
  59 ,153,202,230,43 ,234,109,128,212,34 ,
  69 ,123,203,213,218
}

--var
this.servers = {};

this.loginKind = ELogin.AccPwd;
this.account = "";
this.password = "";
this.accountKind = EAccount.Guest;

this.roleId = 0;
this.dbId = 0;
this.serverId = 0;
this.host = "";
this.port = 0;
 
this.serverId_Unbounded = 0;
this.host_Unbounded = "";
this.port_Unbounded = 0;
this.SN_Unbounded = 0;
this.Par1_Unbounded = 0;
this.InUnbound = false;

this.connecting = false;
this.connectCode = 0; --斷線重連用
this.cheatSoftCode = 0;

this.isVipServer = false;
this.isDebugServer = false;
this.loginFinished = false;
this.initialized = false;
this.serverSwitch = 0;

this.tempBuffer = nil;
local isListen = false;
local csProtocal = { 
  Connect = 101,
  Exception = 102,
  Disconnect = 103,
  Message = 104,
  Internet = 105,
}

this.waitExpireTime = 0;
this.waitMainKind = 0;
this.waitSubKind = 0;
this.waitEndHandler = nil;

this.disconnectQuit = false;
this.disconnectMessage = "";
this.disconnectCause = 0;
this.autoLoginWaitTime = 10;
this.autoLoginFight = false;
this.autoLoginMove = false;
this.jumpHeartTime = 20;

function Network.Start()
  this.tempBuffer = ByteBuffer.New();
  logWarn("Network.Start!!");
  isListen = true;
end

function Network.TestPas(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Network.TestPas1(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Network.Initialize()
  this.servers = json.decode(CGResourceManager.DownloadText("ServerList.dat", true));
  logWarn(string.Concat("ServerList count = ", table.maxn(this.servers)));

  this.initialized = true;
end

function Network.Update()
  if this.waitExpireTime > 0 then
    if CGTimer.time > this.waitExpireTime then
      this.ClearWait(true);
    end
  end
end

function Network.CheckServerSwitch(switchIndex)
  return CheckFlag(this.serverSwitch, switchIndex);
end

function Network.TestPas2(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Network.TestPas3(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Network.TestPas4(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Network.Connect()
  logWarn(string.Concat("Connect ", this.host, ":", this.port, "..."));

  if not CGResourceManager.CheckVersion() then return end

  this.connecting = true;

  if MachineBox.client.general[EMachineBoxSwitch.AutoLogin] == false then
    this.Wait(5, 0, 0,
      function()
        Game.Logout();

        ShowNotifyMessage(nil, string.Get(30175));
      end
    );
  end

  networkMgr:Connect(this.host, this.port);

  CGTimer.AddListener(this.ShowConnectMessage, 2, false);
end

function Network.Connect_Unbounded()
  --在判斷是否要先通知原本GS斷線後再連無界
  --this.Disconnect();
  logWarn(string.Concat("Unbounded-----Connect ", this.host_Unbounded, ":", this.port_Unbounded, "..."));

  if not CGResourceManager.CheckVersion() then return end

  this.connecting = true;

  this.Wait(5, 0, 0,
    function()
      --無界沒回應 從新連回原GS?
      this.Connect();
    end
  );

  networkMgr:Connect(this.host_Unbounded, this.port_Unbounded);

  CGTimer.AddListener(this.ShowConnectMessage, 2, false);
end

function Network.TestPas5(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Network.Disconnect(clearConnectCode)
  logWarn("Disconnect");

  this.connecting = false;

  this.ClearWait();
  CGTimer.RemoveListener(this.CheckConnect);

  if clearConnectCode ~= false then
    this.connectCode = 0;
  end
  
  networkMgr:Disconnect();

  CGTimer.RemoveListener(this.ShowConnectMessage);
end

--送協定
function Network.Send(mainKind, subKind, data, waitResponseTime, waitMainKind, waitSubKind, waitEndHandler)
  mainKind = mainKind or 0;
  subKind = subKind or 0;
  waitResponseTime = waitResponseTime or 0;
  
  if mainKind == 6 and subKind == 1 then
  elseif mainKind == 10 and subKind == 0 then
  else
    log(string.format("Send Message %03d - %03d", mainKind, subKind));
  end

  this.tempBuffer:Clear();
  this.tempBuffer:WriteByte(mainKind); --主協定編號
  this.tempBuffer:WriteByte(subKind); --次協定編號
  this.tempBuffer:WriteByte(0); --是否壓縮

  if data ~= nil then
    this.tempBuffer:WriteBytes(data:ToBytes()); --協定內容
  end
  
  networkMgr:Send(this.tempBuffer:ToBytes());

  if waitResponseTime > 0 then
    this.Wait(waitResponseTime, waitMainKind, waitSubKind, waitEndHandler);
  end
end

function Network.TestPas6(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Network.TestPas7(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Network.TestPas8(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

--收協定
function Network.OnMessage(data)
  local byteBuffer = ByteBuffer.New(data);
  local mainKind = byteBuffer:ReadByte();
  local subKind = byteBuffer:ReadByte();
  local compress = byteBuffer:ReadBoolean();

  this.CheckWait(mainKind, subKind);
  
  if protocolTable[mainKind] ~= nil and protocolTable[mainKind][subKind] ~= nil then
    if mainKind == 22 and subKind == 10 then
    elseif mainKind == 22 and subKind == 2 then
    elseif mainKind == 6 and subKind == 1 then
    elseif mainKind == 10 and subKind == 0 then
    else
      log(string.format("Received Message %03d %03d", mainKind, subKind));
    end

    protocolTable[mainKind][subKind](byteBuffer);
  else
    logError(string.format("Received Message %03d %03d Fail !! Handler Not Found", mainKind, subKind));
  end 
  --[[
	----------------------------------------------------
    local ctrl = CtrlManager.GetCtrl(CtrlNames.Message);
    if ctrl ~= nil then
        ctrl:Awake();
    end
    logWarn('OnMessage-------->>>');
  ]]--
end

--等待回覆
function Network.Wait(waitResponseTime, waitMainKind, waitSubKind, waitEndHandler)
  if waitMainKind == 10 and waitSubKind == 0 then
  else
    logWarn(string.Concat("Wait ", waitMainKind, " - ", waitSubKind, " Response For ", waitResponseTime, " Seconds !!"));
  end

  this.waitExpireTime = CGTimer.time + (waitResponseTime - 0.5);
  this.waitMainKind = waitMainKind;
  this.waitSubKind = waitSubKind;
  this.waitEndHandler = waitEndHandler;
end

function Network.CheckWait(mainKind, subKind)
  if mainKind ~= this.waitMainKind then return end
  if subKind ~= this.waitSubKind then return end
  
  this.ClearWait();
end

function Network.ClearWait(timeUp)
  if this.waitMainKind == 10 and this.waitSubKind == 0 then
  else
    logWarn(string.Concat("Clear Wait ", this.waitMainKind, " - ", this.waitSubKind, " Response !!"));
  end

  this.waitExpireTime = 0;
  this.waitMainKind = 0;
  this.waitSubKind = 0;

  if timeUp and this.waitEndHandler ~= nil then
    this.waitEndHandler();
  end

  this.waitEndHandler = nil;
end

function Network.CheckConnect()
  --C:010-000 <心跳包>
  this.Send(10, 0, nil, this.jumpHeartTime, 10, 0, this.OnServerNoResponse);
end

function Network.TestPas9(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Network.TestPas10(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Network.TestPas11(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Network.CloseAutoLogin(result)
  if result then
    if CGTimer.ContainsListener(this.RunAutoLogin) then
      CGTimer.RemoveListener(this.RunAutoLogin);
    end

    this.autoLoginFight = false;
    this.autoLoginMove = false;

    Game.Logout();
  end
end

function Network.ResetAutoLoginInfo()
  if MachineBox.client.general[EMachineBoxSwitch.AutoLogin] then
    MachineBox.SetAutoFight(this.autoLoginFight, true);
    MachineBox.SetAutoMove(this.autoLoginMove);
  end

  this.autoLoginFight = false;
  this.autoLoginMove = false;
end

function Network.RunAutoLogin()
  this.Disconnect(false);
  this.Connect();
end

function Network.StartAutoLogin()
  CGTimer.AddListener(this.RunAutoLogin, this.autoLoginWaitTime, false);
  ShowNotifyMessage(this.CloseAutoLogin, string.Get(23178));
end

function Network.OnServerNoResponse()
  this.Disconnect(false);

  if this.connectCode ~= 0 then
    if MachineBox.client.general[EMachineBoxSwitch.AutoLogin] then
      this.autoLoginFight = MachineBox.autoFight;
      this.autoLoginMove = MachineBox.autoMove;
      this.StartAutoLogin();
    else
      ShowNotifyMessage(
        function()
          this.Connect();
        end,
        string.Get(10300)
      );
    end
  else
    Game.Logout();
    ShowNotifyMessage(nil, string.Get(10300));
  end
end

function Network.ShowConnectMessage()
  ShowCenterMessage(string.Get(21240));
end

--Socket消息--
function Network.OnSocket(key, data)
  --if not isListen then return end
  if key == csProtocal.Connect then
    if not isListen then
      logError("isListen = false");
    end
    this.OnConnect();
  elseif key == csProtocal.Exception then
    this.OnException();
  elseif key == csProtocal.Disconnect then
    this.OnDisconnect();
  elseif key == csProtocal.Message then
    this.OnMessage(data);
  elseif key == csProtocal.Internet then
    this.OnInternetUnavailable();
  else
    logError("Network.OnSocket key error :"..tostring(key));
  end    
end

--当连接建立时--
function Network.OnConnect()
  logWarn("Game Server Connected!!");

  this.CheckWait(0, 0);
  
  --C:001-000 <登入> +版本編號(2) +伺服器ID(2) +連線碼(4) +登入方式(1)
  sendBuffer:Clear();
  sendBuffer:WriteUInt16(version);
  if this.loginKind == ELogin.Unbounded then 
    sendBuffer:WriteUInt16(this.serverId_Unbounded);  
  else 
    sendBuffer:WriteUInt16(this.serverId);
  end
  sendBuffer:WriteUInt32(this.connectCode);

  sendBuffer:WriteByte(this.loginKind);
  if this.loginKind == ELogin.AccPwd then
    --登入方式 1:帳密 +L(1) +帳號(L) +L(1) +密碼(L)
    sendBuffer:WriteStringWithByteL(this.account);
    sendBuffer:WriteStringWithByteL(this.password);

  elseif this.loginKind == ELogin.Guest then
    --登入方式 2:遊客

  elseif this.loginKind == ELogin.FB then
    --登入方式 3:FB +L(1) +UserId(L) +L(1) +AccessToken(L)
    sendBuffer:WriteStringWithWordL(this.account);
    sendBuffer:WriteStringWithWordL(this.password);
  elseif this.loginKind == ELogin.Apple then
    sendBuffer:WriteStringWithWordL(this.account);
    sendBuffer:WriteStringWithWordL(this.password);
  elseif this.loginKind == ELogin.Google then
    sendBuffer:WriteStringWithWordL(this.account);
    sendBuffer:WriteStringWithWordL(this.password);
  elseif this.loginKind == ELogin.Unbounded then  
    --登入方式 255:無界伺服器 +L(1) +帳號(L) +L(1) +密碼(L) + RoleID(8) +SN(4)
    sendBuffer:WriteStringWithByteL(this.account);
    sendBuffer:WriteStringWithByteL(this.password);
    sendBuffer:WriteInt64(this.Par1_Unbounded);
    sendBuffer:WriteUInt32(this.SN_Unbounded);
  end

  this.Send(1, 0, sendBuffer, 20, 1, 2, this.OnServerNoResponse);

  this.connectCode = 0;
end

function Network.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Network.Script1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Network.Script2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

--异常断线--
function Network.OnException()
  logError("OnException------->>>>");

  this.ClearWait();
  CGTimer.RemoveListener(this.CheckConnect);

  if this.connectCode ~= 0 then
    ShowNotifyMessage(
      function()
        this.Connect();
      end,
      string.Get(10300)
    );
  else
    Game.Logout();
    ShowNotifyMessage(nil, string.Get(10300));
  end
end

--连接中断，或者被踢掉--
function Network.OnDisconnect() 
  logError("OnDisconnect------->>>>");

  this.ClearWait();
  CGTimer.RemoveListener(this.CheckConnect);

  this.autoLoginFight = MachineBox.autoFight;
  this.autoLoginMove = MachineBox.autoMove;

  Game.Logout();

  if this.disconnectCause == 60 and MachineBox.client.general[EMachineBoxSwitch.AutoLogin] then
      this.StartAutoLogin();
  else
    if string.IsNullOrEmpty(this.disconnectMessage) then
      this.disconnectMessage = string.Get(21612);
    end

    ShowNotifyMessage(
      function()
        if this.disconnectQuit then
          Game.Quit();
        end
      end,
      this.disconnectMessage
    );
  end

  this.disconnectQuit = false;
  this.disconnectMessage = "";
  this.disconnectCause = 0;
end

function Network.OnInternetUnavailable()
  logError("OnInternetUnavailable------->>>>");

  this.ClearWait();
  CGTimer.RemoveListener(this.CheckConnect);

  if this.connectCode ~= 0 then
    ShowNotifyMessage(
      function()
        this.Connect();
      end,
      string.Get(20855)
    );
  else
    Game.Logout();
    ShowNotifyMessage(nil, string.Get(20855));
  end
end

--卸载网络监听--
function Network.Unload()
  if LuaHelper.CheckDefine("DemoCode") then
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
  end
  isListen = false;
  logWarn('Unload Network...');
end

function Network.Script3()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Network.Script4()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end