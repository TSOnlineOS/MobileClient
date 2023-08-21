ShakeMallet = InheritsFromBaseAttackSkill();

function ShakeMallet:InitExtraParameters()
  self.cnt = 0;
  self.finalGroupEffect = 0;
end

function ShakeMallet:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10080, 50, 1, 21, 21, EEffectLightTracer.StandAni, newPos.x + 6, newPos.y, 20, true, 80);
    self.interval = 0.8;
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
  elseif Contains(self.step, 2, 4, 6) then
    if self:CheckInterval() then
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]]
        --一人要5組特效編號 2,3,4,5,6 ; 起始2 -> 5N+ * (第幾個)+1(起始)
        if target.party_Kind == EFightParty.Left then
          FightField.attack[self.humIdx]:SetLightWithOrder((5*i)+1+1, EEffectLightDis.Sky, 10378, 20, 6, 11, 11, EEffectLightTracer.StandAni, target.nowPos.x + 45, target.nowPos.y - 30, 255, false, 0);
          FightField.attack[self.humIdx]:SetLightWithOrder((5*i)+2+1, EEffectLightDis.Sky, 10382, 20, 6, 11, 11, EEffectLightTracer.StandAni, target.nowPos.x + 45, target.nowPos.y - 30, 30, false, 0);
        else
          FightField.attack[self.humIdx]:SetLightWithOrder((5*i)+1+1, EEffectLightDis.Sky, 10379, 20, 6, 11, 11, EEffectLightTracer.StandAni, target.nowPos.x - 45, target.nowPos.y - 30, 255, false, 0);
          FightField.attack[self.humIdx]:SetLightWithOrder((5*i)+2+1, EEffectLightDis.Sky, 10383, 20, 6, 11, 11, EEffectLightTracer.StandAni, target.nowPos.x - 45, target.nowPos.y - 30, 30, false, 0);
        end
        self.finalGroupEffect = (5*i)+1+1;
      end

      self.step = self.step + 1;
    end
  elseif Contains(self.step, 3, 5, 7) then
    if FightField.attack[self.humIdx].lights[self.finalGroupEffect].picId == 0 then
      for i = 0, self.emyNum - 1 do
        target = FightField.fightHum[self.emyIdxAy[i]]
        target.roleController:Hit();
        me:PlayEffect(target.colm, target.row, ERolePose.hit, 3);

        FightField.attack[self.humIdx]:SetLightWithOrder((5*i)+3+1, EEffectLightDis.Sky, 10000, 40, 1, 4, 4, EEffectLightTracer.StandAni,
                target.nowPos.x + math.random(20) - 1, target.nowPos.y - math.random(30) + 1, 255, false, 45);
        FightField.attack[self.humIdx]:SetLightWithOrder((5*i)+4+1, EEffectLightDis.Sky, 10010, 40, 1, 4, 4, EEffectLightTracer.StandAni,
                target.nowPos.x - math.random(20) + 1, target.nowPos.y, 255, false, 45);

        if target.party_Kind == EFightParty.Left then
          FightField.attack[self.humIdx]:SetLightWithOrder((5*i)+1+1, EEffectLightDis.Sky, 10378, 20, 11, 1, 11, EEffectLightTracer.StandAni, target.nowPos.x + 45, target.nowPos.y - 30, 255, false, 0);
          FightField.attack[self.humIdx]:SetLightWithOrder((5*i)+2+1, EEffectLightDis.Sky, 10382, 20, 11, 1, 11, EEffectLightTracer.StandAni, target.nowPos.x + 45, target.nowPos.y - 30, 30, false, 0);
        else
          FightField.attack[self.humIdx]:SetLightWithOrder((5*i)+1+1, EEffectLightDis.Sky, 10379, 20, 11, 1, 11, EEffectLightTracer.StandAni, target.nowPos.x - 45, target.nowPos.y - 30, 255, false, 0);
          FightField.attack[self.humIdx]:SetLightWithOrder((5*i)+2+1, EEffectLightDis.Sky, 10383, 20, 11, 1, 11, EEffectLightTracer.StandAni, target.nowPos.x - 45, target.nowPos.y - 30, 30, false, 0);
        end

        if self.step == 7 then
          FightField.attack[self.humIdx]:SetLightWithOrder((5*i)+5+1, EEffectLightDis.Sky, 10249, 150, 1, 6, 6, EEffectLightTracer.StandAni,
                  target.nowPos.x + 5, target.nowPos.y - target.roleController.height, 30, true, 0);
        end

        self.cnt = self.cnt + 1;
      end

      if self.cnt == self.emyNum then
        self.cnt = 0;
        self.interval = 0.4;
        self.step = self.step + 1;
      end
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
    if self:CheckInterval() then
      self.isLightEnd = true
      self.step = 9;
    end
  end
end