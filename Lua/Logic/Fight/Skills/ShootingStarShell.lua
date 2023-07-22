ShootingStarShell = InheritsFromBaseAttackSkill();

function ShootingStarShell:InitExtraParameters()
  self.humDownTime = 0;
  self.stone1 = {}; --石頭的位置開始的位置
  self.stone2 = {}; --石頭的位置
end

function ShootingStarShell:ExtraClose()
  for k, v in pairs(self.emyIdxAy) do
    if FightField.fightHum[v] ~= nil then
      FightField.fightHum[v]:SetSquelch(MaxSquelch);
    end
  end
end

function ShootingStarShell:HumDown()
  local target;
  if self.step < 5 then 
    return;
  end

  if (CGTimer.time - self.humDownTime) * 1000 * FightField.timeScale >= 60 then 
    for i=0, self.emyNum-1 do    
      target = FightField.fightHum[ self.emyIdxAy[i] ];
      if target.squelch > MinSquelch then      
        target.squelch =  target.squelch-1;
      end
      self.humDownTime =  CGTimer.time;
    end
  end
end

function ShootingStarShell:Reset()
  local attack = FightField.attack[self.humIdx];
  attack:StopLight(EEffectLightKind.Sky1);
  attack:StopLight(EEffectLightKind.Sky2);
  attack:StopLight(EEffectLightKind.Sky3);
end

function ShootingStarShell:SetPosition(fromX, fromY, goalX, goalY)
--const
  local FixedDist = 75;     --定位的距離
  local ShowDist = 200;     --顯示的距離
  local StoneDist = 75;     --石頭之間的間距
  local StoneSpeed = 0.46;   --中間那顆石頭的投速
--
  local fixedW, stoneH;   --移到下一個格子長和寬的x,y差值
  local totalD, totalD2;  --總距離
  fixedW = {};
  stoneH = {};
  self:Reset();
  fixedW.x = math.round(FixedDist* FieldSinSitaW);
  fixedW.y = math.round(FixedDist* FieldCosSitaW);
  --設定石頭擺設的位置
  stoneH.x = math.round(StoneDist*FieldSinSitaH);
  stoneH.y = math.round(StoneDist*FieldCosSitaH);
  self.stone1.x = fromX;
  self.stone1.y = fromY;
  self.stone2[0] = {};
  self.stone2[0].x = goalX;
  self.stone2[0].y = goalY;
  self.stone2[1] = {};
  self.stone2[1].x = goalX+stoneH.x;
  self.stone2[1].y = goalY-stoneH.y;
  self.stone2[2] = {};
  self.stone2[2].x = goalX-stoneH.x;
  self.stone2[2].y = goalY+stoneH.y;

  --計算斜邊長:c =(a平方+b平方)開根號
  totalD = math.round( math.sqrt( math.pow(self.stone1.x - self.stone2[0].x, 2)+ math.pow(self.stone1.y-self.stone2[0].y, 2) ) );
  self.stone2[0].speed = StoneSpeed;
  totalD2 = math.round( math.sqrt( math.pow(self.stone1.x - self.stone2[1].x, 2)+ math.pow(self.stone1.y-self.stone2[1].y, 2) ) );  
  self.stone2[1].speed = StoneSpeed*totalD2/totalD;
  totalD2 = math.round( math.sqrt( math.pow(self.stone1.x - self.stone2[2].x, 2)+ math.pow(self.stone1.y-self.stone2[2].y, 2) ) );  
  self.stone2[2].speed = StoneSpeed*totalD2/totalD;
end

function ShootingStarShell:Update()  
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local attack = FightField.attack[self.humIdx];
  self:HumDown();
  if self.step == 1 then     
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    --土魔法陣
    attack:SetLightWithOrder(1, EEffectLightDis.Ground,10080,50,1,21,21, EEffectLightTracer.StandAni, me.nowPos.x+6, me.nowPos.y,20, true, 80);
    if target.party_Kind == EFightParty.Left then  --人在左
      attack:SetLightWithOrder(2, EEffectLightDis.Ground,10451,80,1,6,6, EEffectLightTracer.Stand, me.nowPos.x+70,me.nowPos.y,255,false, 50);
    else
      attack:SetLightWithOrder(2, EEffectLightDis.Ground,10452,80,1,6,6, EEffectLightTracer.Stand, me.nowPos.x-35,me.nowPos.y,255,false, 15);
    end
    me:PlaySound(target.colm, target.row, Attack_Start);   --播發招音效 92/8/22-1F
    self.step = 2;              
  elseif self.step == 2 then      
    if attack.lights[2].orderCount >= 5 then        
      if target.party_Kind == EFightParty.Left then  --人在左
        self:SetPosition(me.nowPos.x+40, me.nowPos.y-50, target.nowPos.x, target.nowPos.y);
      else
        self:SetPosition(me.nowPos.x, me.nowPos.y-30, target.nowPos.x, target.nowPos.y);
      end
      self.step = 3;        
    end
  elseif self.step == 3 then    
    self.step = 4;      
    for i = 0, self.emyNum-1 do        
      if i > 2 then 
        return 
      end
      attack:SetLightWithOrder(3+i,EEffectLightDis.Sky ,10449, 50,1,6,6,EEffectLightTracer.Curve,self.stone1.x, self.stone1.y-70 ,255, true, 0,self.stone2[i].x, self.stone2[i].y);
      attack.lights[3+i].lightSpeed = self.stone2[i].speed;
    end    
  elseif self.step == 4 then      
    if attack.lights[3].isArrive then        
      for i = 0, self.emyNum-1 do          
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        me:PlaySound(target.colm, target.row, Attack_Hit);   
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);  --挨打姿勢
        attack:SetLightWithOrder(3+i,EEffectLightDis.Sky,10449,50,1,6,6,EEffectLightTracer.Stand, target.nowPos.x+6, target.nowPos.y+7,255, false, 0);
        --target.ChangePose(Pose_hit);
        target.roleController:Hit();
      end
      self.step = 5;        
    end
  elseif self.step == 5 then       
    self:UpdateSmoke();
    self.step = 6;
  elseif self.step == 6 then 
    if attack:CheckLightIsEnd(8) then            
      self.step = 7;
      self.isLightEnd = true;
    end
  end  
end

function ShootingStarShell:UpdateSmoke()
  local lightID;

  lightID = 6;
  for i=0, 2 do  
    if i == 0 then 
      lightID = 6;
    elseif i == 1 then 
      lightID = 7;
    elseif i == 2  then 
      lightID = 8;
    end          
    FightField.attack[self.humIdx]:SetLightWithOrder(lightID, EEffectLightDis.Body, 10016, 60,1,15, 15, EEffectLightTracer.StandAni, self.stone2[i].x-10, self.stone2[i].y+40, 30, false, 25);
  end
end