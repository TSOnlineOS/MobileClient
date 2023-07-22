YellowScarfAnger = InheritsFromBaseAttackSkill();

YellowScarfAnger.EIntervalKind = {
  FireArrive = 1,
  FireBlast = 2,
}

function YellowScarfAnger:InitExtraParameters()
  self.fireArriveInterval = 0;
  self.fireBlastInterval = 0;
  self.fire = {};         --火焰光影
  self.fireNumber = 0;    --目前火焰光影數量
  self.explode = {};      --爆炸光影
  self.explodeNumber = 0;    --目前爆炸光影數量
  self.newFirePos = Vector2.zero;        --最新火焰位置
  self.previousDistance = 0;      --先前火焰與目標的距離
  self.isArrive = false;
end

function YellowScarfAnger:ExtraClose()
  ClearLightTable(self.fire);
  ClearLightTable(self.explode);
end

function YellowScarfAnger.FindEmpty(light, max)    
  for i = 1, max- 1 do
    if light[i] == nil then
      return i;
    end
  end
  return max;
end

function YellowScarfAnger:GetNextFirePos()  
  local target = FightField.fightHum[self.tarIdx];
  --第一次火焰位置
  if self.newFirePos.x == 0 and self.newFirePos.y == 0 then  
    if Contains(target.colm, 1, 2) then
      self.previousDistance = 240
    else
      self.previousDistance = 300;
    end
    self.newFirePos = target:GetSpotOfRc(EFightSpot.Front, self.previousDistance);
    return self.newFirePos;    
  end
  --已到目標
  if Contains(target.colm,0,3) then  
    if self.previousDistance <= 30 then
      return self.newFirePos;  
    end  
  else  
    if self.previousDistance <= -30 then
      return self.newFirePos;  
    end
  end
  --下一次火焰位置
  self.previousDistance = self.previousDistance - 15;
  if self.previousDistance <= 0 then
    self.newFirePos = target:GetSpotOfRc(EFightSpot.Back, math.abs(self.previousDistance))
  else
    self.newFirePos = target:GetSpotOfRc(EFightSpot.Front, self.previousDistance);
  end  
  return self.newFirePos;
end

function YellowScarfAnger:isAllLightEnd()  
  for i = 0, self.fireNumber - 1 do
    if self.fire[i] ~= nil then
      return false;
    end
  end

  for i = 0, self.explodeNumber - 1 do
    if self.explode[i] ~= nil then
      return false;
    end
  end
  return true;
end

function YellowScarfAnger:isFireArrive()
  local oldPos, newPos;
  
  if self.isArrive then  
    return true;
  end

  if self:CheckFireInterval(YellowScarfAnger.EIntervalKind.FireArrive) then 
    self.fireArriveInterval = 0.075;
    oldPos = self.newFirePos;
    newPos = self:GetNextFirePos();
    if oldPos.x == newPos.x and oldPos.y == newPos.y then  
      self.isArrive = true;
      return true;    
    end
  end
  return false;
end

function YellowScarfAnger:SetExplode(pos)
  local idx;
  local me = FightField.fightHum[self.humIdx];
  idx = YellowScarfAnger.FindEmpty(self.explode, self.explodeNumber);
  if idx == self.explodeNumber then  
    self.explodeNumber = self.explodeNumber + 1;    
  end
  
  local target = FightField.fightHum[self.tarIdx];

  if target.party_Kind == EFightParty.Left then
    self.explode[idx] = EffectLight.New(10453, 60, 6, 8, 10, EEffectLightTracer.StandAni, pos.x - 110, pos.y, 20, false, 55)
  else
    self.explode[idx] = EffectLight.New(10453, 60, 6, 8, 10, EEffectLightTracer.StandAni, pos.x + 130, pos.y, 20, false, 55)
  end          
  self.explode[idx]:SetTimeScale(FightField.timeScale);   
  self.explode[idx]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
  me:PlaySound(target.colm, target.row, Attack_Hit);  --播放音效 WB0023.wav
end

function YellowScarfAnger:SetFire(pos)  
  local idx, shiftX, shiftY;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  idx = YellowScarfAnger.FindEmpty(self.fire, self.fireNumber);
  if idx == self.fireNumber then
    self.fireNumber = self.fireNumber + 1;    
  end  
  shiftX = 30 + math.random(0,61);
  shiftY = 15 + math.random(0,31);
  if target.party_Kind == EFightParty.Left then
    self.fire[idx] = EffectLight.New(10734, 120, 1, 14, 14, EEffectLightTracer.StandAni, pos.x + 50 + shiftX, pos.y - 30 + shiftY, 20, false, 0);
  else
    self.fire[idx] = EffectLight.New(10735, 120, 1, 14, 14, EEffectLightTracer.StandAni, pos.x - 180 + shiftX, pos.y + shiftY, 20, false, 0);
  end
  self.fire[idx]:SetTimeScale(FightField.timeScale);   
  self.fire[idx]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
  me:PlaySound(target.colm, target.row, Attack_Start);  --播放音效 WB0023.wav
end

function YellowScarfAnger:UpdateFire()
  local pos = Vector2.zero;
  for i = 0, self.fireNumber - 1 do
    if self.fire[i] ~= nil then  
      if self.fire[i].orderCount == 7 then    
        pos.x = self.fire[i].showPos.x;
        pos.y = self.fire[i].showPos.y;
        self:SetExplode(pos);
      end

      if self.fire[i].picId == 0 then      
        table.remove(self.fire, i);
        self.fire[i] = nil;
      end
    end
  end

  for i = 0, self.explodeNumber - 1 do
    if self.explode[i] ~= nil then    
      if self.explode[i].picId == 0 then
        table.remove(self.explode, i);
        self.explode[i] = nil;
      end
    end
  end
end

function YellowScarfAnger:Update()
  self:UpdateFire();  

  local me = FightField.fightHum[self.humIdx];
  local attack = FightField.attack[self.humIdx];

  if self.step == 1 then     
    me.roleController:MagicAttack();      --做施法動作
    attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10733, 120, 1, 8, 8, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 40, false, 35);
    self:SetFire(self.newFirePos);

    self.fireBlastInterval = 0.1;
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
    if attack.lights[1].orderCount == 8 then           
      self.interval = 0.15;
      self.step = 3;    
    elseif self:isFireArrive() then        
      attack:StopLight(1);
      self.interval = 0.25;
      self.step = 3;        
    elseif self:CheckFireInterval(YellowScarfAnger.EIntervalKind.FireBlast) then        
      self.fireBlastInterval = 0.1;
      self:SetFire(self.newFirePos);
    end    
  elseif self.step == 3 then      
    if attack.lights[1].picId ~= 0 then
      if self:CheckInterval() then        
        attack:StopLight(1);
      end
    end

    if self:isFireArrive() then    --火焰已經到目的位置      
      self.interval = 0.35; 
      self.step = 4;        
    elseif self:CheckFireInterval(YellowScarfAnger.EIntervalKind.FireBlast) then --還沒到目的位置繼續設定火焰落下        
      self.fireBlastInterval = 0.1;
      self:SetFire(self.newFirePos);
    end
  elseif self.step == 4 then 
    local target;   
    if self:CheckInterval() then      
      for i = 0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        me:PlayEffect(target.colm, target.row, ERolePose.Hit); --放血
      end
      self.step = 5;    
    elseif self:CheckFireInterval(YellowScarfAnger.EIntervalKind.FireBlast) then      
      self.fireBlastInterval = 0.1;
      self:SetFire(self.newFirePos);      
    end
  elseif self.step == 5 then 
    if self:isAllLightEnd() then --所有的光影都結束了
      self.isLightEnd = true; --特技施展完畢
      self.step = 6;
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

function YellowScarfAnger:CheckFireInterval(kind)  
  if kind == YellowScarfAnger.EIntervalKind.FireArrive then 
    if self.fireArriveInterval >= 0 then
      self.fireArriveInterval = self.fireArriveInterval - CGTimer.deltaTime * FightField.timeScale;
      return false;
    end
    return  true;
  elseif kind == YellowScarfAnger.EIntervalKind.FireBlast then 
    if self.fireBlastInterval >= 0 then
      self.fireBlastInterval = self.fireBlastInterval - CGTimer.deltaTime * FightField.timeScale;
      return false;
    end
    return true;
  else
    return false;
  end 
end