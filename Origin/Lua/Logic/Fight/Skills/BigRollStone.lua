BigRollStone = InheritsFromBaseAttackSkill();

function BigRollStone:InitExtraParameters()
  self.smokeList = {};
  self.lastPos = Vector2.zero;  --煙最後記的位罝,初使值為玩家的位置
end

function BigRollStone:ExtraClose()
  for k, v in pairs(self.smokeList)do
    v:Stop();
  end
end

function BigRollStone:UpdateSmoke()
  local light;
  local dist;

  if FightField.attack[self.humIdx]:CheckLightIsEnd(EEffectLightKind.Shoot) then
    return
  end

  for k, v in pairs(self.smokeList)do
    if v.picId == 0 then 
      v:Stop();
      table.remove(self.smokeList, k);
    end
  end

  local shootLight = FightField.attack[self.humIdx].lights[EEffectLightKind.Shoot];
  dist = math.round((shootLight.showPos - self.lastPos).magnitude);

  if dist>=30 then    
    self.lastPos =  Vector2.New(shootLight.x, shootLight.y);
    light = EffectLight.New(10016, 30, 1, 15, 15, EEffectLightTracer.StandAni,
                    self.lastPos.x, self.lastPos.y-120, 30, false, 50);
    light:SetTimeScale(FightField.timeScale);   
    light:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
    table.insert(self.smokeList, light);
  end
end

function BigRollStone:Update()  
  local newPos1, newPos2;  
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  self:UpdateSmoke();
  if self.step == 1 then     

    self.interval = 0.8;
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
    self.step = 2;              
  elseif self.step == 2 then       
    if self:CheckInterval() then 
      self.step = 3;          
    end
  elseif self.step == 3 then         
    me.roleController:FaceTo(target.nowPos);

    me.roleController:MagicAttack();
    newPos1 = Vector2.zero;
    newPos2 = Vector2.zero;
    newPos1.x = FightField.chip[0][2].x;        --左側
    newPos1.y = FightField.chip[0][2].y;        --左側
    newPos2.x = FightField.chip[2][2].x;        --右側
    newPos2.y = FightField.chip[2][2].y;        --右側

    FightField.SetShake(true);      

    if target.party_Kind == EFightParty.Left then
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Shoot, 10723, 50, 1, 4, 4, EEffectLightTracer.Line, newPos2.x, newPos2.y+200, 255, true, 0, newPos1.x, newPos1.y+200, 0.52);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10016, 30, 1, 15, 15, EEffectLightTracer.Line, newPos2.x, newPos2.y, 0, false, 50, newPos1.x, newPos1.y, 0.52);          
    else          
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Shoot, 10724, 50, 1, 4, 4, EEffectLightTracer.Line, newPos1.x, newPos1.y+200, 255, true, 0, newPos2.x, newPos2.y+200, 0.52);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10016, 30, 1, 15, 15, EEffectLightTracer.Line, newPos1.x, newPos1.y, 0, false, 50, newPos2.x, newPos2.y, 0.52);
    end
    self.step = 4;              
  elseif self.step == 4 then       
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].isArrive then                
      me:PlaySound(target.colm, target.row);   

      for k,v in pairs(self.emyIdxAy)do          
        target = FightField.fightHum[v];
        me:PlaySound(target.colm, target.row);   
        me:PlayEffect(target.colm, target.row, ERolePose.Hit,1);    --跳血挨打姿勢
        target.roleController:Hit();
      end          
      self.step = 5;  
    end
  elseif self.step == 5 then     
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Shoot].isArrive then        
      FightField.SetShake(false);
      self.step = 6;
      self.isLightEnd = true;
    end
  end
end