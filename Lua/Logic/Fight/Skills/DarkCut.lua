DarkCut = InheritsFromBaseAttackSkill();

function DarkCut:Update()  
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then           
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky ,10817, 20, 4, 18, 18, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y + 60, 1, true, 30);
    self.interval = 0.1;
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
    self.step = 2;      
  elseif self.step == 2 then
    if self:CheckInterval() then
      me.roleController:SetAnimationForceId(ERolePose.Stand);
      me:SetBeh(EFightBeh.Rotate);
      me:SetJump(target.nowPos.x, target.nowPos.y, false);
      me:SetSpeed(0.66);
      me:PlaySound(target.colm, target.row, Attack_Start);
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky ,10817, 40, 4, 18, 18, EEffectLightTracer.Curve, me.nowPos.x + 30, me.nowPos.y + 60, 40, true, 0, target.nowPos.x, target.nowPos.y + 60, 0.66);
      FightField.attack[self.humIdx].lights[1]:SetAlpha(10, 2, 20);
      FightField.attack[self.humIdx].lights[1]:SetResidual(3, 50, -10);
      self.step = 3;
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
    end
  elseif self.step == 3 then
    if me.arrive then
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky ,10818, 40, 1, 15, 15, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y + 60, 1, true, 30);
      FightField.attack[self.humIdx].lights[1]:SetAlpha(50, -1, 50);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 2);

      if not target:IsInSealStatus() then
        target.roleController:SetIsDead(true);
        target:SetBeh(EFightBeh.Rotate);
        target:SetJump(target.nowPos.x, target.nowPos.y - 150, false);
      end
      
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground, "Shadow2", 80, 1, 1, 1, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 255, true, 35);
      self.step = 4;
     end
  elseif self.step == 4 then
    if target.arrive then
      me.roleController:SetAnimationForceId(ERolePose.None)
      me.roleController:SetIsJumping(true);
      me:SetJump(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y, true);
      if not target:IsInSealStatus() then
        target:SetJump(target.nowPos.x, target.nowPos.y + 150, false);
      end
      self.step = 5;
    end
  elseif self.step == 5 then
    if target.arrive then
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