UIGodskinTag = {
  Upgrade = 1, --神化裝強化
  Enchant = 2, --附魔
  Remake = 3, --重製
}

UIGodskinEffect = {
  Compound = 0,
  Success = 1,
  Fail = 2,
}

--神功錘星等對應花費
UIGodskinRemakeTs = {
  [1] = 5,
  [2] = 10,
  [3] = 20,
  [4] = 40,
  [5] = 100,
  [6] = 100,
}

UIGodskin = {}
local this = UIGodskin;
this.name = "UIGodskin";
this.uiController = nil;

--ui
local transform_FrameRect;
local text_Content;
local text_MythLv;
local text_Submit;
local text_Rate;
local text_Required;
local text_Warning;
local text_Detail;
local text_EquipName;
local rawImage_Mixed;
local uiCompounds = {};
local uiBeforeText = {};
local uiAfterText = {};
local gameObject_After = {};
local image_Submit;
local image_Cancel;
local rawImageBgRight;
local rawImageBgLeft;
local rawImageBgCenter;

--var
local currentTag = UIGodskinTag.Upgrade;
local tagDatas = {};
local compoundInfos = {};
local currentAttr = 0;
local ENCHANT_TS = 10;
local REMAKE_TS = 100;
local lastMyth = {};

function UIGodskin.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;
  this.uiController.onClose = this.OnClose;
  
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;
  text_Content = uiController:FindText("Text_Content");
  text_MythLv = uiController:FindText("Text_MythLv");
  text_Submit = uiController:FindText("Text_Submit");
  text_Rate = uiController:FindText("Text_Rate");
  text_Required = uiController:FindText("Text_Required");
  text_EquipName = uiController:FindText("Text_EquipName");
  text_Warning = uiController:FindText("Text_Warning");
  text_Detail = uiController:FindText("Text_Detail");

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
  
  for i = 1, 5 do
    local tempTransform = uiController:FindGameObject("Before").transform;
    uiBeforeText[i] = tempTransform:Find(string.Concat("Text_Before_", i)):GetComponent("Text");
    tempTransform = uiController:FindGameObject("After").transform;
    uiAfterText[i] = tempTransform:Find(string.Concat("Text_After_", i)):GetComponent("Text");
    gameObject_After[i] = uiController:FindGameObject(string.Concat("UpdateInfo_", i));
  end

  rawImage_Mixed = uiController:FindRawImage("RawImage_Mixed");
  rawImage_Mixed.enabled = false;

  image_Submit = uiController:FindEvent("Image_Submit");
  image_Submit:SetListener(EventTriggerType.PointerClick, this.OnClick_Submit);

  image_Cancel = uiController:FindEvent("Image_Cancel");
  image_Cancel:SetListener(EventTriggerType.PointerClick, this.OnClick_Cancel);

  rawImageBgRight = uiController:FindRawImage("RawImage_RightBG");
  rawImageBgLeft = uiController:FindRawImage("RawImage_LeftBG");
  rawImageBgCenter = uiController:FindRawImage("RawImage_Center");
end

function UIGodskin.OnOpen(tag)
  if tag ~= nil then
    currentTag = tag;
  else
    currentTag = UIGodskinTag.Upgrade;
  end

  text_Warning.text = "";
  for i = 1, 5 do
    uiAfterText[i].text = "";
    gameObject_After[i]:SetActive(false);
  end

  --tag
  tagDatas = {};
  tagDatas[1] = { string.Get(23653), nil };
  tagDatas[2] = { string.Get(23654), nil };
  tagDatas[3] = { string.Get(23656), nil };

  return true;
end

function UIGodskin.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(23652), this.OnClick_Close, this.OnClick_Help, this.OnClick_Tag, tagDatas, currentTag);

    this.UpdateUI();
  end
end

function UIGodskin.ClearData(updateUI)
  Item.ClearAllInUse();

  table.Clear(compoundInfos);

  for i = 1, 5 do
    uiBeforeText[i].text = "";
    uiAfterText[i].text = "";
    gameObject_After[i]:SetActive(false);
  end

  this.StopMixEffect();
  
  if updateUI then
    this.UpdateUI();
  end
end

function UIGodskin.UpdateUI()
  this.UpdateUpgrade();  --神化裝強化
  this.UpdateEnchant();--附魔
  this.UpdateRemake();--remake
end

--神化裝強化
function UIGodskin.UpdateUpgrade()
  if currentTag ~= UIGodskinTag.Upgrade then return end
  
  local itemSave;
  local rate = "";
  local calcRate = function(lv)
    if Between(lv, 0, 3) then
      rate = string.Get(23646);
    elseif Between(lv, 4, 6) then
      rate = string.Get(23647);
    elseif Between(lv, 7, 9) then
      rate = string.Get(23648);
    elseif Between(lv, 10, 12) then
      rate = string.Get(23649);
    elseif Between(lv, 13, 15) then
      --3----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        DemoCode.SetColorNum(10);
        local area =  DemoCode.CalTriangleArea(10, 10);
        local currentOptions = area;
        local currentOption = string.Get(80098);
      end
      --4-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        for i = 1, 3 do
          DemoCode.SetColorNum(i);
        end
        local area =  DemoCode.CalTriangleArea(1, 1);
        local currentOptio = area;
        local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
      rate = string.Get(23650);
    end
  end
  
  if compoundInfos[1] ~= nil then
    itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[1].bagIndex);
    if itemSave == nil or itemSave.Id ~= compoundInfos[1].itemId then
      this.ClearUpgradeInfo();
    end
  else
    uiCompounds[3].text_Hint.text = "";
  end
  
  if compoundInfos[1] ~= nil and itemSave ~= nil then
    local itemData = itemDatas[itemSave.Id];
    compoundInfos[3] = {};
    
    local mythLv = itemSave.mythLv + 1;
    local startLv = itemData.threshold;
    
    local upgradeData = SacredEquipUpgradeDatas[mythLv];
    if upgradeData ~= nil then
      if upgradeData.spend[startLv] ~= nil then
        compoundInfos[3].quant = upgradeData.spend[startLv];
      else
        compoundInfos[3].quant = 0;
      end
  
      if upgradeData.kind == ECurrency.TS then
        compoundInfos[3].itemId = 65343;
        uiCompounds[3].text_Hint.text = string.Get(23682);
        if Role.GetPlayerCurrency(ECurrency.TS) < upgradeData.spend[startLv] then
          compoundInfos[3].SetInUse = true;
        else
          compoundInfos[3].SetInUse = false;
        end
      elseif upgradeData.kind == ECurrency.Money then
        compoundInfos[3].itemId = 65351;
        uiCompounds[3].text_Hint.text = string.Get(20032);
        if Role.GetPlayerGold() < upgradeData.spend[startLv] then
          compoundInfos[3].SetInUse = true;
        else
          compoundInfos[3].SetInUse = false;
        end
      else
        uiCompounds[3].text_Hint.text = "";
      end
    else
      compoundInfos[3].quant = 0;
      compoundInfos[3].SetInUse = false;
      uiCompounds[3].text_Hint.text = "";
    end
    
    
    compoundInfos[3].bagIndex = 0;

    uiBeforeText[1].text = itemData:GetGodMainAttrText(itemSave);
    uiBeforeText[2].text = itemData:GetGodSubAttrText(itemSave, 1);
    uiBeforeText[3].text = itemData:GetGodSubAttrText(itemSave, 2);
    uiBeforeText[4].text = itemData:GetGodSubAttrText(itemSave, 3);
    uiBeforeText[5].text = itemData:GetGodSubAttrText(itemSave, 4);
    
    calcRate(itemSave.mythLv);
  
    local nextLv = math.min(15, itemSave.mythLv + 1);
    local index = itemData.attribute[1].kind;
    local primaryData = SacredEquipPrimaryDatas[index];
    if primaryData ~= nil and primaryData.upgradeLv[nextLv] ~= nil then
      uiAfterText[1].text = string.GetColorText(primaryData.upgradeLv[nextLv], Color.DarkGreen);
      gameObject_After[1]:SetActive(true);
    else
      uiAfterText[1].text = "";
      gameObject_After[1]:SetActive(false);
    end
    
  else
    this.ClearUpgradeInfo();
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      for i = 1, 3 do
        DemoCode.SetColorNum(i);
      end
      local area =  DemoCode.CalTriangleArea(1, 1);
      local currentOptio = area;
      local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  end
  
  for i = 1, 6 do
    if i == 1 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com006");
      uiCompounds[i].text_Hint.text = string.Get(23652);
      uiCompounds[i].gameObject:SetActive(true);
      uiCompounds[i].arrow.gameObject:SetActive(false);
    elseif i == 3 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com006");
      uiCompounds[i].gameObject:SetActive(true);
      uiCompounds[i].arrow.gameObject:SetActive(false);
    else
      uiCompounds[i].image_BG.sprite = nil;
      uiCompounds[i].text_Hint.text = "";
      uiCompounds[i].gameObject:SetActive(false);
    end
    
    if compoundInfos[i] ~= nil then
      local itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[i].bagIndex);

      if itemSave ~= nil then
        if Contains(i, 1, 3) then
          uiCompounds[i].item:SetItem(compoundInfos[i].itemId, compoundInfos[i].quant, itemSave);
          uiCompounds[i].item:SetInUse(compoundInfos[i].SetInUse);
        else
          uiCompounds[i].item:SetItem(itemSave.Id, 1, itemSave);
        end
      else
        if Contains(i, 1, 3) then
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
    
    if Contains(i, 1) then
      uiCompounds[i].item:SetEvent(this.RemoveItem, i);
    end
  end
  
  if itemSave ~= nil and itemSave.mythLv >= 15 then
    text_Rate.text = "";
    text_Content.text = string.Get(20582);
  else
    text_Rate.text = string.Concat(string.Get(23651), rate);
  end
  
  if itemSave ~= nil then
    if Contains(itemSave.mythLv, 2, 5, 8, 11, 14) then
      text_Content.text = string.Get(23669);
    else
      text_Content.text = "";
    end
    
    text_MythLv.text = string.Concat("+", itemSave.mythLv);
  else
    text_Content.text = "";
    text_MythLv.text = "";
  end
  
  text_Submit.text = string.Get(23653);
  this.StopMixEffect();
  
  UI.Open(UIBag,
    function(bagIndex, itemId)
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, 0,
        string.Get(23653),
        function(bagKind, bagIndex, followIndex)
          local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
          if itemSave == nil then return end
          if Item.IsLock(itemSave) then return end
          
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

            this.UpdaetInUse(bagIndex);
            this.UpdateUI();
          end
  
          index = 1;
          for i = index, 6 do
            compoundInfos[i] = nil;
          end
          
          func();
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
      if itemSave.mythLv >= 15 then return false end
      if itemDatas[itemSave.Id].kind ~= EItemKind.Myth then return false end

      return true;
    end,
    true,
    false,
    nil,
    true
  );
end

function UIGodskin.UpdateEnchant()
  if currentTag ~= UIGodskinTag.Enchant then return end
  
  local itemSave;
  if compoundInfos[1] ~= nil then
    itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[1].bagIndex);
    if itemSave == nil or itemSave.Id ~= compoundInfos[1].itemId then
      this.ClearUpgradeInfo();
    end
  end
  
  if compoundInfos[1] ~= nil and itemSave ~= nil then
    local itemData = itemDatas[itemSave.Id];
    
    compoundInfos[3] = {};
    compoundInfos[3].itemId = 65343;
    compoundInfos[3].bagIndex = 0;
    compoundInfos[3].quant = ENCHANT_TS;
    
    uiBeforeText[1].text = itemData:GetGodMainAttrText(itemSave);
    uiBeforeText[2].text = itemData:GetGodSubAttrText(itemSave, 1);
    uiBeforeText[3].text = itemData:GetGodSubAttrText(itemSave, 2);
    uiBeforeText[4].text = itemData:GetGodSubAttrText(itemSave, 3);
    uiBeforeText[5].text = itemData:GetGodSubAttrText(itemSave, 4);
    
    if Role.GetPlayerCurrency(ECurrency.TS) < ENCHANT_TS then
      ShowCenterMessage(string.Get(23686));
      compoundInfos[3].SetInUse = true;
    else
      compoundInfos[3].SetInUse = false;
    end
    
  else
    this.ClearUpgradeInfo();
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      for i = 1, 3 do
        DemoCode.SetColorNum(i);
      end
      local area =  DemoCode.CalTriangleArea(1, 1);
      local currentOptio = area;
      local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  end
  
  for i = 1, 6 do
    if i == 1 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com006");
      uiCompounds[i].text_Hint.text = string.Get(23652);
      uiCompounds[i].gameObject:SetActive(true);
      uiCompounds[i].arrow.gameObject:SetActive(false);
    elseif i == 2 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com006");
      uiCompounds[i].text_Hint.text = string.Get(23672);
      uiCompounds[i].gameObject:SetActive(true);
      uiCompounds[i].arrow.gameObject:SetActive(false);
    elseif i == 3 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com006");
      uiCompounds[i].text_Hint.text = string.Get(23682);
      uiCompounds[i].gameObject:SetActive(true);
      uiCompounds[i].arrow.gameObject:SetActive(false);
    else
      uiCompounds[i].image_BG.sprite = nil;
      uiCompounds[i].text_Hint.text = "";
      uiCompounds[i].gameObject:SetActive(false);
    end
    
    if compoundInfos[i] ~= nil then
      local itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[i].bagIndex);
      
      if itemSave ~= nil then
        if Contains(i, 1, 3) then
          uiCompounds[i].item:SetItem(compoundInfos[i].itemId, compoundInfos[i].quant, itemSave);
          uiCompounds[i].item:SetInUse(compoundInfos[i].SetInUse);
        else
          uiCompounds[i].item:SetItem(itemSave.Id, itemSave.quant, itemSave);
        end
      else
        if Contains(i, 3) then
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
  
    if Contains(i, 1, 2) then
      uiCompounds[i].item:SetEvent(this.RemoveItem, i);
    end
  end
  
  text_MythLv.text = "";
  text_Content.text = "";
  text_Submit.text = string.Get(23654);
  this.StopMixEffect();
  
  UI.Close(UIBag);
  UI.Open(UIBag,
    function(bagIndex, itemId)
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, 0,
        string.Get(23654),
        function(bagKind, bagIndex, followIndex)
          local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
          if itemSave == nil then return end
          if Item.IsLock(itemSave) then return end
          
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
            compoundInfos[index].myth = {};
            
            compoundInfos[index].myth[1] = itemSave.myth[1].kind;
            compoundInfos[index].myth[2] = itemSave.myth[2].kind;
            compoundInfos[index].myth[3] = itemSave.myth[3].kind;
            compoundInfos[index].myth[4] = itemSave.myth[4].kind;
            
            this.UpdaetInUse(bagIndex);
            this.UpdateUI();
          end
  
          if compoundInfos[1] == nil then
            index = 1;
            for i = index, 6 do
              compoundInfos[i] = nil;
            end
    
            func();
          elseif compoundInfos[1] ~= nil then
            index = 2

            if compoundInfos[1] ~= nil and compoundInfos[1].myth then
              for k, v in pairs(compoundInfos[1].myth) do
                if v == itemDatas[itemId].attribute[1].kind then
                  currentAttr = k + 1;
                end
              end
            end
            
            this.UpdateAttrInfo(itemId);
            
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
      if itemSave.isVender then return false end
      if itemSave.isDeliver then return false end
      if compoundInfos[1] == nil then
        if itemDatas[itemSave.Id].kind ~= EItemKind.Myth then return false end
      else
        if itemDatas[itemSave.Id].kind ~= EItemKind.Enchant then return false end
        if itemDatas[compoundInfos[1].itemId].threshold < itemDatas[itemSave.Id].threshold then return false end
        if not Contains(itemDatas[itemSave.Id].attribute[1].kind, compoundInfos[1].myth[1], compoundInfos[1].myth[2], compoundInfos[1].myth[3], compoundInfos[1].myth[4] ) then return false end
      end

      return true;
    end,
    true,
    false,
    nil,
    true
  );
end

function UIGodskin.UpdateRemake()
  if currentTag ~= UIGodskinTag.Remake then return end
  
  local itemSave;
  if compoundInfos[1] ~= nil then
    itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[1].bagIndex);
    if itemSave == nil or itemSave.Id ~= compoundInfos[1].itemId then
      this.ClearUpgradeInfo();
    end
  end
  
  if compoundInfos[2] ~= nil then
    local itemData = itemDatas[compoundInfos[2].itemId];
    if itemData ~= nil then
      compoundInfos[3] = {};
      compoundInfos[3].itemId = 65343;
      compoundInfos[3].bagIndex = 0;
      compoundInfos[3].quant = UIGodskinRemakeTs[itemData.threshold];
  
      if Role.GetPlayerCurrency(ECurrency.TS) < UIGodskinRemakeTs[itemData.threshold] then
        ShowCenterMessage(string.Get(23686));
        compoundInfos[3].SetInUse = true;
      else
        compoundInfos[3].SetInUse = false;
      end
    end
  end
  
  for i = 1, 6 do
    if i == 1 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com006");
      uiCompounds[i].text_Hint.text = string.Get(23652);
      uiCompounds[i].gameObject:SetActive(true);
      uiCompounds[i].arrow.gameObject:SetActive(true);
    elseif i == 2 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com006");
      uiCompounds[i].text_Hint.text = string.Get(23655);
      uiCompounds[i].gameObject:SetActive(true);
      uiCompounds[i].arrow.gameObject:SetActive(true);
    elseif i == 3 then
      uiCompounds[i].image_BG.sprite = UI.GetSprite("com006");
      uiCompounds[i].text_Hint.text = string.Get(23682);
      uiCompounds[i].gameObject:SetActive(true);
      uiCompounds[i].arrow.gameObject:SetActive(true);
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
        if Contains(i, 1, 3) then
          uiCompounds[i].item:SetItem(compoundInfos[i].itemId, compoundInfos[i].quant, itemSave);
          uiCompounds[i].item:SetInUse(compoundInfos[i].SetInUse);
        else
          uiCompounds[i].item:SetItem(itemSave.Id, itemSave.quant, itemSave);
        end
      else
        if Contains(i, 1, 3) then
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
    
    if Contains(i, 1, 2) then
      uiCompounds[i].item:SetEvent(this.RemoveItem, i);
    end
  end
  
  text_MythLv.text= "";
  text_Content.text = "";
  text_Submit.text = string.Get(23656);
  this.StopMixEffect();
  
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  UI.Close(UIBag);
  UI.Open(UIBag,
    function(bagIndex, itemId)
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, 0,
        string.Get(23656),
        function(bagKind, bagIndex, followIndex)
          local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
          if itemSave == nil then return end
          if Item.IsLock(itemSave) then return end
          
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
  
            for i = 1, 4 do
              if itemSave.myth[i] ~= nil and itemSave.myth[i].extra > 0 then
                ShowCenterMessage(string.Get(23970));
                break;
              end
            end
            
            this.UpdaetInUse(bagIndex);
            this.UpdateUI();
          end
          
          if compoundInfos[1] == nil then
            index = 1;
            for i = index, 6 do
              compoundInfos[i] = nil;
            end
            
            func();
          elseif compoundInfos[1] ~= nil then
            index = 2
            
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
      if itemSave.isVender then return false end
      if itemSave.isDeliver then return false end
      if compoundInfos[1] == nil then
        if itemDatas[itemSave.Id].kind ~= EItemKind.Myth then return false end
      else
        if itemDatas[itemSave.Id].kind ~= EItemKind.Hammer then return false end
        if itemDatas[itemSave.Id].threshold < itemDatas[compoundInfos[1].itemId].threshold then return false end
      end
      
      return true;
    end,
    true,
    false,
    nil,
    true
  );
  
end

function UIGodskin.UpdateAttrInfo(itemId)
  if currentAttr <= 0 then return end
  if itemDatas[itemId] == nil then return end
  
  for i = 1, 5 do
    uiAfterText[i].text = "";
    gameObject_After[i]:SetActive(false);
  end
  
  gameObject_After[currentAttr]:SetActive(true);
  
  uiAfterText[currentAttr].text = string.GetColorText(string.Concat(itemDatas[itemId].attribute[1].value, " ~ ", itemDatas[itemId].attribute[2].value), Color.DarkGreen);
end

function UIGodskin.RemoveItem(uiEvent)
  local index = uiEvent.parameter;

  if not Contains(index, 1, 2) then return end
  if compoundInfos[index] == nil then return end

  local bagItem = Item.GetBagItem(EThings.Bag, compoundInfos[index].bagIndex);

  if bagItem == nil then return end

  UI.Open(UIItemInfo, EThings.Bag, compoundInfos[index].bagIndex, 0,
    string.Get(20110),
    function(bagKind, bagIndex, followIndex)
      compoundInfos[index] = nil;
      if currentTag == UIGodskinTag.Upgrade then
        this.UpdateUpgrade();
      elseif currentTag == UIGodskinTag.Enchant then
        this.UpdateEnchant();
      elseif currentTag == UIGodskinTag.Remake then
        this.UpdateRemake();
      end

      if UI.IsVisible(UIItemInfo) then
        UI.Close(UIItemInfo);
        --3----------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
          DemoCode.SetColorNum(10);
          local area =  DemoCode.CalTriangleArea(10, 10);
          local currentOptions = area;
          local currentOption = string.Get(80098);
        end
        --4-----------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
          for i = 1, 3 do
            DemoCode.SetColorNum(i);
          end
          local area =  DemoCode.CalTriangleArea(1, 1);
          local currentOptio = area;
          local currentOption = string.Get(10055);
        end
        --5-----------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
          --
        end
        --6-----------------------------------------------------
      end
    end
  );
end

function UIGodskin.ClearUpgradeInfo()
  compoundInfos[1] = nil;
  compoundInfos[2] = nil;
  compoundInfos[3] = nil;
  compoundInfos[5] = nil;
  compoundInfos[6] = nil;
  text_Rate.text = "";
  gameObject_After[1]:SetActive(false);
end

function UIGodskin.UpdaetInUse(index)
  Item.RefreshInUse(index);
end

--合成特效開始
function UIGodskin.StartMixEffect(effectKind, bagIndex)
  this.StopMixEffect();
  
  local effectName = nil;
  local effectPage = 0;
  local effectSound = nil;
  local effectTime = 0;
  local loopTimes = -1;

  if effectKind == UIGodskinEffect.Compound then
    effectName = "Mixed";
    effectPage = 6;
    effectTime = 1.5;
    loopTimes = -1;
  elseif effectKind == UIGodskinEffect.Success then
    effectName = "UP";
    effectPage = 9;
    effectSound = "AudioClip_WA0035";
    effectTime = 2;
    loopTimes = 2;
  elseif effectKind == UIGodskinEffect.Fail then
    effectName = "L10248";
    effectPage = 6;
    effectSound = "AudioClip_WA0017";
    effectTime = 2;
    loopTimes = 2;
  end

  if effectName == nil then return end
  if effectPage <= 0 then return end
  
  if currentTag  ==  UIGodskinTag.Remake then
    rawImage_Mixed.rectTransform.anchoredPosition = uiCompounds[4].gameObject.transform.localPosition;
  else
    rawImage_Mixed.rectTransform.anchoredPosition = uiCompounds[1].gameObject.transform.localPosition;
  end
  
  TextureManager.SetPng(ETextureUseType.UI, effectName, rawImage_Mixed);
  rawImage_Mixed.rectTransform.sizeDelta = Vector2.New(rawImage_Mixed.texture.width, rawImage_Mixed.texture.height / effectPage);
  rawImage_Mixed:ShiftUV(1, effectPage, 0.1, loopTimes);
  rawImage_Mixed.enabled = true;

  if effectSound ~= nil then
    AudioManager.PlayOnce(effectSound, 0);
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      for i = 1, 3 do
        DemoCode.SetColorNum(i);
      end
      local area =  DemoCode.CalTriangleArea(1, 1);
      local currentOptio = area;
      local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
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

      if UI.IsVisible(UIGodskin) then
        this.UpdateUI();
      end
    end
  );
end

--合成特效結束
function UIGodskin.StopMixEffect()
  rawImage_Mixed.texture = nil;
  rawImage_Mixed:StopShiftUV();
  rawImage_Mixed.enabled = false;
end

function UIGodskin.OnClick_Close()
  UI.Close(UIGodskin);

  return true;
end

function UIGodskin.OnClose()
  UI.Close(UIBag);
  
  this.ClearData(false);
  
  return true;
end

--[[
S:108_001 <神話裝升級> res(1)
   res = 0:失敗
   1:成功 +背包索引(2)+強化後LV(1) +神話屬性格式*4
   2:失敗(機率不過)
   3:失敗(錢不夠)
--]]
function UIGodskin.RecUpgradeResult(data)
  local result = data:ReadByte();
  
  if result == 1 then
    local bagIndex = data:ReadUInt16();
    local newLevel = data:ReadByte();
    
    this.StartMixEffect(ECompoundEffect.Success, bagIndex);
    
    local newMyth = {};
    for i = 1, 4 do
      newMyth[i] = {}; --神話屬性格式
      newMyth[i].kind = data:ReadByte(); --神話種類
      newMyth[i].value = data:ReadUInt16(); --神話數值
      newMyth[i].extra = data:ReadUInt16(); --神話符文加值
    end
  elseif result == 2 then
    this.StartMixEffect(ECompoundEffect.Fail, nil);
    ShowCenterMessage(string.Get(23951));
  elseif result == 3 then
    local itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[1].bagIndex);
    if itemSave == nil then return end
    local mythLv = itemSave.mythLv;
    local upgradeData = SacredEquipUpgradeDatas[mythLv];
    if upgradeData == nil then return end
    
    if upgradeData.kind == ECurrency.TS then
      ShowCenterMessage(string.Get(23686));
    elseif upgradeData.kind == ECurrency.Money then
      ShowCenterMessage(string.Get(40077));
    end
  elseif result == 255 then
    ShowCenterMessage(string.Get(71336));
  else
    ShowCenterMessage(string.Concat(string.Get(80012), " ", result))
  end
end

--[[
S:108-002<神話裝裝符文> +結果(1)
                          1:成功 +神話裝背包索引(2) +符文背包索引(2) +子屬性*4
                          2:符文星級高於物品
                          3:錢不夠
                          4:找不到對應提升的子屬性
--]]
function UIGodskin.RecEnchantResult(data)
  local result = data:ReadByte();
  
  if result == 1 then
    local bagIndex = data:ReadUInt16();
    local newLevel = data:ReadUInt16();
    
    this.StartMixEffect(ECompoundEffect.Success, bagIndex);
    
    local newMyth = {};
    local diff = 0;
    for i = 1, 4 do
      newMyth[i] = {}; --神話屬性格式
      newMyth[i].kind = data:ReadByte(); --神話種類
      newMyth[i].value = data:ReadUInt16(); --神話數值
      newMyth[i].extra = data:ReadUInt16(); --神話符文加值
    
      diff = newMyth[i].extra - lastMyth[i].extra;
      if diff > 0 then
        ShowCenterMessage(string.Concat(ItemData.GetAttrText(newMyth[i].kind), string.Get(71156), " ", math.abs(diff)));
      end
  
      if diff < 0 then
        ShowCenterMessage(string.Concat(ItemData.GetAttrText(newMyth[i].kind), string.Get(30035), " ", math.abs(diff)));
      end
    end
  elseif result == 2 then
    ShowCenterMessage(string.Get(23952));
  elseif result == 3 then
    ShowCenterMessage(string.Get(23686));
  elseif result == 4 then
    ShowCenterMessage(string.Get(23953));
  elseif result == 255 then
    ShowCenterMessage(string.Get(71336));
  else
    this.StartMixEffect(ECompoundEffect.Fail, nil);
    ShowCenterMessage(string.Concat(string.Get(80012), " ", result))
  end
end

--[[
S:108-003<神話裝重裝> +結果(1)成功
--]]
function UIGodskin.RecRemakeResult(data)
  local result = data:ReadByte();
  
  if result == 1 then
    ShowCenterMessage(string.Get(23955));
    local bagIndex = data:ReadUInt16();
    
    this.StartMixEffect(ECompoundEffect.Compound, bagIndex);
    
    local newMyth = {};
    for i = 1, 4 do
      newMyth[i] = {}; --神話屬性格式
      newMyth[i].kind = data:ReadByte(); --神話種類
      newMyth[i].value = data:ReadUInt16(); --神話數值
      newMyth[i].extra = data:ReadUInt16(); --神話符文加值
    end
  elseif result == 0 then
    ShowCenterMessage(string.Get(23954));
  elseif result == 2 then
    ShowCenterMessage(string.Get(23659));
  elseif result == 3 then
    ShowCenterMessage(string.Get(23686));
  elseif result == 255 then
    ShowCenterMessage(string.Get(71336));
  else
    ShowCenterMessage(string.Concat(string.Get(80012), " ", result))
  end
end

function UIGodskin.OnClick_Tag(mainTag, subTag)
  currentTag = mainTag;

  UI.Close(UIBag);
  UIBag.SkidBlink();
  this.ClearData(true);

  return true;
end

function UIGodskin.OnClick_Help(checkShow)
  if checkShow ~= true then
    if currentTag == UIGodskinTag.Upgrade then
      UI.Open(UITutorialHint, 64, this);
    elseif currentTag == UIGodskinTag.Enchant then
      UI.Open(UITutorialHint, 65, this);
    elseif currentTag == UIGodskinTag.Remake then
      UI.Open(UITutorialHint, 66, this);
    end
  end

  return true;
end

function UIGodskin.OnClick_Cancel()
  this.ClearData(true);
end

function UIGodskin.OnClick_Submit(uiEvent)
  --檢查場景
  if SceneManager.sceneId == 10701 then
    ShowCenterMessage(string.Get(40097));
    return;
  end
  
  local itemSave;
  if compoundInfos[1] == nil then return end
  
  itemSave = Item.GetBagItem(EThings.Bag, compoundInfos[1].bagIndex);
  if currentTag == UIGodskinTag.Upgrade then
    if compoundInfos[1] == nil then
      ShowCenterMessage(string.Get(23670));
      return;
    end
  
    local itemData = itemDatas[itemSave.Id];
    local mythLv = itemSave.mythLv + 1;
    local startLv = itemData.threshold;
    local upgradeData = SacredEquipUpgradeDatas[mythLv];
    if mythLv > 15 then
      ShowCenterMessage(string.Get(20582));
      return;
    end
  
    if upgradeData ~= nil then
      if upgradeData.kind == ECurrency.TS then
        if Role.GetPlayerCurrency(ECurrency.TS) < upgradeData.spend[startLv] then
          ShowCenterMessage(string.Get(23686)); --吞食幣不足
          return;
        end
      elseif upgradeData.kind == ECurrency.Money then
        if Role.GetPlayerGold() < upgradeData.spend[startLv] then
          ShowCenterMessage(string.Get(40077)); --金幣不足
          return;
        end
      end
    end
    
    this.StopMixEffect();
    
    --C:108-001 <神話裝升級> 背包索引(2) +背包索引(2)
    sendBuffer:Clear();
    sendBuffer:WriteUInt16(compoundInfos[1].bagIndex);
    if compoundInfos[3] ~= nil then
      sendBuffer:WriteUInt16(compoundInfos[3].bagIndex);
    else
      sendBuffer:WriteUInt16(0);
    end
    Network.Send(108, 1, sendBuffer);
    
  elseif currentTag == UIGodskinTag.Enchant then
  --C:108-002 <神話裝裝符文> 背包索引(2) + 背包索引(2)
    if compoundInfos[1] == nil then
      ShowCenterMessage(string.Get(23670));
      return;
    end
  
    if compoundInfos[2] == nil then
      ShowCenterMessage(string.Get(23671));
      return;
    end
  
    this.StopMixEffect();
    
    lastMyth = itemSave.myth;
    
    sendBuffer:Clear();
    sendBuffer:WriteUInt16(compoundInfos[1].bagIndex);
    sendBuffer:WriteUInt16(compoundInfos[2].bagIndex);
    Network.Send(108, 2, sendBuffer);
  elseif currentTag == UIGodskinTag.Remake then
    if compoundInfos[1] == nil then
      ShowCenterMessage(string.Get(23670));
      return;
    end
  
    if compoundInfos[2] == nil then
      ShowCenterMessage(string.Get(23954));
      return;
    end
  
    if compoundInfos[3] ~= nil and Role.GetPlayerCurrency(ECurrency.TS) < compoundInfos[3].quant then
      ShowCenterMessage(string.Get(23686));
      return;
    end
  
    this.StopMixEffect();

    --C:108-003 <神話裝重置> 背包索引(2) + 背包索引(2)
    sendBuffer:Clear();
    sendBuffer:WriteUInt16(compoundInfos[1].bagIndex);
    sendBuffer:WriteUInt16(compoundInfos[2].bagIndex);
    Network.Send(108, 3, sendBuffer);
  end
end