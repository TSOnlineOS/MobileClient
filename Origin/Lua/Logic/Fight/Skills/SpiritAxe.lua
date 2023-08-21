SpiritAxe = InheritsFromBaseAttackSkill();

function SpiritAxe:ExtraClose()
  FightField.fightHum[self.tarIdx]:SetStatus(EFightStatusKind.Faint, ESkill_Kind.SpiritAxe); --給予狀態
end

function SpiritAxe:Update()  
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local attack = FightField.attack[self.humIdx];

  if self.step == 1 then --跳到魔法位置          
    newPos = me:GetMagicPos();
    me:SetJump(newPos.x, newPos.y, false);
    me:SetSpeed(0.42);
    me:SetBeh(EFightBeh.Residual);  --殘影
    me.roleController:SetIsJumping(true);    
    attack:SetLightWithOrder(8, EEffectLightDis.Sky, 10283,100, 1, 2, 10, EEffectLightTracer.StandAni,  me.nowPos.x+5, me.nowPos.y, 30, false, 25);
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
      --local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then 
    if me.arrive then      
      newPos = {};
      if me.party_Kind == EFightParty.Right then        
        newPos.x = FightField.chip[target.colm][target.row].x+200;
        newPos.y = FightField.chip[target.colm][target.row].y+110;        
      else        
        newPos.x = FightField.chip[target.colm][target.row].x-200;
        newPos.y = FightField.chip[target.colm][target.row].y-110;
      end
      me:SetJump(newPos.x, newPos.y, false);
      attack:SetLightWithOrder(9, EEffectLightDis.Sky, 10283, 100, 1, 2, 10,EEffectLightTracer.StandAni,  me.nowPos.x+5, me.nowPos.y,30, false, 25);
      self.step = 3;
    end
  elseif self.step == 3 then 
    if me.arrive then        
      me:PlaySound(target.colm, target.row, Attack_Start);
      me.roleController:SetIsJumping(false);    
      me.roleController:SetAnimationForceId(ERolePose.Attack);
      attack:SetLightWithOrder(1, EEffectLightDis.Sky,10545,60,1,4,4, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y,255, true, 0,target.nowPos.x,target.nowPos.y, 0.77);
      self.step = 4;        
    end
  elseif self.step == 4 then  --打身體
    if  attack.lights[1].isArrive then        
      target.roleController:Hit();-- .ChangePose(Pose_Hit);
      attack:SetLightWithOrder(2, EEffectLightDis.Sky, 10000, 60,1,4,4, EEffectLightTracer.Stand,target.nowPos.x, target.nowPos.y, 255,false, math.random(0,50));
      attack:SetLightWithOrder(4, EEffectLightDis.Sky, 10438, 60,1,7,7, EEffectLightTracer.Stand,target.nowPos.x, target.nowPos.y+60, 30,false, math.random(0,50));
      if target.party_Kind == EFightParty.Left then  --人在左          
        attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10545,60,1,4,4, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y,255, true, 0, target.nowPos.x-100, target.nowPos.y,0.77);
        attack:SetLightWithOrder(3, EEffectLightDis.Sky, 10545,60,1,4,4, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y+30,255, true, 0,target.nowPos.x,target.nowPos.y+30,0.77);          
      else      
        attack:SetLightWithOrder(1,EEffectLightDis.Sky,10545,60,1,4,4,EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y,255, true, 0,target.nowPos.x+110,target.nowPos.y,0.77);
        attack:SetLightWithOrder(3,EEffectLightDis.Sky,10545,60,1,4,4,EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y+30,255, true, 0,target.nowPos.x,target.nowPos.y+30,0.77);
      end
      me:PlaySound(target.colm, target.row, Attack_Start);
      me:PlayEffect(target.colm, target.row, ERolePose.Hit,3);
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
        --local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end    
  elseif self.step == 5 then  --往後飛
    if attack.lights[1].isArrive then        
      if target.party_Kind == EFightParty.Left then  --人在左
        attack:SetLightWithOrder(1,EEffectLightDis.Sky,10545,60,1,4,4,EEffectLightTracer.Line, target.nowPos.x-100, target.nowPos.y,255, true, 0,target.nowPos.x,target.nowPos.y,0.77);          
      else      
        attack:SetLightWithOrder(1,EEffectLightDis.Sky,10545,60,1,4,4,EEffectLightTracer.Line, target.nowPos.x+110, target.nowPos.y,255, true, 60,target.nowPos.x,target.nowPos.y,0.77);
      end
      me:PlaySound(target.colm, target.row, Attack_Start);
      self.step = 6;        
    end
  elseif self.step == 6 then       
    if  attack.lights[1].isArrive then        
      me:PlayEffect(target.colm, target.row, ERolePose.Hit, 3);
      attack:SetLightWithOrder(2,EEffectLightDis.Sky,10000, 60,1,4,4,EEffectLightTracer.Stand,target.nowPos.x, target.nowPos.y, 255,false, math.random(0,50));
      attack:SetLightWithOrder(4,EEffectLightDis.Sky,10438, 60,1,7,7,EEffectLightTracer.Stand,target.nowPos.x, target.nowPos.y+60, 30,false, math.random(0,50));
      attack:SetLightWithOrder(1,EEffectLightDis.Sky,10545,60,1,4,4,EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y,255, true, 0,me.nowPos.x,me.nowPos.y,0.75);
      self.step = 7;                  
    end
  elseif self.step == 7 then 
    if  attack.lights[3].isArrive then      
      if target.party_Kind == EFightParty.Left then  --人在左      
        attack:SetLightWithOrder(3, EEffectLightDis.Sky, 10545,60,1,4,4, EEffectLightTracer.Line, target.nowPos.x-100, target.nowPos.y+30,255, true, 0, target.nowPos.x, target.nowPos.y+30,0.77);        
      else      
        attack:SetLightWithOrder(3, EEffectLightDis.Sky, 10545,60,1,4,4, EEffectLightTracer.Line, target.nowPos.x+110, target.nowPos.y+30,255, true, 60, target.nowPos.x, target.nowPos.y+30,0.77);
      end
      self.step = 8;
    end
  elseif self.step == 8 then       
    if attack.lights[3].isArrive then        
      me:PlayEffect(target.colm, target.row, ERolePose.Hit,3);        
      attack:SetLightWithOrder(2,EEffectLightDis.Sky,10000,60,1,4,4,EEffectLightTracer.Stand,target.nowPos.x, target.nowPos.y,   255,false, math.random(0,50));
      attack:SetLightWithOrder(4,EEffectLightDis.Sky,10438,60,1,7,7,EEffectLightTracer.Stand,target.nowPos.x, target.nowPos.y+60, 30,false, math.random(0,50));
      attack:SetLightWithOrder(3,EEffectLightDis.Sky,10545,60,1,4,4,EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y+30,255, true, 0,me.nowPos.x,me.nowPos.y+30,0.33);
      self.step = 9;
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
        --local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  elseif self.step == 9 then 
    if  attack.lights[3].isArrive then      
      self.isLightEnd = true;   --特技施展完畢
      self.step = 10;
    end
  end
end