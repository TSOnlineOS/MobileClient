RoastFlame = InheritsFromBaseAttackSkill();

function RoastFlame:InitExtraParameters()
  self.lightFire = {};
end

function RoastFlame:ExtraClose()
  ClearLightTable(self.lightFire);
end

function RoastFlame:Update()
  self:UpdateLogic();
  self:Show();
end


function RoastFlame:UpdateLogic()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetJump(newPos.x, newPos.y, false)
    me.roleController:SetIsJumping(true);
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
      me.roleController:SetIsJumping(false);
      me.roleController:MagicAttack();
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Body, 10352, 50, 1, 12, 12, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 30, true, 70);
      self.interval = 0.6;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10028, 33, 1, 24, 24, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y - 35, 20, false, 50);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10353, 90, 1, 9, 9, EEffectLightTracer.Line, me.nowPos.x - 80, me.nowPos.y, 35, true, 0, me.nowPos.x, me.nowPos.y - 30, 0.33);
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[2].isArrive then
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10353, 90, 1, 9, 9, EEffectLightTracer.Line, me.nowPos.x - 80, me.nowPos.y, 35, true, 0, me.nowPos.x, me.nowPos.y - 30, 0.33);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Body, 10353, 90, 1, 9, 9, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y - 30, 35, true, 0, me.nowPos.x + 80, me.nowPos.y, 0.33);
      self.step = 5;
    end
  elseif self.step == 5 then
    if FightField.attack[self.humIdx].lights[3].isArrive then
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10353, 90, 1, 9, 9, EEffectLightTracer.Line, me.nowPos.x - 80, me.nowPos.y, 35, true, 0, me.nowPos.x, me.nowPos.y - 30, 0.33);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Body, 10353, 90, 1, 9, 9, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y - 30, 35, true, 0, me.nowPos.x + 80, me.nowPos.y, 0.33);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Body, 10353, 90, 1, 9, 9, EEffectLightTracer.Line, me.nowPos.x + 80, me.nowPos.y, 35, true, 0, me.nowPos.x, me.nowPos.y + 30, 0.33);
      self.step = 6;
    end
  elseif self.step == 6 then
    if FightField.attack[self.humIdx].lights[4].isArrive then
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10353, 90, 1, 9, 9, EEffectLightTracer.Line, me.nowPos.x - 80, me.nowPos.y, 35, true, 0, me.nowPos.x, me.nowPos.y - 30, 0.33);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Body, 10353, 90, 1, 9, 9, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y - 30, 35, true, 0, me.nowPos.x + 80, me.nowPos.y, 0.33);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Body, 10353, 90, 1, 9, 9, EEffectLightTracer.Line, me.nowPos.x + 80, me.nowPos.y, 35, true, 0, me.nowPos.x, me.nowPos.y + 30, 0.33);
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Body, 10353, 90, 1, 9, 9, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y + 30, 35, true, 0, me.nowPos.x - 80, me.nowPos.y, 0.33);
      self.step = 7;
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
  elseif self.step == 7 then
    if FightField.attack[self.humIdx].lights[5].isArrive then
      local lightSpeed;
      for i = 0, 2 do
        lightSpeed = 0.73 - i * 0.15;
        self.lightFire[i] = EffectLight.New(10353, 100, 1, 9, 9, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.x - 30, 35, true, 0, target.nowPos.x, target.nowPos.y + 30, lightSpeed);
        self.lightFire[i]:SetTimeScale(FightField.timeScale);
        self.lightFire[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        self.lightFire[i + 3] = EffectLight.New(10353, 100, 1, 9, 9, EEffectLightTracer.Line, me.nowPos.x + 80, me.nowPos.x, 35, true, 0, target.nowPos.x + 20, target.nowPos.y + 20, lightSpeed);
        self.lightFire[i + 3]:SetTimeScale(FightField.timeScale);
        self.lightFire[i + 3]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        self.lightFire[i + 6] = EffectLight.New(10353, 100, 1, 9, 9, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.x + 30, 35, true, 50, target.nowPos.x, target.nowPos.y + 10, lightSpeed);
        self.lightFire[i + 6]:SetTimeScale(FightField.timeScale);
        self.lightFire[i + 6]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        self.lightFire[i + 9] = EffectLight.New(10353, 100, 1, 9, 9, EEffectLightTracer.Curve, me.nowPos.x - 80, me.nowPos.x, 35, true, 0, target.nowPos.x - 20, target.nowPos.y + 50, lightSpeed);
        self.lightFire[i + 9]:SetTimeScale(FightField.timeScale);
        self.lightFire[i + 9]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      end
      self.step = 8;
    end
  elseif self.step == 8 then
    if self.lightFire[11].isArrive then
      me:PlayEffect(target.colm, target.row, ERolePose.hit, 2);
      local newPos = target:GetSpot(EFightSpot.Front, 60);
      me:SetJump(newPos.x, newPos.y, false);
      me.roleController:SetIsJumping(true);
      me:SetSpeed(0.74);
      self.step = 9;
    end
  elseif self.step == 9 then
    if me.arrive then
      me.roleController:SetIsJumping(false);
      me.roleController:SetAnimationForceId(ERolePose.Attack);
      FightField.attack[self.humIdx].lights[2]:Free();
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10110, 30, 1, 11, 11, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y, 40, true, 30, target.nowPos.x, target.nowPos.y - 100, 0.16);
      FightField.attack[self.humIdx].lights[2]:SetAlpha(1, 1, 40);
      FightField.attack[self.humIdx].lights[2]:SetResidual(3, 100, -1);
      me:PlaySound(target.colm, target.row, Attack_Start);
      self.interval = 0.01;
      self.step = 10;
    end
  elseif self.step == 10 then
    if self:CheckInterval() then 
      FightField.attack[self.humIdx].lights[2]:SetAlpha(25, -1, 25);
      me:PlayEffect(target.colm, target.row, ERolePose.hit, 2);
      target.roleController:SetIsDead(true);
      target:SetBeh(EFightBeh.Rotate);
      target:SetWalk(target.nowPos.x, target.nowPos.y - 150, false);
      target:SetSpeed(0.36);
      FightField.attack[self.humIdx].lights[3]:Free();
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, "Shadow2", 80, 1, 1, 1, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 255, true, 35);
      self.interval = 1;
      self.step = 11;
    end
  elseif self.step == 11 then
    if self:CheckInterval() then 
      target.roleController:SetIsDead(false);
      target:SetBeh(EFightBeh.None);
      self.step = 12;
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
  elseif self.step == 12 then
      self.isLightEnd = true
      self.step = 13;
  end
end

function RoastFlame:Show()
  for k, v in pairs(self.lightFire) do
    if v ~= nil then 
      v:Update()
    end
  end
end