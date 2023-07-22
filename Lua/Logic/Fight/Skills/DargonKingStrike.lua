DargonKingStrike = InheritsFromBaseAttackSkill();

function DargonKingStrike:InitExtraParameters()
  self.setPos = nil;
  self.fireSmork = {};
end

function DargonKingStrike:ExtraClose()
  ClearLightTable(self.fireSmork);
  FightField.SetShake(false);
  self.isLightEnd = true;
end

function DargonKingStrike:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground ,10078, 50, 1, 20, 20, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 80);
    FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky ,10281, 60, 1, 6, 6, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 20, true, 30);
    me:PlaySound(target.colm,target.row, Attack_Start, 1);
    self.interval = 0.8;
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
    self.step = 2;
  elseif self.step == 2 then
    if self:CheckInterval() then 
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10443, 100, 1, 8, 8, EEffectLightTracer.Stand, me.nowPos.x - 150, me.nowPos.y + 40, 20, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground, 10443, 100, 1, 8, 8, EEffectLightTracer.Stand, me.nowPos.x - 75, me.nowPos.y - 30, 20, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10443, 100, 1, 8, 8, EEffectLightTracer.Stand, me.nowPos.x + 90, me.nowPos.y - 60, 20, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10541, 60, 1, 10, 21, EEffectLightTracer.StandAni, me.nowPos.x - 210, me.nowPos.y + 40, 30, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10541, 60, 1, 10, 21, EEffectLightTracer.StandAni, me.nowPos.x - 135, me.nowPos.y - 30, 30, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10541, 60, 1, 10, 21, EEffectLightTracer.StandAni, me.nowPos.x + 30, me.nowPos.y - 60, 30, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10543, 60, 1, 9, 18, EEffectLightTracer.StandAni, me.nowPos.x - 210, me.nowPos.y + 40, 255, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(8, EEffectLightDis.Sky, 10543, 60, 1, 9, 18, EEffectLightTracer.StandAni, me.nowPos.x - 135, me.nowPos.y - 30, 255, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Sky, 10543, 60, 1, 9, 18, EEffectLightTracer.StandAni, me.nowPos.x + 30, me.nowPos.y - 60, 255, false, 0);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10443, 100, 1, 8, 8, EEffectLightTracer.Stand, me.nowPos.x + 220, me.nowPos.y + 20, 20, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground, 10443, 100, 1, 8, 8, EEffectLightTracer.Stand, me.nowPos.x + 150, me.nowPos.y + 70, 20, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10443, 100, 1, 8, 8, EEffectLightTracer.Stand, me.nowPos.x + 10, me.nowPos.y + 120, 20, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10542, 60, 1, 10, 21, EEffectLightTracer.StandAni, me.nowPos.x + 260, me.nowPos.y + 20, 30, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10542, 60, 1, 10, 21, EEffectLightTracer.StandAni, me.nowPos.x + 190, me.nowPos.y + 70, 30, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10542, 60, 1, 10, 21, EEffectLightTracer.StandAni, me.nowPos.x + 50, me.nowPos.y + 120, 30, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10544, 60, 1, 9, 18, EEffectLightTracer.StandAni, me.nowPos.x + 220, me.nowPos.y + 20, 255, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(8, EEffectLightDis.Sky, 10544, 60, 1, 9, 18, EEffectLightTracer.StandAni, me.nowPos.x + 190, me.nowPos.y + 70, 255, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Sky, 10544, 60, 1, 9, 18, EEffectLightTracer.StandAni, me.nowPos.x + 50, me.nowPos.y + 120, 255, false, 0);
      end
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[9].picId == 0 then
      me:PlaySound(target.colm, target.row, Attack_Start, 2);
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10443, 100, 1, 8, 8, EEffectLightTracer.Line, me.nowPos.x - 150, me.nowPos.y + 40, 20, true, 0, me.nowPos.x - 300, me.nowPos.y - 40, 0.2);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground, 10443, 100, 1, 8, 8, EEffectLightTracer.Line, me.nowPos.x - 75, me.nowPos.y - 30, 20, true, 0, me.nowPos.x - 200, me.nowPos.y - 80, 0.2);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10443, 100, 1, 8, 8, EEffectLightTracer.Line, me.nowPos.x + 90, me.nowPos.y - 60, 20, true, 0, me.nowPos.x - 120, me.nowPos.y - 140, 0.2);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10541, 60, 11, 13, 21, EEffectLightTracer.Line, me.nowPos.x - 210, me.nowPos.y + 40, 30, false, 0, me.nowPos.x - 360, me.nowPos.y - 40, 0.2);
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10541, 60, 11, 13, 21, EEffectLightTracer.Line, me.nowPos.x - 135, me.nowPos.y - 30, 30, false, 0, me.nowPos.x - 260, me.nowPos.y - 800, 0.2);
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10541, 60, 11, 13, 21, EEffectLightTracer.Line, me.nowPos.x + 30, me.nowPos.y - 60, 30, false, 0, me.nowPos.x - 180, me.nowPos.y - 140, 0.2);
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10543, 60, 11, 11, 18, EEffectLightTracer.Line, me.nowPos.x - 210, me.nowPos.y + 40, 255, false, 0, me.nowPos.x - 360, me.nowPos.y - 40, 0.2);
        FightField.attack[self.humIdx]:SetLightWithOrder(8, EEffectLightDis.Sky, 10543, 60, 11, 11, 18, EEffectLightTracer.Line, me.nowPos.x - 135, me.nowPos.y - 30, 255, false, 0, me.nowPos.x - 260, me.nowPos.y - 80, 0.2);
        FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Sky, 10543, 60, 11, 11, 18, EEffectLightTracer.Line, me.nowPos.x + 30, me.nowPos.y - 60, 255, false, 0, me.nowPos.x - 180, me.nowPos.y - 140, 0.2);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10443, 100, 1, 8, 8, EEffectLightTracer.Line, me.nowPos.x + 220, me.nowPos.y + 20, 20, true, 0, me.nowPos.x + 370, me.nowPos.y + 70, 0.2);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground, 10443, 100, 1, 8, 8, EEffectLightTracer.Line, me.nowPos.x + 150, me.nowPos.y + 70, 20, true, 0, me.nowPos.x + 240, me.nowPos.y + 140, 0.2);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10443, 100, 1, 8, 8, EEffectLightTracer.Line, me.nowPos.x + 10, me.nowPos.y + 120, 20, true, 0, me.nowPos.x + 100, me.nowPos.y + 200, 0.2);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10542, 60, 11, 13, 21, EEffectLightTracer.Line, me.nowPos.x + 260, me.nowPos.y + 20, 30, false, 0, me.nowPos.x + 430, me.nowPos.y + 70, 0.2);
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10542, 60, 11, 13, 21, EEffectLightTracer.Line, me.nowPos.x + 190, me.nowPos.y + 70, 30, false, 0, me.nowPos.x + 300, me.nowPos.y + 140, 0.2);
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10542, 60, 11, 13, 21, EEffectLightTracer.Line, me.nowPos.x + 50, me.nowPos.y + 120, 30, false, 0, me.nowPos.x + 160, me.nowPos.y + 200, 0.2);
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10544, 60, 11, 11, 18, EEffectLightTracer.Line, me.nowPos.x + 220, me.nowPos.y + 20, 255, false, 0, me.nowPos.x + 430, me.nowPos.y + 70, 0.2);
        FightField.attack[self.humIdx]:SetLightWithOrder(8, EEffectLightDis.Sky, 10544, 60, 11, 11, 18, EEffectLightTracer.Line, me.nowPos.x + 190, me.nowPos.y + 70, 255, false, 0, me.nowPos.x + 300, me.nowPos.y + 140, 0.2);
        FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Sky, 10544, 60, 11, 11, 18, EEffectLightTracer.Line, me.nowPos.x + 50, me.nowPos.y + 120, 255, false, 0, me.nowPos.x + 160, me.nowPos.y + 200, 0.2);
      end
      self:SetFireSmork();
      FightField.isShake = true;
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[1].isArrive then
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10541, 60, 13, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x - 360, me.nowPos.y - 40, 30, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10541, 60, 13, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x - 260, me.nowPos.y - 80, 30, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10541, 60, 13, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x - 180, me.nowPos.y - 140, 30, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10543, 60, 11, 18, 18, EEffectLightTracer.Stand, me.nowPos.x - 360, me.nowPos.y - 40, 255, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(8, EEffectLightDis.Sky, 10543, 60, 11, 18, 18, EEffectLightTracer.Stand, me.nowPos.x - 260, me.nowPos.y - 80, 255, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Sky, 10543, 60, 11, 18, 18, EEffectLightTracer.Stand, me.nowPos.x - 180, me.nowPos.y - 140, 255, false, 0);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10121, 60, 1, 4, 4, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 20, true, 60);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10542, 60, 13, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 430, me.nowPos.y + 70, 30, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10542, 60, 13, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 300, me.nowPos.y + 140, 30, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10542, 60, 13, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 160, me.nowPos.y + 200, 30, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10544, 60, 11, 18, 18, EEffectLightTracer.Stand, me.nowPos.x + 430, me.nowPos.y + 70, 255, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(8, EEffectLightDis.Sky, 10544, 60, 11, 18, 18, EEffectLightTracer.Stand, me.nowPos.x + 300, me.nowPos.y + 140, 255, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Sky, 10544, 60, 11, 18, 18, EEffectLightTracer.Stand, me.nowPos.x + 160, me.nowPos.y + 200, 255, false, 0);
      end

      for k, v in pairs(self.emyIdxAy) do
        target = FightField.fightHum[v];
        target.roleController:SetAnimationForceId(ERolePose.Hit);
      end
      self.step = 5;
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
  elseif self.step == 5 then
    if FightField.attack[self.humIdx].lights[6].picId == 0 then
      self.isLightEnd =true;
      self.step = 6;
    end
  end
end

function DargonKingStrike:SetFireSmork()
  local target = FightField.fightHum[self.tarIdx];
  local aSpeed = 0.08;
  local newPos, newPos1;

  if target.party_Kind == EFightParty.Left then
    newPos = target:RCtoSpot(1, 0, EFightSpot.Front, 120);
    newPos1 = target:RCtoSpot(1, 0, EFightSpot.Back, 60);
    self.fireSmork[0] = EffectLight.New(10549, 80, 1, 10, 10, EEffectLightTracer.Line, newPos.x, newPos.y, 30, true, 60, newPos1.x, newPos1.y, aSpeed);
    self.fireSmork[0]:SetTimeScale(FightField.timeScale);   
    self.fireSmork[0]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);

    newPos = target:RCtoSpot(1, 2, EFightSpot.Front, 120);
    newPos1 = target:RCtoSpot(1, 2, EFightSpot.Back, 60);
    self.fireSmork[1] = EffectLight.New(10549, 80, 1, 10, 10, EEffectLightTracer.Line, newPos.x, newPos.y, 30, true, 60, newPos1.x, newPos1.y, aSpeed);
    self.fireSmork[1]:SetTimeScale(FightField.timeScale);   
    self.fireSmork[1]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);

    newPos = target:RCtoSpot(1, 4, EFightSpot.Front, 120);
    newPos1 = target:RCtoSpot(1, 4, EFightSpot.Back, 60);
    self.fireSmork[2] = EffectLight.New(10549, 80, 1, 10, 10, EEffectLightTracer.Line, newPos.x, newPos.y, 30, true, 60, newPos1.x, newPos1.y, aSpeed);
    self.fireSmork[2]:SetTimeScale(FightField.timeScale);   
    self.fireSmork[2]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);

    newPos = target:RCtoSpot(1, 0, EFightSpot.Front, 60);
    newPos1 = target:RCtoSpot(1, 0, EFightSpot.Back, 60);
    self.fireSmork[3] = EffectLight.New(10549, 80, 1, 10, 10, EEffectLightTracer.Line, newPos.x, newPos.y, 30, true, 60, newPos1.x, newPos1.y, aSpeed);
    self.fireSmork[3]:SetTimeScale(FightField.timeScale);   
    self.fireSmork[3]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);

    newPos = target:RCtoSpot(1, 2, EFightSpot.Front, 60);
    newPos1 = target:RCtoSpot(1, 2, EFightSpot.Back, 60);
    self.fireSmork[4] = EffectLight.New(10549, 80, 1, 10, 10, EEffectLightTracer.Line, newPos.x, newPos.y, 30, true, 60, newPos1.x, newPos1.y, aSpeed);
    self.fireSmork[4]:SetTimeScale(FightField.timeScale);   
    self.fireSmork[4]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);

    newPos = target:RCtoSpot(1, 4, EFightSpot.Front, 60);
    newPos1 = target:RCtoSpot(1, 4, EFightSpot.Back, 60);
    self.fireSmork[5] = EffectLight.New(10549, 80, 1, 10, 10, EEffectLightTracer.Line, newPos.x, newPos.y, 30, true, 60, newPos1.x, newPos1.y, aSpeed);
    self.fireSmork[5]:SetTimeScale(FightField.timeScale);   
    self.fireSmork[5]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);

    newPos = target:RCtoSpot(0, 0, EFightSpot.Front, 60);
    newPos1 = target:RCtoSpot(0, 0, EFightSpot.Back, 60);
    self.fireSmork[6] = EffectLight.New(10549, 80, 1, 10, 10, EEffectLightTracer.Line, newPos.x, newPos.y, 30, true, 60, newPos1.x, newPos1.y, aSpeed);
    self.fireSmork[6]:SetTimeScale(FightField.timeScale);   
    self.fireSmork[6]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);

    newPos = target:RCtoSpot(0, 2, EFightSpot.Front, 60);
    newPos1 = target:RCtoSpot(0, 2, EFightSpot.Back, 60);
    self.fireSmork[7] = EffectLight.New(10549, 80, 1, 10, 10, EEffectLightTracer.Line, newPos.x, newPos.y, 30, true, 60, newPos1.x, newPos1.y, aSpeed);
    self.fireSmork[7]:SetTimeScale(FightField.timeScale);   
    self.fireSmork[7]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);

    newPos = target:RCtoSpot(0, 4, EFightSpot.Front, 60);
    newPos1 = target:RCtoSpot(0, 4, EFightSpot.Back, 60);
    self.fireSmork[8] = EffectLight.New(10549, 80, 1, 10, 10, EEffectLightTracer.Line, newPos.x, newPos.y, 30, true, 60, newPos1.x, newPos1.y, aSpeed);
    self.fireSmork[8]:SetTimeScale(FightField.timeScale);   
    self.fireSmork[8]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
  else
    newPos = target:RCtoSpot(2, 0, EFightSpot.Front, 120);
    newPos1 = target:RCtoSpot(2, 0, EFightSpot.Back, 80);
    self.fireSmork[0] = EffectLight.New(10549, 80, 1, 10, 10, EEffectLightTracer.Line, newPos.x, newPos.y, 30, true, 60, newPos1.x, newPos1.y, aSpeed);
    self.fireSmork[0]:SetTimeScale(FightField.timeScale);   
    self.fireSmork[0]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);

    newPos = target:RCtoSpot(2, 2, EFightSpot.Front, 120);
    newPos1 = target:RCtoSpot(2, 2, EFightSpot.Back, 80);
    self.fireSmork[1] = EffectLight.New(10549, 80, 1, 10, 10, EEffectLightTracer.Line, newPos.x, newPos.y, 30, true, 60, newPos1.x, newPos1.y, aSpeed);
    self.fireSmork[1]:SetTimeScale(FightField.timeScale);   
    self.fireSmork[1]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);

    newPos = target:RCtoSpot(2, 4, EFightSpot.Front, 120);
    newPos1 = target:RCtoSpot(2, 4, EFightSpot.Back, 80);
    self.fireSmork[2] = EffectLight.New(10549, 80, 1, 10, 10, EEffectLightTracer.Line, newPos.x, newPos.y, 30, true, 60, newPos1.x, newPos1.y, aSpeed);
    self.fireSmork[2]:SetTimeScale(FightField.timeScale);   
    self.fireSmork[2]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);

    newPos = target:RCtoSpot(2, 0, EFightSpot.Front, 60);
    newPos1 = target:RCtoSpot(2, 0, EFightSpot.Back, 80);
    self.fireSmork[3] = EffectLight.New(10549, 80, 1, 10, 10, EEffectLightTracer.Line, newPos.x, newPos.y, 30, true, 60, newPos1.x, newPos1.y, aSpeed);
    self.fireSmork[3]:SetTimeScale(FightField.timeScale);   
    self.fireSmork[3]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);

    newPos = target:RCtoSpot(2, 2, EFightSpot.Front, 60);
    newPos1 = target:RCtoSpot(2, 2, EFightSpot.Back, 80);
    self.fireSmork[4] = EffectLight.New(10549, 80, 1, 10, 10, EEffectLightTracer.Line, newPos.x, newPos.y, 30, true, 60, newPos1.x, newPos1.y, aSpeed);
    self.fireSmork[4]:SetTimeScale(FightField.timeScale);   
    self.fireSmork[4]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);

    newPos = target:RCtoSpot(2, 4, EFightSpot.Front, 60);
    newPos1 = target:RCtoSpot(2, 4, EFightSpot.Back, 80);
    self.fireSmork[5] = EffectLight.New(10549, 80, 1, 10, 10, EEffectLightTracer.Line, newPos.x, newPos.y, 30, true, 60, newPos1.x, newPos1.y, aSpeed);
    self.fireSmork[5]:SetTimeScale(FightField.timeScale);   
    self.fireSmork[5]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);

    newPos = target:RCtoSpot(3, 0, EFightSpot.Front, 60);
    newPos1 = target:RCtoSpot(3, 0, EFightSpot.Back, 80);
    self.fireSmork[6] = EffectLight.New(10549, 80, 1, 10, 10, EEffectLightTracer.Line, newPos.x, newPos.y, 30, true, 60, newPos1.x, newPos1.y, aSpeed);
    self.fireSmork[6]:SetTimeScale(FightField.timeScale);   
    self.fireSmork[6]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);

    newPos = target:RCtoSpot(3, 2, EFightSpot.Front, 60);
    newPos1 = target:RCtoSpot(3, 2, EFightSpot.Back, 80);
    self.fireSmork[7] = EffectLight.New(10549, 80, 1, 10, 10, EEffectLightTracer.Line, newPos.x, newPos.y, 30, true, 60, newPos1.x, newPos1.y, aSpeed);
    self.fireSmork[7]:SetTimeScale(FightField.timeScale);   
    self.fireSmork[7]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);

    newPos = target:RCtoSpot(3, 4, EFightSpot.Front, 60);
    newPos1 = target:RCtoSpot(3, 4, EFightSpot.Back, 80);
    self.fireSmork[8] = EffectLight.New(10549, 80, 1, 10, 10, EEffectLightTracer.Line, newPos.x, newPos.y, 30, true, 60, newPos1.x, newPos1.y, aSpeed);
    self.fireSmork[8]:SetTimeScale(FightField.timeScale);   
    self.fireSmork[8]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
  end
end