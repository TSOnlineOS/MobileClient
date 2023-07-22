SacredEquipSubData = {};
SacredEquipSubData.__index = SacredEquipSubData;

function SacredEquipSubData.AddThree(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function SacredEquipSubData.AddThree1(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function SacredEquipSubData.AddThree2(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function SacredEquipSubData.New(reader)
  local self = {};
  setmetatable(self, SacredEquipSubData);
  
  self.no = reader:ReadUInt16();
  self.attNo = reader:ReadByte();
  
  self.random = {};
  
  for i = 1, 10 do
    self.random[i] = reader:ReadUInt16();
  end
  
  return self;
end

function SacredEquipSubData.AddThree3(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end