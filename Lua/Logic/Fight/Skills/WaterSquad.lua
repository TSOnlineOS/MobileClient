WaterSquad = InheritsFromBaseAttackSkill();

function WaterSquad:InitExtraParameters()
  self.lightCount = 0;
  self.lightWater = {};
  self.lightStep = {};
end

function WaterSquad:UpdateWater()
  for k, v in pairs(self.lightWater)do 
    self:UpdateLight(k);
  end
end

function WaterSquad:UpdateLight(idx)
  local lightStep = self.lightStep[idx];
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.emyIdxAy[self.lightWater[idx]]];
  if  lightStep == 1 then 
    me:PlaySound(target.colm, target.row);
    me:PlayEffect(target.colm, target.row, ERolePose.hit, 4);
 
    if not target:IsInSealStatus() then
      target:SetWalk(target.nowPos.x, target.nowPos.y - 118, false);
    end

    FightField.attack[self.humIdx]:SetLightWithOrder(1 + idx, EEffectLightKind.Sky1 ,10046, 80, 1, 13, 13, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30);
    self.lightStep[idx] = 2;
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
  elseif lightStep == 2 then
    if target.arrive then
      target:SetSpeed(0.12);
      if not target:IsInSealStatus() then
        target:SetJump(target.nowPos.x + 20, target.nowPos.y);
      end

      me:PlayEffect(target.colm, target.row, ERolePose.hit, 4);
      self.lightStep[idx] = 3;
    end
  elseif lightStep == 3 then
    if target.arrive then
      if not target:IsInSealStatus() then
        target:SetJump(target.nowPos.x - 20, target.nowPos.y);
      end
      me:PlayEffect(target.colm, target.row, ERolePose.hit, 4);
      self.lightStep[idx] = 4;
    end
  elseif lightStep == 4 then
    if target.arrive then
      if not target:IsInSealStatus() then
        target:SetJump(target.nowPos.x - 20, target.nowPos.y);
      end
      me:PlayEffect(target.colm, target.row, ERolePose.hit, 4);
      self.lightStep[idx] = 5;
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
  elseif lightStep == 5 then
    if target.arrive then
      if not target:IsInSealStatus() then
        target:SetJump(target.nowPos.x + 20, target.nowPos.y);
      end

      self.lightStep[idx] = 6;
    end
  elseif lightStep == 6 then
    if target.arrive then
      me.roleController:SetIsJumping(true);
      me:SetJump(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y, false);

      target:SetBeh(EFightBeh.Quake);

      if not target:IsInSealStatus() then
        target:SetWalk(target.nowPos.x, target.nowPos.y);
      end

      target:SetSpeed(0.72);
      self.lightStep[idx] = 7;
    end
  elseif lightStep == 7 then
    if FightField.attack[self.humIdx].lights[1 + idx].picId == 0 then
      local newPos = target:GetChipPos();
      target:SetMoment(newPos.x, newPos.y, false);
      target:SetBeh(EFightBeh.None);
      self.lightStep[idx] = 8;
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
  end
end

function WaterSquad:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10070, 40, 1, 32, 32, EEffectLightTracer.StandAni, me.nowPos.x + 7, me.nowPos.y, 20, true, 50);
    self.interval = 1;
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
    self.step = 2;
  elseif self.step == 2 then
    self:UpdateWater();
    if self:CheckInterval() then      
      if self.lightCount < self.emyNum then 
        self.lightCount = self.lightCount + 1;
        self.lightWater[self.lightCount] = self.lightCount - 1;        
        self.lightStep[self.lightCount] = 1;   
        self.interval = 0.25;     
      else
        self.step = 3;
      end
    end
  elseif self.step == 3 then
    self:UpdateWater();
    if self.lightStep[self.emyNum] == 8 then 
      self.isLightEnd =true;
      self.step = 4;
    end 
  end
end
