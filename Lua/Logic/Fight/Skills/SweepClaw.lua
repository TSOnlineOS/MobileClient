SweepClaw = InheritsFromBaseAttackSkill();

function SweepClaw:InitExtraParameters()
  self.fire = false;                  --是否打出火光
  self.windLight = {};
  self.smokeLight = {};
  self.fallDown  = {};
end

function SweepClaw:ExtraClose()
  ClearLightTable(self.windLight);
  ClearLightTable(self.smokeLight);
end

function SweepClaw:GoPlant()
  local target;
  local x, y, count;

  count = 0;
  for i=0, self.emyNum-1 do  
    target = FightField.fightHum[ self.emyIdxAy[i] ];
    --有狀態或沒血的不做
    if target:IsInSealStatus() or (target.roleController:GetAttribute(EAttribute.Hp) ==0) then
      self.fallDown[i] = true;
      count = count + 1;
    else
      if self.windLight[i] ~= nil and self.windLight[i].picId ==0 then    
        if self.fallDown[i] == false or self.fallDown[i] == nil then            
          target:SetOverturn(true);
          self.fallDown[i] = true;            
          x = self.windLight[i].showPos.x;
          y = self.windLight[i].showPos.y;    
          self.windLight[i]:Stop();
          self.windLight[i] = EffectLight.New(10017, 50,1,6,6, EEffectLightTracer.Line, x, y, 20, true, 15, x, y+200, 0.72);
          self.windLight[i]:SetTimeScale(FightField.timeScale);   
          self.windLight[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER); 
        else        
          count = count + 1;
        end
      end
    end
    if self.windLight[i] ~= nil then 
      target.fantasY = self.windLight[i].showPos.y;
    end
  end

  if count >= self.emyNum then
    return true;
  else
    return false;
  end
end

function SweepClaw:Update()
  local target;
  local count;
  local me = FightField.fightHum[self.humIdx];

  if self.step == 1 then   
    me.roleController:SetAnimationForceId(ERolePose.Special);
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
      --local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then 
    if me.roleController.animationFrame == 1 then      
      for i=0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        if not target:IsInSealStatus() and (target.roleController:GetAttribute(EAttribute.Hp)~=0) then          
          target.roleController:SetInBattle(false);
          target.isPlant = true;
          self.windLight[i] = EffectLight.New(10017, 50,1,6,6, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y,20, true, 15, target.nowPos.x, target.nowPos.y-200, 0.36);
          self.windLight[i]:SetTimeScale(FightField.timeScale);   
          self.windLight[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
        end

        me:PlaySound(target.colm, target.row, Attack_Start);   
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
        --local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  elseif self.step == 3 then 
    if self:GoPlant() then      
      for i=0, self.emyNum-1 do        
        target = FightField.fightHum[self.emyIdxAy[i]];
        target:PlaySound();
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);
        if not target:IsInSealStatus() and (target.roleController:GetAttribute(EAttribute.Hp)~=0) then   
          --煙
          if self.windLight[i] ~= nil then 
            self.windLight[i]:Stop();
          end
          self.smokeLight[i] = EffectLight.New(10016, 30, 1,15, 15, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y + 60, 30, false, 25);
          self.smokeLight[i]:SetTimeScale(FightField.timeScale);   
          self.smokeLight[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);          
        end
      end
      self.step = 4;
      FightField.SetShake(true);
    end
  elseif self.step == 4 then 
    count = 0;
    for i=0, self.emyNum-1 do        
      target = FightField.fightHum[self.emyIdxAy[i]];
      if not target:IsInSealStatus() and (target.roleController:GetAttribute(EAttribute.Hp)~=0) then    
        if self.smokeLight[i].orderCount >= 3 then          
          FightField.SetShake(false);
          self.step = 5;
          return;
        end        
      else           
        count = count + 1;                        
      end

      if count >= self.emyNum then        
          self.step = 5;
          return;
      end
    end
  elseif self.step == 5 then     
    count = 0;
    for i=0, self.emyNum-1 do        
      target = FightField.fightHum[self.emyIdxAy[i]];
      if not target:IsInSealStatus() and (target.roleController:GetAttribute(EAttribute.Hp)~=0) then                           
        if self.smokeLight[i].orderCount >= 14 then          
          self.isLightEnd = true;
          self.step = 6;
        end        
      else          
        count = count + 1;                        
      end

      if count >= self.emyNum then        
        self.isLightEnd = true;
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
          --local currentOption = string.Get(10055);
        end
        --5-----------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
          --
        end
        --6-----------------------------------------------------
      end
    end
  end
end