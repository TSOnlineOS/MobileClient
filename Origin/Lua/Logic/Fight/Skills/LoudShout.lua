LoudShout = InheritsFromBaseAttackSkill();

function LoudShout:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    --030601J八卦魔法陣
    local magicPic = self:GetMagicPic();
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, magicPic, 50, 1, 22, 22, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 30, false, 113);
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
      local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then
    if self:CheckInterval() then
      local headPic = self:GetHeadPic(target.party_Kind);
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, headPic, 150, 1, 8, 8, EEffectLightTracer.Stand, me.nowPos.x - 20, me.nowPos.y, 30, false, 0);
      else
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, headPic, 150, 1, 8, 8, EEffectLightTracer.Stand, me.nowPos.x + 20, me.nowPos.y, 30, false, 50);
      end      
      FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1]:SetAlpha(1, 1, 30);
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].orderCount == 7 then
      local headPic = self:GetHeadPic(target.party_Kind);
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, headPic, 150, 8, 8, 8, EEffectLightTracer.Line, me.nowPos.x - 20, me.nowPos.y, 30, false, 0, target.nowPos.x, target.nowPos.y, 0.66);
      else
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, headPic, 150, 8, 8, 8, EEffectLightTracer.Line, me.nowPos.x + 20, me.nowPos.y, 30, false, 50, target.nowPos.x, target.nowPos.y, 0.66);
      end

      FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1]:SetAlpha(40, -2, 20);
      FightField.attack[self.humIdx].lights[EEffectLightKind.Sky2]:SetAlpha(10, 3, 20);      
      me:PlaySound(target.colm, target.row, Attack_Start);
      FightField.SetShake(true);
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky2].isArrive then
      FightField.SetShake(false);
      me:PlaySound(target.colm, target.row);
      self.isLightEnd = true;
      self.step = 5;
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

function LoudShout:GetMagicPic()
  if self.showKind == ESkill_Kind.LoudShout  then
    return 10079;
  elseif self.showKind == ESkill_Kind.ZhangFeiLoudShout then
    return 11065;
  end
end

function LoudShout:GetHeadPic(party_Kind)
  if self.showKind == ESkill_Kind.LoudShout  then
    if party_Kind == EFightParty.Left then
      return 10074;
    else
      return 10075;
    end
  elseif self.showKind == ESkill_Kind.ZhangFeiLoudShout then
    if party_Kind == EFightParty.Left then
      return 11066;
    else
      return 11067;
    end
  end
end

--專武技能
EW_LoudShout = InheritsAttack(LoudShout);

function EW_LoudShout:ExtraClose()
  FightField.SetShake(false);
end

function EW_LoudShout:InitDrawBlack()
  self.needDrawBlack = true;   
end