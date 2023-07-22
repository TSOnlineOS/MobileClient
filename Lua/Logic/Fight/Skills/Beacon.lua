Beacon = InheritsFromBaseAttackSkill();

function Beacon:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground ,10078, 50, 1, 20, 20, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 20, true, 80);
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
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
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
      local newPos = {};
      if target.party_Kind == EFightParty.Left then
        newPos.x = FightField.skillOffset.x + 236;
        newPos.y = FightField.skillOffset.y + 260;
      else
        newPos.x = FightField.skillOffset.x + 570;
        newPos.y = FightField.skillOffset.y + 440;
      end
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky ,10056, 40, 1, 6, 6, EEffectLightTracer.Line, newPos.x, newPos.y - 150, 30, true, 0, newPos.x, newPos.y, 1);
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[2].isArrive then
      local newPos = {};
      if target.party_Kind == EFightParty.Left then
        newPos.x = FightField.skillOffset.x + 236;
        newPos.y = FightField.skillOffset.y + 260;
      else
        newPos.x = FightField.skillOffset.x + 570;
        newPos.y = FightField.skillOffset.y + 440;
      end

      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky ,10140, 80, 1, 15, 15, EEffectLightTracer.StandAni,newPos.x, newPos.y, 30, true, 120);
      FightField.isShake = true;
      me:PlaySound(target.colm, target.row);

      local newPos = {};
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);
        target.roleController:Hit();
        target:SetSpeed(0.16);

        if not target:IsInSealStatus() then
          if Between(target.colm, 0, 3) then
            newPos = target:GetSpot(EFightSpot.Back, 60);
          else
            newPos = target:GetSpot(EFightSpot.Front, 60);
          end
          
          target:SetJump(newPos.x, newPos.y, true);
        end
      end
      self.step = 4;
    end
  elseif self.step == 4 then
    if target.arrive then
      FightField.SetShake(false);
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        target.roleController:SetIsDead(true);
      end
        self.step = 5;
    end
  elseif self.step == 5 then
    if FightField.attack[self.humIdx].lights[2].picId == 0 then
      self.isLightEnd = true;
      self.step = 6;
    end
  end
end