CardSaveData = {};
CardSaveData._index = CardSaveData;

function CardSaveData.New(id, level)
  local self = {};
  self.id = id;
  self.level = level;
  return self;
end


CollectCard = {}
CollectCard._index = CollectCard;

local this = CollectCard;

local cardSave = {}; --等級資料

local equipCards = {}; --裝備中資料 {id, id ,id}

local maxEquipCard = 1; --可裝備數

local attributes = {};

local getFlagId = {};

local getNFTFlagId = {};

function CollectCard.AddCollectCardSortRedDot(flagId)
  getFlagId[flagId] = true;
  RedDot.Add(ERedDot.CollectCardSort);
end

function CollectCard.GetSortRedDotCount()
  return table.Count(getFlagId);
end

function CollectCard.GetNFTRedDotCount()
  return table.Count(getNFTFlagId);
end

function CollectCard.CheckSortRedDot(getflag)
  return getFlagId[getflag] ~= nil;
end

function CollectCard.DeleteSortRedDot(getFlag)
  if getFlagId[getFlag] ~= nil then   
    getFlagId[getFlag] = nil;
    return true;
  end
  return false;
end

function CollectCard.DeleteNFTRedDot(getFlag)
  if getNFTFlagId[getFlag] ~= nil then
    getNFTFlagId[getFlag] = nil;
  end
end

function CollectCard.Clear()
  table.Clear(cardSave);
  table.Clear(equipCards);
  table.Clear(attributes);
  table.Clear(getFlagId);
  table.Clear(getNFTFlagId);
  maxEquipCard = 1;
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
end

function CollectCard.GetCount(id)
  if collectCardSortDatas[id] ~= nil then 
    return RoleCount.Get(collectCardSortDatas[id].roleCount );
  else
    return 0;
  end
end

function CollectCard.GetLv(id)
  if cardSave[id] == nil then 
    return 0
  else
    return cardSave[id].level;
  end
end

function CollectCard.CheckCanLevelUp(id)
  local lvUpNeed = this.GetLevelUpNeed(id);
  if lvUpNeed == 0 then 
    return false;
  end

  local data = collectCardDatas[id];
  for i = 1, 9 do 
    if collectCardSortDatas[data.card[i]] ~= nil then 
      local itemCount = RoleCount.Get(collectCardSortDatas[data.card[i]].roleCount);
      if itemCount < lvUpNeed then 
        return false;
      end
    end
  end
  return true;
end

function CollectCard.GetLevelUpNeed(id)
  local lv = this.GetLv(id);
  local data = collectCardDatas[id];
  local result = 0;
  if data == nil then 
    return 0;
  end
  if lv >= data.maxLevel then 
    return 0;
  end

  result = (lv + data.levelUpParamter[1]) * data.levelUpParamter[2];

  if result <= 0 then
    result = 1;
  end

  return result;
end

function CollectCard.GetPowerValue(id)
  local lv = this.GetLv(id);
  local data = collectCardDatas[id];
  if lv == 0 then 
    --return nil;
    lv = 1;
  end
  local result = {};
  for i = 1, 6 do 
    result[i] = {};
    result[i].kind = data.values[i].kind;
    result[i].value = data.values[i].value + data.values[i].grow * (lv - 1);  
    result[i].plusValue = data.values[i].grow;
  end  
  return result;
end

function CollectCard.IsEquiped(id)
  for k, v in pairs(equipCards)do 
    if v == id then 
      return true;
    end
  end
  return false;
end

function CollectCard.GetEquipedCount()
  local count = 0;
  for k, v in pairs(equipCards)do
    if v ~= 0 then 
      count = count + 1;
    end
  end
  return count;
end

function CollectCard.IsMaxLv(id)
  if collectCardDatas[id] == nil then 
    return;
  end
  return this.GetLv(id) >= collectCardDatas[id].maxLevel;
end

function CollectCard.GetMaxEquipCard()
  return RoleCount.Get(127);
end

function CollectCard.CanEquipCard()
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  return this.GetEquipedCount() < RoleCount.Get(127);
end

function CollectCard.GetOwnDatas()
  local result = {};
  for k,v in pairs(cardSave) do
    table.insert(result, collectCardDatas[v.id]);
  end
  return result;
end

function CollectCard.GetAttribute(kind)
  if attributes[kind] == nil then 
    return 0;
  else
    return attributes[kind];
  end
end

function CollectCard.UpdateAttributes()
  table.Clear(attributes);
  for k, v in pairs(equipCards)do
    if v ~= 0 then 
      local result = this.GetPowerValue(v);
      for k2, v2 in pairs(result)do
        if attributes[v2.kind] == nil then 
          attributes[v2.kind] = 0;
        end
        attributes[v2.kind] = attributes[v2.kind] + v2.value;
      end
    end
  end
  if Role.player ~= nil then
    Role.player:SetAttribute(EAttribute.MaxHp, Calc.GetMaxHp(Role.player));
    Role.player:SetAttribute(EAttribute.MaxSp, Calc.GetMaxSp(Role.player));
  end

  local npcs = Role.GetFollowNpcs(Role.playerId);
  for k,v in pairs(npcs)do   
    v:SetAttribute(EAttribute.MaxHp, Calc.GetMaxHp(v));
    v:SetAttribute(EAttribute.MaxSp, Calc.GetMaxSp(v));
  end
end

function CollectCard.SendUpgrade(id)
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end

  sendBuffer:Clear();
  sendBuffer:WriteByte(id);      
  Network.Send(95, 6, sendBuffer);    
end

function CollectCard.EquipCard(id)
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end

  sendBuffer:Clear();
  sendBuffer:WriteByte(id);      
  if this.IsEquiped(id) then 
    --卸下
    Network.Send(95, 8, sendBuffer);    
  else
    --裝備
    Network.Send(95, 7, sendBuffer);    
  end
end

function CollectCard.ReciveEquipCard(data)
  table.Clear(equipCards);
  maxEquipCard = data:ReadByte();
  local count = data:ReadByte();
  for i = 1, maxEquipCard do 
    if count >= i then      
      equipCards[i] = data:ReadByte();
    else
      equipCards[i] = 0;
    end
  end
  this.UpdateAttributes();
  if UI.IsVisible(UICollectBook)then 
    UICollectBook.UpdateInfo();
  end
end

function CollectCard.ReciveCardData(data)
  local count = data:ReadByte();
  for i = 1, count do 
    local saveData = CardSaveData.New(data:ReadByte(), data:ReadByte());
    cardSave[saveData.id] = saveData;    
  end
  this.UpdateAttributes();
  if UI.IsVisible(UICollectBook)then 
    UICollectBook.UpdateInfo();
  end
  UICollectBook.CheckCardRedDot();
end

function CollectCard.OnReciveLvUp(data)
  local id = data:ReadByte();
  local lv = data:ReadByte();
  
  if lv == 1 then 
    ShowCenterMessage(string.format(string.Get(21492), string.Get(collectCardDatas[id].name)));
  elseif lv > 1 then 
    ShowCenterMessage(string.format(string.Get(21495), string.Get(collectCardDatas[id].name), lv));
  end
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
end