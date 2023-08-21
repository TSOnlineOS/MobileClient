SwordSleeve = InheritsFromBaseAttackSkill();

function SwordSleeve:InitDrawBlack()
  self.needDrawBlack = true;   
end

function SwordSleeve:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me:PlaySound(target.colm, target.row, Attack_Start, 1);
    local aRi =  me.roleController:GetAnimationFrame(me.roleController:GetAnimationId(ERolePose.Archery));
    if aRi == 0 then  --NPC沒有設箭動作
      me.roleController:SetAnimationForceId(ERolePose.Magic);
    else
      me.roleController:SetAnimationForceId(ERolePose.Archery);
    end
    
    me.roleController:SetAnimationForceFrame(1);
    self.interval = 0.7;
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
    if self:CheckInterval() then 
      me:PlaySound(target.colm, target.row, Attack_Hit, 2);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      me.roleController:SetAnimationForceFrame(255);
      target.roleController:Hit();
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10870, 100, 1, 4, 4, EEffectLightTracer.StandAni, me.nowPos.x - 60, me.nowPos.y - 40, 30, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10871, 80 + math.random(0, 59), 1, 8, 8, EEffectLightTracer.StandAni, target.nowPos.x + 20 + math.random(0, 19), target.nowPos.y - math.random(0, 9), 30, false, 30);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Body, 10871, 80 + math.random(0, 39), 1, 8, 8, EEffectLightTracer.StandAni, target.nowPos.x + 30 + math.random(0, 19), target.nowPos.y - math.random(0, 9), 30, false, 45);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Body, 10871, 80 + math.random(0, 19), 1, 8, 8, EEffectLightTracer.StandAni, target.nowPos.x + 20 + math.random(0, 19), target.nowPos.y - math.random(0, 9), 30, false, 60);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10872, 80, 1, 4, 4, EEffectLightTracer.StandAni, me.nowPos.x + 25, me.nowPos.y, 30, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10873, 80 + math.random(0, 59), 1, 8, 8, EEffectLightTracer.StandAni, target.nowPos.x - 20 - math.random(0, 19), target.nowPos.y - math.random(0, 14), 30, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Body, 10873, 80 + math.random(0, 39), 1, 8, 8, EEffectLightTracer.StandAni, target.nowPos.x - 30 - math.random(0, 19), target.nowPos.y - math.random(0, 9), 30, false, 15);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Body, 10873, 80 + math.random(0, 19), 1, 8, 8, EEffectLightTracer.StandAni, target.nowPos.x - 20 - math.random(0, 19), target.nowPos.y - math.random(0, 14), 30, false, 30);
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
    if FightField.attack[self.humIdx].lights[4].picId == 0 then
      me.roleController:SetAnimationForceFrame(1);
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Body, 10874, 200, 5, 5, 6, EEffectLightTracer.Stand, target.nowPos.x + 20, target.nowPos.y, 255, false, 0);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Body, 10875, 200, 5, 5, 6, EEffectLightTracer.Stand, target.nowPos.x - 15, target.nowPos.y - 20, 255, false, 0);
      end

      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      self.interval = 0.8;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      FightField.SetShake(false);
      me:PlaySound(target.colm, target.row);
      self.isLightEnd = true;
      self.step = 5;
    end
  end
end