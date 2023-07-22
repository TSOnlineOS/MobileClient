DashCar = InheritsFromBaseAttackSkill();

function DashCar:InitExtraParameters()
  self.isHit = false;
  self.attackStep = 0;
end

function DashCar:Update()
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
      FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Sky1);
      if self.attackStep == 3 then
        self.step = 4;
        return;
      end

      self.attackStep = self.attackStep + 1;
      self.isHit = false;
      return;
    end

    if me.roleController.animationFrame == 1 and self.isHit == false then
      target:PlaySound();
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3);
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
    self.step = 5;
  elseif self.step == 5 then
    if me.arrive then
      self.isLightEnd = true;
      self.step = 6;
    end
  end
end

CowDashCar = InheritsFromBaseAttackSkill();

function CowDashCar:InitExtraParameters()
  self.isHit = false;
  self.attackStep = 0;
end

function CowDashCar:Update()
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

    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1 ,10705, 20, 1, 8, 8, EEffectLightTracer.Line, 
                                            me.nowPos.x + (100 * idx), me.nowPos.y + 45 + 55 * idx, 30, true, 0,
                                            target.nowPos.x + (200 * idx), target.nowPos.y + 25 + 120 * idx, 1);
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10289, 30, 13, 1, 13, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y + 85, 30, false, 0);
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky3, 10289, 60, 13, 1, 13, EEffectLightTracer.Stand,  me.nowPos.x - math.floor((me.nowPos.x - target.nowPos.x) / 4),
                                            me.nowPos.y - math.floor((me.nowPos.y - target.nowPos.y) / 4) + 85, 30, false);
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky3, 10289, 120, 13, 1, 13, EEffectLightTracer.Stand,  me.nowPos.x - math.floor((me.nowPos.x - target.nowPos.x) / 2),
                                            me.nowPos.y - math.floor((me.nowPos.y - target.nowPos.y) / 2) + 85, 30, false);
    self.step = 2;
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
      if self.attackStep == 3 then
        self.step = 4;
        return;
      end

      self.attackStep = self.attackStep + 1;
      self.isHit = false;
      return;
    end

    if me.roleController.animationFrame == 1 and self.isHit == false then
      target:PlaySound();
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1 ,10000, 40, 1, 4, 4, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 255, false);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Shoot ,10019, 40, 5, 10, 15, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y + 70, 30, false);
      self.isHit = true;
    end
  elseif self.step == 4 then
    me.roleController:SetIsMoving(true);
    me.roleController:SetInBattle(false);
    me:SetWalk(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y, false);
    me:SetSpeed(0.72);
    FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Sky1);
    FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Sky2);
    FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Sky3);
    FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Sky4);
    FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Shoot);
 
    self.step = 5;
  elseif self.step == 5 then
    if me.arrive then
      self.isLightEnd = true;
      self.step = 6;
    end
  end
end