SoulLevelData = {}
SoulLevelData.__index = SoulLevelData;

function SoulLevelData.AddThree(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function SoulLevelData.AddThree1(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function SoulLevelData.New(reader)
  local self = {};
  setmetatable(self, SoulLevelData);

  self.white = {};
  self.green = {};
  self.blue = {};
  self.purple = {};

  local level = reader:ReadUInt16();

  self.white = {};
  self.green = {};
  self.blue = {};
  self.purple = {};

  self.white.reel = reader:ReadUInt16();      --卷軸
  self.white.coin = reader:ReadUInt16();      --吞食幣
  self.white.affCoin = reader:ReadUInt16();  --洗鍊吞食幣

  self.green.reel = reader:ReadUInt16();
  self.green.coin = reader:ReadUInt16();
  self.green.affCoin = reader:ReadUInt16();

  self.blue.reel = reader:ReadUInt16();
  self.blue.coin = reader:ReadUInt16();
  self.blue.affCoin = reader:ReadUInt16();

  self.purple.reel = reader:ReadUInt16();
  self.purple.coin = reader:ReadUInt16();
  self.purple.affCoin = reader:ReadUInt16();

  return level, self;
end

function SoulLevelData.AddThree3(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function SoulLevelData.AddThree4(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function SoulLevelData.AddThree5(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function SoulLevelData:GetLevelData(quality)
  if quality == ESoulCategory.N then
    return self.white;
  elseif quality == ESoulCategory.R then
    return self.green;
  elseif quality == ESoulCategory.SR then
    return self.blue;
  elseif quality == ESoulCategory.SSR then
    return self.purple;
  end
end

function SoulLevelData.AddThree6(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end