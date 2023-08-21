BestHit = InheritsFromBaseAttackSkill();

function BestHit:InitExtraParameters()
  self.isHit = false;
  self.tempShrink = FightField.fightHum[self.humIdx].shrink;
end

function BestHit:ExtraClose()
  local me = FightField.fightHum[self.humIdx];
  if me ~= nil then 
    me.roleController:SetIsJumping(false);
    me:SetBeh(EFightBeh.None);
    me:SetShrink(self.tempShrink);
    me.roleController.transform.localScale = Vector3.New(me.shrink / 10, me.shrink / 10, 1);
  end
end

function BestHit:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = target:GetSpot(EFightSpot.Front, 50);
    me:SetJump(newPos.x, newPos.y);
    me.roleController:SetIsJumping(true);
    me:SetSpeed(0.52);
    me:SetBeh(EFightBeh.Residual);

    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, "Shadow2", 50, 1, 1, 1, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 255, true, 40, newPos.x, newPos.y, 0.52);
    FightField.attack[self.humIdx].lights[1]:SetResidual(5, 50, 0);
  
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
    if me.arrive then
      me.roleController:SetIsJumping(false);
      me.roleController:OneHandAttack();
     self.step = 3;
    end
    self:GoShrink();    --人物縮放效果;
  elseif self.step == 3 then
    if me.roleController.animationFrame == 0 and self.isHit then
      local newPos = {};
      newPos.x = FightField.chip[me.colm][me.row].x;
      newPos.y = FightField.chip[me.colm][me.row].y;
      me.roleController:SetIsJumping(true);
      target.roleController:SetInBattle(true);
      FightField.attack[self.humIdx]:StopLight(2);

      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, "Shadow2", 50, 1, 1, 1, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 255, false, 40, newPos.x, newPos.y, 0.52);
      FightField.attack[self.humIdx].lights[1]:SetResidual(5, 50, 0);
      self.step = 4;
      return;
    end

    if me.roleController.animationFrame == 1 and self.isHit == false then
      self.isHit = true;
      me:PlaySound(target.colm, target.row);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky, 10000, 40, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y + math.random(50) - 1, 255, false, 0);
    end
  elseif self.step == 4 then
    self:BackShrink();
    if me.arrive then
      self.isLightEnd =true;
      self.step = 5;
    end
  end
end

function BestHit:BackShrink()
  local me = FightField.fightHum[self.humIdx];
  if me.totalDist == 0 then
    return;
  end

  local freeDist = math.round(math.sqrt(math.pow(me.nowPos.x - me.goal.x, 2) + math.pow(me.nowPos.y - me.goal.y, 2)));

  local scale = math.round((freeDist / me.totalDist) * 10 / 2);
  me:SetShrink(self.tempShrink + scale);
end

function BestHit:GoShrink()
    local me = FightField.fightHum[self.humIdx];
  if me.totalDist == 0 then
    return;
  end

  local freeDist = math.round(math.sqrt(math.pow(me.nowPos.x - me.goal.x, 2) + math.pow(me.nowPos.y - me.goal.y, 2)));
  local nowDist = me.totalDist - freeDist;
    
  local scale = math.round((nowDist / me.totalDist) * 10 / 2);
  me:SetShrink(self.tempShrink + scale);
end