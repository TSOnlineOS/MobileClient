BaseFreezePunch = InheritsFromBaseAttackSkill();

function BaseFreezePunch:InitExtraParameters()
  self.fLightIDs = {};
end

function BaseFreezePunch:SetLightID(alightIDs)
  local count = math.min(table.Count(alightIDs), 5);
  for i = 1, 5 do 
    self.fLightIDs[i] = 0;
  end
  for i = 1, count do 
    self.fLightIDs[i] = alightIDs[i];
  end
end

function BaseFreezePunch:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = target:GetAttackPos(EFightSpot.Front, 60);
    me:SetBeh(EFightBeh.Residual);
    me.roleController:SetIsJumping(true);
    me:SetSpeed(0.75);
    me:SetJump(newPos.x, newPos.y);
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
    if me.arrive then
      me.roleController:SetIsJumping(false);
      me.roleController:OneHandAttack();
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, self.fLightIDs[1], 80, 1, 9, 9, EEffectLightTracer.StandAni, target.nowPos.x + 30, target.nowPos.y, 20, false, 40);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground, self.fLightIDs[2], 80, 1, 13, 13, EEffectLightTracer.StandAni, target.nowPos.x + 10, target.nowPos.y, 20, false, 120);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body1, self.fLightIDs[2], 80, 1, 13, 13, EEffectLightTracer.StandAni, target.nowPos.x + 10, target.nowPos.y, 20, false, 80);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body2, self.fLightIDs[3], 80, 1, 9, 9, EEffectLightTracer.StandAni, target.nowPos.x + 10, target.nowPos.y, 20, false, 70);
      self.interval = 0.3;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      me.roleController:SetAnimationForceId(ERolePose.Attack);
      me:PlaySound(target.colm, target.row, Attack_Start, 1);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, self.fLightIDs[4], 60, 1, 13, 13, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, false, 80);
      self.interval = 0.06 * 12;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, self.fLightIDs[5], 60, 1, 10, 10, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 20, false, 40);
      me:PlaySound(target.colm, target.row, Attack_Start, 2);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      target.roleController:SetAnimationForceId(ERolePose.Hit);
      self.interval = 0.8;
      self.step = 5;
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      self.isLightEnd = true;
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
  end
end

FreezePunch = InheritsAttack(BaseFreezePunch);

function FreezePunch:InitExtraParameters()
  self.fLightIDs = {};
  self:SetLightID({10415, 10289, 10402, 10012, 10395});
end

LightHand = InheritsAttack(BaseFreezePunch);

function LightHand:InitExtraParameters()
  self.fLightIDs = {};
  self:SetLightID({10830, 10831, 10832, 10833, 10834});
end

SightCaptivity = InheritsAttack(BaseFreezePunch);

function SightCaptivity:InitExtraParameters()
  self.fLightIDs = {};
  self:SetLightID({10927, 10928, 10929, 10930, 10931});
end

--狀態顯示
FreezePunchMe = InheritsFromBaseStatus();

function FreezePunchMe:InitExtraParameters()
  self.stepKind = 0;
  self.tempPos = {};
  self.fLightIDs = {};
  self:SetLightID({10395, 10289});
end

function FreezePunchMe:SetLightID(alightIDs)
  local count = math.min(table.Count(alightIDs), 2);
  for i = 1, 2 do 
    self.fLightIDs[i] = 0;
  end
  for i = 1, count do 
    self.fLightIDs[i] = alightIDs[i];
  end
end

function FreezePunchMe:ExtraClose()
  FightField.fightHum[self.humIdx].roleController:SetAnimationForceId(ERolePose.None);  
  FightField.RestoreFightInfo(self.humIdx, 0);
end

function FreezePunchMe:Update()
  if self.step == 1 then 
    local me = FightField.fightHum[self.humIdx];
    local posX = FightField.chip[me.colm][me.row].x;
    local posY = FightField.chip[me.colm][me.row].y;
    self.tempPos = Vector2.New(posX, posY);
    me.status[self.statusKind]:SetLight(EEffectLightKind.Body1, self.fLightIDs[1], 100, 10, 10, 10, EEffectLightTracer.Stand, posX, posY, 20, true, 40);
    me.status[self.statusKind]:SetLight(EEffectLightKind.Body2, self.fLightIDs[2], 100, 1, 13, 13, EEffectLightTracer.Stand, posX, posY, 20, true, 40);
    me.roleController:SetAnimationForceId(ERolePose.Hit);    
    FightField.StatusBkUPFightInfo(self.humIdx) 
    self.step = 2;              
  end

  self:UpdateSmole();
end

function FreezePunchMe:UpdateSmole()
  if self.interval >= 0 then
    self.interval = self.interval - CGTimer.deltaTime * FightField.timeScale;
  else
    local me = FightField.fightHum[self.humIdx];
    if self.stepKind == 0 then 
      if me.status[self.statusKind].lights[EEffectLightKind.Body2].showPos.y > self.tempPos.y then
        self.stepKind = 1;
      else
        me.status[self.statusKind].lights[EEffectLightKind.Body2].showPos.y = me.status[self.statusKind].lights[EEffectLightKind.Body2].showPos.y + 1;
        me.status[self.statusKind].lights[EEffectLightKind.Body2]:SetPosition();
      end
    else
      if me.status[self.statusKind].lights[EEffectLightKind.Body2].showPos.y < self.tempPos.y - 6 then
        self.stepKind = 0;
      else
        me.status[self.statusKind].lights[EEffectLightKind.Body2].showPos.y = me.status[self.statusKind].lights[EEffectLightKind.Body2].showPos.y - 1;
        me.status[self.statusKind].lights[EEffectLightKind.Body2]:SetPosition();
      end
    end
    self.interval = 0.1;            
  end
end

SightCaptivityMe = InheritsStatus(FreezePunchMe);

function SightCaptivityMe:InitExtraParameters()
  self.stepKind = 0;
  self.tempPos = {};
  self.fLightIDs = {};
  self:SetLightID({10931, 10928});
end