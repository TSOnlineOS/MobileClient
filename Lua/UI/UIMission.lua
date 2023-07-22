UIMission = {}
local this = UIMission;

this.name = "UIMission";
this.uiController = nil;

local maxPageShow = 10;

local rawImage_BG;
local rawImage_Name;
local rawImage_Outline;
local rawImage_Detail;
local rawImage_MissionName = {};

local text_Missions = {};
local text_Page;
local text_Name;
local text_Description;
local text_Condition;
local text_Step;

local inputField_Search;

local image_MissionStates = {};
local image_Arrow;

local event_Close;
local event_Navigation;
local event_Missions = {};

local currentPage = 1;
local currentMissionId = 0;

local ownMissions = nil;

function UIMission.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;

  rawImage_BG = uiController:FindRawImage("RawImage_BG");
  -- rawImage_Name = uiController:FindRawImage("RawImage_Name");
  rawImage_Outline = uiController:FindRawImage("RawImage_Outline");
  -- rawImage_Detail = uiController:FindRawImage("RawImage_Detail");

  local tempTransform = uiController:FindGameObject("List").transform;
  for i = 1, maxPageShow do
    rawImage_MissionName[i] = tempTransform:Find(string.Concat("RawImage_MissionName ", "(", i, ")")):GetComponent("RawImage");

    event_Missions[i] = rawImage_MissionName[i].transform:GetComponent("UIEvent");
    event_Missions[i]:SetListener(EventTriggerType.PointerClick, this.OnClick_Mission);
    event_Missions[i].parameter = 0;

    text_Missions[i] = rawImage_MissionName[i].transform:Find("Text_Mission"):GetComponent("Text");
    image_MissionStates[i] = text_Missions[i].transform:Find("Image_State"):GetComponent("Image");
  end
  
  text_Page = uiController:FindText("Text_Page");
  text_Name = uiController:FindText("Text_Name");
  text_Description = uiController:FindText("Text_Description");
  text_Condition = uiController:FindText("Text_Condition");
  text_Step = uiController:FindText("Text_Step");

  inputField_Search = uiController:FindInputField("InputField_Search"):GetComponent("UIInputField");
  inputField_Search:AddListener(this.OnChange_Search);

  image_Arrow = uiController:FindGameObject("Image_Arrow");

  tempEvent = uiController:FindEvent("Image_Prev");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Page);
  tempEvent.parameter = -1;

  tempEvent = uiController:FindEvent("Image_Next");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Page);
  tempEvent.parameter = 1;

  event_Navigation = uiController:FindEvent("Image_Navigation");
  event_Navigation:SetListener(EventTriggerType.PointerClick, this.OnClick_Navigation);

  event_Close = uiController:FindEvent("Image_Close");
  event_Close:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);
end

function UIMission.OnOpen(missionId)
  inputField_Search.text = "";

  TextureManager.SetPng(ETextureUseType.UI, "common0_bod051", rawImage_BG);
  -- TextureManager.SetPng(ETextureUseType.UI, "common0_bod067", rawImage_Name);
  TextureManager.SetPng(ETextureUseType.UI, "common0_bod069", rawImage_Outline);
  -- TextureManager.SetPng(ETextureUseType.UI, "common0_bod070", rawImage_Detail);

  for i = 1, 10 do
    TextureManager.SetPng(ETextureUseType.UI, "common0_bod068", rawImage_MissionName[i]);

    if i % 2 == 0 then
      rawImage_MissionName[i].color = LuaHelper.GetColor(242, 244, 236, 255);
    else
      rawImage_MissionName[i].color = LuaHelper.GetColor(221, 212, 198, 255);
    end
  end

  this.UpdateUI(missionId);
  
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

function UIMission.UpdateUI(missionId, searchText)
  ownMissions = MarkManager.GetOwnMission(searchText);

  if table.maxn(ownMissions) > 0 then
    currentMissionId = ownMissions[1];
    currentPage = 1;
  else
    currentMissionId = 0;
    currentPage = 1;
  end
  
  if missionId ~= nil and markDatas[missionId] ~= nil then
    for k, v in pairs(ownMissions) do
      if v == missionId then
        currentMissionId = missionId;
        currentPage = math.ceil(k / maxPageShow);
        break;
      end
    end
  end

  this.UpdatePage();
end

function UIMission.UpdatePage()
  text_Page.text = string.Concat(currentPage, "/", math.ceil(table.maxn(ownMissions) / maxPageShow));

  for i = 1, maxPageShow do
    local missionIndex = (currentPage - 1) * maxPageShow + i;
    if ownMissions[missionIndex] ~= nil and markDatas[ownMissions[missionIndex]] ~= nil then
      text_Missions[i].text = markDatas[ownMissions[missionIndex]].name;
      image_MissionStates[i].sprite = UI.GetMissionStateSprite(not table.Contains(MarkManager.showMissions, ownMissions[missionIndex]));
      image_MissionStates[i].enabled = true;
      event_Missions[i].parameter = ownMissions[missionIndex];

      if currentMissionId == 0 then
        currentMissionId = ownMissions[missionIndex];
      end
    else
      text_Missions[i].text = "";
      event_Missions[i].parameter = 0;
      image_MissionStates[i].enabled = false;
    end
  end

  this.UpdateMission();
end

function UIMission.UpdateMission()
  text_Name.text = "";
  text_Description.text = "";
  text_Condition.gameObject:SetActive(false);

  if markDatas[currentMissionId] == nil then return end

  for i = 1, maxPageShow do
    if event_Missions[i].parameter == currentMissionId then
      image_Arrow.transform:SetParent(text_Missions[i].transform);
      image_Arrow.transform.localPosition = Vector2.New(-50, 0);
      break;
    end
  end
  
  if table.Contains(MarkManager.showMissions, currentMissionId) then
    event_Navigation.gameObject:SetActive(true);
  else
    event_Navigation.gameObject:SetActive(false);
  end

  text_Name.text = markDatas[currentMissionId].name;
  text_Description.text = string.ChangeSymbol(markDatas[currentMissionId].description);

  local mission = MarkManager.GetMission(currentMissionId);

  if mission == nil then return end
  
  if Define.IsDebugMode() then
    text_Description.text = string.Concat(string.ChangeSymbol(markDatas[currentMissionId].description), "(", mission.id, "-", mission.step, ")");
  end
  
  if markDatas[mission.id] == nil then return end
  if markDatas[mission.id].steps == nil then return end

  local step = markDatas[mission.id].steps[mission.step];

  if step == nil then return end

  text_Condition.gameObject:SetActive(true);
  
  local description = "";

  for i = 1, 5 do
    local condition = step.conditions[i];
    local currentCount = 0;

    if condition.kind == 1 and npcDatas[condition.id] ~= nil then
      --捕捉npc
      description = string.Concat(description, "\n");

      if Role.GetFollowNpc(Role.playerId, condition.id) ~= nil then
        description = string.Concat(description, string.GetColorText(string.Concat(npcDatas[condition.id].name, " 1/1"), Color.Goal));
      else
        description = string.Concat(description, string.GetColorText(string.Concat(npcDatas[condition.id].name, " 0/1"), Color.DarkUnsatisfiedGoal));
      end

    elseif condition.kind == 2 and npcDatas[condition.id] ~= nil then
      --擊殺npc

    elseif condition.kind == 3 and itemDatas[condition.id] ~= nil then
      --收集道具
      description = string.Concat(description, "\n");

      local count = Item.GetItemCount(condition.id);
      
      if count >= condition.count then
        description = string.Concat(description, string.GetColorText(string.Concat(itemDatas[condition.id]:GetName(true), " ", math.min(count, condition.count), "/", condition.count), Color.Goal));
      else
        description = string.Concat(description, string.GetColorText(string.Concat(itemDatas[condition.id]:GetName(true), " ", math.min(count, condition.count), "/", condition.count), Color.DarkUnsatisfiedGoal));

        doneCondition = false;
      end
    end
  end
  
  text_Condition.text = description;
  text_Step.text = step.description;
end

function UIMission.OnClick_Close()
  UI.Close(UIMission);
end

function UIMission.OnClick_Mission(uiEvent)
  currentMissionId = uiEvent.parameter;

  this.UpdateMission();
end

function UIMission.OnClick_Page(uiEvent)
  local maxPage = math.ceil(table.maxn(ownMissions) / maxPageShow);
  local nowPage = currentPage + uiEvent.parameter;

  if nowPage < 1 or nowPage > maxPage then return end
  
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

  currentMissionId = 0;
  currentPage = nowPage;

  this.UpdatePage(nowPage);
end

function UIMission.OnClick_Navigation()
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end
  
  if Team.IsMember(Role.playerId) and not Team.IsLeader(Role.playerId) then
    ShowCenterMessage(string.Get(20519));
    return;
  end

  if not Role.CanControl() then return end
  
  local mission = MarkManager.GetMission(currentMissionId);

  if mission == nil then return end
  if markDatas[mission.id] == nil then return end
  if markDatas[mission.id].steps == nil then return end
  if markDatas[mission.id].steps[mission.step] == nil then return end

  if markDatas[mission.id].steps[mission.step].checkTeam and not Team.IsMember(Role.playerId) then
    ShowCheckMessage(
      function(result)
        if result then
          MarkManager.Navigation(currentMissionId);
          UI.Close(UIMission);
        end
      end,
      string.Get(21543),
      Role.player
    );
    return;
  end

  MarkManager.Navigation(currentMissionId);
  UI.Close(UIMission);
end

function UIMission.OnChange_Search(text)
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
  this.UpdateUI(currentMissionId, text);
end