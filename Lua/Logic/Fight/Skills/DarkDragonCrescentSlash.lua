DarkDragonCrescentSlash = InheritsFromBaseAttackSkill();
function DarkDragonCrescentSlash:InitExtraParameters()
  self.effectColor = LuaHelper.GetColor(205, 0, 170, 255);
end

function DarkDragonCrescentSlash:ExtraClose()
  if FightField.fightHum[self.humIdx] ~= nil and FightField.fightHum[self.humIdx].roleController ~= nil then 
    FightField.fightHum[self.humIdx].roleController.gameObject:SetActive(true);
  end
end

function DarkDragonCrescentSlash:Update()
  local newPos;
  local shiftY;
  
  local me = FightField.fightHum[self.humIdx];          --設發招者為 Me
  local target = FightField.fightHum[self.tarIdx];      --設目標為 Target
  local attack = FightField.attack[self.humIdx];

  if self.step == 1 then     
    me.roleController:MagicAttack();               --做施法動作
    attack:SetLightWithOrder(2, EEffectLightDis.Body, 10003, 50, 4, 20, 25, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 20, true, 30);
    attack:SetLightWithOrder(3, EEffectLightDis.Body, 10003, 50, 4, 20, 25, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 20, true, 50);
    attack:SetLightWithOrder(4, EEffectLightDis.Body, 10003, 50, 4, 20, 25, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 20, true, 10);
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
    if attack.lights[2].orderCount == 2 then      
      me.roleController:SetAnimationForceId(ERolePose.Meditation);
      if me.party_Kind == EFightParty.Right then
        attack:SetLightWithOrder(1, EEffectLightDis.Body, 10754, 150, 17, 17, 17, EEffectLightTracer.Stand, me.nowPos.x - 50, me.nowPos.y, 255, false, 63);        
      else
        attack:SetLightWithOrder(1, EEffectLightDis.Body, 10756, 150, 17, 17, 17, EEffectLightTracer.Stand, me.nowPos.x + 50, me.nowPos.y, 255, false, 75);
      end
      attack.lights[1]:SetColor(self.effectColor);
      self.step = 3;
    end
  elseif self.step == 3 then 
    if attack.lights[2].orderCount == 9 then      
      me.roleController.gameObject:SetActive(false);
      newPos = target:GetAttackPos(EFightSpot.Front, 60);
      if me.party_Kind == EFightParty.Right then
        attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10754, 150, 1, 1, 17, EEffectLightTracer.Curve, me.nowPos.x- 50, me.nowPos.y, 255, false, 63, newPos.x - 50, newPos.y, 0.6)
      else
        attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10756, 150, 1, 1, 17, EEffectLightTracer.Curve, me.nowPos.x+ 50, me.nowPos.y, 255, false, 75, newPos.x + 50, newPos.y, 0.6);
      end
      attack.lights[1]:SetColor(self.effectColor);
      self.step = 4;
    end
  elseif self.step == 4 then 
    if attack.lights[1].isArrive then      
      newPos = target:GetAttackPos(EFightSpot.Front, 60);
      if me.party_Kind == EFightParty.Right then        
        attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10754, 170, 2, 17, 17, EEffectLightTracer.StandAni, newPos.x - 50, newPos.y, 255, false, 60);
        attack:SetLightWithOrder(5, EEffectLightDis.Sky, 10753, 170, 1, 15, 15, EEffectLightTracer.StandAni, newPos.x - 50, newPos.y, 20, false, 63);        
      else      
        attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10756, 170, 2, 17, 17, EEffectLightTracer.StandAni, newPos.x + 50, newPos.y, 255, false, 75);
        attack:SetLightWithOrder(5, EEffectLightDis.Sky, 10755, 170, 1, 15, 15, EEffectLightTracer.StandAni, newPos.x + 50, newPos.y, 20, false, 75);    
      end      
      attack:SetLightWithOrder(6, EEffectLightDis.Sky, 10419, 50, 1, 7, 7, EEffectLightTracer.StandAni, newPos.x + 8, newPos.y, 30, false, 85);
      attack.lights[1]:SetColor(self.effectColor);
      attack.lights[5]:SetColor(self.effectColor);
      attack.lights[5]:SetAddColor(5);
      attack.lights[6]:SetColor(self.effectColor);
      attack.lights[6]:SetAddColor(5);
      self.step = 5;
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
    end
  elseif self.step == 5 then 
    if attack.lights[5].orderCount >= 2 then      
      shiftY = math.random(0,20) - math.random(0,20);

      attack:SetLightWithOrder(8, EEffectLightDis.Body, 10000, 50, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x+5, target.nowPos.y + shiftY, 20, true, 30);
      me:PlaySound(target.colm, target.row, Attack_Start);
      newPos = target:GetAttackPos(EFightSpot.Front, 60);
      attack:SetLightWithOrder(7, EEffectLightDis.Sky, 10020, 80, 1, 10, 10, EEffectLightTracer.Stand, newPos.x + 8, newPos.y, 15, true, 75);
      target.roleController:Hit();  
      target.roleController:SetAnimationForceId(ERolePose.Hit);
      self.step = 6;
    end
  elseif self.step == 6 then 
    if attack.lights[5].orderCount >= 4 then      
      shiftY = math.random(0,20) - math.random(0,20);
      attack:SetLightWithOrder(8, EEffectLightDis.Body, 10000, 50, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x+5, target.nowPos.y+ shiftY, 20, true, 30);
      me:PlaySound(target.colm, target.row, Attack_Start);
      self.step = 7;
    end
  elseif self.step == 7 then 
    if attack.lights[5].orderCount >= 6 then      
      shiftY = math.random(0,20) - math.random(0,20);
      attack:SetLightWithOrder(8, EEffectLightDis.Body, 10000, 50, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x+5, target.nowPos.y+ shiftY, 20, true, 30);
      me:PlaySound(target.colm, target.row, Attack_Start);
      self.step = 8;
    end
  elseif self.step == 8 then 
    if attack.lights[5].orderCount >= 7 then      
      attack:SetLightWithOrder(8, EEffectLightDis.Body, 10757, 150, 1, 14, 14, EEffectLightTracer.StandAni, target.nowPos.x+5, target.nowPos.y, 25, true, 65);
      me:PlaySound(target.colm, target.row, Attack_Hit);
      self.step = 9;
    end
  elseif self.step == 9 then 
    if attack:CheckLightIsEnd(1) then      
      newPos = target:GetAttackPos(EFightSpot.Front, 60);
      if me.party_Kind == EFightParty.Right then        
        attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10754, 180, 17, 17, 17, EEffectLightTracer.Stand, newPos.x - 50, newPos.y, 255, false, 60);        
      else      
        attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10756, 180, 17, 17, 17, EEffectLightTracer.Stand, newPos.x + 50, newPos.y, 255, false, 75);
      end      
      attack.lights[1]:SetColor(self.effectColor);
      self.interval = 0.4;
      self.step = 10;
    end
  elseif self.step == 10 then 
    if attack:CheckLightIsEnd(6) then
      if self:CheckInterval() then     
        target.roleController:SetAnimationForceId(ERolePose.None);
        self.isLightEnd  = true;  --特技施展完畢
        self.step = 11;
      end
    end
  end
end