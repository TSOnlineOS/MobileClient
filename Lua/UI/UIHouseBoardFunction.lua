EHouseBoardFunctionOpenType = {
  Sign = 1,
  Birth = 2,
  Rank = 3,
  Wall = 4,
}

EBirthInputType = {
  Month = 1,
  Date = 2,
}

ERankTag = {
  Daily = 1,
  Weekly = 2,
  Total = 3,
}

UIHouseBoardFunction = {};
local this = UIHouseBoardFunction;

this.name = "UIHouseBoardFunction";
this.uiController = nil;

local image_Mask;
local currentPlayerId = nil;

--Gift Wall
local gameObject_GiftWall;
local scrollContent_ReceiveGifts;
local scrollItems_ReceiveGifts = {};
local scrollContent_Message;
local scrollItems_Message = {};

--Setting
local text_Title;

--Set Birth
local gameObject_Birth;
local gameObject_NumberPad;
local numberButton = {};
local image_Month;
local image_Date;
local rawImage_BG;
local text_Month;
local text_Date;
local inputType;
local inputNumber;
local monthNumber = 0;
local dateNumber = 0;

--Set Sign
local scrollContent_SignButton;
local scrollItems_SignButton = {};
local gameObject_Sign;
local selectSignIndex = 0;
local signCount = 12;

--Friendly Rank
local gameObject_Rank;
local rankTag = ERankTag.Daily;
local scrollContent_Leaderboard;
local scrollItems_Leaderboard = {};
local rankData = {};
local image_Rank;
local text_Rank;
local text_Score;
local text_Empty;
local text_Name;
local playerRank;
local playerScore;

local scrollContent_Tag;
local scrollItems_Tag = {};

--var
local settingEvent;
local type;
local transform_FrameRect;
local frameTitle;
local giftList;
local receiveData;
local tagCount = 3;
local padBtnCount = 12;
local preOpenType = Stack.New();

function UIHouseBoardFunction.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;

  image_Mask = uiController:FindImage("Image_Mask");
  text_Title = uiController:FindText("Text_Title");

  --禮物牆詳細資料
  gameObject_GiftWall = uiController:FindGameObject("GiftWall");
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

  scrollContent_ReceiveGifts = uiController:FindScrollContent("ScrollContent_ReceiveGifts");
  scrollContent_ReceiveGifts.onInitialize = this.OnInitialize_ScrollContent_ReceiveGifts;
  scrollContent_ReceiveGifts.onItemChange = this.OnItemChange_ScrollContent_ReceiveGifts;
  scrollContent_ReceiveGifts:Initialize(1);

  scrollContent_Message = uiController:FindScrollContent("ScrollContent_GiftWallMessage");
  scrollContent_Message.onInitialize = this.OnInitialize_ScrollContent_Message;
  scrollContent_Message.onItemChange = this.OnItemChange_ScrollContent_Message;
  scrollContent_Message:Initialize(1);

  local tempEvent;
  tempEvent = uiController:FindEvent("Image_BirthSubmit");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Submit);
  tempEvent = uiController:FindEvent("Image_SignSubmit");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Submit);

  --星座設定
  gameObject_Sign = uiController:FindGameObject("SetSign");

  scrollContent_SignButton = uiController:FindScrollContent("ScrollContent_Button");
  scrollContent_SignButton.onInitialize = this.OnInitialize_ScrollContent_SignButton;
  scrollContent_SignButton.onItemChange = this.OnItemChange_ScrollContent_SignButton;
  scrollContent_SignButton:Initialize(1);

  --生日設定
  gameObject_Birth = uiController:FindGameObject("SetBirth");
  gameObject_NumberPad = uiController:FindGameObject("SetBirthNumber");
  text_Month = uiController:FindText("Text_Month");
  text_Date = uiController:FindText("Text_Date");

  rawImage_BG = uiController:FindRawImage("RawImage_BG");
  TextureManager.SetPng(ETextureUseType.UI, "common0_bod147", rawImage_BG);

  image_Month = uiController:FindImage("Image_Month");
  tempEvent = image_Month.gameObject:GetComponent("UIEvent");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Month);
  tempEvent.parameter = image_Month;

  image_Date = uiController:FindImage("Image_Date");
  tempEvent = image_Date.gameObject:GetComponent("UIEvent");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Date);
  tempEvent.parameter = image_Date;

  local padBtn = uiController:FindGameObject("NumberButton");

  numberButton.item = {};
  numberButton.image = {};
  numberButton.text = {};
  numberButton.event = {};

  for i = 1, padBtnCount do
    numberButton.item[i] = padBtn.transform:GetChild(i - 1).gameObject;
    numberButton.image[i] = numberButton.item[i]:GetComponent("Image");
    numberButton.event[i] = numberButton.item[i]:GetComponent("UIEvent");
    if i == 4 then
      numberButton.event[i]:SetListener(EventTriggerType.PointerClick, this.OnClick_OK);
    elseif i == 12 then
      numberButton.event[i]:SetListener(EventTriggerType.PointerClick, this.OnClick_Cancel);
    else
      numberButton.text[i] = numberButton.item[i].transform:Find("Text_Tittle").gameObject:GetComponent("Text").text;
      numberButton.event[i]:SetListener(EventTriggerType.PointerClick, this.OnClick_Number);
    end

    numberButton.event[i]:SetListener(EventTriggerType.PointerDown, this.OnDown_NumberPadButton);
    numberButton.event[i]:SetListener(EventTriggerType.PointerUp, this.OnUp_NumberPadButton);
    numberButton.event[i].parameter = i;
  end

  --排行榜
  gameObject_Rank = uiController:FindGameObject("FriendlyRank");

  image_Rank = uiController:FindImage("Image_Rank");

  text_Rank = uiController:FindText("Text_Rank");
  text_Score = uiController:FindText("Text_Score");
  text_Empty = uiController:FindText("Text_Empty");
  text_Name = uiController:FindText("Text_Name");


  scrollContent_Leaderboard = uiController:FindScrollContent("ScrollContent_Leaderboard");
  scrollContent_Leaderboard.onInitialize = this.OnInitialize_ScrollContent_Leaderboard;
  scrollContent_Leaderboard.onItemChange = this.OnItemChange_ScrollContent_Leaderboard;
  scrollContent_Leaderboard:Initialize(1);

  scrollContent_Tag = uiController:FindScrollContent("ScrollContent_Tag");
  scrollContent_Tag.onInitialize = this.OnInitialize_ScrollContent_Tag;
  scrollContent_Tag.onItemChange = this.OnItemChange_ScrollContent_Tag;
  scrollContent_Tag:Initialize(1);

end

--region 開啟UI functions
function UIHouseBoardFunction.OpenGiftWall(playerInfo)
  UI.Open(UIHouseBoardFunction, EHouseBoardFunctionOpenType.Wall, playerInfo);
  RedDot.Remove(ERedDot.FriendGift);
end

function UIHouseBoardFunction.SetSign(eventHandler, currentSign)
  if table.Count(HouseBoard.signList) == 0 then
    HouseBoard.SetSignList();
  end

  UI.Open(UIHouseBoardFunction, EHouseBoardFunctionOpenType.Sign, nil, eventHandler, currentSign);
end

function UIHouseBoardFunction.SetBirth(eventHandler, month, date)
  UI.Open(UIHouseBoardFunction, EHouseBoardFunctionOpenType.Birth, nil, eventHandler, month, date);
end

function UIHouseBoardFunction.OpenFriendlyRank()
  UI.Open(UIHouseBoardFunction, EHouseBoardFunctionOpenType.Rank);
end

--endregion

function UIHouseBoardFunction.OnOpen(openType, playerInfo, eventHandler, ...)

  settingEvent = eventHandler;
  type = openType;
  currentPlayerId = playerInfo;

  preOpenType:Push(type);

  local info = {...};

  monthNumber = 0;
  dateNumber = 0;

  if info ~= nil then
    if table.Count(info) > 0 then
      if info[1] ~= 0 and info[1] ~= nil then
        text_Month.text = info[1];
        monthNumber = info[1];
      else
        text_Month.text = 1;
      end

      if info[2] ~= 0 and info[2] ~= nil then
        text_Date.text = info[2];
        dateNumber = info[2];
      else
        text_Date.text = 1;
      end
    end

    selectSignIndex = 0;

    if table.Count(info) == 1 then
      selectSignIndex = info[1];
    end
  end

  return true;
end

function UIHouseBoardFunction.OnVisible(visible)
  if visible then
    if preOpenType:Count() > 0 then
      type = preOpenType:Peek();
    end

    this.UpdateUI(type);
    image_Mask:CrossFadeAlpha(0.5, 0, true);
    UIFrame.Active(transform_FrameRect, frameTitle, this.OnClick_Close, nil);
  end
end

--region scrollContent functions
function UIHouseBoardFunction.OnInitialize_ScrollContent_ReceiveGifts(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_ReceiveGifts[itemIndex] = {};
    scrollItems_ReceiveGifts[itemIndex].item = UIItemController.New(scrollItems[itemIndex]:Find("Image_Item"));
    scrollItems_ReceiveGifts[itemIndex].image_BG = scrollItems[itemIndex]:GetComponent("Image");
    scrollItems_ReceiveGifts[itemIndex].image_FriendNameBG = scrollItems[itemIndex]:Find("Image_NameBG");
    scrollItems_ReceiveGifts[itemIndex].text_ItemName = scrollItems[itemIndex]:Find("Text_ItemName"):GetComponent("Text");
    scrollItems_ReceiveGifts[itemIndex].text_FriendName = scrollItems_ReceiveGifts[itemIndex].image_FriendNameBG:Find("Text_Name"):GetComponent("Text");
    scrollItems_ReceiveGifts[itemIndex].text_Quant = scrollItems[itemIndex]:Find("Text_Quant"):GetComponent("Text");
  end
end

function UIHouseBoardFunction.OnItemChange_ScrollContent_ReceiveGifts(dataIndex, itemIndex)
  local index = dataIndex + 1;

  local itemData = giftList[index];
  if itemData ~= nil then
    local itemId = itemData.Id;
    scrollItems_ReceiveGifts[itemIndex].item:SetItem(itemId);
    scrollItems_ReceiveGifts[itemIndex].image_BG.sprite = souvenirDatas[itemId]:GetQualityColor();
    scrollItems_ReceiveGifts[itemIndex].image_FriendNameBG.gameObject:SetActive(souvenirDatas[itemId]:CanNamed());
    scrollItems_ReceiveGifts[itemIndex].text_ItemName.text = itemDatas[itemId]:GetName();
    scrollItems_ReceiveGifts[itemIndex].text_FriendName.text = itemData.name;
    scrollItems_ReceiveGifts[itemIndex].text_Quant.text = string.format(string.Get(23407), itemData.quant);
  else
    return false;
  end

  return true;
end

function UIHouseBoardFunction.OnInitialize_ScrollContent_Message(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Message[itemIndex] = {};
    scrollItems_Message[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_Message[itemIndex].text_Item = scrollItems[itemIndex]:Find("Text_Item"):GetComponent("Text");
    scrollItems_Message[itemIndex].text_Quant = scrollItems[itemIndex]:Find("Text_Quant"):GetComponent("Text");
    scrollItems_Message[itemIndex].text_Date = scrollItems[itemIndex]:Find("Text_Date"):GetComponent("Text");
  end
end

function UIHouseBoardFunction.OnItemChange_ScrollContent_Message(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local msg = receiveData[index];

  if msg == nil then return false end

  scrollItems_Message[itemIndex].text_Name.text = msg.name;
  scrollItems_Message[itemIndex].text_Item.text = itemDatas[msg.itemId]:GetName();
  scrollItems_Message[itemIndex].text_Quant.text = string.format(string.Get(23407), msg.quant);
  scrollItems_Message[itemIndex].text_Date.text = DateTime.FromOADate(msg.time):ToString(string.Get(23403));
  return true;
end

function UIHouseBoardFunction.OnInitialize_ScrollContent_Tag(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Tag[itemIndex] = {};
    scrollItems_Tag[itemIndex].image_tag = {};
    scrollItems_Tag[itemIndex].text_tag = {};
    scrollItems_Tag[itemIndex].outline_tag = {};
    scrollItems_Tag[itemIndex].event = {};

    for i = 1, tagCount do
      scrollItems_Tag[itemIndex].image_tag[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Tag", i)):GetComponent("Image");
      scrollItems_Tag[itemIndex].text_tag[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Tag", i)):Find(string.Concat("Text_Tag", i)):GetComponent("Text");
      scrollItems_Tag[itemIndex].outline_tag[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Tag", i)):Find(string.Concat("Text_Tag", i)):GetComponent("Outline8");
      scrollItems_Tag[itemIndex].event[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Tag", i)):GetComponent("UIEvent");
      scrollItems_Tag[itemIndex].event[i]:SetListener(EventTriggerType.PointerClick, this.OnClick_Tag);
      scrollItems_Tag[itemIndex].event[i].parameter = i;
    end
  end
end

function UIHouseBoardFunction.OnItemChange_ScrollContent_Tag(dataIndex, itemIndex)
  for i = 1, tagCount do
    if i == rankTag then
      scrollItems_Tag[itemIndex].image_tag[i].color = Color.White;
      scrollItems_Tag[itemIndex].text_tag[i].color = Color.White;
      scrollItems_Tag[itemIndex].outline_tag[i].enabled = true;
    else
      scrollItems_Tag[itemIndex].image_tag[i].color = LuaHelper.GetColor(188, 188, 188, 80);
      scrollItems_Tag[itemIndex].text_tag[i].color = LuaHelper.GetColor(150, 150, 150, 255);
      scrollItems_Tag[itemIndex].outline_tag[i].enabled = false;
    end
  end

  return true;
end

function UIHouseBoardFunction.OnInitialize_ScrollContent_Leaderboard(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Leaderboard[itemIndex] = {};
    scrollItems_Leaderboard[itemIndex].image_Rank = scrollItems[itemIndex]:Find("Image_Rank"):GetComponent("Image");
    scrollItems_Leaderboard[itemIndex].text_Rank = scrollItems[itemIndex]:Find("Text_Rank"):GetComponent("Text");
    scrollItems_Leaderboard[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_Leaderboard[itemIndex].text_Score = scrollItems[itemIndex]:Find("Text_Score"):GetComponent("Text");
    scrollItems_Leaderboard[itemIndex].event_AddFriend = scrollItems[itemIndex]:Find("Image_AddFriend"):GetComponent("UIEvent");
    scrollItems_Leaderboard[itemIndex].event_AddFriend:SetListener(EventTriggerType.PointerClick, this.OnClick_AddFriend);
    scrollItems_Leaderboard[itemIndex].event_SendGift = scrollItems[itemIndex]:Find("Image_SendGift"):GetComponent("UIEvent");
    scrollItems_Leaderboard[itemIndex].event_SendGift:SetListener(EventTriggerType.PointerClick, this.OnClick_SendGift);
  end
end

function UIHouseBoardFunction.OnItemChange_ScrollContent_Leaderboard(dataIndex, itemIndex)
  local rankCount = dataIndex + 1;
  if rankCount > 50 then return false end;

  local rankInfo = rankData[rankCount];
  if rankInfo == nil then return false end;

  if rankInfo.roleId == Role.playerId then
    if rankInfo.scoreInfo == playerScore then
      playerRank = rankCount;
    end
    this.SetPlayerRank();
  end

  if rankCount <= 3 then
    scrollItems_Leaderboard[itemIndex].image_Rank.sprite = UI.GetRankSprite(rankCount);
    scrollItems_Leaderboard[itemIndex].image_Rank.gameObject:SetActive(true);
    scrollItems_Leaderboard[itemIndex].text_Rank.text = "";
  else
    scrollItems_Leaderboard[itemIndex].image_Rank.sprite = nil;
    scrollItems_Leaderboard[itemIndex].image_Rank.gameObject:SetActive(false);
    scrollItems_Leaderboard[itemIndex].text_Rank.text = rankCount;
  end

  scrollItems_Leaderboard[itemIndex].text_Name.text = rankInfo.name;
  scrollItems_Leaderboard[itemIndex].text_Score.text = rankInfo.scoreInfo;

  scrollItems_Leaderboard[itemIndex].event_AddFriend.parameter = rankInfo;
  scrollItems_Leaderboard[itemIndex].event_AddFriend.gameObject:SetActive(rankInfo.roleId ~= "0" and rankInfo.roleId ~= Role.playerId and not Social.IsFriend(rankInfo.roleId));
  scrollItems_Leaderboard[itemIndex].event_SendGift.parameter = rankInfo;
  scrollItems_Leaderboard[itemIndex].event_SendGift.gameObject:SetActive(rankInfo.roleId ~= "0" and rankInfo.roleId ~= Role.playerId and Social.IsFriend(rankInfo.roleId) and Social.CheckTurnStatus(rankInfo.level, rankInfo.turn));

  return true;
end

function UIHouseBoardFunction.OnInitialize_ScrollContent_SignButton(scrollItems)
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
    scrollItems_SignButton[itemIndex] = {};
    scrollItems_SignButton[itemIndex].image_Button = {};
    scrollItems_SignButton[itemIndex].text = {};
    scrollItems_SignButton[itemIndex].event = {};

    for i = 1, signCount do
      scrollItems_SignButton[itemIndex].image_Button[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Sign (", i, ")")):GetComponent("Image");
      scrollItems_SignButton[itemIndex].text[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Sign (", i, ")")):Find("Text_Tittle"):GetComponent("Text");
      scrollItems_SignButton[itemIndex].text[i].text = HouseBoard.signList[i];
      scrollItems_SignButton[itemIndex].event[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Sign (", i, ")")):GetComponent("UIEvent");
      scrollItems_SignButton[itemIndex].event[i]:SetListener(EventTriggerType.PointerClick, this.OnClick_SignButton);
      scrollItems_SignButton[itemIndex].event[i].parameter = i;
    end
  end
end

function UIHouseBoardFunction.OnItemChange_ScrollContent_SignButton(dataIndex, itemIndex)
  for i = 1, signCount do
    if i == selectSignIndex then
      scrollItems_SignButton[itemIndex].image_Button[i].sprite = UI.GetSprite("but062L");
    else
      if scrollItems_SignButton[itemIndex].image_Button[i].sprite ~= UI.GetSprite("but062D") then
        scrollItems_SignButton[itemIndex].image_Button[i].sprite = UI.GetSprite("but062D");
      end
    end
  end

  return true;
end

--endregion

--region update functions
function UIHouseBoardFunction.UpdateUI(type)

  gameObject_GiftWall:SetActive(type == EHouseBoardFunctionOpenType.Wall);

  gameObject_Sign:SetActive(type == EHouseBoardFunctionOpenType.Sign);
  gameObject_Birth:SetActive(type == EHouseBoardFunctionOpenType.Birth);

  gameObject_Rank:SetActive(type == EHouseBoardFunctionOpenType.Rank);

  gameObject_NumberPad:SetActive(false);

  if type == EHouseBoardFunctionOpenType.Wall then
    transform_FrameRect = gameObject_GiftWall.transform:Find("Image_BG").transform;
    frameTitle = string.Get(23373);
  
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

    this.UpdateGiftWall();

  elseif type == EHouseBoardFunctionOpenType.Birth then
    frameTitle = string.Get(23376);
    transform_FrameRect = gameObject_Birth.transform:Find("Image_ContentBG").transform;

  elseif type == EHouseBoardFunctionOpenType.Sign then
    frameTitle = string.Get(23380);
    transform_FrameRect = gameObject_Sign.transform:Find("Image_ContentBG").transform;

    this.UpdateSign();

  elseif type == EHouseBoardFunctionOpenType.Rank then
    rankTag = ERankTag.Daily;
    text_Empty.gameObject:SetActive(true);
    text_Score.gameObject:SetActive(true);
    transform_FrameRect = gameObject_Rank.transform:Find("Image_BG").transform;
    frameTitle = string.Get(23394);
    HouseBoard.SendLeaderBoardRequest(ERankTag.Daily);
  end
end

function UIHouseBoardFunction.UpdateSign()
  scrollContent_SignButton:Refresh();
end

function UIHouseBoardFunction.UpdateGiftWall()

  if currentPlayerId == Role.playerId then
    giftList = Social.giftList;
    receiveData = Social.receiveData;
  else
    giftList = HouseBoard.giftList;
    receiveData = HouseBoard.receiveData;
  end

  scrollContent_Message:Reset(table.Count(receiveData));
  scrollContent_ReceiveGifts:Reset(table.Count(giftList));
end

--為方便計算月日的初始值皆為0顯示為1，鍵盤輸入0按下確定後也是顯示1
function UIHouseBoardFunction.UpdateBirth()
  if inputType == EBirthInputType.Month then

    --檢查前次輸入與此次輸入組合的二位數是否小於13
    if monthNumber * 10 + inputNumber < 13 then
      monthNumber = monthNumber * 10 + inputNumber;
    else
      if monthNumber > 9 then
        return ;
      else
        monthNumber = inputNumber;
      end
    end

      text_Month.text = monthNumber;

    --檢查日期，若該日期不存在於輸入月份則將日期設回初始值
    if dateNumber > HouseBoard.MonthMaxDate(monthNumber) then
      dateNumber = 0;
      text_Date.text = 1;
    end
  end

  if inputType == EBirthInputType.Date then

    --如果沒先輸入月份就直接輸入日期則月份默認為1月
    if monthNumber == 0 then
      monthNumber = 1;
    end

    --檢查兩次輸入數字組成的二位數是否超過月份天數
    if dateNumber * 10 + inputNumber <= HouseBoard.MonthMaxDate(monthNumber) then
      dateNumber = dateNumber * 10 + inputNumber;
    else
      if dateNumber > 9 then
        return ;
      else
        dateNumber = inputNumber;
      end
    end

      text_Date.text = dateNumber;
  end
end

function UIHouseBoardFunction.UpdateRank(kind, myRank, myScoreInfo, rankInfos)
  table.Clear(rankData);

  rankData = rankInfos;
  image_Rank.enabled = false;
  rankTag = kind;
  playerRank = myRank;
  playerScore = myScoreInfo;

  if table.Count(rankData) ~= 0 then
    table.sort(rankData,
      function(a, b)
        if tonumber(a.scoreInfo) == tonumber(b.scoreInfo) then
          if a.time == b.time then
            if a.level == b.level then
              return a.roleId < b.roleId;
            end
            return a.level > b.level;
          end
          return a.time < b.time;
        end
        return tonumber(a.scoreInfo) > tonumber(b.scoreInfo);
      end
    );
  end

  text_Empty.gameObject:SetActive(table.Count(rankData) <= 0);
  scrollContent_Leaderboard:Reset(table.Count(rankData));

  if playerRank > 0 then
    text_Rank.gameObject:SetActive(true);
    this.SetPlayerRank();
  else
    text_Name.text = string.Get(23400);
    text_Rank.gameObject:SetActive(false);
    text_Score.gameObject:SetActive(false);
  end
end

function UIHouseBoardFunction.UpdateRankTagSprite()
  scrollContent_Tag:Refresh();
end

--endregion

--region onclick functions
function UIHouseBoardFunction.OnClick_Close()
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
  if settingEvent ~= nil then
    settingEvent(nil);
  end

  preOpenType:Pop();

  rankTag = ERankTag.Daily;

  UI.Close(UIHouseBoardFunction);
end

function UIHouseBoardFunction.OnClick_SignButton(uiEvent)
  selectSignIndex = uiEvent.parameter;
  this.UpdateSign();
end

function UIHouseBoardFunction.OnClick_Submit()
  if settingEvent ~= nil then
    if type == EHouseBoardFunctionOpenType.Sign then
      if selectSignIndex ~= 0 then
        settingEvent(selectSignIndex);
      end

    elseif type == EHouseBoardFunctionOpenType.Birth then
      if monthNumber == 0 then
        monthNumber = 1;
      end

      if dateNumber == 0 then
        dateNumber = 1;
      end

      settingEvent(monthNumber, dateNumber);
    end
  end

  preOpenType:Pop();
  UI.Close(UIHouseBoardFunction);
end

function UIHouseBoardFunction.OnClick_Month(uiEvent)
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
  local parent = uiEvent.parameter;
  inputType = EBirthInputType.Month;
  monthNumber = 0;
  inputNumber = 0;
  this.SetPad(parent);
end

function UIHouseBoardFunction.OnClick_Date(uiEvent)
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
  local parent = uiEvent.parameter;
  inputType = EBirthInputType.Date;
  dateNumber = 0;
  inputNumber = 0;
  this.SetPad(parent);
end

function UIHouseBoardFunction.OnClick_Number(uiEvent)
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
  inputNumber = tonumber(numberButton.text[uiEvent.parameter]);
  this.UpdateBirth();
end

function UIHouseBoardFunction.OnDown_NumberPadButton(uiEvent)
  numberButton.image[uiEvent.parameter].sprite = UI.GetSprite("but062L");
end

function UIHouseBoardFunction.OnUp_NumberPadButton(uiEvent)
  numberButton.image[uiEvent.parameter].sprite = UI.GetSprite("but062D");
end

function UIHouseBoardFunction.OnClick_OK()
  if tonumber(text_Month.text) ~= 0 then
    monthNumber = tonumber(text_Month.text);
  end

  if tonumber(text_Date.text) ~= 0 then
    dateNumber = tonumber(text_Date.text);
  end

  if monthNumber == 0 then
    text_Month.text = 1;
  end

  if dateNumber == 0 then
    text_Date.text = 1;
  end

  gameObject_NumberPad:SetActive(false);
end

function UIHouseBoardFunction.OnClick_Cancel()
  if inputType == EBirthInputType.Month then
    monthNumber = 0;
  elseif inputType == EBirthInputType.Date then
    dateNumber = 0;
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

  inputNumber = 0;

  this.UpdateBirth();
end

function UIHouseBoardFunction.OnClick_Tag(uiEvent)
  if rankTag == uiEvent.parameter then return end

  rankTag = uiEvent.parameter;
  HouseBoard.SendLeaderBoardRequest(rankTag);
end

function UIHouseBoardFunction.OnClick_AddFriend(uiEvent)
  local rankInfo = uiEvent.parameter;
  Social.Invite(rankInfo.roleId, rankInfo.name);
end

function UIHouseBoardFunction.OnClick_SendGift(uiEvent)
  local rankInfo = uiEvent.parameter;

  HouseBoard.SendOpenBoardRequest(rankInfo.roleId, rankInfo);
end

--endregion

function UIHouseBoardFunction.SetPad(parent)
  local v2 = Vector2.New(parent.rectTransform.anchoredPosition.x + parent.rectTransform.sizeDelta.x * 2, parent.rectTransform.anchoredPosition.y);
  local padRectTransform = gameObject_NumberPad:GetComponent("RectTransform");
  local padTransform = gameObject_NumberPad.transform;
  local originParent = padTransform.parent;

  padTransform:SetParent(parent.gameObject.transform.parent);
  padRectTransform.anchoredPosition = v2;
  padTransform:SetParent(originParent);
  gameObject_NumberPad:SetActive(true);
end

function UIHouseBoardFunction.SetPlayerRank()
  if playerRank < 50 then
    text_Name.text = Role.player.name;
    if playerRank < 4 then
      image_Rank.enabled = true;
      image_Rank.sprite = UI.GetRankSprite(playerRank);
      text_Rank.gameObject:SetActive(false);
    else
      text_Rank.text = playerRank;
    end

    text_Score.gameObject:SetActive(true);
    text_Score.text = playerScore;
  else
    text_Name.text = string.Get(23400);
    text_Rank.gameObject:SetActive(false);
    text_Score.gameObject:SetActive(false);
  end
end
