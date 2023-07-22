Firework = {};
Firework.__index = Firework;

local tempVec = Vector3.New(0, 0, 0);
local creatTickCount = 0;
local root = nil;

local aAllPage = 0;
local bmpName = "";
local tempX= 0;
local tempY= 0;
local aSpeed = 0;

function Firework.EndOfLine()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Firework.EndOfLine1()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Firework.EndOfLine2()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Firework.EndOfLine3()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Firework.EndOfLine4()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end


function Firework.New(index, kind, startX, startY, count)
  local self = {};
  setmetatable(self, Firework);

  self.step = 1;
  self.kind = kind;
  self.anniversaryFireNum = index - 1;
  self.fireNum = count;
  self.showX = math.abs(SceneEffect.GetRandom(startX, 15));
  self.showY = math.abs(SceneEffect.GetRandom(startY, 30));

  self.firework = EffectLight.New(10310, 10, 1, 22, 22, EEffectLightTracer.StandAni, self.showX, self.showY, 30, true, 0, nil, nil, nil, nil, true);
  self.firework.rectTransform.localScale  = Vector3.New(1.5, 1.5, 1.5);  
  self.firework:SetSortingOrder(MapManager.mapHeight);

  return self;
end

local firework = {};

function Firework.Start()
  CGTimer.AddListener(Firework.Update, 0, false);
end

function Firework.Create(index, kind, startX, startY, count)
  for i = 1, SceneEffect.MaxFirework do
    if firework[i] == nil then              
      firework[i] = Firework.New(index, kind, startX, startY, count);
      break;
    end
  end

  Firework.Start();
end

function Firework.Update()
  for i = 1, SceneEffect.MaxFirework do
    if firework[i] ~= nil then       
      if firework[i].step == 1 then
        if firework[i].firework.picId == 0 then
          firework[i].step = firework[i].step + 1;
        end
      elseif firework[i].step == 2 then
        if firework[i].kind == 1 then
          aAllPage = 14;
          bmpName = 1031 * 10 + math.random(SceneEffect.MaxFireNum);
          tempX = math.abs(SceneEffect.GetRandom(firework[i].showX, 35)); 
          tempY = math.abs(SceneEffect.GetRandom(firework[i].showY, 20)); 
          aSpeed = math.abs(SceneEffect.GetRandom(60, 20));
        elseif firework[i].kind == 3 then
          aAllPage = 16;
          aSpeed = math.abs(SceneEffect.GetRandom(100, 20));
          if firework[i].fireNum == 5 then
            bmpName = 10758 + firework[i].anniversaryFireNum;
            tempX = firework[i].MapX + firework[i].AnniversaryFireNum * 50 - 100;
            tempY = math.abs(SceneEffect.GetRandom(firework[i].tempY, 20));
          else
            bmpName = 10758 + math.random(SceneEffect.MaxAnniversaryFireNum);
            tempX = math.abs(SceneEffect.GetRandom(firework[i].showX, 50));
            tempY = math.abs(SceneEffect.GetRandom(firework[i].showY, 20));
          end
        end
          firework[i].firework = EffectLight.New(bmpName, aSpeed, 1, aAllPage, aAllPage, EEffectLightTracer.StandAni, tempX, tempY - 100, 30, true, 0, nil, nil, nil, nil, true);
          firework[i].firework.rectTransform.localScale  = Vector3.New(1.5, 1.5, 1.5); 
          firework[i].firework:SetSortingOrder(MapManager.mapHeight);
          firework[i].step = firework[i].step + 1;
      elseif firework[i].step == 3 then
        if firework[i].firework.picId == 0 then
          if firework[i].kind == 1 then
            bmpName = 1031 * 10 + math.random(SceneEffect.MaxFireNum);
            tempX = math.abs(SceneEffect.GetRandom(firework[i].showX, 35)); 
            tempY = math.abs(SceneEffect.GetRandom(firework[i].showY, 20)); 
            aSpeed = math.abs(SceneEffect.GetRandom(60, 20));
            firework[i].firework = EffectLight.New(bmpName, aSpeed, 1, 14, 14, EEffectLightTracer.StandAni, tempX, tempY - 100, 30, true, 0, nil, nil, nil, nil, true);
            firework[i].firework.rectTransform.localScale  = Vector3.New(1.5, 1.5, 1.5); 
            firework[i].firework:SetSortingOrder(MapManager.mapHeight);
            firework[i].step = firework[i].step + 1;
          elseif firework[i].kind == 3 then
            firework[i].step = firework[i].step + 1;
          end  
        end
      elseif firework[i].step == 4 then
        if firework[i].firework.picId == 0 then
          if firework[i].fireWork ~= nil then
            firework[i].fireWork:Free();
          end
          firework[i] = nil;
        end
      end  
    end
  end
end

function Firework.EndOfLine5()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Firework.EndOfLine6()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Firework.EndOfLine7()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Firework.Stop()
  CGTimer.RemoveListener(Firework.Update);

  for i = 1, SceneEffect.MaxFirework do
    if firework[i] ~= nil and firework[i].gameObject ~= nil then
      poolMgr:Release("BaseSceneEffect", firework[i].gameObject);
    end

    firework[i] = nil;  
  end
end
