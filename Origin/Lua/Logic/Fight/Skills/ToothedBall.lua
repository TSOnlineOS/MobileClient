ToothedBall = InheritsFromBaseAttackSkill();

function ToothedBall:InitExtraParameters()
  self.carPoint = {};
  self.carPoint[0] = Vector2.zero;
  self.carPoint[1] = Vector2.zero;
end

function ToothedBall:Update()  
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local attack = FightField.attack[self.humIdx];

  if self.step == 1 then     
    newPos = me:GetMagicPos();				--取得人物施法位置
    me:SetMoment(newPos.x, newPos.y, false);--設定施法位置
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    if target.party_Kind == EFightParty.Left then  --人在右邊
      --10447 車子(面向左)
      self.carPoint[0].x = me.nowPos.x+37;--記錄兩部車的發射位置
      self.carPoint[0].y = me.nowPos.y-48;
      self.carPoint[1].x = me.nowPos.x-55;
      self.carPoint[1].y = me.nowPos.y-5;
      --車子直線移動到發射位置(右)
      attack:SetLight(EEffectLightKind.Ground, 10447, 100, 1, 1, 14, EEffectLightTracer.Line, me.nowPos.x+90, me.nowPos.y-20, 255, true, 60, self.carPoint[0].x, self.carPoint[0].y, 0.1);
      --車子直線移動到發射位置(左)
      attack:SetLight(EEffectLightKind.Sky1, 10447, 100, 1, 1, 14, EEffectLightTracer.Line, me.nowPos.x-5, me.nowPos.y+25, 255, true, 60, self.carPoint[1].x, self.carPoint[1].y, 0.1);        
    else        
      self.carPoint[0].x = me.nowPos.x+60;--記錄兩部車的發射位置
      self.carPoint[0].y = me.nowPos.y-40;
      self.carPoint[1].x = me.nowPos.x-30;
      self.carPoint[1].y = me.nowPos.y;
      --車子直線移動到發射位置(左)
      attack:SetLight(EEffectLightKind.Ground, 10448, 100, 1, 1, 14, EEffectLightTracer.Line, me.nowPos.x+15, me.nowPos.y-70, 255, true, 60, self.carPoint[0].x, self.carPoint[0].y, 0.1);
      --車子直線移動到發射位置(右)
      attack:SetLight(EEffectLightKind.Sky1, 10448, 100, 1, 1, 14, EEffectLightTracer.Line, me.nowPos.x-70, me.nowPos.y-30, 255, true, 60, self.carPoint[1].x, self.carPoint[1].y, 0.1);
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
      --local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then --發射動作      
    if attack.lights[EEffectLightKind.Sky1].isArrive then        
      me:PlaySound(target.colm, target.row, Attack_Start);   --播發招音效 92/8/22-1F
      if target.party_Kind == EFightParty.Left then  --人在右邊          
        attack:SetLight(EEffectLightKind.Ground, 10447, 80, 1, 14, 14, EEffectLightTracer.Stand, self.carPoint[0].x, self.carPoint[0].y, 255, false, 60);
        attack:SetLight(EEffectLightKind.Sky1, 10447, 80, 1, 14, 14, EEffectLightTracer.Stand, self.carPoint[1].x, self.carPoint[1].y, 255, false, 60);          
      else      
        attack:SetLight(EEffectLightKind.Ground, 10448, 80, 1, 14, 14, EEffectLightTracer.Stand, self.carPoint[0].x, self.carPoint[0].y, 255, false, 60);
        attack:SetLight(EEffectLightKind.Sky1, 10448, 80, 1, 14, 14, EEffectLightTracer.Stand, self.carPoint[1].x, self.carPoint[1].y, 255, false, 60);
      end
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
  elseif self.step == 3 then --砲彈飛出動作      
    if (attack.lights[EEffectLightKind.Ground].orderCount == 10) or (attack.lights[EEffectLightKind.Sky1].orderCount == 10) then        
      if target.party_Kind == EFightParty.Left then  --人在右邊
        --10445 砲彈(飛向左)
        newPos = target:GetAttackPos(EFightSpot.Left,60);--設定砲彈落點
        if target.colm == 1 then--打前排時
        --修正砲彈落點(使砲彈落在兩排[前後排]的中間)
          newPos.x = newPos.x - 50;
          newPos.y = newPos.y - 50;
        end
        attack:SetLight(EEffectLightKind.Sky2, 10445, 100, 1, 7, 7, EEffectLightTracer.Curve, self.carPoint[0].x-80, self.carPoint[0].y-100,255, false, 60, newPos.x, newPos.y,0.2);
        newPos = target:GetAttackPos(EFightSpot.Right,60);
        if target.colm == 1 then--打前排時
          newPos.x = newPos.x - 50;
          newPos.y = newPos.y - 50;
        end
        attack:SetLight(EEffectLightKind.Sky3, 10445, 100, 1, 7, 7, EEffectLightTracer.Curve, self.carPoint[1].x-80, self.carPoint[1].y-100,255, false,  60, newPos.x, newPos.y,0.2);      		
      else
        --10446 砲彈(飛向右)
        newPos = target:GetAttackPos(EFightSpot.Right,60);--設定砲彈落點
        if target.colm == 2 then--打前排時
          --修正砲彈落點(使砲彈落在兩排[前後排]的中間)
          newPos.x = newPos.x + 60;
          newPos.y = newPos.y + 60;
        end
        attack:SetLight(EEffectLightKind.Sky2, 10446, 100, 1, 7, 7, EEffectLightTracer.Curve, me.nowPos.x+105, me.nowPos.y-15, 255, false, 0, newPos.x-60 ,newPos.y,0.2);
        newPos = target:GetAttackPos(EFightSpot.Left,60);--設定砲彈落點
        if target.colm == 2 then--打前排時
          --修正砲彈落點(使砲彈落在兩排[前後排]的中間)
          newPos.x = newPos.x + 60;
          newPos.y = newPos.y + 60;
        end
        attack:SetLight(EEffectLightKind.Sky3, 10446, 100, 1, 7, 7, EEffectLightTracer.Curve, me.nowPos.x+40, me.nowPos.y+40, 255, false, 0, newPos.x-60 ,newPos.y,0.2);
      end
      self.step = 4;             
    end
  elseif self.step == 4 then --煙    	
    if attack.lights[EEffectLightKind.Sky2].isArrive or attack.lights[EEffectLightKind.Sky3].isArrive then        
      for i = 0, self.emyNum-1 do          
        target = FightField.fightHum[ self.emyIdxAy[i] ];            
        attack:SetLightWithOrder(10 + i, EEffectLightDis.Body, 10016, 30, 1, 15, 15, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, false, 55);        
        me:PlaySound(target.colm, target.row, Attack_Hit);
      end
      self.step = 5;
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
  elseif self.step == 5 then --爆炸+地裂    
    if attack.lights[10].orderCount == 3 then        
      local lightIdx = 10 + self.emyNum;
      for i = 0, self.emyNum-1 do          
        target = FightField.fightHum[ self.emyIdxAy[i] ];        
        attack:SetLightWithOrder(lightIdx + i, EEffectLightDis.Body, 10435, math.random(0,150)+50, 1, 5, 5, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 40, true, math.random(0,50)+50);
        attack:SetLightWithOrder(lightIdx + i + 1, EEffectLightDis.Body, 10010, 50, 1, 4, 4, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 255, false, 50);
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      end

      self.interval = 0.2;  --地震時間
      FightField.SetShake(true);
      self.step = 6;        
    end
  elseif self.step == 6 then --地震停止    	
    if self:CheckInterval() then        
      FightField.SetShake(false);          
      self.interval = 0.8;--等爆炸結束
      self.step = 7;                  
    end
  elseif self.step == 7 then --施法結束      
    if self:CheckInterval() then        
      self.isLightEnd = true;      
      self.step = 8;
    end
  end
end