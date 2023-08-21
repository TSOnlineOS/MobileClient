SoulCurse = InheritsFromBaseAttackSkill();

function SoulCurse:ExtraClose()
  FightField.SetRoleVisibleByID(38361, ERoleVisible.Visible);
  FightField.SetRoleVisibleByID(38362, ERoleVisible.Visible);
  FightField.SetRoleVisibleByID(38363, ERoleVisible.Visible);
end

function SoulCurse:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    if me.isTurtle == false then 
      me:SetMoment(newPos.x, newPos.y, false)    
      me.roleController:MagicAttack();
    else
      me.roleController:SetAnimationForceId(ERolePose.Attack);

      local handId = nil;      
      if Between(me.npcId, 38361, 38363)then 
        FightField.SetRoleVisibleByID(38361, ERoleVisible.Hide);      
        if me.npcId == 38363 then        
          handId = 38362;
        else      
          handId = 38363;
        end
      end

      FightField.SetRoleVisibleByID(handId, ERoleVisible.Hide);    
    end
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10077, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 90);
    FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10282, 50, 1, 10, 10, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 30, true, 80);

    self.interval = 0.6;
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
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10280, 30, 1, 38, 38, EEffectLightTracer.StandAni, me.nowPos.x - 30, me.nowPos.y, 255, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10309, 30, 1, 5, 5, EEffectLightTracer.StandAni, me.nowPos.x - 35, me.nowPos.y, 30, true, 190);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10279, 30, 1, 38, 38, EEffectLightTracer.StandAni, me.nowPos.x + 30, me.nowPos.y, 255, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky, 10309, 30, 1, 5, 5, EEffectLightTracer.StandAni, me.nowPos.x + 30, me.nowPos.y, 30, true, 190);
      end

      self.interval = 0.03;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then
      me:PlaySound(target.colm, target.row);
      if target.party_Kind == EFightParty.Left then
        for i = 0, 1 do 
          for m = 0, 4 do 
            local targetPos = FightField.chip[i][m];
            local index = i * 5 + m;
            FightField.attack[self.humIdx]:SetLightWithOrder(3 + index, EEffectLightDis.Sky, 10280, 30, 1, 38, 38, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y, 255, true, 0, targetPos.x - 30, targetPos.y, 0.3);
            FightField.attack[self.humIdx].lights[3 + index].totalTime = 0.5;
            FightField.attack[self.humIdx]:SetLightWithOrder(14 + index, EEffectLightDis.Sky, 10309, 30, 1, 5, 5, EEffectLightTracer.Line, me.nowPos.x - 35, me.nowPos.y, 30, true, 190, targetPos.x - 35, targetPos.y, 0.3);
            FightField.attack[self.humIdx].lights[14 + index].totalTime = 0.5;
          end          
        end
      else
        for i = 0, 1 do 
          for m = 0, 4 do 
            local targetPos = FightField.chip[i + 2][m];
            local index = i * 5 + m;
            FightField.attack[self.humIdx]:SetLightWithOrder(3 + index, EEffectLightDis.Sky, 10279, 30, 1, 38, 38, EEffectLightTracer.Line, me.nowPos.x + 30, me.nowPos.y, 255, true, 0, targetPos.x, targetPos.y, 0.3);
            FightField.attack[self.humIdx].lights[3 + index].totalTime = 0.5;
            FightField.attack[self.humIdx]:SetLightWithOrder(14 + index, EEffectLightDis.Sky, 10309, 30, 1, 5, 5, EEffectLightTracer.Line, me.nowPos.x + 30, me.nowPos.y, 30, true, 190, targetPos.x, targetPos.y, 0.3);
            FightField.attack[self.humIdx].lights[14 + index].totalTime = 0.5;
          end
        end
      end
      self.step = 4;
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
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[3].isArrive then
      for i = 0, 1 do 
        for m = 0, 4 do 
          local teamPos = 0;
          if target.party_Kind ~= EFightParty.Left then
            teamPos = 2;
          end
          local targetPos = FightField.chip[i + teamPos][m];
          local index = i * 5 + m;
          FightField.attack[self.humIdx]:SetLightWithOrder(3 + index, EEffectLightDis.Sky, 10369, 40, 9, 1, 9, EEffectLightTracer.StandAni, targetPos.x, targetPos.y, 30, false, 90);
        end
      end
      for k, v in pairs(self.emyIdxAy) do
        local target = FightField.fightHum[v];
        target.roleController:Hit();
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      end      
      if me.isTurtle then 
        me.roleController:SetIsJumping(true);
        me:SetJump(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y, false);
      end
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
        --local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      self.isLightEnd = true
      self.step = 6;
    end
  end
end

SoulCurseMe = InheritsFromBaseStatus();

function SoulCurseMe:ExtraClose()
  FightField.fightHum[self.humIdx].roleController:SetTextureColor(Color.White);  
  FightField.RestoreFightInfo(self.humIdx, 0);
end

function SoulCurseMe:Update()
  if self.step == 1 then     
    FightField.fightHum[self.humIdx].roleController:SetTextureColor(Color.Purple);
    self.step = 2;              
  end
end