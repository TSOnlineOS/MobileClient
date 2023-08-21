Taunt = InheritsFromBaseAttackSkill();

function Taunt:InitExtraParameters()
  self.centerPos = nil;
  self.shakeCount = 30;
  self.shakeOriPos = {};
end

function Taunt:InitDrawBlack()
  self.needDrawBlack = true;     --需要背景塗黑在子類別中改寫為true
end

function Taunt:UpdateShake()
  if self:CheckInterval() then 
    local me = FightField.fightHum[self.humIdx];
    local pos = self.shakeOriPos[self.humIdx];
    me:SetMoment(pos.x + math.random(1, 50)/10, pos.y + math.random(1, 50)/10, false);

    for k, v in pairs(self.emyIdxAy)do
      local target = FightField.fightHum[v];
      if target.roleController:GetAttribute(EAttribute.Hp) > 0 then       
        pos = self.shakeOriPos[v];
        target:SetMoment(pos.x + math.random(1, 50)/10, pos.y + math.random(1, 50)/10, false);
      end
    end    
    self.shakeCount = self.shakeCount - 1;
    self.interval = 0.1;
    if self.shakeCount == 0 then 
      self.step = self.step +1;    
    end
  end
end

function Taunt:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local mePos = me:GetMagicPos();    
    me:SetMoment(mePos.x, mePos.y, false);
    local targetPos = target:GetMagicPos();
    local centerPos = FightField.GetSpotOfCutLine(mePos.x, mePos.y, targetPos.x, targetPos.y, 2, 3);
    mePos = me:GetSpotOfTar(centerPos.x, centerPos.y, 60);
    self.shakeOriPos[self.humIdx] = mePos;
    me:SetWalk(mePos.x, mePos.y, false);

    local biasPos = 0;
    for k, v in pairs(self.emyIdxAy) do      
      target = FightField.fightHum[v];
      if target.roleController:GetAttribute(EAttribute.Hp) > 0 then       
        targetPos = target:GetMagicPos();
        target:SetMoment(targetPos.x, targetPos.y, false);
        targetPos = target:GetSpotOfTar(centerPos.x, centerPos.y, 60 + biasPos * 30);
        target:SetWalk(targetPos.x, targetPos.y, false);
        self.shakeOriPos[v] = targetPos;
        biasPos = biasPos + 1;
      end
    end

    self.centerPos = centerPos;
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
    if me.arrive then 
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Body, 10301, 70, 1, 7, 7, EEffectLightTracer.Stand, self.centerPos.x, self.centerPos.y + 148, 30, true, 40);

      me.roleController:OneHandAttack();
      me.roleController:SetAnimationForceFrame(1) --鎖定動作
      for k, v in pairs(self.emyIdxAy)do
        target = FightField.fightHum[v];
        target.roleController:OneHandAttack();
        target.roleController:SetAnimationForceFrame(1) --鎖定動作
      end      

      me:PlaySound(target.colm, target.row);         
      self.interval = 0.1;
      self.step = 3;
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
  elseif self.step == 3 then 
    self:UpdateShake();
  elseif self.step == 4 then 
    self.isLightEnd = true;
  end  
end

--狀態顯示
TauntMe = InheritsFromBaseStatus();

function TauntMe:ExtraClose()  
  FightField.RestoreFightInfo(self.humIdx,0);
end

function TauntMe:Update()  
  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then     
    local newPos = me:GetChipPos();    
    me:GetStatus(self.statusKind):SetLight(EEffectLightKind.Body1, 11081, 100, 1, 4, 4, EEffectLightTracer.Stand, newPos.x, newPos.y -60, 30, true, 30);
    self.step = 2;
  end
end