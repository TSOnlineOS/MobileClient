UILimitedTimeSale = {}
local this = UILimitedTimeSale;

this.name = "UILimitedTimeSale";
this.uiController = nil;
this.data = {};
this.data.ItemMenu = {};
--Scroll
local scrollContent_List;
local scrollItems_List = {};

local text_Time = nil;
local LimitedTimeSaleFlag = {EBitFlag.LimitedTimeSale1, EBitFlag.LimitedTimeSale2, EBitFlag.LimitedTimeSale3, EBitFlag.LimitedTimeSale4, EBitFlag.LimitedTimeSale5};

function UILimitedTimeSale.ClearData()
  table.Clear(this.data.ItemMenu);
  table.Clear(this.data);
end

function UILimitedTimeSale.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onVisible = this.OnVisible;
  --List
  scrollContent_List = uiController:FindScrollContent("ScrollContent_List");
  scrollContent_List.onInitialize = this.OnInitialize_ScrollContent_List;
  scrollContent_List.onItemChange = this.OnItemChange_ScrollContent_List;
  scrollContent_List:Initialize(1);

  text_Time = uiController:FindText("Text_Time");

  local event = nil;
  event = uiController:FindEvent("Image_Close");
  event:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);

  event = uiController:FindEvent("Image_Mask");
  event:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);
end

function UILimitedTimeSale.OnVisible(visible)
  if visible then
    if this.data == nil then
      return
    end

    if this.data.ItemMenu == nil then
      return;
    end

    CGTimer.AddListener(this.UpdateTime, 1, true);
    scrollContent_List:Reset(#this.data.ItemMenu);
  end
end

function UILimitedTimeSale.UpdateTime()
  if this.CheckTime() then
    local difftime = DateTime.Subtract(this.data.endTime, CGTimer.serverTime).TotalSeconds;

    if difftime <= 60 then    
      text_Time.text = string.Concat(string.Get(22334), math.floor(difftime), string.Get(40145));
    else
      local day = math.floor(difftime / 60 / 60 / 24);
      difftime = difftime - 3600 * 24 * day;
      local hour = math.floor(difftime / 60 / 60);
      difftime = difftime - 3600 * hour;
      local minute = math.floor(difftime / 60);
      text_Time.text = string.Concat(string.Get(22334), string.format(string.Get(20996), day, hour, minute));
    end
  else
    text_Time.text = string.Get(60065);
  end
end

function UILimitedTimeSale.OnClick_Close()
  CGTimer.RemoveListener(this.UpdateTime);
  UI.Close(UILimitedTimeSale);
  
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
end

function UILimitedTimeSale.OnClick_Buy(event)
  local idx = event.parameter;

  if idx > #LimitedTimeSaleFlag then
    return;
  end

  if BitFlag.Get(LimitedTimeSaleFlag[idx]) == true or not this.CheckTime() then
    return 
  end

  UISell.Launch(43, this.BuyCallback, idx);
end

function UILimitedTimeSale.BuyCallback()
  scrollContent_List:Refresh(table.maxn(this.data.ItemMenu));
  this.UpdateRedDot();
  ShowCenterMessage(string.Get(22352));
end


function UILimitedTimeSale.OnClick_Item(event)
  if this.data.ItemMenu[event.parameter].itemId ~= 0 then
    UIItemInfo.Show(this.data.ItemMenu[event.parameter].itemId);
  
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
  end
end

function UILimitedTimeSale.CheckTime()

  if this.data == nil or this.data.endTime == nil then 
    return false;
  end

  return DateTime.Compare(this.data.endTime , CGTimer.serverTime) > 0;
end

function UILimitedTimeSale.CheckRedDot()
  if this.data == nil then 
    return false;
  end
   
  return not BitFlag.Get(EBitFlag.LimitedTimeSale1);
end

function UILimitedTimeSale.UpdateRedDot()
  if this.CheckRedDot() then 
    RedDot.Add(ERedDot.LimitedTimeSale);
  else
    RedDot.Remove(ERedDot.LimitedTimeSale);
  end
end

function UILimitedTimeSale.ReciveData(data)
  this.data = {};
  this.data.ItemMenu = {};
  local count = data:ReadByte();

  for i = 1, count do
    this.data.ItemMenu[i] = {}
    this.data.ItemMenu[i].itemId = data:ReadUInt32();
    this.data.ItemMenu[i].quant = data:ReadUInt32();
    this.data.ItemMenu[i].prePrice = data:ReadUInt32();
    this.data.ItemMenu[i].price = data:ReadUInt32();
  end

  this.data.endTime = DateTime.FromOADate(data:ReadDouble());

  if this.CheckTime() and not this.CheckLimitedAllFlagHave() and Function.CheckShow(1) then
    UI.Open(UILimitedTimeSale);
  end

  CGTimer.AddListener(this.CheckLimitedTimeSaleIcon, 60, true);
  Function.UpdateVisible();
  this.UpdateRedDot();
end

--檢查全部flag是否有任何一個符合
function UILimitedTimeSale.CheckLimitedAllFlagHave()
  for i = 1, #LimitedTimeSaleFlag do
    if BitFlag.Get(LimitedTimeSaleFlag[i]) then return true; end
  end

  return false;
end

function UILimitedTimeSale.ReciveClearData()
  this.ClearData();
  if UI.IsVisible(UILimitedTimeSale) then 
    UI.Close(UILimitedTimeSale);
  end  
  Function.UpdateVisible();
  this.UpdateRedDot();
end

function UILimitedTimeSale.CheckLimitedTimeSaleIcon()
  if this.CheckTime() == false then 
    Function.UpdateVisible();
    CGTimer.RemoveListener(this.CheckLimitedTimeSaleIcon);
  
  
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
  end
end

function UILimitedTimeSale.OnInitialize_ScrollContent_List(scrollItems)
  for itemIndex = 0, scrollItems.Length -1 do
    scrollItems_List[itemIndex] = {};

    scrollItems_List[itemIndex].image_Buy = scrollItems[itemIndex]:Find("Image_Buy"):GetComponent("Image");
    scrollItems_List[itemIndex].text_Buy = scrollItems_List[itemIndex].image_Buy.transform:Find("Text_Buy"):GetComponent("Text");
    scrollItems_List[itemIndex].event = scrollItems[itemIndex]:Find("Image_Buy"):GetComponent("UIEvent");
    scrollItems_List[itemIndex].event:SetListener(EventTriggerType.PointerClick, this.OnClick_Buy);

    local itemObj = scrollItems[itemIndex]:Find("Item");
    scrollItems_List[itemIndex].text_Name = itemObj:Find("Text_Name"):GetComponent("Text");
    scrollItems_List[itemIndex].text_PrePrice = itemObj:Find("Text_PrePrice"):GetComponent("Text");
    scrollItems_List[itemIndex].text_Price = itemObj:Find("Text_Price"):GetComponent("Text");
    scrollItems_List[itemIndex].image_ItemBG = itemObj:Find("Image_ItemBG"):GetComponent("Image");
    scrollItems_List[itemIndex].image_PrePrice = itemObj:Find("Image_PrePrice"):GetComponent("Image");
    scrollItems_List[itemIndex].image_Price = itemObj:Find("Image_Price"):GetComponent("Image");
    scrollItems_List[itemIndex].item = UIItemController.New(itemObj:Find("Image_ItemBG"), this.OnClick_Item, itemIndex + 1);--資料索引從1開始
  end
end

function UILimitedTimeSale.OnItemChange_ScrollContent_List(dataIndex, itemIndex)
  local CommodityIdx = dataIndex + 1;
  local Commodity = this.data.ItemMenu[CommodityIdx];
  --檢查資料
  if Commodity == nil then
    return false
  end

  --檢查物品Data
  local itemData = itemDatas[Commodity.itemId];
  if itemData  == nil then
    return false
  end

  --檢查flag
  local flag = LimitedTimeSaleFlag[CommodityIdx];
  if flag == nil then
    return false
  end;

  scrollItems_List[itemIndex].event.parameter = CommodityIdx;
  scrollItems_List[itemIndex].item:SetItem(Commodity.itemId, Commodity.quant);
  scrollItems_List[itemIndex].item:SetEvent(this.OnClick_Item, CommodityIdx);
  scrollItems_List[itemIndex].text_Name.text = itemData.name;
  scrollItems_List[itemIndex].text_PrePrice.text = Commodity.prePrice;
  scrollItems_List[itemIndex].text_Price.text = Commodity.price;

  if BitFlag.Get(flag) == true then
    LuaHelper.SetColor(scrollItems_List[itemIndex].image_Buy, Color.Gray);
    scrollItems_List[itemIndex].text_Buy.text = string.Get(21230);
  elseif not this.CheckTime() then
    LuaHelper.SetColor(scrollItems_List[itemIndex].image_Buy, Color.Gray);
    scrollItems_List[itemIndex].text_Buy.text = string.Get(21230);
  else
    LuaHelper.SetColor(scrollItems_List[itemIndex].image_Buy, Color.White);
    scrollItems_List[itemIndex].text_Buy.text = string.Get(22333);
  end

  return true;
end