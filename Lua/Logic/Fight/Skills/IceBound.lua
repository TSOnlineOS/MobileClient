IceBound = InheritsFromBaseAttackSkill();

function IceBound:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground, 10070, 50, 1, 32, 32, EEffectLightTracer.StandAni, me.nowPos.x + 7, me.nowPos.y, 20, true, 50);
    self.interval = 1.2;
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
    self.step = self.step + 1;
  elseif self.step == 2 then
    if self:CheckInterval()then 
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10012, 50, 1, 13, 13, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 20, false, 80);
      self.step = self.step + 1;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].orderCount == 9 then
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10019, 60, 1, 15, 15, EEffectLightTracer.Stand, target.nowPos.x - 10, target.nowPos.y - 40, 40, false, 80);
      self.step = self.step + 1;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky2].orderCount == 14 then
      self.isLightEnd = true;
      self.step = self.step + 1;
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
  end
end

--專武技能
EW_IceBound = InheritsAttack(IceBound);

function EW_IceBound:InitDrawBlack()
  self.needDrawBlack = true;   
end

IceBound3 = InheritsFromBaseAttackSkill();

function IceBound3:InitExtraParameters()
  self.smoke = {};
  self.ice = {}
  self.isTurtle = false;

  local me = FightField.fightHum[self.humIdx];
  if me.kind ~= EHuman.Player and me.kind ~= EHuman.Players and me.npcId ~= nil then  --NPC 才需要判斷  
    if Between(me.npcId, 35054, 35056) then
      self.isTurtle = true;        
    end
  end
end

 function IceBound3:ExtraClose()
  if self.isTurtle then  
    local tempRole = FightField.GetRoleByNpcId(35054);              
    if tempRole ~= nil then
      tempRole.roleController:SetVisible(ERoleVisible.Visible);
    end
    tempRole = FightField.GetRoleByNpcId(35055);              
    if tempRole ~= nil then
      tempRole.roleController:SetVisible(ERoleVisible.Visible);
    end
    tempRole = FightField.GetRoleByNpcId(35056);              
    if tempRole ~= nil then
      tempRole.roleController:SetVisible(ERoleVisible.Visible);
    end
  end

  ClearLightTable(self.smoke);
  ClearLightTable(self.ice)  
end

function IceBound3:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.isTurtle then     
    self:UpdateTiger();
    return;      
  end

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground, 10070, 50, 1, 32, 32, EEffectLightTracer.StandAni, me.nowPos.x + 7, me.nowPos.y, 20, true, 50);
    self.interval = 1.2;
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
      for i = 0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];        
        self.ice[i] = EffectLight.New(10012, 50, 1, 13, 13, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 20, false, 80);
        self.ice[i]:SetTimeScale(FightField.timeScale);  
        self.ice[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      end
     self.step = 3;
    end
  elseif self.step == 3 then 
    if self.ice[0].orderCount == 9 then
      for i = 0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];        
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);
        self.smoke[i] = EffectLight.New(10019, 50, 1, 15, 15, EEffectLightTracer.Stand, target.nowPos.x - 10, target.nowPos.y - 40, 40, false, 80);
        self.smoke[i]:SetTimeScale(FightField.timeScale);  
        self.smoke[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      end
      self.step = 4;
    end
  elseif self.step == 4 then
    if self.smoke[0].orderCount == 14 then
      self.isLightEnd = true;
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
  end
end

function IceBound3:UpdateTiger()  
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  local tempRole;
  if self.step == 1 then            
    if self.isTurtle then       
      if me.npcId == 35055 then    
        tempRole = FightField.GetRoleByNpcId(35056);              
        if tempRole ~= nil then
          tempRole.roleController:SetVisible(ERoleVisible.Hide);
        end         
      elseif me.npcId == 35056 then 
        tempRole = FightField.GetRoleByNpcId(35055);              
        if tempRole ~= nil then
          tempRole.roleController:SetVisible(ERoleVisible.Hide);
        end            
      end
      tempRole = FightField.GetRoleByNpcId(35054);              
      if tempRole ~= nil then
          tempRole.roleController:SetVisible(ERoleVisible.Hide);
      end        
      me.roleController:SetAnimationForceId(ERolePose.Special);
    end
    
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10070, 50, 1, 32, 32, EEffectLightTracer.StandAni, me.nowPos.x + 7, me.nowPos.y, 20, true, 50);
    self.interval = 1.2;
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
      for i = 0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];        
        self.ice[i] = EffectLight.New(10012, 50, 1, 13, 13, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 20, false, 80);
        self.ice[i]:SetTimeScale(FightField.timeScale);  
        self.ice[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      end
     self.step = 3;
    end
  elseif self.step == 3 then 
    if self.ice[0].orderCount == 9 then
      for i = 0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];        
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);
        self.smoke[i] = EffectLight.New(10019, 50, 1, 15, 15, EEffectLightTracer.Stand, target.nowPos.x - 10, target.nowPos.y - 40, 40, false, 80);
        self.smoke[i]:SetTimeScale(FightField.timeScale);  
        self.smoke[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      end
      self.step = 4;
    end
  elseif self.step == 4 then
    if self.smoke[0].orderCount == 14 then
      self.isLightEnd = true;
      self.step = 5;
    end
  end
end

IceBoundMe = InheritsFromBaseStatus()

function IceBoundMe:ExtraClose()
  FightField.fightHum[self.humIdx].roleController:SetAnimationForceId(ERolePose.None);
end

function IceBoundMe:Update()
  if self.step == 1 then
    local me = FightField.fightHum[self.humIdx];
    local posX = FightField.chip[me.colm][me.row].x;
    local posY = FightField.chip[me.colm][me.row].y;
    me.status[self.statusKind]:SetLight(EEffectLightKind.Body1, 10012, 50, 13, 13, 13, EEffectLightTracer.Stand, posX, posY, 20, false, 80);    
    me.roleController:SetAnimationForceId(ERolePose.Hit);
    self.step = 2;
  end
end
