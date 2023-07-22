KnightStrike = InheritsFromBaseAttackSkill();

function KnightStrike:InitExtraParameters()
  self.lightCount = 0;
  self.isSetIce = false;
end


function KnightStrike:ExtraClose()  
  if FightField.fightHum[self.humIdx] ~= nil and FightField.fightHum[self.humIdx].roleController ~= nil then 
    FightField.fightHum[self.humIdx].roleController.gameObject:SetActive(true);
  end

  if self.horse ~= nil then
    self.horse:Free();
  end
end

function KnightStrike:UpdateStep1to5()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    self.horse = SkillHorse.NewByCustom(18020, 3, 1, MaxShrink);
    self.horse.attackRole.roleController:FaceTo(target.nowPos);
    local newPos = {};
    if me.party_Kind == EFightParty.Right then
      newPos.x = FightField.chip[target.colm][target.row].x + 250;
      newPos.y = FightField.chip[target.colm][target.row].y + 110;
    else
      newPos.x = FightField.chip[target.colm][target.row].x - 250;
      newPos.y = FightField.chip[target.colm][target.row].y - 160;
    end
    
    me:SetJump(newPos.x, newPos.y, false);
    me.roleController:SetIsJumping(true);
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
    if me.arrive then
      me.roleController:SetIsJumping(false);
      if me.roleController:GetAnimationFrame(ERolePose.Riding) > 0 then
        me.roleController:SetAnimationForceId(ERolePose.Riding);
      else
        FightField.fightHum[self.humIdx].roleController.gameObject:SetActive(false);
      end

      me:PlaySound(target.colm, target.row, Attack_Start);
      if me.party_Kind == EFightParty.Right then
        self.horse:SetPositionWithPose(ERolePose.Attack, me.nowPos.x - 10, me.nowPos.y + 15, me.nowPos.x - 15, me.nowPos.y + 15);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Ground, 10532, 50, 1, 12, 12, EEffectLightTracer.Stand, me.nowPos.x + 3, me.nowPos.y + 65, 255, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10534, 60, 1, 12, 12, EEffectLightTracer.Stand, me.nowPos.x + 5, me.nowPos.y + 90, 30, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground, 10534, 70, 1, 12, 12, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y + 90, 20, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10534, 90, 1, 12, 12, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y + 90, 10, false, 0);
      else
        self.horse:SetPositionWithPose(ERolePose.Attack, me.nowPos.x, me.nowPos.y + 20, me.nowPos.x, me.nowPos.y);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Ground, 10533, 50, 1, 12, 12, EEffectLightTracer.Stand, me.nowPos.x + 5, me.nowPos.y + 65, 255, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10535, 60, 1, 12, 12, EEffectLightTracer.Stand, me.nowPos.x + 5, me.nowPos.y + 90, 30, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground, 10535, 70, 1, 12, 12, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y + 90, 20, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10535, 90, 1, 12, 12, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y + 90, 10, false, 0);
      end

      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Ground, 10327, 30, 1, 7, 7, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 30, false, 60);
      FightField.isShake = true;
      self.horse.attackRole:SetPosition();
      self.horse.attackRole:Update();
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
        self.horse:SetPositionWithPose(ERolePose.Walk, me.nowPos.x + 20, me.nowPos.y, newPos.x, newPos.y);        
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10534, 30, 1, 12, 12, EEffectLightTracer.Line, me.nowPos.x + 5, me.nowPos.y + 65, 30, true, 10, newPos.x + 5, newPos.y + 90, 0.48);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10532, 30, 1, 12, 12, EEffectLightTracer.Line, me.nowPos.x + 5, me.nowPos.y + 65,  255, true, 0, newPos.x + 5, newPos.y + 65, 0.48);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Ground, 10532, 40, 1, 12, 12, EEffectLightTracer.Line, me.nowPos.x + 5, me.nowPos.y + 65,  255, true, 0, newPos.x + 5, newPos.y + 65, 0.48);
      else
        newPos.x = FightField.chip[target.colm][target.row].x - 88;
        newPos.y = FightField.chip[target.colm][target.row].y - 45;
        self.horse:SetPositionWithPose(ERolePose.Walk, me.nowPos.x + 20, me.nowPos.y, newPos.x, newPos.y);        
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10535, 30, 1, 12, 12, EEffectLightTracer.Line, me.nowPos.x + 5, me.nowPos.y + 65, 30, true, 10, newPos.x + 5, newPos.y + 90, 0.48);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10533, 30, 1, 12, 12, EEffectLightTracer.Line, me.nowPos.x + 5, me.nowPos.y + 65,  255, true, 0, newPos.x + 5, newPos.y + 65, 0.48);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Ground, 10533, 40, 1, 12, 12, EEffectLightTracer.Line, me.nowPos.x + 5, me.nowPos.y + 65,  255, true, 0, newPos.x + 5, newPos.y + 65, 0.48);
      end
      me:SetWalk(newPos.x, newPos.y, false);
      self.step = 5;
    end
  elseif self.step == 5 then
    self:GetPosition();
    if me.arrive then
      me:PlaySound(target.colm, target.row, Attack_Hit);
      local newPos = {};
      if me.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Sky, 10432, 30, 1, 5, 5, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 0);
        newPos.x = FightField.chip[target.colm][target.row].x - 230;
        newPos.y = FightField.chip[target.colm][target.row].y - 90;
        me:SetWalk(newPos.x, newPos.y, false);
        self.horse:SetPosition(1, me.nowPos.x, me.nowPos.y, newPos.x, newPos.y);
        self.horse.attackRole.roleController:FaceTo(newPos);
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10534, 83, 1, 12, 12, EEffectLightTracer.Line, me.nowPos.x + 5, me.nowPos.y + 65, 30, true, 30, newPos.x + 5, newPos.y + 90, 0.48);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Ground, 10532, 30, 1, 12, 12, EEffectLightTracer.Line, me.nowPos.x + 5, me.nowPos.y + 65, 255, true, 0, newPos.x + 5, newPos.y + 65, 0.48);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Sky, 10433, 30, 1, 5, 5, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 0);
        newPos.x = FightField.chip[target.colm][target.row].x + 230;
        newPos.y = FightField.chip[target.colm][target.row].y + 90;
        me:SetWalk(newPos.x, newPos.y, false);
        self.horse:SetPosition(1, me.nowPos.x, me.nowPos.y, newPos.x, newPos.y);
        self.horse.attackRole.roleController:FaceTo(newPos);
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10535, 83, 1, 12, 12, EEffectLightTracer.Line, me.nowPos.x + 5, me.nowPos.y + 65, 30, true, 30, newPos.x + 5, newPos.y + 90, 0.48);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Ground, 10533, 30, 1, 12, 12, EEffectLightTracer.Line, me.nowPos.x + 5, me.nowPos.y + 65, 255, true, 0, newPos.x + 5, newPos.y + 65, 0.48);
      end
      FightField.attack[self.humIdx]:SetLightWithOrder(8, EEffectLightDis.Sky, 10123, 30, 9, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 50, true, 130);
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
  end
end


function KnightStrike:Update()
  local me = FightField.fightHum[self.humIdx];
  self:UpdateStep1to5();
  if self.step == 6 then
    self:UpdateIceFire();
    self:GetPosition();
    if me.arrive then
      self.step = 7;
    end
  elseif self.step == 7 then
    self.isLightEnd = true;
    self.step = 8;
  end
end

function KnightStrike:UpdateIceFire()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if not self.isSetIce == false then
    if FightField.attack[self.humIdx].lights[9] == nil or FightField.attack[self.humIdx].lights[9].picId == 0 then
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10409, 60, 3, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 10);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10409, 60, 3, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 10);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10409, 60, 3, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 10);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      self.isSetIce = true;
    end
  end
end

function KnightStrike:GetPosition()
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

EW_KnightStrike = InheritsAttack(KnightStrike)


function EW_KnightStrike:InitDrawBlack()
  self.needDrawBlack = true;   
end

function EW_KnightStrike:Update()
  local me = FightField.fightHum[self.humIdx];
  self:UpdateStep1to5();
  if self.step == 6 then
    self:UpdateEWIceFire();
    self:GetPosition();
    if me.arrive then
      self.step = 7;
      self.interval = 0.5;
    end
  elseif self.step == 7 then    
    if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 8;
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
  end
end

function EW_KnightStrike:UpdateEWIceFire()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self.isSetIce == false then          
    if FightField.attack[self.humIdx].lights[9] == nil or FightField.attack[self.humIdx].lights[9].picId == 0 then
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10409, 60, 3, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 10);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10409, 60, 3, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 10);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10409, 60, 3, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 10);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      local posX = FightField.chip[target.colm][target.row].x;
      local posY = FightField.chip[target.colm][target.row].y;
      FightField.attack[self.humIdx]:SetLightWithOrder(10, EEffectLightKind.Body1, 10309, 150, 1, 5, 5, EEffectLightTracer.Stand, posX, posY, 30, true, 210);      
      self.isSetIce = true;
    end
  end
end