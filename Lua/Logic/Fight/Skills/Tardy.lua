TardyMe = InheritsFromBaseStatus();

function TardyMe:ExtraClose()  
  FightField.RestoreFightInfo(self.humIdx, 0);
  FightField.fightHum[self.humIdx].roleController:SetTextureColor(Color.White);
end

function TardyMe:Update()
  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then 
    me.status[self.statusKind]:SetLightWithOrder(1, EEffectLightDis.Ground, 10259, 150, 4, 10, 10, EEffectLightTracer.Stand, me.nowPos.x , me.nowPos.y + 45, 255, true, 25);      
    me.roleController:SetTextureColor(Color.Orange);
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

  end
end