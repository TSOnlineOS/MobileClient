PureRiver = InheritsFromBaseAttackSkill();

function PureRiver:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10070, 35, 1, 28, 32, EEffectLightTracer.Stand, me.nowPos.x + 6, me.nowPos.y, 30, false, 50);
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
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Ground].orderCount == 16 then
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1 ,10022, 33, 1, 12, 12, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y - 35, 20, false, 50);
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].picId == 0 then
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1 ,10025, 33, 1, 24, 24, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y - 35, 20, false, 50);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2 ,10033, 33, 1, 25, 25, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, false, 10);
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky2].picId == 0 then
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10070, 80, 29, 32, 32, EEffectLightTracer.StandAni, me.nowPos.x + 6, me.nowPos.y, 25, false, 50);
      self.step = 5;
    end
  elseif self.step == 5 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Ground].picId == 0 then
      self.isLightEnd = true;
      self.step = 6;
    end
  end
end