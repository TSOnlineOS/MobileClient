Witchcraft = InheritsFromBaseAttackSkill();

function Witchcraft:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    FightField.SetShake(true);
    for k, v in pairs(self.emyIdxAy) do
      target = FightField.fightHum[v];
      FightField.attack[self.humIdx]:SetLightWithOrder(1 + k * 5, EEffectLightDis.Sky, 10807, 100, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x + 5, target.nowPos.y, 30, true, 50);
    end
    me:PlaySound(target.colm, target.row, Attack_Start);
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
    if FightField.attack[self.humIdx].lights[1].orderCount >= 4 then
      for k, v in pairs(self.emyIdxAy) do
        target = FightField.fightHum[v];
        if target.party_Kind == EFightParty.Left then
          FightField.attack[self.humIdx]:SetLightWithOrder(2 + k*5, EEffectLightDis.Sky, 10808, 30, 1, 1, 1, EEffectLightTracer.Line, target.nowPos.x - 30, target.nowPos.y + 30, 255, true, 10, target.nowPos.x - 30, target.nowPos.y - 60, 0.2);
          FightField.attack[self.humIdx]:SetLightWithOrder(3 + k*5, EEffectLightDis.Ground, 10808, 30, 1, 1, 1, EEffectLightTracer.Line, target.nowPos.x + 10, target.nowPos.y + 30, 255, true, 10, target.nowPos.x + 10, target.nowPos.y - 70, 0.15);
          FightField.attack[self.humIdx]:SetLightWithOrder(4 + k*5, EEffectLightDis.Sky, 10809, 60, 1, 2, 2, EEffectLightTracer.Line, target.nowPos.x + 30, target.nowPos.y + 20, 255, true, 10, target.nowPos.x + 30, target.nowPos.y - 80, 0.15);
          FightField.attack[self.humIdx]:SetLightWithOrder(5 + k*5, EEffectLightDis.Ground, 10810, 80, 1, 2, 2, EEffectLightTracer.Line, target.nowPos.x - 40, target.nowPos.y + 30, 255, true, 10, target.nowPos.x - 40, target.nowPos.y - 80, 0.13);
        end
      end
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[1].orderCount >= 4 then
      me:PlaySound(target.colm, target.row, Attack_Start);
      for k, v in pairs(self.emyIdxAy) do
        target = FightField.fightHum[v];
        FightField.attack[self.humIdx]:SetLightWithOrder(1 + k*5, EEffectLightDis.Sky, 10807, 100, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x + 5, target.nowPos.y, 30, true, 50);
        FightField.attack[self.humIdx]:SetLightWithOrder(6 + k*5, EEffectLightDis.Sky, 10811, 100, 1, 2, 10, EEffectLightTracer.StandAni, target.nowPos.x + 5, target.nowPos.y, 30, false, 50);
      end
      self.interval = 0.8;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      me:PlaySound(target.colm, target.row, Attack_Start)
      self.isLightEnd =true;
      self.step = 5;
    end
  end
end
