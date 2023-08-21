EQAffixData = {};
EQAffixData.__index = EQAffixData;

function EQAffixData.New(reader)
  local self = {};
  setmetatable(self, EQAffixData);

  self.index = reader:ReadByte();
  local kind = reader:ReadByte(); --裝備部位(1.帽2.衣4.武器8.護腕16.鞋子32.特殊)
  self.attr = reader:ReadUInt16(); --洗鍊數值(1地 2水 3火 4風 5心 6光 7暗 207:提昇總HP 208
  self.level = {};
  for i = 1, 3 do
    self.level[i] = reader:ReadUInt16(); --洗鍊階級1(0不加入洗鍊值)
  end

  self.rate = reader:ReadByte(); --洗鍊機率

  return self.index, kind, self;
end

function EQAffixData.GuessNumberH(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function EQAffixData.GetMaxMinValue(fitType, attr, index)
  local max = 0;
  local min = 0;
  local i = 0;

  if eqAffixDatas[fitType] ~= nil and Between(index, 1, 3) then
    for k, v in pairs(eqAffixDatas[fitType]) do
      if v.attr == attr then
        i = i + 1;
        if i == 1 then
          max = v.level[index];
          min = v.level[index];
        end

        if max <= v.level[index] then
          max = v.level[index];
        end

        if min >= v.level[index] then
          min = v.level[index];
        end
      end
    end
  end

  return max, min;
end

function EQAffixData.GuessNumberA(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function EQAffixData.GuessNumberB(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function EQAffixData.GetRangeValue(fitType, attr, lv, attrValue)
  local total = 0;
  local rangValue = 0;

  for k, v in pairs(eqAffixDatas[fitType]) do
    if v.attr == attr then
      total = total + 1;

      if attrValue == v.level[lv] then
        rangValue = total;
      end
    end
  end

  return total, rangValue;
end

function EQAffixData.GuessNumberC(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function EQAffixData.GuessNumberD(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function EQAffixData.GuessNumberE(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function EQAffixData.GuessNumberF(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end