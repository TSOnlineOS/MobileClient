EFeedbackType = {
  CharmFeedback = 1,
  GiftFeedback = 2,
}

UICharmFeedback = {};
local this = UICharmFeedback;

this.name = "UICharmFeedback";
this.uiController = nil;

local image_Mask;

--CharmFeedback
local gameObject_CharmFeedback;
local text_CharmScore;
local scrollContent_CharmFeedback;
local scrollItems_CharmFeedback = {};
local charmReward = {};

--GiftFeedback
local gameObject_GiftFeedback;
local gameObject_LastItem;
local scrollContent_GiftFeedback;
local scrollItems_GiftFeedback = {};
local scrollContentTransform;
local giftReward = {};
local giftRewardCount;
local text_BarValue;
local text_Date;
local text_Level;
local text_LevelNumber;
local slider_Exp;
local activityId = 100;
local scrollItemSpacingY = 0;
local levelToShow;                    --能領獎的最低等級/已領獎的等級
local totalItemsShown = 5;            --顯示在畫面上的總item數
local nowGiftRewardMaxScore = 9999999;
local lastItem = {};
local nowLastItemLevel = 0;
local preLastItemLevel = 0;
local lastItemSetting = {};
local activityTime;

--var
local type;
local transform_FrameRect;
local frameTitle;
local rewardExp;
local rewardLevel;

function UICharmFeedback.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;

  image_Mask = uiController:FindImage("Image_Mask");

  --魅力回饋獎勵
  gameObject_CharmFeedback = uiController:FindGameObject("CharmFeedback");

  text_CharmScore = uiController:FindText("Text_CharmScore");

  scrollContent_CharmFeedback = uiController:FindScrollContent("ScrollContent_CharmFeedback");
  scrollContent_CharmFeedback.onInitialize = this.OnInitialize_ScrollContent_CharmFeedback;
  scrollContent_CharmFeedback.onItemChange = this.OnItemChange_ScrollContent_CharmFeedback;
  scrollContent_CharmFeedback:Initialize(1);

  --贈禮回饋
  gameObject_GiftFeedback = uiController:FindGameObject("GiftFeedback");
  gameObject_LastItem = uiController:FindGameObject("MaxLevelItem");
  lastItem.item = UIItemController.New(gameObject_LastItem.transform:Find("Image_ItemBG"));
  lastItem.text_Level = gameObject_LastItem.transform:Find("Text_Title"):GetComponent("Text");
  lastItem.image_Mask = gameObject_LastItem.transform:Find("Image_Mask"):GetComponent("Image");
  lastItem.image_BG = gameObject_LastItem.transform:Find("Image_BG"):GetComponent("Image");

  text_BarValue = uiController:FindText("Text_BarValue");
  text_Date = uiController:FindText("Text_Date");
  text_Level = uiController:FindText("Text_LV");
  text_LevelNumber = uiController:FindText("Text_LVnumber");

  slider_Exp = uiController:FindSlider("Slider_Exp");
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

  scrollContent_GiftFeedback = uiController:FindScrollContent("ScrollContent_GiftFeedback");
  scrollContent_GiftFeedback.onInitialize = this.OnInitialize_ScrollContent_GiftFeedback;
  scrollContent_GiftFeedback.onItemChange = this.OnItemChange_ScrollContent_GiftFeedback;
  scrollContent_GiftFeedback:Initialize(1);

  scrollContentTransform = scrollContent_GiftFeedback:GetComponent("RectTransform");

  scrollItemSpacingY = scrollContent_GiftFeedback.spacing.y;

end

--region 開啟UI functions
function UICharmFeedback.OpenCharmFeedback(isPlayer)
  UI.Open(UICharmFeedback, EFeedbackType.CharmFeedback, isPlayer);
end

function UICharmFeedback.OpenGiftFeedback(isPlayer)
  UI.Open(UICharmFeedback, EFeedbackType.GiftFeedback, isPlayer);
end
--endregion

function UICharmFeedback.OnOpen(openType, isPlayer)
  if isPlayer then
    UI.Close(UIHouseBoard);
  end

  type = openType;

  gameObject_CharmFeedback:SetActive(type == EFeedbackType.CharmFeedback);
  gameObject_GiftFeedback:SetActive(type == EFeedbackType.GiftFeedback);

  if type == EFeedbackType.CharmFeedback then
    frameTitle = string.Get(23546);
    transform_FrameRect = gameObject_CharmFeedback.transform:Find("Image_BG").transform;
    rewardExp = HouseBoard.playerCharm;

    RedDot.Remove(ERedDot.CharmReward);
  elseif type == EFeedbackType.GiftFeedback then
    frameTitle = string.Get(23548);
    transform_FrameRect = gameObject_GiftFeedback.transform:Find("Image_BG").transform;
    rewardExp = RoleCount.Get(ERoleCount.SouvenirFeedbackExp);

    RedDot.Remove(ERedDot.GiftFeedback);

    CGTimer.AddListener(this.CheckLastItemWhileScroll, 0, true);
  end

  return true;
end

function UICharmFeedback.OnVisible(visible)
  if visible then

    this.UpdateUI();
    image_Mask:CrossFadeAlpha(0.5, 0, true);
    UIFrame.Active(transform_FrameRect, frameTitle, this.OnClick_Close, nil);
  end
end

--region scrollContent functions
function UICharmFeedback.OnInitialize_ScrollContent_GiftFeedback(scrollItems)
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
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_GiftFeedback[itemIndex] = {};
    scrollItems_GiftFeedback[itemIndex].item = UIItemController.New(scrollItems[itemIndex]:Find("Image_ItemBG"));
    scrollItems_GiftFeedback[itemIndex].event = scrollItems[itemIndex]:Find("Image_GetButton"):GetComponent("UIEvent");
    scrollItems_GiftFeedback[itemIndex].event:SetListener(EventTriggerType.PointerClick, this.OnClick_GetButton);
    scrollItems_GiftFeedback[itemIndex].text_Status = scrollItems[itemIndex]:Find("Image_GetButton"):Find("Text_T2"):GetComponent("Text");
    scrollItems_GiftFeedback[itemIndex].text_Level = scrollItems[itemIndex]:Find("Text_Title"):GetComponent("Text");
    scrollItems_GiftFeedback[itemIndex].image_BG = scrollItems[itemIndex]:Find("Image_BG"):GetComponent("Image");
    scrollItems_GiftFeedback[itemIndex].image_getButton = scrollItems[itemIndex]:Find("Image_GetButton"):GetComponent("Image");
    scrollItems_GiftFeedback[itemIndex].image_Mask = scrollItems[itemIndex]:Find("Image_Mask"):GetComponent("Image");
    scrollItems_GiftFeedback[itemIndex].image_Get = scrollItems[itemIndex]:Find("Image_Get"):GetComponent("Image");
  end
end

function UICharmFeedback.OnItemChange_ScrollContent_GiftFeedback(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local data = giftReward[index];

  if data ~= nil then
    scrollItems_GiftFeedback[itemIndex].text_Level.text = string.Concat(data.level, string.Get(50039));
    this.SetFeedbackItem(data, scrollItems_GiftFeedback[itemIndex]);

    return true;
  else
    return false;
  end
end

function UICharmFeedback.OnInitialize_ScrollContent_CharmFeedback(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_CharmFeedback[itemIndex] = {};
    scrollItems_CharmFeedback[itemIndex].item = UIItemController.New(scrollItems[itemIndex]:Find("Image_ItemBG"));
    scrollItems_CharmFeedback[itemIndex].event = scrollItems[itemIndex]:Find("Image_GetButton"):GetComponent("UIEvent");
    scrollItems_CharmFeedback[itemIndex].event:SetListener(EventTriggerType.PointerClick, this.OnClick_GetButton);
    scrollItems_CharmFeedback[itemIndex].text_Score = scrollItems[itemIndex]:Find("Text_Score"):GetComponent("Text");
    scrollItems_CharmFeedback[itemIndex].text_Status = scrollItems[itemIndex]:Find("Image_GetButton"):Find("Text_T2"):GetComponent("Text");
    scrollItems_CharmFeedback[itemIndex].image_getButton = scrollItems[itemIndex]:Find("Image_GetButton"):GetComponent("Image");
    scrollItems_CharmFeedback[itemIndex].image_Mask = scrollItems[itemIndex]:Find("Image_BGMask"):GetComponent("Image");
    scrollItems_CharmFeedback[itemIndex].image_Get = scrollItems[itemIndex]:Find("Image_Get"):GetComponent("Image");
  end
end

function UICharmFeedback.OnItemChange_ScrollContent_CharmFeedback(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local data = charmReward[index];

  if data ~= nil then
    scrollItems_CharmFeedback[itemIndex].text_Score.text = string.format(string.Get(23545), data.exp);
    this.SetFeedbackItem(data, scrollItems_CharmFeedback[itemIndex]);
    return true;
  else
    return false;
  end
end
--endregion

--region update functions
function UICharmFeedback.UpdateUI()
  this.UpdateCharmFeedback(true);
  this.UpdateGiftFeedback(true);
end

function UICharmFeedback.UpdateGiftFeedback(reset)
  if type ~= EFeedbackType.GiftFeedback then return end
  if not this.ActivityIsOpen() then return end

  this.SetRewardData();
  this.CheckRewardStatus();

  if levelToShow == -1 then
    levelToShow = rewardLevel - 1;
  end

  if levelToShow > giftRewardCount - totalItemsShown then
    levelToShow = giftRewardCount - totalItemsShown;
  end

  if reset then
    scrollContent_GiftFeedback:Reset(giftRewardCount);

    if levelToShow > 0 then
      CGTimer.AddListener(this.ScrollToCurrentLevel, 0, true);
    end
  else
    scrollContent_GiftFeedback:Refresh(giftRewardCount);
  end

  if rewardExp > giftReward[giftRewardCount].exp then
    rewardExp = giftReward[giftRewardCount].exp;
  end

  slider_Exp.value = rewardExp / nowGiftRewardMaxScore;
  text_BarValue.text = string.Concat(rewardExp, "/", nowGiftRewardMaxScore);

  local endDate = activityTime[1]:GetEndDate();
  text_Date.text = endDate:ToString("yyyy-MM-dd");
  text_Level.text = string.Get(22447);
  text_LevelNumber.text = rewardLevel;

end

function UICharmFeedback.UpdateCharmFeedback(reset)
  if type ~= EFeedbackType.CharmFeedback then return end;

  this.SetRewardData();

  if reset then
    scrollContent_CharmFeedback:Reset(table.Count(charmReward));
  else
    scrollContent_CharmFeedback:Refresh(table.Count(charmReward));
  end

  text_CharmScore.text = rewardExp;
end
--endregion

--region onclick functions
function UICharmFeedback.OnClick_Close()
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
  this.CheckRedDot();
  CGTimer.RemoveListener(this.CheckLastItemWhileScroll);
  UI.Close(UICharmFeedback);
end

function UICharmFeedback.OnClick_GetButton(uiEvent)
  local data = uiEvent.parameter;

  if data:CheckGetFlag() then return end;
  if not data:CheckRewardCanGetByScore(rewardExp) then return end;

  sendBuffer:Clear();
  sendBuffer:WriteInt32(data.exp);

  if type == EFeedbackType.CharmFeedback then

    --C:105-005 <要求魅力值獎勵領獎> +獎勵累計值(4)
    Network.Send(105, 5, sendBuffer);

  elseif type == EFeedbackType.GiftFeedback then
    if data.level > rewardLevel then return end;

    --C:105-006 <要求贈禮人回饋領獎> +獎勵累計值(4)
    Network.Send(105, 6, sendBuffer);
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
  end
end
--endregion

function UICharmFeedback.SetRewardData()

  if type == EFeedbackType.CharmFeedback then
    table.Clear(charmReward);

    local got = {};
    local canGet = {};
    local canNotGet = {};

    for i = 1, table.Count(charmRewardDatas) do
      local data = charmRewardDatas[i];
      if data.kind == EFeedbackType.CharmFeedback then
        if data:CheckRewardCanGetByScore(rewardExp) then
          table.insert(canGet, data);
        else
          if data:CheckGetFlag() then
            table.insert(got, data);
          else
            table.insert(canNotGet, data);
          end
        end
      end
    end

    for i = 1, table.Count(canGet) do
      table.insert(charmReward, canGet[i]);
    end

    for i = 1, table.Count(canNotGet) do
      table.insert(charmReward, canNotGet[i]);
    end

    for i = 1, table.Count(got) do
      table.insert(charmReward, got[i]);
    end

  elseif type == EFeedbackType.GiftFeedback then
    table.Clear(giftReward);

    for i = 1, table.Count(charmRewardDatas) do
      local data = charmRewardDatas[i];
      if data.kind == EFeedbackType.GiftFeedback then
        table.insert(giftReward, data);
      end
    end

    giftRewardCount = table.Count(giftReward);

    local index = 1;
    local temp = 1;

    while index < giftRewardCount do
      lastItemSetting[temp] = {};
      lastItemSetting[temp].offset = index + 0.5;
      lastItemSetting[temp].level = temp * totalItemsShown;
      temp = temp + 1;
      index = index + totalItemsShown;
    end
  end
end

function UICharmFeedback.CheckRedDot()
  rewardExp = HouseBoard.playerCharm;

  for i = 1, table.Count(charmRewardDatas) do
    local data = charmRewardDatas[i];
    if data.kind == EFeedbackType.CharmFeedback then
      if data:CheckRewardCanGetByScore(rewardExp) then
        RedDot.Add(ERedDot.CharmReward);
        break;
      end
    end
  end

  if this.ActivityIsOpen() then
    activityTime = Activity.GetActivityTime(activityId);

    rewardExp = RoleCount.Get(ERoleCount.SouvenirFeedbackExp);

    for i = 1, table.Count(charmRewardDatas) do
      local data = charmRewardDatas[i];
      if data.kind == EFeedbackType.GiftFeedback then
        if data:CheckRewardCanGetByScore(rewardExp) then
          if activityTime[1]:IsActive() then
            RedDot.Add(ERedDot.GiftFeedback);
          end

          levelToShow = data.level - 1;
          break;
        else
          --無獎可領
          levelToShow = -1;
        end
      end
    end
  end
end

function UICharmFeedback.ScrollToCurrentLevel()
  if scrollContentTransform.anchoredPosition.y < levelToShow * scrollItemSpacingY then
    scrollContentTransform.anchoredPosition = Vector2.New(0, scrollContentTransform.anchoredPosition.y + levelToShow * scrollItemSpacingY / 2);
  else
    CGTimer.RemoveListener(this.ScrollToCurrentLevel);
  end
end

function UICharmFeedback.CheckLastItemWhileScroll()
  this.GetLastItemLevel();

  if preLastItemLevel == 0 or preLastItemLevel ~= nowLastItemLevel then
    preLastItemLevel = nowLastItemLevel;

    local lastData = giftReward[nowLastItemLevel];

    lastItem.text_Level.text = string.Concat(lastData.level, string.Get(50039));
    lastItem.item:SetItem(lastData.itemId, lastData.quant);
    lastItem.image_Mask.enabled = lastData:CheckGetFlag();
    if lastItem.image_BG ~= nil then
      lastItem.image_BG.enabled = (lastData:CheckRewardCanGetByScore(rewardExp) or lastData:CheckGetFlag()) and rewardLevel == lastData.level;
    end
  end

end

function UICharmFeedback.CheckRewardStatus()
  rewardLevel = 0;
  nowGiftRewardMaxScore = giftReward[1].exp;

  for i = 1, giftRewardCount do
    if rewardExp >= giftReward[i].exp then
      rewardLevel = giftReward[i].level;

      if i == giftRewardCount then
        nowGiftRewardMaxScore = giftReward[i].exp;
      else
        nowGiftRewardMaxScore = giftReward[i + 1].exp;
      end
    end
  end
end

function UICharmFeedback.SetFeedbackItem(data, item)
  item.item:SetItem(data.itemId, data.quant);
  item.event.parameter = data;
  item.event.enabled = data:CheckRewardCanGetByScore(rewardExp);
  item.text_Status:GetComponent("GradientColor").enabled = data:CheckRewardCanGetByScore(rewardExp);
  item.text_Status:GetComponent("Outline8").enabled = data:CheckRewardCanGetByScore(rewardExp);
  item.image_Mask.enabled = data:CheckGetFlag();
  item.image_Get.enabled = data:CheckGetFlag();
  item.image_getButton.gameObject:SetActive(not data:CheckGetFlag());
  if item.image_BG ~= nil then
    item.image_BG.enabled = (data:CheckRewardCanGetByScore(rewardExp) or data:CheckGetFlag()) and rewardLevel == data.level;
  end

  if data:CheckRewardCanGetByScore(rewardExp) then
    item.text_Status.text = string.Get(21062);
    item.image_getButton.sprite = UI.GetSprite("but001D");
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
  else
    item.text_Status.text = string.Get(21060);
    item.image_getButton.sprite = UI.GetSprite("but001L");
  end
end

function UICharmFeedback.GetLastItemLevel()
  for i = 1, table.Count(lastItemSetting) do
    if scrollContentTransform.anchoredPosition.y < lastItemSetting[i].offset * scrollItemSpacingY then
      nowLastItemLevel = lastItemSetting[i].level;
      return;
    end
  end
end

function UICharmFeedback.ActivityIsOpen()
  return activityTimes[activityId] ~= nil;
end
