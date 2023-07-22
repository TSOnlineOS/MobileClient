WindMove = InheritsFromBaseAttackSkill();

function WindMove:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    self.interval = 0.5;
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
      local knifePicID = self:GetKnifePicID(2, me.party_Kind);
      local picID = self:GetPicID(2, me.party_Kind);

      FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Sky, picID, 50, 1, 8, 8, EEffectLightTracer.Stand, me.nowPos.x + 10, me.nowPos.y - 30, 30, true, 0);

      if me.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, knifePicID, 80, 1, 1, 1, EEffectLightTracer.Stand, me.nowPos.x - 70, me.nowPos.y + 150, 255, true, 45);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, knifePicID, 80, 1, 1, 1, EEffectLightTracer.Stand, me.nowPos.x - 100, me.nowPos.y + 20, 255, true, 0);
      end

      self.interval = 0.1;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then
      local knifePicID = self:GetKnifePicID(3, me.party_Kind);

      if me.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, knifePicID, 80, 1, 1, 1, EEffectLightTracer.Stand, me.nowPos.x - 70, me.nowPos.y + 150, 255, true, 45);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, knifePicID, 80, 1, 1, 1, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y + 100, 255, true, 0);
      end

      self.interval = 0.1;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then
      local knifePicID = self:GetKnifePicID(4, me.party_Kind);

      if me.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, knifePicID, 80, 1, 1, 1, EEffectLightTracer.Stand, me.nowPos.x - 150, me.nowPos.y - 50, 255, true, 0);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, knifePicID, 80, 1, 1, 1, EEffectLightTracer.Stand, me.nowPos.x + 130, me.nowPos.y - 80, 255, true, 45);
      end

      self.interval = 0.1;
      self.step = 5;
    end
  elseif self.step == 5 then
    if self:CheckInterval() then
      local knifePicID = self:GetKnifePicID(5, me.party_Kind);

      if me.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, knifePicID, 80, 1, 1, 1, EEffectLightTracer.Stand, me.nowPos.x + 80, me.nowPos.y - 40, 255, true, 0);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, knifePicID, 80, 1, 1, 1, EEffectLightTracer.Stand, me.nowPos.x - 100, me.nowPos.y - 60, 255, true, 45);
      end

      self.interval = 0.1;
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
  elseif self.step == 6 then
    if self:CheckInterval() then
      local knifePicID = self:GetKnifePicID(6, me.party_Kind);

      if me.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, knifePicID, 80, 1, 1, 1, EEffectLightTracer.Stand, me.nowPos.x + 110, me.nowPos.y - 40, 255, true, 0);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, knifePicID, 80, 1, 1, 1, EEffectLightTracer.Stand, me.nowPos.x - 70, me.nowPos.y - 60, 255, true, 45);
      end

      self.interval = 0.1;
      self.step = 7;
    end
  elseif self.step == 7 then
    if self:CheckInterval() then
      local knifePicID = self:GetKnifePicID(7, me.party_Kind);

      if me.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, knifePicID, 80, 1, 1, 1, EEffectLightTracer.Stand, me.nowPos.x - 40, me.nowPos.y - 70, 255, true, 0);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, knifePicID, 80, 1, 1, 1, EEffectLightTracer.Stand, me.nowPos.x + 120, me.nowPos.y - 80, 255, true, 45);
      end

      self.interval = 0.1;
      self.step = 8;
    end
  elseif self.step == 8 then
    if self:CheckInterval() then
      local knifePicID = self:GetKnifePicID(8, me.party_Kind);
      if me.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, knifePicID, 80, 1, 1, 1, EEffectLightTracer.Stand, me.nowPos.x - 150, me.nowPos.y, 255, true, 0);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, knifePicID, 80, 1, 1, 1, EEffectLightTracer.Stand, me.nowPos.x + 150, me.nowPos.y + 50, 255, true, 45);
      end
      FightField.isShake = true;
     
      self.interval = 0.2;
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
        local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  elseif self.step == 9 then
    if self:CheckInterval() then
      local knifePicID = self:GetKnifePicID(9, me.party_Kind);
      if me.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, knifePicID, 80, 1, 1, 1, EEffectLightTracer.Stand, me.nowPos.x - 200, me.nowPos.y + 70, 255, true, 0);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, knifePicID, 80, 1, 1, 1, EEffectLightTracer.Stand, me.nowPos.x + 180, me.nowPos.y + 90, 255, true, 0);
      end

      self.interval = 0.05;
      self.step = 10;
    end
  elseif self.step == 10 then
    if self:CheckInterval() then 
      FightField.SetShake(false);
      local knifePicID = self:GetKnifePicID(10, me.party_Kind);
      local picID = self:GetPicID(10, me.party_Kind);

      if me.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, knifePicID, 100, 1, 1, 1, EEffectLightTracer.StandAni, me.nowPos.x - 200, me.nowPos.y - 50, 255, true, 0);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, knifePicID, 100, 1, 1, 1, EEffectLightTracer.StandAni, me.nowPos.x + 90, me.nowPos.y + 240, 255, true, 0);
      end

      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        target.roleController:Hit();
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);
        FightField.attack[self.humIdx]:SetLightWithOrder(3 + i, EEffectLightDis.Sky, picID, math.random(50) + 74, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x + 10, target.nowPos.y + 70, 30, false, 0);
      end
      self.interval = 0.3;
      self.step = 11;
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
  elseif self.step == 11 then
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:StopLight(1);
      FightField.attack[self.humIdx]:StopLight(2);

      local newPos = {};
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        if not target:IsInSealStatus() then
          newPos = target:GetSpot(EFightSpot.Back, 99 + math.random(50));
          target.roleController:SetAnimationForceId(ERolePose.Lie);
          target:SetJump(newPos.x, newPos.y);
        end
      end
      self.interval = 0.8;
      self.step = 12;
    end
  elseif self.step == 12 then
    if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 13;
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

function WindMove:GetKnifePicID(step, party)
  if party == nil then
    party = 0;
  end

  if self.showKind == ESkill_Kind.WindMove then
    if step == 2 then
      if party == EFightParty.Right then return 10644;
      else return 10653; end
    elseif step == 3 then
      if party == EFightParty.Right then return 10645;
      else return 10654; end
    elseif step == 4 then
      if party == EFightParty.Right then return 10646;
      else return 10655; end
    elseif step == 5 then
      if party == EFightParty.Right then return 10647;
      else return 10656; end
    elseif step == 6 then
      if party == EFightParty.Right then return 10648;
      else return 10657; end
    elseif step == 7 then
      if party == EFightParty.Right then return 10649;
      else return 10658; end
    elseif step == 8 then
      if party == EFightParty.Right then return 10650;
      else return 10659; end
    elseif step == 9 then
      if party == EFightParty.Right then return 10651;
      else return 10660; end
    elseif step == 10 then
      if party == EFightParty.Right then return 10652;
      else return 10661; end
    end
  elseif self.showKind == ESkill_Kind.KingWindMove then
    if step == 2 then
      if party == EFightParty.Right then return 20065;
      else return 20074; end
    elseif step == 3 then
      if party == EFightParty.Right then return 20066;
      else return 20075; end
    elseif step == 4 then
      if party == EFightParty.Right then return 20067;
      else return 20076; end
    elseif step == 5 then
      if party == EFightParty.Right then return 20068;
      else return 20077; end
    elseif step == 6 then
      if party == EFightParty.Right then return 20069;
      else return 20078; end
    elseif step == 7 then
      if party == EFightParty.Right then return 20070;
      else return 20079; end
    elseif step == 8 then
      if party == EFightParty.Right then return 20071;
      else return 20080; end
    elseif step == 9 then
      if party == EFightParty.Right then return 20072;
      else return 20081; end
    elseif step == 10 then
      if party == EFightParty.Right then return 20073;
      else return 20082; end
    end
  end
end

function WindMove:GetPicID(step, party)
  if party == nil then
    party = 0;
  end

  if self.showKind == ESkill_Kind.WindMove then
    if step == 2 then
      return 10417;
    elseif step == 10 then
      return 10419;
    end
  elseif self.showKind == ESkill_Kind.KingWindMove then
    if step == 2 then
      return 20064;
    elseif step == 10 then
      return 20063;
    end
  end
end