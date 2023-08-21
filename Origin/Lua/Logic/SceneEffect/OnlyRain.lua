OnlyRain = {};
OnlyRain.__index = OnlyRain;

local tempVec = Vector3.New(0, 0, 0);
local tickCount = 0;
local root = nil;

--[[
Now Abraham was old and far on in years: and the Lord had given him everything in full measure.
And Abraham said to his chief servant, the manager of all his property, Come now, put your hand under my leg:
And take an oath by the Lord, the God of heaven and the God of the earth, that you will not get a wife for my son Isaac from the daughters of the Canaanites among whom I am living;
But that you will go into my country and to my relations and get a wife there for my son Isaac.
And the servant said, If by chance the woman will not come with me into this land, am I to take your son back again to the land from which you came?
And Abraham said, Take care that you do not let my son go back to that land.
The Lord God of heaven, who took me from my father's house and from the land of my birth, and made an oath to me, saying, To your seed I will give this land: he will send his angel before you and give you a wife for my son in that land.
And if the woman will not come with you, then you are free from this oath; only do not take my son back there.
And the servant put his hand under Abraham's leg, and gave him his oath about this thing.
And the servant took ten of his master's camels, and all sorts of good things of his master's, and went to Mesopotamia, to the town of Nahor.
And he made the camels take their rest outside the town by the water-spring in the evening, at the time when the women came to get water.
And he said, O Lord, the God of my master Abraham, let me do well in what I have undertaken this day, and give your mercy to my master Abraham.
See, I am waiting here by the water-spring; and the daughters of the town are coming out to get water:
Now, may the girl to whom I say, Let down your vessel and give me a drink, and who says in answer, Here is a drink for you and let me give water to your camels: may she be the one marked out by you for your servant Isaac: so may I be certain that you have been good to my master Abraham.
And even before his words were ended, Rebekah, the daughter of Bethuel, the son of Milcah, who was the wife of Nahor, Abraham's brother, came out with her water-vessel on her arm.
She was a very beautiful girl, a virgin, who had never been touched by a man: and she went down to the spring to get water in her vessel.
And the servant came running to her and said, Give me a little water from your vessel.
And she said, Take a drink, my lord: and quickly letting down her vessel onto her hand, she gave him a drink.
And having done so, she said, I will get water for your camels till they have had enough.
And after putting the water from her vessel into the animals' drinking-place, she went quickly back to the spring and got water for all the camels.
And the man, looking at her, said nothing, waiting to see if the Lord had given his journey a good outcome.
And when the camels had had enough, the man took a gold nose-ring, half a shekel in weight, and two ornaments for her arms of ten shekels weight of gold;
And said to her, Whose daughter are you? is there room in your father's house for us?
And she said to him, I am the daughter of Bethuel, the son of Milcah, Nahor's wife.
And she said, We have a great store of dry grass and cattle-food, and there is room for you.
And with bent head the man gave worship to the Lord;
And said, Praise be to the Lord, the God of my master Abraham, who has given a sign that he is good and true to my master, by guiding me straight to the house of my master's family.
]]--

function OnlyRain.New(i)
  local self = {};
  setmetatable(self, OnlyRain);

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
  self.ObjX = self.showX - 50;

  self.deltaX = 0;
  self.arrive = false;
  self.arriveTickCount = 0;

  if root == nil then
    root = UIShowSceneEffect.GetUIObject();
  end

  self.gameObject = poolMgr:Get("BaseSceneEffect");
  self.gameObject.transform:SetParent(root.transform);
  self.gameObject.name = string.format("OnlyRain_%d", i);
  
  self.rectTransform = self.gameObject:GetComponent("RectTransform");

  tempVec.x = (self.showX - Scene.cameraPosition.x) * UI.scale * Scene.cameraScale;
  tempVec.y = (Scene.cameraPosition.y - self.showY) * UI.scale * Scene.cameraScale;
  self.rectTransform.anchoredPosition = tempVec;
  self.rectTransform.localScale = Vector3.one;

  self.rawImage = self.gameObject:GetComponent("UIRawImage");
  self.rawImage.material = ElementController.ElementMaterial;
  self.rawImage:ShiftUV(1, SceneEffect.OnlyRainFrameCount, 150 * 0.001, -1);
  
  if math.random(100) > 80 then   --約十分之二出現種類二雨
    TextureManager.SetPngByCallBack(ETextureUseType.Scene, SceneEffect.OnlyRainPicName2, self.rawImage,
      function(sucess)
        self.rectTransform.sizeDelta = Vector2.New(self.rawImage.texture.width, self.rawImage.texture.height / SceneEffect.OnlyRainFrameCount);
      end
    );  
  else
    TextureManager.SetPngByCallBack(ETextureUseType.Scene, SceneEffect.OnlyRainPicName1, self.rawImage,
      function(sucess)
        self.rectTransform.sizeDelta = Vector2.New(self.rawImage.texture.width, self.rawImage.texture.height / SceneEffect.OnlyRainFrameCount);
      end
    );  
  end

  return self;
end

function OnlyRain:GetPosition()
  SceneEffect.GetPosition(self);
end

function OnlyRain.AviodCov()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

local onlyRain = {};

function OnlyRain.Update()
    tickCount = tickCount + CGTimer.deltaTime;
    if tickCount >= SceneEffect.RainCreateTime then
      tickCount = 0;
      for i = 1, SceneEffect.FT_MaxRain do
        if onlyRain[i] == nil then              
          onlyRain[i] = OnlyRain.New(i);
          break;
        end
      end
    end

    for i = 1, SceneEffect.FT_MaxRain do
      if onlyRain[i] ~= nil then
        onlyRain[i]:GetPosition();
        if onlyRain[i].arrive then
          onlyRain[i].arriveTickCount = onlyRain[i].arriveTickCount + CGTimer.deltaTime;
          if onlyRain[i].arriveTickCount > SceneEffect.OnlyRainArriveTime then
            poolMgr:Release("BaseSceneEffect", onlyRain[i].gameObject);
            onlyRain[i] = nil;
          end
        end
      end
    end
end

function OnlyRain.AviodCov1()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function OnlyRain.AviodCov2()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function OnlyRain.Stop()
  CGTimer.RemoveListener(OnlyRain.Update);

  for i = 1, SceneEffect.FT_MaxRain do
    if onlyRain[i] ~= nil then
      poolMgr:Release("BaseSceneEffect", onlyRain[i].gameObject);
      onlyRain[i] = nil;
    end
  end
end

function OnlyRain.AviodCov3()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function OnlyRain.AviodCov4()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function OnlyRain.AviodCov5()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

