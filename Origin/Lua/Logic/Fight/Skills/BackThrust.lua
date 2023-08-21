BackThrust = InheritsFromBaseAttackSkill();

function BackThrust:InitExtraParameters()
  self.lightCount = 0;
  self.fire = {};
  self.horse = nil;
end

function BackThrust:ExtraClose()  
  if FightField.fightHum[self.humIdx] ~= nil and FightField.fightHum[self.humIdx].roleController ~= nil then 
    FightField.fightHum[self.humIdx].roleController.gameObject:SetActive(true);
  end
  
  if self.horse ~= nil then
    self.horse:Free();
  end

  for k,v in pairs(self.fire) do
    v:Stop();
  end  
  table.Clear(self.fire);
end

function BackThrust:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];


  if me.npcId ~= 41048 then --如果使用者不是轉生趙雲
    self:UpdateOtherNpc();
    return;
  end

  if self.step == 1 then
    self.horse = SkillHorse.NewByCustom(18005, 1, 1, MaxShrink);
    self.horse.attackRole.roleController:FaceTo(target.nowPos);
    local newPos = {};
    if me.party_Kind == EFightParty.Right then
      newPos.x = FightField.chip[target.colm][target.row].x + 250;
      newPos.y = FightField.chip[target.colm][target.row].y + 110;
    else
      newPos.x = FightField.chip[target.colm][target.row].x - 250;
      newPos.y = FightField.chip[target.colm][target.row].y - 160;
    end
  
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
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
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
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    me:SetJump(newPos.x, newPos.y, false);
    me.roleController:SetIsJumping(true);
    self.step = 2;
  elseif self.step == 2 then
    if me.arrive then
      me.roleController:SetIsJumping(false);
      me.roleController.gameObject:SetActive(false);

      me:PlaySound(target.colm, target.row, Attack_Start);
      if me.party_Kind == EFightParty.Right then
        self.horse:SetPositionWithPose(ERolePose.Attack, me.nowPos.x - 10, me.nowPos.y + 15, me.nowPos.x - 15, me.nowPos.y + 15);
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10564, 80, 1, 2, 2, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 255, true, 30);
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Ground, 10559, 50, 1, 12, 12, EEffectLightTracer.Stand, me.nowPos.x + 3, me.nowPos.y + 65, 255, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground, 10561, 60, 1, 12, 12, EEffectLightTracer.Stand, me.nowPos.x + 5, me.nowPos.y + 90, 30, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10561, 70, 1, 12, 12, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y + 90, 20, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Ground, 10561, 90, 1, 12, 12, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y + 90, 10, false, 0);
      else
        self.horse:SetPositionWithPose(ERolePose.Attack, me.nowPos.x, me.nowPos.y + 20, me.nowPos.x, me.nowPos.y);
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10565, 80, 1, 2, 2, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 255, true, 25);
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Ground, 10560, 50, 1, 12, 12, EEffectLightTracer.Stand, me.nowPos.x + 5, me.nowPos.y + 65, 255, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground, 10562, 60, 1, 12, 12, EEffectLightTracer.Stand, me.nowPos.x + 5, me.nowPos.y + 90, 30, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10562, 70, 1, 12, 12, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y + 90, 20, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Ground, 10562, 90, 1, 12, 12, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y + 90, 10, false, 0);
      end

      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Ground, 10327, 30, 1, 7, 7, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 30, false, 60);
      FightField.isShake = true;
      self.interval = 0.2;
      self.step = 3;
    end
  elseif self.step == 3 then
    self:GetPosition();
    if self:CheckInterval() then 
      FightField.SetShake(false);
      self.interval = 0.6;
      self.step = 4;
    end
  elseif self.step == 4 then
    self:GetPosition();
    if self:CheckInterval() then 
      local newPos = {};
      me:SetSpeed(0.48);
      if me.party_Kind == EFightParty.Right then
        newPos.x = FightField.chip[target.colm][target.row].x + 30;
        newPos.y = FightField.chip[target.colm][target.row].y + 30;

        self.horse:SetPosition(1, me.nowPos.x + 20, me.nowPos.y, newPos.x, newPos.y);
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10564, 80, 1, 2, 2, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 255, true, 30, newPos.x, newPos.y, 0.48);
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Ground, 10567, 40, 1, 9, 9, EEffectLightTracer.Line, me.nowPos.x + 5, me.nowPos.y + 30, 30, true, 0, newPos.x + 5, newPos.y + 30, 0.48);
      else
        newPos.x = FightField.chip[target.colm][target.row].x - 88;
        newPos.y = FightField.chip[target.colm][target.row].y - 45;

        self.horse:SetPosition(5, me.nowPos.x + 20, me.nowPos.y, newPos.x, newPos.y);
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10565, 80, 1, 2, 2, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 255, true, 30, newPos.x, newPos.y, 0.48);
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Ground, 10568, 40, 1, 9, 9, EEffectLightTracer.Line, me.nowPos.x + 5, me.nowPos.y + 30, 30, true, 0, newPos.x + 5, newPos.y + 30, 0.48);
      end
      me:SetWalk(newPos.x, newPos.y, false);
      self.step = 5;
    end
  elseif self.step == 5 then
    self:GetPosition();
    if me.arrive then
      me:PlaySound(target.colm, target.row, Attack_Hit);
      FightField.attack[self.humIdx]:StopLight(2);
      FightField.attack[self.humIdx]:StopLight(3);
      FightField.attack[self.humIdx]:StopLight(4);
      FightField.attack[self.humIdx]:StopLight(5);
      local newPos = {};
      if me.party_Kind == EFightParty.Right then
        newPos.x = FightField.chip[target.colm][target.row].x - 230;
        newPos.y = FightField.chip[target.colm][target.row].y - 90;
        me:SetWalk(newPos.x, newPos.y, false);
        self.horse:SetPosition(1, me.nowPos.x, me.nowPos.y, newPos.x, newPos.y);
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10564, 80, 1, 2, 2, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 255, true, 30, newPos.x, newPos.y, 0.48);
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Ground, 10567, 40, 1, 9, 9, EEffectLightTracer.Line, me.nowPos.x + 5, me.nowPos.y + 30, 30, true, 0, newPos.x + 5, newPos.y + 30, 0.48);
      else
        newPos.x = FightField.chip[target.colm][target.row].x + 230;
        newPos.y = FightField.chip[target.colm][target.row].y + 90;
        me:SetWalk(newPos.x, newPos.y, false);
        self.horse:SetPosition(5, me.nowPos.x, me.nowPos.y, newPos.x, newPos.y);
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10565, 80, 1, 2, 2, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 255, true, 30, newPos.x, newPos.y, 0.48);
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Ground, 10568, 40, 1, 9, 9, EEffectLightTracer.Line, me.nowPos.x + 5, me.nowPos.y + 30, 30, true, 0, newPos.x + 5, newPos.y + 30, 0.48);
      end
      self.step = 6;
    end
  elseif self.step == 6 then
    self:UpdateFire();
    self:GetPosition();
    self.lightCount = self.lightCount + 1;
    self.interval = 0.1;
    self.step = 7;
   elseif self.step == 7 or self.step == 8 then
    self:GetPosition();
    if self:CheckInterval() then 
      self:UpdateFire();
      self:GetPosition();
      self.lightCount = self.lightCount + 1;
      self.step = self.step + 1;
    end
  elseif self.step == 9 then
    self:GetPosition();
    if me.arrive then
      target:SetBeh(EFightBeh.Rotate);
      FightField.isShake = true;
      local newPos;
      if not target:IsInSealStatus() then
        newPos = target:GetSpot(EFightSpot.Back, math.random(80) + 79);
        target:SetJump(newPos.x, newPos.y, true); 
      end
      self.interval = 0.1;
      self.step = 10;
    end
  elseif self.step == 10 then
    if self:CheckInterval() then 
      FightField.SetShake(false);
      self.step = 11;
    end
  elseif self.step == 10 then
    if target.arrive then
      target:SetBeh(EFightBeh.None);
      self.interval = 0.1;
      self.step = 12;
    end
  elseif self.step == 12 then
    if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 13;
    end
  end
end

function BackThrust:UpdateOtherNpc()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = target:GetAttackPos(EFightSpot.Front, 60);
    me:SetJump(newPos.x, newPos.y, false);
    me.roleController:SetIsJumping(true);
    me:SetSpeed(0.72);
    self.step = 2;
  elseif Contains(self.step, 2, 3, 4) then
    if me.arrive then
      me.roleController.animationFrame = 0;
      me.roleController:FaceTo(target.nowPos);
      me.roleController:SetAnimationForceId(ERolePose.Special);
      self:UpdateFire();
      self.interval = 0.1;
      self.lightCount = self.lightCount + 1;
      self.step = self.step + 1;
    end
  elseif self.step == 5 then
    target:SetBeh(EFightBeh.Rotate);
    FightField.isShake = true;
    local newPos;
    if not target:IsInSealStatus() then
      newPos = target:GetSpot(EFightSpot.Back, math.random(80) + 79);
      target:SetJump(newPos.x, newPos.y, true); 
    end
    self.interval = 0.1;
    self.step = 6;
  elseif self.step == 6 then
    if self:CheckInterval() then 
      FightField.SetShake(false);
      self.step = 7;
    end
  elseif self.step == 7 then
    if target.arrive then
      target:SetBeh(EFightBeh.None);
      self.interval = 0.1;
      self.step = 8;
    end
  elseif self.step == 8 then
    if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 8;
    end
  end
end

function BackThrust:UpdateFire()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local x, y, speed;
  local total = 4;
  if FightField.attack[self.humIdx].lights[9] == nil or FightField.attack[self.humIdx].lights[9].picId == 0 then
    x = target.nowPos.x + math.random(40) - 41;
    y = target.nowPos.y + 20 * self.lightCount + math.random(40) - 26;
    speed = 140;

    self.fire[self.lightCount * total + 1] = EffectLight.New(10330, speed, 1, 5, 5, EEffectLightTracer.StandAni, x, y, 25, false, 30);
    if me.party_Kind == EFightParty.Right then
      self.fire[self.lightCount * total + 2] = EffectLight.New(10319, speed, 1, 4, 4, EEffectLightTracer.StandAni, x, y, 15, false, 30);
    else
      self.fire[self.lightCount * total + 2] = EffectLight.New(10318, speed, 1, 4, 4, EEffectLightTracer.StandAni, x, y, 15, false, 30);
    end
    self.fire[self.lightCount * total + 3] = EffectLight.New(10326, speed, 1, 8, 8, EEffectLightTracer.StandAni, x, y, 25, false, 20);
    self.fire[self.lightCount * total + 4] = EffectLight.New(10438, speed, 1, 7, 7, EEffectLightTracer.StandAni, x, y, 25, false, 60);

    self.fire[self.lightCount * total + 1]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
    self.fire[self.lightCount * total + 2]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
    self.fire[self.lightCount * total + 3]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
    self.fire[self.lightCount * total + 4]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);

    self.fire[self.lightCount * total + 1]:SetTimeScale(FightField.timeScale);   
    self.fire[self.lightCount * total + 2]:SetTimeScale(FightField.timeScale);   
    self.fire[self.lightCount * total + 3]:SetTimeScale(FightField.timeScale);   
    self.fire[self.lightCount * total + 4]:SetTimeScale(FightField.timeScale);   
    
    me:PlayEffect(target.colm, target.row);
  end
end

function BackThrust:GetPosition()
  local me = FightField.fightHum[self.humIdx];
  if me.party_Kind == EFightParty.Right then
    self.horse.attackRole.nowPos.x = me.nowPos.x + 10;
    self.horse.attackRole.nowPos.y = me.nowPos.y + 10;
  else
    self.horse.attackRole.nowPos.x = me.nowPos.x - 10;
    self.horse.attackRole.nowPos.y = me.nowPos.y;
  end

  self.horse:GetPosition();
  self.horse:Update();
end