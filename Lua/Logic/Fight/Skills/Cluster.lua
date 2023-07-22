Cluster = InheritsFromBaseAttackSkill();

function Cluster:InitExtraParameters()
  self.lightStar = {};
  self.lightRing = {};
end

function Cluster:ExtraClose()
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

function Cluster:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  self:UpdateIce(); --更新暴光

  if self.step == 1 then
    me.roleController:SetAnimationForceId(ERolePose.Magic);   
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10916, 35, 1, 32, 32, EEffectLightTracer.Stand, me.nowPos.x + 6, me.nowPos.y, 30, false, 50);
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
      me:PlaySound(target.colm, target.row, Attack_Start, 1);
      local x = FightField.skillOffset.x;
      local y = FightField.skillOffset.y;
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10917, 60, 1, 12, 12, EEffectLightTracer.Line, x + 700, y + 200, 255, true, 0, x + 50, y + 270, 1);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10918, 60, 1, 12, 12, EEffectLightTracer.Line, x + 800, y + 400, 255, true, 0, x + 100, y + 280, 0.9);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10917, 60, 1, 12, 12, EEffectLightTracer.Line, x + 100, y + 200, 255, true, 0, x + 800, y + 500, 1);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10918, 60, 1, 12, 12, EEffectLightTracer.Line, x + 10, y + 300, 255, true, 0, x + 800, y + 450, 0.9);
      end
      self.interval = 0.2;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then
      local x = FightField.skillOffset.x;
      local y = FightField.skillOffset.y;
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10919, 60, 1, 12, 12, EEffectLightTracer.Line, x + 400, y + 600, 255, true, 0, x + 150, y, 1);
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10920, 60, 1, 12, 12, EEffectLightTracer.Line, x + 200, y + 600, 255, true, 0, x + 250, y, 0.9);
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10920, 60, 1, 12, 12, EEffectLightTracer.Curve, x + 750, y + 150, 255, true, 0, x + 200, y + 250, 0.85);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10919, 60, 1, 12, 12, EEffectLightTracer.Line, x + 200, y + 600, 255, true, 0, x + 800, y + 350, 1);
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10920, 60, 1, 12, 12, EEffectLightTracer.Line, x + 10, y + 600, 255, true, 0, x + 800, y + 400, 0.9);
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10920, 60, 1, 12, 12, EEffectLightTracer.Curve, x + 350, y + 150, 255, true, 0, x + 600, y + 400, 0.85);
      end
      self.interval = 0.1;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      me:PlaySound(target.colm, target.row, Attack_Start, 2);
      self.interval = 0.15;
    end
    if FightField.attack[self.humIdx].lights[6].isArrive then
      local x = FightField.skillOffset.x;
      local y = FightField.skillOffset.y;
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10920, 80, 7, 12, 12, EEffectLightTracer.Curve, x + 200, y + 280, 255, true, 0, x + 700, y + 700, 0.85, 2);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10920, 80, 7, 12, 12, EEffectLightTracer.Curve, x + 600, y + 400, 255, true, 0, x + 10, y + 600, 0.85, 2);
      end
      self.step = 5;
    end  
  elseif self.step == 5 then
    if FightField.attack[self.humIdx].lights[6].isArrive then
      self.isLightEnd =true;
      self.step = 6;
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
    end
  end
end

function Cluster:UpdateIce()
  local target;
  local ran;
  local newPos;
  for i = 0, self.emyNum - 1 do
    target = FightField.fightHum[self.emyIdxAy[i]];
    for j = 2, 6 do
      if FightField.attack[self.humIdx].lights[j] ~= nil and  FightField.attack[self.humIdx].lights[j].picId ~= 0 then
        if math.abs(FightField.attack[self.humIdx].lights[j].showPos.x - target.nowPos.x) <= 60 and math.abs(FightField.attack[self.humIdx].lights[j].showPos.y - target.nowPos.y) <= 60 then
          if not target:IsInSealStatus() then
            ran = math.random(3);
            if ran == 1 then
              newPos = target:GetSpot(EFightSpot.Back, math.random(80) + 79);
            elseif ran == 2 then
              newPos = target:GetSpot(EFightSpot.Left, math.random(80) + 79);
            else
              newPos = target:GetSpot(EFightSpot.Right, math.random(80) + 79);
            end
            target:SetJump(newPos.x, newPos.y);
          end
          self.lightStar[i] = EffectLight.New(10921, 30, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, true, 50);
          self.lightStar[i]:SetTimeScale(FightField.timeScale);   
          self.lightStar[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
          self.lightRing[i] = EffectLight.New(10922, 50, 1, 13, 13, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 100);
          self.lightRing[i]:SetTimeScale(FightField.timeScale);   
          self.lightRing[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
          break;
        end
      end
    end 
  end
end