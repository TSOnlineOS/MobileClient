GravelSeize = InheritsFromBaseAttackSkill();

function GravelSeize:Update()  
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local attack = FightField.attack[self.humIdx];
  if self.step == 1 then     
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    --土魔法陣
    attack:SetLightWithOrder(1, EEffectLightDis.Ground,10080,50,1,21,21, EEffectLightTracer.StandAni, me.nowPos.x+6, me.nowPos.y,20, true, 80);

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
      --人被擊中處理
      me:PlaySound(target.colm, target.row, Attack_Hit);
      attack:SetLightWithOrder(2, EEffectLightDis.Ground, 10547, 30, 1,12, 12,EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 255, false, 80);
      attack:SetLightWithOrder(3, EEffectLightDis.Sky, 10546, 30, 1,12, 12, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 255, false, 50);
      self.step = 3;                  
    end
  elseif self.step == 3 then 
    if attack.lights[3].orderCount == 10 then
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      self.step = 4;
    end
  elseif self.step == 4 then     
    self.isLightEnd = true;
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
end

--狀態顯示
GravelSeizeMe = InheritsFromBaseStatus();

function GravelSeizeMe:ExtraClose()
  FightField.fightHum[self.humIdx].roleController:SetAnimationForceId(ERolePose.None);
  FightField.RestoreFightInfo(self.humIdx, 0);
end

function GravelSeizeMe:Update()
  local newPos = {};
  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then     
    newPos.x = FightField.chip[me.colm][me.row].x;
    newPos.y = FightField.chip[me.colm][me.row].y;
    local status = me:GetStatus(self.statusKind);
    status:SetLight(EEffectLightKind.Ground, 10547, 50, 12,12, 12, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, false, 80);
    status:SetLight(EEffectLightKind.Body1, 10546, 50, 12,12, 12, EEffectLightTracer.Stand, newPos.x, newPos.y, 255, false, 50);    
    me.roleController:SetAnimationForceId(ERolePose.Hit);
    --狀態備份
    FightField.StatusBkUPFightInfo(self.humIdx);
    self.step = 2;                
  end
end