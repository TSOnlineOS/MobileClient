ThreeFire = InheritsFromBaseAttackSkill();

function ThreeFire:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10078, 50, 1, 20, 20, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 20, true, 80);
    self.interval = 0.8;
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
    if self:CheckInterval() then      
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10108, 80, 1, 14, 14, EEffectLightTracer.StandAni, target.nowPos.x + 20, target.nowPos.y - 10, 20, true, 110);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10108, 130, 1, 14, 14, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, true, 110);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10108, 110, 1, 14, 14, EEffectLightTracer.StandAni, target.nowPos.x + 20, target.nowPos.y, 20, true, 110);
      me:PlaySound(target.colm, target.row);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 2);
      self.step = 3;
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
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      self.isLightEnd = true;
      self.step = 5;
    end
  end
end