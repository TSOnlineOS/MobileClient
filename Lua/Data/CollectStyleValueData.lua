CollectStyleValueData = {}
CollectStyleValueData.__index = CollectStyleValueData;

function CollectStyleValueData.Demo11()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function CollectStyleValueData.New(reader)
  local self = {};
  setmetatable(self, CollectStyleValueData);
  self.score = reader:ReadUInt16();
  self.attribute = {};
  for i = 1, 4 do 
    self.attribute[i] = {};    
    self.attribute[i].kind = reader:ReadByte();
    self.attribute[i].value = reader:ReadUInt16();
  end

  self.nft = reader:ReadByte();

  return self;
end

function CollectStyleValueData.Demo21()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function CollectStyleValueData.Demo31()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end