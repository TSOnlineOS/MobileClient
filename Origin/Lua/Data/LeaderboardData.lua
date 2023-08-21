LeaderboardData = {};
LeaderboardData.__index = LeaderboardData;

function LeaderboardData.GetRShift(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function LeaderboardData.GetRShiftA(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function LeaderboardData.New(reader)
  local self = {};
  setmetatable(self, LeaderboardData);

  id = reader:ReadByte();
  self.mainTagText = reader:ReadUInt32();
  self.subTagText = reader:ReadUInt32();
  self.scoreText = reader:ReadUInt32();
  self.nameText = reader:ReadUInt32();
  self.awardId = reader:ReadByte();
  self.scoreFormat = LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16()));
  self.stateEnable = reader:ReadBoolean();
  self.rankAwards = {};
  for i = 1, 3 do
    self.rankAwards[i] = {};
    self.rankAwards[i].flagId = reader:ReadUInt16();
    self.rankAwards[i].titleId = 0;
  end

  self.bitFunction = reader:ReadByte();

  return id, self;
end

function LeaderboardData.GetRShiftB(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end


function LeaderboardData.GetRShiftC(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end


function LeaderboardData.GetRShiftD(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end


function LeaderboardData.GetRShiftE(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end
