TurtleDis6Status = InheritsFromBaseAttackSkill();

function TurtleDis6Status:InitExtraParameters()
  self.isTurtle = false;

  local me = FightField.fightHum[self.humIdx];
  if me.kind ~= EHuman.Player and me.kind ~= EHuman.Players and me.npcId ~= nil then  --NPC 才需要判斷  
    if Between(me.npcId, 35032, 35034) or Between(me.npcId, 35054, 35056) then  --玄武,玄武左右手        
      self.isTurtle = true;        
    end
  end
end

function TurtleDis6Status:ExtraClose()
  local me = FightField.fightHum[self.humIdx];
  if self.isTurtle then    
    local id = nil;
    if Between(me.npcId, 35032, 35034) then 
      id = {35032, 35033, 35034};
    elseif Between(me.npcId, 35054, 35056) then 
      id = {35054, 35055, 35056};
    end

    for k, v in pairs(id)do 
      FightField.SetRoleVisibleByID(v, ERoleVisible.Visible); 
    end
  end
end

function TurtleDis6Status:Free()
  FightField.RestoreFightInfo(self.humIdx);            --還原資訊

  for k, v in pairs(self.emyIdxAy) do
    FightField.RestoreFightInfo(v);
  end
end

function TurtleDis6Status:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then    
    me.roleController:SetAnimationForceId(ERolePose.Special);    

    if self.isTurtle then 
      local func = nil;
      if Between(me.id, 35054, 35056) then     
        func = function() self:SetTigerHide() end 
      else
        func = function() SetTutrleHandsVisible(ERoleVisible.Hide); end
      end
      func();
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
      --local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then 
    if me.roleController.animationFrame == 1 then     
      for i = 0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];     
        FightField.attack[self.humIdx]:SetLightWithOrder(1 + i, EEffectLightDis.Body, 10094,80,1,19,19, EEffectLightTracer.StandAni, target.nowPos.x,target.nowPos.y,30, true, 60);
      end
     self.step = 3;
    end
  elseif self.step == 3 then 
    if self.emyNum == 0 then
      self.step = 4;        
      return;
    end

    if FightField.attack[self.humIdx].lights[1].picId == 0 then
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
        --local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  elseif self.step == 4 then 
     self.isLightEnd = true;
     self.step = 5;
  end
end

function TurtleDis6Status:SetTigerHide()
  local me = FightField.fightHum[self.humIdx];
  local id = {35054, 35055, 35056};
  table.RemoveByValue(id, me.npcId);
  for k, v in pairs(id)do
    FightField.SetRoleVisibleByID(v, ERoleVisible.Hide);
  end
end