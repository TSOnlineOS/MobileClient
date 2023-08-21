EVOStatusData = {}
EVOStatusData.__index = EVOStatusData;

function EVOStatusData.GetBitxor(bitxor)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoXorN = 10;
    DemoXorN = bit.bxor(DemoXorN, bitxor)
    
    return DemoXorN;
  end
end

function EVOStatusData.GetBitxorA(bitxor)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoXorN = 10;
    DemoXorN = bit.bxor(DemoXorN, bitxor)
    
    return DemoXorN;
  end
end

function EVOStatusData.GetBitxorB(bitxor)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoXorN = 10;
    DemoXorN = bit.bxor(DemoXorN, bitxor)
    
    return DemoXorN;
  end
end

function EVOStatusData.GetBitxorC(bitxor)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoXorN = 10;
    DemoXorN = bit.bxor(DemoXorN, bitxor)
    
    return DemoXorN;
  end
end

function EVOStatusData.New(reader)
  local self = {};
  setmetatable(self, EVOStatusData);
  
  local id = reader:ReadByte();

  self.kind = reader:ReadByte(); --狀態種類
  self.value = reader:ReadByte(); --增加數值
  self.itemId = reader:ReadUInt16(); --圖示ID
  self.description = reader:ReadString(254, false); --說明

  return id, self;
end

function EVOStatusData.GetBitxorD(bitxor)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoXorN = 10;
    DemoXorN = bit.bxor(DemoXorN, bitxor)
    
    return DemoXorN;
  end
end
