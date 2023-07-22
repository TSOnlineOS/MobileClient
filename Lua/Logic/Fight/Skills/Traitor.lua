Traitor = InheritsFromBaseAttackSkill();

function Traitor:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);         
    me.roleController:MagicAttack();
    --030601J八卦魔法陣
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10079, 50, 1, 22, 22, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 30, false, 113);

    self.interval = 0.8
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
      --local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    self.step = 2;
  elseif self.step == 2 then
    if self:CheckInterval() then 
      for k, v in pairs(self.emyIdxAy) do
        target = FightField.fightHum[v];
        FightField.attack[self.humIdx]:SetLightWithOrder(2 + k, EEffectLightDis.Body, 10125, 80, 1, 3, 3, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 255, false, 0);        
      end

      self.interval = 0.4;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      self.isLightEnd =true;
      self.step = 4;
    end
  end
end
