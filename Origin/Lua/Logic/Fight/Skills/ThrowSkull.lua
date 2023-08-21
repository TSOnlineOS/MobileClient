ThrowSkull = InheritsAttack(FlySand)

function ThrowSkull:SetStone()
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
      x = newPos.x + fixed.x;
      y = newPos.y - fixed.y;
    end
    self.stoneInfo[i].isFall = false

    if self.iceStone[i] ~= nil then 
      self.iceStone[i]:Free();
      self.iceStone[i] = nil;
    end

    self.iceStone[i] = IceStone.New();
    self.iceStone[i]:SetPath(10804+ math.random(0,2), showPage, x, y+30, newPos.x, newPos.y+30, 0.36 + math.random(36)/100);
  end
end

function ThrowSkull:StoneAllFall()
  local aimIdx;
  local newPos;

  for i=1, 5 do  
    if self.iceStone[i].arrive and self.stoneInfo[i].isFall == false then    
      self.stoneInfo[i].isFall = true;
      newPos = self:GetFallPos(i);

      self.smoke[i] = EffectLight.New(10802, 100,10,15, 15, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, false, 60);     
      self.smoke[i]:SetTimeScale(FightField.timeScale);   
      self.smoke[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      self.corona[i] = EffectLight.New(10803, 25, 1, 10, 10, EEffectLightTracer.StandAni, newPos.x, newPos.y,10, false, 70);
      self.corona[i]:SetTimeScale(FightField.timeScale);   
      self.corona[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);

      FightField.fightHum[self.humIdx]:PlaySound();

      aimIdx = self:GetAttackIdx(i);
      if aimIdx ~= -1 and FightField.fightHum[aimIdx] ~= nil then      
        FightField.fightHum[aimIdx].roleController:Hit();
        self.stoneInfo[i].isHit = true;
        self.stoneInfo[i].hitOldTime = CGTimer.time * FightField.timeScale;
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
