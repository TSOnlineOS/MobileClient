EmperorSeize = InheritsFromBaseAttackSkill();

function EmperorSeize:InitDrawBlack()
  self.needDrawBlack = true;     
end

function EmperorSeize:InitExtraParameters()
  self.lightSnake = {};
  self.lightSmoke = {};

  self.performRandEmyIndex = 0;
  self.randEmyIndex = {}; 
  for k, v in pairs(self.emyIdxAy)do
    local data = {};
    data.value = v;
    data.rand = math.random();
    table.insert(self.randEmyIndex, data);  
  end
  table.sort(self.randEmyIndex, function(a,b) return a.rand > b.rand end);
end

function EmperorSeize:ExtraClose()
  ClearLightTable(self.lightSnake);
  ClearLightTable(self.lightSmoke);
end

function EmperorSeize:Update()  
  local newPos;  
  local colmPos;

  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local attack = FightField.attack[self.humIdx];
  if self.step == 1 then     
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    attack:SetLightWithOrder(1, EEffectLightDis.Ground, 10080, 50, 1, 21, 21, EEffectLightTracer.Stand, me.nowPos.x+6, me.nowPos.y,80, false, 80);
    attack:SetLightWithOrder(2, EEffectLightDis.Body, 10982, 200, 1, 7, 13, EEffectLightTracer.StandAni, me.nowPos.x+6, me.nowPos.y - 30, 20, false, 80);
    self.interval = 1.2;
    self.step = 2;
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
  elseif self.step == 2 then 
    if self:CheckInterval() then      
      me:PlaySound(target.colm, target.row, Attack_Start);
      FightField.SetShake(true);
      for i = 0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        target.roleController:SetAnimationForceId(ERolePose.Hit);
      end

      if target.party_Kind == EFightParty.Left then  --人在左
        colmPos = 1
      else
        colmPos = 2;
      end
      self.interval = 0.1;
      self.step = 3;
    end
  elseif self.step == 3 then       
    if self:CheckInterval() then        
      if target.party_Kind == EFightParty.Left then  --人在左          
        colmPos = 1;
        newPos = target:RCtoSpot(colmPos,0,EFightSpot.Front,30);
        attack:SetLightWithOrder(5, EEffectLightDis.Ground, 10080, 50, 1, 21, 21,EEffectLightTracer.Stand, newPos.x-40, newPos.y-30,80, false, 50);
        attack:SetLightWithOrder(4, EEffectLightDis.Ground, 10080, 50, 1, 21, 21,EEffectLightTracer.Stand, newPos.x-30, newPos.y,80, false, 30);        
        self.lightSmoke[0] = EffectLight.New(10016,80,1,15,15,EEffectLightTracer.Stand, newPos.x-30, newPos.y,30, true, 30);
        self.lightSmoke[0]:SetTimeScale(FightField.timeScale);  
        self.lightSmoke[0]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);
        newPos = target:RCtoSpot(colmPos,2,EFightSpot.Front,30);
        attack:SetLightWithOrder(7, EEffectLightDis.Ground, 10080, 50, 1, 21, 21, EEffectLightTracer.Stand, newPos.x-40, newPos.y-30,80, false, 50);
        attack:SetLightWithOrder(6, EEffectLightDis.Ground, 10080, 50, 1, 21, 21, EEffectLightTracer.Stand, newPos.x-30, newPos.y,80, false, 30);            
        self.lightSmoke[1] = EffectLight.New(10016,80,1,15,15,EEffectLightTracer.Stand, newPos.x-30, newPos.y,30, true, 30);
        self.lightSmoke[1]:SetTimeScale(FightField.timeScale);  
        self.lightSmoke[1]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);
        newPos = target:RCtoSpot(colmPos,4,EFightSpot.Front,30);
        attack:SetLightWithOrder(9,EEffectLightDis.Ground,10080, 50, 1, 21, 21,EEffectLightTracer.Stand, newPos.x-40, newPos.y-30,80, false, 50);
        attack:SetLightWithOrder(8,EEffectLightDis.Ground,10080, 50, 1, 21, 21,EEffectLightTracer.Stand, newPos.x-30, newPos.y,80, false, 30);            
        self.lightSmoke[2] = EffectLight.New(10016,80,1,15,15,EEffectLightTracer.Stand, newPos.x-30, newPos.y,30, true, 30);
        self.lightSmoke[2]:SetTimeScale(FightField.timeScale);  
        self.lightSmoke[2]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);          
      else      
        colmPos = 2;
        newPos = target:RCtoSpot(colmPos,0,EFightSpot.Front,30);
        attack:SetLightWithOrder(5,EEffectLightDis.Ground,10080, 50, 1, 21, 21,EEffectLightTracer.Stand, newPos.x+30, newPos.y+30,80, false, 50);
        attack:SetLightWithOrder(4,EEffectLightDis.Ground,10080, 50, 1, 21, 21,EEffectLightTracer.Stand, newPos.x, newPos.y,80, false, 50);            
        self.lightSmoke[0] = EffectLight.New(10016,80,1,15,15,EEffectLightTracer.Stand, newPos.x+30, newPos.y,30, true, 65);
        self.lightSmoke[0]:SetTimeScale(FightField.timeScale);  
        self.lightSmoke[0]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);  
        newPos = target:RCtoSpot(colmPos,2,EFightSpot.Front,30);
        attack:SetLightWithOrder(7,EEffectLightDis.Ground,10080, 50, 1, 21, 21,EEffectLightTracer.Stand, newPos.x+30, newPos.y+30,80, false, 50);
        attack:SetLightWithOrder(6,EEffectLightDis.Ground,10080, 50, 1, 21, 21,EEffectLightTracer.Stand, newPos.x+30, newPos.y,80, false, 50);           
        self.lightSmoke[1] = EffectLight.New(10016,80,1,15,15,EEffectLightTracer.Stand, newPos.x+30, newPos.y,30, true, 65);
        self.lightSmoke[1]:SetTimeScale(FightField.timeScale);  
        self.lightSmoke[1]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);  
        newPos = target:RCtoSpot(colmPos,4,EFightSpot.Front,30);
        attack:SetLightWithOrder(9,EEffectLightDis.Ground,10080, 50, 1, 21, 21,EEffectLightTracer.Stand, newPos.x+30, newPos.y+30,80, false, 50);
        attack:SetLightWithOrder(8,EEffectLightDis.Ground,10080, 50, 1, 21, 21,EEffectLightTracer.Stand, newPos.x, newPos.y,80, false, 50);            
        self.lightSmoke[2] = EffectLight.New(10016,80,1,15,15,EEffectLightTracer.Stand, newPos.x+30, newPos.y,30, true, 65);
        self.lightSmoke[2]:SetTimeScale(FightField.timeScale);  
        self.lightSmoke[2]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);  
      end
      self.interval = 0.03;
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
    if self:CheckInterval() then      
      if target.party_Kind == EFightParty.Left then  --人在左      
        colmPos = 1;
        --右邊土堆
        newPos = target:RCtoSpot(colmPos,0,EFightSpot.Front,30);        
        self.lightSnake[0] = EffectLight.New(20024,150,1,11,11, EEffectLightTracer.Stand, newPos.x-100, newPos.y-10,255, false, 0);           
        self.lightSnake[1] = EffectLight.New(20022,160,1,10,10, EEffectLightTracer.Stand, newPos.x-100, newPos.y,255, false, 0);           
        --中間土堆
        newPos = target:RCtoSpot(colmPos,2,EFightSpot.Front,30);        
        self.lightSnake[2] = EffectLight.New(20025,120,1,10,10, EEffectLightTracer.Stand, newPos.x-100, newPos.y,255, false, 0);                      
        self.lightSnake[3] = EffectLight.New(20027,120,1,10,10,EEffectLightTracer.Stand, newPos.x-50,newPos.y,255, false, 0);                 
        --左邊土堆
        newPos = target:RCtoSpot(colmPos,4,EFightSpot.Front,30);          
        self.lightSnake[4] = EffectLight.New(20023,130,1,10,10,EEffectLightTracer.Stand, newPos.x-80, newPos.y,255, false, 0);                               
        self.lightSnake[5] = EffectLight.New(20026,100,1,10,10,EEffectLightTracer.Stand, newPos.x-80, newPos.y-30,255, false, 0);      
      else      
        colmPos = 2;
        --右邊土堆蛇
        newPos = target:RCtoSpot(colmPos,0,EFightSpot.Front,30);          
        self.lightSnake[0] = EffectLight.New(20024,150,1,11,11,EEffectLightTracer.Stand, newPos.x-30, newPos.y,255, false, 10);
        self.lightSnake[1] = EffectLight.New(20022,160,1,10,10,EEffectLightTracer.Stand, newPos.x-30, newPos.y,255, false, 80);
        --中間土堆蛇
        newPos = target:RCtoSpot(colmPos,2,EFightSpot.Front,30);        
        self.lightSnake[2] = EffectLight.New(20025,120,1,10,10,EEffectLightTracer.Stand, newPos.x-30, newPos.y,255, false, 80);                                               
        self.lightSnake[3] = EffectLight.New(20027,120,1,10,10,EEffectLightTracer.Stand, newPos.x-20,newPos.y,255, false, 70);
        --左邊土堆蛇
        newPos = target:RCtoSpot(colmPos,4,EFightSpot.Front,30);        
        self.lightSnake[4] = EffectLight.New(20023,130,1,10,10,EEffectLightTracer.Stand, newPos.x+20, newPos.y,255, false, 80);                                                      
        self.lightSnake[5] = EffectLight.New(20026,100,1,10,10,EEffectLightTracer.Stand, newPos.x   ,newPos.y,255, false, 50);        
      end
      for i =0, 5 do          
        self.lightSnake[i]:SetTimeScale(FightField.timeScale);  
        self.lightSnake[i]:SetSortingOrder(FightField.FIGHT_SKY_ORDER);                                                      
      end     

      self.interval = 0.4;
      self.step = 5;        
    end
  elseif self.step == 5 then       
    if self:CheckInterval() then       

      if self.performRandEmyIndex == self.emyNum then 
        self.interval = 2;
        self.step = 6;
      else
        target = FightField.fightHum[ self.emyIdxAy[ self.performRandEmyIndex] ];
        me:PlaySound(target.colm, target.row, Attack_Hit);
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);  --挨打姿勢
        target.roleController:Hit();

        local rand = math.random();        
        local randX = math.random(0, 60) - 30;
        local randY = math.random(0, 60) - 30;
        attack:SetLightWithOrder(10 + self.performRandEmyIndex,EEffectLightDis.Sky,10342, 50 + rand * 50, 1, 10, 10,EEffectLightTracer.StandAni, target.nowPos.x + randX, target.nowPos.y + randY,80, false, 50);
        rand = math.random(75, 100) / 100;
        attack.lights[10 + self.performRandEmyIndex]:SetScale(Vector3.New(rand, rand, 1));

        self.performRandEmyIndex =  self.performRandEmyIndex + 1;
        self.interval = 0.1;
      end
    end    
  elseif self.step == 6 then 
    if self:CheckInterval() then      
      self.step = 7;
      FightField.SetShake(false);
      self.isLightEnd = true;
    end    
  end
end