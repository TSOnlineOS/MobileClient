EarthShock = InheritsFromBaseAttackSkill();

function EarthShock:InitExtraParameters()
  self.lightSmoke = {};
end

 function EarthShock:ExtraClose()
  for k,v in pairs(self.lightSmoke)do
    v:Stop();
  end
end

function EarthShock:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground, 10080, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 6, me.nowPos.y, 20, true, 80);
    self.interval = 0.5;
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
    self.step = 2;
  elseif self.step == 2 then
    if self:CheckInterval() then 
      FightField.SetShake(true);
      me:PlaySound(target.colm, target.row, Attack_Start);
      target.roleController:SetAnimationForceId(ERolePose.Hit);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground, 10259, 50, 1, 10, 10, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 255, false, 60);
      for i = 0, 1 do
        self.lightSmoke[i] = EffectLight.New(10250, 150, 1, 6, 6, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y - (i * 30), 20, false, 30)
        self.lightSmoke[i]:SetTimeScale(FightField.timeScale);   
        self.lightSmoke[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      end
      self.interval = 0.5;
      self.step  = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      for i = 2, 3 do
        self.lightSmoke[i] = EffectLight.New(10250, 150, 1, 6, 6, EEffectLightTracer.Stand, target.nowPos.x - 10, target.nowPos.y - (i * 30), 20, false, 30)
        self.lightSmoke[i]:SetTimeScale(FightField.timeScale);   
        self.lightSmoke[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 1, EEffectLightDis.Sky, 10011, 150, 1, 1, 1, EEffectLightTracer.Curve, target.nowPos.x + math.random(0, 30), target.nowPos.y + math.random(0, 20), 255, true, 0, target.nowPos.x + math.random(0, 50), target.nowPos.y - math.random(0, 200), 0.11);
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 3, EEffectLightDis.Sky, 10063, 150, 1, 2, 2, EEffectLightTracer.Curve, target.nowPos.x - math.random(0, 30), target.nowPos.y + math.random(0, 20), 255, true, 0, target.nowPos.x - math.random(0, 50), target.nowPos.y + math.random(0, 80), 0.11);
      end
      me:PlaySound(target.colm, target.row, Attack_Start, 2);

      self.interval = 0.5;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      for i = 4, 5 do
        self.lightSmoke[i] = EffectLight.New(10250, 150, 1, 6, 6, EEffectLightTracer.Stand, target.nowPos.x + 10, target.nowPos.y - (i * 30), 20, false, 30)
        self.lightSmoke[i]:SetTimeScale(FightField.timeScale);   
        self.lightSmoke[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 2, EEffectLightDis.Sky, 10011, 150, 1, 1, 1, EEffectLightTracer.Curve, target.nowPos.x + math.random(0, 30), target.nowPos.y + math.random(0, 20), 255, true, 0, target.nowPos.x + math.random(0, 50), target.nowPos.y - math.random(0, 200), 0.11);
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 4, EEffectLightDis.Sky, 10063, 150, 1, 2, 2, EEffectLightTracer.Curve, target.nowPos.x - math.random(0, 30), target.nowPos.y + math.random(0, 20), 255, true, 0, target.nowPos.x - math.random(0, 50), target.nowPos.y - math.random(0, 200), 0.11);
      end
      me:PlaySound(target.colm, target.row, Attack_Start, 2);

      self.interval = 0.5;
      self.step = 5;
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      for i = 1, 2 do
        self.lightSmoke[i + 5] = EffectLight.New(10250, 150, 1, 6, 6, EEffectLightTracer.Stand, target.nowPos.x - 10, target.nowPos.y - (i * 30), 20, false, 30)
        self.lightSmoke[i + 5]:SetTimeScale(FightField.timeScale);   
        self.lightSmoke[i + 5]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 2, EEffectLightDis.Sky, 10011, 150, 1, 1, 1, EEffectLightTracer.Curve, target.nowPos.x + math.random(0, 30), target.nowPos.y + math.random(0, 20), 255, true, 0, target.nowPos.x + math.random(0, 50), target.nowPos.y + math.random(0, 80), 0.11);
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 4, EEffectLightDis.Sky, 10063, 150, 1, 2, 2, EEffectLightTracer.Curve, target.nowPos.x - math.random(0, 30), target.nowPos.y + math.random(0, 20), 255, true, 0, target.nowPos.x - math.random(0, 50), target.nowPos.y + math.random(0, 80), 0.11);
      end
      me:PlaySound(target.colm, target.row, Attack_Start, 2);
      FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Body, 10304, 150, 1, 12, 12, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 20, false, 50);
      self.interval = 1;
      self.step = 6;
    end
  elseif self.step == 6 then
    if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 7;
    end
  end
end
