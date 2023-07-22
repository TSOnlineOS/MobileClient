Rain = {};
Rain.__index = Rain;

local tempVec = Vector3.New(0, 0, 0);
local tickCount = 0;
local root = nil;

function Rain.GetNothing()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function Rain.GetNothingA()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function Rain.New(i)
  local self = {};
  setmetatable(self, Rain);

--  math.randomseed(CGTimer.time);

  local r = math.random(3)
  if r == 1 then
    self.speed = 0.3 * 1000 * 5;
  elseif r == 2 then
    self.speed = 0.4 * 1000 * 5;
  elseif r == 3 then
    self.speed = 0.5 * 1000 * 5;
  else
    self.speed = 0.4 * 1000 * 5;
  end

  self.showX = Scene.cameraPosition.x + math.random(Scene.currentSceneHalfWidth * 2) - Scene.currentSceneHalfWidth; --Ground.posx+random(1200);
  self.showY = Scene.cameraPosition.y + 0 - Scene.currentSceneHalfHeight;
  self.ObjY = Scene.cameraPosition.y + ( math.random(Scene.currentSceneHalfHeight * 2 * 0.75) + Scene.currentSceneHalfHeight * 0.25 ) - Scene.currentSceneHalfHeight; --ObjY:=Ground.posy+random(450)+150;
  self.ObjX = self.showX - 300;

  self.deltaX = 0;
  self.arrive = false;
  self.arriveTickCount = 0;

  if root == nil then
    root = UIShowSceneEffect.GetUIObject();
  end

  self.gameObject = poolMgr:Get("BaseSceneEffect");
  self.gameObject.transform:SetParent(root.transform);
  self.gameObject.name = string.format("Rain_%d", i);
  
  self.rectTransform = self.gameObject:GetComponent("RectTransform");

  
  tempVec.x = (self.showX - Scene.cameraPosition.x) * UI.scale * Scene.cameraScale;
  tempVec.y = (Scene.cameraPosition.y - self.showY) * UI.scale * Scene.cameraScale;
  self.rectTransform.anchoredPosition = tempVec;
  self.rectTransform.localScale = Vector3.one;

  self.rawImage = self.gameObject:GetComponent("UIRawImage");
  self.rawImage.material = ElementController.ElementMaterial;
  self.rawImage:ShiftUV(1, SceneEffect.RainFrameCount, 150 * 0.001, -1);

  if math.random(100) > 90 then   --約十分之一出現種類二雨
    TextureManager.SetPngByCallBack(ETextureUseType.Scene, SceneEffect.RainPicName2, self.rawImage,
      function(sucess)
        self.rectTransform.sizeDelta = Vector2.New(self.rawImage.texture.width, self.rawImage.texture.height / SceneEffect.RainFrameCount);
      end
    );  
  else
    TextureManager.SetPngByCallBack(ETextureUseType.Scene, SceneEffect.RainPicName1, self.rawImage,
      function(sucess)
        self.rectTransform.sizeDelta = Vector2.New(self.rawImage.texture.width, self.rawImage.texture.height / SceneEffect.RainFrameCount);
      end
    );  
  end

  return self;
end

function Rain:GetPosition()
  SceneEffect.GetPosition(self);
end

local rain = {};

function Rain.Update()
    tickCount = tickCount + CGTimer.deltaTime;
    if tickCount >= SceneEffect.RainCreateTime then
      tickCount = 0;
      for i = 1, SceneEffect.FT_MaxRain do
        if rain[i] == nil then              
          rain[i] = Rain.New(i);
          break;
        end
      end
    end

    for i = 1, SceneEffect.FT_MaxRain do
      if rain[i] ~= nil then
        rain[i]:GetPosition();
        if rain[i].arrive then
          rain[i].arriveTickCount = rain[i].arriveTickCount + CGTimer.deltaTime;
          if rain[i].arriveTickCount > SceneEffect.RainArriveTime then
            poolMgr:Release("BaseSceneEffect", rain[i].gameObject);
            rain[i] = nil;
          end
        end
      end
    end
end

function Rain.GetNothing1()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function Rain.GetNothing2()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function Rain.Stop()
  CGTimer.RemoveListener(Rain.Update);

  for i = 1, SceneEffect.FT_MaxRain do
    if rain[i] ~= nil then
      poolMgr:Release("BaseSceneEffect", rain[i].gameObject);
      rain[i] = nil;
    end
  end
end

function Rain.GetNothing4()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function Rain.GetNothing5()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function Rain.GetNothing6()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end
