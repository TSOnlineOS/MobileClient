PhoenixRabid = InheritsFromBaseAttackSkill();

function PhoenixRabid:InitExtraParameters()
  self.fire = {};
  self.fire2 = {};
  
  self.ranEmyIdx = {};  --每道光影亂數攻擊目標
  self.ranPos = {} ;    --每道光影終點座標  
end

function PhoenixRabid:ExtraClose()
  ClearLightTable(self.fire);
  ClearLightTable(self.fire2);  
end

function PhoenixRabid:Update()
  self:UpdateLogic();
  self:Show();
end

function PhoenixRabid:UpdateLogic()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    if me.isTurtle == false then 
      me:SetMoment(newPos.x, newPos.y, false);    
      me.roleController:SetAnimationForceId(ERolePose.Magic);
    else
      me.roleController:SetAnimationForceId(ERolePose.Attack);
    end

    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10078, 50, 1, 20, 20, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 80);
    self:RanAttack();
    me:PlaySound(target.colm, target.row, Attack_Start);
    self.interval = 0.8;
    self.cnt = 0;
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
      target = FightField.fightHum[self.ranEmyIdx[self.cnt]];
      if self.cnt  == 0 then
        if target.party_Kind == EFightParty.Left then
          FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Sky, 10167, 151, 1, 14, 14, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 30, true, 100, 
                                                           self.ranPos[self.cnt].x, self.ranPos[self.cnt].y, 0.76);
        else
          FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Sky, 10161, 151, 1, 14, 14, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 30, true, 100, 
                                                           self.ranPos[self.cnt].x, self.ranPos[self.cnt].y, 0.76);
        end
        self.temp = EffectLight.New(10167, 151, 1, 14, 14, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 30, true, 100, 
                                                           self.ranPos[self.cnt].x, self.ranPos[self.cnt].y, 0.76);
        self.temp:SetTimeScale(FightField.timeScale);                                                          
        self.temp:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        FightField.attack[self.humIdx].lights[9]:SetAlpha(30, -2, 13);
        FightField.attack[self.humIdx].lights[9]:SetResidual(3, 30, -1);
        me:PlaySound(target.colm, target.row, Attack_Hit);
      else
        if target.party_Kind == EFightParty.Left then
          FightField.attack[self.humIdx]:SetLightWithOrder(self.cnt, EEffectLightDis.Sky, 10167, 151, 1, 14, 14, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 30, true, 100, 
                                                           self.ranPos[self.cnt].x, self.ranPos[self.cnt].y, 0.76);
        else
          FightField.attack[self.humIdx]:SetLightWithOrder(self.cnt, EEffectLightDis.Sky, 10161, 151, 1, 14, 14, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 30, true, 100, 
                                                           self.ranPos[self.cnt].x, self.ranPos[self.cnt].y, 0.76);
        end

        FightField.attack[self.humIdx].lights[self.cnt]:SetAlpha(30, -2, 13);
        FightField.attack[self.humIdx].lights[self.cnt]:SetResidual(3, 30, -1);
      end   
      self.fire[self.cnt] = EffectLight.New(10055,30,1,21,21, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y,30, true, 30);
      self.fire[self.cnt]:SetTimeScale(FightField.timeScale);                                                          
      self.fire[self.cnt]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);

      self.fire2[self.cnt] = EffectLight.New(10274,30,1,16,16, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y,30, true, 50);
      self.fire2[self.cnt]:SetTimeScale(FightField.timeScale);                                                          
      self.fire2[self.cnt]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);

      target.roleController:SetInBattle(false);
      target:SetBeh(EFightBeh.Rotate);
      FightField.isShake = true;
      if not target:IsInSealStatus() and target.jumpStart == false then
        local newPos = {};
        local k = math.random(1, 3);
        if k == 1 then
          newPos = target:GetSpot(EFightSpot.Back, math.random(80) + 79);
        elseif k == 2 then
          newPos = target:GetSpot(EFightSpot.Left, math.random(80) + 79);
        else
          newPos = target:GetSpot(EFightSpot.Right, math.random(80) + 79);
        end
        target:SetJump(newPos.x, newPos.y, false);
      end

      self.interval = 0.1;
      self.cnt = self.cnt + 1;

      if self.cnt == 10 then
        self.cnt = 0;
        self.interval = 0.3;
        self.step = 3;
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
  elseif self.step == 3 then
    if self:CheckInterval() then 
      if target.arrive then
        for i = 0, self.emyNum - 1 do
          target = FightField.fightHum[self.ranEmyIdx[i]];
          target:SetBeh(EFightBeh.None);
          me:PlayEffect(target.colm, target.row, ERolePose.Hit);
        end
        FightField.SetShake(false);
        self.interval = 0.2;
        self.step = 4;
      end
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
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

function PhoenixRabid:RanAttack()
  local target;
  local n;
  local emy = {};
  if self.emyNum == 0 then
    return;
  end

  for i = 0, self.emyNum - 1 do
    emy[i] = i;
  end

  for i = 0, 9 do
    if i < self.emyNum - 1 then
      n = math.random(0, table.Count(emy)- 1); --取亂數(每次減少1)
      self.ranEmyIdx[i] = self.emyIdxAy[emy[n]];
      target = FightField.fightHum[self.ranEmyIdx[i]];

      table.remove(emy, n);
    else
      local rand = math.random(0, 99);                --0~99
      local average = math.round(100/ self.emyNum);     --總數大於100時會有問題
      local choose = math.floor(rand / average);
      if choose > self.emyNum - 1 then
        choose = self.emyNum - 1;
      end

      self.ranEmyIdx[i] = self.emyIdxAy[choose];
      target = FightField.fightHum[self.emyIdxAy[choose]];
    end
    --table.Dump(self.ranEmyIdx);
    self.ranPos[i] = {};
    if target.party_Kind == EFightParty.Left then
      self.ranPos[i].x = target.nowPos.x - 100;
      self.ranPos[i].y = target.nowPos.y - 100 + (math.random(100) - 51);
    else
      self.ranPos[i].x = target.nowPos.x + 100;
      self.ranPos[i].y = target.nowPos.y + (math.random(150) - 51);
    end
  end
end

function PhoenixRabid:Show()
  for k,v in pairs(self.fire) do
    v:Update();
  end  
  table.Clear(self.fight);

  for k, v in pairs(self.fire2) do
    v:Update();
  end
end