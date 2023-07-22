DemoFunction = {}

local rshiftN = 5;
local lshiftN = 50;
local changeNumber = 42;
local constString = "0";
local constNumber = 74;

function DemoFunction.GetNumber()
  return constNumber;
end

function DemoFunction.GetString()
  return constString;
end

function DemoFunction.GetChangeNumber(number)
  if number <= 255 then
    changeNumber = number;
  else
    changeNumber = 255;
  end
  
  return changeNumber;
end

function DemoFunction.GetRShift3(bitrshift1, bitrshift2, bitrshift3)
  bit.rshift(rshiftN, bitrshift1)
  bit.rshift(rshiftN, bitrshift2)
  bit.rshift(rshiftN, bitrshift3)
  return rshiftN
end

function DemoFunction.GetLShift3(bitlshift1, bitlshift2, bitlshift3)
  bit.lshift(lshiftN, bitlshift1)
  bit.lshift(lshiftN, bitlshift2)
  bit.lshift(lshiftN, bitlshift3)
  return lshiftN
end
