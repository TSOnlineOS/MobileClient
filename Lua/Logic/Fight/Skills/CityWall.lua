CityWall = InheritsFromBaseAttackSkill();

function CityWall:InitExtraParameters()
  self.lArrow1 = {};
  self.lArrow2 = {};
  self.lArrow3 = {};
end

function CityWall:ExtraClose()
  for k, v in pairs(self.lArrow1)do
    v:Stop();
  end

  for k, v in pairs(self.lArrow2)do
    v:Stop();
  end

  for k, v in pairs(self.lArrow3)do
    v:Stop();
  end
end

function CityWall:Free()
  FightField.RestoreFightInfo(self.humIdx, 3)
  for k, v in pairs(self.emyIdxAy)do
    FightField.RestoreFightInfo(v)
  end  
end

function CityWall:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  
  if self.step == 1 then             
    me.roleController:OneHandAttack();
    me.roleController:SetAnimationForceId(ERolePose.Attack);

    if me.party_Kind == EFightParty.Left then        
      for i=0, self.emyNum-1 do          
        target = FightField.fightHum[self.emyIdxAy[i]];
        self.lArrow1[i] = EffectLight.New(10073,50,3, 3, 6, EEffectLightTracer.Curve, me.nowPos.x-130, me.nowPos.y-me.roleController.height +90,255,false, 120, target.nowPos.x, target.nowPos.y-120,0.72);
        self.lArrow1[i]:SetTimeScale(FightField.timeScale);   
        self.lArrow1[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);    
        self.lArrow1[i].isShade = false;
      end        
    else        
      for i=0, self.emyNum-1 do          
        target = FightField.fightHum[self.emyIdxAy[i]];
        self.lArrow1[i] = EffectLight.New(10072,50, 3, 3, 6,  EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y-me.roleController.height, 255, false, 120, target.nowPos.x, target.nowPos.y-120,0.72);
        self.lArrow1[i]:SetTimeScale(FightField.timeScale);   
        self.lArrow1[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);    
        self.lArrow1[i].isShade = false;
      end
    end
    self.interval = 0.1;
  
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
    self:ArrowMove();
    if self:CheckInterval() then        
      if me.party_Kind == EFightParty.Left then 
        for i=0, self.emyNum-1 do          
          target = FightField.fightHum[self.emyIdxAy[i]];
          self.lArrow2[i] = EffectLight.New(10073,50,3, 3, 6, EEffectLightTracer.Curve, me.nowPos.x-50, me.nowPos.y-me.roleController.height +70,255,false, 120, target.nowPos.x, target.nowPos.y-120,0.72);
          self.lArrow2[i]:SetTimeScale(FightField.timeScale);   
          self.lArrow2[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);    
          self.lArrow2[i].isShade = false;
        end     
      else
        for i=0, self.emyNum-1 do          
          target = FightField.fightHum[self.emyIdxAy[i]];
          self.lArrow2[i] = EffectLight.New(10072,50, 3, 3, 6,  EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y-me.roleController.height, 255, false, 120, target.nowPos.x, target.nowPos.y-120);
          self.lArrow2[i]:SetTimeScale(FightField.timeScale);   
          self.lArrow2[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);    
          self.lArrow2[i].isShade = false;
        end
      end
      self.interval = 0.1;
      self.step = 3;  
    end
  elseif self.step == 3 then 
    self:ArrowMove();
    if self:CheckInterval() then        
      if me.party_Kind == EFightParty.Left then 
        for i=0, self.emyNum-1 do          
          target = FightField.fightHum[self.emyIdxAy[i]];
          self.lArrow3[i] = EffectLight.New(10073,50,3, 3, 6, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y-me.roleController.height ,255,false, 120, target.nowPos.x, target.nowPos.y-120,0.72);
          self.lArrow3[i]:SetTimeScale(FightField.timeScale);   
          self.lArrow3[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);    
          self.lArrow3[i].isShade = false;
        end     
      else
        for i=0, self.emyNum-1 do          
          target = FightField.fightHum[self.emyIdxAy[i]];
          self.lArrow3[i] = EffectLight.New(10072,50, 3, 3, 6,  EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y-me.roleController.height, 255, false, 120, target.nowPos.x, target.nowPos.y-120);
          self.lArrow3[i]:SetTimeScale(FightField.timeScale);   
          self.lArrow3[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);    
          self.lArrow3[i].isShade = false;
        end
      end
      me.roleController:SetAnimationForceFrame(1);
      self.step = 4;  
    end
  elseif self.step == 4 then       
    self:ArrowMove();
    if self.lArrow1[0] ~= nil then
      if self.lArrow1[0].picId == 0 then        
        for i=0, self.emyNum-1 do          
          target = FightField.fightHum[ self.emyIdxAy[i] ];
          me:PlayEffect(target.colm, target.row, ERolePose.Hit,3);
        end
        me:PlaySound(target.colm, target.row);
        self.interval = 0.05;
        self.step = 5;
      end
    end
  elseif self.step == 5 then       
    self:ArrowMove();
    if self:CheckInterval() then        
      for i=0, self.emyNum-1 do          
        FightField.RestoreFightInfo(self.emyIdxAy[i]);
      end
      self.step = 6;        
    end
  elseif self.step == 6 then       
    self:ArrowMove();
    if self.lArrow2[0] ~= nil then
      if self.lArrow2[0].picId == 0 then        
        for i=0, self.emyNum-1 do          
          target = FightField.fightHum[ self.emyIdxAy[i] ];
          me:PlayEffect(target.colm, target.row, ERolePose.Hit,3);
        end
        me:PlaySound(target.colm, target.row);
        self.interval = 0.05;
        self.step = 7;
      end
    end
  elseif self.step == 7 then  
    self:ArrowMove();
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
    if self:CheckInterval() then        
      for i=0, self.emyNum-1 do          
        FightField.RestoreFightInfo(self.emyIdxAy[i]);
      end
      self.step = 8;        
    end     
  elseif self.step == 8 then 
    self:ArrowMove();
    if self.lArrow3[0] ~= nil then
      if self.lArrow3[0].picId == 0 then        
        me:PlaySound(target.colm, target.row);
        self.interval = 0.05;
        self.step = 9;
      end
    end
  elseif self.step == 9 then 
    if self:CheckInterval() then        
      for i=0, self.emyNum-1 do          
        me:PlayEffect(target.colm, target.row, ERolePose.Hit,3);
        FightField.RestoreFightInfo(self.emyIdxAy[i]);
      end
      me.roleController:SetAnimationForceFrame(255); --還原鎖定動作
      me.roleController:SetAnimationForceId(ERolePose.None);
      self.step = 10;                  
      self.isLightEnd = true;
    end
  end
end

function CityWall:ArrowMove()
  local curDist, totalDist;
  local target;
  local page;  
  local me = FightField.fightHum[self.humIdx];

  for i=0, self.emyNum-1 do  
    target = FightField.fightHum[self.emyIdxAy[i]];
    totalDist = math.round((Vector2.New(me.nowPos.x, me.nowPos.y - me.roleController.height) - Vector2.New(target.nowPos.x, target.nowPos.y - 120)).magnitude);         

    if  self.lArrow1[i] ~= nil then     
      curDist = math.round((Vector2.New(me.nowPos.x, me.nowPos.y -me.roleController.height) - self.lArrow1[i].showPos).magnitude);        

      if curDist <= totalDist then       
        page = math.ceil( (curDist/(totalDist+0.01) )*4 ) + 2;        
        self.lArrow1[i]:SetPage(page, page);
      end
    end

    if  self.lArrow2[i] ~= nil then     
      curDist = math.round((Vector2.New(me.nowPos.x, me.nowPos.y -me.roleController.height) - self.lArrow2[i].showPos).magnitude);        

      if curDist <= totalDist then       
        page = math.ceil( (curDist/(totalDist+0.01) )*4 ) + 2;        
        self.lArrow2[i]:SetPage(page, page);
      end
    end

    if  self.lArrow3[i] ~= nil then     
      curDist = math.round((Vector2.New(me.nowPos.x, me.nowPos.y -me.roleController.height) - self.lArrow3[i].showPos).magnitude);        

      if curDist <= totalDist then       
        page = math.ceil( (curDist/(totalDist+0.01) )*4 ) + 2;        
        self.lArrow3[i]:SetPage(page, page);
      end
    end   
  end
end