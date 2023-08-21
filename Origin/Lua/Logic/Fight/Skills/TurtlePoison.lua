TurtlePoison = InheritsFromBaseAttackSkill();

function TurtlePoison:Update()
  local me = FightField.fightHum[self.humIdx];

  if self.step == 1 then     
    me.roleController:SetAnimationForceId(ERolePose.Lie);          
    self.interval = 0.1;  
    self.step = 2;        
  elseif self.step == 2 then 
    if self:CheckInterval() then
      local target;
      local newPos;
      local cnt;
      for i = 0, self.emyNum-1 do        
        target = FightField.fightHum[self.emyIdxAy[i]];
        for j = 2, 9 do          
          newPos = {};
          newPos.x = target.nowPos.x+ math.random(0, 50)-25;
          newPos.y = target.nowPos.y - math.random(0,100);
          cnt = 50 + math.random(0,100);
          FightField.attack[self.humIdx]:SetLightWithOrder(1 + i * 8, EEffectLightDis.Body, 10049, cnt, 1, 3, 3,
                                                             EEffectLightTracer.Stand, newPos.x, newPos.y, 15, true, 50);   
        end
      end

      self.interval = 0.8;
      self.step = 3;
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
  elseif self.step == 3 then           
    if self:CheckInterval() then
      self.step = 4;
      self.isLightEnd = true;
    end    
  end
end