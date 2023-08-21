ThreeSidesIceSwords = InheritsFromBaseAttackSkill();

function ThreeSidesIceSwords:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Body ,10273, 60, 1, 16, 16, EEffectLightTracer.StandAni, me.nowPos.x + 10, me.nowPos.y, 20, true, 50);
    FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body ,10337, 100, 9, 9, 9, EEffectLightTracer.StandAni, me.nowPos.x + 10, me.nowPos.y, 255, true, 45);
    FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky ,10344, 50, 1, 17, 17, EEffectLightTracer.StandAni, me.nowPos.x + 10, me.nowPos.y, 20, true, 80);
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
      for i = 0, self.emyNum - 1 do 
        target = FightField.fightHum[self.emyIdxAy[i]];
        FightField.attack[self.humIdx]:SetLightWithOrder(4 + i, EEffectLightDis.Ground, 10083, 50, 1, 6, 12, EEffectLightTracer.Stand, target.nowPos.x + 3, target.nowPos.y, 20, true, 60);
      end
      self.interval = 0.5;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      local newPos = {};
      for i = 0, self.emyNum - 1 do 
        target = FightField.fightHum[self.emyIdxAy[i]];
        newPos = target:GetSpot(EFightSpot.Back, 70);
        local lightIndex = 4 + self.emyNum + i * 3;
        if target.party_Kind == EFightParty.Left then
          FightField.attack[self.humIdx]:SetLightWithOrder(i + 4, EEffectLightDis.Sky ,10307, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - 50, me.nowPos.y - 30, 255, true, 10,
                                                           newPos.x, newPos.y, 0.64);                      
        else
          FightField.attack[self.humIdx]:SetLightWithOrder(i + 4, EEffectLightDis.Sky ,10306, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x + 30, me.nowPos.y + 10, 255, true, 20,
                                                           newPos.x, newPos.y, 0.67);                    
        end
        FightField.attack[self.humIdx]:SetLightWithOrder(lightIndex, EEffectLightDis.Body, 10009, 100, 1, 2, 2, EEffectLightTracer.Line, me.nowPos.x - 50, me.nowPos.x - 30, 20, true, 30, newPos.x, newPos.y, 0.6);
        FightField.attack[self.humIdx]:SetLightWithOrder(lightIndex + 1, EEffectLightDis.Body, 10013, 100, 1, 3, 3, EEffectLightTracer.Line, me.nowPos.x - 50, me.nowPos.x - 30, 20, true, 50, newPos.x, newPos.y, 0.49);
        FightField.attack[self.humIdx]:SetLightWithOrder(lightIndex + 2, EEffectLightDis.Body, 10014, 100, 1, 3, 3, EEffectLightTracer.Line, me.nowPos.x - 50, me.nowPos.x - 30, 20, true, 50, newPos.x, newPos.y, 0.39);
      end
    
      self.interval = 0.5;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      for i = 0, self.emyNum - 1 do 
        local lightIndex = 4 + self.emyNum * 4 + i;
        target = FightField.fightHum[self.emyIdxAy[i]];
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);
        FightField.attack[self.humIdx]:SetLightWithOrder(lightIndex, EEffectLightDis.Body, 10287, 35, 1, 8, 8, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 30);         
      end
    
      self.interval = 0.8;
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
      self.isLightEnd =true;
      self.step = 6;
    end
  end
end
