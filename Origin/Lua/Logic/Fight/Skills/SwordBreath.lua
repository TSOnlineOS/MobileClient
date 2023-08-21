SwordBreath = InheritsFromBaseAttackSkill();

function SwordBreath:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = target:GetAttackPos(EFightSpot.Front, 370); -- 60 + 80 * 3 + 30 + 40 //取光影位置
    newPos.y = newPos.y - 50;
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
    local newPos = me:GetAttackPos(EFightSpot.Front, 70);
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky ,10706, 150, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, false, 100);
    self.step = 3;
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[1].orderCount == 2 then
      local newPos = me:GetAttackPos(EFightSpot.Front, 70);
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky ,10707, 80, 1, 1, 6, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, false, 140);
      self.interval = 0.15;
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
        --local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      local newPos = me:GetAttackPos(EFightSpot.Front, 130);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky ,10707, 80, 2, 2, 6, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, false, 140);
      self.interval = 0.15;
      self.step = 5;
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      local newPos = me:GetAttackPos(EFightSpot.Front, 220);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky ,10707, 80, 3, 3, 6, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, false, 140);
      self.interval = 0.15;
      self.step = 6;
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
  elseif self.step == 6 then
    if self:CheckInterval() then 
      local newPos = me:GetAttackPos(EFightSpot.Front, 330);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky ,10707, 120, 4, 6, 6, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, false, 140);
      self.interval = 0.1;
      self.step = 7;
    end
  elseif self.step == 7 then
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:StopLight(1);
      self.interval = 0.1;
      self.step = 8;
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
  elseif self.step == 8 then
    if self:CheckInterval() then 
       FightField.attack[self.humIdx]:StopLight(2);
      self.interval = 0.1;
      self.step = 9;
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
  elseif self.step == 9 then
    if self:CheckInterval() then 
       FightField.attack[self.humIdx]:StopLight(3);
      self.step = 10;
    end
  elseif self.step == 10 then
    if FightField.attack[self.humIdx].lights[4].orderCount == 3 then
      self.isLightEnd = true;
      self.step = 11;
    end
  end
end