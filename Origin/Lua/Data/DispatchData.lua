DispatchData = {}
DispatchData.__index = DispatchData;

function DispatchData.TrashC()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function DispatchData.New(reader)
  local self = {};
  setmetatable(self, DispatchData);

  local mainKind = reader:ReadByte();--主種類
  local subKind = reader:ReadByte();--次種類
  self.minLv = reader:ReadByte();--等級下限
  self.awardId = reader:ReadUInt16();--獎勵索引
  self.expKind = reader:ReadByte();--經驗值種類
  self.exp = reader:ReadUInt32();--派遣經驗值

  return mainKind, subKind, self;
end

function DispatchData.TrashA()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function DispatchData.TrashR()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

DispatchBonusData = {}
DispatchBonusData.__index = DispatchBonusData;

function DispatchBonusData.New(reader)
  local self = {};
  setmetatable(self, DispatchBonusData);

  local id = reader:ReadByte();--索引
  self.conditionKind = reader:ReadByte();--條件種類
  self.conditionValue = reader:ReadByte();--條件數值
  self.effectIndex = reader:ReadByte();--效果影響獎勵索引
  self.effectKind = reader:ReadByte();--效果種類
  self.effectValue = reader:ReadUInt16();--效果數值
  self.effectContent = reader:ReadUInt32();--效果說明

  return id, self;
end

function DispatchBonusData.TrashR()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function DispatchBonusData.TrashRr()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function DispatchBonusData.TrashRe()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function DispatchBonusData.TrashRw()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function DispatchBonusData:GetContent()
  if self.conditionKind == EDispatchBonuseKind.Moral then
    return string.format( string.Get(self.effectContent), string.GetMoral(self.conditionValue) );
  elseif self.conditionKind == EDispatchBonuseKind.Element then
    return string.format( string.Get(self.effectContent), string.GetElement(self.conditionValue) );
  end
  return "";
end

function DispatchBonusData.TrashRv()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function DispatchBonusData:IsNpcMeetCondition(npcData)
  if self.conditionKind == EDispatchBonuseKind.Moral then
    return self.conditionValue == npcData.moral;
  elseif self.conditionKind == EDispatchBonuseKind.Element then
    return self.conditionValue == npcData.element;
  end
  return false;
end
function DispatchBonusData.TrashR1()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function DispatchBonusData.TrashR2()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function DispatchBonusData.TrashR3()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end