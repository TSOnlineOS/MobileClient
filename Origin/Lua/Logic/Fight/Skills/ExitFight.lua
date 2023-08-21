ExitFight = InheritsFromBaseAttackSkill();

function ExitFight:InitExtraParameters()
  FightField.fightHum[self.humIdx].blnExiting = true;
  self.aEffCount = 1;
end

function ExitFight:Free()
  local me = FightField.fightHum[self.humIdx];
  if me ~= nil then 
    me:SetStatus(EFightStatusKind.Seal, ESkill_Kind.Dis);   --還原封印
    me:SetStatus(EFightStatusKind.Vary, ESkill_Kind.Dis);   --還原變化
    me:SetStatus(EFightStatusKind.Faint, ESkill_Kind.Dis);  --還原衰弱
    me:SetStatus(EFightStatusKind.Spec, ESkill_Kind.Dis);   --還原特殊
    me:ExitFight();
  end

  FightField.RestoreFightInfo(self.humIdx, self.aEffCount);
end

function ExitFight:Update()
  local me = FightField.fightHum[self.humIdx];
  if me == nil then 
    logError(string.Concat("Exitfight me nil ", self.humIdx));
    self.isLightEnd = true;
    return;
  end
  if self.step == 1 then
    local newPos = me:GetSpotOfRc(EFightSpot.Back, 60);
    
    me.roleController:SetInBattle(false);
    me.roleController:SetIsMoving(true);
    me:SetSpeed(0.12);
    me:SetWalk(newPos.x, newPos.y);
    self.step = self.step + 1;
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
  elseif self.step == 2 then
    if me.arrive then
      self.step = self.step + 1;
      self.isLightEnd = true;
    end
  end
end