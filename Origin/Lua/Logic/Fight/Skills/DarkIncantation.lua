DarkIncantation = InheritsFromBaseAttackSkill();

function DarkIncantation:InitExtraParameters()
  self.hit = {};
  self.stOldHitTime = 0;
  self.stHitInterval = {};  --int array
  self.rend = {};
  self.rendNumber = 0;
  self.stRendOldTime = 0;
  self.stRendInterval = 0;

  self.me = FightField.fightHum[self.humIdx];          --設發招者為 self.me
  self.target = FightField.fightHum[self.tarIdx];      --設目標為 self.target
  self.attack = FightField.attack[self.humIdx];
end


function DarkIncantation:ExtraClose()
  for k,v in pairs(self.hit)do
    v.gameObject:SetActive(true);
    v:Stop();
  end

  for k,v in pairs(self.rend)do
    v:Stop();
  end
end


function DarkIncantation:LightPoint()
  --判斷目標為前排或後排，取得相應光影起始位置
  if Contains(self.target.colm ,1, 2) then  --指定目標為前排
    return self.target:GetSpot(EFightSpot.Front, 180);
  else                            --指定目標為後排
    return  self.target:GetSpot(EFightSpot.Front, 240);
  end
end

function DarkIncantation:LightSpeed()
  --判斷目標為前排或後排，取得光影相應之移動速度
  if Contains(self.target.colm, 1, 2) then  --指定目標為前排
    return 0.12;
  else                                 --指定目標為後排
    return 0.18;
  end
end

function DarkIncantation:SetHit()  
  self.me = FightField.fightHum[self.humIdx];
  local target;
  self.stOldHitTime = CGTimer.time;
  for i = 0, self.emyNum-1 do  
    if self.hit[i] ~= nil then
      self.hit[i]:Stop();
    end

    target = FightField.fightHum[ self.emyIdxAy[i] ];
    --擊中光影
    self.hit[i] = EffectLight.New(10000, 60, 1, 4, 4, EEffectLightTracer.Stand, target.nowPos.x+ math.random(0,20), target.nowPos.y-math.random(1,30), 255, true, 55);
    self.hit[i]:SetTimeScale(FightField.timeScale);   
    self.hit[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
    self.stHitInterval[i] = math.random(1,250);
    self.me:PlaySound(target.colm, target.row, Attack_Hit);   --擊中音效
    target.roleController:Hit();                         --挨打動作
    self.me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3); --放血
  end
end

function DarkIncantation:SetRend(pos)  
  self.rendNumber = self.rendNumber + 1;    --地裂光影 +1  
  if self.rend[self.rendNumber-1] ~= nil then 
    self.rend[self.rendNumber-1]:Stop();
  end
  self.rend[self.rendNumber-1] = EffectLight.New(10737, 35, 1, 1, 1, EEffectLightTracer.Stand, pos.x, pos.y, 255, false, 55);
  self.rend[self.rendNumber-1]:SetTimeScale(FightField.timeScale);   
  self.rend[self.rendNumber-1]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);  
  if (self.rendNumber / 2) == 0 then
    self.me:PlaySound(self.target.colm, self.target.row, Attack_Start);
  end
end

function DarkIncantation:UpdateHit()    
  for i = 0, self.emyNum-1 do
    if self.hit[i] ~= nil then  
      if (CGTimer.time - self.stOldHitTime) * 1000 * FightField.timeScale >= self.stHitInterval[i] then
        self.hit[i].gameObject:SetActive(true);
      else
        self.hit[i].gameObject:SetActive(false);
      end
    end
  end
end

function DarkIncantation:Update()
  local newPos, newPos2;
  local speed;
  local interval;  
  --===設地裂光影產生的速度===
  --[[
    因攻擊前排與後排開始的地方為同一點，故若放地裂光影速度相同時，
    打後排的地裂光影為較為稀疏，故以此修正。
  ]]--

  if Contains(self.target.colm, 1, 2) then
    interval = 0.15
  else
    interval = 0.1;
  end
  self:UpdateHit();
  --==========================
  if self.step == 1 then  --第一步
  --發招者做施法動作，身上出現 天符咒 光影
    self.me.roleController:MagicAttack();               --做施法動作
    self.attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10731, 80, 1, 8, 8, EEffectLightTracer.Stand, self.me.nowPos.x, self.me.nowPos.y, 25, false, 35);
    newPos = self:LightPoint();                    --取得施法位置(攻擊目標前方)
    speed = self:LightSpeed();                    --取移動速度
    newPos2 = self.target:GetSpotOfRc(EFightSpot.Front, 30); --取目的地位置
    if self.target.party_Kind == EFightParty.Left then   --人物在左        
      self.attack:SetLightWithOrder(2, EEffectLightDis.Sky, 10738, 35, 1, 17, 17, EEffectLightTracer.Line, newPos.x, newPos.y, 255, true, 15, newPos2.x, newPos2.y, speed);
      self.attack:SetLightWithOrder(3, EEffectLightDis.Sky, 10020, 35, 1, 10, 10, EEffectLightTracer.Line, newPos.x, newPos.y, 30, true, 65, newPos2.x, newPos2.y, speed);        
    else    
      self.attack:SetLightWithOrder(2, EEffectLightDis.Sky, 10739, 35, 1, 17, 17, EEffectLightTracer.Line, newPos.x, newPos.y, 255, true, 15, newPos2.x, newPos2.y, speed);
      self.attack:SetLightWithOrder(3, EEffectLightDis.Sky, 10020, 35, 1, 10, 10, EEffectLightTracer.Line, newPos.x, newPos.u, 30, true, 65, newPos2.x, newPos2.y, speed);
    end
    newPos = Vector2.New(self.attack.lights[2].showPos.x, self.attack.lights[2].showPos.y);
    self:SetRend(newPos);          --設地裂光影
    FightField.SetShake(true); --地震
    self.stRendOldTime = CGTimer.time;
    self.stRendInterval = interval;
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
  elseif self.step == 2 then  --第二步    
    if self.attack.lights[1].orderCount == 7 then --等待 天符咒 播放完畢後，停頓 150毫秒      
      self.interval = 0.15;
      self.step = 3;      
    else    
      if self:CheckInterval() then
        --若光影尚未到達目的地且等待地裂光影時間已到，則再設一道地裂光影
        newPos = Vector2.New(self.attack.lights[2].showPos.x, self.attack.lights[2].showPos.y);
        self:SetRend(newPos);          --設地裂光影
        self.stRendOldTime = CGTimer.time;
        self.stRendInterval = interval;
      end
    end
  elseif self.step == 3 then 
    --第三步
    if self:CheckInterval() then      
      self.attack:StopLight(1);
      self.step = 4;
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
      if (CGTimer.time - self.stRendOldTime) * FightField.timeScale >= self.stRendInterval then
        --若光影尚未到達目的地且等待地裂光影時間已到，則再設一道地裂光影
        newPos = Vector2.New(self.attack.lights[2].showPos.x, self.attack.lights[2].showPos.y);
        self:SetRend(newPos);          --設地裂光影
        self.stRendOldTime = CGTimer.time;
        self.stRendInterval = interval;
      end
    end
  elseif self.step == 4 then         --第四步
    if self.attack.lights[2].isArrive then
    --若光影已到達目的地,設闇咒光影,煙霧光影在目標位置停頓 250毫秒,並設定擊中光影
      newPos = self.target:GetSpotOfRc(EFightSpot.Front, 30);
      self.attack:StopLight(1);
      if self.target.party_Kind == EFightParty.Left then   --人物在左
        self.attack:SetLightWithOrder(2, EEffectLightDis.Sky, 10738, 30, 12, 17, 17, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, true, 15);
      else
        self.attack:SetLightWithOrder(2, EEffectLightDis.Sky, 10739, 30, 12, 17, 17, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, true, 15);
      end
      self.attack:SetLightWithOrder(3, EEffectLightDis.Sky, 10020, 35, 1, 10, 10, EEffectLightTracer.Stand, newPos.x, newPos.y, 30, true, 65);
      self:SetHit();                --設Hit 光影

      self.interval = 0.3;
      self.step = 6;      
    else    
      if (CGTimer.time - self.stRendOldTime) * 1000 * FightField.timeScale >= self.stRendInterval then
        --若光影尚未到達目的地且等待地裂光影時間已到，則再設一道地裂光影
        newPos = Vector2.New(self.attack.lights[2].showPos.x, self.attack.lights[2].showPos.y);
        self:SetRend(newPos);          --設地裂光影
        self.stRendOldTime = CGTimer.time;
        self.stRendInterval = interval;
      end
    end
  elseif self.step == 5 then        --第五步
    if self:CheckInterval() then
      --再設一次擊中光影(闇咒及煙幕光影持續播放)，並停頓 250毫秒
      self:SetHit();    --設Hit 光影
      self.interval = 0.3;
      self.step = 6;
    end
  elseif self.step == 6 then         --第六步
    if self:CheckInterval() then
      --再設一次擊中光影(闇咒及煙幕光影持續播放)，並停頓 250毫秒
      self:SetHit();    --設Hit 光影      
      self.interval = 0.3;
      self.step = 7;
    end
  elseif self.step == 7 then
    if self:CheckInterval() then
      --等待時間已到，停止地震並結束所有光影
      FightField.SetShake(false);  --地震-停
      self.isLightEnd = true; --特技施展完畢
      self.step = 8;
    end
  end
end