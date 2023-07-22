UICardController = {}
UICardController.__index = UICardController;

function UICardController.New(parent)
  local self = {};
  setmetatable(self, UICardController);

  self.cardData = nil;  

  self.gameObject = poolMgr:Get("BaseCard");
  self.transform = self.gameObject.transform;
  
  self.rectTransform = self.gameObject:GetComponent("RectTransform");
  self.rectTransform:SetParent(parent);
  self.rectTransform.anchorMin = Vector2.zero;
  self.rectTransform.anchorMax = Vector2.one;
  self.rectTransform.anchoredPosition = Vector2.zero;
  self.rectTransform.sizeDelta = Vector2.zero;
  self.rectTransform.localScale = Vector2.one;

  self.image_BG = self.transform:Find("Image_BG"):GetComponent("RawImage");
  self.image_Frame = self.transform:Find("Image_Frame"):GetComponent("RawImage");
  self.image_Element = self.transform:Find("Image_Element"):GetComponent("RawImage");
  self.text_Element = self.image_Element.transform:Find("Text"):GetComponent("Text");
  self.image_EFrame = self.transform:Find("Image_EFrame"):GetComponent("RawImage");
  self.text_Count = self.image_EFrame.transform:Find("Text"):GetComponent("Text");
  local rootStars = self.transform:Find("Root_Stars");
  self.image_Stars = {};
  for i = 1, 5 do 
    self.image_Stars[i] = rootStars.transform:Find(string.Concat("RawImage", i)):GetComponent("RawImage");
  end
  self.text_Name = self.transform:Find("Text_Name"):GetComponent("Text");

  return self;
end

--[[
Now the land was in bitter need of food.
And when the grain which they had got in Egypt was all used up, their father said to them, Go again and get us a little food.
And Judah said to him, The man said to us with an oath, You are not to come before me again without your brother.
If you will let our brother go with us, we will go down and get food:
But if you will not send him, we will not go down: for the man said to us, You are not to come before me if your brother is not with you.
And Israel said, Why were you so cruel to me as to say to him that you had a brother?
And they said, The man put a number of questions to us about ourselves and our family, saying, Is your father still living? have you another brother? And we had to give him answers; how were we to have any idea that he would say, Come back with your brother?
Then Judah said to Israel, his father, Send the boy with me, and let us be up and going, so that we and you and our little ones may not come to destruction.
Put him into my care and make me responsible for him: if I do not give him safely back to you, let mine be the sin for ever.
Truly, if we had not let the time go by, we might have come back again by now.
Then their father Israel said to them, If it has to be so, then do this: take of the best fruits of the land in your vessels to give the man, perfumes and honey and spices and nuts:
And take twice as much money with you; that is to say, take back the money which was put in your bags, for it may have been an error;
And take your brother and go back to the man:
And may God, the Ruler of all, give you mercy before the man, so that he may give you back your other brother and Benjamin. If my children are to be taken from me; there is no help for it.
So they took what their father said for the man, and twice as much money in their hands, and Benjamin, and went on their journey to Egypt, and came before Joseph.
And when Joseph saw Benjamin, he said to his chief servant, Take these men into my house, and make ready a meal, for they will take food with me in the middle of the day.
And the servant did as Joseph said, and took the men into Joseph's house.
Now the men were full of fear because they had been taken into Joseph's house and they said, It is because of the money which was put back in our bags the first time; he is looking for something against us, so that he may come down on us and take us and our asses for his use.
--]]

function UICardController:Destroy()
  poolMgr:Release("BaseCard", self.gameObject);
end

function UICardController:LoadFrames()
  TextureManager.SetPng(ETextureUseType.UI, "CardCareer", self.image_Element);
  TextureManager.SetPng(ETextureUseType.UI, "CardCareerFrame", self.image_EFrame);
  for i = 1, 5 do
    TextureManager.SetPng(ETextureUseType.UI, "CardStar", self.image_Stars[i]);    
  end
end

function UICardController.EndOfLine()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function UICardController.EndOfLine1()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function UICardController:SetData(cardId, count)
  self.cardData = collectCardSortDatas[cardId];
  if self.cardData == nil or npcDatas[self.cardData.warriorId] == nil then 
    return 
  end
  self:LoadFrames();
  TextureManager.SetPng(ETextureUseType.UI, string.Concat("C", self.cardData.warriorId), self.image_BG);
  self.text_Name.text = npcDatas[self.cardData.warriorId].name;
  local rank = npcDatas[self.cardData.warriorId].rare;
  if rank <= 3 then 
    TextureManager.SetPng(ETextureUseType.UI, "CardFrame_0", self.image_Frame);
  elseif rank == 4 then      
    TextureManager.SetPng(ETextureUseType.UI, "CardFrame_1", self.image_Frame);
  else
    TextureManager.SetPng(ETextureUseType.UI, "CardFrame_2", self.image_Frame);
  end
  
  for i = 1, 5 do 
    self.image_Stars[i].gameObject:SetActive(rank >= i);
  end

  self.image_Element.color = Color.CareerKind[npcDatas[self.cardData.warriorId].element][1];
  self.text_Element.text = string.GetElement(npcDatas[self.cardData.warriorId].element);
  if count ~= nil then 
    self.text_Count.text = string.Concat("x", count);
  else
    self.text_Count.text = "";
  end
end

function UICardController.EndOfLine2()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function UICardController.EndOfLine3()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function UICardController:SetShow(isVisible)
  self.gameObject:SetActive(isVisible);
  --self.root_Content.gameObject:SetActive(isVisible);
  --if not isVisible then
  --  TextureManager.SetPng(ETextureUseType.UI, "CardSmallBG", self.image_BG);
  --end
end

function UICardController:SetNFTData(cardId, count)
  self.cardData = collectNFTDatas[cardId];
  
  local warriorId = itemDatas[cardId].spare3;
  if warriorId == nil then return end
  
  local npcData = npcDatas[warriorId];
  if self.cardData == nil or npcData == nil then return end
  
  self:LoadFrames();
  TextureManager.SetPng(ETextureUseType.UI, string.Concat("C", warriorId), self.image_BG);
  self.text_Name.text = npcData.name;
  local rank = npcData.rare;
  if rank <= 3 then
    TextureManager.SetPng(ETextureUseType.UI, "CardFrame_0", self.image_Frame);
  elseif rank == 4 then
    TextureManager.SetPng(ETextureUseType.UI, "CardFrame_1", self.image_Frame);
  else
    TextureManager.SetPng(ETextureUseType.UI, "CardFrame_2", self.image_Frame);
  end
  
  for i = 1, 5 do
    self.image_Stars[i].gameObject:SetActive(rank >= i);
  end
  
  self.image_Element.color = Color.CareerKind[npcData.element][1];
  self.text_Element.text = string.GetElement(npcData.element);
  if count ~= nil then
    self.text_Count.text = string.Concat("x", count);
  else
    self.text_Count.text = "";
  end
end

function UICardController.EndOfLine4()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function UICardController.EndOfLine5()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function UICardController.EndOfLine6()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end