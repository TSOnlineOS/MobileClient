KurningSword = InheritsFromBaseAttackSkill();

function KurningSword:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    if me.party_Kind == EFightParty.Right then
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Body, 10678, 200, 1, 2, 7, EEffectLightTracer.StandAni, me.nowPos.x + 30, me.nowPos.y, 255, false, 75);
    else
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Body, 10679, 200, 1, 2, 7, EEffectLightTracer.StandAni, me.nowPos.x - 30, me.nowPos.y, 255, false, 75);
    end
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
    if FightField.attack[self.humIdx].lights[1].orderCount == 2 then
      local newPos = target:GetAttackPos(EFightSpot.Front, 60);
      me:SetBeh(EFightBeh.Residual);
      me:SetJump(newPos.x, newPos.y);
      me.roleController:SetIsJumping(true);
      if me.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10678, 200, 3, 4, 7, EEffectLightTracer.Curve, me.nowPos.x + 30, me.nowPos.y, 255, false, 75, newPos.x, newPos.y);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10679, 200, 3, 4, 7, EEffectLightTracer.Curve, me.nowPos.x - 30, me.nowPos.y, 255, false, 75, newPos.x, newPos.y);
      end
      self.step = 3;
    end
  elseif self.step == 3 then
    if me.arrive then
      me:SetBeh(EFightBeh.None);
      FightField.attack[self.humIdx]:StopLight(2);
      me.roleController:SetAnimationForceId(ERolePose.Attack);
      if me.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10678, 150, 5, 7, 7, EEffectLightTracer.StandAni, me.nowPos.x + 60, me.nowPos.y, 255, false, 60);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10679, 150, 5, 7, 7, EEffectLightTracer.StandAni, me.nowPos.x - 60, me.nowPos.y, 255, false, 60);
      end

      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10588, 50, 4, 6, 7, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 40, false, 85);
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10439, 90, 1, 8, 8, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 60);
      me:PlaySound(target.colm, target.row, Attack_Hit, 1);
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[3].orderCount == 1 then
      FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10439, 60, 1, 8, 8, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 45);
      me:PlaySound(target.colm, target.row, Attack_Hit, 2);
      self.step = 5;
    end
  elseif self.step == 5 then
    if FightField.attack[self.humIdx].lights[3].orderCount == 2 then
      FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10439, 60, 1, 8, 8, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 30);
      me:PlaySound(target.colm, target.row, Attack_Hit, 3);
      self.step = 6;
    end
  elseif self.step == 6 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      self.isLightEnd =true;
      self.step = 7;
    end
  end
end