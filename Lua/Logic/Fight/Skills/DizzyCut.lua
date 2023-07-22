DizzyCut = InheritsFromBaseAttackSkill();

function DizzyCut:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = target:RCtoSpot(target.colm,target.row, EFightSpot.Front, 30);
    me:SetSpeed(1);
    me:SetBeh(EFightBeh.Residual);
    me:SetWalk(newPos.x, newPos.y, false);
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
      me:SetSpeed(0.4);
      me.roleController:SetAnimationForceId(ERolePose.Attack);
      me.roleController:SetAnimationForceFrame(1);
      target:SetSpeed(0.5);
      target.roleController:SetAnimationForceId(ERolePose.Lie);
      target.roleController:SetAnimationForceFrame(1);
      target:SetWalk(me.nowPos.x, me.nowPos.y - 80, false);
      self.step = 3;
    end
  elseif self.step == 3 then
    if target.arrive then
      me:PlaySound(target.colm, target.row, Attack_Hit);
      local newPos = me:GetSpot(EFightSpot.Back, 30);
      me.roleController:FaceTo(newPos);
      target:SetWalk(newPos.x, newPos.y, false);
      target.roleController:SetAnimationForceId(ERolePose.Lie);
      target.roleController:SetAnimationForceFrame(1);
      self.step = 4;
    end
  elseif self.step == 4 then
    if target.arrive then
      me:PlayEffect(target.colm, target.row, ERolePose.Lie, 3);
      FightField.isShake = true;
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10923, 30, 3, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x + 6, target.nowPos.y, 30, true, 60);
      local newPos = target:GetChipPos();
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Ground, 10924, 30, 4, 4, 6, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 110);
      target:SetWalk(me.nowPos.x, me.nowPos.y - 80, false);
      self.step = 5;
    end
  elseif self.step == 5 then
    if target.arrive then
      FightField.SetShake(false);
      local newPos = me:GetSpot(EFightSpot.Back, 50);
      me.roleController:FaceTo(newPos);
      target:SetWalk(newPos.x, newPos.y, false);
      self.step = 6;
    end
  elseif self.step == 6 then
    if target.arrive then
      FightField.isShake = true;
      me:PlayEffect(target.colm, target.row, ERolePose.Lie, 3);
      target.roleController:SetAnimationForceId(ERolePose.Lie);
      target.roleController:SetAnimationForceFrame(4);
      me.roleController:SetAnimationForceFrame(255);
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky ,10923, 30, 3, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x + 6, target.nowPos.y, 30, false, 60);
      local newPos = target:GetChipPos();
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Ground ,10924, 30, 5, 5, 6, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 110);
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
    if self:CheckInterval() then 
      FightField.SetShake(false);
      if target.party_Kind == EFightParty.Left then
        target:SetWalk(me.nowPos.x + 15, me.nowPos.y - 70, false);
      else
        target:SetWalk(me.nowPos.x, me.nowPos.y - 70, false);
      end
      self.step = 8;
    end
  elseif self.step == 8 then
    if target.arrive then
      me.roleController:SetAnimationForceFrame(0);
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky ,10923, 30, 3, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x + 6, target.nowPos.y, 30, false, 60);
      self.interval = 0.1;
      self.step = 9;
    end
  elseif self.step == 9 then
    if self:CheckInterval() then 
      target:SetSpeed(0.5);
      if target.party_Kind == EFightParty.Left then
        target:SetWalk(me.nowPos.x + 15, me.nowPos.y - 150, false);
      else
        target:SetWalk(me.nowPos.x, me.nowPos.y - 140, false);
      end
      me:SetWalk(me.nowPos.x, me.nowPos.y - 165);
      self.step = 10;
    end
  elseif self.step == 10 then
    if me.arrive then
      me.roleController:SetAnimationForceId(ERolePose.Attack);
      me.roleController:SetAnimationForceFrame(1);
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky ,10923, 30, 3, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x + 6, target.nowPos.y, 30, false, 40);
      me.roleController:FaceTo(target.nowPos);
      if target.party_Kind == EFightParty.Left then
        target:SetWalk(me.nowPos.x + 15, me.nowPos.y + 150, false);
      else
        target:SetWalk(me.nowPos.x, me.nowPos.y + 150, false);
      end
      target.roleController:SetAnimationForceFrame(2);
      self.step = 11;
    end
  elseif self.step == 11 then
    if target.arrive then
      me:PlayEffect(target.colm, target.row, ERolePose.Lie, 4);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky ,10925, 30, 2, 7, 7, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 30, false, 50, me.nowPos.x, me.nowPos.y + 140, 0.33);
      me:SetWalk(me.nowPos.x, me.nowPos.y + 165);
      local newPos = target:GetChipPos();
      me.roleController:FaceTo(newPos);
      self.step = 12;
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
  elseif self.step == 12 then
    if me.arrive then
      FightField.isShake = true;
      me:PlayEffect(target.colm, target.row, ERolePose.Lie, 4);
      target.roleController:SetAnimationForceId(ERolePose.Lie);
      target.roleController:SetAnimationForceFrame(4);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky ,10926, 50, 1, 5, 5, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 100);
      local newPos = target:GetChipPos();
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Ground ,10924, 30, 6, 6, 6, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 110);
      me:SetSpeed(1);
      newPos = me:GetChipPos();
      me.roleController:FaceTo(newPos);
      me:SetWalk(newPos.x, newPos.y, false);
      self.step = 13;
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
  elseif self.step == 13 then
    if me.arrive then
      me.roleController:SetAnimationForceFrame(255);
      target.roleController:SetAnimationForceFrame(255);
      FightField.SetShake(false);
      self.isLightEnd = true;
      self.step = 14;
    end
  end
end



EW_DizzyCut = InheritsFromBaseAttackSkill();

function EW_DizzyCut:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = target:RCtoSpot(target.colm,target.row, EFightSpot.Front, 30);
    me:SetSpeed(1);
    me:SetBeh(EFightBeh.Residual);
    me:SetWalk(newPos.x, newPos.y, false);
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
    if me.arrive then
      me:SetSpeed(0.4);
      me.roleController:SetAnimationForceId(ERolePose.Attack);
      me.roleController:SetAnimationForceFrame(1);
      for k, v in pairs(self.emyIdxAy)do 
        target = FightField.fightHum[v];
        if target.roleController:GetAttribute(EAttribute.Hp) > 0 then 
          target:SetSpeed(0.5);
          target.roleController:SetAnimationForceId(ERolePose.Lie);
          target.roleController:SetAnimationForceFrame(1);
          target:SetWalk(me.nowPos.x, me.nowPos.y - 80, false);
        end
      end
      self.step = 3;
    end
  elseif self.step == 3 then
    if target.arrive then      
      local newPos = me:GetSpot(EFightSpot.Back, 30);
      me.roleController:FaceTo(newPos);
      for k, v in pairs(self.emyIdxAy)do 
        target = FightField.fightHum[v];
        if target.roleController:GetAttribute(EAttribute.Hp) > 0 then 
          me:PlaySound(target.colm, target.row, Attack_Hit);          
          target:SetWalk(newPos.x, newPos.y, false);
          target.roleController:SetAnimationForceId(ERolePose.Lie);
          target.roleController:SetAnimationForceFrame(1);
        end
      end
      self.step = 4;
    end
  elseif self.step == 4 then
    if target.arrive then
      FightField.isShake = true;
      for k, v in pairs(self.emyIdxAy)do 
        target = FightField.fightHum[v];
        if target.roleController:GetAttribute(EAttribute.Hp) > 0 then 
          me:PlayEffect(target.colm, target.row, ERolePose.Lie, 3);        
          FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10923, 30, 3, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x + 6, target.nowPos.y, 30, true, 60);
          local newPos = target:GetChipPos();
          FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Ground, 10924, 30, 4, 4, 6, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 110);
          target:SetWalk(me.nowPos.x, me.nowPos.y - 80, false);        
        end
      end
      self.step = 5;
    end
  elseif self.step == 5 then
    if target.arrive then
      FightField.SetShake(false);
      local newPos = me:GetSpot(EFightSpot.Back, 50);
      me.roleController:FaceTo(newPos);
      for k, v in pairs(self.emyIdxAy)do 
        target = FightField.fightHum[v];
        if target.roleController:GetAttribute(EAttribute.Hp) > 0 then         
          target:SetWalk(newPos.x, newPos.y, false);
        end
      end
      self.step = 6;
    end
  elseif self.step == 6 then
    if target.arrive then
      FightField.isShake = true;
      for k, v in pairs(self.emyIdxAy)do 
        target = FightField.fightHum[v];
        if target.roleController:GetAttribute(EAttribute.Hp) > 0 then         
          me:PlayEffect(target.colm, target.row, ERolePose.Lie, 3);
          target.roleController:SetAnimationForceId(ERolePose.Lie);
          target.roleController:SetAnimationForceFrame(4);
          me.roleController:SetAnimationForceFrame(255);
          FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky ,10923, 30, 3, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x + 6, target.nowPos.y, 30, false, 60);
          local newPos = target:GetChipPos();
          FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Ground ,10924, 30, 5, 5, 6, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 110);
        end
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
    if self:CheckInterval() then 
      FightField.SetShake(false);
      for k, v in pairs(self.emyIdxAy)do 
        target = FightField.fightHum[v];
        if target.roleController:GetAttribute(EAttribute.Hp) > 0 then         
          if target.party_Kind == EFightParty.Left then
            target:SetWalk(me.nowPos.x + 15, me.nowPos.y - 70, false);
          else
            target:SetWalk(me.nowPos.x, me.nowPos.y - 70, false);
          end
        end
      end
      self.step = 8;
    end
  elseif self.step == 8 then
    if target.arrive then
      me.roleController:SetAnimationForceFrame(0);
      for k, v in pairs(self.emyIdxAy)do 
        target = FightField.fightHum[v];
        if target.roleController:GetAttribute(EAttribute.Hp) > 0 then         
          FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky ,10923, 30, 3, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x + 6, target.nowPos.y, 30, false, 60);
        end
      end
      self.interval = 0.1;
      self.step = 9;
    end
  elseif self.step == 9 then
    if self:CheckInterval() then 
      for k, v in pairs(self.emyIdxAy)do 
        target = FightField.fightHum[v];
        if target.roleController:GetAttribute(EAttribute.Hp) > 0 then         
          target:SetSpeed(0.5);
          if target.party_Kind == EFightParty.Left then
            target:SetWalk(me.nowPos.x + 15, me.nowPos.y - 150, false);
          else
            target:SetWalk(me.nowPos.x, me.nowPos.y - 140, false);
          end
        end
      end
      me:SetWalk(me.nowPos.x, me.nowPos.y - 165);
      self.step = 10;
    end
  elseif self.step == 10 then
    if me.arrive then
      me.roleController:SetAnimationForceId(ERolePose.Attack);
      me.roleController:SetAnimationForceFrame(1);
      for k, v in pairs(self.emyIdxAy)do 
        target = FightField.fightHum[v];
        if target.roleController:GetAttribute(EAttribute.Hp) > 0 then         
          FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky ,10923, 30, 3, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x + 6, target.nowPos.y, 30, false, 40);
          me.roleController:FaceTo(target.nowPos);
          if target.party_Kind == EFightParty.Left then
            target:SetWalk(me.nowPos.x + 15, me.nowPos.y + 150, false);
          else
            target:SetWalk(me.nowPos.x, me.nowPos.y + 150, false);
          end
          target.roleController:SetAnimationForceFrame(2);
        end
      end
      self.step = 11;
    end
  elseif self.step == 11 then
    if target.arrive then
      for k, v in pairs(self.emyIdxAy)do 
        target = FightField.fightHum[v];
        if target.roleController:GetAttribute(EAttribute.Hp) > 0 then         
          me:PlayEffect(target.colm, target.row, ERolePose.Lie, 4);
        end
      end
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky ,10925, 30, 2, 7, 7, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 30, false, 50, me.nowPos.x, me.nowPos.y + 140, 0.33);
      me:SetWalk(me.nowPos.x, me.nowPos.y + 165);       
      target = FightField.fightHum[self.tarIdx];
      local newPos = target:GetChipPos();
      me.roleController:FaceTo(newPos);      
      self.step = 12;
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
  elseif self.step == 12 then
    if me.arrive then
      FightField.isShake = true;
      local newPos;
      for k, v in pairs(self.emyIdxAy)do 
        target = FightField.fightHum[v];
        if target.roleController:GetAttribute(EAttribute.Hp) > 0 then         
          me:PlayEffect(target.colm, target.row, ERolePose.Lie, 4);
          target.roleController:SetAnimationForceId(ERolePose.Lie);
          target.roleController:SetAnimationForceFrame(4);
          FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky ,10926, 50, 1, 5, 5, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 100);
          newPos = target:GetChipPos();
          FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Ground ,10924, 30, 6, 6, 6, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 110);
        end
      end
      me:SetSpeed(1);
      newPos = me:GetChipPos();
      me.roleController:FaceTo(newPos);
      me:SetWalk(newPos.x, newPos.y, false);
      self.step = 13;
    end
  elseif self.step == 13 then
    if me.arrive then
      me.roleController:SetAnimationForceFrame(255);
      for k, v in pairs(self.emyIdxAy)do 
        target = FightField.fightHum[v];
        if target.roleController:GetAttribute(EAttribute.Hp) > 0 then         
          target.roleController:SetAnimationForceFrame(255);
        end
      end
      FightField.SetShake(false);
      self.isLightEnd = true;
      self.step = 14;
    end
  end
end