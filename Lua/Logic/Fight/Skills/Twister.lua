Twister = InheritsFromBaseAttackSkill();

function Twister:InitExtraParameters()
  self.aFire = false;
  self.windLight = {};
  self.lightShadow = {};
  self.fallDown = {};
end

function Twister:ExtraClose()
  ClearLightTable(self.windLight);
  ClearLightTable(self.lightShadow);
  FightField.SetShake(false);
  self.isLightEnd = true;
end

function Twister:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground, 10077, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 90);
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
      --local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10017, 50, 1, 6, 6, EEffectLightTracer.Line, target.nowPos.x + 150, target.nowPos.y + 150, 30, true, 0, target.nowPos.x, target.nowPos.y, 0.33);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10017, 50, 1, 6, 6, EEffectLightTracer.Line, target.nowPos.x + 150, target.nowPos.y - 150, 30, true, 0, target.nowPos.x, target.nowPos.y, 0.33);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10017, 50, 1, 6, 6, EEffectLightTracer.Line, target.nowPos.x - 150, target.nowPos.y - 150, 30, true, 0, target.nowPos.x, target.nowPos.y, 0.33);
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10017, 50, 1, 6, 6, EEffectLightTracer.Line, target.nowPos.x - 150, target.nowPos.y + 150, 30, true, 0, target.nowPos.x, target.nowPos.y, 0.33);
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[2].isArrive then
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10283, 100, 5, 10, 10, EEffectLightTracer.Stand, target.nowPos.x + 30, target.nowPos.y + 60, 30, true, 0)
        FightField.attack[self.humIdx].lights[6]:SetRotate(0, 30, 50, 80);
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10283, 100, 5, 10, 10, EEffectLightTracer.Stand, target.nowPos.x + 30, target.nowPos.y + 60, 30, true, 0)
        FightField.attack[self.humIdx].lights[7]:SetRotate(180, -30, 50, 80);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10283, 100, 5, 10, 10, EEffectLightTracer.Stand, target.nowPos.x + 30, target.nowPos.y + 60, 30, true, 0)
        FightField.attack[self.humIdx].lights[6]:SetRotate(0, 30, 50, 80);
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10283, 100, 5, 10, 10, EEffectLightTracer.Stand, target.nowPos.x + 30, target.nowPos.y + 60, 30, true, 0)
        FightField.attack[self.humIdx].lights[7]:SetRotate(180, -30, 50, 80);
      end

      me:PlaySound(target.colm, target.row, Attack_Start);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);

      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        if not target:IsInSealStatus() and target.roleController:GetAttribute(EAttribute.Hp) ~= 0 then
          target.roleController:SetAnimationForceId(ERolePose.Stand);
          target.isPlant = true;
          self.windLight[i] = EffectLight.New(10017, 50, 1, 6, 6, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y, 20, true, 15, target.nowPos.x, target.nowPos.y - 200, 0.36);
          self.windLight[i]:SetTimeScale(FightField.timeScale);   
          self.windLight[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        end

        self.lightShadow[i] = EffectLight.New('Shadow2',80,1,1,1, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 255, true, 35);
        self.lightShadow[i]:SetTimeScale(FightField.timeScale);   
        self.lightShadow[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      end 
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:GoPlant() then
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        target:PlaySound();
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);
        if not target:IsInSealStatus() and target.roleController:GetAttribute(EAttribute.Hp) ~= 0 then
          self.windLight[i] = EffectLight.New(10016, 30, 1, 15, 15, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y + 60, 30, false, 25);
          self.windLight[i]:SetTimeScale(FightField.timeScale);   
          self.windLight[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        end
      end
      FightField.SetShake(true);
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
    local aCount = 0;
    for i = 0, self.emyNum - 1 do
      target = FightField.fightHum[self.emyIdxAy[i]];
      if not target:IsInSealStatus() and target.roleController:GetAttribute(EAttribute.Hp) ~= 0 then
        if self.windLight[i].orderCount >= 3 then
          --FightField.SetShake(false);
          self.step = 6;
          break;
        end
      else
        aCount = aCount + 1;  
      end
    end
    
    if aCount >= self.emyNum then
      --FightField.SetShake(false);
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
        --local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  elseif self.step == 6 then
    local aCount = 0;
    for i = 0, self.emyNum - 1 do
      target = FightField.fightHum[self.emyIdxAy[i]];
      if not target:IsInSealStatus() and target.roleController:GetAttribute(EAttribute.Hp) ~= 0 then
        if self.windLight[i].orderCount >= 14 then
          self.step = 7;
          break;
        end
      else
        aCount = aCount + 1;  
      end
    end
    
    if aCount >= self.emyNum then
      self.step = 7;
    end

  elseif self.step == 7 then
    self.isLightEnd =true;
    self.step = 8;
  end
end

function Twister:GoPlant()
  local target;
  local x, y;
  local aCount = 0;

  for i = 0, self.emyNum - 1 do
    target = FightField.fightHum[self.emyIdxAy[i]];
    if not target:IsInSealStatus() and target.roleController:GetAttribute(EAttribute.Hp) ~= 0 then
      if self.windLight[i] ~= nil and self.windLight[i].picId == 0 then
        if self.fallDown[i] == false then
          target.overturn = true;
          self.fallDown[i] = true;

          x = self.windLight[i].showPos.x;
          y = self.windLight[i].showPos.y;

          self.windLight[i] = EffectLight.New(100117, 50, 1, 6, 6, EEffectLightTracer.Line, x, y, 20, true, 15, x, y + 200, 0.72);
          self.windLight[i]:SetTimeScale(FightField.timeScale);   
          self.windLight[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        else
          aCount = aCount + 1;
        end
      end

      target.fantasY = self.windLight[i].showPos.y;
    else
      self.fallDown[i] = true;
      aCount = aCount + 1;  
    end
  end

  return aCount >= self.emyNum;
end