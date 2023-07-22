CharmRewardData = {}
CharmRewardData.__index = CharmRewardData

function CharmRewardData.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function CharmRewardData.Script1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function CharmRewardData.Script2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function CharmRewardData.New(reader)
  local self = {};
  setmetatable(self, CharmRewardData);

  self.kind = reader:ReadByte();
  self.level = reader:ReadUInt16();
  self.exp = reader:ReadUInt32();
  self.itemId = reader:ReadUInt16();
  self.quant = reader:ReadUInt16();
  self.completeFlag = reader:ReadUInt16();

  return self;
end

function CharmRewardData:CheckGetFlag()
  return BitFlag.Get(self.completeFlag);
end

function CharmRewardData:GetExp()
  return self.exp;
end

function CharmRewardData.Script3()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function CharmRewardData.Script4()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function CharmRewardData.Script5()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function CharmRewardData.Script6()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function CharmRewardData:CheckRewardCanGetByScore(score)
  if not self:CheckGetFlag() then
    if self.exp <= score then
      return true;
    else
      return false;
    end
  else
    return false;
  end
end

function CharmRewardData.Script7()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function CharmRewardData.Script8()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end