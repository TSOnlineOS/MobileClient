NumberOfHouseWarriorData = {}
NumberOfHouseWarriorData.__index = NumberOfHouseWarriorData;

function NumberOfHouseWarriorData.New(reader)
  local self = {};
  setmetatable(self, NumberOfHouseWarriorData);

  self.number = reader:ReadByte();
  self.score = reader:ReadUInt16();

  return  self.number, self;
end

function NumberOfHouseWarriorData.AddThree(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end


function NumberOfHouseWarriorData.AddThreeA(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function NumberOfHouseWarriorData.AddThreeB(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end
