ViolentCattle = InheritsFromBaseAttackSkill();

function ViolentCattle:InitDrawBlack()
  self.needDrawBlack = true;   
end

function ViolentCattle:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10010, 30, 1, 4, 4, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 255, false, 60);
    if target.party_Kind == EFightParty.Left then
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10388, 60, 1, 7, 7, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 30, false, 30);
    else
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10389, 60, 1, 7, 7, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 30, false, 30);
    end

    self.interval = 0.38;
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
      me.roleController:SetIsJumping(true);
      me:SetSpeed(0.44);
      me:SetWalk(target.nowPos.x, target.nowPos.y, false);
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10024, 30, 7, 14, 14, EEffectLightTracer.Line, me.nowPos.x + 30, me.nowPos.y - 10, 255, true, 30, target.nowPos.x, target.nowPos.y, 0.30);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10024, 30, 7, 14, 14, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y - 10, 255, true, 30, target.nowPos.x, target.nowPos.y, 0.30);
      end

      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10016, 30, 1, 15, 15, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 30, false, 50, target.nowPos.x, target.nowPos.y, 0.30);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10016, 30, 1, 15, 15, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 30, false, 50, target.nowPos.x, target.nowPos.y, 0.20);
      self.step = 3;
    end
  elseif self.step == 3 then
    if me.arrive then
      FightField.attack[self.humIdx]:StopLight(3);
      FightField.attack[self.humIdx]:StopLight(4);
      FightField.attack[self.humIdx]:StopLight(5);

      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10388, 60, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 30);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10389, 60, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 30);
      end

      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10000, 40, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 255, false, 0);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10000, 40, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 255, false, 0);
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10000, 40, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 255, false, 0);

      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      me:SetSpeed(0.74);
      me.roleController:SetIsJumping(true);
      me:SetJump(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y, false);
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
    if me.arrive then
      self.interval = 0.3;
      self.step = 5;
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      self.isLightEnd = true
      self.step = 6;
    end
  end
end