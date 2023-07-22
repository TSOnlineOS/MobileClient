WaterGun = InheritsFromBaseAttackSkill();

function WaterGun:InitExtraParameters()
  self.waterCount = 0;
end 

function WaterGun:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10070, 40, 1, 32, 32, EEffectLightTracer.StandAni, me.nowPos.x + 7, me.nowPos.y, 20, true, 50);
    self.interval = 1;
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
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky ,10094, 80, 1, 19, 19, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 60);
      self.step = 3;
      self.interval = 0.5;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      local aRi =  me.roleController:GetAnimationFrame(me.roleController:GetAnimationId(ERolePose.Archery));
      if aRi == 0 then  --NPC沒有設箭動作
        me.roleController:SetAnimationForceId(ERolePose.Magic);
      else
        me.roleController:SetAnimationForceId(ERolePose.Archery);
      end
      
      if me.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10642, 100, 1, 4, 4, EEffectLightTracer.StandAni, me.nowPos.x - 45, me.nowPos.y - 25, 40, true, 0);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10643, 100, 1, 4, 4, EEffectLightTracer.StandAni, me.nowPos.x + 45, me.nowPos.y - 25, 40, true, 0);
      end
      self.step = 4;
      self.interval = 0.2;
    end
  elseif self.step == 4 then 
    self:UpdateWaterEffect();
    if self:CheckInterval() then    
      if FightField.attack[self.humIdx].lights[4] == nil or FightField.attack[self.humIdx].lights[4].picId == 0 then 
        if self.waterCount >= 3 then 
          self.step = 5;
          return;
        else
          self.waterCount = self.waterCount + 1;
        end
        if me.party_Kind == EFightParty.Right then
          FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky ,10601, 110, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x + 180, target.nowPos.y - 50, 30, true, 60);
          FightField.attack[self.humIdx].lights[4].gameObject.transform.localRotation = Quaternion.Euler(0, 0, 270);
        else
          FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky ,10601, 110, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x - 50, target.nowPos.y + 80, 30, true, 60);
          FightField.attack[self.humIdx].lights[4].gameObject.transform.localRotation = Quaternion.Euler(0, 0, 90);
        end      
        me:PlaySound(target.colm, target.row);
        me:PlayEffect(target.colm, target.row, ERolePose.hit, 3);                            
      end      
    end
  elseif self.step == 5 then 
    self.isLightEnd =true;
    self.step = 6;
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

function WaterGun:UpdateWaterEffect()
  local me = FightField.fightHum[self.humIdx];
  if FightField.attack[self.humIdx].lights[3].picId == 0 then 
    if me.party_Kind == EFightParty.Right then
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10642, 100, 1, 4, 4, EEffectLightTracer.StandAni, me.nowPos.x - 45, me.nowPos.y - 25, 40, true, 0);
    else
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10643, 100, 1, 4, 4, EEffectLightTracer.StandAni, me.nowPos.x + 45, me.nowPos.y - 25, 40, true, 0);
    end
  end
end