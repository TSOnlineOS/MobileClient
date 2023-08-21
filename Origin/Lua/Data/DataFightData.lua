
DataFightGoalData = {}
DataFightGoalData.__index = DataFightGoalData;

function DataFightGoalData.ScriptA()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end

function DataFightGoalData.ScriptB()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end

function DataFightGoalData.New(reader)
  local self = {};
  setmetatable(self, DataFightGoalData);
  
  self.score = reader:ReadUInt16();
  self.itemId = reader:ReadUInt16();
  self.count = reader:ReadUInt16();
  
  return self;
end

DataFightAwardData = {}
DataFightAwardData.__index = DataFightAwardData;

function DataFightAwardData.ScriptA()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end

function DataFightAwardData.ScriptAd()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end

function DataFightAwardData.New(reader)
  local self = {};
  setmetatable(self, DataFightAwardData);
  
  local id = reader:ReadUInt16();
  local kind = reader:ReadByte();

  local rank = reader:ReadUInt16();
  self.awards = {};
  for i = 1, 3 do
    self.awards[i] = {};
    self.awards[i].itemId = reader:ReadUInt16();
    self.awards[i].count = reader:ReadUInt32();
  end
  
  return kind, rank, self;
end

function DataFightAwardData.ScriptAf()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end

function DataFightAwardData.ScriptAe()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end

function DataFightAwardData.ScriptAq()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end