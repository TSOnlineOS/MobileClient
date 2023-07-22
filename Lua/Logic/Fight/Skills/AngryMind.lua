AngryMind = InheritsFromBaseAttackSkill();

function AngryMind:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    FightField.SetShake(true);
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10436, 100, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x + 5, target.nowPos.y, 30, true, 50);
    me:PlaySound(target.colm,target.row, Attack_Start);
  
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
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
    if FightField.attack[self.humIdx].lights[1].orderCount >= 4 then
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10011, 30, 1, 1, 1, EEffectLightTracer.Line, target.nowPos.x - 30, target.nowPos.y + 30, 255, true, 10, target.nowPos.x - 30, target.nowPos.y - 60, 0.2);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10011, 30, 1, 1, 1, EEffectLightTracer.Line, target.nowPos.x + 10, target.nowPos.y + 30, 255, true, 10, target.nowPos.x + 10, target.nowPos.y - 70, 0.15);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10061, 60, 1, 2, 2, EEffectLightTracer.Line, target.nowPos.x + 30, target.nowPos.y + 20, 255, true, 10, target.nowPos.x + 30, target.nowPos.y - 80, 0.15);
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Ground, 10063, 80, 1, 2, 2, EEffectLightTracer.Line, target.nowPos.x - 40, target.nowPos.y + 30, 255, true, 10, target.nowPos.x - 40, target.nowPos.y - 80, 0.13);
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[5].isArrive then
      me:PlaySound(target.colm, target.row, Attack_Start);
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10436, 60, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x + 5, target.nowPos.y, 30, true, 50);
      FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10283, 100, 1, 2, 10, EEffectLightTracer.StandAni, target.nowPos.x + 5, target.nowPos.y, 30, true, 30);
      self.interval = 0.8;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self.interval >= 0 then
      self.interval = self.interval - CGTimer.deltaTime * FightField.timeScale;
    else
      me:PlaySound(target.colm, target.row, Attack_Start);
      FightField.SetShake(false);
      self.isLightEnd = true;
      self.step = 5;
    end
  end
end

--狀態顯示
AngryMindMe = InheritsFromBaseStatus();

function AngryMindMe:ExtraClose()  
  FightField.RestoreFightInfo(self.humIdx,0);
end

function AngryMindMe:Update()  
  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then         
    me:GetStatus(self.statusKind):SetLight(EEffectLightKind.Body1, 10436, 150, 4, 8, 10, EEffectLightTracer.Stand, me.nowPos.x + 5, me.nowPos.y, 30, true, 60);
    self.step = 2;
  end
end