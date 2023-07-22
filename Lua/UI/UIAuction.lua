EAuctionProduct = {
  None = 0,
  Item = 1,
  Npc = 2,
}

EAuctionSort = {
  LowToHigh = 1,
  HighToLow = 2,
}

EAuctionTag = {
  MyAuction = 1,
  Npc = 2,
}

EAuctionProductState = {
  Preparing = 1,
  Selling = 2,
  Sold = 3,
  Expired = 4,
}

UIAuction = {}
local this = UIAuction;

this.name = "UIAuction";
this.uiController = nil;

--ui
local transform_FrameRect;

local gameObject_Sell;
local gameObject_List;
local gameObject_ListInfo;
local gameObject_ProductInfo;

local followNpcs = {};

local scrollContent_Product;
local scrollItems_Product = {};

--var
local currentTag = EAuctionTag.MyAuction;
local currentSubTag = 1;
local currentProductKind = EAuctionProduct.None;
local currentProductId = 0;

local currentSort = EAuctionSort.LowToHigh;

local products = {};

--Test Code
local testProducts = {};
--]]Test Code

function UIAuction.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;
  this.uiController.onClose = this.OnClose;

  local tempEvent;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;

  gameObject_Sell = uiController:FindGameObject("Sell");
  gameObject_List = uiController:FindGameObject("List");
  gameObject_ListInfo = uiController:FindGameObject("ListInfo");
  gameObject_ProductInfo = uiController:FindGameObject("ProductInfo");

  local tempTransform = gameObject_Sell.transform:Find("Image_FollowNpcBG");
  for i = 1, Role.maxFollowNpc do
    local child = tempTransform:Find(string.Concat("Image_FollowNpc (", i, ")"));
    
    followNpcs[i] = {};
    followNpcs[i].text_Name = child:Find("Text_Name"):GetComponent("Text");
    followNpcs[i].text_Hp = child:Find("Text_Hp"):GetComponent("Text");
    followNpcs[i].text_Lv = child:Find("Text_Lv"):GetComponent("Text");
    followNpcs[i].uiCareer = UICareerController.New(child:Find("Career"));

    followNpcs[i].image_State = followNpcs[i].text_Lv.transform:Find("Image_State"):GetComponent("Image");

    followNpcs[i].event_Query = child:Find("Image_Query"):GetComponent("UIEvent");
    followNpcs[i].event_Query:SetListener(EventTriggerType.PointerClick, this.OnClick_QueryNpc);
    followNpcs[i].event_Query.parameter = i;

    followNpcs[i].event_Sell = child:Find("Image_Sell"):GetComponent("UIEvent");
    followNpcs[i].event_Sell:SetListener(EventTriggerType.PointerClick, this.OnClick_SellNpc);
    followNpcs[i].event_Sell.parameter = i;
  end

  scrollContent_Product = uiController:FindScrollContent("ScrollContent_List");
  scrollContent_Product.onInitialize = this.OnInitialize_ScrollContent_Product;
  scrollContent_Product.onItemChange = this.OnItemChange_ScrollContent_Product;
  scrollContent_Product:Initialize(1);

  tempEvent = uiController:FindEvent("Image_Back");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Back);

  tempEvent = uiController:FindEvent("Image_Refresh");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Refresh);
end

function UIAuction.OnOpen()
  currentSort = EAuctionSort.LowToHigh;

  table.Clear(products);
  this.UpdateUI(EAuctionTag.MyAuction, 1, EAuctionProduct.None, 0, nil);
  
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

function UIAuction.OnClose()
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
  if currentTag == EAuctionTag.MyAuction and currentSubTag == 2 then
    UI.Close(UIBag);
  end

  return true;
end

function UIAuction.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(21480), this.OnClick_Close, nil, this.OnClick_Tag, auctionTagDatas, currentTag, currentSubTag);

    table.Clear(products);
    this.RequestList(currentTag, currentSubTag, 0);
  end
end

function UIAuction.RequestList(mainTag, subTag, index)
  if mainTag == EAuctionTag.MyAuction and subTag == 2 then
    this.UpdateUI(mainTag, subTag, EAuctionProduct.None, 0);
    return;
  end

  --C:096-004 <查詢分類> +主類別(1) +子類別(1) +開始索引(1)
  sendBuffer:Clear();
  sendBuffer:WriteByte(mainTag);
  sendBuffer:WriteByte(subTag);
  sendBuffer:WriteByte(index);
  Network.Send(96, 4, sendBuffer);

  --Test Code
  CGTimer.DoFunctionDelay(0.5,
    function()
      local newProducts = {};

      if mainTag == EAuctionTag.MyAuction then
        local count = 0;
        local followNpcs = Role.GetFollowNpcs(Role.playerId);
        for k, v in pairs(followNpcs) do
          local productInfo = {};
          productInfo.sn = math.random(1000000000, 9999999999);
          productInfo.price = math.random(10, 999999999);
          productInfo.time = CGTimer.serverTime;
          productInfo.state = math.random(EAuctionProductState.Preparing, EAuctionProductState.Expired);
          productInfo.kind = EAuctionProduct.Npc;
          productInfo.id = v.npcId;
          productInfo.level = v:GetAttribute(EAttribute.Lv);

          table.insert(newProducts, productInfo);
      
          count = count + 1;
        end

        local bagItems, maxCount = Item.GetBag(EThings.Bag);
        for i = 1, maxCount do
          if bagItems[i] ~= nil then
            local productInfo = {};
            productInfo.sn = math.random(1000000000, 9999999999);
            productInfo.price = math.random(10, 999999999);
            productInfo.time = CGTimer.serverTime;
            productInfo.state = math.random(EAuctionProductState.Preparing, EAuctionProductState.Expired);
            productInfo.kind = EAuctionProduct.Item;
            productInfo.id = bagItems[i].Id;
            productInfo.count = bagItems[i].quant;

            table.insert(newProducts, productInfo);
        
            count = count + 1;
            if count >= 10 then
              break;
            end
          end
        end

      elseif mainTag == EAuctionTag.Npc then
        local element = nil;
        if subTag == 1 then
          element = 1;
        elseif subTag == 2 then
          element = 2;
        elseif subTag == 3 then
          element = 3;
        elseif subTag == 4 then
          element = 4;
        elseif subTag == 5 then
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
          element = 5;
        elseif subTag == 6 then
          element = 7;
        elseif subTag == 7 then
          element = 8;
        end

        local count = 0;
        local data = nil;
        for i = index + 1, table.maxn(npcDatas) do
          data = npcDatas[i];
          if data ~= nil and
            data.element == element then

            local productInfo = {};
            productInfo.kind = EAuctionProduct.Npc;
            productInfo.id = i;
            productInfo.count = math.random(1, 50);

            table.insert(newProducts, productInfo);

            count = count + 1;
            if count >= 10 then
              break;
            end
          end
        end

      else
        local count = 0;
        local data = nil;
        for i = index + 1, table.maxn(itemDatas) do
          data = itemDatas[i];
          if data ~= nil and
            data.auctionTag == mainTag and
            data.auctionSubTag == subTag then

            local productInfo = {};
            productInfo.kind = EAuctionProduct.Item;
            productInfo.id = i;
            productInfo.count = math.random(1, 50);

            table.insert(newProducts, productInfo);

            count = count + 1;
            if count >= 10 then
              break;
            end
          end
        end
      end

      this.UpdateUI(mainTag, subTag, EAuctionProduct.None, 0, newProducts);
    end
  );
  --]]Test Code
end

function UIAuction.RequestProduct(kind, id, index)
  --C:096-005 <查詢商品簡易資料> +排序方式(1) +商品種類(1)
  --  排序方式 1:價格低至高 2:價格高至低
  --  商品種類 1:物品 +物品ID(2) +開始索引(1)
  --  商品種類 2:武將 +武將ID(2) +開始索引(1)
  sendBuffer:Clear();
  sendBuffer:WriteByte(currentSort);
  sendBuffer:WriteByte(kind);
  sendBuffer:WriteUInt16(id);
  sendBuffer:WriteUInt16(index);
  Network.Send(96, 5, sendBuffer);
  
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

  --Test Code
  CGTimer.DoFunctionDelay(0.5,
    function()
      if currentSort == EAuctionSort.LowToHigh then
        table.sort(testProducts,
          function(a, b)
            return a.price < b.price;
          end
        );
      elseif currentSort == EAuctionSort.HighToLow then
        table.sort(testProducts,
          function(a, b)
            return a.price > b.price;
          end
        );
      end
      
      local newProducts = {};
      local count = 0;
      for k, v in pairs(testProducts) do
        if v.price > index then
          table.insert(newProducts, v);
    
          count = count + 1;
          if count >= 10 then
            break;
          end
        end
      end
    
      this.UpdateUI(nil, nil, kind, id, newProducts);
    end
  );
  --]]Test Code
end

function UIAuction.UpdateUI(mainTag, subTag, productKind, productId, newProducts)
  if mainTag ~= nil then
    currentTag = mainTag;
  end

  if subTag ~= nil then
    currentSubTag = subTag;
  end

  UIFrame.SwitchTab(currentTag, currentSubTag, false);

  if productKind ~= nil then
    currentProductKind = productKind;
  end

  if productId ~= nil then
    currentProductId = productId;
  end

  local reset = table.maxn(products) == 0;
  local dirty = false;
  if newProducts ~= nil and table.maxn(newProducts) > 0 then
    for k, v in pairs(newProducts) do
      local repeated = false;
      for kk, vv in pairs(products) do
        if v.sn == nil and v.kind == vv.kind and v.id == vv.id then
          repeated = true;
          break;
        end
      end

      if not repeated then
        dirty = true;
        table.insert(products, v);
      end
    end
  end

  if currentTag == EAuctionTag.MyAuction and currentSubTag == 2 and table.maxn(products) == 0 then
    gameObject_Sell:SetActive(true);
    gameObject_List:SetActive(false);

    for i = 1, Role.maxFollowNpc do
      local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, i);
      if followNpc ~= nil then
        if followNpc.data.canGrow == 0 then
          followNpcs[i].text_Name.text = string.GetColorText(followNpc.name, Color.Orange);
        elseif followNpc.data.canGrow == 2 then
          followNpcs[i].text_Name.text = string.GetColorText(followNpc.name, Color.MissionNPC);
        else
          followNpcs[i].text_Name.text = followNpc.name;
        end

        if followNpc.data.isRetire then
          followNpcs[i].text_Hp.text = string.Concat("0 / ", followNpc:GetAttribute(EAttribute.MaxHp));
        else
          followNpcs[i].text_Hp.text = string.Concat(followNpc:GetAttribute(EAttribute.Hp), " / ", followNpc:GetAttribute(EAttribute.MaxHp));
        end

        followNpcs[i].text_Hp.gameObject:SetActive(true);
        followNpcs[i].text_Lv.text = followNpc:GetAttribute(EAttribute.Lv);
        followNpcs[i].text_Lv.gameObject:SetActive(true);

        followNpcs[i].uiCareer:SetCareer(followNpc:GetAttribute(EAttribute.Turn), followNpc:GetAttribute(EAttribute.Element), followNpc:GetAttribute(EAttribute.Career), true);

        if followNpc.data.isRetire then
          followNpcs[i].image_State.gameObject:SetActive(false);
        elseif followNpc == Role.fightNpc then
          followNpcs[i].image_State.gameObject:SetActive(true);
        else
          followNpcs[i].image_State.gameObject:SetActive(false);
        end

        followNpcs[i].event_Query.gameObject:SetActive(true);
        followNpcs[i].event_Sell.gameObject:SetActive(true);
      else
        followNpcs[i].text_Name.text = "";
        followNpcs[i].text_Hp.gameObject:SetActive(false);
        followNpcs[i].text_Lv.gameObject:SetActive(false);

        followNpcs[i].uiCareer:SetCareer();

        followNpcs[i].event_Query.gameObject:SetActive(false);
        followNpcs[i].event_Sell.gameObject:SetActive(false);
      end
    end

    if not UI.IsVisible(UIBag) then
      UI.Open(UIBag,
        function(bagIndex, itemId)
          bagItemId = itemId;
          local funName;
          if Item.IsTypeOfEquips(itemDatas[itemId].fitType) then
            funName = string.Get(20165); --裝備
          else
            funName = string.Get(40314); --使用
          end

          UI.Open(UIItemInfo, EThings.Bag, bagIndex, 0, string.Get(21488), this.OnClick_SellItem, string.Get(21487), this.OnClick_QueryItem);
        end,
        Vector2.New(260, -25),
        false,
        nil,
        function(itemSave)
          if itemSave.isDeliver then return false end
          if itemDatas[itemSave.Id] == nil then return false end
          if itemDatas[itemSave.Id].auctionTag == 0 then return false end
          
          return true;
        end
      );
    end
    
  else
    gameObject_Sell:SetActive(false);
    gameObject_List:SetActive(true);

    if currentTag == EAuctionTag.MyAuction then
      gameObject_ListInfo:SetActive(false);
      gameObject_ProductInfo:SetActive(true);
    else
      gameObject_ListInfo:SetActive(currentProductKind == EAuctionProduct.None);
      gameObject_ProductInfo:SetActive(currentProductKind ~= EAuctionProduct.None);
    end

    if UI.IsVisible(UIBag) then
      UI.Close(UIBag);
    end

    if reset then
      scrollContent_Product:Reset(table.maxn(products));
    elseif dirty then
      scrollContent_Product:Refresh(table.maxn(products));
    end
  end
end

function UIAuction.OnClick_Close()
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
  UI.Close(UIAuction);
  return true;
end

function UIAuction.OnClick_Tag(mainTag, subTag)
  table.Clear(products);
  this.RequestList(mainTag, subTag, 0);

  return false;
end

function UIAuction.OnClick_QueryItem(bagKind, bagIndex, followIndex)
  local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
  if itemSave == nil then return end

  UI.Close(UIItemInfo);
  
  --Test Code
  table.Clear(testProducts);
  for i = 1, math.random(0, 50) do
    testProducts[i] = {};
    testProducts[i].sn = math.random(1000000000, 9999999999);
    testProducts[i].price = math.random(10, 999999999);
    testProducts[i].time = CGTimer.serverTime;
    testProducts[i].kind = EAuctionProduct.Item;
    testProducts[i].id = itemSave.Id;

    if Item.IsTypeOfEquips(itemDatas[itemSave.Id].fitType) then
      testProducts[i].count = 1;
    else
      testProducts[i].count = math.random(1, 999);
    end
  end
  --]]Test Code

  table.Clear(products);
  UIAuction.RequestProduct(EAuctionProduct.Item, itemSave.Id, 0);
end

function UIAuction.OnClick_SellItem(bagKind, bagIndex, followIndex)
  local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
  if itemSave == nil then return end

  UI.Close(UIItemInfo);
  UI.Open(UIAuctionSell, EAuctionProduct.Item, bagIndex);
end

function UIAuction.OnClick_QueryNpc(uiEvent)
  local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, uiEvent.parameter);
  if followNpc == nil then return end

  --Test Code
  table.Clear(testProducts);
  for i = 1, math.random(0, 50) do
    testProducts[i] = {};
    testProducts[i].sn = math.random(1000000000, 9999999999);
    testProducts[i].price = math.random(10, 999999999);
    testProducts[i].time = CGTimer.serverTime;
    testProducts[i].kind = EAuctionProduct.Npc;
    testProducts[i].id = followNpc.npcId;

    testProducts[i].level = math.random(1, Role.playerMaxLv);
  end
  --]]Test Code
  
  table.Clear(products);
  UIAuction.RequestProduct(EAuctionProduct.Npc, followNpc.npcId, 0);
end

function UIAuction.OnClick_SellNpc(uiEvent)
  local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, uiEvent.parameter);
  if followNpc == nil then return end

  for i = EItemFitType.Equip_Head, EItemFitType.Equip_Spec do
    if Item.GetBagItem(EThings.Equip, i, followNpc.index) ~= nil then
      ShowCenterMessage("Have Equip !!");
      return;
    end
  end

  UI.Open(UIAuctionSell, EAuctionProduct.Npc, uiEvent.parameter);
end

function UIAuction.OnClick_Back(uiEvent)
  table.Clear(products);
  this.RequestList(currentTag, currentSubTag, 0);
end

function UIAuction.OnClick_Refresh(uiEvent)
  if currentProductKind ~= EAuctionProduct.None then
    table.Clear(products);
    this.RequestProduct(currentProductKind, currentProductId, 0);
  else
    table.Clear(products);
    this.RequestList(currentTag, currentSubTag, 0);
  end
end

function UIAuction.OnClick_Submit(uiEvent)
  local productInfo = uiEvent.parameter;
  if productInfo == nil then return end
  if productInfo.sn == nil then return end
  
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
  if productInfo.state ~= nil then
    --C:096-002 <下架商品> +商品序號(4)
    sendBuffer:Clear();
    sendBuffer:WriteUInt32(productInfo.sn);
    Network.Send(96, 2, sendBuffer);
    
    --Test Code
    if productInfo.state == EAuctionProductState.Sold then
      ShowCenterMessage("Test Take Money OK !!");
    else
      ShowCenterMessage("Test Cancel OK !!");
    end
    table.RemoveByValue(products, productInfo);
    this.UpdateUI();
    --]]Test Code

  else
    if Role.GetPoint() < productInfo.price then
      ShowCenterMessage(string.Get(80360));
      return;
    end
    
    --C:096-003 <購買商品> +商品序號(4)
    sendBuffer:Clear();
    sendBuffer:WriteUInt32(productInfo.sn);
    Network.Send(96, 3, sendBuffer);
  
    --Test Code
    ShowCenterMessage("Test Buy OK !!");
    table.RemoveByValue(products, productInfo);
    this.UpdateUI();
    --]]Test Code
  end
end

function UIAuction.OnClick_Product(uiEvent)
  local productInfo = uiEvent.parameter;
  if productInfo == nil then return end

  if productInfo.sn == nil then
    --Test Code
    table.Clear(testProducts);
    for i = 1, productInfo.count do
      testProducts[i] = {};
      testProducts[i].sn = math.random(1000000000, 9999999999);
      testProducts[i].price = math.random(10, 999999999);
      testProducts[i].time = CGTimer.serverTime;
      testProducts[i].kind = productInfo.kind;
      testProducts[i].id = productInfo.id;
  
      if testProducts[i].kind == EAuctionProduct.Item then
        if Item.IsTypeOfEquips(itemDatas[productInfo.id].fitType) then
          testProducts[i].count = 1;
        else
          testProducts[i].count = math.random(1, 999);
        end
      elseif testProducts[i].kind == EAuctionProduct.Npc then
        testProducts[i].level = math.random(1, Role.playerMaxLv);
      end
    end
    --]]Test Code

    table.Clear(products);
    this.RequestProduct(productInfo.kind, productInfo.id, 0);

  else
    --C:096-006 <查詢商品詳細資料> +商品序號(4)
    sendBuffer:Clear();
    sendBuffer:WriteUInt32(productInfo.sn);
    Network.Send(96, 6, sendBuffer);
  
    --Test Code
    if productInfo.kind == EAuctionProduct.Item then
      local itemSave = ThingData.New();
      itemSave.Id = productInfo.id; --物品編號
      itemSave.quant = productInfo.count; --物品數量
      itemSave.damage = 0; --物品毀壞度
      itemSave.element = math.random(0, 4); --屬性
      itemSave.elementValue = math.random(0, 255); --屬性值
      itemSave.proofKind = math.random(0, 3); --抵抗
      itemSave.growLv = math.random(0, 255); --成長等級
      itemSave.growExp = 0; --成長經驗值
      itemSave.specialKind = 0; --特殊作用 0:無 1:可交易1次
      itemSave.stoneAttr = math.random(0, Item.MaxStoneAttrKind); --靈石屬性
      itemSave.stoneLv = math.random(1, Item.MaxStoneLv); --靈石強化等級
  
      UIItemInfo.Show(itemSave.Id, itemSave);
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
  
    elseif productInfo.kind == EAuctionProduct.Npc then
      local npcData = npcDatas[productInfo.id];
      local npcInfo = NpcInfo.New();
      npcInfo.npcId = productInfo.id;
      npcInfo.level = productInfo.level;
      npcInfo.turn = npcData.turn;
      npcInfo.element = npcData.element;
      npcInfo.int = npcData.attributes[1] + productInfo.level;
      npcInfo.atk = npcData.attributes[2] + productInfo.level;
      npcInfo.def = npcData.attributes[3] + productInfo.level;
      npcInfo.agi = npcData.attributes[6] + productInfo.level;
      npcInfo.hpx = npcData.attributes[4] + productInfo.level;
      npcInfo.spx = npcData.attributes[5] + productInfo.level;
      npcInfo.hp = Calc.GetMaxHp(nil, npcInfo.level, npcInfo.hpx, 0, 0, npcInfo.turn, npcInfo.career, 0, true);
      npcInfo.sp = Calc.GetMaxSp(nil, npcInfo.level, npcInfo.spx, 0, 0, npcInfo.turn, npcInfo.career, 0, true);
      npcInfo.upgradeLv = math.random(0, 10);
      npcInfo.specialSkill = math.random(0, 1) == 1;
      for i = 1, Role.maxNpcSkill do
        npcInfo.skillLv[i] = math.random(1, 10);
      end
  
      UI.Open(UINpcInfo, npcInfo);
    end
    --]]Test Code
  end
end

function UIAuction.OnInitialize_ScrollContent_Product(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Product[itemIndex] = {};

    scrollItems_Product[itemIndex].text_NpcName = scrollItems[itemIndex]:Find("Text_NpcName"):GetComponent("Text");
    scrollItems_Product[itemIndex].text_NpcLv = scrollItems_Product[itemIndex].text_NpcName.transform:Find("Text_Level"):GetComponent("Text");
    scrollItems_Product[itemIndex].uiCareer = UICareerController.New(scrollItems_Product[itemIndex].text_NpcName.transform:Find("Career"));

    scrollItems_Product[itemIndex].image_ItemBG = scrollItems[itemIndex]:Find("Image_ItemBG"):GetComponent("Image");
    scrollItems_Product[itemIndex].uiItem = UIItemController.New(scrollItems_Product[itemIndex].image_ItemBG.transform);

    local tempTransform = scrollItems[itemIndex]:Find("ItemLayout");
    scrollItems_Product[itemIndex].text_ItemName = tempTransform:Find("Text_ItemName"):GetComponent("Text");
    scrollItems_Product[itemIndex].text_ItemDescription = tempTransform:Find("Text_ItemDescription"):GetComponent("Text");
    scrollItems_Product[itemIndex].sizeFitter_ItemDescription = tempTransform:Find("Text_ItemDescription"):GetComponent("SizeFitter");
    
    tempTransform = scrollItems[itemIndex]:Find("Layout");
    scrollItems_Product[itemIndex].text_SinglePrice = tempTransform:Find("Text_SinglePrice"):GetComponent("Text");
    scrollItems_Product[itemIndex].text_TotalPrice = tempTransform:Find("Text_TotalPrice"):GetComponent("Text");
    scrollItems_Product[itemIndex].text_TotalHint = scrollItems_Product[itemIndex].text_TotalPrice.transform:Find("Text_"):GetComponent("Text");

    scrollItems_Product[itemIndex].event_Product = scrollItems[itemIndex]:GetComponent("UIEvent");
    scrollItems_Product[itemIndex].event_Product:SetListener(EventTriggerType.PointerClick, this.OnClick_Product);

    scrollItems_Product[itemIndex].event_Submit = scrollItems[itemIndex]:Find("Image_Submit"):GetComponent("UIEvent");
    scrollItems_Product[itemIndex].event_Submit:SetListener(EventTriggerType.PointerClick, this.OnClick_Submit);

    scrollItems_Product[itemIndex].text_Submit = scrollItems[itemIndex]:Find("Text_Submit"):GetComponent("Text");
  end
end

function UIAuction.OnItemChange_ScrollContent_Product(dataIndex, itemIndex)
  local productInfo = products[dataIndex + 1];
  if productInfo == nil then return false end

  scrollItems_Product[itemIndex].text_NpcName.gameObject:SetActive(false);
  scrollItems_Product[itemIndex].text_NpcLv.gameObject:SetActive(false);
  scrollItems_Product[itemIndex].uiCareer:SetCareer();

  scrollItems_Product[itemIndex].image_ItemBG.gameObject:SetActive(false);
  scrollItems_Product[itemIndex].uiItem:SetItem();
  scrollItems_Product[itemIndex].text_ItemName.text = "";
  scrollItems_Product[itemIndex].text_ItemDescription.text = "";

  scrollItems_Product[itemIndex].text_SinglePrice.gameObject:SetActive(false);
  scrollItems_Product[itemIndex].text_TotalPrice.gameObject:SetActive(false);
  scrollItems_Product[itemIndex].text_TotalHint.gameObject:SetActive(false);

  scrollItems_Product[itemIndex].event_Submit.gameObject:SetActive(false);
  scrollItems_Product[itemIndex].text_Submit.text = "";

  if productInfo.kind == EAuctionProduct.Item then
    local itemData = itemDatas[productInfo.id];
    if itemData == nil then return false end

    scrollItems_Product[itemIndex].image_ItemBG.gameObject:SetActive(true);

    if productInfo.price ~= nil then
      scrollItems_Product[itemIndex].uiItem:SetItem(productInfo.id, productInfo.count);
    else
      scrollItems_Product[itemIndex].uiItem:SetItem(productInfo.id);
    end

    scrollItems_Product[itemIndex].text_ItemName.text = itemData:GetName(true, false);
    scrollItems_Product[itemIndex].text_ItemDescription.text = itemData.description;
    CGTimer.DoFunctionDelay(0.1, function() scrollItems_Product[itemIndex].sizeFitter_ItemDescription:SetDirty() end);

    if productInfo.price ~= nil then
      if not Item.IsTypeOfEquips(itemData.fitType) and productInfo.count > 0 then
        scrollItems_Product[itemIndex].text_SinglePrice.gameObject:SetActive(true);
        scrollItems_Product[itemIndex].text_SinglePrice.text = string.GetCommaValue(string.format("%0.2f", productInfo.price / productInfo.count));

        scrollItems_Product[itemIndex].text_TotalHint.gameObject:SetActive(true);
      end

      scrollItems_Product[itemIndex].text_TotalPrice.gameObject:SetActive(true);
      scrollItems_Product[itemIndex].text_TotalPrice.text = string.GetCommaValue(string.format("%0.2f", productInfo.price));
    end

  elseif productInfo.kind == EAuctionProduct.Npc then
    local npcData = npcDatas[productInfo.id];
    if npcData == nil then return false end

    scrollItems_Product[itemIndex].text_NpcName.gameObject:SetActive(true);
    scrollItems_Product[itemIndex].text_NpcName.text = npcData.name;

    scrollItems_Product[itemIndex].uiCareer:SetCareer(npcData.turn, npcData.element, ECareer.None, true);

    if productInfo.level ~= nil then
      scrollItems_Product[itemIndex].text_NpcLv.gameObject:SetActive(true);
      scrollItems_Product[itemIndex].text_NpcLv.text = productInfo.level;
    end

    if productInfo.price ~= nil then
      scrollItems_Product[itemIndex].text_TotalPrice.gameObject:SetActive(true);
      scrollItems_Product[itemIndex].text_TotalPrice.text = string.GetCommaValue(string.format("%0.2f", productInfo.price));
    end
  end

  scrollItems_Product[itemIndex].event_Product.parameter = productInfo;
  scrollItems_Product[itemIndex].event_Submit.parameter = productInfo;

  if productInfo.state ~= nil then
    if productInfo.state == EAuctionProductState.Preparing then
      scrollItems_Product[itemIndex].event_Submit.gameObject:SetActive(true);
      scrollItems_Product[itemIndex].text_Submit.text = string.Get(21489);
    elseif productInfo.state == EAuctionProductState.Selling then
      scrollItems_Product[itemIndex].event_Submit.gameObject:SetActive(true);
      scrollItems_Product[itemIndex].text_Submit.text = string.Get(21489);
    elseif productInfo.state == EAuctionProductState.Sold then
      scrollItems_Product[itemIndex].event_Submit.gameObject:SetActive(true);
      scrollItems_Product[itemIndex].text_Submit.text = string.Get(21489);
    elseif productInfo.state == EAuctionProductState.Expired then
      scrollItems_Product[itemIndex].event_Submit.gameObject:SetActive(true);
      scrollItems_Product[itemIndex].text_Submit.text = "Take Money";
    end
  elseif productInfo.sn ~= nil then
    scrollItems_Product[itemIndex].event_Submit.gameObject:SetActive(true);
    scrollItems_Product[itemIndex].text_Submit.text = string.Get(21476);
  else
    scrollItems_Product[itemIndex].text_Submit.text = string.format(string.Get(21477), productInfo.count);
  end

  if dataIndex + 1 == table.maxn(products) then
    if productInfo.state ~= nil then
    elseif productInfo.price ~= nil then
      this.RequestProduct(currentProductKind, currentProductId, productInfo.price)
    else
      this.RequestList(currentTag, currentSubTag, productInfo.id);
    end
  end
  
  return true;
end