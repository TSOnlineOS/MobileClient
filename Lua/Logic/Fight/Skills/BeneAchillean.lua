BeneAchillean = InheritsFromBaseAttackSkill();

function BeneAchillean:InitExtraParameters()
  self.lightWrite = {};
end

function BeneAchillean:ExtraClose()
  for k,v in pairs(self.lightWrite)do
    v:Stop();
  end  
end


function BeneAchillean:Update()    
  local newPos;

  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local attack = FightField.attack[self.humIdx];
  if self.step == 1 then  --施法動作，身上Show魔法陣    
    me.roleController:MagicAttack();    

    if me.party_Kind == EFightParty.Left then  --人在左      
      attack:SetLightWithOrder(1, EEffectLightDis.Body, 10410, 100, 9, 1, 9, EEffectLightTracer.StandAni, me.nowPos.x-3, me.nowPos.y, 30, false, 90);
      attack.lights[1].isMirror =true;      
    else                              --人在右
      attack:SetLightWithOrder(1, EEffectLightDis.Body, 10410, 100, 9, 1, 9, EEffectLightTracer.StandAni, me.nowPos.x+6, me.nowPos.y, 30, false, 90);
    end
  
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
  elseif self.step == 2 then --身邊的綠色氣旋    
    if attack.lights[1].orderCount == 1 then      
      if me.party_Kind == EFightParty.Right then
        attack:SetLightWithOrder(3, EEffectLightDis.Sky, 10649, 170, 1, 1, 1, EEffectLightTracer.StandAni, me.nowPos.x-40, me.nowPos.y+100, 255, true, 0)
      else      
        attack:SetLightWithOrder(3, EEffectLightDis.Sky, 10649, 170, 1, 1, 1, EEffectLightTracer.StandAni, me.nowPos.x+40, me.nowPos.y+40, 255, true, 45);
        attack.lights[3].isMirror =true;
      end

      self.step = 3;
    end    
  elseif self.step == 3 then --身邊的綠色氣旋    
    if attack.lights[1].orderCount == 2 then      
      if me.party_Kind == EFightParty.Right then
        attack:SetLightWithOrder(4, EEffectLightDis.Sky, 10650, 170, 1, 1, 1, EEffectLightTracer.StandAni, me.nowPos.x-40, me.nowPos.y+100, 255, true, 0)
      else      
        attack:SetLightWithOrder(4, EEffectLightDis.Sky, 10650, 170, 1, 1, 1, EEffectLightTracer.StandAni, me.nowPos.x+40, me.nowPos.y+40, 255, true, 45);
        attack.lights[4].isMirror =true;
      end

      self.step = 4;      
    end
  elseif self.step == 4 then --身邊的綠色氣旋    
    if attack.lights[1].orderCount == 3 then      
      if me.party_Kind == EFightParty.Right then
        attack:SetLightWithOrder(3, EEffectLightDis.Sky, 10654, 170, 1, 1, 1, EEffectLightTracer.StandAni, me.nowPos.x+10, me.nowPos.y+100, 255, true, 0);
      else      
        attack:SetLightWithOrder(3, EEffectLightDis.Sky, 10654, 170, 1, 1, 1, EEffectLightTracer.StandAni, me.nowPos.x-10, me.nowPos.y+40, 255, true, 45);
        attack.lights[3].isMirror =true;
      end

      self.step = 5;
    end
  elseif self.step == 5 then  --劉備出現在中間         
    if attack.lights[1].orderCount == 4 then      
      if me.party_Kind == EFightParty.Right then
        attack:SetLightWithOrder(4, EEffectLightDis.Sky, 10648, 170, 1, 1, 1, EEffectLightTracer.StandAni, me.nowPos.x+50, me.nowPos.y+80, 255, true, 0)
      else      
        attack:SetLightWithOrder(4, EEffectLightDis.Sky, 10648, 170, 1, 1, 1, EEffectLightTracer.StandAni, me.nowPos.x-50, me.nowPos.y+40, 255, true, 45);
        attack.lights[4].isMirror = true;
      end

      me:PlaySound(target.colm, target.row, Attack_Start);
      attack:SetLightWithOrder(2, EEffectLightDis.Sky, 10772, 300, 6, 1, 6, EEffectLightTracer.Stand, 50, -60, 30, false, 90);

      if me.party_Kind == EFightParty.Right then  --人在左
        attack.lights[2].isMirror = true;
      else
        attack.lights[2].isMirror = false;
      end
          
      self.step = 6;
    end    
  elseif self.step == 6 then --施法完成 身上Show 煙    
    if attack.lights[1].orderCount == 6 then      
      me:PlaySound(target.colm, target.row, Attack_Hit);
      if me.party_Kind == EFightParty.Left then  --人在左        
        attack:SetLightWithOrder(3, EEffectLightDis.Body, 10289, 35, 13, 1, 13, EEffectLightTracer.StandAni, me.nowPos.x-3, me.nowPos.y, 20, false, 100);
        attack.lights[3].isMirror = true;        
      else
        attack:SetLightWithOrder(3, EEffectLightDis.Body, 10289, 35, 13, 1, 13, EEffectLightTracer.StandAni, me.nowPos.x+10, me.nowPos.y, 20, false, 100);
      end

      self.step = 7 ;
  
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
    end
  elseif self.step == 7 then     
    if attack.lights[2].orderCount == 4 then      
      --地裂          
      newPos = target:GetAttackPos(EFightSpot.Right, 30);
      attack:SetLightWithOrder(8, EEffectLightDis.Ground,10103,80,1,10,10, EEffectLightTracer.Stand,newPos.x, newPos.y,255, false, 80);
      --地裂
      newPos = target:GetAttackPos(EFightSpot.Left, 30);
      attack:SetLightWithOrder(9, EEffectLightDis.Ground,10103,80,1,10,10, EEffectLightTracer.Stand, newPos.x, newPos.y,255, false, 80);
        
      FightField.SetShake(true);

      for i=0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        target.roleController:Hit();
        target.roleController:SetAnimationForceId(ERolePose.Hit);
      end

      self.step = 8;
    end
  elseif self.step == 8 then  --身上出現白哀氣    
    if attack.lights[8].orderCount == 6 then      
      FightField.SetShake(false);
      me.roleController:SetInBattle(false);
      me.roleController:FaceTo(target.nowPos);
      me:PlaySound(target.colm, target.row, Attack_Hit,2);

      for i=0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];

        self.lightWrite[i] = EffectLight.New(10249, 150, 1, 6, 6, EEffectLightTracer.Stand, target.nowPos.x+5, target.nowPos.y- target.roleController.height,30, true, 0);
        self.lightWrite[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);   
        self.lightWrite[i]:SetTimeScale(FightField.timeScale);   
        
        if target.party_Kind == EFightParty.Left then  --人在左
          self.lightWrite[i].isMirror =true;
        end
      end      
      self.interval = 1;
      self.step = 9;
    end    
  elseif self.step == 9 then     
    if self:CheckInterval() then      
      self.step = 10;
      self.isLightEnd = true;
    end    
  end
end