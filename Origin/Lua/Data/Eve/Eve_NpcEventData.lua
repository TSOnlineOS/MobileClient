NpcEventData = {}
NpcEventData.__index = NpcEventData

function NpcEventData.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function NpcEventData.New(reader) 
  local self = {};
  setmetatable(self, NpcEventData);
  
  self.EveNo = reader:ReadUInt16();
  self.EventName = {}
  for i = 1, 9 do
	  self.EventName[i] = reader:ReadByte();
  end

  self.EventWhenHappen = {};
  self.EventWhenHappen.OnClickObject = reader:ReadBoolean();
  self.EventWhenHappen.OnStrokeObject = reader:ReadBoolean();
  self.EventWhenHappen.OnIntoObjectArea = reader:ReadBoolean();
  self.EventWhenHappen.OnSerStrokeObject = reader:ReadBoolean();

  self.ConditionArrayNum = reader:ReadByte();
  self.ConditionArray = {};
  for i = 1, self.ConditionArrayNum do
    self.ConditionArray[i] = self:ReadCondition(reader);
  end	

  return self;
end

function NpcEventData.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function NpcEventData.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function NpcEventData:ReadCondition(reader)
  local condition = {};

  condition.CondtionNo = reader:ReadByte();
  condition.ConditionClass = reader:ReadByte();
  condition.Parameter = reader:ReadUInt16();
  condition.ParameterStyle = reader:ReadByte();
  condition.ConditionOps = reader:ReadByte();
  condition.ConditionValue = reader:ReadInt32();
  condition.CTimeValue = reader:ReadDouble();
  condition.ToResult = reader:ReadByte();
  condition.AndNum = reader:ReadByte();
  condition.ConditionSubItem = reader:ReadUInt16();
  condition.ResultArrayNum = reader:ReadByte();
  condition.ResultArray = {};
  for i = 1, condition.ResultArrayNum do
    condition.ResultArray[i] = self:ReadResult(reader);
  end

  return condition;
end

function NpcEventData.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function NpcEventData:ReadResult(reader)
  local result = {};

  result.ResultGroupNo = reader:ReadUInt16();
  result.ResultNo = reader:ReadByte();
  result.ResultType = reader:ReadByte();
  result.ResultClass = reader:ReadByte();
  result.Parameter = reader:ReadUInt16();
  result.ParamterStyle = reader:ReadByte();
  result.ResultValue = reader:ReadInt32();
  result.ResultMeanNo = reader:ReadUInt16();

  return result;
end

function NpcEventData.Trash4()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function NpcEventData.Trash5()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end
