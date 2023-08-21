SacredEquipPrimaryData = {};
SacredEquipPrimaryData.__index = SacredEquipPrimaryData;

function SacredEquipPrimaryData.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function SacredEquipPrimaryData.New(reader)
  local self = {};
  setmetatable(self, SacredEquipPrimaryData);
  
  self.no = reader:ReadUInt16();
  self.attNo = reader:ReadByte();
  
  self.upgradeLv = {};
  
  for i = 0, 15 do
    self.upgradeLv[i] = reader:ReadUInt16();
  end
  
  return self;
end

function SacredEquipPrimaryData.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function SacredEquipPrimaryData.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function SacredEquipPrimaryData.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end