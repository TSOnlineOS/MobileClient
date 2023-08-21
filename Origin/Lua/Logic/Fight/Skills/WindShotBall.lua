WindShotBall = InheritsFromBaseAttackSkill();

function WindShotBall:Update()
  local me = FightField.fightHum[self.humIdx];

  if self.step == 1 then
    local  newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10077, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 90);
    self.interval = 0.5;
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
      local effectSlot = 0;
      for i = 0, self.emyNum - 1 do 
        local target = FightField.fightHum[self.emyIdxAy[i]];
        effectSlot = i * 3 + 2;
        if target ~= nil then     
          if target.party_Kind == EFightParty.Left then
            FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot, EEffectLightDis.Sky, 10270, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - 60, me.nowPos.y - 10, 35, true, 0, target.nowPos.x, target.nowPos.y + 60, 0.66);
            FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot + 1, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - 40, me.nowPos.y - 30, 35, true, 0, target.nowPos.x, target.nowPos.y + 20, 0.66);  
            FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot + 2, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y - 10, 35, true, 0, target.nowPos.x, target.nowPos.y + 10, 0.66);  
          else
            FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot, EEffectLightDis.Sky, 10270, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x + 60, me.nowPos.y + 10, 35, true, 0, target.nowPos.x, target.nowPos.y + 60, 0.66);
            FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot + 1, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x + 40, me.nowPos.y + 30, 35, true, 0, target.nowPos.x, target.nowPos.y + 20, 0.66);  
            FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot + 2, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x + 30, me.nowPos.y + 10, 35, true, 0, target.nowPos.x, target.nowPos.y + 10, 0.66); 
          end
          
          FightField.attack[self.humIdx].lights[effectSlot]:SetRotate(0, 30, 40, 10);
          FightField.attack[self.humIdx].lights[effectSlot + 1]:SetRotate(90, 40, 40, 40);
          FightField.attack[self.humIdx].lights[effectSlot + 2]:SetRotate(180, 50, 40, 30);
          me:PlaySound(target.colm, target.row, Attack_Start, 1);          
        end
      end      
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[2].isArrive then
      local effectSlot = 0;
      for i = 0, self.emyNum - 1 do 
        local target = FightField.fightHum[self.emyIdxAy[i]];
        FightField.attack[self.humIdx]:SetLightWithOrder(11 + i, EEffectLightDis.Body, 10000, 50, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x + 5, target.nowPos.y, 20, true, 30);
        me:PlaySound(target.colm, target.row, Attack_Start, 2);
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);

        if not target:IsInSealStatus() then
          local newPos  = target:GetSpot(EFightSpot.Back, math.random(0, 60) + 30);
          target:SetJump(newPos.x, newPos.y, true);
        end
        effectSlot = i * 3 + 2;
        if target.party_Kind == EFightParty.Left then
          FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot, EEffectLightDis.Sky, 10270, 30, 1, 10, 10, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x + math.random(0, 500), target.nowPos.y - math.random(0, 300), 0.66);
          FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot+1, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x + math.random(0, 500), target.nowPos.y + math.random(0, 300), 0.66);
          FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot+2, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x + math.random(0, 500), target.nowPos.y - math.random(0, 300), 0.66);
        else
          FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot, EEffectLightDis.Sky, 10270, 30, 1, 10, 10, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x - math.random(0, 500), target.nowPos.y - math.random(0, 300), 0.66);
          FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot+1, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x - math.random(0, 500), target.nowPos.y + math.random(0, 300), 0.66);
          FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot+2, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x - math.random(0, 500), target.nowPos.y - math.random(0, 300), 0.66);
        end
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
    for i = 0, self.emyNum - 1 do 
      local target = FightField.fightHum[self.emyIdxAy[i]];
      if target.arrive then
        target.roleController:SetIsDead(true);
        self.interval = 0.8;
        self.step = 5;
      end
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 6;
    end
  end
end