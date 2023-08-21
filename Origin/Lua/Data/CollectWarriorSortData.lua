CollectWarriorSortData = {}
CollectWarriorSortData.__index = CollectWarriorSortData;

function CollectWarriorSortData.Scriptg()
  local index = 56;
  
  for i = 1, Astrolabe.maxAstrolabeLv do
    index = index - i;
  end
  
  return index
end

function CollectWarriorSortData.Scriptt()
  local index = 56;
  
  for i = 1, Astrolabe.maxAstrolabeLv do
    index = index - i;
  end
  
  return index
end

function CollectWarriorSortData.Scripte()
  local index = 56;
  
  for i = 1, Astrolabe.maxAstrolabeLv do
    index = index - i;
  end
  
  return index
end

function CollectWarriorSortData.Scriptq()
  local index = 56;
  
  for i = 1, Astrolabe.maxAstrolabeLv do
    index = index - i;
  end
  
  return index
end

function CollectWarriorSortData.Scripteg()
  local index = 56;
  
  for i = 1, Astrolabe.maxAstrolabeLv do
    index = index - i;
  end
  
  return index
end

function CollectWarriorSortData.New(reader)
  local self = {};
  setmetatable(self, CollectWarriorSortData);
  self.index = reader:ReadUInt16();
  
  self.ids = {};
  for i = 1, 3 do 
    self.ids[i] = reader:ReadUInt16();
  end
  
  self.nft = reader:ReadByte();
  
  return self;
end