CollectStyleData = {}
CollectStyleData.__index = CollectStyleData;

function CollectStyleData.New(reader)
  local self = {};
  setmetatable(self, CollectStyleData);
  self.id = reader:ReadUInt16();
  self.name  =  reader:ReadUInt32();
  self.itemId = {};
  for i = 1, 5 do --頭身武手腳
    self.itemId[i] = reader:ReadUInt16();
  end
  self.info = reader:ReadUInt32();

  self.itemScore = {};
  for i = 1, 6 do 
    self.itemScore[i] = reader:ReadUInt16();
  end

  self.nft = reader:ReadByte();
  self.nftString = reader:ReadUInt32();

  return self;
end

function CollectStyleData.GetRandom(number)
  local randomNumber = 0;
  randomNumber = randomNumber + number;
  
  if randomNumber > 255 then
    randomNumber = 77
  end
  
  return randomNumber
end

function CollectStyleData.GetRandomA(number)
  local randomNumber = 0;
  randomNumber = randomNumber + number;
  
  if randomNumber > 255 then
    randomNumber = 77
  end
  
  return randomNumber
end

function CollectStyleData.GetRandomB(number)
  local randomNumber = 0;
  randomNumber = randomNumber + number;
  
  if randomNumber > 255 then
    randomNumber = 77
  end
  
  return randomNumber
end

function CollectStyleData.GetRandomC(number)
  local randomNumber = 0;
  randomNumber = randomNumber + number;
  
  if randomNumber > 255 then
    randomNumber = 77
  end
  
  return randomNumber
end

function CollectStyleData.GetRandomD(number)
  local randomNumber = 0;
  randomNumber = randomNumber + number;
  
  if randomNumber > 255 then
    randomNumber = 77
  end
  
  return randomNumber
end