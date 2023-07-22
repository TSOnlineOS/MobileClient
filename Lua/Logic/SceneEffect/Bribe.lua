Bribe = {};
Bribe.__index = Bribe;

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

local tempVec = Vector3.New(0, 0, 0);
local creatTickCount = 0;
local root = nil;

function Bribe.New(i, gdThing)
  local self = {};
  setmetatable(self, Bribe);

--  math.randomseed(CGTimer.time); 

  local r = math.random(3)
  if r == 1 then
    self.speed = 0.012 * 1000 * 5 ;
  elseif r == 2 then
    self.speed = 0.015 * 1000 * 5;
  elseif r == 3 then
    self.speed = 0.018 * 1000 * 5;
  else
    self.speed = 0.015 * 1000 * 5;
  end

  self.showX = Scene.cameraPosition.x + math.random(Scene.currentSceneHalfWidth * 2) - Scene.currentSceneHalfWidth;
  if gdThing.position.y > Scene.currentSceneHalfHeight * 4 then
    self.showY = gdThing.position.y - Scene.currentSceneHalfHeight * 4;
  elseif gdThing.position.y > Scene.currentSceneHalfHeight * 2 then
    self.showY = gdThing.position.y - Scene.currentSceneHalfHeight * 2;
  else
    self.showY = 0;
  end

  self.ObjX = gdThing.position.x;
  self.ObjY = gdThing.position.y;

  self.deltaX = math.random(60) + 5;
  self.arrive = false;
  self.arriveTickCount = 0;

  if root == nil then
    root = UIShowSceneEffect.GetUIObject()
  end

  self.gameObject = poolMgr:Get("BaseSceneEffect");
  self.gameObject.transform:SetParent(root.transform);
  self.gameObject.name = string.format("Bribe_%d", i);
  
  self.rectTransform = self.gameObject:GetComponent("RectTransform");
  
  tempVec.x = (self.showX - Scene.cameraPosition.x) * UI.scale * Scene.cameraScale;
  tempVec.y = (Scene.cameraPosition.y - self.showY) * UI.scale * Scene.cameraScale;
  self.rectTransform.anchoredPosition = tempVec;
  self.rectTransform.localScale = Vector3.one;

  self.rawImage = self.gameObject:GetComponent("UIRawImage");
  self.rawImage.material = ElementController.ElementMaterial;
  self.rawImage:ShiftUV(1, SceneEffect.BribeFrameCount, (math.random(3) * 30 + 250) * 0.001, -1);

  if gdThing.value == 46334 or gdThing.value == 46337 then
    TextureManager.SetPngByCallBack(ETextureUseType.Scene, SceneEffect.BribePicName3, self.rawImage,
      function(sucess)
        self.rectTransform.sizeDelta = Vector2.New(self.rawImage.texture.width, self.rawImage.texture.height / SceneEffect.BribeFrameCount);
      end
    );
  else
    if math.random(10) > 7 then   --約十分之三出現種類二雨
      TextureManager.SetPngByCallBack(ETextureUseType.Scene, SceneEffect.BribePicName2, self.rawImage,
        function(sucess)
          self.rectTransform.sizeDelta = Vector2.New(self.rawImage.texture.width, self.rawImage.texture.height / SceneEffect.BribeFrameCount);
        end
      );
    else
      TextureManager.SetPngByCallBack(ETextureUseType.Scene, SceneEffect.BribePicName1, self.rawImage,
        function(sucess)
          self.rectTransform.sizeDelta = Vector2.New(self.rawImage.texture.width, self.rawImage.texture.height / SceneEffect.BribeFrameCount);
        end
      );
    end
  end

  self.gdThing = gdThing;

  return self;
end

function Bribe.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Bribe.Script1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Bribe.Script2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Bribe:GetPosition()
  SceneEffect.GetPosition(self);
end

local bribe = {};

function Bribe.Start()
  CGTimer.AddListener(Bribe.Update, 0, false);
end

function Bribe.Create(gdThing)
  for i = 1, SceneEffect.FT_MaxBribe do
    if bribe[i] == nil then              
      bribe[i] = Bribe.New(i, gdThing);
      break;
    end
  end

  Bribe.Start();
end

function Bribe.Update()
  for i = 1, SceneEffect.FT_MaxBribe do
    if bribe[i] ~= nil then
      bribe[i]:GetPosition();
      if bribe[i].arrive then
        bribe[i].arriveTickCount = bribe[i].arriveTickCount + CGTimer.deltaTime;
        if bribe[i].arriveTickCount >= SceneEffect.BribeArriveTime then
          bribe[i].gdThing:UpdateView();
          poolMgr:Release("BaseSceneEffect", bribe[i].gameObject);
          bribe[i] = nil;
        end
      end
    end
  end
end

function Bribe.Script3()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Bribe.Script4()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Bribe.Script5()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Bribe.Stop()
  CGTimer.RemoveListener(Bribe.Update);

  for i = 1, SceneEffect.FT_MaxBribe do
    if bribe[i] ~= nil then
      poolMgr:Release("BaseSceneEffect", bribe[i].gameObject);
      bribe[i] = nil;
    end
  end
end

function Bribe.Script6()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Bribe.Script7()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end