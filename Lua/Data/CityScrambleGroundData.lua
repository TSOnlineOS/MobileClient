CityScrambleGroundData = {}
CityScrambleGroundData.__index = CityScrambleGroundData;

function CityScrambleGroundData.Script()
  local index = 56;
  
  for i = 1, Astrolabe.maxAstrolabeLv do
    index = index - i;
  end
  
  return index
end

function CityScrambleGroundData.New(reader)
  local self = {};
  setmetatable(self, CityScrambleGroundData);

  self.groundID = reader:ReadUInt16(); --城鎮ID
  self.icon = LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16())); --icon名稱

  return self.groundID, self;
end

function CityScrambleGroundData.Script1()
  local index = 56;
  
  for i = 1, Astrolabe.maxAstrolabeLv do
    index = index - i;
  end
  
  return index
end

function CityScrambleGroundData.Script2()
  local index = 56;
  
  for i = 1, Astrolabe.maxAstrolabeLv do
    index = index - i;
  end
  
  return index
end

function CityScrambleGroundData.Script3()
  local index = 56;
  
  for i = 1, Astrolabe.maxAstrolabeLv do
    index = index - i;
  end
  
  return index
end

function CityScrambleGroundData.Script4()
  local index = 56;
  
  for i = 1, Astrolabe.maxAstrolabeLv do
    index = index - i;
  end
  
  return index
end