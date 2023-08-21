SKILL22021 = InheritsFromBaseAttackSkill();

function SKILL22021:InitExtraParameters()
  self.totalDist = 0;
  self.curDist = 0;
  self.poseInterval = 0.3;
  self.fireBolt = {};
end

function SKILL22021:ExtraClose()  
  ClearLightTable(self.fireBolt);
  self.isLightEnd = true;
end

function SKILL22021:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    if target.party_Kind == EFightParty.Left then
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10954, 80, 1, 14, 14, EEffectLightTracer.Stand, me.nowPos.x - 15, me.nowPos.y, 30, true, 70);
    else
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10956, 80, 1, 14, 14, EEffectLightTracer.Stand, me.nowPos.x - 15, me.nowPos.y, 30, true, 70);
    end

    FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10955, 80, 1, 3, 3, EEffectLightTracer.Stand, me.nowPos.x + 15, me.nowPos.y, 30, true, 5);
    FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10955, 80, 1, 3, 3, EEffectLightTracer.Stand, me.nowPos.x - 25, me.nowPos.y, 30, true, 10);
    self.interval = 0.8;
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
    if self:CheckInterval() then 
      local newPos = {};
      if target.party_Kind == EFightParty.Left then
        newPos.x = FightField.chip[1][target.row].x + 70;
        newPos.y = FightField.chip[1][target.row].y + 40;
        me:SetWalk(newPos.x, newPos.y);
        me.roleController:SetAnimationForceId(ERolePose.Jump);
        me.roleController:SetAnimationForceFrame(0);
        me:SetSpeed(0.5);
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10954, 80, 1, 14, 14, EEffectLightTracer.Line, me.nowPos.x - 15, me.nowPos.y + 70, 15, true, 0, newPos.x - 130, newPos.y, 0.5);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10955, 80, 1, 3, 3, EEffectLightTracer.Stand, me.nowPos.x + 15, me.nowPos.y + 5, 20, true, 0, newPos.x, newPos.y, 0.5);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10955, 80, 1, 3, 3, EEffectLightTracer.Stand, me.nowPos.x - 25, me.nowPos.y + 10, 20, true, 0, newPos.x, newPos.y, 0.5);
      else
        newPos.x = FightField.chip[2][target.row].x - 70;
        newPos.y = FightField.chip[2][target.row].y - 40;
        me:SetWalk(newPos.x, newPos.y);
        me.roleController:SetAnimationForceId(ERolePose.Jump);
        me.roleController:SetAnimationForceFrame(0);
        me:SetSpeed(0.5);
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10956, 80, 1, 14, 14, EEffectLightTracer.Line, me.nowPos.x - 15, me.nowPos.y + 70, 15, true, 40, newPos.x + 130, newPos.y + 60, 0.5);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10955, 80, 1, 3, 3, EEffectLightTracer.Stand, me.nowPos.x + 15, me.nowPos.y + 5, 20, true, 0, newPos.x, newPos.y, 0.5);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10955, 80, 1, 3, 3, EEffectLightTracer.Stand, me.nowPos.x - 25, me.nowPos.y + 10, 20, true, 0, newPos.x, newPos.y, 0.5);
      end
      self.step = 3;
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
  elseif self.step == 3 then
    if me.arrive then
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10955, 80, 1, 3, 3, EEffectLightTracer.Stand, me.nowPos.x + 15, me.nowPos.y, 30, true, 5);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10955, 80, 1, 3, 3, EEffectLightTracer.Stand, me.nowPos.x - 25, me.nowPos.y, 30, true, 10);
      self.interval = 0.5;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      me:PlaySound(target.colm, target.row, Attack_Start, 2);
      me:SetSpeed(1);
      me.roleController:SetAnimationForceId(ERolePose.Attack);
      me.roleController:SetAnimationForceFrame(255);
      self.interval = 0.1;
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
        --local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  elseif Contains(self.step, 5, 6, 7) then
    self:UpdatePose();
    if self:CheckInterval() then 
      local newPos = {};
      if target.party_Kind == EFightParty.Left then
        newPos.x = FightField.chip[0][target.row].x + 20;
        newPos.y = FightField.chip[0][target.row].y - 30;
        for i = 1, 4 do
          if math.random(2) == 1 then
            FightField.attack[self.humIdx]:SetLightWithOrder(i, EEffectLightDis.Sky, 10957, math.random(60) + 29, 1, 4, 4, EEffectLightTracer.Stand, newPos.x + math.random(25) - 1, newPos.y + math.random(60) - 1, 30, true, 5);
          else
            FightField.attack[self.humIdx]:SetLightWithOrder(i, EEffectLightDis.Sky, 10957, math.random(60) + 29, 1, 4, 4, EEffectLightTracer.Stand, newPos.x - math.random(25) + 1, newPos.y + math.random(60) - 1, 30, true, 5);
          end
        end

        for i = 0, 2 do
          if self.fireBolt[i] ~= nil or self.fireBolt[i] == 0 then
            self.fireBolt[i] = EffectLight.New(10958, 30, 7, 11, 12, EEffectLightTracer.Stand, newPos.x - math.random(25) + 1, newPos.y + math.random(60) - 1, 15, true, 5);
            self.fireBolt[i]:SetTimeScale(FightField.timeScale);
            self.fireBolt[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
          end 
        end

        newPos.x = FightField.chip[1][target.row].x + 20;
        newPos.y = FightField.chip[1][target.row].y - 30;
        for i = 6, 8 do
          if math.random(2) == 1 then
            FightField.attack[self.humIdx]:SetLightWithOrder(i, EEffectLightDis.Sky, 10957, math.random(60) + 29, 1, 4, 4, EEffectLightTracer.Stand, newPos.x + math.random(25) - 1, newPos.y + math.random(60) - 1, 30, true, 5);
          else
            FightField.attack[self.humIdx]:SetLightWithOrder(i, EEffectLightDis.Sky, 10957, math.random(60) + 29, 1, 4, 4, EEffectLightTracer.Stand, newPos.x - math.random(25) + 1, newPos.y + math.random(60) - 1, 30, true, 5);
          end
        end

        for i = 3, 5 do
          if self.fireBolt[i] ~= nil or self.fireBolt[i] == 0 then
            self.fireBolt[i] = EffectLight.New(10958, 30, 7, 11, 12, EEffectLightTracer.Stand, newPos.x - math.random(25) + 1, newPos.y + math.random(60) - 1, 15, true, 5);
            self.fireBolt[i]:SetTimeScale(FightField.timeScale);
            self.fireBolt[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
          end 
        end
      else
        local newPos = {};
        if target.party_Kind == EFightParty.Left then
          newPos.x = FightField.chip[2][target.row].x + 20;
          newPos.y = FightField.chip[2][target.row].y - 30;
          for i = 1, 4 do
            if math.random(2) == 1 then
            FightField.attack[self.humIdx]:SetLightWithOrder(i, EEffectLightDis.Sky, 10959, math.random(60) + 29, 1, 4, 4, EEffectLightTracer.Stand, newPos.x + math.random(25) - 1, newPos.y + math.random(60) - 1, 30, true, 5);
            else
              FightField.attack[self.humIdx]:SetLightWithOrder(i, EEffectLightDis.Sky, 10959, math.random(60) + 29, 1, 4, 4, EEffectLightTracer.Stand, newPos.x - math.random(25) + 1, newPos.y + math.random(60) - 1, 30, true, 5);
            end
          end

          for i = 0, 2 do
            if self.fireBolt[i] ~= nil or self.fireBolt[i] == 0 then
              self.fireBolt[i] = EffectLight.New(10958, 30, 7, 11, 12, EEffectLightTracer.Stand, newPos.x - math.random(25) + 1, newPos.y + math.random(60) - 1, 15, true, 5);
              self.fireBolt[i]:SetTimeScale(FightField.timeScale);
              self.fireBolt[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
            end 
          end

          newPos.x = FightField.chip[1][target.row].x + 20;
          newPos.y = FightField.chip[1][target.row].y - 30;
          for i = 6, 8 do
            if math.random(2) == 1 then
              FightField.attack[self.humIdx]:SetLightWithOrder(i, EEffectLightDis.Sky, 10959, math.random(60) + 29, 1, 4, 4, EEffectLightTracer.Stand, newPos.x + math.random(25) - 1, newPos.y + math.random(60) - 1, 30, true, 5);
            else
              FightField.attack[self.humIdx]:SetLightWithOrder(i, EEffectLightDis.Sky, 10959, math.random(60) + 29, 1, 4, 4, EEffectLightTracer.Stand, newPos.x - math.random(25) + 1, newPos.y + math.random(60) - 1, 30, true, 5);
            end
          end

          for i = 3, 5 do
            if self.fireBolt[i] ~= nil or self.fireBolt[i] == 0 then
              self.fireBolt[i] = EffectLight.New(10958, 30, 7, 11, 12, EEffectLightTracer.Stand, newPos.x - math.random(25) + 1, newPos.y + math.random(60) - 1, 15, true, 5);
              self.fireBolt[i]:SetTimeScale(FightField.timeScale);
              self.fireBolt[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
            end 
          end
        end
      end
      for k, v in pairs(self.emyIdxAy) do
        target = FightField.fightHum[v];
        me:PlayEffect(target.colm, target.row, ERolePose.Hit, 9);
        me:PlayEffect(target.colm, target.row, ERolePose.Hit, 9);
        me:PlayEffect(target.colm, target.row, ERolePose.Hit, 9);
      end
      self.interval = 0.35;
      self.step = self.step + 1;
    end
  elseif self.step == 8 then
    if self:CheckInterval() then 
      self.isLightEnd =true;
      self.step = 8;
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
  end
end

function SKILL22021:UpdatePose()
  local target;
  if self.poseInterval >= 0 then
    self.poseInterval = self.poseInterval - CGTimer.deltaTime * FightField.timeScale;
  else
    self.poseInterval = 0.03;
    for i = 0, self.emyNum - 1 do
      target = FightField.fightHum[self.emyIdxAy[i]];
      target.roleController:SetAnimationForceFrame(255);
      if math.random(2) == 1 then
        target.roleController:SetAnimationForceId(ERolePose.Hit);
      else
        target.roleController:SetAnimationForceId(ERolePose.Lie);
        target.roleController:SetAnimationForceFrame(2);
      end
    end
  end
end