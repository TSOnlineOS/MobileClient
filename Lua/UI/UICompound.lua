EUICompoundTag = {
  Compound = 1, --合成
  Refinery = 2, --煉化
  Element = 3, --精煉
  Proof = 4, --鑲崁
  --TianGuan = 5, --天官
  Remove = 5, --消除
  Evolution = 6, --進化
  WeaponEnhance = 7, --強化
  Reinforcd = 8, --升階
  Affix = 9, --洗鍊
}

ECompoundEffect = {
  Compound = 0,
  Success = 1,
  Fail = 2,
}

UICompound = {}
local this = UICompound;

this.name = "UICompound";
this.uiController = nil;
this.MaxCount = 3;

local EAffixMode = {
  None = 0,
  Info = 1,
  Check = 2,
}

local EvoMode = {
  None = 0,
  Style = 1,
  Hermes = 2,
}

--ui
local transform_FrameRect;
local gameObject_QuestionMark;
local text_Content;
local text_Submit;
local text_Rate;
local text_Required;
local text_AffixInfoRequired;
local text_AffixCheckRequired;
local text_Warning;
local text_Detail;
local text_EquipName;
local rawImage_Mixed;
local uiCompounds = {};
local uiAffixInfo = {};
local uiAffixCheck = {};
local event_EvolutionSelect;
local gameObject_Affix;
local gameObject_AffixSliders;
local gameObject_AffixItems;
local gameObject_Affix_Check;
local gameObject_Affix_Detail;
local gameObject_CloseDetail;
local gameObject_ChangeArrow;
local image_Submit;
local image_Cancel;
local scroll_ContentRect;
local rawImageBgRight;
local rawImageBgLeft;
local rawImageBgCenter;

--var
local currentTag = EUICompoundTag.Compound;
local evolutionSelect = 1;
local tagDatas = {};
local compoundInfos = {};
local affixInfos = {};
local maxReinforced = 15;
local currentAffix = {};
local currentReinforced = 0;
local sliderIndex = 0;
local tableIndex = 0;
local arrowY = 0;
local isContinue = false;
local currentEvo = EvoMode.None;
local currentstyleLv = 0;
local styleSafeLv = 3;

local function GetItemCount(bagIndex)
  local count = 0;
  for i = 1, this.MaxCount do
    if compoundInfos[i] ~= nil and compoundInfos[i].bagIndex == bagIndex then
      count = count + compoundInfos[i].quant;
    end
  end

  return count;
end

function UICompound.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;
  this.uiController.onClose = this.OnClose;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;
  gameObject_QuestionMark = uiController:FindGameObject("Image_QuestionMark");

  text_Content = uiController:FindText("Text_Content");
  text_Submit = uiController:FindText("Text_Submit");
  text_Rate = uiController:FindText("Text_Rate");
  text_Required = uiController:FindText("Text_Required");
  text_AffixInfoRequired = uiController:FindText("Text_AffixInfoRequired");
  text_AffixCheckRequired = uiController:FindText("Text_AffixCheckRequired");
  text_EquipName = uiController:FindText("Text_EquipName");
  text_Warning = uiController:FindText("Text_Warning");
  text_Detail = uiController:FindText("Text_Detail");

  gameObject_Affix = uiController:FindGameObject("Affix");
  gameObject_AffixSliders = uiController:FindGameObject("Sliders");
  gameObject_AffixItems = uiController:FindGameObject("Items");
  gameObject_Affix_Check = uiController:FindGameObject("Affix_Check");
  gameObject_Affix_Detail = uiController:FindGameObject("Affix_Detail");
  gameObject_CloseDetail = uiController:FindGameObject("Image_Close");
  gameObject_ChangeArrow = uiController:FindGameObject("Image_ChangeArrow"):GetComponent("RectTransform");
  arrowY = gameObject_ChangeArrow.anchoredPosition.y;

  local tempTransform = uiController:FindGameObject("Left").transform;
  for i = 1, 6 do
    local baseTransform = tempTransform:Find(string.Concat("Image_CompoundBG (", i, ")"));
    uiCompounds[i] = {};
    uiCompounds[i].gameObject = baseTransform.gameObject;
    uiCompounds[i].image_BG = baseTransform:GetComponent("Image");
    uiCompounds[i].item = UIItemController.New(baseTransform);
    uiCompounds[i].text_Hint = baseTransform:Find("Text_Hint"):GetComponent("Text");
    uiCompounds[i].arrow = baseTransform:Find("Image_Arrow");
  end

  rawImage_Mixed = uiController:FindRawImage("RawImage_Mixed");
  rawImage_Mixed.enabled = false;
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------

  image_Submit = uiController:FindEvent("Image_Submit");
  image_Submit:SetListener(EventTriggerType.PointerClick, this.OnClick_Submit);

  image_Cancel = uiController:FindEvent("Image_Cancel");
  image_Cancel:SetListener(EventTriggerType.PointerClick, this.OnClick_Cancel);

  local tempEvent = uiController:FindEvent("Image_Close");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_CloseDetail);

  tempEvent = uiController:FindEvent("Image_AffixCancel");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_AffixCancel);

  tempEvent = uiController:FindEvent("Image_AffixContinue");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_AffixContinue);

  tempEvent = uiController:FindEvent("Image_AffixSubmit");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_AffixSubmit);

  event_EvolutionSelect = uiController:FindEvent("Image_EvolutionSelect");
  event_EvolutionSelect:SetListener(EventTriggerType.PointerClick, this.OnClick_EvolutionSelect);

  tempTransform = gameObject_Affix_Check.transform;
  for i = 1, 3 do
    local baseTransform = tempTransform:Find(string.Concat("Slider (", i, ")"));
    uiAffixCheck[i] = {};
    uiAffixCheck[i].option = baseTransform:Find("Option").gameObject;
    uiAffixCheck[i].lock = baseTransform:Find("Image_Lock").gameObject;
    uiAffixCheck[i].Checkbox = baseTransform:Find("Option"):Find("Image_Use"):GetComponent("UIEvent");
    uiAffixCheck[i].Checkbox:SetListener(EventTriggerType.PointerClick, this.OnClick_AffixCheckbox);
    uiAffixCheck[i].Checkbox.parameter = i;
    uiAffixCheck[i].CheckboxImage = baseTransform:Find("Option"):Find("Image_Use"):GetComponent("Image");
    uiAffixCheck[i].slider = baseTransform:Find("Slider_Value"):GetComponent("UISlider");
    uiAffixCheck[i].sliderText = baseTransform:Find("Slider_Value"):Find("Text_Attrs"):GetComponent("Text");
    tempEvent = baseTransform:Find("Option"):Find("Image_Pr"):GetComponent("UIEvent");
    uiAffixCheck[i].probImage = tempEvent:GetComponent("Image");
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Pr);
    tempEvent.parameter = i;

    if i <= 2 then
      baseTransform = tempTransform:Find(string.Concat("Image_CompoundBG (", i, ")"));
      uiAffixCheck[i].item = UIItemController.New(baseTransform);
    end
  end

  for i = 1, 3 do
    local baseTransform = gameObject_AffixSliders.transform:Find(string.Concat("SliderBar (", i, ")"));
    uiAffixInfo[i] = {};
    uiAffixInfo[i].option = baseTransform:Find("Option").gameObject;
    uiAffixInfo[i].lock = baseTransform:Find("Image_Lock").gameObject;
    uiAffixInfo[i].Checkbox = baseTransform:Find("Option"):Find("Image_Use"):GetComponent("UIEvent");
    uiAffixInfo[i].Checkbox:SetListener(EventTriggerType.PointerClick, this.OnClick_AffixCheckbox);
    uiAffixInfo[i].Checkbox.parameter = i;
    uiAffixInfo[i].CheckboxImage = baseTransform:Find("Option"):Find("Image_Use"):GetComponent("Image");

    uiAffixInfo[i].slider = baseTransform:Find("Slider_Value"):GetComponent("UISlider");
    uiAffixInfo[i].sliderText = baseTransform:Find("Slider_Value"):Find("Text_Attrs"):GetComponent("Text");

    tempEvent = baseTransform:Find("Option"):Find("Image_Pr"):GetComponent("UIEvent");
    uiAffixInfo[i].probImage = tempEvent:GetComponent("Image");
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Pr);
    tempEvent.parameter = i;

    tempTransform = gameObject_AffixItems.transform;
    if Contains(i, 1, 2) then
      baseTransform = tempTransform:Find(string.Concat("Image_CompoundBG (", i, ")"));
      uiAffixInfo[i].item = UIItemController.New(baseTransform);
    end
  end

  tempTransform = gameObject_Affix_Detail.transform;
  scroll_ContentRect = tempTransform:Find("ScrollRect"):Find("Viewport"):Find("ScrollContent"):GetComponent("RectTransform");

  rawImageBgRight = uiController:FindRawImage("RawImage_RightBG");
  rawImageBgLeft = uiController:FindRawImage("RawImage_LeftBG");
  rawImageBgCenter = uiController:FindRawImage("RawImage_Center");
end

function UICompound.SetPng()
  if rawImageBgRight.texture == nil then
    TextureManager.SetPng(ETextureUseType.UI, "common0_bod113", rawImageBgRight);
  end

  if rawImageBgLeft.texture == nil then
    TextureManager.SetPng(ETextureUseType.UI, "common0_bod113", rawImageBgLeft);
  end

  if rawImageBgCenter.texture == nil then
    TextureManager.SetPng(ETextureUseType.UI, "common0_com075", rawImageBgCenter);
  end
end

function UICompound.OnOpen(tag)
  if tag ~= nil then
    currentTag = tag;
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  else
    currentTag = EUICompoundTag.Compound;
  end

  if currentAffix.status == nil then
    currentAffix.status = EAffixMode.None;
  end

  text_Warning.text = "";

  this.UpdateAffixStatus();

  --tag
  tagDatas = {};
  tagDatas[1] = { string.Get(50332), nil };
  tagDatas[2] = { string.Get(99681), nil };
  tagDatas[3] = { string.Get(10080), nil };
  tagDatas[4] = { string.Get(10081), nil };
  --tagDatas[5] = { string.Get(21984), nil };
  tagDatas[5] = { string.Get(22178), nil };
  tagDatas[6] = { string.Get(22294), nil };
  tagDatas[7] = { string.Get(20029), nil };
  tagDatas[8] = { string.Get(23044), nil };
  tagDatas[9] = { string.Get(23048), nil };

  return true;
end

function UICompound.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(50332), this.OnClick_Close, this.OnClick_Help, this.OnClick_Tag, tagDatas, currentTag);

    this.UpdateUI();
  end
end

function UICompound.OnClose()
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  Item.ClearAllInUse();

  UI.Close(UIBag);

  return true;
end

function UICompound.ClearData()
  Item.ClearAllInUse();

  table.Clear(compoundInfos);

  if currentTag == EUICompoundTag.Evolution then
    UI.Close(UIBag);
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  end

  this.StopMixEffect();
  this.UpdateUI();
end

function UICompound.UpdateUI()
  this.UpdateCompound();
  this.UpdateRefinery();
  this.UpdateElement();
  this.UpdateProof();
  --this.UpdateTianGuan();
  this.UpdateRemove();
  this.UpdateEvolution();
  this.UpdateEnhance();
  this.UpdateReinforce();
  this.UpdateAffix();
end

--合成
function UICompound.UpdateCompound()
  if currentTag ~= EUICompoundTag.Compound then return end

  event_EvolutionSelect.gameObject:SetActive(false);

  for i = 1, 6 do
    if Contains(i, 1, 2, 3, 4) then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com006");
      uiCompounds[i].text_Hint.text = "";
      uiCompounds[i].gameObject:SetActive(true);
    else
      uiCompounds[i].image_BG.sprite = nil;
      uiCompounds[i].text_Hint.text = "";
      uiCompounds[i].gameObject:SetActive(false);
    end

    if compoundInfos[i] ~= nil then
      local itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[i].bagIndex);
      if itemSave ~= nil then
        uiCompounds[i].item:SetItem(itemSave.Id, compoundInfos[i].quant, itemSave);
      else
        compoundInfos[i] = nil;
        uiCompounds[i].item:SetItem(0);
      end
    else
      uiCompounds[i].item:SetItem(0);
    end
    uiCompounds[i].item:SetEvent();
  end

  text_Content.text = "";
  text_Submit.text = string.Get(50332);

  this.StopMixEffect();
  
  UI.Open(UIBag,
    function(bagIndex, itemId)
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, 0,
        string.Get(50332),
        function(bagKind, bagIndex, followIndex)
          local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
          if itemSave == nil then return end
          if Item.IsLock(itemSave) then return end

          local emptyIndex = 0;
          for i = 1, this.MaxCount do
            if compoundInfos[i] == nil then
              emptyIndex = i;
              break;
            end
          end

          if emptyIndex == 0 then
            ShowCenterMessage(string.Get(21131));  --合成欄位已滿
            return;
          end

          local count = GetItemCount(bagIndex);

          local itemData = itemDatas[itemSave.Id];

          if itemData == nil then return end

          if Item.IsTypeOfEquips(itemData.fitType) then
            Item.SetItemInUse(bagIndex);

            if count >= 1 then
              ShowCenterMessage(string.Get(10136));  --輸入超過持有數量
              return;
            end
          else
            if count >= itemSave.quant then
              ShowCenterMessage(string.Get(10136));  --輸入超過持有數量
              return;
            end
          end

          UI.Close(UIItemInfo);

          if itemSave.quant > 1 and itemSave.quant - count > 1 then
            ShowCountInput(string.Get(30061), 1, itemSave.quant - count,
              function(text)
                if text == nil then return end
                if tonumber(text) == 0 then return end
                if string.IsNullOrEmpty(text) then return end

                compoundInfos[emptyIndex] = {};
                compoundInfos[emptyIndex].bagIndex = bagIndex;
                compoundInfos[emptyIndex].itemId = itemSave.Id;
                compoundInfos[emptyIndex].quant = tonumber(text);

                if GetItemCount(bagIndex) >= itemSave.quant then
                  Item.SetItemInUse(bagIndex);
                end

                compoundInfos[4] = nil;
                this.UpdateUI();
              end
            );
          else
            compoundInfos[emptyIndex] = {};
            compoundInfos[emptyIndex].bagIndex = bagIndex;
            compoundInfos[emptyIndex].itemId = itemSave.Id;
            compoundInfos[emptyIndex].quant = 1;

            if GetItemCount(bagIndex) >= itemSave.quant then
              Item.SetItemInUse(bagIndex);
            end

            compoundInfos[4] = nil;
            this.UpdateUI();
          end
        end
      );
    end,
    Vector2.New(260, -25),
    false,
    nil,
    function(itemSave)
      if itemDatas[itemSave.Id] == nil then return false end
      if itemSave.isVender then return false end
      if itemSave.isDeliver then return false end
      if itemDatas[itemSave.Id].kind == EItemKind.Pearl then return false end
      if itemDatas[itemSave.Id].kind == EItemKind.Gem then return false end
      if itemDatas[itemSave.Id].kind == EItemKind.Remove then return false end
      if itemDatas[itemSave.Id].kind == EItemKind.Ice then return false end
      if itemDatas[itemSave.Id].kind == EItemKind.Item_22 then return false end
      if itemDatas[itemSave.Id].kind == EItemKind.Reinforced then return false end
      if itemDatas[itemSave.Id].kind == EItemKind.ExclusiveWeapon then return false end
      if bit.band(itemDatas[itemSave.Id].restrict, 4) ~= 0 then return false end

      return true;
    end
  );
end

--煉化
function UICompound.UpdateRefinery()
  if currentTag ~= EUICompoundTag.Refinery then return end
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  event_EvolutionSelect.gameObject:SetActive(false);
  
  for i = 1, 6 do
    if i == 1 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com007");
      uiCompounds[i].text_Hint.text = string.Get(10077);
      uiCompounds[i].gameObject:SetActive(true);
    elseif i == 3 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com014");
      uiCompounds[i].text_Hint.text = string.Get(10078);
      uiCompounds[i].gameObject:SetActive(true);
    elseif i == 4 then
      uiCompounds[4].image_BG.sprite = UI.GetSprite("com012");
      uiCompounds[4].text_Hint.text = string.Get(20165);
      uiCompounds[4].gameObject:SetActive(true);
    else
      uiCompounds[i].image_BG.sprite = nil;
      uiCompounds[i].text_Hint.text = "";
      uiCompounds[i].gameObject:SetActive(false);
    end

    if compoundInfos[i] ~= nil then
      local itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[i].bagIndex);
      if itemSave ~= nil then
        uiCompounds[i].item:SetItem(itemSave.Id, itemSave.quant, itemSave);
      else
        compoundInfos[i] = nil;
        uiCompounds[i].item:SetItem(0);
      end
    else
      uiCompounds[i].item:SetItem(0);
    end
    uiCompounds[i].item:SetEvent();
  end

  local content = "";
  if compoundInfos[4] ~= nil then
    local itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[4].bagIndex);
    if itemSave ~= nil then
      local stoneAttr = itemSave.stoneAttr;
      local stoneLv = itemSave.stoneLv;

      if stoneAttr == 0 then
        stoneLv = 0;
        if compoundInfos[1] ~= nil and Contains(Compound.GetStoneKind(compoundInfos[1].itemId), 1, 2) then
          stoneAttr = Compound.GetStoneAttr(compoundInfos[1].itemId);
        end
      end
      
      content = string.Concat(itemDatas[itemSave.Id]:GetName(true), "\n");

      if stoneAttr ~= 0 then
        if stoneLv == 0 then
          content = string.Concat(content, string.format(string.Get(80319), Item.GetStoneAttrStr(stoneAttr)), "\n");
        else
          content = string.Concat(content, string.format(string.Get(80320), stoneLv, Item.GetStoneAttrStr(stoneAttr, true), Item.GetAttrHintStr(stoneAttr, stoneLv)), "\n");
        end

        content = string.Concat(content, string.GetColorText(string.format(string.Get(80320), stoneLv + 1, Item.GetStoneAttrStr(stoneAttr, true), Item.GetAttrHintStr(stoneAttr, stoneLv + 1)), Color.Gray));
      end
    end
  end

  text_Content.text = content;
  text_Submit.text = string.Get(99681);

  this.StopMixEffect();
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------

  UI.Open(UIBag,
    function(bagIndex, itemId)
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, 0,
        string.Get(99681),
        function(bagKind, bagIndex, followIndex)
          local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
          if itemSave == nil then return end
          if Item.IsLock(itemSave) then return end

          UI.Close(UIItemInfo);

          if Item.IsTypeOfEquips(itemDatas[itemId].fitType) or Contains(itemDatas[itemId].kind, EItemKind.SoulWeapon, EItemKind.NpcEquip, EItemKind.SoulEquip) then
            if itemSave.stoneLv >= Item.MaxStoneLv then
              ShowCenterMessage(string.Get(80324));
              return;
            end

            compoundInfos[4] = {};
            compoundInfos[4].itemId = itemId;
            compoundInfos[4].bagIndex = bagIndex;
            compoundInfos[4].quant = itemSave.quant;
          elseif itemDatas[itemId].kind == EItemKind.Gem then
            local index = 1;
            if Contains(itemDatas[itemId].threshold, 3, 5) then
              index = 3;
            end
            
            compoundInfos[index] = {};
            compoundInfos[index].itemId = itemId;
            compoundInfos[index].bagIndex = bagIndex;
            compoundInfos[index].quant = itemSave.quant;
          end

          this.UpdateUI();
        end
      );
    end,
    Vector2.New(260, -25),
    false,
    nil,
    function(itemSave)
      if itemDatas[itemSave.Id] == nil then return false end
      if itemSave.isVender then return false end
      if itemSave.isDeliver then return false end
      if bit.band(itemDatas[itemSave.Id].restrict, 4) ~= 0 then return false end
      if itemDatas[itemSave.Id].kind ~= EItemKind.Gem and
              not Item.IsTypeOfEquips(itemDatas[itemSave.Id].fitType) and
              not Contains(itemDatas[itemSave.Id].kind, 57, 59, 62) and
              not bit.band(itemDatas[itemSave.Id].restrict, 4) ~= 4 and
              not itemDatas[itemSave.Id].kind ~= EItemKind.Feather and
              not itemDatas[itemSave.Id].kind ~= EItemKind.Ice then return false end

      return true;
    end
  );

  this.UpdaetInUse();
end

--精煉
function UICompound.UpdateElement()
  if currentTag ~= EUICompoundTag.Element then return end

  event_EvolutionSelect.gameObject:SetActive(false);

  for i = 1, 6 do
    if i == 1 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com012");
      uiCompounds[i].text_Hint.text = string.Get(20165);
      uiCompounds[i].gameObject:SetActive(true);
    elseif i == 3 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com008");
      uiCompounds[i].text_Hint.text = string.Get(50203);
      uiCompounds[i].gameObject:SetActive(true);
    elseif i == 4 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com006");
      uiCompounds[i].text_Hint.text = "";
      uiCompounds[i].gameObject:SetActive(true);
    else
      uiCompounds[i].image_BG.sprite = nil;
      uiCompounds[i].text_Hint.text = "";
      uiCompounds[i].gameObject:SetActive(false);
    end

    if compoundInfos[i] ~= nil then
      local itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[i].bagIndex);
      if itemSave ~= nil then
        uiCompounds[i].item:SetItem(itemSave.Id, itemSave.quant, itemSave);
      else
        compoundInfos[i] = nil;
        uiCompounds[i].item:SetItem(0);
      end
    else
      uiCompounds[i].item:SetItem(0);
    end
    uiCompounds[i].item:SetEvent();
  end

  text_Content.text = "";
  text_Submit.text = string.Get(10080);

  this.StopMixEffect();
  
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------  --5-----------------------------------------------------
  --  if LuaHelper.CheckDefine("DemoCode") then
  --    --
  --  end
  --  --6-----------------------------------------------------
  --  --5-----------------------------------------------------
  --  if LuaHelper.CheckDefine("DemoCode") then
  --    --
  --  end
  --  --6-----------------------------------------------------
  --  --5-----------------------------------------------------
  --  if LuaHelper.CheckDefine("DemoCode") then
  --    --
  --  end
  --  --6-----------------------------------------------------
  --  --5-----------------------------------------------------
  --  if LuaHelper.CheckDefine("DemoCode") then
  --    --
  --  end
  --  --6-----------------------------------------------------
  --  --5-----------------------------------------------------
  --  if LuaHelper.CheckDefine("DemoCode") then
  --    --
  --  end
  --  --6-----------------------------------------------------
  
  UI.Open(UIBag,
    function(bagIndex, itemId)
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, 0,
        string.Get(10080),
        function(bagKind, bagIndex, followIndex)
          local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
          if itemSave == nil then return end
          if Item.IsLock(itemSave) then return end

          UI.Close(UIItemInfo);

          if Item.IsTypeOfEquips(itemDatas[itemId].fitType) then
            compoundInfos[1] = {};
            compoundInfos[1].itemId = itemId;
            compoundInfos[1].bagIndex = bagIndex;
            compoundInfos[1].quant = 1;
          elseif itemDatas[itemId].kind == EItemKind.Feather or itemDatas[itemId].kind == EItemKind.Ice then
            compoundInfos[3] = {};
            compoundInfos[3].itemId = itemId;
            compoundInfos[3].bagIndex = bagIndex;
            compoundInfos[3].quant = 1;
          end

          compoundInfos[4] = nil;
          this.UpdateUI();
        end
      );
    end,
    Vector2.New(260, -25),
    false,
    nil,
    function(itemSave)
      if itemDatas[itemSave.Id] == nil then return false end
      if itemSave.isVender then return false end
      if itemSave.isDeliver then return false end
      if bit.band(itemDatas[itemSave.Id].restrict, 4) ~= 0 then return false end
      if itemDatas[itemSave.Id].kind ~= EItemKind.Feather and
              not itemDatas[itemSave.Id].kind ~= EItemKind.Ice and
              not Item.IsTypeOfEquips(itemDatas[itemSave.Id].fitType) and
              not Contains(itemDatas[itemSave.Id].kind, 36, 57, 59, 62) and
              not bit.band(itemDatas[itemSave.Id].restrict, 4) ~= 4 then return false end
      return true;
    end
  );

  this.UpdaetInUse();
end

--鑲崁
function UICompound.UpdateProof()
  if currentTag ~= EUICompoundTag.Proof then return end

  event_EvolutionSelect.gameObject:SetActive(false);
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  

  for i = 1, 6 do
    if i == 1 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com012");
      uiCompounds[i].text_Hint.text = string.Get(20165);
      uiCompounds[i].gameObject:SetActive(true);
    elseif i == 3 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com013");
      uiCompounds[i].text_Hint.text = string.Get(10079);
      uiCompounds[i].gameObject:SetActive(true);
    elseif i == 4 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com006");
      uiCompounds[i].text_Hint.text = "";
      uiCompounds[i].gameObject:SetActive(true);
    else
      uiCompounds[i].image_BG.sprite = nil;
      uiCompounds[i].text_Hint.text = "";
      uiCompounds[i].gameObject:SetActive(false);
    end

    if compoundInfos[i] ~= nil then
      local itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[i].bagIndex);
      if itemSave ~= nil then
        uiCompounds[i].item:SetItem(itemSave.Id, itemSave.quant, itemSave);
      else
        compoundInfos[i] = nil;
        uiCompounds[i].item:SetItem(0);
      end
    else
      uiCompounds[i].item:SetItem(0);
    end
    uiCompounds[i].item:SetEvent();
  end

  text_Content.text = "";
  text_Submit.text = string.Get(10081);

  this.StopMixEffect();

  UI.Open(UIBag,
    function(bagIndex, itemId)
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, 0,
        string.Get(10081),
        function(bagKind, bagIndex, followIndex)
          local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
          if itemSave == nil then return end
          if Item.IsLock(itemSave) then return end

          UI.Close(UIItemInfo);
          
          if Item.IsTypeOfEquips(itemDatas[itemId].fitType) then
            compoundInfos[1] = {};
            compoundInfos[1].itemId = itemId;
            compoundInfos[1].bagIndex = bagIndex;
            compoundInfos[1].quant = 1;
          elseif itemDatas[itemId].kind == EItemKind.Pearl then
            compoundInfos[3] = {};
            compoundInfos[3].itemId = itemId;
            compoundInfos[3].bagIndex = bagIndex;
            compoundInfos[3].quant = 1;
          end

          compoundInfos[4] = nil;
          this.UpdateUI();
        end
      );
    end,
    Vector2.New(260, -25),
    false,
    nil,
    function(itemSave)
      if itemDatas[itemSave.Id] == nil then return false end
      if itemSave.isVender then return false end
      if itemSave.isDeliver then return false end
      if bit.band(itemDatas[itemSave.Id].restrict, 4) ~= 0 then return false end
      if itemDatas[itemSave.Id].kind ~= EItemKind.Pearl and
              not Item.IsTypeOfEquips(itemDatas[itemSave.Id].fitType) and
              not Contains(itemDatas[itemSave.Id].kind, 57, 59, 62) and
              not bit.band(itemDatas[itemSave.Id].restrict, 4) ~= 4 then return false end
      return true;
    end
  );

  this.UpdaetInUse();
end

--天官
--function UICompound.UpdateTianGuan()
--  if currentTag ~= EUICompoundTag.TianGuan then return end
--
--  event_EvolutionSelect.gameObject:SetActive(false);
--
--  --5-----------------------------------------------------
--  if LuaHelper.CheckDefine("DemoCode") then
--    --
--  end
--  --6-----------------------------------------------------
--  --5-----------------------------------------------------
--  if LuaHelper.CheckDefine("DemoCode") then
--    --
--  end
--  --6-----------------------------------------------------
--  --5-----------------------------------------------------
--  if LuaHelper.CheckDefine("DemoCode") then
--    --
--  end
--  --6-----------------------------------------------------
--  --5-----------------------------------------------------
--  if LuaHelper.CheckDefine("DemoCode") then
--    --
--  end
--  --6-----------------------------------------------------
--  --5-----------------------------------------------------
--  if LuaHelper.CheckDefine("DemoCode") then
--    --
--  end
--  --6-----------------------------------------------------
--  --5-----------------------------------------------------
--  if LuaHelper.CheckDefine("DemoCode") then
--    --
--  end
--  --6-----------------------------------------------------
--  --5-----------------------------------------------------
--  if LuaHelper.CheckDefine("DemoCode") then
--    --
--  end
--  --6-----------------------------------------------------
--  --5-----------------------------------------------------
--  if LuaHelper.CheckDefine("DemoCode") then
--    --
--  end
--  --6-----------------------------------------------------
--  --5-----------------------------------------------------
--  if LuaHelper.CheckDefine("DemoCode") then
--    --
--  end
--  --6-----------------------------------------------------
--  --5-----------------------------------------------------
--  if LuaHelper.CheckDefine("DemoCode") then
--    --
--  end
--  --6-----------------------------------------------------
--
--  for i = 1, 6 do
--    if i == 1 then
--      uiCompounds[i].image_BG.sprite = UI.GetSprite("com014");
--      uiCompounds[i].text_Hint.text = string.Get(21982);
--      uiCompounds[i].gameObject:SetActive(true);
--    elseif i == 3 then
--      uiCompounds[i].image_BG.sprite = UI.GetSprite("com013");
--      uiCompounds[i].text_Hint.text = string.Get(21983);
--      uiCompounds[i].gameObject:SetActive(true);
--    elseif i == 4 then
--      uiCompounds[i].image_BG.sprite = UI.GetSprite("com012");
--      uiCompounds[i].text_Hint.text = string.Get(20165);
--      uiCompounds[i].gameObject:SetActive(true);
--    else
--      uiCompounds[i].image_BG.sprite = nil;
--      uiCompounds[i].text_Hint.text = "";
--      uiCompounds[i].gameObject:SetActive(false);
--    end
--
--    if compoundInfos[i] ~= nil then
--      local itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[i].bagIndex);
--      if itemSave ~= nil then
--        uiCompounds[i].item:SetItem(itemSave.Id, itemSave.quant, itemSave);
--      else
--        compoundInfos[i] = nil;
--        uiCompounds[i].item:SetItem(0);
--      end
--    else
--      uiCompounds[i].item:SetItem(0);
--    end
--    uiCompounds[i].item:SetEvent();
--  end
--
--  local content = "";
--  if compoundInfos[4] ~= nil then
--    local tianGuanData = tianGuanDatas[compoundInfos[4].itemId];
--    local itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[4].bagIndex);
--    if itemSave ~= nil then
--      local stoneLv = itemSave.stoneLv;
--
--      content = string.Concat(itemDatas[itemSave.Id]:GetName(true), "\n");
--      content = string.Concat(content, string.GetChineseNumberLower(stoneLv), string.Get(21999));
--
--      if compoundInfos[1] ~= nil then
--        local enhanceItemData = itemDatas[compoundInfos[1].itemId];
--        if enhanceItemData ~= nil and enhanceItemData.threshold == 3 then
--          stoneLv = enhanceItemData.skillLink;
--        else
--          stoneLv = stoneLv + 1;
--        end
--
--        content = string.Concat(content, " ", string.Get(22000), " ", string.GetChineseNumberLower(stoneLv), string.Get(21999), "\n");
--        content = string.Concat(content, string.GetColorText(tianGuanData[stoneLv]:GetEffectText("\n"), Color.Gray));
--      else
--        content = string.Concat(content, "\n");
--        content = string.Concat(content, tianGuanData[stoneLv]:GetEffectText("\n"));
--      end
--    end
--  end
--
--  text_Content.text = content;
--  text_Submit.text = string.Get(21984);
--
--  this.StopMixEffect();
--  --5-----------------------------------------------------
--  if LuaHelper.CheckDefine("DemoCode") then
--    --
--  end
--  --6-----------------------------------------------------
--  --5-----------------------------------------------------
--  if LuaHelper.CheckDefine("DemoCode") then
--    --
--  end
--  --6-----------------------------------------------------
--  --5-----------------------------------------------------
--  if LuaHelper.CheckDefine("DemoCode") then
--    --
--  end
--  --6-----------------------------------------------------
--  --5-----------------------------------------------------
--  if LuaHelper.CheckDefine("DemoCode") then
--    --
--  end
--  --6-----------------------------------------------------
--  --5-----------------------------------------------------
--  if LuaHelper.CheckDefine("DemoCode") then
--    --
--  end
--  --6-----------------------------------------------------
--
--  UI.Open(UIBag,
--    function(bagIndex, itemId)
--      UI.Open(UIItemInfo, EThings.Bag, bagIndex, 0,
--        string.Get(21984),
--        function(bagKind, bagIndex, followIndex)
--          local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
--          if itemSave == nil then return end
--          if Item.IsLock(itemSave) then return end
--          UI.Close(UIItemInfo);
--
--          if itemDatas[itemId].kind == EItemKind.TianGuanEquip then
--            if itemSave.stoneLv >= Item.maxTianGuanLv then
--              ShowCenterMessage(string.Get(22017));
--              return;
--            end
--
--            compoundInfos[4] = {};
--            compoundInfos[4].itemId = itemId;
--            compoundInfos[4].bagIndex = bagIndex;
--            compoundInfos[4].quant = 1;
--
--          elseif itemDatas[itemId].kind == EItemKind.TianGuanEnhance then
--            --強化道具
--            if itemDatas[itemId].threshold == 1 then
--              compoundInfos[1] = {};
--              compoundInfos[1].itemId = itemId;
--              compoundInfos[1].bagIndex = bagIndex;
--              compoundInfos[1].quant = itemSave.quant;
--
--            --增加機率道具
--            elseif itemDatas[itemId].threshold == 2 then
--              --指定階數不需再增加幾率
--              if compoundInfos[1] ~= nil and
--                 itemDatas[compoundInfos[1].itemId] ~= nil and
--                 itemDatas[compoundInfos[1].itemId].kind == EItemKind.TianGuanEnhance and
--                 itemDatas[compoundInfos[1].itemId].threshold == 3 then
--                return;
--              end
--
--              compoundInfos[3] = {};
--              compoundInfos[3].itemId = itemId;
--              compoundInfos[3].bagIndex = bagIndex;
--              compoundInfos[3].quant = itemSave.quant;
--
--            --指定階數道具
--            elseif itemDatas[itemId].threshold == 3 then
--              compoundInfos[3] = nil;
--              compoundInfos[1] = {};
--              compoundInfos[1].itemId = itemId;
--              compoundInfos[1].bagIndex = bagIndex;
--              compoundInfos[1].quant = itemSave.quant;
--            end
--          end
--
--          this.UpdateUI();
--        end
--      );
--    end,
--    Vector2.New(260, -25),
--    false,
--    nil,
--    function(itemSave)
--      if itemDatas[itemSave.Id] == nil then return false end
--      if itemSave.isVender then return false end
--      if itemSave.isDeliver then return false end
--      if not Contains(itemDatas[itemSave.Id].kind, EItemKind.TianGuanEquip, EItemKind.TianGuanEnhance) then return false end
--
--      return true;
--    end
--  );
--
--  this.UpdaetInUse();
--end

--消除
function UICompound.UpdateRemove()
  if currentTag ~= EUICompoundTag.Remove then return end

  event_EvolutionSelect.gameObject:SetActive(false);
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------

  for i = 1, 6 do
    if i == 1 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com012");
      uiCompounds[i].text_Hint.text = string.Get(20165);
      uiCompounds[i].gameObject:SetActive(true);
    elseif i == 3 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com014");
      uiCompounds[i].text_Hint.text = string.Get(22177);
      uiCompounds[i].gameObject:SetActive(true);
    elseif i == 4 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com012");
      uiCompounds[i].text_Hint.text = string.Get(20165);
      uiCompounds[i].gameObject:SetActive(true);
    else
      uiCompounds[i].image_BG.sprite = nil;
      uiCompounds[i].text_Hint.text = "";
      uiCompounds[i].gameObject:SetActive(false);
    end
    
    if compoundInfos[i] ~= nil then
      local itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[i].bagIndex);
      if itemSave ~= nil then
        uiCompounds[i].item:SetItem(itemSave.Id, itemSave.quant, itemSave);
      else
        compoundInfos[i] = nil;
        uiCompounds[i].item:SetItem(0);
      end
    else
      uiCompounds[i].item:SetItem(0);
    end
    uiCompounds[i].item:SetEvent();
  end

  local content = "";
  if compoundInfos[1] ~= nil then
    local itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[1].bagIndex);

    if itemSave ~= nil then
      local stoneAttr = itemSave.stoneAttr;
      local stoneLv = itemSave.stoneLv;

      if stoneAttr == 0 then
        stoneLv = 0;
        if compoundInfos[1] ~= nil and Contains(Compound.GetStoneKind(compoundInfos[1].itemId), 1, 2) then
          stoneAttr = Compound.GetStoneAttr(compoundInfos[1].itemId);
        end
      end

      content = string.Concat(itemDatas[itemSave.Id]:GetName(true), "\n");

      if stoneAttr ~= 0 then
        if stoneLv == 0 then
          content = string.Concat(content, string.format(string.Get(80319), Item.GetStoneAttrStr(stoneAttr)), "\n");
        else
          content = string.Concat(content, string.format(string.Get(80320), stoneLv, Item.GetStoneAttrStr(stoneAttr, true), Item.GetAttrHintStr(stoneAttr, stoneLv)), "\n");
        end

        local prooText = itemDatas[itemSave.Id]:GetProofText(itemSave);
        content = string.Concat(content, prooText);
      end
    end
  end

  text_Content.text = content;
  text_Submit.text = string.Get(22178);

  this.StopMixEffect();

  UI.Open(UIBag,
    function(bagIndex, itemId)
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, 0,
        string.Get(22178),
        function(bagKind, bagIndex, followIndex)
          local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
          if itemSave == nil then return end
          if Item.IsLock(itemSave) then return end

          UI.Close(UIItemInfo);

          if Item.IsTypeOfEquips(itemDatas[itemId].fitType) or Contains(itemDatas[itemId].kind, EItemKind.SoulWeapon, EItemKind.NpcEquip, EItemKind.SoulEquip) then
            compoundInfos[1] = {};
            compoundInfos[1].itemId = itemId;
            compoundInfos[1].bagIndex = bagIndex;
            compoundInfos[1].quant = itemSave.quant;
            compoundInfos[1].itemSave = itemSave;
          elseif itemDatas[itemId].kind == EItemKind.Remove then
            local index = 3;

            compoundInfos[index] = {};
            compoundInfos[index].itemId = itemId;
            compoundInfos[index].bagIndex = bagIndex;
            compoundInfos[index].quant = itemSave.quant;
            compoundInfos[index].threshold = itemDatas[itemId].threshold;
          end

          this.UpdateUI();
        end
      );
    end,
    Vector2.New(260, -25),
    false,
    nil,
    function(itemSave)
      if itemDatas[itemSave.Id] == nil then return false end
      if itemSave.isVender then return false end
      if itemSave.isDeliver then return false end
      if bit.band(itemDatas[itemSave.Id].restrict, 4) ~= 0 then return false end
      if itemDatas[itemSave.Id].kind ~= EItemKind.Remove and
              not Item.IsTypeOfEquips(itemDatas[itemSave.Id].fitType) and
              not Contains(itemDatas[itemSave.Id].kind, 57, 59, 62) and
              not bit.band(itemDatas[itemSave.Id].restrict, 4) ~= 4 then return false end

      return true;
    end
  );

  this.UpdaetInUse();
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
end

--進化
function UICompound.UpdateEvolution()
  if currentTag ~= EUICompoundTag.Evolution then return end

  local itemSave;
  if compoundInfos[1] ~= nil then
    itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[1].bagIndex);
    if (itemSave == nil or itemSave.Id ~= compoundInfos[1].itemId) then
      compoundInfos[1] = nil;
      compoundInfos[2] = nil;
      compoundInfos[3] = nil;
      compoundInfos[5] = nil;
      compoundInfos[6] = nil;
    end
  end

  if compoundInfos[2] ~= nil and (Item.GetBagItem(EThings.Bag, compoundInfos[2].bagIndex) == nil or Item.GetBagItem(EThings.Bag, compoundInfos[2].bagIndex).Id ~= compoundInfos[2].itemId) then
    compoundInfos[2] = nil;
    compoundInfos[3] = nil;
    compoundInfos[5] = nil;
    compoundInfos[6] = nil;
  end

  if currentEvo == EvoMode.Style then
    event_EvolutionSelect.gameObject:SetActive(false);

    if compoundInfos[1] ~= nil and compoundInfos[2] ~= nil and fashionStressDatas[compoundInfos[1].itemId] ~= nil then
      compoundInfos[3] = {};
      compoundInfos[3].itemId = 65351;
      compoundInfos[3].bagIndex = 0;
      compoundInfos[3].quant = this.CalculateGold(itemSave.styleLv);
    else
      compoundInfos[3] = nil;
      compoundInfos[5] = nil;
      compoundInfos[6] = nil;
    end
  else
    if compoundInfos[1] ~= nil and compoundInfos[2] ~= nil and itemEvolutionDatas[compoundInfos[1].itemId][compoundInfos[2].itemId] ~= nil then
      event_EvolutionSelect.gameObject:SetActive(table.Count(itemEvolutionDatas[compoundInfos[1].itemId][compoundInfos[2].itemId]) > 1);

      local evolutionData = itemEvolutionDatas[compoundInfos[1].itemId][compoundInfos[2].itemId][evolutionSelect];
      if evolutionData == nil then
        evolutionSelect = 1;
        evolutionData = itemEvolutionDatas[compoundInfos[1].itemId][compoundInfos[2].itemId][1];
      end

      compoundInfos[3] = {};
      if evolutionData.requireCurrency == ECurrency.Gold then
        compoundInfos[3].itemId = 65301;
      elseif evolutionData.requireCurrency == ECurrency.Money then
        compoundInfos[3].itemId = 65351;
      elseif evolutionData.requireCurrency == ECurrency.OrgGold then
        compoundInfos[3].itemId = 65381;
      end
      compoundInfos[3].bagIndex = 0;
      compoundInfos[3].quant = evolutionData.requireCurrencyValue;

      compoundInfos[4] = {};
      compoundInfos[4].itemId = evolutionData.itemId;
      compoundInfos[4].bagIndex = 0;
      compoundInfos[4].quant = 1;
    else
      event_EvolutionSelect.gameObject:SetActive(false);
      compoundInfos[3] = nil;
      compoundInfos[5] = nil;
      compoundInfos[6] = nil;
    end
  end

  for i = 1, 6 do
    if i == 1 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com006");
      uiCompounds[i].text_Hint.text = "";
      uiCompounds[i].gameObject:SetActive(true);
    elseif i == 2 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com006");
      uiCompounds[i].text_Hint.text = "";
      uiCompounds[i].gameObject:SetActive(true);
    elseif i == 3 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com006");
      uiCompounds[i].text_Hint.text = "";
      uiCompounds[i].gameObject:SetActive(true);
    elseif i == 4 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com006");
      uiCompounds[i].text_Hint.text = "";
      uiCompounds[i].gameObject:SetActive(true);
    elseif i == 5 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com014");
      uiCompounds[i].text_Hint.text = string.Get(22295);
      uiCompounds[i].gameObject:SetActive(true);
    elseif i == 6 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com014");
      uiCompounds[i].text_Hint.text = string.Get(22295);
      uiCompounds[i].gameObject:SetActive(true);
    else
      uiCompounds[i].image_BG.sprite = nil;
      uiCompounds[i].text_Hint.text = "";
      uiCompounds[i].gameObject:SetActive(false);
    end
    
    if compoundInfos[i] ~= nil then
      local itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[i].bagIndex);

      if currentEvo == EvoMode.Style then
        if Contains(i, 3) then
          uiCompounds[i].item:SetItem(compoundInfos[i].itemId, compoundInfos[i].quant);
        else
          if itemSave ~= nil then
            uiCompounds[i].item:SetItem(itemSave.Id, itemSave.quant, itemSave);
          else
            compoundInfos[i] = nil;
            uiCompounds[i].item:SetItem(0);
          end
        end
      else
        if Contains(i, 3, 4) then
          uiCompounds[i].item:SetItem(compoundInfos[i].itemId, compoundInfos[i].quant);
        else
          if itemSave ~= nil then
            uiCompounds[i].item:SetItem(itemSave.Id, 1, itemSave);
          else
            compoundInfos[i] = nil;
            uiCompounds[i].item:SetItem(0);
          end
        end
      end
    else
      uiCompounds[i].item:SetItem(0);
    end

    if Contains(i, 1, 2, 5) then
      uiCompounds[i].item:SetEvent(this.RemoveEvoItem, i);
    end
  end

  if currentEvo == EvoMode.Style then
    uiCompounds[6].gameObject:SetActive(false);
  end

  text_Content.text = "";
  text_Submit.text = string.Get(22294);
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------

  gameObject_QuestionMark.gameObject:SetActive(compoundInfos[4] == nil);

  UI.Open(UIBag,
    function(bagIndex, itemId)
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, 0,
        string.Get(22294),
        function(bagKind, bagIndex, followIndex)
          local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
          if itemSave == nil then return end
          if Item.IsLock(itemSave) then return end

          UI.Close(UIItemInfo);

          local fashionData = fashionStressDatas[itemId];
          local index = 0;
          local func = function(result)
            if result == false then
              return;
            end
            if index == 0 then return end

            compoundInfos[index] = {};
            compoundInfos[index].itemId = itemId;
            compoundInfos[index].bagIndex = bagIndex;
            compoundInfos[index].quant = itemSave.quant;

            UI.Close(UIBag);
            this.UpdateUI();
          end

          if compoundInfos[1] == nil and fashionData ~= nil then
            currentEvo = EvoMode.Style;

          elseif compoundInfos[1] == nil and itemEvolutionDatas[itemId] ~= nil then
            currentEvo = EvoMode.Hermes;
          end

          if currentEvo == EvoMode.Style then
            if compoundInfos[1] == nil then
              if fashionData == nil then return end

              index = 1;
              for i = index, 6 do
                compoundInfos[i] = nil;
              end

              if itemSave.styleLv >= fashionData.maxLv then
                ShowCenterMessage(string.Get(23034));
                return;
              else
                currentstyleLv = itemSave.styleLv;
                func();
              end

            elseif compoundInfos[1] ~= nil and compoundInfos[2] == nil then
              if fashionData == nil then return end

              index = 2;
              for i = index, 6 do
                compoundInfos[i] = nil;
              end

              if itemSave.styleLv > 0 then
                ShowCheckMessage(func, string.Get(23179)); --此時裝為強化過，是否確定要放入？
              else
                func();
              end

            else
              if not(itemDatas[itemSave.Id].kind == EItemKind.Item_22 and itemDatas[itemSave.Id].specialAbility == EItemUseKind.EvolutionAdd and itemDatas[itemSave.Id].threshold == 1) then return end

              index = 5;
              func();
            end
          else
            if compoundInfos[1] == nil then
              if itemEvolutionDatas[itemId] == nil then return end

              index = 1;
              for i = index, 6 do
                compoundInfos[i] = nil;
              end

              func();
            elseif compoundInfos[1] ~= nil and compoundInfos[2] == nil then
              if itemEvolutionDatas[compoundInfos[1].itemId][itemId] == nil then return end

              index = 2;
              for i = index, 6 do
                compoundInfos[i] = nil;
              end

              func();
            else
              if itemDatas[itemId].specialAbility ~= EItemUseKind.EvolutionAdd then return end

              if itemDatas[itemId].threshold == 1 then
                index = 5;
              elseif itemDatas[itemId].threshold == 2 then
                index = 6;
              end

              func();
            end
          end
        end
      );
    end,
    Vector2.New(260, -25),
    false,
    nil,
    function(itemSave)
      if itemDatas[itemSave.Id] == nil then return false end
      if itemSave.isVender then return false end
      if itemSave.isDeliver then return false end

      if compoundInfos[1] == nil then
        return itemEvolutionDatas[itemSave.Id] ~= nil or fashionStressDatas[itemSave.Id] ~= nil;
      elseif compoundInfos[1] ~= nil and compoundInfos[2] == nil and currentEvo ~= EvoMode.None then
        if currentEvo == EvoMode.Style then
          return itemSave.Id == compoundInfos[1].itemId;
        else
          return itemEvolutionDatas[compoundInfos[1].itemId][itemSave.Id] ~= nil;
        end
      else
        if currentEvo == EvoMode.Style then
          if currentstyleLv >= styleSafeLv then
            return itemDatas[itemSave.Id].kind == EItemKind.Item_22 and itemDatas[itemSave.Id].specialAbility == EItemUseKind.EvolutionAdd and itemDatas[itemSave.Id].threshold == 1;
          else
            return false;
          end
        else
          return itemDatas[itemSave.Id].specialAbility == EItemUseKind.EvolutionAdd;
        end
      end
    end
  );

  this.UpdaetInUse();
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
end

--強化
function UICompound.UpdateEnhance()
  if currentTag ~= EUICompoundTag.WeaponEnhance then return end

  event_EvolutionSelect.gameObject:SetActive(false);

  for i = 1, 6 do
    if i == 1 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com012");
      uiCompounds[i].text_Hint.text = string.Get(22696);
      uiCompounds[i].gameObject:SetActive(true);
    elseif i == 3 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com012");
      uiCompounds[i].text_Hint.text = string.Get(22702);
      uiCompounds[i].gameObject:SetActive(true);
    elseif i == 4 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com006");
      uiCompounds[i].text_Hint.text = string.Get(22696);
      uiCompounds[i].gameObject:SetActive(true);
    else
      uiCompounds[i].image_BG.sprite = nil;
      uiCompounds[i].text_Hint.text = "";
      uiCompounds[i].gameObject:SetActive(false);
    end

    if compoundInfos[i] ~= nil then
      local itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[i].bagIndex);
      if itemSave ~= nil then
        uiCompounds[i].item:SetItem(itemSave.Id, itemSave.quant, itemSave);
      else
        compoundInfos[i] = nil;
        uiCompounds[i].item:SetItem(0);
      end
    else
      uiCompounds[i].item:SetItem(0);
    end
    uiCompounds[i].item:SetEvent();
  end

  text_Content.text = "";
  text_Submit.text = string.Get(20029);

  this.StopMixEffect();
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  UI.Open(UIBag,
    function(bagIndex, itemId)
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, 0,
        string.Get(20029),
        function(bagKind, bagIndex, followIndex)
          local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
          if itemSave == nil then return end
          if Item.IsLock(itemSave) then return end
          local idx = 1;
          if compoundInfos[1] ~= nil then
            idx = 3;
          end

          local count = GetItemCount(bagIndex);

          local itemData = itemDatas[itemSave.Id];

          if itemData == nil then return end

          if Item.IsTypeOfEquips(itemData.fitType) then
            if count >= 1 then
              ShowCenterMessage(string.Get(10136));  --輸入超過持有數量
              return
            end
          end

          local func = function(result)
            if result == false then return end
            
            UI.Close(UIItemInfo);

            compoundInfos[idx] = {};
            compoundInfos[idx].itemId = itemId;
            compoundInfos[idx].bagIndex = bagIndex;
            compoundInfos[idx].quant = 1;

            compoundInfos[4] = nil;
            this.UpdateUI();
          end
          if Compound.CheckEnhanceMaterialItem(itemSave) and idx == 3 then
            ShowCheckMessage(func, string.Get(22716));
          else
            func();
          end
        end
      );
    end,
    Vector2.New(260, -25),
    false,
    nil,
    function(itemSave)
      if itemDatas[itemSave.Id] == nil then return false end
      if itemDatas[itemSave.Id].kind ~= EItemKind.ExclusiveWeapon then return false end;
      if itemSave.enhanceLv >= ExclusiveWeapon.GetMaxLevel(itemSave.Id) then return false end;
      return true;
    end
  );

  this.UpdaetInUse();
end

--升階
function UICompound.UpdateReinforce()
  if currentTag ~= EUICompoundTag.Reinforcd then return end

  event_EvolutionSelect.gameObject:SetActive(false);
  text_Rate.text = "";
  text_Required.text = "";
  text_Warning.text = "";
  local hintString = "";
  local itemSave;
  local rateData;
  local rate = 0;
  local calcRate = function(result)
    if compoundInfos[5] ~= nil then
      rate = math.min((rateData.rate / 10) + math.floor(itemDatas[compoundInfos[5].itemId].skillLink / 10), 100);
    else
      rate = rateData.rate / 10;
    end
  end

  if compoundInfos[1] ~= nil then
    itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[1].bagIndex);
    text_Warning.text = string.Get(23129);

    if itemSave == nil or itemSave.Id ~= compoundInfos[1].itemId then
      this.ClearReinforceInfo();
    end
  end

  if compoundInfos[1] ~= nil and itemSave ~= nil and eqRateDatas[itemSave.Reinforced] ~= nil then
    rateData = eqRateDatas[itemSave.Reinforced];
    if rateData.itemId > 0 then
      compoundInfos[2] = {};
      compoundInfos[2].itemId = rateData.itemId;
      compoundInfos[2].bagIndex = 0;
      hintString = string.Get(23042);  --升階石

      local color;
      local stoneCount = Item.GetItemCount(rateData.itemId);
      if rateData.itemId > 0 and stoneCount < rateData.count then
        ShowCenterMessage(string.Get(23036));  --升階資源不足，無法升階
        compoundInfos[2].SetInUse = true;
        color = Color.Red;
      else
        color = Color.Black;

      end
      text_Required.text = string.GetColorText(string.Concat(rateData.count, string.Get(30120), stoneCount), color);

    else
      hintString = string.Get(23127);
      text_Required.text = "";
      if compoundInfos[2] ~= nil and not Item.IsEquip(itemDatas[compoundInfos[2].itemId].fitType) then
        compoundInfos[2] = nil;
        compoundInfos[5] = nil;
        compoundInfos[6] = nil;
        UI.Close(UIBag);
        this.UpdateReinforce();
        return;
      end
    end

    compoundInfos[3] = {};
    compoundInfos[3].itemId = 65351;
    compoundInfos[3].bagIndex = 0;
    compoundInfos[3].quant = rateData.required;

    calcRate();
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------

    text_Rate.text = string.Concat(string.Get(23041), tostring(rate), "%");

    if Role.GetPlayerGold() < rateData.required then
      ShowCenterMessage(string.Get(22314));
      compoundInfos[3].SetInUse = true;
    end
  else
    this.ClearReinforceInfo();
  end

  for i = 1, 6 do
    if i == 1 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com006");
      uiCompounds[i].text_Hint.text = string.Get(20165);
      uiCompounds[i].gameObject:SetActive(true);
    elseif i == 2 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com006");
      uiCompounds[i].text_Hint.text = hintString;
      uiCompounds[i].gameObject:SetActive(true);
    elseif i == 3 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com006");
      uiCompounds[i].text_Hint.text = string.Get(10099);
      uiCompounds[i].gameObject:SetActive(true);
    elseif i == 4 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com006");
      uiCompounds[i].text_Hint.text = "";
      uiCompounds[i].gameObject:SetActive(true);
    elseif i == 5 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com014");
      uiCompounds[i].text_Hint.text = string.Get(23043);
      uiCompounds[i].gameObject:SetActive(true);
    elseif i == 6 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com014");
      uiCompounds[i].text_Hint.text = string.Get(10078);
      uiCompounds[i].gameObject:SetActive(true);
    else
      uiCompounds[i].image_BG.sprite = nil;
      uiCompounds[i].text_Hint.text = "";
      uiCompounds[i].gameObject:SetActive(false);
    end

    if compoundInfos[i] ~= nil then
      local itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[i].bagIndex);

      if itemSave ~= nil then
        if Contains(i, 2, 3) then
          if eqRateDatas[itemSave.Reinforced] ~= nil and eqRateDatas[itemSave.Reinforced].itemId <= 0 then
            uiCompounds[i].item:SetItem(itemSave.Id, 1, itemSave);
          else
            uiCompounds[i].item:SetItem(compoundInfos[i].itemId, compoundInfos[i].quant, itemSave);
            uiCompounds[i].item:SetInUse(compoundInfos[i].SetInUse);
          end
        else
          uiCompounds[i].item:SetItem(itemSave.Id, 1, itemSave);
        end
      else
        if Contains(i, 2, 3) then
          uiCompounds[i].item:SetItem(compoundInfos[i].itemId, compoundInfos[i].quant);
          uiCompounds[i].item:SetInUse(compoundInfos[i].SetInUse);
        else
          compoundInfos[i] = nil;
          uiCompounds[i].item:SetItem(0);
        end
      end
    else
      uiCompounds[i].item:SetItem(0);
    end

    if Contains(i, 1, 5, 6) then
      uiCompounds[i].item:SetEvent(this.RemoveItem, i);
    end
  end

  text_Content.text = "";
  text_Submit.text = string.Get(23044);
  gameObject_QuestionMark.gameObject:SetActive(compoundInfos[4] == nil);

  UI.Open(UIBag,
    function(bagIndex, itemId)
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, 0,
        string.Get(23044),
        function(bagKind, bagIndex, followIndex)
          local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
          if itemSave == nil then return end
          if Item.IsLock(itemSave) then return end
          local reatData = eqRateDatas[currentReinforced];

          UI.Close(UIItemInfo);

          local index = 0;
          local func = function(result)
            if result == false then
              return;
            end
            if index == 0 then return end

            compoundInfos[index] = {};
            compoundInfos[index].itemId = itemId;
            compoundInfos[index].bagIndex = bagIndex;
            compoundInfos[index].quant = itemSave.quant;

            if index == 1 then
              currentReinforced = itemSave.Reinforced;
            end

            UI.Close(UIBag);
            this.UpdateUI();
          end

          if compoundInfos[1] == nil then
            index = 1;
            for i = index, 6 do
              compoundInfos[i] = nil;
            end

            func();
          elseif compoundInfos[1] ~= nil and itemDatas[itemId].kind == EItemKind.Reinforced and itemDatas[itemId].threshold == 2 then
            index = 5;

            if itemDatas[itemId] ~= nil then
              local currentRage = math.min((rateData.rate / 10) + math.floor(itemDatas[itemId].skillLink / 10), 100);

              if compoundInfos[6] ~= nil and currentRage >= 100 then
                ShowCenterMessage(string.Get(23088));
                return;
              end
            end

            if itemDatas[itemId].spare3 > currentReinforced then
              ShowCenterMessage(string.Get(20113));
              return;
            else
              func();
            end

          elseif compoundInfos[1] ~= nil and itemDatas[itemId].kind == EItemKind.Reinforced and itemDatas[itemId].threshold == 3 then
            index = 6;
            itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[1].bagIndex);
            if itemSave == nil then return end

            calcRate();

            if rate >= 100 then
              ShowCenterMessage(string.Get(23081));
              return;
            end

            if reatData.isNeedEquip == 0 then
              ShowCenterMessage(string.Get(23040)) --此階不會退階，無法放入庇佑符
              return;
            else
              func();
            end

          elseif compoundInfos[1] ~= nil and reatData.itemId == 0 then
            index = 2;
            if itemSave.Reinforced > 0 then
              ShowCheckMessage(func, string.Get(23037)); --此裝備已升階，是否確定要放入？
            elseif itemSave.enhanceLv > 0 then
              ShowCheckMessage(func, string.Get(23038));  --此專武已強化，是否確定要放入？
            elseif itemSave.Reinforced > 0 and itemSave.enhanceLv > 0 then
              ShowCheckMessage(func, string.Get(23039));  --此專武已升階，是否確定要放入？
            else
              func();
            end
          end
        end
      );
    end,
    Vector2.New(260, -25),
    false,
    nil,
    function(itemSave)
      if itemDatas[itemSave.Id] == nil then return false end
      if itemSave.isVender then return false end
      if itemSave.isDeliver then return false end
      if eqRateDatas[itemSave.Reinforced] == nil then return false end
      if itemDatas[itemSave.Id].kind == EItemKind.Reinforced and itemDatas[itemSave.Id].threshold == 1 then return false end
      if itemDatas[itemSave.Id].kind == EItemKind.Myth then return false end;

      if compoundInfos[1] == nil then
        if not Item.IsEquip(itemDatas[itemSave.Id].fitType) then return false end  --只顯示 (1帽 2衣 3武器 4護腕 5鞋子)的裝備
        if itemDatas[itemSave.Id].durable >= 1 then return false end  --耐久度物品
        if itemDatas[itemSave.Id].quality <= 1 then return false end  --裝備品質:白綠不顯示,只顯示藍紫紅裝備
        if bit.band(itemDatas[itemSave.Id].restrict, 32) == 32 then return false end  --不可放進錢莊的物品都不顯示
        if itemSave.delTime ~= nil and itemSave.delTime > 0 then return false end  --限時物品
        if itemSave.Reinforced >= maxReinforced then return false end  --裝備升階等級>15 不顯示
      else
        if currentReinforced > 0 and currentReinforced < maxReinforced and eqRateDatas[currentReinforced].itemId == 0 then  --特殊階級時，需要相同裝備才能進行升階
          if itemSave.Id == compoundInfos[1].itemId then return true end
          if itemDatas[itemSave.Id].kind == EItemKind.Reinforced and itemDatas[itemSave.Id].threshold ~= 4 then return true end
          return false;
        else
          if not (itemDatas[itemSave.Id].kind == EItemKind.Reinforced and itemDatas[itemSave.Id].threshold ~= 4) then return false end
        end
      end
      return true;
    end
  );

  this.UpdaetInUse();
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
end

function UICompound.RemoveItem(uiEvent)
  local index = uiEvent.parameter;

  if Contains(index, 2, 3, 4) then return end

  if compoundInfos[index] == nil then return end

  local bagItem = Item.GetBagItem(EThings.Bag, compoundInfos[index].bagIndex);

  if bagItem == nil then return end

  UI.Open(UIItemInfo, EThings.Bag, compoundInfos[index].bagIndex, 0,
    string.Get(20110),
    function(bagKind, bagIndex, followIndex)
      compoundInfos[index] = nil;
      this.UpdateReinforce();
      if UI.IsVisible(UIItemInfo) then
        UI.Close(UIItemInfo);
      end
    end
  );
end

function UICompound.RemoveEvoItem(uiEvent)
  local index = uiEvent.parameter;

  if Contains(index, 3, 4) then return end

  if compoundInfos[index] == nil then return end

  local bagItem = Item.GetBagItem(EThings.Bag, compoundInfos[index].bagIndex);

  if bagItem == nil then return end
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------

  UI.Open(UIItemInfo, EThings.Bag, compoundInfos[index].bagIndex, 0,
    string.Get(20110),
    function(bagKind, bagIndex, followIndex)
      compoundInfos[index] = nil;
      this.UpdateEvolution();
      if UI.IsVisible(UIItemInfo) then
        UI.Close(UIItemInfo);
      end
    end
  );
end

function UICompound.RemoveAffix(uiEvent)
  local index = uiEvent.parameter;

  if affixInfos[index] == nil then return end

  local bagItem = Item.GetBagItem(EThings.Bag, affixInfos[index].bagIndex);
  if bagItem == nil then return end

  UI.Open(UIItemInfo, EThings.Bag, affixInfos[index].bagIndex, 0,
    string.Get(20110),
    function(bagKind, bagIndex, followIndex)
      affixInfos[index] = nil;
      this.UpdateAffix();
      if UI.IsVisible(UIItemInfo) then
        UI.Close(UIItemInfo);
      end
    end
  );
end

function UICompound.ClearReinforceInfo()
  compoundInfos[1] = nil;
  compoundInfos[2] = nil;
  compoundInfos[3] = nil;
  compoundInfos[5] = nil;
  compoundInfos[6] = nil;
  text_Rate.text = "";
  text_AffixInfoRequired.text = "";
  text_AffixCheckRequired.text = "";
  text_Warning.text = "";
end

function UICompound.UpdateAffixRequiredText()
  local color;
  if affixInfos[2] == nil then return end

  local spellCount = Item.GetItemCount(affixInfos[2].itemId);
  if spellCount < 1 then
    color = Color.Red;
  else
    color = Color.Black;
  end

  text_AffixInfoRequired.text = string.GetColorText(string.Concat(1, string.Get(30120), spellCount), color);
  text_AffixCheckRequired.text = string.GetColorText(string.Concat(1, string.Get(30120), spellCount), color);
end

--洗鍊
function UICompound.UpdateAffix()
  if currentTag ~= EUICompoundTag.Affix then return end

  event_EvolutionSelect.gameObject:SetActive(false);
  local itemSave;

  if currentAffix.bagIndex ~= nil and currentAffix.bagIndex ~= 0 then
    itemSave = Item.GetBagItem(EThings.Bag, affixInfos[1].bagIndex);
    if itemSave ~= nil then
      affixInfos[1] = {};
      affixInfos[1].bagIndex = currentAffix.bagIndex;
      affixInfos[1].itemId = itemSave.Id;
      affixInfos[1].quant = 1;
      affixInfos[1].fitType = itemDatas[itemSave.Id].fitType;
    else
      affixInfos[1] = nil;
      this.ClearAffixInfo();
    end
  end

  if affixInfos[1] ~= nil then
    itemSave = Item.GetBagItem(EThings.Bag, affixInfos[1].bagIndex);
    if itemSave == nil then
      affixInfos[1] = nil;
      affixInfos[2] = nil;
    end
  end

  for i = 1, 6 do
    uiCompounds[i].image_BG.sprite = nil;
    uiCompounds[i].text_Hint.text = "";
    uiCompounds[i].gameObject:SetActive(false);
  end

  for i = 1, 2 do
    if affixInfos[i] ~= nil then
      local itemSave = Item.GetBagItem(EThings.Bag, affixInfos[i].bagIndex);
      if itemSave ~= nil then
        uiAffixInfo[i].item:SetItem(itemSave.Id, 1, itemSave);
        uiAffixCheck[i].item:SetItem(itemSave.Id, 1, itemSave);
      else
        uiAffixInfo[i].item:SetItem(0);
        uiAffixCheck[i].item:SetItem(0);
      end
    else
      uiAffixInfo[i].item:SetItem(0);
      uiAffixCheck[i].item:SetItem(0);
    end

    if Contains(i, 2) then
      uiAffixInfo[i].item:SetEvent(this.RemoveAffix, i);
    end
  end

  text_Content.text = "";
  text_Submit.text = string.Get(23048);
  gameObject_QuestionMark.gameObject:SetActive(false);

  UI.Open(UIBag,
    function(bagIndex, itemId)
    UI.Open(UIItemInfo, EThings.Bag, bagIndex, 0,
      string.Get(23048),
      function(bagKind, bagIndex, followIndex)
        local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
        if itemSave == nil then return end
        if Item.IsLock(itemSave) then return end

        UI.Close(UIItemInfo);

        if affixInfos[1] == nil then
          affixInfos[1] = {};
          affixInfos[1].itemId = itemId;
          affixInfos[1].bagIndex = bagIndex;
          affixInfos[1].quant = itemSave.quant;
          if itemDatas[itemId] ~= nil and itemDatas[itemId].fitType ~= nil then
            affixInfos[1].fitType = itemDatas[itemId].fitType;
          end
          this.SetDefAffixCheckbox(itemSave);
        elseif affixInfos[1] ~= nil then
          affixInfos[2] = {};
          affixInfos[2].itemId = itemId;
          affixInfos[2].bagIndex = bagIndex;
          affixInfos[2].quant = itemSave.quant;
        end

        currentAffix.status = EAffixMode.Info;
        UI.Close(UIBag);
        this.UpdateUI();
      end
    );
  end,
  Vector2.New(260, -25),
  false,
  nil,
  function(itemSave)
    if itemDatas[itemSave.Id] == nil then return false end
    if itemSave.isVender then return false end
    if itemSave.isDeliver then return false end
    if itemDatas[itemSave.Id].kind == EItemKind.Myth then return false end;

    if affixInfos[1] == nil then
      if not Item.IsEquip(itemDatas[itemSave.Id].fitType) then return false end  --只顯示 (1帽 2衣 3武器 4護腕 5鞋子)的裝備
      if itemDatas[itemSave.Id].durable >= 1 then return false end  --耐久度物品
      if itemDatas[itemSave.Id].quality <= 1 then return false end  --裝備品質:白綠不顯示,只顯示藍紫紅裝備
      if bit.band(itemDatas[itemSave.Id].restrict, 32) == 32 then return false end  --不可放進錢莊的物品都不顯示
      if itemSave.delTime ~= nil and itemSave.delTime > 0 then return false end  --限時物品
      if itemSave.Reinforced < 5 then return false end
    else
      if not (itemDatas[itemSave.Id].kind == EItemKind.Reinforced and Contains(itemDatas[itemSave.Id].skillLink, 1, 2)) then return false end
    end

    return true;
  end
  );
  this.UpdaetInUse();
  this.UpdateAffixStatus();
end

function UICompound.UpdateAffixStatus(sliderIndex, tableIndex) -- indx(1) + 表的Indx(1)
  for i = 1, 3 do
    uiAffixInfo[i].CheckboxImage.gameObject:SetActive(currentAffix.status ~= EAffixMode.Check);
    uiAffixInfo[i].probImage.gameObject:SetActive(currentAffix.status ~= EAffixMode.Check);
    uiAffixCheck[i].CheckboxImage.gameObject:SetActive(currentAffix.status ~= EAffixMode.Check);
    uiAffixCheck[i].probImage.gameObject:SetActive(currentAffix.status ~= EAffixMode.Check);
  end
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------

  if currentAffix.status == EAffixMode.Check and currentAffix.checkbox ~= nil then
    local x = gameObject_ChangeArrow.anchoredPosition.x;
    local y = arrowY - ((currentAffix.checkbox - 1) * 60);
    gameObject_ChangeArrow.anchoredPosition = Vector2.New(x, y);
  end

  if currentTag == EUICompoundTag.Affix then
    gameObject_Affix:SetActive(true);
    gameObject_Affix_Detail:SetActive(false);
    local itemSave;
    local fitType;

    if affixInfos[1] ~= nil then
      itemSave = Item.GetBagItem(EThings.Bag, affixInfos[1].bagIndex);
      fitType = affixInfos[1].fitType;
    end

    if currentAffix.status == EAffixMode.None then --初始介面
      gameObject_AffixSliders:SetActive(false);
      gameObject_AffixItems:SetActive(true);
      gameObject_Affix_Check:SetActive(false);
    elseif currentAffix.status == EAffixMode.Info then --洗鍊預覽介面
      gameObject_AffixSliders:SetActive(true);
      gameObject_AffixItems:SetActive(true);
      gameObject_Affix_Check:SetActive(false);
      this.UpdateAffixRequiredText();

      if itemSave == nil then return end



      local openCount = this.GetAffixCount(itemSave.Reinforced, itemSave);
      this.UpdateSliderStatus(uiAffixInfo, openCount);
      this.UpdateSliderStatus(uiAffixCheck, openCount);
      for i = 1, openCount do
        this.UpdateSliderBar(uiAffixInfo[i], itemSave, fitType, i);
        this.UpdateSliderBar(uiAffixCheck[i], itemSave, fitType, i);
      end
      image_Submit.gameObject:SetActive(true);
      image_Cancel.gameObject:SetActive(true);

    elseif currentAffix.status == EAffixMode.Check then --確認洗鍊屬性介面
      gameObject_AffixSliders:SetActive(true);
      gameObject_AffixItems:SetActive(false);
      gameObject_Affix_Check:SetActive(true);
      this.UpdateAffixRequiredText();
      this.SetPng();

      if affixInfos[1] ~= nil then
        text_EquipName.text = itemDatas[affixInfos[1].itemId]:GetName(true);
      end

      if sliderIndex ~= nil and tableIndex ~= nil then
        this.UpdateSliderBar(uiAffixCheck[sliderIndex], itemSave, fitType, sliderIndex, tableIndex);
      end

      UI.Close(UIBag);
      for i = 1, 6 do
        uiCompounds[i].image_BG.sprite = nil;
        uiCompounds[i].text_Hint.text = "";
        uiCompounds[i].gameObject:SetActive(false);
      end
      image_Submit.gameObject:SetActive(false);
      image_Cancel.gameObject:SetActive(false);

    end
  else
    gameObject_Affix:SetActive(false);

    for i = 1, 3 do
      uiCompounds[i].arrow.gameObject:SetActive(true);
    end
  end
end

function UICompound.UpdateSliderBar(gameObject, itemSave, fitType, sliderIdx, tableIndex)
  if itemSave == nil then return end

  local itemSaveAffix = 0;
  local affix = 0;

  if tableIndex == nil then
    if sliderIdx == 1 then
      itemSaveAffix = itemSave.affix1;
      affix = eqAffixAllDatas[itemSaveAffix].level[sliderIdx];
    elseif sliderIdx == 2 then
      itemSaveAffix = itemSave.affix2;
      affix = eqAffixAllDatas[itemSaveAffix].level[sliderIdx];
    elseif sliderIdx == 3 then
      itemSaveAffix = itemSave.affix3;
      affix = eqAffixAllDatas[itemSaveAffix].level[sliderIdx];
    end
  else
    itemSaveAffix = tableIndex;
    affix = eqAffixAllDatas[itemSaveAffix].level[sliderIdx];
  end

  if eqAffixAllDatas[itemSaveAffix] == nil then return end

  local total, rangValue = EQAffixData.GetRangeValue(fitType, eqAffixAllDatas[itemSaveAffix].attr, sliderIdx, affix)
  local detailText = string.Concat(ItemData.GetAttrText(eqAffixAllDatas[itemSaveAffix].attr), " +", affix);

  gameObject.sliderText.text = detailText;
  gameObject.slider.value = math.floor((rangValue / total) * 100);
end

function UICompound.GetAffixCount(reinforced)
  local count = 0;

  if Between(reinforced, 5, 9) then
    count = 1;
  elseif Between(reinforced, 10, 14) then
    count = 2;
  elseif reinforced >= maxReinforced then
    count = 3;
  end

  return count;
end

function UICompound.UpdateSliderStatus(gameObject, openCount)
  --全上鎖
  for k, v in pairs(gameObject) do
    v.option:SetActive(false);
    v.lock:SetActive(true);
    v.sliderText.text = "";
    v.slider.value = 0;

    if k <= openCount then
      v.option:SetActive(true);
      v.lock:SetActive(false);
    end
  end
end

--[[ 升階功能結果
S:023-92 <升階功能結果> +結果(1)
   結果 1:成功 + 背包索引(2) +強化等級(1)
   失敗 2:失敗 + 背包索引(2) +強化等級(1)
   失敗 3:失敗
     --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
]]--
function UICompound.ReciveReinforce(data)
  local result = data:ReadByte();

  if result == 1 then --升階成功
    local bagIndex = data:ReadUInt16();
    local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
    if itemSave == nil then return end

    if itemDatas[itemSave.Id] ~= nil then
      local message = string.Concat(itemDatas[itemSave.Id]:GetName(true), " ",string.Get(23031));
      ShowCenterMessage(message);
      Chat.AddMessage(EChannel.System, message);
    end

    currentReinforced = itemSave.Reinforced;

    if UI.IsVisible(UICompound) then
      UI.Close(UIBag);
      UICompound.UpdateUI();
      UICompound.StartMixEffect(ECompoundEffect.Success, bagIndex);
    end

  elseif result == 2 then --升階失敗
    local bagIndex = data:ReadUInt16();
    local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
    local message;
    if itemSave == nil then return end

    if itemDatas[itemSave.Id] ~= nil then
      if itemSave.Reinforced == currentReinforced then
        message = string.Concat(itemDatas[itemSave.Id]:GetName(true), " ", string.Get(23033));
      else
        message = string.Concat(itemDatas[itemSave.Id]:GetName(true), " ", string.Get(23032)); --裝備升階失敗，階級下降
      end
      ShowCenterMessage(message);
      Chat.AddMessage(EChannel.System, message);
    end

    currentReinforced = itemSave.Reinforced;

    if eqRateDatas[currentReinforced].itemId <= 0 then
      compoundInfos[2] = nil;
    end

    if UI.IsVisible(UICompound) then
      UI.Close(UIBag);
      UICompound.UpdateUI();
      UICompound.StartMixEffect(ECompoundEffect.Fail, bagIndex);
    end
  elseif result == 3 then
    if UI.IsVisible(UICompound) then
      UI.Close(UIBag);
      UICompound.ClearData();
    end
  end
end

--[[ 洗鍊功能
S:023-93 <洗鍊功能> +結果(1)
   結果 1:成功 + 背包索引(2) + indx(1) + 表的Indx(1)
   失敗 2:失敗
]]--
function UICompound.ReciveAffix(data)
  local result = data:ReadByte();
  if result == 1 then
    local bagIndex = data:ReadUInt16();
    local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
    if itemSave == nil then return end
    sliderIndex = data:ReadByte();
    tableIndex = data:ReadByte();

    if UI.IsVisible(UICompound) then
      currentAffix.status = EAffixMode.Check;
      currentAffix.bagIndex = bagIndex;
      this.UpdateAffixStatus(sliderIndex, tableIndex);
    end

  elseif result == 2 then
    if UI.IsVisible(UICompound) then
      currentAffix.status = EAffixMode.Info;
      this.UpdateAffixStatus();
    end
  end
end

--[[S:023-94 <洗鍊功能> +結果(1)
結果 1:成功
失敗 2:失敗

  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
]]--
function UICompound.ReciveAffixResult(data)
  local result = data:ReadByte();
  if result == 1 then
    if UI.IsVisible(UICompound) then
      currentAffix.status = EAffixMode.Info;
      this.UpdateAffix();
    end

  elseif result == 2 then
    if UI.IsVisible(UICompound) then
      currentAffix.status = EAffixMode.Info;
      this.UpdateAffix();
    end
  end
end

--[[S:023-095 <時裝強化結果>+結果(1)
  結果 1:成功 +背包索引(2)
      2:失敗 +背包索引(2)
      3:材料不足
      4:背包已滿
      0:亂送物品過來
]]--
function UICompound.ReciveEvoStyle(data)
  local result = data:ReadByte();
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------

  if result == 1 then --成功
    local bagIndex = data:ReadUInt16();
    local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
    if itemSave == nil then return end

    currentstyleLv = itemSave.styleLv;

    if itemDatas[itemSave.Id] ~= nil then
      message = string.format(string.Get(23180), itemDatas[itemSave.Id]:GetName(true), itemSave.styleLv);
      ShowCenterMessage(message);
      Chat.AddMessage(EChannel.System, message);
    end

    if UI.IsVisible(UICompound) then
      UI.Close(UIBag);
      UICompound.UpdateUI();
      UICompound.StartMixEffect(ECompoundEffect.Success, bagIndex);
    end

    local fashionData = fashionStressDatas[itemSave.Id];
    if fashionData == nil then return end

    if currentstyleLv >= fashionData.maxLv then
      ShowCenterMessage(string.Get(23034));
      UICompound.ClearData();
    end

  elseif result == 2 then --失敗
    local bagIndex = data:ReadUInt16();
    local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
    local message;
    if itemSave == nil then return end

    currentstyleLv = itemSave.styleLv;

    if itemDatas[itemSave.Id] ~= nil then
      message = string.format(string.Get(23181), itemDatas[itemSave.Id]:GetName(true), itemSave.styleLv);

      ShowCenterMessage(message);
      Chat.AddMessage(EChannel.System, message);
    end

    if UI.IsVisible(UICompound) then
      UI.Close(UIBag);
      UICompound.UpdateUI();
      UICompound.StartMixEffect(ECompoundEffect.Fail, bagIndex);
    end
  else
    if UI.IsVisible(UICompound) then
      UI.Close(UIBag);
      UICompound.ClearData();
    end
  end
end

function UICompound.UpdaetInUse()
  Item.ClearAllInUse();

  if currentTag == EUICompoundTag.Affix then
    for k, v in pairs(affixInfos) do
      if v.bagIndex ~= nil then
        Item.SetItemInUse(v.bagIndex);
      end
    end
  else
    for k, v in pairs(compoundInfos) do
      if v.bagIndex ~= nil then
        Item.SetItemInUse(v.bagIndex);
      end
    end
  end
end

--合成特效開始
function UICompound.StartMixEffect(effectKind, bagIndex)
  this.StopMixEffect();
  
  local effectName = nil;
  local effectPage = 0;
  local effectSound = nil;
  local effectTime = 0;
  local loopTimes = -1;

  if effectKind == ECompoundEffect.Compound then
    effectName = "Mixed";
    effectPage = 6;
    effectTime = 1.5;
    loopTimes = -1;
  elseif effectKind == ECompoundEffect.Success then
    effectName = "UP";
    effectPage = 9;
    effectSound = "AudioClip_WA0035";
    effectTime = 2;
    loopTimes = 2;
  elseif effectKind == ECompoundEffect.Fail then
    effectName = "L10248";
    effectPage = 6;
    effectSound = "AudioClip_WA0017";
    effectTime = 2;
    loopTimes = 2;
  end

  if currentEvo == EvoMode.Style then
    effectTime = 0;
  end

  if effectName == nil then return end
  if effectPage <= 0 then return end

  TextureManager.SetPng(ETextureUseType.UI, effectName, rawImage_Mixed);
  rawImage_Mixed.rectTransform.sizeDelta = Vector2.New(rawImage_Mixed.texture.width, rawImage_Mixed.texture.height / effectPage);
  rawImage_Mixed:ShiftUV(1, effectPage, 0.1, loopTimes);
  rawImage_Mixed.enabled = true;

  if effectSound ~= nil then
    AudioManager.PlayOnce(effectSound, 0);
  end

  CGTimer.DoFunctionDelay(effectTime,
    function()
      if bagIndex ~= nil then
        local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
        if itemSave ~= nil then
          if compoundInfos[4] == nil then
            compoundInfos[4] = {};
          end
        
          compoundInfos[4].itemId = itemSave.Id;
          compoundInfos[4].quant = 1;
          compoundInfos[4].bagIndex = bagIndex;
        end
      end

      if UI.IsVisible(UICompound) then
        this.UpdateUI();
      end
    end
  );
end

--合成特效結束
function UICompound.StopMixEffect()
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  gameObject_QuestionMark.gameObject:SetActive(not Contains(currentTag, EUICompoundTag.Refinery, EUICompoundTag.Remove) and compoundInfos[4] == nil);

  rawImage_Mixed.texture = nil;
  rawImage_Mixed:StopShiftUV();
  rawImage_Mixed.enabled = false;
end

function UICompound.OnClick_Close()
  isContinue = false;

  this.ClearData();

  UI.Close(UICompound);

  return true;
end

function UICompound.OnClick_Tag(mainTag, subTag)
  currentTag = mainTag;
  
  text_Rate.gameObject:SetActive(currentTag == EUICompoundTag.Reinforcd);
  text_Required.gameObject:SetActive(currentTag == EUICompoundTag.Reinforcd);
  text_Warning.gameObject:SetActive(currentTag == EUICompoundTag.Reinforcd);

  if currentTag == EUICompoundTag.Affix and currentAffix.status == EAffixMode.Info then
    this.ClearAffixInfo();
  end

  this.UpdateAffixStatus();

  if currentTag ~= EUICompoundTag.Affix then
    image_Submit.gameObject:SetActive(true);
    image_Cancel.gameObject:SetActive(true);
  end

  UI.Close(UIBag);
  UIBag.SkidBlink();
  this.ClearData();

  return true;
end

function UICompound.OnClick_Help(checkShow)
  if checkShow ~= true then
    if currentTag == EUICompoundTag.Reinforcd then
      UI.Open(UITutorialHint, 54, this);
    elseif currentTag == EUICompoundTag.Affix then
      UI.Open(UITutorialHint, 55, this);
    else
      UI.Open(UITutorialHint, 19, this);
    end
  end

  return true;
end

--靈石合成檢查，回傳合成規則  1~5 符合靈石合成規則 0 不符合靈石合成規則 100 物品異常 101 裝備損壞度超過200 102 非靈石或裝備類合成物 103 裝備數量不正確 104 無靈石類物品 105 達到強化等級上限 106 道具位置不正確
local function CheckMixStoneRule()
  local isHaveStone = false;
  local equipCnt = 0;
  local stoneKind;
  local stoneCnt = {};

  for k, v in pairs(compoundInfos) do
    --未開放物品
    if itemDatas[v.itemId].openUsed == 1 or bit.band(itemDatas[v.itemId].restrict, 4) == 4 then
      return 100;
    end

    if Item.IsTypeOfEquips(itemDatas[v.itemId].fitType) or Contains(itemDatas[v.itemId].kind, 57, 59, 62) then
      if k ~= 4 then
        return 106;
      end

      equipCnt = equipCnt + 1;

      if Item.GetBagItem(EThings.Bag, v.bagIndex).stoneLv >= Item.MaxStoneLv then
        return 105;
      end
    elseif itemDatas[v.itemId].kind == EItemKind.Gem then
      stoneKind = Compound.GetStoneKind(v.itemId);

      if Contains(stoneKind, 1, 2, 4) and k ~= 1 then
        return 106;
      end

      if stoneKind == 3 and k ~= 3 then
        return 106;
      end

      stoneCnt[stoneKind] = 1;
      isHaveStone = true;
    else
      return 102;
    end
  end

  if equipCnt ~= 1 then
    return 103;
  end

  if not isHaveStone then
    return 104;
  end

  return Compound.GetMixRule(stoneCnt, equipCnt);
end

local function SendCompound(kind)
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --C:023-014 <合成物品> <<+背包索引(2) +數量(4)>>*3 +合成種類(1)
  sendBuffer:Clear();
  for i = 1, this.MaxCount do
    if compoundInfos[i] ~= nil then
      sendBuffer:WriteUInt16(compoundInfos[i].bagIndex);
      sendBuffer:WriteInt32(compoundInfos[i].quant);
    else
      sendBuffer:WriteUInt16(0);
      sendBuffer:WriteInt32(0);
    end
  end
  sendBuffer:WriteByte(kind);
  Network.Send(23, 14, sendBuffer);

  this.ClearData();
end

function UICompound.OnClick_Submit(uiEvent)
  --檢查戰鬥
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end

  --檢查場景
  if SceneManager.sceneId == 10701 then
    ShowCenterMessage(string.Get(40097));
    return;
  end

  --合成
  if currentTag == EUICompoundTag.Compound then
    --檢查背包空間
    if Item.ThingFindEmpty() == 0 then
      ShowCenterMessage(string.Get(40098));
      return;
    end

    --檢查羽毛合成規則
    local featherCount = 0;
    local featherRank = 0;
    for k, v in pairs(compoundInfos) do
      local itemSave = itemDatas[v.itemId];
      if itemSave ~= nil and itemSave.kind == EItemKind.Feather then
        --羽毛必須同階級
        if featherRank == 0 then
          featherRank = itemSave.level;
        elseif featherRank ~= itemSave.level then
          ShowCenterMessage(string.Get(21536));
          return;
        end

        featherCount = featherCount + 1;
      end
    end

    --羽毛必須三合一
    if featherCount > 0 and featherCount < this.MaxCount then
      ShowCenterMessage(string.Get(21536));
      return;
    end

    --一般合成
    SendCompound(1);
  
  --煉化
  elseif currentTag == EUICompoundTag.Refinery then
    if compoundInfos[1] == nil then
      ShowCenterMessage(string.Get(80330));
      return;
    end

    if compoundInfos[4] == nil then
      ShowCenterMessage(string.Get(80329));
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      return;
    end

    local itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[4].bagIndex);
    if itemSave == nil then return end

    local stoneItemId = compoundInfos[1].itemId;
    local stoneItemData = itemDatas[stoneItemId];
    local equipItemId = compoundInfos[4].itemId;
    
    if itemSave.damage >= Item.MaxStoneFailDamage then
      ShowCenterMessage(string.Get(80333));
      return;
    end

    if compoundInfos[3] ~= nil then
      if stoneItemData.threshold == 4 then
        ShowCenterMessage(string.Get(80331));
        return;
      end

      if itemDatas[compoundInfos[3].itemId].spare3 ~= 0 and itemSave.stoneLv > itemDatas[compoundInfos[3].itemId].spare3 then
        ShowCenterMessage(string.Get(22159));
        return;
      end
    end

    local mixRule = CheckMixStoneRule();

    --一般靈石合成
    if Contains(mixRule, 1, 2, 3, 4) then
      --檢查靈石合成裝備限制
      if not Compound.CheckEquipLimit(equipItemId, stoneItemId) then
        ShowCenterMessage(string.Get(80308));
        return;
      end

      --超過強化等級上限
      if itemSave.stoneLv >= Item.MaxStoneLv then
        ShowCenterMessage(string.Get(80324));
        return;
      end
      
      --檢查裝備靈石屬性和要合成的靈石屬性是否相同
      if itemSave.stoneAttr ~= 0 and itemSave.stoneAttr ~= Compound.GetStoneAttr(stoneItemId) then
        ShowCenterMessage(string.Get(80309));
        return;
      end
      
    --指定階層靈石合成
    elseif mixRule == 5 then
      --裝備沒屬性不能提昇強化等級
      if itemSave.stoneAttr == 0 then
        ShowCenterMessage(string.Get(80325));
        return;
      end
    
      --指定強化不可比裝備上的等級低或相同
      if Compound.GetStoneLink(stoneItemId) <= itemSave.stoneLv then
        ShowCenterMessage(string.Get(80326));
        return;
      end

    else
      ShowCenterMessage(string.Get(80328));
      return;
    end

    this.StopMixEffect();

    --C:023-078 <靈石強化> +靈石背包索引(2) +裝備背包索引(2) +符背包索引(2)
    sendBuffer:Clear();
    sendBuffer:WriteUInt16(compoundInfos[1].bagIndex);
    sendBuffer:WriteUInt16(compoundInfos[4].bagIndex);
    if compoundInfos[3] ~= nil then
      sendBuffer:WriteUInt16(compoundInfos[3].bagIndex);
    else
      sendBuffer:WriteUInt16(0);
    end
    Network.Send(23, 78, sendBuffer);
  
  --精煉
  elseif currentTag == EUICompoundTag.Element then
    if compoundInfos[1] == nil then
      ShowCenterMessage(string.Get(20712));
      return;
    end

    if compoundInfos[3] == nil then
      ShowCenterMessage(string.Get(80338));
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      return;
    end

    local itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[1].bagIndex);
    if itemSave == nil then return end

    if itemSave.elementValue > 0 or itemSave.element > 0 then
      ShowCheckMessage(
        function(result)
          if result then
            --羽毛合成
            SendCompound(2);
          else
            this.ClearData();
          end
        end,
        string.Get(80293),
        Role.player
      );
    else
      --羽毛合成
      SendCompound(2);
    end
    
  --鑲崁
  elseif currentTag == EUICompoundTag.Proof then
    if compoundInfos[1] == nil then
      ShowCenterMessage(string.Get(20713));
      return;
    end

    if compoundInfos[3] == nil then
      ShowCenterMessage(string.Get(20714));
      return;
    end

    local itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[1].bagIndex);
    if itemSave == nil then return end

    if itemSave.proofKind > 0 then
      ShowCenterMessage(string.Get(20719));
      return;
    end

    --珍珠合成
    SendCompound(3);

  --天官
  --elseif currentTag == EUICompoundTag.TianGuan then
  --  if compoundInfos[1] == nil then
  --    ShowCenterMessage(string.Get(21988));
  --    return;
  --  end
  --
  --  if compoundInfos[4] == nil then
  --    ShowCenterMessage(string.Get(21987));
  --    return;
  --  end
  --
  --  local itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[4].bagIndex);
  --  if itemSave == nil then return end
  --
  --  local enhanceItemData = itemDatas[compoundInfos[1].itemId];
  --
  --  --超過階數上限
  --  if itemSave.stoneLv >= Item.maxTianGuanLv then
  --    ShowCenterMessage(string.Get(22017));
  --    --5-----------------------------------------------------
  --    if LuaHelper.CheckDefine("DemoCode") then
  --      --
  --    end
  --    --6-----------------------------------------------------
  --    --5-----------------------------------------------------
  --    if LuaHelper.CheckDefine("DemoCode") then
  --      --
  --    end
  --    --6-----------------------------------------------------
  --    --5-----------------------------------------------------
  --    if LuaHelper.CheckDefine("DemoCode") then
  --      --
  --    end
  --    --6-----------------------------------------------------
  --    --5-----------------------------------------------------
  --    if LuaHelper.CheckDefine("DemoCode") then
  --      --
  --    end
  --    --6-----------------------------------------------------
  --    --5-----------------------------------------------------
  --    if LuaHelper.CheckDefine("DemoCode") then
  --      --
  --    end
  --    --6-----------------------------------------------------
  --    return;
  --  end
  --
  --  --指定階數
  --  if enhanceItemData.threshold == 3 then
  --    --不需增加機率
  --    if compoundInfos[3] ~= nil then
  --      ShowCenterMessage(string.Get(80331));
  --      return;
  --    end
  --
  --    --不可小於目前階數
  --    if enhanceItemData.skillLink <= itemSave.stoneLv then
  --      ShowCenterMessage(string.Get(22014));
  --      return;
  --    end
  --  end
  --
  --  this.StopMixEffect();
  --
  --  --C:023-086 <天官強化> +符背包索引(2) +裝備背包索引(2) +祝福背包索引(2)
  --  sendBuffer:Clear();
  --  sendBuffer:WriteUInt16(compoundInfos[1].bagIndex);
  --  sendBuffer:WriteUInt16(compoundInfos[4].bagIndex);
  --  if compoundInfos[3] ~= nil then
  --    sendBuffer:WriteUInt16(compoundInfos[3].bagIndex);
  --  else
  --    sendBuffer:WriteUInt16(0);
  --  end
  --  Network.Send(23, 86, sendBuffer);

  --消除
  elseif currentTag == EUICompoundTag.Remove then
    local ERemoveKind = {
      Refinery = 1,
      Proof = 3,
    }

    if compoundInfos[1] == nil then
      ShowCenterMessage(string.Get(22181));
      return;
    end

    if compoundInfos[3] == nil then
      ShowCenterMessage(string.Get(22182));
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      return;
    end

    if compoundInfos[1].itemSave ~= nil then
      if compoundInfos[3].threshold == ERemoveKind.Refinery and compoundInfos[1].itemSave.stoneAttr <= 0 then
        ShowCenterMessage(string.format(string.Get(22180), string.Get(20475)));
        return;
      end

      if compoundInfos[3].threshold == ERemoveKind.Proof and compoundInfos[1].itemSave.proofKind <= 0 then
        ShowCenterMessage(string.format(string.Get(22180), string.Get(20473)));
        return;
      end
    end

    local removeKindStr = "";
    if compoundInfos[3].threshold == ERemoveKind.Refinery then
      removeKindStr = string.Get(20475);
    elseif compoundInfos[3].threshold == ERemoveKind.Proof then
      removeKindStr = string.Get(20473);
    end

    ShowCheckMessage(
      function(result)
        if result then
          --C:023-088 <靈石珍珠消除> +背包索引(2) +消除令背包索引(2)
          sendBuffer:Clear();
          sendBuffer:WriteUInt16(compoundInfos[1].bagIndex);
          sendBuffer:WriteUInt16(compoundInfos[3].bagIndex);
          Network.Send(23, 88, sendBuffer);
        else
          this.ClearData();
        end
      end,
      string.format(string.Get(22183), removeKindStr),
      Role.player
    );

  --進化
  elseif currentTag == EUICompoundTag.Evolution then
    if compoundInfos[1] == nil then
      ShowCenterMessage(string.Get(22296));
      return;
    end

    if compoundInfos[2] == nil then
      ShowCenterMessage(string.Get(22305));
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      return;
    end

    if currentEvo == EvoMode.Style then
      local itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[1].bagIndex);
      if itemSave == nil then return end

      if Role.GetPlayerGold() < this.CalculateGold(itemSave.styleLv) then
        ShowCenterMessage(string.Get(22314));
        return;
      end

      this.StopMixEffect();

      --C:023-095 <時裝進化>  +材料1背包索引(2) +材料2背包索引(2) +機率背包索引(2)
      sendBuffer:Clear();
      sendBuffer:WriteUInt16(compoundInfos[1].bagIndex);
      sendBuffer:WriteUInt16(compoundInfos[2].bagIndex);
      if compoundInfos[5] ~= nil then
        sendBuffer:WriteUInt16(compoundInfos[5].bagIndex);
      else
        sendBuffer:WriteUInt16(0);
      end
      Network.Send(23, 95, sendBuffer);
    else
      if itemEvolutionDatas[compoundInfos[1].itemId] == nil then return end
      if itemEvolutionDatas[compoundInfos[1].itemId][compoundInfos[2].itemId] == nil then return end

      local evolutionData = itemEvolutionDatas[compoundInfos[1].itemId][compoundInfos[2].itemId][evolutionSelect];
      if evolutionData == nil then return end

      if not Role.CheckCurrency(evolutionData.requireCurrency, evolutionData.requireCurrencyValue, true) then return end

      this.StopMixEffect();

      --C:023-090 <物品進化功能> +進化物品ID(2) +材料1背包索引(2) +材料2背包索引(2) +機率背包索引(2) +防爆背包索引(2)
      sendBuffer:Clear();
      sendBuffer:WriteUInt16(evolutionData.itemId);
      sendBuffer:WriteUInt16(compoundInfos[1].bagIndex);
      sendBuffer:WriteUInt16(compoundInfos[2].bagIndex);
      if compoundInfos[5] ~= nil then
        sendBuffer:WriteUInt16(compoundInfos[5].bagIndex);
      else
        sendBuffer:WriteUInt16(0);
      end
      if compoundInfos[6] ~= nil then
        sendBuffer:WriteUInt16(compoundInfos[6].bagIndex);
      else
        sendBuffer:WriteUInt16(0);
      end
      Network.Send(23, 90, sendBuffer);
    end
  elseif currentTag == EUICompoundTag.WeaponEnhance then
    if compoundInfos[1] == nil then
      return;
    end

    if compoundInfos[3] == nil then
      return;
    end

    if compoundInfos[1].itemId ~= compoundInfos[3].itemId then 
      ShowCenterMessage(string.Get(22703));
      return;
    end

    if compoundInfos[1].itemSave ~= nil and compoundInfos[3].itemSave ~= nil then 
      if compoundInfos[1].itemSave.enhanceLv ~= compoundInfos[3].itemSave.enhanceLv then 
        ShowCenterMessage(string.Get(22704));
        return;
      end
    end
    this.StopMixEffect();
    ExclusiveWeapon.SendEnhance(compoundInfos[1].bagIndex, compoundInfos[3].bagIndex);
  elseif currentTag == EUICompoundTag.Reinforcd then
    if compoundInfos[1] == nil then
      ShowCenterMessage(string.Get(23036));
      return;
    end

    local itemSave;
    itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[1].bagIndex);

    if itemSave.Reinforced >= maxReinforced then
      ShowCenterMessage(string.Get(23034));
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      return;
    end

    local eqRateData = eqRateDatas[itemSave.Reinforced];

    if eqRateData == nil then return end
    if itemSave ~= nil and Item.GetItemCount(eqRateData.itemId) < eqRateData.count then
      if eqRateData.itemId > 0 then
        ShowCenterMessage(string.Get(23036));
        return;
      end
    end

    if itemSave ~= nil and Role.GetPlayerGold() < eqRateData.required then
      ShowCenterMessage(string.Get(22314));
      return;
    end

    this.StopMixEffect();

    local refins = {};
    local compareItemId;
    if eqRateData.itemId > 0 then
      compareItemId = eqRateData.itemId;
    else
      compareItemId = itemSave.Id;
    end

    table.Clear(refins);
    local bagItemSave;
    --local bagCount = 0;
    if compoundInfos[2] ~= nil then
      if eqRateData.itemId > 0 then
        for i = 1, Item.MaxThingGrid do
          bagItemSave = Item.GetBagItem(EThings.Bag, i);
          if bagItemSave ~= nil and bagItemSave.Id == compareItemId then
            --bagCount = bagCount + bagItemSave.quant;
            --if bagCount <= eqRateData.count then
            --  refins[i] = bagItemSave.quant;
            --else
            --  refins[i] = bagItemSave.quant;
            --  break;
            --end

            refins[i] = i;
          end
        end
      else
        refins[1] = compoundInfos[2].bagIndex;
      end
    else
      if Contains(currentReinforced, 4, 9, 14) then
        ShowCenterMessage(string.Get(23128));
        return;
      end
    end

    local refinsCount = table.Count(refins);
    if refinsCount <= 0 then
      ShowCenterMessage(string.Get(23036));
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      return;
    end

    --C:023-092 <升階功能> 背包索引(2) +L(1) +<<背包索引(2)>> +卷軸背包索引(2) +符背包索引(2)
    sendBuffer:Clear();
    sendBuffer:WriteUInt16(compoundInfos[1].bagIndex);
    sendBuffer:WriteByte(refinsCount);
    for k, v in pairs(refins) do
      --sendBuffer:WriteByte(k);
      sendBuffer:WriteUInt16(v);
    end

    if compoundInfos[5] ~= nil then
      sendBuffer:WriteUInt16(compoundInfos[5].bagIndex);
    else
      sendBuffer:WriteUInt16(0);
    end

    if compoundInfos[6] ~= nil then
      sendBuffer:WriteUInt16(compoundInfos[6].bagIndex);
    else
      sendBuffer:WriteUInt16(0);
    end
    Network.Send(23, 92, sendBuffer);

  elseif currentTag == EUICompoundTag.Affix then
    this.SendAffix();
  end
end

function UICompound.CalculateGold(lv)
  return 30000 + 5000 * (lv + styleSafeLv) * lv;
end

function UICompound.OnClick_Cancel()
  if currentTag == EUICompoundTag.Affix and currentAffix.status == EAffixMode.Info then
    this.ClearAffixInfo();
  end

  this.ClearData();
end

function UICompound.OnClick_CloseDetail()
  gameObject_Affix_Detail:SetActive(false);
end

function UICompound.OnClick_AffixCancel()
  currentAffix.status = EAffixMode.Info;
  isContinue = false;

  this.UpdateAffix();
end

function UICompound.SendAffix()
  if affixInfos[1] == nil or affixInfos[2] == nil or affixInfos[2].bagIndex == 0 then
    ShowCenterMessage(string.Get(23046));
    return;
  end

  if currentAffix.checkbox == nil or currentAffix.checkbox == 0 then
    ShowCenterMessage(string.Get(23080));
    return;
  end

  local itemSave;
  itemSave = Item.GetBagItem(EThings.Bag, affixInfos[1].bagIndex);
  if itemSave == nil then
    ShowCenterMessage(string.Get(23046));
    return;
  end

  itemSave = Item.GetBagItem(EThings.Bag, affixInfos[2].bagIndex);
  if itemSave == nil then
    if Item.GetItemCount(affixInfos[2].itemId) > 0 then
      affixInfos[2].bagIndex = Item.GetItemIndex(affixInfos[2].itemId);
    else
      ShowCenterMessage(string.Get(23182));
      return;
    end
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --C:023-093 <洗鍊功能> 背包索引(2) +符背包索引(2) + indx(1)
  sendBuffer:Clear();
  sendBuffer:WriteUInt16(affixInfos[1].bagIndex);
  sendBuffer:WriteUInt16(affixInfos[2].bagIndex);
  sendBuffer:WriteByte(currentAffix.checkbox);
  Network.Send(23, 93, sendBuffer);
end

function UICompound.OnClick_AffixContinue()
  isContinue = true;
  this.SendAffix();
end

function UICompound.OnClick_AffixSubmit()
  isContinue = false;

  local itemSave;
  itemSave = Item.GetBagItem(EThings.Bag, affixInfos[1].bagIndex);
  if itemSave == nil then
    ShowCenterMessage(string.Get(23046));
    return;
  end

  --C:023-094 <洗鍊決定> +是否洗鍊(1) 1:確定洗鍊  + 背包索引(2) + indx(1) + 表的Indx(1)
  sendBuffer:Clear();
  sendBuffer:WriteByte(1);
  sendBuffer:WriteUInt16(affixInfos[1].bagIndex);
  sendBuffer:WriteByte(sliderIndex);
  sendBuffer:WriteByte(tableIndex);
  Network.Send(23, 94, sendBuffer);
end

function UICompound.SetDefAffixCheckbox(itemSave)
  if affixInfos[1] ~= nil and itemSave ~= nil and itemSave.Reinforced ~= nil then
    if Between(itemSave.Reinforced, 5, 9) then
      currentAffix.checkbox = 1;
    else
      if currentAffix.status ~= EAffixMode.Check then
        currentAffix.checkbox = 0;
      end
    end

    this.UpdateAffixCheckbox(currentAffix.checkbox);
  end
end

function UICompound.ClearAffixInfo()
  currentAffix.status = EAffixMode.None;
  currentAffix.bagIndex = 0;
  currentAffix.checkbox = 0;
  this.UpdateAffixCheckbox(0);
  table.Clear(affixInfos);
  if text_AffixInfoRequired ~= nil then
    text_AffixInfoRequired.text = "";
  end

  if text_AffixCheckRequired ~= nil then
    text_AffixCheckRequired.text = "";
  end
end

function UICompound.OnClick_Pr(uiEvent)
  local index = uiEvent.parameter;
  local fitType = affixInfos[1].fitType;
  gameObject_Affix_Detail:SetActive(true);

  local detailText = "";
  text_Detail.text = "";

  local attrs = {};
  for k, v in pairs(eqAffixDatas[fitType]) do
    if v.attr ~= nil then
      attrs[v.attr] = v.attr;
    end
  end

  for k, v in pairs(attrs) do
    local max, min = EQAffixData.GetMaxMinValue(fitType, v, index)
    detailText = string.Concat(detailText, ItemData.GetAttrText(v), " +", min, " ~ +", max, " \n");
  end

  text_Detail.text = detailText;

  scroll_ContentRect.anchoredPosition = Vector2.New(0, 0);
end

function UICompound.OnClick_AffixCheckbox(uiEvent)
  local index = uiEvent.parameter;
  if currentAffix.checkbox == index then return end;

  currentAffix.checkbox = index;

  this.UpdateAffixCheckbox(index);
end

function UICompound.UpdateAffixCheckbox(index)
  for k, v in pairs(uiAffixInfo) do
    v.CheckboxImage.sprite =  UI.GetCheckBoxSprite(false);
  end

  if Between(index, 1, 3) then
    uiAffixInfo[index].CheckboxImage.sprite = UI.GetCheckBoxSprite(true);
  end
end

function UICompound.OnClick_EvolutionSelect()
  if currentTag ~= EUICompoundTag.Evolution then return end
  if compoundInfos[1] == nil then return end
  if compoundInfos[2] == nil then return end
  if itemEvolutionDatas[compoundInfos[1].itemId][compoundInfos[2].itemId] == nil then return end
  if table.Count(itemEvolutionDatas[compoundInfos[1].itemId][compoundInfos[2].itemId]) <= 1 then return end

  UI.Open(UIItemInfo, EThings.EvolutionSelect, compoundInfos[1].itemId, compoundInfos[2].itemId,
    string.Get(22294),
    function()
      local selects = UIItemInfo.GetExchangeSelect();
      local selectIndex = nil;
      local selectCount = 0;
      for k in pairs(selects) do
        if selects[k] then
          selectCount = selectCount + 1;
          selectIndex = k;
        end
      end
    
      if selectCount ~= 1 then return end

      UI.Close(UIItemInfo);

      evolutionSelect = selectIndex;
      this.UpdateUI();
    end
  );
end