BrickWall = InheritsFromBaseAttackSkill();

function BrickWall:InitExtraParameters()
  self.fireIdx = 0;
  self.isHit = false;
  self.bombStep = {};  --1:硝煙 2:砲彈落下 3:揚起塵土 3.5:彈跳 4:砲彈滾動 5:到達位置
  self.pos = Vector2.zero;
end

function BrickWall:BombMove()
  local idx;

  for i= 1, 5 do  
    if self.bombStep[i] == 2 then    
      idx = 5;--Light5;
      if i  == 1 then 
        idx = 5; --Light5;
      elseif i ==2 then 
        idx = 6; --Light6;
      elseif i ==3 then 
        idx = 7; --Light7;
      elseif i ==4 then 
        idx = 8; --Light8;
      elseif i ==5 then 
        idx = 9; --Light9;        
      end

      if FightField.attack[self.humIdx]:CheckLightIsEnd(idx) then      
        self:GetBombPos(i);
        self.fireIdx = self.fireIdx + 1;
        if self.fireIdx > 3 then 
          self.fireIdx = 1;
        end
        FightField.attack[self.humIdx]:SetLight(self.fireIdx + 1,10289,30,13,1,13, EEffectLightTracer.StandAni,
                                           self.pos.x, self.pos.y+200,30,false);      --塵土, Light 4,2,3,4,2
        FightField.attack[self.humIdx]:SetLight(idx,10718,100,3,7,7, EEffectLightTracer.Line,
                                           self.pos.x, self.pos.y+100,255,true,0, self.pos.x+200, self.pos.y+230,0.1); --砲彈滾動
        self.bombStep[i] = self.bombStep[i] + 1;
      end
    end
  end
end

function BrickWall:BombShot(idx)
  local i, index;

  --砲彈落下
  for i= 1, 5 do  
    if self.bombStep[i] == 1 then    
      if i == 1 then 
        index = 5;
      elseif i == 2 then 
        index = 6;
      elseif i == 3 then 
        index = 7;
      elseif i == 4 then 
        index = 8;
      elseif i == 5 then 
        index = 9;
      end

      self:GetBombPos(i);
      FightField.attack[self.humIdx]:SetLight(index,10718,100,3,7,7, EEffectLightTracer.Line,
                                         self.pos.x ,self.pos.y,255,false,0, self.pos.x, self.pos.y+100,0.2);  --砲彈落下
      self.bombStep[i] = self.bombStep[i]  + 1;
    end
  end

  if self.bombStep[idx] == 0 then  
    self.fireIdx = self.fireIdx + 1;
    if self.fireIdx > 3 then 
      self.fireIdx = 1;
    end
    self:GetBombPos(idx);
    FightField.attack[self.humIdx]:SetLight(self.fireIdx+1,10466,30,1,6,6, EEffectLightTracer.StandAni,
                                       self.pos.x, self.pos.y,30,false);                        --硝煙, Light 2,3,4,2,3
    self.bombStep[idx] = self.bombStep[idx] + 1;
  end
end

function BrickWall:GetBombPos(kind)
  if kind == 1 then     
    self.pos.x = FightField.chip[1][0].x+20;
    self.pos.y = FightField.chip[1][0].y-75;
  elseif kind == 2 then     
    self.pos.x = FightField.chip[1][1].x+10;
    self.pos.y = FightField.chip[1][1].y-80;      
  elseif kind == 3 then     
    self.pos.x = FightField.chip[1][2].x+60;
    self.pos.y = FightField.chip[1][2].y-85;  
  elseif kind == 4 then     
    self.pos.x = FightField.chip[1][3].x+40;
    self.pos.y = FightField.chip[1][3].y-90;  
  elseif kind == 5 then     
    self.pos.x = FightField.chip[1][4].x+60;
    self.pos.y = FightField.chip[1][4].y-85; 
  end
end

function BrickWall:Update()
  local idx;
  local target;  
  local me = FightField.fightHum[self.humIdx];  
  if self.step == 1 then --畫磚牆        
    FightField.attack[self.humIdx]:SetLight(1,10717,30,1,1,1,EEffectLightTracer.Stand,
                                         FightField.chip[1][2].x,FightField.chip[1][2].y+90);     --磚牆
    for i= 1, 5 do
      self.bombStep[i] = 0;
    end
    self.fireIdx = 0;
    self.interval = 0.3;
  
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
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    self.step = 2    
  elseif Between(self.step, 2, 7) then  --砲擊(硝煙) 砲彈落下 砲彈滾動(塵土)       
    self:BombMove();
    if self:CheckInterval() then      
      idx = 1;
      if self.step == 2 then     --撥放順序
        idx = 5;
      elseif self.step == 3 then 
        idx = 3;
      elseif self.step == 4 then 
        idx = 1;
      elseif self.step == 5 then 
        idx = 4;
      elseif self.step == 6 then 
        idx = 2;
      end
      self:BombShot(idx);

      self.interval = 0.3;
      self.step = self.step + 1;        
    end
  elseif Between(self.step, 8, 12) then --砲彈滾動(塵土)        
    self:BombMove()
    if self:CheckInterval() then      
      for i= 1, 5 do
        if self.bombStep[i] == 3 then         
          idx = 5;
          if i == 1 then 
            idx = 5;
          elseif i == 2 then 
            idx = 6;
          elseif i == 3 then 
            idx = 7;
          elseif i == 4 then 
            idx = 8;
          elseif i == 5 then 
            idx = 9;              
          end
          if FightField.attack[self.humIdx]:CheckLightIsEnd(idx) then            
            self:GetBombPos(i);
            --大爆炸
            FightField.attack[self.humIdx]:SetLight(idx,10104,50,1,10,10, EEffectLightTracer.StandAni,
                                                 self.pos.x+250,self.pos.y+280, 30,false,0,0,0,0.2); --大爆炸                                                 
            for k, v in pairs(self.emyIdxAy) do               
              target = FightField.fightHum[v];
              me:PlaySound(target.colm, target.row);
              me:PlayEffect(target.colm, target.row, ERolePose.Hit,1);    --跳血挨打姿勢
              target.roleController:Hit();
            end

            self.bombStep[i] = self.bombStep[i] + 1;   --炸彈到達定位
            self.step = self.step + 1;
            self.interval = 0.5;
            break;
          end
        end
      end
    end
  elseif self.step == 13 then     
    if self:CheckInterval() then
      self.step = 14;
      self.isLightEnd = true;            
    end          
  end  
end