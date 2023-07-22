SunlightSword = InheritsFromBaseAttackSkill();

function SunlightSword:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Body, 10092, 50, 1, 10, 10, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 25, true, 20);
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
      --local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    self.step = 2;
  elseif self.step == 2 then
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10277, 90, 1, 11, 11, EEffectLightTracer.Line, me.nowPos.x - 80, me.nowPos.y, 35, true, 0, me.nowPos.x, me.nowPos.y - 30, 0.33);
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[2].isArrive then
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10277, 90, 1, 11, 11, EEffectLightTracer.Line, me.nowPos.x - 80, me.nowPos.y, 35, true, 0, me.nowPos.x, me.nowPos.y - 30, 0.33);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Body, 10277, 90, 1, 11, 11, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y - 30, 35, true, 0, me.nowPos.x + 80, me.nowPos.y, 0.33);
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[3].isArrive then
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10277, 90, 1, 11, 11, EEffectLightTracer.Line, me.nowPos.x - 80, me.nowPos.y, 35, true, 0, me.nowPos.x, me.nowPos.y - 30, 0.33);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Body, 10277, 90, 1, 11, 11, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y - 30, 35, true, 0, me.nowPos.x + 80, me.nowPos.y, 0.33);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Body, 10277, 90, 1, 11, 11, EEffectLightTracer.Line, me.nowPos.x + 80, me.nowPos.y, 35, true, 0, me.nowPos.x, me.nowPos.y + 30, 0.33);
      self.step = 5;
    end
  elseif self.step == 5 then
    if FightField.attack[self.humIdx].lights[4].isArrive then
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10277, 90, 1, 11, 11, EEffectLightTracer.Line, me.nowPos.x - 80, me.nowPos.y, 35, true, 0, me.nowPos.x, me.nowPos.y - 30, 0.33);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Body, 10277, 90, 1, 11, 11, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y - 30, 35, true, 0, me.nowPos.x + 80, me.nowPos.y, 0.33);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Body, 10277, 90, 1, 11, 11, EEffectLightTracer.Line, me.nowPos.x + 80, me.nowPos.y, 35, true, 0, me.nowPos.x, me.nowPos.y + 30, 0.33);
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Body, 10277, 90, 1, 11, 11, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y + 30, 35, true, 0, me.nowPos.x - 80, me.nowPos.y, 0.33);
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
    if FightField.attack[self.humIdx].lights[5].isArrive then
      local fieldPos = Vector2.New(FightField.skillOffset.x, FightField.skillOffset.y);
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Body, 10092, 90, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 35, true, 0, me.nowPos.x, fieldPos.y, 1.99);
      me.roleController:SetIsJumping(true);
      me:SetJump(me.nowPos.x, fieldPos.y - 10);
      me:SetSpeed(1.99);

      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10277, 90, 1, 11, 11, EEffectLightTracer.Line, me.nowPos.x - 60, me.nowPos.y + 30, 35, true, 0, me.nowPos.x - 60, fieldPos.y, 1.99);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Body, 10277, 90, 1, 11, 11, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 35, true, 0, me.nowPos.x, fieldPos.y, 1.99);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Body, 10277, 90, 1, 11, 11, EEffectLightTracer.Line, me.nowPos.x + 60, me.nowPos.y + 30, 35, true, 0, me.nowPos.x + 60, fieldPos.y, 1.99);
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Body, 10277, 90, 1, 11, 11, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 35, true, 0, me.nowPos.x, fieldPos.y, 1.99);
      self.step = 7;
    end
  elseif self.step == 7 then
    if FightField.attack[self.humIdx].lights[5].isArrive then
      local newPos = target:GetSpot(EFightSpot.Front, 50);
      local fieldPos = Vector2.New(FightField.skillOffset.x, FightField.skillOffset.y);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10278, 90, 1, 11, 11, EEffectLightTracer.Line, target.nowPos.x, fieldPos.y, 35, true, 30, target.nowPos.x, target.nowPos.y + 30, 1.99);

      me:SetMoment(target.nowPos.x, fieldPos.y);
      me:SetJump(newPos.x, newPos.y, false);
      me:SetSpeed(1.99);
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Body, 10092, 90, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 25, true, 20, newPos.x, newPos.y, 1.99);
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
  elseif self.step == 8 then
    if FightField.attack[self.humIdx].lights[2].isArrive then
      local fieldPos = Vector2.New(FightField.skillOffset.x, FightField.skillOffset.y);
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Body, 10092, 50, 1, 10, 10, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 25, true, 20);
      me.roleController:SetIsJumping(false);
      me.roleController:SetAnimationForceId(ERolePose.Attack);
      target.roleController:SetAnimationForceId(ERolePose.Hit);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10096, 50, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x + math.random(0, 50), target.nowPos.y + math.random(50), 27, true, 82);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10278, 90, 1, 11, 11, EEffectLightTracer.Line, target.nowPos.x, fieldPos.y, 35, true, 0, target.nowPos.x, target.nowPos.y + 30, 1.99);
      me:PlaySound(target.colm, target.row, Attack_Start);
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Body, 10114, 151, 1, 1, 1, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 30, true, 100, target.nowPos.x - 30, target.nowPos.y - 30, 0.76);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Body, 10113, 151, 1, 1, 1, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 30, true, 100, target.nowPos.x + 30, target.nowPos.y, 0.76);
      end
      
      self.step = 9;
    end
  elseif self.step == 9 then
    if FightField.attack[self.humIdx].lights[2].isArrive then
      local fieldPos = Vector2.New(FightField.skillOffset.x, FightField.skillOffset.y);
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10096, 50, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x - math.random(0, 50), target.nowPos.y + math.random(50), 27, true, 82);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10278, 90, 1, 11, 11, EEffectLightTracer.Line, target.nowPos.x, fieldPos.y, 35, true, 0, target.nowPos.x, target.nowPos.y + 30, 1.99);
      me:PlaySound(target.colm, target.row, Attack_Start);
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Body, 10114, 151, 1, 1, 1, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 30, true, 100, target.nowPos.x - 30, target.nowPos.y - 30, 0.76);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Body, 10113, 151, 1, 1, 1, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 30, true, 100, target.nowPos.x + 30, target.nowPos.y, 0.76);
      end
      
      self.step = 10;
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
  elseif self.step == 10 then
    if FightField.attack[self.humIdx].lights[2].isArrive then
      local fieldPos = Vector2.New(FightField.skillOffset.x, FightField.skillOffset.y);
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10096, 50, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x + math.random(0, 50), target.nowPos.y + math.random(50), 27, true, 82);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10278, 90, 1, 11, 11, EEffectLightTracer.Line, target.nowPos.x, fieldPos.y, 35, true, 0, target.nowPos.x, target.nowPos.y + 30, 1.99);
      me:PlaySound(target.colm, target.row, Attack_Start);
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Body, 10114, 151, 1, 1, 1, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 30, true, 100, target.nowPos.x - 30, target.nowPos.y - 30, 0.76);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Body, 10113, 151, 1, 1, 1, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 30, true, 100, target.nowPos.x + 30, target.nowPos.y, 0.76);
      end
      
      self.step = 11;
    end
  elseif self.step == 11 then
    if FightField.attack[self.humIdx].lights[2].isArrive then
      FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10096, 50, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x + math.random(0, 50), target.nowPos.y + math.random(50), 27, true, 82);
      self.interval = 0.6;
      self.step = 12;
    end
  elseif self.step == 12 then
    if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 13;
    end
  end
end