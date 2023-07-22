ExitFail = InheritsFromBaseAttackSkill();

function ExitFail:Update()
  local me = FightField.fightHum[self.humIdx];
  local newPos;
  if self.step == 1 then
    newPos = me:GetSpotOfRc(EFightSpot.Back, 30);
    me.roleController:SetInBattle(false);
    me.roleController:SetIsMoving(true);
    me:SetSpeed(0.12);
    me:SetWalk(newPos.x, newPos.y);
    self.step = self.step + 1;
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
    if me.arrive == true then
      newPos = me:GetSpotOfRc(EFightSpot.Back, 60);
      me.arrive = false;
      me.roleController:SetIsMoving(false);
      me.roleController:SetInBattle(true);
      me.roleController:SetIsDead(true);
      me:SetSpeed(0.12);
      me:SetWalk(newPos.x, newPos.y);
      self.interval = 0.8;
      self.step = self.step + 1;      
    end
  elseif self.step == 3 then
    if me.arrive == true then
      if self:CheckInterval() then 
        self.step = self.step + 1;
      end
    end
  elseif self.step == 4 then
    self.isLightEnd = true;
  end
end