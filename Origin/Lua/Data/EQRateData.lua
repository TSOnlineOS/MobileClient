EQRateData = {};
EQRateData.__index = EQRateData;

function EQRateData.GetRShiftsA(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function EQRateData.GetRShiftsB(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function EQRateData.GetRShiftsC(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function EQRateData.GetRShiftsD(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function EQRateData.GetRShiftsE(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function EQRateData.New(reader)
  local self = {};
  setmetatable(self, EQRateData);

  local level = reader:ReadByte(); --升階等級
  self.rate = reader:ReadUInt16(); --升階成功機率
  self.isNeedEquip = reader:ReadByte(); --是否掉階(0：不掉階 1：掉階)
  self.itemId = reader:ReadUInt16(); --物品編號
  self.count = reader:ReadUInt16(); --物品數量
  self.required = reader:ReadUInt16(); --所需金幣

  return level, self;
end

function EQRateData.GetRShiftsF(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function EQRateData.GetRShiftsG(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function EQRateData.GetRShiftsH(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end