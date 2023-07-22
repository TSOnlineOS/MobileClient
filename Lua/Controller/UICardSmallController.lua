UICardSmallController = {}
UICardSmallController.__index = UICardSmallController;

function UICardSmallController.GetRShift(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function UICardSmallController.GetRShiftA(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function UICardSmallController.New(parent)
  local self = {};
  setmetatable(self, UICardSmallController);

  self.cardData = nil;  

  self.gameObject = poolMgr:Get("BaseCardSmall");
  self.transform = self.gameObject.transform;
  
  self.rectTransform = self.gameObject:GetComponent("RectTransform");
  self.rectTransform:SetParent(parent);
  self.rectTransform.anchorMin = Vector2.zero;
  self.rectTransform.anchorMax = Vector2.one;
  self.rectTransform.anchoredPosition = Vector2.zero;
  self.rectTransform.sizeDelta = Vector2.zero;
  self.rectTransform.localScale = Vector2.one;

  self.image_BG = self.transform:Find("Image_BG"):GetComponent("RawImage");
  self.root_Content = self.transform:Find("Root_Content");
  self.image_Pic = self.root_Content.transform:Find("Image_Pic"):GetComponent("RawImage");
  self.image_Frame = self.root_Content.transform:Find("Image_Frame"):GetComponent("RawImage");
  self.event_Frame = self.image_Frame.gameObject:GetComponent("UIEvent");
  self.image_Star = self.root_Content.transform:Find("RawImage_Star"):GetComponent("RawImage");
  self.text_Star = self.image_Star.transform:Find("Text"):GetComponent("Text");
  self.gameObject_RedDot = self.root_Content.transform:Find("Image_RedDot").gameObject;
  self.gameObject_RedDot:SetActive(false);

  self.uiCareer = UICareerController.New(self.root_Content.transform:Find("CareerRoot"));

  return self;
end

function UICardSmallController:OnClick()
  if self.clickEvent ~= nil then 
    self.clickEvent(self.cardData.id);
  end
end

function UICardSmallController.GetRShiftB(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function UICardSmallController.GetRShiftC(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function UICardSmallController.GetRShiftD(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function UICardSmallController.GetRShiftE(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function UICardSmallController:Destroy()
  self.uiCareer:Destroy();
  poolMgr:Release("BaseCardSmall", self.gameObject);  
end

function UICardSmallController:SetData(cardId, clickEvent, showElement, showStar)
  self.cardData = collectCardSortDatas[cardId];
  if self.cardData == nil or npcDatas[self.cardData.warriorId] == nil then 
    UICardSmallController:SetShow(false);
    return;
  end  

  if clickEvent ~= nil then 
    self.event_Frame:SetListener(EventTriggerType.PointerClick, clickEvent);
    self.event_Frame.parameter = cardId;
  end

  TextureManager.SetPng(ETextureUseType.UI, string.Concat(self.cardData.warriorId, "_S"), self.image_Pic);
  TextureManager.SetPng(ETextureUseType.UI, "CardStar", self.image_Star);      
  local rank = npcDatas[self.cardData.warriorId].rare;
  if rank <= 3 then 
    TextureManager.SetPng(ETextureUseType.UI, "CardSmallFrame_0", self.image_Frame);
  elseif rank == 4 then      
    TextureManager.SetPng(ETextureUseType.UI, "CardSmallFrame_1", self.image_Frame);
  else
    TextureManager.SetPng(ETextureUseType.UI, "CardSmallFrame_2", self.image_Frame);
  end  

  if showStar == true then 
    self.image_Star.gameObject:SetActive(true);
    self.text_Star.text = rank;
  else
    self.image_Star.gameObject:SetActive(false);
  end
  if showElement == true then
    self.uiCareer:SetCareer(0, npcDatas[self.cardData.warriorId].element, ECareer.None, true)
  else
    self.uiCareer:SetCareer();
  end
end

function UICardSmallController:SetShow(isVisible)
  self.root_Content.gameObject:SetActive(isVisible);
  if not isVisible then   
    TextureManager.SetPng(ETextureUseType.UI, "CardSmallBG", self.image_BG);
  end
end

function UICardSmallController.GetRShiftF(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function UICardSmallController.GetRShiftG(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function UICardSmallController.GetRShiftH(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function UICardSmallController:SetRedDot(active)
  self.gameObject_RedDot:SetActive(active);
end