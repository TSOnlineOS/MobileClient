ArrowTower = InheritsFromBaseAttackSkill();

function ArrowTower:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    if me.roleController.jmpDrawer_Body:GetFrameCount(ERolePose.Attack) ~= 0 then 
      me.roleController:OneHandAttack();
    end

    if me.party_Kind == EFightParty.Left then
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1 ,10073, 50, 3, 6, 6, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y - me.roleController.height, 255,
                                              false, 120, target.nowPos.x, target.nowPos.y - 120, 1);
    else
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1 ,10072, 50, 3, 6, 6, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y - me.roleController.height, 255,
                                              false, 120, target.nowPos.x, target.nowPos.y - 120, 1);
    end

    FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].isShade = false;
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
    self:ArrowMove(EEffectLightKind.Sky1);
    if self:CheckInterval() then 
      if me.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2 ,10073, 50, 3, 6, 6, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y - me.roleController.height, 255,
                                              false, 120, target.nowPos.x, target.nowPos.y - 120, 1);
      else
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2 ,10072, 50, 3, 6, 6, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y - me.roleController.height, 255,
                                                false, 120, target.nowPos.x, target.nowPos.y - 120, 1);
      end

      FightField.attack[self.humIdx].lights[EEffectLightKind.Sky2].isShade = false;
      self.interval = 0.1;
      self.step = 3;
    end
  elseif self.step == 3 then
    self:ArrowMove(EEffectLightKind.Sky1);
    self:ArrowMove(EEffectLightKind.Sky2);
    if self:CheckInterval() then
      if me.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky3 ,10073, 50, 3, 6, 6, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y - me.roleController.height, 255,
                                              false, 120, target.nowPos.x, target.nowPos.y - 120, 1);
      else
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky3 ,10072, 50, 3, 6, 6, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y - me.roleController.height, 255,
                                                false, 120, target.nowPos.x, target.nowPos.y - 120, 1);
      end

      FightField.attack[self.humIdx].lights[EEffectLightKind.Sky3].isShade = false;
      self.interval = 0.1;
      self.step = 4;
    end
  elseif self.step == 4 then
    self:ArrowMove(EEffectLightKind.Sky1);
    self:ArrowMove(EEffectLightKind.Sky2);
    self:ArrowMove(EEffectLightKind.Sky3);
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].picId == 0 then
      me:PlayEffect(target.colm, target.row,ERolePose.Hit);
      me:PlaySound(target.colm, target.row);
      self.interval = 0.05;
      self.step = 5;
    end
  elseif self.step == 5 then
    self:ArrowMove(EEffectLightKind.Sky2);
    self:ArrowMove(EEffectLightKind.Sky3);
    if self:CheckInterval() then 
      FightField.RestoreFightInfo(self.tarIdx);
      self.step = 6;
    end
  elseif self.step == 6 then
    self:ArrowMove(EEffectLightKind.Sky2);
    self:ArrowMove(EEffectLightKind.Sky3);
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky2].picId == 0 then
      me:PlayEffect(target.colm, target.row,ERolePose.Hit);
      me:PlaySound(target.colm, target.row);
      self.interval = 0.05;
      self.step = 7;
    end
  elseif self.step == 7 then
    self:ArrowMove(EEffectLightKind.Sky3);
    if self:CheckInterval() then 
      FightField.RestoreFightInfo(self.tarIdx);
      self.step = 8;
    end
  elseif self.step == 8 then
    self:ArrowMove(EEffectLightKind.Sky3);
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky3].picId == 0 then
      me:PlayEffect(target.colm, target.row,ERolePose.Hit);
      me:PlaySound(target.colm, target.row);
      self.interval = 0.05;
      self.step = 9;
    end
  elseif self.step == 9 then
    if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 10;
    end
  end
end

function ArrowTower:ArrowMove(index)
  local curDist, totalDist;
  local page;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  curDist = math.round(math.sqrt(math.pow(me.nowPos.x - FightField.attack[self.humIdx].lights[index].showPos.x, 2) + math.pow(me.nowPos.y - FightField.attack[self.humIdx].lights[index].showPos.y, 2)));
  totalDist = math.round(math.sqrt(math.pow(me.nowPos.x - target.nowPos.x, 2) + math.pow(me.nowPos.y - target.nowPos.y, 2)));

  if curDist > totalDist then
    return;
  end

  page = math.ceil((curDist / (totalDist + 0.01)) * 4);
  page = page + 2;

  FightField.attack[self.humIdx].lights[index].startPage = page;
  FightField.attack[self.humIdx].lights[index].endPage = page;
end