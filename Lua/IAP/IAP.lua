--儲值金流 YunLong
IAP = {}
local this = IAP;

local isIAPInit = false;
local isResend = false;
local orderData = nil;

function IAP.TestPas(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function IAP.Init()
  if isIAPInit then return end

  if not LuaHelper.IsStandalone then
    if LuaHelper.CheckDefine("ThirdParty") then
      if LuaHelper.CheckDefine("NFT") then
        MyCard.Init();
        AliPay.Init();
      elseif LuaHelper.CheckDefine("TW") then
        MyCard.Init();
      end
    else
      LuaHelper.InitIAP( this.PurchaseSucess, this.PurchaseFail, this.QueryPurchase, IAPData.GetProductName(), IAPData.GetPublicKey() );
      LuaHelper.QueryReceipt();
    end
  end

  isIAPInit = true;
end

function IAP.TestPas1(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function IAP.TestPas2(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function IAP.LoginCheckOrder()
  if IAP.IsHaveOrderData() then
    ShowNotifyMessage( this.AddReSendData, string.Get(20761) );
  end
end

function IAP.PurchaseProduct(index)
  this.LoginCheckOrder();

  LuaHelper.BuyPoint(index);
end

function IAP.TestPas3(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function IAP.TestPas4(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function IAP.PurchaseSucess(...)
  this.TransferOrderData( {...} );
  this.SendIAP();
end

function IAP.PurchaseFail(errorCause, kind)
  logError(errorCause);
end

function IAP.QueryPurchase(...)
  this.TransferOrderData( {...} );
  if Role.player ~= nil then
    this.SendIAP();
  end 
end

function IAP.SendIAP()
  PluginManager.StoreIAP( orderData.orderId, orderData.productId );
  this.SendDataToServer();
end

function IAP.TestPas5(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function IAP.TestPas6(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function IAP.TestPas7(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function IAP.TransferOrderData(arg)
  orderData = {};

  orderData.orderId = arg[1];
  orderData.productId = arg[2];

  if LuaHelper.IsAndroidPlatform then
    orderData.signature = arg[3];
    orderData.originalJson = arg[4];
  elseif LuaHelper.IsApplePlatform then
    orderData.base64EncodedTransactionReceipt = arg[3];
  end
end

function IAP.FinishPurchase(orderId)
  LuaHelper.FinishBuy(orderId);
end

function IAP.ClearOrderData()
  orderData = nil;
end

function IAP.IsHaveOrderData()
  return orderData ~= nil;
end

function IAP.AddReSendData()
  if isResend then return end

  isResend = true;

  CGTimer.AddListener(this.ReSendServerData, 10, true);
end

function IAP.TestPas8(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function IAP.TestPas9(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function IAP.ReSendServerData()
  if this.IsHaveOrderData() then
    this.SendDataToServer();
  else
    isResend = false;
    CGTimer.RemoveListener(this.ReSendServerData);
  end
end

function IAP.SendDataToServer()
--  把收據資料寄給Server
--  C:035-012 <儲值> 版本種類(1)          +平台種類(1)      
--                            1.正式                1.蘋果 + base64EncodedTransactionReceipt(?) + orderId(?) + productId(?)
--                            2.測試                2.安卓 + signature(?) + originalJson(?) + orderId(?) + productId(?)

  if not this.IsHaveOrderData() then
    logError("OrderData nil");
    return;
  end

  local version = 0;
  if Define.IsDebugMode() then
    version = 2;
  else
    version = 1;
  end

  local store = 0;
  if LuaHelper.IsAndroidPlatform then
    store = 2;
  elseif LuaHelper.IsApplePlatform then
    store = 1;
  end        
                                                    
  sendBuffer:Clear();
  sendBuffer:WriteByte(version);
  sendBuffer:WriteByte(store);

  if LuaHelper.IsAndroidPlatform then
    sendBuffer:WriteStringWithWordL(orderData.signature);
    sendBuffer:WriteStringWithWordL(orderData.originalJson);
  elseif LuaHelper.IsApplePlatform then
    sendBuffer:WriteStringWithWordL(orderData.base64EncodedTransactionReceipt);
  end

  sendBuffer:WriteStringWithWordL(orderData.orderId);
  sendBuffer:WriteStringWithWordL(orderData.productId);

  Network.Send(35, 12, sendBuffer);
end

function IAP.TestPas10(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function IAP.ReciveReciptResult(result, orderId)
  if result == 0 then
    --購買成功
    ShowNotifyMessage( nil, string.Get(80361) );
    this.FinishPurchase(orderId);
    this.ClearOrderData();
  elseif result == 1 then --server回傳需砍單錯誤
    ShowNotifyMessage( nil, string.format( string.Get(20759), result ) );
    this.FinishPurchase(orderId);
    this.ClearOrderData();
  else
    if isResend then return end
    ShowNotifyMessage( this.AddReSendData, string.Get(20761) ); 
  end

  --[[ 卡單介面暫時關閉
  if result == 0 or result == 1 then
    if UI.IsVisible(UIReciptHelper) then
      UIReciptHelper.ResetUI();
    end
  end

  if UI.IsVisible(UIMall) then
    UIMall.UpdateRecipt();
  end
  --]]
end

function IAP.TestPas11(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function IAP.TestPas12(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end