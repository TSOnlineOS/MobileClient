HandFight = InheritsFromBaseAttackSkill();

function HandFight:InitExtraParameters()
  self.isAttack = false;
  if FightField.fightHum[self.tarIdx].hitCount < 255 then 
    FightField.fightHum[self.tarIdx].hitCount = FightField.fightHum[self.tarIdx].hitCount + 1;
  end

  if FightField.fightHum[self.tarIdx].hitCount<= 1 then 
    self.isAttack = true;
  end       
  self.lightList = {}; 
  self.poseCnt = 0;    
  self.isHit = false;  
  self.isTurtle = false;
  local me = FightField.fightHum[self.humIdx];  
  self.isTurtle = me.isTurtle;
end

function HandFight:ExtraClose()
  ClearLightTable(self.lightList);  
  
  local targetHum = FightField.fightHum[self.tarIdx];
  if targetHum ~= nil and targetHum.hitCount > 0 then
    targetHum.hitCount = targetHum.hitCount - 1;
  end


  if self.isTurtle then  
    local me = FightField.fightHum[self.humIdx];
    local handIds = nil;
    if me ~= nil then 
      if Between(me.npcId, 35029, 35031) then 
        handIds = {35029, 35030, 35031};
        --3----------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
          DemoCode.SetColorNum(10);
          local area =  DemoCode.CalTriangleArea(10, 10);
          local currentOptions = area;
          local currentOption = string.Get(80098);
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
      elseif Between(me.npcId, 35032, 35034) then 
        handIds = {35032, 35033, 35034};
      elseif Between(me.npcId, 35054, 35056) then
        handIds = {35054, 35055, 35056};
      elseif Between(me.npcId, 35060, 35662) then 
        handIds = {35060, 35061, 35062};
      elseif Between(me.npcId, 38361, 38363) then 
        handIds = {38361, 38362, 38363};
      end
      for k, v in pairs(handIds)do
        local tempRole = FightField.GetRoleByNpcId(v);              
        if tempRole ~= nil then
          tempRole.roleController:SetVisible(ERoleVisible.Visible);
        end
      end
    end
  end
end

function HandFight:Update()
  local newPos, ranPos = nil; 
  local isDragon = false;

  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  
  if me.data ~= nil and me.data.equips ~= nil then     
    local weaponData = itemDatas[me.data.equips[EItemFitType.Equip_Hand]];
    --弓纇特別處理
    if Contains(me.kind, EHuman.Player, EHuman.Players, EHuman.Divide) and
       weaponData ~= nil and weaponData.kind == 7 then 
      self:UpdateArrow();
      return;
    end

    --機關槍特別處理  
    if Contains(me.kind, EHuman.Player, EHuman.Players, EHuman.Divide) and
      Between(me.data.equips[EItemFitType.Equip_Hand], 56001, 56003) then 
      self:UpdateGun();
    end
  end

  if self.isTurtle then 
    self:UpdateDragon();
    return 
  end

  if self.step == 1 then     
    newPos = target:GetAttackPos(EFightSpot.Front, 60);
    me.roleController:SetIsJumping(true);
    isDragon = false;
  
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
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

    if me.kind ~=EHuman.Players then
      if me.npcId == 35030 or me.npcId == 35031 then
        isDragon = true;
      end
    end

    if isDragon then
    else
      me:SetJump(newPos.x, newPos.y);
      me:SetSpeed(0.98);
    end

    self.step = 2;
  elseif self.step == 2 then --是否到達目地點                 
    if me.arrive then        
      me.roleController:SetIsJumping(false);      
      me.roleController:OneHandAttack();
      self.poseCnt = 1;
      self.step = 3;
    end
  elseif self.step == 3 then  --是否跳回播放打鬥的音效      
    if me.roleController.animationId ==  me.roleController:GetAnimationId(ERolePose.Prepare) and self.isHit then       
      me.roleController:SetIsJumping(true);      
      isDragon = false;

      if me.kind ~= EHuman.Players and (me.npcId == 35030 or me.npcId == 35031) then
        isDragon = true;
      end

      local meChip = FightField.chip[me.colm][me.row];
      if isDragon then
        me:SetWalk( meChip.x, meChip.y, false )
      else
        me:SetJump( meChip.x, meChip.y, false );
      end

      FightField.attack[self.humIdx]:StopLight(1);
      self.step = 4;      
    else  
      if (me.roleController.animationFrame == self.poseCnt) and (self.isHit == false) then    

        me:PlaySound(target.colm, target.row);
        ranPos = Vector2.zero;
        local centerPos = Vector2.New(target.nowPos.x, target.nowPos.y);
        local fightEffect = me:GetFightEffect(target.colm, target.row);
        if fightEffect ~= nil and fightEffect.beHitAct ~= 1 then                         --若是為擋的動作,則不秀黃光影          
          ranPos.x = math.random(60);
          ranPos.y = math.random(60);
          if self.isAttack then
            FightField.attack[self.humIdx]:SetLight(1 ,10000, 40, 1,4, 4, EEffectLightTracer.StandAni, centerPos.x - 30 + ranPos.x, centerPos.y - 30 + ranPos.y, 255, false, 0);  
          end
        end
        ranPos.x = math.random(60);
        ranPos.y = math.random(60);

        if math.random(2) == 1 then 
          FightField.attack[self.humIdx]:SetLight(2,10040, 25, 1,9, 9, EEffectLightTracer.StandAni, centerPos.x-35 + ranPos.x, centerPos.y-40 + ranPos.y,10, false, 12);
        else
          FightField.attack[self.humIdx]:SetLight(2,10040, 50, 1,4, 9, EEffectLightTracer.StandAni, centerPos.x-35 + ranPos.x, centerPos.y-40 + ranPos.y,10, false, 12);
        end

        me:PlayEffect(target.colm, target.row, ERolePose.Hit);
        self.isHit = true;
      end
    end
  elseif self.step == 4 then      
    if me.arrive then       
      me.roleController:SetIsJumping(false);  
      self.isLightEnd = true;
      self.step = 5;
    end
  end
end

function HandFight:UpdateArrow()
  local me, target = nil;
  local newPos = Vector2.zero;
  local aRi;

  me = FightField.fightHum[self.humIdx];
  target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then   
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);       
    aRi =  me.roleController:GetAnimationFrame(me.roleController:GetAnimationId(ERolePose.Archery));
    if aRi == 0 then  --NPC沒有設箭動作
      me.roleController:MagicAttack();
    else
      me.roleController:RangeAttack();
    end
  
  
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
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
    self.interval = 0.4;
    self.step = 2;      
  elseif self.step == 2 then           
    if  self:CheckInterval() then      
      newPos.x = target.nowPos.x;
      newPos.y = target.nowPos.y;

      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10072, 30, 5, 5, 6, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y-30,255,false,0, newPos.x, newPos.y)        
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10073, 30, 5, 5, 6, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y-30,255,false,0, newPos.x, newPos.y);
      end

      self.step = 3;
    end
  elseif self.step == 3 then          
    self:ArrowMove();
    if FightField.attack[self.humIdx].lights[2].isArrive then
      me:PlaySound(target.colm, target.row);   --92/7/16-5F          
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);

      self.interval = 0.4;
      self.step = 4;
    end
  elseif self.step == 4 then             
    if self:CheckInterval() then
      self.step = 5;
      self.isLightEnd = true;
    end
  end
end

function HandFight:ArrowMove()
  local curDist, totalDist  
  local page;

  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  curDist = (me.nowPos - FightField.attack[self.humIdx].lights[2].showPos).magnitude;
  totalDist = (me.nowPos - target.nowPos).magnitude;  

  if curDist > totalDist then
    return 
  end

  page = math.ceil((curDist/(totalDist+0.01) )*5 ) + 1;

  FightField.attack[self.humIdx].lights[2]:SetPage(page, page);
end

function HandFight:UpdateGun()
  local newPos, ranPos = nil;
  local aEffect;
 
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self.step == 1 then     
    newPos = me:GetMagicPos();
    me:SetWalk(newPos.x, newPos.y);
    me.roleController:SetIsJumping(true);
    me:SetSpeed(0.52);
    me:SetBeh(EFightBeh.Residual);  --殘影        
    self.step = 2;
  
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
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
  
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    
  elseif self.step == 2 then          
    if me.arrive then     
      me.roleController:SetIsJumping(false); 
      me.roleController:RangeAttack();        
      newPos = target:GetSpotOfRc(EFightSpot.Front, 60);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Shoot ,10255, 25, 1, 1, 1, EEffectLightTracer.Line, me.nowPos.x-64, me.nowPos.y-9, 255, false, 0, newPos.x-64, newPos.y-9, 0.72);

      --紅光
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body1,10040, 50, 1,4, 9, EEffectLightTracer.StandAni, me.nowPos.x-35, me.nowPos.y+31, 10, false, 0);        
      --彈
      if me.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky4 ,10256, 50, 1,1, 1, EEffectLightTracer.Line, me.nowPos.x-32, me.nowPos.y-33, 255, false, 0, me.nowPos.x-32-28, me.nowPos.y-33+38, 0.36)
      else
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky4, 10256, 50, 1,1, 1, EEffectLightTracer.Line, me.nowPos.x-32, me.nowPos.y-33, 255, false, 0, me.nowPos.x-32+28, me.nowPos.y-33+38, 0.36);
      end
      self.step = 3;
    end
  elseif self.step == 3 then 
    if FightField.attack[self.humIdx]:CheckLightIsEnd(EEffectLightKind.Shoot)then      
      me:PlaySound(target.colm, target.row);
      aEffect = me:GetFightEffect(target.Colm, target.Row);
      ranPos = Vector2.one;
      if  aEffect ~= nil and  aEffect.beHitAct ~= 1 then                         --若是為擋的動作,則不秀黃光影
        ranPos.x = math.random(60);
        ranPos.y = math.random(60);
        if self.isAttack then
          FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1,10000, 40, 1,4, 4, EEffectLightTracer.StandAni, target.nowPos.x - 30 + ranPos.x, target.nowPos.y -30 + ranPos.y, 255, false, 0);
        end
      end

      ranPos.x = math.random(60);
      ranPos.y = math.random(60);
      if math.random(0, 1) == 0 then 
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2,10040, 25, 1,9, 9, EEffectLightTracer.StandAni, target.nowPos.x-35+ ranPos.x, target.nowPos.y-40+ ranPos.y,10, false, 12);
      else
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2,10040, 50, 1,4, 9, EEffectLightTracer.StandAni, target.nowPos.x-35+ ranPos.x, target.nowPos.y-40+ ranPos.y,10, false, 12);
      end
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      
      self.interval = 0.5;

      newPos = target:GetSpotOfRc(EFightSpot.Back, 60);
      target.roleController:SetIsDead(true);
      target:SetJump(newPos.x, newPos.y, true);
      self.step = 4;
    end
  elseif self.step == 4 then 
    if self:CheckInterval() then      
      newPos = target:RCtoSpot(target.colm, target.row);
      target.roleController:SetIsDead(false);
      target.roleController:SetInBattle(false);
      target.roleController:SetIsMoving(true);
      target:SetWalk(newPos.x, newPos.y);
      self.step = 5;  
    end
  elseif self.step == 5 then                 
    if target.arrive then      
      target.roleController:SetIsMoving(false);
      target.roleController:SetInBattle(true);            
      self.isLightEnd = true;
      self.step = 6;
    end
  end
end

function HandFight:UpdateDragon()
  local me, target  = nil;
  local effectData = nil;  
  local ranPos = Vector2.zero;

  me = FightField.fightHum[self.humIdx];
  target = FightField.fightHum[self.tarIdx];
  if self.step == 1 then           
    if me.npcId == 35029 then  --龍頭          
      me.roleController:MagicAttack();         
    elseif Contains(me.npcId, 35030, 35031) then --龍爪
      me.roleController:SetIsDead(true);            
    elseif Contains(me.npcId, 35032, 35054, 35055, 35056) then --玄武          
      --若頭出手將兩手隱藏
      me.roleController:SetAnimationForceId(ERolePose.Attack);
      local handIds = nil;
      if me.npcId == 35032 then 
        handIds = {35033, 35034};
      elseif me.npcId == 35054 then 
        handIds = {35055, 35056};
      elseif  me.npcId == 35055 then 
        handIds = {35054, 35056};
      elseif  me.npcId == 35056 then 
        handIds = {35054, 35055};        
      end
      for k, v in pairs(handIds)do
        local tempRole = FightField.GetRoleByNpcId(v);              
        if tempRole ~= nil then
          tempRole.roleController:SetVisible(ERoleVisible.Hide);
        end
      end
    elseif Between(me.npcId, 35033, 35034)  then --玄武左右手
      me.roleController:SetIsDead(true);
    elseif me.npcId == 35063 then
      me.roleController:OneHandAttack();
    end    
    self.step = 2;      
  elseif self.step == 2 then 
    if me.roleController.animationFrame == 3 then      
      me.roleController:SetAnimationForceFrame(3);
      me:PlaySound(target.colm, target.row);
      effectData = me:GetFightEffect(target.colm, target.row);
      local attack = FightField.attack[self.humIdx];
      if effectData ~= nil then        
        if effectData.beHitAct ~= 1 then                         --若是為擋的動作,則不秀黃光影        
          ranPos.x = math.random(0,60);
          ranPos.y = math.random(0,60);
          if self.isAttack then
            attack:SetLight(EEffectLightKind.Sky1,10000, 40, 1,4, 4, EEffectLightTracer.StandAni, target.nowPos.x -30 + ranPos.x, target.nowPos.y -30 + ranPos.y, 255, false, 0);
          end
        end
      end
      ranPos.x = math.random(0,60);
      ranPos.y = math.random(0,60);
      if math.random(0, 1) == 0 then 
        attack:SetLight(EEffectLightKind.Sky2 ,10040, 25, 1,9, 9, EEffectLightTracer.StandAni, target.nowPos.x-35+ranPos.x, target.nowPos.y-40+ranPos.y,10, false, 12);
      else
        attack:SetLight(EEffectLightKind.Sky2 ,10040, 50, 1,4, 9, EEffectLightTracer.StandAni, target.nowPos.x-35+ranPos.x, target.nowPos.y-40+ranPos.y,10, false, 12);
      end

      me:PlayEffect(target.colm, target.row, ERolePose.Hit);

      self.interval = 0.7;
      self.step = 3;        
    end
  elseif self.step == 3 then 
    if self:CheckInterval() then 
      me.roleController:SetAnimationForceFrame(255);            
      self.isLightEnd = true;
      self.step = 4;
    end
  end
end