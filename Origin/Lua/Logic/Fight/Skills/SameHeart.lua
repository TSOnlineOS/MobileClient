SameHeart = InheritsFromBaseAttackSkill();

function SameHeart:Update()
  self:UpdateLogic();
end

function SameHeart:UpdateLogic()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    --030601J八卦魔法陣
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10079, 50, 1, 22, 22, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 30, false, 113);
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
      local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then
    if self:CheckInterval() then 
      local newPos = {};
      if target.party_Kind == EFightParty.Right then
        newPos = target:RCtoSpot(3, 2, EFightSpot.Front, 50);
      else
        newPos = target:RCtoSpot(0, 2, EFightSpot.Front, 50);
      end
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10146, 100, 1, 6, 6, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, false, 60);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10006, 50, 1, 24, 24, EEffectLightTracer.Stand, newPos.x, newPos.y, 25, false, 60);

      for k, v in pairs(self.emyIdxAy) do
        FightField.attack[self.humIdx]:SetLightWithOrder(5 + k * self.emyNum, EEffectLightDis.Body, 10144, 32, 1, 17, 17, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, false, 10);
        FightField.attack[self.humIdx]:SetLightWithOrder(6 + k * self.emyNum, EEffectLightDis.Body, 10022, 66, 1, 12, 12, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, false, 10);
      end
      self.interval = 0.6;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      local newPos = {};
      if target.party_Kind == EFightParty.Right then
        newPos = target:RCtoSpot(3, 2, EFightSpot.Front, 50);
      else
        newPos = target:RCtoSpot(0, 2, EFightSpot.Front, 50);
      end

      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10147, 200, 1, 1, 1, EEffectLightTracer.StandAni, newPos.x, newPos.y, 25, false, 60);
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      self.isLightEnd = true;
      self.step = 4;   
    end
  end
end