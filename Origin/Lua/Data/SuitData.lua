SuitData = {}
SuitData.__index = SuitData;

function SuitData.Demo()
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

function SuitData.Demo1()
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

function SuitData.Demo2()
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

function SuitData.Demo3()
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

function SuitData.New(reader)
  local self = {};
  setmetatable(self, SuitData);

  self.id = reader:ReadUInt16(); --套裝ID
  self.name = reader:ReadUInt32(); --套裝名稱
  self.maxSum = reader:ReadByte(); --套裝最大數
  self.attributes = {};
  for i = 1, Item.MaxSuitAttr do
    self.attributes[i] = {};
    self.attributes[i].suitSum = reader:ReadByte(); --套裝數
    self.attributes[i].attribute = reader:ReadByte(); --屬性
    self.attributes[i].value = reader:ReadUInt16(); --值
  end

  if Define.TextCount then
    DataManager.textCount = DataManager.textCount + string.Count(self.name);
  end
  
  return self.id, self;
end

function SuitData.Demo()
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