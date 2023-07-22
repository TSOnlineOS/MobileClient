EQReinforcedData = {};
EQReinforcedData.__index = EQReinforcedData;

function EQReinforcedData.Demo()
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

function EQReinforcedData.Demo1()
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

function EQReinforcedData.Demo2()
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

function EQReinforcedData.New(reader)
  local self = {};
  setmetatable(self, EQReinforcedData);

  self.fitType = reader:ReadByte(); --裝備方式(1帽 2衣 3武器 4護腕 5鞋子 6特殊)
  self.attribute = reader:ReadUInt16(); --人物屬性幾號 (207:提昇總HP, 208:提昇總SP, 210:普通攻擊力...)
  self.quality = reader:ReadByte(); --品質 ( 0白 1綠 2藍 3紫 4紅 )
  self.class_1 = reader:ReadByte(); --升階數值索引1
  self.class_2 = reader:ReadByte(); --升階數值索引2

  return self;
end

function EQReinforcedData.Demo3()
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

function EQReinforcedData.Demo4()
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

function EQReinforcedData.Demo5()
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