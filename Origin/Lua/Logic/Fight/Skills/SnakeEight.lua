SnakeEight = InheritsFromBaseAttackSkill();

function SnakeEight:InitExtraParameters()
  self.lastPos = Vector2.zero;
  self.fireList = {};     --突刺時 地上冒火的光影List
  self.hit = {};   --被打 煙塵 光影
end

function SnakeEight:ExtraClose()
  if FightField.fightHum[self.humIdx] ~= nil and FightField.fightHum[self.humIdx].roleController ~= nil then 
    FightField.fightHum[self.humIdx].roleController:SetVisible(ERoleVisible.Visible);
  end
  ClearLightTable(self.fireList);
  ClearLightTable(self.hit);
end

function SnakeEight:UpdateFireList() 
  local dist;

  for k,v in pairs(self.fireList)do
    if v == nil or v.picId == 0 then 
      table.remove(self.fireList, k);
    end
  end

  if self.step == 3 then 
    local attack = FightField.attack[self.humIdx];
    dist = math.round((attack.lights[EEffectLightKind.Body1].showPos - self.lastPos).magnitude);   

    if dist >= 50 then   
      if FightField.fightHum[self.humIdx].party_Kind == EFightParty.Right then      
        self.lastPos.x = attack.lights[EEffectLightKind.Body1].showPos.x+50;
        self.lastPos.y = attack.lights[EEffectLightKind.Body1].showPos.y;      
      else
        self.lastPos.x = attack.lights[EEffectLightKind.Body1].showPos.x;
        self.lastPos.y = attack.lights[EEffectLightKind.Body1].showPos.y - 40;              
      end

      local light = EffectLight.New(10350, 30, 1, 12, 12, EEffectLightTracer.StandAni, self.lastPos.x, self.lastPos.y, 30, false, 100);
      light:SetTimeScale(FightField.timeScale);              
      light:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER); 
      table.insert(self.fireList, light);
    end
  end
end

function SnakeEight:Update()
  local newPos = Vector2.zero;
  local objPos = Vector2.zero;
   
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.emyIdxAy[0]];        --EmyIdxAry[0] 在前排的敵人
  local attack = FightField.attack[self.humIdx];
  self:UpdateFireList();
  if self.step == 1 then  --身上冒火    
    me.roleController:SetInBattle(false);
    me.roleController:FaceTo(me:GetSpot(EFightSpot.Front, 10));
    
    attack:SetLightWithOrder(2, EEffectLightDis.Body,10092,150,1,5,10, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 20, true, 10);
    me:PlaySound(target.colm, target.row, Attack_Start);  --播 "阿"的音效
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
  elseif self.step == 2 then --衝到敵人面前    
    if attack.lights[2].orderCount == 5 then                  
      me.roleController:SetVisible(ERoleVisible.Hide);
      newPos = target:GetAttackPos(EFightSpot.Front, 30);
      me:SetSpeed(0.7);
      me:SetWalk(newPos.x, newPos.y);
      me:PlaySound(target.colm, target.row, Attack_Hit, 1);

      if me.party_Kind == EFightParty.Right then
        --衝鋒的動作
        --人物
        attack:SetLightWithOrder(1, EEffectLightDis.Body, 10767, 50, 1, 1, 7, EEffectLightTracer.Line, me.nowPos.x-20, me.nowPos.y, 255, false, 48, newPos.x, newPos.y-14,0.7);
        --身上火焰
        attack:SetLightWithOrder(2, EEffectLightDis.Body, 10768, 50, 1, 1, 7, EEffectLightTracer.Line, me.nowPos.x-20, me.nowPos.y, 20,  false, 48, newPos.x, newPos.y-14,0.7);        
      else
        --人物
        attack:SetLightWithOrder(1, EEffectLightDis.Body, 10769, 50, 1, 1, 7, EEffectLightTracer.Line, me.nowPos.x+20, me.nowPos.y, 255, false, 75, newPos.x, newPos.y,0.7);
        --身上火焰
        attack:SetLightWithOrder(2, EEffectLightDis.Body, 10770, 50, 1, 1, 7, EEffectLightTracer.Line, me.nowPos.x+20, me.nowPos.y, 20,  false, 75, newPos.x, newPos.y,0.7);
      end
      self.step = 3;      
    end      
  elseif self.step == 3 then  --換成出丈八 刺向敵人的動作
    if attack.lights[2].isArrive then      
      me:PlaySound(target.colm, target.row, Attack_Hit, 2);   --刺下去的音效
      newPos = target:GetAttackPos(EFightSpot.Front, 30);

      if me.party_Kind == EFightParty.Right then        
        --人物
        attack:SetLightWithOrder(1, EEffectLightDis.Body, 10767, 200, 2, 2, 7, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, false, 32);
        --身上火焰
        attack:SetLightWithOrder(2, EEffectLightDis.Body, 10768, 200, 2, 2, 7, EEffectLightTracer.Stand, newPos.x, newPos.y, 25,  false, 32);        
      else      
        --人物
        attack:SetLightWithOrder(1, EEffectLightDis.Body, 10769, 200, 2, 2, 7, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, false, 75);
        --身上火焰
        attack:SetLightWithOrder(2, EEffectLightDis.Body, 10770, 200, 2, 2, 7, EEffectLightTracer.Stand, newPos.x, newPos.y, 25,  false, 75);        
      end

      for i = 0, self.emyNum-1 do        
      --敵人被打光影
        target = FightField.fightHum[self.emyIdxAy[i]];
        self.hit[i] = EffectLight.New(10697, 50, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 255, false, 30);
        self.hit[i]:SetTimeScale(FightField.timeScale);              
        self.hit[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);                       

        me:PlayEffect(target.colm, target.row, ERolePose.Hit,2);  --跳血
      end

      self.interval = 0.5;
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
        --local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  elseif self.step == 4 then --刺下去的音效    
    if self:CheckInterval() then      
      newPos = target:GetAttackPos(EFightSpot.Front, 30);
      if me.party_Kind == EFightParty.Right then        
        --人物
        attack:SetLightWithOrder(1, EEffectLightDis.Body, 10767, 200, 2, 6, 7, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, false, 32);
        --身上火焰
        attack:SetLightWithOrder(2, EEffectLightDis.Body, 10768, 200, 2, 6, 7, EEffectLightTracer.Stand, newPos.x, newPos.y, 25,  false, 32);        
      else
        --人物
        attack:SetLightWithOrder(1, EEffectLightDis.Body, 10769, 200, 2, 6, 7, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, false, 75);
        --身上火焰
        attack:SetLightWithOrder(2, EEffectLightDis.Body, 10770, 200, 2, 6, 7, EEffectLightTracer.Stand, newPos.x, newPos.y, 25,  false, 75);        
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
  elseif self.step == 5 then  --挑起敵人
    if attack.lights[1].orderCount >= 1 then       
      for i=0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];                  
        target.roleController:Hit();
        target.roleController:SetAnimationForceId(ERolePose.Hit);
        target:SetSpeed(0.2);

        --固態化不做跳移的動作,旋風status時取得方向不對=>會當機
        if not target:IsInSealStatus() then              
          target:SetWalk(target.nowPos.x, target.nowPos.y- 50 ,false);
        end        
      end
      me:PlaySound(target.colm, target.row, Attack_Hit, 3);  --挑起敵人的火焰聲
      self.step = 6;
    end
  elseif self.step == 6 then --敵人落下
    if attack.lights[1].orderCount >= 3 then      
      for i=0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        target.roleController:Hit();
        target.roleController:SetAnimationForceId(ERolePose.Hit);
        target:SetSpeed(0.2);

        --固態化不做跳移的動作,旋風status時取得方向不對=>會當機
        if not target:IsInSealStatus() then          
          target:SetWalk(target.nowPos.x, target.nowPos.y+ 50 ,false);
        end
      end
      self.step = 7 ;
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

  elseif self.step == 7 then  --再刺  蛇出來
    if attack.lights[1].orderCount == 4 then      
      me:PlaySound(target.colm, target.row, Attack_Hit, 4);  --蛇出來的音效

      newPos = target:GetAttackPos(EFightSpot.Front, 30);
      objPos = target:GetAttackPos(EFightSpot.Back, 100);
      if me.party_Kind == EFightParty.Right then --換成出丈八 刺向敵人的動作        
        --人物
        attack:SetLightWithOrder(1, EEffectLightDis.Body, 10767, 250, 6, 7, 7, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, false, 32);
        --身上火焰
        attack:SetLightWithOrder(2, EEffectLightDis.Body, 10768, 250, 6, 7, 7, EEffectLightTracer.StandAni, newPos.x, newPos.y, 20,  false, 32);
        --蛇
        attack:SetLightWithOrder(3, EEffectLightDis.Body, 10765, 130, 1, 4, 4, EEffectLightTracer.Line, newPos.x+40, newPos.y, 255,  false, 82, objPos.x+40, objPos.y,0.16);        
      else
        --人物
        attack:SetLightWithOrder(1, EEffectLightDis.Body, 10769, 150, 6, 7, 7, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, false, 75);
        --身上火焰
        attack:SetLightWithOrder(2, EEffectLightDis.Body, 10770, 150, 6, 7, 7, EEffectLightTracer.StandAni, newPos.x, newPos.y, 20,  false, 75);
        --蛇
        attack:SetLightWithOrder(3, EEffectLightDis.Body, 10766, 130, 1, 4, 4, EEffectLightTracer.Line, newPos.x-40, newPos.y, 255,  false, 75, objPos.x-40, objPos.y,0.16);     
      end

      for i= 0, self.emyNum-1 do        
        target = FightField.fightHum[self.emyIdxAy[i]];
        --敵人被打的光影
        self.hit[i] = EffectLight.New(10697,50, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 255, false, 30);                              
        self.hit[i]:SetTimeScale(FightField.timeScale);              
        self.hit[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER); 
          
        --敵人被打的煙塵
        self.hit[i+2] = EffectLight.New(10020, 50, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20, false, 60); 
        self.hit[i+2]:SetTimeScale(FightField.timeScale);              
        self.hit[i+2]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER); 

        me:PlayEffect(target.colm, target.row, ERolePose.Hit, 2);   --跳血
      end
      self.step = 8;
    end
  elseif  self.step == 8 then --招式結束 跳回原地    
    if attack.lights[3].orderCount == 3 then  
      me.roleController:SetVisible(ERoleVisible.Visible); 
      me.roleController:SetIsJumping(true);
      me:SetSpeed(0.5);
      me:SetJump(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y,false);
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
        --local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  elseif self.step == 9 then 
    if me.arrive then      
      me.roleController:SetIsJumping(false);
      self.step = 10;
      self.isLightEnd = true;
    end    
  end
end
