EBank = {
  Take = 1,
  Save = 2,
}

EBankOpenKind = {
  Npc = 1,
  Item = 2,
}

EUIBankTag = {
  Bank = 1,
  Storage = 2,
}

UIBank = {}
local this = UIBank;

this.name = "UIBank";
this.uiController = nil;
local transform_FrameRect;
local text_ItemSpace;
local text_StorageSpace;
local scrollContent_Item;
local scrollItems_Item = {};
local scrollContent_Storage;
local scrollItems_Storage = {};
local imageCategory = {};
local tagDatas = {};
local gameObject_Bank;
local gameObject_Storage;

--var
local isInitialize = false;
local currentCategory;
local openKind;
local currentTag = EUIBankTag.Bank;

function UIBank.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;
  this.uiController.onClose = this.OnClose;

  tagDatas[1] = { string.Get(10070), nil};
  tagDatas[2] = { string.Get(22855), nil};

  transform_FrameRect = uiController:FindGameObject("FrameRect"):GetComponent("RectTransform");
  text_ItemSpace = uiController:FindText("Text_ItemSpace");
  text_StorageSpace = uiController:FindText("Text_StorageSpace");

  scrollContent_Item = uiController:FindScrollContent("ScrollContent_Collection");
  scrollContent_Item.onInitialize = this.OnInitialize_ScrollContent_Item;
  scrollContent_Item.onItemChange = this.OnItemChange_ScrollContent_Item;
  scrollContent_Item:Initialize(1);

  scrollContent_Storage = uiController:FindScrollContent("ScrollContent_Storage");
  scrollContent_Storage.onInitialize = this.OnInitialize_ScrollContent_Storage;
  scrollContent_Storage.onItemChange = this.OnItemChange_ScrollContent_Storage;
  scrollContent_Storage:Initialize(1);

  local tempEvent;
  tempEvent = uiController:FindEvent("Image_All");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Category);
  tempEvent.parameter = EThingsCategory.All;

  tempEvent = uiController:FindEvent("Image_Equipment");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Category);
  tempEvent.parameter = EThingsCategory.Equip;

  tempEvent = uiController:FindEvent("Image_Props");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Category);
  tempEvent.parameter = EThingsCategory.Props;

  tempEvent = uiController:FindEvent("Image_Material");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Category);
  tempEvent.parameter = EThingsCategory.Material;

  isInitialize = true;

  imageCategory[EThingsCategory.All] = uiController:FindImage("Image_All");
  imageCategory[EThingsCategory.Equip] = uiController:FindImage("Image_Equipment");
  imageCategory[EThingsCategory.Props] = uiController:FindImage("Image_Props");
  imageCategory[EThingsCategory.Material] = uiController:FindImage("Image_Material");

  gameObject_Bank = uiController:FindGameObject("Bank");
  gameObject_Storage = uiController:FindGameObject("Storage");
end

function UIBank.OnOpen(kind)
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
  currentTag = EUIBankTag.Bank;

  currentCategory = EThingsCategory.All;

  openKind = kind;

  this.UpdateUI(true);

  return true;
end

function UIBank.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(10070), this.OnClick_Close, this.OnClick_Help, this.OnClick_Tag, tagDatas, currentTag, 1);
  end
end

function UIBank.OnClick_Help(checkShow)
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
  if currentTag == EUIBankTag.Storage then
    if checkShow ~= true then
      UI.Open(UITutorialHint, 49, this);
    end
  else
    return false;
  end

  return true;
end

function UIBank.OnClose()
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
  
  if openKind == EBankOpenKind.Npc then
    EventManager.SetConduct(true);
  end

  --C:030-008 <關閉錢莊>
  Network.Send(30, 8);

  UI.Close(UIBag);
end

function UIBank.OnClick_Tag(mainTag, subTag)
  currentTag = mainTag;

  UI.Close(UIBag);

  this.UpdateUI(true);

  return true;
end

function UIBank.UpdateUI(reset)
  if not isInitialize then return end

  gameObject_Bank:SetActive(currentTag == EUIBankTag.Bank);
  gameObject_Storage:SetActive(currentTag == EUIBankTag.Storage);

  this.UpdateBankUI(reset);
  this.UpdatStorage(reset);
end

function UIBank.UpdateBankUI(reset)
  if currentTag ~= EUIBankTag.Bank then return end

    UI.Open(UIBag,
      function(bagIndex, itemId)
        UI.Open(UIItemInfo, EThings.Bag, bagIndex, 0,
          string.Get(30023),
          function(bagKind, bagIndex, followIndex)
            local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);

            if itemSave == nil then return end
            if itemDatas[itemSave.Id] == nil then return end

            if bit.band(itemDatas[itemSave.Id].restrict, 32) == 32 then
              ShowCenterMessage(string.format(string.Get(30068), itemDatas[itemSave.Id]:GetName(true, true)));
              return;
            end
  
            if itemSave.delTime ~= nil and itemSave.delTime > 0 then
              ShowCenterMessage(string.Get(22872));
              return;
            end
            
            if itemSave.quant > 1 then
              ShowCountInput(string.Get(30023), 1, itemSave.quant,
                function(text)
                  if text == nil then return end

                  this.SendMsg(EBank.Save, itemSave.Id, bagIndex, tonumber(text));
                end
              );
            else
              this.SendMsg(EBank.Save, itemSave.Id, bagIndex, 1);
            end

            if UI.IsVisible(UIItemInfo) then
              UI.Close(UIItemInfo);
            end
          end
        );
      end,
      Vector2.New(185, -25),
      false
    );

  local bag = Item.GetBag(EThings.Bank);
  local bankOpenCount = Item.currentBThingGrid;
  local bankUseCount = 0;

  for i = 1, Item.MaxBThingGrid do
    if i <= bankOpenCount then
      if bag[i] ~= nil and itemDatas[bag[i].Id] ~= nil then
        bankUseCount = bankUseCount + 1;
      end
    end
  end

  text_ItemSpace.text = string.Concat(bankUseCount, "/", bankOpenCount);
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

  local showCount = math.min((math.ceil(Item.currentBThingGrid / 5) + 1) * 5, Item.MaxBThingGrid);
  if reset then
    scrollContent_Item:Reset(showCount);
  else
    scrollContent_Item:Refresh(showCount);
  end

  this.UpdateCategoryIcon();
end

function UIBank.UpdatStorage(reset)
  if currentTag ~= EUIBankTag.Storage then return end

  UI.Open(UIBag,
    function(bagIndex, itemId)
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, 0, string.Get(30023),
        function(bagKind, bagIndex, followIndex)
          local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
          local item = itemDatas[itemSave.Id];

          if itemSave == nil then return end
          if item == nil then return end

          if bit.band(item.restrict, 32) == 32 or Item.IsTypeOfEquips(item.fitType) then
            ShowCenterMessage(string.format(string.Get(22857), item:GetName(true, true)));
            return;
          end

          if itemSave.delTime ~= nil and itemSave.delTime > 0 then
            ShowCenterMessage(string.Get(22872));
            return;
          end

          if itemSave.quant > 1 then
            ShowCountInput(string.Get(30023), 1, itemSave.quant,
              function(text)
                if text == nil then return end

                this.SendMsg(EBank.Save, itemSave.Id, bagIndex, tonumber(text));
              end
            );
          else
            this.SendMsg(EBank.Save, itemSave.Id, bagIndex, 1);
          end

          if UI.IsVisible(UIItemInfo) then
            UI.Close(UIItemInfo);
          end
        end
      );
    end,
    Vector2.New(185, -25),
    false
  );

  local bag = Item.GetBag(EThings.Storage);
  local openCount = Item.currentStorageGrid;
  local useCount = 0;

  for i = 1, Item.MaxBThingGrid do
    if i <= openCount then
      if bag[i] ~= nil and itemDatas[bag[i].Id] ~= nil then
        useCount = useCount + 1;
      end
    end
  end

  text_StorageSpace.text = string.Concat(useCount, "/", openCount);

  local showCount = math.min((math.ceil(Item.currentStorageGrid / 5) + 1) * 5, Item.MaxStorageGrid);

  if reset then
    scrollContent_Storage:Reset(showCount);
  else
    scrollContent_Storage:Refresh(showCount);
  end

  this.UpdateCategoryIcon();
end

function UIBank.OnClick_Close()
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
  UI.Close(UIBank);

  return true;
end

function UIBank.OnClick_Item(uiEvent)
  local bagKind;

  if currentTag == EUIBankTag.Bank then
    bagKind = EThings.BankCategory;
  elseif currentTag == EUIBankTag.Storage then
    bagKind = EThings.StorageCategory;
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

  local categoryItem = Item.GetBag(bagKind)[uiEvent.parameter];
  if categoryItem == nil then return end

  local bankIndex = categoryItem.bagIndex;

  UI.Open(UIItemInfo, bagKind, uiEvent.parameter, 0,
    string.Get(30022),
    function(bagKind, bagIndex, followIndex)
      local itemSave = Item.GetBagItem(bagKind, bagIndex);

      if itemSave == nil then return end
      if itemDatas[itemSave.Id] == nil then return end

      if itemSave.quant > 1 then
        ShowCountInput(string.Get(30022), 1, itemSave.quant,
          function(text)
            if text == nil then return end

            this.SendMsg(EBank.Take, itemSave.Id, bankIndex, tonumber(text));
          end
        );
      else
        this.SendMsg(EBank.Take, itemSave.Id, bankIndex, 1);
      end

      if UI.IsVisible(UIItemInfo) then
        UI.Close(UIItemInfo);
      end
    end
  );
end

function UIBank.OnClick_Unlock()
  if currentTag == EUIBankTag.Bank then
    UISell.Launch(1);
  elseif currentTag == EUIBankTag.Storage then
    UISell.Launch(56);
  end
end

function UIBank.OnInitialize_ScrollContent_Item(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Item[itemIndex] = UIItemController.New(scrollItems[itemIndex]);
  end
end

function UIBank.OnItemChange_ScrollContent_Item(dataIndex, itemIndex)
  local bankIndex = dataIndex + 1;
  local itemSave = Item.GetBankByCategory(EThings.Bank, currentCategory)[bankIndex];

  if itemSave ~= nil and itemDatas[itemSave.Id] ~= nil then
    scrollItems_Item[itemIndex]:SetItem(itemSave.Id, itemSave.quant, itemSave);
    scrollItems_Item[itemIndex]:SetEvent(this.OnClick_Item, bankIndex);
    scrollItems_Item[itemIndex]:SetRedDot(itemSave.redDot);
  else
    scrollItems_Item[itemIndex]:SetItem(0);
    scrollItems_Item[itemIndex]:SetEvent(this.OnClick_Item);
    scrollItems_Item[itemIndex]:SetRedDot(false);
    
    if bankIndex > Item.currentBThingGrid then
      scrollItems_Item[itemIndex]:SetEvent(this.OnClick_Unlock);
      scrollItems_Item[itemIndex]:SetLock(true);
    else
      scrollItems_Item[itemIndex]:SetEvent(this.OnClick_Item);
      scrollItems_Item[itemIndex]:SetLock(false);
    end
  end
  
  return true;
end

function UIBank.OnInitialize_ScrollContent_Storage(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Storage[itemIndex] = UIItemController.New(scrollItems[itemIndex]);
  end
end

function UIBank.OnItemChange_ScrollContent_Storage(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local itemSave = Item.GetBankByCategory(EThings.Storage, currentCategory)[index];

  if itemSave ~= nil and itemDatas[itemSave.Id] ~= nil then
    scrollItems_Storage[itemIndex]:SetItem(itemSave.Id, itemSave.quant, itemSave);
    scrollItems_Storage[itemIndex]:SetEvent(this.OnClick_Item, index);
    scrollItems_Storage[itemIndex]:SetRedDot(itemSave.redDot);
  else
    scrollItems_Storage[itemIndex]:SetItem(0);
    scrollItems_Storage[itemIndex]:SetEvent(this.OnClick_Item);
    scrollItems_Storage[itemIndex]:SetRedDot(false);

    if index > Item.currentStorageGrid then
      scrollItems_Storage[itemIndex]:SetEvent(this.OnClick_Unlock);
      scrollItems_Storage[itemIndex]:SetLock(true);
    else
      scrollItems_Storage[itemIndex]:SetEvent(this.OnClick_Item);
      scrollItems_Storage[itemIndex]:SetLock(false);
    end
  end

  return true;
end

function UIBank.UpdateCategoryIcon()
  imageCategory[EThingsCategory.All].sprite = UI.GetSprite("but061D");
  imageCategory[EThingsCategory.Equip].sprite = UI.GetSprite("but060D");
  imageCategory[EThingsCategory.Props].sprite = UI.GetSprite("but059D");
  imageCategory[EThingsCategory.Material].sprite = UI.GetSprite("but058D");

  if currentCategory == EThingsCategory.All then
    imageCategory[currentCategory].sprite = UI.GetSprite("but061L");
  elseif currentCategory == EThingsCategory.Equip then
    imageCategory[currentCategory].sprite = UI.GetSprite("but060L");
  elseif currentCategory == EThingsCategory.Props then
    imageCategory[currentCategory].sprite = UI.GetSprite("but059L");
  elseif currentCategory == EThingsCategory.Material then
    imageCategory[currentCategory].sprite = UI.GetSprite("but058L");
  end
end

function UIBank.OnClick_Category(uiEvent)
  local index = uiEvent.parameter;

  if currentCategory == index then return end

  currentCategory = index;
  
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

  this.UpdateUI(true);
end

function UIBank.SendMsg(kind, itemId, bagIndex, quant)
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end

  local mainKind, fullMsg, bagKind;
  if currentTag == EUIBankTag.Bank then
    mainKind = 30;
    fullMsg = string.Get(30045);  --錢莊已滿
    bagKind = EThings.Bank;
  elseif currentTag == EUIBankTag.Storage then
    mainKind = 102;
    fullMsg = string.Get(22856);  --寶庫已滿
    bagKind = EThings.Storage;
  end

  if kind == EBank.Save then
    if bit.band(itemDatas[itemId].restrict, 32) == 32 then
      ShowCenterMessage(string.format(string.Get(30068), itemDatas[itemId]:GetName(true, true)));
      return;
    end

    local bankCount = Item.GetBagLeftCount(bagKind);

    if bankCount <= 0 then
      if Item.IsTypeOfEquips(itemDatas[itemId].fitType) then
        ShowCenterMessage(fullMsg);
        return;
      else
        local count = 0;
        local banks = Item.GetBag(bagKind, 0);

        for k, v in pairs(banks) do
          if v.Id == itemId and v.quant < Item.MaxThingGridQuant then
            count = count + (Item.MaxThingGridQuant - v.quant);
          end
        end

        if quant > count then
          ShowCenterMessage(fullMsg);
          return;
        end
      end
    end
  end

  --C:030-001 <錢莊領物品> +索引(1) +數量(4)
  --C:030-002 <錢莊存物品> +索引(2) +數量(4)
  --C:102-001 <寶庫領物品> +索引(1) +數量(4)
  --C:102-002 <寶庫存物品> +索引(2) +數量(4)
  sendBuffer:Clear();
  if kind == EBank.Save or currentTag == EUIBankTag.Bank then
    sendBuffer:WriteUInt16(bagIndex);
  elseif kind == EBank.Take then
    sendBuffer:WriteByte(bagIndex);
  else
    return
  end
  sendBuffer:WriteInt32(quant);
  Network.Send(mainKind, kind, sendBuffer);
end