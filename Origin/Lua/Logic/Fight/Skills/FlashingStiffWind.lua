FlashingStiffWind = InheritsFromBaseAttackSkill();

function FlashingStiffWind:InitExtraParameters()
  self.windBolt = {};
  self.windLight = {};
end

function FlashingStiffWind:ExtraClose()
  ClearLightTable(self.windBolt);
  ClearLightTable(self.windLight);
  self.isLightEnd = true;
end

function FlashingStiffWind:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  self:UpdateIce();

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:SetAnimationForceId(ERolePose.Magic);
   
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky ,10524, 50, 1, 30, 30, EEffectLightTracer.StandAni, me.nowPos.x - 15, me.nowPos.y, 20, true, 70);
    self.interval = 1;
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
  elseif Contains(self.step, 2, 4) then
    if self:CheckInterval() then 
      local defDir, aSpeed;
      local newPos, newPos1;
      me:PlaySound(target.colm, target.row, Attack_Start, 2);
      if me.party_Kind == EFightParty.Right then
        defDir = 0;
      else
        defDir = 3;
      end

      newPos = me:GetSpot(EFightSpot.Front, 30);
      for i = 2, 4 do 
        if me.party_Kind == EFightParty.Right then
          aSpeed = 0.35 + (i -5) * 0.02;
        else
          aSpeed = 0.35 + (i) * -0.05;
        end

        newPos1 = target:RCtoSpot(defDir, i, EFightSpot.Back, 30);
        self.windBolt[i] =  EffectLight.New(10525, 30, 1, 12, 12, EEffectLightTracer.Line, newPos.x, newPos.y, 30, true, 0, newPos1.x, newPos1.y, aSpeed);
        self.windBolt[i]:SetTimeScale(FightField.timeScale);           
        self.windBolt[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      end

      if self.step == 4 then
        for i = 0, self.emyNum - 1 do
          target = FightField.fightHum[self.emyIdxAy[i]];
          me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3);
        end
      end
      self.interval = 0.6;
      self.step = self.step + 1;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      local defDir, aSpeed;
      local newPos, newPos1;
      me:PlaySound(target.colm, target.row, Attack_Start, 2);
      if me.party_Kind == EFightParty.Right then
        defDir = 0;
      else
        defDir = 3;
      end

      newPos = me:GetSpot(EFightSpot.Front, 30);
      for i = 5, 9 do 
        if me.party_Kind == EFightParty.Right then
          aSpeed = 0.35 + (i -5) * 0.02;
        else
          aSpeed = 0.35 + (i - 5) * -0.05;
        end

        newPos1 = target:RCtoSpot(defDir, i - 5, EFightSpot.Back, 30);
        self.windBolt[i] =  EffectLight.New(10525, 30, 1, 12, 12, EEffectLightTracer.Line, newPos.x, newPos.y, 30, true, 0, newPos1.x, newPos1.y, aSpeed);
        self.windBolt[i]:SetTimeScale(FightField.timeScale);  
        self.windBolt[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      end
      self.interval = 0.6;
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
      self.step = 4;
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3);
      end
      self.interval = 1;
      self.step = 6;
    end  
  elseif self.step ==  6 then
    if self:CheckInterval() then 
      self.isLightEnd =true;
      self.step = 7;
    end
  end
end

function FlashingStiffWind:UpdateIce()
  local target;
  local ran;
  local newPos;
  for i = 0, self.emyNum - 1 do
    target = FightField.fightHum[self.emyIdxAy[i]];
    for j = 0, 9 do
      if self.windBolt[j] ~= nil and  self.windBolt[j].picId ~= 0 then
        if math.abs(self.windBolt[j].showPos.x - target.nowPos.x) <= 60 and math.abs(self.windBolt[j].showPos.y - target.nowPos.y) <= 60 then
          if not target:IsInSealStatus() then
            ran = math.random(3);
            if ran == 1 then
              newPos = target:GetSpot(EFightSpot.Back, math.random(80) + 79);
            elseif ran == 2 then
              newPos = target:GetSpot(EFightSpot.Left, math.random(80) + 79);
            else
              newPos = target:GetSpot(EFightSpot.Right, math.random(80) + 79);
            end
            target:SetJump(newPos.x, newPos.y);
            target.roleController:SetIsDead(true);            
          end
          self.windLight[i] = EffectLight.New(10342, 30, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, true, 50);
          self.windLight[i]:SetTimeScale(FightField.timeScale);  
          self.windLight[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
          break;
        end
      end
    end 
  end
end