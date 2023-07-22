DarkMind = InheritsFromBaseAttackSkill();

function DarkMind:InitExtraParameters()
  self.soundInterval = 0;
end

function DarkMind:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    if target.party_Kind == EFightParty.Left then
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10540, 60, 1, 12, 12, EEffectLightTracer.Stand, target.nowPos.x + 5, target.nowPos.y + 30, 30, true, 0);
    else
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Body, 10540, 60, 1, 12, 12, EEffectLightTracer.Stand, target.nowPos.x + 10, target.nowPos.y + 13, 30, true, 0);
    end
   
    self.interval = 1.2;
    self.soundInterval = 0.4;
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
    if self.soundInterval >= 0 then
      self.soundInterval = self.soundInterval - CGTimer.deltaTime * FightField.timeScale;
    else
      me:PlaySound(target.colm, target.row, Attack_Start);
      self.soundInterval = 0.4;
    end

    if self:CheckInterval() then 
      self.step = 3;
    end
  elseif self.step == 3 then
    self.isLightEnd = true
    self.step = 4;
  end
end

--狀態顯示
DarkMindMe = InheritsFromBaseStatus();

function DarkMindMe:ExtraClose()  
  FightField.RestoreFightInfo(self.humIdx, 0);
end

function DarkMindMe:Update()
  if self.step == 1 then 
    local me = FightField.fightHum[self.humIdx];
    if me.party_Kind == EFightParty.Left then
      me:GetStatus(self.statusKind):SetLightWithOrder(3, EEffectLightDis.Sky, 10540, 60, 1, 12, 12, EEffectLightTracer.Stand, me.nowPos.x + 5, me.nowPos.y + 30, 30, true, 0);
    else
      me:GetStatus(self.statusKind):SetLightWithOrder(3, EEffectLightDis.Body, 10540, 60, 1, 12, 12, EEffectLightTracer.Stand, me.nowPos.x + 10, me.nowPos.y + 13, 30, true, 0);
    end
    self.step = 2;              
  end
end