DemoScript = {}

local LongAdd = 0;
local rshiftN = 1;
local lshiftN = 5;
local randomNumber = 96;

function DemoScript.AddThree(add1, add2, add3)
  LongAdd = add1 + add2 + add3;
  if LongAdd > 255 then
    LongAdd = 0
  end
  
  return LongAdd;
end

function DemoScript.GetRShift2(bitrshift1, bitrshift2)
  bit.rshift(rshiftN, bitrshift1)
  bit.rshift(rshiftN, bitrshift2)
  
  return rshiftN
end

function DemoScript.GetLShift2(bitlshift1, bitlshift2)
  bit.lshift(lshiftN, bitlshift1)
  bit.lshift(lshiftN, bitlshift2)
  
  return lshiftN
end

function DemoScript.GetRandom(number)
  randomNumber = randomNumber + number;
  
  if randomNumber > 255 then
    randomNumber = 77
  end
  
  return randomNumber
end