
EUIArmyListTag = {
  Army = 1,
  Invitation = 2,
}

UIArmyList = {}
local this = UIArmyList;

this.name = "UIArmyList";
this.uiController = nil;

--ui
local transform_FrameRect;

local text_Page;

local scrollContent_Army;
local scrollItems_Army = {};

--var
local currentTag = EUIArmyListTag.Army;
local currentPage = 1;
local currentMaxPage = 1;

local datas = nil;
local tagDatas = {};

function UIArmyList.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;

  local tempEvent;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;

  text_Page = uiController:FindText("Text_Page");

  scrollContent_Army = uiController:FindScrollContent("ScrollContent_Army");
  scrollContent_Army.onInitialize = this.OnInitialize_ScrollContent_Army;
  scrollContent_Army.onItemChange = this.OnItemChange_ScrollContent_Army;
  scrollContent_Army:Initialize(1);

  tempEvent = uiController:FindEvent("Image_Prev");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_SwitchPage);
  tempEvent.parameter = -1;

  tempEvent = uiController:FindEvent("Image_Next");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_SwitchPage);
  tempEvent.parameter = 1;

  --tag
  tagDatas[1] = { string.Get(10171), nil };
  tagDatas[2] = { string.Get(10178), nil };
end

function UIArmyList.OnOpen()
  scrollContent_Army:Reset(0);
  this.SetPage(1, false);
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

function UIArmyList.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(20287), this.OnClick_Close, nil, this.OnClick_Tag, tagDatas, currentTag);
  end
end

function UIArmyList.SetPage(page, check)
  if check ~= false then
    page = math.clamp(page, 1, currentMaxPage);

    if page == currentPage then return end
  end

  currentPage = page;

  text_Page.text = string.Concat(math.min(currentPage, currentMaxPage), " / ", currentMaxPage);

  --C:039-108 <要求軍團列表> +第幾頁(1)
  sendBuffer:Clear();
  sendBuffer:WriteUInt16(currentPage);
  Network.Send(39, 108, sendBuffer);
end

function UIArmyList.SetData(maxPage, armyDatas)
  currentMaxPage = maxPage;
  datas = armyDatas;

  text_Page.text = string.Concat(math.min(currentPage, currentMaxPage), " / ", currentMaxPage);

  if datas ~= nil and table.maxn(datas) > 0 then
    scrollContent_Army:Reset(table.maxn(datas));
  else
    scrollContent_Army:Reset(0);
  end
end

function UIArmyList.SetApply(orgId, value)
  for k, v in pairs(datas) do
    if v.id == orgId then
      v.apply = value;

      scrollContent_Army:Refresh();
      break;
    end
  end
end

function UIArmyList.OnClick_Close()
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
  UI.Close(UIArmyList);

  return true;
end

function UIArmyList.OnClick_Tag(tag)
  if tag == EUIArmyListTag.Army then
    scrollContent_Army:Reset(0);
    this.SetPage(1, false);

  elseif tag == EUIArmyListTag.Invitation then
    UI.Open(UIInvitation, true, EInvitation.Organization);
    return false;
  end

  currentTag = tag;

  return true;
end

function UIArmyList.OnClick_SwitchPage(uiEvent)
  this.SetPage(currentPage + uiEvent.parameter);
end

function UIArmyList.OnClick_Apply(uiEvent)
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
  local armyInfo = uiEvent.parameter;

  if armyInfo.apply then
    --C:039-109 <拒絕加入> +軍團ID(4)
    sendBuffer:Clear();
    sendBuffer:WriteUInt32(armyInfo.id);
    Network.Send(39, 109, sendBuffer);

    this.SetApply(armyInfo.id, false);
  else
    --C:039-101 <申請加入> +軍團ID(4)
    sendBuffer:Clear();
    sendBuffer:WriteUInt32(armyInfo.id);
    Network.Send(39, 101, sendBuffer);
  end
end

function UIArmyList.OnInitialize_ScrollContent_Army(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Army[itemIndex] = {};

    scrollItems_Army[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_Army[itemIndex].text_Lv = scrollItems[itemIndex]:Find("Text_Level"):GetComponent("Text");
    scrollItems_Army[itemIndex].text_LeaderName = scrollItems[itemIndex]:Find("Text_LeaderName"):GetComponent("Text");
    scrollItems_Army[itemIndex].text_Member = scrollItems[itemIndex]:Find("Text_Member"):GetComponent("Text");

    scrollItems_Army[itemIndex].event_Apply = scrollItems[itemIndex]:Find("Image_Apply"):GetComponent("UIEvent");
    scrollItems_Army[itemIndex].event_Apply:SetListener(EventTriggerType.PointerClick, this.OnClick_Apply);
    scrollItems_Army[itemIndex].text_Apply = scrollItems_Army[itemIndex].event_Apply.transform:Find("Text_Apply"):GetComponent("Text");
  end
end

function UIArmyList.OnItemChange_ScrollContent_Army(dataIndex, itemIndex)
  local armyInfo = datas[dataIndex + 1];

  if armyInfo == nil then return false end

  scrollItems_Army[itemIndex].text_Name.text = armyInfo.name;
  scrollItems_Army[itemIndex].text_LeaderName.text = armyInfo.leaderName;
  scrollItems_Army[itemIndex].text_Lv.text = armyInfo.level;

  if armyArchitectureDatas[armyInfo.level] ~= nil then
    scrollItems_Army[itemIndex].text_Member.text = string.Concat(armyInfo.memberCount, "/", armyArchitectureDatas[armyInfo.level].buildings[1].maxMember);
  else
    scrollItems_Army[itemIndex].text_Member.text = armyInfo.memberCount;
  end

  scrollItems_Army[itemIndex].event_Apply.parameter = armyInfo;

  if armyInfo.apply then
    scrollItems_Army[itemIndex].event_Apply:SetColor(Color.LightGray);
    scrollItems_Army[itemIndex].text_Apply.text = string.Get(20991);
  else
    scrollItems_Army[itemIndex].event_Apply:SetColor(Color.White);
    scrollItems_Army[itemIndex].text_Apply.text = string.Get(10213);
  end

  return true;
end