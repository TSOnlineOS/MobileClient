MoneyTreeData = {};
MoneyTreeData.__index = MoneyTreeData;

function MoneyTreeData.GetLShift(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end

function MoneyTreeData.GetLShift1(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end

function MoneyTreeData.GetLShift2(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end

function MoneyTreeData.New(reader)
  local self = {};
  setmetatable(self, MoneyTreeData);

  local lv = reader:ReadByte();
  self.gold = reader:ReadUInt16();     --需求元寶
  self.money = reader:ReadUInt32();    --加速消耗金幣價
  self.cdTime = reader:ReadUInt16();   --CD時間(分)

  return lv, self;
end

function MoneyTreeData.GetLShift3(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end