Stool1 = InheritsFromBaseAttackSkill();

function Stool1:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:SetAnimationForceId(ERolePose.Magic);

    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10079, 50, 1, 22, 22, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 30, false, 113);
    self.interval = 1.2;
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
      --local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10253, 50, 1, 1, 1, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y, 255, false, 10, target.nowPos.x, target.nowPos.y, 0.36)      
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[2].isArrive or FightField.attack[self.humIdx].lights[2].picId == 0 then
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      target.roleController:SetAnimationForceId(ERolePose.Hit);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10019, 60, 1, 15, 15, EEffectLightTracer.Stand, target.nowPos.x - 10, target.nowPos.y - 40, 40, false, 80);
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[2].orderCount == 14 then
     self.isLightEnd = true;
      self.step = 5;
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
        --local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  end
end

Stool2 = InheritsFromBaseAttackSkill();

function Stool2:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:SetAnimationForceId(ERolePose.Magic);

    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10079, 50, 1, 22, 22, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 30, false, 113);
    self.interval = 0.8;
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
      --local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10254, 100, 1, 1, 1, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y - 200, 255, false, 0, target.nowPos.x, target.nowPos.y + 20, 0.3);      
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:IsDown() then
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10254, 100, 1, 1, 1, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y + 6, 255, false, 0);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10016, 25, 1, 15, 15, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 50, false, 50);
      me:PlaySound(target.colm, target.row);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky2].picId == 0 then
      FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Sky1);
      FightField.RestoreFightInfo(self.humIdx);
      FightField.RestoreFightInfo(self.tarIdx);
      self.interval = 0.1;
      self.step = 5;
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
        --local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      target.squelch = target.squelch + 1;
      if target.squelch == MaxSquelch then
        self.isLightEnd = true;
        self.step = 6;
      end
    end
  end
end

function Stool2:IsDown()
  local target = FightField.fightHum[self.tarIdx];
  local pressDist = FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].showPos.y - (target.nowPos.y - target.roleController.height);

  if pressDist < 0 then 
    return false;
  end

  local pressRate = math.round((pressDist / target.roleController.height) * 10);
  if pressRate > MaxSquelch then
    pressRate = MaxSquelch;
  end

  target:SetSquelch(MaxSquelch - pressRate);
  if target.squelch == 0 then
    return true;
  else
    return false;
  end
end

Stool1Me = InheritsFromBaseStatus();

function Stool1Me:ExtraClose()  
  FightField.fightHum[self.humIdx].roleController:SetTextureColor(Color.White);
end

function Stool1Me:Update()
  if self.step == 1 then 
    local me = FightField.fightHum[self.humIdx];
    me.roleController:SetTextureColor(Color.Yellow);    
    self.step = 2;              
  end
end