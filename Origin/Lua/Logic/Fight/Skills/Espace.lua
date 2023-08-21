Espace = InheritsFromBaseAttackSkill();

function Espace:Update()
  local newPos;
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then             
    newPos = target:GetSpot(EFightSpot.Back, 60);
    target:SetWalk(newPos.x, newPos.y);
    target.roleController:SetIsJumping(true);
    target:SetSpeed(0.12);
    target:SetBeh(EFightBeh.Residual);        
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
    if target.arrive then                
      target.roleController:SetVisible(ERoleVisible.Hide);  --隱藏
      self.step = self.step + 1;      
      self.isLightEnd = true; --特技施展完畢
    end
  end
end