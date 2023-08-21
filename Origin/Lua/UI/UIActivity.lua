UIActivity = {};
local this = UIActivity;

this.name = "UIActivity";
this.uiController = nil;

this.nowShowUI_Kind = 0;--目前介面是否為無界活動介面

local transform_FrameRect;
local text_Lv;
local text_ActivityName;
local text_WeekDay;
local text_OpenTime;
local text_Time;
local text_Countdown;
local text_Go;
local image_Awards = {};
local event_Go;
local currentMainPage = 1;
local currentSubPage = 1;
local activityInfo;
local startDate;
local endDate;
local openDay;
local tagDatas = {};
local tagDatas2 = {}; --無界活動
local rawImage_BG;
local rawImage_LV;
local rawImage_TotemL;
local rawImage_TotemR;
local event_SelectMember;
local actAwardKind;
local actAwardId;
local actTime; 

function UIActivity.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;
  this.uiController.onClose = this.OnClose;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;
  text_Lv = uiController:FindText("Text_LV");
  text_ActivityName = uiController:FindText("Text_ActivityName");
  text_OpenTime = uiController:FindText("Text_OpenTime");
  text_Time = uiController:FindText("Text_Time");
  text_WeekDay = uiController:FindText("Text_WeekDay");
  text_Go = uiController:FindText("Text_Go");
  
  for i = 1, 5 do 
    image_Awards[i] = UIItemController.New(uiController:FindGameObject(string.Concat("Image_Award (", i, ")")).transform);
  end

  rawImage_BG = uiController:FindRawImage("RawImage_BG");
  rawImage_LV = uiController:FindRawImage("RawImage_LV");
  rawImage_TotemL = uiController:FindRawImage("RawImage_Totem (1)");
  rawImage_TotemR = uiController:FindRawImage("RawImage_Totem (2)");

  event_Go = uiController:FindEvent("Image_Go");
  event_Go:SetListener(EventTriggerType.PointerClick, this.OnClick_Go);

  event_SelectMember = uiController:FindEvent("Image_SelectMember");
  event_SelectMember:SetListener(EventTriggerType.PointerClick, this.OnClick_SelectMember);
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
  
  --[[
  --tag
  local mainPageCount = Activity.GetMainPageCount();
  for i = 1, mainPageCount do
    local subPageCount = Activity.GetSubPageCount(i); 
    tagDatas[i] = {};
    tagDatas[i][1] = Activity.GetMainTagName(i, 1);

    tagDatas[i][2] = {};
    for j = 1, subPageCount do
      tagDatas[i][2][j] = Activity.GetSubTagName(i, j);
    end 
  end]]
  --新增加uiIndex--
  --tag
  local uiCount = Activity.GetUICount();
  for ui_c = 0, uiCount-1 do
    local mainPageCount = Activity.GetMainPageCount(ui_c);  
    tagDatas[ui_c] = {};
    for i = 1, mainPageCount do
      local subPageCount = Activity.GetSubPageCount(ui_c, i); 
      tagDatas[ui_c][i] = {};
      tagDatas[ui_c][i][1] = Activity.GetMainTagName(ui_c, i, 1);

      tagDatas[ui_c][i][2] = {};
      for j = 1, subPageCount do
        tagDatas[ui_c][i][2][j] = Activity.GetSubTagName(ui_c, i, j);
      end 
    end
  end
  --完--
end

function UIActivity.OnClickAwardForCommonAward(uiEvent)
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
  UIItemInfo.Show(uiEvent.parameter);
end

function UIActivity.OnClickAwardForLuckyBag(uiEvent)
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
  UIItemInfo.ShowLuckyBag(uiEvent.parameter);
end

function UIActivity.OnOpen(akind)
  --C:001-016 <查Server時間>
  Network.Send(1, 16);
  
  this.nowShowUI_Kind = akind;

  currentMainPage, currentSubPage = this.GetRecentActivity();

  this.SetShowActivityInfo();

  return true;
end

function UIActivity.OnVisible(visible)
  if visible then
    
    --UIFrame.Active(transform_FrameRect, string.Get(20066), this.OnClick_Close, this.OnClick_Help, this.OnClick_Tag, tagDatas, currentMainPage, currentSubPage, this.UpdateRedot);
    --新增加uiIndex--
    UIFrame.Active(transform_FrameRect, string.Get(20066), this.OnClick_Close, this.OnClick_Help, this.OnClick_Tag, tagDatas[this.nowShowUI_Kind], currentMainPage, currentSubPage);
    --完--
    this.SetShowActivityInfo();
    this.UpdateUI();
  end
end

function UIActivity.OnClose()
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
  
  CGTimer.RemoveListener(this.UpdateTime);
  this.nowShowUI_Kind = 0;
  return true;
end

function UIActivity.UpdateUI()
  TextureManager.SetPng(ETextureUseType.UI, "common0_com075", rawImage_BG);
  TextureManager.SetPng(ETextureUseType.UI, "common0_bod112", rawImage_LV);
  TextureManager.SetPng(ETextureUseType.UI, "common0_bod113", rawImage_TotemL);
  TextureManager.SetPng(ETextureUseType.UI, "common0_bod113", rawImage_TotemR);

  if activityInfo == nil then return end

  text_Lv.text = string.Concat(string.Get(71154), activityInfo.lv);--LV改讀字串表
  this.UpdateLV();

  text_ActivityName.text = activityInfo:GetActivityName();

  for i = 1, 5 do
    actAwardId = activityInfo.awards[i].id;
    actAwardKind = activityInfo.awards[i].kind;
    image_Awards[i]:SetItem(actAwardId);

    if actAwardKind == CommonAwardDataKind.item then
      image_Awards[i]:SetEvent(this.OnClickAwardForCommonAward, actAwardId);
    elseif actAwardKind == CommonAwardDataKind.luckyBag then
      image_Awards[i]:SetIcon(true);
      image_Awards[i]:SetIconTexture(luckyBagDatas[actAwardId].icon);
      image_Awards[i]:SetEvent(this.OnClickAwardForLuckyBag, actAwardId);
    end
  end

  this.SetActivityTime();
  text_OpenTime.text = "";
  this.UpdateOpenTime();
  this.UpdateState(activityInfo);
end

function UIActivity.UpdateState(activityInfo)
  event_SelectMember.gameObject:SetActive(false);
  if activityInfo == nil then return end
  event_Go.gameObject:SetActive( CheckFlag(activityInfo.bitFunction, 1) );

  local state = activityTimes[activityInfo.Id][1].state;
  --未開始
  if state == 0 then
    text_Go.text = string.Get(21253);
    event_Go:SetColor(Color.LightGray);

  --進行中
  elseif state == 1 then
    text_Go.text = string.Get(21253);
    event_Go:SetColor(Color.White);

  --已結束
  elseif state == 2 then
    text_Go.text = string.Get(21253);
    event_Go:SetColor(Color.LightGray);
  
  --報名中
  elseif state == 3 then
    text_Go.text = string.Get(80017);
    event_Go:SetColor(Color.White);

    --軍團戰
    if activityInfo.kind == EActivity.OrganizationFight then
      if Organization.CheckFlag(EOrgFlag.OrgWarRigistered) then
        if Organization.IsChief(Role.playerId) or Organization.IsSubChief(Role.playerId) then
          event_SelectMember.gameObject:SetActive(true);
        end
      end
    end
  end
end

function UIActivity.OnClick_Close()
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
  
  UI.Close(this);

  return true;
end

function UIActivity.OnClick_Help(checkShow)
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
  if checkShow ~= true then
    UI.Open(UITutorialHint, 0, this, activityInfo:GetActivityName(), activityInfo:GetDescription());
  end

  return true;
end

function UIActivity.OnClick_Tag(mainTag, subTag)
  currentMainPage = mainTag;
  currentSubPage = subTag;

  this.SetShowActivityInfo();

  this.UpdateUI();

  return true;
end

function UIActivity.SetShowActivityInfo()
  --Activity.SetShowActivityInfo(currentMainPage, currentSubPage);
  --新增加uiIndex--
  Activity.SetShowActivityInfo(this.nowShowUI_Kind, currentMainPage, currentSubPage);
  --完--
  activityInfo = Activity.GetShowActivityInfo(1);
end

function UIActivity.OnClick_Go()
  if activityInfo == nil then return end

  if not Role.CheckPlayerLv(activityInfo.lv) then
    ShowCenterMessage(string.format(string.Get(10138), activityInfo.lv));
    return
  end

  if activityTimes[activityInfo.Id][1].state == 1 then
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
    --C:077-003 <傳送入場> +活動ID(2)
    sendBuffer:Clear();
    sendBuffer:WriteUInt16(activityInfo.Id);
    Network.Send(77, 3, sendBuffer);

    this.OnClick_Close();
  elseif activityTimes[activityInfo.Id][1].state == 3 then
    --C:077-003 <傳送入場> +活動ID(2)
    sendBuffer:Clear();
    sendBuffer:WriteUInt16(activityInfo.Id);
    Network.Send(77, 3, sendBuffer);
  end

  if activityInfo.kind == EActivity.CityScramble then
    if not UICityScramble.CheckQualification() then 
      ShowCenterMessage(string.Get(23085));
    end
  end
end

function UIActivity.OnClick_SelectMember()
  if activityInfo == nil then return end
  
  --軍團戰
  if activityInfo.kind == EActivity.OrganizationFight then
    UI.Open(UIArmy, EUIArmyPage.OrgWar);
  end
end

function UIActivity.UpdateLV()
  if not Role.CheckPlayerLv(activityInfo.lv) then
    text_Lv.color = Color.Red;
  else
    text_Lv.color = Color.White;
  end
end

function UIActivity.UpdateOpenTime()
  CGTimer.RemoveListener(this.UpdateTime);

  --日期未到或超過
  if DateTime.Compare(CGTimer.serverTime, startDate) < 0 then
    text_OpenTime.text = string.Get(20376);
    return;
  elseif DateTime.Compare(CGTimer.serverTime, endDate) > 0 then
    text_OpenTime.text = string.Get(20377);
    return;
  end

  --開放日
  if openDay[this.GetDayOfWeek(tostring(CGTimer.serverTime.DayOfWeek))] ~= 1 then
    text_OpenTime.text = string.Get(20276);
    return;
  end
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
  
  
  
  if activityTimes[activityInfo.Id][1].serverStartTime == 0 then
    text_OpenTime.text = string.Get(30155);
    return;
  end

  if not CGTimer.ContainsListener(this.UpdateTime) then 
    CGTimer.AddListener(this.UpdateTime, 1);
  end
end

function UIActivity.UpdateTime()
  if activityInfo == nil then return end

  text_Countdown = "";
  --開放時段
  --活動倒數開始或結束
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
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  actTime = activityTimes[activityInfo.Id];
  
  if actTime[1].switch == 4 then
    if DateTime.Compare(CGTimer.serverTime, actTime[1].serverCloseTime) > 0 or 
      (CGTimer.serverTime.DayOfWeek ~= actTime[1].serverStartTime.DayOfWeek and CGTimer.serverTime.DayOfWeek ~= actTime[1].serverCloseTime.DayOfWeek) then
      text_OpenTime.text = string.Get(20377);  
    elseif DateTime.Compare(CGTimer.serverTime, actTime[1].serverStartTime) < 0 then 
    text_Countdown = string.GetSecondSymbol(math.ceil(DateTime.Subtract(actTime[1].serverStartTime, CGTimer.serverTime).TotalSeconds));
    text_Countdown = string.GetColorText(string.Concat(string.Get(80098), " ", text_Countdown), Color.Black);
    text_OpenTime.text = string.Concat(string.Get(20277), " ", text_Countdown); 
    elseif DateTime.Compare(CGTimer.serverTime, actTime[1].serverCloseTime) < 0 then 
    text_Countdown = string.GetSecondSymbol(math.ceil(DateTime.Subtract(actTime[1].serverCloseTime, CGTimer.serverTime).TotalSeconds));
    text_OpenTime.text = string.Concat(string.Get(80098), " ", text_Countdown); 
    else
    text_OpenTime.text = string.Get(20377);
    end
    return;
  end

  if DateTime.Compare(CGTimer.serverTime, this.GetLastActivityTime(actTime)) > 0 or CGTimer.serverTime.DayOfWeek ~= actTime[1].serverStartTime.DayOfWeek then
     text_OpenTime.text = string.Get(20377);
  elseif DateTime.Compare(CGTimer.serverTime, actTime[1].serverStartTime) < 0 then
    text_Countdown = string.GetSecondSymbol(math.ceil(DateTime.Subtract(actTime[1].serverStartTime, CGTimer.serverTime).TotalSeconds));
    text_Countdown = string.GetColorText(string.Concat(string.Get(80098), " ", text_Countdown), Color.Black);
    text_OpenTime.text = string.Concat(string.Get(20277), " ", text_Countdown);
  elseif DateTime.Compare(CGTimer.serverTime, actTime[1].serverCloseTime) < 0 then
    text_Countdown = string.GetSecondSymbol(math.ceil(DateTime.Subtract(actTime[1].serverCloseTime, CGTimer.serverTime).TotalSeconds));
    text_OpenTime.text = string.Concat(string.Get(80098), " ", text_Countdown);
   else
    text_OpenTime.text = string.Get(20377);
  end
end

function UIActivity.SetActivityTime()
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
  
  
  local activityTime = Activity.GetActivityTime(activityInfo.Id);
  startDate = activityTime[1]:GetStartDate()
  endDate = activityTime[1]:GetEndDate()
  openDay = this.intTobit(activityTime[1].openDay);

  --開放日
  text_WeekDay.text = "";
  for i = 1, table.Count(openDay) do
    if openDay[i] == 1 then
      if text_WeekDay.text == "" then
        text_WeekDay.text = string.Concat(text_WeekDay.text, this.GetWeekDay(i));
      else
        text_WeekDay.text = string.Concat(text_WeekDay.text, "、", this.GetWeekDay(i));
      end
    end
  end
  text_WeekDay.text = string.format(string.Get(21292), text_WeekDay.text);

  --開放時間
  text_Time.text = "";
  for i = 1, table.Count(activityTime) do
    if text_Time.text == "" then
      text_Time.text = string.Concat(text_Time.text, string.TenDigits(activityTime[i].openHour), " : ", string.TenDigits(activityTime[i].openMinute), " ~ ", string.TenDigits(activityTime[i].closeHour), " : ", string.TenDigits(activityTime[i].closeMinute));
    else
      text_Time.text = string.Concat(text_Time.text, ", ", string.TenDigits(activityTime[i].openHour), " : ", string.TenDigits(activityTime[i].openMinute), " ~ ", string.TenDigits(activityTime[i].closeHour), " : ", string.TenDigits(activityTime[i].closeMinute));
    end
  end
  text_Time.text = string.format(string.Get(21293), text_Time.text);
end

function UIActivity.GetLastActivityTime(activityTime)
  return DateTime.New(
    CGTimer.serverTime.Year,
    CGTimer.serverTime.Month,
    CGTimer.serverTime.Day,
    activityTime[table.Count(activityTime)].closeHour,
    activityTime[table.Count(activityTime)].closeMinute,
    0
  );
end

--計算開放日
function UIActivity.intTobit(num)
  local ret = { 0, 0, 0, 0, 0, 0, 0 };
  local count = 1;
  
  while num ~= 1 and num ~= 0 do
    ret[count] = num % 2;
    count = count + 1;
    num = math.modf(num / 2);
  end
  
  ret[count] = num;
  
  return ret;
end

function UIActivity.GetWeekDay(num)
  if num ~= 7 then
    return string.GetChineseNumber(num);
  else
    return string.Get(20278);
  end
end

function UIActivity.GetDayOfWeek(weekday)
  if weekday == "Monday" then
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
  
    
    return 1
  elseif weekday == "Tuesday" then
    return 2
  elseif weekday == "Wednesday" then
    return 3
  elseif weekday == "Thursday" then
    return 4
  elseif weekday == "Friday" then
    return 5
  elseif weekday == "Saturday" then
    return 6
  elseif weekday == "Sunday" then
    return 7
  end
end

--下一場活動
function UIActivity.GetRecentActivity()
  local theRecentActivityTime = 0;
  local theRecentActivityID = 0;

  for k, v in pairs(activityTimes) do
    if v[1].serverStartTime ~= 0 then
      if math.abs(DateTime.Subtract(CGTimer.serverTime, v[1].serverStartTime).TotalSeconds) < theRecentActivityTime or theRecentActivityTime == 0 and v[1].serverStartTime.DayOfYear == CGTimer.serverTime.DayOfYear then
        theRecentActivityTime = math.abs(DateTime.Subtract(CGTimer.serverTime, v[1].serverStartTime).TotalSeconds);
        theRecentActivityID = v[1].Id;
      end
    end
  end
--[[
  for k, v in pairs(activityInfos) do
    for j, v in pairs(activityInfos[k]) do
      if v[1].Id == theRecentActivityID then
         return k, j;
      end
    end
  end]] 
  --新增加uiIndex--  
  for k, v in pairs(activityInfos[this.nowShowUI_Kind]) do 
    for j, v in pairs(activityInfos[this.nowShowUI_Kind][k]) do
      if v[1].Id == theRecentActivityID then
        return k, j;
      end
    end 
  end
  --完--
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  
  return 1, 1;
end
