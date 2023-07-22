EFireBallKind = {
  A = 1,
  B = 2,
  C = 3,
  D = 4
  }
  

FireBall = InheritsFromBaseAttackSkill();

function FireBall:InitExtraParameters()

  self.frame = 0;
  self.finishCount = 0;
  self.fireLight = {};

  self.ballNum = 0;
  self.tailNum = 0;
  self.ctrlPoints = {};
  self.paths = {};
  self.dirs = {};
  self.ballAy = {};
end

function FireBall:ExtraClose()
  for k, v in pairs(self.fireLight) do
    if v ~= nil then
      v:Stop();
    end
  end
  table.Clear(self.fireLight);

  for k, v in pairs(self.ballAy) do
    if v ~= nil then
      v.rawImage.texture = nil;
      poolMgr:Release("LightMaterial", v.material)         
      v.material = nil;
      v.rawImage.material = nil;      
      poolMgr:Release("BaseLight", v.gameObject)
    end
  end
  table.Clear(self.ballAy);

  self.isLightEnd = true;
end

function FireBall:Update()
  if self.showKind == EFireBallKind.A or self.showKind == EFireBallKind.B then
    self:UpdateAB();
  else
    self:UpdateCD();
  end
  
  self:Show();
end

function FireBall:Show()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local status;
  local hitCount = 0;
  self.finishCount = 0;

  if target == nil then 
    self.isLightEnd = true;
  end
  
  for i = 0, self.ballNum - 1 do
    if self.ballAy[i] ~= nil and self.ballAy[i].rawImage ~= nil and self.ballAy[i].rawImage.texture ~= nil then
      status = FightPointEffect.PlayFightEffectA(self.ballAy[i].rawImage, self.ballAy[i].width, self.ballAy[i].height, self.frame - i * 5, self.paths[i].point, self.dirs[i].dirs, 22, self.tailNum);
      self.ballAy[i].canvas.sortingOrder = -self.ballAy[i].gameObject.transform.localPosition.y + FightField.FIGHT_BODYLIGHT_ORDER;
      if not table.Contains(status, EFightPointStatus.Processing) and table.Contains(status, EFightPointStatus.Hited) then
        me:PlaySound(target.colm, target.row);
        hitCount = hitCount + 1;
      end

      if table.Contains(status, EFightPointStatus.Finished) then
        self.ballAy[i].gameObject:SetActive(false);
        self.finishCount = self.finishCount + 1;
      end
    end
  end

  if hitCount > 0 then
    local aLight;
    if self.showKind == EFireBallKind.B then
      aLight = EffectLight.New(10104, 50, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x - 16, target.nowPos.y + math.random(40), 27, true, 82);
    else
      aLight = EffectLight.New(10096, 50, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x - 16, target.nowPos.y + math.random(40), 27, true, 82);
    end
    
    aLight:SetTimeScale(FightField.timeScale);   
    aLight:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
    table.insert(self.fireLight, aLight);
    me:PlayEffect(target.colm, target.row, ERolePose.Hit, 5);
    local newPos = target:GetSpot(EFightSpot.Back, 5);
    target:SetWalk(newPos.x, newPos.y, false);
    target:SetBeh(EFightBeh.Quake);
  end
end

function FireBall:UpdateAB()
  local me = FightField.fightHum[self.humIdx];
  local newPos;

  if self.step == 1 then
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10078, 50, 1, 20, 20, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 80);
    self.interval = 0.8;
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
    if self:CheckInterval() then 
      if self.showKind == EFireBallKind.A then
        self:SetFireBall("fireBall2", 5);
        --self.interval = 0.8;
      else
        self:SetFireBall("fireBall3", 5);
        self.interval = 0;
      end

      self.step = 3;
    end
  elseif self.step == 3 then
    if self:CheckInterval() then 
      self.frame = self.frame + 1;
      if self.frame == 50 then
        self.frame = 0;
        self:GenerateBezier(20);
      end

      if self.finishCount == self.ballNum then
        self.isLightEnd = true;
        self.step = 4;
      end
    end
  end
end

function FireBall:UpdateCD()
  local me = FightField.fightHum[self.humIdx];
  local newPos;

  if self.step == 1 then
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    if self.showKind == EFireBallKind.C then
      self:SetFireBall("fireBall2", 5);
    else
      self:SetFireBall("fireBall4", 5);
    end
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
    self.frame = self.frame + 1;
    if self.frame == 50 then
      self.frame = 0;
      self:GenerateBezier(20);
    end

    if self.finishCount == self.ballNum then
      self.isLightEnd = true;
      self.step = 3;
    end
  end
end

function FireBall:SetFireBall(fireName, num)
  self.ballNum = num;
  self.tailNum = 3;

  for i = 0, num - 1 do
    self.ballAy[i] = {};
    if self.ballAy[i].gameObject == nil then 
      self.ballAy[i].gameObject = poolMgr:Get("BaseLight")
      self.ballAy[i].gameObject.name = fireName
      self.ballAy[i].gameObject.transform:SetParent(EffectLight.light_root.transform);
      self.ballAy[i].gameObject.transform.localPosition = Vector3.New(-1000, 0, 0);
      self.ballAy[i].gameObject.transform.localScale = Vector3.one;

      self.ballAy[i].rawImage = self.ballAy[i].gameObject:GetComponent("RawImage");
      self.ballAy[i].canvas = self.ballAy[i].gameObject:GetComponent("Canvas");

      self.ballAy[i].rectTransform = self.ballAy[i].gameObject:GetComponent("RectTransform");
      self.ballAy[i].rectTransform.localScale = Vector3.New(2.5, 2.5, 1);  
    end  
    TextureManager.SetPng(ETextureUseType.EffectLight, fireName, self.ballAy[i].rawImage);

    if self.ballAy[i].rawImage.texture ~= nil then    
      self.ballAy[i].width = math.floor(self.ballAy[i].rawImage.texture.width / 8);
      self.ballAy[i].height = math.floor(self.ballAy[i].rawImage.texture.height / 3);
      self.ballAy[i].rectTransform.sizeDelta = Vector2.New(self.ballAy[i].width, self.ballAy[i].height);          
      self.ballAy[i].rawImage.uvRect = Rect.New(0, 0, 1 / 8, 1 / 3);     
    end
    self.ballAy[i].material = poolMgr:Get("LightMaterial")
    self.ballAy[i].material.shader = UnityEngine.Shader.Find("Custom/LightShader");
    self.ballAy[i].rawImage.material = self.ballAy[i].material;

    self.ctrlPoints[i] = {};
    self.ctrlPoints[i].point = {};
    self.ctrlPoints[i].point[0] = {};
    self.ctrlPoints[i].point[1] = {};
    self.ctrlPoints[i].point[2] = {};
    self.ctrlPoints[i].point[0].x = FightField.fightHum[self.humIdx].nowPos.x;
    self.ctrlPoints[i].point[0].y = FightField.fightHum[self.humIdx].nowPos.y - 35;
    self.ctrlPoints[i].point[2].x = FightField.fightHum[self.tarIdx].nowPos.x;
    self.ctrlPoints[i].point[2].y = FightField.fightHum[self.tarIdx].nowPos.y - 35;
  end

  self:GenerateBezier(20);
  self.frame = 0;
end

function FireBall:GenerateBezier(frameNum)
  for i = 0, table.Count(self.ctrlPoints) - 1  do
    self.ctrlPoints[i].point[1].x = FightField.skillOffset.x + 600 - (math.random(3) - 1) * 100;
    self.ctrlPoints[i].point[1].y = FightField.skillOffset.y + (math.random(7) - 1) * 100;
    self.paths[i] = FightPointEffect.GenerateBezierPath(self.ctrlPoints[i], frameNum);
    self.dirs[i] = FightPointEffect.GenerateDirection(self.paths[i].point);
  end
end