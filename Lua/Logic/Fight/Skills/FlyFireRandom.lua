FlyFireRandom = InheritsAttack(RandomHit)

function FlyFireRandom:PlayEffectLight()
  local target = FightField.fightHum[self.aimIdx];
  local me = FightField.fightHum[self.humIdx];
  FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Body, 10092, 50, 1, 10, 10, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 25, true, 20);
  if target.party_Kind == EFightParty.Left then
    if self.attackStep == 1 or self.attackStep == 3 then
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10148, 50, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x + 30, target.nowPos.y, 35, true, 120);          
    elseif self.attackStep == 2 then
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10149, 50, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x - 60, target.nowPos.y, 35, true, 80);
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
    end
  else
    if self.attackStep == 1 or self.attackStep == 3 then
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10149, 50, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x - 60, target.nowPos.y, 35, true, 80);          
    elseif self.attackStep == 2 then
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10148, 50, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x + 30, target.nowPos.y, 35, true, 120);          
    end
  end      
end