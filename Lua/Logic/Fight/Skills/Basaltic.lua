Basaltic1 = InheritsFromBaseAttackSkill();

function Basaltic1:Update()  
  local newPos = self:GetLightPos();
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local attack = FightField.attack[self.humIdx];
  if self.step == 1 then           
    self:Step1Magic();
    --召喚陣
    attack:SetLightWithOrder(1, EEffectLightDis.Ground,10876,100,1,10,10, EEffectLightTracer.Standani, me.nowPos.x+10, me.nowPos.y,15, true, 60);
    --召喚陣聚氣
    attack:SetLightWithOrder(2,EEffectLightDis.Sky,10877,150,1,9,9, EEffectLightTracer.Standani, me.nowPos.x+10, me.nowPos.y,20, true, 80);

    self.interval = 0.9;
    self.step = 2;
  elseif self.step == 2 then           
    if self:CheckInterval() then
      self:Step2Light(newPos);      
      self.step = 3;
  
  
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
    end
  elseif self.step ==3 then   
    if attack.lights[3].picId == 0 then
      me:PlaySound(target.colm, target.row, Attack_Start);--集氣2004/03/25
      self:Step3Light(newPos);    
      self.step = 4;
    end
  elseif self.step == 4 then 
    if attack.lights[3].picId == 0 then    
      me:PlaySound(target.colm, target.row, Attack_Start);--集氣2004/03/25
      attack:SetLightWithOrder(1, EEffectLightDis.Sky, 10888, 50, 1, 11, 11, EEffectLightTracer.StandAni, newPos.x+15, newPos.y, 25, true, 6);

      self.step = 5;
    end
  elseif self.step == 5 then 
    if attack.lights[1].picId == 0 then
      self:Step5Light(newPos);
      
      me:PlaySound(target.colm, target.row, Attack_Start, 2);--放射聲2004/03/30
      for i=0, self.emyNum-1 do      
        target = FightField.fightHum[ self.emyIdxAy[i] ];        
        --放狀解的光影
        attack:SetLightWithOrder(6 + i * self.emyNum, EEffectLightDis.Body, 10882,80,1,19,19, EEffectLightTracer.StandAni, target.nowPos.x,target.nowPos.y,30, true, 60);        
        
        if me.party_Kind == target.party_Kind then                  
          attack:SetLightWithOrder(7 + i * self.emyNum, EEffectLightDis.Body, 10883,70,1,17,17,EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y,30, true, 40);
          attack:SetLightWithOrder(8 + i * self.emyNum, EEffectLightDis.Sky, 10884,70,1,14,14,EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y,35, true, 50);
        end
      end
      self.step = 6;
    end
  elseif self.step == 6 then
    if attack.lights[5].picId == 0 then              
      self.interval = 0.06;
      self.step = 7;
    end
  elseif self.step == 7 then     
    if self:CheckInterval() then        
      self.interval = 0.06;
      attack.lights[4].alpha = attack.lights[4].alpha - 1;
      attack.lights[4].material:SetFloat("_InvisibleAlpha", attack.lights[4].alpha / 32);
    end

    if attack.lights[4].alpha == 1 then
      self.isLightEnd=true;
      self.step = 8;
    end
  end  
end

function Basaltic1:Step1Magic()
  local me = FightField.fightHum[self.humIdx];
  me.roleController:MagicAttack();
  me.roleController:SetAnimationForceId(ERolePose.Magic);    
end

function Basaltic1:GetLightPos()
  return Vector2.New(FightField.skillOffset.x + 400, FightField.skillOffset.y + 327);
end

function Basaltic1:Step2Light(newPos)
  FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10890, 90, 1, 18, 18, EEffectLightTracer.StandAni, newPos.x, newPos.y, 25, false, 160);
end

function Basaltic1:Step3Light(newPos)
  FightField.attack[self.humIdx]:SetLightWithOrder(3,EEffectLightDis.Sky, 10886, 50, 1, 17, 17, EEffectLightTracer.StandAni, newPos.x+15, newPos.y, 25, true, 6);
  FightField.attack[self.humIdx]:SetLightWithOrder(4,EEffectLightDis.Sky, 10891, 100, 1, 8, 8, EEffectLightTracer.Stand, newPos.x,newPos.y, 25, true, 160);
end

function Basaltic1:Step5Light(newPos)
  FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10889, 120, 1, 12, 12, EEffectLightTracer.StandAni, newPos.x+15, newPos.y, 25, true, 106);
end

Basaltic2 = InheritsAttack(Basaltic1)

function Basaltic2:GetLightPos()
  return Vector2.New(FightField.skillOffset.x + 390, FightField.skillOffset.y + 407);
end

function Basaltic2:Step2Light(newPos)
  FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10885, 90, 1, 18, 18, EEffectLightTracer.StandAni, newPos.x,newPos.y, 25, false, 0);
end

function Basaltic2:Step3Light(newPos)
  FightField.attack[self.humIdx]:SetLightWithOrder(3,EEffectLightDis.Sky, 10886, 50, 1, 17, 17, EEffectLightTracer.StandAni,newPos.x+11, newPos.y-92, 25, true, 0);
  FightField.attack[self.humIdx]:SetLightWithOrder(4,EEffectLightDis.Sky, 10887, 100, 1, 8, 8, EEffectLightTracer.Stand, newPos.x,newPos.y, 25, true, 0);
end

Basaltic3 = InheritsAttack(Basaltic1)

function Basaltic3:Step1Magic()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if me.party_Kind ~= target.party_Kind then    
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
  end
  me.roleController:MagicAttack();      
  me.roleController:SetAnimationForceId(ERolePose.Magic);
end

function Basaltic3:Step2Light(newPos)
  local me = FightField.fightHum[self.humIdx];
  FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Sky, 10878, 90, 1, 18, 18, EEffectLightTracer.StandAni, me.nowPos.x-6,me.nowPos.y-134, 25, false, 160);
end

function Basaltic3:Step3Light(newPos)
  local me = FightField.fightHum[self.humIdx];
  FightField.attack[self.humIdx]:SetLightWithOrder(3,EEffectLightDis.Sky, 10904, 50, 1, 17, 17, EEffectLightTracer.StandAni,me.nowPos.x-1, me.nowPos.y-134, 25, true, 96);
  FightField.attack[self.humIdx]:SetLightWithOrder(4,EEffectLightDis.Sky, 10879, 100, 1, 8, 8, EEffectLightTracer.Stand, me.nowPos.x-6,me.nowPos.y-134, 25, true, 160);
end

function Basaltic3:Step5Light(newPos)
  local me = FightField.fightHum[self.humIdx];
  FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Sky, 10881, 120, 1, 12, 12, EEffectLightTracer.StandAni, me.nowPos.x-1, me.nowPos.y-134, 25, true, 138);
end