ECastchStyle = 
{
  NetSuccess = 1,
  NetFail = 2,
  HandFail = 3,
};

Catch = InheritsFromBaseAttackSkill();

function Catch:InitExtraParameters()  
  self.isHit = false;
end

function Catch:ExtraClose()
  local target = FightField.fightHum[self.tarIdx];
  if self.showKind == ECastchStyle.NetSuccess then
    if target ~= nil then 
      if FightField.scoutVisible then 
        FightField.CloseScoutInfoSingle(target);
      end    
      FightField.FreeFightHum(target.index);
    end
  end
end


function Catch:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = target:GetSpotOfRc(EFightSpot.Front, 70);
    me.roleController:SetInBattle(false);
    me.roleController:SetIsMoving(true);
    me:SetSpeed(0.52);
    me:SetWalk(newPos.x, newPos.y);
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
    
    self.step = self.step + 1;
  elseif self.step == 2 then
    if me.arrive then
      self.step = self.step + 1;
      me.roleController:SetIsMoving(false);
      me.roleController:SetInBattle(true);
      me.roleController:OneHandAttack();      
    end
  elseif self.step == 3 then
    if (me.roleController.animationFrame == 0) and self.isHit then
      self.step = self.step + 1;
      me.roleController:SetInBattle(false);
      me.roleController:SetIsMoving(true);
      me:SetSpeed(0.12);
      me:SetWalk(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y, true);
      
      local newPos = me:GetSpotOfRc(EFightSpot.Front, 70);
      target.roleController:SetIsDead(true);
      target:SetSpeed(0.12);
      target:SetWalk(newPos.x, newPos.y);

      local bodyStyle = 0
      if target.data ~= nil then 
        bodyStyle = target.data.bodyStyle;
      end
      local deltaX, deltaY = target:GetCatchDeltaXY(bodyStyle);
      local focusFrame;
      if self.showKind == ECastchStyle.NetSuccess then
        focusFrame = 3;
      else
        focusFrame = target.GetCatchStep(bodyStyle);
      end      
      target.roleController:SetAnimationForceFrame(focusFrame);
      FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Sky1);

      target.whirelStart = false;
      target.beh_Kind = EFightBeh.None;
      local centerPos = Vector2.New(target.nowPos.x, target.nowPos.y);
      if Contains(self.showKind, ECastchStyle.NetFail, ECastchStyle.NetSuccess) then
        if me.party_Kind == EFightParty.Right then
          FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1 ,10038, 40, 1, 1, 1, EEffectLightTracer.Line, centerPos.x + deltaX, centerPos.y + deltaY, 255, false, 40, newPos.x + 25, newPos.y, 0.12);
        else
          FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1 ,10039, 40, 1, 1, 1, EEffectLightTracer.Line, centerPos.x, centerPos.y, 255, false, 20, newPos.x, newPos.y, 0.12);
        end
      end
    end

    if (me.roleController.animationFrame == 1)  and self.isHit == false then
      target:PlaySound();
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      local ry = math.random(50);
      local centerPos = Vector2.New(me.nowPos.x, me.nowPos.y);
      FightField.attack[self.humIdx]:SetLight(1 ,10000, 40, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y + ry, 255, false, 0);  
      self.isHit = true;
    end
  elseif self.step == 4 then
    if me.arrive and target.arrive then
      if self.showKind == ECastchStyle.NetSuccess then
        target.roleController:SetVisible(ERoleVisible.Hide);        
      else
        FightField.RestoreFightInfo(self.humIdx);
        target.roleController:SetAnimationForceFrame(255);
        target.roleController:SetIsDead(false);
        target.roleController:SetInBattle(false);
        target.roleController:SetIsMoving(true);
        target:SetWalk(FightField.chip[target.colm][target.row].x, FightField.chip[target.colm][target.row].y, true);
        target:SetSpeed(0.52);
        me.roleController:SetDirection(me:GetDirection());
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
      end
      self.step = self.step + 1;
    end
  elseif self.step == 5 then
    if self.showKind == ECastchStyle.NetSuccess then
      self.step = self.step + 1;
    elseif target.arrive then
      target.roleController:SetDirection(target:GetDirection());
      target.roleController:SetInBattle(true);
      target.roleController:SetIsMoving(false);
      self.step = self.step + 1;
    end
  elseif self.step == 6 then
    self.isLightEnd = true;
  end
end