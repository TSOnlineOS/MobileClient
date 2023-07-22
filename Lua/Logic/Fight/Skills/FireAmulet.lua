FireAmulet = InheritsFromBaseAttackSkill();

function FireAmulet:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Body, 10078, 50, 1, 20, 20, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 30, true, 80);
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
    if FightField.attack[self.humIdx].lights[1].picId == 0 then
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10132, 100, 1, 15, 15, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 50);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Body, 10129, 100, 1, 17, 17, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 50);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Body, 10037, 100, 1, 24, 24, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 30);
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Body, 10299, 100, 1, 11, 11, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 30);
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[5].picId == 0 then
      self.isLightEnd = true;
      self.step = 4;
    end
  end
end

--狀態顯示
FireAmuletMe = InheritsFromBaseStatus();

function FireAmuletMe:Update()  
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
      local newPos = me:GetChipPos();
      me:GetStatus(self.statusKind):SetLightWithOrder(1, EEffectLightDis.Body, 10037, 100, 1, 24, 24, EEffectLightTracer.Stand, newPos.x, newPos.y, 30, true, 30);
      me:GetStatus(self.statusKind):SetLightWithOrder(2, EEffectLightDis.Body, 10299, 100, 1, 11, 11, EEffectLightTracer.Stand, newPos.x, newPos.y, 30, true, 30);                                                 
    end       
    self.step = 2;    
  end
end