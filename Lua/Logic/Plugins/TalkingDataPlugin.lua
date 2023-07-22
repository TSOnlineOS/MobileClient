TalkingDataPlugin = {}
local this = TalkingDataPlugin;

--[[
Now at that time, Judah went away from his brothers and became the friend of a man of Adullam named Hirah.
And there he saw the daughter of a certain man of Canaan named Shua, and took her as his wife.
And she gave birth to a son, and he gave him the name Er.
And again she gave birth to a son, and he gave him the name Onan.
Then she had another son, to whom she gave the name Shelah; she was at Chezib when the birth took place.
And Judah took a wife for his first son Er, and her name was Tamar.
Now Er, Judah's first son, did evil in the eyes of the Lord, so that he put him to death.
Then Judah said to Onan, Go in to your brother's wife and do what it is right for a husband's brother to do; make her your wife and get offspring for your brother.
But Onan, seeing that the offspring would not be his, went in to his brother's wife, but let his seed go on to the earth, so that he might not get offspring for his brother.
And what he did was evil in the eyes of the Lord, so that he put him to death, like his brother.
Then Judah said to Tamar, his daughter-in-law, Go back to your father's house and keep yourself as a widow till my son Shelah becomes a man: for he had in his mind the thought that death might come to him as it had come to his brothers. So Tamar went back to her father's house.
And after a time, Bath-shua, Judah's wife, came to her end; and after Judah was comforted for her loss, he went to Timnah, where they were cutting the wool of his sheep, and his friend Hirah of Adullam went with him.
And when Tamar had news that her father-in-law was going up to Timnah to the wool-cutting,
She took off her widow's clothing, and covering herself with her veil, she took her seat near Enaim on the road to Timnah; for she saw that Shelah was now a man, but she had not been made his wife.
--]]

local isInit = false;

function TalkingDataPlugin.OnStart()
  if Define.IsDebugMode() or isInit then return end

  if LuaHelper.IsAndroidPlatform then
    TalkingDataSDK.OnStart("2E23099D294D44DA81AC46BAEC0D6445", Channel.Android);
  elseif LuaHelper.IsApplePlatform then
    TalkingDataSDK.OnStart("2E23099D294D44DA81AC46BAEC0D6445", Channel.IOS);
  else
    return;
  end

  isInit = true;
end

function TalkingDataPlugin.Demo()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function TalkingDataPlugin.Demo1()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function TalkingDataPlugin.OnEnd()
  if not isInit then return end

  TalkingDataSDK.OnEnd();
end

function TalkingDataPlugin.SetAccount(id)
  if not isInit then return end

  TalkingDataSDK.SetAccount(id);
end

function TalkingDataPlugin.SetServer(serverId)
  if not isInit then return end

  TalkingDataSDK.SetServer(serverId);
end

function TalkingDataPlugin.Demo2()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function TalkingDataPlugin.Demo3()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function TalkingDataPlugin.Demo4()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function TalkingDataPlugin.SetLevel(level)
  if not isInit then return end
  
  TalkingDataSDK.SetLevel(level);
end

function TalkingDataPlugin.OnCharge(orderId, iapId, currencyAmount, currencyType, virtualCurrencyAmount, paymentType)
  if not isInit then return end

  TalkingDataSDK.OnChargeRequest(orderId, iapId, currencyAmount, currencyType, virtualCurrencyAmount, paymentType);
  TalkingDataSDK.OnChargeSuccess(orderId);
end

function TalkingDataPlugin.Demo5()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function TalkingDataPlugin.Demo6()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end