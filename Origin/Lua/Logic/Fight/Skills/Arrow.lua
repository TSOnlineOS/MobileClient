Arrow = InheritsFromBaseAttackSkill(Arrow);

function Arrow:InitExtraParameters()
  self.cnt = 0;
  if self.showKind == ESkill_Kind.EW_FireArrow then 
    FightField.SetDrawBlack(0, 200, 50);
  end
end

function Arrow:ExtraClose()
  FightField.CloseDrawBlack();
end

function Arrow:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local picID = self:GetPicId(1);
    local alpha = self:GetAlpha(1);
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, picID, 50, 1, 20, 20, EEffectLightTracer.StandAni, me.nowPos.x+5, me.nowPos.y, alpha, true, 80);
    self.interval = 0.8;
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
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
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
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    self.step = 2;
  elseif self.step == 2 then
    if self:CheckInterval() then 
      local newPos = {};
      local picID = self:GetPicId(2, target.party_Kind);
      local alpha = self:GetAlpha(2);
      for i = 0, self.emyNum - 1 do 
        local target = FightField.fightHum[self.emyIdxAy[i]];
        if target ~= nil then           
          newPos = Vector2.New(target.nowPos.x, target.nowPos.y);          
          me:PlaySound(target.colm, target.row, Attack_Start);
          FightField.attack[self.humIdx]:SetLightWithOrder(i + 2, EEffectLightDis.Sky, picID, 50, 1, 1, 6, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y, alpha, true, 0, newPos.x, newPos.y, 0.36);
        end        
      end
      self.step = 3;
    end
  elseif self.step == 3 then
    self:ArrowMove();
    local picID = self:GetPicId(3);
    local alpha = self:GetAlpha(3);
    for i = 0, self.emyNum - 1 do
      if FightField.attack[self.humIdx].lights[i + 2].isArrive then
        target = FightField.fightHum[self.emyIdxAy[i]];
        if target ~= nil then 
          me:PlaySound(target.colm, target.row);
          me:PlayEffect(target.colm, target.row, ERolePose.Hit);

          FightField.attack[self.humIdx]:SetLightWithOrder(i + 2, EEffectLightDis.Sky, picID, 50, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, alpha, true, 110);
        end
        self.cnt = self.cnt + 1;
      end
    end

    if self.cnt == self.emyNum then
      self.cnt = self.cnt - 1;
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[self.cnt + 2].picId == 0 then
      self.isLightEnd = true;
      self.step = 5;
    end
  end
end

function Arrow:GetAlpha(aStep)
  if self.showKind == ESkill_Kind.DarkArrow then
    if aStep == 1 then
      return 50;
    elseif aStep == 2 then
      return 255;
    elseif aStep == 3 then
      return 50;
    end
  else
    if aStep == 1 then
      return 20;
    elseif aStep == 2 then
      return 255;
    elseif  aStep == 3 then
      return 27;
    end
  end

  return 0;
end

function Arrow:GetPicId(step, party)
  if party == nil then
    party = 0;
  end

  if self.showKind == ESkill_Kind.FireArrow then
    if step == 1 then
      return 10078;
    elseif step == 2 then
      if party == EFightParty.Left then
        return 10053;
      else
        return 10054;
      end
    elseif step == 3 then
      return 10101;
    end
  elseif self.showKind == ESkill_Kind.LightArrow then
    if step == 1 then
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
        local currentOption = string.Get(80098);
      end
      --4-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      return 10796;
    elseif step == 2 then
      if party == EFightParty.Left then
        return 10794;
      else
        return 10795;
      end
    elseif step == 3 then
      return 10797;
    end
  elseif self.showKind == ESkill_Kind.DarkArrow then
    if step == 1 then
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
        local currentOption = string.Get(80098);
      end
      --4-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      return 10800;
    elseif step == 2 then
      if party == EFightParty.Left then
        return 10798;
      else
        return 10799;
      end
    elseif step == 3 then
      return 10801;
    end
  elseif Contains(self.showKind, ESkill_Kind.SKILL12040, ESkill_Kind.EW_FireArrow, ESkill_Kind.SKILL12054) then
    if step == 1 then
      return 10950;
    elseif step == 2 then
      if party == EFightParty.Left then
        return 10948;
      else
        return 10949;
      end
    elseif step == 3 then
      return 10951;
    end
  elseif self.showKind == ESkill_Kind.IceArrow then
    if step == 1 then
      return 11086;
    elseif step == 2 then
      if party == EFightParty.Left then
        return 11084;
      else
        return 11085;
      end
    elseif step == 3 then
      return 11087;
    end
  end
end

function Arrow:ArrowMove()
  local curDist, totalDist;
  local page;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  curDist = math.round(math.sqrt(math.pow(me.nowPos.x - FightField.attack[self.humIdx].lights[2].showPos.x, 2) + math.pow(me.nowPos.y - FightField.attack[self.humIdx].lights[2].showPos.y, 2)));
  totalDist = math.round(math.sqrt(math.pow(me.nowPos.x - target.nowPos.x, 2) + math.pow(me.nowPos.y - target.nowPos.y, 2)));

  if curDist > totalDist then
    return;
  end

  page = math.ceil((curDist / (totalDist + 0.01)) * 5) + 1;

  for i = 2, 4 do
    if FightField.attack[self.humIdx].lights[i] ~= nil then
      FightField.attack[self.humIdx].lights[i]:SetPage(page, page);
    end
  end
end

