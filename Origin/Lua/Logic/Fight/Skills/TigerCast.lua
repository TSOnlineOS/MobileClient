TigerCast = InheritsFromBaseAttackSkill();

function TigerCast:ExtraClose()
  TigerCast.SetTigerHandsVisible(ERoleVisible.Visible)
end

function TigerCast.SetTigerHandsVisible(status)
  local tempRole = FightField.GetRoleByNpcId(35055);              
  if tempRole ~= nil then
    tempRole.roleController:SetVisible(status);
  end

  tempRole = FightField.GetRoleByNpcId(35056);              
  if tempRole ~= nil then
    tempRole.roleController:SetVisible(status);
  end
end

function TigerCast:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    TigerCast.SetTigerHandsVisible(ERoleVisible.Hide)
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
      --local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then
    if me.roleController.animationFrame == 3 then
      me.roleController:SetAnimationForceFrame(3);
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky ,10141, 80, 1, 23, 23, EEffectLightTracer.StandAni, me.nowPos.x + 100, me.nowPos.y, 30, true, 130);
      me:PlaySound(target.colm, target.row, Attack_Start);
      self.interval = 0.4;
      self.step = 3;
    end
  elseif Contains(self.step, 3, 4) then
    if self:CheckInterval() then 
      me:PlaySound(target.colm, target.row, Attack_Start);
      self.step = self.step + 1;
    end
  elseif self.step == 5 then
    if FightField.attack[self.humIdx].lights[1].picId == 0 then
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky ,10696, 80, 1, 7, 7, EEffectLightTracer.Stand, me.nowPos.x + 110, me.nowPos.y, 30, true, 280);
      me:PlaySound(target.colm, target.row, Attack_Hit, 1);
      self.step = 6;
    end
  elseif self.step == 6 then
    if FightField.attack[self.humIdx].lights[1].orderCount == 3 then
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky ,10492, 80, 1, 4, 4, EEffectLightTracer.Stand, me.nowPos.x + 350, me.nowPos.y, 255, true, 410);
      me:PlaySound(target.colm, target.row, Attack_Hit, 2);
      self.interval = 0.3;
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
        --local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  elseif self.step == 7 then
    if self:CheckInterval() then 
      for i = 0, self.emyNum - 1 do 
        target = FightField.fightHum[self.emyIdxAy[i]];
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);
        target.roleController:SetAnimationForceId(ERolePose.Hit);
        target:SetSpeed(0.16);
        if not target:IsInSealStatus() then
          local newPos = target:GetSpot(EFightSpot.Back, 59 + math.random(30));
          target:SetJump(newPos.x, newPos.y, true);
        end
        FightField.attack[self.humIdx]:SetLightWithOrder(3+i, EEffectLightDis.Body , 10697, 80, 1, 4, 4, EEffectLightTracer.Stand, target.nowPos.x + 10, target.nowPos.y - 10, 255, true, 40);        
      end
      self.interval = 1;
      self.step = 8;
    end
  elseif self.step == 8 then
    if self:CheckInterval() then 
     self.isLightEnd =true;
     self.step = 9;
    end
  end
end