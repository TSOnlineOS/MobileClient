PitySoldier = InheritsFromBaseAttackSkill();

function PitySoldier:Update()    
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[ self.emyIdxAy[0] ];
  local attack = FightField.attack[self.humIdx];
  if self.step == 1 then  --施法動作，身上Show魔法陣
    me.roleController:MagicAttack();

    if me.party_Kind == EFightParty.Left then  --人在左      
      attack:SetLightWithOrder(1, EEffectLightDis.Body, 10410, 100, 9, 1, 9, EEffectLightTracer.StandAni, me.nowPos.x-3, me.nowPos.y, 30, false, 90);
      attack.lights[1].isMirror = true;      
    else                                       --人在右
      attack:SetLightWithOrder(1, EEffectLightDis.Body, 10410, 100, 9, 1, 9, EEffectLightTracer.StandAni, me.nowPos.x+6, me.nowPos.y, 30, false, 90);
    end

    self.step = 2;
    --1--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local code = DemoCode.GetBitxor(20);
      code = code * 10;
    end
    ---2--------------------------------------------------------------
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
    if attack.lights[1].orderCount == 1 then      
      if me.party_Kind == EFightParty.Right then
        attack:SetLightWithOrder(3, EEffectLightDis.Sky, 10649, 170, 1, 1, 1, EEffectLightTracer.StandAni, me.nowPos.x-40, me.nowPos.y+100, 255, true, 0)
      else      
        attack:SetLightWithOrder(3, EEffectLightDis.Sky, 10649, 170, 1, 1, 1, EEffectLightTracer.StandAni, me.nowPos.x+40, me.nowPos.y+40, 255, true, 45);
        attack.lights[3].isMirror = true;
      end

      self.step = 3;              
    end
  elseif self.step == 3 then     
    if attack.lights[1].orderCount == 2 then      
      if me.party_Kind == EFightParty.Right then
        attack:SetLightWithOrder(4, EEffectLightDis.Sky, 10650, 170, 1, 1, 1, EEffectLightTracer.StandAni, me.nowPos.x-40, me.nowPos.y+100, 255, true, 0)
      else      
        attack:SetLightWithOrder(4, EEffectLightDis.Sky, 10650, 170, 1, 1, 1, EEffectLightTracer.StandAni, me.nowPos.x+40, me.nowPos.y+40, 255, true, 45);
        attack.lights[4].isMirror = true;
      end

      self.step = 4;      
    end
  elseif self.step == 4 then     
    if attack.lights[1].orderCount == 3 then      
      if me.party_Kind == EFightParty.Right then
        attack:SetLightWithOrder(3, EEffectLightDis.Sky, 10654, 170, 1, 1, 1, EEffectLightTracer.StandAni, me.nowPos.x+10, me.nowPos.y+100, 255, true, 0);
      else      
        attack:SetLightWithOrder(3, EEffectLightDis.Sky, 10654, 170, 1, 1, 1, EEffectLightTracer.StandAni, me.nowPos.x-10, me.nowPos.y+40, 255, true, 45);
        attack.lights[3].isMirror = true;
      end

      self.step = 5
      --1--------------------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        local code = DemoCode.GetBitxor(20);
        code = code * 10;
      end
      ---2--------------------------------------------------------------
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
    end
  elseif self.step == 5 then  --劉備出現在中間    
    if attack.lights[1].orderCount == 4 then      
      if me.party_Kind == EFightParty.Right then
        attack:SetLightWithOrder(4, EEffectLightDis.Sky, 10648, 170, 1, 1, 1, EEffectLightTracer.StandAni, me.nowPos.x+50, me.nowPos.y+80, 255, true, 0);
      else     
        attack:SetLightWithOrder(4, EEffectLightDis.Sky, 10648, 170, 1, 1, 1, EEffectLightTracer.StandAni, me.nowPos.x-50, me.nowPos.y+40, 255, true, 45);
        attack.lights[4].isMirror = true;
      end

      me:PlaySound(target.colm, target.row, Attack_Start);
      attack:SetLightWithOrder(2, EEffectLightDis.Sky, 10772, 300, 6, 1, 6, EEffectLightTracer.Stand, 50, -60, 30, false, 90);

      if me.party_Kind == EFightParty.Left then  --人在左
        attack.lights[2].isMirror =true;
      end

      self.step = 6;      
    end
  elseif self.step == 6 then  --施法完成 身上Show 煙    
    if attack.lights[1].orderCount == 6 then      
      me:PlaySound(target.colm, target.row, Attack_Hit);
      if me.party_Kind == EFightParty.Left then  --人在左        
        attack:SetLightWithOrder(3, EEffectLightDis.Body, 10289, 35, 13, 1, 13, EEffectLightTracer.StandAni, me.nowPos.x-3, me.nowPos.y, 20, false, 100);
        attack.lights[3].isMirror =true;        
      else
        attack:SetLightWithOrder(3, EEffectLightDis.Body, 10289, 35, 13, 1, 13, EEffectLightTracer.StandAni, me.nowPos.x+10, me.nowPos.y, 20, false, 100);
      end
      self.step = 7;              
    end
  elseif self.step == 7 then --身上出現白哀氣    
    if attack.lights[2].orderCount == 5 then      
      me.roleController:SetInBattle(false);
      me.roleController:FaceTo(me:GetSpot(EFightSpot.Front, 10));
      for i=0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        attack:SetLightWithOrder(4 + i, EEffectLightDis.Body, 10773,100,1,10,10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y,30, true, 13);        

        if target.party_Kind == EFightParty.Left then  --人在左
          attack.lights[4 + i].isMirror =true;
        end
      end
      self.interval = 1;
      self.step = 8;    
    end
  elseif self.step == 8 then     
    if self:CheckInterval() then
      self.step = 9;
      self.isLightEnd = true;
      --1--------------------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        local code = DemoCode.GetBitxor(20);
        code = code * 10;
      end
      ---2--------------------------------------------------------------
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
    end
  end
end

--狀態顯示
PitySoldierMe = InheritsFromBaseStatus();

function PitySoldierMe:ExtraClose()  
  FightField.RestoreFightInfo(self.humIdx,0);
end

function PitySoldierMe:Update()  
  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then 
    me:GetStatus(self.statusKind):SetLight(EEffectLightKind.Body1, 10773, 100, 1,10,10, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 30, true, 13);

    if me.party_Kind == EFightParty.Left then  --人在左
      me:GetStatus(self.statusKind).lights[EEffectLightKind.Body1].isMirror = true;
    end

    self.step = 2;  
  end
end