MyCard = {};  
local this = MyCard;

local authCode = "";

local click = false;

--[[
In the beginning God created the heaven and the earth.At the first God made the heaven and the earth.
And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of God moved upon the face of the waters.
At the first God made the heaven and the earth.And the earth was waste and without form; and it was dark on the face of the deep: and the Spirit of God was moving on the face of the waters.And God said, Let there be light: and there was light.
And God, looking on the light, saw that it was good: and God made a division between the light and the dark,
Naming the light, Day, and the dark, Night. And there was evening and there was morning, the first day.
And God said, Let there be a solid arch stretching over the waters, parting the waters from the waters.
And God made the arch for a division between the waters which were under the arch and those which were over it: and it was so.
And God gave the arch the name of Heaven. And there was evening and there was morning, the second day.
And God said, Let the waters under the heaven come together in one place, and let the dry land be seen: and it was so.
And God gave the dry land the name of Earth; and the waters together in their place were named Seas: and God saw that it was good.
And God said, Let grass come up on the earth, and plants producing seed, and fruit-trees giving fruit, in which is their seed, after their sort: and it was so.
And grass came up on the earth, and every plant producing seed of its sort, and every tree producing fruit, in which is its seed, of its sort: and God saw that it was good.
And there was evening and there was morning, the third day.
And God said, Let there be lights in the arch of heaven, for a division between the day and the night, and let them be for signs, and for marking the changes of the year, and for days and for years:
And let them be for lights in the arch of heaven to give light on the earth: and it was so.
And God made the two great lights: the greater light to be the ruler of the day, and the smaller light to be the ruler of the night: and he made the stars.
And God put them in the arch of heaven, to give light on the earth;
To have rule over the day and the night, and for a division between the light and the dark: and God saw that it was good.
And there was evening and there was morning, the fourth day.
And God said, Let the waters be full of living things, and let birds be in flight over the earth under the arch of heaven.
And God made great sea-beasts, and every sort of living and moving thing with which the waters were full, and every sort of winged bird: and God saw that it was good.
And God gave them his blessing, saying, Be fertile and have increase, making all the waters of the seas full, and let the birds be increased in the earth.
--]]

function MyCard.Init()
  LuaHelper.InitMyCard(MyCard.BuySucess, MyCard.BuyFail);
end

function MyCard.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MyCard.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MyCard.Buy(index, tradeType)
  if click then return end;

  local productList = IAPData.GetMyCardProductName();
  local product = productList[index];
  if product == nil then
    return;
  end

  local productName = product[2];
  local amount = product[1];
  local customerId = Network.account;
  local gsId = Network.serverId;
  local gameType = IAPData.GetMyCardGameType();
  local checkCode = IAPData.GetMyCardCheckCode();
  local myType = IAPData.GetMyCardPlateFormName();
  
  local facTradeSeq = string.format("%s_%s_%s_%s", IAPData.GetMyCardPlateFormName(), IAPData.GetMyCardGameType(), string.format("%s%s%s", CGTimer.serverTime.Year, CGTimer.serverTime.Month, CGTimer.serverTime.Day), this.GenerateRandomString(8));
  local tradeType = tradeType;
  local currency = IAPData.Currency;
  local dbId = Network.dbId;
  
  --NFT(NEW MYCard)   MyType + ServerId + CustomerId + Amount + GameType + ExtraInfo + HASHKEY
  local hash = string.lower(LuaHelper.MD5(string.Concat(
    myType,       --MyType
    dbId,         --ServerId
    customerId,   --CustomerId
    amount,       --Amount
    gameType,     --GameType
    productName,  --ExtraInfo
    checkCode     --HASHKEY
  )));

  local param = string.format("?MyType=%s&ServerId=%s&CustomerId=%s&Amount=%s&GameType=%s&ExtraInfo=%s&FlowNo=%s&hash=%s",
    myType,
    dbId,
    customerId,
    amount,
    gameType,
    productName,
    gsId,
    hash);

  authCode = CGResourceManager.SendSite(string.Concat(IAPData.GetMyCardAuthUrl(), param));
  
  --logError(" Mycard site  : " .. string.Concat(IAPData.GetMyCardAuthUrl(), param) );
  --logError(" Mycard myType : " .. myType);
  --logError(" Mycard ServerId : " .. dbId);
  --logError(" Mycard customerId : " .. customerId);
  --logError(" Mycard amount : " .. amount);
  --logError(" Mycard gameType : " .. gameType);
  --logError(" Mycard productName : " .. productName);
  --logError(" Mycard FlowNo : " .. gsId);
  --logError(" Mycard checkCode : " .. checkCode);
  --logError(" Mycard hash : " .. hash);
  --logError(" Mycard authCode : " .. authCode);
  
  if authCode == "" or authCode == nil then
    logError("MyCard Cannot pay know");
    return;
  end

  LuaHelper.BuyMyCard(authCode, IAPData.ObjName, IAPData.GetMyCardSandBoxMode());

  click = true;
  
  CGTimer.AddListener(this.SetClickFalse, 1, true);
end

function MyCard.SetClickFalse()
  click = false;
  
  CGTimer.RemoveListener(this.SetClickFalse);
end

function MyCard.GenerateRandomString(length)
  local result = "";
  local seed = 0;

  math.randomseed(os.time());
  for i = 1, length do
    seed = math.random(0, 1)
    if seed == 0 then
      result = string.Concat(result, string.format("%c", math.random(65, 90)));--A~Z
    elseif seed == 1 then
      result = string.Concat(result, string.format("%c", math.random(97, 122)));--a~z
    end
  end

  return result;
end

function MyCard.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MyCard.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MyCard.BuySucess()
  local param = string.format("?authcode=%s", authCode);

  local result = CGResourceManager.SendSite(string.Concat(IAPData.GetMyCardAddUrl(), param));

  if result == "" or result == nil then
    ShowCenterMessage("MyCard Add Point Error");
  end

  click = false;
end

function MyCard.BuyFail(result)
  ShowCenterMessage(result);
  
  logError("MyCard.BuyFail : " .. result);

  click = false;
end

function MyCard.PcBuy(index)
  local productList = IAPData.GetMyCardProductName();
  local product = productList[index];
  if product == nil then return end
  
  local postData = "";
  local uId = 0;      --UID
  local itemId = product[2];
  local dbno = 0;     --DB編號
  local flowno = 1;   --分流編號
  local timestamp;     --時間戳記
  local roleName = Role.player.name;
  local hash;         --(MD5(timespan + itemid + uid + dbno + flowno + roleName + "GAME_TSM"))
  local times = {};
  
  roleName = LuaHelper.ToBase64String(roleName);
  
  uId = tonumber(string.sub(Role.playerId, -10));
  dbno = Network.dbId;
  flowno = Network.serverId;
  
  times.year = CGTimer.serverTime.Year;
  times.month = CGTimer.serverTime.Month;
  times.day = CGTimer.serverTime.Day;
  times.hour = CGTimer.serverTime.Hour;
  times.min = CGTimer.serverTime.Minute;
  times.sec = CGTimer.serverTime.Second;
  
  timestamp = os.time(times);
  
  hash = string.lower(LuaHelper.MD5(string.format("%s%s%s%s%s%s%s", timestamp, itemId, uId, dbno, flowno, roleName, "GAME_TSN")));
  
  roleName = string.EncodeURI(roleName);
  
  postData = string.format("?uid=%s&dbno=%s&flowno=%s&rolename=%s&timespan=%s&itemid=%s&hash=%s",uId, dbno, flowno, roleName, timestamp, itemId, hash);

  if Define.IsInternal() then
    local webString = string.Concat("https://worldstorebilling2.chinesegamer.net/MyCardWeb/Tw_Tsn/", postData);
    log(" webString : " .. webString);

    Application.OpenURL(webString);
  elseif LuaHelper.CheckDefine("ReleaseTest") then
    Application.OpenURL(string.Concat("https://worldstorebilling1.chinesegamer.net/MyCardWeb/Tw_Tsn/", postData));
  else
    Application.OpenURL(string.Concat("https://worldstorebilling.chinesegamer.net/MyCardWeb/Tw_Tsn/", postData));
  end
end

--藍新金流
function MyCard.NewebPay(index)
  local productList = IAPData.GetNewebPayProductName();
  local product = productList[index];
  if product == nil then return end
  
  local postData = "";
  local gameNo = 122; --遊戲代號
  local uId = 0;      --UID
  local loginId = 0;  --自創帳號
  local roleName = Role.player.name;
  local dbno = 0;     --DB編號
  local flowno = 1;   --分流編號
  local timestamp;     --時間戳記
  local hash;         --md5(mtype + uid + itemid + serverid + flowno + loginid + gameno + ttime + rolename + hashkey)
  local times = {};
  local hashKey = "X8765Y4321Z";
  local mtype = "P";
  local itemId = product[2];
  
  times.year = CGTimer.serverTime.Year;
  times.month = CGTimer.serverTime.Month;
  times.day = CGTimer.serverTime.Day;
  times.hour = CGTimer.serverTime.Hour;
  times.min = CGTimer.serverTime.Minute;
  times.sec = CGTimer.serverTime.Second;
  timestamp = os.time(times);
  
  uId = tonumber(string.sub(Role.playerId, -10));
  loginId = Network.account;
  dbno = Network.dbId;
  flowno = Network.serverId;
  
  roleName = LuaHelper.ToBase64String(roleName);
  
  hash = string.lower(LuaHelper.MD5(string.format("%s%s%s%s%s%s%s%s%s%s",
    mtype, uId, itemId, dbno, flowno, loginId, gameNo, timestamp, roleName, hashKey)));
  
  roleName = string.EncodeURI(roleName);
  
  postData = string.format("?gameno=%s&&loginid=%s&uid=%s&serverid=%s&flowno=%s&rolename=%s&ttime=%s&mtype=%s&itemid=%s&hash=%s",
    gameNo, loginId, uId, dbno, flowno, roleName, timestamp, mtype, itemId, hash);
  
  if Define.IsInternal() then
    local webString = string.Concat("https://worldstorebilling2.chinesegamer.net/NeWebPay/Client/", postData);
    log(" webString : " .. webString);
  
    Application.OpenURL(webString);
  elseif LuaHelper.CheckDefine("ReleaseTest") then
    Application.OpenURL(string.Concat("https://worldstorebilling1.chinesegamer.net/NeWebPay/Client/", postData));
  else
    Application.OpenURL(string.Concat("https://worldstorebilling.chinesegamer.net/NeWebPay/Client/", postData));
  end
end