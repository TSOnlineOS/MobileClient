ShakeTake = InheritsFromBaseStatus();

function ShakeTake:Update()
  if self.step == 1 then 
    local me = FightField.fightHum[self.humIdx];
    local posX = FightField.chip[me.colm][me.row].x;
    local posY = FightField.chip[me.colm][me.row].y;
    me.roleController:SetAnimationForceId(ERolePose.Hit);
    me.roleController:SetAnimationForceFrame(2);    
    me.status[self.statusKind]:SetLightWithOrder(1, EEffectLightDis.Ground, 10309, 150, 1, 5, 5, EEffectLightTracer.Stand, posX, posY, 30, true, 210);

    if me.party_Kind == EFightParty.Left then
      me.status[self.statusKind]:SetLightWithOrder(2, EEffectLightDis.Body, 10335, 200, 5, 5, 6, EEffectLightTracer.Stand, posX - math.random(15) + 19, posY - 30, 255, false, math.random(50) - 1);
      me.status[self.statusKind]:SetLightWithOrder(3, EEffectLightDis.Body, 10335, 200, 6, 6, 6, EEffectLightTracer.Stand, posX - math.random(15) + 19, posY - 30, 255, false, math.random(50) - 1);
    else
      me.status[self.statusKind]:SetLightWithOrder(2, EEffectLightDis.Body, 10336, 200, 5, 5, 6, EEffectLightTracer.Stand, posX - math.random(15) - 11, posY - 20, 255, false, math.random(40) - 1);
      me.status[self.statusKind]:SetLightWithOrder(3, EEffectLightDis.Body, 10336, 200, 6, 6, 6, EEffectLightTracer.Stand, posX - math.random(15) - 11, posY - 20, 255, false, math.random(40) - 1);
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
      local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  end
end