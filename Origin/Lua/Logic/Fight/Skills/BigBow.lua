BigBow = InheritsFromBaseAttackSkill();

function BigBow:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local attack = FightField.attack[self.humIdx];
  if self.step == 1 then             
    me.roleController:OneHandAttack();

    if me.party_Kind == EFightParty.Right then
      attack:SetLight(EEffectLightKind.Sky1, 10729, 50, 1, 5, 5, EEffectLightTracer.Stand, FightField.chip[2][target.row].x-60, FightField.chip[2][target.row].y+50, 255, false, 0, 0, 0, 0.36);
    else
      attack:SetLight(EEffectLightKind.Sky1, 10730, 50, 1, 5, 5, EEffectLightTracer.Stand, FightField.chip[1][target.row].x+60, FightField.chip[1][target.row].y+50, 255, false, 0, 0, 0, 0.36);
    end
    self.stOldTime = CGTimer.time;
    me.roleController:SetAnimationForceFrame(1); --鎖定動作
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
    self.interval = 0.2;
    self.step = 2;      
  elseif self.step == 2 then       
    if self:CheckInterval() then        
      if me.party_Kind == EFightParty.Right then
        attack:SetLight(EEffectLightKind.Sky2, 10727, 50, 1, 12, 12, EEffectLightTracer.Line,
                                               FightField.chip[2][target.row].x-60,
                                               FightField.chip[2][target.row].y-60, 30, true, 0,
                                               FightField.chip[0][target.row].x,
                                               FightField.chip[0][target.row].y+40, 0.36)                                               
      else
        attack:SetLight(EEffectLightKind.Sky2, 10728, 50, 1, 12, 12, EEffectLightTracer.Line,
                                               FightField.chip[1][target.row].x+60,
                                               FightField.chip[1][target.row].y, 30, true, 0,
                                               FightField.chip[3][target.row].x,
                                               FightField.chip[3][target.row].y, 0.36);          
      end
      self.step = 3;
    end
  elseif self.step == 3 then       
    if me.party_Kind == EFightParty.Right then     
      if attack.lights[EEffectLightKind.Sky2].showPos.x <= FightField.chip[1][target.row].x then          
        for i=0, self.emyNum-1 do
          if FightField.chip[1][target.row].x == FightField.fightHum[self.emyIdxAy[i]].nowPos.x then    
            target = FightField.fightHum[self.emyIdxAy[i]];          
            attack:SetLight(EEffectLightKind.Sky3, 10096, 50, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y+120, 30, true, 0, 0, 0);            
            me:PlaySound(target.colm, target.row);
            me:PlayEffect(target.colm, target.row, ERolePose.Hit);
          end
        end
        self.step = 4;
      end      
    else    
      if attack.lights[EEffectLightKind.Sky2].showPos.x >= FightField.chip[2][target.row].x then          
        for i=0, self.emyNum-1 do
          if FightField.chip[2][target.row].x == FightField.fightHum[self.emyIdxAy[i]].nowPos.x then              
            target = FightField.fightHum[self.emyIdxAy[i]];
            attack:SetLight(EEffectLightKind.Sky3, 10096, 50, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y+120, 30, true, 0, 0, 0);    
            me:PlaySound(target.colm, target.row);
            me:PlayEffect(target.colm, target.row, ERolePose.Hit);
          end
        end
        self.step = 4;          
      end      
    end
  elseif self.step == 4 then    
    if attack.lights[EEffectLightKind.Sky2].isArrive then        
      if me.party_Kind == EFightParty.Right then          
        for i=0, self.emyNum-1 do
          if FightField.chip[0][target.row].x == FightField.fightHum[self.emyIdxAy[i]].nowPos.x then              
            attack:SetLight(EEffectLightKind.Sky4, 10096, 50, 1, 10, 10, EEffectLightTracer.StandAni, FightField.chip[0][target.row].x, FightField.chip[0][target.row].y+120, 30, true, 0, 0, 0);
            target = FightField.fightHum[self.emyIdxAy[i]];
            me:PlayEffect(target.colm, target.row, ERolePose.Hit,1);
            me:PlaySound(target.colm, target.row);
            me:PlayEffect(target.colm, target.row, ERolePose.Hit);
          end
        end
      else      
        for i=0, self.emyNum-1 do
          if FightField.chip[3][target.row].x == FightField.fightHum[self.emyIdxAy[i]].nowPos.x then              
            attack:SetLight(EEffectLightKind.Sky4, 10096, 50, 1, 10, 10, EEffectLightTracer.StandAni, FightField.chip[3][target.row].x, FightField.chip[3][target.row].y+120, 30, true, 0, 0, 0);
            target = FightField.fightHum[self.emyIdxAy[i]];
            me:PlayEffect(target.colm, target.row, ERolePose.Hit,1);
            me:PlaySound(target.colm, target.row);
            me:PlayEffect(target.colm, target.row, ERolePose.Hit);
          end
        end
      end
      self.step = 5;
      self.interval = 0.5;
    end
  elseif self.step == 5 then                      
    if self:CheckInterval() then
      self.isLightEnd = true; 
      self.step = 6;
    end
  end
end