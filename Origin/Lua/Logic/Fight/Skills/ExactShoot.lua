ExactShoot = InheritsFromBaseAttackSkill();

function ExactShoot:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetJump(newPos.x, newPos.y, true);
    me:SetBeh(EFightBeh.Residual);
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
    if me.arrive then  
      local aRi =  me.roleController:GetAnimationFrame(me.roleController:GetAnimationId(ERolePose.Archery));
      if aRi == 0 then  --NPC沒有設箭動作
        me.roleController:MagicAttack();
      else
        me.roleController:RangeAttack();
      end

      me.roleController:SetAnimationForceFrame(1);
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10320, 80, 1, 8, 8, EEffectLightTracer.Stand, target.nowPos.x + 5, target.nowPos.y, 30, false, 45);
      self.interval = 0.9;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      me.roleController:SetAnimationForceFrame(255);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10329, 80, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x + 5, target.nowPos.y, 30, false, 45);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10330, 80, 1, 5, 5, EEffectLightTracer.StandAni, target.nowPos.x + 5, target.nowPos.y, 30, false, 45);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10295, 200, 1, 2, 2, EEffectLightTracer.StandAni, target.nowPos.x + 60, target.nowPos.y, 30, false, 90);

      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Body, 10335, 30, 5, 5, 6, EEffectLightTracer.Stand, target.nowPos.x + 20, target.nowPos.y, 255, false, 0);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Body, 10336, 30, 5, 5, 6, EEffectLightTracer.Stand, target.nowPos.x - 15, target.nowPos.y - 20, 255, false, 0);
      end

      me.roleController:SetAnimationForceFrame(1);
      me:PlaySound(target.colm, target.row, Attack_Hit, 1);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      target.roleController:Hit();
      self.interval = 1;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      me.roleController:SetAnimationForceFrame(255);
      self.isLightEnd = true;
      self.step = 5;
    end
  end
end

EW_ExactShoot = InheritsAttack(ExactShoot);

function EW_ExactShoot:InitDrawBlack()
  self.needDrawBlack = true;   
end