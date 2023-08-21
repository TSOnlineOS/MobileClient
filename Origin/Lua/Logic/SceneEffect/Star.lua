Star = {};
Star.__index = Star;

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

local tempVec = Vector3.New(0, 0, 0);
local tickCount = 0;
local root = nil;

function Star.New(i)
  local self = {};
  setmetatable(self, Star);

--  math.randomseed(CGTimer.time);

  local r = math.random(3)
  if r == 1 then
    self.speed = 0.1 * 1000 * 5;
  elseif r == 2 then
    self.speed = 0.15 * 1000 * 5;
  elseif r == 3 then
    self.speed = 0.2 * 1000 * 5;
  else
    self.speed = 0.15 * 1000 * 5;
  end

  self.showX = Scene.cameraPosition.x + math.random(Scene.currentSceneHalfWidth * 3) - Scene.currentSceneHalfWidth; --Ground.posx+random(1200);
  self.showY = Scene.cameraPosition.y + 0 - Scene.currentSceneHalfHeight;
  self.ObjY = Scene.cameraPosition.y + Scene.currentSceneHalfHeight * 2 - Scene.currentSceneHalfHeight;
  self.ObjX = self.showX - 300;
  self.deltaX = 0;
  self.arrive = false;
  self.arriveTickCount = 0;

  if root == nil then
    root = UIShowSceneEffect.GetUIObject()
  end

  self.gameObject = poolMgr:Get("BaseSceneEffect");
  self.gameObject.transform:SetParent(root.transform);
  self.gameObject.name = string.format("Star_%d", i);
  
  self.rectTransform = self.gameObject:GetComponent("RectTransform");

  tempVec.x = (self.showX - Scene.cameraPosition.x) * UI.scale * Scene.cameraScale;
  tempVec.y = (Scene.cameraPosition.y - self.showY) * UI.scale * Scene.cameraScale;
  self.rectTransform.anchoredPosition = tempVec;
  self.rectTransform.localScale = Vector3.one;

  self.rawImage = self.gameObject:GetComponent("UIRawImage");
  self.rawImage.material = ElementController.ElementMaterial;
  if math.random(100) > 70 then   --約十分之三出現種類二星星
    TextureManager.SetPngByCallBack(ETextureUseType.Scene, SceneEffect.StarPicName2, self.rawImage,
      function(sucess)
        self.rectTransform.sizeDelta = Vector2.New(self.rawImage.texture.width, self.rawImage.texture.height / SceneEffect.StarFrameCount);
      end
    );
  else
    TextureManager.SetPngByCallBack(ETextureUseType.Scene, SceneEffect.StarPicName1, self.rawImage,
      function(sucess)
        self.rectTransform.sizeDelta = Vector2.New(self.rawImage.texture.width, self.rawImage.texture.height / SceneEffect.StarFrameCount);
      end
    );
  end

  local interval = 50 * 0.001
  self.rawImage:ShiftUV(1, SceneEffect.StarFrameCount, interval, -1);

  return self;
end

function Star.AddThreeD(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function Star.AddThree1(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function Star.AddThree2(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function Star:GetPosition()
  SceneEffect.GetPosition(self);
end

local star = {};

function Star.Update()
    tickCount = tickCount + CGTimer.deltaTime;
    if tickCount >= SceneEffect.StarCreateTime then
      tickCount = 0;
      for i = 1, SceneEffect.FT_MaxStar do
        if star[i] == nil then              
          star[i] = Star.New(i);
          break;
        end
      end
    end

    for i = 1, SceneEffect.FT_MaxStar do
      if star[i] ~= nil then
        star[i]:GetPosition();
        if star[i].arrive then
          star[i].arriveTickCount = star[i].arriveTickCount + CGTimer.deltaTime;
          if star[i].arriveTickCount >= SceneEffect.StarArriveTime then
            poolMgr:Release("BaseSceneEffect", star[i].gameObject);
            star[i] = nil;
          end
        end
      end
    end
end

function Star.AddThree3(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function Star.AddThree4(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function Star.Stop()
  CGTimer.RemoveListener(Star.Update);

  for i = 1, SceneEffect.FT_MaxStar do
    if star[i] ~= nil then
      poolMgr:Release("BaseSceneEffect", star[i].gameObject);
      star[i] = nil;
    end
  end
end

function Star.AddThree5(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function Star.AddThree6(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function Star.AddThree7(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end
