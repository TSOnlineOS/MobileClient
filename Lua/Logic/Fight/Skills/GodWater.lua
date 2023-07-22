GodWater = InheritsFromBaseAttackSkill();

function GodWater:InitExtraParameters()
  self.lightStar = {};
  self.lightRing = {};
end

function GodWater:ExtraClose()
  ClearLightTable(self.lightStar);
  ClearLightTable(self.lightRing);  
  self.isLightEnd = true;
end

function GodWater:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10070, 35, 1, 32, 32, EEffectLightTracer.Stand, me.nowPos.x + 6, me.nowPos.y, 30, true, 50);
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
    self.step = 2;
  elseif self.step == 2 then
    if self:CheckInterval() then 
      AudioManager.PlayOnce("AudioClip_WA0070");
      for k, v in pairs(self.emyIdxAy) do
        self.lightStar[k] = EffectLight.New(10420, 80, 1, 9, 9, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, true, 50);
        self.lightStar[k]:SetTimeScale(FightField.timeScale);  
        self.lightStar[k]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        self.lightRing[k] = EffectLight.New(10404, 80, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, true, 30);
        self.lightRing[k]:SetTimeScale(FightField.timeScale);  
        self.lightRing[k]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      end
    
      self.step = 3;
    end
  elseif self.step == 3 then
    if self.lightStar[0] == nil or self.lightStar[0].picId == 0 then
      self.step = 4;
    end
  elseif self.step == 4 then
    self.isLightEnd =true;
    self.step = 5;
  end
end