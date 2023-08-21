ElephantsCrush = InheritsFromBaseAttackSkill();

function ElephantsCrush:InitExtraParameters()
  self.horse = {}; 
  self.horsePos = {};
  for i=1, MaxArmyElephant do
    self.horse[i] = SkillHorse.New(2);
    self.horsePos[i] = Vector2.zero;
  end
end

function ElephantsCrush:ExtraClose()
  for i=1, MaxArmyElephant do  
    if self.horse[i] ~= nil then 
      self.horse[i]:Free()
      self.horse[i] = nil;
    end
  end
end

function ElephantsCrush:isAllArrive()  
  if self.step==4 then  
    for i=1, MaxArmyElephant do
      if self.horse[i].attackRole.arrive == false then      
        return false;        
      end
    end
    FightField.SetShake(false);
    return true;
  end
  return false;
end

function ElephantsCrush:SetPosition()
--const
  local ShowDist = 50;               --馬顯示的距離
  local RunDist = ShowDist+800;      --馬跑的距離
  local HorseDist = 100;              --馬和馬之間的距離  
  local runW, showW;  --TPoint;   //移到下一個格子長和寬的x,y差值FieldSinSitaW
  local showX, showY, goalX, goalY;  
  local defDir;  


  --顯示的距離
  showW = {};
  showW.x = math.round(ShowDist*FieldSinSitaW);
  showW.y = math.round(ShowDist*FieldCosSitaW);
  --目的地的距離
  runW = {};
  runW.x = math.round(RunDist*FieldSinSitaW);
  runW.y = math.round(RunDist*FieldCosSitaW);

  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if me.party_Kind == EFightParty.Right then
    defDir = 1;
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
  else
    defDir = 2;
  end

  local chip;
  if defDir == 1 then
    chip = FightField.chip[target.colm + 2][target.row];         
    showX = chip.x - showW.x;
    showY = chip.y - showW.y;
    goalX = chip.x - runW.x;
    goalY = chip.y - runW.y;      
  elseif defDir == 2 then
    showX = FightField.chip[target.colm - 2][me.row].x + showW.x;
    showY = FightField.chip[target.colm - 2][me.row].y + showW.y;
    goalX = FightField.chip[target.colm - 2][target.row].x + runW.x;
    goalY = FightField.chip[target.colm - 2][target.row].y + runW.y;         
  else  --若不是1(人在右)也不是2(人在左),則用 1 的設定
    chip = FightField.chip[target.colm + 2][target.row];         
    showX = chip.x - showW.x;
    showY = chip.y - showW.y;
    goalX = chip.x - runW.x;
    goalY = chip.y - runW.y;    
  end

  if defDir == 1 then     
    self.horse[1]:SetPosition(1, showX +2*HorseDist, showY - math.round(0.3 * HorseDist) + 60, goalX+2*HorseDist, goalY - math.round(0.3 * HorseDist) + 60);
    self.horse[2]:SetPosition(1, showX +1*HorseDist, showY - math.round(0.3 * HorseDist), goalX+1*HorseDist, goalY - math.round(0.3 * HorseDist));
    self.horse[3]:SetPosition(1, showX +3*HorseDist, showY - math.round(0.3 * HorseDist) + 120, goalX+3*HorseDist, goalY - math.round(0.3 * HorseDist) + 120);
    self.horse[4]:SetPosition(1, showX +2*HorseDist, showY + math.round(0.4 * HorseDist) + 60, goalX+2*HorseDist, goalY + math.round(0.4 * HorseDist) + 60);
    self.horse[5]:SetPosition(1, showX +1*HorseDist, showY + math.round(0.4 * HorseDist), goalX+1*HorseDist, goalY + math.round(0.4 * HorseDist));
    self.horse[6]:SetPosition(1, showX, showY + math.round(0.4 * HorseDist) - 60, goalX, goalY + math.round(0.4 * HorseDist) - 60);
    self.horse[7]:SetPosition(1, showX +2*HorseDist, showY + math.round(1.0 * HorseDist) + 60, goalX+2*HorseDist, goalY + math.round(1.0 * HorseDist) + 60);
    self.horse[8]:SetPosition(1, showX +1*HorseDist, showY + math.round(1.0 * HorseDist), goalX+1*HorseDist, goalY + math.round(1.0 * HorseDist));
    self.horse[9]:SetPosition(1, showX, showY + math.round(1.0 * HorseDist) - 60, goalX, goalY + math.round(1.0 * HorseDist) - 60);
  elseif defDir == 2 then 
    self.horse[1]:SetPosition(5, showX +2*HorseDist, showY - math.round(0.3 * HorseDist) + 60, goalX+2*HorseDist, goalY - math.round(0.3 * HorseDist) + 60);
    self.horse[2]:SetPosition(5, showX +1*HorseDist, showY - math.round(0.3 * HorseDist), goalX+1*HorseDist, goalY - math.round(0.3 * HorseDist));
    self.horse[3]:SetPosition(5, showX, showY - math.round(0.3 * HorseDist) - 60, goalX, goalY - math.round(0.3 * HorseDist) - 60);
    self.horse[4]:SetPosition(5, showX +2*HorseDist, showY + math.round(0.4 * HorseDist) + 60, goalX+2*HorseDist, goalY + math.round(0.4 * HorseDist) + 60);
    self.horse[5]:SetPosition(5, showX +1*HorseDist, showY + math.round(0.4 * HorseDist), goalX+1*HorseDist, goalY + math.round(0.4 * HorseDist));
    self.horse[6]:SetPosition(5, showX, showY + math.round(0.4 * HorseDist) - 60, goalX, goalY + math.round(0.4 * HorseDist) - 60);
    self.horse[7]:SetPosition(5, showX +2*HorseDist, showY + math.round(1.0 * HorseDist) - 120, goalX+2*HorseDist, goalY + math.round(1.0 * HorseDist) - 120);
    self.horse[8]:SetPosition(5, showX +1*HorseDist, showY + math.round(1.0 * HorseDist), goalX+1*HorseDist, goalY + math.round(1.0 * HorseDist));
    self.horse[9]:SetPosition(5, showX, showY + math.round(1.0 * HorseDist) - 60, goalX, goalY + math.round(1.0 * HorseDist) - 60);
  end
end

function ElephantsCrush:UpdateHorse()
  for i=1, MaxArmyElephant do
    self.horse[i]:Update();
  end
end

function ElephantsCrush:Update()  
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self.step == 1 then     
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();

    --030601J土魔法陣
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground,10080,50,1,21,21, EEffectLightTracer.StandAni, me.nowPos.x+6, me.nowPos.y,20, true, 80);

    self.interval = 0.8;
  
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
      self:SetPosition();
      FightField.SetShake(true);
      me:PlaySound(target.colm, target.row, Attack_Start);   --92/7/16-5F
      self.step = 3;                 
    end
  elseif self.step == 3 then     
    self:UpdateHorse()
    if me.party_Kind == EFightParty.Right then          
      if (self.horse[3].attackRole.nowPos.x <= FightField.chip[1][2].x) and (self.horse[3].attackRole.nowPos.y <= FightField.chip[1][2].y) then            
        for k, v in pairs(self.emyIdxAy)do
          target = FightField.fightHum[v];
          me:PlayEffect(target.colm, target.row, ERolePose.Hit);
        end
        me:PlaySound(target.colm, target.row);   
        self.step = 4;
      end      
    else    
      if (self.horse[3].attackRole.nowPos.x >= FightField.chip[2][2].x) and (self.horse[3].attackRole.nowPos.y >= FightField.chip[2][2].y) then            
        for k, v in pairs(self.emyIdxAy)do
          target = FightField.fightHum[v];
          me:PlayEffect(target.colm, target.row, ERolePose.Hit);
        end
        me:PlaySound(target.colm, target.row);
        self.step = 4;            
      end
    end
  elseif self.step == 4 then           
    self:UpdateHorse();
    if self:isAllArrive() then 
      self.step = 5;
      self.isLightEnd = true;
    end       
  end
end