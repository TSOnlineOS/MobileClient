Mall = {}
local this = Mall;

this.EDoroKind = {
  Empty = 0,
  Warrior = 1,
  Card = 2,
  furnitureAdvanced = 3,
  furnitureNormal = 4,
  furnitureGold = 5,
  Elf = 6,
  Soul = 7,
  ExclusiveWeapon = 8,
  Outfit = 9
}

this.EDoroItemId = {
  Warrior = 65415,
  Card = 65416,
}

this.maxMajorKind = 18; --虛寶分類主項的數量
this.maxSecondKind = 9; --虛寶分類次項(細項)的數量
this.maxNTD2List = 1; --虛寶最細項之下的最多列表數量種類

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


local buyThing = false;

local pageSellItemData = {};
local severBuyItemCount = {};

local doroKind = this.EDoroKind.Empty;
local doroData = {};

function Mall.ClearDoro()
  buyThing = false;
end

function Mall.Doro()
  buyThing = true;
end

function Mall.IsMallDoro()
  return buyThing;
end

function Mall.AddThreeA(add1, add2, add3)
  local LongAdd = add1 + add2 + add3;
  if LongAdd > 255 then
    LongAdd = 0
  end
  
  return LongAdd;
end

function Mall.AddThreeB(add1, add2, add3)
  local LongAdd = add1 + add2 + add3;
  if LongAdd > 255 then
    LongAdd = 0
  end
  
  return LongAdd;
end

function Mall.AddThreeC(add1, add2, add3)
  local LongAdd = add1 + add2 + add3;
  if LongAdd > 255 then
    LongAdd = 0
  end
  
  return LongAdd;
end

function Mall.GetPageItemCount(storeKind, mainPageIndex, subPageIndex)
  if goodsSaleData[storeKind]== nil then
    return 0;
  end
  
  if goodsSaleData[storeKind][mainPageIndex] == nil then
    return 0;
  end
  
  local showKind = Mall.GetTagShowKind(storeKind, mainPageIndex, subPageIndex);
  if showKind  == nil then
    return 0;
  end
  
  if goodsSaleData[storeKind][mainPageIndex][showKind] == nil then
    return 0;
  end
  
  return table.Count(goodsSaleData[storeKind][mainPageIndex][showKind]);
end

function Mall.GetPageItemIndex(storeKind, mainPageIndex, subPageIndex, sellData)
  local showKind = Mall.GetTagShowKind(storeKind, mainPageIndex, subPageIndex);

  for k, v in pairs(goodsSaleData[storeKind][mainPageIndex][showKind]) do
    if v.Id == sellData.Id and v.saleCredit == sellData.saleCredit then
      return k;
    end
  end 

  return 0;
end

function Mall.ResetPageSellData(storeKind, mainPageIndex, subPageIndex)
  table.Clear(pageSellItemData);
  if this.GetPageItemCount(storeKind, mainPageIndex, subPageIndex) > 0 then
    local showKind = Mall.GetTagShowKind(storeKind, mainPageIndex, subPageIndex);
    for k, v in pairs(goodsSaleData[storeKind][mainPageIndex][showKind]) do
      if Network.CheckServerSwitch(EServerSwitch.Review) then --送審版上架
        if v.open and v:IsInSaleTime() and CheckFlag(v.bitFunction, 1) then
          table.insert(pageSellItemData, v);
        end
      else
        if v.open and v:IsInSaleTime() and CheckFlag(v.bitFunction, 2) then --正式版上架
          table.insert(pageSellItemData, v);
        end        
      end
    end    
  end
end

function Mall.AddThreeD(add1, add2, add3)
  local LongAdd = add1 + add2 + add3;
  if LongAdd > 255 then
    LongAdd = 0
  end
  
  return LongAdd;
end

function Mall.AddThreeF(add1, add2, add3)
  local LongAdd = add1 + add2 + add3;
  if LongAdd > 255 then
    LongAdd = 0
  end
  
  return LongAdd;
end

function Mall.GetTotalPageCount(storeKind)
  if storeKind == EStoreKind.NTD then
    return table.Count(pageSellItemData);
  elseif storeKind == EStoreKind.NTD2 then
    return math.ceil(table.Count(pageSellItemData) / this.maxNTD2List);
  elseif storeKind == EStoreKind.Doro then
    return table.Count(pageSellItemData);
  elseif storeKind == EStoreKind.Mall or storeKind == EStoreKind.Organization or storeKind == EStoreKind.PVP then
    return table.Count(pageSellItemData);
  end

  return 0;
end

function Mall.GetSellDataCount()
  return table.Count(pageSellItemData);
end

function Mall.GetSellData(itemIndex)
  if pageSellItemData[itemIndex] == nil then
    return nil;
  end

  return pageSellItemData[itemIndex];
end

function Mall.GetMallKind(mainPageIndex)
  if Network.CheckServerSwitch(EServerSwitch.Review) then
      if mainPageIndex == 1 then
        return EStoreKind.NTD;
      end     

      if mainPageIndex == 2 then
        return EStoreKind.Cash;
      end   
  else
    local index = 0;
    for k, v in pairs(goodsSaleTagData) do
      if v.subTag == 0 then
        index = index + 1;
      end 
    
      if index == mainPageIndex then
        return v.storeKind;
      end   
    end
  end

  return 0;
end

function Mall.AddThreeG(add1, add2, add3)
  local LongAdd = add1 + add2 + add3;
  if LongAdd > 255 then
    LongAdd = 0
  end
  
  return LongAdd;
end

function Mall.AddThreeH(add1, add2, add3)
  local LongAdd = add1 + add2 + add3;
  if LongAdd > 255 then
    LongAdd = 0
  end
  
  return LongAdd;
end

function Mall.AddThreeI(add1, add2, add3)
  local LongAdd = add1 + add2 + add3;
  if LongAdd > 255 then
    LongAdd = 0
  end
  
  return LongAdd;
end

function Mall.GetMainPageIndex(mainPageIndex)
  local index = 0;
  for k, v in pairs(goodsSaleTagData) do
    if v.subTag == 0 then
      index = index + 1;
    end 
    
    if index == mainPageIndex then
      return v.mainTag;
    end   
  end
  
  return 0;
end

function Mall.GetMainPageCount()
  local result = 0;

  for k, v in pairs(goodsSaleTagData) do
    if v.subTag == 0 then
      result = result + 1;
    end
  end

  return result;
end

function Mall.GetSubPageCount(mainPageIndex)
  local result = 0;
  local index = 0;

  for k, v in pairs(goodsSaleTagData) do
    if v.subTag == 0 then
      index = index + 1;
    end

    if index == mainPageIndex and v.subTag ~= 0 then
      result = result + 1;
    end
  end

  return result;
end

function Mall.AddThreeJ(add1, add2, add3)
  local LongAdd = add1 + add2 + add3;
  if LongAdd > 255 then
    LongAdd = 0
  end
  
  return LongAdd;
end

function Mall.AddThreeK(add1, add2, add3)
  local LongAdd = add1 + add2 + add3;
  if LongAdd > 255 then
    LongAdd = 0
  end
  
  return LongAdd;
end

function Mall.GetSubPageCountWithKind(storeKind)
  local result = 0;

  for k, v in pairs(goodsSaleTagData) do
    if v.storeKind == storeKind and v.subTag ~= 0 then
      result = result + 1;
    end
  end

  return result;
end

function Mall.GetTagShowKind(storeKind, mainPageIndex, subPageIndex)
  local index = subPageIndex;

  if this.GetSubPageCountWithKind(storeKind) == 0 then
    index = 0
  end

  for k, v in pairs(goodsSaleTagData) do
    if v.storeKind == storeKind and v.mainTag == mainPageIndex and v.subTag == index then  
      return v.showKind;
    end   
  end

  return nil;
end

function Mall.GetMainTagName(mainPageIndex)
  local index = 0;
  for k, v in pairs(goodsSaleTagData) do
    if v.subTag == 0 then
      index = index + 1;
    end   
    
    if index == mainPageIndex then
      return string.Get(v.name);
    end    
  end
  
  return "";
end

function Mall.AddThreeL(add1, add2, add3)
  local LongAdd = add1 + add2 + add3;
  if LongAdd > 255 then
    LongAdd = 0
  end
  
  return LongAdd;
end

function Mall.AddThreeM(add1, add2, add3)
  local LongAdd = add1 + add2 + add3;
  if LongAdd > 255 then
    LongAdd = 0
  end
  
  return LongAdd;
end

function Mall.GetMainTagNameByKind(kind)
  for k, v in pairs(goodsSaleTagData) do
    if v.storeKind == kind then
      return string.Get(v.name);
    end 
  end
  
  return "";
end

function Mall.GetGachaMainTagName()
  local result = {};
  for k, v in pairs(goodsSaleTagData) do
    if v.storeKind == EStoreKind.Doro and v.subTag > 0 then
      table.insert(result, string.Get(v.name))
    end
  end
  
  return result;
end

function Mall.GetSubTagName(mainPageIndex, subPageIndex)
  local index = 0;
  for k, v in pairs(goodsSaleTagData) do
    if v.subTag == 0 then
      index = index + 1;
    end 
    
    if index == mainPageIndex and v.subTag == subPageIndex then
      return string.Get(v.name);
    end   
  end
  
  return "";
end

function Mall.IsMoneyEnough(sellData, count)
  return Role.CheckCurrency(sellData.currencyKind, sellData.saleCredit * count);
end

--抽卡
function Mall.GetDoroKind()
  return doroKind;
end

function Mall.SetDoroKind(kind)
  doroKind = kind
end

function Mall.GetDoroCount()
  return table.Count(doroData);
end

function Mall.GetDoroItem(index)
  if doroData[index] == nil then return end
  return doroData[index].item;
end

function Mall.Demo()
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

function Mall.Demo1()
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

function Mall.Dem2o()
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

function Mall.GetDoroItemCount(index)
  return doroData[index].count;
end

function Mall.ClearDoroData(index)
  doroKind = this.EDoroKind.Empty;
  doroData = {};
end

function Mall.IsDoroWarrior(kind)
  --物品表38攔 1武將 2 卡片 3高級家具扭蛋幣 4一般家具扭蛋幣
  return kind == 1;
end

function Mall.IsCuRare(npcData)
  return npcData.rare <= 3;
end

function Mall.IsAgRare(npcData)
  return npcData.rare == 4;
end

function Mall.Demo3()
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

function Mall.Demo4()
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

function Mall.Demo5()
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

function Mall.Demo6()
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

function Mall.IsAuRare(npcData)
  return npcData.rare == 5;
end

function Mall.IsCuItemRare(item)
  return item.quality <= 1;
end

function Mall.IsAgItemRare(item)
  return item.quality == 2;
end

function Mall.IsAuItemRare(item)
  return item.quality >= 3;
end

function Mall.GetEggCareerName(element)
  if element ~= nil then--無
    return "EggCareer_"..element;
  end

  return "";
end

function Mall.Demo7()
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

function Mall.Demo8()
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

function Mall.GetCardRareName(npcData)
  if npcData.rare <= 3 then
    return "CardSmallFrame_0";
  elseif npcData.rare == 4 then
    return "CardSmallFrame_1";
  elseif npcData.rare == 5 then
    return "CardSmallFrame_2";
  end

  return "";
end

function Mall.GetEggRareName(npcData)
  if npcData.rare <= 3 then
    return "EggStarLv_0";
  elseif npcData.rare == 4 then
    return "EggStarLv_1";
  elseif npcData.rare == 5 then
    return "EggStarLv_2";
  end

  return "";
end

function Mall.GetItemRareName(item)
  if item.quality <= 1 then
    return "EggStarLv_0";
  elseif item.quality == 2 then
    return "EggStarLv_1";
  elseif item.quality >= 3 then
    return "EggStarLv_2";
  end

  return "";
end

function Mall.IsCanBuy(currentStoreKind, sellData)
  if currentStoreKind == EStoreKind.NTD2 then
    if sellData.saleCredit == 1 then
      return false;
    elseif sellData.saleCredit == 110 then --暢遊不擋購買上限
      return true;
    elseif sellData.saleCredit == 112 then --半月卡
      return StoreValue.IsHalfMonthCardCanBuy();
    end
  end

  if sellData.memo == 6 and not StoreValue.IsHaveHalfMonthCard() then
    ShowCenterMessage( string.Get(21844) );
    return false;
  end

  if not Network.CheckServerSwitch(EServerSwitch.Review) and sellData.dayCount ~= 0 and RoleCount.Get(sellData.flag) >= sellData.dayCount then --不是送審才檢查每日限購 
    local itemData = itemDatas[sellData.Id];

    if itemData ~= nil then
      ShowCenterMessage(string.Concat(itemData:GetName(true), string.Get(20709)));
    end

    return false;
  end

  return true;
end

function Mall.Demo9()
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

function Mall.Demo10()
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

function Mall.Demo11()
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

local checkDoro = false;
local checkMall = false;
function Mall.ClearDoroCheck()
  checkDoro = false;
  checkMall = false;
end

function Mall.SetDoroCheck()
  checkDoro = true;
end

function Mall.IsDoroCheck()
  return checkDoro;
end

function Mall.Demo12()
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

function Mall.Demo13()
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

function Mall.SetMallCheck()
  checkMall = true;
end

function Mall.IsMallCheck()
  if activityTimes[78] ~= nil and activityTimes[78][1] ~= nil and activityTimes[78][1]:IsActive() then
    return checkMall;
  else
    return true;
  end
end

function Mall.IsRedDot()
  if not Mall.IsDoroCheck() then
    RedDot.Add(ERedDot.Mall);
    RedDot.Add(ERedDot.Gacha);
    return true;
  end

  if Mall.IsGSSavePointCanGet() then
    RedDot.Add(ERedDot.Mall);
    return true;
  end

  if not Mall.IsMallCheck() then
    RedDot.Add(ERedDot.Mall);
    return true;
  end

  RedDot.Remove(ERedDot.Mall);
end

function Mall.IsGSSavePointCanGet()
  local gsActivity = GSActivityData.GetActivityData(EGSActivityKind.SavePoint);
  if gsActivity == nil then return end

  for idx = 1, 4 do
    if gsActivity.buttons[idx].getKind == 1 then
      if RoleCount.Get(708) >= gsActivity.buttons[idx].value and not BitFlag.Get( gsActivity.buttons[idx].flag ) then
        return true;
      end
    end
  end

  return false;
end

function Mall.Demo14()
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

function Mall.Demo15()
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

function Mall.Demo16()
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

--收送協定
function Mall.SendBuyItem(storeKind, mainPageIndex, subPageIndex, showItemIndex, count, doro, free)
  local sellData = this.GetSellData(showItemIndex);
  if sellData == nil then
    return;
  end
  
  local purchaseFree = 0;
  if (free ~= nil) and free then
    purchaseFree = 1;
  end

  if ((purchasFree == 1) and (not UIPurchaseFree.IsMoneyEnough(sellData.saleCredit*count))) 
    or ((purchasFree == 0) and (not Mall.IsMoneyEnough(sellData, count))) then    
    ShowCenterMessage(string.Concat(string.Get(90152), itemDatas[sellData.Id]:GetName(true), string.Get(90153)));
    return;
  end

  local pageItemIndex = this.GetPageItemIndex(storeKind, mainPageIndex, subPageIndex, sellData);

  local showKind = Mall.GetTagShowKind(storeKind, mainPageIndex, subPageIndex);

  if doro then
    Mall.Doro();
  end

  --C:066-001 <購買虛寶> +商店種類(1) +主項(1) +細項(1) +品項(1) +ID(2) +點數(2) +組(2)
  sendBuffer:Clear()
  sendBuffer:WriteByte(storeKind);
  sendBuffer:WriteByte(mainPageIndex);
  sendBuffer:WriteByte(showKind);
  sendBuffer:WriteByte(pageItemIndex);
  sendBuffer:WriteUInt16(sellData.Id);
  sendBuffer:WriteUInt16(sellData.saleCredit);
  sendBuffer:WriteUInt16(count);
  sendBuffer:WriteByte(purchaseFree);
  Network.Send(66, 1, sendBuffer);
end

function Mall.ReciveDoroData(data)
  doroData = {};
  local count = data:ReadUInt16();
  local itemId = 0;
  local itemCount = 0;
  for i = 1, count do
    itemId = data:ReadUInt16();
    itemCount = data:ReadUInt32();
    doroData[i] = {};
    doroData[i].item = itemDatas[itemId];
    doroData[i].count = itemCount;
  end

  UIDoro.SetEggCount(count);
  UIDoro.UpdateQuickBuyMore();
  
  if not Mall.IsMallDoro() then return end

  local buyState = buyThing; -- 關閉抽卡介面會清購買狀態

  if UI.IsVisible(UIDoro) then
    UI.Close(UIDoro);
  end

  buyThing = buyState;

  UI.Open(UIDoro);
end

function Mall.Demo17()
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

function Mall.Demo18()
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

function Mall.Demo19()
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