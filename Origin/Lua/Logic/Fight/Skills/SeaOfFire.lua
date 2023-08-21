SeaOfFire = InheritsFromBaseAttackSkill();

function SeaOfFire:InitExtraParameters()
  self.totalDist = 0;
  self.curDist = 0;
  self.poseInterval = 0.3;
end

function SeaOfFire:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    if target.party_Kind == EFightParty.Left then
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky,10167, 80, 1, 14, 14, EEffectLightTracer.Stand, me.nowPos.x - 15, me.nowPos.y, 30, true, 70);
    else
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky,10161, 80, 1, 14, 14, EEffectLightTracer.Stand, me.nowPos.x - 15, me.nowPos.y, 30, true, 70);
    end

    FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky,10050, 80, 1, 3, 3, EEffectLightTracer.Stand, me.nowPos.x + 15, me.nowPos.y, 30, true, 5);
    FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky,10050, 80, 1, 3, 3, EEffectLightTracer.Stand, me.nowPos.x - 25, me.nowPos.y, 30, true, 10);
    self.interval = 0.8;
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
      local newPos = {};
      if target.party_Kind == EFightParty.Left then
        newPos.x = FightField.chip[1][target.row].x + 70;
        newPos.y = FightField.chip[1][target.row].y + 40;
        me:SetWalk(newPos.x, newPos.y);
        me.roleController:SetAnimationForceId(ERolePose.Jump);
        me.roleController:SetAnimationForceFrame(0);
        me:SetSpeed(0.5);
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky,10167, 80, 1, 14, 14, EEffectLightTracer.Line, me.nowPos.x - 15, me.nowPos.y + 70, 15, true, 0, newPos.x - 130, newPos.y, 0.5);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky,10050, 80, 1, 3, 3, EEffectLightTracer.Stand, me.nowPos.x + 15, me.nowPos.y + 5, 20, true, 0, newPos.x, newPos.y, 0.5);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky,10050, 80, 1, 3, 3, EEffectLightTracer.Stand, me.nowPos.x - 25, me.nowPos.y + 10, 20, true, 0, newPos.x, newPos.y, 0.5);
      else
        newPos.x = FightField.chip[2][target.row].x - 70;
        newPos.y = FightField.chip[2][target.row].y - 40;
        me:SetWalk(newPos.x, newPos.y);
        me.roleController:SetAnimationForceId(ERolePose.Jump);
        me.roleController:SetAnimationForceFrame(0);
        me:SetSpeed(0.5);
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky,10166, 80, 1, 14, 14, EEffectLightTracer.Line, me.nowPos.x - 15, me.nowPos.y + 70, 15, true, 40, newPos.x + 130, newPos.y + 60, 0.5);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky,10050, 80, 1, 3, 3, EEffectLightTracer.Stand, me.nowPos.x + 15, me.nowPos.y + 5, 20, true, 0, newPos.x, newPos.y, 0.5);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky,10050, 80, 1, 3, 3, EEffectLightTracer.Stand, me.nowPos.x - 25, me.nowPos.y + 10, 20, true, 0, newPos.x, newPos.y, 0.5);
      end
      self.step = 3;
    end
  elseif self.step == 3 then
    if me.arrive then
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky,10050, 80, 1, 3, 3, EEffectLightTracer.Stand, me.nowPos.x + 15, me.nowPos.y, 30, true, 5);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky,10050, 80, 1, 3, 3, EEffectLightTracer.Stand, me.nowPos.x - 25, me.nowPos.y, 30, true, 10);
      self.interval = 0.5;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      me:PlaySound(target.colm, target.row, Attack_Start, 2);
      me:SetSpeed(1);
      me.roleController:SetAnimationForceId(ERolePose.Attack);
      me.roleController:SetAnimationForceFrame(255);
      self.interval = 0.1;
      self.step = 5;
    end
  elseif Contains(self.step, 5, 6, 7) then
    self:UpdatePose();
    self:UpdateHit(); 
  elseif self.step == 8 then
    if self:CheckInterval() then 
      self.isLightEnd =true;
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

function SeaOfFire:UpdateHit()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
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
  if self:CheckInterval() then 
    local newPos = {};
    local lineStart = 0;
    local effectId = 10538;
    if target.party_Kind ~= EFightParty.Left then
      lineStart = 2;
      effectId = 10539;
    end
        
    newPos.x = FightField.chip[lineStart][target.row].x + 20;
    newPos.y = FightField.chip[lineStart][target.row].y - 30;
    for i = 1, 4 do
      if math.random(2) == 1 then
        FightField.attack[self.humIdx]:SetLightWithOrder(i, EEffectLightDis.Sky, effectId, math.random(60) + 29, 1, 4, 4, EEffectLightTracer.Stand, newPos.x + math.random(25) - 1, newPos.y + math.random(60) - 1, 30, true, 5);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(i, EEffectLightDis.Sky, effectId, math.random(60) + 29, 1, 4, 4, EEffectLightTracer.Stand, newPos.x - math.random(25) + 1, newPos.y + math.random(60) - 1, 30, true, 5);
      end
    end

    for i = 0, 2 do
      FightField.attack[self.humIdx]:SetLightWithOrder(9 + i, EEffectLightDis.Body, 10373, 30, 7, 11, 12, EEffectLightTracer.Stand, newPos.x - math.random(25) + 1, newPos.y + math.random(60) - 1, 15, true, 5);
    end

    newPos.x = FightField.chip[lineStart + 1][target.row].x + 20;
    newPos.y = FightField.chip[lineStart + 1][target.row].y - 30;
    for i = 6, 8 do
      if math.random(2) == 1 then
        FightField.attack[self.humIdx]:SetLightWithOrder(i, EEffectLightDis.Sky, effectId, math.random(60) + 29, 1, 4, 4, EEffectLightTracer.Stand, newPos.x + math.random(25) - 1, newPos.y + math.random(60) - 1, 30, true, 5);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(i, EEffectLightDis.Sky, effectId, math.random(60) + 29, 1, 4, 4, EEffectLightTracer.Stand, newPos.x - math.random(25) + 1, newPos.y + math.random(60) - 1, 30, true, 5);
      end
    end

    for i = 0, 2 do
      FightField.attack[self.humIdx]:SetLightWithOrder(12 + i, EEffectLightDis.Body, 10373, 30, 7, 11, 12, EEffectLightTracer.Stand, newPos.x - math.random(25) + 1, newPos.y + math.random(60) - 1, 15, true, 5);      
    end
    
    for k, v in pairs(self.emyIdxAy) do
      target = FightField.fightHum[v];
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 9);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 9);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 9);
    end
    self.interval = 0.35;
    self.step = self.step + 1;
  end
end

function SeaOfFire:UpdatePose()
  local target;
  if self.poseInterval >= 0 then
    self.poseInterval = self.poseInterval - CGTimer.deltaTime * FightField.timeScale;
  else
    self.poseInterval = 0.03;
    for i = 0, self.emyNum - 1 do
      target = FightField.fightHum[self.emyIdxAy[i]];
      target.roleController:SetAnimationForceFrame(255);
      if math.random(2) == 1 then
        target.roleController:SetAnimationForceId(ERolePose.Hit);
      else
        target.roleController:SetAnimationForceId(ERolePose.Lie);
        target.roleController:SetAnimationForceFrame(2);
      end
    end
  end
end

EW_SeaOfFire = InheritsAttack(SeaOfFire)

function EW_SeaOfFire:InitExtraParameters()
  self.totalDist = 0;
  self.curDist = 0;
  self.poseInterval = 0.3;
end

function EW_SeaOfFire:InitDrawBlack()
  self.needDrawBlack = true;   
end

function EW_SeaOfFire:UpdateHit()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self:CheckInterval() then 
    local newPos = {};
    local rowStart = 0;
    local hitEffectId = 10538;
    if target.party_Kind ~= EFightParty.Left then
      rowStart = 2
      hitEffectId = 10539;
    end
      
    newPos.x = FightField.chip[rowStart][target.row].x + 20;
    newPos.y = FightField.chip[rowStart][target.row].y - 30;
    for i = 1, 8 do
      if math.random(2) == 1 then
        FightField.attack[self.humIdx]:SetLightWithOrder(i, EEffectLightDis.Sky, hitEffectId, math.random(60) + 40, 1, 4, 4, EEffectLightTracer.Stand, newPos.x + math.random(40) - 1, newPos.y + math.random(70) - 1, 30, true, 5);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(i, EEffectLightDis.Sky, hitEffectId, math.random(60) + 40, 1, 4, 4, EEffectLightTracer.Stand, newPos.x - math.random(40) + 1, newPos.y + math.random(70) - 1, 30, true, 5);
      end
    end

    for i = 0, 3 do      
      FightField.attack[self.humIdx]:SetLightWithOrder(17 + i, EEffectLightDis.Body, 10407, 30, 1, 5, 5, EEffectLightTracer.Stand, newPos.x - math.random(50), newPos.y + math.random(90), 15, true, 5);
    end

    newPos.x = FightField.chip[rowStart + 1][target.row].x + 20;
    newPos.y = FightField.chip[rowStart + 1][target.row].y - 30;
    for i = 9, 16 do
      if math.random(2) == 1 then
        FightField.attack[self.humIdx]:SetLightWithOrder(i, EEffectLightDis.Sky, hitEffectId, math.random(60) + 40, 1, 4, 4, EEffectLightTracer.Stand, newPos.x + math.random(40) - 1, newPos.y + math.random(70) - 1, 30, true, 5);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(i, EEffectLightDis.Sky, hitEffectId, math.random(60) + 40, 1, 4, 4, EEffectLightTracer.Stand, newPos.x - math.random(40) + 1, newPos.y + math.random(70) - 1, 30, true, 5);
      end
    end

    for i = 0, 3 do      
      FightField.attack[self.humIdx]:SetLightWithOrder(20 + i, EEffectLightDis.Body, 10407, 30, 1, 5, 5, EEffectLightTracer.Stand, newPos.x - math.random(50), newPos.y + math.random(90), 15, true, 5);      
    end

    for k, v in pairs(self.emyIdxAy) do
      target = FightField.fightHum[v];
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 9);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 9);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 9);
    end
    self.interval = 0.43;
    self.step = self.step + 1;
  end
end