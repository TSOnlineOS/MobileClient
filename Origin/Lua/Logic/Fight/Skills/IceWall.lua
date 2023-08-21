IceWall = InheritsFromBaseAttackSkill();

function IceWall:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightKind.Ground, 10070, 50, 1, 32, 32, EEffectLightTracer.StandAni, me.nowPos.x + 7, me.nowPos.y, 20, true, 50 )
    self.interval = 1.2;
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
    self.step = self.step + 1;
  elseif self.step == 2 then
    if self:CheckInterval() then
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        local newPos = target:RCtoSpot(target.colm, target.row);
        local lightIdx = 0;
        if target.party_Kind == EFightParty.Left then
          newPos.x = newPos.x + 15;
          newPos.y = newPos.y + 55;
          lightIdx = EEffectLightKind.Body1;
        else
          newPos.x = newPos.x - 15;
          newPos.y = newPos.y + 25;
          lightIdx = EEffectLightKind.Ground;
        end

        local wallPic = self:GetWallPic();
        FightField.attack[self.humIdx]:SetLightWithOrder(2 + (2*i), lightIdx, wallPic, 25, 1, 8, 8, EEffectLightTracer.Stand, newPos.x, newPos.y, 18, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(3 + (2*i), lightIdx, 10019, 15, 1, 15, 15, EEffectLightTracer.Stand, newPos.x, newPos.y, 35, false, 35);
      end
      self.step = self.step + 1;
    end
  elseif self.step == 3 then
    local lightIdx = 0;
    if target.party_Kind == EFightParty.Left then
      lightIdx = EEffectLightKind.Body1;
    else
      lightIdx = EEffectLightKind.Ground;
    end

    me:PlayEffect(target.colm, target.row, ERolePose.Hit);
    if FightField.attack[self.humIdx].lights[2].orderCount >= 7 and FightField.attack[self.humIdx].lights[3].orderCount >= 14 then
      self.step = self.step + 1;
    end
  elseif self.step == 4 then
    self.isLightEnd = true;
    self.step = 5;
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
end

function IceWall:GetWallPic()
  if self.showKind == ESkill_Kind.IceWall then
    return 10018;
  elseif self.showKind == ESkill_Kind.IceCrystalsShield then
    return 11089;
  end
end

--狀態
IceWallMe = InheritsFromBaseStatus();

function IceWallMe:Update()
  if self.step == 1 then
    local me = FightField.fightHum[self.humIdx];
    local newPos = me:RCtoSpot(me.colm, me.row);
    local lightIdx = 0;
    if me.party_Kind == EFightParty.Left then
      newPos.x = newPos.x + 15;
      newPos.y = newPos.y + 55;
      lightIdx = EEffectLightKind.Body1;
    else
      newPos.x = newPos.x - 15;
      newPos.y = newPos.y + 25;
      lightIdx = EEffectLightKind.Ground;
    end
    local picID = self:GetShowPicID();
    me.status[self.statusKind]:SetLight(lightIdx, picID, 25, 8, 8, 8, EEffectLightTracer.Stand, newPos.x, newPos.y, 18, false, 0);
    self.step = self.step + 1;
  end
end

function IceWallMe:GetShowPicID()
  return 10018;
end

IceCrystalsShieldMe = InheritsStatus(IceWallMe);

function IceCrystalsShieldMe:GetShowPicID()
  return 11089;
end