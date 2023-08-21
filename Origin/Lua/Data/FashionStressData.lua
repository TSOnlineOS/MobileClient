FashionStressData = {}
FashionStressData.__index = FashionStressData;

function FashionStressData.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end

function FashionStressData.Script1()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end

function FashionStressData.New(reader)
  local self = {};
  setmetatable(self, FashionStressData);

  local id = reader:ReadUInt16();
  self.maxLv = reader:ReadByte();

  self.attributes = {};
  for i = 1, 2 do
    self.attributes[i] = {};
    self.attributes[i].attr = reader:ReadUInt16();
    self.attributes[i].value = reader:ReadByte();
    self.attributes[i].bonus = reader:ReadByte();
  end

  return id, self;
end

function FashionStressData.Script2()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end

function FashionStressData.Script3()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end

function FashionStressData.Script4()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end

function FashionStressData.Script5()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end

function FashionStressData.Script6()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end