SkillHorse = {};
SkillHorse.__index = SkillHorse;

function SkillHorse.New(showKind)
  local self = {};
  setmetatable(self, SkillHorse);
  
  self.startTime = CGTimer.time;
  self.isStart = false

  self.pathMed = {};
  for i = 0, 3 do
    self.pathMed[i] = Vector2.zero;
  end

  self.smokeArray = {};
  for i = 1, 3 do
    self.smokeArray[i] = EffectLight.New(10016, 60, 1, 14, 15, EEffectLightTracer.Stand, 0, 0, 25, true); 
    self.smokeArray[i]:SetTimeScale(FightField.timeScale);   
    self.smokeArray[i]:SetSortingOrder(FightField.FIGHT_GROUND_ORDER);
    self.smokeArray[i].gameObject:SetActive(false);
  end
  self.smokeIdx = 0;                --煙的Idx
  self.smokePos = Vector2.zero;     --煙的位置
  self.sWidth = 0;                --煙的大小
  self.sHeight = 0;
  self.sCount = 0;      --播放到第幾張煙
  self.sAllPage = 0;    --煙有幾張
  self.smokeOldTime = CGTimer.time;


  self.showKind = showKind;    --1:秀馬2:秀象
  self.dSpeedKind = 1;  --移動的速度
  if self.showKind == 1 then 
    self.attackRole = AttackRole.New(ESkill_Kind.ArmyHorse, EHuman.Duplicate, 18001); --一般的馬
  
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
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
  elseif self.showKind == 2 then 
    self.attackRole = AttackRole.New(ESkill_Kind.ArmyHorse, EHuman.Duplicate, 31001); --一般的象
  elseif self.showKind == 3 then 
    self.attackRole = AttackRole.New(ESkill_Kind.ArmyHorse, EHuman.Duplicate, 18020); --戰馬
  elseif self.showKind == 4 then 
    self.attackRole = AttackRole.New(ESkill_Kind.ArmyHorse, EHuman.Duplicate, 31005); --戰馬
  else
    self.attackRole = AttackRole.New(ESkill_Kind.ArmyHorse, EHuman.Duplicate, 18001); --一般的馬
  end

  return self;
end

function SkillHorse.NewByCustom(npcId, showKind, speedKind, shrink)
  local self = {};
  setmetatable(self, SkillHorse);
  
  self.startTime = CGTimer.time;
  self.isStart = false

  self.pathMed = {};
  for i = 0, 3 do
    self.pathMed[i] = Vector2.zero;
  end

  self.smokeArray = {};
  for i = 1, 3 do
    self.smokeArray[i] = EffectLight.New(10016, 60, 1, 14, 15, EEffectLightTracer.Stand, 0, 0, 25, true);  
    self.smokeArray[i]:SetTimeScale(FightField.timeScale);     
    self.smokeArray[i]:SetSortingOrder(FightField.FIGHT_GROUND_ORDER);
    self.smokeArray[i].gameObject:SetActive(false);
  end
  self.smokeIdx = 0;                --煙的Idx
  self.smokePos = Vector2.zero;     --煙的位置
  self.sWidth = 0;                --煙的大小
  self.sHeight = 0;
  self.sCount = 0;      --播放到第幾張煙
  self.sAllPage = 0;    --煙有幾張
  self.smokeOldTime = CGTimer.time;
  
  self.showKind = showKind;    --1:秀馬2:秀象
  self.dSpeedKind = speedKind;  --移動的速度
  self.attackRole = AttackRole.New(ESkill_Kind.ArmyHorse, EHuman.Duplicate, npcId);
  self:SetShrink(shrink);

  return self;
end

function SkillHorse:SetShrink(shrink)
  local scale = shrink / DefShrink;
  self.attackRole.roleController.gameObject.transform.localScale = Vector3.New(scale, scale, scale);
end

function SkillHorse:Free()
  self.attackRole:Free();
  for k, v in pairs(self.smokeArray) do
    v:Stop();
  end
end

function SkillHorse:GetPosition()
--const
  local DSpeed = 0.48;
  local DSpeed2 = 0.33;
  local DSpeed3 = 0.16;

  local dx,dy,m, den;
  local dTime;
  local moveDist;  --移動距離
  local i;

  if self.isStart == false then      
    if (CGTimer.time - self.attackRole.moveOldTime) * 1000 >= (self.startTime / FightField.timeScale) then    
      self.attackRole.moveOldTime = CGTimer.time;
      self.isStart = true;
    end
    return;
  end

  local speed;
  if self.dSpeedKind == 1 then 
    speed = DSpeed;
  elseif self.dSpeedKind == 2 then 
    speed = DSpeed2;
  elseif self.dSpeedKind == 3 then 
    speed = DSpeed3;
  else  --預設使用 1 的設定
    speed = DSpeed;
  end

  self.attackRole:GetPosition(speed);

  if (math.abs(self.pathMed[0].x- self.attackRole.nowPos.x) >50) or (math.abs(self.pathMed[0].y- self.attackRole.nowPos.y) >50) then  
    self.pathMed[0] = Vector2.New(self.attackRole.nowPos.x, self.attackRole.nowPos.y);

    for i=3 ,1,-1 do    
      self.pathMed[i] = self.pathMed[i-1];
    end
    --table.Dump(self.pathMed);
  end
end

function SkillHorse:Reset()
  self.attackRole.moveOldTime = CGTimer.time;
  self.attackRole.arrive = false;
  self.attackRole.roleController:SetAnimationForceId(ERolePose.None);
end

function SkillHorse:SetPosition(dir, showX, showY, goalX, goalY)
  self:Reset();
  self.attackRole.roleController:SetDirection(dir);
  self.attackRole.nowPos = Vector2.New(showX, showY);
  self.attackRole.goal = Vector2.New(goalX, goalY);  
  self.isStart = true;
  
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
end

function SkillHorse:SetPositionWithPose(rolePose, showX, showY, goalX, goalY)
  self:Reset();
  self.attackRole.roleController:SetAnimationForceId(rolePose);
  self.attackRole.nowPos = Vector2.New(showX, showY);
  self.attackRole.goal = Vector2.New(goalX, goalY);  
  self.isStart = true;
end

function SkillHorse:UpdateSmoke()
  for i=1, 3 do
    if (self.pathMed[i].x ~= 0) or (self.pathMed[i].y ~=0) then    
      self.smokeArray[i].gameObject:SetActive(true);
      self.smokeArray[i]:SetShowPos(Vector2.New(self.pathMed[i].x + 50, self.pathMed[i].y + 100));            
    else
      self.smokeArray[i].gameObject:SetActive(false);
    end
  end
end

function SkillHorse:Update()
  self:GetPosition();
  self.attackRole:Update();
  self:UpdateSmoke();
end


ArmyHorse = InheritsFromBaseAttackSkill();


function ArmyHorse:InitExtraParameters()
  self.horse = {}; 
  self.horsePos = {};  
  for i=1, MaxArmyHorse do
    self.horse[i] = SkillHorse.New(1); 
    self.horsePos[i] = Vector2.zero;
  end
end

function ArmyHorse:AllHit()
  local me = FightField.fightHum[self.humIdx];
  for k, v in pairs(self.emyIdxAy)do
    local target = FightField.fightHum[v];
    me:PlayEffect(target.colm, target.row, ERolePose.Hit)
  end
end

function ArmyHorse:ExtraClose()
  for i=1, MaxArmyHorse do  
    if self.horse[i] ~= nil then 
      self.horse[i]:Free()
      self.horse[i] = nil;
    end
  end
end

function ArmyHorse:isAllArrive()  
  if self.step==4 then  
    for i=1, MaxArmyHorse do
      if self.horse[i].attackRole.arrive == false then      
        return false;        
      end
    end
    FightField.SetShake(false);
    return true;
  end
  return false;
end

function ArmyHorse:SetPosition()
--const
  local ShowDist = 50;               --馬顯示的距離
  local RunDist = ShowDist+800;      --馬跑的距離
  local HorseDist = 60;              --馬和馬之間的距離  
  local runW, showW;  --TPoint;   //移到下一個格子長和寬的x,y差值FieldSinSitaW
  local showX, showY, goalX, goalY;  
  local defDir;
  
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

  --顯示的距離
  showW = {};
  showW.x = math.round(ShowDist*FieldSinSitaW);
  showW.y = math.round(ShowDist*FieldCosSitaW);
  --目的地的距離
  runW = {};
  runW.x = math.round(RunDist*FieldSinSitaW);
  runW.y = math.round(RunDist*FieldCosSitaW);

  local me = FightField.fightHum[self.humIdx];

  if me.party_Kind == EFightParty.Right then
    defDir = 1;
  else
    defDir = 2;
  end

  local chip = FightField.chip[me.colm][me.row];
  if defDir == 1 then         
    showX = chip.x - showW.x;
    showY = chip.y - showW.y;
    goalX = chip.x - runW.x;
    goalY = chip.y - runW.y;      
  elseif defDir == 2 then
    showX = chip.x + showW.x;
    showY = chip.y + showW.y;
    goalX = chip.x + runW.x;
    goalY = chip.y + runW.y;         
  else  --若不是1(人在右)也不是2(人在左),則用 1 的設定
    showX = chip.x - showW.x;
    showY = chip.y - showW.y;
    goalX = chip.x - runW.x;
    goalY = chip.y - runW.y;      
  end

  if defDir == 1 then     
    self.horse[1]:SetPosition(1, showX +2*HorseDist, showY, goalX+2*HorseDist, goalY);
    self.horse[2]:SetPosition(1, showX +1*HorseDist, showY, goalX+1*HorseDist, goalY);
    self.horse[3]:SetPosition(1, showX, showY, goalX, goalY);
    self.horse[4]:SetPosition(1, showX, showY+1*HorseDist, goalX, goalY+1*HorseDist);
    self.horse[5]:SetPosition(1, showX, showY+2*HorseDist, goalX, goalY+2*HorseDist);
  elseif defDir == 2 then 
    self.horse[1]:SetPosition(5, showX -2*HorseDist, showY, goalX-2*HorseDist, goalY);
    self.horse[2]:SetPosition(5, showX -1*HorseDist, showY, goalX-1*HorseDist, goalY);
    self.horse[3]:SetPosition(5, showX, showY, goalX, goalY);
    self.horse[4]:SetPosition(5, showX, showY-1*HorseDist, goalX, goalY-1*HorseDist);
    self.horse[5]:SetPosition(5, showX, showY-2*HorseDist, goalX, goalY-2*HorseDist);
  end
end

function ArmyHorse:UpdateHorse()
  for i=1, MaxArmyHorse do
    self.horse[i]:Update();
  end
end

function ArmyHorse:Update()  
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
    local colm = 0;
    if me.party_Kind == EFightParty.Right then 
      colm = 1;
    else
      colm = 2;
    end

    if (self.horse[3].attackRole.nowPos.x <= FightField.chip[colm][2].x) and (self.horse[3].attackRole.nowPos.y <= FightField.chip[colm][2].y) then  
      self:AllHit();
      me:PlaySound(target.colm, target.row);   
      self.step = 4;
    end      
  elseif self.step == 4 then           
    self:UpdateHorse();
    if self:isAllArrive() then 
      self.step = 5;
      self.isLightEnd = true;
    end       
  end
end