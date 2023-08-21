TaiChiLightning = InheritsFromBaseAttackSkill();

function TaiChiLightning:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local fieldPos = Vector2.New(FightField.skillOffset.x, FightField.skillOffset.y);
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10079, 50, 1, 22, 22, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 30, false, 113);
    if target.party_Kind == EFightParty.Left then
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10486, 30, 1, 4, 4, EEffectLightTracer.Line, fieldPos.x + 420, fieldPos.y, 255, true, 0, fieldPos.x + 420, fieldPos.y + 180, 0.2);
    else
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10485, 30, 1, 4, 4, EEffectLightTracer.Line, fieldPos.x + 420, fieldPos.y, 255, true, 0, fieldPos.x + 420, fieldPos.y + 180, 0.2);
    end
    
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
    if FightField.attack[self.humIdx].lights[4].isArrive then
      local fieldPos = Vector2.New(FightField.skillOffset.x, FightField.skillOffset.y);
      if me.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10486, 80, 1, 4, 4, EEffectLightTracer.Stand, fieldPos.x + 420, fieldPos.y + 180, 255, true, 0);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10485, 80, 1, 4, 4, EEffectLightTracer.Stand, fieldPos.x + 420, fieldPos.y + 180, 255, true, 0);
      end

      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10502, 80, 1, 4, 4, EEffectLightTracer.Stand, fieldPos.x + 420, fieldPos.y + 220, 255, true, 0);
      self.interval = 0.8;
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
      local fieldPos = Vector2.New(FightField.skillOffset.x, FightField.skillOffset.y);
      local effectData = me:GetFightEffect(target.colm, target.row);

      if effectData ~= nil and effectData.attack_Result ~= EAttackResult.Thounder then     
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10512, 30, 1, 11, 11, EEffectLightTracer.Line, fieldPos.x + 420, fieldPos.y + 180, 255, true, 0, fieldPos.x + 420, fieldPos.y + 380, 0.4);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10513, 30, 1, 11, 11, EEffectLightTracer.Line, fieldPos.x + 420, fieldPos.y + 180, 255, true, 0, fieldPos.x + 420, fieldPos.y + 380, 0.4);
      end
      
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[2].isArrive then
      local fieldPos = Vector2.New(FightField.skillOffset.x, FightField.skillOffset.y);
      local effectData = me:GetFightEffect(target.colm, target.row);    
      if effectData ~= nil and effectData.attack_Result ~= EAttackResult.Thounder then     
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10512, 30, 1, 11, 11, EEffectLightTracer.Stand, fieldPos.x + 420, fieldPos.y + 380, 255, false, 0);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10513, 30, 1, 11, 11, EEffectLightTracer.Stand, fieldPos.x + 420, fieldPos.y + 380, 255, false, 0);
      end


      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10016, 20, 1, 6, 15, EEffectLightTracer.StandAni, fieldPos.x + 420, fieldPos.y + 380, 20, false, 25);
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
  elseif self.step == 5 then
    if self:CheckInterval() then 
      local newPos;
      local effectData = me:GetFightEffect(target.colm, target.row);
      
      if effectData ~= nil and effectData.attack_Result ~= EAttackResult.Thounder then     
        newPos = target.nowPos;
        target.roleController:SetAnimationForceId(ERolePose.Hit);
      else
        newPos = me.nowPos;
        me.roleController:SetAnimationForceId(ERolePose.Hit);
      end

      me:PlayEffect(target.colm, target.row, ERolePose.Hit);      
      FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10503, 50, 1, 3, 7, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, false, 50);
      FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10504, 50, 1, 3, 7, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, false, 50);
      FightField.attack[self.humIdx]:SetLightWithOrder(8, EEffectLightDis.Sky, 10016, 50, 1, 15, 15, EEffectLightTracer.Stand, newPos.x, newPos.y, 30, true, 30);

      FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Body, 10069, 100, 1, 4, 4, EEffectLightTracer.Stand, newPos.x - 18, newPos.y, 30, true, 10);
      FightField.attack[self.humIdx]:SetLightWithOrder(10, EEffectLightDis.Body, 10454, 80, 1, 4, 4, EEffectLightTracer.Stand, newPos.x - 10, newPos.y, 30, true, 10);
      FightField.attack[self.humIdx]:SetLightWithOrder(11, EEffectLightDis.Body, 10455, 70, 1, 4, 4, EEffectLightTracer.Stand, newPos.x - 18, newPos.y, 30, true, 10);

      self.interval = 0.8;
      self.step = 6;
    end
  elseif self.step == 6 then
    if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 7;
    end
  end
end