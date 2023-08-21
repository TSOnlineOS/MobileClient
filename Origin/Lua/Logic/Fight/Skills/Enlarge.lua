Enlarge = InheritsFromBaseAttackSkill();

function Enlarge:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self.step == 1 then           
    me.roleController:MagicAttack();
    --030601J風魔法陣
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground,10077,50,1,21,21, EEffectLightTracer.StandAni, me.nowPos.x+5, me.nowPos.y,20, true, 90);
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1,10003, 50,1,25,25, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y,20, true, 20);
    self.step = 2;                  
  elseif self.step == 2 then                     
    if FightField.attack[self.humIdx]:CheckLightIsEnd(EEffectLightKind.Sky1)then        
      self.isLightEnd = true;
      self.step = 3;                  
    end
  end
end

--狀態顯示
EnlargeMe = InheritsFromBaseStatus();

function EnlargeMe:InitExtraParameters()
  self.enlargeOldTime = CGTimer.time;  

  self.size = FightField.fightHum[self.humIdx].shrink + 5;   --放大的尺寸
  if self.size > MaxShrink then
    self.size = MaxShrink;
  end

   --放大的尺寸
  if FightField.fightHum[self.humIdx].shrink == DefShrink then 
    self.size = MaxShrink;
  elseif FightField.fightHum[self.humIdx].shrink == MaxShrink then 
    self.size = MaxShrink;
  elseif FightField.fightHum[self.humIdx].shrink == MinShrink then 
    self.size = DefShrink;
  end
end

function EnlargeMe:ExtraClose()
  FightField.fightHum[self.humIdx]:SetShrink(DefShrink);
end

function EnlargeMe:Update()
  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then     
    me:GetStatus(self.statusKind):SetLight(EEffectLightKind.Body1,10003, 50,1,25,25, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y,20, true, 20);              
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
    if (CGTimer.time - self.enlargeOldTime) * 1000 * FightField.timeScale >= 100 then        
      if me.shrink < MaxShrink then          
        if me.shrink ~= self.size then
          me:SetShrink(me.shrink+1);
        end    
      else
        self.step = 3
      end
      self.enlargeOldTime = CGTimer.time;        
    end
  end
end