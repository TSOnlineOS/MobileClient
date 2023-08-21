MonopolyRewardData = {}
local this = MonopolyRewardData;
MonopolyRewardData.__index = MonopolyRewardData;

local cellCount = 0;
local roundCount = 0;
local roundRefreshIndex = {};
local rewardIDDigitSplitIndex = 2;

function MonopolyRewardData.New(reader)
  local self = {};
  setmetatable(self, MonopolyRewardData);
  self.rewardID = reader:ReadUInt16(); --格子ID
  self.round = this.GetRewardIDRound(self.rewardID); --圈數
  self.cellID = this.GetRewardIDCell(self.rewardID);
  self.rewardItem = reader:ReadUInt16(); --獎勵道具
  self.rewardItemCount = reader:ReadUInt16(); --獎勵數量
  self.cellImageType = reader:ReadByte();
  MonopolyRewardData.UpdateCount(self);
  return self.round, self.cellID, self;
end

function MonopolyRewardData.Demo()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function MonopolyRewardData.UpdateCount(data)
  cellCount = math.max(cellCount, data.cellID);
  roundCount = math.max(roundCount, data.round);
end

function MonopolyRewardData.DemoA()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function MonopolyRewardData.CalculateRoundRefreshIndex()
  for index = 0, roundCount do
    if monopolyCellRewardDatas[index] == nil then
      roundRefreshIndex[index] = roundRefreshIndex[index - 1];
    else
      roundRefreshIndex[index] = index;
    end
  end
end

function MonopolyRewardData.GetRewardIDRound(rewardID)
  local roundResult = math.floor(rewardID / math.pow(10, rewardIDDigitSplitIndex));
  return roundResult
end

function MonopolyRewardData.DemoB()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function MonopolyRewardData.DemoC()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function MonopolyRewardData.DemoD()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function MonopolyRewardData.DemoE()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function MonopolyRewardData.GetRewardIDCell(rewardID)
  local cellResult = rewardID % math.pow(10, rewardIDDigitSplitIndex);
  return cellResult
end

function MonopolyRewardData.DemoF()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function MonopolyRewardData.DemoG()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function MonopolyRewardData.GetCellCount()
  return cellCount;
end

function MonopolyRewardData.DemoH()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function MonopolyRewardData.GetRoundCount()
  return roundCount;
end

function MonopolyRewardData.GetRefreshIndex(round)
  return roundRefreshIndex[round];
end

function MonopolyRewardData.DemoI()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function MonopolyRewardData.DemoJ()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function MonopolyRewardData.DemoK()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end