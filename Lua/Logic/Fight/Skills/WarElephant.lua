WarElephant = InheritsFromBaseAttackSkill();

function WarElephant:InitExtraParameters()
  self.elephantCount = 17;
  self.elephant = {};
  self.elephant[1] = SkillHorse.NewByCustom(31005, 4, 2, 10);
  self.elephant[1].attackRole:SetVisible(ERoleVisible.Hide);
  self.loading = true;
  self.elephantPos = {};
end

function WarElephant:ExtraClose()
  for k, v in pairs(self.elephant) do
    v:Free();
  end
end

function WarElephant:LoadElphant()
  if not self.loading then 
    return 
  end
  for i = 2, self.elephantCount do
    if self.elephant[i] == nil then 
      self.elephant[i] = SkillHorse.NewByCustom(31005, 4, 2, 10);
      self.elephant[i].attackRole:SetVisible(ERoleVisible.Hide);
      break;
    elseif self.elephant[self.elephantCount] ~= nil then 
      self.loading = false;
    end
  end
end


function WarElephant:AllPoseHit()
  local me = FightField.fightHum[self.humIdx];
  local aim;
  for i = 0, self.emyNum - 1 do
    aim = FightField.fightHum[self.emyIdxAy[i]];
    me:PlayEffect(aim.colm, aim.row, ERolePose.Hit);
  end
end

function WarElephant:GetPosition()
  for k, v in pairs(self.elephant)do
    v:GetPosition();
  end  
end

function WarElephant:isAllArrive()
  for i = 1, self.elephantCount do
    if self.elephant[i].attackRole.arrive == false then
      return false;
    end    
  end
  FightField.SetShake(false);
  return true;  
end

function WarElephant:SetPosition()
  -- const
  local ShowDist = 60;
  -- 象顯示的距離
  local RunDist = ShowDist + 800;
  -- 象跑的距離
  local ElephantDist = 100;
  -- 象和象之間的距離
  --
  -- var
  local runW, showW;
  -- 移到下一個格子長和寬的x,y差值
  runW = { };
  showW = { };

  local me, target;
  local showX, showY, goalX, goalY;
  local defDir;
  -- 顯示的距離
  showW.x = math.round(ShowDist * FieldSinSitaW);
  showW.y = math.round(ShowDist * FieldCosSitaW);
  -- 目的地的距離
  runW.x = math.round(RunDist * FieldSinSitaW);
  runW.y = math.round(RunDist * FieldCosSitaW);

  me = FightField.fightHum[self.humIdx];
  target = FightField.fightHum[self.tarIdx];

  if me.party_Kind == EFightParty.Right then
    defDir = 1
  else
    defDir = 2;
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

  if defDir == 1 then
    showX = FightField.chip[target.colm + 2][2].x - showW.x;
    showY = FightField.chip[target.colm + 2][2].y - showW.y;
    goalX = FightField.chip[target.colm + 2][2].x - runW.x;
    goalY = FightField.chip[target.colm + 2][2].y - runW.y;
  elseif defDir == 2 then
    showX = FightField.chip[target.colm - 2][2].x + showW.x;
    showY = FightField.chip[target.colm - 2][2].y + showW.y;
    goalX = FightField.chip[target.colm - 2][2].x + runW.x;
    goalY = FightField.chip[target.colm - 2][2].y + runW.y;
  end

  if defDir == 1 then
    self.elephant[2]:SetPosition(1, showX + math.round(3.0 * ElephantDist), showY + math.round(0.1 * ElephantDist), goalX + math.round(3.0 * ElephantDist), goalY + math.round(0.1 * ElephantDist));
    self.elephant[3]:SetPosition(1, showX + math.round(2.6 * ElephantDist), showY + math.round(0.3 * ElephantDist), goalX + math.round(2.6 * ElephantDist), goalY + math.round(0.3 * ElephantDist));
    self.elephant[4]:SetPosition(1, showX + math.round(2.2 * ElephantDist), showY + math.round(0.5 * ElephantDist), goalX + math.round(2.2 * ElephantDist), goalY + math.round(0.5 * ElephantDist));
    self.elephant[5]:SetPosition(1, showX + math.round(1.8 * ElephantDist), showY + math.round(0.7 * ElephantDist), goalX + math.round(1.8 * ElephantDist), goalY + math.round(0.7 * ElephantDist));
    self.elephant[6]:SetPosition(1, showX + math.round(1.4 * ElephantDist), showY + math.round(0.9 * ElephantDist), goalX + math.round(1.4 * ElephantDist), goalY + math.round(0.9 * ElephantDist));
    self.elephant[7]:SetPosition(1, showX + math.round(1.0 * ElephantDist), showY + math.round(1.1 * ElephantDist), goalX + math.round(1.0 * ElephantDist), goalY + math.round(1.1 * ElephantDist));
    self.elephant[8]:SetPosition(1, showX + math.round(0.6 * ElephantDist), showY + math.round(1.3 * ElephantDist), goalX + math.round(0.6 * ElephantDist), goalY + math.round(1.3 * ElephantDist));
    self.elephant[9]:SetPosition(1, showX + math.round(0.2 * ElephantDist), showY + math.round(1.5 * ElephantDist), goalX + math.round(0.2 * ElephantDist), goalY + math.round(1.5 * ElephantDist));

    self.elephant[10]:SetPosition(1, showX + math.round(3.8 * ElephantDist), showY + math.round(0.5 * ElephantDist), goalX + math.round(3.8 * ElephantDist), goalY + math.round(0.5 * ElephantDist));
    self.elephant[11]:SetPosition(1, showX + math.round(3.4 * ElephantDist), showY + math.round(0.7 * ElephantDist), goalX + math.round(3.4 * ElephantDist), goalY + math.round(0.7 * ElephantDist));
    self.elephant[12]:SetPosition(1, showX + math.round(3.0 * ElephantDist), showY + math.round(0.9 * ElephantDist), goalX + math.round(3.0 * ElephantDist), goalY + math.round(0.9 * ElephantDist));
    self.elephant[13]:SetPosition(1, showX + math.round(2.6 * ElephantDist), showY + math.round(1.1 * ElephantDist), goalX + math.round(2.6 * ElephantDist), goalY + math.round(1.1 * ElephantDist));
    self.elephant[14]:SetPosition(1, showX + math.round(2.2 * ElephantDist), showY + math.round(1.3 * ElephantDist), goalX + math.round(2.2 * ElephantDist), goalY + math.round(1.3 * ElephantDist));
    self.elephant[15]:SetPosition(1, showX + math.round(1.8 * ElephantDist), showY + math.round(1.5 * ElephantDist), goalX + math.round(1.8 * ElephantDist), goalY + math.round(1.5 * ElephantDist));
    self.elephant[16]:SetPosition(1, showX + math.round(1.4 * ElephantDist), showY + math.round(1.7 * ElephantDist), goalX + math.round(1.4 * ElephantDist), goalY + math.round(1.7 * ElephantDist));
    self.elephant[17]:SetPosition(1, showX + math.round(1.0 * ElephantDist), showY + math.round(1.9 * ElephantDist), goalX + math.round(1.0 * ElephantDist), goalY + math.round(1.9 * ElephantDist));
  elseif defDir == 2 then
    self.elephant[2]:SetPosition(5, showX + math.round(0.1 * ElephantDist), showY - math.round(1.3 * ElephantDist), goalX + math.round(0.1 * ElephantDist), goalY - math.round(1.3 * ElephantDist));
    self.elephant[3]:SetPosition(5, showX - math.round(0.3 * ElephantDist), showY - math.round(1.1 * ElephantDist), goalX - math.round(0.3 * ElephantDist), goalY - math.round(1.1 * ElephantDist));
    self.elephant[4]:SetPosition(5, showX - math.round(0.7 * ElephantDist), showY - math.round(0.9 * ElephantDist), goalX - math.round(0.7 * ElephantDist), goalY - math.round(0.9 * ElephantDist));
    self.elephant[5]:SetPosition(5, showX - math.round(1.1 * ElephantDist), showY - math.round(0.7 * ElephantDist), goalX - math.round(1.1 * ElephantDist), goalY - math.round(0.7 * ElephantDist));
    self.elephant[6]:SetPosition(5, showX - math.round(1.5 * ElephantDist), showY - math.round(0.5 * ElephantDist), goalX - math.round(1.5 * ElephantDist), goalY - math.round(0.5 * ElephantDist));
    self.elephant[7]:SetPosition(5, showX - math.round(1.9 * ElephantDist), showY - math.round(0.3 * ElephantDist), goalX - math.round(1.9 * ElephantDist), goalY - math.round(0.3 * ElephantDist));
    self.elephant[8]:SetPosition(5, showX - math.round(2.3 * ElephantDist), showY - math.round(0.1 * ElephantDist), goalX - math.round(2.3 * ElephantDist), goalY - math.round(0.1 * ElephantDist));
    self.elephant[9]:SetPosition(5, showX - math.round(2.7 * ElephantDist), showY + math.round(0.1 * ElephantDist), goalX - math.round(2.7 * ElephantDist), goalY + math.round(0.1 * ElephantDist));

    self.elephant[10]:SetPosition(5, showX + math.round(0.8 * ElephantDist), showY - math.round(1.0 * ElephantDist), goalX + math.round(0.8 * ElephantDist), goalY - math.round(1.0 * ElephantDist));
    self.elephant[11]:SetPosition(5, showX + math.round(0.4 * ElephantDist), showY - math.round(0.8 * ElephantDist), goalX + math.round(0.4 * ElephantDist), goalY - math.round(0.8 * ElephantDist));
    self.elephant[12]:SetPosition(5, showX - math.round(0.0 * ElephantDist), showY - math.round(0.6 * ElephantDist), goalX - math.round(0.0 * ElephantDist), goalY - math.round(0.6 * ElephantDist));
    self.elephant[13]:SetPosition(5, showX - math.round(0.4 * ElephantDist), showY - math.round(0.4 * ElephantDist), goalX - math.round(0.4 * ElephantDist), goalY - math.round(0.4 * ElephantDist));
    self.elephant[14]:SetPosition(5, showX - math.round(0.8 * ElephantDist), showY - math.round(0.2 * ElephantDist), goalX - math.round(0.8 * ElephantDist), goalY - math.round(0.2 * ElephantDist));
    self.elephant[15]:SetPosition(5, showX - math.round(1.2 * ElephantDist), showY + math.round(0.0 * ElephantDist), goalX - math.round(1.2 * ElephantDist), goalY + math.round(0.0 * ElephantDist));
    self.elephant[16]:SetPosition(5, showX - math.round(1.6 * ElephantDist), showY + math.round(0.2 * ElephantDist), goalX - math.round(1.6 * ElephantDist), goalY + math.round(0.2 * ElephantDist));
    self.elephant[17]:SetPosition(5, showX - math.round(2.0 * ElephantDist), showY + math.round(0.4 * ElephantDist), goalX - math.round(2.0 * ElephantDist), goalY + math.round(0.4 * ElephantDist));
  end
end

function WarElephant:UpdateElephant()
  for k,v in pairs(self.elephant)do
    v:Update();
  end
end

function WarElephant:Update()  
  local newPos,newPos1;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local attack = FightField.attack[self.humIdx]; 
  self:LoadElphant();
  self:UpdateElephant();   
  if self.step == 1 then                 
    newPos = me:GetMagicPos();
    me.roleController:MagicAttack();
    --土魔法陣
    attack:SetLightWithOrder(1, EEffectLightDis.Ground,10080,50,1,21,21, EEffectLightTracer.StandAni, me.nowPos.x+6, me.nowPos.y,20, true, 80);
    self.elephant[1].attackRole:SetVisible(ERoleVisible.Visible);              
    self.elephant[1].attackRole.roleController:SetInBattle(true);
    self.elephant[1].dSpeedKind = 3;
    self.elephant[1]:SetShrink(MinShrink+1);      --縮小  最小的Size;
    if target.party_Kind == EFightParty.Left then  --人在左    
      newPos1= {};    
      newPos1.x = FightField.chip[3][2].x;
      newPos1.y = FightField.chip[3][2].y;
      self.elephant[1]:SetPosition(1, newPos1.x, newPos1.y, newPos.x, newPos.y);        
    else    
      newPos1 = {};
      newPos1.x = FightField.chip[0][2].x;
      newPos1.y = FightField.chip[0][2].y;
      self.elephant[1]:SetPosition(5, newPos1.x, newPos1.y, newPos.x, newPos.y);
    end        
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
    self:GetPosition();
    if self.elephant[1].attackRole.arrive then  
      self.elephant[1].attackRole.roleController:MagicAttack();      
      self.interval = 0.4;
      self.step = 3;          
    end    
  elseif self.step == 3 then     
    if self:CheckInterval() and self.loading == false then       
      newPos = me:GetMagicPos();
      newPos1 = target:GetSpot(EFightSpot.Back, 200);
      if target.party_Kind == EFightParty.Left then  --人在左
        self.elephant[1]:SetPosition(1, newPos.x, newPos.y, newPos1.x, newPos1.y)
      else
        self.elephant[1]:SetPosition(5, newPos.x, newPos.y, newPos1.x, newPos1.y);
      end
      for k,v in pairs(self.elephant)do              
        v.attackRole.roleController:SetIsMoving(true);
        v.attackRole:SetVisible(ERoleVisible.Visible);
      end

      self:SetPosition();
      FightField.SetShake(true);
      me:PlaySound(target.colm, target.row, Attack_Start, 1);  

      self.interval = 0.35;          
      self.step = 4;
    end
  elseif self.step == 4 then       
    me:PlaySound(target.colm, target.row, Attack_Hit, 2);   --92/7/16-5F
    if self:CheckInterval() then
      self.step = 5;          
    end
  elseif self.step == 5 then       
    self:GetPosition();
    if me.party_Kind == EFightParty.Right then        
      if (self.elephant[3].attackRole.nowPos.x<=FightField.chip[1][2].x) and (self.elephant[3].attackRole.nowPos.y<=FightField.chip[1][2].y) then            
        self:AllPoseHit();
        self.step = 6;
      end      
    else    
      if (self.elephant[3].attackRole.nowPos.x>=FightField.chip[2][2].x) and (self.elephant[3].attackRole.nowPos.y>=FightField.chip[2][2].y) then                            
        self:AllPoseHit();
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
  elseif self.step == 6 then       
    self:GetPosition();
    if self:isAllArrive() then 
      self.step = 7;
      self.isLightEnd = true;
    end
  end
end