GrassTree = InheritsFromBaseAttackSkill();

function GrassTree:Update()      
  local me = FightField.fightHum[self.humIdx];
  --三人小隊用 NPC
  if me.kind ~= EHuman.Players and me.kind ~= EHuman.Player then
    if me.data ~= nil and me.data.kind == 34 then   
      self:Update3();
      return;
    end
  end

  local newPos;  --TPoint:存x,y
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then             
    newPos = target:GetAttackPos(EFightSpot.Front, 60);
    me:SetJump(newPos.x, newPos.y);
    me.roleController:SetIsJumping(true);
    me:SetSpeed(0.72);
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
    if me.arrive then        
      me.roleController:SetIsJumping(false);
      me.roleController:OneHandAttack();      
      --Me.Rj:=Me.Direction(Me.ShowX, Me.ShowY, Target.ShowX, Target.ShowY);

      me:PlaySound(target.colm, target.row);   
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);  --挨打姿勢

      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground,10010,50, 1, 4, 4, EEffectLightTracer.Stand,target.nowPos.x+10, target.nowPos.y,255,false,35);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground,10010,50, 1, 4, 4, EEffectLightTracer.Stand,target.nowPos.x-25, target.nowPos.y,255,false,60);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground,10010,50, 1, 4, 4, EEffectLightTracer.Stand,target.nowPos.x+30, target.nowPos.y,255,false,60);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Body,10085,150,1,4,4, EEffectLightTracer.Stand, target.nowPos.x+10, target.nowPos.y-5,255, false, 0);   
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Body,10086,150,1,4,4, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y,255, false, 20);

      self.interval = 0.2;
      self.step = 3;
    end
  elseif self.step == 3 then               
    if self:CheckInterval() then        
      me.roleController:SetIsJumping(false);
      me:SetJump(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y, false );
      self.interval = 0.5;
      self.step = 4;
    end
  elseif self.step == 4 then             
    if self:CheckInterval() then
      self.isLightEnd = true;
      self.step = 5;
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
    end
  end
end

function GrassTree:Update3()  
  local newPos;

  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then     
    newPos = target:GetAttackPos(EFightSpot.Front, 60);
    me:SetWalk(newPos.x, newPos.y);
    --TODO LONG SPEC
    --me.ChangePose(Pose_LongSpec);
    me:SetSpeed(0.50);
    self.step = 2;      
  elseif self.step == 2 then 
    if me.arrive then        
      me.roleController:OneHandAttack();      
      me.roleController:FaceTo(target.nowPos);
      
      me:PlaySound(target.colm, target.row);   
      me:PlayEffect(target.colm, target.row, ERolePose.Hit);  --挨打姿勢

      FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground,10010,50, 1, 4, 4, EEffectLightTracer.Stand, target.nowPos.x+10, target.nowPos.y,255,false,35);
      FightField.attack[self.humIdx]:SetLightWithOrder(2, EEffectLightDis.Ground,10010,50, 1, 4, 4, EEffectLightTracer.Stand, target.nowPos.x-25, target.nowPos.y,255,false,60);
      FightField.attack[self.humIdx]:SetLightWithOrder(3, EEffectLightDis.Ground,10010,50, 1, 4, 4, EEffectLightTracer.Stand, target.nowPos.x+30, target.nowPos.y,255,false,60);
      FightField.attack[self.humIdx]:SetLightWithOrder(4, EEffectLightDis.Ground,10085,150,1,4,4, EEffectLightTracer.Stand, target.nowPos.x+10, target.nowPos.y-5,255, false, 0);   
      FightField.attack[self.humIdx]:SetLightWithOrder(5, EEffectLightDis.Body,10086,150,1,4,4, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y,255, false, 20);
      
      self.interval = 0.2;
      self.step = 3;          
    end
  elseif self.step == 3 then           
    if self:CheckInterval() then        
      --TODO LONG SPEC           
      --Me.ChangePose(Pose_LongSpec);
      local oriPos = Vector2.New(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y);
      me.roleController:FaceTo(oriPos); 
      me:SetWalk(oriPos.x, oriPos.y, false );

      self.interval = 0.5;
      self.step = 4;
    end
  elseif self.step == 4 then         
    if self:CheckInterval() then    
      self.stpe = 5;
      self.isLightEnd  = true; 
    end
  end
end

GrassTree3 = InheritsFromBaseAttackSkill();


function GrassTree3:Update()      
  local me = FightField.fightHum[self.humIdx];
  local newPos;  
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then             
    newPos = target:GetAttackPos(EFightSpot.Front, 60);
    me:SetJump(newPos.x, newPos.y);
    me.roleController:SetIsJumping(true);
    me:SetSpeed(0.72);
    self.step = 2;            
  elseif self.step == 2 then 
    if me.arrive then        
      me.roleController:SetIsJumping(false);
      me.roleController:OneHandAttack();      

      for k, v in pairs(self.emyIdxAy)do 
        target = FightField.fightHum[v];
        me:PlaySound(target.colm, target.row);           
        me:PlayEffect(target.colm, target.row, ERolePose.Hit);  --挨打姿勢

        FightField.attack[self.humIdx]:SetLightWithOrder(1 + k * 5, EEffectLightDis.Ground,10010,50, 1, 4, 4, EEffectLightTracer.Stand,target.nowPos.x+10, target.nowPos.y,255,false,35);
        FightField.attack[self.humIdx]:SetLightWithOrder(2 + k * 5, EEffectLightDis.Ground,10010,50, 1, 4, 4, EEffectLightTracer.Stand,target.nowPos.x-25, target.nowPos.y,255,false,60);
        FightField.attack[self.humIdx]:SetLightWithOrder(3 + k * 5, EEffectLightDis.Ground,10010,50, 1, 4, 4, EEffectLightTracer.Stand,target.nowPos.x+30, target.nowPos.y,255,false,60);
        FightField.attack[self.humIdx]:SetLightWithOrder(4 + k * 5, EEffectLightDis.Body,10085,150,1,4,4, EEffectLightTracer.Stand, target.nowPos.x+10, target.nowPos.y-5,255, false, 0);   
        FightField.attack[self.humIdx]:SetLightWithOrder(5 + k * 5, EEffectLightDis.Body,10086,150,1,4,4, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y,255, false, 20);
      end
      self.interval = 0.2;
      self.step = 3;
    end
  elseif self.step == 3 then               
    if self:CheckInterval() then        
      me.roleController:SetIsJumping(false);
      me:SetJump(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y, false );
      self.interval = 0.5;
      self.step = 4;
    end
  elseif self.step == 4 then             
    if self:CheckInterval() then
      self.isLightEnd = true;
      self.step = 5;      
    end
  end
end