SwordHell = InheritsFromBaseAttackSkill();

function SwordHell:Update()  
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10103, 100, 1, 4, 10, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 255, false, 80);
    me.roleController:SetIsJumping(true);
    if me.party_Kind == EFightParty.Right then
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10675, 50, 1, 8, 8, EEffectLightTracer.Stand, me.nowPos.x - 40, me.nowPos.y, 255, true, 80);
    else
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10675, 50, 1, 8, 8, EEffectLightTracer.Stand, me.nowPos.x + 50, me.nowPos.y, 255, true, 25);
    end 
    
    me:PlaySound(target.colm, target.row, Attack_Start);
    for i = 0, 1 do 
      FightField.attack[self.humIdx]:SetLightWithOrder(i + 3, EEffectLightDis.Body, 10250, 80, 1, 3, 6, EEffectLightTracer.StandAni, me.nowPos.x - 40 + 80 * i, me.nowPos.y + math.random(40) - 41, 20, false, 30);
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
  elseif self.step == 2 then
    if FightField.attack[self.humIdx].lights[2].orderCount == 4 then
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10103, 100, 1, 4, 10, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 255, false, 80);
      for i = 2, 3 do 
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 3, EEffectLightDis.Body, 10250, 80, 1, 3, 6, EEffectLightTracer.StandAni, me.nowPos.x - 40 + 80 * (i - 2), me.nowPos.y + math.random(40) - 41, 20, false, 30);
      end

      for i = 4, 5 do 
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 3, EEffectLightDis.Body, 10250, 80, 1, 3, 6, EEffectLightTracer.StandAni, me.nowPos.x + math.random(40) - 41, me.nowPos.y - 40 + 80 * (i - 4), 20, false, 30);
      end

      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground, 10103, 100, 1, 4, 10, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 255, false, 80);
      self.step = 3;
    end
  elseif self.step == 3 then           
    if FightField.attack[self.humIdx].lights[3].orderCount == 2 then
      local newPos = target:GetAttackPos(EFightSpot.Front, 60);
      me:SetJump(newPos.x, newPos.y);
      me.roleController:SetIsJumping(true);
      FightField.attack[self.humIdx]:StopLight(2);
      if me.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Body, 10675, 50, 1, 8, 8, EEffectLightTracer.Curve, me.nowPos.x - 40, me.nowPos.y, 255, true, 80, newPos.x, newPos.y);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Body, 10675, 50, 1, 8, 8, EEffectLightTracer.Curve, me.nowPos.x + 50, me.nowPos.y, 255, true, 25, newPos.x, newPos.y, 0.33);
      end 
      
      me:PlaySound(target.colm, target.row, Attack_Start);
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
  elseif self.step == 4 then     
    if me.arrive then
      me.roleController:SetIsJumping(false);
      me.roleController:OneHandAttack();
      if me.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10677, 50, 1, 6, 8, EEffectLightTracer.Stand, target.nowPos.x + 20, target.nowPos.y, 255, false, 80);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10676, 50, 1, 6, 8, EEffectLightTracer.Stand, target.nowPos.x + 20, target.nowPos.y, 255, false, 80);
      end 

      FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Body, 10250, 80, 1, 3, 6, EEffectLightTracer.StandAni,target.nowPos.x, target.nowPos.y + 20, 20, false, 0);
      self.step = 5;
    end
  elseif self.step == 5 then
    if FightField.attack[self.humIdx].lights[5].orderCount == 2 then
      if me.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10677, 100, 1, 1, 8, EEffectLightTracer.StandAni, target.nowPos.x + 20, target.nowPos.y, 255, false, 80);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10676, 100, 1, 1, 8, EEffectLightTracer.StandAni, target.nowPos.x + 20, target.nowPos.y, 255, false, 80);
      end 

      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Body, 10250, 80, 1, 3, 6, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y + 20, 20, false, 0);
      me:PlaySound(target.colm, target.row);
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
        --local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  elseif self.step == 6 then
    if FightField.attack[self.humIdx].lights[6].orderCount == 1 then
      if me.party_Kind == EFightParty.Right then
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10677, 100, 6, 7, 8, EEffectLightTracer.StandAni, target.nowPos.x + 20, target.nowPos.y, 255, false, 80);
      else
        FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10676, 100, 6, 7, 8, EEffectLightTracer.StandAni, target.nowPos.x + 20, target.nowPos.y, 255, false, 80);
      end 
      self.step = 7;     
    end
  elseif self.step == 7 then 
    self.isLightEnd = true;
    self.step = 8;
  end
end
