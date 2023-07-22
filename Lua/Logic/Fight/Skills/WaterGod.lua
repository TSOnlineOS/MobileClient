WaterGod1 = InheritsFromBaseAttackSkill();

function WaterGod1:Update()  
  local newPos;  
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local attack = FightField.attack[self.humIdx];
  if self.step == 1 then           
    me.roleController:MagicAttack();
    me.roleController:SetAnimationForceId(ERolePose.Magic);    
    --召喚陣
    attack:SetLightWithOrder(3, EEffectLightDis.Ground,10165,100,1,10,10, EEffectLightTracer.Standani, me.nowPos.x+10, me.nowPos.y,15, true, 60);
    --召喚陣聚氣
    attack:SetLightWithOrder(4,EEffectLightDis.Sky,10170,150,1,9,9, EEffectLightTracer.Standani, me.nowPos.x+10, me.nowPos.y,20, true, 80);
    self.interval = 0.9;
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
    if self:CheckInterval() then
      attack:SetLightWithOrder(2, EEffectLightDis.Sky, 10172, 90, 1, 18, 18, EEffectLightTracer.StandAni, 0, 27, 25, false, 160);
      self.step = 3;
    end
  elseif self.step ==3 then 
    if attack.lights[2].picId == 0 then
      me:PlaySound(target.colm, target.row, Attack_Start);--集氣2004/03/25
      newPos = Vector2.New(0, 27);
      --L10162 大的女神聚氣
      attack:SetLightWithOrder(1,EEffectLightDis.Sky, 10162, 50, 1, 17, 17, EEffectLightTracer.StandAni, newPos.x+15, newPos.y, 25, true, 6);
      --L10173 大水神聚氣姿勢 
      attack:SetLightWithOrder(2,EEffectLightDis.Sky, 10173, 100, 1, 8, 8, EEffectLightTracer.Stand, newPos.x,newPos.y, 25, true, 160);
      self.step = 4;
    end
  elseif self.step == 4 then 
    if attack.lights[1].picId == 0 then    
      me:PlaySound(target.colm, target.row, Attack_Start);--集氣2004/03/25
      newPos = Vector2.New(0, 27);
      --L10164 大的女神聚氣(循環)
      attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10164, 50, 1, 11, 11, EEffectLightTracer.StandAni, newPos.x+15, newPos.y, 25, true, 6);
      self.step = 5;
    end
  elseif self.step == 5 then 
    if attack.lights[1].picId == 0 then
      newPos = Vector2.New(0, 27);      
      --L10174 大的女神放射光(2D)
      attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10174, 120, 1, 12, 12, EEffectLightTracer.StandAni, newPos.x+15, newPos.y, 25, true, 106);
      me:PlaySound(target.colm, target.row, Attack_Start, 2);--放射聲2004/03/30
      for i=0, self.emyNum-1 do      
        target = FightField.fightHum[ self.emyIdxAy[i] ];        
        --放狀解的光影
        attack:SetLightWithOrder(5 + i*3, EEffectLightDis.Body, 10094,80,1,19,19, EEffectLightTracer.StandAni, target.nowPos.x,target.nowPos.y,30, true, 60);
        if me.party_Kind == target.party_Kind then                  
          attack:SetLightWithOrder(6 + i*3, EEffectLightDis.Body, 10144,70,1,17,17,EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y,30, true, 40);
          attack:SetLightWithOrder(7 + i*3, EEffectLightDis.Body, 10130,70,1,14,14,EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y,35, true, 50);
        end
      end
      self.step = 6;
    end
  elseif self.step == 6 then 
    if attack.lights[1].picId == 0 then              
      self.interval = 0.06;
      self.step = 7;
    end
  elseif self.step == 7 then       
    if self:CheckInterval() then 
      self.interval = 0.06;       
      attack.lights[2].alpha = attack.lights[2].alpha - 1;
      attack.lights[2].rawImage.material:SetFloat("_InvisibleAlpha", attack.lights[2].alpha / 32);
    end

    if attack.lights[2].alpha == 1 then
      self.step = 8;
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
  elseif self.step == 8 then 
      self.isLightEnd=true;
      self.step = 9;
  end
end
    

WaterGod2 =InheritsFromBaseAttackSkill();

function WaterGod2:Update()  
  local newPos;  
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local attack = FightField.attack[self.humIdx];
  if self.step == 1 then     
    me.roleController:MagicAttack();     
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    --召喚陣
    attack:SetLightWithOrder(1,EEffectLightDis.Ground,10165,100,1,10,10, EEffectLightTracer.Standani, me.nowPos.x+10, me.nowPos.y,15, true, 60);
    --召喚陣聚氣
    attack:SetLightWithOrder(3,EEffectLightDis.Sky,10170,150,1,9,9,EEffectLightTracer.Standani, me.nowPos.x+10, me.nowPos.y,20, true, 80);
    self.interval = 0.9;
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
    if self:CheckInterval() then    
      newPos = Vector2.New(-10, 107);
      --L10222 中水神起手姿勢
      attack:SetLightWithOrder(2,EEffectLightDis.Sky, 10222, 90, 1, 18, 18, EEffectLightTracer.StandAni, newPos.x,newPos.y, 25, false, 0);
      self.step = 3;
    end
  elseif self.step == 3 then 
    if attack.lights[2].picId == 0 then    
     me:PlaySound(target.colm, target.row, Attack_Start);--集氣2004/03/25
      newPos=Vector2.New(-10, 107);
      --L10162 大的女神聚氣
      attack:SetLightWithOrder(1,EEffectLightDis.Sky, 10162, 50, 1, 17, 17, EEffectLightTracer.StandAni,newPos.x+11, newPos.y-92, 25, true, 0);
      --L10223 中水神聚氣姿勢
      attack:SetLightWithOrder(2,EEffectLightDis.Sky, 10223, 100, 1, 8, 8, EEffectLightTracer.Stand, newPos.x,newPos.y, 25, true, 0);
      self.step = 4;
    end
  elseif self.step == 4 then 
    if attack.lights[1].picId == 0 then    
      me:PlaySound(target.colm, target.row, Attack_Start);--集氣2004/03/25
      newPos=Vector2.New(-10, 107);
      --L10164 大的女神聚氣(循環)
      attack:SetLightWithOrder(1,EEffectLightDis.Sky, 10164, 50, 1, 11, 11, EEffectLightTracer.StandAni, newPos.x+11, newPos.y-92, 25, true, 0);
      self.step =5;
    end
  elseif self.step == 5 then 
    if attack.lights[1].picId == 0 then    
      newPos=Vector2.New(-10, 107);
      attack:SetLightWithOrder(1,EEffectLightDis.Sky, 10174, 120, 1, 12, 12, EEffectLightTracer.StandAni, newPos.x+11, newPos.y-92, 25, true, 100);
      me:PlaySound(target.colm, target.row, Attack_Start,2);--放射聲2004/03/30
      for i=0, self.emyNum-1 do      
        target = FightField.fightHum[ self.emyIdxAy[i] ];        
        --放狀解的光影
        attack:SetLightWithOrder(5 + i*3, EEffectLightDis.Body, 10094,80,1,19,19, EEffectLightTracer.StandAni, target.nowPos.x,target.nowPos.y,30, true, 60);        
        if me.party_Kind == target.party_Kind then   
          attack:SetLightWithOrder(6 + i*3, EEffectLightDis.Body, 10144,70,1,17,17,EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y,30, true, 40);
          attack:SetLightWithOrder(7 + i*3, EEffectLightDis.Body, 10130,70,1,14,14,EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y,35, true, 50);
        end        
      end
      self.step = 6
    end
  elseif self.step == 6 then
    if attack.lights[1].picId == 0 then              
      self.interval = 0.06;
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
    end
  elseif self.step == 7 then       
    if self:CheckInterval() then        
      self.interval = 0.06
      attack.lights[2].alpha = attack.lights[2].alpha - 1;
      attack.lights[2].rawImage.material:SetFloat("_InvisibleAlpha", attack.lights[2].alpha / 32);
    end

    if attack.lights[2].alpha == 1 then
      self.step = 8;
    end
  elseif self.step == 8 then 
    self.isLightEnd=true;
    self.step =9;
  end
end

WaterGod3 = InheritsFromBaseAttackSkill();

function WaterGod3:Update()  
  local newPos;  
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local attack = FightField.attack[self.humIdx];
  if self.step == 1 then     
    if me.party_Kind ~= target.party_Kind then    
      newPos = me:GetMagicPos();
      me:SetMoment(newPos.x, newPos.y, false);
    end
    me.roleController:MagicAttack();      
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    --召喚陣
    attack:SetLightWithOrder(1,EEffectLightDis.Ground,10165,100,1,10,10, EEffectLightTracer.Standani, me.nowPos.x+10, me.nowPos.y,15, true, 60);
    --召喚陣聚氣
    attack:SetLightWithOrder(3,EEffectLightDis.Sky,10170,150,1,9,9,EEffectLightTracer.Standani, me.nowPos.x+10, me.nowPos.y,20, true, 80);
    
    self.interval = 0.9;
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
    if self:CheckInterval() then          
      --小水神起手姿勢
      attack:SetLightWithOrder(2,EEffectLightDis.Sky, 10224, 90, 1, 18, 18, EEffectLightTracer.StandAni, me.nowPos.x-6,me.nowPos.y-134, 25, false, 160);
      self.step = 3;
    end
  elseif self.step == 3 then 
    if attack.lights[2].picId == 0 then    
      me:PlaySound(target.colm, target.row, Attack_Start);--集氣2004/03/25
      --L10162 小的女神聚氣
      attack:SetLightWithOrder(1,EEffectLightDis.Sky, 10244, 50, 1, 17, 17, EEffectLightTracer.StandAni,me.nowPos.x-1, me.nowPos.y-134, 25, true, 96);
      --L10223 小水神聚氣姿勢
      attack:SetLightWithOrder(2,EEffectLightDis.Sky, 10225, 100, 1, 8, 8, EEffectLightTracer.Stand, me.nowPos.x-6,me.nowPos.y-134, 25, true, 160);
      self.step = 4;
    end
  elseif self.step == 4 then 
    if attack.lights[1].picId == 0 then    
      me:PlaySound(target.colm, target.row, Attack_Start);--集氣2004/03/25
      --L10164 小的女神聚氣(循環)
      attack:SetLightWithOrder(1,EEffectLightDis.Sky, 10245, 50, 1, 11, 11, EEffectLightTracer.StandAni, me.nowPos.x-1, me.nowPos.y-134, 25, true, 96);
      self.step =5;
    end
  elseif self.step == 5 then 
    if attack.lights[1].picId == 0 then    
      attack:SetLightWithOrder(1,EEffectLightDis.Sky, 10246, 120, 1, 12, 12, EEffectLightTracer.StandAni, me.nowPos.x-1, me.nowPos.y-134, 25, true, 138);
      me:PlaySound(target.colm, target.row, Attack_Start,2);--放射聲2004/03/30
      for i=0, self.emyNum-1 do      
        target = FightField.fightHum[ self.emyIdxAy[i] ];        
        --放狀解的光影
        attack:SetLightWithOrder(5 + i*3, EEffectLightDis.Body, 10094,80,1,19,19, EEffectLightTracer.StandAni, target.nowPos.x,target.nowPos.y,30, true, 60);        
        if me.party_Kind == target.party_Kind then   
          attack:SetLightWithOrder(6 + i*3, EEffectLightDis.Body, 10144,70,1,17,17,EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y,30, true, 40);
          attack:SetLightWithOrder(7 + i*3, EEffectLightDis.Body, 10130,70,1,14,14,EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y,35, true, 50);
        end          
      end
      self.step = 6
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
  elseif self.step == 6 then
    if attack.lights[1].picId == 0 then              
      self.interval = 0.06;
      self.step = 7;
    end
  elseif self.step == 7 then       
    if self:CheckInterval() then        
      self.interval = 0.06;
      attack.lights[2].alpha = attack.lights[2].alpha - 1;
      attack.lights[2].rawImage.material:SetFloat("_InvisibleAlpha", attack.lights[2].alpha / 32);
    end

    if attack.lights[2].alpha == 1 then
      self.step = 8;
    end
  elseif self.step == 8 then 
    self.isLightEnd=true;
    self.step =9;
  end
end