RandomHit = InheritsFromBaseAttackSkill();

function RandomHit:InitExtraParameters()
  self.aimIdx = self.tarIdx;   --目前攻擊目標
  self.isHit = false;
  self.attackStep = 1;
  self.hitCnt = {};      --打的次數    
  self.hitIdx = self.tarIdx;         --第一個要打的人
  self.hitCnt[1] = 3;
  self.hitCnt[2] = 1;
  self.hitCnt[3] = 2;
  local target = FightField.fightHum[self.tarIdx];
  if target.row ~= 0 and  --站在第0行
    FightField.fightHum[FightField.GetFHumIdx(target.colm, target.row-1)] ~= nil then         
    self.hitCnt[1] = 2;
    self.hitCnt[3] = 1;
  end

  if target.row ~= (MaxChipRow-1) and 
    FightField.fightHum[FightField.GetFHumIdx(target.colm, target.row+1)] ~= nil then         
    self.hitCnt[1] = 1;
    self.hitCnt[2] = 1;
  end

  self.whoHitCnt = self.hitCnt[1];
  self.isHitDown = false;         --己打了下面的npc
end

--穫得攻擊目標idx 函式-------------------------------------------
function RandomHit:GetAttackIdx(count)
  local value = 255;   --查無此人

  local target = FightField.fightHum[self.tarIdx];
  local fightRole = nil;
  --傳回打第幾個FightHum
  if count == 0 then          --打被點選的人          
    value = self.tarIdx;
    self.hitIdx = value;
    self.whoHitCnt = self.hitCnt[1];
  elseif count == 1 then       --往上一個Row   //030606J 打 被點選人上一行或下一行的人        
    fightRole = FightField.fightHum[FightField.GetFHumIdx(target.colm, target.row -1)];
    if target.row ~= 0 and  --站在第0行
      fightRole ~= nil and
      fightRole.roleController:GetAttribute(EAttribute.Hp) > 0 then     
      value = FightField.GetFHumIdx(target.colm, target.row -1);
      self.hitIdx = value;
      self.whoHitCnt = self.hitCnt[2];
    end

    fightRole = FightField.fightHum[FightField.GetFHumIdx(target.colm, target.row +1)];
    if value == 255 and  --上一行無人時,找下一行
      target.row ~= (MaxChipRow-1) and
      fightRole ~= nil and
      fightRole.roleController:GetAttribute(EAttribute.Hp) > 0 then   

      value = FightField.GetFHumIdx(target.colm, target.row +1);
      self.hitIdx = value;
      self.whoHitCnt = self.hitCnt[3];
      self.isHitDown = true;        
    end
  elseif count == 2 then  --往下一個Row    //030606J 打 被點選人下一行的人  
    fightRole = FightField.fightHum[FightField.GetFHumIdx(target.colm, target.row +1)];        
    if not self.isHitDown and
      target.row ~= (MaxChipRow-1) and
      fightRole ~= nil and
      fightRole.roleController:GetAttribute(EAttribute.Hp) > 0 then        
      value = FightField.GetFHumIdx(target.colm, target.row +1);
      self.whoHitCnt = self.hitCnt[3];        
    end
  end

  if value == 255 then  
    value = self.tarIdx;
    self.whoHitCnt = self.hitCnt[1];
  end
  return value;
end

function RandomHit:Update()  
  local tempIdx;
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.aimIdx];

  if self.step == 1 then     
    me.roleController:SetIsJumping(true);
    newPos = target:GetSpot(EFightSpot.Front, 60);
    me:SetJump(newPos.x, newPos.y);
    me:SetSpeed(0.72);
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
  elseif self.step == 2 then  --是否到達目地點     
    if me.arrive then        
      self.step = 3;          
      me.roleController:SetIsJumping(false);                     
      me.roleController:SetAnimationForceId(ERolePose.Attack);            
    end
  elseif self.step == 3 then --是否跳回播放打鬥的音效          
    if self.isHit and me.roleController.animationId == me.roleController:GetAnimationId(ERolePose.Attack) and me.roleController.animationFrame ==0 then 
      me.roleController:SetAnimationForceId(ERolePose.None);
      FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Sky1);
      if self.attackStep == 3 then   --打了3下          
        self.step = 4;            
        return;
      end
      
      tempIdx = self:GetAttackIdx(self.attackStep);
      if tempIdx~=255 then            
        self.aimIdx = tempIdx;
        target = FightField.fightHum[self.aimIdx];      
        if self.attackStep % 2  == 0 then 
          newPos = target:GetSpot(EFightSpot.Front, 60);
        elseif self.attackStep % 2 == 1 then 
          newPos = target:GetSpot(EFightSpot.Back, 60);
        end

        if (me.nowPos.x ~= newPos.x) and (me.nowPos.y ~= newPos.y) then                
          me.roleController:SetIsJumping(true);
          me:SetJump(newPos.x, newPos.y);          
        else                
          me.roleController:SetAnimationForceId(ERolePose.Attack);            
          self.attackStep = self.attackStep + 1;
        end
        self.isHit = false;            
      else         
        self.attackStep = self.attackStep + 1;
        return;
      end
    end

    if me.roleController.animationId == me.roleController:GetAnimationId(ERolePose.Attack) and
      (me.roleController.animationFrame >= 1) and (self.isHit==false) then       
      me:PlaySound(target.colm, target.row, Attack_Hit);   --播發招音效 92/8/22-1F
      me:PlayEffect(target.colm, target.row, ERolePose.Hit,1);
      self:PlayEffectLight();
      self.isHit = true;
      return;
    end

    if me.roleController.animationId == me.roleController:GetAnimationId(ERolePose.Jump) and me.arrive then    
      me.roleController:FaceTo(target.nowPos);
      me.roleController:SetIsJumping(false);                    
      me.roleController:SetAnimationForceId(ERolePose.Attack);
      self.attackStep = self.attackStep + 1;
      return;        
    end
  elseif self.step == 4 then         
    me.roleController:SetIsJumping(true);                    
    me:SetJump(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y, false);
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
  elseif self.step == 5 then 
    if me.arrive then 
      me.roleController:SetIsJumping(false);    
      self.isLightEnd = true;
    end      
  end
end

function RandomHit:PlayEffectLight()
  local target = FightField.fightHum[self.aimIdx]
  FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1,10000, 40, 1,4, 4, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y,255, false, 0);
  FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2,10040, 25, 1,9, 9, EEffectLightTracer.StandAni, target.nowPos.x-5, target.nowPos.y-10,10, false, 12);
end
