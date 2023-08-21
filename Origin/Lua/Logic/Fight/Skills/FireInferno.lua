FireInferno = InheritsFromBaseAttackSkill();

function FireInferno:InitExtraParameters()
  self.lightFire = {};
  self.lightStar = {};
  self.lightRing = {};
end

function FireInferno:ExtraClose()
  ClearLightTable(self.lightFire);
  ClearLightTable(self.lightStar);
  ClearLightTable(self.lightRing);
  self.isLightEnd = true;
end

function FireInferno:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10078, 100, 1, 20, 20, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 30, true, 80);
    self.interval = 0.5;
    self.step = 2;
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
      --local currentOption = string.Get(80098);
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
  elseif self.step == 2 then
    if self:CheckInterval() then 
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 2, EEffectLightDis.Ground,10290, 100, 1, 11, 11, EEffectLightTracer.StandAni, target.nowPos.x + 5, target.nowPos.y, 30, true, 60);
      end
      self.interval = 0.5    
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        self.lightRing[i] = EffectLight.New(10037, 50, 1, 24, 24, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y - 30, 30, true, 40);
        self.lightStar[i] = EffectLight.New(10055, 80, 1, 21, 21, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y - 30, 30, true, 60);
        self.lightRing[i]:SetTimeScale(FightField.timeScale);   
        self.lightStar[i]:SetTimeScale(FightField.timeScale);   
        self.lightRing[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        self.lightStar[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      end
      self.interval = 0.8;    
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        self.lightFire[i] = EffectLight.New(10274, 90, 1, 16, 16, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y - 30, 35, true, 50);
        self.lightRing[i] = EffectLight.New(10127, 80, 1, 13, 13, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 35, true, 50);
        self.lightRing[i]:SetTimeScale(FightField.timeScale);   
        self.lightStar[i]:SetTimeScale(FightField.timeScale);   
        self.lightFire[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        self.lightRing[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 2, EEffectLightDis.Body, 10290, 100, 1, 11, 11, EEffectLightTracer.StandAni, target.nowPos.x + 5, target.nowPos.y, 30, true, 60);  
      end
      self.step = 5;
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
        --local currentOption = string.Get(80098);
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
  elseif self.step == 5 then
    if self.lightFire[0] ~= nil then
      if self.lightFire[0].picId == 0 then
        self.isLightEnd =true;
        self.step = 6;
      end
    end
  end
end

--專武
EW_FireInferno = InheritsAttack(FireInferno);

function EW_FireInferno:InitExtraParameters()
  self.lightFire = {};
  self.lightStar = {};
  self.lightRing = {};
end

function EW_FireInferno:ExtraClose()   
  ClearLightTable(self.lightFire);
  ClearLightTable(self.lightStar);
  ClearLightTable(self.lightRing);
  self.isLightEnd = true;
end

function EW_FireInferno:InitDrawBlack()
  self.needDrawBlack = true;   
end