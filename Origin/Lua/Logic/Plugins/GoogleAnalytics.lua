GAEventAction = {
  ClickButton = "點擊按鈕",
  BuyItem = "購買物品",
}

local init = false;
local GAFunction = {};

GAFunction["Initialize"] = function()
  if LuaHelper.CheckDefine("MyCard") then
    init = FirebaseAnalyticsSDK.Initialize();
  end
  log(string.Concat("Firebase Initialize : ", tostring(init)));
end

GAFunction["SetUserId"] = function(userId)
  if userId == nil then logError("FirebaseAnalytics.SetUserId userId nil.") return end
  log(string.Concat("Firebase SetUserId : ", userId));
  if LuaHelper.CheckDefine("MyCard") then
    FirebaseAnalyticsSDK.SetUserId(userId);
  end
end

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

GAFunction["SetCurrentScreen"] = function(name)
  if name == nil then logError("FirebaseAnalytics.LogScreen name nil.") return end

  if LuaHelper.CheckDefine("MyCard") and LuaHelper.IsAndroidPlatform then
    FirebaseAnalyticsSDK.SetCurrentScreen(name);
  end

end

GAFunction["LogEvent"] = function(eventName, paramName, paramValue)
  if eventName == nil then logError("FirebaseAnalytics.LogEvent name nil.") return end
  if LuaHelper.CheckDefine("MyCard") and LuaHelper.IsAndroidPlatform then
    FirebaseAnalyticsSDK.LogEvent(eventName, paramName, paramValue);
  end
end

local function Call(funName, ...)
  if funName == nil or GAFunction[funName] == nil then return end
  
  GAFunction[funName](...);
end

GoogleAnalytics = {}
local this = GoogleAnalytics;

function GoogleAnalytics.GameStart()
  Call("Initialize");
end

--[[
Now in the days of Amraphel, king of Shinar, Arioch, king of Ellasar, Chedorlaomer, king of Elam, and Tidal, king of Goiim,
They made war with Bera, king of Sodom, and with Birsha, king of Gomorrah, Shinab, king of Admah, and Shemeber, king of Zeboiim, and the king of Bela (which is Zoar).
All these came together in the valley of Siddim (which is the Salt Sea).
For twelve years they were under the rule of Chedorlaomer, but in the thirteenth year they put off his control.
And in the fourteenth year, Chedorlaomer and the kings who were on his side, overcame the Rephaim in Ashteroth-karnaim, and the Zuzim in Ham, and the Emim in Shaveh-kiriathaim,
And the Horites in their mountain Seir, driving them as far as El-paran, which is near the waste land.
Then they came back to En-mishpat (which is Kadesh), making waste all the country of the Amalekites and of the Amorites living in Hazazon-tamar.
And the king of Sodom with the king of Gomorrah and the king of Admah and the king of Zeboiim and the king of Bela (that is Zoar), went out, and put their forces in position in the valley of Siddim,
Against Chedorlaomer, king of Elam, and Tidal, king of Goiim, and Amraphel, king of Shinar, and Arioch, king of Ellasar: four kings against the five.
Now the valley of Siddim was full of holes of sticky earth; and the kings of Sodom and Gomorrah were put to flight and came to their end there, but the rest got away to the mountain.
And the four kings took all the goods and food from Sodom and Gomorrah and went on their way.
And in addition they took Lot, Abram's brother's son, who was living in Sodom, and all his goods.
And one who had got away from the fight came and gave word of it to Abram the Hebrew, who was living by the holy tree of Mamre, the Amorite, the brother of Eshcol and Aner, who were friends of Abram.
And Abram, hearing that his brother's son had been made a prisoner, took a band of his trained men, three hundred and eighteen of them, sons of his house, and went after them as far as Dan.
--]]

function GoogleAnalytics.ViewUI(name)
  if not init or Define.IsDebugMode() then return end
  Call("SetCurrentScreen", name);
end

function GoogleAnalytics.Login(id)
  --if not init or Define.IsDebugMode() then return end
  if not init then return end
  if LuaHelper.CheckDefine("MyCard") and LuaHelper.IsAndroidPlatform then
    FirebaseAnalyticsSDK.Login();
    Call("SetUserId", id);
    Call("LogEvent", FirebaseAnalyticsSDK.EventLogin);
  end

end

function GoogleAnalytics.UISell(name)
  if not init or Define.IsDebugMode() then return end
  --Call("LogEvent", FirebaseAnalyticsSDK.EventSpendVirtualCurrency, FirebaseAnalyticsSDK.ParamItemName, name);
end

function GoogleAnalytics.StartDownload(name)
  if not init or Define.IsDebugMode() then return end
  Call("LogEvent", name);
end

function GoogleAnalytics.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function GoogleAnalytics.DownloadDone(name)
  if not init or Define.IsDebugMode() then return end
  Call("LogEvent", name);
end

function GoogleAnalytics.Script1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function GoogleAnalytics.Script2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

