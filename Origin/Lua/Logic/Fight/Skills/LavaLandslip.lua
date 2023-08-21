LavaLandslip = InheritsFromBaseAttackSkill();

function LavaLandslip:InitExtraParameters()
  self.isHit = false;
end

function LavaLandslip:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then 
    local centerPos = me:GetMagicPos();
    me:SetMoment(centerPos.x, centerPos.y, false);
    me.roleController:MagicAttack();      

    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground,10080,50,1,21,21, EEffectLightTracer.StandAni, me.nowPos.x+5, me.nowPos.y,20, true, 90);    

    self.interval = 0.2;
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
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10832, 50,1,9,9, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y,20, true, 20);      
      self.step = 3;
    end
  elseif self.step == 3 then 
    if FightField.attack[self.humIdx].lights[2].picId == 0 then
      local newPos = target:GetAttackPos(EFightSpot.Front, 60);
      me.roleController:SetIsJumping(true);
  
      me:SetJump(newPos.x, newPos.y);
      me:SetSpeed(0.98);
      self.step = 4;
    end
  elseif self.step == 4 then 
    if me.arrive then        
      me.roleController:SetIsJumping(false);      
      me.roleController:OneHandAttack();
      self.step = 5;         
    end
  elseif self.step == 5 then 
    if me.roleController.animationId ==  me.roleController:GetAnimationId(ERolePose.Prepare) and self.isHit then       
      me.roleController:SetIsJumping(true);      
      local meChip = FightField.chip[me.colm][me.row];      
      me:SetJump( meChip.x, meChip.y, false );
      self.step = 6;      
    else  
      if (me.roleController.animationFrame == 1) and (self.isHit == false) then    
        FightField.SetShake(true);
        me:PlaySound(target.colm, target.row);

        FightField.attack[self.humIdx]:SetLightWithOrder(3 , EEffectLightDis.Body ,10722, 50, 1, 13, 13, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 30, false, 70);          
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);
   
        target.roleController:SetIsDead(true);          
        local newPos = target:GetSpot(EFightSpot.Back, 80)    
        target:SetJump(newPos.x, newPos.y, true);                  
        self.isHit = true;
      end
    end      
  elseif self.step == 6 then     
    if me.arrive then       
      me.roleController:SetIsJumping(false);          
    end

    if target.arrive then 
      target.roleController:SetIsDead(false);
      target.roleController:SetInBattle(false);
      target.roleController:SetIsMoving(true);        

      local newPos = target:RCtoSpot(target.colm, target.row);
      target:SetWalk( newPos.x, newPos.y, true);
      target:SetSpeed(0.24);
      FightField.SetShake(false); 
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
    if target.arrive then 
      self.isLightEnd = true;
      self.step = 8;
    end
  end
end