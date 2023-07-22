DemoCode = {}
local this = DemoCode;
local Color;
local NewColor;
local DemoBernoulliConst = 52;
local DemoInsideForce = false;
local DemoEFlow = 1;
local DemoThrArea = 1;
local DemoGuessN = 0;
local DemoXorN = 600;


function DemoCode.CalTriangleArea(a, b)
  
  return a * b / 2;
end

function DemoCode.SetColorNum(color)
  if color ~= nil then
    this.Color = color;
  else
    this.NewColor = color;
  end
end

function DemoCode.CalAvg(a, b, c)
  
  return a + b +c / 3;
end

function DemoCode.TestDriver()
  
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------

end

function DemoCode.GetBitnot(bitnot)
  DemoBernoulliConst = bit.bnot(DemoBernoulliConst, bitnot)

  return DemoBernoulliConst;
end

function DemoCode.GetBitxor(bitxor)
  DemoXorN = bit.bxor(DemoXorN, bitxor)
  
  return DemoXorN;
end

function DemoCode.GuessNumber(guessNumber)
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

function DemoCode.GetRShift(bitrshift)
  bit.rshift(DemoEFlow, bitrshift)
  
  return DemoEFlow
end

function DemoCode.GetLShift(bitlshift)
  bit.lshift(DemoThrArea, bitlshift)
  
  return DemoThrArea
end
