TurtleVitality = InheritsFromBaseAttackSkill();

function TurtleVitality:ExtraClose()
  FightField.SetRoleVisibleByID(35033, ERoleVisible.Visible);
  FightField.SetRoleVisibleByID(35034, ERoleVisible.Visible);
end

function TurtleVitality:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:SetAnimationForceId(ERolePose.Special);
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground ,10080, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 6, me.nowPos.y, 20, true, 80);
    FightField.SetRoleVisibleByID(35033, ERoleVisible.Hide);
    FightField.SetRoleVisibleByID(35034, ERoleVisible.Hide);
    
    self.interval = 0.8;
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
      --local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    self.step = 2;
  elseif self.step == 2 then
    if self:CheckInterval() then 
      for i = 0, self.emyNum - 1 do 
        target = FightField.fightHum[self.emyIdxAy[i]];
        FightField.attack[self.humIdx]:SetLightWithOrder(2 + i*2, EEffectLightDis.Body, 10001, 80, 1, 15, 15, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 40);
        FightField.attack[self.humIdx]:SetLightWithOrder(3 + i*2, EEffectLightDis.Body, 10001, 60, 1, 15, 15, EEffectLightTracer.StandAni, target.nowPos.x + 10, target.nowPos.y - 10, 30, true, 40);
      end
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[2].picId == 0 then
      self.step = 4;
    end
  elseif self.step == 4 then
    self.isLightEnd =true;
    self.step = 5;
  end
end