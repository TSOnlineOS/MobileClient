
UIMissionSwitch = {}
local this = UIMissionSwitch;

this.name = "UIMissionSwitch";
this.uiController = nil;

local transform_FrameRect;

local scrollContent_Mission;
local scrollItems_Mission = {};

function UIMissionSwitch.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;

  scrollContent_Mission = uiController:FindScrollContent("ScrollContent_Mission");
  scrollContent_Mission.onInitialize = this.OnInitialize_ScrollContent_Mission;
  scrollContent_Mission.onItemChange = this.OnItemChange_ScrollContent_Mission;
  scrollContent_Mission:Initialize(1);

  local tempEvent = uiController:FindEvent("Image_Mask");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);
end

function UIMissionSwitch.OnOpen()
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

function UIMissionSwitch.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(21024), this.OnClick_Close);

    this.UpdateUI(false);
  end
end


function UIMissionSwitch.UpdateUI(refresh)
  if refresh ~= false then
    scrollContent_Mission:Refresh(table.maxn(MarkManager.showMissions));
  else
    scrollContent_Mission:Reset(table.maxn(MarkManager.showMissions));
  end
end

function UIMissionSwitch.OnClick_Close()
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
  UI.Close(UIMissionSwitch);
  return true;
end

function UIMissionSwitch.OnClick_Mission(uiEvent)
  MarkManager.SwitchHideMission(uiEvent.parameter)
end

function UIMissionSwitch.OnInitialize_ScrollContent_Mission(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Mission[itemIndex] = {};
    scrollItems_Mission[itemIndex].event_Mission = scrollItems[itemIndex]:Find("Image_BG"):GetComponent("UIEvent");
    scrollItems_Mission[itemIndex].event_Mission:SetListener(EventTriggerType.PointerClick, this.OnClick_Mission);

    scrollItems_Mission[itemIndex].image_Switch = scrollItems[itemIndex]:Find("Image_Switch"):GetComponent("Image");
    scrollItems_Mission[itemIndex].text_Title = scrollItems[itemIndex]:Find("Text_Title"):GetComponent("Text");
  end
end

function UIMissionSwitch.OnItemChange_ScrollContent_Mission(dataIndex, itemIndex)
  local showMissionId = MarkManager.showMissions[dataIndex + 1];

  if showMissionId == nil then return false end
  if markDatas[showMissionId] == nil then return false end

  scrollItems_Mission[itemIndex].event_Mission.parameter = showMissionId;
  
  scrollItems_Mission[itemIndex].image_Switch.sprite = UI.GetCheckBoxSprite(not MarkManager.IsHideMission(showMissionId));

  scrollItems_Mission[itemIndex].text_Title.text = string.Concat(string.AddBrackets(string.GetMissionKind(markDatas[showMissionId].kind)), markDatas[showMissionId].name);

  return true;
end