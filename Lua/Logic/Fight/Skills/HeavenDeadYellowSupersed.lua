HeavenDeadYellowSupersed = InheritsFromBaseAttackSkill();

function HeavenDeadYellowSupersed:InitExtraParameters()
  self.taoistMagicFigures = {};
  self.fireLight = {};
  self.lightNum = 35;
end

function HeavenDeadYellowSupersed:ExtraClose()
  ClearLightTable(self.taoistMagicFigures);
  ClearLightTable(self.fireLight);
end


function HeavenDeadYellowSupersed.FindEmpty(light, max)  
  for i = 1, max - 1 do
    if light[i] == nil then    
      return i;
    end
  end
  return max;
end

function HeavenDeadYellowSupersed:GetEndPos(startPos)
  local rj;
  local me = FightField.fightHum[self.humIdx];
  if me.party_Kind == EFightParty.Right then
    rj = 1;
  else
    rj = 5;
  end

  return FightField.GetNextPos(startPos, rj, 280);
end

function HeavenDeadYellowSupersed:GetStartPos()
  local newPos, newPos2;
  local row, rj;
  local dist, shiftX, shiftY
  
  local me = FightField.fightHum[self.humIdx];
  row = math.random(0,4);
  newPos = Vector2.New(FightField.chip[me.colm][row].x, FightField.chip[me.colm][row].y);
  if Contains(me.colm, 1, 2) then
    dist = 60;
  else
    dist = 120;
  end

  if me.party_Kind == EFightParty.Right then
    rj = 1;
  else
    rj = 5;
  end

  newPos2 = FightField.GetNextPos(newPos, rj, dist);
  shiftX = math.random(0,20) - 20;
  shiftY = math.random(40) - 40;
  return Vector2.New(newPos2.x + shiftX, newPos2.y + shiftY);
end

function HeavenDeadYellowSupersed:SetFuChih(idx)
  local newPos, newPos2;
  if idx >= self.lightNum then
    return
  end

  if self.taoistMagicFigures[idx] ~= nil then
    self.taoistMagicFigures[idx]:Stop();
  end
  newPos = self:GetStartPos();          --取符咒出現位置
  newPos2 = self:GetEndPos(newPos);     --取符咒結束位置
  local me = FightField.fightHum[self.humIdx];
  if me.party_Kind == EFightParty.Right then --符咒光影
    self.taoistMagicFigures[idx] = EffectLight.New(10720, 70, 1, 17, 17, EEffectLightTracer.Line, newPos.x, newPos.y, 25, true, 0, newPos2.x, newPos2.y, 0.20)
  else
    self.taoistMagicFigures[idx] = EffectLight.New(10720, 70, 17, 1, 17, EEffectLightTracer.Line, newPos.x, newPos.y, 25, true, 0, newPos2.x, newPos2.y, 0.20);
  end
  self.taoistMagicFigures[idx]:SetTimeScale(FightField.timeScale);  
  self.taoistMagicFigures[idx]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
end

function HeavenDeadYellowSupersed:Update()
  local idx;
  local newPos;  
  self:UpdateFuChih();
  --self:UpdateFire();
  local me = FightField.fightHum[self.humIdx];          --設發招者為 me
  local target = FightField.fightHum[self.tarIdx];      --設目標為 target
  local attack = FightField.attack[self.humIdx];
  if self.step == 1 then     
    me.roleController:MagicAttack();      --做施法動作    
    me:PlaySound(target.colm, target.row, Attack_Start, 1);
    if me.party_Kind == EFightParty.Right then   --天符咒
      attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10731, 80, 1, 8, 8, EEffectLightTracer.Stand, 280, 145, 10, false, 0);
    else
      attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10731, 80, 1, 8, 8, EEffectLightTracer.Stand, -53, -34, 10, false, 0);
    end
    self.step = 2;
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
  elseif self.step == 2 then 
    if attack.lights[1].orderCount == 3 then      
      if me.party_Kind == EFightParty.Right then   --地符咒
        attack:SetLightWithOrder(2, EEffectLightDis.Sky, 10732, 70, 1, 9, 9, EEffectLightTracer.Stand, 190, 185, 10, false, 0);
      else
        attack:SetLightWithOrder(2, EEffectLightDis.Sky, 10732, 70, 1, 9, 9, EEffectLightTracer.Stand, -137, -4, 10, false, 0);
      end
      self.step = 3;
    end
  elseif self.step == 3 then 
    if attack.lights[2].orderCount == 3 then      
      if me.party_Kind == EFightParty.Right then   --人符咒
        attack:SetLightWithOrder(3, EEffectLightDis.Sky, 10733, 80, 1, 8, 8, EEffectLightTracer.Stand, 100, 225, 10, false, 0);
      else
        attack:SetLightWithOrder(3, EEffectLightDis.Sky, 10733, 80, 1, 8, 8, EEffectLightTracer.Stand, -227, 46, 10, false, 0);
      end
      self.step = 4;
    end
  elseif self.step == 4 then 
  --第三張符咒出現後停頓 0.1 秒
    if attack.lights[3].orderCount == 7 then      
      self.interval = 0.1;
      self.step = 5;
    end
  elseif self.step == 5 then 
    if self:CheckInterval() then
      attack:StopLight(1);
      attack:StopLight(2);
      attack:StopLight(3);
      FightField.SetDrawBlack(0, 100, 10);  --畫黑夜
      --蒼天已死黃天當立字樣
      attack:SetLightWithOrder(4, EEffectLightDis.Sky, 10712, 180, 1, 23, 23, EEffectLightTracer.StandAni, 0, 100, 13, false, 0);
      --符咒
      self:SetFuChih(0);  --設定符咒飛出
      me:PlaySound(target.colm, target.row, Attack_Start, 2);
      FightField.SetShake(true); --地震

      self.interval = 0.05;
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
      self.step = 6;
    end
  elseif self.step == 6 then 
    if self:CheckInterval() then      
      idx = HeavenDeadYellowSupersed.FindEmpty(self.taoistMagicFigures, self.lightNum);
      if idx == self.lightNum then --符咒都飛出去了才做下一步        
        self.step = 7;
        return;
      end
      self:SetFuChih(idx);   --設定符咒飛出
      if (idx % 9) == 0 then  --每4張符咒放一符咒音效
        me:PlaySound(target.colm, target.row, Attack_Start, 2);
      end

      self.interval = (50 + math.random(0, 39))/1000; --每張符咒出現時間間隔 50 ~ 89 毫秒
    end
  elseif self.step == 7 then 
    if attack.lights[4].picId == 0 then      
      FightField.CloseDrawBlack();
      if me.party_Kind == EFightParty.Right then --大爆炸光影
        attack:SetLightWithOrder(5, EEffectLightDis.Sky, 10719, 135, 1, 17, 17, EEffectLightTracer.StandAni, -148, 56, 10, false, 0);
      else
        attack:SetLightWithOrder(5, EEffectLightDis.Sky, 10719, 135, 1, 17, 17, EEffectLightTracer.StandAni, 165, 229, 10, false, 0);
      end
      --===被攻擊方飛出站立位置===
      for i=0, self.emyNum-1 do      
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);  --挨打姿勢
        target.roleController:SetAnimationForceId(ERolePose.Hit);
        target:SetSpeed(0.16);          
          
        if not target:IsInSealStatus() then               
          if Contains(target.colm, 0, 3) then
            newPos = target:GetSpot(EFightSpot.Back, 60);
          elseif Contains(target.colm, 1, 2) then
            newPos = target:GetSpot(EFightSpot.Front, 60);
          end
          target:SetJump(newPos.x, newPos.y, true);
        end
      end
        --==================
      me:PlaySound(target.colm, target.row, Attack_Hit);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, math.ceil(self.lightNum/3));
      self.step = 8;
    end
  elseif self.step == 8 then 
    --被攻擊方倒地
    if target.arrive then      
      FightField.SetShake(false);

      for i = 0, self.emyNum - 1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        target.roleController:SetAnimationForceId(ERolePose.None);
        target.roleController:SetIsDead(true);
      end
      self.step = 9
    end
  elseif self.step == 9 then 
    if attack.lights[5].picId == 0 then      
      self.isLightEnd = true; --特技施展完畢
      self.step = 10;
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
    end
  end
end

function HeavenDeadYellowSupersed:UpdateFuChih()    
  local newPos = Vector2.zero;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  for i = 0, self.lightNum - 1 do
    if self.taoistMagicFigures[i] ~= nil then   --有設定符咒光影才設定爆炸光影       
      if self.taoistMagicFigures[i].isArrive and self.fireLight[i] == nil then --符咒到達定位設定爆炸光影                
        newPos.x = self.taoistMagicFigures[i].showPos.x + math.random(20) - math.random(20);
        newPos.y = self.taoistMagicFigures[i].showPos.y + math.random(40);
        --符咒飛到定位換成爆炸光影
        self.fireLight[i] = EffectLight.New(10466, 50, 4, 6, 6, EEffectLightTracer.StandAni, newPos.x, newPos.y, 25, true, 15);       
        self.fireLight[i]:SetTimeScale(FightField.timeScale);  
        self.fireLight[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        if (i % 7) == 0 then      
          me:PlaySound(target.colm, target.row, Attack_Start, 3); --爆炸音效
          for j = 0, self.emyNum-1 do        
            target = FightField.fightHum[self.emyIdxAy[math.random(0, self.emyNum - 1)]];
            me:PlayEffect(target.colm, target.row, ERolePose.Hit, self.lightNum / 3);
          end
        end
        local rand = math.random(self.emyNum - 1);
        for j = 0, rand do --被攻擊方做出 挨打 or 備戰 動作      
          target = FightField.fightHum[self.emyIdxAy[math.random(0,self.emyNum - 1)]];
          if target.roleController.animationTrigger == EAnimationTrigger.Hit then
            target.roleController.animationTrigger = EAnimationTrigger.None;
          else
            target.roleController:Hit();
          end
        end
      end
    end
  end
end