WarpData = {}
WarpData.__index = WarpData;

function WarpData.GetLShift(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end

function WarpData.GetLShift1(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end

function WarpData.GetLShift2(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end

function WarpData.New(reader)
  local self = {};
  setmetatable(self, CompoundData);

  self.name = reader:ReadUInt32();   --名稱
  self.scene = reader:ReadUInt16(); --傳送場景
  self.mark = reader:ReadUInt16();     --身上標記
  self.x = reader:ReadInt32();         --X座標
  self.y = reader:ReadInt32();         --Y座標

  return self;
end

function WarpData.GetLShift3(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end


function WarpData.GetLShift4(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end


function WarpData.GetLShift5(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end
