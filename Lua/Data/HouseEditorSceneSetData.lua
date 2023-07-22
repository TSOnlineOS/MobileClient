HouseEditorSceneSetData = {}
HouseEditorSceneSetData.__index = HouseEditorSceneSetData;

function HouseEditorSceneSetData.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function HouseEditorSceneSetData.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function HouseEditorSceneSetData.New(reader)
  local self = {};
  setmetatable(self, HouseEditorSceneSetData);

  self.Id = reader:ReadUInt16(); --[2]編號
  self.originalX = reader:ReadInt16(); --[3]X:起始點位置
  self.originalY = reader:ReadInt16(); --[4]Y:起始點位置
  self.sizeX = reader:ReadByte(); --[5]X格子數
  self.sizeY = reader:ReadByte(); --[6]X格子數
  self.sizeZ = reader:ReadByte(); --[7]Z格子數
  self.maxAmountOfFurnitureOnScene = reader:ReadInt16(); --[8]場景家具數量上限

  return  self.Id,self;
end

function HouseEditorSceneSetData.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function HouseEditorSceneSetData.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function HouseEditorSceneSetData.Trash4()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end