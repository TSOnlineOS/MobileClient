RedlotusFire = InheritsFromBaseAttackSkill();

function RedlotusFire:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10078, 50, 1, 20, 20, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 80);
    self.interval = 0.5;
    self.step = 2;
  elseif self.step == 2 then
    if self:CheckInterval() then 
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10367, 90, 1, 9, 9, EEffectLightTracer.StandAni, me.nowPos.x - 50, me.nowPos.y + 120, 35, true, 0);
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
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[2].picId == 0 then
      --火球
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10368, 90, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y + 50, 35, true, 0, target.nowPos.x, target.nowPos.y + 30, 0.5);
      --尾巴
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Body, 10133, 30, 1, 16, 16, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y + 50, 35, true, 0, target.nowPos.x, target.nowPos.y + 30, 0.45);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Body, 10133, 30, 5, 16, 16, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y + 50, 20, true, 0, target.nowPos.x, target.nowPos.y + 30, 0.40);
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Body, 10133, 30, 10, 16, 16, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y + 50, 35, true, 0, target.nowPos.x, target.nowPos.y + 30, 0.35);
      FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Body, 10133, 30, 15, 16, 16, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y + 50, 20, true, 0, target.nowPos.x, target.nowPos.y + 30, 0.30);
      FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Body, 10133, 30, 5, 16, 16, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y + 50, 35, true, 0, target.nowPos.x, target.nowPos.y + 30, 0.25);
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[2].isArrive then
      target.roleController:Hit();
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);      
      
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10104, 50, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x + math.random(30) - 1, target.nowPos.y - math.random(30) + 1, 30, true, 60);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10104, 50, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x - math.random(30) + 1, target.nowPos.y + math.random(30) - 1, 30, true, 60);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10104, 60, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x + math.random(30) - 1, target.nowPos.y - math.random(30) + 1, 30, true, 60);
      self.interval = 0.9;
      self.step = 5;
    end
  elseif self.step == 5 then
    if self:CheckInterval() then 
      self.isLightEnd = true
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
  end
end

FireBlast = InheritsFromBaseAttackSkill();

function FireBlast:InitExtraParameters()
  self.fireData = {};
end

function FireBlast:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    self.interval = 0.5;
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
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10367, 90, 1, 9, 9, EEffectLightTracer.StandAni, me.nowPos.x - 50, me.nowPos.y + 120, 35, true, 0);
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[2].picId == 0 then
      me:PlaySound(target.colm, target.row);
      local i = 0;
      for k, v in pairs(self.emyIdxAy) do
        target = FightField.fightHum[v];
        --火球
        FightField.attack[self.humIdx]:SetLightWithOrder(2 + i * 6, EEffectLightDis.Body, 10368, 90, 1, 10, 10, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y + 50, 35, true, 0, target.nowPos.x, target.nowPos.y + 30, 0.5);
        --尾巴
        FightField.attack[self.humIdx]:SetLightWithOrder(3 + i * 6, EEffectLightDis.Body, 10133, 30, 1, 16, 16, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y + 50, 35, true, 0, target.nowPos.x, target.nowPos.y + 30, 0.45);
        FightField.attack[self.humIdx]:SetLightWithOrder(4 + i * 6, EEffectLightDis.Body, 10133, 30, 5, 16, 16, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y + 50, 20, true, 0, target.nowPos.x, target.nowPos.y + 30, 0.40);
        FightField.attack[self.humIdx]:SetLightWithOrder(5 + i * 6, EEffectLightDis.Body, 10133, 30, 10, 16, 16, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y + 50, 35, true, 0, target.nowPos.x, target.nowPos.y + 30, 0.35);
        FightField.attack[self.humIdx]:SetLightWithOrder(6 + i * 6, EEffectLightDis.Body, 10133, 30, 15, 16, 16, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y + 50, 20, true, 0, target.nowPos.x, target.nowPos.y + 30, 0.30);
        FightField.attack[self.humIdx]:SetLightWithOrder(7 + i * 6, EEffectLightDis.Body, 10133, 30, 5, 16, 16, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y + 50, 35, true, 0, target.nowPos.x, target.nowPos.y + 30, 0.25);
        local data = {};
        data.light = 2 + i * 6;
        data.fightRole = target;
        table.insert(self.fireData,  data);
        i = i + 1;                
      end
      self.step = 4;
    end
  elseif self.step == 4 then
    for k, v in pairs(self.fireData)do 
      if FightField.attack[self.humIdx].lights[v.light].isArrive then
        v.fightRole.roleController:Hit();
        me:PlayEffect(v.fightRole.colm, v.fightRole.row, ERolePose.Hit);      
        
        FightField.attack[self.humIdx]:SetLightWithOrder(v.light, EEffectLightDis.Sky, 10104, 50, 1, 10, 10, EEffectLightTracer.StandAni, v.fightRole.nowPos.x + math.random(30) - 1, v.fightRole.nowPos.y - math.random(30) + 1, 30, true, 60);
        FightField.attack[self.humIdx]:SetLightWithOrder(v.light, EEffectLightDis.Sky, 10104, 50, 1, 10, 10, EEffectLightTracer.StandAni, v.fightRole.nowPos.x - math.random(30) + 1, v.fightRole.nowPos.y + math.random(30) - 1, 30, true, 60);
        FightField.attack[self.humIdx]:SetLightWithOrder(v.light, EEffectLightDis.Sky, 10104, 60, 1, 10, 10, EEffectLightTracer.StandAni, v.fightRole.nowPos.x + math.random(30) - 1, v.fightRole.nowPos.y - math.random(30) + 1, 30, true, 60);
        table.remove( self.fireData,  k);
        break;
      end
    end

    if table.Count(self.fireData) == 0 then 
        self.interval = 0.9;
        self.step = 5;    
    end    
  elseif self.step == 5 then
    if self:CheckInterval() then 
      self.isLightEnd = true
      self.step = 6;
    end
  end
end