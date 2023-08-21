
UIDataFight = {}
local this = UIDataFight;

this.name = "UIDataFight";
this.uiController = nil;

--ui
local gameObject_Team;
local gameObject_Npc;
local gameObject_History;
local gameObject_Award;

local rawImage_BG1;
local rawImage_BG2;
local rawImage_BG3;
local rawImage_Class;
local rawImage_TodayScore;

local slider_TodayScore;

local text_Class;
local text_Name;
local text_Score;
local text_Rank;
local text_Times;
local text_TodayScore;
local text_NpcFight;

local enemyUIs = {};

local event_RankAward;

--team
local teamUIs = {};

local scrollContent_Npc;
local scrollItems_Npc = {};

--history
local scrollContent_History;
local scrollItems_History = {};

--Award
local text_Award;
local item_Award = {};
local event_Award;

--var
local npcInfos = {};

--ui
function UIDataFight.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;

  local tempEvent;
  local tempTransform;

  gameObject_History = uiController:FindGameObject("History");
  gameObject_Team = uiController:FindGameObject("Team");
  gameObject_Npc = uiController:FindGameObject("Npc");
  gameObject_Award = uiController:FindGameObject("Award");

  rawImage_BG1 = uiController:FindRawImage("RawImage_BG (1)");
  rawImage_BG2 = uiController:FindRawImage("RawImage_BG (2)");
  rawImage_BG3 = uiController:FindRawImage("RawImage_BG (3)");
  rawImage_Class = uiController:FindRawImage("RawImage_Class");
  rawImage_TodayScore = uiController:FindRawImage("RawImage_TodayScore");

  slider_TodayScore = uiController:FindSlider("Slider_TodayScore");

  text_Class = uiController:FindText("Text_Class");
  text_Name = uiController:FindText("Text_Name");
  text_Score = uiController:FindText("Text_Score");
  text_Rank = uiController:FindText("Text_Rank");
  text_Times = uiController:FindText("Text_Times");
  text_TodayScore = uiController:FindText("Text_TodayScore");
  text_NpcFight = uiController:FindText("Text_NpcFight");
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------

  for i = 1, DataFight.maxEnemy do
    tempTransform = uiController:FindGameObject("Enemy").transform:Find(string.Concat("Image_Enemy (", i, ")"));
    enemyUIs[i] = {};
    enemyUIs[i].gameObject = tempTransform.gameObject;
    enemyUIs[i].event_Fight = tempTransform:GetComponent("UIEvent");
    enemyUIs[i].event_Fight:SetListener(EventTriggerType.PointerClick, this.OnClick_FightList);
    enemyUIs[i].event_Fight.parameter = i;
    enemyUIs[i].text_Level = tempTransform:Find("Text_Level"):GetComponent("Text");
    enemyUIs[i].text_Name = tempTransform:Find("Text_Name"):GetComponent("Text");
    enemyUIs[i].rawImage_Class = tempTransform:Find("RawImage_Class"):GetComponent("RawImage");
    enemyUIs[i].text_Class = enemyUIs[i].rawImage_Class.transform:Find("Text_Class"):GetComponent("Text");
    enemyUIs[i].text_Score = tempTransform:Find("Text_Score"):GetComponent("Text");
    enemyUIs[i].uiCareer = UICareerController.New(enemyUIs[i].text_Level.transform:Find("Career"));
  end

  tempEvent = uiController:FindEvent("Image_Close");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);

  tempEvent = uiController:FindEvent("Image_Help");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Help);

  event_RankAward = uiController:FindEvent("Image_RankAward");
  event_RankAward:SetListener(EventTriggerType.PointerClick, this.OnClick_RankAward);

  tempEvent = uiController:FindEvent("RawImage_TodayScore");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_TodayAward);

  tempEvent = uiController:FindEvent("Image_Team");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Team);

  tempEvent = uiController:FindEvent("Image_Refresh");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Refresh);

  tempEvent = uiController:FindEvent("Image_History");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_History);

  tempEvent = uiController:FindEvent("Image_Store");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Store);

  --team
  for i = 0, DataFight.maxTeamNpc do
    tempTransform = uiController:FindGameObject("Image_TeamBG").transform:Find(string.Concat("Team (", i, ")"));
    teamUIs[i] = {};
    teamUIs[i].npcId = 0;
    teamUIs[i].uiCareer = UICareerController.New(tempTransform:Find("Career"));
    teamUIs[i].text_Name = tempTransform:Find("Text_Name"):GetComponent("Text");
    teamUIs[i].text_Level = tempTransform:Find("Text_Lv"):GetComponent("Text");
    teamUIs[i].text_Hp = tempTransform:Find("Text_Hp"):GetComponent("Text");
    teamUIs[i].gameObject_Empty = tempTransform:Find("Image_Empty").gameObject;

    if i == 0 then
      tempEvent = tempTransform:Find("Image_SaveTeam"):GetComponent("UIEvent");
      tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_SaveTeam);
    else
      tempEvent = tempTransform:Find("Image_ChooseNpc"):GetComponent("UIEvent");
      tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ChooseNpc);
      tempEvent.parameter = i;

      teamUIs[i].text_ChooseNpc = tempEvent.transform:Find("Text_"):GetComponent("Text");
    end

    teamUIs[i].skills = {};
    for j = 1, DataFight.maxTeamSkill do
      local skillTransform = tempTransform:Find(string.Concat("Image_Skill (", j, ")"));
      teamUIs[i].skills[j] = {};
      teamUIs[i].skills[j].skillId = 0;
      teamUIs[i].skills[j].rawImage_Icon = skillTransform:Find("RawImage_Icon"):GetComponent("RawImage");
      teamUIs[i].skills[j].event_Remove = skillTransform:Find("Image_Close"):GetComponent("UIEvent");
      teamUIs[i].skills[j].event_Remove:SetListener(EventTriggerType.PointerClick, this.OnClick_RemoveSkill);
      teamUIs[i].skills[j].event_Remove.parameter = i * 100 + j;
      tempEvent = skillTransform:GetComponent("UIEvent");
      tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ChooseSkill);
      tempEvent.parameter = i * 100 + j;
    end
  end

  scrollContent_Npc = uiController:FindScrollContent("ScrollContent_Npc");
  scrollContent_Npc.onInitialize = this.OnInitialize_ScrollContent_Npc;
  scrollContent_Npc.onItemChange = this.OnItemChange_ScrollContent_Npc;
  scrollContent_Npc:Initialize(1);

  tempEvent = gameObject_Team:GetComponent("UIEvent");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_CloseTeam);

  tempEvent = gameObject_Npc:GetComponent("UIEvent");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_CloseNpc);

  --history
  scrollContent_History = uiController:FindScrollContent("ScrollContent_History");
  scrollContent_History.onInitialize = this.OnInitialize_ScrollContent_History;
  scrollContent_History.onItemChange = this.OnItemChange_ScrollContent_History;
  scrollContent_History:Initialize(1);

  tempEvent = gameObject_History:GetComponent("UIEvent");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_CloseHistory);

  --award
  text_Award = uiController:FindText("Text_Award");
  for i = 1, 3 do
    item_Award[i] = UIItemController.New(uiController:FindImage(string.Concat("Image_Award (", i, ")")).transform);
  end
  
  event_Award = uiController:FindEvent("Image_Award");
  event_Award:SetListener(EventTriggerType.PointerClick, this.OnClick_Award);

  tempEvent = gameObject_Award:GetComponent("UIEvent");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_CloseAward);
end

function UIDataFight.OnOpen()
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  gameObject_Team:SetActive(false);
  gameObject_History:SetActive(false);
  gameObject_Npc:SetActive(false);
  gameObject_Award:SetActive(false);

  this.UpdateUI();

  return true;
end

function UIDataFight.OnClose()
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  return true;
end

function UIDataFight.UpdateUI()
  TextureManager.SetPng(ETextureUseType.UI, "pic_006", rawImage_BG1);
  TextureManager.SetPng(ETextureUseType.UI, "common0_bod102", rawImage_BG2);
  TextureManager.SetPng(ETextureUseType.UI, "common0_bod102", rawImage_BG3);
  DataFight.SetClassTexture(rawImage_Class, DataFight.class);

  text_Class.text = ((DataFight.class - 1) % DataFight.classRange) + 1;
  text_Name.text = Role.player.name
  text_Score.text = DataFight.score;

  if DataFight.rank > 0 then
    text_Rank.text = DataFight.rank;
  else
    text_Rank.text = "---";
  end

  event_RankAward.gameObject:SetActive(DataFight.awardAvailible);

  text_Times.text = string.format(string.Get(22663), math.max(DataFight.maxDailyFightTimes - RoleCount.Get(ERoleCount.DataFight), 0));

  if DataFight.npcFightCount < 10 then
    text_NpcFight.text = string.format(string.Get(22744), DataFight.npcFightCount);
    text_NpcFight.gameObject:SetActive(true);
    slider_TodayScore.gameObject:SetActive(false);
  else
    text_NpcFight.gameObject:SetActive(false);
    slider_TodayScore.gameObject:SetActive(true);
  end

  local showMaxScore = dataFightGoalDatas[math.clamp(DataFight.todayAwardIndex + 1, 1, #dataFightGoalDatas)].score;
  
  slider_TodayScore.maxValue = showMaxScore;
  slider_TodayScore.value = math.min(DataFight.todayScore, showMaxScore);

  text_TodayScore.text = string.format(string.Get(22669), DataFight.todayScore, showMaxScore);
  TextureManager.SetPng(ETextureUseType.UI, "Ani_Reward", rawImage_TodayScore);
  
  TextureManager.SetPng(ETextureUseType.UI, "Ani_Reward", rawImage_TodayScore); 
  if DataFight.todayAwardIndex == #dataFightGoalDatas then
    rawImage_TodayScore.shiftCount = 1;
    rawImage_TodayScore.raycastTarget = false;
    LuaHelper.SetColor(rawImage_TodayScore, Color.LightGray);
  elseif DataFight.todayScore >= showMaxScore then
    rawImage_TodayScore.shiftCount = 4;
    rawImage_TodayScore.raycastTarget = true;
    LuaHelper.SetColor(rawImage_TodayScore, Color.White);
  else
    rawImage_TodayScore.shiftCount = 1;
    rawImage_TodayScore.raycastTarget = false;
    LuaHelper.SetColor(rawImage_TodayScore, Color.LightGray);
  end

  this.UpdateEnemy();
  this.UpdateTeam();
  this.UpdateHistory();
  this.UpdateAward();
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
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

end

function UIDataFight.UpdateEnemy()
  for i = 1, DataFight.maxEnemy do
    local playerInfo = DataFight.enemyInfos[i];
    
    if playerInfo ~= nil then
      enemyUIs[i].gameObject:SetActive(true);
      enemyUIs[i].text_Level.text = playerInfo.level;
      enemyUIs[i].text_Name.text = playerInfo.name;
      DataFight.SetClassTexture(enemyUIs[i].rawImage_Class, playerInfo.class);
      enemyUIs[i].text_Class.text = ((playerInfo.class - 1) % DataFight.classRange) + 1;
      enemyUIs[i].text_Score.text = playerInfo.score;
      enemyUIs[i].uiCareer:SetCareer(playerInfo.turn, playerInfo.element, playerInfo.career, false, playerInfo.turn3Info.element);
    else
      enemyUIs[i].gameObject:SetActive(false);
  end
  end
end

function UIDataFight.Fight(kind, index)
  if RoleCount.Get(ERoleCount.DataFight) < DataFight.maxDailyFightTimes then
    --C:099-006 <選擇對手> +對手種類(1) +對手索引(1)
    sendBuffer:Clear();
    sendBuffer:WriteByte(kind);
    sendBuffer:WriteByte(index);
    Network.Send(99, 6, sendBuffer);
  else
    UISell.Launch(53, nil, kind, index);
  end
end

function UIDataFight.OnClick_Close(uiEvent)
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
  UI.Close(UIDataFight);
end

function UIDataFight.OnClick_Help(uiEvent)
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
  
  UI.Open(UITutorialHint, 0, this, string.Get(22707), string.Get(22708));
end

function UIDataFight.OnClick_FightList(uiEvent)
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
  
  if not Team.IsAlone(Role.playerId) then
    ShowCenterMessage(string.Get(22791));
    return;
  end

  ShowCheckMessage(
    function(result)
      if result then
        if not Team.IsAlone(Role.playerId) then
          ShowCenterMessage(string.Get(22791));
          return;
        end

        this.Fight(1, uiEvent.parameter);
      end
    end,
    string.format(string.Get(22812), DataFight.enemyInfos[uiEvent.parameter].name),
    Role.player
  );
end

function UIDataFight.OnClick_RankAward(uiEvent)
  local bestAwardRank = nil;
  for rank in pairs(dataFightAwardDatas) do
    if rank >= DataFight.awardRank then
      if bestAwardRank == nil or rank < bestAwardRank then
        bestAwardRank = rank;
      end
    end
  end

  gameObject_Award:SetActive(true);
  
  this.UpdateAward();
end

function UIDataFight.OnClick_TodayAward(uiEvent)
  --C:099-005 <領取今日積分獎勵>
  Network.Send(99, 5);
end

function UIDataFight.OnClick_Team(uiEvent)
  gameObject_Team:SetActive(true);
  
  this.UpdateTeam(true);
end

function UIDataFight.OnClick_Refresh(uiEvent)
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
  --C:099-001 <刷新對手>
  Network.Send(99, 1);
end

function UIDataFight.OnClick_History(uiEvent)
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
  gameObject_History:SetActive(true);

  this.UpdateHistory(true);
end

function UIDataFight.OnClick_Store(uiEvent)
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
  UI.Open(UIMall, mainPage, subPage);
end

--team
function UIDataFight.ClearTeamInfo(teamIndex)
  teamUIs[teamIndex].npcId = 0;
  teamUIs[teamIndex].level = 0;
  teamUIs[teamIndex].hp = 0;
  teamUIs[teamIndex].extraSkills = nil;
  for j = 1, DataFight.maxTeamSkill do
    teamUIs[teamIndex].skills[j].skillId = 0;
  end
end

function UIDataFight.GetTeamIndex(npcId)
  for i = 1, DataFight.maxTeamNpc do
    if teamUIs[i].npcId == npcId then
      return i;
    end
  end

  return nil;
end

function UIDataFight.UpdateTeam(reset)
  if not gameObject_Team.activeSelf then return end

  if reset then
    for i = 0, DataFight.maxTeamNpc do
      if DataFight.teamInfos[i] ~= nil then
        teamUIs[i].npcId = DataFight.teamInfos[i].npcId;
        teamUIs[i].level = DataFight.teamInfos[i].level;
        teamUIs[i].hp = DataFight.teamInfos[i].hp;
        teamUIs[i].extraSkills = DataFight.teamInfos[i].extraSkills;
        for j = 1, DataFight.maxTeamSkill do
          teamUIs[i].skills[j].skillId = DataFight.teamInfos[i].skills[j];
        end
      else
        this.ClearTeamInfo(i);
      end
    end
  end

  for i = 0, DataFight.maxTeamNpc do
    local npcData = npcDatas[teamUIs[i].npcId];
    if i == 0 then
      teamUIs[i].uiCareer:SetCareer(Role.player:GetAttribute(EAttribute.Turn), Role.player:GetAttribute(EAttribute.Element), Role.player:GetAttribute(EAttribute.Career), false, Role.player:GetAttribute(EAttribute.Turn3Element));
      teamUIs[i].text_Name.text = Role.player.name;
      teamUIs[i].text_Level.gameObject:SetActive(true);
      teamUIs[i].text_Level.text = Role.player:GetAttribute(EAttribute.Lv);
      teamUIs[i].text_Hp.gameObject:SetActive(true);
      teamUIs[i].text_Hp.text = Role.player:GetAttribute(EAttribute.MaxHp);
      teamUIs[i].gameObject_Empty.gameObject:SetActive(false);
      for j = 1, DataFight.maxTeamSkill do
        local skillData = skillDatas[teamUIs[i].skills[j].skillId];
        if skillData ~= nil then
          skillData:SetIcon(teamUIs[i].skills[j].rawImage_Icon);
          teamUIs[i].skills[j].rawImage_Icon.enabled = true;
          teamUIs[i].skills[j].event_Remove.gameObject:SetActive(true);
        else
          teamUIs[i].skills[j].rawImage_Icon.enabled = false;
          teamUIs[i].skills[j].event_Remove.gameObject:SetActive(false);
        end
      end
    elseif npcData ~= nil then
      teamUIs[i].uiCareer:SetCareer(npcData.turn, npcData.element, 0, true);
      teamUIs[i].text_Name.text = npcData.name;
      teamUIs[i].text_Level.gameObject:SetActive(true);
      teamUIs[i].text_Level.text = teamUIs[i].level;
      teamUIs[i].text_Hp.gameObject:SetActive(true);
      teamUIs[i].text_Hp.text = teamUIs[i].hp;
      teamUIs[i].gameObject_Empty.gameObject:SetActive(false);
      teamUIs[i].text_ChooseNpc.text = string.Get(22676);

      for j = 1, DataFight.maxTeamSkill do
        local skillData = skillDatas[teamUIs[i].skills[j].skillId];
        if skillData ~= nil then
          skillData:SetIcon(teamUIs[i].skills[j].rawImage_Icon);
          teamUIs[i].skills[j].rawImage_Icon.enabled = true;
          teamUIs[i].skills[j].event_Remove.gameObject:SetActive(true);
        else
          teamUIs[i].skills[j].rawImage_Icon.enabled = false;
          teamUIs[i].skills[j].event_Remove.gameObject:SetActive(false);
        end
      end
    else
      teamUIs[i].uiCareer:SetCareer();
      teamUIs[i].text_Name.text = "";
      teamUIs[i].text_Level.gameObject:SetActive(false);
      teamUIs[i].text_Hp.gameObject:SetActive(false);
      teamUIs[i].gameObject_Empty.gameObject:SetActive(true);
      teamUIs[i].text_ChooseNpc.text = string.Get(22745);

      for j = 1, DataFight.maxTeamSkill do
        teamUIs[i].skills[j].rawImage_Icon.enabled = false;
        teamUIs[i].skills[j].event_Remove.gameObject:SetActive(false);
      end
    end
  end
end

function UIDataFight.ShowTeamList(infos)
  npcInfos = infos;

  scrollContent_Npc:Reset(table.maxn(npcInfos));
  gameObject_Npc:SetActive(true);
end

function UIDataFight.OnClick_ChooseNpc(uiEvent)
  currentTeamIndex = uiEvent.parameter;

  --C:099-002 <查詢可用武將>
  Network.Send(99, 2);
end

function UIDataFight.OnClick_NpcSelect(uiEvent)
  local oriTeamIndex = this.GetTeamIndex(uiEvent.parameter.npcId);

  --武將本來就在隊伍中
  if oriTeamIndex ~= nil then
    local tempTeamInfo = nil;

    --目標位置有其他武將
    if teamUIs[currentTeamIndex].npcId ~= 0 then
      --將目標位置武將暫存
      tempTeamInfo = {};
      tempTeamInfo.npcId = teamUIs[currentTeamIndex].npcId;
      tempTeamInfo.level = teamUIs[currentTeamIndex].level;
      tempTeamInfo.hp = teamUIs[currentTeamIndex].hp;
      tempTeamInfo.extraSkills = teamUIs[currentTeamIndex].extraSkills;
      tempTeamInfo.skills = {};
      for j = 1, DataFight.maxTeamSkill do
        tempTeamInfo.skills[j] = teamUIs[currentTeamIndex].skills[j].skillId;
      end
    end

    --將本來位置武將移至目標
    teamUIs[currentTeamIndex].npcId = teamUIs[oriTeamIndex].npcId;
    teamUIs[currentTeamIndex].level = teamUIs[oriTeamIndex].level;
    teamUIs[currentTeamIndex].hp = teamUIs[oriTeamIndex].hp;
    teamUIs[currentTeamIndex].extraSkills = teamUIs[oriTeamIndex].extraSkills;
    for j = 1, DataFight.maxTeamSkill do
      teamUIs[currentTeamIndex].skills[j].skillId = teamUIs[oriTeamIndex].skills[j].skillId;
    end

    if tempTeamInfo ~= nil then
      --將暫存武將移回本來位置
      teamUIs[oriTeamIndex].npcId = tempTeamInfo.npcId;
      teamUIs[oriTeamIndex].level = tempTeamInfo.level;
      teamUIs[oriTeamIndex].hp = tempTeamInfo.hp;
      teamUIs[oriTeamIndex].extraSkills = tempTeamInfo.extraSkills;
      for j = 1, DataFight.maxTeamSkill do
        teamUIs[oriTeamIndex].skills[j].skillId = tempTeamInfo.skills[j];
      end
    else
      --將本來位置武將資料清空
      this.ClearTeamInfo(oriTeamIndex);
    end

  else
    this.ClearTeamInfo(currentTeamIndex);

    teamUIs[currentTeamIndex].npcId = uiEvent.parameter.npcId;
    teamUIs[currentTeamIndex].level = uiEvent.parameter.level;
    teamUIs[currentTeamIndex].hp = uiEvent.parameter.hp;
    teamUIs[currentTeamIndex].extraSkills = uiEvent.parameter.extraSkills;
  end

  gameObject_Npc:SetActive(false);

  this.UpdateTeam();
end

function UIDataFight.OnClick_ChooseSkill(uiEvent)
  local teamIndex = math.floor(uiEvent.parameter / 100);

  if teamIndex > 0 and teamUIs[teamIndex].npcId == 0 then return end

  local skillIndex = uiEvent.parameter % 10;

  UI.Open(UISkillPick,
    this.name,
    function(skillId)
      if skillId < 0 then return end
      if skillDatas[skillId] == nil then return end

      teamUIs[teamIndex].skills[skillIndex].skillId = skillId;

      if UI.IsVisible(UISkillPick) then
        UI.Close(UISkillPick);
      end

      this.UpdateTeam();
    end,
    teamUIs[teamIndex].npcId,
    teamUIs[teamIndex].extraSkills
  );
end

function UIDataFight.OnClick_RemoveSkill(uiEvent)
  local teamIndex = math.floor(uiEvent.parameter / 100);
  local skillIndex = uiEvent.parameter % 10;

  teamUIs[teamIndex].skills[skillIndex].skillId = 0;

  this.UpdateTeam();
end

function UIDataFight.OnClick_SaveTeam()
  --C:099-003 <設定出戰隊伍> +數量(1) <<+位置索引(1) +NPCID(2) +技能(2)*5>>
  sendBuffer:Clear();
  sendBuffer:WriteByte(DataFight.maxTeamNpc + 1);
  for i = 0, DataFight.maxTeamNpc do
    sendBuffer:WriteByte(i);
    sendBuffer:WriteUInt16(teamUIs[i].npcId);
    for j = 1, DataFight.maxTeamSkill do
      sendBuffer:WriteUInt16(teamUIs[i].skills[j].skillId);
    end
  end
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
  Network.Send(99, 3, sendBuffer);
end

function UIDataFight.OnClick_CloseTeam()
  gameObject_Team:SetActive(false);
end

function UIDataFight.OnClick_CloseNpc()
  gameObject_Npc:SetActive(false);
end

function UIDataFight.OnInitialize_ScrollContent_Npc(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Npc[itemIndex] = {};
    scrollItems_Npc[itemIndex].uiCareer = UICareerController.New(scrollItems[itemIndex]:Find("Career"));
    scrollItems_Npc[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_Npc[itemIndex].text_Level = scrollItems[itemIndex]:Find("Text_Lv"):GetComponent("Text");
    scrollItems_Npc[itemIndex].text_Hp = scrollItems[itemIndex]:Find("Text_Hp"):GetComponent("Text");
    scrollItems_Npc[itemIndex].event_Select = scrollItems[itemIndex]:Find("Image_Select"):GetComponent("UIEvent");
    scrollItems_Npc[itemIndex].event_Select:SetListener(EventTriggerType.PointerClick, this.OnClick_NpcSelect);
    scrollItems_Npc[itemIndex].image_Select = scrollItems[itemIndex]:Find("Image_Select"):GetComponent("Image");
    scrollItems_Npc[itemIndex].text_Select = scrollItems_Npc[itemIndex].image_Select.transform:Find("Text_"):GetComponent("Text");
  end
end

function UIDataFight.OnItemChange_ScrollContent_Npc(dataIndex, itemIndex)
  local npcInfo = npcInfos[dataIndex + 1];
  if npcInfo == nil then return false end

  local npcData = npcDatas[npcInfo.npcId];
  if npcData == nil then return false end
  
  scrollItems_Npc[itemIndex].uiCareer:SetCareer(npcData.turn, npcData.element, 0, true);
  scrollItems_Npc[itemIndex].text_Name.text = npcData.name;
  scrollItems_Npc[itemIndex].text_Level.gameObject:SetActive(true);
  scrollItems_Npc[itemIndex].text_Level.text = npcInfo.level;
  scrollItems_Npc[itemIndex].text_Hp.gameObject:SetActive(true);
  scrollItems_Npc[itemIndex].text_Hp.text = npcInfo.hp;
  scrollItems_Npc[itemIndex].event_Select.parameter = npcInfo;

  if this.GetTeamIndex(npcInfo.npcId) ~= nil then
    scrollItems_Npc[itemIndex].image_Select.sprite = UI.GetSprite("but167D");
    scrollItems_Npc[itemIndex].text_Select.text = string.Get(21669);
  else
    scrollItems_Npc[itemIndex].image_Select.sprite = UI.GetSprite("but064D");
    scrollItems_Npc[itemIndex].text_Select.text = string.Get(50316);
  end
  
  return true;
end

--history
function UIDataFight.UpdateHistory(reset)
  if not gameObject_History.activeSelf then return end

  if reset then
    scrollContent_History:Reset(table.maxn(DataFight.historyInfos));
  else
    scrollContent_History:Refresh(table.maxn(DataFight.historyInfos));
  end
end

function UIDataFight.OnClick_CloseHistory()
  gameObject_History:SetActive(false);
end

function UIDataFight.OnClick_Info(uiEvent)
  --C:014-009 <查詢玩家資訊> +玩家ID(8) +L(1) +名字(L)
  sendBuffer:Clear();
  sendBuffer:WriteInt64(uiEvent.parameter);
  Network.Send(14, 9, sendBuffer);
end

function UIDataFight.OnClick_FightHistory(uiEvent)
  if uiEvent.parameter == nil then return end

  local playerInfo = uiEvent.parameter;

  if not Team.IsAlone(Role.playerId) then
    ShowCenterMessage(string.Get(22791));
    return;
  end

  ShowCheckMessage(
    function(result)
      if result then
        if not Team.IsAlone(Role.playerId) then
          ShowCenterMessage(string.Get(22791));
          return;
        end
        
        this.Fight(2, playerInfo.index);
      end
    end,
    string.format(string.Get(22812), playerInfo.name),
    Role.player
  );
end

function UIDataFight.OnInitialize_ScrollContent_History(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_History[itemIndex] = {};
    scrollItems_History[itemIndex].image_Result = scrollItems[itemIndex]:Find("Image_Result"):GetComponent("Image");
    scrollItems_History[itemIndex].image_Result2 = scrollItems[itemIndex]:Find("Image_Result2"):GetComponent("Image");
    scrollItems_History[itemIndex].text_Result = scrollItems[itemIndex]:Find("Text_Result"):GetComponent("Text");
    scrollItems_History[itemIndex].uiCareer = UICareerController.New(scrollItems[itemIndex]:Find("Career"));
    scrollItems_History[itemIndex].text_Level = scrollItems[itemIndex]:Find("Text_Level"):GetComponent("Text");
    scrollItems_History[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_History[itemIndex].rawImage_Class = scrollItems[itemIndex]:Find("RawImage_Class"):GetComponent("RawImage");
    scrollItems_History[itemIndex].text_Class = scrollItems_History[itemIndex].rawImage_Class.transform:Find("Text_Class"):GetComponent("Text");
    scrollItems_History[itemIndex].text_Score = scrollItems[itemIndex]:Find("Text_Score"):GetComponent("Text");
    scrollItems_History[itemIndex].event_Info = scrollItems[itemIndex]:Find("Image_Info"):GetComponent("UIEvent");
    scrollItems_History[itemIndex].event_Info:SetListener(EventTriggerType.PointerClick, this.OnClick_Info);
    scrollItems_History[itemIndex].event_Fight = scrollItems[itemIndex]:Find("Image_Fight"):GetComponent("UIEvent");
    scrollItems_History[itemIndex].event_Fight:SetListener(EventTriggerType.PointerClick, this.OnClick_FightHistory);
  end
end

function UIDataFight.OnItemChange_ScrollContent_History(dataIndex, itemIndex)
  local playerInfo = DataFight.historyInfos[dataIndex + 1];
  if playerInfo == nil then return false end

  if playerInfo.result >= 0 then
    scrollItems_History[itemIndex].image_Result.sprite = UI.GetSprite("icon073");
    scrollItems_History[itemIndex].image_Result2.sprite = UI.GetSprite("com107");

    scrollItems_History[itemIndex].event_Fight:SetColor(Color.LightGray);
    scrollItems_History[itemIndex].event_Fight.parameter = nil;
  else
    scrollItems_History[itemIndex].image_Result.sprite = UI.GetSprite("icon074");
    scrollItems_History[itemIndex].image_Result2.sprite = UI.GetSprite("com108");

    if playerInfo.revenged then
      scrollItems_History[itemIndex].event_Fight:SetColor(Color.LightGray);
      scrollItems_History[itemIndex].event_Fight.parameter = nil;
    else
      scrollItems_History[itemIndex].event_Fight:SetColor(Color.White);
      scrollItems_History[itemIndex].event_Fight.parameter = playerInfo;
    end
  end
  scrollItems_History[itemIndex].text_Result.text = string.Concat(string.Get(22665), "     ", math.abs(playerInfo.result));

  scrollItems_History[itemIndex].uiCareer:SetCareer(playerInfo.turn, playerInfo.element, playerInfo.career, false, playerInfo.turn3Info.element);
  scrollItems_History[itemIndex].text_Level.text = playerInfo.level;
  scrollItems_History[itemIndex].text_Name.text = playerInfo.name;
  DataFight.SetClassTexture(scrollItems_History[itemIndex].rawImage_Class, playerInfo.class);
  scrollItems_History[itemIndex].text_Class.text = ((playerInfo.class - 1) % DataFight.classRange) + 1;
  scrollItems_History[itemIndex].text_Score.text = playerInfo.score;
  scrollItems_History[itemIndex].event_Info.parameter = playerInfo.roleId;

  return true;
end

--award
function UIDataFight.UpdateAward()
  if not gameObject_Award.activeSelf then return end

  text_Award.text = string.format(string.Get(22738), DataFight.awardRank);

  local bestAwardRank = nil;
  for rank in pairs(dataFightAwardDatas) do
    if rank >= DataFight.awardRank then
      if bestAwardRank == nil or rank < bestAwardRank then
        bestAwardRank = rank;
      end
    end
  end

  if bestAwardRank == nil then
    ShowCheckMessage("GGGGGGG");
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
    gameObject_Award:SetActive(false);
    return;
  end

  local dataFightAwardData = dataFightAwardDatas[bestAwardRank];

  if DataFight.awardAvailible then
    event_Award:SetColor(Color.White);
  else
    event_Award:SetColor(Color.LightGray);
  end

  for i = 1, 3 do
    if dataFightAwardData.awards[i].itemId ~= 0 then
      item_Award[i].transform.parent.gameObject:SetActive(true);
      item_Award[i]:SetItem(dataFightAwardData.awards[i].itemId, dataFightAwardData.awards[i].count);
    else
      item_Award[i].transform.parent.gameObject:SetActive(false);
    end
  end
end

function UIDataFight.OnClick_Award()
  if not DataFight.awardAvailible then return end

  --C:099-004 <領取排名獎勵>
  Network.Send(99, 4);

  gameObject_Award:SetActive(false);
end

function UIDataFight.OnClick_CloseAward()
  gameObject_Award:SetActive(false);
end