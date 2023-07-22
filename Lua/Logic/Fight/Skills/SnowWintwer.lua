SnowWintwer = InheritsFromBaseAttackSkill();

function SnowWintwer:Update()  
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then           
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10070, 40, 1, 32, 32, EEffectLightTracer.StandAni, me.nowPos.x + 7, me.nowPos.y, 20, true, 50);
    self.interval = 0.5;
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
      local fieldPos = Vector2.New(FightField.skillOffset.x, FightField.skillOffset.y);
      if target.party_Kind == EFightParty.Left then
        for i = 0, 4 do
          FightField.attack[self.humIdx]:SetLightWithOrder(4 + i * 2, EEffectLightDis.Body, 10020, 100 + math.random(20), 1, 10, 10, EEffectLightTracer.StandAni, fieldPos.x + 120 + (i * 75), fieldPos.y + 300 - (i * 40), 20, true, 40);
          FightField.attack[self.humIdx]:SetLightWithOrder(5 + i * 2, EEffectLightDis.Body, 10020, 100 + math.random(20), 1, 10, 10, EEffectLightTracer.StandAni, fieldPos.x + 150 + (i * 75), fieldPos.y + 340 - (i * 40), 20, true, 40);
        end
      else
        for i = 0, 4 do
          FightField.attack[self.humIdx]:SetLightWithOrder(4 + i * 2, EEffectLightDis.Body, 10020, 100 + math.random(20), 1, 10, 10, EEffectLightTracer.StandAni, fieldPos.x + 380 + (i * 75), fieldPos.y + 480 - (i * 40), 20, true, 40);
          FightField.attack[self.humIdx]:SetLightWithOrder(5 + i * 2, EEffectLightDis.Body, 10020, 100 + math.random(20), 1, 10, 10, EEffectLightTracer.StandAni, fieldPos.x + 440 + (i * 75), fieldPos.y + 520 - (i * 40), 20, true, 40);
        end
      end

      local newPos = me:GetMagicPos();
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10288, 100, 1, 8, 8, EEffectLightTracer.Line, newPos.x, fieldPos.y, 255, true, 0, newPos.x, newPos.y - 80, 0.33);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10289, 40, 1, 13, 13, EEffectLightTracer.Line, newPos.x, fieldPos.y, 30, true, 0, newPos.x, newPos.y - 60, 0.33);
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
    if FightField.attack[self.humIdx].lights[2].isArrive then
      local newPos = me:GetMagicPos();
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10288, 100, 1, 8, 8, EEffectLightTracer.Stand, newPos.x, newPos.y - 80, 255, true, 0);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10289, 30, 1, 13, 13, EEffectLightTracer.Stand, newPos.x, newPos.y - 60, 30, true, 0);
      
      self.interval = 0.8;
      self.step = 4;
     end
  elseif self.step == 4 or self.step == 5 then
    if self:CheckInterval() then 
      for i = 0, self.emyNum-1 do            
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        target.roleController:SetAnimationForceId(ERolePose.Hit);
        FightField.attack[self.humIdx]:SetLightWithOrder(14 + i * self.emyNum, EEffectLightDis.Body, 10286, 60, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x + 5, target.nowPos.y, 30, true, 50);
        FightField.attack[self.humIdx]:SetLightWithOrder(15 + i * self.emyNum, EEffectLightDis.Body, 10300, math.random(0, 80) + 10, 1, 9, 9, EEffectLightTracer.StandAni, target.nowPos.x + 5, target.nowPos.y, 30, true, 50);
      end

      self.interval = 0.8;
      self.step = self.step + 1;
     end
  elseif self.step == 6 then
    if self:CheckInterval() then 
      self.isLightEnd = true;
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
  end
end