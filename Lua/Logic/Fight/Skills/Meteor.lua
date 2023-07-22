Meteor = InheritsFromBaseAttackSkill();

function Meteor:InitExtraParameters()
  self.iceStone = {};
  self.stoneInfo = {};
  self.smoke = {};
  self.corona = {};

  for i = 0, 5 do 
    self.iceStone[i] = nil;
    self.stoneInfo[i] = {};
  end
end

function Meteor:ExtraClose()
  ClearLightTable(self.smoke);
  ClearLightTable(self.corona);
end

function Meteor:Update()  
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then           
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10080, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 6, me.nowPos.y, 20, true, 80);
    me:PlaySound(target.colm, target.row, Attack_Start);
    self.interval = 0.8;
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
    if self:CheckInterval() then 
      self:SetStone();
      self.step = 3;
    end
  elseif Contains(self.step, 3, 4, 5) then           
    if self:StoneAllFall() then 
      self:SetStone();
      self.step = self.step + 1;   
     end
  elseif self.step == 6 then           
    if self:StoneAllFall() then 
      self.interval = 0.2;
      self.step = 7;
    end
  elseif self.step == 7 then 
    if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 8;
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

function Meteor:GetAttackIdx(count)
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

function Meteor:GetFallPos(idx)  
  local newPos = Vector2.zero;
  local target = FightField.fightHum[self.tarIdx];
  if idx == 1 then
    newPos = target:GetChipPos()
  elseif idx == 2 then
    if target.party_Kind == EFightParty.Left then
      newPos = target:GetSpot(EFightSpot.Left, FieldChipDistW);
    else
      newPos = target:GetSpot(EFightSpot.Right, FieldChipDistW);
    end
  elseif idx == 3 then
    if target.party_Kind == EFightParty.Left then
      newPos = target:GetSpot(EFightSpot.Right, FieldChipDistW);
    else
      newPos = target:GetSpot(EFightSpot.Left, FieldChipDistW);
    end
  elseif idx == 4 then
    if target.party_Kind == EFightParty.Left then
      newPos = target:GetSpot(EFightSpot.Back, FieldChipDistW);
    else
      newPos = target:GetSpot(EFightSpot.Front, FieldChipDistW);
    end
  elseif idx == 5 then
    if target.party_Kind == EFightParty.Left then
      newPos = target:GetSpot(EFightSpot.Front, FieldChipDistW);
    else
      newPos = target:GetSpot(EFightSpot.Back, FieldChipDistW);
    end
  end
  return newPos;
end

function Meteor:SetStone()
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
    showPage = 10338;
  
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
  else   
    sinSita = 1/ math.sqrt(math.pow(SlopeRight, 2)+1);
    cosSita = SlopeRight / math.sqrt(math.pow(SlopeRight, 2)+1);
    showPage = 10339;      
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
    else                
      x = newPos.x - fixed.x;
      y = newPos.y - fixed.y;
    end
    self.stoneInfo[i].isFall = false
    FightField.attack[self.humIdx]:SetLightWithOrder(i, EEffectLightDis.Sky, showPage, 40, 1, 6, 9, EEffectLightTracer.Line, x, y + 30, 255, true, 0, newPos.x, newPos.y + 30, 0.46 + (math.random(41) - 1) / 100);
  end
end

function Meteor:StoneAllFall()
  local aimIdx;
  local newPos;

  for i=1, 5 do  
    if FightField.attack[self.humIdx].lights[i].isArrive and self.stoneInfo[i].isFall == false then    
      self.stoneInfo[i].isFall = true;
      newPos = self:GetFallPos(i);

      self.smoke[i] = EffectLight.New(10250, 100, 1, 6, 6, EEffectLightTracer.StandAni, newPos.x, newPos.y, 30, false, 30);   
      self.smoke[i]:SetTimeScale(FightField.timeScale);              
      self.smoke[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      self.corona[i] = EffectLight.New(10090, 30, 11, 1, 12, EEffectLightTracer.StandAni, newPos.x, newPos.y, 30, false, 85);
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