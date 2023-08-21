BlazeSword = InheritsFromBaseAttackSkill();

function BlazeSword:SetSword()
  local SlopeLeft = 0.592920;
  local SlopeRight = 0.568627;
  local SwordDist = 300;        --劍在上空的距離

  local sinSita, cosSita;     --Width斜率的Sin和Cos
  local fixed = {};
  local target = FightField.fightHum[self.tarIdx];

  if target.party_Kind == EFightParty.Left then     
    sinSita = 1/ math.sqrt(math.pow(SlopeLeft, 2)+1);
    cosSita = SlopeLeft / math.sqrt(math.pow(SlopeLeft, 2)+1);
    fixed.x = target.nowPos.x + math.round(SwordDist * sinSita);
    fixed.y = target.nowPos.y - math.round(SwordDist * cosSita);
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Shoot, 10050, 50, 1, 6, 6, EEffectLightTracer.Line, fixed.x + 58, fixed.y, 25, true, 40, target.nowPos.x + 58, target.nowPos.y);
  elseif target.party_Kind == EFightParty.Right then       
    sinSita = 1/ math.sqrt(math.pow(SlopeRight, 2)+1);
    cosSita = SlopeRight / math.sqrt(math.pow(SlopeRight, 2)+1);
    fixed.x = target.nowPos.x - math.round(SwordDist * sinSita);
    fixed.y = target.nowPos.y - math.round(SwordDist * cosSita);
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Shoot, 10051, 50, 1, 6, 6, EEffectLightTracer.Line, fixed.x - 40, fixed.y, 25, true, 40, target.nowPos.x - 40, target.nowPos.y);
  end
end

function BlazeSword:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
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
    self:SetSword();
    self.step = 2;
  elseif self.step == 2 then
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Shoot].isArrive then
      me:PlaySound(target.colm, target.row);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      self.interval = 0.1;
      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      self.isLightEnd = true;
      self.step = 4;
    end
  end
end