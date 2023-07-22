ColdAdularia = InheritsFromBaseAttackSkill();

function ColdAdularia:InitExtraParameters()
  self.lightStar = {};
  self.lightFog = {};
  self.lightFire = {};
end

function ColdAdularia:ExtraClose()
  ClearLightTable(self.lightStar);
  ClearLightTable(self.lightFog);
  ClearLightTable(self.lightFire);
  self.isLightEnd = true;
end

function ColdAdularia.ClearLightTable(lights)
  for k, v in pairs(lights) do
    if v ~= nil then
      v:Stop();
    end
  end
  table.Clear(lights);
end

function ColdAdularia:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground ,10070, 50, 1, 32, 32, EEffectLightTracer.Stand, me.nowPos.x + 7, me.nowPos.y, 20, true, 50);
    self.interval = 0.5;
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
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    self.step = 2;
  elseif self.step == 2 then
    if self:CheckInterval() then 
      for i = 0, self.emyNum - 1 do 
        target = FightField.fightHum[self.emyIdxAy[i]];
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 2, EEffectLightDis.Ground, 10083, 50, 1, 6, 12, EEffectLightTracer.Stand, target.nowPos.x + 3, target.nowPos.y, 20, true, 60);
      end
      self.interval = 0.5;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      for k, v in pairs(self.emyIdxAy) do
        target = FightField.fightHum[v];
        me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3);
        self.lightFog[k] = EffectLight.New(10019, 35, 1, 11, 15, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y - 90, 20, false, 0);
        self.lightFog[k]:SetTimeScale(FightField.timeScale);   
        self.lightFog[k]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);        
      end
      
      self.interval = 0.4;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      for i = 0, self.emyNum - 1 do 
        target = FightField.fightHum[self.emyIdxAy[i]];
        me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3);
        self.lightStar[i] = EffectLight.New(10337, 35, 1, 9, 9, EEffectLightTracer.Line, target.nowPos.x + math.random(30) - 1, target.nowPos.y - 100, 255, true, 0, 
                                            target.nowPos.x + math.random(20) - 1, target.nowPos.y + 50, 0.33);
        self.lightStar[i]:SetTimeScale(FightField.timeScale);                                               
        self.lightStar[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);        
      end
    
      self.interval = 0.5;
      self.step = 5;
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      for i = 0, self.emyNum - 1 do 
        target = FightField.fightHum[self.emyIdxAy[i]];
        me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3);
        self.lightStar[i + 4] = EffectLight.New(10337, 35, 1, 9, 9, EEffectLightTracer.Line, target.nowPos.x + math.random(30) - 1, target.nowPos.y - 100, 255, true, 0, 
                                            target.nowPos.x + math.random(20) - 1, target.nowPos.y + 50, 0.33);
        self.lightStar[i + 4]:SetTimeScale(FightField.timeScale);                                               
        self.lightStar[i + 4]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        
        self.lightFire[i] = EffectLight.New(10273, 35, 1, 16, 16, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 30);
        self.lightFire[i]:SetTimeScale(FightField.timeScale);   
        self.lightFire[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 6, EEffectLightDis.Body ,10009, 100, 1, 2, 2, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, false, 60);
      end
    
      self.interval = 0.5;
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
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      self.step = 6;
    end
  elseif self.step == 6 then
    if self:CheckInterval() then 
      for i = 0, self.emyNum - 1 do 
        target = FightField.fightHum[self.emyIdxAy[i]];
        me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3);
        self.lightStar[i + 8] = EffectLight.New(10337, 35, 1, 9, 9, EEffectLightTracer.StandAni, target.nowPos.x + math.random(30) - 1, target.nowPos.y - 80, 255, true, 0, 
                                            target.nowPos.x + math.random(20) - 1, target.nowPos.y + 50, 0.4);
        self.lightStar[i + 8]:SetTimeScale(FightField.timeScale);                                               
        self.lightStar[i + 8]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 6, EEffectLightDis.Body ,10009, 100, 1, 2, 2, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, false, 60);
      end
    
      self.interval = 0.5;
      self.step = 7;
    end
  elseif self.step == 7 then
    if self:CheckInterval() then 
      self.isLightEnd =true;
      self.step = 8;
    end
  end
end