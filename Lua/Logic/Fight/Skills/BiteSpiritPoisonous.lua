BiteSpiritPoisonous = InheritsFromBaseAttackSkill();

function BiteSpiritPoisonous:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false)
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10077, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 90);
    FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10282, 50, 1, 10, 10, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 30, true, 80);

    self.interval = 0.6;
  
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
      self:TwoStepSkillShow(me, target);
      self.interval = 0.03;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then
      self:ThreeStepSkillShow(me, target);
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[3].isArrive then
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10369, 40, 9, 1, 9, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 90);
      target.roleController:Hit();
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      me.roleController:SetIsJumping(true);
      me:SetJump(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y, false);
      self.interval = 0.6;
      self.step = 5;
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      self.isLightEnd = true
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
    end
  end
end

function BiteSpiritPoisonous:TwoStepSkillShow(me, target)
  if self.showKind == ESkill_Kind.BiteSpiritPoisonous then
    if target.party_Kind == EFightParty.Left then
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10280, 30, 1, 38, 38, EEffectLightTracer.StandAni, me.nowPos.x - 30, me.nowPos.y, 255, true, 0);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10309, 30, 1, 5, 5, EEffectLightTracer.StandAni, me.nowPos.x - 35, me.nowPos.y, 30, true, 190);
    else
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10279, 30, 1, 38, 38, EEffectLightTracer.StandAni, me.nowPos.x + 30, me.nowPos.y, 255, true, 0);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10309, 30, 1, 5, 5, EEffectLightTracer.StandAni, me.nowPos.x - 25, me.nowPos.y+25, 30, true, 190);
    end
  elseif self.showKind == ESkill_Kind.ChikiChiki then
    if target.party_Kind == EFightParty.Left then
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10718, 100, 3, 7, 7, EEffectLightTracer.StandAni, me.nowPos.x - 20, me.nowPos.y - 50, 255, true, 0);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10309, 30, 1, 5, 5, EEffectLightTracer.StandAni, me.nowPos.x - 25, me.nowPos.y+25, 30, true, 190);
    else
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10718, 100, 3, 7, 7, EEffectLightTracer.StandAni, me.nowPos.x + 30, me.nowPos.y - 45, 255, true, 0);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10309, 30, 1, 5, 5, EEffectLightTracer.StandAni, me.nowPos.x + 25, me.nowPos.y + 25, 30, true, 190);
    end
  end
end

function BiteSpiritPoisonous:ThreeStepSkillShow(me, target)
  if self.showKind == ESkill_Kind.BiteSpiritPoisonous then
    if target.party_Kind == EFightParty.Left then
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10280, 30, 1, 38, 38, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y, 255, true, 0, target.nowPos.x, target.nowPos.y, 0.3);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10309, 30, 1, 5, 5, EEffectLightTracer.Line, me.nowPos.x - 35, me.nowPos.y, 30, true, 190, target.nowPos.x, target.nowPos.y, 0.3);
    else
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10279, 30, 1, 38, 38, EEffectLightTracer.Line, me.nowPos.x + 30, me.nowPos.y, 255, true, 0, target.nowPos.x, target.nowPos.y, 0.3);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10309, 30, 1, 5, 5, EEffectLightTracer.Line, me.nowPos.x + 30, me.nowPos.y, 30, true, 190, target.nowPos.x, target.nowPos.y, 0.3);
    end
  elseif self.showKind == ESkill_Kind.ChikiChiki then
    if target.party_Kind == EFightParty.Left then
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10718, 100, 3, 7, 7, EEffectLightTracer.Line, me.nowPos.x - 20, me.nowPos.y - 50, 255, true, 0, target.nowPos.x, target.nowPos.y-45, 0.3);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10309, 30, 1, 5, 5, EEffectLightTracer.Line, me.nowPos.x - 25, me.nowPos.y+25, 30, true, 190, target.nowPos.x, target.nowPos.y, 0.3);
    else
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10718, 100, 3, 7, 7, EEffectLightTracer.Line, me.nowPos.x + 30, me.nowPos.y - 45, 255, true, 0, target.nowPos.x, target.nowPos.y - 45, 0.3);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10309, 30, 1, 5, 5, EEffectLightTracer.Line, me.nowPos.x + 25, me.nowPos.y+ 25, 30, true, 190, target.nowPos.x, target.nowPos.y, 0.3);
    end
  end
end