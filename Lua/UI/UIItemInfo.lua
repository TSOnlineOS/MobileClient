UIItemInfo = {}
local this = UIItemInfo;

this.name = "UIItemInfo";
this.uiController = nil;

--const
local itemPerColumn = 5;

--ui
local rectTransform_BlissBag;
local rectTransform_BlissBagScroll;

local gameObject_ButtomFunction;
local gameObject_RightFunction;
local gameObject_Star;
local Image_Star = {};

local text_Name;
local text_BlissBag;
local text_Info;

local sizeFitter_InfoBG;
local sizeFitter_BG;
local item;

local buttomFunctions = {};
local rightFunctions = {};

local scrollContent_BlissBag;
local scrollItems_BlissBag = {};

local rawImage_RoleGround;
local jmpDrawer_Role;
local jmpDrawer_RoleRectTransform;

local image_lock;

--var
local currentClickEvents = {};

local currentBagKind = 0;
local currentBagIndex = 0;
local currentFollowIndex = 0;
local currentItemId = 0;
local currentLeftTimes = nil;
local currentItemSave = nil;
local currentKeyCount = 0;
local currentKeyBagIndex = 0;

local previewNpcId = 0;
local orderInlayer = 0;
local dirty = 0;
local currentUIParamater = nil;
local uiParamaters = {};
local allBlissBagItem = {};
local keys = {};
local exchangeSelcets = {};
local furnacePr = {};
local EFurnaceSort = {
  Active = 300, --活動期間
  Normal = 100, --一般商品
}
local originScale;

function UIItemInfo.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;

  rectTransform_BlissBag = uiController:FindGameObject("Image_BlissBagBG"):GetComponent("RectTransform");
  rectTransform_BlissBagScroll = rectTransform_BlissBag:Find("ScrollRect_BlissBag");

  gameObject_ButtomFunction = uiController:FindGameObject("ButtomFunction");
  gameObject_RightFunction = uiController:FindGameObject("RightFunction");
  gameObject_Star = uiController:FindGameObject("Star");
  
  for i = 1, 7 do
    Image_Star[i] = gameObject_Star.transform:Find(string.Concat("Image_Star (", i, ")")).gameObject;
  end

  text_Name = uiController:FindText("Text_Name");
  text_BlissBag = uiController:FindText("Text_BlissBag");
  text_Info = uiController:FindText("Text_Info");

  sizeFitter_InfoBG = uiController:FindImage("Image_InfoBG").transform:GetComponent("SizeFitter");
  sizeFitter_BG = uiController:FindImage("Image_BG").transform:GetComponent("SizeFitter");
  item = UIItemController.New(uiController:FindImage("Image_ItemBG").transform);
  
  local tempTransform = rectTransform_BlissBag:Find("Function");
  for i = 1, 4 do
    buttomFunctions[i] = {};
    buttomFunctions[i].event = tempTransform:Find(string.Concat("Image_Function (", i, ")")):GetComponent("UIEvent");
    buttomFunctions[i].event:SetListener(EventTriggerType.PointerClick, this.OnClick_Function);
    buttomFunctions[i].event.parameter = i;
    buttomFunctions[i].text_Name = buttomFunctions[i].event.transform:Find("Text_"):GetComponent("Text");
    
    rightFunctions[i] = {};
    rightFunctions[i].event = gameObject_RightFunction.transform:Find(string.Concat("Image_Function (", i, ")")):GetComponent("UIEvent");
    rightFunctions[i].event:SetListener(EventTriggerType.PointerClick, this.OnClick_Function);
    rightFunctions[i].event.parameter = i;
    rightFunctions[i].text_Name = rightFunctions[i].event.transform:Find("Text_"):GetComponent("Text");
  end

  scrollContent_BlissBag = uiController:FindScrollContent("ScrollContent_BlissBag");
  scrollContent_BlissBag.onInitialize = this.OnInitialize_ScrollContent_BlissBag;
  scrollContent_BlissBag.onItemChange = this.OnItemChange_ScrollContent_BlissBag;
  scrollContent_BlissBag:Initialize(1);

  rawImage_RoleGround = uiController:FindRawImage("RawImage_RoleGround");
  jmpDrawer_Role = uiController:FindRawImage("RawImage_Role").gameObject:AddComponent(typeof(JmpDrawer));
  jmpDrawer_RoleRectTransform = jmpDrawer_Role:GetComponent("RectTransform");
  originScale = jmpDrawer_RoleRectTransform.localScale;

  local tempEvent = uiController:FindEvent("Image_Mask");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);

  tempTransform = gameObject_RightFunction.transform:Find("Image_Lock");
  image_lock = tempTransform:GetComponent("Image");
  tempEvent = tempTransform:GetComponent("UIEvent");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_DoLock);

  this.SetSortOrder(UISortingOrder.Hint);
end

function UIItemInfo.Show(itemId, itemSave)
  local itemData = itemDatas[itemId];

  if itemData == nil then return end
  if itemData:IsDirectUse() then return end
  if itemData:IsTsMoney() then return end

  if itemData.kind == EItemKind.ExclusiveWeapon then 
    UI.OpenAlwaysUseArgument(UIItemInfo, EThings.None, itemId, itemSave, string.Get(20869), ExclusiveWeapon.ViewSkill);
  else
    UI.OpenAlwaysUseArgument(UIItemInfo, EThings.None, itemId, itemSave);
  end
end

function UIItemInfo.ShowLuckyBag(luckyBagId)
  UI.OpenAlwaysUseArgument(UIItemInfo, EThings.LuckyBag, luckyBagId);
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

function UIItemInfo.ShowFurnace(itemId, followIndex)
  UI.OpenAlwaysUseArgument(UIItemInfo, EThings.Furnace, itemId, followIndex);
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

function UIItemInfo.ShowLockBlissBag(bagIndex, followIndex)
  table.Clear(keys);

  local itemSave = Item.GetBagItem(EThings.Bag, currentBagIndex, currentFollowIndex);

  local itemData = itemDatas[itemSave.Id];

  if itemSave == nil then return end

  keys = Item.GetLockBlissBagKeys(itemData.skillLink);

  local keyKindCount = table.Count(keys);

  if keyKindCount <= 0 then
    ShowCenterMessage(string.Get(22192));
  elseif keyKindCount == 1 then  --一種可開的錀匙
    if keys[1] == nil then return end

    currentKeyCount = keys[1].count;

    if currentKeyCount == 1 then
      currentKeyBagIndex = keys[1].bagIndex;

      if UI.IsVisible(UIItemInfo) then
        UI.Close(UIItemInfo);
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

      this.SendUnLockBliggBag();
    elseif currentKeyCount > 1 then
      ShowCountInput(string.Get(22185), 1, math.min(currentKeyCount, Item.GetItemCount(currentItemId)),
        function(text)
          if text == nil then return end
          if tonumber(text) == 0 then return end
          if string.IsNullOrEmpty(text) then return end

          currentKeyBagIndex = keys[1].bagIndex;
          currentKeyCount = tonumber(text);
          this.SendUnLockBliggBag();
        end
      );
    end
  else
    if UI.IsVisible(UIItemInfo) then
      UI.Close(UIItemInfo);
    end

    --多種可開的錀匙
    UI.OpenAlwaysUseArgument(UIItemInfo, EThings.LockBlissBag, bagIndex, followIndex, string.Get(22005), this.OpenLockBlissBag);
  end
end

function UIItemInfo.OpenLockBlissBag()
  local selectCount = 0;
  for k in pairs(exchangeSelcets) do
    if exchangeSelcets[k] then
      selectCount = selectCount + 1;
      if keys[k] ~= nil then
        currentKeyBagIndex = keys[k].bagIndex;
        currentKeyCount = keys[k].count;
      end
    end
  end

  if selectCount <= 0 then
    ShowCenterMessage(string.Get(22193));
    return;
  end

  if selectCount > 1 then
    ShowCenterMessage(string.Get(22194));
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
    return;
  end

  if currentKeyCount == 1 then
    if UI.IsVisible(UIItemInfo) then
      UI.Close(UIItemInfo);
    end

    this.SendUnLockBliggBag();
  elseif currentKeyCount > 1 then
    ShowCountInput(string.Get(22185), 1, math.min(currentKeyCount, Item.GetItemCount(currentItemId)),
      function(text)
        if text == nil then return end
        if tonumber(text) == 0 then return end
        if string.IsNullOrEmpty(text) then return end

        currentKeyCount = tonumber(text);

        if UI.IsVisible(UIItemInfo) then
          UI.Close(UIItemInfo);
        end

        this.SendUnLockBliggBag();
      end
    );
  end
end

function UIItemInfo.SendUnLockBliggBag()
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end

  --C:023-089: <鑰匙開啟寶箱功能> +寶箱背包索引(2) +鑰匙背包索引(2) +開啟數量(2)
  sendBuffer:Clear();
  sendBuffer:WriteUInt16(currentBagIndex);
  sendBuffer:WriteUInt16(currentKeyBagIndex);
  sendBuffer:WriteUInt16(currentKeyCount);
  Network.Send(23, 89, sendBuffer);
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
end

function UIItemInfo.GetSortOrder()
  return this.uiController.canvas.sortingOrder;
end

function UIItemInfo.SetSortOrder(order)
  orderInlayer = order;
end

function UIItemInfo.GetExchangeSelect()
  return exchangeSelcets;
end

function UIItemInfo.OnOpen(bagKind, bagIndex, followIndex, funName1, clickEvent1, funName2, clickEvent2, funName3, clickEvent3, funName4, clickEvent4)
  currentUIParamater = { bagKind, bagIndex, followIndex, funName1, clickEvent1, funName2, clickEvent2, funName3, clickEvent3, funName4, clickEvent4 };

  this.uiController.canvas.sortingOrder = orderInlayer;

  currentBagKind = bagKind;
  currentBagIndex = bagIndex;
  currentFollowIndex = followIndex;
  currentItemId = 0;
  currentLeftTimes = nil;
  currentItemSave = nil;

  if currentBagKind == EThings.None then
    currentItemId = bagIndex;
    if type(followIndex) == "number" then
      currentLeftTimes = followIndex;
    elseif type(followIndex) == "table" then
      currentItemSave = followIndex;
    end
  elseif Contains(currentBagKind, EThings.LuckyBag, EThings.Furnace, EThings.SlotMachine, EThings.Poke) then
    currentItemId = bagIndex;
  end
  
  local itemSave = nil;
  if not Contains(currentBagKind, EThings.None, EThings.LuckyBag, EThings.Furnace, EThings.SlotMachine, EThings.LockBlissBag) then
    itemSave = Item.GetBagItem(currentBagKind, currentBagIndex, currentFollowIndex);
  elseif currentItemSave ~= nil then
    itemSave = currentItemSave;
  end
  
  if itemSave ~= nil then
    currentItemId = itemSave.Id;
  end
  
  currentClickEvents[1] = clickEvent1;
  currentClickEvents[2] = clickEvent2;
  currentClickEvents[3] = clickEvent3;
  currentClickEvents[4] = clickEvent4;

  buttomFunctions[1].text_Name.text = funName1 or "";
  buttomFunctions[2].text_Name.text = funName2 or "";
  buttomFunctions[3].text_Name.text = funName3 or "";
  buttomFunctions[4].text_Name.text = funName4 or "";

  for i = 1, 4 do
    buttomFunctions[i].event.gameObject:SetActive(currentClickEvents[i] ~= nil);
  end

  rightFunctions[1].text_Name.text = funName1 or "";
  rightFunctions[2].text_Name.text = funName2 or "";
  rightFunctions[3].text_Name.text = funName3 or "";
  rightFunctions[4].text_Name.text = funName4 or "";

  for i = 1, 4 do
    rightFunctions[i].event.gameObject:SetActive(currentClickEvents[i] ~= nil);
  end

  table.Clear(exchangeSelcets);
  
  this.UpdateUI();
  
  return true;
end

function UIItemInfo.OnClose(clearStack)
  jmpDrawer_RoleRectTransform.localScale = originScale;
  rawImage_RoleGround.enabled = true;

  jmpDrawer_Role:Disable();

  this.SetSortOrder(UISortingOrder.Hint);
  
  table.Clear(currentClickEvents);

  if clearStack ~= false then
    table.Clear(uiParamaters);
  end

  Hotkey.Close(EUseSource.UIItemInfo);
  
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
  
  return true;
end

function UIItemInfo.Update()
  if dirty <= 0 then return end
  dirty = dirty - 1;

  if dirty >= 3 then
    sizeFitter_InfoBG:SetDirty();
  else
    sizeFitter_BG:SetDirty();
  end
end

function UIItemInfo.UpdateStar(itemData)
  gameObject_Star:SetActive(itemData.kind == EItemKind.Myth or itemData.kind == EItemKind.Enchant);
  
  for k, _ in pairs(Image_Star) do
    Image_Star[k]:SetActive(false);
  end
  
  if itemData.threshold > 0 then
    for i = 1, itemData.threshold do
      if Image_Star[i] ~= nil then
        Image_Star[i]:SetActive(true);
      end
    end
  end
end

function UIItemInfo.UpdateUI()
  local itemSave = nil;
  if not Contains(currentBagKind, EThings.None, EThings.LuckyBag, EThings.Furnace, EThings.SlotMachine, EThings.LockBlissBag, EThings.Poke) then
    itemSave = Item.GetBagItem(currentBagKind, currentBagIndex, currentFollowIndex);
  elseif currentItemSave ~= nil then
    itemSave = currentItemSave;
  end
  
  if itemSave ~= nil then
    currentItemId = itemSave.Id;
  end

  local tempText = nil;
  local itemData = nil;

  if currentBagKind == EThings.EvolutionSelect then
    text_Name.transform.parent.gameObject:SetActive(false);
    tempText = string.Get(22304);
  else
    text_Name.transform.parent.gameObject:SetActive(true);
  end
  
  if not Contains(currentBagKind, EThings.LuckyBag, EThings.Furnace, EThings.SlotMachine, EThings.LockBlissBag, EThings.Poke) then
    itemData = itemDatas[currentItemId];
  end

  local previewRole = false;
  previewNpcId = 0;

  if itemData ~= nil then
    text_Name.text = itemData:GetName(true);
  
    if itemSave == nil then
      item:SetItem(currentItemId);
    else
      item:SetItem(currentItemId, itemSave.quant, itemSave);
    end
  
    local result;
  
    --star level
    this.UpdateStar(itemData);
    
    --物品說明
    if Contains(itemData.specialAbility, EItemUseKind.WeaponRecipe, EItemUseKind.RandomWeaponRecipe)then --專武兌換類的多顯示碎片數量
      tempText = string.Concat(string.GetColorText(itemData.description, Color.Coffee2), "\n", string.format(string.Get(22853), RoleCount.Get(ERoleCount.SWeaponDebris)));
    else
      tempText = string.GetColorText(itemData.description, Color.Coffee2);
    end
  
    --物品刪除時間
    result = itemData:GetDelTime(itemSave);
    if not string.IsNullOrEmpty(result) then
      tempText = string.Concat(string.GetColorText(result, Color.Red), "\n", tempText);
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
    end
  
    --等級限制
    result = itemData:GetLevelText();
    if not string.IsNullOrEmpty(result) then
      tempText = string.Concat(tempText, "\n", result);
    end
    
    if itemData.kind ~= EItemKind.ExclusiveWeapon then
      --基本數值
      result = itemData:GetAttributeText(itemSave);
      if not string.IsNullOrEmpty(result) then
        tempText = string.Concat(tempText, "\n", result);
      end
    
      --主屬性(地水火風)
      result = itemData:GetMainElementText(itemSave);
      if not string.IsNullOrEmpty(result) then
        tempText = string.Concat(tempText, "\n", string.GetColorText(result, Color.ItemAtt));
      end
    else
      --專武
      result = ExclusiveWeapon.GetAttributeText(currentItemId, itemSave);
      if not string.IsNullOrEmpty(result) then
        tempText = string.Concat(tempText, "\n", result);
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
      end
    end
  
    --附加屬性
    result = itemData:GetElementText(itemSave);
    if not string.IsNullOrEmpty(result) then
      tempText = string.Concat(tempText, "\n", string.GetColorText(result, Color.ItemAtt));
    end
  
    --神話裝主屬性
    result = itemData:GetGodMainAttrText(itemSave);
    if not string.IsNullOrEmpty(result) then
      tempText = string.Concat(tempText, "\n",  result);
    end
  
    --神話裝子屬性
    result = itemData:GetGodSubAttrText(itemSave);
    if not string.IsNullOrEmpty(result) then
      tempText = string.Concat(tempText, "\n",  result);
    end
  
    --強化階層
    result = itemData:GetTrainLvText(itemSave);
    if not string.IsNullOrEmpty(result) then
      tempText = string.Concat(tempText, "\n", string.GetColorText(result, Color.ItemAtt));
    end
  
    --強化靈石
    result = itemData:GetStoneText(itemSave);
    if not string.IsNullOrEmpty(result) then
      tempText = string.Concat(tempText, "\n", string.GetColorText(result, Color.ItemAtt));
    end

    --天官裝備
    result = itemData:GetTianGuanText(itemSave);
    if not string.IsNullOrEmpty(result) then
      tempText = string.Concat(tempText, "\n", string.GetColorText(result, Color.ItemAtt));
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
    end
  
    --抵抗
    result = itemData:GetProofText(itemSave);
    if not string.IsNullOrEmpty(result) then
      tempText = string.Concat(tempText, "\n", string.GetColorText(result, Color.ItemAtt));
    end
  
    --靈性裝備
    result = itemData:GetSpiritualityText(itemSave);
    if not string.IsNullOrEmpty(result) then
      tempText = string.Concat(tempText, "\n", string.GetColorText(result, Color.ItemAtt));
    end

    --專武強化
    local role = Role.GetRole(EHuman.FollowNpc, Role.playerId, currentFollowIndex);
    local isRight = ExclusiveWeapon.CheckExclusiveWarrior(currentItemId, role);
    result = ExclusiveWeapon.GetEnhanceText(currentItemId, itemSave, isRight);
    if not string.IsNullOrEmpty(result) then
      tempText = string.Concat(tempText, "\n", result);
    end
  
    --非紋章類別
    result = itemData:GetNoneRuneText();
    if not string.IsNullOrEmpty(result) then
      tempText = string.Concat(tempText, "\n", string.GetColorText(result, Color.ItemAtt));
    end
  
    --收集
    result = itemData:GetCollectText();
    if not string.IsNullOrEmpty(result) then
      tempText = string.Concat(tempText, "\n", string.GetColorText(result, Color.ItemLimit));
    end
  
    --套裝
    result = itemData:GetSuitText(currentBagKind, currentFollowIndex);
    if not string.IsNullOrEmpty(result) then
      tempText = string.Concat(tempText, "\n", result);
    end
  
    --升階
    result = itemData:GetReinforcedText(itemSave);
    if not string.IsNullOrEmpty(result) then
      tempText = string.Concat(tempText, "\n", result);
    end

    --洗鍊
    result = itemData:GetAffixText(itemSave);
    if not string.IsNullOrEmpty(result) then
      tempText = string.Concat(tempText, "\n", result);
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
    end

    --使用限制
    result = itemData:GetRestrictText();
    if not string.IsNullOrEmpty(result) then
      tempText = string.Concat(tempText, "\n", string.GetColorText(result, Color.ItemLimit));
    end
  
    --轉生專用
    result = itemData:GetTurnText();
    if not string.IsNullOrEmpty(result) then
      tempText = string.Concat(tempText, "\n", string.GetColorText(result, Color.ItemLimit));
    end
  
    --限制使用次數(roleCount)
    result = itemData:GetRoleCountLimitText(itemSave);
    if not string.IsNullOrEmpty(result) then
      tempText = string.Concat(tempText, "\n", result);
    end
  
    --損壞度
    result = itemData:GetDamageText(itemSave);
    if not string.IsNullOrEmpty(result) then
      tempText = string.Concat(tempText, "\n", result);
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
    end

    --弓類裝備
    result = itemData:GetBowText();
    if not string.IsNullOrEmpty(result) then
      tempText = string.Concat(tempText, "\n", string.GetColorText(result, Color.ItemLimit));
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
    end
  
    --無法使用說明
    result = itemData:GetCantUseText();
    if not string.IsNullOrEmpty(result) then
      tempText = string.Concat(tempText, "\n", string.GetColorText(result, Color.Red));
    end
  
    --神話裝
    result = itemData:GetMythTitle(itemSave);
    if not string.IsNullOrEmpty(result) then
      tempText = string.Concat(tempText, "\n",  string.GetColorText(result, Color.ItemLimit));
    end

    --裝備預覽
    if (Item.IsEquip(itemData.fitType) or Item.IsStyle(itemData.fitType)) or Item.IsOutfitStyle(itemData.fitType) and Role.player ~= nil and itemData.picId[Role.player.data.sex] ~= 0 then
      local playerData = PlayerData.Copy(Role.player.data);
      playerData.equips[itemData.fitType] = itemData.Id;

      if Between(itemData.fitType, EItemFitType.Equip_Head, EItemFitType.Equip_Boots) then
        playerData.equips[itemData.fitType + 6] = 0;
        playerData.equips[itemData.fitType + 11] = 0;
      elseif Between(itemData.fitType,EItemFitType.Style_Head , EItemFitType.Style_Boots) then
        playerData.equips[itemData.fitType + 5] = 0;
      elseif Between(itemData.fitType,EItemFitType.OutfitStyle_Head , EItemFitType.OutfitStyle_Boots) then
        playerData.equips[itemData.fitType] = 0;
      end
  
      jmpDrawer_Role:GenerateAndDraw(playerData:GetAtlasParams(Role.player.titleId, ERolePose.Prepare + 1));
      jmpDrawer_Role.offsetY = 64;
  
      local styleId = 0;
      if Item.IsStyle(itemData.fitType) then
        local styleFinded = false;
        for k, v in pairs(collectStyleDatas) do
          for i = 1, 5 do
            if v.itemId[i] == itemData.Id then
              styleId = k;
              if CollectStyle.CheckEquiped(k, i) then
                styleFinded = true;
                break;
              end
            end
          end
      
          if styleFinded then
            break;
          end
        end
  
        if fashionStressDatas[itemData.Id] == nil then
          local equipCount, count = CollectStyle.GetCollectCount(styleId);
          if styleFinded then
            tempText = string.Concat(tempText, "\n", string.GetColorText(string.Concat(string.Get(23305), " (", equipCount, "/", count, ")"), Color.Blue));
          else
            tempText = string.Concat(tempText, "\n", string.GetColorText(string.Concat(string.Get(23304), " (", equipCount, "/", count, ")"), Color.Red));
          end
        end
      end

      previewRole = true;

    --坐騎預覽
    elseif itemData.kind == EItemKind.SpecialAbility and itemData.specialAbility == EItemUseKind.Mounts then
      local npcData = npcDatas[itemData.spare3];
      if npcData ~= nil then
        local offsetX, offsetY = npcData:GetOffset();
        
        jmpDrawer_Role:GenerateAndDraw(npcData:GetAtlasParams(ERolePose.Prepare + 1));
        jmpDrawer_Role.offsetY = offsetY + 64;

        previewRole = true;
      end
  
      if Mounts.HaveCollection(itemData.spare3) then
        tempText = string.Concat(tempText, "\n", string.GetColorText(string.Get(23305), Color.Blue));
      else
        tempText = string.Concat(tempText, "\n", string.GetColorText(string.Get(23304), Color.Red));
      end

    --畫像預覽
    elseif itemData.kind == EItemKind.SpecialAbility and itemData.specialAbility == EItemUseKind.NpcPicture then
      local npcData = npcDatas[itemData.spare3];
      if npcData ~= nil then
        local offsetX, offsetY = npcData:GetOffset();
        
        jmpDrawer_Role:GenerateAndDraw(npcData:GetAtlasParams(ERolePose.Prepare + 1));
        jmpDrawer_Role.offsetY = offsetY + 64;

        previewRole = true;
        previewNpcId = itemData.spare3;
      end
  
    --金鎖片預覽
    elseif Contains(itemData.kind, EItemKind.NpcTurn, EItemKind.NpcTurn2) then
      local npcData = npcDatas[itemData.attribute[2].value];
      if npcData ~= nil then
        local offsetX, offsetY = npcData:GetOffset();
        
        jmpDrawer_Role:GenerateAndDraw(npcData:GetAtlasParams(ERolePose.Prepare + 1));
        jmpDrawer_Role.offsetY = offsetY + 64;

        previewRole = true;
        previewNpcId = itemData.attribute[2].value;
  
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
      end
      
    --Elf預覽
    elseif Contains(itemData.kind, EItemKind.Elf) then
      local elfData = elfDatas[itemData.spare3];
      if elfData == nil then return end
      
      if BitFlag.Get(elfData.flag) then
        tempText = string.Concat(tempText, "\n", string.GetColorText(string.Get(23305), Color.Blue));
      else
        tempText = string.Concat(tempText, "\n", string.GetColorText(string.Get(23304), Color.Red));
      end
  
      if elfData.baseExp > 100 then
        tempText = string.Concat(tempText, "\n", string.format(string.Get(23750), (elfData.baseExp - 100) / 100));
      elseif elfData.baseExp == 100 then
        tempText = string.Concat(tempText, "\n", string.format(string.Get(23750), 1));
      else
        tempText = string.Concat(tempText, "\n", string.format(string.Get(24362), (100 - elfData.baseExp) / 100));
      end
  
      local openString = "";
      for i = 1, 3 do
        openString = string.format(string.Get(24124), elfData.openLv[i])
        tempText = string.Concat(tempText, "\n", string.GetColorText(string.Concat(ItemData.GetAttrText(elfData.attr[i]), " + ", elfData.value[i], openString), Color.DarkGreen));
      end

    --家具預覽
    elseif itemData.kind == EItemKind.Furniture then
      jmpDrawer_RoleRectTransform.localScale = Vector3.New(1, 1, 1);
      rawImage_RoleGround.enabled = false;

      local furnitureInfo = furnitureDatas[itemData.spare3];
      local npcData = npcDatas[furnitureInfo.Id];
      if npcData ~= nil then
        local offsetX, offsetY = npcData:GetOffset();

        jmpDrawer_Role:GenerateAndDraw(npcData:GetAtlasParams());
        jmpDrawer_Role.offsetY = offsetY + 64;

        previewRole = true;
      end
    end
  else
    gameObject_Star:SetActive(false);
  end

  if itemData ~= nil and itemSave ~= nil and currentBagKind ~= EThings.None and Item.IsTypeOfEquips(itemData.fitType)
    and not UIStatus.IsCurrentTag(EUIStatusTag.OutfitStyle) and not UI.IsVisible(UIMarket) then
    image_lock.gameObject:SetActive(true);
    if itemSave.isLock then
      image_lock.sprite = UI.GetSprite("but176");
    else
      image_lock.sprite = UI.GetSprite("but177");
    end
  else
    image_lock.gameObject:SetActive(false);
  end

  --角色預覽
  if previewRole then
    rawImage_RoleGround.gameObject:SetActive(true);
  else
    jmpDrawer_Role:Disable();
    rawImage_RoleGround.gameObject:SetActive(false);
  end

  --武將預覽按鈕
  if npcDatas[previewNpcId] ~= nil then
    for i = 1, 4 do
      if currentClickEvents[i] == this.PreviewNpc then
        break;
      elseif currentClickEvents[i] == nil then
        buttomFunctions[i].text_Name.text = string.Get(98006);
        buttomFunctions[i].event.gameObject:SetActive(true);
      
        rightFunctions[i].text_Name.text = string.Get(98006);
        rightFunctions[i].event.gameObject:SetActive(true);

        currentClickEvents[i] = this.PreviewNpc;
        break;
      end
    end
  end

  if not string.IsNullOrEmpty(tempText) then
    text_Info.gameObject:SetActive(true);
    text_Info.text = tempText;
  elseif currentBagKind == EThings.LockBlissBag then
    text_Info.gameObject:SetActive(true);
    text_Info.text = string.GetColorText(string.Get(22184), Color.Coffee2);
  else
    text_Info.gameObject:SetActive(false);
  end

  if Contains(currentBagKind, EThings.LuckyBag, EThings.LockBlissBag) or
          BlissBagData.IsBlissBag(currentItemId) or
          (itemData ~= nil and Contains(itemData.specialAbility, EItemUseKind.BlissBagView, EItemUseKind.Exchange, EItemUseKind.WeaponRecipe)) or
          Contains(currentBagKind, EThings.Furnace, EThings.SlotMachine, EThings.EvolutionSelect, EThings.Poke) then
    rectTransform_BlissBag.gameObject:SetActive(true);

    text_BlissBag.gameObject:SetActive(true);

    gameObject_ButtomFunction:SetActive(currentClickEvents[1] ~= nil or currentClickEvents[2] ~= nil or currentClickEvents[3] ~= nil or currentClickEvents[4] ~= nil);
    gameObject_RightFunction:SetActive(false);

    local blissBagData = nil;
    local totalCount = 0;
    local getCount = 0;

    if currentBagKind == EThings.LuckyBag then
      blissBagData = luckyBagDatas[currentItemId];

      totalCount, getCount = blissBagData:GetCount();

      text_Name.text = blissBagData:GetName();

      item:SetItem(0);
      item:SetIcon(true);
      item:SetIconTexture(blissBagData.icon);

      elseif itemData ~= nil and itemData.specialAbility == EItemUseKind.BlissBagView then
      blissBagData = blissBagDatas[currentItemId];

      allBlissBagItem = {};

      local tempBlissBag;
      local blissBagItem;
      local currentBlissBag = BlissBagData.GetAllBlissBagItem(currentItemId);
      local item = itemDatas[currentItemId];

      for currentKey, currentValue in pairs(currentBlissBag) do
        tempBlissBag = BlissBagData.GetAllBlissBagItem(currentValue.itemId);
        for tempKey, tempValue in pairs(tempBlissBag) do
          blissBagItem = {};
          blissBagItem.itemId = tempValue.itemId;
          blissBagItem.count = tempValue.count;
          if item.threshold == 0 then
            blissBagItem.pr = 0;
          else
            blissBagItem.pr = currentValue.pr * 0.0001 * tempValue.pr * 0.0001;
          end
          blissBagItem.kind = tempValue.kind;
          blissBagItem.broadcast = tempValue.broadcast;
          table.insert(allBlissBagItem, blissBagItem);
        end
      end

      totalCount = table.Count(allBlissBagItem);
      getCount = blissBagData.kindCount;

    elseif currentBagKind == EThings.Furnace then
      text_Name.text = UIFurnace.GetTagName();
      item:SetItem(currentItemId);
      table.Clear(furnacePr);

      local kind = math.floor(currentFollowIndex / 100);  --1:武將,2:裝備,3:轉生裝備

      local subPageKind = math.fmod(currentFollowIndex, 100);  -- 1:武將,2:裝備,3:黃金武將,4:黃金裝備,5:一般轉生物,6:黃金轉生物
      for i, v in pairs(furnaceSlotDatas) do
        if v.kind == kind then
          v.pr = UIFurnace.GetSumOfAwardPro(subPageKind, v.awardKind);
          if v.pr > 0 then
            if v.bOpen == 1 then  --有日期的
              if FurnaceSlotData.IsInTime(v)then
                v.sort = EFurnaceSort.Active;
                table.insert(furnacePr, v);
              end
            elseif v.bOpen == 2 then --永久上架
              if FurnaceSlotData.IsInTime(v)then
                v.sort = EFurnaceSort.Normal;
                table.insert(furnacePr, v);
              end
            else
              v.sort = EFurnaceSort.Normal;
              table.insert(furnacePr, v);
            end
          end
        end
      end

      totalCount = table.Count(furnacePr);

      table.sort(furnacePr,
        function(a, b)
          if a.sort == b.sort then
            return a.pr < b.pr;
          else
            return a.sort > b.sort;
          end
        end
      );

      getCount = 0;
    elseif currentBagKind == EThings.SlotMachine then
      text_Name.text = string.Get(20708);
      item:SetItem(currentItemId);

      totalCount = table.Count(UISlotMachine.awards);

      getCount = 0;

    elseif currentBagKind == EThings.Poke then 
      text_Name.text = string.Get(22453);
      item:SetItem(currentItemId);

      totalCount = table.Count(UIPoke.awards);

      getCount = 0;

    elseif itemData ~= nil and Contains(itemData.specialAbility, EItemUseKind.Exchange, EItemUseKind.WeaponRecipe)then
      blissBagData = exchangeDatas[currentItemId];
      totalCount = table.Count(blissBagData);
      getCount = itemData.elementValue;

    elseif currentBagKind == EThings.LockBlissBag then
      itemSave = Item.GetBagItem(EThings.Bag, currentBagIndex, currentFollowIndex);

      itemData = itemDatas[itemSave.Id];

      if itemSave == nil or itemData == nil then return end

      currentItemId = itemSave.Id;

      blissBagData = keys;
      totalCount = table.Count(keys);
      getCount = itemData.elementValue;

    elseif currentBagKind == EThings.EvolutionSelect then
      blissBagData = itemEvolutionDatas[currentBagIndex][currentFollowIndex];
      totalCount = table.Count(blissBagData);
      getCount = 1;

    else
      blissBagData = blissBagDatas[currentItemId];

      totalCount = table.Count(blissBagData.items);
      getCount = blissBagData.kindCount;
    end

    local showColumn = math.min(math.ceil(totalCount / itemPerColumn), 3.09);

    if getCount == 0 then
      text_BlissBag.text = "";
    else
      if itemData ~= nil then
        if Contains(itemData.specialAbility, EItemUseKind.Exchange, EItemUseKind.WeaponRecipe) then
          text_BlissBag.text = string.format(string.Get(23971), getCount);
      
        else
          text_BlissBag.text = string.format(string.Get(80250 ), getCount);
        end
      else
        text_BlissBag.text = "";
      end
    end

    local height = 320
    if totalCount < itemPerColumn then
      height = math.clamp(10 + (totalCount * 62), 258, 320);
    end

    rectTransform_BlissBag.sizeDelta = Vector2.New((305 * showColumn) + 5 + 7, height);
    rectTransform_BlissBagScroll.sizeDelta = Vector2.New((305 * showColumn) + 5, 311);

    scrollContent_BlissBag:Reset(totalCount);

  else
    rectTransform_BlissBag.gameObject:SetActive(false);

    text_BlissBag.gameObject:SetActive(false);

    gameObject_ButtomFunction:SetActive(false);
    gameObject_RightFunction:SetActive(currentClickEvents[1] ~= nil or currentClickEvents[2] ~= nil or currentClickEvents[3] ~= nil or currentClickEvents[4] ~= nil);
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
  end
  
  UIValueBar.Active(sizeFitter_InfoBG.transform, nil, false);
  if itemData ~= nil then
    if UI.IsVisible(UIStatus) and (itemData.attribute[1].kind == 25 or itemData.attribute[1].kind == 26 or itemData.specialAbility == 92) then
      UIValueBar.Active(sizeFitter_InfoBG.transform, itemData.restrict, true);
    end
  end

  dirty = 4;
end

function UIItemInfo.OnClick_Function(uiEvent)
  if currentClickEvents[uiEvent.parameter] == nil then return end

  currentClickEvents[uiEvent.parameter](currentBagKind, currentBagIndex, currentFollowIndex);
end

function UIItemInfo.OnClick_DoLock()
  local itemSave = nil;
  if currentItemSave == nil then
    itemSave = Item.GetBagItem(currentBagKind, currentBagIndex, currentFollowIndex);
  else
    itemSave = currentItemSave;
  end

  if itemSave == nil or currentBagIndex == nil or currentBagKind == nil then return end


  --C:023-087 <物品鎖定> 物品背包總類(1) +物品背包索引(2) +武將索引(1) +鎖定(1)[true:不能刪除 false:可以刪除]
  sendBuffer:Clear();
  sendBuffer:WriteByte(currentBagKind);
  sendBuffer:WriteUInt16(currentBagIndex);
  sendBuffer:WriteByte(currentFollowIndex);
  sendBuffer:WriteBoolean(not itemSave.isLock);
  Network.Send(23, 87, sendBuffer);
  
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
end

function UIItemInfo.OnClick_Close()
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
  UI.Close(UIItemInfo, false);

  local stackCount = table.maxn(uiParamaters);
  if stackCount > 0 then
    local uiParamater = uiParamaters[stackCount];

    table.remove(uiParamaters, stackCount);

    UI.Open(UIItemInfo, unpack(uiParamater));
  end
end

function UIItemInfo.OnClick_Item(uiEvent)
  local itemData = itemDatas[uiEvent.parameter];

  if itemData == nil then return end
  if itemData:IsDirectUse() then return end
  if itemData:IsTsMoney() then return end

  UI.Close(UIItemInfo, false);

  table.insert(uiParamaters, currentUIParamater);

  UIItemInfo.Show(uiEvent.parameter);
end

function UIItemInfo.OnClick_Select(uiEvent)
  local selectIndex = uiEvent.parameter;

  if Contains(currentBagKind, EThings.LockBlissBag, EThings.EvolutionSelect) then
    if exchangeSelcets[selectIndex] == true then
      exchangeSelcets[selectIndex] = false;
    else
      --單選
      for k in pairs(exchangeSelcets) do
        exchangeSelcets[k] = false;
      end

      exchangeSelcets[selectIndex] = true;
    end

    scrollContent_BlissBag:Refresh();
  else
    local itemData = itemDatas[currentItemId];
    if itemData == nil then return end
    if itemData.specialAbility ~= EItemUseKind.Exchange and itemData.specialAbility ~= EItemUseKind.WeaponRecipe then return end


    local maxSelectCount = itemData.elementValue;

    if exchangeSelcets[selectIndex] == true then
      exchangeSelcets[selectIndex] = false;
    else
      if maxSelectCount > 1 then
        --多選
        local selectCount = 0
        for k, v in pairs(exchangeSelcets) do
          if v then
            selectCount = selectCount + 1;
          end
        end

        if selectCount >= maxSelectCount then
          ShowCenterMessage(string.Get(21103));
          return;
        end
      else
        --單選
        for k in pairs(exchangeSelcets) do
          exchangeSelcets[k] = false;
        end
      end

      exchangeSelcets[selectIndex] = true;
    end

    scrollContent_BlissBag:Refresh();
  end
end

function UIItemInfo.PreviewNpc()
  if npcDatas[previewNpcId] == nil then return end

  UI.Open(UINpcInfo, previewNpcId);
end

function UIItemInfo.OnInitialize_ScrollContent_BlissBag(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_BlissBag[itemIndex] = {};

    scrollItems_BlissBag[itemIndex].gameObject = scrollItems[itemIndex].gameObject;
    scrollItems_BlissBag[itemIndex].event = scrollItems[itemIndex]:GetComponent("UIEvent");
    scrollItems_BlissBag[itemIndex].event:SetListener(EventTriggerType.PointerClick, this.OnClick_Item);

    scrollItems_BlissBag[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_BlissBag[itemIndex].text_Pr = scrollItems[itemIndex]:Find("Text_Pr"):GetComponent("Text");
    scrollItems_BlissBag[itemIndex].text_Date = scrollItems[itemIndex]:Find("Text_Date"):GetComponent("Text");
    scrollItems_BlissBag[itemIndex].item = UIItemController.New(scrollItems[itemIndex]:Find("Image_ItemBG"));

    scrollItems_BlissBag[itemIndex].event_Select = scrollItems[itemIndex]:Find("Image_Select"):GetComponent("UIEvent");
    scrollItems_BlissBag[itemIndex].event_Select:SetListener(EventTriggerType.PointerClick, this.OnClick_Select);
    scrollItems_BlissBag[itemIndex].image_Select = scrollItems_BlissBag[itemIndex].event_Select.transform:Find("Image_Select"):GetComponent("Image");
  end
end

function UIItemInfo.OnItemChange_ScrollContent_BlissBag(dataIndex, itemIndex)
  local itemData = itemDatas[currentItemId];

  local blissBagData = nil;
  if currentBagKind == EThings.LuckyBag then
    blissBagData = luckyBagDatas[currentItemId];
  elseif currentBagKind == EThings.Furnace then
    blissBagData = { items = furnacePr };
  elseif currentBagKind == EThings.SlotMachine then
    blissBagData = { items = UISlotMachine.awards };
  elseif currentBagKind == EThings.Poke then
    blissBagData = { items = UIPoke.awards };    
  elseif itemData ~= nil and itemData.specialAbility == EItemUseKind.BlissBagView then
    blissBagData = { items = allBlissBagItem };
  elseif itemData ~= nil and Contains(itemData.specialAbility, EItemUseKind.Exchange, EItemUseKind.WeaponRecipe)then
    blissBagData = { items = exchangeDatas[currentItemId] };
  elseif currentBagKind == EThings.LockBlissBag then
    blissBagData = { items = keys };
  elseif currentBagKind == EThings.EvolutionSelect then
    blissBagData = { items = itemEvolutionDatas[currentBagIndex][currentFollowIndex] }
  else
    blissBagData = blissBagDatas[currentItemId];
  end

  if blissBagData == nil then return false end

  scrollItems_BlissBag[itemIndex].gameObject:SetActive(false);

  local blissBagItem = blissBagData.items[dataIndex + 1];
  if blissBagItem ~= nil then
    local blissBagItemData = itemDatas[blissBagItem.itemId];
    if blissBagItemData ~= nil then
      scrollItems_BlissBag[itemIndex].gameObject:SetActive(true);

      if (itemData ~= nil and itemData.specialAbility == EItemUseKind.Exchange and currentClickEvents[2] == Item.UseItem) or Contains(currentBagKind, EThings.LockBlissBag, EThings.EvolutionSelect)
        or (itemData ~= nil and itemData.specialAbility == EItemUseKind.WeaponRecipe) then
        scrollItems_BlissBag[itemIndex].event_Select.gameObject:SetActive(true);
        scrollItems_BlissBag[itemIndex].event_Select.parameter = dataIndex + 1;

        scrollItems_BlissBag[itemIndex].image_Select.sprite = UI.GetCheckBoxSprite(exchangeSelcets[dataIndex + 1]);
      else
        scrollItems_BlissBag[itemIndex].event_Select.gameObject:SetActive(false);
      end

      scrollItems_BlissBag[itemIndex].text_Date.text = "";

      if Contains(currentBagKind, EThings.LuckyBag, EThings.LockBlissBag, EThings.EvolutionSelect) then
        scrollItems_BlissBag[itemIndex].text_Pr.text = "";

      elseif currentBagKind == EThings.Furnace then
        blissBagItem.count = 1;

        if blissBagItem.pr ~= nil then
          scrollItems_BlissBag[itemIndex].text_Pr.text = string.Concat(string.format("%0.6f", blissBagItem.pr * 100), "%");
        end

        if blissBagItem.bOpen == 1 then
          local startTime = DateTime.New( blissBagItem.OpenYear, blissBagItem.OpenMon, blissBagItem.OpenDay, 0, 0, 0 );
          local endTime = DateTime.New( blissBagItem.CloseYear, blissBagItem.CloseMon, blissBagItem.CloseDay, 0, 0, 0 );
          local date = string.Concat(startTime:ToString("yyyy/MM/dd"), " - ", endTime:ToString("yyyy/MM/dd"));
          scrollItems_BlissBag[itemIndex].text_Date.text = date;
        end

      elseif currentBagKind == EThings.SlotMachine then
        if blissBagItem.pr ~= nil then
          scrollItems_BlissBag[itemIndex].text_Pr.text = string.Concat(blissBagItem.pr * 100, "%");
        end

      elseif currentBagKind == EThings.Poke then
        if blissBagItem.pr ~= nil then
          scrollItems_BlissBag[itemIndex].text_Pr.text = string.Concat(string.format("%0.3f", blissBagItem.pr * 100), "%");
        end

      elseif itemData ~= nil and itemData.specialAbility == EItemUseKind.BlissBagView then
        if blissBagItem.pr == 0 then
          scrollItems_BlissBag[itemIndex].text_Pr.text = "";
        else
          scrollItems_BlissBag[itemIndex].text_Pr.text = string.Concat(blissBagItem.pr * 100, "%");
        end

      elseif itemData ~= nil and (itemData.specialAbility == EItemUseKind.Exchange or itemData.specialAbility == EItemUseKind.WeaponRecipe)then
        scrollItems_BlissBag[itemIndex].text_Pr.text = "";
        
      else
        if itemData ~= nil and itemData.threshold == 0 then
          scrollItems_BlissBag[itemIndex].text_Pr.text = "";
        else
          scrollItems_BlissBag[itemIndex].text_Pr.text = string.Concat(blissBagItem.pr * 0.0001 * 100, "%");
        end 
      end

      scrollItems_BlissBag[itemIndex].text_Name.text = blissBagItemData:GetName(true);

      if currentBagKind == EThings.Furnace and blissBagItem.bOpen == 1 then
        scrollItems_BlissBag[itemIndex].text_Name.text = blissBagItemData:GetName(true);
      end

      scrollItems_BlissBag[itemIndex].item:SetItem(blissBagItem.itemId, blissBagItem.count);
      scrollItems_BlissBag[itemIndex].item:SetEvent(this.OnClick_Item, blissBagItem.itemId);

      scrollItems_BlissBag[itemIndex].event.parameter = blissBagItem.itemId;
    end
  end

  return true;
end