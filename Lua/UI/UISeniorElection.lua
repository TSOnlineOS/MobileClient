EElectionActivityID = {
  SISTER = 44,
  -- SPORTS = 69,
  SPORTS_WATCH = 72
};

UISeniorElection = {}
local this = UISeniorElection;

this.name = "UISeniorElection";
this.uiController = nil;

local cjson = require "cjson";

local ONEPAGEITEM = 8;
local SISTER_ELECTION = 0;  -- 學姊活動
local SPORTS_ELECTION_ONLY_WATCH = 1; -- 競技慶典(時間區間設定較長，供玩家觀看投注結果)
local MINIMUM_VOTE_AMOUNT = 10; -- 最低投票次數為10 (僅限於競技慶典)
-- Region 學姊清單UI
local text_ActivityName;
local text_Title;
local text_Page;
local text_ShowRank;
local inputField_Search;
local event_Next;
local event_Previous;
local event_Close;
local event_Help;
local event_ShowRank1;
local event_Search;
local gameobject_ShowRank;
local rawImage_Flower_Left;
local rawImage_Flower_Right;
local scrollItems_Candidate = {};
local candidateList = {};
local filterCandidateList = {};
local filterStr = "";
local nowPage = 1;
local nowElectionKind = 0;
-- EndRegion 學姊清單UI
-- Region 學姊詳細資料UI
local page_Detail;
local text_DetailPlayerNumber;
local text_DetailServerName;
local text_DetailPlayerName;
local text_Introduction;
local rectTransform_Introduction;
local text_MyVotes;
local text_DetailTitle;
local text_Vote1;
local text_Vote2;
local rawImage_NormalPic;
local event_Return;
local event_Vote1;
local event_Vote2;
local event_ShowRank2;
local gameobject_ShowRank2;
local gameObject_Image_Vote1;
local gameObject_Image_Vote2;
local playerNumberForVote;
-- EndRegion 學姊詳細資料UI

function UISeniorElection.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  this.uiController.onVisible = this.OnVisible;

  this.InitializePageList(uiController);
  this.InitializeDetailPage(uiController);
end

-- Region 學姊清單UI

--[[
  初始化學姊清單UI元件
]]
function UISeniorElection.InitializePageList(uiController)
  local candidateTransform = uiController:FindGameObject("Image_CandidateBG").transform;
  -- 一頁總共有8個欄位顯示學姊資訊
  scrollItems_Candidate = {};
  scrollItems_Candidate.playerNumber = {};
  scrollItems_Candidate.playerName = {};
  scrollItems_Candidate.serverName = {};
  scrollItems_Candidate.smallPic = {};
  scrollItems_Candidate.loading = {};
  scrollItems_Candidate.event = {};

  for i = 1, ONEPAGEITEM do
    scrollItems_Candidate[i] = candidateTransform:Find(string.format("CandidateItem (%d)", i));
    scrollItems_Candidate.playerNumber[i] = scrollItems_Candidate[i]:Find("Text_PlayerNumber"):GetComponent("Text");
    scrollItems_Candidate.playerName[i] = scrollItems_Candidate[i]:Find("Text_PlayerName"):GetComponent("Text");
    scrollItems_Candidate.serverName[i] = scrollItems_Candidate[i]:Find("Text_ServerName"):GetComponent("Text");
    scrollItems_Candidate.smallPic[i] = scrollItems_Candidate[i]:Find("RawImage_SmallPic"):GetComponent("RawImage");
    scrollItems_Candidate.loading[i] = scrollItems_Candidate[i]:Find("Text_Loading"):GetComponent("Text");
    scrollItems_Candidate.loading[i].text = string.format(string.Get(22052), string.Get(20910));

    scrollItems_Candidate.event[i] = scrollItems_Candidate[i]:GetComponent("UIEvent");
    scrollItems_Candidate.event[i]:SetListener(EventTriggerType.PointerClick, this.ShowCandidateDetail);
    scrollItems_Candidate.event[i].parameter = i;
    -- 初始化小型外框的RawImage
    TextureManager.SetPng(ETextureUseType.None, "SmallVoteFrame_0",
      scrollItems_Candidate[i]:Find("RawImage_SmallVoteFrame"):GetComponent("RawImage"));
  end
  -- 初始化介面字串
  text_Title = uiController:FindText("Text_Title");
  text_ActivityName = uiController:FindText("Text_ActivityName");
  text_Page = uiController:FindText("Text_Page");
  text_ShowRank = uiController:FindText("Text_ShowRank");
  text_ShowRank.text = string.Get(22338);
  inputField_Search = uiController:FindInputField("InputField_Search");
  -- 排名按鈕物件
  gameobject_ShowRank = uiController:FindGameObject("Image_ShowRank (1)");
  gameobject_ShowRank2 = uiController:FindGameObject("Image_ShowRank (2)");
  -- 初始化背景裝飾RawImage
  rawImage_Flower_Left = uiController:FindRawImage("RawImage_Flower_Left");
  rawImage_Flower_Right = uiController:FindRawImage("RawImage_Flower_Right");  
  TextureManager.SetPng(ETextureUseType.None, "common0_bod102", uiController:FindRawImage("RawImage_bod102_Left"));
  TextureManager.SetPng(ETextureUseType.None, "common0_bod102", uiController:FindRawImage("RawImage_bod102_Right"));
  -- 初始化按鈕事件
  event_Next = uiController:FindEvent("Image_Next");
  event_Next:SetListener(EventTriggerType.PointerClick, this.OnClick_NextPage);
  event_Previous = uiController:FindEvent("Image_Previous");
  event_Previous:SetListener(EventTriggerType.PointerClick, this.OnClick_PreviousPage);
  event_Close = uiController:FindEvent("Image_Close");
  event_Close:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);
  event_Help = uiController:FindEvent("Image_Help");
  event_Help:SetListener(EventTriggerType.PointerClick, this.OnClick_Help);
  event_ShowRank1 = uiController:FindEvent("Image_ShowRank (1)");
  event_ShowRank1:SetListener(EventTriggerType.PointerClick, this.OnClick_Rank);
  event_Search = uiController:FindEvent("Image_Search");
  event_Search:SetListener(EventTriggerType.PointerClick, this.OnClick_UpdateFilter);
  
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
end

function UISeniorElection.OnOpen(electionKindId)
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  this.SetElectionKind(electionKindId);
  if nowElectionKind == EElectionActivityID.SISTER then
    this.ChangeUIForSisterElection();
  elseif nowElectionKind == EElectionActivityID.SPORTS_WATCH then
    this.ChangeUIForSportsElection();
  end
  return true;
end

function UISeniorElection.OnVisible(visible)
  if (visible) then
    -- 向FTP Server要學姊的資料 (延遲0s，讓UI先跳出來)
    CGTimer.DoFunctionDelay(0, this.InitializeCandidateList);
  end
end

function UISeniorElection.OnClose()
  -- 關閉視窗時，終止所有FTP下載任務
  this.StopAllPicTask();
  this.HideDetailPage();
  this.ResetSearchFilter();
  -- 將畫面上的資料清除，玩家重新載入頁面時才不會看見前一份資料
  for i = 1, ONEPAGEITEM do
    scrollItems_Candidate.smallPic[i].texture = nil;
    scrollItems_Candidate.playerNumber[i].text = "";
    scrollItems_Candidate.playerName[i].text = "";
    scrollItems_Candidate.serverName[i].text = "";
    scrollItems_Candidate.loading[i].text = string.format(string.Get(22052), string.Get(20910));
  end
  
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  return true;
end

function UISeniorElection.OnClick_Close()
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  UI.Close(this);
  return true;
end

function UISeniorElection.OnClick_Help()
  if nowElectionKind == EElectionActivityID.SISTER then
    UI.Open(UITutorialHint, 40, this);
  elseif nowElectionKind == EElectionActivityID.SPORTS_WATCH then
    UI.Open(UITutorialHint, 46, this);
  end
end

function UISeniorElection.OnClick_Rank()
  local dataDirectory = "SeniorElection/";
  local url = CGResourceManager.DownloadText(string.Concat(dataDirectory, "ElectionUrl.txt"), false);
  Application.OpenURL(url);
end

function UISeniorElection.ChangeUIForSisterElection()
  -- 針對學姊活動投票調整UI
  gameobject_ShowRank:SetActive(true);
  gameobject_ShowRank2:SetActive(true);
  inputField_Search.gameObject:SetActive(true);
  -- 隱藏第二顆投票按鈕
  gameObject_Image_Vote2:SetActive(false);
  -- 修改背景裝飾圖(花)
  TextureManager.SetPng(ETextureUseType.None, "VoteBGFrame_01", rawImage_Flower_Left);
  TextureManager.SetPng(ETextureUseType.None, "VoteBGFrame_01", rawImage_Flower_Right);
  rawImage_Flower_Left.rectTransform.anchoredPosition = Vector2.New(-359, rawImage_Flower_Left.rectTransform.anchoredPosition.y);
  rawImage_Flower_Right.rectTransform.anchoredPosition = Vector2.New(359, rawImage_Flower_Right.rectTransform.anchoredPosition.y);
  -- 修改標題文字
  text_Title.text = string.Get(22337);
  text_ActivityName.text = string.Get(22336);
  text_DetailTitle.text = string.Get(22340);
  -- 修改投票文字
  text_MyVotes.text = string.format(string.Get(22341), 0);
  text_Vote1.text = string.Get(22376);
  
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
end

function UISeniorElection.ChangeUIForSportsElection()
  -- 針對競技慶典投票調整UI
  -- 隱藏搜尋框與網頁排名
  gameobject_ShowRank:SetActive(false);
  gameobject_ShowRank2:SetActive(false);
  inputField_Search.gameObject:SetActive(false);
  -- 顯示第二顆投票按鈕
  gameObject_Image_Vote2:SetActive(true);
  -- 修改背景裝飾圖(禮炮)
  TextureManager.SetPng(ETextureUseType.None, "VoteBGFrame_02", rawImage_Flower_Left);
  TextureManager.SetPng(ETextureUseType.None, "VoteBGFrame_02", rawImage_Flower_Right);
  rawImage_Flower_Left.rectTransform.anchoredPosition = Vector2.New(-398, rawImage_Flower_Left.rectTransform.anchoredPosition.y);
  rawImage_Flower_Right.rectTransform.anchoredPosition = Vector2.New(398, rawImage_Flower_Right.rectTransform.anchoredPosition.y);
  -- 修改標題文字
  text_Title.text = string.Get(22750);
  text_ActivityName.text = string.Get(22749);
  text_DetailTitle.text = string.Get(22753);
  -- 修改投票文字
  text_MyVotes.text = string.Concat(
      string.Get(22780), ": ", 0,
      "\n",
      string.Get(22781), ": ", 0
    );
  text_Vote1.text = string.Get(22751);
  text_Vote2.text = string.Get(22752);
end

--[[
  設定目前的投票所種類 (意即目前同一時間僅能使用一種投票所)
]]
function UISeniorElection.SetElectionKind(electionKindId)
  nowElectionKind = electionKindId;
end

--[[
  透過ActivityTime確認投票活動是否處於開放時間
  完整確認活動的日期、開放日、開啟時間
]]
function UISeniorElection.CheckActivityTime(activityID)
  if activityTimes[activityID] == nil then
    return false;
  end

  local activityTime = activityTimes[activityID];
  local startDate = activityTime[1]:GetStartDate();
  local endDate = activityTime[1]:GetEndDate();
  local openTime = this.CreateDateTimeBelowHour(activityTime[1].openHour, activityTime[1].openMinute, 0, 0);
  local closeTime = this.CreateDateTimeBelowHour(activityTime[1].closeHour, activityTime[1].closeMinute, 0, 0);
  local openDay = this.intTobit(activityTime[1].openDay);

  -- 日期未到或超過
  if DateTime.Compare(CGTimer.serverTime, startDate) < 0 or
    DateTime.Compare(CGTimer.serverTime, endDate) > 0 then
    return false;
  end

  -- 非開放日
  if openDay[this.GetDayOfWeek(tostring(CGTimer.serverTime.DayOfWeek))] ~= 1 then
    return false;
  end

  -- 未到開啟時間或超過結束時間
  if DateTime.Compare(CGTimer.serverTime, openTime) < 0 or
    DateTime.Compare(CGTimer.serverTime, closeTime) > 0 then
    return false;
  end

  return true;
end

--[[
  創建可設定時、分、秒、毫秒的DateTime物件，日期則預設為今日
    --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
]]
function UISeniorElection.CreateDateTimeBelowHour(hour, minute, seconds, milliseconds)
  return DateTime.New(CGTimer.serverTime.Year, CGTimer.serverTime.Month, CGTimer.serverTime.Day, hour, minute, seconds, milliseconds);
end

--[[
  計算開放日
    --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
]]
function UISeniorElection.intTobit(num)
	local result = {0,0,0,0,0,0,0};
  local Count = 1;

	while num~=1 and num~=0 do
		result[Count] = num%2;
    Count = Count + 1;
		num = math.modf(num/2);
	end
	result[Count] = num;

	return result;
end

function UISeniorElection.GetDayOfWeek(weekday)
  if weekday == "Monday" then
    return 1;
  elseif weekday == "Tuesday" then
    return 2;
  elseif weekday == "Wednesday" then
    return 3;
  elseif weekday == "Thursday" then
    return 4;
  elseif weekday == "Friday" then
    return 5;
  elseif weekday == "Saturday" then
    return 6;
  elseif weekday == "Sunday" then
    return 7;
  end
end

--[[
  初始化學姊投票清單
]]
function UISeniorElection.InitializeCandidateList()
  local dataDirectory = "SeniorElection/";
  if nowElectionKind == EElectionActivityID.SISTER then
    -- 僅會下載一次個人資料，若要再下載需重開遊戲
    if #candidateList == 0 then
      candidateList = this.DownloadDataFromFTP(dataDirectory);
    end
    -- 將清單順序進行洗牌處理，讓編號排後面的人也有機會出現在前面的頁數
    candidateList = this.Shuffle(candidateList);
  elseif nowElectionKind == EElectionActivityID.SPORTS_WATCH then
    -- 競技慶典要根據日期做資料替換
    local todayString = CGTimer.serverTime:ToString("yyyyMMdd");
    dataDirectory = string.Concat(dataDirectory, todayString, "/");
    -- 競技慶典每次重開介面都要下載資料
    candidateList = this.DownloadDataFromFTP(dataDirectory);
    -- 競技慶典不洗牌
  end
  -- 顯示第一頁資訊
  nowPage = 1;
  filterCandidateList = this.GetNewCandidateBy(filterStr);
  this.UpdatePageUI(filterCandidateList, nowPage);
end

function UISeniorElection.Shuffle(tbl)
  local size = #tbl;
  for i = size, 1, -1 do
    local rand = math.random(size);
    tbl[i], tbl[rand] = tbl[rand], tbl[i];
  end
  return tbl;
end

--[[
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
--]]

function UISeniorElection.DownloadDataFromFTP(dataDirectory)
  -- 取得學姊人數
  local candidateAmount = CGResourceManager.DownloadText(string.Concat(dataDirectory, "CandidateAmount.txt"), false);
  -- 下載學姊資料並放入table
  local candidateData = {};
  for i = 1, candidateAmount do
    local data = CGResourceManager.DownloadText(string.format(string.Concat(dataDirectory, "%d.json"), i), false);
    local candidates = cjson.decode(data);
    table.insert(candidateData, {
      playerNumber = candidates.playerNumber,
      playerName = candidates.playerName,
      serverName = this.GetServerName(candidates.serverId),
      introduction = candidates.introduction,
      -- 圖片路徑再加上父資料夾(SeniorElection)路徑
      smallPic = string.Concat(dataDirectory, candidates.smallPic),
      normalPic = string.Concat(dataDirectory, candidates.normalPic)
    });
  end
  return candidateData;
end

function UISeniorElection.GetServerName(serverId)
  local serverName = "";
  for k, v in pairs(Network.servers) do
    if serverId == v.id then
      serverName = v.name;
    end
  end
  return serverName;
end

function UISeniorElection.OnClick_UpdateFilter()
  filterStr = inputField_Search.text;
  nowPage = 1;
  filterCandidateList = this.GetNewCandidateBy(filterStr);
  this.UpdatePageUI(filterCandidateList, nowPage);
end

function UISeniorElection.ResetSearchFilter()
  inputField_Search.text = "";
  filterStr = inputField_Search.text;
end

--[[
  取得經篩選器調整後的學姐清單
  @param pattern 可為搜尋字串，或者Regular Expression
]]
function UISeniorElection.GetNewCandidateBy(pattern)
  local candidateListAfterFilter = {};

  for i = 1, #candidateList do
    -- 若篩選器內沒輸入任何值，即顯示所有學姊資料
    -- 或篩選學姊的候選編號、角色名稱、伺服器名稱任其一
    if string.IsNullOrEmpty(pattern) or
      (not string.IsNullOrEmpty(string.find(candidateList[i].playerNumber, pattern))) or
      (not string.IsNullOrEmpty(string.find(candidateList[i].playerName, pattern))) or
      (not string.IsNullOrEmpty(string.find(candidateList[i].serverName, pattern))) then
        table.insert(candidateListAfterFilter, candidateList[i]);
    end
  end
  return candidateListAfterFilter;
end

--[[
  切換學姊清單，下一頁
    --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
]]
function UISeniorElection.OnClick_NextPage()
  if this.UpdatePageUI(filterCandidateList, (nowPage + 1)) then
    nowPage = nowPage + 1;
  end
end

--[[
  切換學姊清單，上一頁
]]
function UISeniorElection.OnClick_PreviousPage()
  if this.UpdatePageUI(filterCandidateList, (nowPage - 1)) then
    nowPage = nowPage - 1;
  end
end

--[[
  顯示當前頁的學姊清單
]]
function UISeniorElection.UpdatePageUI(candidates, currentPage)
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  -- 計算總人數/8等於頁數
  local totalPages, remainder = math.modf(#candidates / ONEPAGEITEM);
  -- 若餘數大於0，代表總頁數要+1，存放剩餘的資料
  if (remainder > 0) then
    totalPages = totalPages + 1;
  end

  -- 若清單人數為0 (即搜尋後無符合的狀況)，隱藏所有
  if (totalPages == 0) then
    text_Page.text = "0/0";
    for i = 1, ONEPAGEITEM do
      scrollItems_Candidate[i].gameObject:SetActive(false);
    end
  end

  if (1 <= currentPage) and (currentPage <= totalPages) then
    -- 停止FTP下載器中的舊任務
    this.StopAllPicTask();
    text_Page.text = string.Concat(currentPage, "/", totalPages);

    for i = 1, ONEPAGEITEM do
      -- 更新圖片之前，先將圖片設為nil，並顯示"載入中"字樣
      scrollItems_Candidate.smallPic[i].texture = nil;
      scrollItems_Candidate.loading[i].text = string.format(string.Get(22052), string.Get(20910));
      -- 換算出符合目前頁數的index
      local conversionIndex = this.GetConversionIndex(i, currentPage);
      this.SetPageData(candidates, conversionIndex, i);
    end
    return true;
  end
  return false;
end

--[[
  更新VoteFrame上的資料
]]
function UISeniorElection.SetPageData(candidates, conversionIndex, i)
  if (candidates[conversionIndex] ~= nil) then
    -- 顯示物件
    scrollItems_Candidate[i].gameObject:SetActive(true);
    scrollItems_Candidate.playerNumber[i].text = candidates[conversionIndex].playerNumber;
    scrollItems_Candidate.playerName[i].text = candidates[conversionIndex].playerName;
    scrollItems_Candidate.serverName[i].text = candidates[conversionIndex].serverName;
    -- 學姊的圖片要從FTP下載後，塞入RawImage
    this.StartNewDownloadPic(candidates[conversionIndex].smallPic,
     scrollItems_Candidate.smallPic[i],
     function ()
      scrollItems_Candidate.loading[i].text = "";
     end);
  else
    -- 遇到該頁數資訊未滿8人時，將不需顯示的部分隱藏
    scrollItems_Candidate[i].gameObject:SetActive(false);
  end
end

-- Region FTP圖片下載管理
local MAX_TASK_NUM = 100000;
local downloadTask = {};
local taskIndex = 0;

function UISeniorElection.StartNewDownloadPic(url, rawImage, callback)
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  taskIndex = taskIndex + 1;
  table.insert(downloadTask, {
    rawImage = rawImage,
    url = url,
    isStopping = false,
    callback = callback
  })
  CGResourceManager.LoadTextureByCoroutine(url, taskIndex,
    this.LoadPicComplete, this.LoadPicException);
end

function UISeniorElection.StopAllPicTask()
  -- 將舊的downloadTask的停止旗標設為true
  for i = 1, taskIndex do
    downloadTask[i].isStopping = true;
  end
  if taskIndex > MAX_TASK_NUM then
    taskIndex = 1;
  end
end

function UISeniorElection.LoadPicComplete(texture, index)
  if not downloadTask[index].isStopping then
    downloadTask[index].rawImage.texture = texture;
    if downloadTask[index].callback ~= nil then
      downloadTask[index].callback();
    end
  end
end

function UISeniorElection.LoadPicException(index)
  if not downloadTask[index].isStopping then
    -- 由於載入失敗，再創建一個新的下載任務
    this.StartNewDownloadPic(downloadTask[index].url, downloadTask[index].rawImage, downloadTask[index].callback);
  end
end

-- EndRegion FTP圖片下載管理

--[[
  顯示學姊的詳細資料
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
]]
function UISeniorElection.ShowCandidateDetail(uiEvent)
  local clickIndex = uiEvent.parameter;
  local conversionIndex = this.GetConversionIndex(clickIndex, nowPage);
  local candidatesAfterFilter = this.GetNewCandidateBy(filterStr);
  this.OpenDetailPage(candidatesAfterFilter[conversionIndex].playerNumber,
    candidatesAfterFilter[conversionIndex].playerName, candidatesAfterFilter[conversionIndex].serverName,
    candidatesAfterFilter[conversionIndex].introduction, candidatesAfterFilter[conversionIndex].normalPic);
end

--[[
  換算出符合目前頁數的index
]]
function UISeniorElection.GetConversionIndex(index, currentPage)
  return index + (ONEPAGEITEM * (currentPage - 1));
end

-- EndRegion 學姊清單UI

-- Region 學姊詳細資料UI
--[[
  初始化學姊詳細資料UI元件
]]
function UISeniorElection.InitializeDetailPage(uiController)
  page_Detail = uiController:FindGameObject("Page_Detail");
  gameObject_Image_Vote1 = uiController:FindGameObject("Image_Vote (1)");
  gameObject_Image_Vote2 = uiController:FindGameObject("Image_Vote (2)");
  text_DetailPlayerNumber = uiController:FindText("Text_DetailPlayerNumber");
  text_DetailServerName = uiController:FindText("Text_DetailServerName");
  text_DetailPlayerName = uiController:FindText("Text_DetailPlayerName");
  text_Introduction = uiController:FindText("Text_Introduction");
  rectTransform_Introduction = text_Introduction.gameObject:GetComponent("RectTransform");
  text_MyVotes = uiController:FindText("Text_MyVotes");
  text_DetailTitle = uiController:FindText("Text_DetailTitle");
  rawImage_NormalPic = uiController:FindRawImage("RawImage_NormalPic");
  text_Vote1 = uiController:FindText("Text_Vote (1)");
  text_Vote2 = uiController:FindText("Text_Vote (2)");

  event_Return = uiController:FindEvent("Image_Return");
  event_Return:SetListener(EventTriggerType.PointerClick, this.HideDetailPage);
  event_Vote1 = uiController:FindEvent("Image_Vote (1)");
  event_Vote1:SetListener(EventTriggerType.PointerClick, this.OnClick_Vote1);
  event_Vote2 = uiController:FindEvent("Image_Vote (2)");
  event_Vote2:SetListener(EventTriggerType.PointerClick, this.OnClick_Vote2);
  event_ShowRank2 = uiController:FindEvent("Image_ShowRank (2)");
  event_ShowRank2:SetListener(EventTriggerType.PointerClick, this.OnClick_Rank);
  -- 初始化背景裝飾RawImage
  TextureManager.SetPng(ETextureUseType.None, "VoteFrame_0",  uiController:FindRawImage("RawImage_VoteFrame"));
end

function UISeniorElection.OpenDetailPage(playerNumber, playerName, serverName, introduction, normalPic)
  playerNumberForVote = playerNumber;
  page_Detail:SetActive(true);
  text_DetailPlayerNumber.text = playerNumber;
  text_DetailPlayerName.text = playerName;
  text_DetailServerName.text = serverName;
  text_Introduction.text = introduction;
  -- 重置自我介紹的位置(預設置頂)
  rectTransform_Introduction.anchoredPosition = Vector2.New(0,0);
  -- 學姊的圖片要從FTP下載後，塞入RawImage
  CGResourceManager.LoadTextureByCoroutine(normalPic, 0, this.LoadNormalPicComplete, this.LoadPicException);
  -- 向Server查詢玩家對該學姊的投票數
  this.SendQueryVotes();
end

function UISeniorElection.LoadNormalPicComplete(texture, index)
  rawImage_NormalPic.texture = texture;
end


function UISeniorElection.HideDetailPage()
  rawImage_NormalPic.texture = nil;
  page_Detail:SetActive(false);
end

function UISeniorElection.SendQueryVotes()
  -- C:023-122 <查詢應援次數> +投票所種類(2) +功能(1) +學姊編號(2)
  sendBuffer:Clear();
  if nowElectionKind == EElectionActivityID.SISTER then
    sendBuffer:WriteUInt16(SISTER_ELECTION);
  elseif nowElectionKind == EElectionActivityID.SPORTS_WATCH then
    sendBuffer:WriteUInt16(SPORTS_ELECTION_ONLY_WATCH);
  end
  sendBuffer:WriteByte(1);
  sendBuffer:WriteUInt16(playerNumberForVote);
  Network.Send(23, 122, sendBuffer);
end

function UISeniorElection.OnClick_Vote1()
  this.SendVote(1);
end

function UISeniorElection.OnClick_Vote2()
  this.SendVote(2);
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
end

function UISeniorElection.SendVote(btnIndex)
  if nowElectionKind == EElectionActivityID.SISTER then
    -- 這邊僅先告知Server要投票的學姊是誰，Server才會回傳玩家可使用哪一種學姊小卡
    -- C:023-122 <幫她應援> +投票所種類(2) +功能(1) +學姊編號(2) +學姊名稱(?)
    sendBuffer:Clear();
    sendBuffer:WriteUInt16(SISTER_ELECTION);
    sendBuffer:WriteByte(2);
    sendBuffer:WriteUInt16(playerNumberForVote);
    Network.Send(23, 122, sendBuffer);
  elseif nowElectionKind == EElectionActivityID.SPORTS_WATCH then
    -- 競技慶典投票，直接傳投票券(金券or銀券)的使用數量給Server
    -- 按鈕1是金券、按鈕2是銀券
    local roleCountID = 0;
    if btnIndex == 1 then
      roleCountID = ERoleCount.GoldenTicket;
    else
      roleCountID = ERoleCount.SilverTicket;
    end
    
    -- 取得玩家目前的金券or銀券數量，若小於10則不能投票
    local roleCount = RoleCount.Get(roleCountID);
    if roleCount < MINIMUM_VOTE_AMOUNT then
      ShowCenterMessage(string.Get(22792));
      return;
    end

    ShowCountInput(string.Get(40314), 1, roleCount,
    function(text)
      if text == nil then return end

      local quant = tonumber(text);
      if quant == 0 then return end
      -- C:023-122 <傳送> +投票所種類(2) +功能(1) +使用數量(2) +隊伍編號(2) +RoleCount ID(2)
      sendBuffer:Clear();
      sendBuffer:WriteUInt16(SPORTS_ELECTION_ONLY_WATCH);
      sendBuffer:WriteByte(3);
      sendBuffer:WriteInt32(quant);
      sendBuffer:WriteUInt16(playerNumberForVote);
      sendBuffer:WriteUInt16(roleCountID);
      Network.Send(23, 122, sendBuffer);
    end
  );
  end
end

--[[
  更新"已幫她投票XXX次"的投票數
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
]]
function UISeniorElection.UpdateVotesNumber(data)
  if nowElectionKind == EElectionActivityID.SISTER then
    local votes = data:ReadUInt32();
    text_MyVotes.text = string.format(string.Get(22341), votes);
  elseif nowElectionKind == EElectionActivityID.SPORTS_WATCH then
    local silverVotes = data:ReadUInt32();
    local goldenVotes = data:ReadUInt32();
    text_MyVotes.text = string.Concat(
      string.Get(22780), ": ", goldenVotes,
      "\n",
      string.Get(22781), ": ", silverVotes
    );
  end
end

--[[
  顯示扣除學姊小卡的畫面，由Server端回傳玩家能使用的學姊小卡類型
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
]]
function UISeniorElection.ShowUseTicketAlert(useTicketID)
  local itemCount = Item.GetItemCount(useTicketID);
  ShowCountInput(string.Get(40314), 1, itemCount,
    function(text)
      if text == nil then return end

      local quant = tonumber(text);
      if quant == 0 then return end
      -- C:023-122 <傳送使用學姊小卡> +投票所種類(2) +功能(1) +使用數量(2) +學姊編號(2) +小卡物品ID(2)
      sendBuffer:Clear();
      sendBuffer:WriteUInt16(SISTER_ELECTION);
      sendBuffer:WriteByte(3);
      sendBuffer:WriteInt32(quant);
      sendBuffer:WriteUInt16(playerNumberForVote);
      sendBuffer:WriteUInt16(useTicketID);
      Network.Send(23, 122, sendBuffer);
    end
  );
end

-- EndRegion 學姊詳細資料UI