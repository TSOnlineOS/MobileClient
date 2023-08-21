BreakthroughData = {}
BreakthroughData.__index = BreakthroughData;

local maxBreakthroughEXP = 0;

function BreakthroughData.Meanless()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function BreakthroughData.Meanless1()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function BreakthroughData.Meanless2()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function BreakthroughData.New(reader)
  local self = {};
  setmetatable(self, BreakthroughData);
  self.itemID = reader:ReadUInt16(); --物品ID
  self.itemCount = reader:ReadByte(); --物品數量
  self.exp = reader:ReadInt32() --所需經驗
  maxBreakthroughEXP = maxBreakthroughEXP + self.exp;
  return self;
end

function BreakthroughData:IsEmpty()
  if self.itemID == 0 or self.itemCount == 0 or self.exp == 0 then
    return true
  else
    return false
  end
end

function BreakthroughData.MeanlessA()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function BreakthroughData.MeanlessB()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function BreakthroughData.MeanlessC()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function BreakthroughData.MeanlessD()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function BreakthroughData.MeanlessE()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function BreakthroughData.GetMaxEXP()
  return maxBreakthroughEXP;
end