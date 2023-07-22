local json = require 'cjson'

AliPay = {}
local this = AliPay; 

local sRanSeed = {
     "0","a","b","c","d","e"
    ,"1","f","g","h","i","j"
    ,"2","k","l","m","n","o"
    ,"3","p","q","r","s","t"
    ,"4","u","v","w","x","y","z"
    ,"5","A","B","C","D","E"
    ,"6","F","G","H","I","J"
    ,"8","K","L","M","N","O"
    ,"7","P","Q","R","S","T"
    ,"9","U","V","W","X","Y","Z"
};

function AliPay.Init()
  LuaHelper.InitAliPay();
end 

function AliPay.Buy(index)
  local productList = IAPData.GetAlipayProductName();
  local product = productList[index];
  if product == nil then
    logError("product "..index.." nil");
    return;
  end

  local s_appid = IAPData.GetAlipayAPPID();
  local s_seller = IAPData.GetAlipaySeller();
  local s_Key = IAPData.GetAlipayKey();
  local s_notify_url = IAPData.GetAlipayCashUrl();
  local s_Title = product[2];
  local s_out_trade_no = this.GetAliPayTrade();
  local s_body = this.GetAliPayBody();
  local s_total_fee = string.Concat(product[1], ".00");

  LuaHelper.BuyAliPay(s_appid, s_seller, s_Key, s_notify_url, s_out_trade_no, s_Title, s_body, s_total_fee);
end

function AliPay.GetAliPayTrade()
  local result = "";
  math.randomseed(os.time());
  result = string.format("%s_%s_%s", IAPData.GetMyCardPlateFormName(), IAPData.GetAlipayGameType(), GetNormalDateTime(System.DateTime.Now.UtcNow:AddHours(8), true));

  for i = 1, 4 do
    result = string.Concat(result, sRanSeed[math.random(1, 62)]);
  end
  return result
end

function AliPay.GetAliPayBody()
  local body = {};
  body.userId = Network.account;
  body.gameType = IAPData.GetAlipayGameType();
  body.dbId = Network.dbId;
  body.serverId = Network.serverId;
  return json.encode(body);
end

function GetNormalDateTime(dateTime, number)
  local hour, min, sec = 0;

  if dateTime.Hour < 10 then
    hour = "0"..dateTime.Hour;
  else
    hour = dateTime.Hour;
  end

  if dateTime.Minute < 10 then
    min = "0"..dateTime.Minute;
  else
    min = dateTime.Minute;
  end

  if dateTime.Second < 10 then
    sec = "0"..dateTime.Second;
  else
    sec = dateTime.Second;
  end

  if number then
    return string.format("%s%s%s%s%s%s", dateTime.Year, dateTime.Month, dateTime.Day, hour, min, sec);
  else
    return string.format("%s/%s/%s %s:%s", dateTime.Year, dateTime.Month, dateTime.Day, hour, min);
  end
end