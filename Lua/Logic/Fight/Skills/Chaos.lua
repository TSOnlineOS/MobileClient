--技能混亂
Chaos = InheritsFromBaseAttackSkill();

function Chaos:Update()  
  local newPos;  --TPoint:存x,y
  local me = FightField.fightHum[self.humIdx];
  
  if self.step == 1 then     
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
  
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

    --八卦魔法陣
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground,10079,50,1,22,22, EEffectLightTracer.StandAni, me.nowPos.x+5, me.nowPos.y,30, false, 113);
    self.interval = 0.8;
    self.step = 2;  
  elseif self.step == 2 then               
    if self:CheckInterval() then        
      self:HandleTarget();
      self.interval = 1;
      self.step = 3;                  
    end
  elseif self. step == 3 then     
    if self:CheckInterval() then 
      self.step = 4;
      self.isLightEnd = true; --特技施展完畢
    end
  end
end

function Chaos:HandleTarget()
  local target = FightField.fightHum[self.tarIdx];
  FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky,10020,80,1,10,10, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y,50, true, 40);
  target.roleController:SetInBattle(false);      
  target:SetSpeed(1.00);
  target:SetBeh(EFightBeh.Rotate);     --設定行為 旋轉
end

--專武混亂 (多人)
EW_Chaos = InheritsAttack(Chaos);

function EW_Chaos:InitDrawBlack()
  self.needDrawBlack = true;   
end

function EW_Chaos:HandleTarget()
  local target = FightField.fightHum[self.tarIdx];
  for k, v in pairs(self.emyIdxAy)do 
    target = FightField.fightHum[v];
    FightField.attack[self.humIdx]:SetLightWithOrder(2 + k, EEffectLightDis.Sky,10020,80,1,10,10, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y,50, true, 40);

    target.roleController:SetInBattle(false);      
    target:SetSpeed(1.00);
    target:SetBeh(EFightBeh.Rotate);     --設定行為 旋轉
  end
end

--狀態顯示
ChaosMe = InheritsFromBaseStatus();

function ChaosMe:ExtraClose()  
  FightField.fightHum[self.humIdx].roleController:SetTextureColor(Color.White);

  FightField.RestoreFightInfo(self.humIdx, 0);
end

function ChaosMe:Update()
  if self.step  == 1 then    
    local me = FightField.fightHum[self.humIdx];

    me.roleController:SetTextureColor(Color.Red);
    self.step = 2;              
  end
end


--技能解除混亂
DisChaos = InheritsFromBaseAttackSkill();

function DisChaos:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then             
    me.roleController:MagicAttack();

    --八卦魔法陣
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground,10079,50,1,22,22, EEffectLightTracer.StandAni, me.nowPos.x+5, me.nowPos.y,30, false, 113);

    self.stOldTime = CGTimer.time;
    self.interval = 0.8;
    self.step = 2;              
  elseif self.step == 2 then       
    if self:CheckInterval() then        
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10022, 66, 1, 12, 12, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y-35, 20, false, 50);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10028, 33, 1, 24, 24, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y-35, 20, false, 50);

      self.step = 3;          
    end    
  elseif self.step == 3 then 
    if FightField.attack[self.humIdx]:CheckLightIsEnd(2) then 
      self.step = 4;    
      self.isLightEnd = true; --特技施展完畢
    end
  end
end