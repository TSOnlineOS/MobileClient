LeftClaw = InheritsFromBaseAttackSkill();

function LeftClaw:InitExtraParameters()
  self.fire = false;                  --是否打出火光
  self.windLight = {};
  self.shadowLight  = {};
end

function LeftClaw:ExtraClose()
  ClearLightTable(self.windLight);
  ClearLightTable(self.shadowLight);  
end

function LeftClaw:Update()
  local target;  
  local me = FightField.fightHum[self.humIdx];

  if self.step == 1 then     
    me.roleController:SetIsDead(true); 
    me.roleController:SetAnimationForceFrame(0);
    self.interval = 0.3;
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
    self.step = 2;      
  elseif self.step == 2 then       
    if self:CheckInterval() then        
      me.roleController:SetAnimationForceFrame(3);
      for i = 0, self.emyNum-1 do          
        target = FightField.fightHum[self.emyIdxAy[i]];
        me:PlaySound(target.colm, target.row);  
        me:PlayEffect(target.colm, target.row, ERolePose.Hit, 4);        

        --030613J固態化不做跳移的動作,旋風status時取得方向不對=>會當機          
        if not target:IsInSealStatus() then                        
          self.windLight[i] = EffectLight.New(10093,30,1,11,11, EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y,40, true, 30,target.nowPos.x, target.nowPos.y-100, 0.16);
          self.windLight[i]:SetTimeScale(FightField.timeScale);  
          self.windLight[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
          self.windLight[i]:SetAlpha(1,1,40);
          self.windLight[i]:SetResidual(3,100,-1);
        end
      end
      self.interval = 0.01;
      self.step = 3;        
    end
  elseif self.step == 3 then 
    if self:CheckInterval() then      
      for i = 0, self.emyNum-1 do     
        if self.windLight[i] ~= nil then 
          self.windLight[i]:SetAlpha(25,-1,25);
        end

        target = FightField.fightHum[self.emyIdxAy[i]];
        me:PlaySound(target.colm, target.row);   --啊!聲
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);  --挨打姿勢

        target.roleController:SetIsDead(true);
        target:SetBeh(EFightBeh.Rotate);
        target:SetWalk(target.nowPos.x,target.nowPos.y-150, false);
        target:SetSpeed(0.36);
        self.shadowLight[i] = EffectLight.New('Shadow2',80,1,1,1, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 255, true, 35); --額外秀地上影子
        self.shadowLight[i]:SetTimeScale(FightField.timeScale);  
        self.shadowLight[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      end

      self.interval = 1;
      self.step = 4;
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
  elseif self.step == 4 then 
    if self:CheckInterval() then      
      for i = 0, self.emyNum-1 do        
        target = FightField.fightHum[self.emyIdxAy[i]];
        target:SetBeh(EFightBeh.None);
      end
      self.step = 5;
    end
  elseif self.step == 5 then 
    self.isLightEnd = true;   --特技施展完畢          
    self.step = 6;
  end
end