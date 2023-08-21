EWebMarketKind = {
  Currency = 1,
  BagItem = 2,
  Soul = 3,
  Npc = 4,
}

Market = {}
local this = Market;

--[[
Now Dinah, the daughter whom Leah had by Jacob, went out to see the women of that country.
And when Shechem, the son of Hamor the Hivite who was the chief of that land, saw her, he took her by force and had connection with her.
Then his heart went out in love to Dinah, the daughter of Jacob, and he said comforting words to her.
And Shechem said to Hamor, his father, Get me this girl for my wife.
Now Jacob had word of what Shechem had done to his daughter; but his sons were in the fields with the cattle, and Jacob said nothing till they came.
Then Hamor, the father of Shechem, came out to have a talk with Jacob.
Now the sons of Jacob came in from the fields when they had news of it, and they were wounded and very angry because of the shame he had done in Israel by having connection with Jacob's daughter; and they said, Such a thing is not to be done.
But Hamor said to them, Shechem, my son, is full of desire for your daughter: will you then give her to him for a wife?
And let our two peoples be joined together; give your daughters to us, and take our daughters for yourselves.
Go on living with us, and the country will be open to you; do trade and get property there.
And Shechem said to her father and her brothers, If you will give ear to my request, whatever you say I will give to you.
However great you make the bride-price and payment, I will give it; only let me have the girl for my wife.
But the sons of Jacob gave a false answer to Shechem and Hamor his father, because of what had been done to Dinah their sister.
And they said, It is not possible for us to give our sister to one who is without circumcision, for that would be a cause of shame to us:
But on this condition only will we come to an agreement with you: if every male among you becomes like us and undergoes circumcision;
Then we will give our daughters to you and take your daughters to us and go on living with you as one people.
But if you will not undergo circumcision as we say, then we will take our daughter and go.
And their words were pleasing to Hamor and his son Shechem.
And without loss of time the young man did as they said, because he had delight in Jacob's daughter, and he was the noblest of his father's house.
--]]

this.webItemLimit= 0; --還可上傳數量(與web同步)
this.maxWebItemLimit = 25; --可上傳上限
this.gotWebData = false;

--var
local uploadFilterBag = {};
local failUploadBag = {};
local warriorSlot = {};
local followWarrior = {};
local WarriorInWeb = {};
local uploadGold = 0;
local tsGold = 0;
local canTradeCount = 0;
local tsGoldUploadLimit = 100000;
local calledFromTutorial = false;

--region UploadToWeb
function Market.UploadFail(failIndex)
  local uploadSlot = Item.GetBag(EThings.WebUpload);
  local slotCount = table.Count(uploadSlot);
  local itemData;
  if failIndex <= slotCount then
    for i = 1, slotCount do
      if i < failIndex then
        Item.DelBagItem(EThings.WebUpload, i, nil, 0, false);
      else
        itemData = itemDatas[uploadSlot[i].Id];
        table.insert(failUploadBag, itemData.name)
      end
    end
    local warriorCount = table.Count(warriorSlot);
    if warriorCount ~= 0 then
      for i = 1, warriorCount do
        table.insert(failUploadBag, warriorSlot[i].name)
      end
    end
  else
    local warriorCount = table.Count(warriorSlot);
    local failWarrior = failIndex - slotCount;
    for i = 1, warriorCount do
      if i >= failWarrior then
        table.insert(failUploadBag, warriorSlot[i].name)
      end
    end
  end
  
  this.ClearUploadSlots();
  UIMarket.OpenWarning(string.Get(23762), nil, true);
end

function Market.UploadSuccess()
  Item.ClearBag(EThings.WebUpload);
  table.Clear(warriorSlot);
  uploadGold = 0;
  UIMarket.UpdateUI(true);
  UIMarket.OpenWarning(string.Get(23729), string.GetColorText(string.Get(23730), Color.Red));
end

function Market.GetFailUploadBagCount()
  return table.Count(failUploadBag);
end

function Market.GetFailUploadBag()
  return failUploadBag;
end

function Market.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Market.Script1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Market.Script2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Market.ClearUploadSlots()
  Item.ClearBag(EThings.WebUpload);
  table.Clear(warriorSlot);
  uploadGold = 0;
end

function Market.ClearFailUploadBag()
  table.Clear(failUploadBag);
end

function Market.ClearAllTable()
  this.ClearUploadSlots();
  table.Clear(failUploadBag);
  table.Clear(warriorSlot);
  table.Clear(followWarrior);
  uploadGold = 0;
end

function Market.Scripta()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Market.ScriptB()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Market.NeedCheckQuant(itemSave) --是否需要確認堆疊數量
  if itemDatas[itemSave.Id].kind == EItemKind.DoroCard or itemDatas[itemSave.Id].kind == EItemKind.Furniture or itemDatas[itemSave.Id].kind == EItemKind.SpecialAbility then
    return true
  end

  return false
end

function Market.GetUploadGold()
  return uploadGold;
end

function Market.SetUploadGold(number)
    uploadGold = number
end

function Market.ScriptC()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Market.ScriptD()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Market.ScriptE()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Market.ScriptF()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Market.GetUploadBag()
  table.Clear(uploadFilterBag);
  local bag = Item.GetBag(EThings.WebUpload);
  for k, v in pairs(bag) do
    if itemDatas[v.Id] ~= nil then
      v.uploadIndex = k;
      v.sort = itemDatas[v.Id].sort;
      table.insert(uploadFilterBag, v);
    end
  end
  table.sort(uploadFilterBag, Item.Sort);
  
  return uploadFilterBag;
end

function Market.ReturnUploadItemsToBag()
  local bagItem;
  local uploadSlot = Item.GetBag(EThings.WebUpload);
  
  for k, v in pairs(uploadSlot) do
    if itemDatas[v.Id].kind ~= EItemKind.Soul then
      bagItem = Item.GetBagItem(EThings.Bag, v.bagIndex);
      if bagItem ~= nil then
        v.quant = v.quant + bagItem.quant;
      end
      Item.SetBagItem(EThings.Bag, v.bagIndex, v, false)
    end
  end
end

function Market.RemoveZeroQuant(itemBag)
  local count = table.Count(itemBag);
  local removeCount = 0;
  for i = 1, count do
    local index = i - removeCount;
    if Market.CheckInWebSlot(itemBag[index].Id, itemBag[index].bagIndex) then
      if (itemBag[index].quant - Market.GetItemInWebSlotCount(itemBag[index].Id, itemBag[index].bagIndex)) <= 0 then
        table.remove(itemBag, index);
        removeCount = removeCount + 1;
      end
    end
  end
end
--endregion

--region Withdraw
function Market.SetGold(gold)
  if gold ~= nil and gold ~= 0 then
    tsGold = gold;
  end
end

function Market.ScriptG()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Market.ScriptH()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Market.ScriptI()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Market.ReceiveWebNpcData(npcData)
  table.insert(WarriorInWeb, npcData)
end

function Market.GetWebTsGold()
  return tsGold;
end

function Market.GetWarriorInWeb()
  return WarriorInWeb;
end

function Market.Withdraw(isAll, SN)
  --C:109-003<領取web物品> 數量(1) +<拍賣SN(8)> -- SN寄0為領錢
  if not isAll then
    sendBuffer:Clear();
    sendBuffer:WriteByte(1);
    sendBuffer:WriteInt64(SN);
    Network.Send(109, 3, sendBuffer);
  elseif not this.CheckWebHaveItem() then
    return;
  else
    local allSN = {};
    if tsGold ~= 0 then
      table.insert(allSN, 0);
    end
    if Item.GetBagCount(EThings.Web) ~= 0 then
      local bag = Item.GetBag(EThings.Web);
      for _,v in pairs(bag) do
        table.insert(allSN, v.webSN);
      end
    end
    local emptyCount = Market.GetFollowWarriorEmptyCount();
    local warriorCount = 0;
    local withdrawID = {};
    if table.Count(WarriorInWeb) ~= 0 then
      for _,v in pairs(WarriorInWeb) do
        if not Market.CheckHaveWarrior(v.npcId) and warriorCount <= emptyCount and not table.Contains(withdrawID, v.npcId) then
          table.insert(allSN, v.webSN);
          table.insert(withdrawID, v.npcId)
          warriorCount = warriorCount + 1;
        end
      end
    end
    
    if table.Count(allSN) == 0 then
      UIMarket.OpenWarning(string.Get(23725),string.GetColorText(string.Get(23726), Color.Red));
    else
      sendBuffer:Clear();
      sendBuffer:WriteByte(table.Count(allSN));
      for _,v in ipairs(allSN) do
        sendBuffer:WriteInt64(v);
      end
      Network.Send(109, 3, sendBuffer);
    end
  end
end

function Market.ClearWithdraw()
  UIMarket.ResetWithdrawCategory();
  tsGold = 0;
  Item.ClearBag(EThings.Web);
  table.Clear(WarriorInWeb);
end

function Market.TestPas(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Market.TestPas1(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Market.CheckWebHaveItem()
  local bagCount = Item.GetBagCount(EThings.Web);
  local warriorCount = table.Count(WarriorInWeb);
  if tsGold ~= 0 or bagCount ~= 0 or warriorCount ~= 0 then
    return true;
  end
  
  return false;
end

function Market.CheckHaveWarrior(npcId)
  if Inn.HaveNpc(npcId) or Role.GetFollowNpc(Role.playerId, npcId) ~= nil then --「已有此武將」
    return true;
  end
  
  local isFull = true;
  for i = 1, Role.maxFollowNpc do
    if Role.GetRole(EHuman.FollowNpc, Role.playerId, i) == nil then
      isFull = false;
      break;
    end
  end
  
  return isFull;
end

function Market.TestPas2(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Market.TestPas3(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Market.GetFollowWarriorEmptyCount()
  local count = 0;
  for i = 1, Role.maxFollowNpc do
    if Role.GetRole(EHuman.FollowNpc, Role.playerId, i) == nil then
      count = count + 1;
    end
  end
  
  return count;
end
--endregion

--region UploadWarrior
function Market.GetWarriorSlot()
  return warriorSlot;
end

function Market.TestPas4(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Market.GetWarriorSlotCount()
  return table.Count(warriorSlot);
end

function Market.RemoveWarriorInSlot(index)
  table.remove(warriorSlot, index);
end

function Market.UploadWarriorToSlot(followIndex)
  local slotCount = table.Count(warriorSlot);
  table.insert(warriorSlot, slotCount + 1, followWarrior[followIndex])
end

function Market.CheckWarriorInSlot(npcId)
  for k, v in pairs(warriorSlot) do
    if v.npcId == npcId then return true end
  end
  
  return false;
end

function Market.TestPas5(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Market.TestPas6(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Market.GetAllFollowWarrior()
  table.Clear(followWarrior);
  for i = 1, Role.maxFollowNpc do
    local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, i);
    if followNpc ~= nil and not this.CheckWarriorHaveEquip(i) and not this.CheckWarriorEquipSoul(followNpc.npcId) and not this.CheckWarriorInSlot(followNpc.npcId) and followNpc ~= Role.fightNpc and this.GetNpcScrollCanTrade(followNpc.npcId) then
      table.insert(followWarrior, followNpc)
    end
  end
  
  return followWarrior;
end

function Market.CheckWarriorEquipSoul(npcId)
  local bag = Item.GetBag(EThings.EquippedSoul);
  for _, v in pairs(bag) do
    if v.equipId == npcId then
      return true;
    end
  end
  
  return false;
end

function Market.CheckWarriorHaveEquip(currentFollowIndex)
  local itemSave;
 for i = 1, Role.maxEquip do
   itemSave = Item.GetBagItem(EThings.Equip, i, currentFollowIndex)
   if itemSave ~= nil then
     return true;
   end
 end
  
  return false;
end

function Market.GetNpcScrollCanTrade(npcId) --透過NPCID找對應的畫像是否可上web拍賣
  for _, v in pairs(itemDatas) do
    if v~= nil and v.spare3 == npcId and v.kind == EItemKind.SpecialAbility and v.specialAbility == EItemUseKind.NpcPicture then
      return  bit.band(v.restrict2, 64) == 64;
    end
  end
end

function Market.GetFollowWarriorIndex(npcId)
  for i = 1, Role.maxFollowNpc do
    local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, i);
    if followNpc ~= nil and followNpc.npcId == npcId then
      return i;
    end
  end
end
--endregion

--Data
function Market.TestPas7(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Market.TestPas8(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Market.TestPas9(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Market.CheckSoulInWebSlot(Id, sn)
  local uploadSlot = Item.GetBag(EThings.WebUpload);
  for _, v in pairs(uploadSlot) do
    if v.Id == Id and v.sn == sn then
        return true;
    end
  end
  return false;
end

function Market.TestPas10(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Market.TestPas11(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Market.CheckInWebSlot(Id, bagIndex)
  local uploadSlot = Item.GetBag(EThings.WebUpload);
  if bagIndex ~= nil then
    local slotCount = table.Count(uploadSlot);
    for i = 1, slotCount do
      if uploadSlot[i].Id == Id and uploadSlot[i].bagIndex == bagIndex then
        return true;
      end
    end
    return false;
  else
    for _, v in pairs(uploadSlot) do
      if v.Id == Id then
        return true;
      end
    end
    return false;
  end
end

function Market.GetItemInWebSlotCount(Id, bagIndex)
  local uploadSlot = Item.GetBag(EThings.WebUpload);
  for _, v in pairs(uploadSlot) do
    if v.Id == Id and v.bagIndex == bagIndex then
      return v.quant;
    end
  end
  return nil;
end

--RoleCount
function Market.UpdateCanTradeCount()
  canTradeCount = RoleCount.Get(ERoleCount.MarketCanUpload);
  
  if UI.IsVisible(UIMarket) then
    UIMarket.UpdateUI();
  end
end

function Market.GetCanTradeCount()
  return canTradeCount;
end

function Market.GetTSGoldUploadLimit()
  local currentCount = RoleCount.Get(ERoleCount.MarketTsGoldLimit);
  local currentTSGold = Role.GetPlayerCurrency(ECurrency.TS);
  local canUploadGoldCount = tsGoldUploadLimit - currentCount;
  
  if canUploadGoldCount <= 0 then
    return 0;
  elseif currentTSGold <= canUploadGoldCount then
    return currentTSGold;
  else
    return tsGoldUploadLimit - currentCount;
  end
end

function Market.CheckTSGoldUploadReachLimit()
  local currentCount = RoleCount.Get(ERoleCount.MarketTsGoldLimit);
  local canUploadGoldCount = tsGoldUploadLimit - currentCount;
  
  if canUploadGoldCount <= 0 then
    return true;
  else
    return false;
  end
end

--protocal
function Market.UploadToWeb()
  --C:109-002<物品封存至Web> +NFT幣數量(4) +數量(1)<<+種類(1)+Data(?)>>
  --種類 1: NFT幣 +NFT幣(4) [上傳不使用]
  --種類 2: 背包物品 +背包索引(2) +數量(2)
  --種類 3: 靈魂 +靈魂SN(8)
  --種類 4: NPC +跟隨索引(1) +NPCID(2)
  
  local uploadSlot = Item.GetBag(EThings.WebUpload);
  local warriors = Market.GetWarriorSlot();
  local itemCount = table.Count(uploadSlot);
  local warriorCount = table.Count(warriors);
  local totalCount = itemCount + warriorCount;
  
  if totalCount == 0 and uploadGold == 0 then
    return;
  elseif totalCount == 0 and uploadGold ~= 0 then
    --貨幣
    sendBuffer:Clear();
    sendBuffer:WriteInt32(uploadGold);
    Network.Send(109, 2, sendBuffer);
    return;
  else
    --確認可上傳次數
    if totalCount > RoleCount.Get(ERoleCount.MarketCanUpload) then
    UIMarket.OpenWarning(string.Get(23899), string.GetColorText(string.Get(23884), Color.Red))
    return;
    end
    
    sendBuffer:Clear();
    sendBuffer:WriteInt32(uploadGold);
    sendBuffer:WriteByte(totalCount);
    --物品
    if itemCount ~= 0 then
      local itemData;
      for _, v in pairs(uploadSlot) do
        itemData = itemDatas[v.Id];
        if itemData ~= nil then
          if itemData.kind == EItemKind.Soul then
            sendBuffer:WriteByte(EWebMarketKind.Soul);
            sendBuffer:WriteInt64(v.sn);
          else
            sendBuffer:WriteByte(EWebMarketKind.BagItem);
            sendBuffer:WriteUInt16(v.bagIndex);
            sendBuffer:WriteUInt16(v.quant);
          end
        end
      end
    end
  
    --武將
    if warriorCount ~= 0 then
      for _, v in pairs(warriors) do
        if v ~= nil then
          sendBuffer:WriteByte(EWebMarketKind.Npc);
          sendBuffer:WriteByte(this.GetFollowWarriorIndex(v.npcId));
          sendBuffer:WriteUInt16(v.npcId);
        end
      end
    end
  
    Network.Send(109, 2, sendBuffer);
  end
end

function Market.TestPas12(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Market.RequireWebInfo()
  --C:109-001 <詢問拍賣資訊>
  sendBuffer:Clear();
  Network.Send(109, 1);
end

function Market.RequireUploadLimit()
  --C:109-000 <詢問可上傳格數>
  sendBuffer:Clear();
  Network.Send(109, 0);
end

function Market.UpdateWebSlotLimit(limit)
  if limit ~= nil then
    if not this.gotWebData then this.gotWebData = true end;
    if (limit - this.maxWebItemLimit) >= 0 then
      this.webItemLimit = 0;
    else
      this.webItemLimit = (this.maxWebItemLimit - limit);
    end
  elseif this.webItemLimit ~= 0 then
    if UI.IsVisible(UIMarket) and not this.gotWebData then
      this.gotWebData = true;
    end
  end
end

function Market.IsCallFromTutorial()
  return calledFromTutorial;
end

function Market.ChangeCallFromTutorial(change)
   calledFromTutorial = change;
end

function Market.TestPas13(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Market.TestPas14(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end