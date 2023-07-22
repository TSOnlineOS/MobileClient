Snow = {};
Snow.__index = Snow;

local tempVec = Vector3.New(0, 0, 0);
local creatTickCount = 0;
local root = nil;

--[[
Now Dinah, the daughter whom Leah had by Jacob, went out to see the women of that country.
And when Shechem, the son of Hamor the Hivite who was the chief of that land, saw her, he took her by force and had connection with her.
Then his heart went out in love to Dinah, the daughter of Jacob, and he said comforting words to her.
And Shechem said to Hamor, his father, Get me this girl for my wife.
Now Jacob had word of what Shechem had done to his daughter; but his sons were in the fields with the cattle, and Jacob said nothing till they came.
Then Hamor, the father of Shechem, came out to have a talk with Jacob.
Now the sons of Jacob came in from the fields when they had news of it, and they were wounded and very angry because of the shame he had done in Israel by having connection with Jacob's daughter; and they said, Such a thing is not to be done.
But Hamor said to them, Shechem, my son, is full of desire for your daughter: will you then give her to him for a wife?
And let our two peoples be joined together; give your daughters to us, and take our daughters for yourselves.
Go on living with us, and the country will be open to you; do trade and get property there.
And Shechem said to her father and her brothers, If you will give ear to my request, whatever you say I will give to you.
However great you make the bride-price and payment, I will give it; only let me have the girl for my wife.
But the sons of Jacob gave a false answer to Shechem and Hamor his father, because of what had been done to Dinah their sister.
And they said, It is not possible for us to give our sister to one who is without circumcision, for that would be a cause of shame to us:
But on this condition only will we come to an agreement with you: if every male among you becomes like us and undergoes circumcision;
Then we will give our daughters to you and take your daughters to us and go on living with you as one people.
But if you will not undergo circumcision as we say, then we will take our daughter and go.
And their words were pleasing to Hamor and his son Shechem.
And without loss of time the young man did as they said, because he had delight in Jacob's daughter, and he was the noblest of his father's house.
--]]

function Snow.New(i)
  local self = {};
  setmetatable(self, Snow);

--  math.randomseed(CGTimer.time);

  local r = math.random(3)
  if r == 1 then
    self.speed = 0.01 * 1000 * 5;
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

  self.deltaX = math.random(20);
  self.arrive = false;
  self.arriveTickCount = 0;

  if root == nil then
    root = UIShowSceneEffect.GetUIObject()
  end

  self.gameObject = poolMgr:Get("BaseSceneEffect");
  self.gameObject.transform:SetParent(root.transform);
  self.gameObject.name = string.format("Snow_%d", i);
  
  self.rectTransform = self.gameObject:GetComponent("RectTransform");

  tempVec.x = (self.showX - Scene.cameraPosition.x) * UI.scale * Scene.cameraScale;
  tempVec.y = (Scene.cameraPosition.y - self.showY) * UI.scale * Scene.cameraScale;
  self.rectTransform.anchoredPosition = tempVec;
  self.rectTransform.localScale = Vector3.one;

  self.rawImage = self.gameObject:GetComponent("UIRawImage");
  self.rawImage.material = ElementController.ElementMaterial;
  if math.random(100) > 90 then   --約十分之一出現種類二雪花
    TextureManager.SetPngByCallBack(ETextureUseType.Scene, SceneEffect.SnowPicName2, self.rawImage,
      function(sucess)
        self.rectTransform.sizeDelta = Vector2.New(self.rawImage.texture.width, self.rawImage.texture.height / SceneEffect.SnowFrameCount);
      end
    );  
  else
    TextureManager.SetPngByCallBack(ETextureUseType.Scene, SceneEffect.SnowPicName1, self.rawImage,
      function(sucess)
        self.rectTransform.sizeDelta = Vector2.New(self.rawImage.texture.width, self.rawImage.texture.height / SceneEffect.SnowFrameCount);
      end
    );  
  end

  local interval = ( math.random(3) * 100 + 200 ) * 0.001
  self.rawImage:ShiftUV(1, SceneEffect.SnowFrameCount, interval, -1);

  return self;
end

function Snow.Demo()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Snow.Demo1()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Snow:GetPosition()
  SceneEffect.GetPosition(self);
end

local snow = {};

function Snow.Demo2()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Snow.Update()
    creatTickCount = creatTickCount + CGTimer.deltaTime;
    if creatTickCount >= SceneEffect.SnowCreateTime then
      creatTickCount = 0;
      for i = 1, SceneEffect.FT_MaxSnow do
        if snow[i] == nil then              
          snow[i] = Snow.New(i);
          break;
        end
      end
    end

    for i = 1, SceneEffect.FT_MaxSnow do
      if snow[i] ~= nil then
        snow[i]:GetPosition();
        if snow[i].arrive then
          snow[i].arriveTickCount = snow[i].arriveTickCount + CGTimer.deltaTime;
          if snow[i].arriveTickCount >= SceneEffect.SnowArriveTime then
            poolMgr:Release("BaseSceneEffect", snow[i].gameObject);
            snow[i] = nil;
          end
        end
      end
    end
end

function Snow.Demo3()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Snow.Demo4()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Snow.Stop()
  CGTimer.RemoveListener(Snow.Update);

  for i = 1, SceneEffect.FT_MaxSnow do
    if snow[i] ~= nil then
      poolMgr:Release("BaseSceneEffect", snow[i].gameObject);
      snow[i] = nil;
    end
  end
end

function Snow.Demo5()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Snow.Demo6()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Snow.Demo7()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end
