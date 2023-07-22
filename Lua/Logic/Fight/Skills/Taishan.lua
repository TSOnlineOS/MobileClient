--泰山壓頂
Taishan = InheritsFromBaseAttackSkill();

function Taishan:ExtraClose()  
  if FightField.fightHum[self.tarIdx] ~= nil then 
    FightField.fightHum[self.tarIdx]:SetSquelch(MaxSquelch);
  end
end

function Taishan:IsDown()  
  local pressDist;   --壓下的距離
  local pressRate;   --壓下的比率
  
  local target = FightField.fightHum[self.tarIdx];

  pressDist = FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].showPos.y - (target.nowPos.y - target.roleController.height);
  if pressDist<0 then
    return false;
  end

  pressRate = math.round(( pressDist / target.roleController.height)*10);


  if pressRate > MaxSquelch then
    pressRate = MaxSquelch;
  end

  target:SetSquelch(MaxSquelch-pressRate);

  if target.squelch == 0 then
    return true;
  end
  return false;
end

function Taishan:Update()  
  local newPos;

  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self.step == 1 then     
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    --030601J土魔法陣
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground,10080,50,1,21,21,EEffectLightTracer.StandAni, me.nowPos.x+6, me.nowPos.y,20, true, 80);

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
      --local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    self.step = 2;
  elseif self.step == 2 then       
    if self:CheckInterval() then        
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1,10015, 100, 1,1,1, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y-200, 
                                                                                                  255, false, 0, target.nowPos.x, target.nowPos.y+20, 0.30);
      self.step = 3;                  
    end
  elseif self.step == 3 then         
    if self:IsDown() then      
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1,10015, 100, 1,1,1, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y+6, 255, false, 0);

      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10016, 25, 1,15, 15, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 50,false, 50);
      me:PlaySound(target.colm, target.row);   
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);

      self.step = 4;
    end
  elseif self.step == 4 then       
    if FightField.attack[self.humIdx]:CheckLightIsEnd(EEffectLightKind.Sky2) then        
      FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Sky1);
      FightField.RestoreFightInfo(self.humIdx);
      FightField.RestoreFightInfo(self.tarIdx);
      self.interval = 0.1;
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
  elseif self.step == 5 then     
    if self:CheckInterval() then        
      target:SetSquelch(target.squelch + 1);
      if target.squelch==MaxSquelch then
        self.isLightEnd = true;
        self.step = 6;
      end
    end
  end
end