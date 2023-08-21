BlazeFlame = InheritsFromBaseAttackSkill();

function BlazeFlame:ExtraClose()
  if FightField.fightHum[self.tarIdx] ~= nil and FightField.fightHum[self.tarIdx].roleController ~= nil then 
    FightField.fightHum[self.tarIdx].roleController.gameObject:SetActive(true);
  end
end

function BlazeFlame:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground, 10078, 50, 1, 20, 20, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 80);
    self.interval = 0.8;
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
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    self.step = 2;
  elseif self.step == 2 then
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10069, 70, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x - 18, target.nowPos.y - 30, 30, false, 0);  --閃電
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10068, 70, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x + 10, target.nowPos.y, 30, false, 30);  --被打中的人
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky3, 10037, 30, 1, 24, 24, EEffectLightTracer.Line, target.nowPos.x - 18, target.nowPos.y - 400, 35, true, 20, 
                                              target.nowPos.x + 10, target.nowPos.y, 0.56);  --030602J旋火

      me:PlaySound(target.colm, target.row);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      target.roleController.gameObject:SetActive(false);    --敵人隱藏
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].picId == 0 then
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10069, 70, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x - 18, target.nowPos.y - 30, 30, false, 0);  --閃電
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10068, 70, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x + 10, target.nowPos.y, 30, false, 30);  --被打中的人
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].picId == 0 then
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10069, 70, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x - 18, target.nowPos.y - 30, 30, false, 0);  --閃電
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10068, 70, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x + 10, target.nowPos.y, 30, false, 30);  --被打中的人
      FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1]:SetAlpha(20, -1, 20);
      FightField.attack[self.humIdx].lights[EEffectLightKind.Sky2]:SetAlpha(20, -1, 20);

      target.roleController.gameObject:SetActive(true);
      target.roleController:Hit();

      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10133, 30, 1, 16, 16, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 35, true, 50);  --著火
      FightField.attack[self.humIdx].lights[EEffectLightKind.Sky3]:SetAlpha(15, 1, 20);
      self.step = 5;
    end
  elseif self.step == 5 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].picId == 0 then
      self.isLightEnd = true;
      self.step = 6;
    end
  end
end