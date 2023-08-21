SKILL13036 = InheritsAttack(RandomHit)

function SKILL13036:PlayEffectLight()
  local target = FightField.fightHum[self.aimIdx];
  local me = FightField.fightHum[self.humIdx];
  if target.party_Kind == EFightParty.Left then
    if self.attackStep == 1 or self.attackStep == 3 then
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10965, 30, 1, 5, 5, EEffectLightTracer.StandAni, me.nowPos.x - 5, target.nowPos.y, 30, false, 40);
    elseif self.attackStep == 2 then
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10966, 30, 1, 5, 5, EEffectLightTracer.StandAni, me.nowPos.x, target.nowPos.y, 30, false, 40);
    end
  else
    if self.attackStep == 1 or self.attackStep == 3 then
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10966, 30, 1, 5, 5, EEffectLightTracer.StandAni, me.nowPos.x, target.nowPos.y, 30, false, 40);
    elseif self.attackStep == 2 then
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10965, 30, 1, 5, 5, EEffectLightTracer.StandAni, me.nowPos.x - 5, target.nowPos.y, 30, false, 40);
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
  end
  FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10967, 30, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 50);
  FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky3, 10968, 30, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 40);
  FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky4, 10969, 30, 1, 4, 12, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 0);
end