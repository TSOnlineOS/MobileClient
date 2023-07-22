BoltCar = InheritsFromBaseAttackSkill();

function BoltCar:InitExtraParameters()
  self.cnt = 0;
end

function BoltCar:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    self.step = 2;
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
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
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
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then
    local picID;
    local newPos = {};
    if target.party_Kind == EFightParty.Left then
      picID = 10072;
    else
      picID = 10073
    end

    for i = 0, self.emyNum - 1 do 
      newPos.x = FightField.fightHum[self.emyIdxAy[i]].nowPos.x;
      newPos.y = FightField.fightHum[self.emyIdxAy[i]].nowPos.y;
      me:PlaySound(target.colm, target.row, Attack_Start);
      FightField.attack[self.humIdx]:SetLightWithOrder(i + 2, EEffectLightDis.Sky, picID, 50, 1, 1, 6, EEffectLightTracer.Curve, me.nowPos.x, me.nowPos.y, 255, true, 0, newPos.x, newPos.y, 0.5);
    end
    self.step = 3;
  elseif self.step == 3 then
    self:ArrowMove();
    for i = 0, self.emyNum - 1 do
      if FightField.attack[self.humIdx].lights[i + 2].isArrive then
        target = FightField.fightHum[self.emyIdxAy[i]];
        me:PlaySound(target.colm, target.row);
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);

        FightField.attack[self.humIdx]:SetLightWithOrder(i + 2, EEffectLightDis.Sky, 10040, 30, 4, 9, 9, EEffectLightTracer.StandAni, target.nowPos.x + math.random(50) - 1, target.nowPos.y + math.random(50) - 1, 25, true, 12);
        self.cnt = self.cnt + 1;
      end
    end

    if self.cnt == self.emyNum then
      self.cnt = self.cnt - 1;
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[self.cnt + 2].picId == 0 then
      self.isLightEnd = true;
      self.step = 5;
    end
  end
end

function BoltCar:ArrowMove()
  local curDist, totalDist;
  local page;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  curDist = math.round(math.sqrt(math.pow(me.nowPos.x - FightField.attack[self.humIdx].lights[2].showPos.x, 2) + math.pow(me.nowPos.y - FightField.attack[self.humIdx].lights[2].showPos.y, 2)));
  totalDist = math.round(math.sqrt(math.pow(me.nowPos.x - target.nowPos.x, 2) + math.pow(me.nowPos.y - target.nowPos.y, 2)));

  if curDist > totalDist then
    return;
  end

  page = math.ceil((curDist / (totalDist + 0.01)) * 5) + 1;

  for i = 2, 4 do
    if FightField.attack[self.humIdx].lights[i] ~= nil then
      FightField.attack[self.humIdx].lights[i]:SetPage(page, page);
    end
  end
end