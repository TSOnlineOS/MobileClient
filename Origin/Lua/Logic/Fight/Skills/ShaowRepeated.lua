ShaowRepeated = InheritsFromBaseAttackSkill();

function ShaowRepeated:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = target:GetSpot(EFightSpot.Front, 60);
    me:SetWalk(newPos.x, newPos.y, true);
    me:SetBeh(EFightBeh.Residual);
    me:SetSpeed(1.33);
    me:PlaySound(target.colm, target.row, Attack_Start, 1);
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
    if me.arrive then
      local newPos = target:GetSpot(EFightSpot.Front, 60);
      local newPos1 = target:GetSpot(EFightSpot.Back, 60);
      me:SetWalk(newPos.x, newPos.y, true);
      me.roleController:FaceTo(target.nowPos);
      me.roleController:SetAnimationForceId(ERolePose.Attack);

      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10301, 50, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x + math.random(0, 30), target.nowPos.y - math.random(40), 30, true, 220);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10302, 50, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x + math.random(0, 30), target.nowPos.y - math.random(60), 30, true, 1400);

      me:PlaySound(target.colm, target.row, Attack_Start, 2);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3);
      me:SetWalk(newPos1.x, newPos1.y, true);
      self.interval = 0.5;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      target.roleController:SetAnimationForceId(ERolePose.Hit);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10301, 50, 1, 7, 7,EEffectLightTracer.StandAni, target.nowPos.x + math.random(0, 30), target.nowPos.y, 30, true, 180);
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10303, 50, 1, 7, 7,EEffectLightTracer.StandAni, target.nowPos.x + math.random(0, 30), target.nowPos.y, 30, true, 0);
      me:PlaySound(target.colm, target.row, Attack_Start, 2);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);

      local newPos = target:GetSpot(EFightSpot.Front, 60);
      me:SetWalk(newPos.x, newPos.y, true);
      self.interval = 0.5;
      self.step = 4;
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
  elseif self.step == 4 then
    if self:CheckInterval() then 
      me:SetMoment(target.nowPos.x + 20, target.nowPos.y - 120, false);
      FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10302, 50, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x + math.random(30), target.nowPos.y, 30, true, 80);
      FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10303, 50, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x + math.random(30), target.nowPos.y, 30, true, 0);

      me:PlaySound(target.colm, target.row, Attack_Start, 2);
      me:PlayEffect(target.colm, target.row, ERolePose.Lie, 3);
      me:SetWalk(target.nowPos.x, target.nowPos.y, true);
      self.interval = 0.5;
      self.step = 5;
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 6;
    end
  end
end