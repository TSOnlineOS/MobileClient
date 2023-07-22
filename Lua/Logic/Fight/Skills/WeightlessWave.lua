WeightlessWave = InheritsFromBaseAttackSkill();

function WeightlessWave:ExtraClose()
  FightField.CloseDrawBlack();
end

function WeightlessWave:Update()  
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local attack = FightField.attack[self.humIdx];

  if self.step == 1 then     
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    --030601J土魔法陣
    attack:SetLight(EEffectLightKind.Ground,10080,50,1,21,21, EEffectLightTracer.StandAni, me.nowPos.x+6, me.nowPos.y,20, false, 80);
    attack:SetLight(EEffectLightKind.Sky1,10363,80,5,9,9,EEffectLightTracer.StandAni,me.nowPos.x, me.nowPos.y, 20,false, 110);
    attack:SetLight(EEffectLightKind.Sky2,10147,80,1,1,1,EEffectLightTracer.Stand,me.nowPos.x, me.nowPos.y, 20,false, 80);
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
    if attack:CheckLightIsEnd(EEffectLightKind.Sky1) then        
      attack:SetLight(EEffectLightKind.Sky1, 10063,30,1, 2, 2, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y-30 ,255, true, 10, target.nowPos.x ,target.nowPos.y-10 ,0.45);
      attack:SetLight(EEffectLightKind.Sky2, 10364,30,1,10,10, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y    ,30,  true, 10, target.nowPos.x ,target.nowPos.y    ,0.45);
      attack:SetLight(EEffectLightKind.Sky3, 10016,30,3,15,15, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y    ,30, false, 30, target.nowPos.x ,target.nowPos.y    ,0.40);
      attack:SetLight(EEffectLightKind.Sky4, 10016,30,3,10,15, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y    ,30, false, 30, target.nowPos.x ,target.nowPos.y    ,0.35);
      attack:SetLight(EEffectLightKind.Status,10016,30,6,15,15,EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y    ,30, false, 30, target.nowPos.x ,target.nowPos.y    ,0.30);
      self.step = 3;        
    end
  elseif self.step == 3 then 
    if attack.lights[EEffectLightKind.Sky2].isArrive then        
      target.roleController:SetAnimationForceId(ERolePose.Hit);  --改變姿勢
      FightField.SetDrawBlack(0,200,50);  --畫黑夜
      attack:SetLight(EEffectLightKind.Sky1,10363,80,1,9,9, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 20,false, 110);
      self.step = 4;                  
    end
  elseif self.step == 4 then       
    if attack:CheckLightIsEnd(EEffectLightKind.Sky1) then        
      attack:SetLight(EEffectLightKind.Sky4, 10439, 60,1, 8, 8 ,EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 20, false, 40);  --爆光影
      attack:SetLight(EEffectLightKind.Sky1, 10090, 60,10,1,12, EEffectLightTracer.StandAni,target.nowPos.x, target.nowPos.y, 20, false, 60);  --石頭
      attack:SetLight(EEffectLightKind.Body2,10008, 60,1,15,15, EEffectLightTracer.Stand,target.nowPos.x, target.nowPos.y, 20, false, 40);  --爆光影
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      me:PlaySound(target.colm, target.row, Attack_Start);  --音效
      FightField.SetShake(true);
      self.interval = 0.8;
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
      target.roleController:SetAnimationForceId(ERolePose.None);      
      FightField.SetShake(false);     --地震效果
      FightField.CloseDrawBlack();
      self.step = 6;
      self.isLightEnd = true;          
    end    
  end
end