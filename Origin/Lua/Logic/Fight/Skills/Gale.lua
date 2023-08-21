Gale = InheritsFromBaseAttackSkill();

function Gale:Update()  
  local newPos;

  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then     
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();    

    --風魔法陣
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground,10077,50,1,21,21, EEffectLightTracer.StandAni, me.nowPos.x+5, me.nowPos.y,20, true, 90);

    self.interval = 0.8;
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
    self.step = 2;              
  elseif self.step == 2 then       
    if self:CheckInterval() then       
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Sky,10093,30,1,11,11,EEffectLightTracer.Line, target.nowPos.x,target.nowPos.y,40, true, 30,target.nowPos.x, target.nowPos.y-100, 0.16);
      FightField.attack[self.humIdx].lights[2]:SetAlpha(1,1,40);
      FightField.attack[self.humIdx].lights[2]:SetResidual(3,100,-1);

      me:PlaySound(target.colm, target.row, Attack_Start);   

      self.interval = 0.1;
      self.step = 3;        
    end
  elseif self.step == 3 then     
    if self:CheckInterval() then        
      FightField.attack[self.humIdx].lights[2]:SetAlpha(25,-1,25);

      me:PlaySound(target.colm, target.row);   --啊!聲
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);  --挨打姿勢

      target.roleController:SetIsDead(true);      
      target:SetBeh(EFightBeh.Rotate);
      target:SetWalk(target.nowPos.x,target.nowPos.y-150,false);
      target:SetSpeed(0.36);

      self.interval = 1;
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
      self.step = 4;          
    end    
  elseif self.step == 4 then 
    if self:CheckInterval() then      
        target:SetBeh(EFightBeh.None);
        self.step = 5;
        self.isLightEnd = true;
    end    
  end
end

Gale3 = InheritsFromBaseAttackSkill();

function Gale3:Update()
  local target;

  local me = FightField.fightHum[self.humIdx];
  target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10077, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 90);
    self.interval = 0.8;
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
    self.step = 2;
  elseif self.step == 2 then 
    if self:CheckInterval() then 
      for i = 0, self.emyNum-1 do        
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        FightField.attack[self.humIdx]:SetLightWithOrder(2 + i, EEffectLightDis.Sky ,10017, 50, 1, 6, 6, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y, 40, true, 30, target.nowPos.x, target.nowPos.y - 100, 0.16);
        FightField.attack[self.humIdx].lights[2 + i]:SetAlpha(1, 1, 40);
        FightField.attack[self.humIdx].lights[2 + i]:SetResidual(3, 100, -1);
      end
      me:PlaySound(target.colm, target.row, Attack_Start);
      self.interval = 0.01;
      self.step = 3;
    end
  elseif self.step == 3 then 
    if self:CheckInterval() then 
      for i = 0, self.emyNum-1 do
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);
        target.roleController:SetIsDead(true);
        target:SetBeh(EFightBeh.Rotate);
        target:SetWalk(target.nowPos.x, target.nowPos.y - 150, false)
        target:SetSpeed(0.36);

        FightField.attack[self.humIdx].lights[2 + i]:SetAlpha(25, -1, 25);
        FightField.attack[self.humIdx]:SetLightWithOrder(5 + i, EEffectLightDis.Sky, "Shadow2", 80, 1, 1, 1, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 255, true, 35);
      end
      me:PlaySound(target.colm, target.row);
      self.interval = 1;
      self.step = 4;
    end
  elseif self.step == 4 then 
    if self:CheckInterval() then 
      for i = 0, self.emyNum-1 do
        target = FightField.fightHum[ self.emyIdxAy[i] ];
        target:SetBeh(EFightBeh.None);
      end
      self.step = 5;
    end
  elseif self.step == 5 then 
    self.isLightEnd = true;
    self.step = 6;
  end
end