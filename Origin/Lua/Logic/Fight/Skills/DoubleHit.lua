DoubleHit = InheritsFromBaseAttackSkill();

function DoubleHit:InitExtraParameters()
  self.attackStep = 0;
  self.isHit = false;
  self.effCount = 3;
end

function DoubleHit:Update()
  local pos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    pos = target:GetSpot(EFightSpot.Front, 60);
    me.roleController:SetInBattle(false);
    me.roleController:SetIsMoving(true);
    me:SetWalk(pos.x, pos.y);
    me:SetBeh(EFightBeh.Residual);
    -- 設殘影
    me:SetSpeed(0.96);
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
    self.step = 2;
  elseif self.step == 2 then
    -- 是否到達目地點
    if me.arrive then
      self.step = 3;
      me.roleController:SetIsMoving(false);
      me.roleController:SetInBattle(true);
      me.roleController:SetAnimationForceId(ERolePose.Attack)
      self.isHit = false;
      me:SetBeh(EFightBeh.None);
      self.attackStep = 1;
      me.roleController:FaceTo(target.nowPos);
    end
  elseif self.step == 3 then
    if (me.roleController.animationFrame == 0) and self.isHit == true then
      FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Sky1);
      if self.attackStep == 3 then
        -- 打了三下
        self.step = 4;
        return;
      end
      self.attackStep = self.attackStep + 1;
      self.isHit = false;
      return;
    end

   if me.roleController.animationId == me.roleController:GetAnimationId(ERolePose.Attack) and((me.roleController.animationFrame == 1) and(self.isHit == false)) then   
      target:PlaySound();

      me:PlayEffect(target.colm, target.row, ERolePose.Hit, self.effCount);
      -- 預設挨姿,3次,血除3顯示(預設1)

      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10000, 40, 1, 4, 4, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 255, false, 0);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10040, 25, 1, 9, 9, EEffectLightTracer.StandAni, target.nowPos.x - 5, target.nowPos.y - 10, 10, false, 12);
      self.isHit = true;
      return;
    end
  elseif self.step == 4 then
    me.roleController:SetAnimationForceId(ERolePose.None)
    me.roleController:SetIsJumping(true);
    me:SetJump(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y, false);
    me:SetSpeed(0.72);
    self.step = 5;
  elseif self.step == 5 then
    if me.arrive then
      me.roleController:SetIsJumping(false);
      self.isLightEnd = true;
      self.step = 6;
    end
  end
end