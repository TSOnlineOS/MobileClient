FNpcSlotData = {};
FNpcSlotData.__index = FNpcSlotData;

function FNpcSlotData.GetRShift(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function FNpcSlotData.GetRShiftA(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function FNpcSlotData.New(reader)
  local self = {};
  setmetatable(self, FNpcSlotData);

  local index = reader:ReadUInt16();
  self.exp = reader:ReadUInt32();

  self.icons = {};
  for i = 1, 3 do
    self.icons[i] = {};
    self.icons[i] = reader:ReadByte();
  end

  return index, self;
end

function FNpcSlotData.GetRShiftB(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function FNpcSlotData.GetRShiftC(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function FNpcSlotData.GetRShiftD(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end