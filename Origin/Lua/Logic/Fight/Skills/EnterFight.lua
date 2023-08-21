EnterFight = InheritsFromBaseAttackSkill();

function EnterFight:InitExtraParameters()
  if FightField.fightHum[self.humIdx].roleController:GetAttribute(EAttribute.Hp) == 0 then
    FightField.fightHum[self.humIdx].roleController:SetIsDead(true);
  end
end

function EnterFight:Free()
  if FightField.fightHum[self.humIdx] ~= nil and FightField.fightHum[self.humIdx].roleController ~= nil then 
    FightField.fightHum[self.humIdx].roleController:SetIsJumping(false);
  end
  FightField.RestoreFightInfo(self.humIdx);  
  if self.humIdx == FightField.conIdx then 
    FightField.ShowControlMan()
  end
end

function EnterFight:Update()  
  local me = FightField.fightHum[self.humIdx];
  local newPos;

  if self.step == 1 then           
    newPos = me:GetSpotOfRc(EFightSpot.Back, 80);
    me:SetMoment(newPos.x, newPos.y, false);

    newPos = me:GetChipPos();
    me:SetSpeed(0.12);
    

    if not(Contains(me.kind, EHuman.None, EHuman.Players))then            
      if Contains(me.roleController.npcId,
        37016,37022,                    --堅木欄,神箭塔
        37001,37007,37008,37009) then        --固定不會動的瞬移進來
        me:SetMoment(newPos.x, newPos.y, false);
      elseif Contains(me.roleController.npcId,
        37017,37018,37019,37020,37021,  --強弓井闌,牛頭衝車,精鋼刀車,連弩車,投石巨車
        37002,37003,37004,37005,37006) then  --有輪車的走進來
        me:SetWalk(newPos.x, newPos.y, false);
      else                
        me.roleController:SetIsJumping(true);
        me:SetJump(newPos.x, newPos.y);              
      end            
    else            
      me.roleController:SetIsJumping(true);
      me:SetJump(newPos.x, newPos.y);  
    end

    --玩家是參戰或觀戰的話,除了玩家用跳的進來,其它人就定位,這樣看見的狀態才會正常
    if Contains(Role.player.war, EWar.Guest, EWar.Join)then        
      if Contains(me.kind, EHuman.Player, EHuman.Players) then          
        if me.id ~= Role.playerId then
          me:SetMoment(newPos.x, newPos.y, false);
        end
      else
        me:SetMoment(newPos.x, newPos.y, false);
      end
    end
    self.step = self.step + 1;
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
    if me.arrive then
      me.roleController:SetIsJumping(false);
      self.step = self.step + 1;
      self.isLightEnd = true;
    end
  end
end