IceHammer = InheritsFromBaseAttackSkill();

function IceHammer:Update()    
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self.step == 1 then                
    local newPos = target:GetAttackPos(EFightSpot.Front, 60);
    me.roleController:SetIsJumping(true);
    me:SetJump(newPos.x, newPos.y);
    me:SetSpeed(0.98);
        
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
    if me.arrive then        
      me.roleController:SetIsJumping(false);
      me.roleController:OneHandAttack();
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky ,10392, 50, 1, 8, 10, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y - 150, 32, true, 0, target.nowPos.x, target.nowPos.y, 0.25);
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[2].isArrive then
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky ,10742, 40, 13, 1, 16, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y + 30, 32, true, 0);
      me:PlaySound(target.colm, target.row);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);      
      self.interval = 0.6;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      local idx = 0;
      for k, v in pairs(self.emyIdxAy)do 
        if v ~= self.tarIdx then 
          target = FightField.fightHum[v];
          FightField.attack[self.humIdx]:SetLightWithOrder(4 + idx * 3, EEffectLightDis.Sky ,10013, 100, 1, 3, 3, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y + 30, 32, false, 0);    
          FightField.attack[self.humIdx]:SetLightWithOrder(5 + idx * 3, EEffectLightDis.Sky ,10009, 100, 1, 2, 2, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y + 30, 32, false, 0);    
          idx = idx + 1;
        end
      end
      self.interval = 0.5;
      self.step = 5;
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
  elseif self.step == 5 then
    if self:CheckInterval() then 
      local idx = 0;
      for k, v in pairs(self.emyIdxAy)do 
        if v ~= self.tarIdx then 
          target = FightField.fightHum[v];
          FightField.attack[self.humIdx].lights[4 + idx * 3]:Stop();
          FightField.attack[self.humIdx].lights[5 + idx * 3]:Stop();
          FightField.attack[self.humIdx]:SetLightWithOrder(6 + idx * 3, EEffectLightDis.Sky ,10045, 35, 13, 26, 26, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 0);    
          me:PlaySound(target.colm, target.row);
          me:PlayEffect(target.colm, target.row, ERolePose.Hit);
          idx = idx + 1;
        end
      end
      local meChip = FightField.chip[me.colm][me.row];
      me:SetJump( meChip.x, meChip.y, false );
      self.step = 6;
    end
  elseif self.step == 6 then
    if me.arrive then       
      me.roleController:SetIsJumping(false);  
      self.isLightEnd = true;
    end
  end
end