WindPressureBall = InheritsFromBaseAttackSkill();

function WindPressureBall:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local  newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10077, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 90);
    self.interval = 0.5;
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
    self.step = 2;
  elseif self.step == 2 then
    if self:CheckInterval() then 
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10270, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - 60, me.nowPos.y - 10, 35, true, 0, target.nowPos.x, target.nowPos.y + 60, 0.66);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - 40, me.nowPos.y - 30, 35, true, 0, target.nowPos.x, target.nowPos.y + 20, 0.66);  
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y - 10, 35, true, 0, target.nowPos.x, target.nowPos.y + 10, 0.66);  
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10270, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x + 60, me.nowPos.y + 10, 35, true, 0, target.nowPos.x, target.nowPos.y + 60, 0.66);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x + 40, me.nowPos.y + 30, 35, true, 0, target.nowPos.x, target.nowPos.y + 20, 0.66);  
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x + 30, me.nowPos.y + 10, 35, true, 0, target.nowPos.x, target.nowPos.y + 10, 0.66); 
      end
      
      FightField.attack[self.humIdx].lights[2]:SetRotate(0, 30, 40, 10);
      FightField.attack[self.humIdx].lights[3]:SetRotate(90, 40, 40, 40);
      FightField.attack[self.humIdx].lights[4]:SetRotate(180, 50, 40, 30);
      me:PlaySound(target.colm, target.row, Attack_Start, 1);
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[2].isArrive then
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Body, 10000, 50, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x + 5, target.nowPos.y, 20, true, 30);
      me:PlaySound(target.colm, target.row, Attack_Start, 2);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);

      if not target:IsInSealStatus() then
        local newPos  = target:GetSpot(EFightSpot.Back, math.random(0, 60) + 30);
        target:SetJump(newPos.x, newPos.y, true);
      end

      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10270, 30, 1, 10, 10, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x + math.random(0, 500), target.nowPos.y - math.random(0, 300), 0.66);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x + math.random(0, 500), target.nowPos.y + math.random(0, 300), 0.66);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x + math.random(0, 500), target.nowPos.y - math.random(0, 300), 0.66);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10270, 30, 1, 10, 10, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x - math.random(0, 500), target.nowPos.y - math.random(0, 300), 0.66);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x - math.random(0, 500), target.nowPos.y + math.random(0, 300), 0.66);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x - math.random(0, 500), target.nowPos.y - math.random(0, 300), 0.66);
      end

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
        local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  elseif self.step == 4 then
    if target.arrive then
      target.roleController:SetIsDead(true);
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