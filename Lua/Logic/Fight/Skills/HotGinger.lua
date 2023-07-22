EHotGingerUserKind = 
{
  None,
  ID_41546,
  ID_41547,
}

HotGinger = InheritsFromBaseAttackSkill();

function HotGinger:InitExtraParameters()
  self.whoAmI = EHotGingerUserKind.None;   --none,收驚婆他媽,客棧老闆他爸
  self.count = 0;

  local me = FightField.fightHum[self.humIdx];
  --判斷現在的光影是誰的
  if me.npcId == 41546 then         --收驚婆他媽       
    self.whoAmI = EHotGingerUserKind.ID_41546;
  elseif me.npcId == 41547 then     --客棧老闆他爸
    self.whoAmI = EHotGingerUserKind.ID_41547;
  end
end

function HotGinger:InitDrawBlack()
  self.needDrawBlack = true;   
end

function HotGinger.GetGingerPos(target)
  local pos;
  if target.party_Kind == EFightParty.Left then 
    pos = Vector2.New(FightField.chip[1][2].x - 100, FightField.chip[1][2].y - 30);        
  else
    pos = Vector2.New(FightField.chip[3][2].x - 120, FightField.chip[3][2].y - 40);        
  end
  return pos;
end

function HotGinger:UpdateGinger()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local attack = FightField.attack[self.humIdx];  
  local pos = nil;

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    attack:SetLight(EEffectLightKind.Ground, 10070, 50, 1, 32, 32, EEffectLightTracer.StandAni, me.nowPos.x + 7, me.nowPos.y, 20, true, 50);    
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
    for i = 0, self.emyNum-1 do        
      target = FightField.fightHum[ self.emyIdxAy[i] ]; 
      local pos = Vector2.New(target.nowPos.x, target.nowPos.y - 100);
      attack:SetLightWithOrder(3 + i, EEffectLightDis.Body, 10012, 50, 13, 13, 13, EEffectLightTracer.Line, pos.x, pos.y, 255, false, 0, target.nowPos.x, target.nowPos.y + 100, 0.25);              
    end
    self.step = 3;
  elseif self.step == 3 then 
    if attack.lights[3].isArrive then 
      for i = 0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ]; 
        target.roleController:Hit();
        local pos = Vector2.New(target.nowPos.x, target.nowPos.y +100 );
        attack:SetLightWithOrder(3 + i, EEffectLightDis.Body, 10012, 50, 13, 1, 13, EEffectLightTracer.StandAni, pos.x, pos.y, 255, false, 0);              
      end
      self.interval = 3;
      self.step = 4;
    end
  elseif self.step == 4 then 
    if self:CheckInterval() then 
      pos = HotGinger.GetGingerPos(target); 
      
      attack:SetLightWithOrder(2, EEffectLightDis.Body, 10994, 100, 1, 7, 16, EEffectLightTracer.Stand, pos.x, pos.y - 90, 255, false);              
      -- attack.lights[2].rectTransform.localScale = Vector3.New(2, 2, 1);  
      self.interval = 1;
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
    if self:CheckInterval() then
      FightField.SetShake(true);
      pos = HotGinger.GetGingerPos(target); 

      attack:SetLightWithOrder(2, EEffectLightDis.Body, 10994, 130, 7, 10, 16, EEffectLightTracer.Line, pos.x, pos.y - 90, 255, false, 0, pos.x, pos.y + 35, 0.15);              
      -- attack.lights[2].rectTransform.localScale = Vector3.New(2, 2, 1);  
      self.step = 6;
    end
  elseif self.step == 6 then
    if attack.lights[2].isArrive then 
      
      me:PlaySound(target.colm, target.row, 1);

      pos = HotGinger.GetGingerPos(target); 
      attack:SetLightWithOrder(2, EEffectLightDis.Body, 10994, 100, 10, 16, 16, EEffectLightTracer.StandAni, pos.x, pos.y + 35, 255, false);              
      -- attack.lights[2].rectTransform.localScale = Vector3.New(2, 2, 1);  
      for i = 0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ]; 
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);    
        target.roleController:Hit();
        target:SetSpeed(0.16);
        local newPos = nil;
        if not target:IsInSealStatus() then
          if Between(target.colm, 0, 3) then
            newPos = target:GetSpot(EFightSpot.Back, 60);
          else
            newPos = target:GetSpot(EFightSpot.Front, 60);
          end
          
          target:SetJump(newPos.x, newPos.y, true);
        end    
      end
      self.step = 7;
    end
  elseif self.step == 7 then 
    if attack.lights[2].picId == 0 then 
      self.interval = 2;  
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
      FightField.SetShake(false);
    end
  elseif self.step == 8 then 
    if self:CheckInterval() then 
      self.isLightEnd = true;
    end
  end
end

function HotGinger:UpdateBlade()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then  
    me.roleController:SetAnimationForceId(ERolePose.Attack);
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10103, 100, 1, 4, 10, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 255, false, 80);
    if me.party_Kind == EFightParty.Right then
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10675, 50, 1, 8, 8, EEffectLightTracer.Stand, me.nowPos.x - 40, me.nowPos.y, 255, true, 80);
    else
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10675, 50, 1, 8, 8, EEffectLightTracer.Stand, me.nowPos.x + 50, me.nowPos.y, 255, true, 25);
    end 
    
    me:PlaySound(target.colm, target.row, Attack_Start);
    for i = 0, 1 do 
      FightField.attack[self.humIdx]:SetLightWithOrder(i + 3, EEffectLightDis.Body, 10250, 80, 1, 3, 6, EEffectLightTracer.StandAni, me.nowPos.x - 40 + 80 * i, me.nowPos.y + math.random(40) - 41, 20, false, 30);
    end

    self.step = 2;      
  elseif self.step == 2 then
    if FightField.attack[self.humIdx].lights[2].orderCount == 4 then
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10103, 100, 1, 4, 10, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 255, false, 80);
      for i = 2, 3 do 
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 3, EEffectLightDis.Body, 10250, 80, 1, 3, 6, EEffectLightTracer.StandAni, me.nowPos.x - 40 + 80 * (i - 2), me.nowPos.y + math.random(40) - 41, 20, false, 30);
      end

      for i = 4, 5 do 
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 3, EEffectLightDis.Body, 10250, 80, 1, 3, 6, EEffectLightTracer.StandAni, me.nowPos.x + math.random(40) - 41, me.nowPos.y - 40 + 80 * (i - 4), 20, false, 30);
      end

      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10103, 100, 1, 4, 10, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 255, false, 80);
      self.step = 3;
    end
  elseif self.step == 3 then           
    if FightField.attack[self.humIdx].lights[3].orderCount == 2 then      
      FightField.attack[self.humIdx]:StopLight(2);
      for i = 0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];  
        local newPos = target:GetAttackPos(EFightSpot.Front, 60);
        local lightIdx = 10 + 6*i;      
        if me.party_Kind == EFightParty.Right then
          FightField.attack[self.humIdx]:SetLightWithOrder(lightIdx, EEffectLightDis.Body, 10675, 50, 1, 8, 8, EEffectLightTracer.Curve, me.nowPos.x - 40, me.nowPos.y, 255, true, 80, newPos.x, newPos.y, 0.65);
        else
          FightField.attack[self.humIdx]:SetLightWithOrder(lightIdx, EEffectLightDis.Body, 10675, 50, 1, 8, 8, EEffectLightTracer.Curve, me.nowPos.x + 50, me.nowPos.y, 255, true, 25, newPos.x, newPos.y, 0.65);
        end 
      end
      
      me:PlaySound(target.colm, target.row, Attack_Start);
      self.step = 4;   
    end
  elseif self.step == 4 then     
    if FightField.attack[self.humIdx].lights[10].isArrive then      
      for i = 0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];  
        local lightIdx = 10 + 6*i;    
        if me.party_Kind == EFightParty.Right then
          FightField.attack[self.humIdx]:SetLightWithOrder(lightIdx, EEffectLightDis.Sky, 10677, 50, 1, 6, 8, EEffectLightTracer.Stand, target.nowPos.x + 20, target.nowPos.y, 255, false, 80);
        else
          FightField.attack[self.humIdx]:SetLightWithOrder(lightIdx, EEffectLightDis.Sky, 10676, 50, 1, 6, 8, EEffectLightTracer.Stand, target.nowPos.x + 20, target.nowPos.y, 255, false, 80);
        end 

        FightField.attack[self.humIdx]:SetLightWithOrder(lightIdx + 4, EEffectLightDis.Body, 10250, 80, 1, 3, 6, EEffectLightTracer.StandAni,target.nowPos.x, target.nowPos.y + 20, 20, false, 0);
      end

      self.step = 5;
    end
  elseif self.step == 5 then
    if FightField.attack[self.humIdx].lights[10].orderCount == 2 then
      for i = 0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];  
        local lightIdx = 10 + 6*i;  
        if me.party_Kind == EFightParty.Right then
          FightField.attack[self.humIdx]:SetLightWithOrder(lightIdx+1, EEffectLightDis.Sky, 10677, 100, 1, 1, 8, EEffectLightTracer.StandAni, target.nowPos.x + 20, target.nowPos.y, 255, false, 80);
        else
          FightField.attack[self.humIdx]:SetLightWithOrder(lightIdx+1, EEffectLightDis.Sky, 10676, 100, 1, 1, 8, EEffectLightTracer.StandAni, target.nowPos.x + 20, target.nowPos.y, 255, false, 80);
        end 
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);
        FightField.attack[self.humIdx]:SetLightWithOrder(lightIdx+3, EEffectLightDis.Body, 10250, 80, 1, 3, 6, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y + 20, 20, false, 0);
      end      
      me:PlaySound(target.colm, target.row, 3);
      self.step = 6;
    end
  elseif self.step == 6 then
    if FightField.attack[self.humIdx].lights[11].orderCount == 1 then
      for i = 0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];  
        local lightIdx = 10 + 6*i;
        FightField.attack[self.humIdx]:StopLight(lightIdx);
        if me.party_Kind == EFightParty.Right then          
          FightField.attack[self.humIdx]:SetLightWithOrder(lightIdx+2, EEffectLightDis.Sky, 10677, 100, 6, 7, 8, EEffectLightTracer.StandAni, target.nowPos.x + 20, target.nowPos.y, 255, false, 80);
        else
          FightField.attack[self.humIdx]:SetLightWithOrder(lightIdx+2, EEffectLightDis.Sky, 10676, 100, 6, 7, 8, EEffectLightTracer.StandAni, target.nowPos.x + 20, target.nowPos.y, 255, false, 80);
        end 
      end      
      self.step = 7;     
    end
  elseif self.step == 7 then 
    if self.count < 2 then 
      self.count = self.count + 1;
      self.step = 1;
    else
      self.interval = 4.5;  
      self.step = 8;      
    end
  elseif self.step == 8 then     
    if self:CheckInterval() then 
      self.isLightEnd = true;
    end
  end
end

function HotGinger:Update()     
  if self.whoAmI == EHotGingerUserKind.ID_41546 then 
    self:UpdateGinger();
  elseif self.whoAmI == EHotGingerUserKind.ID_41547 then 
    self:UpdateBlade();
  end
end


