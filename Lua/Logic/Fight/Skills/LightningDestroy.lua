LightningDestroy  = InheritsFromBaseAttackSkill();

function LightningDestroy:Update()  
  local newPos; 
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local attack = FightField.attack[self.humIdx];
  if self.step == 1 then    
    if me.party_Kind == EFightParty.Right then
      attack:SetLightWithOrder(1, EEffectLightDis.Sky,10355,60,1,15, 15, EEffectLightTracer.Line, me.nowPos.x+10, me.nowPos.y ,30,true, 40)
    else
      attack:SetLightWithOrder(1, EEffectLightDis.Sky,10356,60,1,15, 15,EEffectLightTracer.Line,me.nowPos.x+10, me.nowPos.y ,30,true, 40);
    end
    attack:SetLightWithOrder(2, EEffectLightDis.Sky,10593,60,1,4, 4,EEffectLightTracer.Line,me.nowPos.x+10, me.nowPos.y ,30,true, 40);
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
  elseif self. step == 2 then 
    me:SetSpeed(0.40);
    me:SetWalk(target.nowPos.x ,target.nowPos.y, true);
    me:SetBeh(EFightBeh.Rotate);
    attack:SetLightWithOrder(2,EEffectLightDis.Sky,10593,60,1,4, 4,EEffectLightTracer.Line,me.nowPos.x+10, me.nowPos.y ,30,true, 40, target.nowPos.x ,target.nowPos.y ,0.40);
    attack.lights[2]:SetRotate(0,30,50,60);

    attack:SetLightWithOrder(3,EEffectLightDis.Sky,10593,60,1,4, 4,EEffectLightTracer.Line,me.nowPos.x+10, me.nowPos.y ,30,true, 40, target.nowPos.x ,target.nowPos.y ,0.40);
    attack.lights[3]:SetRotate(180,30,50,60);
    if me.party_Kind == EFightParty.Right then
      attack:SetLightWithOrder(1,EEffectLightDis.Sky,10355,60,1,15, 15,EEffectLightTracer.Line,me.nowPos.x+10, me.nowPos.y ,30,true, 40, target.nowPos.x ,target.nowPos.y ,0.40)
    else
      attack:SetLightWithOrder(1,EEffectLightDis.Sky,10356,60,1,15, 15,EEffectLightTracer.Line,me.nowPos.x+10, me.nowPos.y ,30,true, 40, target.nowPos.x ,target.nowPos.y ,0.40);
    end

    me:PlaySound(target.colm, target.row, Attack_Start,1);
    self.step = 3;           
  elseif self.step == 3 then 
    if me.arrive then      
      if me.party_Kind == EFightParty.Right then
        attack:SetLightWithOrder(1,EEffectLightDis.Sky,10355,60,1,15, 15,EEffectLightTracer.Stand,me.nowPos.x ,me.nowPos.y ,30,true, 40)
      else
        attack:SetLightWithOrder(1,EEffectLightDis.Sky,10356,60,1,15, 15,EEffectLightTracer.Stand,me.nowPos.x ,me.nowPos.y ,30,true, 40);
      end
      attack:SetLightWithOrder(2,EEffectLightDis.Sky,10593,60,1,4, 4,EEffectLightTracer.Stand,me.nowPos.x+10, me.nowPos.y ,30,true, 40);
      attack.lights[2]:SetRotate(0,30,50,60);
      attack:SetLightWithOrder(3,EEffectLightDis.Sky,10593,60,1,4, 4,EEffectLightTracer.Stand,me.nowPos.x+10, me.nowPos.y ,30,true, 40);
      attack.lights[3]:SetRotate(180,30,50,60);
      target:SetSpeed(0.80);
      target.roleController:SetIsDead(true); -- ChangePose(Pose_Lie);
      newPos = {};
      newPos.x = FightField.chip[target.colm][target.row].x;
      newPos.y = FightField.chip[target.colm][target.row].y;
      target:SetWalk(newPos.x ,newPos.y-300, true);
      target:SetBeh(EFightBeh.Rotate);
      self.step = 4;
    end
  elseif self.step == 4 then 
    if target.arrive then  
      newPos = {};    
      newPos.x = FightField.chip[target.colm][target.row].x;
      newPos.y = FightField.chip[target.colm][target.row].y;
      target:SetWalk(newPos.x ,newPos.y, true);
      self.step = 5;
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
  elseif self.step == 5 then 
    if target.arrive then      
      attack:SetLightWithOrder(4,EEffectLightDis.Ground, 10010, 70, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 255, false, 60);
      attack:SetLightWithOrder(5,EEffectLightDis.Sky,10283,100, 1, 2, 10,EEffectLightTracer.StandAni,  me.nowPos.x+5, me.nowPos.y,30,false, 35);        
      FightField.SetShake(true);      
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);

      self.interval = 0.1;
      self.step = 6;        
    end
  elseif self.step == 6 then 
    if self:CheckInterval() then      
      FightField.SetShake(false);      
      self.interval = 0.3;        
      self.step = 7;
    end
  elseif self.step == 7 then 
    if self:CheckInterval() then      
      self.step = 8;
      self.isLightEnd = true;
    end    
  end
end