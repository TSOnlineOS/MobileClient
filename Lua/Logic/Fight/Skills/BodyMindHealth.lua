BodyMindHealth = InheritsFromBaseAttackSkill();

function BodyMindHealth:InitExtraParameters()
  self.lightStar = {};
  self.lightRing = {};
end

function BodyMindHealth:ExtraClose()
  for k, v in pairs(self.lightStar) do
    if v ~= nil then
      v:Stop();
    end
  end

  for k, v in pairs(self.lightRing) do
    if v ~= nil then
      v:Stop();
    end
  end

  table.Clear(self.lightStar);
  table.Clear(self.lightRing);
  self.isLightEnd = true;
end

function BodyMindHealth:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10070, 35, 1, 28, 32, EEffectLightTracer.Stand, me.nowPos.x + 6, me.nowPos.y, 30, true, 50);
    FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10246, 100, 1, 12, 12, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 25, false, 80);
    self.interval = 0.8;
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
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    self.step = 2;
  elseif self.step == 2 then
    if self:CheckInterval() then 
      me:PlaySound(target.colm, target.row, Attack_Start);
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        self.lightStar[i] = EffectLight.New(10022, 33, 1, 12, 12, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 40);
        self.lightStar[i]:SetTimeScale(FightField.timeScale);   
        self.lightStar[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      end
      self.step = 3;
    end
  elseif self.step == 3 then
    if self.lightStar[0] ~= nil then
      if self.lightStar[0].picId == 0 then
        for i = 0, self.emyNum - 1 do
          target = FightField.fightHum[self.emyIdxAy[i]];
          self.lightStar[i] = EffectLight.New(10025, 33, 1, 24, 24, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y - 30, 30, true, 40);
          self.lightStar[i]:SetTimeScale(FightField.timeScale);   
          self.lightStar[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
          self.lightRing[i] = EffectLight.New(10033, 70, 1, 25, 25, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y - 30, 35, true, 50);
          self.lightRing[i]:SetTimeScale(FightField.timeScale);   
          self.lightRing[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        end
        self.step = 4;
      end
    end
  elseif self.step == 4 then
    if self.lightStar[0] ~= nil then
      if self.lightStar[0].picId == 0 then
        self.step = 5;
      end
    end
  elseif self.step == 5 then
    self.isLightEnd =true;
    self.step = 6;
  end
end
