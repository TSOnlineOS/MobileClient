JiugonggeMissionData = {}
JiugonggeMissionData.__index = JiugonggeMissionData;

local this = JiugonggeMissionData;

local length = 0;

function JiugonggeMissionData.New(reader)
  local self = {};
  setmetatable(self, JiugonggeMissionData);
  
  self.Id = reader:ReadUInt16();--成就ID
  self.number = reader:ReadUInt32();--盤面編號
  self.kind = reader:ReadByte();--種類
  self.kindvalue1 = reader:ReadUInt16();--種類變數1
  self.description = reader:ReadUInt32();--任務說明
  self.conditions = {};
  self.conditions.kind = reader:ReadByte();--成就類別
  self.conditions.kindValue = reader:ReadUInt32();--數值
  self.conditions.opr =  reader:ReadByte();--運算子
  self.conditions.value = reader:ReadUInt32();--數值

  return self;
end

function JiugonggeMissionData.AddThree(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function JiugonggeMissionData:GetPogress()
  return string.Concat(self:GetConditionCurrentValue(), " / ", self.conditions.value);
end

function JiugonggeMissionData:IsComplete()
  if self.conditions.opr == 1 then
    return self:GetConditionCurrentValue() == self.conditions.value;
  elseif self.conditions.opr == 2 then
    return self:GetConditionCurrentValue() > self.conditions.value;
  elseif self.conditions.opr == 3 then
    return self:GetConditionCurrentValue() >= self.conditions.value;
  elseif self.conditions.opr == 4 then
    return self:GetConditionCurrentValue() < self.conditions.value;
  elseif self.conditions.opr == 5 then
    return self:GetConditionCurrentValue() <= self.conditions.value;
  elseif self.conditions.opr == 6 then
    return self:GetConditionCurrentValue() ~= self.conditions.value;
  end

  return false;
end

function JiugonggeMissionData.AddThree1(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function JiugonggeMissionData.AddThree2(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function JiugonggeMissionData.AddThree3(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function JiugonggeMissionData.AddThree4(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function JiugonggeMissionData.AddThree5(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function JiugonggeMissionData:GetConditionCurrentValue()
  if CheckCondition.CalculationConditionValue[self.conditions.kind] == nil then
    return 0;
  end

  return CheckCondition.CalculationConditionValue[self.conditions.kind](self);
end

function JiugonggeMissionData.AddThree6(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function JiugonggeMissionData.AddThree7(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function JiugonggeMissionData.AddThree8(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end