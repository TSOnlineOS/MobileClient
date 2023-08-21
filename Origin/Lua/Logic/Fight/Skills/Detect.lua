Detect = InheritsFromBaseAttackSkill();

function Detect:Update()    
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then 
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();        

    --030601J八卦魔法陣
    FightField.attack[self.humIdx]:SetLightWithOrder(1,EEffectLightDis.Ground ,10079,50,1,22,22, EEffectLightTracer.StandAni, me.nowPos.x+5, me.nowPos.y,30, false, 113);

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
    self.step = self.step + 1;      
  elseif self.step == 2 then       
    if self:CheckInterval() then        
      --被施法光影
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky,10001, 80, 1,15, 15, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 40);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky ,10001, 60, 1,15, 15, EEffectLightTracer.StandAni, target.nowPos.x-10, target.nowPos.y, 30, true, 40);

      self.step = self.step + 1;                       
    end
  elseif self.step == 3 then     
    if FightField.attack[self.humIdx]:CheckLightIsEnd(2) then 
      self.step = self.step + 1;
      self.isLightEnd = true;
    end
  end
end