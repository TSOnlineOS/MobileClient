StoreValue = {}
local this = StoreValue;

this.pageItemCount = 6;
this.halfMonthCardItemId = 45619; --半月卡物品ID

--[[
Now Abraham was old and far on in years: and the Lord had given him everything in full measure.
And Abraham said to his chief servant, the manager of all his property, Come now, put your hand under my leg:
And take an oath by the Lord, the God of heaven and the God of the earth, that you will not get a wife for my son Isaac from the daughters of the Canaanites among whom I am living;
But that you will go into my country and to my relations and get a wife there for my son Isaac.
And the servant said, If by chance the woman will not come with me into this land, am I to take your son back again to the land from which you came?
And Abraham said, Take care that you do not let my son go back to that land.
The Lord God of heaven, who took me from my father's house and from the land of my birth, and made an oath to me, saying, To your seed I will give this land: he will send his angel before you and give you a wife for my son in that land.
And if the woman will not come with you, then you are free from this oath; only do not take my son back there.
And the servant put his hand under Abraham's leg, and gave him his oath about this thing.
And the servant took ten of his master's camels, and all sorts of good things of his master's, and went to Mesopotamia, to the town of Nahor.
And he made the camels take their rest outside the town by the water-spring in the evening, at the time when the women came to get water.
And he said, O Lord, the God of my master Abraham, let me do well in what I have undertaken this day, and give your mercy to my master Abraham.
See, I am waiting here by the water-spring; and the daughters of the town are coming out to get water:
Now, may the girl to whom I say, Let down your vessel and give me a drink, and who says in answer, Here is a drink for you and let me give water to your camels: may she be the one marked out by you for your servant Isaac: so may I be certain that you have been good to my master Abraham.
And even before his words were ended, Rebekah, the daughter of Bethuel, the son of Milcah, who was the wife of Nahor, Abraham's brother, came out with her water-vessel on her arm.
She was a very beautiful girl, a virgin, who had never been touched by a man: and she went down to the spring to get water in her vessel.
And the servant came running to her and said, Give me a little water from your vessel.
And she said, Take a drink, my lord: and quickly letting down her vessel onto her hand, she gave him a drink.
And having done so, she said, I will get water for your camels till they have had enough.
And after putting the water from her vessel into the animals' drinking-place, she went quickly back to the spring and got water for all the camels.
And the man, looking at her, said nothing, waiting to see if the Lord had given his journey a good outcome.
And when the camels had had enough, the man took a gold nose-ring, half a shekel in weight, and two ornaments for her arms of ten shekels weight of gold;
And said to her, Whose daughter are you? is there room in your father's house for us?
And she said to him, I am the daughter of Bethuel, the son of Milcah, Nahor's wife.
And she said, We have a great store of dry grass and cattle-food, and there is room for you.
And with bent head the man gave worship to the Lord;
And said, Praise be to the Lord, the God of my master Abraham, who has given a sign that he is good and true to my master, by guiding me straight to the house of my master's family.
]]--

local currentPlatform;
local init = false;

local halfMonthCard = nil;

local show = {};

if LuaHelper.IsAndroidPlatform then
  currentPlatform = EPlatform.Android;
elseif LuaHelper.IsApplePlatform then
  currentPlatform = EPlatform.IOS;
else
  currentPlatform = EPlatform.MyCard;
end

function StoreValue.Clear()
  halfMonthCard = nil;
end

--儲值顯示
function StoreValue.Init()
  if init then return end;

  this.InitShow();

  init = true;
end

function StoreValue.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function StoreValue.TrashA()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function StoreValue.InitShow()
  if LuaHelper.CheckDefine("ThirdParty") then
    if LuaHelper.CheckDefine("MyCard") then
      StoreValue.InsertShowData(EPlatform.MyCard);
    end 

    if LuaHelper.CheckDefine("Alipay") then
      StoreValue.InsertShowData(EPlatform.AliPay);
      StoreValue.InsertShowData(EPlatform.NineCard);
      StoreValue.InsertShowData(EPlatform.ULong);
      StoreValue.InsertShowData(EPlatform.NewebPay);
    end
  else
    StoreValue.InsertShowData(this.GetCurrentPlatform());
  end
end

function StoreValue.InsertShowData(platform)
  if storeValueDatas[platform] == nil then return end

  for k, v in pairs(storeValueDatas[platform]) do
    if v.textureId ~= 0 then
      table.insert(show, v);
      show[#show].platform = platform;
    end
  end
end

function StoreValue.TrashB()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function StoreValue.TrashC()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function StoreValue.TrashD()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function StoreValue.GetTotalPageCount()
  return math.ceil(table.Count(show) / this.pageItemCount);
end

function StoreValue.GetShowData(showIndex)
  if show[showIndex] == nil then 
    return nil;
  end

  return show[showIndex];
end

function StoreValue.GetStoreName(platform)
   if platform == EPlatform.MyCard then
    return string.Get(21571);
  elseif platform == EPlatform.AliPay then
    return string.Get(21574);
  elseif platform == EPlatform.NineCard then
    return string.Get(21573);
  elseif platform == EPlatform.ULong then
    return string.Get(21572);
   elseif platform == EPlatform.NewebPay then
     return string.Get(23877);
  end

  return "";
end

function StoreValue.TrashE()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function StoreValue.TrashF()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function StoreValue.GetStoreName(platform)
   if platform == EPlatform.MyCard then
    return string.Get(21571);
  elseif platform == EPlatform.AliPay then
    return string.Get(21574);
  elseif platform == EPlatform.NineCard then
    return string.Get(21573);
  elseif platform == EPlatform.ULong then
    return string.Get(21572);
   elseif platform == EPlatform.NewebPay then
     return string.Get(23877);
  end

  return "";
end

--儲值串表
function StoreValue.GetData(productIndex)
  if storeValueDatas[this.GetCurrentPlatform()] == nil then
    return nil;
  end

  for k, v in pairs(storeValueDatas[this.GetCurrentPlatform()]) do
    if productIndex == v.index then
      return v;
    end
  end

  return nil;
end

function StoreValue.TrashG()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function StoreValue.TrashH()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function StoreValue.GetCurrentPlatform()
  if LuaHelper.CheckDefine("ThirdParty") then
    if LuaHelper.CheckDefine("MyCard") then
      return EPlatform.MyCard;
    end
  end

  return currentPlatform;
end

function StoreValue.Buy(platform, index, tradeType)
  if LuaHelper.IsStandalone or LuaHelper.IsEditor then
    if Define.IsInternal() then
      if index == BattlePass.battlePassStorValueIndex then
        UI.Open(UIMyCardInput, platform, EMyCardInputKind.BattlePass);
      else
        UI.Open(UIMyCardInput, platform, EMyCardInputKind.Others);
      end
    else
      if tradeType > 1 then
        UI.Open(UIMallPaySelect, index);
      else
        if platform == EPlatform.MyCard then
          MyCard.PcBuy(index);
        elseif platform == EPlatform.NewebPay then
          MyCard.NewebPay(index);
        elseif platform == EPlatform.NineCard or platform == EPlatform.ULong then
          if index == BattlePass.battlePassStorValueIndex then
            UI.Open(UIMyCardInput, platform, EMyCardInputKind.BattlePass);
          else
            UI.Open(UIMyCardInput, platform, EMyCardInputKind.Others);
          end
        end
      end
    end
  else
    if platform == EPlatform.Android or platform == EPlatform.IOS then
      IAP.PurchaseProduct(StoreValue.GetIAPIndex(index));
    elseif platform == EPlatform.MyCard then
      if Define.IsDebugMode() then
        if index == BattlePass.battlePassStorValueIndex then
          UI.Open(UIMyCardInput, platform, EMyCardInputKind.BattlePass);
        else
          UI.Open(UIMyCardInput, platform, EMyCardInputKind.Others);
        end
      else
        MyCard.Buy(index, tradeType);
      end
    elseif platform == EPlatform.AliPay then
      AliPay.Buy(index);
    elseif platform == EPlatform.NineCard or platform == EPlatform.ULong or platform == EPlatform.NewebPay then
      if index == BattlePass.battlePassStorValueIndex then
        UI.Open(UIMyCardInput, platform, EMyCardInputKind.BattlePass);
      else
        UI.Open(UIMyCardInput, platform, EMyCardInputKind.Others);
      end
    end
  end
end

function StoreValue.BuyPointCard(platform, no, pas)
  if platform == EPlatform.MyCard then
    PointCard.Buy(PointCard.Kind.MyCard, no, pas);
  elseif platform == EPlatform.NineCard then
    PointCard.Buy(PointCard.Kind.NineCard, no, pas);
  elseif platform == EPlatform.ULong then
    PointCard.Buy(PointCard.Kind.ULong, no, pas);
  elseif platform == EPlatform.NewebPay then
    PointCard.Buy(PointCard.Kind.NewebPay, no, pas);
  else
    logError("platform Error : "..platform);
  end
end

function StoreValue.TrashI()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function StoreValue.TrashJ()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function StoreValue.GetIAPIndex(index)
  for k, v in pairs(IAPData.GetProductIndex()) do
    if index == v then
      return k;
    end
  end

  return 0;
end

function StoreValue.GetIAPName(productId)
  local index;
  for pk, pv in pairs(IAPData.GetProductName()) do
    if productId == pv then
      index = pk;
    end
  end

  local value;
  for ik, iv in pairs(IAPData.GetProductIndex()) do
    if index == ik then
      value = iv;
    end
  end

  if index > 6 then -- 7開始是禮包
    local itemId = nil;

    for ntdk, ntdv in pairs(goodsSaleData[EStoreKind.NTD][1][1]) do
      if value == ntdv.saleCredit then
        itemId = ntdv.Id;
        break;
      end
    end 

    if itemId == nil then
      for ntdk2, ntdv2 in pairs(goodsSaleData[EStoreKind.NTD2][1][1]) do
        if value == ntdv2.saleCredit then
          itemId = ntdv2.Id;
          break;
        end   
      end 
    end

    if itemId ~= nil then
      return itemDatas[itemId]:GetName();
    end
  else
    local storeData = StoreValue.GetData(index);

    return string.Get(10097).." "..storeData.totalGold;
  end

  return "";
end

function StoreValue.TrashK()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function StoreValue.TrashL()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function StoreValue.TrashM()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

--半月卡
function StoreValue.SetHalfMonthCardTime(d)
  halfMonthCard = System.DateTime.FromOADate(d);

  if UI.IsVisible( UIMall ) then
    UIMall.RefreshItemPage();
  end
end

function StoreValue.IsHalfMonthCardCanBuy()
  --不在活動時間內
  if not this.IsHalfMonthCardActive() then
    return false;
  end

  --沒有半月卡即可購買
  return not this.IsHaveHalfMonthCard();
end

function StoreValue.IsHalfMonthCardActive()
  if not this.IsHalfMonthCardVaild() then return false end
  
  return activityTimes[13][1]:IsActive(); 
end

function StoreValue.IsHalfMonthCardStart()
  if not this.IsHalfMonthCardVaild() then return false end

  return System.DateTime.Compare( CGTimer.serverTime, activityTimes[13][1]:GetStartDate() ) >= 0
end

function StoreValue.IsHalfMonthCardEnd()
  if not this.IsHalfMonthCardVaild() then return false end

  return System.DateTime.Compare( CGTimer.serverTime, activityTimes[13][1]:GetEndDate() ) >= 0
end

function StoreValue.IsHaveHalfMonthCard()
  return BitFlag.Get(1548) and StoreValue.GetHalfMonthCardTotalDay() <= 14 -- 購買永標
end

function StoreValue.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function StoreValue.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function StoreValue.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function StoreValue.GetHalfMonthCardTotalDay()
  if not this.IsHalfMonthCardVaild() or halfMonthCard == nil then return 0 end
  return math.floor( DateTime.New( CGTimer.serverTime.Year, CGTimer.serverTime.Month , CGTimer.serverTime.Day, 0, 0, 0 ):Subtract( DateTime.New( halfMonthCard.Year, halfMonthCard.Month , halfMonthCard.Day, 0, 0, 0 ) ).TotalDays ) + 1;
end

function StoreValue.GetHalfMonthCardEndDate()
  if not this.IsHalfMonthCardVaild() or halfMonthCard == nil then return 0 end
  return DateTime.New( halfMonthCard.Year, halfMonthCard.Month , halfMonthCard.Day, 0, 0, 0 ):AddDays(14);
end

function StoreValue.IsHalfMonthCardVaild()
  --沒有設定品項活動時間
  if activityTimes[13] == nil then
    logError("activityTimes[13] == nil");
    return false;
  end  

  --串表關閉此活動
  if activityTimes[13][1].switch == 0 then
    logError("activityTimes[13][1].switch == 0");
    return false;
  end  

  return true;
end

function StoreValue.Trash4()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function StoreValue.Trash5()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end