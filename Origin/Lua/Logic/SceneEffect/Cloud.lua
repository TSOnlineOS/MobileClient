Cloud = {};
Cloud.__index = Cloud;

local tempVec = Vector3.New(0, 0, 0);
local creatTickCount = 0;
local root = nil;

--[[
And these two had a dream on the same night; the chief wine-servant and the chief bread-maker of the king of Egypt, who were in prison, the two of them had dreams with a special sense.
And in the morning when Joseph came to them he saw that they were looking sad.
And he said to the servants of Pharaoh who were in prison with him, Why are you looking so sad?
Then they said to him, We have had a dream, and no one is able to give us the sense. And Joseph said, Does not the sense of dreams come from God? what was your dream?
Then the chief wine-servant gave Joseph an account of his dream, and said, In my dream I saw a vine before me;
And on the vine were three branches; and it seemed as if it put out buds and flowers, and from them came grapes ready for cutting.
And Pharaoh's cup was in my hand, and I took the grapes and crushing them into Pharaoh's cup, gave the cup into Pharaoh's hand.
Then Joseph said, This is the sense of your dream: the three branches are three days;
After three days Pharaoh will give you honour, and put you back into your place, and you will give him his cup as you did before, when you were his wine-servant.
But keep me in mind when things go well for you, and be good to me and say a good word for me to Pharaoh and get me out of this prison:
For truly I was taken by force from the land of the Hebrews; and I have done nothing for which I might be put in prison.
Now when the chief bread-maker saw that the first dream had a good sense, he said to Joseph, I had a dream; and in my dream there were three baskets of white bread on my head;
And in the top basket were all sorts of cooked meats for Pharaoh; and the birds were taking them out of the baskets on my head.
Then Joseph said, This is the sense of your dream: the three baskets are three days;
--]]

function Cloud.New(i)
  local self = {};
  setmetatable(self, Cloud);
  
  if i % 2 == 0 then
    self.showX = Scene.cameraPosition.x - Scene.currentSceneHalfWidth + math.random(Scene.currentSceneHalfWidth * 2);
    self.showY = Scene.cameraPosition.y - Scene.currentSceneHalfHeight - 150;
  else
    self.showX = Scene.cameraPosition.x - Scene.currentSceneHalfWidth - 150;
    self.showY = Scene.cameraPosition.y - Scene.currentSceneHalfHeight + math.random(Scene.currentSceneHalfHeight * 2);
  end

  local r = math.random(2)
  if r == 1 then
    self.speed = 0.01 * 1000 * 5 ;
  elseif r == 2 then
    self.speed = 0.015 * 1000 * 5;
  else
    self.speed = 0.015 * 1000 * 5;
  end

  self.ObjX = self.showX + Scene.currentSceneHalfWidth * 2; --目地的
  self.ObjY = self.showY + Scene.currentSceneHalfHeight * 2; --目地的

  self.arrive = false;
  self.arriveTickCount = 0;

  if root == nil then
    root = UIShowSceneEffect.GetUIObject()
  end

  self.gameObject = poolMgr:Get("BaseSceneEffect");
  self.gameObject.transform:SetParent(root.transform);
  self.gameObject.name = string.format("Cloud_%d", i);
  
  self.rectTransform = self.gameObject:GetComponent("RectTransform");

  tempVec.x = (self.showX - Scene.cameraPosition.x) * UI.scale * Scene.cameraScale;
  tempVec.y = (Scene.cameraPosition.y - self.showY) * UI.scale * Scene.cameraScale;
  self.rectTransform.anchoredPosition = tempVec;
  self.rectTransform.localScale = Vector3.one;

  self.rawImage = self.gameObject:GetComponent("UIRawImage");

  self.material = poolMgr:Get("LightMaterial");
  self.material.shader = UnityEngine.Shader.Find("Custom/LightShader");
  self.rawImage.material = self.material;
  self.material:SetFloat("_InvisibleAlpha", 8 / EffectLight.MAX_ALPHA); 

  TextureManager.SetPngByCallBack(ETextureUseType.Scene, string.Concat("Cloud", math.random(5)), self.rawImage,
    function(sucess)
      self.rectTransform.sizeDelta = Vector2.New(self.rawImage.texture.width, self.rawImage.texture.height);
    end
  );
  self.rawImage:StopShiftUV();
  self.rawImage:ClearUV();

  return self;
end

function Cloud.Random()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Cloud.Random1()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Cloud:GetPosition()
  SceneEffect.GetPosition(self);
end

local cloud = {};

function Cloud.Random2()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Cloud.Random3()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Cloud.Random4()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Cloud.Update()
    creatTickCount = creatTickCount + CGTimer.deltaTime;
    if creatTickCount >= SceneEffect.CloudCreateTime then
      creatTickCount = 0;
      for i = 1, SceneEffect.MaxCloud do
        if cloud[i] == nil then              
          cloud[i] = Cloud.New(i);
          break;
        end
      end
    end

    for i = 1, SceneEffect.MaxCloud do
      if cloud[i] ~= nil then
        cloud[i]:GetPosition();
        if cloud[i].arrive then
          cloud[i].arriveTickCount = cloud[i].arriveTickCount + CGTimer.deltaTime;
          if cloud[i].arriveTickCount >= SceneEffect.CloudArriveTime then
            poolMgr:Release("LightMaterial", cloud[i].material);
            cloud[i].rawImage.material = nil; 
            poolMgr:Release("BaseSceneEffect", cloud[i].gameObject);
            cloud[i] = nil;
          end
        end
      end
    end
end

function Cloud.Stop()
  CGTimer.RemoveListener(Cloud.Update);

  for i = 1, SceneEffect.MaxCloud do
    if cloud[i] ~= nil then
      poolMgr:Release("BaseSceneEffect", cloud[i].gameObject);
      cloud[i] = nil;
    end
  end
end

function Cloud.Random5()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Cloud.Random6()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end
