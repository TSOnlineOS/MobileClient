LionSnap = InheritsFromBaseAttackSkill();


function LionSnap:ExtraClose()
  if FightField.fightHum[self.humIdx] ~= nil and FightField.fightHum[self.humIdx].roleController ~= nil then 
    FightField.fightHum[self.humIdx].roleController.gameObject:SetActive(true);
  end
end

function LionSnap:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10548, 80, 1, 15, 15, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 30, true, 45);
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
    if FightField.attack[self.humIdx].lights[1].orderCount == 6 then
      me:PlaySound(target.colm, target.row);
      me.roleController.gameObject:SetActive(false);
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[1].orderCount == 14 then
      local newPos = target:GetAttackPos(EFightSpot.Front, 60);
      me:SetJump(newPos.x, newPos.y);
      if me.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground, 10589, 200, 1, 5, 6, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y, 255, false, 30, newPos.x, newPos.y, 0.36);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground, 10590, 200, 1, 5, 6, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y, 255, false, 50, newPos.x, newPos.y, 0.36);
      end
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[2].orderCount == 4 or me.arrive then
      local newPos = target:GetAttackPos(EFightSpot.Front, 60);
      me:PlaySound(target.colm, target.row, Attack_Hit);
      if me.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10586, 30, 1, 1, 1, EEffectLightTracer.Stand, newPos.x - 50, newPos.y, 40, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10586, 30, 1, 1, 1, EEffectLightTracer.Stand, newPos.x - 25, newPos.y, 40, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10586, 30, 1, 1, 1, EEffectLightTracer.Stand, newPos.x - 75, newPos.y, 40, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(8, EEffectLightDis.Sky, 10589, 100, 5, 5, 6, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, true, 30);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10587, 30, 1, 1, 1, EEffectLightTracer.Stand, newPos.x + 50, newPos.y + 50, 40, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10587, 30, 1, 1, 1, EEffectLightTracer.Stand, newPos.x + 25, newPos.y + 50, 40, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10587, 30, 1, 1, 1, EEffectLightTracer.Stand, newPos.x + 0, newPos.y + 50, 40, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10590, 100, 5, 5, 6, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, true, 50);
      end

      FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10000, 60, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 255, false, 0);
      FightField.isShake = true;
      self.interval = 0.5;
      self.step = 5;
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:StopLight(3);
      FightField.attack[self.humIdx]:StopLight(4);
      FightField.attack[self.humIdx]:StopLight(5);
      FightField.SetShake(false);
      if me.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(8, EEffectLightDis.Sky, 10589, 200, 5, 6, 6, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 255, true, 30);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10590, 200, 5, 6, 6, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 255, true, 50);
      end

       FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10588, 50, 1, 7, 7, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 40, true, 85);
       self.interval = 0.1;
       self.step = 6;
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
  elseif self.step == 6 then
    if self:CheckInterval() then 
      target.roleController:Hit();
      target:SetSpeed(0.16);
      if not target:IsInSealStatus() then
        local newPos;
        if Contains(target.colm, 0, 3) then
          newPos = target:GetSpot(EFightSpot.Back, 60);
        else
          newPos = target:GetSpot(EFightSpot.Front, 60);
        end
        target:SetJump(newPos.x, newPos.y, true);
      end

       self.interval = 0.3;
       self.step = 7;
    end
  elseif self.step == 7 then
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:StopLight(2);
      FightField.attack[self.humIdx]:StopLight(8);
      FightField.attack[self.humIdx]:StopLight(7);
      me:SetJump(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y, false)
      self.step = 8;
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
  elseif self.step == 8 then
    if me.arrive then
     self.isLightEnd = true;
     self.step = 9;
    end
  end
end