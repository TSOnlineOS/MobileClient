EUIFurnaceTag = {
  Store = 1,
  GoldStore = 2,
  Dismantle = 3,
}

EUIStoreSubTag = {
  Npc = 1,
  Equip = 2,
  GoldNpc = 3,
  GoldEquip = 4,
  TurnItem = 5,
  GoldTurnItem = 6,
}

EFurnace = {
  Npc = 1,
  Equip = 2,
  ExclusiveWeapon = 3,
  Godskin = 4,
}

local ESolt = {
  Npc = 1,
  Equip = 2,
  TurnItem = 3,
}

local ESelect = {
  Npc = 1,
  Equip = 2,
  GoldNpc = 3,
  GoldEquip = 4,
  TurnItem = 5,
  GoldTurnItem = 6,
}

UIFurnace = {}
local this = UIFurnace;

this.name = "UIFurnace";
this.uiController = nil;

local transform_FrameRect;

local tagDatas = {};
local currentTag = EUIFurnaceTag.Store;
local currentSubPage = EUIStoreSubTag.Npc;
local currentDisTag = EFurnace.Npc;
local maxItem = 8;
local goldStoreRate = 2;
local scrollContent_Store;
local scrollItems_Store = {};
local scrollContent_Dismantle;
local scrollItems_Dismantle = {};
local scrollContent_Message;
local scrollItems_Message = {};
local gameObject_Store;
local gameObject_Dismantle;
local text_ChipStore;
local text_ChipsDismantle;
local text_BaseGet;
local imageFilter = {};
local imageMyChip;
local rawImageBg;

--var
local message = {};
local furnaces = {};
local shops = {};
local flags = {};
local baseRate = 1;
local activeRate = 1;
local currentSolt = ESolt.Npc;
local currentSelect = ESelect.Npc;

this.NpcItemId = 65411;
this.EquipItemId = 65412;

flags[EUIStoreSubTag.Npc] = {};
flags[EUIStoreSubTag.Npc][1] = 1518;
flags[EUIStoreSubTag.Npc][2] = 1519;
flags[EUIStoreSubTag.Npc][3] = 1520;
flags[EUIStoreSubTag.Npc][4] = 1521;
flags[EUIStoreSubTag.Npc][5] = 1522;
flags[EUIStoreSubTag.Npc][6] = 1523;
flags[EUIStoreSubTag.Npc][7] = 1524;
flags[EUIStoreSubTag.Npc][8] = 1525;

flags[EUIStoreSubTag.Equip] = {};
flags[EUIStoreSubTag.Equip][1] = 1526;
flags[EUIStoreSubTag.Equip][2] = 1527;
flags[EUIStoreSubTag.Equip][3] = 1528;
flags[EUIStoreSubTag.Equip][4] = 1529;
flags[EUIStoreSubTag.Equip][5] = 1530;
flags[EUIStoreSubTag.Equip][6] = 1531;
flags[EUIStoreSubTag.Equip][7] = 1532;
flags[EUIStoreSubTag.Equip][8] = 1533;

--flags[EUIStoreSubTag.Equip] = {};
--flags[EUIStoreSubTag.Equip][1] = 1526;
--flags[EUIStoreSubTag.Equip][2] = 1527;
--flags[EUIStoreSubTag.Equip][3] = 1528;
--flags[EUIStoreSubTag.Equip][4] = 1529;
--flags[EUIStoreSubTag.Equip][5] = 1530;
--flags[EUIStoreSubTag.Equip][6] = 1531;
--flags[EUIStoreSubTag.Equip][7] = 1532;
--flags[EUIStoreSubTag.Equip][8] = 1533;

flags[EUIStoreSubTag.GoldNpc] = {};
flags[EUIStoreSubTag.GoldNpc][1] = 7067;
flags[EUIStoreSubTag.GoldNpc][2] = 7068;
flags[EUIStoreSubTag.GoldNpc][3] = 7069;
flags[EUIStoreSubTag.GoldNpc][4] = 7070;
flags[EUIStoreSubTag.GoldNpc][5] = 7071;
flags[EUIStoreSubTag.GoldNpc][6] = 7072;
flags[EUIStoreSubTag.GoldNpc][7] = 7073;
flags[EUIStoreSubTag.GoldNpc][8] = 7074;

flags[EUIStoreSubTag.GoldEquip] = {};
flags[EUIStoreSubTag.GoldEquip][1] = 7075;
flags[EUIStoreSubTag.GoldEquip][2] = 7076;
flags[EUIStoreSubTag.GoldEquip][3] = 7077;
flags[EUIStoreSubTag.GoldEquip][4] = 7078;
flags[EUIStoreSubTag.GoldEquip][5] = 7079;
flags[EUIStoreSubTag.GoldEquip][6] = 7080;
flags[EUIStoreSubTag.GoldEquip][7] = 7081;
flags[EUIStoreSubTag.GoldEquip][8] = 7082;


--flags[EUIStoreSubTag.Equip] = {};
--flags[EUIStoreSubTag.Equip][1] = 1526;
--flags[EUIStoreSubTag.Equip][2] = 1527;
--flags[EUIStoreSubTag.Equip][3] = 1528;
--flags[EUIStoreSubTag.Equip][4] = 1529;
--flags[EUIStoreSubTag.Equip][5] = 1530;
--flags[EUIStoreSubTag.Equip][6] = 1531;
--flags[EUIStoreSubTag.Equip][7] = 1532;
--flags[EUIStoreSubTag.Equip][8] = 1533;

flags[EUIStoreSubTag.TurnItem] = {};
flags[EUIStoreSubTag.TurnItem][1] = 7257;
flags[EUIStoreSubTag.TurnItem][2] = 7258;
flags[EUIStoreSubTag.TurnItem][3] = 7259;
flags[EUIStoreSubTag.TurnItem][4] = 7260;
flags[EUIStoreSubTag.TurnItem][5] = 7261;
flags[EUIStoreSubTag.TurnItem][6] = 7262;
flags[EUIStoreSubTag.TurnItem][7] = 7263;
flags[EUIStoreSubTag.TurnItem][8] = 7264;

flags[EUIStoreSubTag.GoldTurnItem] = {};
flags[EUIStoreSubTag.GoldTurnItem][1] = 7265;
flags[EUIStoreSubTag.GoldTurnItem][2] = 7266;
flags[EUIStoreSubTag.GoldTurnItem][3] = 7267;
flags[EUIStoreSubTag.GoldTurnItem][4] = 7268;
flags[EUIStoreSubTag.GoldTurnItem][5] = 7269;
flags[EUIStoreSubTag.GoldTurnItem][6] = 7270;
flags[EUIStoreSubTag.GoldTurnItem][7] = 7271;
flags[EUIStoreSubTag.GoldTurnItem][8] = 7272;

shops[EUIStoreSubTag.Npc] = {};
shops[EUIStoreSubTag.Equip] = {};
shops[EUIStoreSubTag.GoldNpc] = {};
shops[EUIStoreSubTag.GoldEquip] = {};
shops[EUIStoreSubTag.TurnItem] = {};
shops[EUIStoreSubTag.GoldTurnItem] = {};

local furnacePros = {};
furnacePros[EUIStoreSubTag.Npc] = {};
furnacePros[EUIStoreSubTag.Equip] = {};
furnacePros[EUIStoreSubTag.GoldNpc] = {};
furnacePros[EUIStoreSubTag.GoldEquip] = {};
furnacePros[EUIStoreSubTag.TurnItem] = {};
furnacePros[EUIStoreSubTag.GoldTurnItem] = {};

function UIFurnace.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;
  gameObject_Store = uiController:FindGameObject("Store");
  gameObject_Dismantle = uiController:FindGameObject("Dismantle");

  text_ChipStore = uiController:FindText("Text_ChipsStore");
  text_ChipsDismantle = uiController:FindText("Text_ChipsDismantle");
  text_BaseGet = uiController:FindText("Text_BaseGet");
  rawImageBg = uiController:FindRawImage("Image_SellBG");

  local tempEvent;
  tempEvent = uiController:FindEvent("Image_Auto");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Auto);
  tempEvent = uiController:FindEvent("Image_Dismantle");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Dismantle);
  tempEvent = uiController:FindEvent("Image_Refresh");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Refresh);
  tempEvent = uiController:FindEvent("Image_Npc");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Filter);
  tempEvent.parameter = EFurnace.Npc;
  tempEvent = uiController:FindEvent("Image_Equip");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Filter);
  tempEvent.parameter = EFurnace.Equip;
  tempEvent = uiController:FindEvent("Image_SWeapon");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Filter);
  tempEvent.parameter = EFurnace.ExclusiveWeapon;
  tempEvent = uiController:FindEvent("Image_Godskin");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Filter);
  tempEvent.parameter = EFurnace.Godskin;
  tempEvent = uiController:FindEvent("Image_Pr");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ShowPro);

  imageFilter[EFurnace.Npc] = uiController:FindImage("Image_Npc");
  imageFilter[EFurnace.Equip] = uiController:FindImage("Image_Equip");
  imageFilter[EFurnace.ExclusiveWeapon] = uiController:FindImage("Image_SWeapon");
  imageFilter[EFurnace.Godskin] = uiController:FindImage("Image_Godskin");
  imageMyChip = uiController:FindImage("Image_MyChips");

  scrollContent_Store = uiController:FindScrollContent("ScrollContent_Store");
  scrollContent_Store.onInitialize = this.OnInitialize_scrollContent_Store;
  scrollContent_Store.onItemChange = this.OnItemChange_scrollContent_Store;
  scrollContent_Store:Initialize(1);

  scrollContent_Dismantle = uiController:FindScrollContent("ScrollContent_Dismantle");
  scrollContent_Dismantle.onInitialize = this.OnInitialize_scrollContent_Dismantle;
  scrollContent_Dismantle.onItemChange = this.OnItemChange_scrollContent_Dismantle;
  scrollContent_Dismantle:Initialize(1);

  scrollContent_Message = uiController:FindScrollContent("ScrollContent_Message");
  scrollContent_Message.onInitialize = this.OnInitialize_scrollContent_Message;
  scrollContent_Message.onItemChange = this.OnItemChange_scrollContent_Message;
  scrollContent_Message:Initialize(1);

  tagDatas[1] = {};
  tagDatas[1][1] = string.Get(98022);
  tagDatas[1][2] = {};
  tagDatas[1][2][1] = string.Get(98035);
  tagDatas[1][2][2] = string.Get(20165);
  tagDatas[1][2][3] = string.Get(22874);

  tagDatas[2] = {};
  tagDatas[2][1] = string.Get(21761);
  tagDatas[2][2] = {};
  tagDatas[2][2][1] = string.Get(98035);
  tagDatas[2][2][2] = string.Get(20165);
  tagDatas[2][2][3] = string.Get(22874);

  tagDatas[3] = {};
  tagDatas[3][1] = string.Get(21026);
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

function UIFurnace.OnInitialize_scrollContent_Store(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Store[itemIndex] = {};
    scrollItems_Store[itemIndex].item = {};
    scrollItems_Store[itemIndex].text = {};
    scrollItems_Store[itemIndex].price = {};
    scrollItems_Store[itemIndex].sprite = {};
    scrollItems_Store[itemIndex].event = {};

    for i = 1, maxItem do
      scrollItems_Store[itemIndex].text[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")):Find("Text_name"):GetComponent("Text");
      scrollItems_Store[itemIndex].price[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")):Find("Image_PriceBG"):Find("Text_price"):GetComponent("Text");
      scrollItems_Store[itemIndex].sprite[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")):Find("Image_PriceBG"):Find("Image_Chip"):GetComponent("Image");
      scrollItems_Store[itemIndex].item[i] = UIItemController.New(scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")):Find("Image_Item"), this.OpenView, i);

      scrollItems_Store[itemIndex].event[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")):GetComponent("UIEvent");
      scrollItems_Store[itemIndex].event[i]:SetListener(EventTriggerType.PointerClick, this.BuyItem);
      scrollItems_Store[itemIndex].event[i].parameter = i;

      scrollItems_Store[itemIndex].event[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")):Find("Image_Item"):GetComponent("UIEvent");
      scrollItems_Store[itemIndex].event[i]:SetListener(EventTriggerType.PointerClick, this.OpenView);
      scrollItems_Store[itemIndex].event[i].parameter = i;
    end
  end
end

function UIFurnace.OnItemChange_scrollContent_Store(dataIndex, itemIndex)
  local itemData;

  for i = 1, maxItem do
    if shops[currentSelect] ~= nil and shops[currentSelect][i] ~= nil then
      itemData = itemDatas[shops[currentSelect][i].Id];

      if itemData ~= nil then
        scrollItems_Store[itemIndex].text[i].text = itemData:GetName(true);
        if BitFlag.Get(flags[currentSelect][i]) then
          scrollItems_Store[itemIndex].price[i].text = string.Get(21230);
        else
          if Contains(currentSelect, EUIStoreSubTag.GoldNpc, EUIStoreSubTag.GoldEquip, EUIStoreSubTag.GoldTurnItem) then
            scrollItems_Store[itemIndex].price[i].text = itemData.furnaceCount * shops[currentSelect][i].quant * goldStoreRate * shops[currentSelect][i].crit;
          else
            scrollItems_Store[itemIndex].price[i].text = itemData.furnaceCount * shops[currentSelect][i].quant;
          end
        end

        if Contains(currentSelect, EUIStoreSubTag.Npc, EUIStoreSubTag.GoldNpc, EUIStoreSubTag.TurnItem, EUIStoreSubTag.GoldTurnItem) then
          scrollItems_Store[itemIndex].sprite[i].sprite = UI.GetSprite("icon057");
        elseif currentSelect == EUIStoreSubTag.Equip or currentSelect == EUIStoreSubTag.GoldEquip then
          scrollItems_Store[itemIndex].sprite[i].sprite = UI.GetSprite("icon058");
        end
      end

      scrollItems_Store[itemIndex].item[i]:SetItem(shops[currentSelect][i].Id, shops[currentSelect][i].quant);
    else
      scrollItems_Store[itemIndex].price[i].text = "";
      scrollItems_Store[itemIndex].text[i].text = "";
      scrollItems_Store[itemIndex].item[i]:SetItem(0);
    end
  end

  return true;
end

function UIFurnace.OnInitialize_scrollContent_Dismantle(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Dismantle[itemIndex] = {};
    scrollItems_Dismantle[itemIndex].item = {};
    scrollItems_Dismantle[itemIndex].text = {};

    for i = 1, maxItem do
      scrollItems_Dismantle[itemIndex].item[i] = UIItemController.New(scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")), this.RemoveItem, i);
      scrollItems_Dismantle[itemIndex].text[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")):Find("Text_name"):GetComponent("Text");
    end
  end
end

function UIFurnace.OnItemChange_scrollContent_Dismantle(dataIndex, itemIndex)
  for i = 1, maxItem do
    if furnaces[i] ~= nil then
      scrollItems_Dismantle[itemIndex].text[i].text = itemDatas[furnaces[i].Id]:GetName(true);
      scrollItems_Dismantle[itemIndex].item[i]:SetItem(furnaces[i].Id, furnaces[i].quant, furnaces[i]);
    else
      scrollItems_Dismantle[itemIndex].text[i].text = "";
      scrollItems_Dismantle[itemIndex].item[i]:SetItem(0);
    end
  end

  return true;
end

function UIFurnace.OnInitialize_scrollContent_Message(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Message[itemIndex] = {};
    scrollItems_Message[itemIndex].text = scrollItems[itemIndex]:Find("Text_Message"):GetComponent("Text");
  end
end

function UIFurnace.OnItemChange_scrollContent_Message(dataIndex, itemIndex)
  local index = dataIndex + 1;

  scrollItems_Message[itemIndex].text.text = message[index];
  return true;
end

function UIFurnace.UpdateUI(refresh)
  gameObject_Store:SetActive(currentTag == EUIFurnaceTag.Store or currentTag == EUIFurnaceTag.GoldStore);
  gameObject_Dismantle:SetActive(currentTag == EUIFurnaceTag.Dismantle);

  this.UpdateStore();
  this.UpdateDismantle(refresh);
  this.UpdateFilterIcon();
  this.UpdateInUse();
end

function UIFurnace.UpdateInUse()
  Item.ClearAllInUse();
  
  for k, v in pairs(furnaces) do
    local bagItem = Item.GetBagItem(EThings.Bag, v.bagIndex);
    if bagItem ~= nil and v.quant == bagItem.quant then
      Item.SetItemInUse(v.bagIndex);
    end
  end
end

function UIFurnace.UpdateStore()
  if not Contains(currentTag, EUIFurnaceTag.Store, EUIFurnaceTag.GoldStore) then return end

  this.CloseBagUI();

  if Contains(currentSubPage, EUIStoreSubTag.Npc, EUIStoreSubTag.GoldNpc, EUIStoreSubTag.TurnItem, EUIStoreSubTag.GoldTurnItem) then
    text_ChipStore.text = string.format(string.Get(21033), RoleCount.Get(ERoleCount.NpcDebris));
    imageMyChip.sprite = UI.GetSprite("icon057");
  elseif currentSubPage == EUIStoreSubTag.Equip or currentSubPage == EUIStoreSubTag.GoldEquip then
    text_ChipStore.text = string.format(string.Get(21034), RoleCount.Get(ERoleCount.EquipDebris));
    imageMyChip.sprite = UI.GetSprite("icon058");
  end

  scrollContent_Store:Refresh();
end

function UIFurnace.GetPng()
  if rawImageBg.texture == nil then
    TextureManager.SetPng(ETextureUseType.UI, "common0_com103", rawImageBg);
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  end
end

function UIFurnace.UpdateDismantle(refresh)
  if currentTag ~= EUIFurnaceTag.Dismantle then return end

  this.GetPng();

  scrollContent_Message:Reset(table.maxn(message), table.maxn(message) - 1);

  scrollContent_Dismantle:Refresh();

  local total = 0;
  for k, v in pairs(furnaces) do
    total = total + v.quant * (math.floor(itemDatas[v.Id].furnaceCount / baseRate) * activeRate);
  end

  if currentDisTag == EFurnace.Npc then
    text_ChipsDismantle.text = string.format(string.Get(21033), RoleCount.Get(ERoleCount.NpcDebris));
    text_BaseGet.text = string.format(string.Get(21065), total);
  elseif currentDisTag == EFurnace.Equip then
    text_ChipsDismantle.text = string.format(string.Get(21034), RoleCount.Get(ERoleCount.EquipDebris));
    text_BaseGet.text = string.format(string.Get(21065), total);
  elseif currentDisTag == EFurnace.ExclusiveWeapon then 
    text_ChipsDismantle.text = string.format(string.Get(22698), RoleCount.Get(ERoleCount.SWeaponDebris));
    text_BaseGet.text = string.format(string.Get(21065), total);
  elseif currentDisTag == EFurnace.Godskin then
    local godskinClips = 0;
  
    for k, v in pairs(furnaces) do
      godskinClips = godskinClips + v.quant * itemDatas[v.Id].furnaceCount;
    end
    
    text_ChipsDismantle.text = string.Get(23657) .. Item.GetItemCount(55403);
    text_BaseGet.text = string.format(string.Get(21065), godskinClips);
  end
  
  if refresh ~= false then
    this.CloseBagUI();
  
    UI.Open(UIBag,
      function(bagIndex, itemId)
        UI.Open(UIItemInfo, EThings.Bag, bagIndex, 0,
          string.Get(21026),
          function(bagKind, bagIndex, followIndex)
            local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
          
            if itemSave == nil then return end
            if Item.IsLock(itemSave) then return end
            local itemData = itemDatas[itemSave.Id];
            if itemData == nil then return end
          
            local count = this.GetFurnaceCount(itemSave);
            local fitType = itemDatas[itemSave.Id].fitType;
          
            if Item.IsTypeOfEquips(itemDatas[itemSave.Id].fitType) then
              local furnaceIndex = this.CheckSameEquip(itemSave);
              if furnaceIndex > 0 then
                ShowCenterMessage(string.format(string.Get(21064), itemDatas[itemSave.Id]:GetName(true)));
                return;
              end
            
              if table.Count(furnaces) >= maxItem then
                ShowCenterMessage(string.Get(21181));
                return;
              end
            
              if itemData.kind == EItemKind.Myth then
                this.DoInsertGodskin(itemSave, true, 1);
              else
                this.DoInsertFurnace(itemSave, true, 1);
              end
          
            else
              if itemSave.quant > 1 and itemSave.quant - count > 1 then
                if this.HaveFurnaceItem(bagIndex) then
                  if count >= Item.MaxThingGridQuant and table.Count(furnaces) >= maxItem then
                    ShowCenterMessage(string.Get(21181));
                    return;
                  end
                else
                  if table.Count(furnaces) >= maxItem then
                    ShowCenterMessage(string.Get(21181));
                    return;
                  end
                end
              
                ShowCountInput(string.Get(21026), 1, itemSave.quant - count,
                  function(text)
                    if text == nil then return end
                    if tonumber(text) == 0 then return end
                  
                    local furnaceItemSave = ThingData.Copy(itemSave);
                    furnaceItemSave.quant = tonumber(text);
                    furnaceItemSave.bagIndex = bagIndex;
                  
                    if count + furnaceItemSave.quant > itemSave.quant then
                      ShowCenterMessage(string.Get(10136)); --輸入超過持有數量
                      return;
                    end
                  
                    this.DoInsertFurnace(furnaceItemSave, false, furnaceItemSave.quant);
                  
                    if count + furnaceItemSave.quant>= itemSave.quant then
                      Item.SetItemInUse(bagIndex);
                    end
                  end
                );
              else
                if table.Count(furnaces) >= maxItem then
                  ShowCenterMessage(string.Get(21181));
--[[                  --5-----------------------------------------------------
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
                  return;
                end
              
                if count + 1 > itemSave.quant then
                  ShowCenterMessage(string.Get(10136)); --輸入超過持有數量
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
                  --6-----------------------------------------------------]]
                  return;
                end
              
                this.DoInsertFurnace(itemSave, false, 1);
              end
            end
          
            if UI.IsVisible(UIItemInfo) then
              UI.Close(UIItemInfo);
            end
          end
        );
      end,
      Vector2.New(260, -25),
      false,
      nil,
      function(itemSave)
        if Contains(currentDisTag, EFurnace.Npc, EFurnace.Equip, EFurnace.ExclusiveWeapon) then
          return Item.ConditionFurnace(itemSave, currentDisTag);
        elseif currentDisTag == EFurnace.Godskin then
          return Item.ConditionBagGodskin(itemSave.Id, itemSave);
        end
      end,
      false
    );
  else
    UIBag.UpdateUI(true);
  end
end

function UIFurnace.DoInsertFurnace(itemSave, isEquips, ItemSaveQuant)
  if itemSave.stoneLv <= 0 and itemSave.proofKind <= 0 and itemSave.elementValue <= 0 then
    this.InsertFurnace(itemSave, isEquips, ItemSaveQuant);
  
    this.UpdateUI(false);
  else
    ShowCheckMessage(
      function(result)
        if result then
          this.InsertFurnace(itemSave, isEquips, ItemSaveQuant);

          this.UpdateUI();
        end
      end,
      string.Get(21063),
      Role.player
    );
  end
end

function UIFurnace.DoInsertGodskin(itemSave, isEquips, ItemSaveQuant)
  if itemSave.mythLv <= 0 then
    this.InsertFurnace(itemSave, isEquips, ItemSaveQuant);
    
    this.UpdateUI(false);
  else
    ShowCheckMessage(
      function(result)
        if result then
          this.InsertFurnace(itemSave, isEquips, ItemSaveQuant);
          this.UpdateUI(false);
        end
      end,
      string.Get(21063),
      Role.player
    );
  end
end

function UIFurnace.InsertFurnace(itemSave, isEquips, ItemSaveQuant)
  if itemSave == nil then return end
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
  if isEquips then
    
    for i = 1, maxItem do
      if furnaces[i] == nil then
        furnaces[i] = itemSave;
        break;
      end
    end
  else
    local index = this.CheckSameEquip(itemSave);

    if index <= 0 then
      for i = 1, maxItem do
        if furnaces[i] == nil then
          furnaces[i] = itemSave;
          break;
        end
      end
    else
      furnaces[index].quant = furnaces[index].quant + ItemSaveQuant;
    end
  end
end

function UIFurnace.CheckSameEquip(itemSave)
  for i = 1, maxItem do
    if furnaces[i] ~= nil then
      if itemSave.bagIndex == furnaces[i].bagIndex then
        return i;
      end
    end
  end

  return 0;
end

function UIFurnace.GetFurnaceCount(itemSave)
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
  local count = 0;
  for k, v in pairs(furnaces) do
    if furnaces[k].bagIndex == itemSave.bagIndex then
      count = count + furnaces[k].quant;
    end
  end

  return count;
end

function UIFurnace.HaveFurnaceItem(bagIndex)
  for k, v in pairs(furnaces) do
    if v.bagIndex == bagIndex then
      return true;
    end
  end

  return false;
end

function UIFurnace.OpenView(uiEvent)
  local index = uiEvent.parameter;

  local itemId = shops[currentSelect][index].Id;

  if itemId == nil then return end

  UIItemInfo.Show(itemId);
end

function UIFurnace.GetDebris(kind)
  if kind == EFurnace.Npc then
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
    return RoleCount.Get(ERoleCount.NpcDebris);
  elseif kind == EFurnace.Equip then
    return RoleCount.Get(ERoleCount.EquipDebris);
  elseif kind == EFurnace.ExclusiveWeapon then
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
    return RoleCount.Get(ERoleCount.SWeaponDebris);
  elseif kind == EFurnace.Godskin then
    return 0;
  else
    return 0;
  end
end

function UIFurnace.BuyItem(uiEvent)
  local index = uiEvent.parameter;

  if Item.CheckBagIsFull() then return end

  if BitFlag.Get(flags[currentSelect][index]) then
    ShowCenterMessage(string.Get(21039)); --已購買該商品
    return;
  end

  local itemId = shops[currentSelect][index].Id;

  if itemId == nil then return end

  local itemData = itemDatas[shops[currentSelect][index].Id];

  if itemData == nil then return end

  local chips, kindString;
  local storeRate = 1;

  if currentSolt == ESolt.Npc then
    chips = RoleCount.Get(ERoleCount.NpcDebris);
    kindString = string.Get(98035);
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
  elseif currentSolt == ESolt.Equip then
    chips = RoleCount.Get(ERoleCount.EquipDebris);
    kindString = string.Get(20165);
  elseif currentSolt == ESolt.TurnItem then
    chips = RoleCount.Get(ERoleCount.NpcDebris);
    kindString = string.Get(98035);
  end

  if Contains(currentSelect, ESelect.GoldNpc, ESelect.GoldEquip, ESelect.GoldTurnItem) then
    storeRate = goldStoreRate;
  end

  local cost = itemData.furnaceCount * shops[currentSelect][index].quant * shops[currentSelect][index].crit * storeRate;
  if chips < cost then
    ShowCenterMessage(string.Get(21180));
    return;
  end

  ShowCheckMessage(
    function(result)
      if result then
        --C:089-002 <購買商品>  +購買種類(1) +格子(1) +物品ID(2)   購買種類 1.武將2.裝備
        sendBuffer:Clear();
        sendBuffer:WriteByte(currentSelect);
        sendBuffer:WriteByte(index);
        sendBuffer:WriteUInt16(itemId);
        Network.Send(89, 2, sendBuffer);
      end
    end,
    string.format(string.Get(21263), itemData.furnaceCount * shops[currentSelect][index].quant * shops[currentSelect][index].crit * storeRate, kindString, shops[currentSelect][index].quant, itemData:GetName(true)),
    Role.player
  );
end

function UIFurnace.RemoveItem(uiEvent)
  local index = uiEvent.parameter;

  if furnaces[index] == nil then return end

  local bagItem = Item.GetBagItem(EThings.Bag, furnaces[index].bagIndex);

  if bagItem == nil then return end

  UI.Open(UIItemInfo, EThings.Bag, furnaces[index].bagIndex, 0,
    string.Get(20110),
    function(bagKind, bagIndex, followIndex)

      furnaces[index] = nil;

      this.UpdateUI();

      if UI.IsVisible(UIItemInfo) then
        UI.Close(UIItemInfo);
      end
    end
  );
end

function UIFurnace.OnOpen(tag, disTag)
  if tag ~= nil then
    currentTag = tag;
  
    if disTag ~= nil then
      currentDisTag = disTag;
      this.QueryFurnace();
    end
  else
    currentTag = EUIFurnaceTag.Store;
    currentSubPage = EUIStoreSubTag.Npc;
    currentDisTag = EFurnace.Npc;
    currentSolt = ESolt.Npc;
    currentSelect = ESelect.Npc;
  end

  this.UpdateUI();

  return true;
end

function UIFurnace.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(21025), this.OnClick_Close, this.OnClick_Help, this.OnClick_Tag, tagDatas, currentTag, 1);
    UITeach.Guide(15);
  end
end

function UIFurnace.OnClick_Help(checkShow)
  if checkShow ~= true then
    UI.Open(UITutorialHint, 30, this);
  end

  return true;
end

function UIFurnace.OnClick_Tag(mainTag, subTag)
  currentTag = mainTag;
  currentSubPage = subTag;
  
  this.SetSoltSelect();

  Item.ClearAllInUse();

  table.Clear(furnaces);

  this.UpdateUI();

  return true;
end

function UIFurnace.OnClick_Refresh()
  local sellId;
  if currentSelect == EUIStoreSubTag.Npc then
    sellId = 24;
  elseif currentSelect == EUIStoreSubTag.Equip then
    sellId = 25;
  elseif currentSelect == EUIStoreSubTag.GoldNpc then
    sellId = 33;
  elseif currentSelect == EUIStoreSubTag.GoldEquip then
    sellId = 34;
  elseif currentSelect == EUIStoreSubTag.TurnItem then
    sellId = 59;
  elseif currentSelect == EUIStoreSubTag.GoldTurnItem then
    sellId = 60;
  end

  UISell.Launch(sellId, this.UpdateStore);
end

function UIFurnace.OnClick_ShowPro()
  this.CalculateSamplePro();

  local itemId = this.NpcItemId;
  if Contains(currentSubPage, EUIStoreSubTag.Equip, EUIStoreSubTag.GoldEquip) then
    itemId = this.EquipItemId;
  end

  UIItemInfo.ShowFurnace(itemId, currentSolt * 100 + currentSelect);
end

function UIFurnace.SetSoltSelect()
  if currentTag == EUIFurnaceTag.Store and currentSubPage == ESolt.Npc then
    currentSolt = ESolt.Npc;
    currentSelect = ESelect.Npc;
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
  elseif currentTag == EUIFurnaceTag.Store and currentSubPage == ESolt.Equip then
    currentSolt = ESolt.Equip;
    currentSelect = ESelect.Equip;
  elseif currentTag == EUIFurnaceTag.Store and currentSubPage == ESolt.TurnItem then
    currentSolt = ESolt.TurnItem;
    currentSelect = ESelect.TurnItem;
  elseif currentTag == EUIFurnaceTag.GoldStore and currentSubPage == ESolt.Npc then
    currentSolt = ESolt.Npc;
    currentSelect = ESelect.GoldNpc;
  elseif currentTag == EUIFurnaceTag.GoldStore and currentSubPage == ESolt.Equip then
    currentSolt = ESolt.Equip;
    currentSelect = ESelect.GoldEquip;
  elseif currentTag == EUIFurnaceTag.GoldStore and currentSubPage == ESolt.TurnItem then
    currentSolt = ESolt.TurnItem;
    currentSelect = ESelect.GoldTurnItem;
  end
end

function UIFurnace.OnClick_Filter(uiEvent)
  if currentDisTag == uiEvent.parameter then return end

  currentDisTag = uiEvent.parameter;

  Item.ClearAllInUse();

  table.Clear(furnaces);

  this.UpdateUI();
  
  UIBag.ShowImageFilter(currentDisTag == EFurnace.Godskin);
end

function UIFurnace.OnClick_Auto()
  if currentDisTag == EFurnace.Godskin then
    
    local bagItems = Item.GetBagByFilter(
      function(itemSave)
        return Item.ConditionBagGodskin(itemSave.Id, itemSave) and not itemSave.isLock ;
      end
    );
  
    local count = table.Count(furnaces);
  
    for k, v in pairs(bagItems) do
      if count < maxItem and v.mythLv <= 0 then
        this.InsertAll(v);
      end
    end
  else
    local bagItems = Item.GetBagByFilter(
      function(itemSave)
        return Item.ConditionFurnace(itemSave, currentDisTag) and not itemSave.isLock;
      end
    );
  
    local count = table.Count(furnaces);
  
    for k, v in pairs(bagItems) do
      if count < maxItem and v.stoneLv <= 0 and v.proofKind <= 0 and v.elementValue <= 0 then
        this.InsertAll(v);
      end
    end
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
  

  this.UpdateUI();
end

function UIFurnace.InsertAll(itemSave)
  if itemSave == nil then return end

  for i = 1, maxItem do
    if furnaces[i] == nil and not UIFurnace.HaveFurnaceItem(itemSave.bagIndex) then
      furnaces[i] = itemSave;
      break;
    end
  end
end

function UIFurnace.OnClick_Close()
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
  Item.ClearAllInUse();

  table.Clear(furnaces);

  UI.Close(UIFurnace);

  this.CloseBagUI();

  return true;
end

function UIFurnace.CloseBagUI()
  
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
  
  UIBag.ShowImageFilter(false);
  
  if UI.IsVisible(UIBag) then
    UI.Close(UIBag);
  end

  if UI.IsVisible(UIItemInfo) then
    UI.Close(UIItemInfo);
  end
end

function UIFurnace.UpdateFilterIcon()
  if currentTag ~= EUIFurnaceTag.Dismantle then return end

  imageFilter[EFurnace.Npc].sprite = UI.GetSprite("but151D");
  imageFilter[EFurnace.Equip].sprite = UI.GetSprite("but152D");
  imageFilter[EFurnace.ExclusiveWeapon].sprite = UI.GetSprite("but182D");
  imageFilter[EFurnace.Godskin].sprite = UI.GetSprite("but268D");

  if currentDisTag == EFurnace.Npc then
    imageFilter[currentDisTag].sprite = UI.GetSprite("but151L");
  elseif currentDisTag == EFurnace.Equip then
    imageFilter[currentDisTag].sprite = UI.GetSprite("but152L");
  elseif currentDisTag == EFurnace.ExclusiveWeapon then
    imageFilter[currentDisTag].sprite = UI.GetSprite("but182L");
  elseif currentDisTag == EFurnace.Godskin then
    imageFilter[currentDisTag].sprite = UI.GetSprite("but268L");
  end
end

--C:089-001 <查詢熔爐商品資料>
function UIFurnace.QueryFurnace()
  Network.Send(89, 1);
end

--C:089-003 <分解物品> +count(1) <<+背包索引(2) +數量(4)>>
function UIFurnace.OnClick_Dismantle()
  local count = table.Count(furnaces);

  sendBuffer:Clear();
  sendBuffer:WriteByte(count);

  for k, v in pairs(furnaces) do
    if furnaces[k] ~= nil then
      sendBuffer:WriteUInt16(furnaces[k].bagIndex);
      sendBuffer:WriteInt32(furnaces[k].quant);
    end
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
  
  Network.Send(89, 3, sendBuffer);
end

--S:089-001 <熔爐商品資料> 結果(1) 1:成功 +碎片比率(8) + 碎片活動比率(8) +是否要開介面(1) +count(1) + <<商品種類(1) +是否暴擊(1) +count(1) <<+物品ID(2) +數量(4)>>>>
function UIFurnace.ReciveShopData(data)
  local kind, itemId, itemCount;
  local isCrit = 0;
  local critRate = 1;
  local bShowMsg = false;

  baseRate = data:ReadDouble();
  activeRate = data:ReadDouble();
  local bOpen = data:ReadByte();
  local count = data:ReadByte();

  for i = 1, count do
    kind = data:ReadByte();
    isCrit = data:ReadByte();
    itemCount = data:ReadByte();

    if isCrit == 1 then  --暴擊
      critRate = 0.5;
      bShowMsg = true;
    else
      critRate = 1;
    end

    for j = 1, itemCount do
      itemId = data:ReadUInt16();
      shops[kind][j] = {};
      shops[kind][j].Id = itemId;
      shops[kind][j].quant = data:ReadInt32();
      shops[kind][j].crit = critRate;
    end
  end

  if bOpen == 1 then
    if UI.IsVisible(UIFurnace) then
      this.UpdateUI();

      if bShowMsg then
        ShowCenterMessage(string.Get(21769));
        bShowMsg = false;
      end
    else
      UI.Open(UIFurnace);
    end
  else
    if UI.IsVisible(UIFurnace) then
      this.UpdateUI();
    end
  end
end

function UIFurnace.ReciveBuy(data)
  local result = data:ReadByte();

  if result == 1 then
    this.UpdateUI();
  elseif result == 5 then
    ShowCenterMessage(string.Get(21039)); --已購買該商品
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
  elseif result == 6 then
    ShowCenterMessage(string.Get(21180));
  elseif result == 7 then
    ShowCenterMessage(string.Get(80359));
  elseif result == 8 then
    ShowCenterMessage(string.Get(21970));
  end
end

--收到分解協定
function UIFurnace.ReciveDismantle(data)
  local result = data:ReadByte();
  
  if result == 0 then
    local count = data:ReadByte();
    local kind, itemId, chipCount, itemData, kindString;

    for i = 1, count do
      itemId = data:ReadUInt16();
      kind = data:ReadByte();
      chipCount = data:ReadUInt32();
      itemData = itemDatas[itemId];
      if itemData ~= nil then

        if kind == EFurnace.Npc then
          kindString = string.Get(98035);
          table.insert(message, string.format(string.Get(21231), itemData:GetName(true), kindString, chipCount));
        elseif kind == EFurnace.Equip then
          kindString = string.Get(20165);
          table.insert(message, string.format(string.Get(21231), itemData:GetName(true), kindString, chipCount));
        elseif kind == EFurnace.ExclusiveWeapon then
          kindString = string.Get(22696);
          table.insert(message, string.format(string.Get(21231), itemData:GetName(true), kindString, chipCount));
        elseif kind == EFurnace.Godskin then
          local count = chipCount;
          table.insert(message, string.format(string.Get(23701), itemData:GetName(true), itemDatas[55403]:GetName(true), count));
        end
      end
    end

    Item.ClearAllInUse();

    table.Clear(furnaces);
  
    if UI.IsVisible(UIFurnace) then
      this.UpdateUI();
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

function UIFurnace.Clear()
  table.Clear(message);
end

function UIFurnace.GetTagName()
  return string.Concat(tagDatas[currentTag][1], tagDatas[currentTag][2][currentSubPage]);
end

function UIFurnace.GetSumOfAwardPro(kind, index)
  if furnacePros[kind] == nil or furnacePros[kind][index] == nil then
    return 0;
  else
    return furnacePros[kind][index];
  end
end

function UIFurnace.SetSumOfAwardPro(kind, index)
  furnacePros[kind][index] = 0;

  local n = 0;
  local sum = 0;

  for i, v in pairs(furnaceSelectDatas) do
    if v.kind == kind then
      for ii, vv in pairs(v.awardPro) do
        if ii == index and vv > 0 then
          n = n + 1;
          sum = sum + vv;
        end
      end
    end
  end

  if n > 0 then
    furnacePros[kind][index] = sum / this.GetSlotCount(kind, index);
  end
end

function UIFurnace.CalculateSamplePro()
  for k, v in pairs(furnaceSelectDatas) do
    for kk, vv in pairs(v.awardPro) do
      v.awardPro[kk] = v.awardKind[kk] / 8 * (v.sample / 10000);
    end
  end

  for i, v in pairs(EUIStoreSubTag) do
    for j = 1, 6 do
      this.SetSumOfAwardPro(v, j);
    end
  end
end

function UIFurnace.GetSlotCount(kind, index)
  local sum = 0;
  local solt = 1;

  if kind == EUIStoreSubTag.Npc then
    solt = ESolt.Npc;
  elseif kind == EUIStoreSubTag.Equip then
    solt = ESolt.Equip;
  elseif kind == EUIStoreSubTag.GoldNpc then
    solt = ESolt.Npc;
  elseif kind == EUIStoreSubTag.GoldEquip then
    solt = ESolt.Equip;
  elseif kind == EUIStoreSubTag.TurnItem then
    solt = ESolt.TurnItem;
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
  elseif kind == EUIStoreSubTag.GoldTurnItem then
    solt = ESolt.TurnItem;
  end

  for i, v in pairs(furnaceSlotDatas) do
    if v.kind == solt and v.awardKind == index and this.CheckOpenTime(v) then
      sum = sum + 1;
    end
  end

  return sum;
end

function UIFurnace.CheckOpenTime(data)
  if data.bOpen >= 1 then
    if FurnaceSlotData.IsInTime(data) then
      return true;
    else
      return false;
    end

  else
    return true;
  end
end