HorizontalCrush = InheritsFromBaseAttackSkill();

function HorizontalCrush:InitExtraParameters()
  self.humDownTime = 0;
  self.lightRing = {};

  local fieldPos = Vector2.New(FightField.skillOffset.x, FightField.skillOffset.y);
  self.runAwayX = {};
  self.runAwayX[0] = {fieldPos.x + 350, fieldPos.x + 350, fieldPos.x + 29, fieldPos.x + 29};
  self.runAwayX[1] = {fieldPos.x + 430, fieldPos.x + 430, fieldPos.x + 120, fieldPos.x + 120};
  self.runAwayX[2] = {fieldPos.x + 700, fieldPos.x + 700, fieldPos.x + 350, fieldPos.x + 350};
  self.runAwayX[3] = {fieldPos.x + 764, fieldPos.x + 764, fieldPos.x + 430, fieldPos.x + 430};

  self.runAwayY = {};
  self.runAwayY[0] = {fieldPos.y, fieldPos.y + 180, fieldPos.y + 350, fieldPos.y + 600};
  self.runAwayY[1] = {fieldPos.y, fieldPos.y + 254, fieldPos.y + 367, fieldPos.y + 600};
  self.runAwayY[2] = {fieldPos.y, fieldPos.y + 350, fieldPos.y + 489, fieldPos.y + 600};
  self.runAwayY[3] = {fieldPos.y, fieldPos.y + 365, fieldPos.y + 570, fieldPos.y + 600};
end

function HorizontalCrush:ExtraClose()
  for k, v in pairs(self.emyIdxAy) do
    if FightField.fightHum[v] ~= nil then 
      FightField.fightHum[v]:SetSquelch(MaxSquelch);
    end
  end

  ClearLightTable(self.lightRing);
end

function HorizontalCrush:HumDown()
  local target;
  if self.step < 4 then 
    return;
  end

  if (CGTimer.time - self.humDownTime) * 1000 * FightField.timeScale >= 100 then 
    for i=0, self.emyNum-1 do    
      target = FightField.fightHum[ self.emyIdxAy[i] ];
      if target.squelch > MinSquelch then      
        target.squelch =  target.squelch-1;
      end
      self.humDownTime =  CGTimer.time;
    end
  end
end

function HorizontalCrush:Update()  
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local attack = FightField.attack[self.humIdx];
  self:HumDown();
  if self.step == 1 then     
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    --土魔法陣
    attack:SetLight(EEffectLightKind.Ground,10080,50,1,21,21, EEffectLightTracer.StandAni, me.nowPos.x+6, me.nowPos.y,20, true, 80);
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
      local pos1 = {};
      local pos2 = {};
      pos1.x = self.runAwayX[target.colm][1];
      pos1.y = self.runAwayY[target.colm][1];
      pos2.x = self.runAwayX[target.colm][2];
      pos2.y = self.runAwayY[target.colm][2];
      for i = 1, 3 do
        attack:SetLightWithOrder(5 - i, EEffectLightDis.Sky, 10308, 30, 1, 9, 9, EEffectLightTracer.Line, pos1.x, pos1.y - (i * 30), 255, true, 0, pos2.x, pos2.y, 0.35);
      end
      self.step = 3;        
    end
  elseif self.step == 3 then  
    if attack.lights[4].isArrive then
      local pos = {};
      pos.x = self.runAwayX[target.colm][2];
      pos.y = self.runAwayY[target.colm][2];
            
      attack:SetLightWithOrder(2, EEffectLightDis.Sky, 10308, 30, 1, 9, 9, EEffectLightTracer.StandAni, pos.x - 65, pos.y, 255, true, 0);
      attack:SetLightWithOrder(3, EEffectLightDis.Sky, 10308, 30, 1, 9, 9, EEffectLightTracer.StandAni, pos.x - 40, pos.y - 35, 255, true, 0);
      attack:SetLightWithOrder(4, EEffectLightDis.Sky, 10308, 30, 1, 9, 9, EEffectLightTracer.StandAni, pos.x - 40, pos.y - 70, 255, true, 0);
      for i = 0, 9 do
        self.lightRing[i] = EffectLight.New(10016, 30, 1, 15, 15, EEffectLightTracer.StandAni, pos.x - math.random(0, 60) + math.random(0, 60), pos.y - math.random(0, 60) + math.random(0, 60), 30, true, 30);
        self.lightRing[i]:SetTimeScale(FightField.timeScale);  
        self.lightRing[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      end
      me:PlaySound(target.colm, target.row, Attack_Start);

      self.interval = 0.04;
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
  elseif self.step == 4 then       
    if self:CheckInterval() then
      local pos1 = {};
      local pos2 = {};
      pos1.x = self.runAwayX[target.colm][2];
      pos1.y = self.runAwayY[target.colm][2];
      pos2.x = self.runAwayX[target.colm][3];
      pos2.y = self.runAwayY[target.colm][3];
      for i = 1, 3 do
        attack:SetLightWithOrder(i + 1, EEffectLightDis.Sky, 10308, 30, 1, 9, 9, EEffectLightTracer.Line, pos1.x - (i * 65), pos1.y + (i * 35), 255, true, 0, pos2.x, pos2.y, 0.35);
      end

      for i = 0, self.emyNum-1 do          
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        target.roleController:SetAnimationForceId(ERolePose.Hit);
        attack:SetLightWithOrder(i + 5, EEffectLightDis.Ground, 10010, 200, 1, 4, 4, EEffectLightTracer.Stand, target.nowPos.x + 6, target.nowPos.y, 255, true, 50);

        self.lightRing[i + 5] =EffectLight.New(10016, 30, 1, 15, 15, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 60);
        self.lightRing[i + 5]:SetTimeScale(FightField.timeScale);  
        self.lightRing[i + 5]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      end
      FightField.SetShake(true);
      me:PlaySound(target.colm, target.row);
      self.humDownTime = CGTimer.time;
      self.step = 5;        
    end
  elseif self.step == 5 then       
    if attack.lights[4].isArrive then
      local pos1 = {};
      local pos2 = {};
      pos1.x = self.runAwayX[target.colm][3];
      pos1.y = self.runAwayY[target.colm][3];
      pos2.x = self.runAwayX[target.colm][4];
      pos2.y = self.runAwayY[target.colm][4];
      for i = 1, 3 do
        attack:SetLightWithOrder(5 - i, EEffectLightDis.Sky, 10308, 30, 1, 9, 9, EEffectLightTracer.Line, pos1.x, pos1.y + (i * 30), 255, true, 0, pos2.x, pos2.y, 0.35);
      end
      me:PlaySound(target.colm, target.row, Attack_Start);
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
      self.step = 6;      
    end
  elseif self.step == 6 then 
    if self:CheckInterval() then        
      self.step = 7;
      self.isLightEnd = true;
    end
  end  
end