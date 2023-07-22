--狀態顯示
PassiveSkill = InheritsFromBaseStatus();

function PassiveSkill:Update()  
  if self.step == 1 then    
    local me = FightField.fightHum[self.humIdx];
    local lightId = 0;
    local skillKind = self.showKind;
    if skillKind == ESkill_Kind.EW_Int then
      lightId = 10995;
    elseif skillKind == ESkill_Kind.EW_Atk then
      lightId = 10996;
    elseif Contains(skillKind,ESkill_Kind.EW_Def, ESkill_Kind.EW_BaguaDex) then
      lightId = 10997;
    elseif skillKind == ESkill_Kind.EW_Hpx then
      lightId = 10998;
    elseif skillKind == ESkill_Kind.EW_Spx then
      lightId = 10999;
    elseif skillKind == ESkill_Kind.EW_Dex then
      lightId = 11000;
    elseif skillKind == ESkill_Kind.EW_StrikeRate then
      lightId = 11001;
    elseif skillKind == ESkill_Kind.EW_Earth then
      lightId = 11002;
    elseif skillKind == ESkill_Kind.EW_Water then
      lightId = 11003;
    elseif skillKind == ESkill_Kind.EW_Fire then
      lightId = 11004;
    elseif skillKind == ESkill_Kind.EW_Wind then
      lightId = 11005;
    elseif Contains(skillKind, ESkill_Kind.EW_MirrorIngore, ESkill_Kind.EW_SpecifyStatusIngore) then
      lightId = 12051;
    elseif skillKind == ESkill_Kind.DodgeDead then 
      lightId = 20001;
    elseif skillKind == ESkill_Kind.EW_Counter then 
      lightId = 20014;
    elseif skillKind == ESkill_Kind.EW_CounterTrance then
      lightId = 20055;
    end
    me:SetStatusKind(EFightStatusKind.Passive, skillKind);
    me:GetStatus(EFightStatusKind.Passive):SetLightWithOrder(1, EEffectLightDis.Body, lightId, 100, 1, 12, 12, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 30, true, 30);    
    me:GetStatus(EFightStatusKind.Passive).lights[1]:SetSize(128, 128);
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
  end
end

CommonStatus = InheritsFromBaseStatus();

function CommonStatus:ExtraClose()
  local me = FightField.fightHum[self.humIdx];
  if me ~= nil then 
    me.roleController:SetStatusShow(self.statusKind, false);
  end
end

function CommonStatus:Update()  
  if self.step == 1 then    
    local me = FightField.fightHum[self.humIdx];
    if me ~= nil then       
      me.roleController:SetStatusShow(self.statusKind, true);
      local status =  me:GetStatus(self.statusKind);
      if self.showKind == ESkill_Kind.EWCommonFaint then 
        status:SetLightWithOrder(1, EEffectLightDis.Body, 11007, 120, 1, 12, 12, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y + 25, 255, false);
        status.lights[1]:SetSize(128,128);
      else
        status:SetLightWithOrder(1, EEffectLightDis.Body, 11006, 90, 1, 8, 8, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y + 25, 30, false);
        status.lights[1]:SetSize(128,128);
      end
    end
    self.step = 2;    
  end
end