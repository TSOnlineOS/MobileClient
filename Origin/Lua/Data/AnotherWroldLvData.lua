AnotherWroldLvData = {};
AnotherWroldLvData.__index = AnotherWroldLvData;

function AnotherWroldLvData.New(reader)
  local self = {};
  setmetatable(self, AnotherWroldLvData);

  self.id = reader:ReadUInt16(); --流水號
  self.level = reader:ReadByte(); --地雷怪等級
  self.turn = reader:ReadByte(); --轉生次數

  return self;
end

function AnotherWroldLvData.Meanless()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function AnotherWroldLvData.Meanless1()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function AnotherWroldLvData.Meanless2()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function AnotherWroldLvData.Meanless3()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end