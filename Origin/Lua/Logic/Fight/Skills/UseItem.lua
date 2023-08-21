UseItem = InheritsFromBaseAttackSkill();

function UseItem:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10082, 50, 1, 20, 20, EEffectLightTracer.Stand, me.nowPos.x + 6, me.nowPos.y, 30, false, 70);
    self.step = self.step + 1;
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
      if Contains(target.npcId, 37002, 37007, 37017, 37022) then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10725, 30, 1, 4, 4, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y - 90, 255, false, 50);
      elseif Contains(target.npcId, 37001, 37003, 37004, 37005, 37006, 37016, 37018, 37019, 37020, 37021) then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10726, 30, 1, 4, 4, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y - 35, 255, false, 50);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10028, 30, 1, 24, 24, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y -35, 20, false, 50);
      end

      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10033, 32, 1, 25, 25, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, false, 10);
      self.step = self.step + 1;
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
      self.step = self.step + 1;
    end
  elseif self.step == 4 then
    self.isLightEnd = true;
  end
end


