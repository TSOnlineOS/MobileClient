FallStone = InheritsFromBaseAttackSkill();

function FallStone:Update()  
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then     
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    --030601J土魔法陣
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground,10080,50,1,21,21, EEffectLightTracer.StandAni, me.nowPos.x+6, me.nowPos.y,20, true, 80);

    self.step = 2;        
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
  elseif self.step == 2 then       
    if self:CheckInterval() then        
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10008, 50, 1,15, 15, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 255, false, 60);
      self.step = 3;                  
    end
  elseif self.step == 3 then     
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].orderCount == 8 then        
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10016, 25, 1,15, 15, EEffectLightTracer.Stand, target.nowPos.x-10, target.nowPos.y, 50, false, 75);
      me:PlaySound(target.colm, target.row);   --92/7/16-5F
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      FightField.SetShake(true);
      self.step = 4;
    end    
  elseif self.step == 4 then       
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].orderCount == 10 then        
      FightField.SetShake(false);
      self.step = 5;          
    end
  elseif self.step == 5 then     
    if (FightField.attack[self.humIdx]:CheckLightIsEnd(EEffectLightKind.Sky1)) then
      self.isLightEnd = true;
      self.step = 6;
    end
  end
end
