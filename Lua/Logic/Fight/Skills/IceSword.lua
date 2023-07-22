IceSword = InheritsFromBaseAttackSkill();

function IceSword:InitExtraParameters()
  self.iceList = {};
  self.iceListCount = 0;
end

function IceSword:ExtraClose()
  ClearLightTable(self.iceList);  
  self.isLightEnd = true;
end

function IceSword:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local newPos;
  local newLight
  local oldLight;

  if self.step == 1 then
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10070, 30, 1, 32, 32, EEffectLightTracer.StandAni, me.nowPos.x + 7, me.nowPos.y, 20, true, 50);
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
    if self:CheckInterval() then 
      self.totalDist = math.round(math.sqrt(math.pow(me.nowPos.x - target.nowPos.x, 2) + math.pow(me.nowPos.y - target.nowPos.y, 2)));
      self.curDist = 60;
      newPos =  me:GetSpotOfTar(target.nowPos.x, target.nowPos.y, self.curDist);

      self.iceIdx = math.random(2) - 1;
      newLight = EffectLight.New(10013 + self.iceIdx, 30, 1, 3, 3, EEffectLightTracer.Stand, newPos.x, newPos.y, 50, false, 40);
      newLight:SetTimeScale(FightField.timeScale);  
      newLight:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      newLight.orderCount = 1;
      self:IceListAdd(newLight);
      self.step = self.step + 1;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1] ~= nil and FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].picId ~= 0 then
      if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].orderCount <= 11 then     -- <= (14 - 3)
        FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].orderCount = FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].orderCount + 3;
      else
        FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].orderCount = 14;
      end
    end
    oldLight = self.iceList[self.iceListCount - 1];
    if oldLight.orderCount == 3 then
      self.curDist = self.curDist +  80;
      if self.curDist > self.totalDist then
        self.curDist = self.totalDist;
        me:PlaySound(target.colm, target.row);
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);
        self.step = self.step + 1;
      end
      newPos =  me:GetSpotOfTar(target.nowPos.x, target.nowPos.y, self.curDist);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1 ,10019, 25, 1, 15, 15, EEffectLightTracer.StandAni, newPos.x, newPos.y, 30, true, 40);
      self.iceIdx = math.fmod(self.iceIdx + 1, 2);
      newLight = EffectLight.New(10013 + self.iceIdx, 30, 1, 3, 3, EEffectLightTracer.Stand, newPos.x, newPos.y, 50, false, 40);
      newLight:SetTimeScale(FightField.timeScale);  
      newLight:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      newLight.orderCount = 1;
      self:IceListAdd(newLight);
    end
  elseif self.step == 4 then
    oldLight = self.iceList[self.iceListCount - 1];
    if oldLight.orderCount == 2 then
      self.step = self.step + 1;
    end
  elseif self.step == 5 then
    for k, v in pairs(self.iceList) do
      if v ~= nil then
        v.startPage = 3;
        v.endPage = 3;
        v.orderCount = 0;
      end
    end
    self.step = self.step + 1;
  elseif self.step == 6 then
    if self:CheckInterval() then 
      for i = self.iceListCount - 1, 0, -1 do
        oldLight = self.iceList[i];
        if oldLight ~= nil and oldLight.startPage == 1 then
          oldLight:Free();
          self:IceListRemove(i);
          break;
        end
      end
      
      for i = 0, self.iceListCount - 1 do
        oldLight = self.iceList[i];
        if oldLight ~= nil and oldLight.startPage == 3 then
          oldLight.startPage = oldLight.startPage - 1;
          oldLight.endPage = oldLight.endPage - 1;
          break;
        end

        if oldLight ~= nil and oldLight.startPage > 1 then
          oldLight.startPage = oldLight.startPage - 1;
          oldLight.endPage = oldLight.endPage - 1;
        end
      end

      self.interval = 0.035;
      if self.iceListCount == 0 then
        self.interval = 0.5;
        self.step = self.step + 1;
      end
    end
  elseif self.step == 7 then
    self:AdditionalEffects(me, target);
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
  elseif self.step == 8 then
    if self:CheckInterval() then
      self.isLightEnd = true;
    end
  end
end

function IceSword:IceListAdd(light)
  self.iceList[self.iceListCount] = light;
  self.iceListCount = self.iceListCount + 1;
end

function IceSword:IceListRemove(idx)
  self.iceList[idx] = nil;
  for i = idx + 1, self.iceListCount - 1 do 
    self.iceList[i - 1] = self.iceList[i];
  end
  self.iceListCount = self.iceListCount - 1;
end

--不同技能showkind追加特效演出
function IceSword:AdditionalEffects(me,target)
  local newPos = target:GetChipPos();
  if self.showKind == ESkill_Kind.IceSword then
    self.isLightEnd = true;
  elseif self.showKind == ESkill_Kind.EW_SlowIceSword then
    if self:CheckInterval() then
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Body, 10171, 150, 1, 5, 5, EEffectLightTracer.StandAni, newPos.x, newPos.y + 100, 255, false, 10);
      target.roleController:Hit();
      me:PlaySound(target.colm, target.row, Attack_Hit);
      self.interval = 1;
      self.step = self.step + 1;
    end
  elseif self.showKind == ESkill_Kind.EW_ChaosIceSword then
    if self:CheckInterval() then
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10139, 150, 1, 8, 8, EEffectLightTracer.StandAni, newPos.x, newPos.y - 30, 30, false, 10);
      target.roleController:Hit();
      me:PlaySound(target.colm, target.row, Attack_Hit);
      self.interval = 1;
      self.step = self.step + 1;
    end
  end
end