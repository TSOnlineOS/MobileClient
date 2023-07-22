EUIMainTag = {
  Mission = 1,
  Team = 2
}

UIMiniMap = {}
local this = UIMiniMap;

this.name = "UIMiniMap";
this.uiController = nil;
this.mapHight = 0;

--common
local gameObject_Info;
local gameObject_SwitchMap;
local gameObject_MiniMap;
local gameObject_Mission;
local gameObject_Team;
local gameObject_MissionEffect;
local transform_HideRoot;

local image_HideAll;

--minimap
local rectTransform_BG;

local text_Position;
local text_SceneName;

local rawImage_MiniMap;

local image_Mask;

--mission
local transform_Mission;
local transform_MissionSize;
local gameObject_MissionFilter;

local image_Mission;
local image_Team;
local image_MissionSwitch;
local transform_MissionSwitch;
local image_SwitchMap;

local scrollContent_Mission;
local scrollItems_Mission = {};

local scrollContent_Team;
local scrollItems_Team = {};

local event_Mission;
local event_Team;
local event_HideMission;

--deathMatch
local deathMatchDatas = {};
local gameObject_Deathmatch;
local gameObject_Top3;
local objs_Top3 = {};
local objs_My = {};

--var
local currentTag = EUIMainTag.Mission;

local missionDatas = {};
local teamDatas = {};

local mission_OriginalWidth;
local renderTexture = nil;

function UIMiniMap.Initialize(go)  
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;

  local tempEvent;

  --common
  gameObject_Info = uiController:FindGameObject("Image_Info");
  gameObject_SwitchMap = uiController:FindGameObject("Image_SwitchMap");
  gameObject_MiniMap = uiController:FindGameObject("Image_MiniMapBG");
  gameObject_Mission = uiController:FindGameObject("MissionGroup");
  gameObject_Team = uiController:FindGameObject("TeamGroup");
  gameObject_MissionEffect = uiController:FindGameObject("Root_MissionEffect");
  transform_HideRoot = uiController:FindGameObject("HideRoot"):GetComponent("RectTransform");

  mission_OriginalWidth = uiController:FindGameObject("Mission"):GetComponent("RectTransform").rect.width;

  image_HideAll = uiController:FindImage("Image_HideAll");

  tempEvent = uiController:FindEvent("Image_HideAll");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_UISwitch);
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

  --minimap
  rectTransform_BG = uiController:FindImage("Image_MiniMapBG").rectTransform;
  
  text_Position = uiController:FindText("Text_Position");
  text_SceneName = uiController:FindText("Text_SceneName");

  rawImage_MiniMap = uiController:FindRawImage("RawImage_MiniMap");

  image_Mask = rawImage_MiniMap.transform.parent:GetComponent("Image");
  image_SwitchMap = uiController:FindImage("Image_SwitchMap");

  tempEvent = uiController:FindEvent("Image_SwitchMap");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_MapSwitch);

  tempEvent = uiController:FindEvent("Image_Info");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ChangeArea);
  
  --mission
  transform_Mission = uiController:FindGameObject("ScrollRect_Mission"):GetComponent("RectTransform");
  transform_MissionSize = uiController:FindGameObject("Image_MissionSize"):GetComponent("RectTransform");

  image_Mission = uiController:FindImage("Image_Mission");
  image_Team = uiController:FindImage("Image_Team");
  image_MissionSwitch = uiController:FindImage("Image_HideMission");
  transform_MissionSwitch = image_MissionSwitch:GetComponent("RectTransform");

  scrollContent_Mission = uiController:FindScrollContent("ScrollContent_Mission");
  scrollContent_Mission.onInitialize = this.OnInitialize_ScrollContent_Mission;
  scrollContent_Mission.onItemChange = this.OnItemChange_ScrollContent_Mission;
  scrollContent_Mission:Initialize(1);

  scrollContent_Team = uiController:FindScrollContent("ScrollContent_Team");
  scrollContent_Team.onInitialize = this.OnInitialize_ScrollContent_Team;
  scrollContent_Team.onItemChange = this.OnItemChange_ScrollContent_Team;
  scrollContent_Team:Initialize(4);
  
  event_Mission = uiController:FindEvent("Image_Mission");
  event_Mission:SetListener(EventTriggerType.PointerClick, this.OnClick_Mission);

  event_Team = uiController:FindEvent("Image_Team");
  event_Team:SetListener(EventTriggerType.PointerClick, this.OnClick_Team);

  event_HideMission = uiController:FindEvent("Image_HideMission");
  event_HideMission:SetListener(EventTriggerType.PointerClick, this.OnClick_MissionSwitch);
  event_HideMission.parameter = false;

  tempEvent = uiController:FindEvent("Image_MissionSize");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_MissionSize);

  tempEvent = uiController:FindEvent("Image_MissionFilter");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_MissionFilter);
  gameObject_MissionFilter = tempEvent.gameObject;

  --deathMatch
  gameObject_Deathmatch = uiController:FindGameObject("Image_Deathmatch");
  gameObject_Top3 = uiController:FindGameObject("GameObject_Top3");
  tempEvent = gameObject_Deathmatch:GetComponent("UIEvent");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_DeathMatch);

  local temp = nil;
  local rootObj = nil;
  for i = 1, 3 do 
    temp = {};
    rootObj = uiController:FindGameObject(string.Concat("GameObject_Rank", i));
    temp.text_Name = rootObj.transform:Find("Text_Name").gameObject:GetComponent("Text");
    temp.text_Count = rootObj.transform:Find("Text_Count").gameObject:GetComponent("Text");
    objs_Top3[i] = temp;
  end
  
  objs_My.gameObject = uiController:FindGameObject("GameObject_MySort");
  objs_My.text_Name = objs_My.gameObject.transform:Find("Text_Name").gameObject:GetComponent("Text");
  objs_My.text_Count = objs_My.gameObject.transform:Find("Text_Count").gameObject:GetComponent("Text");
  objs_My.image_Sort = objs_My.gameObject.transform:Find("Image_Sort").gameObject:GetComponent("Image");
end

function UIMiniMap.OnOpen()
  Function.UpdateVisible();

  if renderTexture == nil then
    renderTexture = RenderTexture.New(Scene.currentSceneHalfWidth * 2, Scene.currentSceneHalfHeight * 2, 24);

    rawImage_MiniMap.texture = renderTexture;
    Scene.miniMapCamera.targetTexture = renderTexture;

    rectTransform_BG.sizeDelta = Vector2.New(rectTransform_BG.sizeDelta.x, (rectTransform_BG.sizeDelta.x / Screen.width) * Screen.height);
    this.mapHight = rectTransform_BG.sizeDelta.y;
  end

  if SceneManager.sceneState.type ~= ESceneType.Hole then
    UI.showMiniMap = false;
  end
  
  --LuaHelper.SetColor(image_Mask, MapManager.mapData.color);
  
  currentTag = EUIMainTag.Mission;
  
  this.UpdateScene();
  this.UpdatePosition();
  this.UpdateTag();
  this.UpdateDeathMatch();

  this.UpdateVisible();

  return true;
end

function UIMiniMap.OnVisible()
  Function.UpdateAniBtn();
end

function UIMiniMap.UpdateVisible(visible)
  if visible ~= nil then
    UI.showMainUI = visible;
    UI.showMission = visible;
  end
  
  if UI.IsVisible(UIFight) then
    UI.Open(UIMain);
    UI.Open(UINewChat);
  else
    if UI.showMainUI then
      UI.Open(UIMain);
      UI.Open(UIMainFunction);
      UI.Open(UINewChat);
  
      gameObject_Info:SetActive(true);
  
      image_HideAll.color = LuaHelper.GetColor(255, 255, 255, 255);
    else
      UI.Close(UIMain);
      UI.Close(UIMainFunction);
      UI.Close(UINewChat);
  
      gameObject_Info:SetActive(false);
  
      image_HideAll.color = LuaHelper.GetColor(255, 255, 255, 160);
    end
  end
  
  this.UpdateMiniMap();
  this.UpdateMissionVisible();
end

function UIMiniMap.OnClick_UISwitch()
  this.UpdateVisible(not UI.showMainUI);
end

--minimap
function UIMiniMap.UpdateScene()
  if HouseManager.IsInHouse() then
    if SceneManager.sceneId == 10821 then
      text_SceneName.text = SceneManager.sceneState.name;
    else
      text_SceneName.text = string.Concat(string.format(string.Get(23528), HouseManager.GetCurrentBuilding(), HouseManager.GetCurrentFloor()));
    end
  else
    text_SceneName.text = SceneManager.sceneState.name;
  end
end

function UIMiniMap.UpdatePosition()
  if Role.player ~= nil then
    text_Position.text = string.Concat(string.Get(10126), ":", SceneManager.instanceId, " ", string.Get(49060), ":", math.floor(Role.player.position.x), ".", math.floor(Role.player.position.y));
  else
    text_Position.text = "";
  end
end

function UIMiniMap.UpdateMiniMap(visible)
  if visible ~= nil then
    UI.showMiniMap = visible;
  end

  if UI.showMiniMap then
    image_SwitchMap.sprite = UI.GetSprite("but164");
  else
    image_SwitchMap.sprite = UI.GetSprite("but163");
  end

  Scene.miniMapCamera.gameObject:SetActive(UI.showMainUI and UI.showMiniMap);
  rectTransform_BG.gameObject:SetActive(UI.showMainUI and UI.showMiniMap);
  
  gameObject_SwitchMap:SetActive(SceneManager.sceneState.type == ESceneType.Hole);
end

function UIMiniMap.OnClick_MapSwitch(uiEvent)
  this.UpdateMiniMap(not UI.showMiniMap);
end

function UIMiniMap.OnClick_ChangeArea()
  --C:007-001 <要分區列表>
  Network.Send(7, 1);
  
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

--mission
function UIMiniMap.UpdateTag(refresh)
  local missionShow = Function.CheckShow(235);
  local teamShow = Function.CheckShow(236);

  if not teamShow then
    currentTag = EUIMainTag.Mission;
  end

  --mission
  gameObject_Mission:SetActive(missionShow and currentTag == EUIMainTag.Mission);

  event_Mission.gameObject:SetActive(missionShow);
  if currentTag == EUIMainTag.Mission then
    image_Mission.sprite = UI.GetSprite("but115L");
  else
    image_Mission.sprite = UI.GetSprite("but115D");
  end

  --team
  gameObject_Team:SetActive(teamShow and currentTag == EUIMainTag.Team);

  event_Team.gameObject:SetActive(teamShow);
  if currentTag == EUIMainTag.Team then
    image_Team.sprite = UI.GetSprite("but115L");
  else
    image_Team.sprite = UI.GetSprite("but115D");
  end

  if currentTag == EUIMainTag.Mission then
    this.UpdateMission(refresh);
  elseif currentTag == EUIMainTag.Team then
    this.UpdateTeam();
  end
end

function UIMiniMap.UpdateMission(refresh, showAll)
  if showAll ~= nil then
    UI.showAllMission = showAll
  end

  scrollContent_Mission.autoFit = UI.showAllMission;

  local sceneData = sceneDatas[SceneManager.sceneId];
  table.Clear(missionDatas);
  for k, v in pairs(MarkManager.showMissions) do
    if not MarkManager.IsHideMission(v) then
      if SceneManager.dungeonId == 0 or (markDatas[v] ~= nil and Contains(markDatas[v].kind, 4, 5)) then
        table.insert(missionDatas, v);
      end
    end
  end

  local missionCount = table.maxn(missionDatas);

  transform_MissionSize.gameObject:SetActive(missionCount > 2);

  if not UI.showAllMission then
    missionCount = math.min(missionCount, 2);
    refresh = false;
  end

  if UI.showAllMission then
    transform_Mission.sizeDelta = Vector2.New(205, 355);
    transform_MissionSize.localRotation = Quaternion.Euler(0, 0, 270);
  else
    transform_Mission.sizeDelta = Vector2.New(205, 150);
    transform_MissionSize.localRotation = Quaternion.Euler(0, 0, 90);
  end

  if refresh ~= false then
    scrollContent_Mission:Refresh(missionCount);
  else
    scrollContent_Mission:Reset(missionCount);
  end

  transform_MissionSize.localPosition = transform_Mission.localPosition + Vector3.New(transform_Mission.sizeDelta.x * -0.5, -transform_Mission.sizeDelta.y, 0);
end

function UIMiniMap.UpdateTeam()
  teamDatas = Team.GetMember(Role.playerId, false);
  
  if table.maxn(teamDatas) < Team.maxMember - 1 and (Team.IsLeader(Role.playerId) or Team.IsAlone(Role.playerId)) then
    table.insert(teamDatas, "+");
  end

  scrollContent_Team:Refresh(table.maxn(teamDatas));
end

function UIMiniMap.UpdateMissionVisible(visible)
  if Role.player ~= nil and Role.player.data.isWatching then
    visible = false;
  end

  if visible ~= nil then
    UI.showMission = visible;
  end

  if UI.showMission then
    LuaHelper.DoTweenAnchoredPosition(transform_HideRoot, Vector2.zero, 0.5);
    event_HideMission.parameter = false;
    transform_MissionSwitch.localScale = Vector3.one;
    gameObject_MissionFilter:SetActive(true);
  else
    LuaHelper.DoTweenAnchoredPosition(transform_HideRoot, Vector2.New(mission_OriginalWidth, 0), 0.5);
    event_HideMission.parameter = true;
    transform_MissionSwitch.localScale = Vector3.New(-1, 1, 1);
    gameObject_MissionFilter:SetActive(false);
  end
end

function UIMiniMap.OnClick_Mission()
  if currentTag == EUIMainTag.Mission then
    UI.Open(UIMission);    
    return;
  end

  currentTag = EUIMainTag.Mission;

  this.UpdateTag(false);
end

function UIMiniMap.OnClick_Team()
  if currentTag == EUIMainTag.Team then
    UI.Open(UITeam);
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

  currentTag = EUIMainTag.Team;

  this.UpdateTag(false);
end

function UIMiniMap.OnClick_MissionSwitch(uiEvent)
  this.UpdateMissionVisible(uiEvent.parameter);
end

function UIMiniMap.OnClick_MissionSize()
  this.UpdateMission(false, not UI.showAllMission);
end

function UIMiniMap.OnClick_MissionFilter()
  UI.Open(UIMissionSwitch);
end

function UIMiniMap.OnClick_MissionInfo(uiEvent)
  local missionId = uiEvent.parameter;

  if Team.IsMember(Role.playerId) and not Team.IsLeader(Role.playerId) then
    ShowCenterMessage(string.Get(20519));
    return;
  end

  if not Role.CanControl() then return end

  local mission = MarkManager.GetMission(missionId);

  if mission == nil then return end
  if markDatas[mission.id] == nil then return end
  if markDatas[mission.id].steps == nil then return end
  if markDatas[mission.id].steps[mission.step] == nil then return end

  if markDatas[mission.id].steps[mission.step].checkTeam and not Team.IsMember(Role.playerId) then
    ShowCheckMessage(
      function(result)
        if result then
          MarkManager.Navigation(missionId);
        end
      end,
      string.Get(21543),
      Role.player
    );
    return;
  end

  MarkManager.Navigation(missionId);
end

function UIMiniMap.OnClick_TeamFind()
  if not MarkManager.GetMissionFlag(11804) then
    ShowCenterMessage(string.Get(21152));
    return;
  end

  if Team.IsLeader(Role.playerId) then
    UI.Open(UITeam, EUITeamTag.FindPlayer);
  else
    UI.Open(UITeam, EUITeamTag.FindTeam);
  end
end

function UIMiniMap.OnInitialize_ScrollContent_Mission(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Mission[itemIndex] = {};
    scrollItems_Mission[itemIndex].image_BG = scrollItems[itemIndex]:Find("Image_BG"):GetComponent("Image");
    scrollItems_Mission[itemIndex].event_Mission = scrollItems[itemIndex]:GetComponent("UIEvent");
    scrollItems_Mission[itemIndex].event_Mission:SetListener(EventTriggerType.PointerClick, this.OnClick_MissionInfo);

    scrollItems_Mission[itemIndex].image_Shine = scrollItems[itemIndex]:Find("Image_Shine"):GetComponent("Image");
    scrollItems_Mission[itemIndex].text_Title = scrollItems[itemIndex]:Find("Text_Title"):GetComponent("Text");
    scrollItems_Mission[itemIndex].text_Description = scrollItems[itemIndex]:Find("Text_Description"):GetComponent("Text");
  end
end

function UIMiniMap.OnItemChange_ScrollContent_Mission(dataIndex, itemIndex)
  local showMissionId = missionDatas[dataIndex + 1];

  if showMissionId == nil then return false end
  if markDatas[showMissionId] == nil then return false end

  if showMissionId == MarkManager.navigationMissionId then
    LuaHelper.SetColor(scrollItems_Mission[itemIndex].image_BG, Color.Yellow);
  else
    LuaHelper.SetColor(scrollItems_Mission[itemIndex].image_BG, Color.White);
  end

  scrollItems_Mission[itemIndex].event_Mission.parameter = showMissionId;

  scrollItems_Mission[itemIndex].image_Shine.gameObject:SetActive(MarkManager.CheckShine(showMissionId));

  scrollItems_Mission[itemIndex].text_Title.text = string.Concat(string.AddBrackets(string.GetMissionKind(markDatas[showMissionId].kind)), markDatas[showMissionId].name);
  scrollItems_Mission[itemIndex].text_Description.text = string.ChangeSymbol(markDatas[showMissionId].description);

  local mission = MarkManager.GetMission(showMissionId);

  if mission == nil then return true end
  if markDatas[mission.id] == nil then return true end
  if markDatas[mission.id].steps == nil then return true end

  local step = markDatas[mission.id].steps[mission.step];

  if step ~= nil then
    local doneCondition = true;
    local description = "";
    local lastKind = 0;

    for i = 1, 5 do
      local condition = step.conditions[i];
      local currentCount = 0;

      if condition.kind == 1 and npcDatas[condition.id] ~= nil then
        --捕捉npc
        if description ~= "" then
          description = string.Concat(description, "、");
        end
        --[[
        if lastKind ~= condition.kind then
          description = string.Concat(description, string.Get(20294));
        else
          description = string.Concat(description, "、");
        end
        --]]
        
        if Role.GetFollowNpc(Role.playerId, condition.id) ~= nil then
          description = string.Concat(description, string.GetColorText(string.Concat(npcDatas[condition.id].name, "(1/1)"), Color.Goal));
        else
          description = string.Concat(description, string.GetColorText(string.Concat(npcDatas[condition.id].name, "(0/1)"), Color.UnsatisfiedGoal));

          doneCondition = false;
        end

      elseif condition.kind == 2 and npcDatas[condition.id] ~= nil then
        --擊殺npc

      elseif condition.kind == 3 and itemDatas[condition.id] ~= nil then
        --收集道具
        if description ~= "" then
          description = string.Concat(description, "、");
        end
        --[[
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
        if lastKind ~= condition.kind then
          description = string.Concat(description, string.Get(99653));
        else
          description = string.Concat(description, "、");
        end
        --]]

        local count = Item.GetItemCount(condition.id);
        
        if count >= condition.count then
          description = string.Concat(description, string.GetColorText(string.Concat(itemDatas[condition.id]:GetName(true), "(", math.min(count, condition.count), "/", condition.count, ")"), Color.Goal));
        else
          description = string.Concat(description, string.GetColorText(string.Concat(itemDatas[condition.id]:GetName(true), "(", math.min(count, condition.count), "/", condition.count, ")"), Color.UnsatisfiedGoal));

          doneCondition = false;
        end
      end
      
      lastKind = condition.kind;
    end
    
    if doneCondition then
      description = step.endGuide;

      if string.Count(description) > 20 then
        description = string.Concat(string.Sub(description, 1, 20), "...");
      end

      -- description = string.GetColorText(description, Color.VeryLightBlue);
    end

    scrollItems_Mission[itemIndex].text_Description.text = description;
  end

  local timeMission = MarkManager.GetTimeMission(mission.id);
  if timeMission ~= nil then
    if timeMission.time > 0 then
      scrollItems_Mission[itemIndex].text_Description.text = string.Concat(scrollItems_Mission[itemIndex].text_Description.text, " ", string.GetColorText(string.Concat(string.Get(90086), timeMission.time, string.Get(90087)), Color.Red));
    else
      scrollItems_Mission[itemIndex].text_Description.text = string.Concat(scrollItems_Mission[itemIndex].text_Description.text, " ", string.GetColorText(string.Get(90089), Color.Red));
    end
  end
  
  return true;
end

function UIMiniMap.OnInitialize_ScrollContent_Team(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Team[itemIndex] = {};
    scrollItems_Team[itemIndex].image_BG = scrollItems[itemIndex]:Find("Image_BG"):GetComponent("Image");
    scrollItems_Team[itemIndex].event_TeamState = scrollItems[itemIndex]:Find("Image_Find"):GetComponent("UIEvent");
    scrollItems_Team[itemIndex].event_TeamState:SetListener(EventTriggerType.PointerClick, this.OnClick_TeamFind);

    local tempTransform = scrollItems_Team[itemIndex].image_BG.transform;
    scrollItems_Team[itemIndex].slider_Hp = tempTransform:Find("Slider_Hp"):GetComponent("Slider");
    scrollItems_Team[itemIndex].text_Hp = scrollItems_Team[itemIndex].slider_Hp.transform:Find("Text_Hp"):GetComponent("Text");
    scrollItems_Team[itemIndex].slider_Sp = tempTransform:Find("Slider_Sp"):GetComponent("Slider");
    scrollItems_Team[itemIndex].text_Sp = scrollItems_Team[itemIndex].slider_Sp.transform:Find("Text_Sp"):GetComponent("Text");
    scrollItems_Team[itemIndex].text_Lv = tempTransform:Find("Text_Lv"):GetComponent("Text");
    scrollItems_Team[itemIndex].text_Name = scrollItems_Team[itemIndex].text_Lv.transform:Find("Text_Name"):GetComponent("Text");
    scrollItems_Team[itemIndex].uiCareer = UICareerController.New(tempTransform:Find("Career"));
    scrollItems_Team[itemIndex].image_TeamState = tempTransform:Find("Image_TeamState"):GetComponent("Image");
  end
end

function UIMiniMap.OnItemChange_ScrollContent_Team(dataIndex, itemIndex)
  if teamDatas == nil or teamDatas[dataIndex + 1] == nil then return false end
  
  local teamInfo = teamDatas[dataIndex + 1];

  if teamInfo == "+" then
    scrollItems_Team[itemIndex].image_BG.gameObject:SetActive(false);
    scrollItems_Team[itemIndex].event_TeamState.gameObject:SetActive(true);
  else
    scrollItems_Team[itemIndex].image_BG.gameObject:SetActive(true);
    scrollItems_Team[itemIndex].event_TeamState.gameObject:SetActive(false);

    scrollItems_Team[dataIndex].text_Name.text = teamInfo.name;
    scrollItems_Team[dataIndex].text_Lv.text = teamInfo:GetAttribute(EAttribute.Lv);
  
    scrollItems_Team[dataIndex].text_Hp.text = string.Concat(teamInfo:GetAttribute(EAttribute.Hp), " / ", teamInfo:GetAttribute(EAttribute.MaxHp));
    scrollItems_Team[dataIndex].slider_Hp.maxValue = teamInfo:GetAttribute(EAttribute.MaxHp);
    scrollItems_Team[dataIndex].slider_Hp.value = teamInfo:GetAttribute(EAttribute.Hp);
  
    scrollItems_Team[dataIndex].text_Sp.text = string.Concat(teamInfo:GetAttribute(EAttribute.Sp), " / ", teamInfo:GetAttribute(EAttribute.MaxSp));
    scrollItems_Team[dataIndex].slider_Sp.maxValue = teamInfo:GetAttribute(EAttribute.MaxSp);
    scrollItems_Team[dataIndex].slider_Sp.value = teamInfo:GetAttribute(EAttribute.Sp);
  
    scrollItems_Team[itemIndex].uiCareer:SetCareer(teamInfo:GetAttribute(EAttribute.Turn), teamInfo:GetAttribute(EAttribute.Element), teamInfo:GetAttribute(EAttribute.Career, false, teamInfo:GetAttribute(EAttribute.Turn3Element)));
    scrollItems_Team[itemIndex].image_TeamState.gameObject:SetActive(Team.IsAdviser(teamInfo.index));
  end

  return true;
end

function UIMiniMap.MissionCompleted()
  AnimationController.Play(5, gameObject_MissionEffect.transform, nil, nil, nil);
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

--deathMatch
function UIMiniMap.Clear()
  deathMatchDatas = {};
end
  
function UIMiniMap.ReciveDeathMatchData(data)
  local count = data:ReadByte();
  deathMatchDatas = {};
  for i = 1, count do 
    deathMatchDatas[i] = {};
    deathMatchDatas[i].name = data:ReadString(data:ReadByte());
    deathMatchDatas[i].count = data:ReadUInt16();
  end
  this.UpdateDeathMatch();
end

function UIMiniMap.OnClick_DeathMatch(event)
  gameObject_Top3:SetActive(not gameObject_Top3.activeInHierarchy);
end

function UIMiniMap.UpdateDeathMatch()
  if Role.player.activityKind ~= ERoleActivityInfo.DeathMatch or not Contains(SceneManager.sceneId, 49952) then 
    gameObject_Deathmatch:SetActive(false);
    return;
  end
  gameObject_Deathmatch:SetActive(true);

  local rank = 0;
  for i = 1, 3 do 
    local data = deathMatchDatas[i];
    if data ~= nil then 
      if data.name == Role.player.name then 
        rank  = i;
      end
      objs_Top3[i].text_Name.text = data.name;
      objs_Top3[i].text_Count.text = data.count;
    else
      objs_Top3[i].text_Name.text = "";
      objs_Top3[i].text_Count.text = ""; 
    end
  end
  
  objs_My.text_Name.text = Role.player.name;
  objs_My.text_Count.text = Role.player.activityInfo.count;

  if rank == 0 then 
    objs_My.image_Sort.gameObject:SetActive(false);
  else
    objs_My.image_Sort.gameObject:SetActive(true);
    objs_My.image_Sort.sprite = UI.GetSprite( string.Concat("icon0", rank + 14));  
  end
end