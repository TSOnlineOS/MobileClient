UIReciptHelper = {}
local this = UIReciptHelper;

this.name = "UIReciptHelper";
this.uiController = nil;

local scrollContent_Recipt;
local scrollItems_Recipt = {};

local reciptData = {};
local dataCount = 0;

--update use
local index;
local mallData;

function UIReciptHelper.Initialize(go)
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
  
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;

  scrollContent_Recipt = uiController:FindScrollContent("ScrollContent_Recipt");
  scrollContent_Recipt.onInitialize = this.OnInitialize_scrollContent_Recipt;
  scrollContent_Recipt.onItemChange = this.OnItemChange_scrollContent_Recipt;
  scrollContent_Recipt:Initialize(1);

  local tempEvent;
  tempEvent = uiController:FindEvent("Image_Mask");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);
end

function UIReciptHelper.OnInitialize_scrollContent_Recipt(scrollItems)
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Recipt[itemIndex] = {};
    scrollItems_Recipt[itemIndex].name = scrollItems[itemIndex]:Find("Text_ProductName"):GetComponent("Text");
    scrollItems_Recipt[itemIndex].orderId = scrollItems[itemIndex]:Find("Text_OrderId"):GetComponent("Text");
    scrollItems_Recipt[itemIndex].time = scrollItems[itemIndex]:Find("Text_Time"):GetComponent("Text");
    scrollItems_Recipt[itemIndex].event = scrollItems[itemIndex]:Find("Image_Send"):GetComponent("UIEvent");
    scrollItems_Recipt[itemIndex].event:SetListener(EventTriggerType.PointerClick, this.OnClick_Send);
  end
end

function UIReciptHelper.OnItemChange_scrollContent_Recipt(dataIndex, itemIndex)
  index = dataIndex + 1;

  if index > dataCount then return false end

  scrollItems_Recipt[itemIndex].name.text = StoreValue.GetIAPName(reciptData[index].productId);
  scrollItems_Recipt[itemIndex].orderId.text = reciptData[index].orderId;
  scrollItems_Recipt[itemIndex].time.text = reciptData[index].time;
  scrollItems_Recipt[itemIndex].event.parameter = index;

  return true;
end

function UIReciptHelper.OnOpen()
  this.ResetUI();

  return true;
end

function UIReciptHelper.ResetUI()
  reciptData = IAP.LoadReceiptData();
  dataCount = table.Count(reciptData);

  scrollContent_Recipt:Reset(dataCount);
end

function UIReciptHelper.OnClose()
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  return true;
end

function UIReciptHelper.OnClick_Send(uiEvent)
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if IAP.IsDebugMode() then
    for k,v in pairs(reciptData) do 
      IAP.SendDataToServer(reciptData[k]);
    end
  else
    IAP.SendDataToServer(reciptData[uiEvent.parameter]);
  end
end

function UIReciptHelper.OnClick_Close()
  UI.Close(this);
end