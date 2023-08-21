KnifeCar = InheritsFromBaseAttackSkill();

function KnifeCar:InitExtraParameters()
  self.isHit = false;
  self.attackStep = 0;
end

function KnifeCar:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = target:GetSpot(EFightSpot.Front, 60);
    me.roleController:SetIsMoving(true);
    me.roleController:SetInBattle(false);
    me:SetWalk(newPos.x, newPos.y);
    me:SetBeh(EFightBeh.Residual);
    me:SetSpeed(2);
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
      me.roleController:SetIsMoving(false);
      me.roleController:SetInBattle(true);
      me.roleController:OneHandAttack();
      me:SetBeh(EFightBeh.None);
      me.roleController:FaceTo(target.nowPos);
      self.isHit = false;
      self.attackStep = 1;
      self.step = 3;
    end
  elseif self.step == 3 then
    if me.roleController.animationFrame == 0 and self.isHit then
      target.roleController:SetInBattle(false);
      FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Sky1);
      if self.attackStep == 1 then
        self.step = 4;
        return;
      end

      self.attackStep = self.attackStep + 1;
      self.isHit = false;
      return;
    end

    if me.roleController.animationFrame == 1 and self.isHit == false then
      target:PlaySound();
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 1);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1 ,10000, 40, 1, 4, 4, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 255, false, 0);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2 ,10040, 25, 1, 9, 9, EEffectLightTracer.StandAni, target.nowPos.x - 5, target.nowPos.y - 10, 10, false, 12);
      self.isHit = true;
    end
  elseif self.step == 4 then
    me.roleController:SetAnimationForceId(ERolePose.None);
    me.roleController:SetIsMoving(true);
    me.roleController:SetInBattle(false);
    me:SetWalk(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y, false);
    me:SetSpeed(0.72);
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
  elseif self.step == 5 then
    if me.arrive then
      self.isLightEnd = true;
      self.step = 6;
    end
  end
end

SteelKnifeCar = InheritsFromBaseAttackSkill();

function KnifeCar:InitExtraParameters()
  self.isHit = false;
  self.attackStep = 0;
end

function SteelKnifeCar:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local idx;
    if me.party_Kind == EFightParty.Right then
      idx = 1;
    else
      idx = -1;
    end
    local newPos = target:GetSpot(EFightSpot.Front, 60);
    me.roleController:SetIsMoving(true);
    me.roleController:SetInBattle(false);
    me:SetWalk(newPos.x + (30 * idx), newPos.y + (30 * idx));
    me:SetBeh(EFightBeh.Residual);
    me:SetSpeed(2);
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
    self.step = 2;
  elseif self.step == 2 then
    if me.arrive then
      me.roleController:SetIsMoving(false);
      me.roleController:SetInBattle(true);
      me.roleController:SetAnimationForceId(ERolePose.Attack);
      me:SetBeh(EFightBeh.None);
      me.roleController:FaceTo(target.nowPos);
      self.isHit = false;
      self.attackStep = 1;
      self.step = 3;
    end
  elseif self.step == 3 then
    if me.roleController.animationFrame == 0 and self.isHit then
      if self.attackStep == 1 then
        self.step = 4;
        return;
      end

      self.attackStep = self.attackStep + 1;
      self.isHit = false;
      return;
    end

    if me.roleController.animationFrame == 1 and self.isHit == false then
      target:PlaySound();
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 1);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1 ,10000, 40, 1, 4, 4, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 255, false);
      self.isHit = true;
    end
  elseif self.step == 4 then
    me.roleController:SetIsMoving(true);
    me.roleController:SetInBattle(false);
    me:SetWalk(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y, false);
    me:SetSpeed(0.72);
    self.step = 5;
  elseif self.step == 5 then
    if me.arrive then
      self.isLightEnd = true;
      self.step = 6;
    end
  end
end

