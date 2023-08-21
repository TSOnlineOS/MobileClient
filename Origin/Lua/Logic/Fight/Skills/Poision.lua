Poision = InheritsFromBaseAttackSkill();

function Poision:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10079, 50, 1, 22, 22, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 30, false, 113);
    self.interval = 0.8;
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
    self.step = 2;
  elseif self.step == 2 then
    if self:CheckInterval() then 
      local posX, posY;
      local cnt;

      for i = 2, 9 do
        posX = target.nowPos.x + math.random(50) - 26;
        posY = target.nowPos.y - math.random(100) + 1;
        cnt = 49 + math.random(100);
        FightField.attack[self.humIdx]:SetLightWithOrder(i, EEffectLightDis.Sky, 10049, cnt, 1, 3, 3, EEffectLightTracer.Stand, posX, posY, 15, true, 50);
      end

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

DisPoision = InheritsFromBaseAttackSkill();

function DisPoision:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self.step == 1 then
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10079, 50, 1, 22, 22, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 30, false, 113);
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
  elseif self.step == 2 then
    if self:CheckInterval() then 
      local posX, posY;
      local cnt;

      for i = 2, 9 do
        posX = target.nowPos.x + math.random(160) - 81;
        posY = target.nowPos.y;
        cnt = 49 + math.random(100);
        FightField.attack[self.humIdx]:SetLightWithOrder(i, EEffectLightDis.Sky, 10049, cnt, 1, 3, 3, EEffectLightTracer.Curve, target.nowPos.x, target.nowPos.y, 15, true, 50, posX, posY, 0.16);
      end

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

--狀態顯示
PoisionMe = InheritsFromBaseStatus();

function PoisionMe:ExtraClose()
  FightField.fightHum[self.humIdx].roleController:SetTextureColor(Color.White);  
  FightField.RestoreFightInfo(self.humIdx, 0);
end

function PoisionMe:Update()
  if self.step == 1 then 
    FightField.fightHum[self.humIdx].roleController:SetTextureColor(Color.Green);
    self.step = 2;              
  end
end