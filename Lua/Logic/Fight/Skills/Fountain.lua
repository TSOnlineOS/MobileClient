Fountain = InheritsFromBaseAttackSkill();

function Fountain:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  local isThree = false;
--todo
--     //三人小隊用
--   if ME.sex=0 then
--   if ME.DBKind=34 then
--   begin
--     isThree = true;
--   end

  if self.step == 1 then
    local newPos = target:GetAttackPos(EFightSpot.Front, 60);
    me:SetJump(newPos.x, newPos.y);
    if isThree then
      me.roleController:SetAnimationForceId(ERolePose.LongSpecial);
      me:SetSpeed(0.60);
    else
      me.roleController:SetIsJumping(true);
      me:SetSpeed(0.72);
    end

    self.step = 2;
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
  elseif self.step == 2 then
    if me.arrive then
      me.roleController:SetIsJumping(false);
      me.roleController:OneHandAttack();

      me:PlaySound(target.colm, target.row);
      me:PlayEffect(target.colm, target.row, ERolePose.hit, 4);

      if not target:IsInSealStatus() then
        target:SetWalk(target.nowPos.x, target.nowPos.y - 118, false);
      end

      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1 ,10046, 80, 1, 13, 13, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30);
      self.step = 3;
    end
  elseif self.step == 3 then
    if target.arrive then
      target:SetSpeed(0.12);
      if not target:IsInSealStatus() then
        target:SetJump(target.nowPos.x + 20, target.nowPos.y);
      end

      me:PlayEffect(target.colm, target.row, ERolePose.hit, 4);
      self.step = 4;
    end
  elseif self.step == 4 then
    if target.arrive then
      if not target:IsInSealStatus() then
        target:SetJump(target.nowPos.x - 20, target.nowPos.y);
      end
      me:PlayEffect(target.colm, target.row, ERolePose.hit, 4);
      self.step = 5;
    end
  elseif self.step == 5 then
    if target.arrive then
      if not target:IsInSealStatus() then
        target:SetJump(target.nowPos.x - 20, target.nowPos.y);
      end
      me:PlayEffect(target.colm, target.row, ERolePose.hit, 4);
      self.step = 6;
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
  elseif self.step == 6 then
    if target.arrive then
      if not target:IsInSealStatus() then
        target:SetJump(target.nowPos.x + 20, target.nowPos.y);
      end

      self.step = 7;
    end
  elseif self.step == 7 then
    if target.arrive then
      me.roleController:SetIsJumping(true);
      me:SetJump(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y, false);

      target:SetBeh(EFightBeh.Quake);

      if not target:IsInSealStatus() then
        target:SetWalk(target.nowPos.x, target.nowPos.y);
      end

      target:SetSpeed(0.72);
      self.step = 8;
    end
  elseif self.step == 8 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].picId == 0 then
      local newPos = target:GetChipPos();
      target:SetMoment(newPos.x, newPos.y, false);
      target:SetBeh(EFightBeh.None);
      self.step = 9;
    end
  elseif self.step == 9 then
      self.isLightEnd = true;
      self.step = 10;
  end
end