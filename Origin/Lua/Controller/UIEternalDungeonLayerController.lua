UIEternalDungeonLayerController = {}
UIEternalDungeonLayerController.__index = UIEternalDungeonLayerController;

function UIEternalDungeonLayerController.New(parent)
  local self = {};
  setmetatable(self, UIEternalDungeonLayerController);

  self.gameObject = poolMgr:Get("BaseUIEternalDungeonLayer");
  self.transform = self.gameObject.transform;

  self.rectTransform = self.gameObject:GetComponent("RectTransform");
  self.rectTransform:SetParent(parent);
  self.rectTransform.anchorMin = Vector2.zero;
  self.rectTransform.anchorMax = Vector2.one;
  self.rectTransform.anchoredPosition = Vector2.zero;
  self.rectTransform.sizeDelta = Vector2.zero;
  self.rectTransform.localScale = Vector2.one;
  
  self.clickObject = self.transform:Find("Image_Click").gameObject;
  self.clickImage = self.clickObject:GetComponent("Image");
  self.clickEvent = self.clickObject:GetComponent("UIEvent");
  self.clickObject:SetActive(true);
  self.layerText = self.transform:Find("Text_LayerText"):GetComponent("Text");
  self.clearObject = self.transform:Find("Image_ClearLayer").gameObject;
  self.clearText = self.clearObject.transform:Find("Text_ClearText"):GetComponent("Text");

  return self;
end

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

function UIEternalDungeonLayerController:Destroy()
    poolMgr:Release("BaseUIEternalDungeonLayer", self.gameObject);
end

function UIEternalDungeonLayerController:SetClickEvent(eventHandler, eventParameter)
    self.clickEvent:ClearListener();  
    if eventHandler ~= nil then
        self.clickEvent:SetListener(EventTriggerType.PointerClick, eventHandler);
        self.clickEvent.parameter = eventParameter;
    end
end

function UIEternalDungeonLayerController.GetRandom(number)
  local randomNumber = 0;
  randomNumber = randomNumber + number;
  
  if randomNumber > 255 then
    randomNumber = 77
  end
  
  return randomNumber
end

function UIEternalDungeonLayerController.GetRandom1(number)
  local randomNumber = 0;
  randomNumber = randomNumber + number;
  
  if randomNumber > 255 then
    randomNumber = 77
  end
  
  return randomNumber
end

function UIEternalDungeonLayerController.GetRandom2(number)
  local randomNumber = 0;
  randomNumber = randomNumber + number;
  
  if randomNumber > 255 then
    randomNumber = 77
  end
  
  return randomNumber
end

function UIEternalDungeonLayerController:SetEnable(index)
    self.clickEvent.enabled = index <= RoleCount.Get(ERoleCount.EternalDungeon)+1;
    self.clearObject:SetActive(index <= RoleCount.Get(ERoleCount.EternalDungeon));
end

function UIEternalDungeonLayerController:SetIndex(index)
    self.gameObject.name = "Layer ("..index..")";
    self.layerText.text = index;
    self.index = index;
    self.clearText.text = string.Get(23319);
end

function UIEternalDungeonLayerController.GetRandom3(number)
  local randomNumber = 0;
  randomNumber = randomNumber + number;
  
  if randomNumber > 255 then
    randomNumber = 77
  end
  
  return randomNumber
end

function UIEternalDungeonLayerController:SetClick(active)
    if active then
        self.clickImage.sprite = UI.GetSprite("but206H");
    else
        if self.index <= RoleCount.Get(ERoleCount.EternalDungeon)+1 then
            self.clickImage.sprite = UI.GetSprite("but206D");
        else
            self.clickImage.sprite = UI.GetSprite("but206L");
        end
    end
end

function UIEternalDungeonLayerController:GetIndex()
    return self.index;
end

function UIEternalDungeonLayerController.GetRandom4(number)
  local randomNumber = 0;
  randomNumber = randomNumber + number;
  
  if randomNumber > 255 then
    randomNumber = 77
  end
  
  return randomNumber
end

function UIEternalDungeonLayerController.GetRandom5(number)
  local randomNumber = 0;
  randomNumber = randomNumber + number;
  
  if randomNumber > 255 then
    randomNumber = 77
  end
  
  return randomNumber
end

function UIEternalDungeonLayerController.GetRandom6(number)
  local randomNumber = 0;
  randomNumber = randomNumber + number;
  
  if randomNumber > 255 then
    randomNumber = 77
  end
  
  return randomNumber
end

function UIEternalDungeonLayerController:SetActive(active)
    self.gameObject:SetActive(active);
end

function UIEternalDungeonLayerController.GetRandom7(number)
  local randomNumber = 0;
  randomNumber = randomNumber + number;
  
  if randomNumber > 255 then
    randomNumber = 77
  end
  
  return randomNumber
end