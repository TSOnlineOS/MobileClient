Ambush = InheritsFromBaseAttackSkill();

function Ambush:InitDrawBlack()
  self.needDrawBlack = true;     
end

function Ambush:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 20048, 50, 1, 20, 20, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 80);
    self.interval = 1;
  
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
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
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
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
      me:PlaySound(target.colm, target.row, Attack_Start, 1);
      local fieldPos = Vector2.New(FightField.skillOffset.x, FightField.skillOffset.y);
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 20055, 80, 1, 16, 16, EEffectLightTracer.StandAni, fieldPos.x + 230, fieldPos.y + 200, 20, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 20050, 90, 1, 13, 13, EEffectLightTracer.StandAni, fieldPos.x + 225, fieldPos.y + 200, 20, true, 70);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 20055, 80, 1, 16, 16, EEffectLightTracer.StandAni, fieldPos.x + 600, fieldPos.y + 300, 20, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 20050, 90, 1, 13, 13, EEffectLightTracer.StandAni, fieldPos.x + 595, fieldPos.y + 300, 20, true, 70);
      end
      self.step = 3;
      --3----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        DemoCode.SetColorNum(10);
        local area =  DemoCode.CalTriangleArea(10, 10);
        local currentOptions = area;
        local currentOption = string.Get(80098);
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
      FightField.isShake = true;
      local fieldPos = Vector2.New(FightField.skillOffset.x, FightField.skillOffset.y);
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 20054, 130, 1, 8, 8, EEffectLightTracer.StandAni, fieldPos.x + 230, fieldPos.y + 140, 20, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 20057, 140, 1, 10, 10, EEffectLightTracer.StandAni, fieldPos.x + 230, fieldPos.y + 200, 20, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Ground, 20049, 130, 1, 10, 10, EEffectLightTracer.Stand, fieldPos.x + 270, fieldPos.y + 370, 255, false, 0);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 20054, 130, 1, 8, 8, EEffectLightTracer.StandAni, fieldPos.x + 600, fieldPos.y + 240, 20, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 20057, 140, 1, 10, 10, EEffectLightTracer.StandAni, fieldPos.x + 600, fieldPos.y + 300, 20, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Ground, 20049, 130, 1, 10, 10, EEffectLightTracer.Stand, fieldPos.x + 550, fieldPos.y + 500, 255, false, 0);
      end
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[2].picId == 0 then
      me:PlaySound(target.colm, target.row, Attack_Start, 2);
      local fieldPos = Vector2.New(FightField.skillOffset.x, FightField.skillOffset.y);
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 20051, 50, 1, 15, 15, EEffectLightTracer.StandAni, fieldPos.x + 250, fieldPos.y + 450, 20, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 20056, 90, 1, 12, 12, EEffectLightTracer.StandAni, fieldPos.x + 280, fieldPos.y + 320, 20, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 20052, 50, 1, 13, 13, EEffectLightTracer.Line, fieldPos.x + 240, fieldPos.y + 320, 255, true, 0, fieldPos.x, fieldPos.y + 300, 0.1);
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 20052, 50, 1, 13, 13, EEffectLightTracer.Line, fieldPos.x + 140, fieldPos.y + 270, 255, true, 0, fieldPos.x, fieldPos.y + 50, 0.14);
        FightField.attack[self.humIdx]:SetLightWithOrder(8, EEffectLightDis.Sky, 20052, 50, 1, 13, 13, EEffectLightTracer.Line, fieldPos.x + 300, fieldPos.y + 250, 255, true, 0, fieldPos.x + 220, fieldPos.y, 0.11);
        FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Sky, 20052, 50, 1, 13, 13, EEffectLightTracer.Line, fieldPos.x + 320, fieldPos.y + 270, 255, true, 0, fieldPos.x + 400, fieldPos.y, 0.15);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 20051, 50, 1, 15, 15, EEffectLightTracer.StandAni, fieldPos.x + 520, fieldPos.y + 550, 20, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 20056, 90, 1, 12, 12, EEffectLightTracer.StandAni, fieldPos.x + 540, fieldPos.y + 470, 20, true, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 20053, 50, 1, 13, 13, EEffectLightTracer.Line, fieldPos.x + 450, fieldPos.y + 400, 255, true, 0, fieldPos.x + 430, fieldPos.y + 600, 0.1);
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 20053, 50, 1, 13, 13, EEffectLightTracer.Line, fieldPos.x + 500, fieldPos.y + 430, 255, true, 0, fieldPos.x + 700, fieldPos.y + 600, 0.14);
        FightField.attack[self.humIdx]:SetLightWithOrder(8, EEffectLightDis.Sky, 20053, 50, 1, 13, 13, EEffectLightTracer.Line, fieldPos.x + 670, fieldPos.y + 430, 255, true, 0, fieldPos.x + 800, fieldPos.y + 600, 0.11);
        FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Sky, 20053, 50, 1, 13, 13, EEffectLightTracer.Line, fieldPos.x + 570, fieldPos.y + 330, 255, true, 0, fieldPos.x + 800, fieldPos.y + 400, 0.15);
      end
      for k, v in pairs(self.emyIdxAy) do
        target = FightField.fightHum[v];
        target.roleController:SetAnimationForceId(ERolePose.Hit);
      end
      self.interval = 1;
      self.step = 5;
    end
  elseif self.step == 5 then 
    if self:CheckInterval() then       
      for k, v in pairs(self.emyIdxAy) do
        target = FightField.fightHum[v];
        me:PlayEffect(target.colm, target.row, ERolePose.Hit)
      end      
      self.interval = 1;
      self.step = 6;
    end
  elseif self.step == 6 then
    if self:CheckInterval() then       
      FightField.SetShake(false);
      self.isLightEnd =true;
      self.step = 7;
    end
  end
end