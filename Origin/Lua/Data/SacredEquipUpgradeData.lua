SacredEquipUpgradeData = {};
SacredEquipUpgradeData.__index = SacredEquipUpgradeData;

function SacredEquipUpgradeData.GetLShift(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end

function SacredEquipUpgradeData.GetLShift3(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end

function SacredEquipUpgradeData.New(reader)
  local self = {};
  setmetatable(self, SacredEquipUpgradeData);
  
  self.lv = reader:ReadByte();
  self.pro = reader:ReadByte();
  self.kind = reader:ReadByte();
  
  self.spend = {};
  
  for i = 1, 6 do
    self.spend[i] = reader:ReadUInt16();
  end
  
  return self;
end

function SacredEquipUpgradeData.GetLShift1(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end

function SacredEquipUpgradeData.GetLShift2(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end