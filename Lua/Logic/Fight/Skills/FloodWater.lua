FloodWater = InheritsFromBaseAttackSkill();

function FloodWater:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10070, 40, 1, 32, 32, EEffectLightTracer.StandAni, me.nowPos.x + 7, me.nowPos.y, 20, true, 50);
    self.interval = 1;
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
      local newPos;
      for i = 0, 4 do 
        if target.party_Kind == EFightParty.Left then
          newPos = target:RCtoSpot(target.colm, i, EFightSpot.Back, 30);
        else
          newPos = target:RCtoSpot(target.colm, i, EFightSpot.Front, 30);
        end

        FightField.attack[self.humIdx]:SetLightWithOrder(i + 2, EEffectLightDis.Ground ,10071, 150, 1, 5, 5, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 30);
      end
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[2].picId == 0 then
      me:PlaySound(target.colm, target.row);

      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);
        target.roleController:Hit();
        target:SetSpeed(0.16);
        
        local newPos = nil;
        if not target:IsInSealStatus() then
          if target.party_Kind == EFightParty.Left then
            newPos = target:GetSpot(EFightSpot.Front, 30);
          else
            newPos = target:GetSpot(EFightSpot.Back, 30);
          end
          
          target:SetJump(newPos.x, newPos.y, true);
        end
        self.step = 4;
      end
    end
  elseif self.step == 4 then
    if target.arrive then
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        target.roleController:SetIsDead(true);
      end
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
        self.step = 5;
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 6;
    end
  end
end

Flood = InheritsFromBaseAttackSkill();


function Flood:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10070, 40, 1, 32, 32, EEffectLightTracer.StandAni, me.nowPos.x + 7, me.nowPos.y, 20, true, 50);
    self.interval = 1;
    self.step = 2;
  elseif self.step == 2 then
    if self:CheckInterval() then 
      local posX = target.nowPos.x;
      local posY = target.nowPos.y - target.roleController.height + 45;
      me:PlaySound(target.colm, target.row);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1 ,10048, 40, 1, 4, 4, EEffectLightTracer.Stand, posX, posY, 255, true, 10);
      self.interval = 0.8;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 4;
    end
  end
end