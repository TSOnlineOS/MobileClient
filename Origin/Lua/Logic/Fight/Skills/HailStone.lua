HailStone = InheritsFromBaseAttackSkill();

function HailStone:InitExtraParameters()
  self.iceStone = {};
  self.stoneInfo = {};
  self.smoke = {};
  self.corona = {};

  for i = 0, 5 do 
    self.iceStone[i] = nil;
    self.stoneInfo[i] = {};
  end
end

function HailStone:ExtraClose()
  for k,v in pairs(self.iceStone) do
    v:Free();
  end  
  table.Clear(self.iceStone);

  ClearLightTable(self.smoke);
  ClearLightTable(self.corona);
end

function HailStone:Update()
  self:UpdateLogic();
  self:Show();
end

function HailStone:UpdateLogic()  
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then           
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10070, 40, 1, 32, 32, EEffectLightTracer.Stand, me.nowPos.x + 7, me.nowPos.y, 20, true, 50);
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
      self:SetStone();
      self.step = 3;
    end
  elseif self.step == 3 then           
    if self:StoneAllFall() then 
      self:SetStone();
      self.step = 4;          
     end
  elseif self.step == 4 then           
    if self:StoneAllFall() then 
      self.step = 5;          
     end
  elseif self.step == 5 then 
    if self:isPlayOver() then 
      self.isLightEnd = true;
      self.step = 6;
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

function HailStone:Show()
  self:UpdateHitPose();
  self:ShowIceStone();
end

function HailStone:GetAttackIdx(count)
  local target = FightField.fightHum[self.tarIdx];
  if count == 1 then --自己          
    return target.index;              
  elseif count == 2 then --上      
    if target.row>0 then
      return FightField.GetFHumIdx(target.colm, target.row -1)      
    end
  elseif count == 3 then --下    
    if (target.row+1)<MaxChipRow then
      return FightField.GetFHumIdx(target.colm, target.row +1)      
    end
  elseif count == 4 then --左          
    if Contains(target.colm, 0, 1) then       
      if (target.colm-1)>=0 then
        return FightField.GetFHumIdx(target.colm -1, target.row);              
      end
    elseif Contains(target.colm, 2, 3) then           
      if (target.colm-1)>=MaxChipColm2 then
        return FightField.GetFHumIdx(target.colm -1, target.row);
      end
    end
  elseif count == 5 then --右
    if Contains(target.colm, 0, 1) then       
      if (target.colm+1)<MaxChipColm2 then
        return FightField.GetFHumIdx(target.colm +1, target.row);              
      end
    elseif Contains(target.colm, 2, 3) then           
      if (target.colm+1)<MaxChipColm then
        return FightField.GetFHumIdx(target.colm +1, target.row);
      end
    end
  end

  return -1; --找不到該點
end


function HailStone:GetFallPos(idx)  
  local newPos = Vector2.zero;
  local target = FightField.fightHum[self.tarIdx];
  if idx == 1 then
    newPos = target:GetChipPos()
  elseif Contains(idx, 2, 3) then     
    newPos = target:GetSpot(idx-1, FieldChipDistW);
  elseif Contains(idx, 4, 5) then 
    newPos = target:GetSpot(idx-1, FieldChipDistH);    
  end
  return newPos;
end

function HailStone:isPlayOver()  
  if self.step == 5 then  
    for i=1, 5 do
      --若還有一個沒有做完被挨的畫面,就不算結束
      if self.corona[i] ~= nil then 
        if self.corona[i].picId ~= 0 then        
          return false;          
        end
      end
    end
    return true;    
  end
  return false;
end

function HailStone:SetStone()
  --const
  local SlopeLeft = 1.32352;
  local SlopeRight = 1.42105;
  local IceDist = 300;        --冰在上空的距離

  local sinSita, cosSita;     --Width斜率的Sin和Cos
  local x, y, showPage;
  local fixed = Vector2.zero;
  local target = FightField.fightHum[self.tarIdx];
  local newPos = Vector2.zero;
  local dist = 0;

  if target.party_Kind == EFightParty.Left then     
    sinSita = 1/ math.sqrt(math.pow(SlopeLeft, 2)+1);
    cosSita = SlopeLeft / math.sqrt(math.pow(SlopeLeft, 2)+1);
    showPage = 2;
  elseif target.party_Kind == EFightParty.Right then       
    sinSita = 1/ math.sqrt(math.pow(SlopeRight, 2)+1);
    cosSita = SlopeRight / math.sqrt(math.pow(SlopeRight, 2)+1);
    showPage = 1;      
  else  --預設使用 Party_Left: 的設定      
    sinSita = 1/ math.sqrt(math.pow(SlopeLeft, 2)+1);
    cosSita = SlopeLeft / math.sqrt(math.pow(SlopeLeft, 2)+1);
    showPage = 2;
  end

  for i=1, 5 do  
    if i == 1 then      
      newPos = target:GetChipPos();      
    elseif Contains(i, 2, 3) then         
      newPos = target:GetSpot(i-1, FieldChipDistW);
    elseif Contains(i, 4, 5) then 
      newPos = target:GetSpot(i-1, FieldChipDistH);        
    end

    dist = IceDist + math.random(0, 60) + i*50;
    fixed.x = math.round(dist*sinSita);
    fixed.y = math.round(dist*cosSita);

    if target.party_Kind == EFightParty.Left then       
      x = newPos.x + fixed.x;
      y = newPos.y - fixed.y;
    elseif target.party_Kind == EFightParty.Right then                     
      x = newPos.x - fixed.x;
      y = newPos.y - fixed.y;
    else  --預設使用 Party_Left: 的設定
      x = newPos.x - fixed.x;
      y = newPos.y - fixed.y;
    end
    self.stoneInfo[i].isFall = false

    if self.iceStone[i] ~= nil then 
      self.iceStone[i]:Free();
      self.iceStone[i] = nil;
    end

    self.iceStone[i] = IceStone.New();
    self.iceStone[i]:SetPath(10042+ math.random(0,2), showPage, x, y+30, newPos.x, newPos.y+30, 0.36 + math.random(36)/100);
  end
end

function HailStone:StoneAllFall()
  local aimIdx;
  local newPos;

  for i=1, 5 do  
    if self.iceStone[i].arrive and self.stoneInfo[i].isFall == false then    
      self.stoneInfo[i].isFall = true;
      newPos = self:GetFallPos(i);

      self.smoke[i] = EffectLight.New(10045, 30, 14, 26, 26, EEffectLightTracer.StandAni, newPos.x, newPos.y, 30, false, 25);     
      self.smoke[i]:SetTimeScale(FightField.timeScale);  
      self.smoke[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      self.corona[i] = EffectLight.New(10052, 25, 1, 10, 10, EEffectLightTracer.StandAni, newPos.x, newPos.y, 10, false, 70);
      self.corona[i]:SetTimeScale(FightField.timeScale);  
      self.corona[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);

      FightField.fightHum[self.humIdx]:PlaySound();

      aimIdx = self:GetAttackIdx(i);
      if aimIdx ~= -1 and FightField.fightHum[aimIdx] ~= nil then      
        FightField.fightHum[aimIdx].roleController:Hit();
        self.stoneInfo[i].isHit = true;
        self.stoneInfo[i].hitOldTime = CGTimer.time;
      end
    end
  end

  local isAllFall = true;
  for i=1, 5 do  
    if self.stoneInfo[i].isFall == false then    
      isAllFall = false;
      break;
    end
  end
  
  return isAllFall;
end

function HailStone:UpdateHitPose()
  local aimIdx;
  local count = 0;
  for i=1, 5 do  
    aimIdx = self:GetAttackIdx(i);
    if aimIdx ~= -1 then
      count = count + 1;
    end

    if self.stoneInfo[i].isHit then
      if (CGTimer.time - self.stoneInfo[i].hitOldTime) * 1000 * FightField.timeScale >= 100 then    
        self.stoneInfo[i].isHit = false;
        aimIdx = self:GetAttackIdx(i);
        if aimIdx ~= -1 then
          FightField.RestoreFightInfo(aimIdx);
        end
      end
    end
  end
end

function HailStone:ShowIceStone()
  for k, v in pairs(self.iceStone) do
    if v ~= nil then 
      v:Update()
    end
  end
end