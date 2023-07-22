BombPunch = InheritsFromBaseAttackSkill();

function BombPunch:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky ,10092, 50, 1, 10, 10, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 30, true, 20);
    self.interval = 0.4;
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
      local newPos = target:GetSpot(EFightSpot.Front, 60);
      me:SetBeh(EFightBeh.Residual);
      me:SetSpeed(1.35);
      me:SetWalk(newPos.x, newPos.y, true);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10092, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 30, true, 20, newPos.x, newPos.y, 1.3);
      FightField.attack[self.humIdx].lights[2]:SetResidual(5, 30, 30);
      me:PlaySound(target.colm, target.row, Attack_Start, 1);
      self.step = 3;
    end
  elseif self.step == 3 then
    if me.arrive then
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10407, 200, 1, 5, 5, EEffectLightTracer.StandAni, target.nowPos.x + math.random(30) - 1, target.nowPos.y  + math.random(40) - 1, 30, true, 40);
      FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10407, 300, 1, 5, 5, EEffectLightTracer.StandAni, target.nowPos.x - math.random(30) + 1, target.nowPos.y  - math.random(40) + 1, 30, true, 40);
      FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10407, 400, 1, 5, 5, EEffectLightTracer.StandAni, target.nowPos.x + math.random(30) - 1, target.nowPos.y  + math.random(40) - 1, 30, true, 40);
      me.roleController:FaceTo(target.nowPos);
      me.roleController:SetAnimationForceId(ERolePose.Special);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3);
      self.interval = 0.5;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      target.roleController:SetAnimationForceId(ERolePose.Hit);
      FightField.attack[self.humIdx]:SetLightWithOrder(8, EEffectLightDis.Sky ,10373, 50, 1, 12, 12, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 10);

      me:PlaySound(target.colm, target.row, Attack_Start, 2);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3);
      self.interval = 0.5;
      self.step = 5;
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      me:PlaySound(target.colm, target.row, Attack_Start, 3);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3);
      FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Sky ,10274, 80, 1, 16, 16, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 50);
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky ,10133, 80, 1, 16, 16, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 50);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky ,10283, 80, 1, 2, 10, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 30, true, 50);
      me.roleController:SetAnimationForceId(ERolePose.Jump);
      me:SetSpeed(1.35);
      me:SetJump(me.nowPos.x, FightField.skillOffset.y - 10);
      self.step = 6;
    end
  elseif self.step == 6 then
    if me.arrive then
      me:SetMoment(FightField.chip[me.colm][me.row].x, FightField.skillOffset.y - 10);
      me:SetJump(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y);
      self.step = 7;
    end
  elseif self.step == 7 then
    if me.arrive then
      self.isLightEnd = true;
      self.step = 8;
    end
  end
end