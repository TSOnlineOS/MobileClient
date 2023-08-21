SuperDissolve = InheritsFromBaseAttackSkill();

function SuperDissolve:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(1 , EEffectLightDis.Ground ,10070, 35, 1, 32, 32, EEffectLightTracer.Stand, me.nowPos.x + 6, me.nowPos.y, 30, true, 50);    
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
      local i = 0;
      for k, v in pairs(self.emyIdxAy) do
        target = FightField.fightHum[v];
        FightField.attack[self.humIdx]:SetLightWithOrder(2 + i * 4 , EEffectLightDis.Body, 10094, 50, 1, 19, 19, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, true, 50);
        FightField.attack[self.humIdx]:SetLightWithOrder(3 + i * 4 , EEffectLightDis.Body, 10401, 100, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, true, 100);
        FightField.attack[self.humIdx]:SetLightWithOrder(4 + i * 4, EEffectLightDis.Body, 10022, 50, 1, 11, 11, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, true, 20);
        FightField.attack[self.humIdx]:SetLightWithOrder(5 + i * 4, EEffectLightDis.Body, 10404, 80, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, true, 30);
        i = i + 1;
      end
      self.interval = 0.9;
      self.soundInterval = 0.18;
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
    if self.soundInterval >= 0 then
      self.soundInterval = self.soundInterval - CGTimer.deltaTime * FightField.timeScale;
    else
      me:PlaySound(target.colm, target.row, Attack_Start);
      self.soundInterval = 0.18;
    end

    if self:CheckInterval() then 
      self.step = 4;
    end
  elseif self.step == 4 then
    local light =  FightField.attack[self.humIdx].lights[2];
    if light == nil or light.picId == 0 then
      self.step = 4;
    end
    self.isLightEnd =true;
    self.step = 5;
  end
end

Dis6Status = InheritsFromBaseAttackSkill();

function Dis6Status:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:MagicAttack();    
    self.interval = 0.8;
    self.step = 2;
  elseif self.step == 2 then
    if self:CheckInterval() then 
      local i = 0;
      for k, v in pairs(self.emyIdxAy) do
        target = FightField.fightHum[v];
        FightField.attack[self.humIdx]:SetLightWithOrder(1 + i * 4 , EEffectLightDis.Body, 10094, 50, 1, 19, 19, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, true, 50);
        FightField.attack[self.humIdx]:SetLightWithOrder(2 + i * 4 , EEffectLightDis.Body, 10401, 100, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, true, 100);
        FightField.attack[self.humIdx]:SetLightWithOrder(3 + i * 4, EEffectLightDis.Body, 10022, 50, 1, 11, 11, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, true, 20);
        FightField.attack[self.humIdx]:SetLightWithOrder(4 + i * 4, EEffectLightDis.Body, 10404, 80, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, true, 30);
        i = i + 1;
      end
      self.interval = 0.9;
      self.soundInterval = 0.18;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self.soundInterval >= 0 then
      self.soundInterval = self.soundInterval - CGTimer.deltaTime * FightField.timeScale;
    else
      me:PlaySound(target.colm, target.row, Attack_Start);
      self.soundInterval = 0.18;
    end

    if self:CheckInterval() then 
      self.step = 4;
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
  elseif self.step == 4 then
    local light = FightField.attack[self.humIdx].lights[2];
    if light == nil or light.picId == 0 then
      self.step = 4;
    end
    self.isLightEnd =true;
    self.step = 5;
  end
end