UIFestival = {}
local this = UIFestival;

EFestivalStatus =
{
  Upcoming = 0,
  Open = 1,
  Close = 2
}

EFestivalActivityKind =
{
  Jiugongge = 1,
  LoginExchange = 2,
  Monopoly = 3,
  MissionAward = 4
}

local FestivalUIKind = {};

this.name = "UIFestival";
this.uiController = nil;

--ui
local OpenUIArgs = {};
local OpenCheck = {};

local text_Name
local event_Close
local init = false

local scrollContent_Festival;
local scrollItems_Festival = {};

local monopolyID = 98;

function UIFestival.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  this.uiController.onVisible = this.OnVisible;

  text_Name = uiController:FindText("Text_Name"):GetComponent("Text");
  event_Close = uiController:FindEvent("Image_Close");
  event_Close:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);

  scrollContent_Festival = uiController:FindScrollContent("ScrollContent_Festival");
  scrollContent_Festival.onInitialize = this.OnInitialize_ScrollContent_Festival;
  scrollContent_Festival.onItemChange = this.OnItemChange_ScrollContent_Festival;
  scrollContent_Festival:Initialize(1);
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
  this.InitOpenUIKind();
  init = true
end

function UIFestival.OnInitialize_ScrollContent_Festival(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Festival[itemIndex] = {};
    scrollItems_Festival[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_Festival[itemIndex].text_Description = scrollItems[itemIndex]:Find("Text_Description"):GetComponent("Text");
    scrollItems_Festival[itemIndex].text_Award = scrollItems[itemIndex]:Find("Text_Award"):GetComponent("Text");
    scrollItems_Festival[itemIndex].text_Time = scrollItems[itemIndex]:Find("Text_Time"):GetComponent("Text");
    scrollItems_Festival[itemIndex].getEvent = scrollItems[itemIndex].gameObject:GetComponent("UIEvent");
    scrollItems_Festival[itemIndex].getEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Festival);
    scrollItems_Festival[itemIndex].image_Dot = scrollItems[itemIndex]:Find("Image_Dot");
  end
end

function UIFestival.OnItemChange_ScrollContent_Festival(dataIndex, itemIndex)
  local index = dataIndex + 1;

  if festivalInfos == nil then
    logError("festivalInfos == nil");
    return false;
  end

  scrollItems_Festival[itemIndex].text_Name.text = "";
  scrollItems_Festival[itemIndex].text_Description.text = string.Get(festivalInfos[index].description);
  scrollItems_Festival[itemIndex].text_Award.text = string.Get(festivalInfos[index].awardDescription);
  TextureManager.SetPng(ETextureUseType.UI, string.Concat( string.format("banner_%03d", festivalInfos[index].picture) ),  scrollItems_Festival[itemIndex].getEvent.gameObject:GetComponent("RawImage"));
  scrollItems_Festival[itemIndex].getEvent.parameter = index;
  scrollItems_Festival[itemIndex].image_Dot.gameObject:SetActive(this.UpdateFestivalRedDot(festivalInfos[index]))

  return true;
end

function UIFestival.UpdateFestivalPage()
  scrollContent_Festival:Reset(table.Count(festivalInfos));
  text_Name.text = string.Get(21526)
  if not CGTimer.ContainsListener(this.UpdateTime) then 
      CGTimer.AddListener(this.UpdateTime, 1);
  end
end

function UIFestival.RefreshFestivalPage()
  scrollContent_Festival:Refresh();
end

function UIFestival.OnOpen(functionkind)
  --開介面時先去要一次Sever時間校正
  Network.Send(1, 16);
  this.UpdateFestivalPage()

  return true;
end

function UIFestival.OnClick_Close()
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
  UI.Close(this);

  return true;
end

function UIFestival.OnClose()
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
  CGTimer.RemoveListener(this.UpdateTime);
  return true;
end

function UIFestival.OnClick_Festival(uiEvent)
  local activityTime = Activity.GetActivityTime(festivalInfos[uiEvent.parameter].activityId);
  local startDate = activityTime[1]:GetStartDate()
  local endDate = activityTime[1]:GetEndDate()

  if DateTime.Compare(CGTimer.serverTime, startDate) < 0 then
    ShowCenterMessage(string.Get(20376));
    return
  elseif DateTime.Compare(CGTimer.serverTime, endDate) > 0 then
    ShowCenterMessage(string.Get(20377));
    return
  end

  local startTime = activityTime[1].serverStartTime;
  local closeTime = activityTime[1].serverCloseTime;

  if DateTime.Compare(CGTimer.serverTime, startTime) < 0 or DateTime.Compare(CGTimer.serverTime, closeTime) > 0 then
    ShowCenterMessage(string.Get(60065));
  else
    local festivalInfoData = festivalInfos[uiEvent.parameter];
    local UIKind = festivalInfoData.functionkind;
    if OpenCheck[UIKind] ~= nil then
      local OpenUICallback = function()
        this.OpenFestivalActivityUI(festivalInfoData);
      end
      OpenCheck[UIKind](OpenUICallback);
    else
      this.OpenFestivalActivityUI(festivalInfoData);
    end

  end
end

function UIFestival.UpdateTime()
  for i = 1, table.Count(festivalInfos) do
    local _, text = this.GetFestivalStatus(festivalInfos[i]);
    scrollItems_Festival[i-1].text_Time.text = text;
  end
end

function UIFestival.UpdateRedDot()
  if (UI.IsVisible(UIJiugongge) or UI.IsVisible(UIFestival) or UI.IsVisible(UIMissionAward)) and init then
    this.UpdateFestivalPage();
  end

  for i = 1, table.Count(festivalInfos) do
    if this.UpdateFestivalRedDot(festivalInfos[i]) then
      RedDot.Add(ERedDot.Festival);
      return
    end
  end

  RedDot.Remove(ERedDot.Festival);
end

function UIFestival.UpdateFestivalRedDot(functiondata)
  if activityTimes[functiondata.activityId] == nil then return false end

  if activityTimes[functiondata.activityId][1].serverStartTime == 0 or DateTime.Compare(CGTimer.serverTime, activityTimes[functiondata.activityId][1].serverStartTime) < 0 then
    return false
  end

  if functiondata.functionkind == EFestivalActivityKind.Jiugongge then
    return this.UpdateJiugonggeRedDot(functiondata.kind)
  elseif functiondata.functionkind == EFestivalActivityKind.Exchange then
    return this.UpdateExangeRedDot(functiondata.kind)
  elseif functiondata.functionkind == EFestivalActivityKind.MissionAward then
    return this.UpdateMissionAwardRedDot();
  end

  return false
end

function UIFestival.UpdateJiugonggeRedDot(kind)
  if Jiugongge.gridKind[kind] == nil then return false end

  for k, v in pairs(Jiugongge.grid[Jiugongge.gridKind[kind].Id].awards) do
    if v.canGetAward == 1 then
      return true
    end
  end

  return false
end

function UIFestival.UpdateExangeRedDot(kind)
  UIJiugongge.GetExchangeAward(kind)
  return UIJiugongge.SortLoginAward()
end

function UIFestival.UpdateMissionAwardRedDot()
  local _, refresh = MissionAward.GetMissionOrderByStatus(monopolyID); --目前慶典MissionAward僅大富翁任務需檢查
  return refresh
end

--todo festivalInfoData flag to indicate if pass festivalInfoData to UI.Open
function UIFestival.OpenFestivalActivityUI(festivalInfoData)
  local UIKind = festivalInfoData.functionkind;
  if OpenUIArgs[UIKind] == nil then
    UI.Open(FestivalUIKind[UIKind], festivalInfoData);
  else
    local UIArgs = OpenUIArgs[UIKind];
    table.insert(UIArgs,festivalInfoData);
    UI.Open(FestivalUIKind[UIKind], unpack(UIArgs));
  end
end

function UIFestival.InitOpenUIKind()
  --ExChange and Jiugongge both use UIJiugongge
  this.AddUIKind(EFestivalActivityKind.Jiugongge, UIJiugongge, EUIJiugonggeOpenWay.Festival);
  this.AddUIKind(EFestivalActivityKind.LoginExchange, UIJiugongge, EUIJiugonggeOpenWay.Festival);
  this.AddUIKind(EFestivalActivityKind.Monopoly, UIMonopoly);
  this.AddUIKind(EFestivalActivityKind.MissionAward, UIMissionAward);
  OpenCheck[EFestivalActivityKind.Monopoly] = function(callBack)
    Monopoly.SendRequestProgress(callBack);
  end
end

function UIFestival.AddUIKind(Kind, UI, ...)
  table.insert(FestivalUIKind, Kind, UI);
  OpenUIArgs[Kind] = {...};
end

function UIFestival.GetFestivalStatus(festivalData)
  if activityTimes[festivalData.activityId] == nil then return end
  if activityTimes[festivalData.activityId][1].serverStartTime == 0 then
    return EFestivalStatus.Close, string.Get(20377);
  elseif DateTime.Compare(CGTimer.serverTime, activityTimes[festivalData.activityId][1].serverStartTime) < 0 then
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
    return EFestivalStatus.Upcoming, string.Get(20376);
  elseif DateTime.Compare(CGTimer.serverTime, activityTimes[festivalData.activityId][1].serverCloseTime) < 0 then
    local leftTime = DateTime.Subtract(activityTimes[festivalData.activityId][1].serverCloseTime, CGTimer.serverTime);
    return EFestivalStatus.Open, string.Concat(string.Get(80098), string.GetSecondText(math.ceil(leftTime.TotalSeconds)));
  else
    return EFestivalStatus.Close, string.Get(20377);
  end
end
