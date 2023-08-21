PlantGarlic = InheritsFromBaseAttackSkill();

function PlantGarlic:InitExtraParameters()
  self.isHit = false;
  self.fallDown = false;
  self.plantOldTime = 0;
  self.meWeapon = false;
  self.tarWeapon = false;
end


function PlantGarlic:GoPlant()
  local result = false;
  local x, y;
  local light = FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1];
  
  if light.isArrive then  
    if self.fallDown == false then      
      FightField.fightHum[self.tarIdx]:SetOverturn(true);
      self.fallDown = true;
      x = light.showPos.x;
      y = light.showPos.y;
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1,10017, 50,1,6,6, EEffectLightTracer.Line, x, y,20, true, 15 ,x, y+200, 0.72);      
    else      
      result = true;        
    end
  end

  FightField.fightHum[self.humIdx].fantasY = light.showPos.y;
  FightField.fightHum[self.humIdx].isPlant = true;
  FightField.fightHum[self.tarIdx].fantasY = light.showPos.y;
  FightField.fightHum[self.tarIdx].isPlant = true;
  return result;
end

function PlantGarlic:Update3()    
  local me = FightField.fightHum[self.humIdx];
   --三人小隊用
  if me.kind ~= EHuman.Players and me.kind ~= EHuman.Player and me.data ~= nil and me.data.kind == 34 then      
     self:Update3();
     return;
   end

  local newPos;  
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then     
    newPos = target:GetSpot(EFightSpot.Front, 15);
    me:SetWalk(newPos.x, newPos.y);
    me.roleController:SetInBattle(false);
    me.roleController:SetIsMoving(true);    
    me:SetSpeed(0.52);
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
    self.step = 2;              
  elseif self.step == 2 then       
    if me.arrive then        
      self.step = 3;
      me.roleController:SetIsMoving(false);   
      self.isHit = false;
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1,10017, 50,1,6,6,EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y,20, true, 15, me.nowPos.x, me.nowPos.y-200, 0.36);

      me:PlaySound(target.colm, target.row, Attack_Start);   

      self.plantOldTime = CGTimer.time;
      me.isPlant = true;
      target.isPlant = true;        
    end
  elseif self.step == 3 then 
    if self:GoPlant() then        
      --煙
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10016, 30, 1,15, 15, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y+60, 30, false, 25);
      target:PlaySound();
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      self.step = 4;          
      FightField.SetShake(true);        
    end
  elseif self.step == 4 then 
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky2].orderCount == 3 then        
      FightField.SetShake(false);
      local pos = target:GetChipPos();
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground, 10010, 70, 1, 4, 4, EEffectLightTracer.StandAni, pos.x, pos.y, 255, false, 60);
      self.step = 5;
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
  elseif self.step == 5 then       
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky2].orderCount == 14 then        
      self.step = 6;
      me.isPlant = false;
      target.isPlant = false;
      target:SetOverturn(false);
      FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Sky1);
      FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Sky2);
      me:SetJump(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y, false);
      me.roleController:SetInBattle(true);  
      me.roleController:SetIsJumping(true);
      FightField.RestoreFightInfo(self.tarIdx);        
    end
  elseif self.step == 6 then 
    if FightField.fightHum[self.humIdx].arrive then
      self.step = 7;
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
      me.roleController:SetIsJumping(false);
      self.isLightEnd = true;
    end
  end
end

function PlantGarlic:Update()  
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self.step == 1 then     
    newPos = target:GetSpot(EFightSpot.Front, 15);
    me:SetWalk(newPos.x, newPos.y);
    --todo 衝刺
    me.roleController:SetAnimationForceId(ERolePose.Walk);
    me:SetSpeed(0.52);
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
    self.step = 2;              
  elseif self.step == 2 then       
    if me.arrive then        
      self.step = 3;                
      --todo 衝刺Stop
      me.roleController:SetAnimationForceId(ERolePose.None);
      me.roleController:FaceTo(target.nowPos);                    
      --Target.isWeapon:=False;
      self.isHit = false;
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1,10017, 50,1,6,6, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y,20, true, 15, me.nowPos.x, me.nowPos.y-200, 0.36);
      me:PlaySound(target.colm, target.row, Attack_Start);   
      self.plantOldTime = CGTimer.time;      
    end
  elseif self.step == 3 then       
    if self:GoPlant() then        
      --煙
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10016, 30, 1,15, 15, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y+60, 30, false, 25);
      target:PlaySound();
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      self.step = 4;          
      FightField.SetShake(true);
    end      
  elseif self.step == 4 then 
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky2].orderCount == 3 then        
      FightField.SetShake(false);
      local pos = target:GetChipPos();
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground, 10010, 70, 1, 4, 4, EEffectLightTracer.StandAni, pos.x, pos.y, 255, false, 60);
      self.step = 5;                  
    end
  elseif self.step == 5 then       
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky2].orderCount==14 then        
      self.step =6;
      me.isPlant = false;
      target.isPlant = false;
      target:SetOverturn(false);
      FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Sky1);
      FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Sky2);
      me:SetJump( FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y, false);
      me.roleController:SetIsJumping(true);
      FightField.RestoreFightInfo(self.tarIdx);        
    end
  elseif self.step == 6 then     
    if FightField.fightHum[self.humIdx].arrive then
      me.roleController:SetIsJumping(false);
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