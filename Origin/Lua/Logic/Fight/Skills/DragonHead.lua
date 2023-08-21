DragonHead = InheritsFromBaseAttackSkill();

function DragonHead:Update()
  local target;
  local me = FightField.fightHum[self.humIdx];

  if self.step == 1 then     
    me.roleController:MagicAttack();        
    self.step =2;
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
    if me.roleController.animationFrame == 3 then      
      self.interval = 0.1;
      me.roleController:SetAnimationForceFrame(3);      
      local attack = FightField.attack[self.humIdx];
      for i=0, self.emyNum-1 do
        target = FightField.fightHum[self.emyIdxAy[i]];
        attack:SetLightWithOrder(1 + i, EEffectLightDis.Body, 10000, 50, 1,4, 4, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 255, false, 0);
        me:PlaySound(target.colm, target.row);   --92/7/16-5F     //啊!聲
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);    --挨打姿勢          
      end

      self.step = 3;
    end
  elseif self.step == 3 then 
    if self:CheckInterval() then     
      me.roleController:SetAnimationForceFrame(255);                  
      self.isLightEnd = true;
      self.step = 4;
    end
  end
end