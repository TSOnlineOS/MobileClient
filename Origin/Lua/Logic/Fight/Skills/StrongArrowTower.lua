StrongArrowTower = InheritsFromBaseAttackSkill();

function StrongArrowTower:InitExtraParameters()
  self.isHit = false;
  self.shootOldTime  = CGTimer.time;
  self.lArrow1 = {}; --TLight  max:5
  self.lArrow2 = {}; --TLight  max:5
  self.hit = {}; --TLight  max:5
end

function StrongArrowTower:ExtraClose()
  ClearLightTable(self.lArrow1);
  ClearLightTable(self.lArrow2);
  ClearLightTable(self.hit);
end

function StrongArrowTower:Update()  
  local idx;
  local picId;

  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];  
  if self.step == 1 then             
    me.roleController:OneHandAttack();
    me.roleController:SetAnimationForceId(me.roleController:GetAnimationId(ERolePose.Attack));

    if me.party_Kind == EFightParty.Right then        
      idx = 0;
      picId = 10053;        
    else    
      idx = 2;
      picId = 10054;
    end
    
    for i=0, 4 do        
      local chipPos = FightField.chip[idx][i];
      self.lArrow1[i] = EffectLight.New(picId,50,3,3,6, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y- me.roleController.height ,255, false, 120, chipPos.x, chipPos.y-120);          
      self.lArrow1[i]:SetTimeScale(FightField.timeScale);   
      self.lArrow1[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);  
      self.lArrow1[i].isShade = false;
    end
    self.shootOldTime = CGTimer.time;
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
      --local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then       
    self:ArrowMove()
    if (CGTimer.time - self.shootOldTime) * 1000 * FightField.timeScale >= 100 then        
      if me.party_Kind == EFightParty.Right then        
        idx = 0;
        picId = 10053;        
      else    
        idx = 2;
        picId = 10054;
      end

      for i=0, 4 do        
        local chipPos = FightField.chip[idx][i];
        self.lArrow2[i] = EffectLight.New(picId,50,3,3,6, EEffectLightTracer.Curve, me.nowPos.x + 20, me.nowPos.y- me.roleController.height -100 ,255, false, 120, chipPos.x + 20, chipPos.y-120 -20);          
        self.lArrow2[i]:SetTimeScale(FightField.timeScale);   
        self.lArrow2[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);  
        self.lArrow2[i].isShade = false;
      end
      self.shootOldTime = CGTimer.time;
      me.roleController:SetAnimationForceFrame(1) --鎖定動作
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
        --local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end      
  elseif self.step == 3 then       
    self:ArrowMove()
    if (CGTimer.time - self.shootOldTime) * 1000 * FightField.timeScale >= 500 then        
      for i=0, self.emyNum-1 do          
        if self.hit[i] == nil then            
          if self.lArrow1[i] ~= nil and self.lArrow1[i].picId == 0 then              
            target = FightField.fightHum[ self.emyIdxAy[i] ];
            me:PlaySound(target.colm, target.row); 
            me:PlayEffect(target.colm, target.row, ERolePose.Hit,1);
            self.hit[i] = EffectLight.New(10466,40,1,6,6, EEffectLightTracer.StandAni,target.nowPos.x + math.random(0, 60) -30, target.nowPos.y + math.random(0, 60) - 30 +50,30,false,0);
            self.hit[i]:SetTimeScale(FightField.timeScale);   
            self.hit[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);    
            self.hit[i].isShade = false;
          end
        end
      end

      for i = 0, 4 do          
        if self.lArrow1[i] == nil then 
          return;
        end

        if self.lArrow1[i].picId ~= 0 then 
          return;
        end
      end

      self.shootOldTime = CGTimer.time;
      self.step = 4;
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
        --local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  elseif self.step == 4 then         
    if (CGTimer.time - self.shootOldTime) * 1000 * FightField.timeScale >=  200 then              
      me.roleController:SetAnimationForceId(ERolePose.None); --還原鎖定動作
      me.roleController:SetAnimationForceFrame(255)
      self.step = 5;
      self.isLightEnd = true;          
    end
  end
end

function StrongArrowTower:ArrowMove()
  local curDist, totalDist;  
  local page;
  local idx;
  local me = FightField.fightHum[self.humIdx];
  
  if me.party_Kind == EFightParty.Right then
    idx = 0
  else
    idx = 2;
  end

  for i=0, 4 do
    local chipPos = FightField.chip[idx][i];
    if  self.lArrow1[i] ~= nil then       
      if self.lArrow1[i].picId == 0 then
        self.lArrow2[i] = nil;
      else     
        curDist = math.round((Vector2.New(me.nowPos.x, me.nowPos.y - me.roleController.height) - self.lArrow1[i].showPos).magnitude);
        totalDist = math.round((Vector2.New(me.nowPos.x, me.nowPos.y - me.roleController.height) - Vector2.New(chipPos.x, chipPos.y -120)).magnitude);
        if curDist <= totalDist then      
          page = math.max( math.ceil( (curDist/(totalDist+0.01) )*6 ), 1);
          self.lArrow1[i]:SetPage(page, page);
        end
      end
    end

    if self.lArrow2[i] ~= nil then
      if self.lArrow2[i].picId == 0 then
        self.lArrow2[i] = nil;
      else      
        curDist = math.round((Vector2.New(me.nowPos.x, me.nowPos.y - me.roleController.height) - self.lArrow2[i].showPos).magnitude);
        totalDist = math.round((Vector2.New(me.nowPos.x, me.nowPos.y - me.roleController.height) - Vector2.New(chipPos.x, chipPos.y -120)).magnitude);

        if curDist <= totalDist then      
          page = math.max( math.ceil( (curDist/(totalDist+0.01) )*6 ), 1);
          self.lArrow2[i]:SetPage(page, page);
        end
      end
    end    
  end
end