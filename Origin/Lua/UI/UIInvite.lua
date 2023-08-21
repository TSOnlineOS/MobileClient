UIInvite = {};
local this = UIInvite;

this.name = "UIInvite";
this.uiController = nil;

local scrollContent_Friend;
local scrollItems_Friend = {};
local datas = {};
local delegateFunc = nil;
local filterFunc = nil;

function UIInvite.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  
  scrollContent_Friend = uiController:FindScrollContent("ScrollContent_Friend");
  scrollContent_Friend.onInitialize = this.OnInitialize_ScrollContent_Friend;
  scrollContent_Friend.onItemChange = this.OnItemChange_ScrollContent_Friend;
  scrollContent_Friend:Initialize(1);

  local maskEvent = uiController:FindEvent("Image_Mask");
  maskEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Mask);  
end

function UIInvite.OnOpen(delegate, filter)
  delegateFunc = delegate;
  filterFunc = filter;

  this.UpdateUI();

  return true;
end

function UIInvite.OnClose()
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
  delegateFunc = nil;
  filterFunc = nil;
end

function UIInvite.UpdateUI(refresh)
  table.Clear(datas);

  for roleId, playerInfo in pairs(Social.friends) do
    --判斷在線
    if playerInfo.online then
      if filterFunc == nil or filterFunc(playerInfo) then
        table.insert(datas, roleId);
      end
    end
  end

  if refresh then
    scrollContent_Friend:Refresh(table.maxn(datas));
  else
    scrollContent_Friend:Reset(table.maxn(datas));
  end
end

function UIInvite.OnInitialize_ScrollContent_Friend(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Friend[itemIndex] = {};
    scrollItems_Friend[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_Friend[itemIndex].event_Invite = scrollItems[itemIndex]:Find("Image_Invite"):GetComponent("UIEvent");
    scrollItems_Friend[itemIndex].event_Invite:SetListener(EventTriggerType.PointerClick, this.OnClick_Invite);
  end
end

function UIInvite.OnItemChange_ScrollContent_Friend(dataIndex, itemIndex)
  local roleId = datas[dataIndex + 1];

  if roleId == nil then return false end

  local playerInfo = Social.friends[roleId];

  if playerInfo == nil then return false end

  scrollItems_Friend[itemIndex].text_Name.text = playerInfo.name;
  scrollItems_Friend[itemIndex].event_Invite.parameter = roleId; 
  return true;
end

function UIInvite.OnClick_Invite(uiEvent)
  if delegateFunc ~= nil then 
    delegateFunc(uiEvent.parameter);
    delegateFunc = nil;
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
  UI.Close(UIInvite);
end

function UIInvite.OnClick_Mask()
  
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
  UI.Close(UIInvite);
end