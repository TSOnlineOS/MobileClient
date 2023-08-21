--招喚技 岩怪
--大
Rocky1 = InheritsFromBaseAttackSkill();

function Rocky1:InitExtraParameters()
  local me = FightField.fightHum[self.humIdx];
  self.hitCount = 1;                   --重炮下擊次數,呼吸次數    
  if me.npcId ~= nil and Between(me.npcId, 35033, 35034) then --玄武,玄武左右手          
    self.isTurtle = true;              
  else
    self.isTurtle = false;
  end
end


function Rocky1:ExtraClose()
  if self.isTurtle  then   --  玄武,玄武左右手   
    if FightField.fightHum[self.humIdx] ~= nil and FightField.fightHum[self.humIdx].roleController ~= nil then 
      FightField.fightHum[self.humIdx].roleController:SetAnimationForceId(ERolePose.None);
    end

    local ids = {35032, 35033, 35034};
    for k, v in pairs(ids)do 
      local tempRole = FightField.GetRoleByNpcId(v);              
      if tempRole ~= nil then
        tempRole.roleController:SetVisible(ERoleVisible.Visible);
      end 
    end
  end
end

function Rocky1:Update()  
  if self.isTurtle then 
    self:TurtleUpdate();
    return;
  end

  local newPos,newPos2,newPos3,newPos4,newPos5; 
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local attack = FightField.attack[self.humIdx];
  if self.step == 1 then       
    me.roleController:SetAnimationForceId(ERolePose.Magic);   
    --召喚陣
    attack:SetLightWithOrder(6, EEffectLightDis.Ground,10165,100,1,10,10, EEffectLightTracer.Stand, me.nowPos.x+10, me.nowPos.y,15, true, 60);
    --召喚陣聚氣
    attack:SetLightWithOrder(7,EEffectLightDis.Sky,10170,150,1,9,9,EEffectLightTracer.Stand, me.nowPos.x+10, me.nowPos.y,20, true, 80);
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
    if target.party_Kind == EFightParty.Right then      
      newPos = target:RCtoSpot(2,2,EFightSpot.Front,100);
      --L10226 大岩怪出埸正面
      attack:SetLightWithOrder(1,EEffectLightDis.Sky, 10226, 100, 1, 9, 9, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 80);
      attack:SetLightWithOrder(9,EEffectLightDis.Ground, "MonsterShadow", 100, 1, 1, 1, EEffectLightTracer.Stand, newPos.x-24, newPos.y-6, 255, false, 0);      
    else    
      newPos = target:RCtoSpot(1,2,EFightSpot.Front,100);
      --L10235 大岩怪出埸背面
      attack:SetLightWithOrder(1,EEffectLightDis.Sky, 10235, 100, 1, 9, 9, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 80);
      attack:SetLightWithOrder(9,EEffectLightDis.Ground, "MonsterShadow", 100, 1, 1, 1, EEffectLightTracer.Stand, newPos.x+32, newPos.y, 255, false, 27);
    end

    self.step = 3  
  elseif self.step == 3 then 
    if attack.lights[1].nowPage == attack.lights[1].endPage then    
      if target.party_Kind == EFightParty.Right then      
        newPos= target:RCtoSpot(2,2,EFightSpot.Front,100);
        --L10227 大岩怪備戰正面
        attack:SetLightWithOrder(1,EEffectLightDis.Sky, 10227, 100, 1, 2, 2, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, true, 80);      
      else      
        newPos = target:RCtoSpot(1,2,EFightSpot.Front,100);
        --L10236 大岩怪備戰背面
        attack:SetLightWithOrder(1,EEffectLightDis.Sky, 10236, 100, 1, 2, 2, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, true, 80);
      end

      self.step = 4;
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
  elseif self.step == 4 then 
    if attack.lights[1].nowPage == attack.lights[1].endPage then    
      --岩怪大力向下
      if target.party_Kind == EFightParty.Right then      
        newPos = target:RCtoSpot(2,2,EFightSpot.Front,100);
        --L10228 大岩怪攻擊正面
        attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10228, 100, 1, 4, 4, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, true, 80);      
      else      
        newPos = target:RCtoSpot(1,2,EFightSpot.Front,100);
        --L10237 大岩怪攻擊背面
        attack:SetLightWithOrder(1,EEffectLightDis.Sky, 10237, 100, 1, 4, 4, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, true, 80);
      end

      self.step = 5;
    end
  elseif self.step == 5 then 
    if attack.lights[1].nowPage == attack.lights[1].endPage then
      FightField.SetShake(true);          
      me:PlaySound(target.colm, target.row, Attack_Start);  --擊地聲
      for i=0, self.emyNum-1 do      
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        target.roleController:SetIsDead(true);

        if math.random(0, 1) ==1 then
          newPos = target:GetSpot(EFightSpot.Back, 60)
        else
          newPos = target:GetSpot(EFightSpot.Front, 60);
        end

        target:SetJump(newPos.x, newPos.y, true);
      end

      --加煙
      if target.party_Kind == EFightParty.Right then      
        newPos = target:RCtoSpot(2,1,EFightSpot.Back, math.random(30)+10);
        newPos2 = target:RCtoSpot(2,3,EFightSpot.Back, math.random(30)+30);
        newPos3 = target:RCtoSpot(2,2,EFightSpot.Back, math.random(30)+30);
        newPos5 = target:RCtoSpot(2,2,EFightSpot.Back, math.random(30)+30);
        newPos4 = target:RCtoSpot(2,3,EFightSpot.Back, math.random(30)+30);
      else
        newPos = target:RCtoSpot(1,1,EFightSpot.Back, math.random(30)+10);
        newPos2 = target:RCtoSpot(1,3,EFightSpot.Back, math.random(30)+30);
        newPos5 = target:RCtoSpot(1,2,EFightSpot.Back, math.random(30)+30);
        newPos3 = target:RCtoSpot(1,2,EFightSpot.Back, math.random(30)+30);
        newPos4 = target:RCtoSpot(1,3,EFightSpot.Back, math.random(30)+30);
      end
      --煙
      attack:SetLightWithOrder(2, EEffectLightDis.Sky,10016, 60,1,15, 15, EEffectLightTracer.StandAni, newPos.x, newPos.y + math.random(30), 50, false, 55);
      attack:SetLightWithOrder(4, EEffectLightDis.Sky,10016, 60,3,15, 15, EEffectLightTracer.StandAni, newPos2.x, newPos2.y + math.random(30), 50, false, 55);
      attack:SetLightWithOrder(8, EEffectLightDis.Sky,10016, 60,5,15, 15, EEffectLightTracer.StandAni, newPos5.x, newPos5.y + math.random(30), 50, false, 55);

      --L10171 岩怪地裂
      attack:SetLightWithOrder(3, EEffectLightDis.Ground,10171,150,(self.hitCount-1)*2+1,self.hitCount*2,6, EEffectLightTracer.Stand, newPos3.x, newPos3.y, 255, false, 80);
      attack:SetLightWithOrder(5, EEffectLightDis.Ground,10171,150,(self.hitCount-1)*2+1,self.hitCount*2,6, EEffectLightTracer.Stand, newPos4.x, newPos4.y,255, false, 80);

      --岩怪站起來
      if target.party_Kind == EFightParty.Right then      
        newPos = target:RCtoSpot(2,2,EFightSpot.Front,100);
        --L10228 大岩怪攻擊正面 
        attack.lights[1]:SetPage(4, 2);
      else      
        newPos = target:RCtoSpot(1,2,EFightSpot.Front,100);
        --L10237 大岩怪攻擊背面
        attack.lights[1]:SetPage(4, 2);
      end
            
      self.step = 6;
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
    if attack.lights[1].nowPage == attack.lights[1].endPage then     
    --要下擊三下
      if self.hitCount < 3 then       
        --岩怪大力向下
        if target.party_Kind == EFightParty.Right then           
          newPos = target:RCtoSpot(2,2,EFightSpot.Front,100);
          --L10228 大岩怪攻擊正面   
          attack.lights[1]:SetPage(1, 4);
        else        
          newPos = target:RCtoSpot(2,2,EFightSpot.Front,100);
          --L10237 大岩怪攻擊背面
          attack.lights[1]:SetPage(1, 4);
        end
        self.hitCount = self.hitCount + 1;
        self.step = 5;         --注意跳的順序
        return;
     end

      --被打的人走回原位
     for i=0, self.emyNum-1 do       
       target = FightField.fightHum[ self.emyIdxAy[i] ];
       target.roleController:SetIsDead(false);
       target.roleController:SetInBattle(false);
       target.roleController:SetIsMoving(true);        

        newPos = target:RCtoSpot(target.colm, target.row);
        target:SetWalk( newPos.x, newPos.y, true);
        target:SetSpeed(0.24);
      end
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
      self.hitCount = 1;   --設定呼吸次數       
      FightField.SetShake(false);
    end
  elseif self.step == 7 then     
    for i=0, self.emyNum-1 do      
      target = FightField.fightHum[self.emyIdxAy[i]];
      if target.arrive and target.isMoving == true then         
          FightField.RestoreFightInfo(self.emyIdxAy[i])
      end
    end

      --呼吸二次
      if self.hitCount < 3 then        
        self.hitCount = self.hitCount + 1;          
        if target.party_Kind == EFightParty.Right then          
          newPos = target:RCtoSpot(2,2,EFightSpot.Front,100);
          --L10227 大岩怪備戰正面
          attack:SetLightWithOrder(1,EEffectLightDis.Sky, 10227, 150, 1, 2, 2, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, true, 80);          
        else        
          newPos= target:RCtoSpot(1,2,EFightSpot.Front,100);
          --L10236 大岩怪備戰背面
          attack:SetLightWithOrder(1,EEffectLightDis.Sky, 10236, 150, 1, 2, 2, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, true, 80);
        end
        return;
      end
      self.interval = 0.6;
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
  elseif self.step == 8 then      
     if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 9;
    end
  end
end

function Rocky1:TurtleUpdate()  
  local newPos,newPos2,newPos3,newPos4, newPos5;

  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local attack = FightField.attack[self.humIdx];
  if self.step == 1 then           
    me.roleController:SetAnimationForceId(ERolePose.Attack);
    --使用右手
    local tempRole = FightField.GetRoleByNpcId(35032);              
    if tempRole ~= nil then
      tempRole.roleController:SetVisible(ERoleVisible.Hide);
    end

    local handId = nil;
    if me.id == 35034 then        
      handId = 35033;      
    else      
      handId = 35034;      
    end

    local tempRole = FightField.GetRoleByNpcId(handId);              
    if tempRole ~= nil then
      tempRole.roleController:SetVisible(ERoleVisible.Hide);
    end

    --召喚陣
    attack:SetLightWithOrder(6, EEffectLightDis.Ground,10165,100,1,10,10, EEffectLightTracer.Stand, me.nowPos.x+10, me.nowPos.y,15, true, 60);
    --召喚陣聚氣
    attack:SetLightWithOrder(7, EEffectLightDis.Sky,10170,150,1,9,9, EEffectLightTracer.Stand, me.nowPos.x+10, me.nowPos.y,20, true, 80);
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
    if target.party_Kind == EFightParty.Right then      
      newPos = target:RCtoSpot(2, 2, EFightSpot.Front, 100);
      --L10226 大岩怪出埸正面
      attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10226, 100, 1, 9, 9, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 80);
      attack:SetLightWithOrder(9, EEffectLightDis.Ground, "MonsterShadow", 100, 1, 1, 1, EEffectLightTracer.Stand, newPos.x-24, newPos.y-6, 255, false, 0);      
    else      
      newPos = target:RCtoSpot(1, 2, EFightSpot.Front, 100);
      --L10235 大岩怪出埸背面
      attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10235, 100, 1, 9, 9, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 80);
      attack:SetLight(9,EEffectLightDis.Ground, "MonsterShadow", 100, 1, 1, 1, EEffectLightTracer.Stand, newPos.x+32, newPos.y, 255, false, 27);
    end

    self.step = 3;
  elseif self.step == 3 then         
    if attack.lights[1].picId == 0 then    
      if target.party_Kind == EFightParty.Right then      
        newPos = target:RCtoSpot(2, 2, EFightSpot.Front, 100);
        --L10227 大岩怪備戰正面
        attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10227, 100, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 80);      
      else      
        newPos = target:RCtoSpot(1, 2, EFightSpot.Front, 100);
        --L10236 大岩怪備戰背面
        attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10236, 100, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 80);
      end

      self.step = 4;
    end
  elseif self.step == 4 then 
    if attack.lights[1].picId == 0 then    
      --岩怪大力向下
      if target.party_Kind == EFightParty.Right then      
        newPos = target:RCtoSpot(2, 2, EFightSpot.Front, 100);
        --L10228 大岩怪攻擊正面
        attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10228, 100, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 80);      
      else      
        newPos = target:RCtoSpot(1, 2, EFightSpot.Front, 100);
        --L10237 大岩怪攻擊背面
        attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10237, 100, 1, 4, 4, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 80);
      end

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
    if attack.lights[1].picId == 0 then          
      FightField.SetShake(true);
      me:PlaySound(target.colm, target.row, Attack_Start);  --擊地聲
      for i=0, self.emyNum-1 do      
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        target.roleController:SetIsDead(true);

        if math.random(0, 1) == 1 then
          newPos = target:GetSpot(EFightSpot.Back, 60)
        else
          newPos = target:GetSpot(EFightSpot.Front, 60);
        end

        target:SetJump(newPos.x, newPos.y, true);
      end
      --加煙
      if target.party_Kind == EFightParty.Right then      
        newPos = target:RCtoSpot(2,1,EFightSpot.Back, math.random(30)+10);
        newPos2=target:RCtoSpot(2,3,EFightSpot.Back, math.random(30)+30);
        newPos3=target:RCtoSpot(2,2,EFightSpot.Back, math.random(30)+30);
        newPos5=target:RCtoSpot(2,2,EFightSpot.Back, math.random(30)+30);
        newPos4=target:RCtoSpot(2,3,EFightSpot.Back, math.random(30)+30);
      else
        newPos=target:RCtoSpot(1,1,EFightSpot.Back, math.random(30)+10);
        newPos2=target:RCtoSpot(1,3,EFightSpot.Back, math.random(30)+30);
        newPos5=target:RCtoSpot(1,2,EFightSpot.Back, math.random(30)+30);
        newPos3=target:RCtoSpot(1,2,EFightSpot.Back, math.random(30)+30);
        newPos4=target:RCtoSpot(1,3,EFightSpot.Back, math.random(30)+30);
      end
      --煙
      attack:SetLightWithOrder(2,EEffectLightDis.Sky,10016, 60,1,15, 15,EEffectLightTracer.StandAni,newPos.x, newPos.y+ math.random(30), 50, false, 55);
      attack:SetLightWithOrder(4,EEffectLightDis.Sky,10016, 60,3,15, 15,EEffectLightTracer.StandAni,newPos2.x, newPos2.y+ math.random(30), 50, false, 55);
      attack:SetLightWithOrder(8,EEffectLightDis.Sky,10016, 60,5,15, 15,EEffectLightTracer.StandAni,newPos5.x, newPos5.y+ math.random(30), 50, false, 55);
      attack:SetLightWithOrder(3,EEffectLightDis.Ground,10171,150,(self.hitCount-1)*2+1,self.hitCount*2,6,EEffectLightTracer.Stand, newPos3.x, newPos3.y,255, false, 80);
      attack:SetLightWithOrder(5,EEffectLightDis.Ground,10171,150,(self.hitCount-1)*2+1,self.hitCount*2,6,EEffectLightTracer.Stand, newPos4.x, newPos4.y,255, false, 80);

      --岩怪站起來
      if target.party_Kind == EFightParty.Right then      
        newPos = target:RCtoSpot(2,2,EFightSpot.Front,100);
        --L10228 大岩怪攻擊正面
        attack:SetLightWithOrder(1,EEffectLightDis.Sky, 10228, 100, 4, 1, 4, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 80);      
      else      
        newPos = target:RCtoSpot(1,2,EFightSpot.Front,100);
        --L10237 大岩怪攻擊背面
        attack:SetLightWithOrder(1,EEffectLightDis.Sky, 10237, 100, 4, 1, 4, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 80);
      end
            
      self.step = 6;
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
      --要下擊三下
      if self.hitCount < 3 then       
         --岩怪大力向下
        if target.party_Kind == EFightParty.Right then           
          newPos = target:RCtoSpot(2, 2, EFightSpot.Front, 100);
          --L10228 大岩怪攻擊正面
          attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10228, 100, 2, 4, 4, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 80);           
        else        
          newPos = target:RCtoSpot(1, 2, EFightSpot.Front, 100);
          --L10237 大岩怪攻擊背面
          attack:SetLightWithOrder(1,EEffectLightDis.Sky, 10237, 100, 2, 4, 4, EEffectLightTracer.standani, newPos.x, newPos.y, 255, true, 80);
        end
        self.hitCount = self.hitCount + 1;
        self.step = 5;         --注意跳的順序
        return;
      end

      --被打的人走回原位
      for i=0, self.emyNum-1 do      
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        target.roleController:SetIsDead(false);
        target.roleController:SetInBattle(false);
        target.roleController:SetIsMoving(true);

        newPos = target:RCtoSpot(target.colm, target.row);
        target:SetWalk(newPos.x, newPos.y, true);
        target:SetSpeed(0.24);
      end
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
      self.hitCount = 1;   --設定呼吸次數
      FightField.SetShake(false);
    end
  elseif self.step == 7 then     
    for i=0, self.emyNum-1 do      
      target = FightField.fightHum[self.emyIdxAy[i]];
      if target.arrive and target.isMoving == true then         
          FightField.RestoreFightInfo(self.emyIdxAy[i])
      end
    end

    if attack.lights[1].picId == 0 then      
      --呼吸二次
      if self.hitCount < 3 then        
        self.hitCount = self.hitCount + 1;          
        if target.party_Kind == EFightParty.Right then          
          newPos = target:RCtoSpot(2, 2, EFightSpot.Front, 100);
          --L10227 大岩怪備戰正面
          attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10227, 150, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 80);          
        else        
          newPos = target:RCtoSpot(1,2,EFightSpot.Front,100);
          --L10236 大岩怪備戰背面
          attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10236, 150, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 80);
        end
        return;
      end

      self.step = 8;      
    end
  elseif self.step == 8 then 
    if attack.lights[1].picId == 0 then
      self.isLightEnd = true;
      self.step = 9;
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


--岩怪 中
Rocky2 = InheritsFromBaseAttackSkill();

function Rocky2:InitExtraParameters()
  self.hitCount = 1;                   --重炮下擊次數,呼吸次數
end

function Rocky2:Update()  
  local newPos,newPos2,newPos3,newPos4;  
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local attack = FightField.attack[self.humIdx];
  if self.step == 1 then     
    me.roleController:SetAnimationForceId(ERolePose.Magic);   
    --召喚陣
    attack:SetLightWithOrder(6, EEffectLightDis.Ground,10165,100,1,10,10, EEffectLightTracer.Stand, me.nowPos.x+10, me.nowPos.y,15, true, 60);
    --召喚陣聚氣
    attack:SetLightWithOrder(7, EEffectLightDis.Sky,10170,150,1,9,9, EEffectLightTracer.Stand, me.nowPos.x+10, me.nowPos.y,20, true, 80);
    self.step = 2;              
  elseif self.step == 2 then     
    if target.party_Kind == EFightParty.Right then      
      newPos = target:RCtoSpot(2, target.row, EFightSpot.Front,100);
      --L10232 中岩怪出埸正面
      attack:SetLightWithOrder(1,EEffectLightDis.Sky, 10232, 100, 1, 9, 9, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 80);
      attack:SetLightWithOrder(9,EEffectLightDis.Ground, "MonsterShadow", 100, 1, 1, 1, EEffectLightTracer.Stand, newPos.x-21, newPos.y, 255, false, 17);      
    else    
      newPos = target:RCtoSpot(1, target.row, EFightSpot.Front, 100);
      --L10241 中岩怪出埸背面
      attack:SetLightWithOrder(1,EEffectLightDis.Sky, 10241, 100, 1, 9, 9, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 80);
      attack:SetLightWithOrder(9,EEffectLightDis.Ground, "MonsterShadow", 100, 1, 1, 1, EEffectLightTracer.Stand, newPos.x+26, newPos.y, 255, false, 41);
    end
    self.step = 3;
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
  elseif self.step == 3 then 
    if attack.lights[1].picId == 0 then   
      if target.party_Kind == EFightParty.Right then      
        newPos = target:RCtoSpot(2,target.row,EFightSpot.Front,100);
        --L10233 中岩怪備戰正面
        attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10233, 100, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 80);
      else      
        newPos = target:RCtoSpot(1,target.row,EFightSpot.Front,100);
        --L10242 中岩怪備戰背面
        attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10242, 100, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 80);
      end

      self.step = 4;
    end
  elseif self.step == 4 then 
    if attack.lights[1].picId == 0 then    
      --岩怪大力向下
      if target.party_Kind == EFightParty.Right then      
        newPos = target:RCtoSpot(2, target.row, EFightSpot.Front, 100);
        --L10234 中岩怪攻擊正面
        attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10234, 100, 1, 4, 4, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, true, 80);      
      else      
        newPos = target:RCtoSpot(1,target.row, EFightSpot.Front,100);
        --L10243 中岩怪攻擊背面
        attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10243, 100, 1, 4, 4, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, true, 80);
      end

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
    if attack.lights[1].nowPage == attack.lights[1].endPage then    
      me:PlaySound(target.colm, target.row, Attack_Start);  --擊地聲
      if target.party_Kind == EFightParty.Right then        
        newPos = target:RCtoSpot(2,target.row,EFightSpot.Front,100);
          --L10234 中岩怪攻擊正面
        attack.lights[1]:SetPage(4, 1);

          --加煙
        newPos=target:GetSpotOfRc(EFightSpot.Front, 120);
        newPos2=target:GetSpotOfRc(EFightSpot.Front, 120);
        newPos3=target:GetSpotOfRc(EFightSpot.Front, 120);
        newPos4=target:GetSpotOfRc(EFightSpot.Front, 120);
          --煙
        attack:SetLightWithOrder(2,EEffectLightDis.Sky,10016, 60,1,15, 15,EEffectLightTracer.Standani,newPos.x+47, newPos.y, 30, false, 93);
          --地裂
        attack:SetLightWithOrder(3,EEffectLightDis.Sky,10171,150, self.hitCount, self.hitCount+1,6, EEffectLightTracer.Stand, newPos2.x+53, newPos2.y-39,255, false, 172);
          --煙
        attack:SetLightWithOrder(4,EEffectLightDis.Sky,10016, 60,1,15, 15,EEffectLightTracer.StandAni,newPos3.x+3, newPos3.y+35, 30, false, 80);
          --地裂
        attack:SetLightWithOrder(5,EEffectLightDis.Sky,10171,150,self.hitCount,self.hitCount+1,6,EEffectLightTracer.Stand, newPos4.x+3, newPos4.y+21,255, false, 141);
      else
        newPos=target:RCtoSpot(1,target.row,EFightSpot.Front,100);
          --L10243 中岩怪攻擊背面
        attack.lights[1]:SetPage(4, 1);

        --加煙
        newPos=target:GetSpotOfRc(EFightSpot.Front, 120);
        newPos2=target:GetSpotOfRc(EFightSpot.Front, 120);
        newPos3=target:GetSpotOfRc(EFightSpot.Front, 120);
        newPos4=target:GetSpotOfRc(EFightSpot.Front, 120);
        --煙
        attack:SetLightWithOrder(2,EEffectLightDis.Body,10016, 60,1,15, 15,EEffectLightTracer.Standani,newPos.x+22, newPos.y, 30, false, 1);
        --地裂
        attack:SetLightWithOrder(3,EEffectLightDis.Ground,10171,150,self.hitCount,self.hitCount+1,6,EEffectLightTracer.Stand, newPos2.x+28, newPos2.y-39,255, false, 80);
        --煙
        attack:SetLightWithOrder(4,EEffectLightDis.Body,10016, 60,1,15, 15,EEffectLightTracer.StandAni,newPos3.x-62, newPos3.y-25, 30, false, 80);
        --地裂
        attack:SetLightWithOrder(5,EEffectLightDis.Ground,10171,150,self.hitCount,self.hitCount+1,6,EEffectLightTracer.Stand, newPos4.x-62, newPos4.y-39,255, false, 141);
      end

      for i=0, self.emyNum-1 do      
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        target.roleController:SetIsDead(true);
        if math.random(0, 1) == 1 then
          newPos = target:GetSpot(EFightSpot.Back, 60)
        else
          newPos = target:GetSpot(EFightSpot.Front, 60);
        end

        target:SetJump(newPos.x, newPos.y, true);
      end
              
      self.step = 6;
    end
  elseif self.step == 6 then 
    if attack.lights[1].nowPage == attack.lights[1].endPage then    
      --要下擊三下
      if self.hitCount < 3 then      
        --岩怪重力下打
        if target.party_Kind == EFightParty.Right then          
          newPos = target:RCtoSpot(2, target.row, EFightSpot.Front, 100);
          --L10234 中岩怪攻擊正面
          attack.lights[1]:SetPage(1, 4);        
        else        
          newPos = target:RCtoSpot(1, target.row, EFightSpot.Front, 100);
          --L10243 中岩怪攻擊背面
          attack.lights[1]:SetPage(1, 4);
        end
        self.hitCount = self.hitCount + 1;
        self.step = 5;
        return;
      end

      --被打的人走回原位
      for i=0, self.emyNum-1 do      
        target = FightField.fightHum[self.emyIdxAy[i]];
        target.roleController:SetIsDead(false);
        target.roleController:SetInBattle(false);
        target.roleController:SetIsMoving(true);

        newPos = target:RCtoSpot(target.colm, target.row);
        target:SetWalk( newPos.x, newPos.y, true);
        target:SetSpeed(0.24);
      end
      

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
      self.hitCount = 1;   --設定呼吸次數
      FightField.SetShake(false)
    end
  elseif self.step == 7 then     
    if attack.lights[1].nowPage == attack.lights[1].endPage then      
      --呼吸二次
      if self.hitCount < 3 then      
        self.hitCount = self.hitCount + 1;        
        if target.party_Kind == EFightParty.Right then            
          newPos = target:RCtoSpot(2, target.row, EFightSpot.Front, 100);
          --L10233 中岩怪備戰正面
          attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10233, 100, 1, 2, 2, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, true, 80);            
        else        
          newPos = target:RCtoSpot(1, target.row, EFightSpot.Front, 100);
          --L10242 中岩怪備戰背面
          attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10242, 100, 1, 2, 2, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, true, 80);
        end
        return;
      end
      
      self.interval = 0.4;
      self.step = 8;
    end

    for i=0, self.emyNum-1 do      
      target = FightField.fightHum[ self.emyIdxAy[i] ];
      if target.arrive and target.roleController.animationId ~= target.roleController:GetAnimationId(ERolePose.Prepare) then
        FightField.RestoreFightInfo(self.emyIdxAy[i])
      end      
    end
  elseif self.step == 8 then      
    if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 9;
    end
  end
end

--岩怪 小
Rocky3 = InheritsFromBaseAttackSkill();

function Rocky3:InitExtraParameters()
  self.hitCount = 1;                   --重炮下擊次數,呼吸次數
end

function Rocky3:Update()  
  local newPos,newPos2,newPos3,newPos4;  
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local attack = FightField.attack[self.humIdx];
  if self.step == 1 then     
    me.roleController:SetAnimationForceId(ERolePose.Magic);   
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);    
    --召喚陣
    attack:SetLightWithOrder(6, EEffectLightDis.Ground,10165,100,1,10,10, EEffectLightTracer.Stand, me.nowPos.x+10, me.nowPos.y,15, true, 60);
    --召喚陣聚氣
    attack:SetLightWithOrder(7, EEffectLightDis.Sky,10170,150,1,9,9, EEffectLightTracer.Stand, me.nowPos.x+10, me.nowPos.y,20, true, 80);
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
    if target.party_Kind == EFightParty.Right then      
      newPos = target:RCtoSpot(2, target.row, EFightSpot.Front,100);
      --L10232 中岩怪出埸正面
      attack:SetLightWithOrder(1,EEffectLightDis.Sky, 10229, 100, 1, 9, 9, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 41);
      attack:SetLightWithOrder(9,EEffectLightDis.Ground, "Shadow2", 100, 1, 1, 1, EEffectLightTracer.Stand, newPos.x-16, newPos.y +28, 255, false, 0);      
    else    
      newPos = target:RCtoSpot(1, target.row, EFightSpot.Front, 100);
      --L10241 中岩怪出埸背面
      attack:SetLightWithOrder(1,EEffectLightDis.Sky, 10238, 100, 1, 9, 9, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 48);
      attack:SetLightWithOrder(9,EEffectLightDis.Ground, "Shadow2", 100, 1, 1, 1, EEffectLightTracer.Stand, newPos.x+13, newPos.y +45, 255, false, 0);
    end
    self.step = 3;    
  elseif self.step == 3 then 
    if attack.lights[1].picId == 0 then   
      if target.party_Kind == EFightParty.Right then      
        newPos = target:RCtoSpot(2,target.row,EFightSpot.Front,100);
        --L10233 中岩怪備戰正面
        attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10230, 100, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 41);
      else      
        newPos = target:RCtoSpot(1,target.row,EFightSpot.Front,100);
        --L10242 中岩怪備戰背面
        attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10239, 100, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 48);
      end

      self.step = 4;
    end
  elseif self.step == 4 then 
    if attack.lights[1].picId == 0 then    
      --岩怪大力向下
      if target.party_Kind == EFightParty.Right then      
        newPos = target:RCtoSpot(2, target.row, EFightSpot.Front, 100);
        --L10234 中岩怪攻擊正面
        attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10231, 100, 1, 4, 4, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, true, 41);      
      else      
        newPos = target:RCtoSpot(1,target.row, EFightSpot.Front,100);
        --L10243 中岩怪攻擊背面
        attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10240, 100, 1, 4, 4, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, true, 48);
      end

      self.step = 5;
    end
  elseif self.step == 5 then 
    if attack.lights[1].nowPage == attack.lights[1].endPage then    
      me:PlaySound(target.colm, target.row, Attack_Start);  --擊地聲
      newPos = target:GetSpotOfRc(EFightSpot.Front, 120);
      newPos3 = target:GetSpotOfRc(EFightSpot.Front, 120);
      --煙
      attack:SetLightWithOrder(2, EEffectLightDis.Sky,10016, 60,1,15, 15, EEffectLightTracer.StandAni, newPos.x, newPos.y, 30, false, 78);
      --地裂
      attack:SetLightWithOrder(3, EEffectLightDis.Ground,10171,150,self.hitCount, self.hitCount+1,6, EEffectLightTracer.Stand, newPos3.x, newPos3.y,255, false, 106);

      --岩怪站起來
      if target.party_Kind == EFightParty.Right then      
        newPos = target:RCtoSpot(2, target.row, EFightSpot.Front,100);
        --L10231 小岩怪攻擊正面
        attack.lights[1]:SetPage(4, 1);
      else      
        newPos = target:RCtoSpot(1, target.row, EFightSpot.Front,100);
        --L10240 小岩怪攻擊背面
        attack.lights[1]:SetPage(4, 1);
      end

      for i=0, self.emyNum-1 do      
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        target.roleController:SetIsDead(true);
        if math.random(0,1)==1 then
          newPos = target:GetSpot( EFightSpot.Back, 60);
        else
          newPos = target:GetSpot( EFightSpot.Front, 60);
        end
        target:SetJump(newPos.x, newPos.y,true);
      end      
              
      self.step = 6;
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
    if attack.lights[1].nowPage == attack.lights[1].endPage then    
      --要下擊三下
      if self.hitCount < 3 then      
        --岩怪重力下打
        if target.party_Kind == EFightParty.Right then          
          newPos = target:RCtoSpot(2, target.row, EFightSpot.Front, 100);
          attack.lights[1]:SetPage(1, 4);      
        else        
          newPos = target:RCtoSpot(1, target.row, EFightSpot.Front, 100);
          attack.lights[1]:SetPage(1, 4);
        end
        self.hitCount = self.hitCount + 1;
        self.step = 5;
        return;
      end

      --被打的人走回原位
      for i=0, self.emyNum-1 do      
        target = FightField.fightHum[self.emyIdxAy[i]];
        target.roleController:SetIsDead(false);
        target.roleController:SetInBattle(false);
        target.roleController:SetIsMoving(true);

        newPos = target:RCtoSpot(target.colm, target.row);
        target:SetWalk( newPos.x, newPos.y, true);
        target:SetSpeed(0.24);
      end
      

      self.step = 7;
      self.hitCount = 1;   --設定呼吸次數
      FightField.SetShake(false)
    end
  elseif self.step == 7 then     
    if attack.lights[1].nowPage == attack.lights[1].endPage then      
      --呼吸二次
      if self.hitCount < 3 then      
        self.hitCount = self.hitCount + 1;        
        if target.party_Kind == EFightParty.Right then            
          newPos = target:RCtoSpot(2, target.row, EFightSpot.Front, 100);
          --L10233 中岩怪備戰正面
          attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10230, 150, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 41);            
        else        
          newPos = target:RCtoSpot(1, target.row, EFightSpot.Front, 100);
          --L10242 中岩怪備戰背面
          attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10239, 150, 1, 2, 2, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, true, 48);
        end
        return;
      end

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

    for i=0, self.emyNum-1 do      
      target = FightField.fightHum[ self.emyIdxAy[i] ];
      if target.arrive and target.roleController.animationId ~= target.roleController:GetAnimationId(ERolePose.Prepare) then
        FightField.RestoreFightInfo(self.emyIdxAy[i])
      end      
    end
  elseif self.step == 8 then
    self.isLightEnd = true;
    self.step = 9;
  end
end