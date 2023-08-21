--暈擊
DizzyAtk = InheritsFromBaseAttackSkill();

function DizzyAtk:Update()  
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then     
    newPos = target:GetSpot(EFightSpot.Back, 50);
    me:SetWalk(newPos.x, newPos.y);
    me.roleController:SetIsJumping(true);
    me:SetSpeed(0.52);
    me:SetBeh(EFightBeh.Residual);  --殘影
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
  elseif self.step == 2 then       --是否到達目地點          
    if me.arrive then        
      me.roleController:SetIsJumping(false);        
      me.roleController:FaceTo(target.nowPos);          
      self.step = 3;                  
    end
  elseif self.step == 3 then       
     me.roleController:OneHandAttack();   
     self.step = 4;
  elseif self.step == 4 then       
    if (me.roleController.animationFrame == 1) then        
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky,10000, 50, 1,4, 4, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 255, false, 0);
      me:PlaySound(target.colm, target.row);   --啊!聲
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);  --挨打姿勢

      self.step = 5;           
    end   
  elseif self.step == 5 then   
    if me.roleController.animationId == me.roleController:GetAnimationId(ERolePose.Prepare) then         
      me.roleController:SetIsJumping(true);                       
      local mePos = me:GetChipPos()
      me:SetJump( mePos.x, mePos.y, true ); --設定跳躍的點,False:是否改變方向
      me:SetBeh(EFightBeh.None);          

      self.step = 6;        
    end
  elseif self.step == 6 then 
    if me.arrive then 
      self.step =7;
      self.isLightEnd = true;
      me.roleController:SetIsJumping(false);      
    end
  end
end

--專武暈擊
EW_DizzyAtk = InheritsFromBaseAttackSkill();

function EW_DizzyAtk:InitDrawBlack()
  self.needDrawBlack = true;   
end

function EW_DizzyAtk:Update()  
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then    
    newPos = target:GetSpot(EFightSpot.Back, 50);
    me:SetWalk(newPos.x, newPos.y);
    me.roleController:SetIsJumping(true);
    me:SetSpeed(0.52);
    me:SetBeh(EFightBeh.Residual);  --殘影
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
  elseif self.step == 2 then       --是否到達目地點          
    if me.arrive then        
      me.roleController:SetIsJumping(false);        
      me.roleController:FaceTo(target.nowPos);          
      self.step = 3;                  
    end
  elseif self.step == 3 then       
     me.roleController:OneHandAttack();   
     self.step = 4;
  elseif self.step == 4 then       
    if (me.roleController.animationFrame == 1) then        
      for k, v in pairs(self.emyIdxAy)do 
        target = FightField.fightHum[v];
        FightField.attack[self.humIdx]:SetLightWithOrder(1 + k, EEffectLightDis.Sky,10000, 50, 1,4, 4, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 255, false, 0);
        me:PlaySound(target.colm, target.row);   --啊!聲
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);  --挨打姿勢
      end
      self.step = 5;           
    end   
  elseif self.step == 5 then   
    if me.roleController.animationId == me.roleController:GetAnimationId(ERolePose.Prepare) then         
      me.roleController:SetIsJumping(true);                       
      local mePos = me:GetChipPos()
      me:SetJump( mePos.x, mePos.y, true ); --設定跳躍的點,False:是否改變方向
      me:SetBeh(EFightBeh.None);          

      self.step = 6;
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
  elseif self.step == 6 then 
    if me.arrive then 
      self.step =7;
      self.isLightEnd = true;
      me.roleController:SetIsJumping(false);      
    end
  end
end

--前後暈擊
DizzyAtkDouble = InheritsFromBaseAttackSkill();

function DizzyAtkDouble:InitExtraParameters()
  self.backTarget = self:GetBackTarget();
end

function DizzyAtkDouble:GetBackTarget()
  local target = FightField.fightHum[self.tarIdx];
  --取目標在後者
  local backTarget = nil;
  if target.party_Kind == EFightParty.Left then 
    --取index小
    for k, v in pairs(self.emyIdxAy)do 
      if backTarget == nil then 
        backTarget = v;
      elseif v < backTarget then 
        backTarget = v;
      end
    end
  else
    --取index大
    for k, v in pairs(self.emyIdxAy)do 
      if backTarget == nil then 
        backTarget = v;
      elseif v < backTarget then 
        backTarget = v;
      end
    end
  end
  return backTarget;
end

function DizzyAtkDouble:Free()
  FightField.RestoreFightInfo(self.humIdx)
  for k, v in pairs(self.emyIdxAy) do
    FightField.RestoreFightInfo(v);
  end

  FightField.attack[self.humIdx]:StopAllLight();  
end

function DizzyAtkDouble:Update()  
  local newPos;

  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then     
    target = FightField.fightHum[self.backTarget];
    
    newPos = target:GetSpot(EFightSpot.Back, 50);
    me:SetWalk(newPos.x, newPos.y);
    me.roleController:SetIsJumping(true);
    me:SetSpeed(0.52);
    me:SetBeh(EFightBeh.Residual);  --殘影
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
  elseif self.step == 2 then       --是否到達目地點          
    if me.arrive then        
      me.roleController:SetIsJumping(false);        
      me.roleController:FaceTo(target.nowPos);          
      self.step = 3;                  
    end
  elseif self.step == 3 then       
     me.roleController:OneHandAttack();   
     self.step = 4;
  elseif self.step == 4 then       
    if (me.roleController.animationFrame == 1) then        
      target = FightField.fightHum[self.backTarget];
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky,10965, 50, 1, 5, 5, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y + 30, 30, false, 0);
      me:PlaySound(target.colm, target.row);   --啊!聲
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);  --挨打姿勢
      self.interval = 0.3;
      self.step = 5;           
    end 
  elseif self.step == 5 then 
    if self:CheckInterval() then 
      local targetIdx = self.backTarget;   
      if self.emyNum > 1 then 
        for k, v in pairs(self.emyIdxAy)do
          --取另一目標
          if v ~= self.backTarget then 
            targetIdx = v; 
          end
        end      
      end
      target = FightField.fightHum[targetIdx];
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky,10966, 50, 1, 5, 5, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y + 30, 30, false, 0);      
      me:PlaySound(target.colm, target.row);   --啊!聲
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);  --挨打姿勢
      self.step = 6;
    end    
  elseif self.step == 6 then       
      me.roleController:SetIsJumping(true);                       
      local mePos = me:GetChipPos()
      me:SetJump( mePos.x, mePos.y, true ); --設定跳躍的點,False:是否改變方向         

      self.step = 7;        
  elseif self.step == 7 then 
    if me.arrive then 
      self.step =8;
      self.isLightEnd = true;
      me.roleController:SetIsJumping(false);      
    end
  end
end

--狀態顯示
DizzyAtkMe = InheritsFromBaseStatus();

function DizzyAtkMe:ExtraClose()
  FightField.RestoreFightInfo(self.humIdx, 0);
end

function DizzyAtkMe:Update()  
  local newPos;  

  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then           
    newPos = me:GetChipPos();    
    me:GetStatus(self.statusKind):SetLightWithOrder(1, EEffectLightDis.Body,10139, 50, 1,8, 8, EEffectLightTracer.Stand, newPos.x, newPos.y-30, 30, true, 0);                
    me.roleController:SetIsDead(true);    

    --狀態備份
    FightField.StatusBkUPFightInfo(self.humIdx);        
    self.step = 2;    
  end
end

--狀態顯示
EW_CounterMe = InheritsFromBaseStatus();

function EW_CounterMe:ExtraClose()
  FightField.RestoreFightInfo(self.humIdx, 0);
end

function EW_CounterMe:Update()  
  local newPos;  

  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then 
    if me.party_Kind == EFightParty.Right then 
      me:GetStatus(self.statusKind):SetLightWithOrder(1,EEffectLightDis.Sky, 10433, 80,1,5,5,EEffectLightTracer.StandAni,me.nowPos.x, me.nowPos.y + 40,30, true, 0);
    else
      me:GetStatus(self.statusKind):SetLightWithOrder(1,EEffectLightDis.Sky, 10432, 80,1,5,5,EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y + 40,30, true, 0);
    end
    me:GetStatus(self.statusKind):SetLightWithOrder(2,EEffectLightDis.Sky,10849,100,1,10,10,EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y + 40 ,30, true, 0);
    AudioManager.PlayOnce("AudioClip_WB0014",0);
    self.step = 2;
  elseif self.step == 2 then           
    newPos = me:GetChipPos();    
    me:GetStatus(self.statusKind):SetLightWithOrder(3, EEffectLightDis.Body,10139, 50, 1,8, 8, EEffectLightTracer.Stand, newPos.x, newPos.y-30, 30, true, 0);                
    me.roleController:SetIsDead(true);    
    
    --狀態備份
    FightField.StatusBkUPFightInfo(self.humIdx);        
    self.step = 3;    
  end
end