CrazyDragonSpell = InheritsFromBaseAttackSkill();

function CrazyDragonSpell:InitDrawBlack()
  self.needDrawBlack = true;     
end

function CrazyDragonSpell:InitExtraParameters()
  self.emyFlyAry = {};
  for i = 0, self.emyNum - 1 do
    self.emyFlyAry[i] = false;
  end
end

function CrazyDragonSpell:Update()
  local me = FightField.fightHum[self.humIdx]
  local target = FightField.fightHum[self.tarIdx]

  if self.step == 1 then
    me.roleController:MagicAttack()
    FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 20034, 200, 1, 2, 2, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y -10, 15, true, 60);    
    self.interval = 0.3
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
      local newPos = me:GetMagicPos()     
      if me.party_Kind == EFightParty.Left then        
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 20036, 180, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, false, 60);                 
        FightField.attack[self.humIdx].lights[1]:SetSize(361, 334)        
        self.step = 3
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 20042, 180, 1, 6, 6, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 60);         
        self.step = 4
      end      
    end    
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[1].picId == 0 then
      local newPos = me:GetMagicPos()            
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 20035, 150, 1, 3, 3, EEffectLightTracer.StandAni , newPos.x, newPos.y, 255, true, 60);   
      FightField.attack[self.humIdx].lights[1]:SetSize(361, 334)
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[1].picId == 0 then
      local newPos = me:GetMagicPos()
      if me.party_Kind == EFightParty.Left then  
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 20037, 150, 1, 4, 4, EEffectLightTracer.Stand, newPos.x +5 , newPos.y -5, 255, false, 60);   
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 20043, 150, 1, 3, 3, EEffectLightTracer.Stand, newPos.x -5, newPos.y -5, 255, false, 60);   
      end
      self.interval = 0.8;
      self.step = 5;
    end
  elseif self.step == 5 then    
    if self:CheckInterval() then 
      self.step = 6;
    end
  elseif self.step == 6 then
      self.step = 7;
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
  elseif self.step == 7 then
      local newPos = {};
      if target.party_Kind == EFightParty.Right then
        newPos.x = 211 - FightField.rectTransform.sizeDelta.x / 2;
        newPos.y = 342 - FightField.rectTransform.sizeDelta.y / 2;
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 20038, 150, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x + 39, newPos.y + 103, 255, true, 0);
      else
        newPos = target:RCtoSpot(1, 2, EFightSpot.Front, 100);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 20044, 150, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x + 106, newPos.y - 6, 255, true, 0);
      end
      me:PlaySound(target.colm, target.row, Attack_Start, 1);
      self.step = 8;
  elseif self.step == 8 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos = {};
      if target.party_Kind == EFightParty.Right then
        newPos.x = 211 - FightField.rectTransform.sizeDelta.x / 2;
        newPos.y = 342 - FightField.rectTransform.sizeDelta.y / 2;
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 20039, 150, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x + 78, newPos.y - 46, 255, true, 135);
      else
        newPos = target:RCtoSpot(1, 2, EFightSpot.Front, 100);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 20045, 150, 1, 3, 3, EEffectLightTracer.StandAni, newPos.x - 89, newPos.y - 40, 255, true, 0);
      end
      self.step = 9;
    end
  elseif self.step == 9 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      local newPos = {};
      if target.party_Kind == EFightParty.Right then
        newPos.x = 211 - FightField.rectTransform.sizeDelta.x / 2;
        newPos.y = 342 - FightField.rectTransform.sizeDelta.y / 2;
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 20040, 300, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x + 286, newPos.y + 135, 255, true, 88);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10020, 80, 1, 10, 10, EEffectLightTracer.Stand, 584 - FightField.rectTransform.sizeDelta.x / 2, 
                                                         418 - FightField.rectTransform.sizeDelta.y / 2, 30, true, 40);
      else
        newPos = target:RCtoSpot(1, 2, EFightSpot.Front, 100);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 20046, 300, 1, 3, 3, EEffectLightTracer.StandAni, newPos.x - 70, newPos.y - 42, 255, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10020, 80, 1, 10, 10, EEffectLightTracer.Stand, 254 - FightField.rectTransform.sizeDelta.x / 2, 
                                                         275 - FightField.rectTransform.sizeDelta.y / 2, 30, true, 40);
      end

      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        target.roleController:SetAnimationForceId(ERolePose.Hit);
        target:SetSpeed(0.15 + math.floor((math.random(36) - 1) / 100));
        target:SetBeh(EFightBeh.Rotate);
        target:SetWalk(target.nowPos.x, target.nowPos.y - 59 - math.random(15), false);  
      end
      self.step = 10;
    end
  elseif Contains(self.step, 10, 11, 12) then
    self:Show();
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      if self.step ~= 11 then
        me:PlaySound(target.colm, target.row, Attack_Start, 2);
      end
      local newPos = {};
      if target.party_Kind == EFightParty.Right then
        newPos.x = 211 - FightField.rectTransform.sizeDelta.x / 2;
        newPos.y = 342 - FightField.rectTransform.sizeDelta.y / 2;
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 20041, 250, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x + 320, newPos.y + 135, 255, true, 110);
      else
        newPos = target:RCtoSpot(1, 2, EFightSpot.Front, 100);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 20047, 250, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x - 70, newPos.y - 42, 255, true, 0);
      end
      self.step = self.step + 1;
    end
  elseif self.step == 13 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then      
      for k, v in pairs(self.emyIdxAy)do
        local target = FightField.fightHum[v];
        me:PlayEffect(target.colm, target.row, ERolePose.Hit)
      end
      self.isLightEnd =true;
      self.step = 14;
    end
  end
end

function CrazyDragonSpell:Show()
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