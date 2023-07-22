MagmaBomb = InheritsFromBaseAttackSkill();

function MagmaBomb:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10078, 50, 1, 20, 20, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 20, true, 80);
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
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Ground].orderCount == 13 then
      local newPos = me:GetSpot(EFightSpot.Front, 90);
      if me.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body1, 10529, 30, 1, 12, 12, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y, 40, true, 0, newPos.x - 30, newPos.y - 150, 0.2);
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body2, 10352, 30, 1, 12, 12, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y, 40, true, 80, newPos.x - 30, newPos.y - 150, 0.2);
      else
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body1, 10529, 30, 1, 12, 12, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y, 40, true, 0, newPos.x + 30, newPos.y - 150, 0.2);
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body2, 10352, 30, 1, 12, 12, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y, 40, true, 80, newPos.x + 30, newPos.y - 150, 0.2);
      end
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Body1].orderCount == 3 then
      local newPos = me:GetSpot(EFightSpot.Front, 90);
      me:SetBeh(EFightBeh.Residual);
      if me.party_Kind == EFightParty.Right then
        me:SetWalk(newPos.x + 30, newPos.y - 150, false);
      else
        me:SetWalk(newPos.x - 30, newPos.y - 150, false);
      end
      me.roleController:SetIsJumping(true);
      self.step = 4;
    end
  elseif self.step == 4 then
    if me.arrive then
      me.roleController:SetIsJumping(false);
      me.roleController:OneHandAttack();
      self.interval = 0.3;
      self.step = 5;
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Ground);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10328, 30, 1, 7, 7, EEffectLightTracer.StandAni, me.nowPos.x - 81 + math.random(20), me.nowPos.y - 41 + math.random(80), 50, true, 50);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body1, 10529, 50, 1, 12, 12, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 40, true, 10, target.nowPos.x, target.nowPos.y, 1.2);
      local newPos = me:GetChipPos();
      me:SetJump(newPos.x, newPos.y, false);
      me.roleController:SetIsJumping(true);
      self.step = 6;
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
  elseif self.step == 6 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Body1].isArrive then
      FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Body1);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1 ,10453, 60, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 40, true, 60);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2 ,10530, 30, 1, 20, 20, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 40, true, 100);
      self.step = 7;
    end
  elseif self.step == 7 then
    if me.arrive then
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body2 ,10016, 30, 1, 15, 15, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 20, false, 35);
      me:PlaySound(target.colm, target.row, Attack_Hit);
      self.step = 8;
    end
  elseif self.step == 8 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky2].orderCount == 20 then
      self.isLightEnd = true;
      self.step = 8;
    end
  end
end