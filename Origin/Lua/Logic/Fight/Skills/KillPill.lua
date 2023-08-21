KillPill = InheritsFromBaseAttackSkill();

function KillPill:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Body, 10092, 50, 1, 10, 10, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 25, true, 20)
    self.interval = 0.5;
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
    if self:CheckInterval() then 
      local newPos = target:GetAttackPos(EFightSpot.Front, 60);
      me.roleController:SetIsJumping(true);
      me:SetJump(newPos.x, newPos.y);
      me:SetSpeed(0.72);
      self.step = 3;
    end
  elseif self.step == 3 then
    if me.arrive then
      me.roleController:SetIsJumping(false);
      me.roleController:OneHandAttack();
      me.roleController:FaceTo(target.nowPos);
      me:PlaySound(target.colm, target.row);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      self.interval = 0.3;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      me.roleController:SetIsJumping(true);
      me:SetJump(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y, false);
      self.step = 5;
    end
  elseif self.step == 5 then
    self.isLightEnd = true
    self.step = 6;
  end
end