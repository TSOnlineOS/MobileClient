StormFlashingBall = InheritsFromBaseAttackSkill();

function StormFlashingBall:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10077, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 90);
    FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10137, 50, 1, 15, 15, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 30, true, 60);
    self.interval = 0.6;
    self.step = 2;
    --1--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local code = DemoCode.GetBitxor(20);
      code = code * 10;
    end
    ---2--------------------------------------------------------------
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
      --local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then
    if self:CheckInterval() then 
      me:PlaySound(target.colm, target.row, Attack_Start);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10049, 80, 1, 3, 3, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y, 30, true, 0, target.nowPos.x, target.nowPos.y, 0.66);
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[3].isArrive then
      me:PlaySound(target.colm, target.row, Attack_Hit);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Ground, 10346, 50, 1, 17, 17, EEffectLightTracer.StandAni, target.nowPos.x + 10, target.nowPos.y, 30, false, 65);
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10417, 100, 1, 8, 8, EEffectLightTracer.StandAni, target.nowPos.x + 5, target.nowPos.y, 30, false, 10);
      target.roleController:SetAnimationForceId(ERolePose.Hit);
      self.interval = 0.5;
      self.step = 4;
      --1--------------------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        local code = DemoCode.GetBitxor(20);
        code = code * 10;
      end
      ---2--------------------------------------------------------------
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
        --local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      FightField.isShake = true;
      FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10019, 80, 1, 15, 15, EEffectLightTracer.Stand, target.nowPos.x - 5, target.nowPos.y, 30, true, 50);
      FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10414, 100, 1, 9, 9, EEffectLightTracer.StandAni, target.nowPos.x + 25, target.nowPos.y, 30, false, 60);
      target.roleController:SetAnimationForceId(ERolePose.Hit);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      self.interval = 0.8;
      self.step = 5;
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 6;
    end
  end
end