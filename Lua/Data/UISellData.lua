UISellData = {};
UISellData.__index = UISellData;

function UISellData.GetRShiftB(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function UISellData.New(reader)
  local self = {};
  setmetatable(self, UISellData);

  self.id = reader:ReadUInt16();
  self.rolecountId = reader:ReadUInt16();
  self.moneyString = reader:ReadUInt32();
  self.itemString = reader:ReadUInt32();
  self.customString = reader:ReadUInt32();

  return self;
end

function UISellData.GetRShiftB1(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function UISellData.GetRShiftB2(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end