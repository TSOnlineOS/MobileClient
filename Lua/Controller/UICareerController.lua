UICareerController = {}
UICareerController.__index = UICareerController;

--[[
Then Joseph, unable to keep back his feelings before those who were with him, gave orders for everyone to be sent away, and no one was present when he made clear to his brothers who he was.
And so loud was his weeping, that it came to the ears of the Egyptians and all Pharaoh's house.
And Joseph said to his brothers, I am Joseph: is my father still living? But his brothers were not able to give him an answer for they were troubled before him.
Then Joseph said to his brothers, Come near to me. And they came near, And he said, I am Joseph your brother, whom you sent into Egypt.
Now do not be troubled or angry with yourselves for sending me away, because God sent me before you to be the saviour of your lives.
For these two years have been years of need, and there are still five more years to come in which there will be no ploughing or cutting of grain.
God sent me before you to keep you and yours living on earth so that you might become a great nation.
So now it was not you who sent me here, but God: and he has made me as a father to Pharaoh, and lord of all his house, and ruler over all the land of Egypt.
Now go quickly to my father, and say to him, Your son Joseph says, God has made me ruler over all the land of Egypt: come down to me straight away:
The land of Goshen will be your living-place, and you will be near me; you and your children and your children's children, and your flocks and herds and all you have:
And there I will take care of you, so that you and your family may not be in need, for there are still five bad years to come.
Now truly, your eyes see, and the eyes of my brother Benjamin see, that it is my mouth which says these things to you.
Give my father word of all my glory in Egypt and of all you have seen; and come back quickly with my father.
Then, weeping, he took Benjamin in his arms, and Benjamin himself was weeping on Joseph's neck.
Then he gave a kiss to all his brothers, weeping over them; and after that his brothers had no fear of talking to him.
And news of these things went through Pharaoh's house, and it was said that Joseph's brothers were come; and it seemed good to Pharaoh and his servants.
--]]

function UICareerController.New(parent)
  local self = {};
  setmetatable(self, UICareerController);

  self.gameObject = poolMgr:Get("BaseUICareer");
  self.transform = self.gameObject.transform;
  
  self.rectTransform = self.gameObject:GetComponent("RectTransform");
  self.rectTransform:SetParent(parent.transform);
  self.rectTransform:SetSiblingIndex(0);
  self.rectTransform.localScale = Vector3.one;
  self.rectTransform.anchorMin = Vector2.New(0.5, 0.5);
  self.rectTransform.anchorMax = Vector2.New(0.5, 0.5);
  self.rectTransform.anchoredPosition = Vector2.zero;

  self.image_Career = self.transform:GetComponent("Image");
  self.image_Frame = self.transform:Find("Image_Frame"):GetComponent("Image");
  self.text_Career = self.transform:Find("Text_Career"):GetComponent("Text");
  self.outline = self.text_Career:GetComponent("Outline8");
  self.gradientColor = self.text_Career:GetComponent("GradientColor");

  return self;
end

function UICareerController:Destroy()
  poolMgr:Release("BaseUICareer", self.gameObject);
end

function UICareerController:SetCareer(turn, element, career, isNpc, turn3Element)
  if element ~= nil then
    if turn == 0 then
      self.image_Frame.sprite = UI.GetSprite("icon039");
    elseif turn == 1 then
      self.image_Frame.sprite = UI.GetSprite("icon039B");
      
    elseif turn == 2 then
      self.image_Frame.sprite = UI.GetSprite("icon039C");
      
    elseif turn == 3 then
      if turn3Element == 7 then 
        self.image_Frame.sprite = UI.GetSprite("icon078");
      elseif turn3Element == 8 then 
        self.image_Frame.sprite = UI.GetSprite("icon079");
      else
        self.image_Frame.sprite = UI.GetSprite("icon039D");
      end
    end
  
    if turn == 0 then
      self.text_Career.text = string.GetElement(element);
    elseif turn >= 1 then
      if isNpc then
        self.text_Career.text = string.GetElement(element);
      else
        self.text_Career.text = string.GetCareer(career);
      end
    end

    self:SetColor(element);

    self.gameObject:SetActive(true);
  else
    self.gameObject:SetActive(false);
  end
  
  self.image_Career.sprite = UI.GetSprite("icon038");
  self.text_Career.color = Color.White;
end

function UICareerController.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function UICareerController.Script1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function UICareerController.Script2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function UICareerController:SetColor(element)
  self.image_Career.color = Color.CareerKind[element][1];
  self.outline.effectColor = Color.CareerKind[element][2];
  self.gradientColor.colorBottom = Color.CareerKind[element][3];
end

function UICareerController:SetCareerForDispatch(element)
  self.image_Career.sprite = UI.GetSprite("icon061");
  self.text_Career.color = LuaHelper.GetColor(188, 190, 187, 255);
  self.image_Career.color = Color.White;
  self.outline.effectColor = Color.Gray;
  self.gradientColor.colorBottom = Color.White;
  self.text_Career.text = string.GetElement(element);
end

function UICareerController.Script3()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function UICareerController.Script4()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function UICareerController:SetGray()
  self.image_Career.sprite = UI.GetSprite("icon061");
  self.text_Career.color = LuaHelper.GetColor(188, 190, 187, 255);
  self.image_Career.color = Color.White;
  self.outline.effectColor = Color.Gray;
  self.gradientColor.colorBottom = Color.White;
end

function UICareerController.Script5()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function UICareerController.Script6()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end