CrazySoul = InheritsFromBaseAttackSkill();

function CrazySoul:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10077, 30, 1, 21, 21, EEffectLightTracer.Line, target.nowPos.x + 10, target.nowPos.y, 30, true, 0, target.nowPos.x + 10, target.nowPos.y + 80, 0.25);
    FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground, 10078, 30, 1, 20, 20, EEffectLightTracer.Line, target.nowPos.x - 80, target.nowPos.y + 80, 30, true, 0, target.nowPos.x, target.nowPos.y + 80, 0.25);
    FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10080, 30, 1, 21, 21, EEffectLightTracer.Line, target.nowPos.x + 80, target.nowPos.y + 80, 30, true, 0, target.nowPos.x, target.nowPos.y + 80, 0.25);
    FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Ground, 10070, 30, 1, 32, 32, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y + 130, 30, true, 0, target.nowPos.x, target.nowPos.y + 50, 0.25);
    me:PlaySound(target.colm,target.row, Attack_Start);
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
    if FightField.attack[self.humIdx].lights[4].isArrive then
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10077, 30, 10, 21, 21, EEffectLightTracer.StandAni, target.nowPos.x + 10, target.nowPos.y + 80, 30, false, 0);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground, 10078, 30, 10, 20, 20, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y + 80, 30, false, 0);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10080, 30, 10, 21, 21, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y + 80, 30, false, 0);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Ground, 10070, 30, 16, 32, 32, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y + 50, 30, false, 0);
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10170, 30, 1, 9, 9, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y + 50, 30, false, 0);

      self.interval = 0.8;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10049, 90, 1, 3, 3, EEffectLightTracer.Line, target.nowPos.x - 80, target.nowPos.y, 35, true, 0, target.nowPos.x, target.nowPos.y - 30, 0.1);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10050, 90, 1, 3, 3, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y - 30, 35, true, 0, target.nowPos.x + 80, target.nowPos.y, 0.1);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10051, 90, 1, 3, 3, EEffectLightTracer.Line, target.nowPos.x + 80, target.nowPos.y, 35, true, 0, target.nowPos.x, target.nowPos.y + 30, 0.1);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10066, 90, 1, 3, 3, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y + 30, 35, true, 0, target.nowPos.x - 80, target.nowPos.y, 0.1);

      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[4].isArrive then
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10066, 90, 1, 3, 3, EEffectLightTracer.Line, target.nowPos.x - 80, target.nowPos.y, 35, true, 0, target.nowPos.x, target.nowPos.y - 30, 0.1);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10049, 90, 1, 3, 3, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y - 30, 35, true, 0, target.nowPos.x + 80, target.nowPos.y, 0.1);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10050, 90, 1, 3, 3, EEffectLightTracer.Line, target.nowPos.x + 80, target.nowPos.y, 35, true, 0, target.nowPos.x, target.nowPos.y + 30, 0.1);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10051, 90, 1, 3, 3, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y + 30, 35, true, 0, target.nowPos.x - 80, target.nowPos.y, 0.1);

      self.step = 5;
    end
  elseif self.step == 5 then
    if FightField.attack[self.humIdx].lights[4].isArrive then
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10051, 90, 1, 3, 3, EEffectLightTracer.Line, target.nowPos.x - 80, target.nowPos.y, 35, true, 0, target.nowPos.x, target.nowPos.y - 30, 0.1);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10066, 90, 1, 3, 3, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y - 30, 35, true, 0, target.nowPos.x + 80, target.nowPos.y, 0.1);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10049, 90, 1, 3, 3, EEffectLightTracer.Line, target.nowPos.x + 80, target.nowPos.y, 35, true, 0, target.nowPos.x, target.nowPos.y + 30, 0.1);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10050, 90, 1, 3, 3, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y + 30, 35, true, 0, target.nowPos.x - 80, target.nowPos.y, 0.1);

      self.step = 6;
    end
  elseif self.step == 6 then
    if FightField.attack[self.humIdx].lights[4].isArrive then
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10050, 90, 1, 3, 3, EEffectLightTracer.Line, target.nowPos.x - 80, target.nowPos.y, 35, true, 0, target.nowPos.x, target.nowPos.y - 30, 0.1);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10051, 90, 1, 3, 3, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y - 30, 35, true, 0, target.nowPos.x + 80, target.nowPos.y, 0.1);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10066, 90, 1, 3, 3, EEffectLightTracer.Line, target.nowPos.x + 80, target.nowPos.y, 35, true, 0, target.nowPos.x, target.nowPos.y + 30, 0.1);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10049, 90, 1, 3, 3, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y + 30, 35, true, 0, target.nowPos.x - 80, target.nowPos.y, 0.1);
      self.interval = 0.5;
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
      self.isLightEnd = true;
      self.step = 8;
    end
  end
end

--狀態顯示
CrazySoulMe = InheritsFromBaseStatus();

function CrazySoulMe:ExtraClose()  
  FightField.RestoreFightInfo(self.humIdx,0);
end

function CrazySoulMe:Update()  
  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then     
    self.step = 2;
  elseif self.step == 2 then
    me:GetStatus(self.statusKind):SetLightWithOrder(1, EEffectLightDis.Sky, 10049, 90, 1, 3, 3, EEffectLightTracer.Line, me.nowPos.x - 80, me.nowPos.y, 35, true, 0, me.nowPos.x, me.nowPos.y - 30, 0.1);
    me:GetStatus(self.statusKind):SetLightWithOrder(2, EEffectLightDis.Sky, 10050, 90, 1, 3, 3, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y - 30, 35, true, 0, me.nowPos.x + 80, me.nowPos.y, 0.1);
    me:GetStatus(self.statusKind):SetLightWithOrder(3, EEffectLightDis.Sky, 10051, 90, 1, 3, 3, EEffectLightTracer.Line, me.nowPos.x + 80, me.nowPos.y, 35, true, 0, me.nowPos.x, me.nowPos.y + 30, 0.1);
    me:GetStatus(self.statusKind):SetLightWithOrder(4, EEffectLightDis.Sky, 10066, 90, 1, 3, 3, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y + 30, 35, true, 0, me.nowPos.x - 80, me.nowPos.y, 0.1);

    self.step = 3;
  elseif self.step == 3 then
    if me:GetStatus(self.statusKind).lights[4].isArrive then
      me:GetStatus(self.statusKind):SetLightWithOrder(1, EEffectLightDis.Sky, 10066, 90, 1, 3, 3, EEffectLightTracer.Line, me.nowPos.x - 80, me.nowPos.y, 35, true, 0, me.nowPos.x, me.nowPos.y - 30, 0.1);
      me:GetStatus(self.statusKind):SetLightWithOrder(2, EEffectLightDis.Sky, 10049, 90, 1, 3, 3, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y - 30, 35, true, 0, me.nowPos.x + 80, me.nowPos.y, 0.1);
      me:GetStatus(self.statusKind):SetLightWithOrder(3, EEffectLightDis.Sky, 10050, 90, 1, 3, 3, EEffectLightTracer.Line, me.nowPos.x + 80, me.nowPos.y, 35, true, 0, me.nowPos.x, me.nowPos.y + 30, 0.1);
      me:GetStatus(self.statusKind):SetLightWithOrder(4, EEffectLightDis.Sky, 10051, 90, 1, 3, 3, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y + 30, 35, true, 0, me.nowPos.x - 80, me.nowPos.y, 0.1);

      self.step = 4;
    end
  elseif self.step == 4 then
    if me:GetStatus(self.statusKind).lights[4].isArrive then
      me:GetStatus(self.statusKind):SetLightWithOrder(1, EEffectLightDis.Sky, 10051, 90, 1, 3, 3, EEffectLightTracer.Line, me.nowPos.x - 80, me.nowPos.y, 35, true, 0, me.nowPos.x, me.nowPos.y - 30, 0.1);
      me:GetStatus(self.statusKind):SetLightWithOrder(2, EEffectLightDis.Sky, 10066, 90, 1, 3, 3, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y - 30, 35, true, 0, me.nowPos.x + 80, me.nowPos.y, 0.1);
      me:GetStatus(self.statusKind):SetLightWithOrder(3, EEffectLightDis.Sky, 10049, 90, 1, 3, 3, EEffectLightTracer.Line, me.nowPos.x + 80, me.nowPos.y, 35, true, 0, me.nowPos.x, me.nowPos.y + 30, 0.1);
      me:GetStatus(self.statusKind):SetLightWithOrder(4, EEffectLightDis.Sky, 10050, 90, 1, 3, 3, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y + 30, 35, true, 0, me.nowPos.x - 80, me.nowPos.y, 0.1);

      self.step = 5;
    end
  elseif self.step == 5 then
    if me:GetStatus(self.statusKind).lights[4].isArrive then
      me:GetStatus(self.statusKind):SetLightWithOrder(1, EEffectLightDis.Sky, 10050, 90, 1, 3, 3, EEffectLightTracer.Line, me.nowPos.x - 80, me.nowPos.y, 35, true, 0, me.nowPos.x, me.nowPos.y - 30, 0.1);
      me:GetStatus(self.statusKind):SetLightWithOrder(2, EEffectLightDis.Sky, 10051, 90, 1, 3, 3, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y - 30, 35, true, 0, me.nowPos.x + 80, me.nowPos.y, 0.1);
      me:GetStatus(self.statusKind):SetLightWithOrder(3, EEffectLightDis.Sky, 10066, 90, 1, 3, 3, EEffectLightTracer.Line, me.nowPos.x + 80, me.nowPos.y, 35, true, 0, me.nowPos.x, me.nowPos.y + 30, 0.1);
      me:GetStatus(self.statusKind):SetLightWithOrder(4, EEffectLightDis.Sky, 10049, 90, 1, 3, 3, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y + 30, 35, true, 0, me.nowPos.x - 80, me.nowPos.y, 0.1);

      self.step = 2;
    end
  end
end