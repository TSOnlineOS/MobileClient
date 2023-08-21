Landslip = InheritsFromBaseAttackSkill();

function Landslip:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground ,10080, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 6, me.nowPos.y, 20, true, 80);
    self.interval = 0.8;
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
    if self:CheckInterval() then 
      FightField.SetShake(true);
      me:PlaySound(target.colm, target.row, Attack_Start);

      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        FightField.attack[self.humIdx]:SetLightWithOrder(2 + i*self.emyNum, EEffectLightDis.Ground ,10259, 50, 1, 10, 10, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 255, false, 70);
        FightField.attack[self.humIdx]:SetLightWithOrder(3 + i*self.emyNum , EEffectLightDis.Sky ,10016, 70, 1, 15, 15, EEffectLightTracer.Stand, target.nowPos.x - 10, target.nowPos.y + 20, 35, false, 30);
      end
      
      self.interval = 0.8;
      self.step = 3;
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
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      FightField.SetShake(false);
      self.isLightEnd =true;
      self.step = 4;
    end
  end
end

LandslipMe = InheritsFromBaseStatus();

function LandslipMe:Update()
  if self.step == 1 then 
    local me = FightField.fightHum[self.humIdx];
    local newPos = me:GetChipPos();
    me.status[self.statusKind]:SetLight(EEffectLightKind.Ground, 10259, 50, 1, 10, 10, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, false, 70);
    me.status[self.statusKind]:SetLight(EEffectLightKind.Body1, 10016, 70, 1, 15, 15, EEffectLightTracer.Stand, newPos.x - 10, newPos.y, 35, true, 50);      
    self.step = 2;              
  end
end
