GoldShield = InheritsFromBaseAttackSkill();

function GoldShield:Update()
  local newPos;  --TPoint:存x,y
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local attack = FightField.attack[self.humIdx];

  if self.step == 1 then     
    me.roleController:MagicAttack();
    --030601J土魔法陣
    attack:SetLight(EEffectLightKind.Ground,10080,50,1,21,21,EEffectLightTracer.StandAni, me.nowPos.x+6, me.nowPos.y,20, true, 80);    
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
    self.step = 2;              
  elseif self.step == 2 then 
    if self:CheckInterval() then      
      newPos = target:RCtoSpot(target.colm, target.row);
      attack:SetLightWithOrder(2, EEffectLightDis.Sky,10501,100,1,18,18,EEffectLightTracer.StandAni, newPos.x, newPos.y-100,30, false, 0);
      self.step = 3;        
    end
  elseif self.step == 3 then     
    if attack:CheckLightIsEnd(2)then      
      newPos = target:RCtoSpot(target.colm, target.row);
      attack:SetLightWithOrder(2, EEffectLightDis.Sky,10501,30,9,18,18, EEffectLightTracer.Line,newPos.x, newPos.y-100 ,30, true, 45, newPos.x ,newPos.y ,0.20);
      self.step = 4;        
    end
  elseif self.step == 4 then 
    if attack.lights[2].isArrive then      
      newPos = target:RCtoSpot(target.colm, target.row);
      me:PlaySound(target.colm, target.row, Attack_Start);
      attack:SetLightWithOrder(2,EEffectLightDis.Sky,10501,100,18,18,18,EEffectLightTracer.StandAni, newPos.x, newPos.y,30, true, 45);
      FightField.SetShake(true);  --地震效果      
      self.interval = 0.3;
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
      self.step = 5;
    end
  elseif self.step == 5 then 
    if self:CheckInterval() then      
      FightField.SetShake(false);   --地震效果
      self.step = 6;        
    end
  elseif self.step == 6 then --特技施展完畢          
    self.isLightEnd = true;      
    self.step = 7;
  end
end

GoldShieldMe = InheritsFromBaseStatus();

function GoldShieldMe:Update()  
  local newPos;

  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then     
    newPos = me:RCtoSpot(me.colm, me.row);
    local status = me:GetStatus(self.statusKind);
    if me.party_Kind == EFightParty.Left then           
      status:SetLight(EEffectLightKind.Sky1,10501,100,15,18,18, EEffectLightTracer.Stand, newPos.x, newPos.y,30, true, 45);
    elseif me.party_Kind == EFightParty.Right then           
      status:SetLight(EEffectLightKind.Sky1,10501,100,15,18,18, EEffectLightTracer.Stand, newPos.x, newPos.y,30, true, 45);
    end            
    self.step = 2;      
  end
end