FurnitureCollectLevelData = {}
FurnitureCollectLevelData.__index = FurnitureCollectLevelData;

function FurnitureCollectLevelData.AddThree(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function FurnitureCollectLevelData.New(reader)
  local self = {};
  setmetatable(self, FurnitureCollectLevelData);

  self.level = reader:ReadByte();
  self.score = reader:ReadUInt16();
  self.kind = reader:ReadByte();
  self.value = reader:ReadUInt16();

  return  self.level, self;
end

function FurnitureCollectLevelData.AddThreeA(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function FurnitureCollectLevelData.AddThreeB(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function FurnitureCollectLevelData.AddThreeC(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function FurnitureCollectLevelData:GetString()
  return string.Concat(ItemData.GetAttrText(self.kind), "+", self.value);
end

function FurnitureCollectLevelData.AddThreeD(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function FurnitureCollectLevelData.AddThreeE(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function FurnitureCollectLevelData.AddThreeF(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end