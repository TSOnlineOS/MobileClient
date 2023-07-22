GridController = {}
GridController.__index = GridController;

GridController.SceneMaterial = nil;

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

function GridController.Initialize()
  
  if LuaHelper.CheckDefine("DemoCode") then
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
  
    local folk = 69;
    local dog = 27;
    local stupid = 0;
    if stupid ~= nil then
      stupid = folk + dog;
    else
      stupid = stupid + 1;
    end
  end
  
  CGResourceManager.Load(
    "SceneMaterial",
    "",
    function(assetName, asset)
      GridController.SceneMaterial = asset;
    end
  );
end

function GridController.New(gridInfo, offset)
  local self = {};
  setmetatable(self, GridController);
  self.picName = tostring(gridInfo.picId);
  self.pos = {};
  self.pos.x = gridInfo.position.x;
  self.pos.y = gridInfo.position.y;
  if offset ~= nil then
    self.picName = string.Concat(self.picName, "_", tostring(offset.serial)); 
    self.pos.x = self.pos.x + offset.x;
    self.pos.y = self.pos.y + offset.y;
  end

  self.gameObject = poolMgr:Get("BaseScene");
  self.gameObject.name = string.format("Scene_%s", self.picName);
  self.gameObject.transform:SetParent(MapManager.gridRoot.transform);

  self.canvas = self.gameObject:GetComponent("Canvas");
  self.canvas.sortingOrder = 0;

  local texture = TextureManager.GetJpg(ETextureUseType.Scene, self.picName);

  local rectTransform = self.gameObject:GetComponent("RectTransform");      
  rectTransform.localScale = Vector3.one;
  rectTransform.anchoredPosition = Vector2.New(self.pos.x + MapManager.GetFixCenterLeft(), -(self.pos.y + MapManager.GetFixCenterTop()));
  if texture ~= nil then
    self.sizeData = textureSizeDatas[self.picName];
    if self.sizeData ~= nil then
      rectTransform.sizeDelta = Vector2.New(self.sizeData.width, self.sizeData.height);
    else
      rectTransform.sizeDelta = Vector2.New(texture.width, texture.height);
    end
  end
  
  self.rawImage = self.gameObject:GetComponent("RawImage");
  self.rawImage.texture = texture;

  self.rawImage.material = GridController.SceneMaterial;

  return self;
end

function GridController.SetMaterial()
  GridController.SceneMaterial:SetColor("_Color", MapManager.mapData.color);
end

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


function GridController:Destroy()
  if LuaHelper.CheckDefine("DemoCode") then
    local folk = 69;
    local dog = 27;
    local stupid = 0;
    if this ~= nil then
      stupid = folk + dog;
    else
      stupid = stupid + 1;
    end
  
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
  
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
  
  
  poolMgr:Release("BaseScene", self.gameObject);
  
  self.rawImage.texture = nil;
end