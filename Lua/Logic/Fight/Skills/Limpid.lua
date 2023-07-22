--隱身
Limpid = InheritsFromBaseAttackSkill();

function Limpid:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self.step == 1 then     
    me.roleController:MagicAttack();
    --風魔法陣
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground,10077,50,1,21,21, EEffectLightTracer.StandAni, me.nowPos.x+5, me.nowPos.y,20, true, 90);     --咒語

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
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1,10003, 50,1,25,25, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y,20, true, 20);
      --不加挨姿
      self.step = 3;                
    end                                    
  elseif self.step == 3 then       
    if FightField.attack[self.humIdx]:CheckLightIsEnd(EEffectLightKind.Sky1) then          
      self.isLightEnd = true;
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
end

EW_Limpid = InheritsAttack(Limpid);

function EW_Limpid:InitDrawBlack()
  self.needDrawBlack = true;   
end

LimpidMe = InheritsFromBaseStatus();

function LimpidMe:ExtraClose()
  FightField.fightHum[self.humIdx]:SetTransparent(false);
end

function LimpidMe:Update()
  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then        
    me:SetTransparent(true);
    me:GetStatus(self.statusKind):SetLight(EEffectLightKind.Sky1,10003, 50,1,25,25, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y,20, true, 20);                         
    self.step = 2;        
  elseif self.step == 2 then       
    if me:GetStatus(self.statusKind):CheckLightIsEnd(EEffectLightKind.Sky1) then
      me:GetStatus(self.statusKind):StopLight(Light_Sky1);                            
      self.step = 3;
    end
  end
end