
--[[
Now at that time, Judah went away from his brothers and became the friend of a man of Adullam named Hirah.
And there he saw the daughter of a certain man of Canaan named Shua, and took her as his wife.
And she gave birth to a son, and he gave him the name Er.
And again she gave birth to a son, and he gave him the name Onan.
Then she had another son, to whom she gave the name Shelah; she was at Chezib when the birth took place.
And Judah took a wife for his first son Er, and her name was Tamar.
Now Er, Judah's first son, did evil in the eyes of the Lord, so that he put him to death.
Then Judah said to Onan, Go in to your brother's wife and do what it is right for a husband's brother to do; make her your wife and get offspring for your brother.
But Onan, seeing that the offspring would not be his, went in to his brother's wife, but let his seed go on to the earth, so that he might not get offspring for his brother.
And what he did was evil in the eyes of the Lord, so that he put him to death, like his brother.
Then Judah said to Tamar, his daughter-in-law, Go back to your father's house and keep yourself as a widow till my son Shelah becomes a man: for he had in his mind the thought that death might come to him as it had come to his brothers. So Tamar went back to her father's house.
And after a time, Bath-shua, Judah's wife, came to her end; and after Judah was comforted for her loss, he went to Timnah, where they were cutting the wool of his sheep, and his friend Hirah of Adullam went with him.
And when Tamar had news that her father-in-law was going up to Timnah to the wool-cutting,
She took off her widow's clothing, and covering herself with her veil, she took her seat near Enaim on the road to Timnah; for she saw that Shelah was now a man, but she had not been made his wife.
--]]

UIItemController = {}
UIItemController.__index = UIItemController;

function UIItemController.New(parent, eventHandler, eventParameter)
  local self = {};
  setmetatable(self, UIItemController);

  self.itemId = 0;
  self.itemQuant = 0;
  self.itemSave = nil;

  self.gameObject = poolMgr:Get("BaseUIItem");
  self.transform = self.gameObject.transform;
  
  self.rectTransform = self.gameObject:GetComponent("RectTransform");
  self.rectTransform:SetParent(parent);
  self.rectTransform:SetSiblingIndex(0);
  self.rectTransform.anchorMin = Vector2.zero;
  self.rectTransform.anchorMax = Vector2.one;
  self.rectTransform.anchoredPosition = Vector2.zero;
  self.rectTransform.sizeDelta = Vector2.zero;
  self.rectTransform.localScale = Vector2.one;

  self.image_BG = self.transform:Find("Image_BG"):GetComponent("Image");
  self.image_Select = self.transform:Find("Image_Select"):GetComponent("Image");
  self.image_Lock = self.transform:Find("Image_Lock"):GetComponent("Image");

  self.rawImage_Icon = self.transform:Find("RawImage_Icon"):GetComponent("RawImage");
  self.rawImage_Light = self.transform:Find("RawImage_Light"):GetComponent("UIRawImage");
  self.RawImage_NFT = self.transform:Find("RawImage_NFT"):GetComponent("UIRawImage");
  
  self.godSkinStar = {};
  self.godSkinStar.root = self.transform:Find("GodSkinStar").gameObject;
  self.godSkinStar.stars = {};
  
  for i = 1, 6 do
    self.godSkinStar.stars[i] = self.godSkinStar.root.transform:Find(string.Concat("Image_Star (", i, ")")):GetComponent("Image");
  end

  self.text_Quant = self.transform:Find("Text_Quant"):GetComponent("Text");
  self.text_EnhanceLv = self.transform:Find("Text_EnhanceLv"):GetComponent("Text");

  self.event_Icon = self.rawImage_Icon.transform:GetComponent("UIEvent");
  self.event_Lock = self.image_Lock.transform:GetComponent("UIEvent");

  self.image_RedDot = self.transform:Find("Image_Dot"):GetComponent("Image");
  self.image_CheckMark = self.transform:Find("Image_CheckMark"):GetComponent("Image");
  
  self:SetItem(0);
  self:SetEvent(eventHandler, eventParameter);

  self.visualIndex = 0;

  return self;
end

function UIItemController.AviodCov()
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

function UIItemController.AviodCov1()
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

function UIItemController:Destroy()
  poolMgr:Release("BaseUIItem", self.gameObject);
end

function UIItemController.AviodCov2()
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

function UIItemController:SetItem(itemId, quant, itemSave, alwaysShowNumber)
  self.itemId = itemId;
  self.itemQuant = quant;
  self.itemSave = itemSave;

  self.image_BG.gameObject:SetActive(false);
  self.image_Lock.gameObject:SetActive(false);
  self.image_Select.gameObject:SetActive(false);

  self.rawImage_Icon.gameObject:SetActive(false);
  self.rawImage_Light.gameObject:SetActive(false);
  self.RawImage_NFT.gameObject:SetActive(false);
  self.image_RedDot.gameObject:SetActive(false);
  self.image_CheckMark.gameObject:SetActive(false);
  self.godSkinStar.root:SetActive(false);

  self.text_Quant.text = "";
  self.text_EnhanceLv.text = "";

  if itemId == nil then return end

  local itemData = itemDatas[itemId];
  if itemData == nil then return end

  itemData:SetIcon(self.rawImage_Icon);
  if itemSave ~= nil and itemSave.damage ~= nil then
    if itemSave.damage >= Item.durable then
      if itemDatas[itemSave.Id].fitType == EItemFitType.Equip_Hand then
        itemDatas[10037]:SetIcon(self.rawImage_Icon);--損壞的鋤頭
      else
        itemDatas[23024]:SetIcon(self.rawImage_Icon);--損壞的
      end
    end
    if itemSave.damage >= EThingsDurability.Damaged then
      self.image_Lock.gameObject:SetActive(true);
      self.image_Lock.sprite = UI.GetSprite("icon040");
      LuaHelper.SetColor(self.image_Lock, Color.Red);
    elseif itemSave.damage >= EThingsDurability.Normal and itemSave.damage < EThingsDurability.Damaged then
      self.image_Lock.gameObject:SetActive(true);
      self.image_Lock.sprite = UI.GetSprite("icon040");
      LuaHelper.SetColor(self.image_Lock, Color.White);
    end
  end

  self.rawImage_Icon.gameObject:SetActive(true);

  self.image_BG.gameObject:SetActive(Item.IsStyle(itemData.fitType));

  if Item.IsGodSkinKind(itemData.kind) then
    local starLv = itemData.threshold;
    self.godSkinStar.root:SetActive(true);
    
    for i = 1, 6 do
      if i > starLv then
        self.godSkinStar.stars[i].enabled = false;
      else
        self.godSkinStar.stars[i].enabled = true;
      end
    end
  else
    self.godSkinStar.root:SetActive(false);
  end

  if itemSave ~= nil and ((itemSave.stoneLv ~= nil and itemSave.stoneLv >= 1 and itemSave.stoneLv <= Item.MaxStoneLv) or (Item.IsSoul(itemData.kind)) and itemData.quality > 0 ) then
    local picName = "";
    if Between(itemSave.stoneLv, 1, 5) or itemData.quality == 1 then
      picName = "Light_green01";
    elseif Between(itemSave.stoneLv, 6, 10) or itemData.quality == 2 then
      picName = "Light_bule01";
    elseif Between(itemSave.stoneLv, 11, 15) or itemData.quality == 3 then
      picName = "Light_purple01";
    end
  
    TextureManager.SetPng(ETextureUseType.UI, picName, self.rawImage_Light);
  
    self.rawImage_Light:ShiftUV(1, 3, 0.5, -1);

    self.rawImage_Light.gameObject:SetActive(true);
  else
    self.rawImage_Light.gameObject:SetActive(false);
  end
  
  if bit.band(itemData.restrict2, 32) == 32 then
    TextureManager.SetPng(ETextureUseType.UI, "Light_nft", self.RawImage_NFT);
    self.RawImage_NFT:ShiftUV(1, 4, 0.5, -1);
    self.RawImage_NFT.gameObject:SetActive(true);
  else
    self.RawImage_NFT.gameObject:SetActive(false);
  end
  
  if Item.IsGodSkinKind(itemData.kind)then
    self.RawImage_NFT.gameObject:SetActive(true);
    local picName = "";
    
    if itemData.quality == 1 then
      picName = "GodSkin_Green";
    elseif itemData.quality == 2 then
      picName = "GodSkin_Blue";
    elseif itemData.quality == 3 then
      picName = "GodSkin_Purple";
    elseif itemData.quality == 4 then
      picName = "GodSkin_Red";
    else
      picName = "GodSkin_Gray";
    end
  
    TextureManager.SetPng(ETextureUseType.UI, picName, self.RawImage_NFT);
    self.RawImage_NFT:ShiftUV(1, 1, 1, -1);
  else
    self.RawImage_NFT.gameObject:SetActive(false);
  end
  
  if Contains(itemData.kind , EItemKind.Myth) then
    if itemSave ~= nil and itemSave.mythLv > 0 then
      self.text_Quant.text = string.Concat("+", itemSave.mythLv);
    else
      self.text_Quant.text = "";
    end
  end
  
  if quant ~= nil and (alwaysShowNumber == true or quant > 1) then
    self.text_Quant.text = quant;
  end

  if itemSave ~= nil and itemSave.bagIndex ~= nil and Define.IsDebugMode() and UIBag.showIndex then
    self.text_Quant.text = string.Concat(self.text_Quant.text, string.GetColorText(string.Concat("(", itemSave.bagIndex, ")"), Color.Red));
  end

  if quant ~= nil and itemData:IsDirectUse() then
    if quant ~= 0 then
      self.text_Quant.text = itemData.attribute[1].value * quant;
    end
  end

  if quant ~= nil and Contains(itemId, 65391, 65392) then  --經驗值%
    self.text_Quant.text = string.Concat(itemData.attribute[1].value * quant, "%");
  end

  if Contains(itemId, 55431, 55432, 55433, 55434) and UI.IsVisible(UIMine) then  --挖礦飽食道具
    if quant == nil then
      self.text_Quant.text = 0;
    else
      self.text_Quant.text = quant;
    end
  end

  if itemData.specialAbility == EItemUseKind.ItemUse_222 then
    self.text_Quant.text = "";
  end

  if Item.IsSoul(itemData.kind) then
    if itemSave ~= nil then
      if itemSave.isLock then
        self.text_Quant.text = "L";
      end
    end
  end

  --升階等級
  if itemSave ~= nil and itemSave.Reinforced ~= 0 and Item.IsEquip(itemData.fitType) then
    self.text_Quant.text = string.Concat(self.text_Quant.text, string.GetColorText(string.Concat("+", itemSave.Reinforced), Color.Yellow));
  end

  if itemSave ~= nil and itemSave.enhanceLv ~= 0 and not Item.IsStyle(itemData.fitType) then
    self.text_EnhanceLv.text = string.Concat("+", itemSave.enhanceLv);
  end

  if itemSave ~= nil and itemSave.styleLv ~=nil and itemSave.styleLv ~= 0 and Item.IsStyle(itemData.fitType) and not Item.IsSoul(itemData.kind) then
    self.text_EnhanceLv.text = string.Concat("+", itemSave.styleLv);
  end

  if Item.IsSoul(itemData.kind) and itemSave ~= nil then
    if itemSave.starLv == 0 then
      self.text_EnhanceLv.text = "";
    else
      self.text_EnhanceLv.text = string.Concat("+", itemSave.starLv);
    end
  end
end

function UIItemController.AviodCov3()
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

function UIItemController.AviodCov4()
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

function UIItemController.AviodCov5()
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

function UIItemController:SetEvent(eventHandler, eventParameter, index)
  self.event_Icon:ClearListener();
  self.event_Lock:ClearListener();

  if eventHandler ~= nil then
    self.event_Icon:SetListener(EventTriggerType.PointerClick, eventHandler);
    self.event_Icon.parameter = eventParameter;
    self.visualIndex = index;

    self.event_Lock:SetListener(EventTriggerType.PointerClick, eventHandler);
    self.event_Lock.parameter = eventParameter;
    self.visualIndex = index;

  else
    self.event_Icon:SetListener(EventTriggerType.PointerClick, UIItemController.OnClick);
    self.event_Icon.parameter = self;

    self.event_Lock:SetListener(EventTriggerType.PointerClick, UIItemController.OnClick);
    self.event_Lock.parameter = self;

  end
end

function UIItemController:GetVisualIndex()
  return self.visualIndex;
end

function UIItemController:SetLock(value)
  self.image_Lock.gameObject:SetActive(value);

  if value then
    self.image_Lock.sprite = UI.GetSprite("bod008");
    LuaHelper.SetColor(self.image_Lock, Color.White);
  end
end

function UIItemController.AviodCov6()
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

function UIItemController.AviodCov7()
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

function UIItemController:SetSelect(value)
  self.image_Select.gameObject:SetActive(value);
  
  if not value then return end

  self.image_Select.raycastTarget = false;
  self.image_Select.color = LuaHelper.GetColor(0, 255, 0, 120);
end

function UIItemController:SetInUse(value)
  self.image_Select.gameObject:SetActive(value);

  if not value then return end

  self.image_Select.raycastTarget = value;
  self.image_Select.color = LuaHelper.GetColor(128, 128, 128, 200);
end

function UIItemController:SetRedDot(value)
  self.image_RedDot.gameObject:SetActive(value);
end

function UIItemController:SetCheckMark(value)
  self.image_CheckMark.gameObject:SetActive(value);
end

function UIItemController:SetLight(value)
  self.rawImage_Light.gameObject:SetActive(value);
end

function UIItemController.AviodCov8()
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

function UIItemController.AviodCov9()
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


function UIItemController.AviodCov10()
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

function UIItemController:SetNFTLight(value)
  self.RawImage_NFT.gameObject:SetActive(value);
end

function UIItemController:SetIcon(value)
  self.rawImage_Icon.gameObject:SetActive(value);
end

function UIItemController:SetIconTexture(iconId)
  UI.SetIcon(iconId, self.rawImage_Icon);
end

function UIItemController:SetImageBG(valuse)
  self.image_BG.gameObject:SetActive(valuse);
end

function UIItemController:SetBaseUIItemSizeDelta(hight, width)
  self.transform.sizeDelta = Vector2.New(hight,width);
end

--[[
And Isaac answering said, But I have made him your master, and have given him all his brothers for servants; I have made him strong with grain and wine: what then am I to do for you, my son?
And Esau said to his father, Is that the only blessing you have, my father? give a blessing to me, even me! And Esau was overcome with weeping.
Then Isaac his father made answer and said to him, Far from the fertile places of the earth, and far from the dew of heaven on high will your living-place be:
By your sword will you get your living and you will be your brother's servant; but when your power is increased his yoke will be broken from off your neck.
So Esau was full of hate for Jacob because of his father's blessing; and he said in his heart, The days of weeping for my father are near; then I will put my brother Jacob to death.
Then Rebekah, hearing what Esau had said, sent for Jacob, her younger son, and said to him, It seems that your brother Esau is purposing to put you to death.
So now, my son, do what I say: go quickly to Haran, to my brother Laban;
And be there with him for a little time, till your brother's wrath is turned away;
Till the memory of what you have done to him is past and he is no longer angry: then I will send word for you to come back; are the two of you to be taken from me in one day?
Then Rebekah said to Isaac, My life is a weariness to me because of the daughters of Heth: if Jacob takes a wife from among the daughters of Heth, such as these, the women of this land, of what use will my life be to me?
--]]

function UIItemController.OnClick(uiEvent)
  local self = uiEvent.parameter;

  if self.itemId == nil then return end

  UIItemInfo.Show(self.itemId, self.itemSave);
end