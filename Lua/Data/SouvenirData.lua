SouvenirData = {}
SouvenirData.__index = SouvenirData

function SouvenirData.GetRShiftB(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function SouvenirData.New(reader)
  local self = {};
  setmetatable(self, SouvenirData);

  self.Id = reader:ReadUInt16();
  self.quality = reader:ReadByte();
  self.payment = reader:ReadByte();
  self.price = reader:ReadInt32();
  self.addCharm = reader:ReadUInt16();
  self.addFriendly = reader:ReadUInt16();
  self.addExp = reader:ReadUInt16();
  self.naming = reader:ReadByte();
  self.broadcast = reader:ReadByte();
  self.roleCount = reader:ReadUInt16();

  return self.Id, self;
end

function SouvenirData:GetQualityColor()
  local result;

  if self.quality == 1 then
    result = UI.GetSprite("bod151");
  elseif self.quality == 2 then
    result = UI.GetSprite("bod148");
  elseif self.quality == 3 then
    result = UI.GetSprite("bod149");
  elseif self.quality == 4 then
    result = UI.GetSprite("bod150");
  end

  return result;
end

function SouvenirData.GetRShift1B(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function SouvenirData.GetRShift2B(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function SouvenirData:GetCurrencySprite()
  local result;

  if self.payment == ECurrency.Gold then
    result = UI.GetSprite("icon022");
  elseif self.payment == ECurrency.Money then
    result = UI.GetSprite("icon018");
  end

  return result;
end

function SouvenirData.GetRShift3B(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function SouvenirData:CanNamed()
  if self.naming == 1 then
    return true;
  elseif self.naming == 0 then
    return false;
  end
end

function SouvenirData.GetRShiftF(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function SouvenirData.GetRShiftE(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function SouvenirData.GetRShiftW(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function SouvenirData:CanBroadcast()
  if self.broadcast == 1 then
    return true;
  elseif self.broadcast == 0 then
    return false;
  end
end

function SouvenirData.GetRShift99B(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end