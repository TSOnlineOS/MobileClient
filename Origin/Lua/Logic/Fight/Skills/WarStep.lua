WarStep = InheritsFromBaseAttackSkill();

function WarStep:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me:SetBeh(EFightBeh.Residual);
    me.roleController:SetIsJumping(true);
    me:SetJump(me.nowPos.x, me.nowPos.y, - 90);
    me.roleController:FaceTo(target.nowPos);
    me:SetSpeed(0.5);
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
      local newPos = me:GetChipPos();
      local newPos1 = me:RCtoSpot(me.colm, me.row, EFightSpot.Back, 100);
      me:SetJump(newPos.x ,newPos.y - 30);
      me.roleController:FaceTo(target.nowPos);

      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Ground, 10473, 30, 1, 4, 4, EEffectLightTracer.Line, newPos1.x, newPos1.y, 255, false, 50, newPos.x - 30, newPos.y - 30, 0.77);
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10475, 30, 1, 4, 4, EEffectLightTracer.Line, newPos1.x, newPos1.y, 30, false, 50, newPos.x, newPos.y, 0.5);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground, 10475, 30, 1, 4, 4, EEffectLightTracer.Line, newPos1.x, newPos1.y, 30, false, 50, newPos.x, newPos.y, 0.3);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10475, 30, 1, 4, 4, EEffectLightTracer.Line, newPos1.x, newPos1.y, 30, false, 50, newPos.x, newPos.y, 0.1);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Ground, 10474, 30, 1, 4, 4, EEffectLightTracer.Line, newPos1.x, newPos1.y, 255, false, 50, newPos.x + 30, newPos.y + 30, 0.77);
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10476, 30, 1, 4, 4, EEffectLightTracer.Line, newPos1.x, newPos1.y, 30, false, 50, newPos.x, newPos.y, 0.5);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground, 10476, 30, 1, 4, 4, EEffectLightTracer.Line, newPos1.x, newPos1.y, 30, false, 50, newPos.x, newPos.y, 0.3);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10476, 30, 1, 4, 4, EEffectLightTracer.Line, newPos1.x, newPos1.y, 30, false, 50, newPos.x, newPos.y, 0.1);
      end

      self.step = 3;
    end
  elseif self.step == 3 then
    if me.arrive then
      local newPos = me:GetChipPos();
      local newPos1 = target:RCtoSpot(target.colm, target.row, EFightSpot.Back, 100);
      me:SetBeh(EFightBeh.None);
      me:SetWalk(newPos1.x, newPos1.y - 25);
      me.roleController:SetIsJumping(false);
      me.roleController:FaceTo(target.nowPos);
      me:SetSpeed(0.5);

      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground, 10475, 30, 1, 4, 4, EEffectLightTracer.Line, newPos.x + 30, newPos.y - 60, 30, true, 50, newPos1.x + 40, newPos1.y - 30, 0.5);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10473, 30, 1, 4, 4, EEffectLightTracer.Line, newPos.x - 30, newPos.y - 30, 255, true, 50, newPos1.x, newPos1.y, 0.5);
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10475, 30, 1, 4, 4, EEffectLightTracer.Line, newPos.x - 80, newPos.y, 30, true, 50, newPos1.x - 80, newPos1.y, 0.5);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Ground, 10295, 30, 1, 2, 2, EEffectLightTracer.Line, newPos.x + 100, newPos.y + 70, 30, true, 50, newPos1.x + 100, newPos1.y + 70, 0.5);
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Ground, 10295, 30, 1, 2, 2, EEffectLightTracer.Line, newPos.x + 50, newPos.y + 90, 30, true, 50, newPos1.x + 50, newPos1.y + 90, 0.5);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground, 10476, 30, 1, 4, 4, EEffectLightTracer.Line, newPos.x + 80, newPos.y - 30, 30, true, 50, newPos1.x + 80, newPos1.y, 0.5);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10474, 30, 1, 4, 4, EEffectLightTracer.Line, newPos.x + 30, newPos.y, 255, true, 50, newPos1.x, newPos1.y, 0.5);
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10476, 30, 1, 4, 4, EEffectLightTracer.Line, newPos.x - 30, newPos.y + 30, 30, true, 50, newPos1.x - 30, newPos1.y + 60, 0.5);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Ground, 10294, 30, 1, 2, 2, EEffectLightTracer.Line, newPos.x - 90, newPos.y + 10, 30, true, 50, newPos1.x - 90, newPos1.y + 10, 0.5);
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Ground, 10294, 30, 1, 2, 2, EEffectLightTracer.Line, newPos.x - 45, newPos.y - 10, 30, true, 50, newPos1.x - 45, newPos1.y - 10, 0.5);
      end
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
    if self:IsDash() then
      local ran, newPos;
      FightField.SetShake(true);
      newPos = me:GetChipPos();
      me:SetMoment(newPos.x, newPos.y, false);
      me:PlaySound(target.colm, target.row, Attack_Start);
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        target:SetSpeed(0.16);
        target:SetBeh(EFightBeh.Rotate);
        if not target:IsInSealStatus() then
          ran = math.random(3);
          if ran == 1 then
            newPos = target:GetSpot(EFightSpot.Back, math.random(0, 50) + 130);
          elseif ran == 2 then
            newPos = target:GetSpot(EFightSpot.Left, math.random(0, 50) + 130);
          else
            newPos = target:GetSpot(EFightSpot.Front, math.random(0, 50) + 130);
          end

          target:SetJump(newPos.x, newPos.y, true);
        end

        FightField.attack[self.humIdx]:SetLightWithOrder(i + 1, EEffectLightDis.Sky, 10309, 150, 1, 5, 5, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 210);
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 4, EEffectLightDis.Sky, 10438, 50, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, true, 90);
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 7, EEffectLightDis.Sky, 10328, 50, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, true, 50);
      end
      self.step = 5;
    end
  elseif self.step == 5 then
    if target.arrive then
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        target:SetBeh(EFightBeh.None);
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      end
      
      FightField.SetShake(false);
      self.isLightEnd =true;
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
        local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  end
end

function WarStep:IsDash()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  
  if math.abs(me.nowPos.x - target.nowPos.x) < 40 or math.abs(me.nowPos.y - target.nowPos.y) < 40 then
    return true;
  else
    return false;
  end
end