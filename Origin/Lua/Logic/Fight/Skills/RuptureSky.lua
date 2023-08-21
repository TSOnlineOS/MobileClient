RuptureSky = InheritsFromBaseAttackSkill();

function RuptureSky:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetJump(newPos.x, newPos.y, false);
    me:SetSpeed(0.42);
    me:SetBeh(EFightBeh.Residual);
    me.roleController:SetIsJumping(true);
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
    if me.arrive then
      local newPos = target:GetAttackPos(EFightSpot.Front, 60);
      me:SetJump(newPos.x, newPos.y, false);
      me.roleController:SetIsJumping(true);
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10283, 100, 1, 2, 10, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 30, false, 25);
      self.step = 3;
    end
  elseif self.step == 3 then
    if me.arrive then
      me.roleController:SetIsJumping(false);
      me.roleController:OneHandAttack();
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10342, 50, 1, 10, 10, EEffectLightTracer.StandAni, 
                                                      target.nowPos.x + math.random(30) - 1, target.nowPos.y - math.random(30) + 1, 30, true, 60);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10342, 60, 1, 10, 10, EEffectLightTracer.StandAni, 
                                                      target.nowPos.x - math.random(30) + 1, target.nowPos.y + math.random(30) - 1, 30, true, 30);
      FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10349, 50, 1, 9, 9, EEffectLightTracer.StandAni, 
                                                      target.nowPos.x + math.random(30) - 1, target.nowPos.y - math.random(30) + 1, 30, true, 30);
      FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10349, 60, 1, 9, 9, EEffectLightTracer.StandAni, 
                                                      target.nowPos.x - math.random(30) + 1, target.nowPos.y + math.random(30) - 1, 30, true, 30);
      
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3);
      self.interval = 0.35;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3);
      me.roleController:OneHandAttack();
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10342, 60, 1, 10, 10, EEffectLightTracer.StandAni, 
                                                      target.nowPos.x + math.random(30) - 1, target.nowPos.y - math.random(30) + 1, 30, true, 30);
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10342, 30, 1, 10, 10, EEffectLightTracer.StandAni, 
                                                      target.nowPos.x - math.random(30) + 1, target.nowPos.y + math.random(30) - 1, 30, true, 60);
      FightField.attack[self.humIdx]:SetLightWithOrder(8, EEffectLightDis.Sky, 10349, 60, 1, 9, 9, EEffectLightTracer.StandAni, 
                                                      target.nowPos.x + math.random(30) - 1, target.nowPos.y - math.random(30) + 1, 30, true, 30);
      FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Sky, 10349, 50, 1, 9, 9, EEffectLightTracer.StandAni, 
                                                      target.nowPos.x - math.random(30) + 1, target.nowPos.y + math.random(30) - 1, 30, true, 30);
      
      self.interval = 0.6;
      self.step = 5;
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
  elseif self.step == 5 then
    if self:CheckInterval() then 
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3);
      me:SetBeh(EFightBeh.None);
      self.isLightEnd = true
      self.step = 6;
    end
  end
end