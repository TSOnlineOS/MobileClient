
FurnitureEffectData = {}
FurnitureEffectData.__index = FurnitureEffectData;

function FurnitureEffectData.AddThree(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function FurnitureEffectData.AddThree1(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function FurnitureEffectData.AddThree2(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function FurnitureEffectData.AddThree3(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function FurnitureEffectData.AddThree4(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function FurnitureEffectData.New(reader)
  local self = {};
  setmetatable(self, FurnitureEffectData);

  local id = reader:ReadUInt16();
  self.dynamic = reader:ReadByte();
  self.effectStartFrame = reader:ReadByte(); --特效起始張數
  self.effectEndFrame = reader:ReadByte(); --特效結束張數
  self.effectTotalFrame = reader:ReadByte(); --特效總張數
  self.playRound = reader:ReadByte(); --[11]互動圖播放回合
  self.effectInterval = reader:ReadByte() * 0.001; --特效更新間隔(毫秒)
  self.effectScale = reader:ReadUInt16() * 0.001; --特效縮放(千分比)
  self.effectOffset = reader:ReadInt16(); --特效高度位移
  
  return id, self;
end

function FurnitureEffectData.AddThree5(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function FurnitureEffectData.AddThree6(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

