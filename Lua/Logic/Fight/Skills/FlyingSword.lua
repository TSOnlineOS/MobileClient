FlyingSword = InheritsFromBaseAttackSkill();

function FlyingSword:InitExtraParameters()
  self.interval1 = 0;
  self.Hits = {};
  self.tempHits = {};
  self.frame = 0;
  self.finishCount = 0;
  self.fireLight = {};

  self.ballNum = 0;
  self.tailNum = 0;
  self.ctrlPoints = {};
  self.paths = {};
  self.dirs = {};
  self.swords = {};
end

function FlyingSword:ExtraClose()
  ClearLightTable(self.fireLight);

  for k, v in pairs(self.swords) do
    if v ~= nil then
      for key, value in pairs(v) do
        if value ~= nil then
          value.rawImage.texture = nil;
          poolMgr:Release("LightMaterial", value.material)
          value.material = nil;
          poolMgr:Release("BaseLight", value.gameObject)          
        end
      end
      table.Clear(self.v);
    end
  end
  table.Clear(self.swords);
  self.isLightEnd = true;
end

function FlyingSword:Update()
  self:UpdateLogic();
  self:Show();
end

function FlyingSword:UpdateLogic()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local newPos;

  if self.step == 1 then
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:SetAnimationForceId(ERolePose.Magic);
    if target.party_Kind == EFightParty.Left then
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body2 ,10421, 150, 1, 9, 9, EEffectLightTracer.StandAni, me.nowPos.x + 20, me.nowPos.y, 255, true, 80);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body1 ,10422, 150, 1, 9, 9, EEffectLightTracer.StandAni, me.nowPos.x + 20, me.nowPos.y, 20, true, 80);
    else
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body1 ,10422, 150, 1, 9, 9, EEffectLightTracer.StandAni, me.nowPos.x - 10, me.nowPos.y, 20, true, 60);
      FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body2 ,10421, 150, 1, 9, 9, EEffectLightTracer.StandAni, me.nowPos.x - 10, me.nowPos.y, 255, true, 60);
    end
    
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
    self.interval1 = 0.8 / 5;
    self.step = 2;
  elseif self.step == 2 then
    if self.interval1 >= 0 then
      self.interval1 = self.interval1 - CGTimer.deltaTime * FightField.timeScale;
    else
      me:PlaySound(target.colm, target.row, Attack_Start);
      self.interval1 = 0.8 / 5;
    end

    if self:CheckInterval() then 
      if target.party_Kind == EFightParty.Left then
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body2 ,10421, 150, 7, 9, 9, EEffectLightTracer.Stand, me.nowPos.x + 20, me.nowPos.y, 255, true, 80);
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Body1 ,10422, 150, 7, 9, 9, EEffectLightTracer.Stand, me.nowPos.x + 20, me.nowPos.y, 20, true, 80);
      else
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10422, 150, 7, 9, 9, EEffectLightTracer.Stand, me.nowPos.x - 10, me.nowPos.y, 20, true, 60);
        FightField.attack[self.humIdx]:SetLight(EEffectLightKind.Ground ,10421, 150, 7, 9, 9, EEffectLightTracer.Stand, me.nowPos.x - 10, me.nowPos.y, 255, true, 60);
      end
      self:SetFireBall("L10566", 5);
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
  elseif self.step == 3 then
    if self.interval >= 0 then
      self.interval = self.interval - CGTimer.deltaTime * FightField.timeScale;
    else
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

function FlyingSword:Show()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  local status;
  local hitCount = 0;
  self.finishCount = 0;
  for i = 0, self.emyNum -1 do
    for j = 0, self.ballNum - 1 do
      if self.swords[i][j] ~= nil and self.swords[i][j].rawImage ~= nil and self.swords[i][j].rawImage.texture ~= nil then
        status = FightPointEffect.PlayFightEffectA(self.swords[i][j].rawImage, self.swords[i][j].width, self.swords[i][j].height, self.frame - i * 5, self.paths[i][j].point, self.dirs[i][j].dirs, 20, self.tailNum);
        self.swords[i][j].canvas.sortingOrder = -self.swords[i][j].gameObject.transform.localPosition.y + FightField.FIGHT_BODYLIGHT_ORDER;
        
        if not table.Contains(status, EFightPointStatus.Processing) and table.Contains(status, EFightPointStatus.Hited) then
          me:PlaySound(target.colm, target.row);
          hitCount = hitCount + 1;
        end

        if table.Contains(status, EFightPointStatus.Finished) then
          self.swords[i][j].gameObject:SetActive(false);
          self.finishCount = self.finishCount + 1;
        end
      end
    end
  end
  if hitCount > 0 then
    local aLight;
    local ran = math.random(3);
    if ran == 1 then
      aLight = EffectLight.New(10302, 50, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x - 16, target.nowPos.y + math.random(40) - 1, 27, true, 100);
    elseif ran == 2 then
      aLight = EffectLight.New(10303, 50, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x - 16, target.nowPos.y + math.random(40) - 1, 27, true, 10);
    else
      aLight = EffectLight.New(10301, 50, 1, 5, 5,  EEffectLightTracer.Stand, target.nowPos.x - 16, target.nowPos.y + math.random(40) - 1, 27, true, 30);
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

function FlyingSword:SetFireBall(fireName, num)
  self.ballNum = num;
  self.tailNum = 3;

  for i = 0, self.emyNum -1 do
    self.swords[i] = {};
    self.paths[i] = {};
    self.ctrlPoints[i] = {};
    for j = 0, self.ballNum - 1 do
      self.swords[i][j] = {};
      if self.swords[i][j].gameObject == nil then 
        self.swords[i][j].gameObject = poolMgr:Get("BaseLight")
        self.swords[i][j].gameObject.name = fireName
        self.swords[i][j].gameObject.transform:SetParent(EffectLight.light_root.transform);
        self.swords[i][j].gameObject.transform.localPosition = Vector3.New(-1000, 0, 0);
        self.swords[i][j].gameObject.transform.localScale = Vector3.one;

        self.swords[i][j].rawImage = self.swords[i][j].gameObject:GetComponent("RawImage");
        self.swords[i][j].canvas = self.swords[i][j].gameObject:GetComponent("Canvas");

        self.swords[i][j].rectTransform = self.swords[i][j].gameObject:GetComponent("RectTransform");
        self.swords[i][j].rectTransform.localScale = Vector3.New(1, 1, 1);  
      end  
      TextureManager.SetPng(ETextureUseType.EffectLight, fireName, self.swords[i][j].rawImage);
      self.swords[i][j].material = poolMgr:Get("LightMaterial")
      self.swords[i][j].material.shader = UnityEngine.Shader.Find("Custom/LightShader");
      self.swords[i][j].rawImage.material = self.swords[i][j].material;

      if self.swords[i][j].rawImage.texture ~= nil then    
        self.swords[i][j].width = math.floor(self.swords[i][j].rawImage.texture.width / 8);
        self.swords[i][j].height = math.floor(self.swords[i][j].rawImage.texture.height / 3);
        self.swords[i][j].rectTransform.sizeDelta = Vector2.New(self.swords[i][j].width, self.swords[i][j].height);          
        self.swords[i][j].rawImage.uvRect = Rect.New(0, 0, 1 / 8, 1 / 3);     
      end

      self.ctrlPoints[i][j] = {};
      self.ctrlPoints[i][j].point = {};
      self.ctrlPoints[i][j].point[0] = {};
      self.ctrlPoints[i][j].point[1] = {};
      self.ctrlPoints[i][j].point[2] = {};
      self.ctrlPoints[i][j].point[0].x = FightField.fightHum[self.humIdx].nowPos.x;
      self.ctrlPoints[i][j].point[0].y = FightField.fightHum[self.humIdx].nowPos.y - 35;
      self.ctrlPoints[i][j].point[2].x = FightField.fightHum[self.tarIdx].nowPos.x;
      self.ctrlPoints[i][j].point[2].y = FightField.fightHum[self.tarIdx].nowPos.y - 35;
    end
  end

  self:GenerateBezier(20);
  self.frame = 0;
end

function FlyingSword:GenerateBezier(frameNum)
  for i = 0, self.emyNum - 1 do
    self.dirs[i] = {};
    for j = 0, self.ballNum - 1  do
      self.ctrlPoints[i][j].point[1].x = FightField.skillOffset.x + 600 - (math.random(3) - 1) * 100;
      self.ctrlPoints[i][j].point[1].y = FightField.skillOffset.y + (math.random(7) - 1) * 100;
      self.paths[i][j] = FightPointEffect.GenerateBezierPath(self.ctrlPoints[i][j], frameNum);
      self.dirs[i][j] = FightPointEffect.GenerateDirection(self.paths[i][j].point);
    end
  end
end
