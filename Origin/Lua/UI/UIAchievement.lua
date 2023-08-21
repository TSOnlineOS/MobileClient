UIAchievement = {};
local this = UIAchievement;

this.name = "UIAchievement";
this.uiController = nil;

local transform_FrameRect;

local text_TotoalScore;

local mainTabGroup;

local scrollContent_Achievement;
local scrollItems_Achievement = {};

local currentMainPage = 1;
local currentSubPage = 1;

local achievementData;
local tagDatas = {};

function UIAchievement.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;
  
  text_TotoalScore = uiController:FindText("Text_T1_TotalScore");

  scrollContent_Achievement = uiController:FindScrollContent("ScrollContent_Achievement");
  scrollContent_Achievement.onInitialize = this.OnInitialize_ScrollContent_Achievement;
  scrollContent_Achievement.onItemChange = this.OnItemChange_ScrollContent_Achievement;
  scrollContent_Achievement:Initialize(1);
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------

  --tag
  local mainPageCount = Achievement.GetMainPageCount();
  for i = 1, mainPageCount do
    local subPageCount = Achievement.GetSubPageCount(i);

    tagDatas[i] = {};
    tagDatas[i][1] = Achievement.GetMainTagName(i);

    tagDatas[i][2] = {};
    for j = 1, subPageCount do
      tagDatas[i][2][j] = Achievement.GetSubTagName(i, j);
    end
  end
end

function UIAchievement.OnInitialize_ScrollContent_Achievement(scrollItems)
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
  
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Achievement[itemIndex] = {};
    scrollItems_Achievement[itemIndex].scoreBG = scrollItems[itemIndex]:Find("Image_ScoreBG"):GetComponent("Image");
    scrollItems_Achievement[itemIndex].score = scrollItems[itemIndex]:Find("Text_T1_Score"):GetComponent("Text");
    scrollItems_Achievement[itemIndex].name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_Achievement[itemIndex].title = scrollItems[itemIndex]:Find("Text_Title"):GetComponent("Text");
    scrollItems_Achievement[itemIndex].content = scrollItems[itemIndex]:Find("Text_Content"):GetComponent("Text");
    scrollItems_Achievement[itemIndex].status = scrollItems[itemIndex]:Find("Text_Status"):GetComponent("Text");
    scrollItems_Achievement[itemIndex].item = UIItemController.New(scrollItems[itemIndex]:Find("Image_ItemBG"));
    scrollItems_Achievement[itemIndex].getEvent = scrollItems[itemIndex]:Find("Image_GetButton"):GetComponent("UIEvent");
    scrollItems_Achievement[itemIndex].getEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Item);
    scrollItems_Achievement[itemIndex].image_GetButton = scrollItems[itemIndex]:Find("Image_GetButton"):GetComponent("Image");
    scrollItems_Achievement[itemIndex].image_BGMask = scrollItems[itemIndex]:Find("Image_BGMask"):GetComponent("Image");    
  end
end

function UIAchievement.OnItemChange_ScrollContent_Achievement(dataIndex, itemIndex)
  local index = dataIndex + 1;
  achievementData = Achievement.GetShowAchievementData(index);
  if achievementData == nil then
    logError("achievementData == nil");
    return false;
  end

  scrollItems_Achievement[itemIndex].score.text = achievementData.score;
  scrollItems_Achievement[itemIndex].name.text = achievementData:GetName();
  scrollItems_Achievement[itemIndex].title.text = achievementData:GetTitle();

  if achievementData.conditions.kind == ECondition.Gold 
  or achievementData.conditions.kind == ECondition.Lv
  or achievementData.conditions.kind == ECondition.Int
  or achievementData.conditions.kind == ECondition.Atk
  or achievementData.conditions.kind == ECondition.Agi
  or achievementData.conditions.kind == ECondition.Def
  or achievementData.conditions.kind == ECondition.Hpx
  or achievementData.conditions.kind == ECondition.Spx 
  or achievementData.conditions.kind == ECondition.MissionFlag
  or achievementData.conditions.kind == ECondition.MissionStep 
  or achievementData.conditions.kind == ECondition.Flag then
    scrollItems_Achievement[itemIndex].content.text = achievementData:GetContent();
  else
    scrollItems_Achievement[itemIndex].content.text = string.Concat(achievementData:GetContent(), " (", achievementData:GetPogress(), ")");
  end

  if achievementData:HaveCompeleteFlag() and not achievementData:HaveGetFlag() then --可領取
    scrollItems_Achievement[itemIndex].scoreBG.sprite = UI.GetSprite("icon020");
--    scrollItems_Achievement[itemIndex].status.text = string.Get(21062);
    scrollItems_Achievement[itemIndex].status.text = "";
  elseif achievementData:HaveCompeleteFlag() and achievementData:HaveGetFlag() then --已完成
    scrollItems_Achievement[itemIndex].scoreBG.sprite = UI.GetSprite("icon020");
    scrollItems_Achievement[itemIndex].status.text = string.Get(21061);
    scrollItems_Achievement[itemIndex].status.color = Color.LightBlue;
  else --進行中
    scrollItems_Achievement[itemIndex].scoreBG.sprite = UI.GetSprite("icon036");
    scrollItems_Achievement[itemIndex].status.text = string.Get(21060);
    scrollItems_Achievement[itemIndex].status.color = Color.DarkGreen;
  end

  itemData = itemDatas[achievementData.itemId];
  if itemData ~= nil then
    scrollItems_Achievement[itemIndex].item:SetItem(achievementData.itemId, achievementData.itemCount);
    scrollItems_Achievement[itemIndex].item:SetEvent();
    scrollItems_Achievement[itemIndex].image_GetButton.gameObject:SetActive(achievementData:HaveCompeleteFlag() and not achievementData:HaveGetFlag());
    scrollItems_Achievement[itemIndex].image_BGMask.gameObject:SetActive(achievementData:HaveCompeleteFlag() and achievementData:HaveGetFlag());
  else
    scrollItems_Achievement[itemIndex].item:SetItem(0);
    scrollItems_Achievement[itemIndex].item:SetEvent();
    scrollItems_Achievement[itemIndex].image_GetButton.gameObject:SetActive(false);
    scrollItems_Achievement[itemIndex].image_BGMask.gameObject:SetActive(false);
  end
  
  scrollItems_Achievement[itemIndex].getEvent.parameter = index;

  return true;
end

function UIAchievement.OnOpen()
  Achievement.InitTotalScore();
  
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  
  currentMainPage = 1;
  currentSubPage = 1;

  return true;
end

function UIAchievement.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(99690), this.OnClick_Close, nil, this.OnClick_Tag, tagDatas, currentMainPage, currentSubPage, this.UpdateRedot);

    Achievement.CheckCompeleteAchievement(currentMainPage, currentSubPage);
    Achievement.SetShowAchievementData(currentMainPage, currentSubPage);

    this.UpdateTotoalScoreText();
    this.UpdateAchievementPage();

    --GoogleAnalytics.Call("SwitchMainTag", this.name, Achievement.GetMainTagName(currentMainPage));
    --GoogleAnalytics.Call("SwitchSubTag", this.name, Achievement.GetSubTagName(currentMainPage, currentSubPage));
  end
end

function UIAchievement.UpdateTotoalScoreText()
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  text_TotoalScore.text = Achievement.GetTotalScore();
end

function UIAchievement.UpdateAchievementPage()
  scrollContent_Achievement:Reset(Achievement.GetAchievementCount());
end

function UIAchievement.RefreshAchievementPage()
  Achievement.SetShowAchievementData(currentMainPage, currentSubPage);
  scrollContent_Achievement:Refresh();
end

function UIAchievement.UpdateRedot(mainPageIndex, subPageIndex)
  if subPageIndex ~= nil then
    return Achievement.CheckSubPageRedDot(mainPageIndex, subPageIndex);
  else
    return Achievement.CheckMainPageRedDot(mainPageIndex);
  end

  return false;
end

function UIAchievement.OnClick_Close()
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
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  UI.Close(this);

  return true;
end

function UIAchievement.OnClick_Tag(mainTag, subTag)
  currentMainPage = mainTag;
  currentSubPage = subTag;
  
  Achievement.CheckCompeleteAchievement(currentMainPage, currentSubPage);
  Achievement.SetShowAchievementData(currentMainPage, currentSubPage);

  this.UpdateAchievementPage();
  
  --GoogleAnalytics.Call("SwitchMainTag", this.name, Achievement.GetMainTagName(currentMainPage));
  --GoogleAnalytics.Call("SwitchSubTag", this.name, Achievement.GetSubTagName(currentMainPage, currentSubPage));

  return true;
end

function UIAchievement.OnClick_Item(uiEvent)
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  local achievementData = Achievement.GetShowAchievementData(uiEvent.parameter);

  if not achievementData:HaveGetFlag() and achievementData:HaveCompeleteFlag()then
    if Item.CheckBagIsFull() then return end

    --GoogleAnalytics.Call("LogEvent", this.name, GAEventAction.ClickButton, GALabel.GetItem);
    Achievement.SendGetItem(achievementData.Id);
  else
    UIItemInfo.Show(achievementData.itemId);
  end
end