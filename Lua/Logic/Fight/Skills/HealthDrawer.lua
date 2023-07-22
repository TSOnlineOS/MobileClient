HealthDrawer = InheritsFromBaseAttackSkill();

function HealthDrawer:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    self:DoStep1Light();
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
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 2, EEffectLightDis.Sky ,10417, 80, 1, 8, 8, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 6, EEffectLightDis.Sky ,10406, 80, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 35);
      end
      self.interval = 0.8;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      self:DoStep3Light();
      self.interval = 0.8;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      me:PlaySound(target.colm, target.row, Attack_Start);
      self.step = 5;
    end
  elseif self.step == 5 then
    self.isLightEnd = true;
    self.step = 6;
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
  end
end

function HealthDrawer:DoStep1Light()
  local me = FightField.fightHum[self.humIdx];
  FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground ,10077, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 90);
end

function HealthDrawer:DoStep3Light()
  for i = 0, self.emyNum - 1 do
    local target = FightField.fightHum[self.emyIdxAy[i]];
    FightField.attack[self.humIdx]:SetLightWithOrder(i + 2, EEffectLightDis.Sky ,10369, 80, 9, 1, 9, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 100);
  end
end

EW_HealthDrawer = InheritsAttack(HealthDrawer);

function EW_HealthDrawer:InitDrawBlack()
  self.needDrawBlack = true;   
end

function EW_HealthDrawer:DoStep1Light()
  local me = FightField.fightHum[self.humIdx];
  FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground ,10077, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 90);
  FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground ,10103, 150, 1, 10, 10, EEffectLightTracer.Stand, me.nowPos.x + 5, me.nowPos.y, 20, false, 90);
end

function EW_HealthDrawer:DoStep3Light()
  for i = 0, self.emyNum - 1 do
    local target = FightField.fightHum[self.emyIdxAy[i]];
    FightField.attack[self.humIdx]:SetLightWithOrder(i + 3, EEffectLightDis.Sky ,10369, 80, 9, 1, 9, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 100);
    FightField.attack[self.humIdx]:SetLightWithOrder(i + 8, EEffectLightDis.Sky ,10055, 50, 1, 21, 21, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 35);
  end
end

HealthDrawerMe = InheritsFromBaseStatus();

function HealthDrawerMe:ExtraClose()
  FightField.RestoreFightInfo(self.humIdx, 0);
end

function HealthDrawerMe:Update()
  if self.step == 1 then 
    local me = FightField.fightHum[self.humIdx];
    local newPos = me:GetChipPos();

    if me.party_Kind == EFightParty.Right then
      me.status[self.statusKind]:SetLight(EEffectLightKind.Ground, 10279, 60, 10, 38, 38, EEffectLightTracer.Stand, newPos.x - 15, newPos.y, 255, true, 5);
    else
      me.status[self.statusKind]:SetLight(EEffectLightKind.Body1, 10280, 60, 10, 38, 38, EEffectLightTracer.Stand, newPos.x + 30, newPos.y, 255, true, 15);
    end    
    self.step = 2;              
  end
end