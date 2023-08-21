LimitTimeDungeonData = {};
LimitTimeDungeonData.__index = LimitTimeDungeonData;

function LimitTimeDungeonData.GetLShift(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end

function LimitTimeDungeonData.GetLShift1(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end

function LimitTimeDungeonData.GetLShift2(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end

function LimitTimeDungeonData.New(reader)
  local self = {};
  setmetatable(self, LimitTimeDungeonData);

  self.index = reader:ReadByte();
  self.msg = reader:ReadUInt32();
  self.sceneId = reader:ReadUInt16();
  self.limitIndex = reader:ReadUInt16();
  self.limitTime = reader:ReadUInt16();
  self.limitLv = reader:ReadUInt16();
  self.missionId = reader:ReadUInt16();

  return self;
end

function LimitTimeDungeonData.GetLShift3(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end

function LimitTimeDungeonData.GetLShift4(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end