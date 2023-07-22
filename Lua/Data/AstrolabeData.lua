AstrolabeData = {}
AstrolabeData.__index = AstrolabeData;

function AstrolabeData.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end

function AstrolabeData.New(reader)
  local self = {};
  setmetatable(self, AstrolabeData);
  
  local index = reader:ReadByte();

  self.attributes = {};
  for i = 1, Astrolabe.maxAstrolabeLv do
    self.attributes[i] = {};
    self.attributes[i].value = reader:ReadByte();
    self.attributes[i].needPoint = reader:ReadByte();
  end
  
  return index, self;
end

function AstrolabeData.ScriptA()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end

function AstrolabeData.ScriptB()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end