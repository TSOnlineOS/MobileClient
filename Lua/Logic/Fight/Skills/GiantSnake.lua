GiantSnake = InheritsFromBaseAttackSkill();

function GiantSnake:InitExtraParameters()
  self.lightSnake = {};
  self.lightSmoke = {};  
end

function GiantSnake:ExtraClose()
  ClearLightTable(self.lightSnake);
  ClearLightTable(self.lightSmoke);  
  self:ShowTurtle()
end

function GiantSnake:ShowTurtle()
  FightField.SetRoleVisibleByID(38361, ERoleVisible.Visible);
  FightField.SetRoleVisibleByID(38362, ERoleVisible.Visible);
  FightField.SetRoleVisibleByID(38363, ERoleVisible.Visible);
end

function GiantSnake:Update()  
  local newPos;  
  local colmPos;

  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local attack = FightField.attack[self.humIdx];
  if self.step == 1 then     
    newPos = me:GetMagicPos();
    if me.isTurtle == false then 
      me:SetMoment(newPos.x, newPos.y, false);    
      me.roleController:SetAnimationForceId(ERolePose.Magic);
    else
      me.roleController:SetAnimationForceId(ERolePose.Attack);

      local handId = nil;      
      if Between(me.npcId, 38361, 38363)then 
        FightField.SetRoleVisibleByID(38361, ERoleVisible.Hide);      
        if me.npcId == 38363 then        
          handId = 38362;
        else      
          handId = 38363;
        end
      end

      FightField.SetRoleVisibleByID(handId, ERoleVisible.Hide);      
    end
    --030601J土魔法陣
    attack:SetLightWithOrder(1, EEffectLightDis.Ground, 10080, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x+6, me.nowPos.y,20, true, 80);

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
      --地裂
      newPos = target:RCtoSpot(colmPos,0, EFightSpot.Back ,10);
      attack:SetLightWithOrder(1, EEffectLightDis.Ground, 10171, 150, 1, 6, 6, EEffectLightTracer.Stand, newPos.x, newPos.y,255, false, 100);
      newPos = target:RCtoSpot(colmPos,2, EFightSpot.Back, 40);
      attack:SetLightWithOrder(2, EEffectLightDis.Ground, 10171, 150, 1, 6, 6, EEffectLightTracer.Stand, newPos.x, newPos.y,255, false, 100);
      newPos = target:RCtoSpot(colmPos, 4, EFightSpot.Back, 30);
      attack:SetLightWithOrder(3, EEffectLightDis.Ground, 10171, 150, 1, 6, 6, EEffectLightTracer.Stand, newPos.x, newPos.y,255, false, 100);
      self.step = 3;
    end
  elseif self.step == 3 then       
    if attack.lights[3].orderCount == 5 then        
      if target.party_Kind == EFightParty.Left then  --人在左          
        colmPos = 1;
        --右邊土堆
        newPos = target:RCtoSpot(colmPos,0,EFightSpot.Front,30);
        attack:SetLightWithOrder(5, EEffectLightDis.Ground, 10503, 50, 1, 3, 7,EEffectLightTracer.Stand, newPos.x-40, newPos.y-30,255, false, 50);
        attack:SetLightWithOrder(4, EEffectLightDis.Ground, 10504, 50, 1, 3, 7,EEffectLightTracer.Stand, newPos.x-30, newPos.y,255, false, 30);        
        self.lightSmoke[0] = EffectLight.New(10016,80,1,15,15,EEffectLightTracer.Stand, newPos.x-30, newPos.y,30, true, 30);
        self.lightSmoke[0]:SetTimeScale(FightField.timeScale);  
        self.lightSmoke[0]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);
        --中間土堆
        newPos = target:RCtoSpot(colmPos,2,EFightSpot.Front,30);
        attack:SetLightWithOrder(7, EEffectLightDis.Ground, 10503, 50, 1, 3, 7, EEffectLightTracer.Stand, newPos.x-40, newPos.y-30,255, false, 50);
        attack:SetLightWithOrder(6, EEffectLightDis.Ground, 10504, 50, 1, 3, 7, EEffectLightTracer.Stand, newPos.x-30, newPos.y,255, false, 30);            
        self.lightSmoke[1] = EffectLight.New(10016,80,1,15,15,EEffectLightTracer.Stand, newPos.x-30, newPos.y,30, true, 30);
        self.lightSmoke[1]:SetTimeScale(FightField.timeScale);  
        self.lightSmoke[1]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);
        --左邊土堆
        newPos = target:RCtoSpot(colmPos,4,EFightSpot.Front,30);
        attack:SetLightWithOrder(9,EEffectLightDis.Ground,10503,50,1,3,7,EEffectLightTracer.Stand, newPos.x-40, newPos.y-30,255, false, 50);
        attack:SetLightWithOrder(8,EEffectLightDis.Ground,10504,50,1,3,7,EEffectLightTracer.Stand, newPos.x-30, newPos.y,255, false, 30);            
        self.lightSmoke[2] = EffectLight.New(10016,80,1,15,15,EEffectLightTracer.Stand, newPos.x-30, newPos.y,30, true, 30);
        self.lightSmoke[2]:SetTimeScale(FightField.timeScale);  
        self.lightSmoke[2]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);          
      else      
        colmPos = 2;
        --右邊土堆
        newPos = target:RCtoSpot(colmPos,0,EFightSpot.Front,30);
        attack:SetLightWithOrder(5,EEffectLightDis.Ground,10503,50,1,3,7,EEffectLightTracer.Stand, newPos.x+30, newPos.y+30,255, false, 50);
        attack:SetLightWithOrder(4,EEffectLightDis.Ground,10504,50,1,3,7,EEffectLightTracer.Stand, newPos.x, newPos.y,255, false, 50);            
        self.lightSmoke[0] = EffectLight.New(10016,80,1,15,15,EEffectLightTracer.Stand, newPos.x+30, newPos.y,30, true, 65);
        self.lightSmoke[0]:SetTimeScale(FightField.timeScale);  
        self.lightSmoke[0]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);  
        --中間土堆
        newPos = target:RCtoSpot(colmPos,2,EFightSpot.Front,30);
        attack:SetLightWithOrder(7,EEffectLightDis.Ground,10503,50,1,3,7,EEffectLightTracer.Stand, newPos.x+30, newPos.y+30,255, false, 50);
        attack:SetLightWithOrder(6,EEffectLightDis.Ground,10504,50,1,3,7,EEffectLightTracer.Stand, newPos.x+30, newPos.y,255, false, 50);           
        self.lightSmoke[1] = EffectLight.New(10016,80,1,15,15,EEffectLightTracer.Stand, newPos.x+30, newPos.y,30, true, 65);
        self.lightSmoke[1]:SetTimeScale(FightField.timeScale);  
        self.lightSmoke[1]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);  
        --左邊土堆
        newPos = target:RCtoSpot(colmPos,4,EFightSpot.Front,30);
        attack:SetLightWithOrder(9,EEffectLightDis.Ground,10503,50,1,3,7,EEffectLightTracer.Stand, newPos.x+30, newPos.y+30,255, false, 50);
        attack:SetLightWithOrder(8,EEffectLightDis.Ground,10504,50,1,3,7,EEffectLightTracer.Stand, newPos.x, newPos.y,255, false, 50);            
        self.lightSmoke[2] = EffectLight.New(10016,80,1,15,15,EEffectLightTracer.Stand, newPos.x+30, newPos.y,30, true, 65);
        self.lightSmoke[2]:SetTimeScale(FightField.timeScale);  
        self.lightSmoke[2]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);  
      end
      self.interval = 0.03;
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
      if target.party_Kind == EFightParty.Left then  --人在左      
        colmPos = 1;
        --右邊土堆
        newPos = target:RCtoSpot(colmPos,0,EFightSpot.Front,30);        
        self.lightSnake[0] = EffectLight.New(10498,120,1,10,10, EEffectLightTracer.Stand, newPos.x-100, newPos.y-10,255, false, 0);
        self.lightSnake[0]:SetTimeScale(FightField.timeScale);  
        self.lightSnake[0]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);            
        self.lightSnake[1] = EffectLight.New(10494,130,1,10,10, EEffectLightTracer.Stand, newPos.x-100, newPos.y,255, false, 0);
        self.lightSnake[1]:SetTimeScale(FightField.timeScale);  
        self.lightSnake[1]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);            
        --中間土堆
        newPos = target:RCtoSpot(colmPos,2,EFightSpot.Front,30);        
        self.lightSnake[2] = EffectLight.New(10493,160,1,10,10, EEffectLightTracer.Stand, newPos.x-100, newPos.y,255, false, 0);
        self.lightSnake[2]:SetTimeScale(FightField.timeScale);  
        self.lightSnake[2]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);                      
        self.lightSnake[3] = EffectLight.New(10496,120,1,10,10,EEffectLightTracer.Stand, newPos.x-50,newPos.y,255, false, 0);
        self.lightSnake[3]:SetTimeScale(FightField.timeScale);  
        self.lightSnake[3]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);                      
        --左邊土堆
        newPos = target:RCtoSpot(colmPos,4,EFightSpot.Front,30);          
        self.lightSnake[4] = EffectLight.New(10497,100,1,10,10,EEffectLightTracer.Stand, newPos.x-80, newPos.y,255, false, 0);
        self.lightSnake[4]:SetTimeScale(FightField.timeScale);  
        self.lightSnake[4]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);                                
        self.lightSnake[5] = EffectLight.New(10495,150,1,11,11,EEffectLightTracer.Stand, newPos.x-80, newPos.y-30,255, false, 0);
        self.lightSnake[5]:SetTimeScale(FightField.timeScale);  
        self.lightSnake[5]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);                                       
      else      
        colmPos = 2;
        --右邊土堆蛇
        newPos = target:RCtoSpot(colmPos,0,EFightSpot.Front,30);          
        self.lightSnake[0] = EffectLight.New(10498,120,1,10,10,EEffectLightTracer.Stand, newPos.x-30, newPos.y,255, false, 10);
        self.lightSnake[0]:SetTimeScale(FightField.timeScale);  
        self.lightSnake[0]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);                                               
        self.lightSnake[1] = EffectLight.New(10494,130,1,10,10,EEffectLightTracer.Stand, newPos.x-30, newPos.y,255, false, 80);
        self.lightSnake[1]:SetTimeScale(FightField.timeScale);  
        self.lightSnake[1]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);                                               
        --中間土堆蛇
        newPos = target:RCtoSpot(colmPos,2,EFightSpot.Front,30);        
        self.lightSnake[2] = EffectLight.New(10493,160,1,10,10,EEffectLightTracer.Stand, newPos.x-30, newPos.y,255, false, 80);
        self.lightSnake[2]:SetTimeScale(FightField.timeScale);  
        self.lightSnake[2]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);                                                       
        self.lightSnake[3] = EffectLight.New(10496,120,1,10,10,EEffectLightTracer.Stand, newPos.x-20,newPos.y,255, false, 70);
        self.lightSnake[3]:SetTimeScale(FightField.timeScale);  
        self.lightSnake[3]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);                                                  
        --左邊土堆蛇
        newPos = target:RCtoSpot(colmPos,4,EFightSpot.Front,30);        
        self.lightSnake[4] = EffectLight.New(10497,100,1,10,10,EEffectLightTracer.Stand, newPos.x+20, newPos.y,255, false, 80);
        self.lightSnake[4]:SetTimeScale(FightField.timeScale);  
        self.lightSnake[4]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);                                                            
        self.lightSnake[5] = EffectLight.New(10495,150,1,11,11,EEffectLightTracer.Stand, newPos.x   ,newPos.y,255, false, 50);
        self.lightSnake[5]:SetTimeScale(FightField.timeScale);  
        self.lightSnake[5]:SetSortingOrder(FightField.FIGHT_BODY_ORDER);                                                      
      end

      for i = 0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        me:PlaySound(target.colm, target.row, Attack_Hit);
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);  --挨打姿勢
        target.roleController:SetAnimationForceId(ERolePose.None);        
        target.roleController:Hit();
        target:SetSpeed(0.16);

        --030613J固態化不做跳移的動作,旋風status時取得方向不對=>會當機
        if not target:IsInSealStatus() then
          if Contains(target.colm, 0, 3) then
            newPos = target:GetSpot(EFightSpot.Back, 60)
          elseif Contains(target.colm, 1, 2) then
            newPos = target:GetSpot(EFightSpot.Front, 60);
          end
          target:SetJump(newPos.x,newPos.y,true);
        end
      end

      self.interval = 0.4;
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
      self.step = 5;        
    end
  elseif self.step == 5 then       
    if self:CheckInterval() then       
      for i = 0, self.emyNum-1 do          
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        target.roleController:SetIsDead(true);
      end

      self.interval = 2;
      self.step = 6;
    end    
  elseif self.step == 6 then 
    if self:CheckInterval() then      
      self.step = 7;
      FightField.SetShake(false);
      self.isLightEnd = true;
    end    
  end
end