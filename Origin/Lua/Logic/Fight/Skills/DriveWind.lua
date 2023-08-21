DriveWind = InheritsFromBaseAttackSkill();

function DriveWind:Update()  
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self.step == 1 then     
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);      
    me.roleController:MagicAttack();
    --風魔法陣
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground,10077,50,1,21,21, EEffectLightTracer.StandAni, me.nowPos.x+5, me.nowPos.y,20, true, 90);    --咒語

    self.interval = 0.8;
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
    if self:CheckInterval() then        
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1,10017, 50,1,6,6, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 20, true, 15, target.nowPos.x, target.nowPos.y, 0.36);
      me:PlaySound(target.colm, target.row, Attack_Start);             
      self.step = 3;        
    end
  elseif self.step == 3 then     
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].isArrive then        
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      me:PlaySound(target.colm, target.row);   

      if target.roleController:GetAttribute(EAttribute.Hp) > 0 then 
        target.roleController:SetAnimationForceId(ERolePose.Hit); 
      end
          
      newPos = target:GetSpot(EFightSpot.Back, 60);
      target:SetWalk(newPos.x, newPos.y, false);
      target:SetSpeed(0.16);

      self.interval = 0.3;
      self.step =4;                  
    end      
  elseif self.step == 4 then     
    if self:CheckInterval() then
      self.step = 5;
      self.isLightEnd = true;         
    end
  end
end