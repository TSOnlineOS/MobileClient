--肉包衝鋒
BunCharge = InheritsFromBaseAttackSkill();

function BunCharge:ExtraClose()
  FightField.fightHum[self.humIdx]:SetShrink(DefShrink);
end

function BunCharge:InitExtraParameters()
  self.enlargeOldTime = CGTimer.time;  

  self.size = FightField.fightHum[self.humIdx].shrink + 10;   --放大的尺寸
  if self.size > MaxShrink + 5 then
    self.size = MaxShrink + 5;
  end

   --放大的尺寸
  if FightField.fightHum[self.humIdx].shrink == DefShrink then 
    self.size = MaxShrink + 5;
  elseif FightField.fightHum[self.humIdx].shrink == MaxShrink then 
    self.size = MaxShrink + 5;
  elseif FightField.fightHum[self.humIdx].shrink == MinShrink then 
    self.size = DefShrink + 5;
  end
end

function BunCharge:Update()  
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then 
    local centerPos = me:GetMagicPos();
    me:SetMoment(centerPos.x, centerPos.y, false);
    me.roleController:MagicAttack();      

    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground,10077,50,1,21,21, EEffectLightTracer.StandAni, me.nowPos.x+5, me.nowPos.y,20, true, 90);
    FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky,10003, 50,1,25,25, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y,20, true, 20);
  
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
    self.interval = 0.2;
    self.step = 2;     
  elseif self.step == 2 then 
    if self:CheckInterval() then      
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Body,10003, 50,1,25,25, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y,20, true, 20);              
      self.step = 3;              
    end
  elseif self.step == 3 then       
    if (CGTimer.time - self.enlargeOldTime) * 1000 * FightField.timeScale >= 50 then        
      if me.shrink < MaxShrink + 5 then          
        if me.shrink ~= self.size then
          me:SetShrink(me.shrink+1, MaxShrink + 5);
        end    
      else
        self.step = 4;
      end
      self.enlargeOldTime = CGTimer.time;                
    end      
  elseif self.step == 4 then     
    newPos = target:GetSpot(EFightSpot.Back, 50);
    me:SetWalk(newPos.x, newPos.y);
    me.roleController:SetIsJumping(true);
    me:SetSpeed(0.52);
    me:SetBeh(EFightBeh.Residual);  --殘影
    self.step = 5;        
  elseif self.step == 5 then       --是否到達目地點          
    if me.arrive then        
      me.roleController:SetIsJumping(false);        
      me.roleController:FaceTo(target.nowPos);          
      self.step = 6;                  
    end
  elseif self.step == 6 then       
     me.roleController:OneHandAttack();   
     self.step = 7;
  elseif self.step == 7 then       
    if (me.roleController.animationFrame == 1) then        
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky,10000, 50, 1,4, 4, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 255, false, 0);
      me:PlaySound(target.colm, target.row);   --啊!聲
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);  --挨打姿勢

      self.step = 8;           
    end   
  elseif self.step == 8 then   
    if me.roleController.animationId == me.roleController:GetAnimationId(ERolePose.Prepare) then         
      me.roleController:SetIsJumping(true);                       
      local mePos = me:GetChipPos()
      me:SetJump( mePos.x, mePos.y, true ); --設定跳躍的點,False:是否改變方向
      me:SetBeh(EFightBeh.None);          

      self.step = 9;        
    end
  elseif self.step == 9 then 
    if me.arrive then 
      self.step =10;
      self.isLightEnd = true;
      me.roleController:SetIsJumping(false);      
    end
  end
end