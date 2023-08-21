BoxingOfSun = InheritsFromBaseAttackSkill();

function BoxingOfSun:InitExtraParameters()
  self.isHit = false;
  self.effCount = 3;
  self.attackStep = 0;

end

function BoxingOfSun:Update()
  self:UpdateLogic();
end

function BoxingOfSun:UpdateLogic()  
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    if me.party_Kind == EFightParty.Right then
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10550, 50, 1, 8, 8, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 50, true, 0);
    else
      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10551, 50, 1, 8, 8, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 50, true, 0);
    end 

    me:PlaySound(target.colm, target.row, Attack_Start);
    self.interval = 0.5;
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
    if self:CheckInterval() then 
      local pos = {};
      if me.party_Kind == EFightParty.Left then
        pos.x = FightField.chip[target.colm][target.row].x - 53;
        pos.y = FightField.chip[target.colm][target.row].y - 28;
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10551, 50, 8, 8, 8, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 50, true, 0, pos.x, pos.y, 0.56);
      else
        pos.x = FightField.chip[target.colm][target.row].x + 53;
        pos.y = FightField.chip[target.colm][target.row].y + 28;
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10550, 50, 8, 8, 8, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 50, true, 0, pos.x, pos.y, 0.56);
      end
      FightField.attack[self.humIdx].lights[1]:SetResidual(20, 50, -14);
      me.roleController:SetInBattle(false);
      me.roleController:SetIsMoving(true);
      me:SetWalk(pos.x, pos.y);
      me:SetBeh(EFightBeh.Residual);
      me:SetSpeed(0.56);
      self.step = 3;
    end
  elseif self.step == 3 then           
    if me.arrive then 
      me.roleController:SetIsMoving(false);
      me.roleController:SetInBattle(true);
      me.roleController:SetAnimationForceId(ERolePose.Attack);
      me.roleController:FaceTo(target.nowPos);
      self.attackStep = 1;
      self.step = 4;   
    end
  elseif self.step == 4 then     
    if me.roleController.animationFrame == 0 and self.isHit then
      FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Sky1);
      if self.attackStep == 3 then
        self.step = 5;
        return;
      end

      self.attackStep = self.attackStep + 1;
      self.isHit = false;
      return;
    end

    if me.roleController.animationFrame == 1 and self.isHit == false then
      local pos = {};
      me:PlaySound(target.colm, target.row, Attack_Hit);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, self.effCount);
      for i = 0, 2 do
        pos.x = target.nowPos.x + math.random(50) - 26;
        pos.y = target.nowPos.y + math.random(50) - 1;
        FightField.attack[self.humIdx]:SetLightWithOrder(i * 2 + 1, EEffectLightDis.Sky, 10262, 40 + i * 30, 1, 6, 6, EEffectLightTracer.StandAni, pos.x, pos.y, 50, false, 0);
        FightField.attack[self.humIdx]:SetLightWithOrder(i * 2 + 2, EEffectLightDis.Sky, 10328, 25 + i * 30, 1, 7, 7, EEffectLightTracer.StandAni, pos.x - 5, pos.y - 10, 30, false, 12);
      end
      self.isHit = true;
    end
  elseif self.step == 5 then
    me.roleController:SetIsJumping(true);
    me:SetJump(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y, false);
    me:SetSpeed(0.72);
    self.step = 6;     
  elseif self.step == 6 then 
    self.isLightEnd = true;
    self.step = 7;
  end
end