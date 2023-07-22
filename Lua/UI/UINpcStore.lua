ENpcStore = {
  Event = 1, --事件
  Portable = 2, --隨身雜貨商
}

UINpcStore = {}
local this = UINpcStore;
this.name = "UINpcStore";
this.uiController = nil;
local transform_FrameRect;
local text_SellList;
local text_Total;
local gameObject_Setting;
local image_SelectAll;
local scrollContent_Sell;
local scrollContent_SettingItem;
local scrollContent_SettingEquip;
local scrollItems_Sell = {};
local scrollItems_SettingItem = {};
local scrollItems_SettingEquip = {};
local sell = {};
local lock = false;
local selectAll = false;
local storeKind = ENpcStore.Event;
local orderlayer = 10;
local itemString = {22264, 20468, 22265, 20605, 22266};
local equipString = {80377, 80376, 30010, 80378, 80379};

function UINpcStore.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onVisible = this.OnVisible;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;

  gameObject_Setting = uiController:FindGameObject("GameObject_Setting");
  image_SelectAll = uiController:FindImage("Image_SelectAll");

  text_SellList = uiController:FindText("Text_SellList");
  text_Total = uiController:FindText("Text_Total");

  local event = uiController:FindEvent("Image_Sell");
  event:SetListener(EventTriggerType.PointerClick, this.OnClick_Sell);

  event = uiController:FindEvent("Image_Setting");
  event:SetListener(EventTriggerType.PointerClick, this.OnClick_Setting);

  event = uiController:FindEvent("Image_Mask_Setting");
  event:SetListener(EventTriggerType.PointerClick, this.OnClick_MaskSetting);

  event = uiController:FindEvent("Image_SelectAll");
  event:SetListener(EventTriggerType.PointerClick, this.OnClick_SelectAll);

  event = uiController:FindEvent("Image_QuickSelect");
  event:SetListener(EventTriggerType.PointerClick, this.OnClick_QuickSelect);

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;
  scrollContent_Sell = uiController:FindScrollContent("ScrollContent_Sell");
  scrollContent_Sell.onInitialize = this.OnInitialize_scrollContent_Sell;
  scrollContent_Sell.onItemChange = this.OnItemChange_scrollContent_Sell;
  scrollContent_Sell:Initialize(1);

  scrollContent_SettingItem = uiController:FindScrollContent("ScrollContent_Item");
  scrollContent_SettingItem.onInitialize = this.OnInitialize_scrollContent_SettingItem;
  scrollContent_SettingItem.onItemChange = this.OnItemChange_scrollContent_SettingItem;
  scrollContent_SettingItem:Initialize(1);

  scrollContent_SettingEquip = uiController:FindScrollContent("ScrollContent_Equip");
  scrollContent_SettingEquip.onInitialize = this.OnInitialize_scrollContent_SettingEquip;
  scrollContent_SettingEquip.onItemChange = this.OnItemChange_scrollContent_SettingEquip;
  scrollContent_SettingEquip:Initialize(1);
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
end

function UINpcStore.OnOpen(kind)
  storeKind = kind;
  local itemSave;
  local tmpSave;

  Item.ClearBag(EThings.NpcStore, 0);

  for i = 1, Item.MaxThingGrid do
    itemSave = Item.GetBagItem(EThings.Bag, i);

    if itemSave ~= nil then
      tmpSave = ThingData.Copy(itemSave);

      Item.SetBagItem(EThings.NpcStore, i, tmpSave, false);
    end
  end

  gameObject_Setting:SetActive(false);
  image_SelectAll.sprite = UI.GetCheckBoxSprite(selectAll);
  
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------

  return true;
end

function UINpcStore.OnInitialize_scrollContent_Sell(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Sell[itemIndex] = {};
    scrollItems_Sell[itemIndex].text = scrollItems[itemIndex]:Find("Text_Info"):GetComponent("UIText");
    scrollItems_Sell[itemIndex].item = UIItemController.New(scrollItems[itemIndex]:Find("Image_Item"), this.OnClick_Item);
    scrollItems_Sell[itemIndex].event = scrollItems[itemIndex]:Find("Image_Btn"):GetComponent("UIEvent");
    scrollItems_Sell[itemIndex].event:SetListener(EventTriggerType.PointerClick, this.OnClick_Remove);
    scrollItems_Sell[itemIndex].event.parameter = itemIndex + 1;
  end
end

function UINpcStore.OnItemChange_scrollContent_Sell(dataIndex, itemIndex)
  local index = dataIndex + 1;

  scrollItems_Sell[itemIndex].text.text = string.Concat(sell[index].name, "\n", tostring(sell[index].sellPrice * sell[index].quant));
  scrollItems_Sell[itemIndex].item:SetItem(sell[index].itemSave.Id, sell[index].quant, sell[index].itemSave);
  scrollItems_Sell[itemIndex].item:SetEvent(this.OnClick_Item, index)
  scrollItems_Sell[itemIndex].event.parameter = index;

  return true;
end

function UINpcStore.OnInitialize_scrollContent_SettingItem(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_SettingItem[itemIndex] = {};
    scrollItems_SettingItem[itemIndex].text = scrollItems[itemIndex]:Find("Text_Item"):GetComponent("Text");
    scrollItems_SettingItem[itemIndex].sprite = scrollItems[itemIndex]:Find("Text_Item"):Find("Image_CheckBox"):GetComponent("Image");
    scrollItems_SettingItem[itemIndex].event = scrollItems[itemIndex]:Find("Text_Item"):Find("Image_CheckBox"):GetComponent("UIEvent");
    scrollItems_SettingItem[itemIndex].event:SetListener(EventTriggerType.PointerClick, this.OnClick_CheckBoxItem);
  end
end

function UINpcStore.OnItemChange_scrollContent_SettingItem(dataIndex, itemIndex)
  local index = dataIndex + 1;

  if NpcStore.client.item[index] ~= nil then
    scrollItems_SettingItem[itemIndex].text.text = string.Get(itemString[index]);
    scrollItems_SettingItem[itemIndex].sprite.sprite = UI.GetCheckBoxSprite(NpcStore.client.item[index]);
    scrollItems_SettingItem[itemIndex].event.parameter = index;
  end

  return true;
end

function UINpcStore.OnInitialize_scrollContent_SettingEquip(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_SettingEquip[itemIndex] = {};
    scrollItems_SettingEquip[itemIndex].text = scrollItems[itemIndex]:Find("Text_Item"):GetComponent("Text");
    scrollItems_SettingEquip[itemIndex].quality = {};
    for i = 1, 3 do
      scrollItems_SettingEquip[itemIndex].quality[i] = {};
      scrollItems_SettingEquip[itemIndex].quality[i].sprite = scrollItems[itemIndex]:Find("Text_Item"):Find(string.Concat("Image_CheckBox (", i, ")")):GetComponent("Image");
      scrollItems_SettingEquip[itemIndex].quality[i].event = scrollItems[itemIndex]:Find("Text_Item"):Find(string.Concat("Image_CheckBox (", i, ")")):GetComponent("UIEvent");
      scrollItems_SettingEquip[itemIndex].quality[i].event:SetListener(EventTriggerType.PointerClick, this.OnClick_CheckBoxEquip);
    end
  end
end

function UINpcStore.OnItemChange_scrollContent_SettingEquip(dataIndex, itemIndex)
  local index = dataIndex + 1;

  if NpcStore.client.equip[index] ~= nil then
    scrollItems_SettingEquip[itemIndex].text.text = string.Get(equipString[index]);

    for i = 1, 3 do
      scrollItems_SettingEquip[itemIndex].quality[i].sprite.sprite = UI.GetCheckBoxSprite(NpcStore.client.equip[index].check[i]);
      scrollItems_SettingEquip[itemIndex].quality[i].event.parameter = index * 10 + i;
    end
  end

  return true;
end

function UINpcStore.OnClick_Item(uiEvent)
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if sell[uiEvent.parameter] ~= nil then
    UIItemInfo.Show(sell[uiEvent.parameter].itemSave.Id, 0);
  end
end

function UINpcStore.UpdateUI(reset)
  scrollContent_SettingItem:Refresh(table.maxn(NpcStore.client.item));
  scrollContent_SettingEquip:Refresh(table.maxn(NpcStore.client.equip));

  if sell ~= nil then
    if reset then
      scrollContent_Sell:Reset(table.maxn(sell));
    else
      scrollContent_Sell:Refresh(table.maxn(sell));
    end
  end

  text_SellList.text = string.format(string.Get(20496), table.Count(sell));

  local total = 0;
  for k, v in pairs(sell) do
    total = total + (sell[k].sellPrice * sell[k].quant);
  end

  text_Total.text = total;

  UI.Open(UIBag,
    function(bagIndex, itemId)
      local itemSave = Item.GetBagItem(EThings.NpcStore, bagIndex, 0);
      if itemSave == nil then return end
      if Item.IsLock(itemSave) then return end

      local currentSell = {};
      currentSell[bagIndex] = {};
      currentSell[bagIndex].itemSave = itemSave;
      currentSell[bagIndex].name = itemDatas[itemId]:GetName(true);
      currentSell[bagIndex].sellPrice = itemDatas[itemId].sellPrice;
      currentSell[bagIndex].orgQuant = itemSave.quant;

      if itemSave.quant > 1 then
        ShowCountInput(string.Get(20497), 1, itemSave.quant,
          function(text)
            if text == nil then return end
            if tonumber(text) == 0 then return end

            currentSell[bagIndex].quant = tonumber(text);

            local index = this.ContentBagIndex(bagIndex);
            if index > 0 then
              sell[index].quant = sell[index].quant + currentSell[bagIndex].quant;
            else
              table.insert(sell, currentSell[bagIndex]);
            end

            if currentSell[bagIndex].quant >= itemSave.quant then
              Item.DelBagItem(EThings.NpcStore, bagIndex, currentSell[bagIndex].quant, 0, false);
            else
              itemSave.quant = itemSave.quant - currentSell[bagIndex].quant;
              Item.SetBagItem(EThings.NpcStore, bagIndex, itemSave);
            end

            this.UpdateUI();
            UIBag.UpdateUI();
          end
        );
      else
        currentSell[bagIndex].quant = 1;

        if Item.IsTypeOfEquips(itemDatas[itemSave.Id].fitType) then
          table.insert(sell, currentSell[bagIndex]);
        else
          local index = this.ContentBagIndex(bagIndex);
          if index > 0 then
            sell[index].quant = sell[index].quant + 1;
          else
            table.insert(sell, currentSell[bagIndex]);
          end
        end

        Item.DelBagItem(EThings.NpcStore, bagIndex, 1, 0, false);

        this.UpdateUI();
        UIBag.UpdateUI();
      end
    end,
    Vector2.New(200, -25),
    false,
    nil,
    function(itemSave)
      if itemDatas[itemSave.Id] == nil then return false end
      if itemSave.isVender then return false end
      if itemSave.isDeliver then return false end
      if itemDatas[itemSave.Id].sellPrice <= 0 then return false end
      if bit.band(itemDatas[itemSave.Id].restrict, 16) == 16 then return false end
      return true;
    end,
    true,
    false,
    EThings.NpcStore
  );
end

function UINpcStore.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(20495), this.OnClick_Close);

    this.UpdateUI(true);
  end
end

function UINpcStore.ContentBagIndex(bagIndex)
  local index = 0;

  for k, v in pairs(sell) do
    if sell[k].itemSave.bagIndex == bagIndex then
      index = k;
      break;
    end
  end

  return index;
end

function UINpcStore.OnClose()
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if UI.IsVisible(UIAlert) then
    UI.Close(UIAlert);
  end
  
  UI.Close(UIBag);

  this.ClearSell();

  EventManager.SetConduct(true);
end

function UINpcStore.OnClick_Close()
  UI.Close(UINpcStore);

  return true;
end

function UINpcStore.OnClick_Remove(uiEvent)
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if lock then return end

  local index = uiEvent.parameter;

  if sell == nil then return end

  this.UpdateBagItem(sell[index].itemSave, sell[index].quant);

  table.remove(sell, index);

  this.UpdateUI();
  UIBag.UpdateUI();
end

function UINpcStore.UpdateBagItem(itemSave, quant)
  itemSave.quant = itemSave.quant + quant;
  Item.SetBagItem(EThings.NpcStore, itemSave.bagIndex, itemSave);
end

function UINpcStore.OnClick_Sell()
  --檢查是否戰鬥中
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end

  if table.Count(sell) <= 0 then return end

  lock = true;

  --C:027-002 <賣東西> +len(1) +<<背包索引(2) +數量(4)>>
  --C:027-003 <賣東西隨身雜貨商> +len(1) +<<背包索引(2) +數量(4)>>
  sendBuffer:Clear();
  sendBuffer:WriteByte(table.Count(sell));
  for k, v in pairs(sell) do
    sendBuffer:WriteUInt16(sell[k].itemSave.bagIndex);
    sendBuffer:WriteInt32(sell[k].quant);
  end

  if storeKind == ENpcStore.Event then
    Network.Send(27, 2, sendBuffer);
  elseif storeKind == ENpcStore.Portable then
    Network.Send(27, 3, sendBuffer);
  end
end

function UINpcStore.OnClick_Setting()
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  gameObject_Setting:SetActive(true);
  this.uiController.canvas.sortingOrder = this.uiController.canvas.sortingOrder + orderlayer;
end

function UINpcStore.OnClick_MaskSetting()
  gameObject_Setting:SetActive(false);
  this.uiController.canvas.sortingOrder = this.uiController.canvas.sortingOrder - orderlayer;
  NpcStore.Save();
end

function UINpcStore.OnClick_SelectAll()
  selectAll = not selectAll;
  image_SelectAll.sprite = UI.GetCheckBoxSprite(selectAll);

  for k, v in pairs(ENpcStoreItem) do
    NpcStore.client.item[v] = selectAll;
    scrollItems_SettingItem[v - 1].sprite.sprite = UI.GetCheckBoxSprite(selectAll);
  end

  for k, v in pairs(ENpcStoreEquip) do
    for i = 1, 3 do
      NpcStore.client.equip[v].check[i] = selectAll;
      scrollItems_SettingEquip[v - 1].quality[i].sprite.sprite = UI.GetCheckBoxSprite(selectAll);
    end
  end

end

function UINpcStore.OnClick_QuickSelect()
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  local bag = Item.GetBag(EThings.NpcStore);
  local quickSelect = {};

  for k, v in pairs(bag) do
    local itemData = itemDatas[v.Id];

    if itemData.sellPrice > 0 and bit.band(itemData.restrict, 16) ~= 16 then
      --裝備類
      if not v.isLock then
        for kk, fitType in pairs(ENpcStoreEquip) do
          if itemData.fitType == fitType then
            for i = 1, 3 do
              if NpcStore.client.equip[fitType].check[i] and itemData.quality == i - 1 then
                quickSelect = {};
                quickSelect.itemSave = v;
                quickSelect.name = itemData:GetName(true);
                quickSelect.sellPrice = itemData.sellPrice;
                quickSelect.orgQuant = v.quant;
                quickSelect.quant = v.quant;
                table.insert(sell, quickSelect);
                Item.DelBagItem(EThings.NpcStore, v.bagIndex, 1, 0, false);
              end
            end
          end
        end
      end

      --補品
      if NpcStore.client.item[ENpcStoreItem.Tonic] then
        if Contains(itemData.kind, EItemKind.Item_17, EItemKind.Item_18) then
          quickSelect = {};
          quickSelect.itemSave = v;
          quickSelect.name = itemData:GetName(true);
          quickSelect.sellPrice = itemData.sellPrice;
          quickSelect.orgQuant = v.quant;
          quickSelect.quant = v.quant;
          table.insert(sell, quickSelect);
          Item.DelBagItem(EThings.NpcStore, v.bagIndex, v.quant, 0, false);
        end
      end

      --雜物
      if NpcStore.client.item[ENpcStoreItem.Sundries] then
        if Contains(itemData.kind, EItemKind.Item_23) then
          quickSelect = {};
          quickSelect.itemSave = v;
          quickSelect.name = itemData:GetName(true);
          quickSelect.sellPrice = itemData.sellPrice;
          quickSelect.orgQuant = v.quant;
          quickSelect.quant = v.quant;
          table.insert(sell, quickSelect);
          Item.DelBagItem(EThings.NpcStore, v.bagIndex, v.quant, 0, false);
        end
      end

      --材料
      if NpcStore.client.item[ENpcStoreItem.Material] then
        if Contains(itemData.kind, EItemKind.Item_24, EItemKind.Item_25, EItemKind.Item_26, EItemKind.Item_27,
                EItemKind.Item_28, EItemKind.Item_29, EItemKind.Item_30, EItemKind.Item_31, EItemKind.Item_32,
                EItemKind.Item_33, EItemKind.Item_34, EItemKind.Item_35, EItemKind.Item_40, EItemKind.Item_41,
                EItemKind.Item_42, EItemKind.Item_43, EItemKind.Item_44, EItemKind.Item_45, EItemKind.Item_46) then
          quickSelect = {};
          quickSelect.itemSave = v;
          quickSelect.name = itemData:GetName(true);
          quickSelect.sellPrice = itemData.sellPrice;
          quickSelect.orgQuant = v.quant;
          quickSelect.quant = v.quant;
          table.insert(sell, quickSelect);
          Item.DelBagItem(EThings.NpcStore, v.bagIndex, v.quant, 0, false);
        end
      end

      --晶石
      if NpcStore.client.item[ENpcStoreItem.Spar] then
        if Contains(itemData.specialAbility, EItemUseKind.MachineBoxStone) then
          quickSelect = {};
          quickSelect.itemSave = v;
          quickSelect.name = itemData:GetName(true);
          quickSelect.sellPrice = itemData.sellPrice;
          quickSelect.orgQuant = v.quant;
          quickSelect.quant = v.quant;
          table.insert(sell, quickSelect);
          Item.DelBagItem(EThings.NpcStore, v.bagIndex, v.quant, 0, false);
        end
      end

      --福袋
      if NpcStore.client.item[ENpcStoreItem.LuckyBag] then
        if Contains(itemData.specialAbility, EItemUseKind.ItemUse_48) then
          quickSelect = {};
          quickSelect.itemSave = v;
          quickSelect.name = itemData:GetName(true);
          quickSelect.sellPrice = itemData.sellPrice;
          quickSelect.orgQuant = v.quant;
          quickSelect.quant = v.quant;
          table.insert(sell, quickSelect);
          Item.DelBagItem(EThings.NpcStore, v.bagIndex, v.quant, 0, false);
        end
      end
    end
  end

  this.UpdateUI();
  UIBag.UpdateUI();
end

function UINpcStore.OnClick_CheckBoxItem(uiEvent)
  local index = uiEvent.parameter;
  
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------

  NpcStore.client.item[index] = not NpcStore.client.item[index];
  scrollItems_SettingItem[index - 1].sprite.sprite = UI.GetCheckBoxSprite(NpcStore.client.item[index]);

  if not NpcStore.client.item[index] then
    image_SelectAll.sprite = UI.GetCheckBoxSprite(false);
  end
end

function UINpcStore.OnClick_CheckBoxEquip(uiEvent)
  local index = math.floor(uiEvent.parameter / 10);
  local checkIdx = math.fmod(uiEvent.parameter, 10);

  NpcStore.client.equip[index].check[checkIdx] = not NpcStore.client.equip[index].check[checkIdx];
  scrollItems_SettingEquip[index - 1].quality[checkIdx].sprite.sprite = UI.GetCheckBoxSprite(NpcStore.client.equip[index].check[checkIdx]);

  NpcStore.client.equip[index].check[checkIdx] = NpcStore.client.equip[index].check[checkIdx];

  if not NpcStore.client.equip[index].check[checkIdx] then
    image_SelectAll.sprite = UI.GetCheckBoxSprite(false);
  end
end

function UINpcStore.ClearSell(refresh)
  for k, v in pairs(sell) do
    this.UpdateBagItem(sell[k].itemSave, sell[k].quant);
  end

  table.Clear(sell);

  if refresh then
    this.UpdateUI();
  end
end

function UINpcStore.UpdateBagItemByRecive(itemSave, quant, orgQuant)
  local bagIndex = itemSave.bagIndex;
  local bagItem = Item.GetBagItem(EThings.NpcStore, bagIndex);

  if bagItem ~= nil then
    bagItem.quant = bagItem.quant + quant;
    Item.SetBagItem(EThings.NpcStore, bagIndex, bagItem);
  else
    if not Item.IsTypeOfEquips(itemDatas[itemSave.Id].fitType) then
      itemSave.quant = orgQuant - quant;
      if itemSave.quant > 0 then
        Item.SetBagItem(EThings.NpcStore, bagIndex, itemSave);
      end
    end
  end
  
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
end

function UINpcStore.ReciveSellResult(result, bagIndex)
  lock = false;

  if result == 0 and bagIndex > 0 then --成功
    local index = UINpcStore.ContentBagIndex(bagIndex);

    this.UpdateBagItemByRecive(sell[index].itemSave, sell[index].quant, sell[index].orgQuant);

    table.remove(sell, index);
  end
end