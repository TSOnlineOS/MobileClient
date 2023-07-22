IceCircularSaw = InheritsFromBaseAttackSkill();

function IceCircularSaw:Update()  
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then           
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    local picID = self:GetPicId(1);
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, picID, 40, 1, 32, 32, EEffectLightTracer.StandAni, me.nowPos.x + 7, me.nowPos.y, 20, true, 50);
    self.interval = 0.5;
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
      local picID = self:GetPicId(2, target.party_Kind);
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky ,picID, 30, 1, 10, 10, EEffectLightTracer.Stand, me.nowPos.x - 90, me.nowPos.y - 20, 255, true, 0);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky ,picID, 30, 1, 10, 10, EEffectLightTracer.Stand, me.nowPos.x + 80, me.nowPos.y + 50, 255, true, 0);
      end
      self.interval = 0.5;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then
      local picID = self:GetPicId(3, target.party_Kind);
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, picID, 30, 1, 10, 10, EEffectLightTracer.Stand, me.nowPos.x - 90, me.nowPos.y - 20, 255, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, picID, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - 90, me.nowPos.y - 20, 30, true, 0, me.nowPos.x - 150, me.nowPos.y, 0.1);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, picID, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - 90, me.nowPos.y - 20, 30, true, 0, me.nowPos.x - 200, me.nowPos.y + 30, 0.2);
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, picID, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - 90, me.nowPos.y - 20, 30, true, 0, me.nowPos.x - 30, me.nowPos.y - 40, 0.1);
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, picID, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - 90, me.nowPos.y - 20, 30, true, 0, me.nowPos.x + 20, me.nowPos.y - 70, 0.2);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, picID, 30, 1, 10, 10, EEffectLightTracer.Stand, me.nowPos.x + 80, me.nowPos.y + 50, 255, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, picID, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x + 80, me.nowPos.y + 50, 30, true, 0, me.nowPos.x - 20, me.nowPos.y + 110, 0.1);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, picID, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x + 80, me.nowPos.y + 50, 30, true, 0, me.nowPos.x - 100, me.nowPos.y + 140, 0.2);
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, picID, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x + 80, me.nowPos.y + 50, 30, true, 0, me.nowPos.x + 150, me.nowPos.y + 20, 0.1);
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, picID, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x + 80, me.nowPos.y + 50, 30, true, 0, me.nowPos.x + 200, me.nowPos.y - 10, 0.2);
      end
      self.step = 4;
     end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[6].isArrive then
      local picID = self:GetPicId(4, target.party_Kind);
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, picID, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - 90, me.nowPos.y - 20, 255, true, 0, target.nowPos.x, target.nowPos.y, 0.77);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, picID, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - 150, me.nowPos.y, 30, true, 0, target.nowPos.x, target.nowPos.y, 0.77);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, picID, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - 200, me.nowPos.y + 30, 30, true, 0, target.nowPos.x, target.nowPos.y, 0.77);
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, picID, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y - 40, 30, true, 0, target.nowPos.x, target.nowPos.y, 0.77);
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, picID, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x + 20, me.nowPos.y - 70, 30, true, 0, target.nowPos.x, target.nowPos.y, 0.77);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, picID, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x + 80, me.nowPos.y + 50, 255, true, 0, target.nowPos.x, target.nowPos.y, 0.77);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, picID, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - 20, me.nowPos.y + 110, 30, true, 0, target.nowPos.x, target.nowPos.y, 0.77);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, picID, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - 100, me.nowPos.y + 140, 30, true, 0, target.nowPos.x, target.nowPos.y, 0.77);
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, picID, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x + 150, me.nowPos.y + 20, 30, true, 0, target.nowPos.x, target.nowPos.y, 0.77);
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, picID, 30, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x + 200, me.nowPos.y - 10, 30, true, 0, target.nowPos.x, target.nowPos.y, 0.77);
      end
      me:PlaySound(target.colm, target.row, Attack_Start, 2);
      self.step = 5;
     end
  elseif self.step == 5 then
    if FightField.attack[self.humIdx].lights[2].isArrive then
      local picID = self:GetPicId(5, target.party_Kind);
      target.roleController:SetAnimationForceId(ERolePose.Hit);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3);
      for i = 0, 9 do
        FightField.attack[self.humIdx]:SetLightWithOrder(7 + i, EEffectLightDis.Body, picID, 100, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x + math.random(60) - math.random(60), target.nowPos.y - math.random(60), 20, true, 60);
      end

      me:PlaySound(target.colm, target.row, Attack_Start, 2);
      self.interval = 0.5;
      self.step = 6;
    end
  elseif self.step == 6 then 
    if self:CheckInterval() then 
      self.isLightEnd = true;
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

function IceCircularSaw:GetPicId(step, party)
  if party == nil then
    party = 0;
  end

  if self.showKind == ESkill_Kind.IceCircularSaw then
    if step == 1 then
      return 10070;
    elseif Contains(step, 2, 3, 4) then
      if party == EFightParty.Left then return 10307; else return 10306; end
    elseif step == 5 then
      return 10286;
    end
  elseif self.showKind == ESkill_Kind.RoshaMachete then
    if step == 1 then
      return 11008;
    elseif Contains(step, 2, 3, 4) then
      if party == EFightParty.Left then return 11009; else return 11010; end
    elseif step == 5 then
      return 11011;
    end
  end
end