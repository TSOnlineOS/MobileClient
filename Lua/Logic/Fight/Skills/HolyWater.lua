HolyWater = InheritsFromBaseAttackSkill();

function HolyWater:Update()
  local me = FightField.fightHum[self.humIdx];

  if self.step == 1 then
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10070, 35, 1, 28, 32, EEffectLightTracer.Stand, me.nowPos.x + 6, me.nowPos.y, 30, false, 50);
    self.interval = 0.8;
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
    self.step = 2;
  elseif self.step == 2 then
    if self:CheckInterval() then 
      for k, v in pairs(self.emyIdxAy) do
        local fightRole = FightField.fightHum[v];
        FightField.attack[self.humIdx]:SetLightWithOrder(1 + 2*k, EEffectLightDis.Body, 10144, 70, 1, 17, 17, EEffectLightTracer.StandAni, fightRole.nowPos.x, fightRole.nowPos.y, 30, false, 40);
        FightField.attack[self.humIdx]:SetLightWithOrder(2 + 2*k, EEffectLightDis.Body, 10130, 70, 1, 14, 14, EEffectLightTracer.StandAni, fightRole.nowPos.x, fightRole.nowPos.y, 35, false, 50);                        
      end
    
      self.step = 3;
    end
  elseif self.step == 3 then
    if FightField.attack[self.humIdx].lights[1].picId == 0 then
      for k, v in pairs(self.emyIdxAy) do
        local fightRole = FightField.fightHum[v];
        local newPos = fightRole:RCtoSpot(fightRole.colm, fightRole.row);
        local lightOrder = nil;
        if fightRole.party_Kind == EFightParty.Left then
          newPos.x = newPos.x + 15;
          newPos.y = newPos.y + 55;
          lightOrder = EEffectLightDis.Body1;
        else
          newPos.x = newPos.x - 15;
          newPos.y = newPos.y + 25;
          lightOrder = EEffectLightDis.Ground;
        end
                      

        FightField.attack[self.humIdx]:SetLightWithOrder(1 + 4*k, lightOrder,10018, 25, 1, 8, 8, EEffectLightTracer.Stand, newPos.x, newPos.y, 18, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(2 + 4*k, EEffectLightDis.Body,10019, 15, 1, 15, 15, EEffectLightTracer.Stand, newPos.x, newPos.y, 35, false, 35);

        FightField.attack[self.humIdx]:SetLightWithOrder(3 + 4*k, EEffectLightDis.Body, 10141, 50, 1, 23, 23, EEffectLightTracer.StandAni, fightRole.nowPos.x, fightRole.nowPos.y - 35, 20, false, 80);
        FightField.attack[self.humIdx]:SetLightWithOrder(4 + 4*k, EEffectLightDis.Body, 10095, 50, 1, 13, 13, EEffectLightTracer.StandAni, fightRole.nowPos.x, fightRole.nowPos.y - 35, 20, false, 50);
      end
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[3].picId == 0 then
      self.isLightEnd =true;
      self.step = 5;
    end
  end
end