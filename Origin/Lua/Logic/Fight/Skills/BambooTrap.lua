BambooTrap = InheritsFromBaseAttackSkill();

function BambooTrap:Update()    
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then     
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();

    --030601J土魔法陣
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground,10080,50,1,21,21, EEffectLightTracer.StandAni, me.nowPos.x+6, me.nowPos.y,20, true, 80);


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
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
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
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    self.step = 2;              
  elseif self.step == 2 then               
    if self:CheckInterval() then        
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10021, 60, 1,15, 15, EEffectLightTracer.Stand,
                                           target.nowPos.x-15, target.nowPos.y, 255, false, 38);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground, 10010, 40, 1,4, 4, EEffectLightTracer.Stand,
                                           target.nowPos.x+5, target.nowPos.y+10, 255, false, 38);
      self.step = 3;                  
    end
  elseif self.step == 3 then     
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].orderCount == 1 then        
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10016, 60, 1,15, 15, EEffectLightTracer.Stand,
                                             target.nowPos.x+10, target.nowPos.y+20, 20, false, 38);
      --030613J固態化不做跳移的動作,旋風status時取得方向不對=>會當機          
      if not target:IsInSealStatus() then           
        newPos = target:GetChipPos();
        target:SetJump(newPos.x-30, newPos.y-35);
      end
      self.step = 4;  
    end
  elseif self.step == 4 then           
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].orderCount == 4 then        
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky3, 10016, 60, 1,15, 15, EEffectLightTracer.Stand,
                                             target.nowPos.x-25, target.nowPos.y+5, 40, false, 38);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body1, 10010, 40, 1,4, 4, EEffectLightTracer.Stand,
                                             target.nowPos.x-18, target.nowPos.y+7, 255, false, 38);
      --030613J固態化不做跳移的動作,旋風status時取得方向不對=>會當機          
      if not target:IsInSealStatus() then                
        newPos = target:GetChipPos();
        target:SetJump(newPos.x+40, newPos.y);
      end
      self.step = 5;
    end      
  elseif self.step == 5 then       
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].orderCount == 10 then        
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10016, 30, 1,15, 15, EEffectLightTracer.Stand,
                                             target.nowPos.x+40, target.nowPos.y+30, 30, false, 38);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground, 10010, 30, 1,4, 4, EEffectLightTracer.Stand,
                                             target.nowPos.x-5, target.nowPos.y+10, 255, false, 38);

      --030613J固態化不做跳移的動作,旋風status時取得方向不對=>會當機        
      if not target:IsInSealStatus() then                
        newPos = target:GetChipPos();
        target:SetJump(newPos.x, newPos.y);
      end

      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      self.step = 6;                  
    end
  elseif self.step == 6 then     
    if (FightField.attack[self.humIdx].lights[EEffectLightKind.Sky2].orderCount == 14) then      
      self.isLightEnd = true;
      self.step = 7;        
    end
  end
end