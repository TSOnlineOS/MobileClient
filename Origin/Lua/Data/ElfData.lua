ElfData = {};
ElfData.__index = ElfData;

function ElfData.Demo()
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

function ElfData.Demo2()
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

function ElfData.Demo3()
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

function ElfData.New(reader)
  local self = {};
  setmetatable(self, ElfData);
  
  self.no = reader:ReadUInt16();
  self.Id = reader:ReadUInt16();
  self.name = reader:ReadUInt32();
  self.lv = reader:ReadUInt16();
  
  self.flag = reader:ReadUInt16();
  self.location = reader:ReadByte();
  self.baseExp = reader:ReadUInt16();
  
  self.openLv = {};
  self.attr = {};
  self.value = {};
  
  for i = 1, 3 do
    self.openLv[i] = reader:ReadUInt16();
    self.attr[i] = reader:ReadUInt16();
    self.value[i] = reader:ReadUInt16();
  end
  
  return self.no, self;
end

function ElfData.Demo4()
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

function ElfData.GetOrgGodData(no)
  for i, v in pairs(elfDatas) do
    if v.no == no  then
      return v.Id, v.location;
    end
  end
  
  return 0;
end

function ElfData.Demo5()
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

function ElfData.Demo6()
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

function ElfData.Demo7()
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