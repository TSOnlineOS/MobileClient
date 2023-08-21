Chaos4 = InheritsFromBaseAttackSkill();

function Chaos4:InitExtraParameters()
  self.light = {};
end

function Chaos4:ExtraClose()
  for k,v in pairs(self.light)do
    v:Stop();
  end
end

function Chaos4:Update()
  local target;  
  local me = FightField.fightHum[self.humIdx];
  local attack = FightField.attack[self.humIdx];
  if self.step == 1 then     
    --八卦魔法陣
    attack:SetLightWithOrder(1,EEffectLightDis.Ground,10079,50,1,22,22,EEffectLightTracer.StandAni, me.nowPos.x+5, me.nowPos.y,30, false, 113);
    self.interval = 0.8;
    self.step = 2;              
  elseif self.step == 2 then       
    if self:CheckInterval() then                  
      for i=0, self.emyNum-1 do          
        target = FightField.fightHum[ self.emyIdxAy[i] ];        
        self.light[i] = EffectLight.New(10020,80,1,10,10,EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y,50, true, 40);
        self.light[i]:SetTimeScale(FightField.timeScale);   
        self.light[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER); 
        target.roleController:SetInBattle(false);
        target:SetSpeed(1.00);
        target:SetBeh(EFightBeh.Rotate);     --設定行為 旋轉
      end

      self.interval = 1;
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
      self.step = 3;                  
    end
  elseif self.step == 3 then       
    if self.emyNum == 0 then        
      self.step = 4;
      return;          
    end

    if self:CheckInterval() then
      self.step = 4;          
    end
  elseif self.step == 4 then 
    self.isLightEnd = true;
    self.step = 5;
  end
end