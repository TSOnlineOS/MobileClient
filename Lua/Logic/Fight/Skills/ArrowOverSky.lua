ArrowOverSky = InheritsFromBaseAttackSkill();

function ArrowOverSky:InitExtraParameters()
  self.lightArrow = {};
  self.lightArrow2 = {};
  self.lightFlash = {};
  self.lightFlash2 = {};
  self.lightPics = {};
  self.lightPics[0] = 10283;
  self.lightPics[1] = 10321;
  self.lightPics[2] = 10322;
  self.lightPics[3] = 10323;
  self.lightPics[4] = 10324;
  self.lightPics[5] = 10331;
  self.lightPics[6] = 10332;
  self.lightPics[7] = 10335;
  self.lightPics[8] = 10333;
  self.lightPics[9] = 10334;
  self.lightPics[10] = 10336;
end

function ArrowOverSky:ExtraClose()
  self:ClearLight(self.lightArrow);
  self:ClearLight(self.lightArrow2);
  self:ClearLight(self.lightFlash);
  self:ClearLight(self.lightFlash2);
  table.Clear(self.lightPics);
end

function ArrowOverSky:ClearLight(lights)
  for k,v in pairs(lights) do
    v:Stop();
  end
  table.Clear(lights);
end

function ArrowOverSky:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.sky ,self.lightPics[0], 100, 1, 2, 10, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 30, false, 25);
    me:SetSpeed(1.99);
    me:SetJump(me.nowPos.x, FightField.skillOffset.y - 20, false);
    me:SetBeh(EFightBeh.Residual);

    self.interval = 0.9;
  
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
  elseif self.step == 2 or self.step == 3 then
    if self:CheckInterval() then 
      self:ClearLight(self.lightArrow);
      self:ClearLight(self.lightArrow2);
      local newPos = {};
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        if not target:IsInSealStatus() and target.roleController:GetAttribute(EAttribute.Hp) ~= 0 then
          if target.party_Kind == EFightParty.Left then
            self.lightArrow[i] = EffectLight.New(self.lightPics[1], 119 + math.random(50), 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - math.random(20) - 39, me.nowPos.y + math.random(70) + 49,
                                                 30, true, 0, target.nowPos.x + math.random(60) + 29, target.nowPos.y - math.random(50) + 1, 0.72);
            self.lightArrow[i]:SetTimeScale(FightField.timeScale);   
            self.lightArrow2[i] = EffectLight.New(self.lightPics[2], 119 + math.random(50), 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - math.random(30) - 39, me.nowPos.y + math.random(30) + 69,
                                                 30, true, 0, target.nowPos.x + math.random(60) + 29, target.nowPos.y + math.random(50) - 1, 0.72);
            self.lightArrow2[i]:SetTimeScale(FightField.timeScale);   
          else
            self.lightArrow[i] = EffectLight.New(self.lightPics[3], 119 + math.random(50), 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x + math.random(40) + 29, me.nowPos.y + math.random(70) + 49,
                                                 30, true, 0, target.nowPos.x - math.random(60) - 29, target.nowPos.y - math.random(50) + 1, 0.72);
            self.lightArrow[i]:SetTimeScale(FightField.timeScale);                                                    
            self.lightArrow2[i] = EffectLight.New(self.lightPics[4], 119 + math.random(50), 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - math.random(40) + 29, me.nowPos.y + math.random(30) + 69,
                                                 30, true, 0, target.nowPos.x - math.random(60) - 29, target.nowPos.y + math.random(50) - 1, 0.72);
            self.lightArrow2[i]:SetTimeScale(FightField.timeScale);                                                    
          end
          self.lightArrow[i]:SetSortingOrder(FightField.FIGHT_SKY_ORDER);
          self.lightArrow2[i]:SetSortingOrder(FightField.FIGHT_SKY_ORDER);
          if self.step == 3 then
            local  aConst = math.random(3) + 1;
            for j = 1, aConst do
              me:PlayEffect(target.colm, target.row, ERolePose.Hit, 4);
            end
          end
        end
      end

      self.interval = 0.9
      self.step = self.step + 1;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      self:ClearLight(self.lightArrow);
      self:ClearLight(self.lightArrow2);
      local newPos = {};
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        if not target:IsInSealStatus() and target.roleController:GetAttribute(EAttribute.Hp) ~= 0 then
          target.roleController:Hit();
          if target.party_Kind == EFightParty.Left then
            self.lightFlash[i] = EffectLight.New(self.lightPics[5], 100, 1, 5, 5, EEffectLightTracer.StandAni, target.nowPos.x + 21 - math.random(30), target.nowPos.y - 40, 30, false, math.random(50) - 1);
            self.lightFlash2[i] = EffectLight.New(self.lightPics[6], 100, 1, 5, 5, EEffectLightTracer.StandAni, target.nowPos.x + 19 + math.random(30), target.nowPos.y - 40, 30, false, math.random(50) - 1);
            self.lightArrow[i] = EffectLight.New(self.lightPics[7], 200, 5, 5, 6, EEffectLightTracer.Stand, target.nowPos.x + 20, me.nowPos.y - 40, 255, false, math.random(50) - 1);
            self.lightArrow2[i] = EffectLight.New(self.lightPics[7], 200, 6, 5, 6, EEffectLightTracer.Stand, target.nowPos.x + 20, me.nowPos.y - 40, 255, false, math.random(50) - 1);
          else
            self.lightFlash[i] = EffectLight.New(self.lightPics[8], 100, 1, 5, 5, EEffectLightTracer.StandAni, target.nowPos.x + 26 - math.random(30), target.nowPos.y - 20, 30, false, math.random(50) - 1);
            self.lightFlash2[i] = EffectLight.New(self.lightPics[9], 100, 1, 5, 5, EEffectLightTracer.StandAni, target.nowPos.x + 24 + math.random(30), target.nowPos.y - 20, 30, false, math.random(50) - 1);
            self.lightArrow[i] = EffectLight.New(self.lightPics[10], 200, 5, 5, 6, EEffectLightTracer.Stand, target.nowPos.x + - 15, target.nowPos.y - 20, 255, false, math.random(30) - 1);
            self.lightArrow2[i] = EffectLight.New(self.lightPics[10], 200, 6, 5, 6, EEffectLightTracer.Stand, target.nowPos.x + - 15, target.nowPos.y - 20, 255, false, math.random(30) - 1);
          end
          self.lightFlash[i]:SetSortingOrder(FightField.FIGHT_SKY_ORDER);
          self.lightFlash2[i]:SetSortingOrder(FightField.FIGHT_SKY_ORDER);
          self.lightArrow[i]:SetSortingOrder(FightField.FIGHT_SKY_ORDER);
          self.lightArrow2[i]:SetSortingOrder(FightField.FIGHT_SKY_ORDER);

          self.lightFlash[i]:SetTimeScale(FightField.timeScale);   
          self.lightFlash2[i]:SetTimeScale(FightField.timeScale);   
          self.lightArrow[i]:SetTimeScale(FightField.timeScale);   
          self.lightArrow2[i]:SetTimeScale(FightField.timeScale);   
          me:PlaySound(target.colm, target.row, Attack_Hit, 1);
        end
      end
      self.interval = 0.9
      self.step = 5;
    end
  elseif self.step == 5 then
    if self.interval >= 0 then
      self.interval = self.interval - (CGTimer.deltaTime * FightField.timeScale);
    else
      me:SetBeh(EFightBeh.None);
      self.isLightEnd = true;
      self.step = 6;
    end
  end
end

LightFlames = InheritsAttack(ArrowOverSky);

function LightFlames:InitExtraParameters()
  self.lightArrow = {};
  self.lightArrow2 = {};
  self.lightFlash = {};
  self.lightFlash2 = {};
  self.lightPics = {};
  self.lightPics[0] = 10848;
  self.lightPics[1] = 10849;
  self.lightPics[2] = 10850;
  self.lightPics[3] = 10851;
  self.lightPics[4] = 10852;
  self.lightPics[5] = 10853;
  self.lightPics[6] = 10854;
  self.lightPics[7] = 10855;
  self.lightPics[8] = 10856;
  self.lightPics[9] = 10857;
  self.lightPics[10] = 10858;
end

Lethal = InheritsAttack(ArrowOverSky);

function Lethal:InitExtraParameters()
  self.lightArrow = {};
  self.lightArrow2 = {};
  self.lightFlash = {};
  self.lightFlash2 = {};
  self.lightPics = {};
  self.lightPics[0] = 10859;
  self.lightPics[1] = 10860;
  self.lightPics[2] = 10861;
  self.lightPics[3] = 10862;
  self.lightPics[4] = 10863;
  self.lightPics[5] = 10864;
  self.lightPics[6] = 10865;
  self.lightPics[7] = 10866;
  self.lightPics[8] = 10867;
  self.lightPics[9] = 10868;
  self.lightPics[10] = 10869;
end

SKILL22022 = InheritsAttack(ArrowOverSky);

function SKILL22022:InitExtraParameters()
  self.lightArrow = {};
  self.lightArrow2 = {};
  self.lightFlash = {};
  self.lightFlash2 = {};
  self.lightPics = {};
  self.lightPics[0] = 10983;
  self.lightPics[1] = 10984;
  self.lightPics[2] = 10985;
  self.lightPics[3] = 10986;
  self.lightPics[4] = 10987;
  self.lightPics[5] = 10988;
  self.lightPics[6] = 10989;
  self.lightPics[7] = 10990;
  self.lightPics[8] = 10991;
  self.lightPics[9] = 10992;
  self.lightPics[10] = 10993;
end