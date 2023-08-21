LightThrow = InheritsFromBaseAttackSkill();

function LightThrow:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky ,10840, 50, 1, 10, 10, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 30, true, 20);
    self.interval = 0.4;
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
      local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then
    if self:CheckInterval() then 
      local newPos = target:GetSpot(EFightSpot.Front, 60);
      me:SetBeh(EFightBeh.Residual);
      me:SetSpeed(1.35);
      me:SetWalk(newPos.x, newPos.y, true);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10840, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 30, true, 20, newPos.x, newPos.y, 1.3);
      FightField.attack[self.humIdx].lights[2]:SetResidual(5, 30, 30);
      me:PlaySound(target.colm, target.row, Attack_Start, 1);
      self.step = 3;
    end
  elseif self.step == 3 then
    if me.arrive then
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10841, 200, 1, 5, 5, EEffectLightTracer.StandAni, target.nowPos.x + math.random(30) - 1, target.nowPos.y  + math.random(40) - 1, 30, true, 40);
      FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10841, 300, 1, 5, 5, EEffectLightTracer.StandAni, target.nowPos.x - math.random(30) + 1, target.nowPos.y  - math.random(40) + 1, 30, true, 40);
      FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10841, 400, 1, 5, 5, EEffectLightTracer.StandAni, target.nowPos.x + math.random(30) - 1, target.nowPos.y  + math.random(40) - 1, 30, true, 40);
      me.roleController:FaceTo(target.nowPos);
      me.roleController:SetAnimationForceId(ERolePose.Special);
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3);
      end
      
      self.interval = 0.5;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then     
      FightField.attack[self.humIdx]:SetLightWithOrder(8, EEffectLightDis.Sky ,10373, 50, 1, 12, 12, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 10);

      me:PlaySound(target.colm, target.row, Attack_Start, 2);
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        target.roleController:SetAnimationForceId(ERolePose.Hit);
        me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3);
      end
      self.interval = 0.5;
      self.step = 5;
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
        local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      me:PlaySound(target.colm, target.row, Attack_Start, 3);
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3);
      end
      FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Sky ,10843, 80, 1, 16, 16, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 50);
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky ,10844, 80, 1, 16, 16, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 50);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky ,10845, 80, 1, 2, 10, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 30, true, 50);
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