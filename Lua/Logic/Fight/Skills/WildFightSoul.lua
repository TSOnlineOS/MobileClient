WildFightSoul = InheritsFromBaseAttackSkill();

function WildFightSoul:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    for i = 0, self.emyNum - 1 do
      target = FightField.fightHum[self.emyIdxAy[i]];
      if target ~= nil then 
        FightField.attack[self.humIdx]:SetLightWithOrder(1 + i, EEffectLightDis.Body, 10281, 150, 1, 6, 6, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 30, true, 30);       
      end
    end
    self.interval = 0.6;
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
      me:PlaySound(target.colm, target.row, Attack_Start);
      local lightIndex = 1 + self.emyNum;
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        if target ~= nil then 
          FightField.attack[self.humIdx]:SetLightWithOrder(lightIndex + i, EEffectLightDis.Body, 10290, 100, 1, 11, 11, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 60);
        end        
      end
      self.interval = 0.9;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      self.isLightEnd =true;
      self.step = 4;
    end
  end
end

--狀態顯示
WildFightSoulMe = InheritsFromBaseStatus();

function WildFightSoulMe:ExtraClose()  
  FightField.RestoreFightInfo(self.humIdx,0);
end

function WildFightSoulMe:Update()  
  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then   
    me:GetStatus(self.statusKind):SetLight(EEffectLightKind.Ground, 10290, 100, 1, 11, 11, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 30, true, 60);

    self.step = 2;
  end
end