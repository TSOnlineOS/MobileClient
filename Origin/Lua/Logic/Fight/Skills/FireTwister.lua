FireTwister = InheritsFromBaseAttackSkill();

function FireTwister:InitExtraParameters()
  self.index = 0;
  self.totalDist = 0;
  self.curDist = 0;
end

function FireTwister:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground ,10078, 50, 1, 20, 20, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 80);
  
    ---2--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local area =  DemoCode.CalTriangleArea(100, 100)
      area = area * 1 + 2;
      if area > DemoCode.GetBitxor(20) then  --test avg
        local avg = DemoCode.CalAvg(10, 20, 30);
      end
    end
    --3----------------------------------------------------
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
    self.interval = 0.8;
    self.step = 2;
  elseif self.step == 2 then
    if self:CheckInterval() then 
      FightField.isShake = true;
      self.totalDist = math.round(math.sqrt(math.pow(me.nowPos.x - target.nowPos.x, 2) + math.pow(me.nowPos.y - target.nowPos.y, 2)));
      self.interval = 0.1;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      self.curDist = self.curDist + 100;
      me:PlaySound(target.colm, target.row, Attack_Hit);
      local newPos = me:GetSpotOfTar(target.nowPos.x, target.nowPos.y, self.curDist);

      FightField.attack[self.humIdx]:SetLightWithOrder(self.index + 2, EEffectLightDis.Sky, 10055, 40, 1, 21, 21, EEffectLightTracer.StandAni, newPos.x, newPos.y, 20, false, 30);
      FightField.attack[self.humIdx]:SetLightWithOrder(self.index + 6, EEffectLightDis.Ground, 10010, 100, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, false, 35);
      self.index = self.index + 1;
      if  self.index >= 4 then
        self.index = 0;
      end

      self.interval = 0.3;
      if self.curDist > self.totalDist then
        self.step = 4;
      end
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      FightField.SetShake(false);
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        target.roleController:Hit();
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 2, EEffectLightDis.Sky, 10055, math.random(30) + 29, 1, 21, 21, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 30);
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 6, EEffectLightDis.Ground, 10010, 80, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 255, true, 35);
      end
      self.interval = 0.5;
      ---2--------------------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        local area =  DemoCode.CalTriangleArea(100, 100)
        area = area * 1 + 2;
        if area > DemoCode.GetBitxor(20) then  --test avg
          local avg = DemoCode.CalAvg(10, 20, 30);
        end
      end
      --3----------------------------------------------------
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
      self.step = 5;
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      me:PlaySound(target.colm, target.row, Attack_Hit);
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        target.roleController:Hit();
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 6, EEffectLightDis.Sky, 10408, math.random(30) + 39, 1, 13, 13, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 35);
      end
      self.step = 6;
    end
  elseif self.step == 6 then
    if FightField.attack[self.humIdx].lights[6].picId == 0 then
      self.isLightEnd = true;
      self.step = 7;
    end
  end
end