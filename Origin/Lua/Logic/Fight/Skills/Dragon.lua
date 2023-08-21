Dragon1 = InheritsFromBaseAttackSkill();

function Dragon1:InitExtraParameters()
  self.emyFlyAry = {};
  for i = 0, self.emyNum - 1 do
    self.emyFlyAry[i] = false;
  end
end

function Dragon1:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Ground, 10165, 100, 1, 10, 10, EEffectLightTracer.StandAni, me.nowPos.x + 10, me.nowPos.y, 15, true, 60);
    FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10170, 150, 1, 9, 9, EEffectLightTracer.StandAni, me.nowPos.x + 10, me.nowPos.y, 15, true, 60);
    self.step = 2;
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
    local newPos = {};
    if target.party_Kind == EFightParty.Right then
      newPos.x = 211 - FightField.rectTransform.sizeDelta.x / 2;
      newPos.y = 342 - FightField.rectTransform.sizeDelta.y / 2;
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10171, 150, 1, 5, 6, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, false, 100);
    else
      newPos = target:RCtoSpot(1, 1, EFightSpot.Front, 160)
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10171, 150, 1, 5, 6, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, false, 100);
    end
    self.step = 3;
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[1].orderCount == 3 then
      me:PlaySound(target.colm, target.row, Attack_Start, 1);
      local newPos = {};
      if target.party_Kind == EFightParty.Right then
        newPos.x = 211 - FightField.rectTransform.sizeDelta.x / 2;
        newPos.y = 342 - FightField.rectTransform.sizeDelta.y / 2;
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10027, 60, 24, 1, 24, EEffectLightTracer.StandAni, newPos.x, newPos.y, 25, true, 5);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10177, 150, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x + 34, newPos.y, 255, true, 0);
      else
        newPos = target:RCtoSpot(1, 1, EFightSpot.Front, 160);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10027, 60, 24, 1, 24, EEffectLightTracer.StandAni, newPos.x, newPos.y, 25, true, 5);
        newPos = target:RCtoSpot(1, 2, EFightSpot.Front, 100);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10201, 150, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x + 92, newPos.y - 8, 255, true, 0);
      end
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos = {};
      if target.party_Kind == EFightParty.Right then
        newPos.x = 211 - FightField.rectTransform.sizeDelta.x / 2;
        newPos.y = 342 - FightField.rectTransform.sizeDelta.y / 2;
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10178, 150, 1, 3, 3, EEffectLightTracer.StandAni, newPos.x + 169, newPos.y + 135, 255, true, 12);
      else
        newPos = target:RCtoSpot(1, 2, EFightSpot.Front, 100);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10202, 150, 1, 6, 6, EEffectLightTracer.StandAni, newPos.x + 45, newPos.y, 255, true, 80);
      end
      self.step = 5;
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
  elseif self.step == 5 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos = {};
      if target.party_Kind == EFightParty.Right then
        newPos.x = 211 - FightField.rectTransform.sizeDelta.x / 2;
        newPos.y = 342 - FightField.rectTransform.sizeDelta.y / 2;
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10179, 150, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x + 130, newPos.y + 135, 255, true, 26);
      else
        newPos = target:RCtoSpot(1, 2, EFightSpot.Front, 100);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10203, 150, 1, 3, 3, EEffectLightTracer.StandAni, newPos.x + 153, newPos.y, 255, true, 30);
      end
      self.step = 6;
    end
  elseif self.step == 6 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos = {};
      if target.party_Kind == EFightParty.Right then
        newPos.x = 211 - FightField.rectTransform.sizeDelta.x / 2;
        newPos.y = 342 - FightField.rectTransform.sizeDelta.y / 2;
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10180, 150, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x + 100, newPos.y - 13, 255, false, 135);
      else
        newPos = target:RCtoSpot(1, 2, EFightSpot.Front, 100);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10204, 150, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x + 148, newPos.y, 255, true, 41);
      end
      self.step = 7;
    end
  elseif self.step == 7 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos = {};
      if target.party_Kind == EFightParty.Right then
        newPos.x = 211 - FightField.rectTransform.sizeDelta.x / 2;
        newPos.y = 342 - FightField.rectTransform.sizeDelta.y / 2;
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10181, 150, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x + 39, newPos.y + 103, 255, true, 0);
      else
        newPos = target:RCtoSpot(1, 2, EFightSpot.Front, 100);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10205, 150, 1, 3, 3, EEffectLightTracer.StandAni, newPos.x + 106, newPos.y - 6, 255, true, 0);
      end
      self.step = 8;
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
  elseif self.step == 8 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos = {};
      if target.party_Kind == EFightParty.Right then
        newPos.x = 211 - FightField.rectTransform.sizeDelta.x / 2;
        newPos.y = 342 - FightField.rectTransform.sizeDelta.y / 2;
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10182, 150, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x + 78, newPos.y - 46, 255, true, 135);
      else
        newPos = target:RCtoSpot(1, 2, EFightSpot.Front, 100);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10206, 150, 1, 3, 3, EEffectLightTracer.StandAni, newPos.x - 89, newPos.y - 40, 255, true, 0);
      end
      self.step = 9;
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
  elseif self.step == 9 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos = {};
      if target.party_Kind == EFightParty.Right then
        newPos.x = 211 - FightField.rectTransform.sizeDelta.x / 2;
        newPos.y = 342 - FightField.rectTransform.sizeDelta.y / 2;
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10183, 300, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x + 286, newPos.y + 135, 255, true, 88);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10020, 80, 1, 10, 10, EEffectLightTracer.Stand, 584 - FightField.rectTransform.sizeDelta.x / 2, 
                                                         418 - FightField.rectTransform.sizeDelta.y / 2, 30, true, 40);
      else
        newPos = target:RCtoSpot(1, 2, EFightSpot.Front, 100);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10207, 300, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x - 70, newPos.y - 42, 255, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10020, 80, 1, 10, 10, EEffectLightTracer.Stand, 254 - FightField.rectTransform.sizeDelta.x / 2, 
                                                         275 - FightField.rectTransform.sizeDelta.y / 2, 30, true, 40);
      end

      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        target.roleController:SetAnimationForceId(ERolePose.Hit);
        target:SetSpeed(0.15 + math.floor((math.random(36) - 1) / 100));
        target:SetBeh(EFightBeh.Rotate);
        target:SetWalk(target.nowPos.x, target.nowPos.y - 59 - math.random(15), false);  
        --todo
        --target.isShade = false;
      end
      self.step = 10;
    end
  elseif Contains(self.step, 10, 11, 12) then
    self:Show();
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      if self.step ~= 11 then
        me:PlaySound(target.colm, target.row, Attack_Start, 1);
      end
      local newPos = {};
      if target.party_Kind == EFightParty.Right then
        newPos.x = 211 - FightField.rectTransform.sizeDelta.x / 2;
        newPos.y = 342 - FightField.rectTransform.sizeDelta.y / 2;
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10184, 250, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x + 320, newPos.y + 135, 255, true, 110);
      else
        newPos = target:RCtoSpot(1, 2, EFightSpot.Front, 100);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10207, 250, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x - 70, newPos.y - 42, 255, true, 0);
      end
      self.step = self.step + 1;
    end
  elseif self.step == 13 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      self.isLightEnd =true;
      self.step = 14;
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
end

function Dragon1:Show()
  local target;
  for i = 0, self.emyNum - 1 do
    target = FightField.fightHum[self.emyIdxAy[i]];
    if target.arrive then
      target:SetSpeed(0.15 + math.floor((math.random(36) - 1) / 100));
      if self.emyFlyAry[i] == false then
        target:SetWalk(target.nowPos.x, target.nowPos.y - 59 - math.random(15), false);  
      else
        target:SetWalk(target.nowPos.x, target.nowPos.y + 60, false);
      end
      self.emyFlyAry[i] = not self.emyFlyAry[i];
    end
  end
end

Dragon2 = InheritsFromBaseAttackSkill();

function Dragon2:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Ground, 10165, 100, 1, 10, 10, EEffectLightTracer.StandAni, me.nowPos.x + 10, me.nowPos.y, 15, true, 60);
    FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10170, 150, 1, 9, 9, EEffectLightTracer.StandAni, me.nowPos.x + 10, me.nowPos.y, 15, true, 60);
    self.step = 2;
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
    local newPos;
    if target.party_Kind == EFightParty.Right then
      newPos = target:RCtoSpot(3, target.row, EFightSpot.Front, 230);
    else
      newPos = target:RCtoSpot(0, target.row, EFightSpot.Front, 230);
    end
     FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10171, 150, 1, 4, 6, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, false, 100);
    self.step = 3;
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[1].orderCount == 3 then
      me:PlaySound(target.colm, target.row, Attack_Start, 1);
      local newPos;
      if target.party_Kind == EFightParty.Right then
        newPos = target:RCtoSpot(3, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10027, 60, 24, 1, 24, EEffectLightTracer.StandAni, newPos.x, newPos.y, 25, true, 5);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10193, 100, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x + 32, newPos.y - 91, 255, true, 80);
      else
        newPos = target:RCtoSpot(0, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10027, 60, 24, 1, 24, EEffectLightTracer.StandAni, newPos.x, newPos.y, 25, true, 5);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10215, 100, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x - 18, newPos.y - 8, 255, true, 0);
      end
      self.step = 4;
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
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos;
      if target.party_Kind == EFightParty.Right then
        newPos = target:RCtoSpot(3, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10195, 150, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x + 41, newPos.y - 16, 255, true, 80);
      else
        newPos = target:RCtoSpot(0, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10216, 100, 1, 6, 6, EEffectLightTracer.StandAni, newPos.x - 53, newPos.y - 16, 255, true, 80);
      end
      self.step = 5;
    end
  elseif self.step == 5 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos;
      if target.party_Kind == EFightParty.Right then
        newPos = target:RCtoSpot(3, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10195, 100, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x + 41, newPos.y + 35, 255, true, 80);
      else
        newPos = target:RCtoSpot(0, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10217, 100, 1, 3, 3, EEffectLightTracer.StandAni, newPos.x + 36, newPos.y - 59, 255, true, 80);
      end
      self.step = 6;
    end
  elseif self.step == 6 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos;
      if target.party_Kind == EFightParty.Right then
        newPos = target:RCtoSpot(3, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10196, 100, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x, newPos.y + 10, 255, true, 80);
      else
        newPos = target:RCtoSpot(0, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10218, 100, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x + 35, newPos.y - 53, 255, true, 80);
      end
      self.step = 7;
    end
  elseif self.step == 7 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos;
      if target.party_Kind == EFightParty.Right then
        newPos = target:RCtoSpot(3, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10197, 100, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x - 47, newPos.y, 255, true, 80);
      else
        newPos = target:RCtoSpot(0, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10219, 100, 1, 3, 3, EEffectLightTracer.StandAni, newPos.x + 2, newPos.y - 115, 255, true, 121);
      end
      self.step = 8;
    end
  elseif self.step == 8 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      me:PlaySound(target.colm, target.row, Attack_Start, 1);
      local newPos;
      if target.party_Kind == EFightParty.Right then
        newPos = target:RCtoSpot(3, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10198, 100, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 80);
      else
        newPos = target:RCtoSpot(0, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10220, 100, 1, 3, 3, EEffectLightTracer.StandAni, newPos.x - 148, newPos.y - 40, 255, true, 0);
      end
      self.step = 9;
    end
  elseif self.step == 9 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos;
      if target.party_Kind == EFightParty.Right then
        newPos = target:RCtoSpot(3, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10199, 100, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x + 165, newPos.y + 68, 255, true, 80);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10020, 80, 1, 10, 10, EEffectLightTracer.StandAni, newPos.x + 191, newPos.y + 114, 30, true, 0);
      else
        newPos = target:RCtoSpot(0, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10221, 100, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x - 139, newPos.y - 135, 255, true, 80);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10020, 80, 1, 10, 10, EEffectLightTracer.StandAni, newPos.x - 178, newPos.y - 54, 30, true, 0);
      end

      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        target.roleController:SetAnimationForceId(ERolePose.Hit);
        target:SetSpeed(0.15 + math.floor((math.random(36) - 1) / 100));
        target:SetBeh(EFightBeh.Rotate);
        target:SetWalk(target.nowPos.x, target.nowPos.y - 59 - math.random(15), false);  
        --todo
        --target.isShade = false;
      end
      self.step = 10;
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
  elseif Contains(self.step, 10, 11, 12) then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      if self.step ~= 11 then
        me:PlaySound(target.colm, target.row, Attack_Start, 1);
      end
      local newPos;
      if target.party_Kind == EFightParty.Right then
        newPos = target:RCtoSpot(3, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10200, 100, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x + 180, newPos.y + 74, 255, true, 80);
      else
        newPos = target:RCtoSpot(0, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10221, 100, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x - 139, newPos.y - 135, 255, true, 80);
      end
      self.step = self.step + 1;
    end
  elseif self.step == 13 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      self.isLightEnd =true;
      self.step = 14;
    end
  end
end

Dragon3 = InheritsFromBaseAttackSkill();

function Dragon3:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:MagicAttack();
    local magicPic = 10165;
    local magicLightPic = 10170;
    FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Ground, magicPic, 100, 1, 10, 10, EEffectLightTracer.StandAni, me.nowPos.x + 10, me.nowPos.y, 15, true, 60);
    FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, magicLightPic, 150, 1, 9, 9, EEffectLightTracer.StandAni, me.nowPos.x + 10, me.nowPos.y, 15, true, 60);
    self.step = 2;
  elseif self.step == 2 then
    local newPos = target:RCtoSpot(target.colm, target.row, EFightSpot.Front, 130);
    local fissurePic = 10171;
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, fissurePic, 150, 1, 3, 6, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, false, 100);
    self.step = 3;
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[1].orderCount == 1 then
      me:PlaySound(target.colm, target.row, Attack_Start, 1);
      local newPos = target:RCtoSpot(target.colm, target.row, EFightSpot.Front, 130);
      local summonPic = 10027;
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, summonPic, 60, 12, 1, 24, EEffectLightTracer.StandAni, newPos.x, newPos.y, 25, true, 5);

      if target.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10185, 100, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x + 18, newPos.y - 12, 255, true, 0);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10208, 100, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x - 9, newPos.y - 12, 255, true, 0);
      end
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos = target:RCtoSpot(target.colm, target.row, EFightSpot.Front, 130);

      if target.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10186, 100, 1, 3, 3, EEffectLightTracer.StandAni, newPos.x + 75, newPos.y - 20, 255, true, 74);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10209, 100, 1, 6, 6, EEffectLightTracer.StandAni, newPos.x - 30, newPos.y + 29, 255, true, 0);
      end
      self.step = 5;
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
  elseif self.step == 5 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      me:PlaySound(target.colm, target.row, Attack_Start, 1);
      local newPos = target:RCtoSpot(target.colm, target.row, EFightSpot.Front, 130);

      if target.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10187, 100, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x, newPos.y - 9, 255, true, 66);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10210, 100, 1, 3, 3, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 10);
      end
      self.step = 6;
    end
  elseif self.step == 6 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos = target:RCtoSpot(target.colm, target.row, EFightSpot.Front, 130);

      if target.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10188, 100, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 50);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10211, 100, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x - 6, newPos.y, 255, true, 15);
      end
      self.step = 7;
    end
  elseif self.step == 7 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos = target:RCtoSpot(target.colm, target.row, EFightSpot.Front, 130);

      if target.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10189, 100, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x - 28, newPos.y, 255, true, 40);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10212, 100, 1, 3, 3, EEffectLightTracer.StandAni, newPos.x - 29, newPos.y - 7, 255, true, 15);
      end
      self.step = 8;
    end
  elseif self.step == 8 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos = target:RCtoSpot(target.colm, target.row, EFightSpot.Front, 130);

      if target.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10190, 100, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 30);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10213, 100, 1, 3, 3, EEffectLightTracer.StandAni, newPos.x - 116, newPos.y - 113, 255, true, 80);
      end
      self.step = 9;
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
  elseif self.step == 9 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos = target:RCtoSpot(target.colm, target.row, EFightSpot.Front, 130);

      if target.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10191, 250, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x + 86, newPos.y, 255, true, 64);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10214, 250, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x - 106, newPos.y - 113, 255, true, 80);
      end
      local dragonAir = 10020;
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, dragonAir, 80, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y - 20, 30, true, 0);

      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        target.roleController:SetAnimationForceId(ERolePose.Hit);
        target:SetSpeed(0.15 + math.floor((math.random(36) - 1) / 100));
        target:SetBeh(EFightBeh.Rotate);
        target:SetWalk(target.nowPos.x, target.nowPos.y - 59 - math.random(15), false);
        --todo
        --target.isShade = false;
      end
      self.step = 10;
    end
  elseif Contains(self.step, 10, 11, 12) then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      if self.step ~= 11 then
        me:PlaySound(target.colm, target.row, Attack_Start, 1);
      end

      local newPos;
      if target.party_Kind == EFightParty.Right then
        newPos = target:RCtoSpot(3, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10192, 200, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x + 94, newPos.y, 255, true, 67);
      else
        newPos = target:RCtoSpot(0, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10214, 200, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x - 106, newPos.y - 113, 255, true, 80);
      end
      self.step = self.step + 1;
    end
  elseif self.step == 13 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      self.isLightEnd =true;
      self.step = 14;
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
end

LightDragon = InheritsFromBaseAttackSkill();

function LightDragon:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:MagicAttack();
    local magicPic = 11042;
    local magicLightPic = 11043;
    FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Ground, magicPic, 100, 1, 10, 10, EEffectLightTracer.StandAni, me.nowPos.x + 10, me.nowPos.y, 15, true, 60);
    FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, magicLightPic, 150, 1, 9, 9, EEffectLightTracer.StandAni, me.nowPos.x + 10, me.nowPos.y, 15, true, 60);
    self.step = 2;
  elseif self.step == 2 then
    local newPos = target:RCtoSpot(target.colm, target.row, EFightSpot.Front, 130);
    local fissurePic = 11044;
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, fissurePic, 150, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, false, 100);
    self.step = 3;
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[1].orderCount == 1 then
      me:PlaySound(target.colm, target.row, Attack_Start, 1);
      local newPos = target:RCtoSpot(target.colm, target.row, EFightSpot.Front, 130);
      local summonPic = 11045;
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, summonPic, 60, 12, 1, 24, EEffectLightTracer.StandAni, newPos.x, newPos.y, 25, true, 5);

      if target.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11046, 100, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x + 18, newPos.y - 12, 255, true, 0);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11047, 100, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x - 9, newPos.y - 12, 255, true, 0);
      end
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos = target:RCtoSpot(target.colm, target.row, EFightSpot.Front, 130);
      if target.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11048, 100, 1, 3, 3, EEffectLightTracer.StandAni, newPos.x + 75, newPos.y - 20, 255, true, 74);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11049, 100, 1, 6, 6, EEffectLightTracer.StandAni, newPos.x - 30, newPos.y + 29, 255, true, 0);
      end
      self.step = 5;
    end
  elseif self.step == 5 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      me:PlaySound(target.colm, target.row, Attack_Start, 1);
      local newPos = target:RCtoSpot(target.colm, target.row, EFightSpot.Front, 130);
      if target.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11050, 100, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x, newPos.y - 9, 255, true, 66);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11051, 100, 1, 3, 3, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 10);
      end
      self.step = 6;
    end
  elseif self.step == 6 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos = target:RCtoSpot(target.colm, target.row, EFightSpot.Front, 130);
      if target.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11052, 100, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 50);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11053, 100, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x - 6, newPos.y, 255, true, 15);
      end
      self.step = 7;
    end
  elseif self.step == 7 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos = target:RCtoSpot(target.colm, target.row, EFightSpot.Front, 130);
      if target.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11054, 100, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x - 28, newPos.y, 255, true, 40);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11055, 100, 1, 3, 3, EEffectLightTracer.StandAni, newPos.x - 29, newPos.y - 7, 255, true, 15);
      end
      self.step = 8;
    end
  elseif self.step == 8 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos = target:RCtoSpot(target.colm, target.row, EFightSpot.Front, 130);
      if target.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11056, 100, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 30);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11057, 100, 1, 3, 3, EEffectLightTracer.StandAni, newPos.x - 116, newPos.y - 113, 255, true, 80);
      end
      self.step = 9;
    end
  elseif self.step == 9 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos = target:RCtoSpot(target.colm, target.row, EFightSpot.Front, 130);
      if target.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11058, 250, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x + 86, newPos.y, 255, true, 64);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11060, 250, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x - 106, newPos.y - 113, 255, true, 80);
      end
      local dragonAir = 11059;
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, dragonAir, 80, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y - 20, 30, true, 0);

      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        target.roleController:SetAnimationForceId(ERolePose.Hit);
        target:SetSpeed(0.15 + math.floor((math.random(36) - 1) / 100));
        target:SetBeh(EFightBeh.Rotate);
        target:SetWalk(target.nowPos.x, target.nowPos.y - 59 - math.random(15), false);
        --todo
        --target.isShade = false;
      end
      self.step = 10;
    end
  elseif Contains(self.step, 10, 11, 12) then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      if self.step ~= 11 then
        me:PlaySound(target.colm, target.row, Attack_Start, 1);
      end
      local newPos;
      if target.party_Kind == EFightParty.Right then
        newPos = target:RCtoSpot(3, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11061, 200, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x + 94, newPos.y, 255, true, 67);
      else
        newPos = target:RCtoSpot(0, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11060, 200, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x - 106, newPos.y - 113, 255, true, 80);
      end
      self.step = self.step + 1;
    end
  elseif self.step == 13 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      self.isLightEnd =true;
      self.step = 14;
    end
  end
end

DragonTransfer = InheritsFromBaseAttackSkill();

function DragonTransfer:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Ground, 10077, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 90);
    --FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10170, 150, 1, 9, 9, EEffectLightTracer.StandAni, me.nowPos.x + 10, me.nowPos.y, 15, true, 60);
    self.step = 2;
  elseif self.step == 2 then
    local newPos;
    if target.party_Kind == EFightParty.Right then
      newPos = target:RCtoSpot(3, target.row, EFightSpot.Front, 230);
    else
      newPos = target:RCtoSpot(0, target.row, EFightSpot.Front, 230);
    end
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 11044, 150, 1, 6, 6, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, false, 100);
    self.step = 3;
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[1].orderCount == 3 then
      me:PlaySound(target.colm, target.row, Attack_Start, 1);
      local newPos;
      if target.party_Kind == EFightParty.Right then
        newPos = target:RCtoSpot(3, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10027, 60, 24, 1, 24, EEffectLightTracer.StandAni, newPos.x, newPos.y, 25, true, 5);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11046, 100, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x + 32, newPos.y - 91, 255, true, 80);
      else
        newPos = target:RCtoSpot(0, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10027, 60, 24, 1, 24, EEffectLightTracer.StandAni, newPos.x, newPos.y, 25, true, 5);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11047, 100, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x - 18, newPos.y - 8, 255, true, 0);
      end
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos;
      if target.party_Kind == EFightParty.Right then
        newPos = target:RCtoSpot(3, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11048, 150, 1, 3, 3, EEffectLightTracer.StandAni, newPos.x + 41, newPos.y - 16, 255, true, 80);
      else
        newPos = target:RCtoSpot(0, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11049, 100, 1, 6, 6, EEffectLightTracer.StandAni, newPos.x - 53, newPos.y - 16, 255, true, 80);
      end
      self.step = 5;
    end
  elseif self.step == 5 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos;
      if target.party_Kind == EFightParty.Right then
        newPos = target:RCtoSpot(3, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11050, 100, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x + 41, newPos.y + 35, 255, true, 80);
      else
        newPos = target:RCtoSpot(0, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11051, 100, 1, 3, 3, EEffectLightTracer.StandAni, newPos.x + 36, newPos.y - 59, 255, true, 80);
      end
      self.step = 6;
    end
  elseif self.step == 6 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos;
      if target.party_Kind == EFightParty.Right then
        newPos = target:RCtoSpot(3, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11052, 100, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x, newPos.y + 10, 255, true, 80);
      else
        newPos = target:RCtoSpot(0, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11053, 100, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x + 35, newPos.y - 53, 255, true, 80);
      end
      self.step = 7;
    end
  elseif self.step == 7 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos;
      if target.party_Kind == EFightParty.Right then
        newPos = target:RCtoSpot(3, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11054, 100, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x - 47, newPos.y, 255, true, 80);
      else
        newPos = target:RCtoSpot(0, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11055, 100, 1, 3, 3, EEffectLightTracer.StandAni, newPos.x + 2, newPos.y - 115, 255, true, 121);
      end
      self.step = 8;
    end
  elseif self.step == 8 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      me:PlaySound(target.colm, target.row, Attack_Start, 1);
      local newPos;
      if target.party_Kind == EFightParty.Right then
        newPos = target:RCtoSpot(3, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11056, 100, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 80);
      else
        newPos = target:RCtoSpot(0, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11057, 100, 1, 3, 3, EEffectLightTracer.StandAni, newPos.x - 148, newPos.y - 40, 255, true, 0);
      end
      self.step = 9;
    end
  elseif self.step == 9 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos;
      if target.party_Kind == EFightParty.Right then
        --另一方向缺少一組圖
        newPos = target:RCtoSpot(3, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 11058, 100, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x + 165, newPos.y + 68, 255, true, 80);
        --FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10020, 80, 1, 10, 10, EEffectLightTracer.StandAni, newPos.x + 191, newPos.y + 114, 30, true, 0);
      end

      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        --newPos = target:RCtoSpot(3, target.row, EFightSpot.Front, 230);
        FightField.attack[self.humIdx]:SetLightWithOrder(5+i, EEffectLightDis.Sky, 11043, 80, 1, 9, 9, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 50, true, 0);
        FightField.attack[self.humIdx].lights[5+i]:SetSize(128, 128);
      end
      self.interval = 1;
      self.step = 10;
    end
  elseif self.step == 10 then
    --if self:CheckInterval() then
    if FightField.attack[self.humIdx].lights[5].picId == 0 then
      self.isLightEnd =true;
      self.step = 14;
    end
  end
end

DragonTransferMe = InheritsFromBaseStatus();

function DragonTransferMe:Update()
  local newPos;

  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then
    newPos = me:RCtoSpot(me.colm, me.row);
    local status = me:GetStatus(self.statusKind);
    if me.party_Kind == EFightParty.Left then
      status:SetLightWithOrder(1, EEffectLightDis.Sky, 11043, 80, 1, 9, 9, EEffectLightTracer.Stand, newPos.x, newPos.y,15, true, 0);
    elseif me.party_Kind == EFightParty.Right then
      status:SetLightWithOrder(1, EEffectLightDis.Sky, 11043, 80, 1, 9, 9, EEffectLightTracer.Stand, newPos.x, newPos.y,15, true, 0);
      --me:GetStatus(self.statusKind):SetLightWithOrder(1, EEffectLightDis.Sky, 10266, 100, 1, 11, 11, EEffectLightTracer.Stand, newPos.x, newPos.y, 30, true, 0);
    end
    self.step = 2;
  end
end