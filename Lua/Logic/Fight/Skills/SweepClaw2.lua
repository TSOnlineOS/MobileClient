SweepClaw2 = InheritsFromBaseAttackSkill();

function SweepClaw2:InitExtraParameters()
  self.fire = false;                  --是否打出火光
  self.waterLight = {};
end

 function SweepClaw2:ExtraClose()
  ClearLightTable(self.waterLight);  
end

function SweepClaw2:Update()
  local target;
  local total;
  local newPos;
  local me = FightField.fightHum[self.humIdx];

  if self.step == 1 then     
    me.roleController:SetIsDead(true);     
    me.roleController:SetAnimationForceFrame(0);
 
    self.interval = 0.3;
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
    self.step = 2;      
  elseif self.step == 2 then       
    if self:CheckInterval() then        
      me.roleController:SetAnimationForceFrame(3);
      for i=0, self.emyNum-1 do          
        target = FightField.fightHum[self.emyIdxAy[i]];
        me:PlaySound(target.colm, target.row);
        me:PlayEffect(target.colm, target.row, ERolePose.Hit, 4);

        --030613J固態化不做跳移的動作,旋風status時取得方向不對=>會當機
        if not target:IsInSealStatus() then     
          target:SetWalk(target.nowPos.x, target.nowPos.y-118, false);
        end

        self.waterLight[i] = EffectLight.New(10046, 80, 1, 13, 13, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30);
        self.waterLight[i]:SetTimeScale(FightField.timeScale);   
        self.waterLight[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      end
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
    total = 0;
    for i=0, self.emyNum-1 do        
      target = FightField.fightHum[self.emyIdxAy[i]];
      if target.arrive then
        total = total + 1;
      end
    end

    if total == self.emyNum then        
      for i=0, self.emyNum-1 do          
        target = FightField.fightHum[self.emyIdxAy[i]];
        target:SetSpeed(0.12);

        --030613J固態化不做跳移的動作,旋風status時取得方向不對=>會當機            
        if not target:IsInSealStatus() then    
          target:SetJump(target.nowPos.x+20, target.nowPos.y);
        end

        me:PlayEffect(target.colm, target.row, ERolePose.Hit,4);
      end
      self.step = 4;        
    end
  elseif self.step == 4 then       
    total = 0;
    for i=0, self.emyNum-1 do        
      target = FightField.fightHum[self.emyIdxAy[i]];
      if target.arrive then
        total = total + 1;
      end
    end

    if total == self.emyNum then        
      for i=0, self.emyNum-1 do          
        target = FightField.fightHum[self.emyIdxAy[i]];
        target:SetSpeed(0.12);

        --030613J固態化不做跳移的動作,旋風status時取得方向不對=>會當機            
        if not target:IsInSealStatus() then     
          target:SetJump(target.nowPos.x-20, target.nowPos.y);
        end

        me:PlayEffect(target.colm, target.row, ERolePose.Hit, 4);
      end
      self.step = 5;
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
  elseif self.step == 5 then 
    total = 0;
    for i=0, self.emyNum-1 do        
      target = FightField.fightHum[self.emyIdxAy[i]];
      if target.arrive then
        total = total + 1;
      end
    end

    if total == self.emyNum then        
      for i=0, self.emyNum-1 do          
        target = FightField.fightHum[self.emyIdxAy[i]];
        target:SetSpeed(0.12);

        --030613J固態化不做跳移的動作,旋風status時取得方向不對=>會當機 
        if not target:IsInSealStatus() then      
          target:SetJump(target.nowPos.x-20, target.nowPos.y);
        end

        me:PlayEffect(target.colm, target.row, ERolePose.Hit, 4);
      end
      self.step = 6;
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
  elseif self.step == 6 then 
    total = 0;
    for i=0, self.emyNum-1 do        
      target = FightField.fightHum[self.emyIdxAy[i]];
      if target.arrive then
        total = total + 1;
      end
    end

    if total == self.emyNum then        
      for i=0, self.emyNum-1 do          
        target = FightField.fightHum[self.emyIdxAy[i]];
        target:SetSpeed(0.12);

        --030613J固態化不做跳移的動作,旋風status時取得方向不對=>會當機 
        if not target:IsInSealStatus() then      
          target:SetJump(target.nowPos.x+20, target.nowPos.y);
        end

        me:PlayEffect(target.colm, target.row, ERolePose.Hit, 4);
      end
      self.step = 7;        
    end
  elseif self.step == 7 then
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
    total = 0;
    for i=0, self.emyNum-1 do        
      target = FightField.fightHum[self.emyIdxAy[i]];
      if target.arrive then
        total = total + 1;
      end
    end

    if total == self.emyNum then        
      for i=0, self.emyNum-1 do          
        target = FightField.fightHum[self.emyIdxAy[i]];
        target:SetBeh(EFightBeh.Quake);   --設定行為
            
        --030613J固態化不做跳移的動作,旋風status時取得方向不對=>會當機 
        if not target:IsInSealStatus() then
          target:SetWalk(target.nowPos.x, target.nowPos.y);
        end            
        target:SetSpeed(0.72);        
      end
      self.step = 8;        
    end      
  elseif self.step == 8 then 
    if self.waterLight[0] == nil or self.waterLight[0].picId ==0 then      
      for i=0, self.emyNum-1 do        
        target = FightField.fightHum[self.emyIdxAy[i]];
        target:SetBeh(EFightBeh.None);

        newPos = target:GetChipPos();
        target:SetMoment(newPos.x, newPos.y, false);
        --target.isShade=True;
      end

      self.step = 9;
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
      self.isLightEnd = true;
    end    
  end
end