FlyWheel = InheritsFromBaseAttackSkill();

function FlyWheel:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground, 10909, 50, 1, 20, 20, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 20, true, 80);
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
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Ground].orderCount == 13 then
      local newPos = me:GetSpot(EFightSpot.Front, 90);
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body1, 10910, 30, 1, 12, 12, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y, 40, true, 0, newPos.x - 30, newPos.y - 150, 0.2);
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body2, 10911, 30, 1, 12, 12, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y, 40, false, 80, newPos.x - 30, newPos.y - 130, 0.2);
      else
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body1, 10910, 30, 1, 12, 12, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y, 40, true, 0, newPos.x + 30, newPos.y - 150, 0.2);
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body2, 10911, 30, 1, 12, 12, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y, 40, false, 80, newPos.x + 30, newPos.y - 130, 0.2);
      end
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Body1].orderCount == 3 then
      local newPos = me:GetSpot(EFightSpot.Front, 90);
      me:SetBeh(EFightBeh.Residual);
      me.roleController:SetAnimationForceId(ERolePose.None);
      me.roleController:SetIsJumping(true);
      if me.party_Kind == EFightParty.Right then
        me:SetWalk(newPos.x + 30, newPos.y - 150, false);
      else
        me:SetWalk(newPos.x + 30, newPos.y - 150, false);
      end
      self.step = 4;
    end
  elseif self.step == 4 then
    if me.arrive then
      me.roleController:SetIsJumping(false);
      me.roleController:SetAnimationForceId(ERolePose.Attack);
      self.interval = 0.3;
      self.step = 5;
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      local newPos;
      
      FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Ground);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10912, 30, 1, 7, 7, EEffectLightTracer.StandAni, me.nowPos.x + math.random(0, 19) - 40, me.nowPos.y + math.random(0, 79) - 40, 50, true, 50);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body1, 10910, 50, 1, 12, 12, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 40, true, 10, target.nowPos.x, target.nowPos.y, 1.2);
      
      newPos = me:GetChipPos();
      me:SetJump(newPos.x, newPos.y, false);
      me.roleController:SetAnimationForceId(ERolePose.None);
      me.roleController:SetIsJumping(true);

      self.step = 6;
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
  elseif self.step == 6 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Body1].orderCount == 3 then
      FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Ground);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10913, 60, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 40, true, 60);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10914, 30, 1, 20, 20, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 40, true, 100);
      self.step = 7;
    end
  elseif self.step == 7 then
    if me.arrive then
      me.roleController:SetIsJumping(false);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body2, 10915, 30, 1, 15, 15, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 20, false, 55);
      me:PlaySound(target.colm, target.row, Attack_Hit);
      self.step = 8;
    end
  elseif self.step == 8 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky2].orderCount == 20 then
      self.isLightEnd = true;
      self.step = 9;
    end
  end
end