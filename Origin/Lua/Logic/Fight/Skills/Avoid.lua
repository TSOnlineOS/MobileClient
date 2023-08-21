--閃躲術
Avoid = InheritsFromBaseAttackSkill();

function Avoid:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self.step == 1 then     
    me.roleController:MagicAttack();      
    me.roleController:SetAnimationForceId(me.roleController:GetAnimationId(ERolePose.Magic));
    --風魔法陣
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground,10077,50,1,21,21, EEffectLightTracer.StandAni, me.nowPos.x+5, me.nowPos.y,20, true, 90);     --咒語

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
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
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
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    self.step = 2;          
  elseif self.step == 2 then               
    if self:CheckInterval() then        
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body1,10137,50,1,15,15, EEffectLightTracer.StandAni, target.nowPos.x+5, target.nowPos.y,30,true, 40);      
      self.step = 3;                  
    end
  elseif self.step == 3 then     
    if FightField.attack[self.humIdx]:CheckLightIsEnd(EEffectLightKind.Body1)then 
      me.roleController:SetAnimationForceId(ERolePose.None);
      self.step = 4;
      self.isLightEnd = true;
    end    
  end
end

--狀態顯示
AvoidMe = InheritsFromBaseStatus();

function AvoidMe:Update()  
  if self.step == 1 then
    local fHidx;
    local me = FightField.fightHum[self.humIdx];
       
    --同隊秀被施法圖
    fHidx = 255;

    for k,v in pairs(FightField.fightHum)do
      if v.id == Role.playerId then 
        fHidx = k;
        break;
      end
    end

    if fHidx ~= 255 and me.party_Kind == FightField.fightHum[fHidx].party_Kind then
      me:GetStatus(self.statusKind):SetLightWithOrder(2, EEffectLightDis.Body,10137, 150, 7,11,15, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 30, true, 40);                                                 
    end
    self.step = 2;    
  end
end
