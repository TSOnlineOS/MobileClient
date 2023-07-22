ThrowStone = InheritsFromBaseAttackSkill();

function ThrowStone:InitExtraParameters()
  self.targetsIdx = {}; --�x�s�h���ؼи��
  self:InitTargetsIdx();
  self.pathMed = {};

  self.stoneData = {};
  for i = 0, 2 do 
    self.stoneData[i] = {};
    self.stoneData[i].pos = Vector2.zero;
    self.stoneData[i].speed = 0;
  end    
  self.attackRole = AttackRole.New(ESkill_Kind.ThrowStone, EHuman.Duplicate, 21001);
  self.attackRole.roleController:SetInBattle(true);
  self.attackRole:SetVisible(ERoleVisible.Hide);
  self.order = 1;  
end

function ThrowStone:InitTargetsIdx()
  local hitIdx;   
  local target = FightField.fightHum[self.tarIdx];

  for i=0, 2 do  
    hitIdx = -1;
    if i == 0 then         
      hitIdx = self.tarIdx;        
    elseif i == 1 then   
      if target ~= nil and target.row > 0 then
        hitIdx = FightField.GetFHumIdx(target.colm, target.row-1);
      end
    elseif i == 2 then 
      if target ~= nil and target.row ~= (MaxChipRow-1) then
        hitIdx = FightField.GetFHumIdx(target.colm, target.row+1);          
      end
    end               
    table.insert(self.targetsIdx, hitIdx);        
  end
end


function ThrowStone:ExtraClose()
  self.attackRole:Free();
end

function ThrowStone:isPlayOver()
  if self.order == 6 and FightField.attack[self.humIdx]:CheckLightIsEnd(EEffectLightKind.Sky3) then  
    return true;    
  end
  return false;
end

function ThrowStone:Reset()
  self.step = 0;
  self.attackRole.arrive = false;
  self.attackRole.moveOldTime = CGTimer.time;
  FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Sky1);
  FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Sky2);
  FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Sky3);
end

function ThrowStone:SetPosition(partyKind, from, goal)
  --const
  local FixedDist = 75;     --�w�쪺�Z��
  local ShowDist = 100;     --��ܪ��Z��
  local StoneDist = 75;     --���Y���������Z
  local StoneSpeed = 0.36;  --�����������Y����t

  local fixedW, showW, stoneH;    --����U�@�Ӯ�l���M�e��x,y�t��FieldSinSitaW
  local backDir;                  --��h��V
  local totalD, totalD2;         --�`�Z��

  self:Reset();
  fixedW = {};
  fixedW.x = math.round(FixedDist*FieldSinSitaW);
  fixedW.y = math.round(FixedDist*FieldCosSitaW);
  showW = {};
  showW.x = math.round(ShowDist*FieldSinSitaW);
  showW.y = math.round(ShowDist*FieldCosSitaW);

  if partyKind == EFightParty.Right then 
    backDir = 1;     --�V�k
  else
    backDir = 2;    --�V�� 
  end

  if backDir == 1 then --�V�k    
    self.attackRole.roleController:SetDirection(0);
    --��ۨ��X�{�I��m
    self.pathMed[0] = Vector2.New(from.x + showW.x, from.y + showW.y);            
    --��ۨ���g�w���I
    self.pathMed[1] = Vector2.New(from.x + fixedW.x, from.y + fixedW.y);            
  elseif backDir == 2 then --�V��
    self.attackRole.roleController:SetDirection(4);
    --��ۨ��X�{�I��m
    self.pathMed[0] = Vector2.New(from.x - showW.x, from.y - showW.y);            
    --��ۨ���g�w���I
    self.pathMed[1] = Vector2.New(from.x - fixedW.x, from.y - fixedW.y);            
  end

  --��ۨ�������m�I
  self.pathMed[2] = Vector2.New(goal.x, goal.y);  

  self.attackRole.nowPos = Vector2.New(self.pathMed[0].x, self.pathMed[0].y);
  self.attackRole.goal = Vector2.New(self.pathMed[1].x, self.pathMed[1].y);  

  --�]�w���Y�\�]����m

  stoneH = {};
  stoneH.x = math.round(StoneDist*FieldSinSitaH);
  stoneH.y = math.round(StoneDist*FieldCosSitaH);

  self.stoneData[0].pos = Vector2.New(goal.x, goal.y);  
  self.stoneData[1].pos = Vector2.New(goal.x + stoneH.x, goal.y - stoneH.y);  
  self.stoneData[2].pos = Vector2.New(goal.x - stoneH.x, goal.y + stoneH.y);    

  --�p������    
  totalD = (self.pathMed[1] - self.stoneData[0].pos).magnitude;
  self.stoneData[0].speed = 0.36;
  totalD2 = (self.pathMed[1] - self.stoneData[1].pos).magnitude;
  self.stoneData[1].speed = StoneSpeed*totalD2/totalD;

  totalD2 =  (self.pathMed[1] - self.stoneData[2].pos).magnitude; 
  self.stoneData[2].speed = StoneSpeed*totalD2/totalD;
end

function ThrowStone:Update()  
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  
  self.attackRole:Update();

  if self.order == 1 then 
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    --030601J�g�]�k�}
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground,10080,50,1,21,21,EEffectLightTracer.StandAni, me.nowPos.x+6, me.nowPos.y,20, true, 80);

    self.interval = 0.8;
    self.order = 2;
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
  elseif self.order == 2 then       
    if self:CheckInterval() then      
      self.attackRole:SetVisible(ERoleVisible.Visible);
      self:SetPosition(me.party_Kind, me.nowPos, target.nowPos);
      self.order = 3;
    end    
  elseif self.order == 3 then            
    self.attackRole:GetPosition(0.24);          
    if self.attackRole.arrive then --if self.attackRole.roleController.animationFrame == 1 then              
      self.attackRole.roleController:OneHandAttack();
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1 ,10011, 50,1,1,1, EEffectLightTracer.Curve, 
                              self.pathMed[1].x, self.pathMed[1].y-70 ,255, true, 25, self.stoneData[0].pos.x, self.stoneData[0].pos.y);
      FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].lightSpeed = self.stoneData[0].speed;
      me:PlaySound(target.colm, target.row, Attack_Start);   --���o�ۭ��� 92/8/22-1F

      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10011, 50,1,1,1,EEffectLightTracer.Curve,
                              self.pathMed[1].x, self.pathMed[1].y-70 ,255, true, 25, self.stoneData[1].pos.x, self.stoneData[1].pos.y);
      FightField.attack[self.humIdx].lights[EEffectLightKind.Sky2].lightSpeed = self.stoneData[1].speed;
      me:PlaySound(target.colm, target.row, Attack_Start);   --���o�ۭ��� 92/8/22-1F
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky3,10011, 50,1,1,1,EEffectLightTracer.Curve,
                              self.pathMed[1].x, self.pathMed[1].y-70 ,255, true, 25, self.stoneData[2].pos.x, self.stoneData[2].pos.y);
      FightField.attack[self.humIdx].lights[EEffectLightKind.Sky3].lightSpeed = self.stoneData[2].speed;
      me:PlaySound(target.Colm, target.Row, Attack_Start);   --���o�ۭ��� 92/8/22-1F
      self.order = 4;
  
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
  elseif self.order == 4 then       
    if self.attackRole.roleController.animationFrame == 4 then
      self.attackRole.roleController:SetAnimationForceFrame(4); --���b�ĥ|�i��
    end

    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].isArrive then           
      for k, v in pairs(self.emyIdxAy)do
        me:PlayEffect(FightField.fightHum[v].colm, FightField.fightHum[v].row, ERolePose.Hit);  
      end
      me:PlaySound(target.colm, target.row);   
      self.order = 5;        
    end
  elseif self.order == 5 then          
    self:UpdateSmoke();
    self.order = 6;
  elseif self. order == 6 then 
    if self:isPlayOver() then  
      self.isLightEnd = true;
      self.order = 7;
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
  end
end

function ThrowStone:UpdateSmoke()  
  local lightID = EEffectLightKind.Sky1;

  for i =0, 2 do  
    if i == 0 then 
      lightID = EEffectLightKind.Sky1;
    elseif i == 1 then 
      lightID = EEffectLightKind.Sky2;
    elseif i == 2 then 
      lightID = EEffectLightKind.Sky3;
    end

    FightField.attack[self.humIdx]:SetLight(lightID, 10016, 60, 1,15, 15, EEffectLightTracer.StandAni, self.stoneData[i].pos.x-10, self.stoneData[i].pos.y+40, 30, false, 25);
  end
end