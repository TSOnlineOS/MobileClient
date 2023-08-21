SoulMirror = InheritsFromBaseAttackSkill();

function SoulMirror:Update()
  self:UpdateBase();
end

function SoulMirror:UpdateBase()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10080, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 6, me.nowPos.y, 20, true, 80);
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
      --local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then
    if self:CheckInterval() then
      local newPos;
      if target.party_Kind == EFightParty.Right then
        newPos = target:RCtoSpot(target.colm, target.row);
        newPos = Vector2.New(newPos.x-20, newPos.y+35);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground ,10284, 40, 1, 16, 16, EEffectLightTracer.StandAni,  newPos.x,  newPos.y, 255, true, 0);
      else
        newPos = target:RCtoSpot(target.colm, target.row);
        newPos = Vector2.New(newPos.x + 15, newPos.y + 55);
        FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body ,10284, 40, 1, 16, 16, EEffectLightTracer.StandAni,  newPos.x,  newPos.y, 255, true, 0);
      end
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[2].picId == 0 then
      self.isLightEnd =true;
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
  end
end

--專武靈鏡
EW_SoulMirror = InheritsAttack(SoulMirror);

function EW_SoulMirror:InitDrawBlack()
  self.needDrawBlack = true;
end

--狀態顯示
SoulMirrorMe = InheritsFromBaseStatus();

function SoulMirrorMe:Update()
  if self.step == 1 then 
    local fIdx = 255;
    local me = FightField.fightHum[self.humIdx];
    local newPos = me:GetChipPos();
    fIdx = FightField.GetPlayerIdx();

    if fIdx == -1 then 
      return;
    end

    if fIdx ~= 255 and me.party_Kind == FightField.fightHum[fIdx].party_Kind then
      if me.party_Kind == EFightParty.Right then
        newPos = me:RCtoSpot(me.colm, me.row);
        newPos = Vector2.New(newPos.x-20, newPos.y+35)
        me.status[self.statusKind]:SetLightWithOrder(1, EEffectLightDis.Ground, 10284, 40, 16, 16, 16, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, true, 0);
        me.status[self.statusKind].lights[1]:SetSortingOrder(FightField.FIGHT_GROUND_ORDER - 36)   
      else
        newPos = me:RCtoSpot(me.colm, me.row);

        newPos = Vector2.New(newPos.x + 15, newPos.y + 55);
        me.status[self.statusKind]:SetLightWithOrder(1, EEffectLightDis.Ground, 10284, 40, 16, 16, 16, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, true, 0);
        me.status[self.statusKind].lights[1]:SetSortingOrder(FightField.FIGHT_BODY_ORDER + 185)     
      end
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
  end
end

--太傅靈光鏡
TaiFuSoulMirror = InheritsAttack(SoulMirror);

function TaiFuSoulMirror:InitExtraParameters()
  self.showBefore = true;
  self.interval2 = 0;
end

function TaiFuSoulMirror:Update()
  local me = FightField.fightHum[self.humIdx];

  if self.showBefore == true then
    FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Body ,20058, 175, 1, 5, 9, EEffectLightTracer.Stand,  me.nowPos.x,  me.nowPos.y + 40, 20, false, 0);
    self.showBefore = false;
  end

  if self.showBefore == false and FightField.attack[self.humIdx].lights[3].orderCount == 5 then
    FightField.attack[self.humIdx].lights[3]:Stop();
    FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Body ,20058, 120, 5, 9, 9, EEffectLightTracer.StandAni,  me.nowPos.x,  me.nowPos.y + 40, 26, false, 0);
  end

  if self.showBefore == false and FightField.attack[self.humIdx].lights[4] ~= nil and FightField.attack[self.humIdx].lights[4].picId == 0 then
    self:UpdateBase();
  end
end
