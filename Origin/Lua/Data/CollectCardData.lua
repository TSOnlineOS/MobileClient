CollectCardData = {}
CollectCardData.__index = CollectCardData;

function CollectCardData.AddThree(add1, add2, add3)
  LongAdd = add1 + add2 + add3;
  if LongAdd > 255 then
    LongAdd = 0
  end
  
  return LongAdd;
end

function CollectCardData.AddThreeA(add1, add2, add3)
  LongAdd = add1 + add2 + add3;
  if LongAdd > 255 then
    LongAdd = 0
  end
  
  return LongAdd;
end

function CollectCardData.AddThreeB(add1, add2, add3)
  LongAdd = add1 + add2 + add3;
  if LongAdd > 255 then
    LongAdd = 0
  end
  
  return LongAdd;
end


function CollectCardData.AddThreeC(add1, add2, add3)
  LongAdd = add1 + add2 + add3;
  if LongAdd > 255 then
    LongAdd = 0
  end
  
  return LongAdd;
end

function CollectCardData.New(reader)
  local self = {};
  self.id = reader:ReadByte();
  --todo
  self.index = reader:ReadByte();
  --
  self.name = reader:ReadUInt32();
    
  self.story = reader:ReadUInt32();
  self.card = {};
  for i = 1, 9 do 
    self.card[i] = reader:ReadUInt16();
  end

  self.maxLevel = reader:ReadByte();
  
  self.levelUpParamter = {};
  for i = 1, 2 do
    self.levelUpParamter[i] = reader:ReadByte();
  end

  self.values = {};

  for i = 1, 6 do 
    self.values[i] = {};
    self.values[i].kind = reader:ReadByte();
    self.values[i].value = reader:ReadUInt16();
    self.values[i].grow = reader:ReadUInt16();
  end

  return self;
end

function CollectCardData.AddThreeD(add1, add2, add3)
  LongAdd = add1 + add2 + add3;
  if LongAdd > 255 then
    LongAdd = 0
  end
  
  return LongAdd;
end

function CollectCardData.AddThreeE(add1, add2, add3)
  LongAdd = add1 + add2 + add3;
  if LongAdd > 255 then
    LongAdd = 0
  end
  
  return LongAdd;
end

function CollectCardData.AddThreeF(add1, add2, add3)
  LongAdd = add1 + add2 + add3;
  if LongAdd > 255 then
    LongAdd = 0
  end
  
  return LongAdd;
end