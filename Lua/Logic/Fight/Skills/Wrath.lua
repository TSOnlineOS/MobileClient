Wrath = InheritsFromBaseAttackSkill();

function Wrath:InitExtraParameters()
  self.isHit = false;
  self.lFireBall = {};
  self.lExplode = {};
  self.lSmoke = {};
  self.pos = {};
  self.fireStep = {};     --1:火雨 2:落地爆炸 3:爆炸消失開始冒煙 
end

function Wrath:ExtraClose()
  ClearLightTable(self.lFireBall);
  ClearLightTable(self.lExplode);
  ClearLightTable(self.lSmoke);
end

function Wrath:FireExplode()  
  --火雨落地發生爆炸
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local idx;
  for i= 1, 8 do 
    if self.fireStep[i] == 1 then    
      idx = i;
      self.pos = self:GetPos(i);
      if self.lExplode[idx] == nil or self.lExplode[idx].picId == 0 then      
        --地裂
        self.lExplode[idx] = EffectLight.New(10722,100,1,13,13, EEffectLightTracer.StandAni, self.pos.x+90, self.pos.y+90,30,false,0, self.pos.x+90, self.pos.y+90,0.2);
        self.lExplode[idx]:SetTimeScale(FightField.timeScale);   
        self.lExplode[idx]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);   
        --火球尾巴
        if self.lFireBall[idx] ~= nil then 
          self.lFireBall[idx]:Stop();
        end
        self.lFireBall[idx] = EffectLight.New(10721,50,18,1,18, EEffectLightTracer.StandAni, self.pos.x, self.pos.y,30,false,0, self.pos.x, self.pos.y,0.2);
        self.lFireBall[idx]:SetTimeScale(FightField.timeScale);   
        self.lFireBall[idx]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);   
        me:PlaySound(target.colm, target.row, Attack_Start, 2);
        self.fireStep[idx] = self.fireStep[idx] + 1;
        FightField.SetShake(true);  --地震效果（開）
      end
    end
  end
end

function Wrath:FireRain(idx)
  --撥火雨
  if self.lFireBall[idx] ~= nil then 
    self.lFireBall[idx]:Stop();
  end
  self.pos = self:GetPos(idx);
  self.lFireBall[idx] = EffectLight.New(10721,50,1,18,18, EEffectLightTracer.Line, 0,0,30,false,0, self.pos.x-90, self.pos.y-90,0.2);
  self.lFireBall[idx]:SetTimeScale(FightField.timeScale);   
  self.lFireBall[idx]:SetSortingOrder(FightField.FIGHT_SKY_ORDER);   
  self.fireStep[idx] = self.fireStep[idx] + 1;
end


function Wrath:GetPos(kind)
  local pos = Vector2.zero;
  if kind == 1 then     
    pos.x = 590;
    pos.y = 490;
  elseif kind == 2 then     
    pos.x = 389;
    pos.y = 523;     
  elseif kind == 3 then     
    pos.x = 657;
    pos.y = 402;   
  elseif kind == 4 then     
    pos.x = 456;
    pos.y = 556;  
  elseif kind == 5 then     
    pos.x = 322;
    pos.y = 490;      
  elseif kind == 6 then     
    pos.x = 523;
    pos.y = 457;    
  elseif kind == 7 then     
    pos.x = 590;
    pos.y = 369;    
  elseif kind == 8 then     
    pos.x = 724;
    pos.y = 424;       
  end

  pos.x = pos.x + FightField.skillOffset.x;
  pos.y = pos.y + FightField.skillOffset.y;
  return pos;
end

function Wrath:Update()
  local idx;

  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self.step == 1 then  --起始        
    for i= 1, 8 do
      self.fireStep[i] = 0;
    end
    self.interval = 0.3;
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
  elseif Between(self.step, 2, 9) then        --落下火雨    
    self:FireExplode();
    if self:CheckInterval() then            
      idx = self.step - 1;        
      self:FireRain(idx);
      me:PlaySound(target.colm, target.row, Attack_Start, 1);
      self.interval = 0.3;
      self.step = self.step +1;
    end
  elseif self.step == 10 then  --爆炸        
    self:FireExplode();

    if self:CheckInterval() then      
      for i= 1, 8 do
        if self.lExplode[i].picId == 1 then
            return ;
        end
        me:PlaySound(target.colm, target.row); 
        for i=0, self.emyNum-1 do        
          target = FightField.fightHum[ self.emyIdxAy[i] ];
          me:PlayEffect(target.colm, target.row, ERolePose.Hit,1);    --跳血挨打姿勢
          target.roleController:Hit();
        end
        self.interval = 0.1;
        self.step = 11;
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
  elseif self.step == 11 then     
    if self:CheckInterval() then              
      for i= 1, 8 do        
        self.pos = self:GetPos(i);
        self.lSmoke[i] = EffectLight.New(10019,100,1,15,15, EEffectLightTracer.StandAni, self.pos.x-25+ math.random(0,50), self.pos.y-25+ math.random(0, 50),30,false,0,0,0,0.05);
        self.lSmoke[i]:SetTimeScale(FightField.timeScale);   
        self.lSmoke[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);   
      end
      FightField.SetShake(false);   --地震效果（關）
      self.step = 12;
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
  elseif self.step == 12 then     
    if self.lSmoke[1].picId == 0 then
      self.step = 13;
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
      self.isLightEnd = true;        
    end
  end
end