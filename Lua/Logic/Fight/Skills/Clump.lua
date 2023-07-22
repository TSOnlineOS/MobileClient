Clump = InheritsFromBaseAttackSkill();

function Clump:Update()  
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self.step == 1 then     
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    --土魔法陣
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground,10080,50,1,21,21, EEffectLightTracer.StandAni, me.nowPos.x+6, me.nowPos.y,20, true, 80);

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
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10023, 70, 1,8, 8, EEffectLightTracer.Stand,
                                          target.nowPos.x, target.nowPos.y, 255, false, 30);
      self.step = 3;        
    end
  elseif self.step == 3 then     
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].orderCount == 4 then        
      --人被擊中處理
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10016, 70, 1,15, 15, EEffectLightTracer.Stand,
                                             target.nowPos.x-10, target.nowPos.y+20, 35, false, 30);
      self.step = 4;
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
  elseif self.step == 4 then       
    if (FightField.attack[self.humIdx].lights[EEffectLightKind.Sky2].orderCount==14) then          
      self.isLightEnd = true;            
      self.step = 5;          
    end
  end
end

--狀態效果
ClumpMe = InheritsFromBaseStatus();

function ClumpMe:ExtraClose()
  FightField.fightHum[self.humIdx].roleController:SetAnimationForceId(ERolePose.None);
  FightField.RestoreFightInfo(self.humIdx, 0);
end

function ClumpMe:Update()  
  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then           
    me.roleController:SetAnimationForceId(ERolePose.Hit);                
    me:GetStatus(self.statusKind):SetLight(EEffectLightKind.Body1, 10023, 70, 8,8, 8, EEffectLightTracer.Stand,
                                          me.nowPos.x, me.nowPos.y, 255, false, 30);        
    self.step = 2;                    
  end
end

ClumpAtk = InheritsFromBaseAttackSkill();

function ClumpAtk:Update()  
  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then     
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10023, 70, 1,8, 8, EEffectLightTracer.Stand,
                                          me.nowPos.x, me.nowPos.y, 255, false, 30);
    self.step =2;                                                  
  elseif self.step == 2 then           
    if FightField.attack[self.humIdx].lights[1].orderCount == 4 then      
      --人被擊中處理
      me:PlayEffect(me.colm, me.row, ERolePose.Hit);
      FightField.attack[self.humIdx]:SetLight(2, 10016, 70, 1,15, 15, EEffectLightTracer.Stand,
                                           me.nowPos.x-10, me.nowPos.y+20, 35, false, 30);
      self.step = 3;        
    end
  elseif self.step == 3 then        
    self.isLightEnd = true; --特技施展完畢
  end
end

Clump3 = InheritsFromBaseAttackSkill();

function Clump3:InitExtraParameters()
  self.smoke = {};
  self.light = {}
end


 function Clump3:ExtraClose()
  for k,v in pairs(self.smoke)do
    v:Stop();
  end

  for k,v in pairs(self.light)do
    v:Stop();
  end
end

function Clump3:Update()
  local target;

  local me = FightField.fightHum[self.humIdx];
  target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10080, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 6, me.nowPos.y, 20, true, 80);
    self.interval = 0.8;
    self.step = 2;
  elseif self.step == 2 then 
    if self:CheckInterval() then
      for i = 0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];        
        self.light[i] = EffectLight.New(10023, 70, 1, 8, 8, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 255, false, 30);
        self.light[i]:SetTimeScale(FightField.timeScale);   
        self.light[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      end
     self.step = 3;
    end
  elseif self.step == 3 then 
    if self.light[0].orderCount == 4 then
      for i = 0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];        
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);
        self.smoke[i] = EffectLight.New(10016, 70, 1, 15, 15, EEffectLightTracer.Stand, target.nowPos.x - 10, target.nowPos.y + 20, 35, false, 30);
        self.smoke[i]:SetTimeScale(FightField.timeScale);   
        self.smoke[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      end
      self.step = 4;
    end
  elseif self.step == 4 then
    if self.smoke[0].orderCount == 14 then
      self.isLightEnd = true;
      self.step = 5;
    end
  end
end