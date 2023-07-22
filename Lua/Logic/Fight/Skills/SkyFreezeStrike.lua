SkyFreezeStrike = InheritsFromBaseAttackSkill();

function SkyFreezeStrike:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:SetAnimationForceId(ERolePose.Stand);
    --030601J水魔法陣
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10070, 50, 1, 32, 32, EEffectLightTracer.Stand, me.nowPos.x + 7, me.nowPos.y, 20, true, 50);
    FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10019, 100, 1, 15, 15, EEffectLightTracer.StandAni, me.nowPos.x - 30, me.nowPos.y + 30, 30, false, 30);
    FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10019, 100, 1, 15, 15, EEffectLightTracer.StandAni, me.nowPos.x - 30, me.nowPos.y - 60, 30, false, 80);
    FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10019, 100, 1, 15, 15, EEffectLightTracer.StandAni, me.nowPos.x + 30, me.nowPos.y + 30, 30, false, 0);
    FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10019, 100, 1, 15, 15, EEffectLightTracer.StandAni, me.nowPos.x + 30, me.nowPos.y - 60, 30, false, 140);
    me:SetSpeed(0.22);
    me:SetBeh(EFightBeh.Rotate);
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
      local newPos = me:GetSpotOfRc(EFightSpot.Back, 60);
      me:PlaySound(target.colm, target.row, Attack_Start, 1);
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10518, 60, 1, 6, 12, EEffectLightTracer.Curve, newPos.x, newPos.y, 255, true, 30, target.nowPos.x, target.nowPos.y, 0.8);
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10518, 60, 1, 6, 12, EEffectLightTracer.Curve, newPos.x, newPos.y, 30, true, 30, target.nowPos.x, target.nowPos.y, 0.7);
        FightField.attack[self.humIdx].lights[7]:SetResidual(2, 60, 10);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10519, 60, 1, 6, 12, EEffectLightTracer.Curve, newPos.x, newPos.y, 255, true, 30, target.nowPos.x, target.nowPos.y, 0.8);
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10519, 60, 1, 6, 12, EEffectLightTracer.Curve, newPos.x, newPos.y, 30, true, 30, target.nowPos.x, target.nowPos.y, 0.7);
        FightField.attack[self.humIdx].lights[7]:SetResidual(2, 60, 10);
      end
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
    if FightField.attack[self.humIdx].lights[6].isArrive then
      local newPos = me:GetSpotOfRc(EFightSpot.Back, 60);
      me:PlaySound(target.colm, target.row, Attack_Start, 2);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      target.roleController:SetAnimationForceId(ERolePose.Hit);
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(8, EEffectLightDis.Sky, 10150, 30, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, false, 120);
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10518, 60, 1, 6, 12, EEffectLightTracer.Curve, target.nowPos.x, target.nowPos.y, 255, true, 30, newPos.x, newPos.y, 0.8, 2);
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10518, 60, 1, 6, 12, EEffectLightTracer.Curve, target.nowPos.x, target.nowPos.y, 30, true, 30, newPos.x, newPos.y, 0.7, 2);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(8, EEffectLightDis.Sky, 10100, 30, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, false, 80);
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10519, 60, 1, 6, 12, EEffectLightTracer.Curve, target.nowPos.x, target.nowPos.y, 255, true, 30, newPos.x, newPos.y, 0.8, 2);
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10519, 60, 1, 6, 12, EEffectLightTracer.Curve, target.nowPos.x, target.nowPos.y, 30, true, 30, newPos.x, newPos.y, 0.7, 2);
      end

      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10019, 60, 1, 15, 15, EEffectLightTracer.Stand, target.nowPos.x - 10, target.nowPos.y - 40, 40, false, 80);
      FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Sky, 10012, 60, 1, 13, 13, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 20, false, 80);
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
        
    if FightField.attack[self.humIdx].lights[9].orderCount == 12 then
      FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Sky, 10395, 60, 1, 10, 10, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 30, false, 40);
      me:PlaySound(target.colm, target.row, Attack_Start, 2);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      self.interval = 0.8;
      self.step = 5;
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 6;
    end
  end
end