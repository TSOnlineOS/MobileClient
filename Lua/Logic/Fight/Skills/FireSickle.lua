FireSickle = InheritsFromBaseAttackSkill();

function FireSickle:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    if me.party_Kind == EFightParty.Right then 
      FightField.attack[self.humIdx]:SetLightWithOrder(8, EEffectLightDis.Body, 10585, 120, 2, 3, 5, EEffectLightTracer.Stand + 40, me.nowPos.x, me.nowPos.y, 30, true, 15);
      FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Body, 10585, 120, 2, 3, 5, EEffectLightTracer.Stand - 40, me.nowPos.x, me.nowPos.y, 30, true, 25);
    else
      FightField.attack[self.humIdx]:SetLightWithOrder(8, EEffectLightDis.Body, 10585, 120, 2, 3, 5, EEffectLightTracer.Stand + 40, me.nowPos.x, me.nowPos.y, 30, true, 15);
      FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Body, 10585, 120, 2, 3, 5, EEffectLightTracer.Stand - 40, me.nowPos.x, me.nowPos.y, 30, true, 25);
    end
    self.interval = 1;
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
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:StopLight(8);
      FightField.attack[self.humIdx]:StopLight(9);
      me:SetJump(target.nowPos.x, target.nowPos.y, false);
      me.roleController:SetIsJumping(true);
      me:SetSpeed(0.66);
      me:PlaySound(target.colm, target.row, Attack_Start);
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10440, 80, 6, 12, 12, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y, 40, true, 30, target.nowPos.x, target.nowPos.y, 0.66);
      FightField.attack[self.humIdx].lights[1]:SetAlpha(10, 2, 20);
      FightField.attack[self.humIdx].lights[1]:SetResidual(3, 50, -10);
      self.step = 3;
    end
  elseif self.step == 3 then
    if me.arrive then
      me.roleController:SetAnimationForceId(ERolePose.Attack);
      me:SetBeh(EFightBeh.Rotate);
      target.roleController:Hit();
      FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10584, 60, 12, 1, 12, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 60);
      FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10408, 60, 1, 13, 13, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 35);
      self.interval = 0.08;
      self.step = 4;
    end
  elseif Contains(self.step, 4, 6) then
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10294, 50, 1, 2, 2, EEffectLightTracer.StandAni, target.nowPos.x - 60, target.nowPos.y + 30, 30, false, 0);
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10583, 50, 1, 2, 2, EEffectLightTracer.StandAni, target.nowPos.x - 60, target.nowPos.y, 30, false, 80);
      self.interval = 0.2;
      self.step = self.step + 1;
    end
  elseif Contains(self.step, 5, 7) then
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10582, 50, 1, 2, 2, EEffectLightTracer.StandAni, target.nowPos.x + 60, target.nowPos.y, 30, false, 20);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10295, 50, 1, 2, 2, EEffectLightTracer.StandAni, target.nowPos.x + 60, target.nowPos.y, 30, false, 85);
      self.interval = 0.2;
      self.step = self.step + 1;
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
  elseif self.step == 8 then
    if self:CheckInterval() then 
      self.isLightEnd =true;
      self.step = 4;
    end
  end
end

FireSickleMe = InheritsFromBaseStatus();

function FireSickleMe:ExtraClose()  
  FightField.RestoreFightInfo(self.humIdx, 0);
end

function FireSickleMe:Update()
  if self.step == 1 then 
    local me = FightField.fightHum[self.humIdx];

    me.status[self.statusKind]:SetLightWithOrder(1, EEffectLightDis.Sky, 10304, 60, 1, 12, 12, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 20, true, 50);
    me.status[self.statusKind]:SetLightWithOrder(2, EEffectLightDis.Sky, 10304, 60, 1, 12, 12, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 20, true, 50);
    me:SetStatusKind(self.statusKind, EStatus.ThunderFire);     
    self.step = 2;              
  end
end

SkyFireSickle = InheritsFromBaseAttackSkill();

function SkyFireSickle:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    if me.party_Kind == EFightParty.Right then 
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Body, 10585, 120, 2, 3, 5, EEffectLightTracer.Stand + 40, me.nowPos.x, me.nowPos.y, 30, true, 15);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10585, 120, 2, 3, 5, EEffectLightTracer.Stand - 40, me.nowPos.x, me.nowPos.y, 30, true, 25);
    else
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Body, 10585, 120, 2, 3, 5, EEffectLightTracer.Stand + 40, me.nowPos.x, me.nowPos.y, 30, true, 15);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10585, 120, 2, 3, 5, EEffectLightTracer.Stand - 40, me.nowPos.x, me.nowPos.y, 30, true, 25);
    end
    self.interval = 1;
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
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:StopLight(1);
      FightField.attack[self.humIdx]:StopLight(2);
      me:PlaySound(target.colm, target.row, Attack_Start);
      me.roleController:SetAnimationForceId(ERolePose.Attack);
      local idx = 0;
      for k, v in pairs(self.emyIdxAy)do 
        target = FightField.fightHum[v];
        FightField.attack[self.humIdx]:SetLightWithOrder(1 + idx * 7, EEffectLightDis.Sky, 10440, 80, 6, 12, 12, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y, 40, true, 30, target.nowPos.x, target.nowPos.y, 0.66);
        FightField.attack[self.humIdx].lights[1]:SetAlpha(10, 2, 20);
        FightField.attack[self.humIdx].lights[1]:SetResidual(3, 50, -10);
        idx = idx + 1;
      end
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[1].isArrive then
      local idx = 0;
      for k, v in pairs(self.emyIdxAy)do 
        target = FightField.fightHum[v];
        target.roleController:Hit();
        FightField.attack[self.humIdx]:SetLightWithOrder(2 + idx * 7, EEffectLightDis.Sky, 10584, 60, 12, 1, 12, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 60);
        FightField.attack[self.humIdx]:SetLightWithOrder(3 + idx * 7, EEffectLightDis.Sky, 10408, 60, 1, 13, 13, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 35);
        idx = idx + 1;
      end
      self.interval = 0.08;
      self.step = 4;
    end
  elseif Contains(self.step, 4, 6) then
    if self:CheckInterval() then 
      local idx = 0;
      for k, v in pairs(self.emyIdxAy)do 
        target = FightField.fightHum[v];
        FightField.attack[self.humIdx]:SetLightWithOrder(4 + idx * 7, EEffectLightDis.Sky, 10294, 50, 1, 2, 2, EEffectLightTracer.StandAni, target.nowPos.x - 60, target.nowPos.y + 30, 30, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(5 + idx * 7, EEffectLightDis.Sky, 10583, 50, 1, 2, 2, EEffectLightTracer.StandAni, target.nowPos.x - 60, target.nowPos.y, 30, false, 80);
        idx = idx + 1;
      end
      self.interval = 0.2;
      self.step = self.step + 1;
    end
  elseif Contains(self.step, 5, 7) then
    if self:CheckInterval() then 
      local idx = 0;
      for k, v in pairs(self.emyIdxAy)do 
        target = FightField.fightHum[v];
        FightField.attack[self.humIdx]:SetLightWithOrder(6 + idx * 7, EEffectLightDis.Sky, 10582, 50, 1, 2, 2, EEffectLightTracer.StandAni, target.nowPos.x + 60, target.nowPos.y, 30, false, 20);
        FightField.attack[self.humIdx]:SetLightWithOrder(7 + idx * 7, EEffectLightDis.Sky, 10295, 50, 1, 2, 2, EEffectLightTracer.StandAni, target.nowPos.x + 60, target.nowPos.y, 30, false, 85);
        idx = idx + 1;
      end
      self.interval = 0.2;
      self.step = self.step + 1;
    end
  elseif self.step == 8 then
    if self:CheckInterval() then 
      self.isLightEnd =true;
      --self.step = 4;
    end
  end
end 