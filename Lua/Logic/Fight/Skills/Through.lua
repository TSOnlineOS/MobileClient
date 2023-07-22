Through = InheritsFromBaseAttackSkill();

function Through:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.sky, 10110, 80, 1, 11, 11, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 1, true, 30);
    self.interval = 0.1;
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
      local newPos = target:GetSpot(EFightSpot.Back, 60);
      me:SetJump(target.nowPos.x,target.nowPos.y, false);
      me.roleController:SetInBattle(false);
      me:SetBeh(EFightBeh.Rotate);
      me:SetSpeed(0.66);

      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.sky, 10110, 80, 1, 11, 11, EEffectLightTracer.Curve, 
                                                        me.nowPos.x, me.nowPos.y, 40, true, 30, target.nowPos.x, target.nowPos.y, 0.66);

      FightField.attack[self.humIdx].lights[1]:SetAlpha(10, 2, 20);
      FightField.attack[self.humIdx].lights[1]:SetResidual(3, 50, -10);
      self.step = 3;
    end
  elseif self.step == 3 then
    if me.arrive then
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.sky, 10110, 80, 1, 11, 11, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 40, true, 30);
      FightField.attack[self.humIdx].lights[1]:SetAlpha(50, -1, 50);
      
      me:PlaySound(target.colm, target.row);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 2);

      if not target:IsInSealStatus() then
        target.roleController:SetIsDead(true);
        target:SetBeh(EFightBeh.Rotate);
        target:SetJump(target.nowPos.x, target.nowPos.y - 150, false);
      end
      --todo  秀中招者原地影子
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground, "Shadow2", 80, 1, 1, 1, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 255, false, 35);
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
    if target.arrive then
      me.roleController:SetIsJumping(true);
      me:SetJump(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y, true);
      me:SetSpeed(1);

      if not target:IsInSealStatus() then
        target:SetBeh(EFightBeh.Rotate);
        local floorY = math.min(target.nowPos.y + 150, target:GetChipPos().y);
        target:SetJump(target.nowPos.x, floorY, false);
      end

      self.step = 5;
    end
  elseif self.step == 5 then
    if target.arrive then
      me:PlaySound(target.colm, target.row);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 2);
      self.step = 6;
    end
  elseif self.step == 6 then
    if me.arrive then
      self.isLightEnd = true;
      self.step = 7;
    end
  end
end