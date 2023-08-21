ThrowCar = InheritsFromBaseAttackSkill();

function ThrowCar:InitExtraParameters()
  self.cnt = 0;
end

function ThrowCar:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
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
      --local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then
    local newPos = {};
    for i = 0, self.emyNum - 1 do 
      newPos.x = FightField.fightHum[self.emyIdxAy[i]].nowPos.x;
      newPos.y = FightField.fightHum[self.emyIdxAy[i]].nowPos.y;
      me:PlaySound(target.colm, target.row, Attack_Start);
      FightField.attack[self.humIdx]:SetLightWithOrder(i + 2, EEffectLightDis.Sky, 10011, 50, 1, 1, 1, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y, 255, true, 0, newPos.x, newPos.y, 0.5);
    end
    self.step = 3;
  elseif self.step == 3 then
    for i = 0, self.emyNum - 1 do
      if FightField.attack[self.humIdx].lights[i + 2].isArrive then
        target = FightField.fightHum[self.emyIdxAy[i]];
        me:PlaySound(target.colm, target.row);
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);

        FightField.attack[self.humIdx]:SetLightWithOrder(i + 2, EEffectLightDis.Sky, 10016, 30, 4, 15, 15, EEffectLightTracer.StandAni, target.nowPos.x + math.random(50) - 1, target.nowPos.y + math.random(50) - 1, 25, true, 25);
        self.cnt = self.cnt + 1;
      end
    end

    if self.cnt == self.emyNum then
      self.cnt = self.cnt - 1;
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[self.cnt + 2].picId == 0 then
      self.isLightEnd = true;
      self.step = 5;
    end
  end
end