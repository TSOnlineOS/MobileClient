BambooWall = InheritsFromBaseAttackSkill();

function BambooWall:InitExtraParameters()
  self.isHit = false;
  self.shootOldTime = CGTimer.time;
  self.shotted = {}; --boolean array
  for i = 1, 9 do 
    self.shotted[i] = false;
  end
end

function BambooWall:BambooMove()
  local idx, tempPos;

  for i= 2, 9 do
    if self.shotted[i] == true then    
      idx, tempPos = self:GetBambooPos(i);
      if FightField.attack[self.humIdx]:CheckLightIsEnd(idx) then   --光影結束      
        FightField.attack[self.humIdx]:SetLight(idx,10716,5,6,6,6, EEffectLightTracer.Line,
                                           tempPos.x, tempPos.y,255,true,0,tempPos.x+300, tempPos.y+200,1);     --竹箭移動
        self.shotted[i] = false;
      end
    end
  end
end

function BambooWall:GetBambooPos(kind)
  local idx;
  local pos = Vector2.zero;
  if kind == 2 then     
    idx = 2;
    pos.x = FightField.chip[1][0].x;
    pos.y = FightField.chip[1][0].y-20;                      
  elseif kind == 3 then
    idx = 3;
    pos.x = FightField.chip[1][1].x;
    pos.y = FightField.chip[1][1].y-20;  
  elseif kind == 4 then
    idx = 4;
    pos.x = FightField.chip[1][2].x;
    pos.y = FightField.chip[1][2].y-20;  
  elseif kind == 5 then
    idx = 5;
    pos.x = FightField.chip[1][3].x;
    pos.y = FightField.chip[1][3].y-20;  
  elseif kind == 6 then
    idx = 6;
    pos.x = FightField.chip[1][0].x;
    pos.y = FightField.chip[1][0].y+ 10;  
  elseif kind == 7 then
    idx = 7;
    pos.x = FightField.chip[1][1].x;
    pos.y = FightField.chip[1][1].y+ 10;  
  elseif kind == 8 then
    idx = 8;
    pos.x = FightField.chip[1][2].x;
    pos.y = FightField.chip[1][2].y+ 10;  
  elseif kind == 9 then
    idx = 9;
    pos.x = FightField.chip[1][3].x;
    pos.y = FightField.chip[1][3].y+ 10;  
  end
  return idx, pos;
end

function BambooWall:BambooShot(aidx)
  local  idx, tempPos = self:GetBambooPos(aidx);
  if FightField.attack[self.humIdx]:CheckLightIsEnd(idx) then                  --光影結束
    if self.shotted[idx] == false then  
      FightField.attack[self.humIdx]:SetLight(idx,10716,10,1,6,6, EEffectLightTracer.StandAni,
                                         tempPos.x, tempPos.y,255,false);                  --竹箭射出
      self.shotted[idx] = true;
    end
  end
end

function BambooWall:Update()
  local target;
  local idx;
  
  local me = FightField.fightHum[self.humIdx];  
  if self.step  == 1 then  --畫竹牆        
    FightField.attack[self.humIdx]:SetLight(1,10715,30,1,1,1, EEffectLightTracer.Stand,
                                         FightField.chip[1][2].x,FightField.chip[1][2].y+90);     --竹牆    
    self.shootOldTime = CGTimer.time;
  
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
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
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
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    self.step = 2;
  elseif Between(self.step, 2, 9) then  --第一波射出竹箭        
    self:BambooMove();
    if (CGTimer.time - self.shootOldTime) * 1000 >= (50 / FightField.timeScale) then      
      if self.step == 2 then 
        idx = 6;
      elseif self.step == 3 then 
        idx = 3;
      elseif self.step == 4 then 
        idx = 9;          
      elseif self.step == 5 then 
        idx = 8;              
      elseif self.step == 6 then 
        idx = 4;      
      elseif self.step == 7 then 
        idx = 5;          
      elseif self.step == 8 then 
        idx = 7;              
      elseif self.step == 9 then 
        idx = 2;                            
      end
      self:BambooShot(idx);
      self.step = self.step + 1;
      self.shootOldTime = CGTimer.time;
    end
  elseif Between(self.step, 10, 17) then --第二波射出竹箭        
    self:BambooMove();
    if (CGTimer.time - self.shootOldTime) * 1000 >= (50 / FightField.timeScale) then      
      if self.step == 10 then 
        idx = 6;
      elseif self.step == 11 then 
        idx = 3;          
      elseif self.step == 12 then 
        idx = 5;                
      elseif self.step == 13 then 
        idx = 8;                    
      elseif self.step == 14 then 
        idx = 2;                    
      elseif self.step == 15 then 
        idx = 4;                    
      elseif self.step == 16 then 
        idx = 9;    
      elseif self.step == 17 then 
        idx = 7;                  
      end
      self:BambooShot(idx);

      for k,v in pairs(self.emyIdxAy)do        
        target = FightField.fightHum[v];
        me:PlaySound(target.colm, target.row); 
        me:PlayEffect(target.colm, target.row, ERolePose.Hit,1);    --跳血挨打姿勢
        target.roleController:Hit();
      end
        
      self.step = self.step + 1 ;
      self.shootOldTime = CGTimer.time;
    end
  elseif self.step == 18 then         --擊中          
    self:BambooMove();
    if (CGTimer.time - self.shootOldTime) * 1000 >= (1000 / FightField.timeScale) then
      self.step = 19;
      self.isLightEnd = true;
    end
  end  
end