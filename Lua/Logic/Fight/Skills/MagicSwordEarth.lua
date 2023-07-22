MagicSwordEarth = InheritsFromBaseAttackSkill();

function MagicSwordEarth:Update()  
  local newPos, newPos2, newPos3;
  local second;
  local shiftX, shiftY;
  local alpha = 30;

  local me = FightField.fightHum[self.humIdx];          --設發招者為 me
  local target = FightField.fightHum[self.tarIdx];      --設目標為 target
  local attack = FightField.attack[self.humIdx];
  local startDist = 240;
  if Contains(target.colm, 1, 2) then
    startDist = startDist - 60;
  end

  if self.step == 1 then 
    newPos = me:GetMagicPos();                --取得施法位置
    me:SetMoment(newPos.x, newPos.y, false); --瞬移到該位置
    me.roleController:MagicAttack();               --做施法動作
    attack:SetLightWithOrder(1, EEffectLightDis.Ground, 10343, 80, 1, 17, 17, EEffectLightTracer.StandAni, me.nowPos.x + 10, me.nowPos.y, 25, false, 85);
    self.step = 2;--做下一步
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
    if attack.lights[1].orderCount == 7 then      
      for i = 1, 3 do        
        newPos = me:GetSpot(EFightSpot.Left, 60 * i);
        if me.party_Kind == EFightParty.Right then
          attack:SetLightWithOrder(1 + i, EEffectLightDis.Sky, 10740, 80, 1, 16, 16, EEffectLightTracer.StandAni, newPos.x, newPos.y, alpha, false, 85);
        else
          attack:SetLightWithOrder(1+ i, EEffectLightDis.Ground, 10741, 80, 1, 16, 16, EEffectLightTracer.StandAni, newPos.x, newPos.y, alpha, false, 75);
        end
      end
      for i = 1, 3 do        
        newPos = me:GetSpot(EFightSpot.Right, 60 * i);
        if me.party_Kind == EFightParty.Right then
          attack:SetLightWithOrder(4 + i, EEffectLightDis.Ground, 10740, 80, 1, 16, 16, EEffectLightTracer.StandAni, newPos.x, newPos.y, alpha, false, 85);
        else
          attack:SetLightWithOrder(4 + i, EEffectLightDis.Sky, 10741, 80, 1, 16, 16, EEffectLightTracer.StandAni, newPos.x, newPos.y, alpha, false, 75);
        end
      end
      me:PlaySound(target.colm, target.row, Attack_Start);	--施法聲
      self.step = 3;
    end
  elseif self.step == 3 then 
    if attack.lights[2].orderCount == 9 then      
      second = 500;
      newPos = Vector2.New(attack.lights[2].showPos.x, attack.lights[2].showPos.y);
      newPos2 = target:GetSpot(EFightSpot.Front, startDist - 40);
      shiftX = math.random(0, 21) - 20;
      shiftY = math.random(0, 21) - 20;
      newPos2 = Vector2.New(newPos2.x + shiftX, newPos2.y + shiftY);
      if me.party_Kind == EFightParty.Right then
        attack:SetLightWithOrder(2, EEffectLightDis.Sky, 10740, 80, 9, 16, 16, EEffectLightTracer.Line, newPos.x, newPos.y, second, alpha, true, 85, newPos2.x, newPos2.y)
      else
        attack:SetLightWithOrder(2, EEffectLightDis.Sky, 10741, 80, 9, 16, 16, EEffectLightTracer.Line, newPos.x, newPos.y, second, alpha, true, 75, newPos2.x, newPos2.y);
      end
      newPos = Vector2.New(attack.lights[5].showPos.x, attack.lights[5].showPos.y);
      newPos2 = target:GetSpot(EFightSpot.Front, startDist);
      shiftX = math.random(0, 21) - 20;
      shiftY = math.random(0, 21) - 20;
      newPos2 = Vector2.New(newPos2.x + shiftX, newPos2.y + shiftY);
      if me.party_Kind == EFightParty.Right then
        attack:SetLightWithOrder(5, EEffectLightDis.Sky, 10740, 80, 9, 16, 16, EEffectLightTracer.Line, newPos.x, newPos.y, second, alpha, true, 85, newPos2.x, newPos2.y);
      else
        attack:SetLightWithOrder(5, EEffectLightDis.Sky, 10741, 80, 9, 16, 16, EEffectLightTracer.Line, newPos.x, newPos.y, second, alpha, true, 75, newPos2.x, newPos2.y);
      end

      newPos = Vector2.New(attack.lights[3].showPos.x, attack.lights[3].showPos.y);
      newPos2 = target:GetSpot(EFightSpot.Front, startDist - 40);
      shiftX = math.random(0, 21) - 20;
      shiftY = math.random(0, 21) - 20;
      if me.party_Kind == EFightParty.Right then        
        newPos3 = FightField.GetNextPos(newPos2, 3, 60);
        newPos3 = Vector2.New(newPos3.x + shiftX, newPos3.y + shiftY);
        attack:SetLightWithOrder(3, EEffectLightDis.Sky, 10740, 80, 9, 16, 16, EEffectLightTracer.Line, newPos.x, newPos.y, second, alpha, true, 85, newPos3.x, newPos3.y);       
      else      
        newPos3 = FightField.GetNextPos(newPos2, 7, 60);
        newPos3 = Vector2.New(newPos3.x + shiftX, newPos3.y + shiftY);
        attack:SetLightWithOrder(3, EEffectLightDis.Sky, 10741, 80, 9, 16, 16, EEffectLightTracer.Line, newPos.x, newPos.y, second, alpha, true, 75, newPos3.x, newPos3.y);
      end
      newPos = Vector2.New(attack.lights[6].showPos.x, attack.lights[6].showPos.y);
      shiftX = math.random(0, 21) - 20;
      shiftY = math.random(0, 21) - 20;
      if me.party_Kind == EFightParty.Right then        
        newPos3 = FightField.GetNextPos(newPos2, 7, 60);
        newPos3 = Vector2.New(newPos3.x + shiftX, newPos3.y + shiftY);
        attack:SetLightWithOrder(6, EEffectLightDis.Sky, 10740, 80, 9, 16, 16, EEffectLightTracer.Line, newPos.x, newPos.y, second, alpha, true, 85, newPos3.x, newPos3.y);        
      else      
        newPos3 = FightField.GetNextPos(newPos2, 3, 60);
        newPos3 = Vector2.New(newPos3.x + shiftX, newPos3.y + shiftY);
        attack:SetLightWithOrder(6, EEffectLightDis.Sky, 10741, 80, 9, 16, 16, EEffectLightTracer.Line, newPos.x, newPos.y, second, alpha, true, 75, newPos3.x, newPos3.y);
      end

      newPos = Vector2.New(attack.lights[4].showPos.x, attack.lights[4].showPos.y);
      newPos2 = target:GetSpot(EFightSpot.Front, startDist);
      shiftX = math.random(0, 21) - 20;
      shiftY = math.random(0, 21) - 20;
      if me.party_Kind == EFightParty.Right then        
        newPos3 = FightField.GetNextPos(newPos2, 3, 60);
        newPos3 = Vector2.New(newPos3.x + shiftX, newPos3.y + shiftY);
        attack:SetLightWithOrder(4, EEffectLightDis.Sky, 10740, 80, 9, 16, 16, EEffectLightTracer.Line, newPos.x, newPos.y, second, alpha, true, 85, newPos3.x, newPos3.y);        
      else      
        newPos3 = FightField.GetNextPos(newPos2, 7, 60);
        newPos3 = Vector2.New(newPos3.x + shiftX, newPos3.y + shiftY);
        attack:SetLightWithOrder(4, EEffectLightDis.Sky, 10741, 80, 9, 16, 16, EEffectLightTracer.Line, newPos.x, newPos.y, second, alpha, true, 75, newPos3.x, newPos3.y);
      end
      newPos = Vector2.New(attack.lights[7].showPos.x, attack.lights[7].showPos.y);
      shiftX = math.random(0, 21) - 20;
      shiftY = math.random(0, 21) - 20;
      if me.party_Kind == EFightParty.Right then        
        newPos3 = FightField.GetNextPos(newPos2, 7, 60);
        newPos3 = Vector2.New(newPos3.x + shiftX, newPos3.y + shiftY);
        attack:SetLightWithOrder(7, EEffectLightDis.Sky, 10740, 80, 9, 16, 16, EEffectLightTracer.Line, newPos.x, newPos.y, second, alpha, true, 85, newPos3.x, newPos3.y);        
      else      
        newPos3 = FightField.GetNextPos(newPos2, 3, 60);
        newPos3 = Vector2.New(newPos3.x + shiftX, newPos3.y + shiftY);
        attack:SetLightWithOrder(7, EEffectLightDis.Sky, 10741, 80, 9, 16, 16, EEffectLightTracer.Line, newPos.x, newPos.y, second, alpha, true, 75, newPos3.x, newPos3.y);
      end
			--劍氣聲
      me:PlaySound(target.colm, target.row, Attack_Hit,1);

      self.interval = second;
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
    if attack.lights[3].isArrive then      
      for i = 1, 6 do        
        newPos = Vector2.New(attack.lights[1 + i].showPos.x, attack.lights[1 + i].showPos.y);
        if me.party_Kind == EFightParty.Right then
          attack:SetLightWithOrder(1 + i, EEffectLightDis.Sky, 10740, 80, 9, 16, 16, EEffectLightTracer.Stand, newPos.x, newPos.y, alpha, true, 85)
        else
          attack:SetLightWithOrder(1 + i, EEffectLightDis.Sky, 10741, 80, 9, 16, 16, EEffectLightTracer.Stand, newPos.x, newPos.y, alpha, true, 75);
        end
      end
      self.interval = 0.4;
      self.step = 5;
    end
  elseif self.step == 5 then 
    if self:CheckInterval() then      
      for i = 1, 6 do        
        newPos = Vector2.New(attack.lights[1 + i].showPos.x, attack.lights[1 + i].showPos.y);
        if me.party_Kind == EFightParty.Right then          
          newPos2 = FightField.GetNextPos(newPos, 1, 230);
          attack:SetLightWithOrder(1 + i, EEffectLightDis.Sky, 10740, 80, 9, 16, 16, EEffectLightTracer.Line, newPos.x, newPos.y, 150, alpha, true, 85, newPos2.x, newPos2.y);          
        else        
          newPos2 = FightField.GetNextPos(newPos, 5, 230);
          attack:SetLightWithOrder(1 + i, EEffectLightDis.Sky, 10741, 80, 9, 16, 16, EEffectLightTracer.Line, newPos.x, newPos.y, 150, alpha, true, 85, newPos2.x, newPos2.y);
        end
      end
      self.step = 6;      
    end
  elseif self.step == 6 then 
    if attack.lights[3].isArrive then      
      for i = 1, 6 do        
        newPos = Vector2.New(attack.lights[1 + i].showPos.x, attack.lights[1 + i].showPos.y);
        if me.party_Kind == EFightParty.Right then          
          newPos2 = FightField.GetNextPos(newPos, 1, 230);
          attack:SetLightWithOrder(1 + i, EEffectLightDis.Sky, 10740, 80, 9, 16, 16, EEffectLightTracer.Line, newPos.x, newPos.y, 150, alpha, true, 85, newPos2.x, newPos2.y);          
        else        
          newPos2 = FightField.GetNextPos(newPos, 5, 230);
          attack:SetLightWithOrder(1 + i, EEffectLightDis.Sky, 10741, 80, 9, 16, 16, EEffectLightTracer.Line, newPos.x, newPos.y, 150, alpha, true, 85, newPos2.x, newPos2.y);
        end
      end

      for i = 0, self.emyNum-1 do                  
        target = FightField.fightHum[self.emyIdxAy[i]];
        local rand = math.random(0, 2)        
        if rand == 1 then             
          attack:SetLightWithOrder(7 + i, EEffectLightDis.Body, 10302, 50, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y + math.random(0, 20) - 20, 35, true, 130);          
        elseif rand == 2 then 
          attack:SetLightWithOrder(7 + i, EEffectLightDis.Body, 10303, 50, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x + 5, target.nowPos.y + math.random(0, 20) - 20, 35, true, 50);          
        else
          attack:SetLightWithOrder(7 + i, EEffectLightDis.Body, 10301, 50, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y + math.random(0, 20) - 20, 35, true, 210);
        end        
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      end
      self.step = 7;
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
  elseif self.step == 7 then 
    if attack.lights[3].isArrive then
      if attack.lights[7].orderCount == 7 then
        self.isLightEnd = true; --特技施展完畢
        self.step = 8;
      end
    end
  end
end