OverlordSlash = InheritsFromBaseAttackSkill();

function OverlordSlash:InitDrawBlack()
  self.needDrawBlack = true;     
end

function OverlordSlash:ExtraClose()
  FightField.fightHum[self.humIdx]:SetShrink(DefShrink);
end

function OverlordSlash:InitExtraParameters()
  self.enlargeOldTime = CGTimer.time;  
  self.enlargeSize = 10;
  self.size = FightField.fightHum[self.humIdx].shrink + self.enlargeSize;   --放大的尺寸
  if self.size > MaxShrink + self.enlargeSize then
    self.size = MaxShrink + self.enlargeSize;
  end

   --放大的尺寸
  if FightField.fightHum[self.humIdx].shrink == DefShrink then 
    self.size = MaxShrink + self.enlargeSize;
  elseif FightField.fightHum[self.humIdx].shrink == MaxShrink then 
    self.size = MaxShrink + self.enlargeSize;
  elseif FightField.fightHum[self.humIdx].shrink == MinShrink then 
    self.size = DefShrink + self.enlargeSize;
  end
end

function OverlordSlash:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetSpeed(1);    
    me:SetWalk(newPos.x, newPos.y, false);    
    me:PlaySound(target.colm, target.row, -1);  
    self.enlargeOldTime = CGTimer.time;
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
      local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then
    if me.arrive then
      if (CGTimer.time - self.enlargeOldTime) * 1000 * FightField.timeScale >= 50 then        
        if me.shrink < MaxShrink + self.enlargeSize then          
          if me.shrink ~= self.size then
            me:SetShrink(me.shrink+4, MaxShrink + self.enlargeSize);
          end    
        else
          me:PlaySound(target.colm, target.row, Attack_Start);  
          FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Body, 10299, 100, 4, 11, 11, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y +35, 30, true, 60);
          FightField.attack[self.humIdx].lights[1]:SetScale(Vector3.New( 3.5, 3.5, 1));

          FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Body, 10132, 100, 5, 12, 15, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y +35, 30, true, 60);
          FightField.attack[self.humIdx].lights[3]:SetScale(Vector3.New( 2, 2, 1));
          self.interval = 0.5;
          self.step = 3;
        end
        self.enlargeOldTime = CGTimer.time;                
      end      
    end
  elseif self.step == 3 then
    if self:CheckInterval() then      
      me.roleController:SetAnimationForceId(ERolePose.Attack);
      me.roleController:SetAnimationForceFrame(0);
      self.step = 4;
      self.interval = 0.2;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then     
      me.roleController:SetAnimationForceFrame(1);
      local newPos;
      if me.party_Kind == EFightParty.Right then 
        newPos = target:RCtoSpot(0 , 2, EFightSpot.Front ,50);                        
      else
        newPos = target:RCtoSpot(2 , 2, EFightSpot.Front ,50);                
      end

      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10291, 150, 1, 18, 18, EEffectLightTracer.StandAni, newPos.x, newPos.y + 175, 30, true, 60);        
      FightField.attack[self.humIdx].lights[2]:SetScale(Vector3.New(2,2,1));
      for k, v in pairs(self.emyIdxAy)do
        target = FightField.fightHum[v];
        target.roleController:SetAnimationForceId(ERolePose.Lie);
        target.roleController:SetAnimationForceFrame(4);
      end
      self.interval = 1;
      self.step = 5;
    end
  elseif self.step == 5 then    
    if(FightField.attack[self.humIdx].lights[2].picId == 0) then 
      FightField.SetShake(true);
      local newPos;
      if me.party_Kind == EFightParty.Right then 
        newPos = target:RCtoSpot(0 , 2, EFightSpot.Front ,50);                
      else
        newPos = target:RCtoSpot(2 , 2, EFightSpot.Front ,50);        
      end
      FightField.attack[self.humIdx]:StopLight(3);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10292, 150, 1, 12, 12, EEffectLightTracer.StandAni, newPos.x, newPos.y + 175, 30, true, 60);        
      FightField.attack[self.humIdx].lights[2]:SetScale(Vector3.New(2,2,1));
      me:PlaySound(target.colm, target.row, Attack_Hit);  
      me.roleController:SetAnimationForceFrame(2);
      for k, v in pairs(self.emyIdxAy)do
        local target = FightField.fightHum[v];
        target.roleController:SetAnimationForceFrame(255);
        target.roleController:SetAnimationForceId(ERolePose.Hit);

        me:PlayEffect(target.colm, target.row, ERolePose.Hit)
      end
      self.interval = 0.1;
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
        local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  elseif self.step == 6 then
    if self:CheckInterval() then 
      me.roleController:SetAnimationForceFrame(3);
    end
    if(FightField.attack[self.humIdx].lights[2].picId == 0) then      
      me.roleController:SetAnimationForceId(ERolePose.None); 
      FightField.SetShake(false);
      self.interval = 0.5;
      self.step = 7;
    end
  elseif self.step == 7 then 
    if self:CheckInterval() then       
      self.isLightEnd = true;
    end
  end
end
