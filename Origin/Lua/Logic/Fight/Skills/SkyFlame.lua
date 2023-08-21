SkyFlame = InheritsFromBaseAttackSkill();

function SkyFlame:InitExtraParameters()
  self.hitOrder = self:GetHitOrder();
  self.flameLightIndexs = {};
  self.flameCount = 1;
end

function SkyFlame:GetHitOrder()
  local result = {};
  if self.emyNum ~= 1 then     
    for k, v in pairs(self.emyIdxAy)do
      if v ~= self.tarIdx and FightField.fightHum[v] ~= nil and FightField.fightHum[v].roleController:GetAttribute(EAttribute.Hp) > 0 then 
        table.insert(result, v);
      end    
    end    
  end
  table.insert(result, self.tarIdx);
  return result;
end

function SkyFlame:ExtraClose()
  FightField.SetShake(false);
end

function SkyFlame:UpdateFlameLight()
  for k, v in pairs(self.flameLightIndexs)do
    local flameTarget = FightField.fightHum[self.hitOrder[v]];
    local flameLight = FightField.attack[self.humIdx].lights[v];
    if flameLight == nil or flameLight.picId == 0 then 
      FightField.attack[self.humIdx]:SetLightWithOrder(v, EEffectLightDis.Body, 10757, 150, 1, 14, 14, EEffectLightTracer.StandAni, flameTarget.nowPos.x+5, flameTarget.nowPos.y, 25, true, 65);
      FightField.fightHum[self.humIdx]:PlaySound(flameTarget.colm, flameTarget.row, Attack_Start, 2);
      FightField.fightHum[self.humIdx]:PlayEffect(flameTarget.colm, flameTarget.row, ERolePose.Hit,1); 
      table.remove(self.flameLightIndexs, k);
      FightField.SetShake(true);
      self.interval = 0.5;
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
      break;
    end    
  end  
end

function SkyFlame:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground,10078,50,1,21,21, EEffectLightTracer.StandAni, me.nowPos.x+5, me.nowPos.y,20, true, 90);     --咒語

    self.interval = 0.5;
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
    self:UpdateFlameLight();
    if self:CheckInterval() then     
      if self.flameCount <= table.Count(self.hitOrder) then 
        local flameTarget = FightField.fightHum[self.hitOrder[self.flameCount]];
        me:PlaySound(flameTarget.colm, flameTarget.row, Attack_Start, 1);              
        if target.party_Kind == EFightParty.Left then                    
          FightField.attack[self.humIdx]:SetLightWithOrder(self.flameCount, EEffectLightDis.Sky, 10721, 60, 1, 18, 18, EEffectLightTracer.StandAni, flameTarget.nowPos.x + 380, flameTarget.nowPos.y +50, 32, false, 0);
          local flameLight = FightField.attack[self.humIdx].lights[self.flameCount];
          flameLight.gameObject.transform.localRotation = Quaternion.Euler(0, 180, 0);          
        else            
          FightField.attack[self.humIdx]:SetLightWithOrder(self.flameCount, EEffectLightDis.Sky, 10721, 60, 1, 18, 18, EEffectLightTracer.StandAni, flameTarget.nowPos.x - 50, flameTarget.nowPos.y +50, 32, false, 0);        
        end
        table.insert(self.flameLightIndexs, self.flameCount);
        self.flameCount = self.flameCount + 1;
        self.interval = 0.5;
      else
        self.step = 3;
      end
    end
  elseif self.step == 3 then
    self:UpdateFlameLight();
    if self:CheckInterval() then 
      if table.Count(self.flameLightIndexs) == 0 then 
        self.isLightEnd = true;
        FightField.SetShake(false);
      end
    end    
  end
end