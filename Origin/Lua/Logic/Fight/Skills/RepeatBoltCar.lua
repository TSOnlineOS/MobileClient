RepeatBoltCar = InheritsFromBaseAttackSkill();

function RepeatBoltCar:InitExtraParameters()
  self.isHit = false;
  self.lArrow1 = {}; --TLight;  max:6
  self.lArrow2 = {}; --TLight;  max:6
  self.lArrow3 = {}; --TLight;  max:6
  self.lArrow4 = {}; --TLight;  max:6
  self.hit = {};  --TLight;  max:6
end

function RepeatBoltCar:ExtraClose()
  ClearLightTable(self.lArrow1);
  ClearLightTable(self.lArrow2);
  ClearLightTable(self.lArrow3);
  ClearLightTable(self.lArrow4);
  ClearLightTable(self.hit);
end

function RepeatBoltCar:Update()  
  local idx, idx2;
  local picId;

  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  
  if self.step == 1 then     
    me.roleController:OneHandAttack();                
    if me.party_Kind == EFightParty.Right then        
      idx = 0;
      picId = 10072;        
    else        
      idx = 2;
      picId = 10073;
    end

    if target.row < 2 then
      idx2 = 0
    elseif target.row == 2 then
      idx2 = 1
    else
      idx2 = 2;
    end

    for i =0, 1 do
      for j=0, 2 do        
        local chipPos = FightField.chip[i+idx][j+idx2];
        self.lArrow1[i*3+j] = EffectLight.New(picId,50,3,3,6, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y-me.roleController.height, 255,
                                                                     false, 120, chipPos.x, chipPos.y-120);     
        self.lArrow1[i*3+j]:SetTimeScale(FightField.timeScale);                                                                                                                                    
        self.lArrow1[i*3+j]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);  
        self.lArrow1[i*3+j].isShade = false;
      end
    end
        
    self.interval = 0.1;
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
    self:ArrowMove();
    if self:CheckInterval() then        
      if me.party_Kind == EFightParty.Right then          
        idx = 0;
        picId = 10072;          
      else          
        idx = 2;
        picId = 10073;
      end

      if target.row < 2 then
        idx2 = 0
      elseif target.row == 2 then
        idx2 = 1
      else
        idx2 = 2;
      end

      for i =0, 1 do
        for j=0, 2 do        
          local chipPos = FightField.chip[i+idx][j+idx2];
          self.lArrow2[i*3+j] = EffectLight.New(picId,50,3,3,6, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y-me.roleController.height, 255,
                                                                       false, 120, chipPos.x, chipPos.y-120);       
          self.lArrow2[i*3+j]:SetTimeScale(FightField.timeScale);                                                                                                                                      
          self.lArrow2[i*3+j]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);   
          self.lArrow2[i*3+j].isShade = false;
        end
      end

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

      if target.row < 2 then
        idx2 = 0
      elseif target.row == 2 then
        idx2 = 1
      else
        idx2 = 2;
      end

      for i =0, 1 do
        for j=0, 2 do        
          local chipPos = FightField.chip[i+idx][j+idx2];
          self.lArrow3[i*3+j] = EffectLight.New(picId,50,3,3,6, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y-me.roleController.height, 255,
                                                                       false, 120, chipPos.x, chipPos.y-120);      
          self.lArrow3[i*3+j]:SetTimeScale(FightField.timeScale);                                                                       
          self.lArrow3[i*3+j]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);                                                                              
          self.lArrow3[i*3+j].isShade = false;
        end
      end

      self.interval = 0.1;
      self.step = 4;         
    end
  elseif self.step == 4 then     
    self:ArrowMove()
    if self:CheckInterval() then
      if me.party_Kind == EFightParty.Right then          
        idx = 0;
        picId = 10072;          
      else      
        idx = 2;
        picId = 10073;
      end

      if target.row < 2 then
        idx2 = 0
      elseif target.row == 2 then
        idx2 = 1
      else
        idx2 = 2;
      end

      for i =0, 1 do
        for j=0, 2 do        
          local chipPos = FightField.chip[i+idx][j+idx2];
          self.lArrow4[i*3+j] = EffectLight.New(picId,50,3,3,6, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y-me.roleController.height, 255,
                                                                       false, 120, chipPos.x, chipPos.y-120);   
          self.lArrow4[i*3+j]:SetTimeScale(FightField.timeScale);                                                                       
          self.lArrow4[i*3+j]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);                                                                                 
          self.lArrow4[i*3+j].isShade = false;
        end
      end
      self.step = 5;         
    end
  elseif self.step == 5 then       
    self:ArrowMove();
    local num = math.ceil(self.emyNum / 3);
    if self.lArrow1[num] ~= nil then
      if self.lArrow1[num].picId == 0 then        
        for i =0, self.emyNum-1 do          
          target = FightField.fightHum[self.emyIdxAy[i]];
          me:PlaySound(target.colm, target.row);   
          me:PlayEffect(target.colm, target.row, ERolePose.Hit ,2);
          self.hit[i] = EffectLight.New(10000,40,1,4,4,EEffectLightTracer.StandAni,target.nowPos.x+ math.random(0, 60) - 30 ,target.nowPos.y + math.random(0, 60) ,255, false, 0);  
          self.hit[i]:SetTimeScale(FightField.timeScale);
          self.hit[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);             
          self.hit[i].isShade = false;
        end
        self.interval = 0.05;
        self.step = 6;
      end
    end
  elseif self.step == 6 then     
    self:ArrowMove();
    if self:CheckInterval() then        
      for i=0, self.emyNum-1 do          
        FightField.RestoreFightInfo(self.emyIdxAy[i]);
      end
      self.step = 7;
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
  elseif self.step == 7 then     
    self:ArrowMove();
    local num = math.ceil(self.emyNum / 3);

    if self.lArrow2[num] ~= nil then
      if self.lArrow2[num].picId == 0 then        
        me:PlaySound(target.colm, target.row);   
        self.interval = 0.05;
        self.step = 8;
      end
    end
  elseif self.step == 8 then     
    self:ArrowMove();
    if self:CheckInterval() then        
      for i=0, self.emyNum-1 do          
        FightField.RestoreFightInfo(self.emyIdxAy[i]);
      end      
      self.step = 9;        
    end
  elseif self.step == 9 then
    self:ArrowMove();
    local num = math.ceil(self.emyNum / 3);     
    if self.lArrow3[num]~= nil then
      if self.lArrow3[num].picId == 0 then        
        for i=0, self.emyNum-1 do          
          target = FightField.fightHum[self.emyIdxAy[i]];
          me:PlaySound(target.colm, target.row);   
          me:PlayEffect(target.colm, target.row, ERolePose.Hit, 2);
          self.hit[i] =EffectLight.New(10000,40,1,4,4, EEffectLightTracer.StandAni, target.nowPos.x+ math.random(0, 60) - 30, target.nowPos.y+ math.random(0, 60) - 30 ,255, false, 0);
          self.hit[i]:SetTimeScale(FightField.timeScale);
          self.hit[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);     
          self.hit[i].isShade = false;
        end

        self.interval = 0.05;
        self.step = 10;
      end
    end
  elseif self.step == 10 then       
    self:ArrowMove();
    if self:CheckInterval() then        
      for i=0, self.emyNum-1 do          
        FightField.RestoreFightInfo(self.emyIdxAy[i]);
      end
      self.step = 11;
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
  elseif self.step == 11 then       
    self:ArrowMove();
    local num = math.ceil(self.emyNum / 3);   
    if self.lArrow4[num]~= nil then
      if self.lArrow4[num].picId == 0 then        
        me:PlaySound(target.colm, target.row);
        self.interval = 0.05;
        self.step = 12;
      end
    end
  elseif self.step == 12 then           
    if self:CheckInterval() then        
      me.roleController:SetAnimationForceId(ERolePose.None);
      self.step = 13;
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
      self.isLightEnd = true;                
    end      
  end  
end

function RepeatBoltCar:ArrowMove()
  local curDist, totalDist;  
  local page
  local idx;

  local me =FightField.fightHum[self.humIdx];

  if me.party_Kind == EFightParty.Right then
    idx = 0;
  else
    idx = 2;
  end

  for i =0, 1 do
    for j=0, 2 do  
      if self.lArrow1[i*3+j] ~= nil then    
        curDist = math.round((Vector2.New(me.nowPos.x, me.nowPos.y - me.roleController.height) - self.lArrow1[i*3+j].showPos).magnitude);
        totalDist = math.round((Vector2.New(me.nowPos.x, me.nowPos.y - me.roleController.height) - Vector2.New(FightField.chip[i+idx][j+1].x, FightField.chip[i+idx][j+1].y +120)).magnitude);
        if curDist <= totalDist then      
          page = math.ceil((curDist/(totalDist+0.01) )*4);
          page = page + 2;
          self.lArrow1[i*3+j]:SetPage(page, page);        
        end
      end

      if self.lArrow2[i*3+j] ~= nil then    
        curDist = math.round((Vector2.New(me.nowPos.x, me.nowPos.y - me.roleController.height) - self.lArrow2[i*3+j].showPos).magnitude);
        totalDist = math.round((Vector2.New(me.nowPos.x, me.nowPos.y - me.roleController.height) - Vector2.New(FightField.chip[i+idx][j+1].x, FightField.chip[i+idx][j+1].y +120)).magnitude);
        if curDist <= totalDist then      
          page = math.ceil((curDist/(totalDist+0.01) )*4);
          page = page + 2;
          self.lArrow2[i*3+j]:SetPage(page, page);        
        end
      end

      if self.lArrow3[i*3+j] ~= nil then    
        curDist = math.round((Vector2.New(me.nowPos.x, me.nowPos.y - me.roleController.height) - self.lArrow3[i*3+j].showPos).magnitude);
        totalDist = math.round((Vector2.New(me.nowPos.x, me.nowPos.y - me.roleController.height) - Vector2.New(FightField.chip[i+idx][j+1].x, FightField.chip[i+idx][j+1].y +120)).magnitude);
        if curDist <= totalDist then      
          page = math.ceil((curDist/(totalDist+0.01) )*4);
          page = page + 2;
          self.lArrow3[i*3+j]:SetPage(page, page);        
        end
      end

      if self.lArrow3[i*3+j] ~= nil then    
        curDist = math.round((Vector2.New(me.nowPos.x, me.nowPos.y - me.roleController.height) - self.lArrow3[i*3+j].showPos).magnitude);
        totalDist = math.round((Vector2.New(me.nowPos.x, me.nowPos.y - me.roleController.height) - Vector2.New(FightField.chip[i+idx][j+1].x, FightField.chip[i+idx][j+1].y +120)).magnitude);
        if curDist <= totalDist then      
          page = math.ceil((curDist/(totalDist+0.01) )*4);
          page = page + 2;
          self.lArrow3[i*3+j]:SetPage(page, page);        
        end
      end
    end
  end
end