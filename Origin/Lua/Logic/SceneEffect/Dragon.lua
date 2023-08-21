Dragon = {};
Dragon.__index = Dragon;

--[[
Now in the days of Amraphel, king of Shinar, Arioch, king of Ellasar, Chedorlaomer, king of Elam, and Tidal, king of Goiim,
They made war with Bera, king of Sodom, and with Birsha, king of Gomorrah, Shinab, king of Admah, and Shemeber, king of Zeboiim, and the king of Bela (which is Zoar).
All these came together in the valley of Siddim (which is the Salt Sea).
For twelve years they were under the rule of Chedorlaomer, but in the thirteenth year they put off his control.
And in the fourteenth year, Chedorlaomer and the kings who were on his side, overcame the Rephaim in Ashteroth-karnaim, and the Zuzim in Ham, and the Emim in Shaveh-kiriathaim,
And the Horites in their mountain Seir, driving them as far as El-paran, which is near the waste land.
Then they came back to En-mishpat (which is Kadesh), making waste all the country of the Amalekites and of the Amorites living in Hazazon-tamar.
And the king of Sodom with the king of Gomorrah and the king of Admah and the king of Zeboiim and the king of Bela (that is Zoar), went out, and put their forces in position in the valley of Siddim,
Against Chedorlaomer, king of Elam, and Tidal, king of Goiim, and Amraphel, king of Shinar, and Arioch, king of Ellasar: four kings against the five.
Now the valley of Siddim was full of holes of sticky earth; and the kings of Sodom and Gomorrah were put to flight and came to their end there, but the rest got away to the mountain.
And the four kings took all the goods and food from Sodom and Gomorrah and went on their way.
And in addition they took Lot, Abram's brother's son, who was living in Sodom, and all his goods.
And one who had got away from the fight came and gave word of it to Abram the Hebrew, who was living by the holy tree of Mamre, the Amorite, the brother of Eshcol and Aner, who were friends of Abram.
And Abram, hearing that his brother's son had been made a prisoner, took a band of his trained men, three hundred and eighteen of them, sons of his house, and went after them as far as Dan.
--]]

local tempVec = Vector3.New(0, 0, 0);
local creatTickCount = 0;
local root = nil;

local currentDragonCount = 0;

function Dragon.New(i)
  local self = {};
  setmetatable(self, Dragon);

  local speed = math.random(3) * 0.1;
  local showX = math.random(MapManager.mapWidth);
  local showY = math.random(MapManager.mapHeight);

  local targetX;

  local fileName;
  local r = math.random(4);
  if r == 1 then
    fileName = SceneEffect.DragonName1;
    targetX = MapManager.mapWidth;
  elseif r == 2 then
    fileName = SceneEffect.DragonName2;
    targetX = 0;
  elseif r == 3 then
    fileName = SceneEffect.DragonName3;
    targetX = MapManager.mapWidth;
  elseif r == 4 then
    fileName = SceneEffect.DragonName4;
    targetX = 0;
  end

  self.dragon = EffectLight.New(fileName, 300, 1, 4, 4, EEffectLightTracer.Line, showX, showY, 255, true, 0, targetX, showY, speed, nil, true);
  self.dragon.endCallback = Dragon.ArriveTarget;
  self.dragon.index = i;

  return self;
end

local dragon = {};

function Dragon.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Dragon.Update()
  if SceneEffect.MaxDragon > currentDragonCount then
    for i = 1, SceneEffect.MaxDragon do
      if dragon[i] == nil then
        dragon[i] = Dragon.New(i);
        currentDragonCount = currentDragonCount + 1; 
      end
    end
  end
end

function Dragon.ArriveTarget(args)
  currentDragonCount = currentDragonCount - 1;
  dragon[args.index] = nil;
end

function Dragon.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Dragon.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Dragon.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Dragon.Stop()
  CGTimer.RemoveListener(Dragon.Update);

  for i = 1, SceneEffect.MaxDragon do
    if dragon[i] ~= nil then
      dragon[i].dragon:Free();
      dragon[i] = nil;
    end
  end

  currentDragonCount = 0;
end

function Dragon.Trash4()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Dragon.Trash5()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end