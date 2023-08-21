PoisonShieldMe = InheritsFromBaseStatus();

function PoisonShieldMe:Update()  
  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then     
    local skillid = 0;
    if me.party_Kind == EFightParty.Right then 
      skillid = 10813;
    else
      skillid = 10814;
    end
    me:GetStatus(self.statusKind):SetLightWithOrder(1, EEffectLightDis.Body, skillid, 200, 4, 8, 8, EEffectLightTracer.Stand, me.nowPos.x + 64 , me.nowPos.y + 94, 28, true, 30);    
    me:GetStatus(self.statusKind).lights[1].gameObject.transform.localScale = Vector3.New(0.5, 0.5, 1);
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