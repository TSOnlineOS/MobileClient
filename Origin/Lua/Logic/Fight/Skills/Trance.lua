Trance = InheritsFromBaseAttackSkill();

function Trance:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  
  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);         
    me.roleController:MagicAttack();
    --030601J八卦魔法陣
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10079, 50, 1, 22, 22, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 30, false, 113);

    self.interval = 0.8;
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
      --local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then           
    if self:CheckInterval() then  
      local newPos = target:GetSpot(EFightSpot.Front, 50);
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10059, 80, 1, 16, 16, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, false, 0);
      else
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10060, 80, 1, 16, 16, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, false, 0);
      end

      self.step = 3;            
    end
  elseif self.step == 3 then      
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].orderCount == 12 then
      local newPos = target:GetSpot(EFightSpot.Front, 25);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10016, 60, 1, 15, 15, EEffectLightTracer.StandAni, newPos.x - 15, newPos.y, 30, false, 35);

      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      self.step = 4;                  
    end
  elseif self.step == 4 then      
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky2].picId == 0 then
      self.isLightEnd = true;
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
  end      
end

DisTrance = InheritsFromBaseAttackSkill();

function DisTrance:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  
  if self.step == 1 then  
    me.roleController:MagicAttack();
    --030601J八卦魔法陣
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10079, 50, 1, 22, 22, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 30, false, 113);

    self.interval = 0.8;
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
      --local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then           
    if self:CheckInterval() then  
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10132, 100, 1, 15, 15, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 40);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10036, 50, 1, 25, 25, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 10);
      self.step = 3;            
    end
  elseif self.step == 3 then      
    if FightField.attack[self.humIdx].lights[2].picId == 0 then
      self.isLightEnd = true;
      self.step = 4;             
    end
  end      
end

--狀態顯示
TranceMe = InheritsFromBaseStatus();

function TranceMe:ExtraClose()
  FightField.RestoreFightInfo(self.humIdx, 0);
end

function TranceMe:Update()
  if self.step == 1 then 
    local me = FightField.fightHum[self.humIdx];
    local posX = FightField.chip[me.colm][me.row].x;
    local posY = FightField.chip[me.colm][me.row].y;

    me.status[self.statusKind]:SetLight(EEffectLightKind.Body2, 10065, 100, 1, 7, 7, EEffectLightTracer.Stand, posX, posY, 20, true, 0);
    me.roleController:SetIsDead(true); 
    self.step = 2;              
  end
end

EW_CounterTranceMe = InheritsFromBaseStatus();

function EW_CounterTranceMe:ExtraClose()
  FightField.RestoreFightInfo(self.humIdx, 0);
end

function EW_CounterTranceMe:Update()
  local newPos;

  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then
    me:GetStatus(self.statusKind):SetLightWithOrder(2,EEffectLightDis.Sky, 10859, 180,1, 10, 10,EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y + 40 ,30, true, 0);
    me:GetStatus(self.statusKind).lights[2]:SetScale(Vector3.New(0.5, 0.5, 1));
    AudioManager.PlayOnce("AudioClip_WB0014",0);
    self.step = 2;
  elseif self.step == 2 then
    newPos = me:GetChipPos();
    me:GetStatus(self.statusKind):SetLightWithOrder(3, EEffectLightDis.Body2,10065, 100, 1, 7, 7, EEffectLightTracer.Stand, newPos.x, newPos.y, 20, true, 0);
    me.roleController:SetIsDead(true);

    --狀態備份
    FightField.StatusBkUPFightInfo(self.humIdx);
    self.step = 3;
  end
end