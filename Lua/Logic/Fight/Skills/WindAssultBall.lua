WindAssultBall = InheritsFromBaseAttackSkill();

WindAssultBall.maxAssultCount = 7;

function WindAssultBall:InitExtraParameters()
  self.assultCount = 0;
  self.shot = {};  
end

function WindAssultBall:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local  newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10077, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 90);
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
      local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    self.step = 2;
  elseif self.step == 2 then      
    if table.Count(self.shot) > 0 then 
      for k, v in pairs(self.shot) do 
        if FightField.attack[self.humIdx].lights[v].isArrive then
          FightField.attack[self.humIdx]:SetLightWithOrder(10, EEffectLightDis.Body, 10000, 50, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x + 5, target.nowPos.y, 20, true, 30);
          me:PlaySound(target.colm, target.row, Attack_Start, 2);
          me:PlayEffect(target.colm, target.row, ERolePose.Hit, WindAssultBall.maxAssultCount);
          if target.party_Kind == EFightParty.Left then
            FightField.attack[self.humIdx]:SetLightWithOrder(v, EEffectLightDis.Sky, 10270, 30, 1, 10, 10, EEffectLightTracer.Curve, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x + math.random(0, 500), target.nowPos.y - math.random(0, 300), 0.66, EEffectLightCurve.Up);
            FightField.attack[self.humIdx]:SetLightWithOrder(v+1, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, EEffectLightTracer.Curve, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x + math.random(0, 500), target.nowPos.y + math.random(0, 300), 0.66, EEffectLightCurve.Up);
            FightField.attack[self.humIdx]:SetLightWithOrder(v+2, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, EEffectLightTracer.Curve, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x + math.random(0, 500), target.nowPos.y - math.random(0, 300), 0.66, EEffectLightCurve.Up);
          else
            FightField.attack[self.humIdx]:SetLightWithOrder(v, EEffectLightDis.Sky, 10270, 30, 1, 10, 10, EEffectLightTracer.Curve, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x - math.random(0, 500), target.nowPos.y - math.random(0, 300), 0.66, EEffectLightCurve.Up);
            FightField.attack[self.humIdx]:SetLightWithOrder(v+1, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, EEffectLightTracer.Curve, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x - math.random(0, 500), target.nowPos.y + math.random(0, 300), 0.66, EEffectLightCurve.Up);
            FightField.attack[self.humIdx]:SetLightWithOrder(v+2, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, EEffectLightTracer.Curve, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x - math.random(0, 500), target.nowPos.y - math.random(0, 300), 0.66, EEffectLightCurve.Up);
          end

          table.RemoveByValue(self.shot, v);
          break;
        end        
      end      
      if self.assultCount >= WindAssultBall.maxAssultCount and table.Count(self.shot) == 0 then 
        self.step = 3;
      end
    end

    if self.assultCount < WindAssultBall.maxAssultCount then 
      if not self:CheckInterval() then 
        return;
      end

      self.assultCount = self.assultCount + 1;
      local tracerKind = 0;
      local curveKind = 0;
      local effectSlot = 2;
      if self.assultCount % 3 == 0 then 
        tracerKind = EEffectLightTracer.Curve;
        curveKind = EEffectLightCurve.Up;
        effectSlot = 2;
      elseif self.assultCount % 3 == 1 then 
        tracerKind = EEffectLightTracer.Curve;
        curveKind = EEffectLightCurve.Down;
        effectSlot = 5;
      else
        tracerKind = EEffectLightTracer.Line;
        curveKind = EEffectLightCurve.Down;
        effectSlot = 8;
      end

      local speed = 0.8;
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot, EEffectLightDis.Sky, 10270, 30, 1, 10, 10, tracerKind, me.nowPos.x - 60, me.nowPos.y - 10, 35, true, 0, target.nowPos.x, target.nowPos.y + 60, speed, curveKind);
        FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot + 1, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, tracerKind, me.nowPos.x - 40, me.nowPos.y - 30, 35, true, 0, target.nowPos.x, target.nowPos.y + 20, speed, curveKind);  
        FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot + 2, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, tracerKind, me.nowPos.x - 30, me.nowPos.y - 10, 35, true, 0, target.nowPos.x, target.nowPos.y + 10, speed, curveKind);  
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot, EEffectLightDis.Sky, 10270, 30, 1, 10, 10, tracerKind, me.nowPos.x + 60, me.nowPos.y + 10, 35, true, 0, target.nowPos.x, target.nowPos.y + 60, speed, curveKind);
        FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot + 1, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, tracerKind, me.nowPos.x + 40, me.nowPos.y + 30, 35, true, 0, target.nowPos.x, target.nowPos.y + 20, speed, curveKind);  
        FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot + 2, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, tracerKind, me.nowPos.x + 30, me.nowPos.y + 10, 35, true, 0, target.nowPos.x, target.nowPos.y + 10, speed, curveKind); 
      end
        
      FightField.attack[self.humIdx].lights[effectSlot]:SetRotate(0, 30, 40, 10);
      FightField.attack[self.humIdx].lights[effectSlot + 1]:SetRotate(90, 40, 40, 40);
      FightField.attack[self.humIdx].lights[effectSlot + 2]:SetRotate(180, 50, 40, 30);
      me:PlaySound(target.colm, target.row, Attack_Start, 1);  
      table.insert(self.shot, effectSlot);    
      self.interval = 0.1;  
    end
  elseif self.step == 3 then        
    target.roleController:SetIsDead(true);
    self.interval = 0.8;
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
      local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 4 then
    if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 5;
    end
  end
end