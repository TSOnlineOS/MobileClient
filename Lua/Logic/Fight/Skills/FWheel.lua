FWheel = InheritsFromBaseAttackSkill();

function FWheel:InitExtraParameters()
  self.moveOldTime = 0;
  self.speed = 0;
  self.nowPos = Vector2.zero;
  self.goal = Vector2.zero;
  self.arrive = false;

  self.gameObject = nil;
  self.rawImage = nil;
  self.material = nil;
  self:CreateShadow();
end

function FWheel:CreateShadow()
  local name = "WheelShadow";
  if self.gameObject == nil then 
    self.gameObject = poolMgr:Get("BaseLight")
    self.gameObject.name = name
    self.gameObject.transform:SetParent(EffectLight.light_root.transform);
    self.gameObject.transform.localPosition = Vector3.zero;
    self.gameObject.transform.localScale = Vector3.one;

    self.rawImage = self.gameObject:GetComponent("RawImage");
    self.canvans = self.gameObject:GetComponent("Canvas");

    self.rectTransform = self.gameObject:GetComponent("RectTransform");
    self.rectTransform.localScale = Vector3.one;
  end
  TextureManager.SetPng(ETextureUseType.EffectLight, name, self.rawImage);
  self.material = poolMgr:Get("LightMaterial")
  self.material.shader = UnityEngine.Shader.Find("Custom/LightShader");
  self.rawImage.material = self.material;
  if self.rawImage.texture ~=nil then   
    self.width = 23;
    self.height = 11;
    self.rectTransform.sizeDelta = Vector2.New(self.width, self.height);           
    self.rawImage.uvRect = Rect.New(0, 1 - self.height / self.rawImage.texture.height, self.width / self.rawImage.texture.width, self.height / self.rawImage.texture.height);
  end
end

function FWheel:ExtraClose()
  if self.rawImage ~= nil then
    self.rawImage.texture = nil;
  end

  if self.material ~= nil then 
    poolMgr:Release("LightMaterial", self.material)
    self.material = nil;
  end
  
  if self.gameObject ~= nil then
    poolMgr:Release("BaseLight", self.gameObject);    
    self.gameObject = nil;
  end
end

function FWheel:Update()
  self:Show();

  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];

  if self.step == 1 then
    local newPos = {};
    newPos.x = target.nowPos.x;
    newPos.y = target.nowPos.y - target.roleController.height + 20;

    me.roleController:SetIsJumping(true);
    me:SetSpeed(0.72);
    me:SetJump(newPos.x, newPos.y);

    self:SetShadePath(me.nowPos.x, me.nowPos.y, target.nowPos.x, target.nowPos.y, me.speed);
    if target.party_Kind == EFightParty.Left then
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10041, 30, 1, 16, 32, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 
                                              25, true, 85, newPos.x, newPos.y, me.speed);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10040, 150, 1, 9, 9, EEffectLightTracer.Line, me.nowPos.x + 10, me.nowPos.y + 40, 
                                              60, true, 90, newPos.x, newPos.y, me.speed);
    else
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky1, 10041, 30, 1, 16, 32, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 
                                              25, true, 85, newPos.x, newPos.y, me.speed);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10040, 150, 1, 9, 9, EEffectLightTracer.Line, me.nowPos.x - 40, me.nowPos.y - 40, 
                                              60, true, 90, newPos.x, newPos.y, me.speed);
    end

    FightField.attack[self.humIdx].lights[EEffectLightKind.Sky2].SetResidual(5, 50, -10);
    FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].isShade = false;
    self.step = 2;
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
    self:GetPosition();
    local leftDist = math.round(math.sqrt(math.pow(me.nowPos.x - target.nowPos.x, 2) + math.pow(me.nowPos.y - target.nowPos.y, 2)));
    if me.totalDist / 2 > leftDist then
      local newPos = me:GetChipPos();
      me.roleController:SetIsJumping(false);
      me.roleController:SetInBattle(false);
      me:SetJump(newPos.x, newPos.y, false);
      self.step = 3;
    end
  elseif self.step == 3 then
    self:GetPosition();
    if FightField.attack[self.humIdx].lights[EEffectLightKind.Sky1].isArrive then
      me.roleController:SetIsMoving(false);
      me.roleController:SetIsJumping(true);

      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Sky2, 10098, 50, 1, 9, 9, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, false, 160);
      self.interval = 0.2;
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

function FWheel:Show()
  if self.arrive == false and self.gameObject ~= nil then
    self.gameObject.transform.localPosition = Vector3.New(self.nowPos.x, -self.nowPos.y, 0);
  end
end

function FWheel:SetShadePath(aShowX, aShowY, aObjX, aObjY, aSpeed)
  self.nowPos = Vector2.New(aShowX, aShowY);
  self.goal = Vector2.New(aObjX, aObjY);
  self.speed = aSpeed;
  self.moveOldTime = CGTimer.time;
end


function FWheel:GetPosition()
  local  dx, dy, m, den;
  local dTime;
  local vx,vy, moveDist;

  dTime = math.round((CGTimer.time - self.moveOldTime)*1000) * FightField.timeScale;   --時間差
  self.moveOldTime = CGTimer.time;
  moveDist = math.round(dTime * self.speed);

  dx = self.goal.x - self.nowPos.x;
  dy = self.goal.y - self.nowPos.y;

  if (math.abs(dx) <= moveDist) and (math.abs(dy) <= moveDist) then  
    self.nowPos = Vector2.New(self.goal.x, self.goal.y);
    self.arrive = true;
    return;
  end

  self.arrive = false;
  m = math.abs(dy / (dx + 0.001));
  den = 1 / math.sqrt(math.pow(m, 2) + 1) * moveDist;
  if dx >= 0 then
    vx = math.round(den);
  else
    vx = -math.round(den);
  end

  if dy >= 0 then
    vy = math.round(m * den);
  else
    vy = -math.round(m * den);
  end

  self.nowPos = Vector2.New(self.nowPos.x + vx, self.nowPos.y + vy);
end