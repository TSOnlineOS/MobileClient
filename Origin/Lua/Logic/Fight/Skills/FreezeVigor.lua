FreezeVigor = InheritsFromBaseAttackSkill();

function FreezeVigor:Update()  
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    FightField.SetShake(true);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10012, 50, 1, 13, 13, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 20, false, 80);
    for i = 0, 2 do
      me:PlaySound(target.colm, target.row)
    end
    self.step = 2;
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
  elseif self.step == 2 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].orderCount == 9 then
      local newPos;
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10019, 60, 1, 15, 15, EEffectLightTracer.Stand, target.nowPos.x - 10, target.nowPos.y - 40, 40, false, 80);
      newPos = target:GetSpot(EFightSpot.Front, 60);
      me:SetSpeed(0.66);
      me:SetBeh(EFightBeh.Residual);
      me:SetWalk(newPos.x, newPos.y, false);
      me:PlaySound(target.colm, target.row);

      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body1, 10287, 30, 1, 8, 8, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 30, true, 0, target.nowPos.x, target.nowPos.y, 0.66);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body2, 10287, 30, 1, 8, 8, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y + 30, 30, true, 0, target.nowPos.x, target.nowPos.y + 30, 0.66);

      self.interval = 1.2;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      me.roleController:SetAnimationForceId(ERolePose.Attack);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      me:PlaySound(target.colm, target.row, Attack_Start, 3);

      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body1, 10262, 30, 1, 6, 6, EEffectLightTracer.StandAni, target.nowPos.x - math.random(0, 30) - 30, target.nowPos.y - math.random(0, 50) - 30, 40, false, 80);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Status, 10262, 160, 1, 6, 6, EEffectLightTracer.StandAni, target.nowPos.x + math.random(0, 30) + 30, target.nowPos.y - math.random(0, 50) - 80, 40, false, 80);
      self.interval = 0.8;
      self.step = 4;
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
  elseif self.step == 4 then
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body2, 10262, 160, 1, 6, 6, EEffectLightTracer.StandAni, target.nowPos.x - math.random(0, 30), target.nowPos.y - math.random(0, 50) - 60, 40, false, 80);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Status, 10262, 30, 1, 6, 6, EEffectLightTracer.StandAni, target.nowPos.x + math.random(0, 30) + 30, target.nowPos.y - math.random(0, 50) - 80, 40, false, 80);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10012, 50, 13, 1, 13, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 20, false, 80);
      me:PlaySound(target.colm, target.row, Attack_Start, 3);
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky4, 10112, 50, 1, 2, 2, EEffectLightTracer.Stand, target.nowPos.x + 30, target.nowPos.y, 20, false, 80);
      else
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky4, 10111, 50, 1, 2, 2, EEffectLightTracer.Stand, target.nowPos.x + 30, target.nowPos.y, 20, false, 80);
      end
      
      me:PlaySound(target.colm, target.row, Attack_Start, 3);
      self.interval = 0.8;
      self.step = 5;
     end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      FightField.SetShake(false);
      self.isLightEnd = true;
      self.step = 6;
    end
  end
end