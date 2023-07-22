WhirlWind = InheritsFromBaseAttackSkill();

function WhirlWind:Update()
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self.step == 1 then     
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();

    --風魔法陣
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground,10077,50,1,21,21, EEffectLightTracer.StandAni, me.nowPos.x+5, me.nowPos.y,20, true, 90);     --咒語
    self.interval = 0.8;
    self.step = 2
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
  elseif self.step == 2 then       
    if self:CheckInterval() then
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1,10017, 50,1,6,6, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 20, true, 15, target.nowPos.x, target.nowPos.y, 0.26);
      FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1]:SetRotate(0, -50, 35, 30);

      me:PlaySound(target.colm, target.row, Attack_Start);   
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
        local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  elseif self.step == 3 then 
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].isArrive then      
      self.isLightEnd = true;
      self.step = 4;        
    end
  end
end

--旋風在Ststus上的效果
WhirlWindMe = InheritsFromBaseStatus();

function WhirlWindMe:InitExtraParameters()
  self.tempShowY = 0;
  self.jumpOldTime = 0;
  self.jumpUp = false;  --跳的方向
end

function WhirlWindMe:ExtraClose()
  local me = FightField.fightHum[self.humIdx];
  me:SetBeh(EFightBeh.None);
  me.whirelStart = false;
  FightField.RestoreFightInfo(self.humIdx, 0);  
end

function WhirlWindMe:SetPosition()  
  local newPos;

  local me = FightField.fightHum[self.humIdx];
  newPos = Vector2.New(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y);  
  me:GetStatus(self.statusKind):SetLight(EEffectLightKind.Sky1,10017, 50,1,6,6, EEffectLightTracer.Stand, newPos.x,  newPos.y,20, true, 15);      --光柱
  self.tempShowY = newPos.y;    --因旋風會上下跳動,所以先暫存其ShowY

  self.jumpOldTime = CGTimer.time;
end

function WhirlWindMe:Update()
  --const
  local Dist=35;  
  local dy;

  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then     
    self:SetPosition();
    self.jumpUp = true;
    FightField.fightHum[self.humIdx].whirelStart = true;
    me.roleController:SetInBattle(false);    
    me:SetBeh(EFightBeh.Rotate);
        
    FightField.StatusBkUPFightInfo(self.humIdx);
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
      local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then      
    if (CGTimer.time - self.jumpOldTime) * 1000 * FightField.timeScale >= 60 then        
      dy = math.abs(me:GetStatus(EFightStatusKind.Seal).lights[EEffectLightKind.Sky1].showPos.y - self.tempShowY);
      if self.jumpUp then            
        dy = dy + 5;
        me:GetStatus(EFightStatusKind.Seal).lights[EEffectLightKind.Sky1].showPos.y = self.tempShowY-dy;
        if dy >= Dist then
          self.jumpUp = false;            
        end
      else      
        dy = dy - 5;          
        me:GetStatus(EFightStatusKind.Seal).lights[EEffectLightKind.Sky1].showPos.y = self.tempShowY-dy;              
        if dy<=0 then
          self.jumpUp = true;
        end
      end
      self.jumpOldTime = CGTimer.time;
    end
  end
end

WhirlWind3 = InheritsFromBaseAttackSkill();

function WhirlWind3:Update()
  local target;

  local me = FightField.fightHum[self.humIdx];
  target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10077, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 90);
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
      local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then 
    if self:CheckInterval() then 
      local newPos;
      for i = 0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        newPos = target:GetAttackPos(EFightSpot.Front, 240);
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1 + i ,10017, 50, 1, 6, 6, EEffectLightTracer.Line, newPos.x, newPos.y, 20, true, 15, target.nowPos.x, target.nowPos.y, 0.46);
      end
      me:PlaySound(target.colm, target.row, Attack_Start);
      self.interval = 1;
      self.step = 3;
    end
  elseif self.step == 3 then 
    if self:CheckInterval() then 
      self.isLightEnd = true;
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

WhirlWind6 = InheritsFromBaseAttackSkill();

function WhirlWind6:Update()
  local target;

  local me = FightField.fightHum[self.humIdx];
  target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10077, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 90);
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
      local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then
    if self:CheckInterval() then
      local newPos;
      for i = 0, self.emyNum-1 do
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        newPos = target:GetAttackPos(EFightSpot.Front, 240);
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1 + i ,10017, 50, 1, 6, 6, EEffectLightTracer.Line, newPos.x, newPos.y, 20, true, 15, target.nowPos.x, target.nowPos.y, 0.46);
        FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1 + i]:SetScale(Vector3.New( 1.5, 1.5, 1));
      end
      me:PlaySound(target.colm, target.row, Attack_Start);
      self.interval = 1;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then
      self.isLightEnd = true;
      self.step = 4;
    end
  end
end

WhirlWindParty = InheritsFromBaseAttackSkill();

function WhirlWindParty:InitDrawBlack()
  self.needDrawBlack = true;
end

function WhirlWindParty:Update()
  local target;
  local me = FightField.fightHum[self.humIdx];
  target = FightField.fightHum[self.tarIdx];
  local newPos;
  if self.step == 1 then
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10077, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 90);
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
      local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------

  elseif self.step ==2 then
    if self:CheckInterval() then
      for i = 0, self.emyNum-1 do
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        newPos = target:GetSpot(EFightSpot.Back, 10);--math.random(20, 30)
        FightField.attack[self.humIdx]:SetLightWithOrder(i * 3 + 3, EEffectLightKind.Sky1, 10310, 30, 1, 22, 22, EEffectLightTracer.StandAni,newPos.x+math.random(0, 20), newPos.y, 30 , true);
        FightField.attack[self.humIdx]:SetLightWithOrder(i * 3 + 4, EEffectLightKind.Sky1, 10310, 30, 1, 22, 22, EEffectLightTracer.StandAni,newPos.x+math.random(30, 50), newPos.y - math.random(10,25), 30 , true);
      end
      self.interval =0.8;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then
      for i = 0, self.emyNum-1 do
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        local fireworks = math.random(10311,10317);
        FightField.attack[self.humIdx]:SetLightWithOrder(i * 3 + 3, EEffectLightKind.Sky1, fireworks, 30, 2, 12, 11, EEffectLightTracer.StandAni,target.nowPos.x+math.random(0, 20), target.nowPos.y-80, 30 , true);
        fireworks = math.random(10311,10317);
        FightField.attack[self.humIdx]:SetLightWithOrder(i * 3 + 4, EEffectLightKind.Sky1, fireworks, 30, 2, 12, 11, EEffectLightTracer.StandAni,target.nowPos.x+math.random(30, 50), target.nowPos.y-90 , 30 , true);
      end
      self.interval =0.8;
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
        local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  elseif self.step == 4 then
    if self:CheckInterval() then
      local newPos;
      for i = 0, self.emyNum-1 do
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        newPos = target:GetAttackPos(EFightSpot.Front, 240);
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1 + i ,10017, 50, 1, 6, 6, EEffectLightTracer.Line, newPos.x, newPos.y, 20, true, 15, target.nowPos.x, target.nowPos.y, 0.46);
      end
      me:PlaySound(target.colm, target.row, Attack_Start);
      self.interval = 1;
      self.step = 5;
    end
  elseif self.step == 5 then
    if self:CheckInterval() then
      self.isLightEnd = true;
      self.step = 6;
    end
  end
end