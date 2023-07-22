TurtleRHand = InheritsFromBaseAttackSkill();

function TurtleRHand:ExtraClose()
  FightField.SetRoleVisibleByID(35032, ERoleVisible.Visible);
  FightField.SetRoleVisibleByID(35033, ERoleVisible.Visible);
  FightField.SetRoleVisibleByID(35034, ERoleVisible.Visible);

  FightField.SetRoleVisibleByID(38361, ERoleVisible.Visible);
  FightField.SetRoleVisibleByID(38362, ERoleVisible.Visible);
  FightField.SetRoleVisibleByID(38363, ERoleVisible.Visible);
end

function TurtleRHand:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:SetAnimationForceId(ERolePose.Attack);

    local handId = nil;
    if Between(me.npcId, 35032, 35034)then 
      FightField.SetRoleVisibleByID(35032, ERoleVisible.Hide);      
      if me.npcId == 35034 then        
        handId = 35033;
      else      
        handId = 35034;
      end
    elseif Between(me.npcId, 38361, 38363)then 
      FightField.SetRoleVisibleByID(38361, ERoleVisible.Hide);      
      if me.npcId == 38363 then        
        handId = 38362;
      else      
        handId = 38363;
      end
    end

    FightField.SetRoleVisibleByID(handId, ERoleVisible.Hide);

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
    if me.roleController.animationFrame >= 3 then 
      me.roleController:SetAnimationForceFrame(3);
      local attack = FightField.attack[self.humIdx];
      attack:SetLightWithOrder(2, EEffectLightDis.Sky ,10016, 60, 1, 15, 15, EEffectLightTracer.StandAni, me.nowPos.x - 49, me.nowPos.y + 110, 50, false, 55);
      me:PlaySound();

      for i = 0, self.emyNum -1 do 
      target = FightField.fightHum[self.emyIdxAy[i]];
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      attack:SetLightWithOrder(2 + i * 5, EEffectLightDis.Ground, 10010, 50, 1, 4, 4, EEffectLightTracer.Stand, target.nowPos.x + 10, target.nowPos.y, 255, false, 35);
      attack:SetLightWithOrder(3 + i * 5, EEffectLightDis.Ground, 10010, 50, 1, 4, 4, EEffectLightTracer.Stand, target.nowPos.x - 25, target.nowPos.y, 255, false, 60);
      attack:SetLightWithOrder(4 + i * 5, EEffectLightDis.Ground, 10010, 50, 1, 4, 4, EEffectLightTracer.Stand, target.nowPos.x + 30, target.nowPos.y, 255, false, 60);
      attack:SetLightWithOrder(5 + i * 5, EEffectLightDis.Body, 10085, 150, 1, 4, 4, EEffectLightTracer.Stand, target.nowPos.x + 10, target.nowPos.y - 5, 255, false, 0);
      attack:SetLightWithOrder(6 + i * 5, EEffectLightDis.Body, 10086, 150, 1, 4, 4, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 255, false, 20);
      end
      self.interval = 0.9;
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
    if self:CheckInterval() then
      self.isLightEnd = true;
      self.step = 4;
    end
  end
end

TurtleLHand = InheritsFromBaseAttackSkill();

function TurtleLHand:ExtraClose()
  FightField.SetRoleVisibleByID(35032, ERoleVisible.Visible);
  FightField.SetRoleVisibleByID(35033, ERoleVisible.Visible);
  FightField.SetRoleVisibleByID(35034, ERoleVisible.Visible);  

  FightField.SetRoleVisibleByID(38361, ERoleVisible.Visible);
  FightField.SetRoleVisibleByID(38362, ERoleVisible.Visible);
  FightField.SetRoleVisibleByID(38363, ERoleVisible.Visible);
end

function TurtleLHand:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:SetAnimationForceId(ERolePose.Attack);
    local handId = nil;
    if Between(me.npcId, 35032, 35034)then 
      FightField.SetRoleVisibleByID(35032, ERoleVisible.Hide);      
      if me.npcId == 35034 then        
        handId = 35033;
      else      
        handId = 35034;
      end
    elseif Between(me.npcId, 38361, 38363)then 
      FightField.SetRoleVisibleByID(38361, ERoleVisible.Hide);      
      if me.npcId == 38363 then        
        handId = 38362;
      else      
        handId = 38363;
      end
    end

    FightField.SetRoleVisibleByID(handId, ERoleVisible.Hide);

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
    FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky ,10016, 60, 1, 15, 15, EEffectLightTracer.StandAni, me.nowPos.x + 137, me.nowPos.y - 23, 50, false, 55);
    me:PlaySound();

    for i = 0, self.emyNum -1 do 
     target = FightField.fightHum[self.emyIdxAy[i]];
     if not target:IsInSealStatus() then
      target.roleController:SetIsDead(true);
      local newPos;
      if math.random(2) == 1 then
        newPos = target:GetSpot(EFightSpot.Back, 60);
      else
        newPos = target:GetSpot(EFightSpot.Front, 60);
      end

      target:SetJump(newPos.x, newPos.y, tr);
     end
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
  elseif self.step == 3 then
    if me.roleController.animationFrame == 0 then
      self.step = 4;
    end
  elseif self.step == 4 then  
    if me.roleController.animationFrame == 3 then
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky ,10016, 60, 1, 15, 15, EEffectLightTracer.StandAni, me.nowPos.x + 137, me.nowPos.y - 23, 50, false, 55);
      me:PlaySound();
      for i = 0, self.emyNum -1 do 
        target = FightField.fightHum[self.emyIdxAy[i]];
        if not target:IsInSealStatus() then
          target.roleController:SetAnimationForceId(ERolePose.Lie);
          local newPos = {};
          if math.random(2) == 1 then
            newPos = target:GetSpot(EFightSpot.Back, 60);
          else
            newPos = target:GetSpot(EFightSpot.Front, 60);
          end
          target:SetJump(newPos.x, newPos.y, true);
        end
      end
      self.step = 5;
    end
  elseif self.step == 5 then
    if me.roleController.animationFrame == 0 then
      self.step = 6;
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
  elseif self.step == 6 then  
    if me.roleController.animationFrame == 3 then
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky ,10016, 60, 1, 15, 15, EEffectLightTracer.StandAni, me.nowPos.x + 137, me.nowPos.y - 23, 50, false, 55);
      me:PlaySound();

      for i = 0, self.emyNum -1 do 
        target = FightField.fightHum[self.emyIdxAy[i]];
        if not target:IsInSealStatus() then
          target.roleController:SetAnimationForceId(ERolePose.Lie);
          local newPos;
          if math.random(2) == 1 then
            newPos = target:GetSpot(EFightSpot.Back, 60);
          else
            newPos = target:GetSpot(EFightSpot.Front, 60);
          end
          target:SetJump(newPos.x, newPos.y, true);
        end
      end
      self.step = 7;
    end
  elseif self.step == 7 then 
    local newPos;
    --是否到達定位
    for i = 0, self.emyNum - 1 do 
      target = FightField.fightHum[self.emyIdxAy[i]];
      if not target.arrive then
        return;
      end
    end

    for i = 0, self.emyNum - 1 do 
      target = FightField.fightHum[self.emyIdxAy[i]];
      target.roleController:SetAnimationForceId(ERolePose.Walk);
      newPos = target:RCtoSpot(target.colm, target.row);
      target:SetWalk(newPos.x, newPos.y, true);
      target:SetSpeed(0.24);
    end
    self.step = 8;
  elseif self.step == 8 then 
    local newPos;
    --是否到達定位
    for i = 0, self.emyNum - 1 do 
      target = FightField.fightHum[self.emyIdxAy[i]];
      if not target.arrive then
        return;        
      end
    end
    self.step = 9;
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
  elseif self.step == 9 then 
    self.isLightEnd = true;
    self.step = 10;
  end
end