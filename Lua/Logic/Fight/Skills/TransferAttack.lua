TransferAttack = InheritsFromBaseAttackSkill();

function TransferAttack:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10077, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 90);
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
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10266, 100, 1, 11, 11, EEffectLightTracer.StandAni, target.nowPos.x + 5, target.nowPos.y, 20, true, 30);
      self.interval = 0.8;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 4;
    end
  end
end

TransferAttackMe = InheritsFromBaseStatus();

function TransferAttackMe:ExtraClose()  
  FightField.RestoreFightInfo(self.humIdx, 0);
end

function TransferAttackMe:Update()  
  if self.step == 1 then
    local fHidx;
    local me = FightField.fightHum[self.humIdx];
       
    --同隊秀被施法圖
    fHidx = 255;

    for k,v in pairs(FightField.fightHum)do
      if v.id == Role.playerId then 
        fHidx = k;
        break;
      end
    end

    if fHidx ~= 255 and me.party_Kind == FightField.fightHum[fHidx].party_Kind then
      local  newPos = me:GetChipPos();
      me:GetStatus(self.statusKind):SetLightWithOrder(1, EEffectLightDis.Sky, 10266, 100, 1, 11, 11, EEffectLightTracer.Stand, newPos.x, newPos.y, 30, true, 0);                                                 
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
