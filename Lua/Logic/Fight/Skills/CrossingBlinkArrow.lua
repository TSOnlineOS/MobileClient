CrossingBlinkArrow = InheritsFromBaseAttackSkill();

function CrossingBlinkArrow:InitExtraParameters()
  --0 68 255 255(0, 68, 235, 255)
  --(135, 206, 235, 255);
  self.effectColor = LuaHelper.GetColor(135, 206, 235, 255);
end

function CrossingBlinkArrow:InitDrawBlack()
  self.needDrawBlack = true;   
end

function CrossingBlinkArrow:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, true);
    me:PlaySound(target.colm, target.row);

    local aRi =  me.roleController:GetAnimationFrame(me.roleController:GetAnimationId(ERolePose.Archery));
    if aRi == 0 then  --NPC沒有設箭動作
      me.roleController:MagicAttack();
    else
      me.roleController:RangeAttack();
    end
    me.roleController:SetAnimationForceFrame(1);
    self.interval = 0.7;
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
      me:PlaySound(target.colm, target.row, Attack_Hit, 2);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      me.roleController:SetAnimationForceFrame(255);
      target.roleController:Hit();
      
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10318, 100, 1, 4, 4, EEffectLightTracer.StandAni, me.nowPos.x - 60, me.nowPos.y - 40, 30, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10325, 79 + math.random(60), 1, 8, 8, EEffectLightTracer.StandAni, target.nowPos.x + math.random(20) + 19, target.nowPos.y - math.random(10) + 1, 30, false, 30);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Body, 10325, 79 + math.random(40), 1, 8, 8, EEffectLightTracer.StandAni, target.nowPos.x + math.random(30) + 19, target.nowPos.y - math.random(10) + 1, 30, false, 45);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Body, 10325, 79 + math.random(20), 1, 8, 8, EEffectLightTracer.StandAni, target.nowPos.x + math.random(20) + 19, target.nowPos.y - math.random(10) + 1, 30, false, 60);
        self:SetEffectChangeColor(1, 5);
        self:SetEffectChangeColor(2, 5);
        self:SetEffectChangeColor(3, 5);
        self:SetEffectChangeColor(4, 5);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10318, 100, 1, 4, 4, EEffectLightTracer.StandAni, me.nowPos.x + 25, me.nowPos.y, 30, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10325, 79 + math.random(60), 1, 8, 8, EEffectLightTracer.StandAni, target.nowPos.x - math.random(20) - 19, target.nowPos.y - math.random(15) + 1, 30, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Body, 10325, 79 + math.random(40), 1, 8, 8, EEffectLightTracer.StandAni, target.nowPos.x - math.random(20) - 29, target.nowPos.y - math.random(10) + 1, 30, false, 15);
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Body, 10325, 79 + math.random(20), 1, 8, 8, EEffectLightTracer.StandAni, target.nowPos.x - math.random(20) - 19, target.nowPos.y - math.random(15) + 1, 30, false, 30);
        self:SetEffectChangeColor(1, 5);
        self:SetEffectChangeColor(2, 5);
        self:SetEffectChangeColor(3, 5);
        self:SetEffectChangeColor(4, 5);
      end

      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[4].picId == 0 then
       me.roleController:SetAnimationForceFrame(1);

      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Body, 10335, 200, 5, 5, 6, EEffectLightTracer.Stand, target.nowPos.x + 20, target.nowPos.y, 30, false, 0);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Body, 10336, 200, 5, 5, 6, EEffectLightTracer.Stand, target.nowPos.x - 15, target.nowPos.y - 20, 30, false, 0);
      end

      self.interval = 0.8;
      self.step = 4;
    end
  elseif self.step == 4 then
    if self:CheckInterval() then 
      me.roleController:SetAnimationForceFrame(255);
      self.isLightEnd = true;
      self.step = 5;
    end
  end
end

function CrossingBlinkArrow:SetEffectChangeColor(effectIdx, addColor)
  if self.showKind == ESkill_Kind.CrossingSongArrow then
    FightField.attack[self.humIdx].lights[effectIdx]:SetColor(self.effectColor);
    FightField.attack[self.humIdx].lights[effectIdx]:SetAddColor(addColor);
    FightField.attack[self.humIdx].lights[effectIdx]:SetColorMix(true);
  end
end