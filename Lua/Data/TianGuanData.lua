
TianGuanData = {}
TianGuanData.__index = TianGuanData;

function TianGuanData.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function TianGuanData.TrashA()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function TianGuanData.New(reader)
  local self = {};
  setmetatable(self, TianGuanData);

  local itemId = reader:ReadUInt16();
  local level = reader:ReadByte();

  self.attributes = {};
  for i = 1, 2 do
    self.attributes[i] = {};
    self.attributes[i].kind = reader:ReadUInt16();
    self.attributes[i].value = reader:ReadInt32() - 100;
  end
  
  return itemId, level, self;
end

function TianGuanData.TrashB()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function TianGuanData.TrashC()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function TianGuanData:GetEffectText(symbol)
  if symbol == nil then
    symbol = "\n";
  end

  local effectString = "";

  for i = 1, 2 do
    if i > 1 then
      effectString = string.Concat(effectString, symbol);
    end

    local kind = self.attributes[i].kind;
    local value = self.attributes[i].value;

    if kind == EAttribute.EquipAtk then
      if value >= 0 then
        effectString = string.Concat(effectString, string.Get(30048), tostring(value))
      else
        effectString = string.Concat(effectString, string.Get(30049), tostring(value))
      end
    elseif kind == EAttribute.EquipDef then
      if value >= 0 then
        effectString = string.Concat(effectString, string.Get(30050), tostring(value))
      else
        effectString = string.Concat(effectString, string.Get(30051), tostring(value))
      end
    elseif kind == EAttribute.EquipInt then
      if value >= 0 then
        effectString = string.Concat(effectString, string.Get(30052), tostring(value))
      else
        effectString = string.Concat(effectString, string.Get(30053), tostring(value))
      end
    elseif kind == EAttribute.EquipAgi then
      if value >= 0 then
        effectString = string.Concat(effectString, string.Get(30054), tostring(value))
      else
        effectString = string.Concat(effectString, string.Get(30055), tostring(value))
      end
    elseif kind == EAttribute.EquipMaxHp then
      if value >= 0 then
        effectString = string.Concat(effectString, string.Get(30056), tostring(value))
      else
        effectString = string.Concat(effectString, string.Get(30057), tostring(value))
      end
    elseif kind == EAttribute.EquipMaxSp then
      if value >= 0 then
        effectString = string.Concat(effectString, string.Get(30058), tostring(value))
      else
        effectString = string.Concat(effectString, string.Get(30059), tostring(value))
      end
    end
  end

  return effectString;
end

function TianGuanData.TrashD()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function TianGuanData.TrashE()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end