GodArrowTower = InheritsFromBaseAttackSkill();

function GodArrowTower:InitExtraParameters()
  self.isHit = false;
  self.lArrow1 = {};
  self.lArrow2 = {};
  self.lArrow3 = {};
  self.hit = {};
end

function GodArrowTower:ExtraClose()
  ClearLightTable(self.lArrow1);
  ClearLightTable(self.lArrow2);
  ClearLightTable(self.lArrow3);
  ClearLightTable(self.hit);
end

function GodArrowTower:Update()  
  local idx;
  local picId;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  
  if self.step  == 1 then         
    me.roleController:OneHandAttack();
    me.roleController:SetAnimationForceId(ERolePose.Attack);
    if me.party_Kind == EFightParty.Right then        
      idx = 0;
      picId = 10072;        
    else    
      idx = 2;
      picId = 10073;
    end

    for i=0, 1 do
      for j=0, 4 do        
        local chipPos = FightField.chip[i+idx][j];
        self.lArrow1[i*5+j] = EffectLight.New(picId,50,3,3,6, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y - me.roleController.height, 255, false, 120,
                                                    chipPos.x, chipPos.y-120);
        self.lArrow1[i*5+j]:SetTimeScale(FightField.timeScale);  
        self.lArrow1[i*5+j]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);  
        self.lArrow1[i*5+j].isShade = false;
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
    self:ArrowMove();
    if self:CheckInterval() then        
      if me.party_Kind == EFightParty.Right then          
        idx = 0;
        picId = 10072;          
      else      
        idx = 2;
        picId = 10073;
      end

      for i=0, 1 do
        for j=0, 4 do          
          local chipPos = FightField.chip[i+idx][j];
          self.lArrow2[i*5+j] =EffectLight.New(picId,50,3,3,6, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y- me.roleController.height,255,false,120,
                                   chipPos.x,chipPos.y-120);
          self.lArrow2[i*5+j]:SetTimeScale(FightField.timeScale);                                     
          self.lArrow2[i*5+j]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER); 
          self.lArrow2[i*5+j].isShade = false;
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
      self.step = 3;          
    end
  elseif self.step == 3 then          
    self:ArrowMove();
    if self:CheckInterval() then        
      if me.party_Kind == EFightParty.Right then          
        idx = 0;
        picId = 10072;          
      else      
        idx = 2;
        picId = 10073;
      end

      for i =0, 1 do
        for j=0, 4 do
          local chipPos = FightField.chip[i+idx][j];
          self.lArrow3[i*5+j] =EffectLight.New(picId,50,3,3,6, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y- me.roleController.height,255,false,120,
                                   chipPos.x,chipPos.y-120);
          self.lArrow3[i*5+j]:SetTimeScale(FightField.timeScale);  
          self.lArrow3[i*5+j]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER); 
          self.lArrow3[i*5+j].isShade = false;
        end
      end          
      me.roleController:SetAnimationForceFrame(1); --鎖定動作      
      self.step = 4;
    end    
  elseif self.step == 4 then        
    self:ArrowMove();
    if self.lArrow1[0] ~= nil and self.lArrow1[0].picId == 0 then                
      me:PlaySound(target.colm, target.row);   
      self.interval = 0.05;
      self.step = 5;          
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
    if self.lArrow2[0] ~= nil and self.lArrow2[0].picId == 0 then        
      for i=0, self.emyNum-1 do          
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        me:PlayEffect(target.colm, target.row, ERolePose.Hit, 1);
        me:PlaySound(target.colm, target.row); 
        self.hit[i] = EffectLight.New(10000,40,1,4,4, EEffectLightTracer.StandAni, target.nowPos.x+ math.random(0, 60) - 30, target.nowPos.y + math.random(0, 60) - 30, 255, false,0);
        self.hit[i]:SetTimeScale(FightField.timeScale);  
        self.hit[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);             
        self.hit[i].isShade = false;
      end
      self.interval = 0.05;
      self.step = 7;
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
  elseif self.step == 7 then       
    self:ArrowMove();
    if self:CheckInterval() then        
      for i =0, self.emyNum-1 do          
        FightField.RestoreFightInfo(self.emyIdxAy[i]);
      end          
      self.step = 8;        
    end
  elseif self.step == 8 then       
    self:ArrowMove();
    if self.lArrow3[0] ~= nil and self.lArrow3[0].picId == 0 then         
      self.interval = 0.05;
      me:PlaySound(target.colm, target.row);   
      self.step = 9;          
    end    
  elseif self.step == 9 then     
    if self:CheckInterval() then      
      me.roleController:SetAnimationForceFrame(255)  
      me.roleController:SetAnimationForceId(ERolePose.None);                    
      self.step = 10;
      self.isLightEnd = true;
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
  end
end

function GodArrowTower:ArrowMove()
  local curDist, totalDist;  
  local page
  local idx;

  local me = FightField.fightHum[self.humIdx];

  if me.party_Kind == EFightParty.Right then
    idx = 0;
  else
    idx = 2;
  end

  local chipPos;
  for i =0, 1 do
    for j=0, 4 do  
      if  self.lArrow1[i*5+j] ~= nil then    
        curDist = math.round((me.nowPos - self.lArrow1[i*5+j].showPos).magnitude);        
        chipPos = FightField.chip[i+idx][j];
        totalDist = math.round((me.nowPos - Vector2.New(chipPos.x, chipPos.y - 120)).magnitude);          
        if curDist <= totalDist then      
          page = math.ceil((curDist/(totalDist+0.01) )*4);
          page = page + 2;
          self.lArrow1[i*5+j]:SetPage(page, page);
        end
      end

      if  self.lArrow2[i*5+j] ~= nil then    
        curDist = math.round((me.nowPos - self.lArrow2[i*5+j].showPos).magnitude);        
        chipPos = FightField.chip[i+idx][j];
        totalDist = math.round((me.nowPos - Vector2.New(chipPos.x, chipPos.y - 120)).magnitude);          
        if curDist <= totalDist then      
          page = math.ceil((curDist/(totalDist+0.01) )*4);
          page = page + 2;
          self.lArrow2[i*5+j]:SetPage(page, page);
        end
      end


      if  self.lArrow3[i*5+j] ~= nil then    
        curDist = math.round((me.nowPos - self.lArrow3[i*5+j].showPos).magnitude);        
        chipPos = FightField.chip[i+idx][j];
        totalDist = math.round((me.nowPos - Vector2.New(chipPos.x, chipPos.y - 120)).magnitude);          
        if curDist <= totalDist then      
          page = math.ceil((curDist/(totalDist+0.01) )*4);
          page = page + 2;
          self.lArrow3[i*5+j]:SetPage(page, page);
        end
      end
    end  
  end
end