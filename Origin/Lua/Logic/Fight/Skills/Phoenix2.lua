Phoenix2 = InheritsFromBaseAttackSkill();

function Phoenix2:InitExtraParameters()
  self.bombCount = 0;
  self.lightStar = {};
  self.lightList = {};
  self.alpha = 0;
  self.maxBombCount = 4;
end

function Phoenix2:ExtraClose()
  ClearLightTable(self.lightStar);
  ClearLightTable(self.lightList);
  self.isLightEnd = true;
end

function Phoenix2:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Ground, 10165, 100, 1, 10, 10, EEffectLightTracer.StandAni, me.nowPos.x + 10, me.nowPos.y, 15, true, 60);
    FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10170, 150, 1, 9, 9, EEffectLightTracer.StandAni, me.nowPos.x + 10, me.nowPos.y, 15, true, 60);
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
    me:PlaySound(target.colm, target.row, Attack_Start, 1);
    local newPos = me:RCtoSpot(me.colm, me.row);
    if target.party_Kind == EFightParty.Right then
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10166, 80, 1, 14, 14, EEffectLightTracer.Stand, newPos.x, newPos.y - 42, 0, true, 100);
    else
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10168, 80, 1, 14, 14, EEffectLightTracer.Stand, newPos.x, newPos.y - 42, 0, true, 100);
    end
    FightField.attack[self.humIdx].lights[1]:SetAlpha(1, 1, 25);
    self.interval = 0.07;
    self.step = 3;
  elseif self.step == 3 then
    if self:CheckInterval() then 
      if math.fmod(FightField.attack[self.humIdx].lights[1].alpha, 7) ==  0 then
        me:PlaySound(target.colm, target.row, Attack_Start, 2);
      end

      self.interval = 1;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      me:PlaySound(target.colm, target.row, Attack_Start, 2);
      FightField.attack[self.humIdx]:StopLight(1);
      local newPos = me:RCtoSpot(me.colm, me.row);
      local newPos2 = me:RCtoSpot(target.colm, target.row, EFightSpot.Front, 218);

      if target.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10166, 80, 1, 14, 14, EEffectLightTracer.Line, newPos.x, newPos.y - 42, 25, true, 100, newPos2.x, newPos2.y, 0.36);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10168, 80, 1, 14, 14, EEffectLightTracer.Line, newPos.x - 20, newPos.y - 42, 25, true, 100, newPos2.x, newPos2.y, 0.36);
      end
      me:PlaySound(target.colm, target.row, Attack_Start, 2);
      me:PlaySound(target.colm, target.row, Attack_Start, 1);
      self.interval = 0.222;
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
        local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      self.bombCount = self.bombCount + 1;
      if self.bombCount > 1 then
        me:PlaySound();
        FightField.isShake = true;
        local light;
        local newPos;
        local newPos2;
        local newPos3 = target:GetSpotOfRc(EFightSpot.Right, 0);
      
        if self.bombCount == 2 then
          newPos2 = me:GetSpotOfRc(EFightSpot.Left, 150);
        elseif self.bombCount == 3 then
          newPos2 = me:GetSpotOfRc(EFightSpot.Left, 100);
        elseif self.bombCount == 4 then
          newPos2 = me:GetSpotOfRc(EFightSpot.Left, 50);
        end
      
        newPos = FightField.GetSpotOfCutLine(newPos2.x, newPos2.y, newPos3.x, newPos3.y, self.bombCount, self.maxBombCount);
        light = EffectLight.New(10171, 150, 1, 4, 6, EEffectLightTracer.StandAni, newPos.x + 5, newPos.y, 255, false, 98);
        light:SetTimeScale(FightField.timeScale);
        light:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        table.insert(self.lightList, light);

        light = EffectLight.New(10055, 30, 1, 21, 21, EEffectLightTracer.StandAni, newPos.x + 5, newPos.y, 35, false, 30);
        light:SetTimeScale(FightField.timeScale);
        light:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        table.insert(self.lightList, light);

        light = EffectLight.New(10016, 30, 1, 15, 15, EEffectLightTracer.StandAni, newPos.x + math.random(30) - 1, newPos.y + math.random(30) - 1, 50, false, 55);
        light:SetTimeScale(FightField.timeScale);
        light:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        table.insert(self.lightList, light);

        newPos3 = target:GetSpotOfRc(EFightSpot.Left, 0);
        if self.bombCount == 2 then
          newPos2 = me:GetSpotOfRc(EFightSpot.Right, 150);
        elseif self.bombCount == 3 then
          newPos2 = me:GetSpotOfRc(EFightSpot.Right, 100);
        elseif self.bombCount == 4 then
          newPos2 = me:GetSpotOfRc(EFightSpot.Right, 50);
        end
      
        newPos = FightField.GetSpotOfCutLine(newPos2.x, newPos2.y, newPos3.x, newPos3.y, self.bombCount, self.maxBombCount);        
        light = EffectLight.New(10171, 150, 1, 4, 6, EEffectLightTracer.StandAni, newPos.x + 5, newPos.y, 255, false, 98);
        light:SetTimeScale(FightField.timeScale);
        light:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        table.insert(self.lightList, light);

        light = EffectLight.New(10055, 30, 1, 21, 21, EEffectLightTracer.StandAni, newPos.x + 5, newPos.y, 35, false, 30);
        light:SetTimeScale(FightField.timeScale);
        light:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        table.insert(self.lightList, light);

        light = EffectLight.New(10016, 30, 1, 15, 15, EEffectLightTracer.StandAni, newPos.x + math.random(30) - 1, newPos.y + math.random(30) - 1, 50, false, 55);
        light:SetTimeScale(FightField.timeScale);
        light:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        table.insert(self.lightList, light);
        self.interval = 0.222;
      end
    end

    if self.bombCount + 1 == self.maxBombCount then
      for i = 0, self.emyNum - 1 do 
        target = FightField.fightHum[self.emyIdxAy[i]];
        self.lightStar[i] = EffectLight.New(10133, 30, 1, 16, 16, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 50);
        self.lightStar[i]:SetTimeScale(FightField.timeScale);
        self.lightStar[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      end
    end

    if self.bombCount >= self.maxBombCount then
      self.step = 6;
      local newPos;
      for i = 0, self.emyNum - 1 do 
        target = FightField.fightHum[self.emyIdxAy[i]];
        newPos = target:GetSpot(EFightSpot.Back, 99 + math.random(50));
        target.roleController:SetAnimationForceId(ERolePose.Lie);
        target:SetJump(newPos.x, newPos.y);
      end
    end
  elseif self.step == 6 then
    if FightField.attack[self.humIdx].lights[1].arrive or FightField.attack[self.humIdx].lights[1].picId == 0 then
      self.isLightEnd =true;
      self.step = 7;
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