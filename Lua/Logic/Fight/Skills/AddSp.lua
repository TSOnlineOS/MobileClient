AddSp = InheritsFromBaseAttackSkill();


function AddSp:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10070, 35, 1, 28, 32, EEffectLightTracer.Stand, me.nowPos.x + 6, me.nowPos.y, 30, false, 50);
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
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
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    self.step = 2;
  elseif self.step == 2 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Ground].orderCount == 16 then
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1 ,10022, 66, 12, 1, 12, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y - 35, 20, false, 50);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2 ,10035, 32, 1, 25, 25, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, false, 10);
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky2].picId == 0 then
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10070, 80, 29, 32, 32, EEffectLightTracer.StandAni, me.nowPos.x + 6, me.nowPos.y, 25, false, 50);
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Ground].picId == 0 then
      self.isLightEnd =true;
      self.step = 5;
    end
  end
end

AllAddSp = InheritsFromBaseAttackSkill();

function AllAddSp:InitExtraParameters()
  self.lightStar = {};
  self.lightRing = {};
end

function AllAddSp:ExtraClose()
  for k, v in pairs(self.lightStar) do
    if v ~= nil then
      v:Stop();
    end
  end

  for k, v in pairs(self.lightRing) do
    if v ~= nil then
      v:Stop();
    end
  end

  table.Clear(self.lightStar);
  table.Clear(self.lightRing);
  self.isLightEnd = true;
end

function AllAddSp:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10070, 35, 1, 28, 32, EEffectLightTracer.Stand, me.nowPos.x + 6, me.nowPos.y, 30, false, 50);
    self.interval = 0.8;
  
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
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    self.step = 2;
  elseif self.step == 2 then
    if self:CheckInterval() then 
      for k, v in pairs(self.emyIdxAy) do
        local fightRole = FightField.fightHum[v];
        self.lightStar[k] = EffectLight.New(10144, 32, 1, 17, 17, EEffectLightTracer.StandAni, fightRole.nowPos.x, fightRole.nowPos.y, 20, false, 10);
        self.lightStar[k]:SetTimeScale(FightField.timeScale);
        self.lightStar[k]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        self.lightRing[k] = EffectLight.New(10145, 150, 1, 16, 16, EEffectLightTracer.StandAni, fightRole.nowPos.x, fightRole.nowPos.y, 30, false, 40);
        self.lightRing[k]:SetTimeScale(FightField.timeScale);
        self.lightRing[k]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      end
    
      self.step = 3;
    end
  elseif self.step == 3 then
    if self.lightStar[0] ~= nil then
      if self.lightStar[0].picId == 0 then
        self.step = 4;
      end
    else
      self.step = 4;
    end
  elseif self.step == 4 then
    self.isLightEnd =true;
    self.step = 5;
  end
end
