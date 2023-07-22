Fire3_4 = InheritsFromBaseAttackSkill();

function Fire3_4:Update()  
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10078, 100, 1, 20, 20, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 30, true, 80);
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
    self.step = 2;      
  elseif self.step == 2 then
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10269, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - 60, me.nowPos.y - 10, 35, true, 0, target.nowPos.x, target.nowPos.y + 60, 0.60);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Body, 10269, 90, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - 40, me.nowPos.y - 30, 35, true, 0, target.nowPos.x, target.nowPos.y + 20, 0.63);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Body, 10269, 90, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y - 10, 35, true, 0, target.nowPos.x, target.nowPos.y + 10, 0.65);
      FightField.attack[self.humIdx].lights[2]:SetRotate(0, 30, 40, 10);
      FightField.attack[self.humIdx].lights[3]:SetRotate(90, 40, 40, 20);
      FightField.attack[self.humIdx].lights[4]:SetRotate(180, 50, 40, 30);
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField. attack[self.humIdx].lights[2].isArrive then
      me:PlaySound(target.colm, target.row);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10098, 100, 1, 9, 9, EEffectLightTracer.StandAni, target.nowPos.x + math.random(0, 20), target.nowPos.y + math.random(0, 10), 30, true, 100);
      FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10099, 100, 1, 9, 9, EEffectLightTracer.StandAni, target.nowPos.x + math.random(0, 20), target.nowPos.y + math.random(0, 15), 30, true, 100);
      FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10098, 100, 1, 9, 9, EEffectLightTracer.StandAni, target.nowPos.x + math.random(0, 20), target.nowPos.y + math.random(0, 20), 30, true, 100);
      self.interval = 0.8;
      self.step = 4;
     end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 5;
    end
  end
end