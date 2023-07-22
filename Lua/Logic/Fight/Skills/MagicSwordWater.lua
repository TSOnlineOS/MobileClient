MagicSwordWater = InheritsFromBaseAttackSkill();

function MagicSwordWater:InitExtraParameters()
  self.iceLight = {};
  self.hitLight = {};

  self.me = FightField.fightHum[self.humIdx];          --設發招者為 self.me
  self.target = FightField.fightHum[self.tarIdx];      --設目標為 self.target
  self.attack = FightField.attack[self.humIdx];
end

function MagicSwordWater:ExtraClose()
  ClearLightTable(self.iceLight);
  ClearLightTable(self.hitLight);
end

function MagicSwordWater:Update()
  local newPos, newPos2, newPos3;
  local second;
  local shiftX, shiftY;
  local alpha = 30;
      
  local startDist = 240;
  local iceBallPic = self:IceBallPicID();
  if Contains(self.target.colm, 1,2) then
    startDist = startDist - 60;
  end
  if self.step == 1 then     
    newPos = self.me:GetMagicPos();                  --取得施法位置
    self.me:SetMoment(newPos.x, newPos.y, false);    --瞬移到該位置
    self.me.roleController:MagicAttack();               --做施法動作
    local magicWindPicId = self:MagicWindPicId();
    self.attack:SetLightWithOrder(1, EEffectLightDis.Ground, magicWindPicId, 80, 1, 17, 17, EEffectLightTracer.StandAni, self.me.nowPos.x+ 10, self.me.nowPos.y, 25, false, 85);
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
    if self.attack.lights[1].orderCount == 7 then
      local CondensedPic = self:CondensedPicId();
      for i = 1, 3 do        
        newPos = self.me:GetSpot(EFightSpot.Left, 60 * i);
        if i == 2 then          
          if self.me.party_Kind == EFightParty.Right then
            newPos = FightField.GetNextPos(newPos, 1, 20)
          else
            newPos = FightField.GetNextPos(newPos, 5, 20);
          end
        end
        self.iceLight[i] = EffectLight.New(CondensedPic, 80, 1, 16, 16, EEffectLightTracer.StandAni, newPos.x, newPos.y, alpha, false, 85);
        self.iceLight[i]:SetTimeScale(FightField.timeScale);  
        self.iceLight[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      end

      for i = 1, 3 do              
        newPos = self.me:GetSpot(EFightSpot.Right, 60 * i);
        if i == 2 then        
          if self.me.party_Kind == EFightParty.Right then
            newPos = FightField.GetNextPos(newPos, 1, 20)
          else
            newPos = FightField.GetNextPos(newPos, 5, 20);
          end
        end
          self.iceLight[i + 3] = EffectLight.New(CondensedPic, 80, 1, 16, 16, EEffectLightTracer.StandAni, newPos.x, newPos.y, alpha, false, 85);
          self.iceLight[i + 3]:SetTimeScale(FightField.timeScale);  
          self.iceLight[i + 3]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      end
      self.me:PlaySound(self.target.colm, self.target.row, Attack_Start);	--施法聲
      self.step = 3;  
    end    
  elseif self.step == 3 then
    if self.iceLight[1].orderCount == 12 then      
      for i = 1, 6 do        
        newPos = Vector2.New(self.iceLight[i].showPos.x, self.iceLight[i].showPos.y);
        if self.me.party_Kind == EFightParty.Right then
          self.attack:SetLightWithOrder(1 + i, EEffectLightDis.Sky, iceBallPic, 80, 1, 11, 11, EEffectLightTracer.Stand, newPos.x, newPos.y, alpha, true, 85)
        else
          self.attack:SetLightWithOrder(1 + i, EEffectLightDis.Ground, iceBallPic, 80, 1, 11, 11, EEffectLightTracer.Stand, newPos.x, newPos.y, alpha, true, 45);
        end
      end
      self.interval = 0.2;
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
    if self.iceLight[1].orderCount == 16 then      
      second = 500;
      newPos = Vector2.New(self.attack.lights[2].showPos.x, self.attack.lights[2].showPos.y);
      newPos2 = self.target:GetSpot(EFightSpot.Front, startDist - 60);
      shiftX = math.random(0, 21) - 20;
      shiftY = math.random(0, 21) - 20;
      newPos2 = Vector2.New(newPos2.x + shiftX, newPos2.y + shiftY);
      if self.me.party_Kind == EFightParty.Right then
        self.attack:SetLightWithOrder(2, EEffectLightDis.Sky, iceBallPic, 80, 1, 11, 11, EEffectLightTracer.Line, newPos.x, newPos.y, second, alpha, true, 85, newPos2.x, newPos2.y);
      else
        self.attack:SetLightWithOrder(2, EEffectLightDis.Ground, iceBallPic, 80, 1, 11, 11, EEffectLightTracer.Line, newPos.x, newPos.y,second, alpha, true, 45, newPos2.x, newPos2.y);
      end
      newPos = Vector2.New(self.attack.lights[5].showPos.x, self.attack.lights[5].showPos.y);
      newPos2 = self.target:GetSpot(EFightSpot.Front, startDist);
      shiftX = math.random(0,21) - 20;
      shiftY = math.random(0,21) - 20;
      newPos2 = Vector2.New(newPos2.x + shiftX, newPos2.y + shiftY);
      if self.me.party_Kind == EFightParty.Right then
        self.attack:SetLightWithOrder(5, EEffectLightDis.Sky, iceBallPic, 80, 1, 11, 11, EEffectLightTracer.Line, newPos.x, newPos.y, alpha, true, 85, newPos2.x, newPos2.y)
        self.attack:SetLiveTime(5,second);
      else
        self.attack:SetLightWithOrder(5, EEffectLightDis.Ground, iceBallPic, 80, 1, 11, 11, EEffectLightTracer.Line, newPos.x, newPos.y, second, alpha, true, 45, newPos2.x, newPos2.y);
        self.attack:SetLiveTime(5,second);
      end

      newPos = Vector2.New(self.attack.lights[3].showPos.x, self.attack.lights[3].showPos.y);
      newPos2 = self.target:GetSpot(EFightSpot.Front, startDist - 60);
      shiftX = math.random(0,21) - 20;
      shiftY = math.random(0,21) - 20;
      if self.me.party_Kind == EFightParty.Right then        
        newPos3 = FightField.GetNextPos(newPos2, 3, 60);
        newPos3 = Vector2.New(newPos3.x + shiftX, newPos3.y + shiftY);
        self.attack:SetLightWithOrder(3, EEffectLightDis.Sky, iceBallPic, 80, 1, 11, 11, EEffectLightTracer.Line, newPos.x, newPos.y, alpha, true, 85, newPos3.x, newPos3.y);
        self.attack:SetLiveTime(3,second);
      else      
        newPos3 = FightField.GetNextPos(newPos2, 7, 60);
        newPos3 = Vector2.New(newPos3.x + shiftX, newPos3.y + shiftY);
        self.attack:SetLightWithOrder(3, EEffectLightDis.Ground, iceBallPic, 80, 1, 11, 11, EEffectLightTracer.Line, newPos.x, newPos.y, alpha, true, 45, newPos3.x, newPos3.y);
        self.attack:SetLiveTime(3,second);
      end
      newPos = Vector2.New(self.attack.lights[6].showPos.x, self.attack.lights[6].showPos.y);
      shiftX = math.random(1,21) - 20;
      shiftY = math.random(1,21) - 20;
      if self.me.party_Kind == EFightParty.Right then        
        newPos3 = FightField.GetNextPos(newPos2, 7, 60);
        newPos3 = Vector2.New(newPos3.x + shiftX, newPos3.y + shiftY);
        self.attack:SetLightWithOrder(6, EEffectLightDis.Sky, iceBallPic, 80, 1, 11, 11, EEffectLightTracer.Line, newPos.x, newPos.y, alpha, true, 85, newPos3.x, newPos3.y);
        self.attack:SetLiveTime(6,second);
      else      
        newPos3 = FightField.GetNextPos(newPos2, 3, 60);
        newPos3 = Vector2.New(newPos3.x + shiftX, newPos3.y + shiftY);
        self.attack:SetLightWithOrder(6, EEffectLightDis.Ground, iceBallPic, 80, 1, 11, 11, EEffectLightTracer.Line, newPos.x, newPos.y, alpha, true, 45, newPos3.x, newPos3.y);
        self.attack:SetLiveTime(6,second);
      end

      newPos = Vector2.New(self.attack.lights[4].showPos.x, self.attack.lights[4].showPos.y);
      newPos2 = self.target:GetSpot(EFightSpot.Front, startDist);
      shiftX = math.random(0,21) - 20;
      shiftY = math.random(0,21) - 20;
      if self.me.party_Kind == EFightParty.Right then        
        newPos3 = FightField.GetNextPos(newPos2, 3, 60);
        newPos3 = Vector2.New(newPos3.x + shiftX, newPos3.y + shiftY);
        self.attack:SetLightWithOrder(4, EEffectLightDis.Sky, iceBallPic, 80, 1, 11, 11, EEffectLightTracer.Line, newPos.x, newPos.y, alpha, true, 85, newPos3.x, newPos3.y);
        self.attack:SetLiveTime(4,second);
      else      
        newPos3 = FightField.GetNextPos(newPos2, 7, 60);
        newPos3 = Vector2.New(newPos3.x + shiftX, newPos3.y + shiftY);
        self.attack:SetLightWithOrder(4, EEffectLightDis.Ground, iceBallPic, 80, 1, 11, 11, EEffectLightTracer.Line, newPos.x, newPos.y, alpha, true, 45, newPos3.x, newPos3.y);
        self.attack:SetLiveTime(4,second);
      end
      newPos = Vector2.New(self.attack.lights[7].showPos.x, self.attack.lights[7].showPos.y);
      shiftX = math.random(0,21) - 20;
      shiftY = math.random(0,21) - 20;
      if self.me.party_Kind == EFightParty.Right then        
        newPos3 = FightField.GetNextPos(newPos2, 7, 60);
        newPos3 = Vector2.New(newPos3.x + shiftX, newPos3.y + shiftY);
        self.attack:SetLightWithOrder(7, EEffectLightDis.Sky, iceBallPic, 80, 1, 11, 11, EEffectLightTracer.Line, newPos.x, newPos.y, alpha, true, 85, newPos3.x, newPos3.y);
        self.attack:SetLiveTime(7,second);
      else      
        newPos3 = FightField.GetNextPos(newPos2, 3, 60);
        newPos3 = Vector2.New(newPos3.x + shiftX, newPos3.y + shiftY);
        self.attack:SetLightWithOrder(7, EEffectLightDis.Ground, iceBallPic, 80, 1, 11, 11, EEffectLightTracer.Line, newPos.x, newPos.y, alpha, true, 45, newPos3.x, newPos3.y);
        self.attack:SetLiveTime(7,second);
      end
			--劍氣聲
      self.me:PlaySound(self.target.colm, self.target.row, Attack_Hit,1);

      self.interval = second / 1000;
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
        local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  elseif self.step == 5 then 
    if self.attack.lights[3].isArrive then      
      for i = 1, 6 do        
        newPos = Vector2.New(self.attack.lights[1 + i].showPos.x, self.attack.lights[1 + i].showPos.y);
        if self.me.party_Kind == EFightParty.Right then
          self.attack:SetLightWithOrder(1 + i, EEffectLightDis.Sky, iceBallPic, 80, 1, 11, 11, EEffectLightTracer.Stand, newPos.x, newPos.y, alpha, true, 85);
        else
          self.attack:SetLightWithOrder(1+ i, EEffectLightDis.Ground, iceBallPic, 80, 1, 11, 11, EEffectLightTracer.Stand, newPos.x, newPos.y, alpha, true, 45);
        end
      end
      self.interval = 0.4;
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
  elseif self.step == 6 then 
    if self:CheckInterval() then      
      for i = 1, 6 do        
        newPos = Vector2.New(self.attack.lights[1 + i].showPos.x, self.attack.lights[1 + i].showPos.y);
        if self.me.party_Kind == EFightParty.Right then          
          newPos2 = FightField.GetNextPos(newPos, 1, 230);
          self.attack:SetLightWithOrder(1 + i, EEffectLightDis.Sky, iceBallPic, 80, 1, 11, 11, EEffectLightTracer.Line, newPos.x, newPos.y, alpha, true, 85, newPos2.x, newPos2.y);
          self.attack:SetLiveTime(1 + i, 150);
        else        
          newPos2 = FightField.GetNextPos(newPos, 5, 230);
          self.attack:SetLightWithOrder(1 + i, EEffectLightDis.Sky, iceBallPic, 80, 1, 11, 11, EEffectLightTracer.Line, newPos.x, newPos.y, alpha, true, 45, newPos2.x, newPos2.y);
          self.attack:SetLiveTime(1 + i, 150);
        end
      end        
      self.step =7;
    end
  elseif self.step == 7 then 
    if self.attack.lights[3].isArrive then      
      for i = 1, 6 do        
        newPos = Vector2.New(self.attack.lights[1 + i].showPos.x, self.attack.lights[1 + i].showPos.y);
        if self.me.party_Kind == EFightParty.Right then          
          newPos2 = FightField.GetNextPos(newPos, 1, 230);
          self.attack:SetLightWithOrder(1 + i, EEffectLightDis.Sky, iceBallPic, 80, 1, 11, 11, EEffectLightTracer.Line, newPos.x, newPos.y, alpha, true, 85, newPos2.x, newPos2.y);
          self.attack:SetLiveTime(1 + i, 150);
        else          
          newPos2 = FightField.GetNextPos(newPos, 5, 230);
          self.attack:SetLightWithOrder(1 + i, EEffectLightDis.Sky, iceBallPic, 80, 1, 11, 11, EEffectLightTracer.Line, newPos.x, newPos.y, alpha, true, 45, newPos2.x, newPos2.y);
          self.attack:SetLiveTime(1 + i, 150);
        end
      end

      for i = 0, self.emyNum-1 do        
        self.target = FightField.fightHum[self.emyIdxAy[i]];
        local rand = math.random(1,3);
        local HitPicID = self:RandomHitPicID(rand);
        if rand == 1 then            
          self.hitLight[i] = EffectLight.New(HitPicID, 50, 1, 7, 7, EEffectLightTracer.StandAni, self.target.nowPos.x, self.target.nowPos.y+ math.random(0,20) - 20, 35, true, 130);
        elseif rand == 2 then             
          self.hitLight[i] = EffectLight.New(HitPicID, 50, 1, 7, 7, EEffectLightTracer.StandAni, self.target.nowPos.x+ 5, self.target.nowPos.y+ math.random(0,20) - 20, 35, true, 50);
        else
          self.hitLight[i] = EffectLight.New(HitPicID, 50, 1, 7, 7, EEffectLightTracer.StandAni, self.target.nowPos.x, self.target.nowPos.y+ math.random(0,20) - 20, 35, true, 210);
        end
        self.hitLight[i]:SetTimeScale(FightField.timeScale);  
        self.hitLight[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        self.me:PlayEffect(self.target.colm, self.target.row, ERolePose.Hit);
      end              
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
  elseif self.step == 8 then 
    if self.attack.lights[3].isArrive then
      if self.hitLight[0].orderCount >= 7 then
        self.step = 9;
        self.isLightEnd = true; --特技施展完畢
      end
    end
  end
end

function MagicSwordWater:MagicWindPicId()
  if self.showKind == ESkill_Kind.MagicSwordWater then
    return 10344;
  elseif self.showKind == ESkill_Kind.FloatWind then
    return 10344;
  end
end

function MagicSwordWater:CondensedPicId()
  if self.showKind == ESkill_Kind.MagicSwordWater then
    return 10742;
  elseif self.showKind == ESkill_Kind.FloatWind then
    return 11075;
  end
end

function MagicSwordWater:IceBallPicID()
  if self.showKind == ESkill_Kind.MagicSwordWater then
    if self.me.party_Kind == EFightParty.Right then
      return 10743;
    else
      return 10744;
    end
  elseif self.showKind == ESkill_Kind.FloatWind then
    if self.me.party_Kind == EFightParty.Right then
      return 11076;
    else
      return 11077;
    end
  end
end

function MagicSwordWater:RandomHitPicID(ranSeed)
  if self.showKind == ESkill_Kind.MagicSwordWater then
    if ranSeed ==  1 then
      return 10302;
    elseif ranSeed ==  2 then
      return 10303;
    elseif ranSeed ==  3 then
      return 10301;
    end
  elseif self.showKind == ESkill_Kind.FloatWind then
    if ranSeed ==  1 then
      return 11078;
    elseif ranSeed ==  2 then
      return 11079;
    elseif ranSeed ==  3 then
      return 11080;
    end
  end
end