Invisible = InheritsFromBaseAttackSkill();

function Invisible:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10077, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 90);
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
      for i = 0, 2 do
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 2, EEffectLightDis.Body, 10298, 50, 1, 10, 10, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 20, true, 0);
        FightField.attack[self.humIdx].lights[i + 2]:SetRotate((i * 120), 30, 40, 80);
      end
      
      self.interval = 2.2;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 4;
    end
  end
end


InvisibleMe = InheritsFromBaseStatus();

function InvisibleMe:ExtraClose()
  FightField.RestoreFightInfo(self.humIdx, 0);
  if FightField.fightHum[self.humIdx] ~= nil then 
    FightField.fightHum[self.humIdx]:SetAlpha(255);
  end
end

function InvisibleMe:Update()
  if self.step == 1 then 
    local me = FightField.fightHum[self.humIdx];    
    me:SetAlpha(130);
    for i = 0, 2 do
      me:GetStatus(self.statusKind):SetLightWithOrder(i + 2, EEffectLightDis.Body, 10298, 50, 1, 10, 10, EEffectLightTracer.Stand, me.nowPos.x,me.nowPos.y, 20, true, 0);
      me:GetStatus(self.statusKind).lights[i + 2]:SetRotate((i * 120), 30, 40, 80);
    end

    self.step = 2;              
  end
end