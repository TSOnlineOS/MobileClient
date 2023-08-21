MagicalShield = InheritsFromBaseAttackSkill();

function MagicalShield:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    if target.party_Kind == EFightParty.Left then
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10537, 30, 1, 12, 20, EEffectLightTracer.Line, me.nowPos.x + 30, me.nowPos.y + 30, 255, true, 0, me.nowPos.x + 30, me.nowPos.y - 200, 0.66);
    else
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10536, 30, 1, 12, 20, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y + 30, 255, true, 0, me.nowPos.x - 30, me.nowPos.y - 200, 0.662);
    end
    
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
    if FightField.attack[self.humIdx].lights[3].isArrive then
      if me.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10537, 30, 1, 12, 20, EEffectLightTracer.Curve, me.nowPos.x + 35, me.nowPos.y - 200, 255, true, 0, target.nowPos.x + 35, target.nowPos.y + 100, 0.66);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10536, 30, 1, 12, 20, EEffectLightTracer.Curve, me.nowPos.x - 30, me.nowPos.y - 200, 255, true, 0, target.nowPos.x - 35, target.nowPos.y + 80, 0.66);
      end

      self.step = 3; 
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[3].isArrive then
      if me.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Body, 10537, 30, 12, 12, 20, EEffectLightTracer.Stand, target.nowPos.x + 35, target.nowPos.y + 120, 255, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10327, 30, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x + 35, target.nowPos.y + 50, 20, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Body, 10016, 30, 1, 15, 15, EEffectLightTracer.StandAni, target.nowPos.x + 35, target.nowPos.y + 100, 25, false, 0);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Body, 10536, 30, 12, 12, 20, EEffectLightTracer.Stand, target.nowPos.x - 35, target.nowPos.y + 100, 255, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10327, 30, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x - 30, target.nowPos.y + 30, 20, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Body, 10016, 30, 1, 15, 15, EEffectLightTracer.StandAni, target.nowPos.x - 35, target.nowPos.y + 50, 25, false, 0);
      end

      self.interval = 1;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then
      self.isLightEnd = true;
      self.step = 5;
    end
  end
end

GroupImmunityShield = InheritsFromBaseAttackSkill();

function GroupImmunityShield:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    if target.party_Kind == EFightParty.Left then
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10537, 30, 1, 12, 20, EEffectLightTracer.Line, me.nowPos.x + 30, me.nowPos.y + 30, 255, true, 0, me.nowPos.x + 30, me.nowPos.y - 200, 0.66);
    else
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10536, 30, 1, 12, 20, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y + 30, 255, true, 0, me.nowPos.x - 30, me.nowPos.y - 200, 0.662);
    end

    self.step = 2;
  elseif self.step == 2 then
    if FightField.attack[self.humIdx].lights[1].isArrive then
      for i = 0, self.emyNum-1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        if me.party_Kind == EFightParty.Left then
          FightField.attack[self.humIdx]:SetLightWithOrder(1 + i, EEffectLightDis.Sky, 10537, 30, 1, 12, 20, EEffectLightTracer.Curve, me.nowPos.x + 35, me.nowPos.y - 200, 255, true, 0, target.nowPos.x + 35, target.nowPos.y + 100, 0.66);
        else
          FightField.attack[self.humIdx]:SetLightWithOrder(1 + i, EEffectLightDis.Sky, 10536, 30, 1, 12, 20, EEffectLightTracer.Curve, me.nowPos.x - 30, me.nowPos.y - 200, 255, true, 0, target.nowPos.x - 35, target.nowPos.y + 80, 0.66);
        end
      end

      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[1].isArrive then
      for i = 0, self.emyNum-1 do
        local n = self.emyNum;
        target = FightField.fightHum[self.emyIdxAy[i]];
        if me.party_Kind == EFightParty.Left then
          FightField.attack[self.humIdx]:SetLightWithOrder(1 + i, EEffectLightDis.Body, 10537, 30, 12, 12, 20, EEffectLightTracer.Stand, target.nowPos.x + 35, target.nowPos.y + 120, 255, false, 0);
          FightField.attack[self.humIdx]:SetLightWithOrder(1 + n + i, EEffectLightDis.Body, 10327, 30, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x + 35, target.nowPos.y + 50, 20, false, 0);
          FightField.attack[self.humIdx]:SetLightWithOrder(1+ (2*n) + i, EEffectLightDis.Body, 10016, 30, 1, 15, 15, EEffectLightTracer.StandAni, target.nowPos.x + 35, target.nowPos.y + 100, 25, false, 0);
        else
          FightField.attack[self.humIdx]:SetLightWithOrder(1 + i, EEffectLightDis.Body, 10536, 30, 12, 12, 20, EEffectLightTracer.Stand, target.nowPos.x - 35, target.nowPos.y + 100, 255, false, 0);
          FightField.attack[self.humIdx]:SetLightWithOrder(1 + n + i, EEffectLightDis.Body, 10327, 30, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x - 30, target.nowPos.y + 30, 20, false, 0);
          FightField.attack[self.humIdx]:SetLightWithOrder(1+ (2*n) + i, EEffectLightDis.Body, 10016, 30, 1, 15, 15, EEffectLightTracer.StandAni, target.nowPos.x - 35, target.nowPos.y + 50, 25, false, 0);
        end
      end
      self.interval = 1;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then
      self.isLightEnd = true;
      self.step = 5;
    end
  end
end

--狀態顯示
MagicalShieldMe = InheritsFromBaseStatus();

function MagicalShieldMe:ExtraClose()  
  FightField.RestoreFightInfo(self.humIdx,0);
end

function MagicalShieldMe:Update()  
  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then 
    me:SetStatusKind(self.statusKind, EStatus.WarStep);    
    if me.party_Kind == EFightParty.Left then
      me:GetStatus(self.statusKind):SetLight(EEffectLightKind.Sky1, 10537, 30, 12, 12, 20, EEffectLightTracer.Stand, me.nowPos.x + 35, me.nowPos.y + 120, 255, false, 0);
    else
      me:GetStatus(self.statusKind):SetLight(EEffectLightKind.Ground, 10536, 30, 12, 12, 20, EEffectLightTracer.Stand, me.nowPos.x - 35, me.nowPos.y + 100, 255, false, 0);
    end
    self.step = 2;
  end
end