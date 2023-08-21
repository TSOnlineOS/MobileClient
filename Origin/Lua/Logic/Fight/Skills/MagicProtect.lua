MagicProtect = InheritsFromBaseAttackSkill();

function MagicProtect:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self.step == 1 then     
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground, 10070, 35, 1, 28, 32, EEffectLightTracer.Stand, me.nowPos.x+6, me.nowPos.y, 30, false, 50);
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
    --紅光
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1,10050,110,1,3,3, EEffectLightTracer.StandAni, target.nowPos.x-4, target.nowPos.y-100-36+13,50, false, 0);
    --雷
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2,10412,80,1,9,9, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y+134-36,50, false, 0);
    --腳下圈圈
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body1,10752,120,1,8,8, EEffectLightTracer.Stand, target.nowPos.x+4, target.nowPos.y+134-36-59,50, true, 0);
    self.step = 3;              
  elseif self.step == 3 then 
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky2].orderCount == 6 then      
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky3, 10016, 45, 1,15, 15, EEffectLightTracer.StandAni, target.nowPos.x-12, target.nowPos.y+60-16, 30, false, 25);
      self.step = 4;
    end
  elseif self.step == 4 then 
    if FightField.attack[self.humIdx]:CheckLightIsEnd(EEffectLightKind.Sky2)then      
      self.isLightEnd = true;
      self.step = 5
    end
  end
end

--狀態顯示
MagicProtectMe = InheritsFromBaseStatus();

function MagicProtectMe:ExtraClose()
  FightField.RestoreFightInfo(self.humIdx,0);
end

function MagicProtectMe:Update()
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then 
    newPos = me:GetChipPos();
    me:GetStatus(self.statusKind):SetLight(EEffectLightKind.Ground, 10752, 120, 1,8, 8, EEffectLightTracer.Stand,  newPos.x+4, newPos.y-38, 20, true, 80);        
        
    FightField.StatusBkUPFightInfo(self.humIdx);
    self.step = 2;
  end
end