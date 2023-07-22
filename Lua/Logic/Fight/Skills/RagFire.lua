RagFire = InheritsFromBaseAttackSkill();

function RagFire:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = target:GetSpot(EFightSpot.Front, 60);
    me:SetWalk(newPos.x, newPos.y);
    me.roleController:SetInBattle(false);
    me.roleController:SetIsMoving(true);
    me:SetSpeed(1);
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
      me.roleController:MagicAttack();
      me.roleController:FaceTo(target.nowPos);
      self.step = 3;
    end
  elseif self.step == 3 then
    if me.roleController.animationFrame == 1 then
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10037, 30, 1, 24, 24, EEffectLightTracer.StandAni, target.nowPos.x + 5, target.nowPos.y, 35, true, 20);
      self.step = 4;
    end
  elseif self.step == 4 then
    if me.roleController.animationFrame == 0 then
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10055, 30, 1, 21, 21, EEffectLightTracer.StandAni, target.nowPos.x + 5, target.nowPos.y, 35, true, 30);
      me:PlaySound(target.colm, target.row);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      
      me.roleController:SetIsMoving(false);
      me.roleController:SetIsJumping(true);
      me:SetJump(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y, true);
      self.step = 5;
    end
  elseif self.step == 5 then
    if me.arrive then
      self.isLightEnd = true;
      self.step = 6;
    end
  end
end