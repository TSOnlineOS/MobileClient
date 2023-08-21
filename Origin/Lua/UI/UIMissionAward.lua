UIMissionAward = {}
local this = UIMissionAward;

local currentFestival;

--region UI Variable
this.name = "UIMissionAward";
this.uiController = nil;

local text_Name;
local text_Time;
local rawImage_Character;
local rawImage_CloudL;
local rawImage_CloudR;
local image_BgGradientColor;

local event_Close;
local scrollContent_MissionAward;
local scrollItems_MissionAward = {};

local missionList = {};
--endregion

--region ID variable
local receivedAwardTextID = 98017;
local inProgressTextID = 21060;
local monopolyID = 98;
--region

function UIMissionAward.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  this.uiController.onVisible = this.OnVisible;

  event_Close = uiController:FindEvent("Image_Close");
  event_Close:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);

  text_Name = uiController:FindText("Text_Name"):GetComponent("Text");
  text_Time = uiController:FindText("Text_Time"):GetComponent("Text");
  rawImage_Character = uiController:FindRawImage("RawImage_Character"):GetComponent("RawImage");
  image_BgGradientColor = uiController:FindGameObject("Image_BG"):GetComponent("GradientColor");
  rawImage_CloudL = uiController:FindRawImage("RawImage_Cloud (1)"):GetComponent("RawImage");
  rawImage_CloudR = uiController:FindRawImage("RawImage_Cloud (2)"):GetComponent("RawImage");

  scrollContent_MissionAward = uiController:FindScrollContent("ScrollContent_MissionAward");
  scrollContent_MissionAward.onInitialize = this.OnInitialize_ScrollContent;
  scrollContent_MissionAward.onItemChange = this.OnItemChange_ScrollContent;
  scrollContent_MissionAward:Initialize(1);
end

function UIMissionAward.OnOpen(festivalData)
  --開介面時先去要一次Sever時間校正
  if festivalData ~= nil then
    Network.Send(1, 16);
    currentFestival = festivalData;
    text_Name.text = string.Get(festivalData.title);
    CGTimer.AddListener(this.UpdateTime, 1);
    text_Time.gameObject:SetActive(true);
  
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
  TextureManager.SetPng(ETextureUseType.UI, "common0_bod102",  rawImage_CloudL);
  TextureManager.SetPng(ETextureUseType.UI, "common0_bod102",  rawImage_CloudR);
  scrollContent_MissionAward:Reset(MissionAward.GetMissionCountById(monopolyID));
  this.UpdateMissionPage();
  return true;
end

function UIMissionAward.OnClose()
  CGTimer.RemoveListener(this.UpdateTime);
  return true;
end

function UIMissionAward.OnInitialize_ScrollContent(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_MissionAward[itemIndex] = {};
    scrollItems_MissionAward[itemIndex].missionContent = scrollItems[itemIndex]:Find("Text_MissionContent"):GetComponent("Text");
    scrollItems_MissionAward[itemIndex].schedule = scrollItems[itemIndex]:Find("Text_Schedule"):GetComponent("Text");
    scrollItems_MissionAward[itemIndex].itemAward = UIItemController.New(scrollItems[itemIndex]:Find("Image_ItemAward"));
    scrollItems_MissionAward[itemIndex].missionStatus = scrollItems[itemIndex]:Find("Text_MissionStatus"):GetComponent("Text");
    scrollItems_MissionAward[itemIndex].collectAwardButton = scrollItems[itemIndex]:Find("Image_CollectAward"):GetComponent("Image");
    scrollItems_MissionAward[itemIndex].collectAwardEvent = scrollItems[itemIndex]:Find("Image_CollectAward"):GetComponent("UIEvent");
    scrollItems_MissionAward[itemIndex].collectAwardEvent:SetListener(EventTriggerType.PointerClick, this.OnClickCollectAward);
  end
end

function UIMissionAward.OnItemChange_ScrollContent(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local mission = missionList[index];
  if mission == nil then return false end
  scrollItems_MissionAward[itemIndex].missionContent.text = mission:GetContent();
  scrollItems_MissionAward[itemIndex].schedule.text = mission:GetSchedule();
  scrollItems_MissionAward[itemIndex].itemAward:SetItem(mission.itemId, mission.itemCount);
  scrollItems_MissionAward[itemIndex].itemAward:SetEvent();
  scrollItems_MissionAward[itemIndex].collectAwardEvent.parameter = mission;
  this.UpdateMissionStatus(scrollItems_MissionAward[itemIndex], mission);
  return true
end

function UIMissionAward.UpdateMissionStatus(scrollItem, mission)
  local collectable = mission:IsComplete() and not mission:HaveGetFlag();
  scrollItem.collectAwardButton.gameObject:SetActive(collectable);
  scrollItem.missionStatus.gameObject:SetActive(not collectable);
  if collectable then
    return
  end
  if mission:HaveGetFlag() then
    scrollItem.missionStatus.text = string.Get(receivedAwardTextID);
  else
    scrollItem.missionStatus.text = string.Get(inProgressTextID);
  end
end

function UIMissionAward.OnClickCollectAward(uiEvent)
  local mission = uiEvent.parameter;
  MissionAward.SendCompleteMission(mission.Id);
end

function UIMissionAward.UpdateMissionPage()
  missionList = MissionAward.GetMissionOrderByStatus(monopolyID);
  scrollContent_MissionAward:Refresh();
end

function UIMissionAward.UpdateTime()
  local status, leftTimeText = UIFestival.GetFestivalStatus(currentFestival);
  if status == EFestivalStatus.Open then
    text_Time.text = leftTimeText;
  else
    UI.Close(this);
  end
end

function UIMissionAward.OnClick_Close()
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
  UI.Close(this);
  return true;
end

