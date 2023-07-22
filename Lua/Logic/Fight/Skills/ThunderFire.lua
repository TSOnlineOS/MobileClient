ThunderFire = InheritsFromBaseAttackSkill();

function ThunderFire:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground ,10078, 50, 1, 20, 20, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 80);
    FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky ,10362, 100, 1, 8, 8, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y + 10, 20, true, 0);
    self.interval = 1;
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
      self:GetSetPos();
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky ,10412, 50, 1, 9, 9, EEffectLightTracer.StandAni, self.setPos.x, self.setPos.y, 20, true, 100);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky ,10050, 110, 1, 3, 3, EEffectLightTracer.StandAni, self.setPos.x, self.setPos.y - 105, 50, true, 0);
      me:PlaySound(target.colm, target.row, Attack_Start);
      self.interval = 0.2;    
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Ground ,10016, 50, 1, 15, 15, EEffectLightTracer.StandAni, self.setPos.x, self.setPos.y, 20, true, 50);
      FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Ground ,10016, 50, 1, 15, 15, EEffectLightTracer.StandAni, self.setPos.x + 50, self.setPos.y, 20, true, 50);
      FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Ground ,10016, 50, 1, 15, 15, EEffectLightTracer.StandAni, self.setPos.x, self.setPos.y, 20, true, 100);
      FightField.attack[self.humIdx]:SetLightWithOrder(8, EEffectLightDis.Ground ,10016, 50, 1, 15, 15, EEffectLightTracer.StandAni, self.setPos.x - 60, self.setPos.y, 20, true, 70);
      self.interval = 0.5;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Body ,10121, 200, 1, 4, 4, EEffectLightTracer.StandAni, self.setPos.x, self.setPos.y, 20, true, 100);
      for k, v in pairs(self.emyIdxAy) do
        local target = FightField.fightHum[v];
        FightField.attack[self.humIdx]:SetLightWithOrder(9 + k * 2, EEffectLightDis.Body , 10133, math.random(30) + 29, 1, 16, 16, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 50);
        FightField.attack[self.humIdx]:SetLightWithOrder(10 + k * 2, EEffectLightDis.Body , 10454, math.random(50) + 79, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 50);        
      end
      self.interval = 0.3;
      self.step = 5;
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      local newPos;
      me:PlaySound(target.colm, target.row);
      for k, v in pairs(self.emyIdxAy) do
        target = FightField.fightHum[v];
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);
        target.roleController:Hit();
        target:SetSpeed(0.16);
        if not target:IsInSealStatus() then
          newPos = target:GetSpot(math.random(4), math.random(30) + 29);
          target:SetJump(newPos.x, newPos.y, true);
        end
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
    if target.arrive then
      for k, v in pairs(self.emyIdxAy) do
        target = FightField.fightHum[v];
        target.roleController:SetIsDead(true);        
      end
      self.interval = 0.8;
      self.step = 7;
    end
  elseif self.step == 7 then
    if self:CheckInterval() then 
      self.isLightEnd =true;
      self.step = 8;
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
  end
end

function ThunderFire:GetSetPos()
  local target = FightField.fightHum[self.tarIdx];
  if Contains(target.colm, 0, 3) then
    self.setPos = target:RCtoSpot(target.colm, target.row, EFightSpot.Front, 30);
  else
    self.setPos = target:RCtoSpot(target.colm, target.row, EFightSpot.Back, 30);
  end
end

ThunderFireMe = InheritsFromBaseStatus();

function ThunderFireMe:Update()
  if self.step == 1 then 
    local me = FightField.fightHum[self.humIdx];

    me.status[self.statusKind]:SetLightWithOrder(1, EEffectLightDis.Sky, 10304, 60, 1, 12, 12, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 20, true, 50);
    me.status[self.statusKind]:SetLightWithOrder(2, EEffectLightDis.Sky, 10133, 60, 1, 16, 16, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 30, true, 50);    
    self.step = 2;              
  end
end