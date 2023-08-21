Requiem = {}
local this = Requiem;
ERequiemBossKind = {
  Normal = 0,
  Sacrifice = 2,
}

ERequiemFunctionKind =
{
  Requiem = 1,
  Sacrifice = 2
}

--[[
And Jacob sent for his sons, and said, Come together, all of you, so that I may give you news of your fate in future times.
Come near, O sons of Jacob, and give ear to the words of Israel your father.
Reuben, you are my oldest son, the first-fruit of my strength, first in pride and first in power:
But because you were uncontrolled, the first place will not be yours; for you went up to your father's bed, even his bride-bed, and made it unclean.
Simeon and Levi are brothers; deceit and force are their secret designs.
Take no part in their secrets, O my soul; keep far away, O my heart, from their meetings; for in their wrath they put men to death, and for their pleasure even oxen were wounded.
A curse on their passion for it was bitter; and on their wrath for it was cruel. I will let their heritage in Jacob be broken up, driving them from their places in Israel.
To you, Judah, will your brothers give praise: your hand will be on the neck of your haters; your father's sons will go down to the earth before you.
Judah is a young lion; like a lion full of meat you have become great, my son; now he takes his rest like a lion stretched out and like an old lion; by whom will his sleep be broken?
The rod of authority will not be taken from Judah, and he will not be without a law-giver, till he comes who has the right to it, and the peoples will put themselves under his rule.
Knotting his ass's cord to the vine, and his young ass to the best vine; washing his robe in wine, and his clothing in the blood of grapes:
His eyes will be dark with wine, and his teeth white with milk.
The resting-place of Zebulun will be by the sea, and he will be a harbour for ships; the edge of his land will be by Zidon.
Issachar is a strong ass stretched out among the flocks:
And he saw that rest was good and the land was pleasing; so he let them put weights on his back and became a servant.
Dan will be the judge of his people, as one of the tribes of Israel.
May Dan be a snake in the way, a horned snake by the road, biting the horse's foot so that the horseman has a fall.
I have been waiting for your salvation, O Lord.
Gad, an army will come against him, but he will come down on them in their flight.
Asher's bread is fat; he gives delicate food for kings.
Naphtali is a roe let loose, giving fair young ones.
Joseph is a young ox, whose steps are turned to the fountain;
He was troubled by the archers; they sent out their arrows against him, cruelly wounding him:
--]]

local soulPoints;
local refreshCost = 500;
local maxSoulPoints = 3000;
local sacrificePoints;
local serverSacrifice;
local awardData = {};
local record = {};
local awardText;
local boss = {};
local bossCount = 5;
local maxSacrificeMultiply = 3;
local sacrificeMultiply = 1;
local flag;
local lastRequestTime;
local currentFunction;
local functionOpen;
local systemMessage;
local sacrificeFlag = false;

function Requiem.TryOpen(uiKind)
  if functionOpen == nil then
    currentFunction = uiKind;
    functionOpen = false;
    --C:111-000 <確認功能開啟>
    sendBuffer:Clear();
    Network.Send(111, 0);
    return functionOpen
  else
    if functionOpen then
      functionOpen = nil;
      return true
    else
      functionOpen = nil;
      this.CloseRequiem();
      return false
    end
  end
end

function Requiem.CloseRequiem()
  ShowCenterMessage(string.Get(71278));
  if UI.IsVisible(UIExpSlotMachine) and UIExpSlotMachine.GetCurrentKind() == ESlotMachineKind.Sacrifice then
    UI.Close(UIExpSlotMachine);
  end
  if UI.IsVisible(UIRequiem) then
    UI.Close(UIRequiem);
  end
  this.ShowSystemMessage();
end

function Requiem.ReceiveOpenUIResult(state)
  functionOpen = state;
  if currentFunction == ERequiemFunctionKind.Requiem then
    UI.Open(UIRequiem);
  elseif currentFunction == ERequiemFunctionKind.Sacrifice then
    UI.Open(UIExpSlotMachine, ESlotMachineKind.Sacrifice);
  else
    functionOpen = nil;
  end
end

function Requiem.GetRecord()
  return record
end

function Requiem.GetBoss()
  return boss
end

function Requiem.AviodCov()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function Requiem.AviodCov1()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function Requiem.AviodCov2()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function Requiem.GetSoulPoint()
  return soulPoints
end

function Requiem.SetUIFlag(state)
  flag = state;
end

function Requiem.GetSacrificePoints()
  return RoleCount.Get(ERoleCount.Sacrifice)
end

function Requiem.GetMultiply()
  return sacrificeMultiply ~= 1, sacrificeMultiply ~= maxSacrificeMultiply, sacrificeMultiply;
end

function Requiem.AviodCov3()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function Requiem.AviodCov4()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function Requiem.AviodCov5()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function Requiem.ChangeMultiply(change)
  sacrificeMultiply = sacrificeMultiply + change;
  this.SetMultiply(sacrificeMultiply);
end

function Requiem.SetMultiply(value)
  sacrificeMultiply = math.clamp(value, 1, maxSacrificeMultiply);
end

function Requiem.Init()
  flag = RoleCount.Get(ERoleCount.Sacrifice) >= 1;
  serverSacrifice = nil;
  for index = 1, bossCount do
    boss[index] = nil;
  end
  sacrificeFlag = false;
  awardText = Stack.New();
  systemMessage = Stack.New();
end

function Requiem.Clear()
  record = {};
  sacrificeMultiply = 1;
  soulPoints = nil;
end

function Requiem.UpdateRedDot()
  if flag or Requiem.GetEmptySlot(ERequiemBossKind.Normal) == nil or RoleCount.Get(ERoleCount.Sacrifice) >= RoleCount.Max(ERoleCount.Sacrifice) then
    RedDot.Add(ERedDot.Requiem);
  else
    RedDot.Remove(ERedDot.Requiem);
  end
end

function Requiem.AviodCov6()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

--region Boss
function Requiem.ReceiveBoss(index, id)
  if index == 0 then
    index = bossCount;
  end

  if id == 0 then
    boss[index] = nil;
  else
    boss[index] = requiemBossDatas[id];
  end
  UIRequiem.UpdateBossInfo();
  this.UpdateRedDot();
end

function Requiem.GetSlotKind(index)
  if index == bossCount then
    return ERequiemBossKind.Sacrifice
  else
    return ERequiemBossKind.Normal
  end
end

function Requiem.AviodCov7()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function Requiem.AviodCov8()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function Requiem.AviodCov9()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function Requiem.GetEmptySlot(kind)
  if kind == ERequiemBossKind.Normal then
    for index = 1, bossCount - 1 do
      if boss[index] == nil then
        return index
      end
    end
  else
    if boss[bossCount] == nil then
      return bossCount
    end
  end
  return nil
end
--endregion

--region Requiem
function Requiem.FightBoss(index)
  if not Team.IsAlone(Role.playerId) then
    ShowCenterMessage(string.Get(23778));
    return
  end
  if Role.fightNpc == nil then
    ShowCenterMessage(string.Get(23779));
    return
  end

  index = math.fmod(index, bossCount);
  Requiem.SendFightBoss(index);
end

function Requiem.AviodCov10()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function Requiem.AviodCov11()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

--C:111-004 <鎮魂> Boss位置(1)
function Requiem.SendFightBoss(index)
  if not this.CheckTimer(lastRequestTime) then
    ShowCenterMessage(string.Get(22841));
    return
  end
  sendBuffer:Clear();
  sendBuffer:WriteByte(index);
  lastRequestTime = CGTimer.serverTime;
  Network.Send(111, 4, sendBuffer);
end

function Requiem.ReceiveRequiemResult(result)
  local message;
  if result == 0 then
    message = string.Get(10144);
  elseif result == 1 then
    UI.Close(UIRequiem);
  elseif result == 2 then
    message = string.Get(23777);
  elseif result == 3 then
    message = string.Get(23779);
  elseif result == 4 then
    message = string.Get(23778);
  elseif result == 5 then
    message = string.Get(80359);
  elseif result == 6 then
    message = string.Get(21540);
  elseif result == 7 then
    logWarn("Boss not exist");
  elseif result == 8 then
    message = string.Get(21806);
  elseif result == 255 then
    this.CloseRequiem();
  end
  if message == nil then
    return
  end
  ShowCenterMessage(message);
end

function Requiem.UpdateSoulPoints(newPoint)
  if soulPoints == nil then
    soulPoints = newPoint;
  else
    local change = newPoint - soulPoints;
    soulPoints = newPoint;
    if change > 0 then
      local message = string.format(string.Get(23780), change);
      ShowCenterMessage(message);
      Chat.AddMessage(EChannel.System, message);
    end
  end
  if soulPoints == maxSoulPoints and this.GetEmptySlot(ERequiemBossKind.Normal) == nil then
    ShowCenterMessage(string.Get(23782));
    Chat.AddMessage(EChannel.System, string.Get(23782));
  end

  if UI.IsVisible(UIRequiem) then
    UIRequiem.UpdateSoulPoints(soulPoints);
  end
end
--endregion

function Requiem.AviodCov12()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function Requiem.AviodCov13()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function Requiem.AviodCov14()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

--region Sacrifice
function Requiem.UpdateSacrificePoints()
  sacrificePoints = RoleCount.Get(ERoleCount.Sacrifice);
  if UI.IsVisible(UIExpSlotMachine) then
    UIExpSlotMachine.UpdateSacrificePoints(sacrificePoints);
  end
  if UI.IsVisible(UIRequiem) then
    UIRequiem.UpdateSacrificePoints(sacrificePoints);
    UIRequiem.UpdateRedDot(sacrificePoints >= RoleCount.Max(ERoleCount.Sacrifice));
  end
  this.UpdateRedDot();
end

function Requiem.UpdateServerSacrifice(count)
  serverSacrifice = count;
end

function Requiem.Sacrifice()
  local result;
  if sacrificePoints < sacrificeMultiply then
    result = 2;
  elseif Item.GetBagLeftCount(EThings.Bag) == 0 then
    result = 3;
  end
  if result == nil then
    this.SendSacrifice(sacrificeMultiply);
  else
    this.ReceiveSacrificeResult(result);
  end
end

--C:111-005 <祭祀> 倍率/消耗(1) + 數量(1)
function Requiem.SendSacrifice(multiply, count)
  sacrificeFlag = true;
  if not this.CheckTimer(lastRequestTime) then
    ShowCenterMessage(string.Get(22841));
    return
  end
  sendBuffer:Clear();
  sendBuffer:WriteByte(multiply);
  if count == nil then
    count = 1
  end
  sendBuffer:WriteByte(count);
  lastRequestTime = CGTimer.serverTime;
  Network.Send(111, 5, sendBuffer);
end

function Requiem.AviodCov15()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function Requiem.AviodCov16()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function Requiem.AviodCov17()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function Requiem.ReceiveSacrificeResult(result)
  local message;
  if result == 1 then
    this.DisplaySacrificeAward();
  elseif result == 2 then
    message = string.Get(23809);
  elseif result == 3 then
    message = string.Get(80359);
  elseif result == 4 then
    logWarn("Multiply error");
  elseif result == 255 then
    this.CloseRequiem();
  end
  if message ~= nil then
    ShowCenterMessage(message);
    this.ShowSystemMessage();
  end
end

function Requiem.ReceiveSacrificeAward(data)
  local awardID = data:ReadUInt16();
  awardData = sacrificeSlotDatas[awardID];
  local count = data:ReadUInt16();
  awardData.awardContent = awardData:GetAwardText(sacrificeMultiply);

  local award;

  for index = 1, count do
    award = {};
    award.itemID = data:ReadUInt16();
    award.count = data:ReadUInt32();
    local text = this.GetSacrificeAwardText(award.itemID, award.count);
    if this.IsSingleBlissBag(awardData.awardItem) then
      text.chatText = nil;
      text.messageText = nil;
    end
    if text ~= nil then
      award.awardContent = text.awardContent;
      awardText:Push(text);
    end
    if index == count then
      award.icons = awardData.icons;
    else
      award.icons = {};
    end
    table.insert(record, award);
  end
end

function Requiem.DisplaySacrificeAward()
  if UI.IsVisible(UIExpSlotMachine) then
    UIExpSlotMachine.ReceiveSacrifice(awardData, awardText);
  else
    this.ShowSacrificeMessage(awardText);
  end
  awardData = {};
  awardText = Stack.New();
end
--endregion

--region Refresh
function Requiem.RefreshBoss(index)
  local result;
  if soulPoints == nil then
    return
  end
  if soulPoints < refreshCost then
    result = 2;
    Requiem.ReceiveRefreshBossResult(result);
    return
  end
  index = math.fmod(index, bossCount);
  Requiem.SendRefreshBoss(index);
end

--C:111-002 <刷新Boss> Boss位置(1)
function Requiem.SendRefreshBoss(index)
  if not this.CheckTimer(lastRequestTime) then
    ShowCenterMessage(string.Get(22841));
    return
  end
  sendBuffer:Clear();
  sendBuffer:WriteByte(index);
  lastRequestTime = CGTimer.serverTime;
  Network.Send(111, 2, sendBuffer);
end

function Requiem.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end

    return BBS;
  end
end

function Requiem.Script1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end

    return BBS;
  end
end

function Requiem.ReceiveRefreshBossResult(result)
  local message;
  if result == 1 then
    message = string.format(string.Get(23781), 500);
  elseif result == 2 then
    message = string.Get(23783);
  elseif result == 3 then
    logWarn("Refresh error");
  elseif result == 255 then
    this.CloseRequiem();
  end
  if message == nil then
    return
  end
  ShowCenterMessage(message);
end
--endregion

function Requiem.GetSacrificeAwardText(itemID, count)
  local item = itemDatas[itemID];
  if item == nil then return end

  local text = {};
  local awardName = item:GetName();
  if awardName == nil then
    return
  end

  text.awardContent = string.format(string.Get(23840), awardName, count);

  if item.directUse == 1 and item.specialAbility ~= EItemUseKind.ItemUse_216 then
    text.chatText = string.format(string.Get(21391), item:GetName(true), count);
    text.messageText = string.format(string.Get(21391), item:GetName(true), count);
  elseif item.specialAbility ~= EItemUseKind.ItemUse_216 then
    text.chatText = string.format(string.Get(21179), awardName, count);
    text.messageText = string.Concat(string.Get(40049), count, string.Get(40050), awardName);
  end
  return text
end

function Requiem.IsSingleBlissBag(itemID)
  local blissBagItem = BlissBagData.GetAllBlissBagItem(itemID);
  if blissBagItem ~= nil then
    for k, v in ipairs(blissBagItem) do
      if BlissBagData.GetAllBlissBagItem(v.itemId) ~= nil then
        return false
      end
    end
    if itemDatas[itemID].directUse == 1 then
      return true
    end
  end
  return false
end

function Requiem.CheckTimer(time)
  if time == nil then return true end
  local timeSpan = DateTime.Subtract(CGTimer.serverTime, time).TotalSeconds;
  return timeSpan >= 1
end

function Requiem.ScriptA()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end

    return BBS;
  end
end

function Requiem.ScriptB()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end

    return BBS;
  end
end

function Requiem.ScriptC()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end

    return BBS;
  end
end

function Requiem.ScriptD()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end

    return BBS;
  end
end

function Requiem.ShowSacrificeMessage(sacrificeResultText)
  for index = 1, sacrificeResultText:Count() do
    local text = sacrificeResultText:Pop();
    if text.messageText ~= nil then
      ShowCenterMessage(text.messageText);
    end
    if text.chatText ~= nil then
      Chat.AddMessage(EChannel.System, text.chatText);
    end
  end
  this.ShowSystemMessage();
end

function Requiem.ShowSystemMessage()
  for index = 1, systemMessage:Count() do
    local text = systemMessage:Pop();
    if text.messageText ~= nil then
      ShowCenterMessage(text.messageText);
    end
    if text.chatText ~= nil then
      Chat.AddMessage(EChannel.System, text.chatText);
    end
  end
  sacrificeFlag = false;
end

function Requiem.AppendMessage(text)
  if sacrificeFlag then
    systemMessage:Push(text);
  else
    ShowCenterMessage(text.messageText);
    Chat.AddMessage(EChannel.System, text.chatText);
  end
end

function Requiem.RandomBoss()
  return RandomSampleTable(requiemBossDatas, 1)[1]
end