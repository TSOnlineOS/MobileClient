RockWall = InheritsFromBaseAttackSkill();

function RockWall:ExtraClose()
  for k, v in pairs(self.emyIdxAy)do 
    if FightField.fightHum[v] ~= nil then 
      FightField.fightHum[v]:SetSquelch(MaxSquelch);
    end
  end
end

function RockWall:Update()   
  local me = FightField.fightHum[self.humIdx];
  local target;
  if self.step == 1 then  --畫石牆        
    FightField.attack[self.humIdx]:SetLight(9,10714,100,1,4,4, EEffectLightTracer.Line,
                                         FightField.chip[1][2].x,FightField.chip[1][2].y+90,255,true,0,
                                         FightField.chip[3][2].x+135,FightField.chip[3][2].y+90+70,0.1);     --石牆    
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
  elseif self.step == 2 then   --移到第一排位置前    
    if FightField.attack[self.humIdx].lights[9].showPos.x > FightField.chip[2][2].x-80 then            
      self.step = 3;      
    end
  elseif self.step == 3 then   --移到第二排位置前    
    for k, v in pairs(self.emyIdxAy) do
      target = FightField.fightHum[v];
      me:PlaySound(target.colm, target.row);   
      me:PlayEffect(target.colm, target.row, ERolePose.Hit,1);    --跳血挨打姿勢
      target.roleController:Hit();
    end

    if FightField.attack[self.humIdx].lights[9].showPos.x > FightField.chip[3][2].x-100 then            
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
        local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  elseif self.step == 4 then   --擊中    
    if FightField.attack[self.humIdx].lights[9].showPos.x > FightField.chip[3][2].x+130 then      
      self.interval = 0.5;
      self.step = 5;      
    end
  elseif self.step == 5 then     
    if self:CheckInterval() then      
      for k, v in pairs(self.emyIdxAy)do        
        target = FightField.fightHum[v];
        target:SetSquelch(MaxSquelch);
      end
      self.isLightEnd = true;
      self.step = 6;      
    end
  end
end