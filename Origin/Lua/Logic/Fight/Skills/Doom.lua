Doom = InheritsFromBaseAttackSkill();

function Doom:InitExtraParameters()
  self.isShowWhenCasting = false;
end

function Doom:Update()
  local newPos;
  local colmPos;

  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then     
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    --030601J土魔法陣
    local magicPic = self:GetMagicPic();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground,magicPic,50,1,21,21,EEffectLightTracer.StandAni, me.nowPos.x+6, me.nowPos.y,20, true, 80);

    self.interval = 0.8;
    if self.isShowWhenCasting then
      self.step = 2;
    else
      self.step = 3;
    end

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
      self:ShowWhenCasting();
      self.interval = 0.5;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then      
      me:PlaySound(target.colm, target.row);   

      for i=0, self.emyNum-1 do        
        target = FightField.fightHum[self.emyIdxAy[i]];
        target.roleController:Hit();
        target.roleController:SetAnimationForceId(ERolePose.Hit);
      end

      if target.party_Kind == EFightParty.Left then  --人在左
        colmPos = 1
      else
        colmPos = 2;
      end

      local rockPic = self:GetRockPic();
      --巨石
      newPos = target:RCtoSpot(colmPos,0, EFightSpot.Front ,10);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky,rockPic,150,4,4,4, EEffectLightTracer.Line, newPos.x, newPos.y-150,255, false, 50, newPos.x, newPos.y, 1);
      --巨石
      newPos = target:RCtoSpot(colmPos,2, EFightSpot.Back, 40);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky,rockPic,150,4,4,4, EEffectLightTracer.Line, newPos.x, newPos.y-150,255, false, 50, newPos.x, newPos.y, 1);
      --巨石
      newPos = target:RCtoSpot(colmPos,4, EFightSpot.Front, 30);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Sky,rockPic,150,4,4,4, EEffectLightTracer.Line, newPos.x, newPos.y-150,255, false, 50, newPos.x, newPos.y, 1);
      
      self.step = 4;
    end
  elseif self.step == 4 then
    if FightField.attack[self.humIdx].lights[2].isArrive then        
      if target.party_Kind == EFightParty.Left then  --人在左
        colmPos = 1
      else
        colmPos = 2;
      end

      local gravelPic = self:GetGravelPic();
      newPos = target:RCtoSpot(colmPos,0, EFightSpot.Front,10);      
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky,gravelPic,150,8,15,15, EEffectLightTracer.StandAni, newPos.x, newPos.y,255, false, 50);

      newPos = target:RCtoSpot(colmPos,2, EFightSpot.Back,40);
      FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky,gravelPic,150,8,15,15, EEffectLightTracer.StandAni, newPos.x, newPos.y,255, false, 50);

      newPos = target:RCtoSpot(colmPos,4, EFightSpot.Front,30);
      FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky,gravelPic,150,8,15,15, EEffectLightTracer.StandAni, newPos.x, newPos.y,255, false, 50);

      if target.party_Kind == EFightParty.Left then  --人在左
        colmPos = 0
      else
        colmPos = 3;
      end

      local fissurePic = self:GetFissurePic();
      --地裂
      newPos = target:RCtoSpot(colmPos,1, EFightSpot.Front,90);
      FightField.attack[self.humIdx]:SetLightWithOrder(8, EEffectLightDis.Ground,fissurePic,150,1,10,10, EEffectLightTracer.Stand, newPos.x, newPos.y,254, false, 80);
      --地裂
      newPos = target:RCtoSpot(colmPos,3, EFightSpot.Front,80);
      FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Ground,fissurePic,150,1,10,10, EEffectLightTracer.Stand, newPos.x, newPos.y,254, false, 80);

      FightField.SetShake(true);

      self.interval = 0.5;
      self.step = 5;
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
    if self:CheckInterval() then      
      FightField.SetShake(false);

      self.interval = 1;
      self.step = 6;
    end
  elseif self.step == 6 then
    if self:CheckInterval() then        
      if target.party_Kind == EFightParty.Left then  --人在左
        colmPos = 0;
      else
        colmPos = 3;
      end

      local magmaPic = self:GetMagmaPic();
      --炎漿
      newPos = target:RCtoSpot(colmPos,1, EFightSpot.Front,90);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky,magmaPic,150,1,4,4,EEffectLightTracer.StandAni, newPos.x, newPos.y,20, true, 60);     --咒語
      --炎漿
      newPos = target:RCtoSpot(colmPos,3, EFightSpot.Front,80);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky,magmaPic,150,1,4,4,EEffectLightTracer.StandAni, newPos.x, newPos.y,20, true, 60);     --咒語

      for i=0, self.emyNum-1 do          
        target = FightField.fightHum[self.emyIdxAy[i]];
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);  --挨打姿勢
        target.roleController:Hit();
        target:SetSpeed(0.16);

        --030613J固態化不做跳移的動作,旋風status時取得方向不對=>會當機            
        if not target:IsInSealStatus() then                  
          if Contains(target.colm, 0, 3) then
            newPos = target:GetSpot(EFightSpot.Back, 60);
          elseif Contains(target.colm, 1, 2) then
            newPos = target:GetSpot(EFightSpot.Front, 60);
          end
          target:SetJump(newPos.x,newPos.y,true);
        end
      end

      self.interval = 0.5;
      self.step = 7;
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
  elseif self.step == 7 then
    if self:CheckInterval() then        
      for i=0, self.emyNum-1 do          
        target = FightField.fightHum[self.emyIdxAy[i]];
        target.roleController:SetIsDead(true);
      end

      self.interval = 0.7;
      self.step = 8;
    end
  elseif self.step == 8 then
    if self:CheckInterval() then
        self.step = 9;
        self.isLightEnd = true;
    end
  end
end

function Doom:ShowWhenCasting()

end

function Doom:GetMagicPic()
  if self.showKind == ESkill_Kind.StarDoom then
    return 11069;
  else
    return 10080; --土魔法陣
  end
end

function Doom:GetRockPic()
  if self.showKind == ESkill_Kind.StarDoom then
    return 11070;
  else
    return 10057;
  end
end

function Doom:GetGravelPic()
  if self.showKind == ESkill_Kind.StarDoom then
    return 11071;
  else
    return 10008;
  end
end

function Doom:GetFissurePic()
  if self.showKind == ESkill_Kind.StarDoom then
    return 11072;
  else
    return 10103;
  end
end

function Doom:GetMagmaPic()
  if self.showKind == ESkill_Kind.StarDoom then
    return 11073;
  else
    return 10121;
  end
end

EW_Doom = InheritsAttack(Doom);

function EW_Doom:InitExtraParameters()
  self.isShowWhenCasting = true;
end

function EW_Doom:ShowWhenCasting()
  FightField.attack[self.humIdx]:SetLightWithOrder(10, EEffectLightDis.Sky, 10772, 100, 6, 1, 6, EEffectLightTracer.Stand, 50, -60, 30, false, 90);
end