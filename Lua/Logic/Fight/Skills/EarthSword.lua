EarthSword = InheritsFromBaseAttackSkill();

function EarthSword:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self.step == 1 then
    local newPos = target:GetAttackPos(EFightSpot.Front, 60);
    me:SetJump(newPos.x, newPos.y, false);
    me.roleController:SetIsJumping(true);
    me:SetSpeed(0.72);
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
      me.roleController:SetIsJumping(false);
      me.roleController:FaceTo(target.nowPos);
      me.roleController:SetAnimationForceId(ERolePose.Attack);
      me:PlaySound(target.colm, target.row, Attack_Start);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      FightField.isShake = true;
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground ,10010, 50, 1, 4, 4, EEffectLightTracer.Stand, target.nowPos.x - 25, target.nowPos.y, 255, false, 60);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky ,10267, 10, 1, 10, 10, EEffectLightTracer.Stand, target.nowPos.x - 15, target.nowPos.y, 255, false, 30);
      FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Ground ,10008, 50, 6, 15, 15, EEffectLightTracer.StandAni, target.nowPos.x - 15, target.nowPos.y, 255, false, 70);
      self.interval = 0.08;
      self.step  = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground ,10010, 50, 1, 4, 4, EEffectLightTracer.Stand, target.nowPos.x + 30, target.nowPos.y, 255, false, 60);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Ground ,10267, 10, 1, 10, 10, EEffectLightTracer.Stand, target.nowPos.x + 20, target.nowPos.y, 255, false, 40);
      FightField.attack[self.humIdx]:SetLightWithOrder(8, EEffectLightDis.Ground ,10008, 50, 7, 15, 15, EEffectLightTracer.StandAni, target.nowPos.x + 20, target.nowPos.y, 255, false, 60);
      self.interval = 0.08;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      me:PlaySound(target.colm, target.row, Attack_Start);
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Ground ,10010, 50, 1, 4, 4, EEffectLightTracer.Stand, target.nowPos.x + 10, target.nowPos.y, 255, false, 35);
      FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Ground ,10267, 10, 1, 10, 10, EEffectLightTracer.Stand, target.nowPos.x + 10, target.nowPos.y, 255, false, 25);
      FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Ground ,10008, 50, 6, 15, 15, EEffectLightTracer.StandAni, target.nowPos.x + 10, target.nowPos.y, 255, false, 35);
      self.interval = 0.08;
      self.step = 5;
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      me.roleController:SetAnimationForceId(ERolePose.None);
      me.roleController:SetIsJumping(true);
      me:SetJump(me:GetChipPos().x, me:GetChipPos().y, false);
      FightField.SetShake(false);
      self.interval = 0.5;
      self.step = 6;
    end
  elseif self.step == 6 then
    if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 7;
    end
  end
end
