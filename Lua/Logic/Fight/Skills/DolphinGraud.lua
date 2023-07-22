DolphinGraud = InheritsFromBaseAttackSkill();

function DolphinGraud:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10077, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 90);
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
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10387, 100, 1, 17, 17, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, true, 30);
      FightField.attack[self.humIdx].lights[2]:SetScale(Vector3.New(0.5, 0.5, 1));
      me:PlaySound(target.colm, target.row);         
      self.interval = 0.8;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 4;
    end
  end
end

DolphinGraudMe = InheritsFromBaseStatus();

function DolphinGraudMe:ExtraClose()  
  FightField.RestoreFightInfo(self.humIdx, 0);
end

function DolphinGraudMe:Update()  
  if self.step == 1 then
    local me = FightField.fightHum[self.humIdx];

    me:GetStatus(self.statusKind):SetLightWithOrder(1, EEffectLightDis.Body, 10387, 100, 1, 17, 17, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 20, true, 30);                                                 
    me:GetStatus(self.statusKind).lights[1]:SetScale(Vector3.New(0.5, 0.5, 1));
    me:SetStatusKind(self.statusKind, EStatus.DolphieGraud);
    self.step = 2;    
  end
end
