RollStone = InheritsFromBaseAttackSkill();

function RollStone:InitExtraParameters()
  self.smokeList = {}; --list
  self.lastPos = FightField.fightHum[self.humIdx].nowPos;   --煙最後記的位罝,初使值為玩家的位置
end

function RollStone:ExtraClose()  
  ClearLightTable(self.smokeList);  
end

function RollStone:UpdateSmoke()  
  local light;

  local shootlight = FightField.attack[self.humIdx].lights[EEffectLightKind.Shoot];
  if shootlight == nil or shootlight.picID == 0 then
    return;
  end

  for i = #self.smokeList, 0 do 
    if self.smokeList[i] ~= nil then 
      if self.smokeList[i].picID == 0 then 
        table.remove(self.smokeList, i);
      end
    end
  end

  local dist = (shootlight.showPos - self.lastPos).magnitude;
                       
  if dist >= 30 then
    self.lastPos = Vector2.New(shootlight.showPos.x, shootlight.showPos.y);             
    light = EffectLight.New(10016, 30, 1, 15, 15, EEffectLightTracer.StandAni, self.lastPos.x, self.lastPos.y, 30, false, 50);
    light:SetTimeScale(FightField.timeScale);
    light:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
    table.insert(self.smokeList, light);
  end
end

function RollStone:Update()  
  local newPos1, newPos2;

  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  self:UpdateSmoke();
  if self.step == 1 then     
    self.lastPos = me:GetChipPos();
    newPos1 = me:GetMagicPos();
    me:SetMoment(newPos1.x, newPos1.y, false);

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
      self.step = 3;
    end
  elseif self.step == 3 then       
    if me.arrive then        
      me.roleController:FaceTo(target.nowPos);
      me.roleController:MagicAttack();
      newPos1 = me:GetSpot(EFightSpot.Front, 10);          
      newPos2 = target:GetSpot(EFightSpot.Back,100);
      FightField.SetShake(true);

      if target.party_Kind == EFightParty.Left then          
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Shoot, 10057, 50, 1, 4, 4, EEffectLightTracer.Line, newPos1.x, newPos1.y, 255, true, 0, newPos2.x, newPos2.y, 0.52);        
      else      
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Shoot, 10058, 50, 1, 4, 4, EEffectLightTracer.Line, newPos1.x, newPos1.y, 255, true, 0, newPos2.x, newPos2.y, 0.52);        
      end
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10016, 30, 1, 15, 15, EEffectLightTracer.Line, newPos1.x, newPos1.y, 0, false, 50, target.nowPos.x, target.nowPos.y, 0.52);          
      self.step = 4;        
    end
  elseif self.step == 4 then     
    if  FightField.attack[self.humIdx]:CheckLightIsEnd(EEffectLightKind.Sky1) then       
      me:PlaySound(target.colm, target.row);   
      for k, v in pairs(self.emyIdxAy)do
        FightField.fightHum[v]:PlayEffect(target.colm, target.row,  ERolePose.Hit);
      end
      self.step = 5 ;
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
  elseif self.step == 5 then             
    if FightField.attack[self.humIdx]:CheckLightIsEnd(EEffectLightKind.Shoot) then        
      FightField.SetShake(false);
      self.step = 6;        
      self.isLightEnd = true;
    end
  end
end