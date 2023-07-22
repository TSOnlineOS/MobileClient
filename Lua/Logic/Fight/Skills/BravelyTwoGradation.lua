BravelyTwoGradation = InheritsFromBaseAttackSkill();

function BravelyTwoGradation:InitExtraParameters()
  self.lightCount = 0;
  self.fire = {};
  self.isSetIce = false;
  self.isOther = false;
  local me = FightField.fightHum[self.humIdx];
  if me.npcId == 41067 then --轉生周泰
    self.picId_L = 10662;
    self.picId_R = 10663;
  elseif me.npcId == 41064 then --轉生太史慈
    self.picId_L = 10641;
    self.picId_R = 10640;
  elseif me.npcId == 45147 then --二轉太史慈
    self.picId_L = 10701;
    self.picId_R = 10700;
  else
    self.isOther = true;
  end
end

function BravelyTwoGradation:ExtraClose()
  if FightField.fightHum[self.humIdx] ~= nil and FightField.fightHum[self.humIdx].roleController ~= nil then 
    FightField.fightHum[self.humIdx].roleController.gameObject:SetActive(true);
  end
end

function BravelyTwoGradation:Update()
  if self.isOther then
    self:UpdateOtherNpc();
    return;
  end

  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    FightField.fightHum[self.humIdx].roleController.gameObject:SetActive(false);
    if me.party_Kind == EFightParty.Right then
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, self.picId_R, 100, 1, 7, 7, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 255, false, 55);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10638, 100, 1, 7, 7, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 30, false, 55);
    else
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, self.picId_L, 100, 1, 7, 7, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 255, false, 55);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10639, 100, 1, 7, 7, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 30, false, 55);
    end
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
  elseif self.step == 2 then
    if FightField.attack[self.humIdx].lights[2].orderCount == 6 then
      local newPos = {};
      local m = (me.nowPos.x - target.nowPos.x) / (me.nowPos.y - target.nowPos.y + 0.001);
      if me.party_Kind == EFightParty.Right then
        newPos.x = target.nowPos.x - 100;
        newPos.y = target.nowPos.y - math.round(100 / m + 0.001);
       else
        newPos.x = target.nowPos.x + 100;
        newPos.y = target.nowPos.y + math.round(100 / m + 0.001);
      end

      me:SetWalk(newPos.x, newPos.y);
      if me.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, self.picId_R, 100, 7, 7, 7, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 255, false, 55, newPos.x, newPos.y, 0.4);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10638, 100, 7, 7, 7, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 30, false, 55, newPos.x, newPos.y, 0.4);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, self.picId_L, 100, 7, 7, 7, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 255, false, 55, newPos.x, newPos.y, 0.4);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10639, 100, 7, 7, 7, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 30, false, 55, newPos.x, newPos.y, 0.4);
      end
      FightField.attack[self.humIdx].lights[1]:SetResidual(2, 50, 0);
      FightField.attack[self.humIdx].lights[2]:SetResidual(2, 50, 0);
      self.step = 3;
    end
  elseif self.step == 3 then
    if math.abs(me.nowPos.x - target.nowPos.x) <= 10 and math.abs(me.nowPos.y - target.nowPos.y) <= 10  then
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10642, 100, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x - 45, target.nowPos.y - 25, 40, true, 0);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Ground, 10642, 100, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x + 40, target.nowPos.y, 30, true, 23);
      self.step = 4;
    end
  elseif self.step == 4 then
    if me.arrive then
      me.roleController.gameObject:SetActive(true);
      me:SetMoment(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y, false);
      self.step = 5;
    end
  elseif self.step == 5 then
    if FightField.attack[self.humIdx].lights[4].orderCount == 4 then
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10409, 100, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 40, true, 55);
      FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10012, 60, 12, 1, 13, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 80);
      self.step = 6;
    end
   elseif self.step == 7 then
   if FightField.attack[self.humIdx].lights[5].orderCount == 10 then
      self.isLightEnd = true;
      self.step = 8;
   end
  end
end

function BravelyTwoGradation:UpdateOtherNpc()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = target:GetAttackPos(EFightSpot.Front, 60);
    me:SetJump(newPos.x, newPos.y);
    me.roleController:SetIsJumping(true);
    me:SetSpeed(0.72);
    self.step = 2;
  elseif self.step == 2 then
    if me.arrive then
      me.roleController:SetAnimationForceId(ERolePose.Special);
      me.roleController.animationFrame = 0;
      me.roleController:FaceTo(target.nowPos);
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10409, 100, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, me.nowPos.y, 40, true, 58);
      FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10012, 60, 12, 1, 13, EEffectLightTracer.StandAni, target.nowPos.x, me.nowPos.y, 40, true, 80);
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[5].orderCount == 10 then
      self.isLightEnd = true;
      self.step = 4;
    end
  end
end
