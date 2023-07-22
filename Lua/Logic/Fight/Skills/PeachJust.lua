PeachJust = InheritsFromBaseAttackSkill();

function PeachJust:InitExtraParameters()
  self.whoAmI = 0;   --0:關羽 1:劉備 2:張飛
  self.hitLight = {};
  self.emyHit = {};

  local me = FightField.fightHum[self.humIdx];
  --判斷現在的光影是誰的
  if Contains(me.id, 41050,45198, 45295) then     --0:關羽                     
    self.whoAmI = 0;
  elseif Contains(me.id, 41053,45130, 45277) then    --1:劉備    
    self.whoAmI = 1;
  elseif Contains(me.id, 41049,45159, 45307) then    --2:張飛
    self.whoAmI = 2;
  end

  for i = 1, 9 do 
    self.emyHit[i] = false;
  end    
end

function PeachJust:ExtraClose()
  ClearLightTable(self.hitLight);  
end

function PeachJust:BloodAndHit()  
  local newPos;
  local i,y;
  local target;
  local me = FightField.fightHum[self.humIdx];
  
  for j=0, self.emyNum-1 do  
    y = 0;
    for z=0, self.emyNum-1 do                --計算現在多少光影在播    
      target = FightField.fightHum[ self.emyIdxAy[z] ];

      if target ~= nil then        
        if self.hitLight[z] ~= nil and  self.hitLight[z].picId == 10778 and self.hitLight[z].orderCount ~= 9 then      
          y = y +1;
        end
      
        if self.hitLight[z] ~= nil and  self.hitLight[z].picId == 10778 and self.hitLight[z].orderCount > 7 then            
          target.roleController:SetInBattle(false);        
        end

        if self.hitLight[z] ~= nil and  self.hitLight[z].picId == 10000 and self.hitLight[z].orderCount ~= 3 then      
          y = y +1;
        end

        if self.hitLight[z] ~= nil and  self.hitLight[z].picId == 10000 and self.hitLight[z].orderCount >2 then      
          target.roleController:SetInBattle(false);   
        end

        if target.arrive == true and        --被打，移動位置
          not target:IsInSealStatus() then       
          target:SetSpeed(0.05);
          newPos = target:GetSpot(math.random(0, 4)+1, math.random(0, 3)+5);
          target:SetWalk(newPos.x, newPos.y, true);
        end
      end
    end

    if y > 5 then                         --若被打噴血光影超過5個就先不增加光影
      break;
    end

    for z= 0, 20 do    
      i = math.random(0, self.emyNum - 1);


      local skip = false;
      if self.hitLight[i] ~= nil and self.hitLight[i].picId ~= 0 then      --若本身光影還未播完，先不播
        if ((self.hitLight[i].picId ~= 10778) or  (self.hitLight[i].orderCount ~= 9)) then
          if ((self.hitLight[i].picID ~= 10000) or (self.hitLight[i].orderCount ~= 3)) then
            skip = true;
          end
        end
      end

      if skip == false then 
        target = FightField.fightHum[ self.emyIdxAy[i] ];

        if target.roleController.animationTrigger == EAnimationTrigger.Hit then
          skip = true;
        end

        if skip == false then 
          y = math.random(0,4)+2;
          me:PlaySound(target.colm, target.row, Attack_Hit, y);   --砍殺聲
          me:PlayEffect(target.colm, target.row, ERolePose.Hit);  --跳血

          y = math.random(1,8);
          if Contains(y, 1, 8) then       --噴血 右    
            self.hitLight[i] = EffectLight.New(10778, 50, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x+60, target.nowPos.y-math.random(0,16), 30, false, 0);            
            self.hitLight[i].isMirror = false;
          elseif Contains(y, 2, 7) then   --噴血 左            
            self.hitLight[i] = EffectLight.New(10778, 50, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x-60, target.nowPos.y-math.random(0,20), 30, false, 0);            
            self.hitLight[i].isMirror = true;
          else                            --打擊光影            
            me:PlaySound(target.colm, target.row, Attack_Hit, 2);   --刺下去的音效
            self.hitLight[i] = EffectLight.New(10000, 200, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x-20+ math.random(0, 40), target.nowPos.y-20+ math.random(0,40), 255, false, 0);            
            self.hitLight[i].isMirror = false;
          end
          self.hitLight[i]:SetTimeScale(FightField.timeScale);              
          self.hitLight[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);   
          break;
        end
      end
    end
  end
end

function PeachJust:Update()  
  local newPos;
  local tempPos;
  local colmPos;
  
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local attack = FightField.attack[self.humIdx];  

  if self.step == 1 then --桃園結義        
  --桃園結義
    FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky,10710,30,1,42,42, EEffectLightTracer.Stand, 0, 0,255, false);
    me:PlaySound(target.colm, target.row, Attack_Start);  
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
  elseif self.step == 2 then   --生死與共    
    if FightField.attack[self.humIdx].lights[5].orderCount >= 41 then        
      FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky,10711,30,1,27,27, EEffectLightTracer.Stand, 0, 100,255, false);      
      self.step = 3;
    end                                             
  elseif self.step == 3 then    --三人跳至施法位置      
    if FightField.attack[self.humIdx].lights[6].orderCount ~= 26 then
      return;
    end

    self.interval = 0.8;

    tempPos = Vector2.New(1,1);
    newPos = Vector2.zero;
    if me.party_Kind == EFightParty.Right then          --計算劉關張的施法位置      
      newPos.x = -67;
      newPos.y = -35;
      tempPos.x = 2;                  
    elseif me.party_Kind == EFightParty.Left then         
      newPos.x = 67;
      newPos.y = 35;
      tempPos.x = 1;                  
    end
        
    if target.party_Kind == EFightParty.Left then      
      if self.whoAmI == 0 then --關羽          
        tempPos.y = 3;
      elseif self.whoAmI == 1 then  --劉備
        tempPos.y = 2;            
      elseif self.whoAmI == 2 then  --張飛
        tempPos.y = 1;          
      end      
    else
      if self.whoAmI == 0 then --關羽          
        tempPos.y = 1;
      elseif self.whoAmI == 1 then  --劉備
        tempPos.y = 2;            
      elseif self.whoAmI == 2 then  --張飛
        tempPos.y = 3;          
      end      
    end

    newPos.x  = newPos.x + FightField.chip[tempPos.x][tempPos.y].x;
    newPos.y = newPos.y + FightField.chip[tempPos.x][tempPos.y].y;

    me:SetMoment(newPos.x, newPos.y, false);     --瞬至施法位置施法動作
    me.roleController:MagicAttack();    
    --靈光初現
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky,10778,50,1,7,7, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y-25,50, true);
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
  elseif self.step == 4 then  --施法動作 武器旋轉             
    me:PlaySound(target.colm, target.row, Attack_Hit, 1);   --武器旋轉聲

    if attack.lights[1].orderCount > 4 then              
      if self.whoAmI == 0 then     --關羽
      --偃月刀(突然出現然後旋轉慢慢消失)
        attack:SetLightWithOrder(2, EEffectLightDis.Sky,10780,80,1,8,8, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y-25,255, true);          
      elseif self.whoAmI == 1 then     --劉備
        --雙股劍(突然出現然後旋轉慢慢消失)
        attack:SetLightWithOrder(2, EEffectLightDis.Sky,10779,80,1,8,8, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y-25,255, true);

        if me.party_Kind == EFightParty.Left then  --人在左    --黃光旋渦
          attack:SetLightWithOrder(3, EEffectLightDis.Ground,10343,80,1,17,17, EEffectLightTracer.StandAni, me.nowPos.x-18, me.nowPos.y+85,50, true)
        else
          attack:SetLightWithOrder(3, EEffectLightDis.Ground,10343,80,1,17,17, EEffectLightTracer.StandAni, me.nowPos.x+18, me.nowPos.y+85,50, true);
        end
      elseif self.whoAmI == 2 then  --張飛          
        --蛇茅(倒著播)漸漸出現旋轉
        attack:SetLightWithOrder(2, EEffectLightDis.Sky,10781,80,1,8,8, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y-25,255, true);
      end          
        
      if me.party_Kind == EFightParty.Left then  --人在左        
        attack.lights[2].isMirror = true;
        attack.lights[3].isMirror = true;
      end
      self.step = 5;
    end
  elseif self.step == 5 then        
    if not self:CheckInterval() then
      return;
    end

    attack.lights[5]:Stop();
    attack.lights[6]:Stop();      
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
      local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 6 then  --施法動作 敵人頭上 武將旋轉      
    if FightField.attack[self.humIdx].lights[2].orderCount >= 7 then      
      me:PlaySound(target.colm, target.row, Attack_Hit, 1);   --武器旋轉聲

      if target.party_Kind == EFightParty.Left then  --人在左
        colmPos = 0
        attack.lights[2].isMirror = true;
      else
        colmPos = 3;
        attack.lights[2].isMirror = false;
      end          

      if self.whoAmI == 0 then --關羽                    
        if target.party_Kind == EFightParty.Left then            
          newPos = target:RCtoSpot(colmPos, 4,  EFightSpot.Right, 10);
          newPos.x = newPos.x + 30;            
        else        
          newPos = target:RCtoSpot(colmPos, 0,  EFightSpot.Left, 10);
          newPos.x = newPos.x - 80;            
        end
        --偃月刀                                                 
        attack:SetLightWithOrder(2, EEffectLightDis.Sky,10780,80,8,1,8, EEffectLightTracer.StandAni, newPos.x, newPos.y-25,255, true);          
      elseif self.whoAmI == 1 then --劉備
        --雙股劍
        newPos = target:RCtoSpot(colmPos, 2, EFightSpot.Front,10);
        attack:SetLightWithOrder(2, EEffectLightDis.Sky,10779,80,8,1,8, EEffectLightTracer.StandAni, newPos.x, newPos.y-25,255, true);
      elseif self.whoAmI == 2 then --張飛                    
        --蛇茅
        if target.party_Kind == EFightParty.Left then
          newPos = target:RCtoSpot(colmPos, 0, EFightSpot.Left, 10)
        else
          newPos = target:RCtoSpot(colmPos, 4, EFightSpot.Right, 10);
        end
              
        attack:SetLightWithOrder(2, EEffectLightDis.Sky,10781,80,8,1,8, EEffectLightTracer.StandAni, newPos.x, newPos.y-25,255, true);          
      end

      self.step = 7;
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
  elseif self.step == 7 then  --武器一閃    
    if attack.lights[2].orderCount == 8 then      
      newPos = Vector2.New(attack.lights[2].showPos.x, attack.lights[2].showPos.y);       
      
      if self.whoAmI == 0 then
          me:PlaySound(target.colm, target.row, Attack_Hit, 8);   --一閃
      end

      if self.whoAmI == 0 then  --關羽                           偃月刀(停止)，一閃          
        attack:SetLightWithOrder(4, EEffectLightDis.Sky,10780,560,1,1,8, EEffectLightTracer.StandAni, newPos.x, newPos.y,255, true);
        attack:SetLightWithOrder(3, EEffectLightDis.Sky,10174,80,1,7,12, EEffectLightTracer.StandAni, newPos.x, newPos.y+180,50, true);          
      elseif self.whoAmI == 1 then  --劉備                          雙股劍(停止)，一閃          
        attack:SetLightWithOrder(4, EEffectLightDis.Sky,10779,560,1,1,8, EEffectLightTracer.StandAni, newPos.x, newPos.y,255, true);
        attack:SetLightWithOrder(3, EEffectLightDis.Sky,10174,80,2,8,12, EEffectLightTracer.StandAni, newPos.x, newPos.y+180,50, true);
      elseif self.whoAmI == 2 then  --張飛                          蛇茅(停止)，一閃          
        attack:SetLightWithOrder(4, EEffectLightDis.Sky,10781,560,1,1,8, EEffectLightTracer.StandAni, newPos.x, newPos.y,255, true);
        attack:SetLightWithOrder(3, EEffectLightDis.Sky,10174,80,3,9,12, EEffectLightTracer.StandAni, newPos.x, newPos.y+180,50, true);          
      end

      if target.party_Kind == EFightParty.Left then  --人在左
        attack.lights[4].isMirror = true;
      else
        attack.lights[4].isMirror = false;
      end

      self.interval = 0.5;
      self.step = 8;      
    end
  elseif self.step == 8 then   --武器攻擊
    if self:CheckInterval() then      
      if target.party_Kind == EFightParty.Left then  --人在左        
        newPos = Vector2.New(attack.lights[4].showPos.x, attack.lights[4].showPos.y + 60);                           
      else
        newPos = Vector2.New(attack.lights[4].showPos.x, attack.lights[4].showPos.y + 30);                           
      end
          
      attack.lights[4].isMirror = false;
        
      if target.party_Kind == EFightParty.Left then  --人在左        
        if self.whoAmI == 0 then  --關羽
          --偃月刀 攻擊
          attack:SetLightWithOrder(4, EEffectLightDis.Sky,10784,80,1,19,19, EEffectLightTracer.Stand, newPos.x+20, newPos.y,30, false);            
        elseif self.whoAmI == 1 then   --劉備                         //雙股劍 攻擊
          attack:SetLightWithOrder(4, EEffectLightDis.Sky,10782,80,1,19,19, EEffectLightTracer.Stand, newPos.x+50, newPos.y,30, false);
        elseif self.whoAmI == 2 then   --張飛                         //蛇茅   攻擊
          attack:SetLightWithOrder(4, EEffectLightDis.Sky,10786,80,1,19,19, EEffectLightTracer.Stand, newPos.x+20, newPos.y+40,30, false);
        end        
      else
        if self.whoAmI == 0 then  --關羽
          --偃月刀 攻擊
          attack:SetLightWithOrder(4, EEffectLightDis.Sky,10785,80,1,19,19, EEffectLightTracer.Stand, newPos.x, newPos.y +50,30, false);            
        elseif self.whoAmI == 1 then   --劉備                         //雙股劍 攻擊
          attack:SetLightWithOrder(4, EEffectLightDis.Sky,10783,80,1,19,19, EEffectLightTracer.Stand, newPos.x-50, newPos.y,30, false);
        elseif self.whoAmI == 2 then   --張飛                         //蛇茅   攻擊
          attack:SetLightWithOrder(4, EEffectLightDis.Sky,10787,80,1,19,19, EEffectLightTracer.Stand, newPos.x, newPos.y,30, false);
        end  
      end                                                                                               

      self.interval = 0.5;
      self.step = 9;
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
  elseif self.step == 9 then --爆炸
    if self:CheckInterval() then
      if self.whoAmI == 0 then
        self:BloodAndHit();
      end
    end

    if attack.lights[4].orderCount == 17 then      
      FightField.SetShake(true);

      if self.whoAmI == 0 then
        me:PlaySound(target.colm, target.row, Attack_Hit, 7);   --爆炸聲
      end

      newPos = Vector2.zero;
      if target.party_Kind == EFightParty.Left then
        newPos.x = attack.lights[4].showPos.x;
      else
        newPos.x = attack.lights[4].showPos.x - 50;
      end          
      newPos.y = attack.lights[4].showPos.y+50;

      --爆炸
      if self.whoAmI == 0 then    --關羽                                
        if target.party_Kind == EFightParty.Left then
          attack:SetLightWithOrder(5, EEffectLightDis.Sky,10104,80,3,8,10, EEffectLightTracer.StandAni, newPos.x-30, newPos.y-30,50, true)
        else
          attack:SetLightWithOrder(5, EEffectLightDis.Sky,10104,80,3,8,10, EEffectLightTracer.StandAni, newPos.x+80, newPos.y-80,50, true);
        end
      elseif self.whoAmI == 1 then  --劉備
        if target.party_Kind == EFightParty.Left then
          attack:SetLightWithOrder(5, EEffectLightDis.Sky,10292,80,7,12,12, EEffectLightTracer.StandAni, newPos.x-70, newPos.y+20,50, true)
        else
          attack:SetLightWithOrder(5, EEffectLightDis.Sky,10292,80,7,12,12, EEffectLightTracer.StandAni, newPos.x+50, newPos.y,50, true);
        end
      elseif self.whoAmI == 2 then  --張飛          
        if target.party_Kind == EFightParty.Left then
          attack:SetLightWithOrder(5, EEffectLightDis.Sky,10530,80,12,17,20, EEffectLightTracer.StandAni, newPos.x-50, newPos.y,50, true)
        else
          attack:SetLightWithOrder(5, EEffectLightDis.Sky,10530,80,12,17,20, EEffectLightTracer.StandAni, newPos.x-20, newPos.y,50, true);
        end
      end

      if self.whoAmI == 0 then                      --爆炸後，人物被震飛
        for i=0, self.emyNum-1 do        
          target = FightField.fightHum[ self.emyIdxAy[i] ];
          target:SetSpeed(0.16);
          if not target:IsInSealStatus() then                
            if Contains(target.colm, 0,3) then
              newPos = target:GetSpot(EFightSpot.Back, 60)
            elseif Contains(target.colm, 1, 2)then
              newPos = target:GetSpot(EFightSpot.Front, 60);
            end

            target:SetJump(newPos.x, newPos.y, true);
          end
          target.roleController:SetIsDead(true);
        end
      end
      self.interval = 1;
      self.step = 10;
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
  elseif self.step == 10 then   
    if self:CheckInterval() then      
      FightField.SetShake(false);
      self.step = 11;
      self.isLightEnd = true;      
    end    
  end
end