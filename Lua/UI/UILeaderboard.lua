
UILeaderboard = {}
local this = UILeaderboard;

this.name = "UILeaderboard";
this.uiController = nil;

--ui
local transform_FrameRect;

local text_Rank;
local text_Score;
local text_Page;
local text_NameInfo;
local text_ScoreInfo;
local text_Empty;

local scrollContent_Leaderboard;
local scrollItems_Leaderboard = {};

--const
local maxInfo = 5;

--var
local tagDatas = {};

local currentMainTag = 1;
local currentSubTag = 1;
local currentPage = 1;

local currentLeaderboardId = 0;
local totalPage = 1;
local datas = nil;

function UILeaderboard.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;

  text_Rank = uiController:FindText("Text_Rank");
  text_Score = uiController:FindText("Text_Score");
  text_Page = uiController:FindText("Text_Page");
  text_NameInfo = uiController:FindText("Text_NameInfo");
  text_ScoreInfo = uiController:FindText("Text_ScoreInfo");
  text_Empty = uiController:FindText("Text_Empty");
  
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
  --6-----------------------------------------------------     --5-----------------------------------------------------
  --      if LuaHelper.CheckDefine("DemoCode") then
  --        --
  --      end
  --      --6-----------------------------------------------------
  --      --4-----------------------------------------------------
  --      if LuaHelper.CheckDefine("DemoCode") then
  --        for i = 1, 3 do
  --          DemoCode.SetColorNum(i);
  --        end
  --        local area =  DemoCode.CalTriangleArea(1, 1);
  --        local currentOptio = area;
  --        local currentOption = string.Get(10055);
  --      end
  --      --5-----------------------------------------------------
  --      if LuaHelper.CheckDefine("DemoCode") then
  --        --
  --      end
  --      --6-----------------------------------------------------

  scrollContent_Leaderboard = uiController:FindScrollContent("ScrollContent_Leaderboard");
  scrollContent_Leaderboard.onInitialize = this.OnInitialize_ScrollContent_Leaderboard;
  scrollContent_Leaderboard.onItemChange = this.OnItemChange_ScrollContent_Leaderboard;
  scrollContent_Leaderboard:Initialize(1);

  local tempEvent = uiController:FindEvent("Image_Prev");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_SwitchPage);
  tempEvent.parameter = -1;

  tempEvent = uiController:FindEvent("Image_Next");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_SwitchPage);
  tempEvent.parameter = 1;

  for mainTag, subTags in pairs(leaderboardTagDatas) do
    local subTagDatas = nil;

    if table.maxn(subTags) > 1 then
      subTagDatas = {};
      for subTag, leaderboardId in pairs(subTags) do
        subTagDatas[subTag] = string.Get(leaderboardDatas[leaderboardId].subTagText);
      end
    end

    tagDatas[mainTag] = { string.Get(leaderboardDatas[subTags[1]].mainTagText), subTagDatas };
  end
end

function UILeaderboard.OnOpen(leaderboardId)
  currentMainTag = 1;
  currentSubTag = 1;
  currentPage = 1;

  if leaderboardId ~= nil then
    for mainTag, v in pairs(leaderboardTagDatas) do
      for subTag, vv in pairs(v) do
        if vv == leaderboardId then
          currentMainTag = mainTag;
          currentSubTag = subTag;
          break;
        end
      end
    end
  end

  currentLeaderboardId = leaderboardTagDatas[currentMainTag][currentSubTag];
  totalPage = 1;

  text_NameInfo.text = string.Get(leaderboardDatas[currentLeaderboardId].nameText);
  text_ScoreInfo.text = string.Get(leaderboardDatas[currentLeaderboardId].scoreText);
  text_Page.text = string.Concat(currentPage, " / ", totalPage);
  text_Rank.text = "---";
  text_Score.text = string.AddBrackets(" ------ ");
  text_Empty.gameObject:SetActive(true);

  scrollContent_Leaderboard:Reset(0);
  
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

function UILeaderboard.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(20555), this.OnClick_Close, nil, this.OnClick_Tag, tagDatas, currentMainTag, currentSubTag);

    this.SendRequest(currentMainTag, currentSubTag, currentPage);
  end
end

function UILeaderboard.SendRequest(mainTag, subTag, page)
  if leaderboardTagDatas[mainTag] == nil then return end
  if leaderboardTagDatas[mainTag][subTag] == nil then return end
  if page < 1 or page > totalPage then return end

  local leaderboardId = leaderboardTagDatas[mainTag][subTag];

  --C:088-001 <查詢排行榜> +排行榜ID(1) +頁次(1)
  sendBuffer:Clear();
  sendBuffer:WriteByte(leaderboardId);
  sendBuffer:WriteByte(page);
  Network.Send(88, 1, sendBuffer);
end

function UILeaderboard.UpdateUI(leaderboardId, page, maxPage, myRank, myScoreInfo, rankInfos)
  for mainTag, subTags in pairs(leaderboardTagDatas) do
    for subTag, id in pairs(subTags) do
      if id == leaderboardId then
        currentMainTag = mainTag;
        currentSubTag = subTag;
        break;
      end
    end
  end
  
  UIFrame.SwitchTab(currentMainTag, currentSubTag, false);

  currentLeaderboardId = leaderboardId;
  currentPage = math.max(page, 1);
  totalPage = math.max(maxPage, 1);
  datas = rankInfos;
  
  text_NameInfo.text = string.Get(leaderboardDatas[currentLeaderboardId].nameText);
  text_ScoreInfo.text = string.Get(leaderboardDatas[currentLeaderboardId].scoreText);
  text_Page.text = string.Concat(currentPage, " / ", totalPage);

  if myRank > 0 then
    text_Rank.text = myRank;
  else
    text_Rank.text = "---";
  end

  text_Score.text = this.GetScoreInfo(myScoreInfo);
  text_Empty.gameObject:SetActive(table.maxn(datas) <= 0);

  scrollContent_Leaderboard:Reset(math.min(table.maxn(datas), maxInfo));
end

function UILeaderboard.OnClick_Close()
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
  UI.Close(UILeaderboard);

  return true;
end

function UILeaderboard.OnClick_Tag(mainTag, subTag)
  this.SendRequest(mainTag, subTag, 1);
  
  return false;
end

function UILeaderboard.OnClick_SwitchPage(uiEvent)
  this.SendRequest(currentMainTag, currentSubTag, currentPage + uiEvent.parameter);
end

function UILeaderboard.OnClick_Info(uiEvent)
  local rankInfo = uiEvent.parameter;

  local leaderboardData = leaderboardDatas[currentLeaderboardId];
  if CheckFlag(leaderboardData.bitFunction, 3) then
    --C:014-010 <查詢玩家資訊>玩家ID(8) +排行榜ID(1)
    sendBuffer:Clear();
    sendBuffer:WriteInt64(rankInfo.roleId);
    sendBuffer:WriteByte(currentLeaderboardId); 
    Network.Send(14, 10, sendBuffer);
  else
    --C:014-009 <查詢玩家資訊> +玩家ID(8) +L(1) +名字(L)
    sendBuffer:Clear();
    sendBuffer:WriteInt64(rankInfo.roleId);
    Network.Send(14, 9, sendBuffer);
  
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
end

function UILeaderboard.OnInitialize_ScrollContent_Leaderboard(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Leaderboard[itemIndex] = {};
    scrollItems_Leaderboard[itemIndex].image_Rank = scrollItems[itemIndex]:Find("Image_Rank"):GetComponent("Image");
    scrollItems_Leaderboard[itemIndex].image_State = scrollItems[itemIndex]:Find("Image_State"):GetComponent("Image");
    scrollItems_Leaderboard[itemIndex].text_Rank = scrollItems[itemIndex]:Find("Text_Rank"):GetComponent("Text");
    scrollItems_Leaderboard[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_Leaderboard[itemIndex].uiCareer = UICareerController.New(scrollItems[itemIndex]:Find("Career"));
    scrollItems_Leaderboard[itemIndex].text_Level = scrollItems[itemIndex]:Find("Text_Level"):GetComponent("Text");
    scrollItems_Leaderboard[itemIndex].text_Score = scrollItems[itemIndex]:Find("Text_Score"):GetComponent("Text");
    scrollItems_Leaderboard[itemIndex].text_Title = scrollItems[itemIndex]:Find("Text_Title"):GetComponent("Text");
    scrollItems_Leaderboard[itemIndex].event_Info = scrollItems[itemIndex]:Find("Image_Info"):GetComponent("UIEvent");
    scrollItems_Leaderboard[itemIndex].event_Info:SetListener(EventTriggerType.PointerClick, this.OnClick_Info);
  end
end

function UILeaderboard.OnItemChange_ScrollContent_Leaderboard(dataIndex, itemIndex)
  local rankInfo = datas[dataIndex + 1];
  if rankInfo == nil then return false end

  local leaderboardData = leaderboardDatas[currentLeaderboardId];
  if leaderboardData == nil then return false end

  if rankInfo.rank <= 3 then
    scrollItems_Leaderboard[itemIndex].image_Rank.sprite = UI.GetRankSprite(rankInfo.rank);
    scrollItems_Leaderboard[itemIndex].image_Rank.gameObject:SetActive(true);
    scrollItems_Leaderboard[itemIndex].text_Rank.text = "";
  else
    scrollItems_Leaderboard[itemIndex].image_Rank.sprite = nil;
    scrollItems_Leaderboard[itemIndex].image_Rank.gameObject:SetActive(false);
    scrollItems_Leaderboard[itemIndex].text_Rank.text = rankInfo.rank;
  end

  if leaderboardData.stateEnable then
    scrollItems_Leaderboard[itemIndex].image_State.gameObject:SetActive(true);
    if rankInfo.state == 1 then
      scrollItems_Leaderboard[itemIndex].image_State.sprite = UI.GetSprite("com107");
    elseif rankInfo.state == 2 then
      scrollItems_Leaderboard[itemIndex].image_State.sprite = UI.GetSprite("com108");
    else
      scrollItems_Leaderboard[itemIndex].image_State.sprite = UI.GetSprite("com109");
    end
    scrollItems_Leaderboard[itemIndex].image_State:SetNativeSize();
  else
    scrollItems_Leaderboard[itemIndex].image_State.gameObject:SetActive(false);
  end

  scrollItems_Leaderboard[itemIndex].text_Name.text = rankInfo.name;

  scrollItems_Leaderboard[itemIndex].uiCareer.gameObject:SetActive( CheckFlag(leaderboardData.bitFunction, 2) );

  if rankInfo.element ~= 0 then
    scrollItems_Leaderboard[itemIndex].uiCareer:SetCareer(rankInfo.turn, rankInfo.element, rankInfo.career, false, rankInfo.turn3Info.element);
  else
    scrollItems_Leaderboard[itemIndex].uiCareer:SetCareer();
  end

  scrollItems_Leaderboard[itemIndex].text_Level.text = rankInfo.level;
  scrollItems_Leaderboard[itemIndex].text_Score.text = this.GetScoreInfo(rankInfo.scoreInfo);

  if rankInfo.rank <= 3 and leaderboardData.rankAwards[rankInfo.rank] ~= nil and titleDatas[leaderboardData.rankAwards[rankInfo.rank].titleId] ~= nil then
    scrollItems_Leaderboard[itemIndex].text_Score.rectTransform.anchoredPosition = Vector2.New(176, -12);
    scrollItems_Leaderboard[itemIndex].text_Title.text = string.Concat(string.Get(21978), string.Get(titleDatas[leaderboardData.rankAwards[rankInfo.rank].titleId].name));
  else
    scrollItems_Leaderboard[itemIndex].text_Score.rectTransform.anchoredPosition = Vector2.New(176, 0);
    scrollItems_Leaderboard[itemIndex].text_Title.text = "";
  end

  scrollItems_Leaderboard[itemIndex].event_Info.parameter = rankInfo;
  scrollItems_Leaderboard[itemIndex].event_Info.gameObject:SetActive(rankInfo.roleId ~= "0" and rankInfo.roleId ~= Role.playerId and CheckFlag(leaderboardData.bitFunction, 1));

  return true;
end

function UILeaderboard.GetScoreInfo(scoreInfo)
  local result = "---";
  
  if table.maxn(scoreInfo) > 0 then
    local infoIndex = 0;

    result = string.gsub(
      leaderboardDatas[currentLeaderboardId].scoreFormat,
      "%%s",
      function(text)
        infoIndex = infoIndex + 1;
        return tostring(scoreInfo[infoIndex]);
      end,
      table.maxn(scoreInfo)
    );

    result = string.gsub(result, "<%%(.-)%%>", string.Parse);
  end
  
  return string.AddBrackets(result);
end