Leaf = {};
Leaf.__index = Leaf;

local tempVec = Vector3.New(0, 0, 0);
local creatTickCount = 0;
local root = nil;

function Leaf.TestPas(pat)
  if  LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function Leaf.TestPas1(pat)
  if  LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function Leaf.New(i)
  local self = {};
  setmetatable(self, Leaf);

--  math.randomseed(CGTimer.time); 

  local r = math.random(3)
  if r == 1 then
    self.speed = 0.01 * 1000 * 5 ;
  elseif r == 2 then
    self.speed = 0.015 * 1000 * 5;
  elseif r == 3 then
    self.speed = 0.02 * 1000 * 5;
  else
    self.speed = 0.015 * 1000 * 5;
  end

  self.showX = Scene.cameraPosition.x + math.random(Scene.currentSceneHalfWidth * 2) - Scene.currentSceneHalfWidth;
  self.showY = Scene.cameraPosition.y + 0 - Scene.currentSceneHalfHeight;
  self.ObjY = Scene.cameraPosition.y + Scene.currentSceneHalfHeight * 2 - Scene.currentSceneHalfHeight ;

  r = math.random(2);
  if r == 1 then
    self.ObjX = self.showX+(math.random(5)*50);
  elseif r == 2 then
    self.ObjX = self.showX-(math.random(5)*50);
  end

  self.deltaX = math.random(30);
  self.arrive = false;
  self.arriveTickCount = 0;

  if root == nil then
    root = UIShowSceneEffect.GetUIObject()
  end

  self.gameObject = poolMgr:Get("BaseSceneEffect");
  self.gameObject.transform:SetParent(root.transform);
  self.gameObject.name = string.format("Leaf_%d", i);
  
  self.rectTransform = self.gameObject:GetComponent("RectTransform");

  tempVec.x = (self.showX - Scene.cameraPosition.x) * UI.scale * Scene.cameraScale;
  tempVec.y = (Scene.cameraPosition.y - self.showY) * UI.scale * Scene.cameraScale;
  self.rectTransform.anchoredPosition = tempVec;
  self.rectTransform.localScale = Vector3.one;

  self.rawImage = self.gameObject:GetComponent("UIRawImage");
  self.rawImage.material = ElementController.ElementMaterial;
  TextureManager.SetPngByCallBack(ETextureUseType.Scene, SceneEffect.LeafPicName, self.rawImage,
    function(sucess)
      self.rectTransform.sizeDelta = Vector2.New(self.rawImage.texture.width, self.rawImage.texture.height / SceneEffect.LeafFrameCount);
    end
  );  

  local interval = ( math.random(3) * 100 + 200 ) * 0.001
  self.rawImage:ShiftUV(1, SceneEffect.LeafFrameCount, interval, -1);

  return self;
end

function Leaf:GetPosition()
  SceneEffect.GetPosition(self);
end

function Leaf.TestPas1(pat)
  if  LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function Leaf.TestPas2(pat)
  if  LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function Leaf.TestPas3(pat)
  if  LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

local leaf = {};

function Leaf.Update()
    creatTickCount = creatTickCount + CGTimer.deltaTime;
    if creatTickCount >= SceneEffect.LeafCreateTime then
      creatTickCount = 0;
      for i = 1, SceneEffect.FT_MaxLeaf do
        if leaf[i] == nil then              
          leaf[i] = Leaf.New(i);
          break;
        end
      end
    end

    for i = 1, SceneEffect.FT_MaxLeaf do
      if leaf[i] ~= nil then
        leaf[i]:GetPosition();
        if leaf[i].arrive then
          leaf[i].arriveTickCount = leaf[i].arriveTickCount + CGTimer.deltaTime;
          if leaf[i].arriveTickCount >= SceneEffect.LeafArriveTime then
            poolMgr:Release("BaseSceneEffect", leaf[i].gameObject);
            leaf[i] = nil;
          end
        end
      end
    end
end

function Leaf.Stop()
  CGTimer.RemoveListener(Leaf.Update);

  for i = 1, SceneEffect.FT_MaxLeaf do
    if leaf[i] ~= nil then
      poolMgr:Release("BaseSceneEffect", leaf[i].gameObject);
      leaf[i] = nil;
    end
  end
end

function Leaf.TestPas4(pat)
  if  LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function Leaf.TestPas5(pat)
  if  LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end