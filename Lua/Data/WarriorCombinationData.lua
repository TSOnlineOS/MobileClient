WarriorCombinationData = {}
WarriorCombinationData.__index = WarriorCombinationData;

function WarriorCombinationData.Script1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function WarriorCombinationData.Script2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function WarriorCombinationData.New(reader)
  local self = {};

  self.index = reader:ReadByte();

  self.warriors = {};
  for i = 1, 4 do
    self.warriors[i] = reader:ReadUInt16();
  end

  self.values = {};

  self.values.kind = reader:ReadByte();
  self.values.value = reader:ReadUInt16();

  return  self;
end

function WarriorCombinationData.Script3()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end