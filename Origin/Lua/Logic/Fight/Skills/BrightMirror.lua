BrightMirror = InheritsFromBaseAttackSkill();

function BrightMirror:Update()  
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground, 10070, 35, 1, 28, 32, EEffectLightTracer.StandAni, me.nowPos.x + 6, me.nowPos.y, 30, false, 50);
    
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
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
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
      --local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    self.step = 2;      
  elseif self.step == 2 then
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10141, 50, 1, 23, 23, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y - 35, 20, false, 80);
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].picId == 0 then
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10095, 50, 1, 13, 13, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y - 35, 20, false, 50);
      self.step = 4;
     end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky2].picId == 0 then
      self.isLightEnd = true;
      self.step = 5;
    end
  end
end

--狀態顯示
BrightMirrorMe = InheritsFromBaseStatus();

function BrightMirrorMe:ExtraClose()  
  FightField.RestoreFightInfo(self.humIdx,0);
end

function BrightMirrorMe:Update()  
  if self.step == 1 then 
    local me = FightField.fightHum[self.humIdx];    
    me:GetStatus(self.statusKind):SetLight(EEffectLightKind.Sky2, 10095, 50, 1, 13, 13, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y - 35, 20, true, 50);
    self.step = 2;  
  end
end