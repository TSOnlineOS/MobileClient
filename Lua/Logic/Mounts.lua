Mounts = {}
local this = Mounts;

local levelUpItemId = 0;
local atkUpItemId = 0;
local intUpItemId = 0;
local defUpItemId = 0;
local hpUpItemId = 0;
local spUpItemId = 0;

this.level = 1;

local attributePoints = {};
local attributeLvs = {};
for i = 1, 6 do
  attributePoints[i] = 0;
  attributeLvs[i] = 0;
end

local attributes = {};

this.currentNpcId = 0;

this.collectionCount = 0;
this.collectionBonus = 1;

local getNFTFlagId = {};

function Mounts.AviodCov()
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

function Mounts.AviodCov1()
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

function Mounts.AddNFTMountRedDot(flagId)
  getNFTFlagId[flagId] = true;
  RedDot.Add(ERedDot.NFTCollectMount);
end

function Mounts.GetNFTMountRedDotCount()
  return table.Count(getNFTFlagId);
end

function Mounts.DeleteNFTMountRedDot(getFlag)
  if getNFTFlagId[getFlag] ~= nil then
    getNFTFlagId[getFlag] = nil;
  end
end

function Mounts.Clear()
  this.level = 1;

  for i = 1, 6 do
    attributePoints[i] = 0;
    attributeLvs[i] = 0;
  end

  table.Clear(attributes);
  table.Clear(getNFTFlagId);

  this.currentNpcId = 0;

  this.collectionCount = 0;
  this.collectionBonus = 1;
end

function Mounts.AviodCov2()
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

function Mounts.AviodCov3()
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

--Set
function Mounts.SetData(data)
  --S:079-001 <座騎資料> +等級(1) +點數(2)*6 +數量(1) <<+物品資料(16)>> +NPCID(2)
  this.level = data:ReadByte();

  for i = 1, 6 do
    this.SetAttributePoint(i, data:ReadUInt16(), false);
  end

  local count = data:ReadByte();  
  for i = 1, count do
    local itemSave = ThingData.New(data);

    Item.SetBagItem(EThings.Mounts, itemDatas[itemSave.Id].fitType, itemSave, false);
  end

  this.currentNpcId = data:ReadUInt16();

  this.OnGetItem();
end

function Mounts.SetLevel(level)
  this.level = level;

  ShowCenterMessage(string.Get(20187));

  if UI.IsVisible(UIMounts) then
    UIMounts.UpdateUI();
  end

  if Role.player ~= nil then
    Role.player:UpdateSpeed();
  end
end

function Mounts.AviodCov4()
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

function Mounts.AviodCov5()
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

function Mounts.AviodCov6()
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

function Mounts.SetAttributePoint(kind, value, updateOther)
  local addValue = value - attributePoints[kind];
  local oriLevel = attributeLvs[kind];
  local nowLevel = this.GetAttributeProgress(kind, value);

  attributePoints[kind] = value;
  attributeLvs[kind] = nowLevel;

  local attributeValue = 0;
  if mountsGrowDatas[nowLevel] ~= nil then
    attributeValue = mountsGrowDatas[nowLevel].attributes[kind].addValue;
  end

  if kind == 1 then
    this.SetAttribute(EAttribute.Atk, attributeValue);
  elseif kind == 2 then
    this.SetAttribute(EAttribute.Int, attributeValue);
  elseif kind == 3 then
    this.SetAttribute(EAttribute.Def, attributeValue);
  elseif kind == 4 then
    this.SetAttribute(EAttribute.ExtraHp, attributeValue);
  elseif kind == 5 then
    this.SetAttribute(EAttribute.ExtraSp, attributeValue);
  end

  if updateOther == false then return end

  if UI.IsVisible(UIMounts) then
    UIMounts.OnAttributeAdd(kind, addValue, attributeLvs[kind] - oriLevel);
  end
end

function Mounts.GetAttributePoint(kind)
  if attributePoints[kind] ~= nil then
    return attributePoints[kind];
  else
    return 0;
  end
end

function Mounts.SetCurrent(npcId)
  if this.currentNpcId == npcId then return end

  if this.currentNpcId ~= 0 then
    ShowCenterMessage(string.Get(20189));
  end

  this.currentNpcId = npcId;
  
  if UI.IsVisible(UIMounts) then
    UIMounts.UpdateUI();
  end

  Function.UpdateVisible();
end

function Mounts.AviodCov7()
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

function Mounts.AviodCov8()
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

function Mounts.AviodCov9()
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

function Mounts.UpdateCollection()
  this.collectionCount = 0;
  this.collectionBonus = 1;

  for npcId in pairs(mountsDatas) do
    if this.HaveCollection(npcId) then
      this.collectionCount = this.collectionCount + 1;
    end
  end

  this.collectionBonus = 1 + (0.01 * this.collectionCount);

  if Role.player ~= nil then
    Role.player:SetAttribute(EAttribute.MaxHp, Calc.GetMaxHp(Role.player));
    Role.player:SetAttribute(EAttribute.MaxSp, Calc.GetMaxSp(Role.player));
  end

  if UI.IsVisible(UIMounts) then
    UIMounts.UpdateUI();
  end
end

--Get
function Mounts.GetSpeed(level)
  if mountsGrowDatas[level] ~= nil then
    return mountsGrowDatas[level].speed;
  else
    return 0;
  end
end

function Mounts.GetAttributeProgress(kind, point)
  local needPoint = 0;
  local level = 0;

  for k, v in pairs(mountsGrowDatas) do
    if v.attributes[kind] == nil then
      break;
    end

    needPoint = v.attributes[kind].upItemCount;
    
    if point < needPoint then
      break;
    end
    
    level = k;
    point = point - needPoint;
  end
  
  return level, point, needPoint;
end

function Mounts.AviodCov11()
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

function Mounts.AviodCov12()
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

function Mounts.AviodCov13()
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

function Mounts.SetAttribute(kind, value, arg)
  attributes[kind] = value;

  if Role.player ~= nil then
    if Contains(kind, EAttribute.Hpx, EAttribute.ExtraHp, EAttribute.EquipMaxHp, EAttribute.EquipHpx) then
      Role.player:SetAttribute(EAttribute.MaxHp, Calc.GetMaxHp(Role.player));
    elseif Contains(kind, EAttribute.Spx, EAttribute.ExtraSp, EAttribute.EquipMaxSp, EAttribute.EquipSpx) then
      Role.player:SetAttribute(EAttribute.MaxSp, Calc.GetMaxSp(Role.player));
    end
  end
end

function Mounts.GetAttribute(kind)
  if attributes[kind] ~= nil then
    return attributes[kind];
  else
    return 0;
  end
end

function Mounts.HaveCollection(npcId)
  if mountsDatas[npcId] ~= nil then
    return BitFlag.Get(mountsDatas[npcId].flagId);
  else
    return false;
  end
end

function Mounts.OnMoneyChange()
  if mountsGrowDatas[this.level] ~= nil then
    if mountsGrowDatas[this.level].upItemId > 0 and mountsGrowDatas[this.level].upItemCount > 0 then
      if Item.GetItemCount(mountsGrowDatas[this.level].upItemId) >= mountsGrowDatas[this.level].upItemCount and Role.GetPlayerGold() >= mountsGrowDatas[this.level].upMoney then
        RedDot.Add(ERedDot.MountLevel);
      else
        RedDot.Remove(ERedDot.MountLevel);
      end
    end
  end

  if UI.IsVisible(UIMounts) then
    UIMounts.UpdateUI();
  end
end

function Mounts.AviodCov14()
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

function Mounts.AviodCov15()
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

function Mounts.OnGetItem(itemId)
  if mountsGrowDatas[this.level] ~= nil then
    if mountsGrowDatas[this.level].upItemId > 0 and mountsGrowDatas[this.level].upItemCount > 0 then
      if itemId == nil or itemId == mountsGrowDatas[this.level].upItemId then
        if Item.GetItemCount(mountsGrowDatas[this.level].upItemId) >= mountsGrowDatas[this.level].upItemCount and Role.GetPlayerGold() >= mountsGrowDatas[this.level].upMoney then
          RedDot.Add(ERedDot.MountLevel);
        end
      end
    end
  end

  for i = 1, 5 do
    local attributeLv, value, maxValue = this.GetAttributeProgress(i, attributePoints[i]);

    if attributeLv < this.level then
      if mountsGrowDatas[attributeLv + 1] ~= nil then
        if (itemId ~= nil and itemId == mountsGrowDatas[attributeLv + 1].attributes[i].upItemId) or
          (itemId == nil and Item.GetItemCount(mountsGrowDatas[attributeLv + 1].attributes[i].upItemId) > 0) then
          RedDot.Add(ERedDot.MountAttribute);
          break;
        end
      end
    end
  end

  if UI.IsVisible(UIMounts) then
    UIMounts.UpdateUI();
  end
end

function Mounts.OnLostItem(itemId)
  local haveItem = false;
  local growData = mountsGrowDatas[this.level];
  local count = 0;
  local bag = Item.GetBag(EThings.Bag);

  if growData ~= nil then
    if growData.upItemId > 0 and growData.upItemCount > 0 then
      if itemId == nil or itemId == growData.upItemId then
        if Role.GetPlayerGold() >= growData.upMoney then
          if bag ~= nil then
            for k, v in pairs(bag) do
              if v ~= nil and v.Id == growData.upItemId and v.quant > 0 then
                count = count + v.quant;
              end
            end
          end

          if count >= growData.upItemCount then
            haveItem = true;
          end
        end
      end
    end
  end

  if not haveItem then
    RedDot.Remove(ERedDot.MountLevel);
  end
  
  haveItem = false;
  for i = 1, 5 do
    if growData ~= nil then
      count = 0;
      local attributeLv, value, maxValue = this.GetAttributeProgress(i, attributePoints[i]);
      growData = mountsGrowDatas[attributeLv + 1];
      
      if growData ~= nil then
        if bag ~= nil then
          for k, v in pairs(bag) do
            if v ~= nil and v.Id == growData.attributes[i].upItemId and v.quant > 0 then
              count = count + v.quant;
            end
          end
        end
        
        if count >= growData.attributes[i].upItemCount then
          haveItem = true;
          break;
        end
      end
    end
  end

  if not haveItem then
    RedDot.Remove(ERedDot.MountAttribute);
  end

  if UI.IsVisible(UIMounts) then
    UIMounts.UpdateUI();
  end
end

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


function Mounts.OnGetCollection(flagId)
  this.UpdateCollection();

  RedDot.Add(ERedDot.MountCollect);

  if UI.IsVisible(UIMounts) then
    UIMounts.UpdateUI();
  end

  ShowCenterMessage(string.format(string.Get(10398), this.GetMountsName(flagId)));  
end

function Mounts.GetMountsName(flagId)
  for k, v in pairs(mountsDatas) do
    if v.flagId == flagId then
      if npcDatas[v.npcId] ~= nil then
        return npcDatas[v.npcId].name;
      end
    end
  end

  return "";
end

function Mounts.Demo()
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

--Function
function Mounts.LevelUp()
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end

  local mountsLv = Mounts.level;

  if mountsGrowDatas[mountsLv] == nil then return end

  if mountsGrowDatas[mountsLv + 1] == nil then
    ShowCenterMessage(string.Get(20582));
    return;
  end

  if itemDatas[mountsGrowDatas[mountsLv].upItemId] ~= nil then
    if Item.GetItemCount(mountsGrowDatas[mountsLv].upItemId) < mountsGrowDatas[mountsLv].upItemCount then
      ShowCenterMessage(string.Concat(itemDatas[mountsGrowDatas[mountsLv].upItemId]:GetName(true), string.Get(20075)));
      return;
    end
  end

  if Role.GetPlayerGold() < mountsGrowDatas[mountsLv].upMoney then
    ShowCenterMessage(string.Get(40077));
    return;
  end

  --C:079-003 <座騎升級> +背包索引(2)
  sendBuffer:Clear();
  sendBuffer:WriteUInt16(Item.GetItemIndex(mountsGrowDatas[mountsLv].upItemId));
  Network.Send(79, 3, sendBuffer);
end

function Mounts.Demo1()
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

function Mounts.Demo2()
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

function Mounts.AttributeUp(kind, showMessage, justCheck)
  justCheck = justCheck or false;

  local mountsLv = this.level;
  local attributeLv = attributeLvs[kind];
  
  if mountsGrowDatas[attributeLv + 1] == nil then
    if showMessage then
      ShowCenterMessage(string.Get(20582));
    end

    return false;
  end

  if attributeLv >= mountsLv then
    if showMessage then
      ShowCenterMessage(string.Get(20494));
    end

    return false;
  end

  local itemIndex = Item.GetItemIndex(mountsGrowDatas[attributeLv + 1].attributes[kind].upItemId);
  if itemIndex == 0 then
    if showMessage then
      ShowCenterMessage(string.Concat(itemDatas[mountsGrowDatas[attributeLv + 1].attributes[kind].upItemId]:GetName(true), string.Get(20075)));
    end

    return false;
  end
  
  if not justCheck then
    --C:079-004 <座騎投點> +種類(1) +背包索引(2)
    sendBuffer:Clear();
    sendBuffer:WriteByte(kind);
    sendBuffer:WriteUInt16(itemIndex);
    Network.Send(79, 4, sendBuffer);
  end

  return true;
end

function Mounts.Mount()
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end

  --[[
  if Role.player.npcId ~= 0 then
    ShowCenterMessage(string.Get(50079));
    return;
  end
  --]]
  
  --C:079-001 <上座騎>
  Network.Send(79, 1);
end

function Mounts.Demo3()
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

function Mounts.Demo4()
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

function Mounts.Dismount()
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end
  
  --C:079-002 <下座騎>
  Network.Send(79, 2);
end

function Mounts.Demo5()
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

function Mounts.Demo6()
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