Mirror = InheritsFromBaseAttackSkill();

function Mirror:Update()  
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then             
    me.roleController:MagicAttack();
    --030601J土魔法陣
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground,10080,50,1,21,21, EEffectLightTracer.StandAni, me.nowPos.x+6, me.nowPos.y,20, true, 80);

    self.interval = 0.8;        
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
  elseif self.step == 2 then       
    if self:CheckInterval() then        
      local effectLightDis = nil;
      if target.party_Kind == EFightParty.Right then
        newPos = target:RCtoSpot(target.colm, target.row);
        newPos = Vector2.New(newPos.x-20, newPos.y + 35);          
        effectLightDis = EEffectLightDis.Ground;
      else
        newPos = target:RCtoSpot(target.colm, target.row);
        newPos = Vector2.New(newPos.x+15, newPos.y + 55);                
        effectLightDis = EEffectLightDis.Body;
      end
      FightField.attack[self.humIdx]:SetLightWithOrder(2, effectLightDis,10142,100,1,5,5, EEffectLightTracer.StandAni, newPos.x, newPos.y,255, true, 0);          
      self.step =3;                 
    end
  elseif self.step == 3 then     
    if FightField.attack[self.humIdx]:CheckLightIsEnd(2) then  
      self.step = 4;    
      self.isLightEnd = true; --特技施展完畢
    end
  end
end

--狀態
MirrorMe = InheritsFromBaseStatus();

function MirrorMe:Update()  
  local newPos;
  local fHidx;
  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then     
    --同隊才看的見
    fHidx = 255;
    fHidx = FightField.GetPlayerIdx();    
    
    if fHidx == -1  then 
      return;
    end

    if FightField.fightHum[fHidx].party_Kind == me.party_Kind then 
      if me.party_Kind == EFightParty.Right then        
        newPos = me:RCtoSpot(me.colm, me.row);
        newPos = Vector2.New(newPos.x-20, newPos.y+35);
        me:GetStatus(self.statusKind):SetLightWithOrder(1, EEffectLightDis.Ground,10142,100,5,5,5, EEffectLightTracer.Stand, newPos.x, newPos.y,255, false, 0);         
        me:GetStatus(self.statusKind).lights[1]:SetSortingOrder(FightField.FIGHT_GROUND_ORDER - 36)      
      else        
        newPos = me:RCtoSpot(me.colm, me.row);
        newPos = Vector2.New(newPos.x + 15, newPos.y + 55);
        me:GetStatus(self.statusKind):SetLightWithOrder(2,EEffectLightDis.Sky,10142,100,5,5,5, EEffectLightTracer.Stand, newPos.x, newPos.y,255, false, 0);
        me:GetStatus(self.statusKind).lights[2]:SetSortingOrder(FightField.FIGHT_BODY_ORDER + 185)      
      end
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
      local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  end
end

--反彈傷害
MirrorAtk = InheritsFromBaseAttackSkill();

function MirrorAtk:Update()
  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then     
    me:PlayEffect(me.colm, me.row, ERolePose.Hit); --人被擊中處理
    self.interval = 0.1;
    self.step = 2;
  elseif self.step == 2 then               
    if self:CheckInterval() then      
      self.step = 3;
      self.isLightEnd = true;              
     end    
  end
end

--解鏡
DisMirror = InheritsFromBaseAttackSkill();

function DisMirror:Update()  
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then     
    me.roleController:MagicAttack();
    --030601J土魔法陣
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground,10080,50,1,21,21, EEffectLightTracer.StandAni, me.nowPos.x+6, me.nowPos.y,20, true, 80);
    self.interval = 0.8;
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
    self.step = 2;              
  elseif self.step == 2 then       
    if self:CheckInterval() then        
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky,10131,80,1,14,14, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y,30, true, 60);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky,10045,80,14,26,26, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y,30, true, 35);
      self.step = 3;                  
    end
  elseif self.step == 3 then     
    if FightField.attack[self.humIdx]:CheckLightIsEnd(2) then 
      self.step = 4;
      self.isLightEnd = true;   
    end
  end
end

Mirror2 = InheritsFromBaseAttackSkill();

function Mirror2:Update()  
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then             
    me.roleController:MagicAttack();
    --030601J土魔法陣
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground,10080,50,1,21,21, EEffectLightTracer.StandAni, me.nowPos.x+6, me.nowPos.y,20, true, 80);
    self.interval = 0.8;
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
    self.step = 2;      
  elseif self.step == 2 then       
    if self:CheckInterval() then     
      for k, v in pairs(self.emyIdxAy)do 
        target = FightField.fightHum[v];
        local lightDis = nil;
        if target.party_Kind == EFightParty.Right then
          newPos = target:RCtoSpot(target.colm, target.row);
          newPos = Vector2.New(newPos.x-20, newPos.y + 35);                    
          lightDis = EEffectLightDis.Ground;
        else
          newPos = target:RCtoSpot(target.colm, target.row);
          newPos = Vector2.New(newPos.x+15, newPos.y + 55);                
          lightDis = EEffectLightDis.Body;
        end      
        FightField.attack[self.humIdx]:SetLightWithOrder(2 + k, lightDis,10142,100,1,5,5, EEffectLightTracer.StandAni, newPos.x, newPos.y,255, true, 0);          
      end
      self.step =3;                 
    end
  elseif self.step == 3 then     
    if FightField.attack[self.humIdx]:CheckLightIsEnd(2) then  
      self.step = 4;    
      self.isLightEnd = true; --特技施展完畢
    end
  end
end

--專武鏡
EW_Mirror = InheritsAttack(Mirror);

function EW_Mirror:InitDrawBlack()
  self.needDrawBlack = true;   
end