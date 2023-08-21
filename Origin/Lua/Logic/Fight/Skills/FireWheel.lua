FireWheel = InheritsFromBaseAttackSkill();

function FireWheel:InitExtraParameters()
  self.ranPos = {};
end

function FireWheel:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10078, 50, 1, 20, 20, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 80);
    if target.party_Kind == EFightParty.Left then
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10087, 100, 1, 2, 2, EEffectLightTracer.Stand, me.nowPos.x - 30, me.nowPos.y - 40, 255, true, 0);
    else
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10087, 100, 1, 2, 2, EEffectLightTracer.Stand, me.nowPos.x + 30, me.nowPos.y + 20, 255, true, 0);
    end

    FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10087, 100, 1, 2, 2, EEffectLightTracer.Stand, me.nowPos.x + 40, me.nowPos.y - 40, 255, true, 0);
    FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10087, 100, 1, 2, 2, EEffectLightTracer.Stand, me.nowPos.x - 40, me.nowPos.y + 40, 255, true, 0);

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
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10089, 100, 1, 5, 5, EEffectLightTracer.Stand, me.nowPos.x - 30, me.nowPos.y - 40, 30, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10089, 100, 1, 5, 5, EEffectLightTracer.Stand, me.nowPos.x + 40, me.nowPos.y - 40, 30, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10089, 100, 1, 5, 5, EEffectLightTracer.Stand, me.nowPos.x - 40, me.nowPos.y + 40, 30, true, 0);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10088, 100, 1, 5, 5, EEffectLightTracer.Stand, me.nowPos.x + 30, me.nowPos.y + 20, 30, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10088, 100, 1, 5, 5, EEffectLightTracer.Stand, me.nowPos.x + 40, me.nowPos.y - 40, 30, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10088, 100, 1, 5, 5, EEffectLightTracer.Stand, me.nowPos.x - 40, me.nowPos.y + 40, 30, true, 0);
      end

      for i = 1, 3 do
        self.ranPos[i] = {};
        self.ranPos[i].x = math.random(40) - 1 - 20;
        self.ranPos[i].y = 20 + math.random(40) - 1 - 20;
      end
      self.interval = 0.2;
      self.step = 3;
    end
  elseif self.step == 3 then       
    if self:CheckInterval() then 
      local posX = target.nowPos.x + self.ranPos[1].x;
      local posY = target.nowPos.y + self.ranPos[1].y;
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10087, 50, 1, 2, 2, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y - 40, 255, true, 0, posX, posY, 0.76);
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10089, 50, 1, 5, 5, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y - 40, 30, true, 0, posX, posY, 0.76);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10087, 50, 1, 2, 2, EEffectLightTracer.Line, me.nowPos.x + 30, me.nowPos.y + 20, 255, true, 0, posX, posY, 0.76);
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10088, 50, 1, 5, 5, EEffectLightTracer.Line, me.nowPos.x + 30, me.nowPos.y + 20, 30, true, 0, posX, posY, 0.76);
      end
      self.interval = 0.1;
      self.step = 4;
    end
  elseif self.step == 4 then        
    if self:CheckInterval() then 
      local posX = target.nowPos.x + self.ranPos[2].x;
      local posY = target.nowPos.y + self.ranPos[2].y;
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10087, 50, 1, 2, 2, EEffectLightTracer.Line, me.nowPos.x + 40, me.nowPos.y - 40, 255, true, 0, posX, posY, 0.76);
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10089, 50, 1, 5, 5, EEffectLightTracer.Line, me.nowPos.x - 40, me.nowPos.y - 40, 30, true, 0, posX, posY, 0.76);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10088, 50, 1, 5, 5, EEffectLightTracer.Line, me.nowPos.x - 40, me.nowPos.y + 20, 30, true, 0, posX, posY, 0.76);
      end
      self.interval = 0.1;
      self.step = 5;
    end
  elseif self.step == 5 then        
    if self:CheckInterval() then 
      local posX = target.nowPos.x + self.ranPos[3].x;
      local posY = target.nowPos.y + self.ranPos[3].y;
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10087, 50, 1, 2, 2, EEffectLightTracer.Line, me.nowPos.x - 40, me.nowPos.y + 40, 255, true, 0, posX, posY, 0.76);
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10089, 50, 1, 5, 5, EEffectLightTracer.Line, me.nowPos.x - 40, me.nowPos.y - 40, 30, true, 0, posX, posY, 0.76);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10088, 50, 1, 5, 5, EEffectLightTracer.Line, me.nowPos.x - 40, me.nowPos.y + 20, 30, true, 0, posX, posY, 0.76);
      end
      self.step = 6;
    end
  elseif self.step == 6 then      
    if FightField.attack[self.humIdx].lights[2].isArrive then
      local posX = target.nowPos.x + self.ranPos[1].x;
      local posY = target.nowPos.y + self.ranPos[1].y;
      me:PlaySound(target.colm, target.row);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10104, 50, 1, 10, 10, EEffectLightTracer.StandAni, posX, posY, 30, true, 0);
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
  elseif self.step == 7 then      
    if FightField.attack[self.humIdx].lights[3].isArrive then
      local posX = target.nowPos.x + self.ranPos[2].x;
      local posY = target.nowPos.y + self.ranPos[2].y;
      me:PlaySound(target.colm, target.row);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10104, 50, 1, 10, 10, EEffectLightTracer.StandAni, posX, posY, 30, true, 0);
      self.step = 8;
    end
  elseif self.step == 8 then     
    if FightField.attack[self.humIdx].lights[4].isArrive then
      local posX = target.nowPos.x + self.ranPos[3].x;
      local posY = target.nowPos.y + self.ranPos[3].y;
      me:PlaySound(target.colm, target.row);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10104, 50, 1, 10, 10, EEffectLightTracer.StandAni, posX, posY, 30, true, 0);
      self.step = 9;
    end
  elseif self.step == 9 then     
    if FightField.attack[self.humIdx].lights[4].picId == 0 then
      self.isLightEnd = true;
      self.step = 10;
    end
  end
end