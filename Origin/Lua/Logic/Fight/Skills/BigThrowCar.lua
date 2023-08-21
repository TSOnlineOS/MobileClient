BigThrowCar = InheritsFromBaseAttackSkill();

function BigThrowCar:InitExtraParameters()
  self.detonation = {};  --TLight;
  self.hit = {};         --TLight;
end

function BigThrowCar:ExtraClose()
  for k,v in pairs(self.detonation)do
    v:Stop();
  end

  for k,v in pairs(self.hit)do
    v:Stop();
  end
end

function BigThrowCar:Update()  
  local newPos; 
  local speed;
  local distance;

  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self.step == 1 then     
    newPos = me:GetMagicPos();                --取得施法位置
    me:SetMoment(newPos.x, newPos.y, false);  --瞬移到該位置
    me.roleController:MagicAttack();          --做施法動作  
    self.interval = 0.23;
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
      distance = math.round((me.nowPos - Vector2.New(target.nowPos.x -87, target.nowPos.y)).magnitude );
      if target.party_Kind == EFightParty.Left then          --人物在右        
        speed = distance / 1500;
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10703, 60, 1, 13, 13, EEffectLightTracer.Curve,
                                                     me.nowPos.x, me.nowPos.y, 30, false, 10, target.nowPos.x + 87, target.nowPos.y, speed);        
      else                                            --人物在左        
        speed = distance / 900;
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10704, 60, 1, 12, 12, EEffectLightTracer.Curve, 
                                                     me.nowPos.x, me.nowPos.y, 30, false, 10, target.nowPos.x - 54, target.nowPos.y, speed);
      end
      self.step = 3;
    end
  elseif self.step == 3 then 
    if FightField.attack[self.humIdx].lights[1].isArrive then   --光影已到目的地      
      --取得火焰光影播放位置
      if target.party_Kind == EFightParty.Left then               --人物在右
        newPos = FightField.fightHum[FightField.GetFHumIdx(0, target.row)]:GetAttackPos(EFightSpot.Front, 50);
      else                                                        --人物在左
        newPos = FightField.fightHum[FightField.GetFHumIdx(3, target.row)]:GetAttackPos(EFightSpot.Front, 50);
      end

      for i= 0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        me:PlaySound(target.colm, target.row);
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      end

      --播放火焰光影
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10121, 180, 4, 1, 4, EEffectLightTracer.StandAni, newPos.x, newPos.y, 25, true, 75);
      --播放爆炸光影
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Body, 10466, 100, 6, 6, 6, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 25, true, 25);
      self.step = 4;
    end
  elseif self.step == 4 then     
    if FightField.attack[self.humIdx].lights[1].orderCount == 2 then      
      --取得火焰光影播放位置
      if target.party_Kind == EFightParty.Left then               --人物在右
        newPos = FightField.fightHum[FightField.GetFHumIdx(0, target.row)]:GetAttackPos(EFightSpot.Front, 50)
      else                                                        --人物在左
        newPos = FightField.fightHum[FightField.GetFHumIdx(3, target.row)]:GetAttackPos(EFightSpot.Front, 50);
      end

      --播放火焰光影
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10121, 180, 4, 1, 4, EEffectLightTracer.StandAni, newPos.x, newPos.y, 25, true, 75);
      for i = 0, self.emyNum-1 do       
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        self.detonation[i] = EffectLight.New(10466, 100, 6, 1, 6, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 25, false, 25);
        self.detonation[i]:SetTimeScale(FightField.timeScale);   
        self.detonation[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);      

        self.hit[i] = EffectLight.New(10000, 50, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 255, false, 5 + math.random(0,11));          
        self.hit[i]:SetTimeScale(FightField.timeScale);   
        self.hit[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);      
      end
      self.step = 5;
    end
  elseif self.step == 5 then 
    if FightField.attack[self.humIdx]:CheckLightIsEnd(2) then
      self.step = 6;
      self.isLightEnd = true; 
    end 
  end
end