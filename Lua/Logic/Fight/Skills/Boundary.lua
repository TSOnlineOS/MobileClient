--結界技能&狀態
Boundary = InheritsFromBaseAttackSkill();

function Boundary:Update()
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then   
    me.roleController:MagicAttack();              
    newPos = target:RCtoSpot(target.colm, target.row);
    if target.party_Kind == EFightParty.Left then           
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky4 ,10007, 30, 1,25,25, EEffectLightTracer.Stand, newPos.x, newPos.y, 40, false, 30);
    elseif target.party_Kind == EFightParty.Right then                     
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky4 ,10007, 30, 1,25,25, EEffectLightTracer.Stand, newPos.x + 5, newPos.y, 40, false, 30);            
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
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky4].orderCount== 24 then      
      self.isLightEnd = true;
      self.step = 3;
    end
  end
end

--專武結界
EW_Boundary = InheritsAttack(Boundary);

function EW_Boundary:InitDrawBlack()
  self.needDrawBlack = true;   
end

BoundaryMe = InheritsFromBaseStatus();

function BoundaryMe:Update()  
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then     
    newPos = me:RCtoSpot(me.colm, me.row);
    local status = me:GetStatus(self.statusKind);
    if me.party_Kind == EFightParty.Left then           
      status:SetLight(EEffectLightKind.Body2,10007, 30, 25, 25, 25, EEffectLightTracer.Stand, newPos.x, newPos.y, 40, false, 30);
    elseif me.party_Kind == EFightParty.Right then           
      status:SetLight(EEffectLightKind.Body2,10007, 30, 25, 25, 25, EEffectLightTracer.Stand, newPos.x + 5, newPos.y, 40, false, 30);
    end            
    self.step = 2;      
  end
end