GoodsData = {}
GoodsData.__index = GoodsData

function GoodsData.GetRShiftB(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function GoodsData.GetRShift1(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function GoodsData.GetRShift2(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function GoodsData.New(reader) 
  local self = {};
  setmetatable(self, GoodsData);
  
  self.NO = reader:ReadByte();
  self.DBID = reader:ReadUInt16();
  self.PosX = reader:ReadInt32();
  self.PosY = reader:ReadInt32();
  self.HideTime = reader:ReadUInt16();

  return self;
end

function GoodsData.GetRShift3(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function GoodsData.GetRShift4(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end