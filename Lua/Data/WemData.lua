WemData ={}
WemData.__index = WemData

function WemData.Trash66()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function WemData.Trash55()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function WemData.New(reader)
  local self = {};
  setmetatable(self, TsElementData);

  self.id = reader:ReadInt32();
  self.indexX = reader:ReadInt32();
  self.indexY = reader:ReadInt32();
  self.fAnim = 1;
  self.frame = reader:ReadByte();
  self.gapTime = reader:ReadUInt16();
  self.width = reader:ReadUInt16();
  self.height = reader:ReadUInt16();
  self.alpha = reader:ReadByte();
  self.level = reader:ReadByte();
  
  return self;
end

function WemData.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function WemData.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function WemData.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end