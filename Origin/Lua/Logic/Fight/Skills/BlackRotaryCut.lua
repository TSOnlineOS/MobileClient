BlackRotaryCut = InheritsAttack(RandomHit)

function BlackRotaryCut:PlayEffectLight()
  local target = FightField.fightHum[self.aimIdx]
  FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10815, 40, 1, 4, 4, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 255, false, 0);
  FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10816, 25, 1, 9, 9, EEffectLightTracer.StandAni, target.nowPos.x - 5, target.nowPos.y - 10, 30, false, 12);
end

EW_BlackRotaryCut = InheritsAttack(BlackRotaryCut)

function EW_BlackRotaryCut:InitDrawBlack()
  self.needDrawBlack = true;     
end