Rabid = InheritsFromBaseAttackSkill();

function Rabid:InitExtraParameters()
  self.cnt = 0;
  self.ranEmyIdx = {};  --每道光影亂數攻擊目標
  self.ranPos = {} ;    --每道光影終點座標
  self.hitcntAy = {};
  for i = 0, self.emyNum - 1 do 
    self.hitcntAy[i] = 0;
  end
end


function Rabid:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10078, 50, 1, 20, 20, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 80);
    self:RanAttack();

    self.interval = 0.8;
    self.cnt = 2;
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
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLightWithOrder(self.cnt, EEffectLightDis.Sky, 10114, 151, 1, 1, 1, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 30, true, 100, 
                                                         self.ranPos[self.cnt].x, self.ranPos[self.cnt].y, 0.76);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(self.cnt, EEffectLightDis.Sky, 10113, 151, 1, 1, 1, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 30, true, 100, 
                                                         self.ranPos[self.cnt].x, self.ranPos[self.cnt].y, 0.76);
      end

      FightField.attack[self.humIdx].lights[self.cnt]:SetAlpha(30, -2, 15);
      FightField.attack[self.humIdx].lights[self.cnt]:SetResidual(3, 50, -1);
      self.interval = 0.1;
      self.cnt = self.cnt + 1;

      if self.cnt == 8 then
        self.cnt = 2;
        self.step = 3;
      end
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[self.cnt].isArrive then
      target = FightField.fightHum[self.ranEmyIdx[self.cnt]];
      FightField.attack[self.humIdx]:SetLightWithOrder(self.cnt, EEffectLightDis.Sky, 10133, 30, 1, 16, 16, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 15, true, 50);

      for i = 0, self.emyNum - 1 do
        if self.ranEmyIdx[self.cnt] == self.emyIdxAy[i] then
          me:PlayEffect(target.colm, target.row, ERolePose.Hit, self.hitcntAy[i]);
        end
      end

      me:PlaySound(target.colm, target.row);
      self.cnt = self.cnt + 1;

      if self.cnt == 8 then
        self.cnt = 2;
        self.step = 4;
      end
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[self.cnt].picId == 0 then
      self.isLightEnd = true;
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
  end
end

function Rabid:RanAttack()
  local target;
  local rand, choose, average;

  for i = 2, 7 do
    if i - 2 < self.emyNum then
      self.ranEmyIdx[i] = self.emyIdxAy[i - 2];
      target = FightField.fightHum[self.emyIdxAy[i - 2]];
      self.hitcntAy[i - 2] = self.hitcntAy[i - 2] + 1;
    else
      rand = math.random(100) - 1;                --0~99
      average = math.round(100/ self.emyNum);     --總數大於100時會有問題
      choose = math.floor(rand / average);
      if choose > self.emyNum - 1 then
        choose = self.emyNum - 1;
      end

      self.ranEmyIdx[i] = self.emyIdxAy[choose];
      target = FightField.fightHum[self.emyIdxAy[choose]];
      self.hitcntAy[choose] = self.hitcntAy[choose] + 1;
    end
    self.ranPos[i] = {};
    if target.party_Kind == EFightParty.Left then
      self.ranPos[i].x = target.nowPos.x - 100;
      self.ranPos[i].y = target.nowPos.y - 100 + (math.random(100) - 51);
    else
      self.ranPos[i].x = target.nowPos.x + 100;
      self.ranPos[i].y = target.nowPos.y + (math.random(150) - 51);
    end
  end
end