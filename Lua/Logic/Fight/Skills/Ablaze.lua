Ablaze = InheritsFromBaseAttackSkill();

function Ablaze:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground, 10078, 50, 1, 20, 20, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 80);
    self.interval = 0.5;
  
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
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    self.step = 2;
  elseif self.step == 2 then
    if self:CheckInterval() then 
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10134, 50, 1, 7, 7, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y, 
                                                255, true, 0, target.nowPos.x, target.nowPos.y, 0.36);
      else
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10135, 50, 1, 7, 7, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y, 
                                                255, true, 0, target.nowPos.x, target.nowPos.y, 0.36);
      end

      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].isArrive then
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10133, 30, 1, 16, 16, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 50);

      me:PlaySound(target.colm, target.row);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].picId == 0 then
      self.isLightEnd = true
      self.step = 5;
    end
  end
end