EUIHouseTag = {
  HomePage = 1,
  House = 2,
}

UIHouseBoard = {}
local this = UIHouseBoard;

this.name = "UIHouseBoard";
this.uiController = nil;

local transform_FrameRect;

--HomePage
local scrollContent_Friend;
local scrollItems_Friend = {};
local scrollContent_Message;
local scrollItems_Message = {};
local scrollContent_Gift;
local scrollItems_Gift = {};
local uiCareer;
local image_GoSendGift;
local image_CharmFeedback;
local image_GiftFeedback;
local event_More;
local image_ChgSignature;
local maxGiftCount = 8;
local image_CharmRedDot;
local image_FeedbackRedDot;

--文字
local text_Title;
local text_Charm;
local text_Sign;
local text_Birth;
local text_Impression;
local text_Favorite;
local text_Hobby;
local text_Area;
local text_Signature;
local text_Marriage;

--禮物/好友
local maxMsgCount = 2;
local maxFriendCount = 4;
local receiveData;
local giftList;
local friendsData;

--var
local currentPlayer;
local currentPlayerId;
local image_Mask;
local image_BG;
local currentTag = EUIHouseTag.HomePage;
local tagData = {};

function UIHouseBoard.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;
  this.uiController.onClose = this.OnClose;

  --UI
  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;
  image_Mask = uiController:FindImage("Image_Mask");
  image_BG = uiController:FindImage("Image_BG");

  --玩家資料
  uiCareer = UICareerController.New(uiController:FindGameObject("Career"));
  image_ChgSignature = uiController:FindImage("Image_ChgSignature");
  image_CharmRedDot = uiController:FindImage("Image_CharmRedDot");
  image_FeedbackRedDot = uiController:FindImage("Image_FeedbackRedDot");

  text_Title = uiController:FindText("Text_Title");
  text_Charm = uiController:FindText("Text_Friendly");
  text_Signature = uiController:FindText("Text_Signature");
  text_Impression = uiController:FindText("Text_Impression");
  text_Sign = uiController:FindText("Text_Sign");
  text_Hobby = uiController:FindText("Text_Hobby");
  text_Favorite = uiController:FindText("Text_Favorite");
  text_Area = uiController:FindText("Text_Area");
  text_Birth = uiController:FindText("Text_Birth");
  text_Marriage = uiController:FindText("Text_Marriage");

  local tempEvent;
  tempEvent = uiController:FindEvent("Image_ChooseSign");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Sign);
  tempEvent = uiController:FindEvent("Image_ChooseBirth");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Birth);
  tempEvent = uiController:FindEvent("Image_EditImpression");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_EditImpression);
  tempEvent = uiController:FindEvent("Image_EditFavorite");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_EditFavorite);
  tempEvent = uiController:FindEvent("Image_EditHobby");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_EditHobby);
  tempEvent = uiController:FindEvent("Image_EditArea");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_EditArea);
  tempEvent = uiController:FindEvent("Image_ChgSignature");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_EditSignature);
  tempEvent = uiController:FindEvent("Image_TotalFriendly");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_FriendlyRank);

  image_GoSendGift = uiController:FindEvent("Image_GoSendGift");
  image_GoSendGift:SetListener(EventTriggerType.PointerClick, this.OnClick_GiftShop);

  image_CharmFeedback = uiController:FindEvent("Image_CharmFeedback");
  image_CharmFeedback:SetListener(EventTriggerType.PointerClick, this.OnClick_CharmFeedback);

  image_GiftFeedback = uiController:FindEvent("Image_GiftFeedback");
  image_GiftFeedback:SetListener(EventTriggerType.PointerClick, this.OnClick_GiftFeedback);

  event_More = uiController:FindEvent("Image_More");
  event_More:SetListener(EventTriggerType.PointerClick, this.OnClick_More);

  --親密好友
  scrollContent_Friend = uiController:FindScrollContent("ScrollContent_Friend");
  scrollContent_Friend.onInitialize = this.OnInitialize_ScrollContent_Friend;
  scrollContent_Friend.onItemChange = this.OnItemChange_ScrollContent_Friend;
  scrollContent_Friend:Initialize(1);

  --禮物牆
  scrollContent_Gift = uiController:FindScrollContent("ScrollContent_Gift");
  scrollContent_Gift.onInitialize = this.OnInitialize_ScrollContent_Gift;
  scrollContent_Gift.onItemChange = this.OnItemChange_ScrollContent_Gift;
  scrollContent_Gift:Initialize(1);

  --訊息
  scrollContent_Message = uiController:FindScrollContent("ScrollContent_Message");
  scrollContent_Message.onInitialize = this.OnInitialize_ScrollContent_Message;
  scrollContent_Message.onItemChange = this.OnItemChange_ScrollContent_Message;
  scrollContent_Message:Initialize(1);

  HouseBoard.SetSignList();

end

function UIHouseBoard.OnOpen(playerInfo)
  local playerLevel;
  local playerTurn;

  --玩家本身的資料
  if playerInfo == nil then
    currentPlayer = Role.player;
    currentPlayerId = Role.playerId;
    this.uiController.usePreviousStack = false;
    RedDot.Remove(ERedDot.FriendGift);
    playerLevel =currentPlayer:GetAttribute(EAttribute.Lv);
    playerTurn =currentPlayer:GetAttribute(EAttribute.Turn);
  --其他玩家的資料
  else
    currentPlayer = playerInfo;
    currentPlayerId = playerInfo.roleId;
    this.uiController.usePreviousStack = true;
    playerLevel = currentPlayer.level;
    playerTurn = currentPlayer.turn;
  end

  currentTag = EUIHouseTag.HomePage;

  image_GoSendGift.gameObject:SetActive(currentPlayerId ~= Role.playerId and Social.CheckTurnStatus(playerLevel, playerTurn));
  image_GiftFeedback.gameObject:SetActive(UICharmFeedback.ActivityIsOpen() and (Role.player:GetAttribute(EAttribute.Lv) >= 60 or Role.player:GetAttribute(EAttribute.Turn) > 0));
  image_CharmFeedback.gameObject:SetActive(Role.player:GetAttribute(EAttribute.Lv) >= 60 or Role.player:GetAttribute(EAttribute.Turn) > 0);
  image_Mask.enabled = currentPlayerId ~= Role.playerId;
  image_BG.enabled = currentPlayerId ~= Role.playerId;
  image_ChgSignature.enabled = currentPlayerId == Role.playerId;

  return true;
end

function UIHouseBoard.OnVisible(visible)
  if visible then
    if currentPlayerId ~= Role.playerId then
      table.Clear(tagData);

      tagData[1] = { string.Get(23355), nil };
      --tagData[2] = { string.Get(), nil };

      UIFrame.Active(transform_FrameRect, string.Get(23356), this.OnClick_Close, this.OnClick_Help, this.OnClick_Tag, tagData, currentTag, 1, nil);
    end

    this.UpdateUI();
  end
end

function UIHouseBoard.OnClick_Tag(tag)
  if tag == EUIHouseTag.House then
    return false;
  end
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

  currentTag = tag;
  this.UpdateUI();

  return true;
end

function UIHouseBoard.OnClick_Help(checkShow)
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
  if checkShow ~= true then
    UI.Open(UITutorialHint, 0, this, string.Get(23356), string.Get(24127));
  end

  return true;
end

function UIHouseBoard.OnClose(fromStatus)
  if fromStatus then
    currentPlayerId = nil;
    currentPlayer = nil;
  end

  return true;
end

function UIHouseBoard.OnClick_Close()
  currentPlayerId = nil;
  currentPlayer = nil;

  UI.Close(UIHouseBoard);

  HouseBoard.SetPreviousBoardData();
end

function UIHouseBoard.OnInitialize_ScrollContent_Friend(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Friend[itemIndex] = {};
    scrollItems_Friend[itemIndex].item = {};
    scrollItems_Friend[itemIndex].text_Name = {};
    scrollItems_Friend[itemIndex].text_Friendly = {};
    scrollItems_Friend[itemIndex].image_Heart = {};

    for i = 1, maxFriendCount do
      scrollItems_Friend[itemIndex].item[i] = scrollItems[itemIndex]:Find(string.Concat("FriendItem (", i, ")")).gameObject;
      scrollItems_Friend[itemIndex].text_Name[i] = scrollItems[itemIndex]:Find(string.Concat("FriendItem (", i, ")")):Find("Text_Name"):GetComponent("Text");
      scrollItems_Friend[itemIndex].text_Friendly[i] = scrollItems[itemIndex]:Find(string.Concat("FriendItem (", i, ")")):Find("Text_Friendly"):GetComponent("Text");
      scrollItems_Friend[itemIndex].image_Heart[i] = scrollItems[itemIndex]:Find(string.Concat("FriendItem (", i, ")")):Find("Image_HeartBG"):Find("Image_Heart"):GetComponent("Image");
    end
  end
end

function UIHouseBoard.OnItemChange_ScrollContent_Friend(dataIndex, itemIndex)
  local roleInfo;

  for i = 1, maxFriendCount do
    local roleId = friendsData[i];

    if roleId == nil then
      scrollItems_Friend[itemIndex].item[i]:SetActive(false);
    else
      scrollItems_Friend[itemIndex].item[i]:SetActive(true);

      local listTemp;

      if currentPlayerId == Role.playerId then
        listTemp = Social;
      else
        listTemp = HouseBoard;
      end

      if table.Count(listTemp.friends) == 0 then
        roleInfo = npcDatas[roleId];
        roleInfo.friendly = 0;
      else
        roleInfo = listTemp.friends[roleId];
      end

      scrollItems_Friend[itemIndex].text_Name[i].text = roleInfo.name;
      scrollItems_Friend[itemIndex].text_Friendly[i].text = roleInfo.friendly;
      scrollItems_Friend[itemIndex].image_Heart[i].fillAmount = roleInfo.friendly / Social.maxFriendly;
    end
  end

  return true;
end

function UIHouseBoard.OnInitialize_ScrollContent_Gift(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Gift[itemIndex] = {};
    scrollItems_Gift[itemIndex].item = {};
    scrollItems_Gift[itemIndex].image_BG = {};
    scrollItems_Gift[itemIndex].image_Empty = {};
    scrollItems_Gift[itemIndex].image_FriendNameBG = {};
    scrollItems_Gift[itemIndex].text_ItemName = {};
    scrollItems_Gift[itemIndex].text_FriendName = {};
    scrollItems_Gift[itemIndex].text_Quant = {};

    for i = 1, maxGiftCount do
      scrollItems_Gift[itemIndex].item[i] = UIItemController.New(scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")):Find("Image_Item"));
      scrollItems_Gift[itemIndex].image_BG[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")):GetComponent("Image");
      scrollItems_Gift[itemIndex].image_Empty[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")):Find("Image_Empty"):GetComponent("Image");
      scrollItems_Gift[itemIndex].image_FriendNameBG[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")):Find("Image_NameBG");
      scrollItems_Gift[itemIndex].text_ItemName[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")):Find("Text_ItemName"):GetComponent("Text");
      scrollItems_Gift[itemIndex].text_FriendName[i] = scrollItems_Gift[itemIndex].image_FriendNameBG[i]:Find("Text_Name"):GetComponent("Text");
      scrollItems_Gift[itemIndex].text_Quant[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")):Find("Text_Quant"):GetComponent("Text");
    end
  end
end

function UIHouseBoard.OnItemChange_ScrollContent_Gift(dataIndex, itemIndex)
  for i = 1, maxGiftCount do
    local itemSave = giftList[i];

    scrollItems_Gift[itemIndex].image_Empty[i].enabled = (itemSave == nil);

    if itemSave == nil then
      scrollItems_Gift[itemIndex].item[i]:SetItem(0);
      scrollItems_Gift[itemIndex].image_BG[i].sprite = UI.GetSprite("bod153");
      scrollItems_Gift[itemIndex].image_FriendNameBG[i].gameObject:SetActive(false);
      scrollItems_Gift[itemIndex].text_ItemName[i].text = "";
      scrollItems_Gift[itemIndex].text_Quant[i].text = "";
    else
      scrollItems_Gift[itemIndex].item[i]:SetItem(itemSave.Id);
      scrollItems_Gift[itemIndex].image_BG[i].sprite = souvenirDatas[itemSave.Id]:GetQualityColor();
      scrollItems_Gift[itemIndex].image_Empty[i].enabled = false;
      scrollItems_Gift[itemIndex].image_FriendNameBG[i].gameObject:SetActive(souvenirDatas[itemSave.Id]:CanNamed());
      scrollItems_Gift[itemIndex].text_ItemName[i].text = itemDatas[itemSave.Id]:GetName();
      scrollItems_Gift[itemIndex].text_Quant[i].text = string.format("X%d",itemSave.quant);
      scrollItems_Gift[itemIndex].text_FriendName[i].text = itemSave.name;
    end
  end

  return true;
end

function UIHouseBoard.OnInitialize_ScrollContent_Message(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Message[itemIndex] = {};
    scrollItems_Message[itemIndex].item = {};
    scrollItems_Message[itemIndex].text_Name = {};
    scrollItems_Message[itemIndex].text_Item = {};
    scrollItems_Message[itemIndex].text_Quant = {};
    scrollItems_Message[itemIndex].text_Date = {};

    for i = 1, maxMsgCount do
      scrollItems_Message[itemIndex].item[i] = scrollItems[itemIndex]:Find(string.Concat("MsgItem (", i, ")")).gameObject;
      scrollItems_Message[itemIndex].text_Name[i] = scrollItems[itemIndex]:Find(string.Concat("MsgItem (", i, ")")):Find("Text_Name"):GetComponent("Text");
      scrollItems_Message[itemIndex].text_Item[i] = scrollItems[itemIndex]:Find(string.Concat("MsgItem (", i, ")")):Find("Text_Item"):GetComponent("Text");
      scrollItems_Message[itemIndex].text_Quant[i] = scrollItems[itemIndex]:Find(string.Concat("MsgItem (", i, ")")):Find("Text_Quant"):GetComponent("Text");
      scrollItems_Message[itemIndex].text_Date[i] = scrollItems[itemIndex]:Find(string.Concat("MsgItem (", i, ")")):Find("Text_Date"):GetComponent("Text");

    end
  end
end

function UIHouseBoard.OnItemChange_ScrollContent_Message(dataIndex, itemIndex)
  for i = 1, maxMsgCount do
    local msg = receiveData[i];

    if msg == nil then
      scrollItems_Message[itemIndex].item[i]:SetActive(false);
    else
      scrollItems_Message[itemIndex].item[i]:SetActive(true);
      scrollItems_Message[itemIndex].text_Name[i].text = msg.name;
      scrollItems_Message[itemIndex].text_Item[i].text = itemDatas[msg.itemId]:GetName();
      scrollItems_Message[itemIndex].text_Quant[i].text = string.format(string.Get(23407), msg.quant);
      scrollItems_Message[itemIndex].text_Date[i].text = DateTime.FromOADate(msg.time):ToString(string.Get(23403));
    end
  end

  return true;
end

function UIHouseBoard.UpdateUI(playerInfo)
  if playerInfo then
    currentPlayer = playerInfo;
  end

  image_CharmRedDot.enabled = RedDot.Check(ERedDot.CharmReward);
  image_FeedbackRedDot.enabled = RedDot.Check(ERedDot.GiftFeedback);

  this.UpdateProfile();
  this.UpdateFriend();
  this.UpdateGiftsAndMessage();
end

function UIHouseBoard.UpdateProfile()
  if currentPlayer == nil then return end

  local list = HouseBoard.profileInfo;
  local month = 0;
  local date = 0;
  local default;
  local signatureDefault;

  if currentPlayerId == Role.playerId then
    uiCareer:SetCareer(currentPlayer:GetAttribute(EAttribute.Turn), currentPlayer:GetAttribute(EAttribute.Element), currentPlayer:GetAttribute(EAttribute.Career), false, currentPlayer:GetAttribute(EAttribute.Turn3Element));
    default = string.Get(23367);
    signatureDefault = string.Get(23358);
  else
    uiCareer:SetCareer(currentPlayer.turn, currentPlayer.element, currentPlayer.career, false, currentPlayer.turn3Info.element);
    default = "";
    signatureDefault = "";
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

  text_Title.text = currentPlayer.name;
  text_Marriage.text = HouseBoard.MarriageText(list.marriage);
  text_Charm.text = list.charm;

  if list.sign ~= 0  and list.sign ~= nil then
    text_Sign.text = HouseBoard.signList[list.sign];
  else
    text_Sign.text = default;
  end

  if string.IsNullOrEmpty(list.signature) then
    text_Signature.text = signatureDefault;
  else
    text_Signature.text = list.signature;
  end

  if string.IsNullOrEmpty(list.impression) then
    text_Impression.text = default;
  else
    text_Impression.text = list.impression;
  end

  if string.IsNullOrEmpty(list.favorite) then
    text_Favorite.text = default;
  else
    text_Favorite.text = list.favorite;
  end

  if string.IsNullOrEmpty(list.area) then
    text_Area.text = default;
  else
    text_Area.text = list.area;
  end

  if string.IsNullOrEmpty(list.hobby) then
    text_Hobby.text = default;
  else
    text_Hobby.text = list.hobby;
  end

  if list.birth.month ~= nil then
    month = list.birth.month;
  end

  if list.birth.date ~= nil then
    date = list.birth.date;
  end

  if month == 0 or date == 0 then
    text_Birth.text = default;
  else
    text_Birth.text = string.format(string.Get(23368), month, date);
  end

end

function UIHouseBoard.UpdateFriend()
  if currentPlayer == nil then return end

  HouseBoard.SetFriendList(currentPlayerId);
  
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
  friendsData = HouseBoard.friendsData;

  --顯示在UI上的好友列表
  scrollContent_Friend:Reset(1);
end

function UIHouseBoard.UpdateGiftsAndMessage()
  this.UpdateMessage();
  this.UpdateGifts();
end

function UIHouseBoard.UpdateGifts()
  if currentPlayerId == Role.playerId then
    giftList = Social.giftList;
  else
    giftList = HouseBoard.giftList;
  end

  scrollContent_Gift:Reset(1);
end

function UIHouseBoard.UpdateMessage()
  if currentPlayerId == Role.playerId then
    receiveData = Social.receiveData;
  else
    receiveData = HouseBoard.receiveData;
  end

  scrollContent_Message:Reset(1);
end

function UIHouseBoard.RefreshProfileData(result)
  if result == 1 then
    --C:105-001 <要求玩家個人資料> +玩家ID(8)
    HouseBoard.SendDataRequest(currentPlayerId, 1);
  else
    ShowCenterMessage(string.Get(20663));
  end

end

function UIHouseBoard.OnClick_GiftShop()
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
  UI.Open(UISouvenirShop, currentPlayerId);
end

function UIHouseBoard.OnClick_CharmFeedback()
  UICharmFeedback.OpenCharmFeedback(currentPlayerId == Role.playerId);
end

function UIHouseBoard.OnClick_GiftFeedback()
  UICharmFeedback.OpenGiftFeedback(currentPlayerId == Role.playerId);
end

function UIHouseBoard.OnClick_More()
  if currentPlayerId == Role.playerId then
    UI.Close(UIHouseBoard);
  end

  UIHouseBoardFunction.OpenGiftWall(currentPlayerId);
end

function UIHouseBoard.OnClick_EditSignature()
  if currentPlayerId ~= Role.playerId then return end;

  ShowPlayerInfoInput(string.Get(23357),
    function(text)
      if string.IsNullOrEmpty(text) then return end;

      for k, v in pairs(tabooDatas) do
        if string.match(text, string.GetNocase(v)) ~= nil then
          ShowCenterMessage(string.Get(40327));
          return;
        end
      end

      --C:105-002 <設定玩家資料> +設定類型(1) 1.個性簽名 +字串長度(1) +字串(?)
      sendBuffer:Clear();
      sendBuffer:WriteByte(1);
      sendBuffer:WriteByte(string.GetLength(text));
      sendBuffer:WriteString(text);
      Network.Send(105, 2, sendBuffer);

    end,
    7
  );
end

function UIHouseBoard.OnClick_EditImpression()
  if currentPlayerId ~= Role.playerId then return end;

  ShowPlayerInfoInput(string.Get(23361),
    function(text)
      if string.IsNullOrEmpty(text) then return end;

      for k, v in pairs(tabooDatas) do
        if string.match(text, string.GetNocase(v)) ~= nil then
          ShowCenterMessage(string.Get(40327));
          return;
        end
      end

      --C:105-002 <設定玩家資料> +設定類型(1) 2.自訂印象 +字串長度(1) +字串(?)
      sendBuffer:Clear();
      sendBuffer:WriteByte(2);
      sendBuffer:WriteByte(string.GetLength(text));
      sendBuffer:WriteString(text);
      Network.Send(105, 2, sendBuffer);

    end
  );
end

function UIHouseBoard.OnClick_EditFavorite()
  if currentPlayerId ~= Role.playerId then return end;

  ShowPlayerInfoInput(string.Get(23364),
    function(text)
      if string.IsNullOrEmpty(text) then return end;

      for k, v in pairs(tabooDatas) do
        if string.match(text, string.GetNocase(v)) ~= nil then
          ShowCenterMessage(string.Get(40327));
          return;
        end
      end

      --C:105-002 <設定玩家資料> +設定類型(1) 3.喜好 +字串長度(1) +字串(?)
      sendBuffer:Clear();
      sendBuffer:WriteByte(3);
      sendBuffer:WriteByte(string.GetLength(text));
      sendBuffer:WriteString(text);
      Network.Send(105, 2, sendBuffer);

    end
  );
end

function UIHouseBoard.OnClick_Sign()
  if currentPlayerId ~= Role.playerId then return end;
  UI.Close(UIHouseBoard);

  UIHouseBoardFunction.SetSign(
    function(index)
      if index == nil then return end;
      --C:105-002 <設定玩家資料> +設定類型(1) 4.星座 +星座編號(1)
      sendBuffer:Clear();
      sendBuffer:WriteByte(4);
      sendBuffer:WriteByte(index);
      Network.Send(105, 2, sendBuffer);
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

    end,
    HouseBoard.profileInfo.sign          --目前設定的星座
  );
end

function UIHouseBoard.OnClick_Birth()
  if currentPlayerId ~= Role.playerId then return end;
  UI.Close(UIHouseBoard);

  UIHouseBoardFunction.SetBirth(
    function(month, date)
      if month == nil or date == nil then return end;

      --C:105-002 <設定玩家資料> +設定類型(1) 5.生日 +月(1) +日(1)
      sendBuffer:Clear();
      sendBuffer:WriteByte(5);
      sendBuffer:WriteByte(month);
      sendBuffer:WriteByte(date);
      Network.Send(105, 2, sendBuffer);

    end,
    HouseBoard.profileInfo.birth.month,   --目前月份
    HouseBoard.profileInfo.birth.date     --目前日期
  );
end

function UIHouseBoard.OnClick_EditArea()
  if currentPlayerId ~= Role.playerId then return end;

  ShowPlayerInfoInput(string.Get(23365),
    function(text)
      if string.IsNullOrEmpty(text) then return end;

      for k, v in pairs(tabooDatas) do
        if string.match(text, string.GetNocase(v)) ~= nil then
          ShowCenterMessage(string.Get(40327));
          return;
        end
      end

      --C:105-002 <設定玩家資料> +設定類型(1) 6.居住地 +字串長度(1) +字串(?)
      sendBuffer:Clear();
      sendBuffer:WriteByte(6);
      sendBuffer:WriteByte(string.GetLength(text));
      sendBuffer:WriteString(text);
      Network.Send(105, 2, sendBuffer);

    end
  );
end

function UIHouseBoard.OnClick_EditHobby()
  if currentPlayerId ~= Role.playerId then return end;
  
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
  
  ShowPlayerInfoInput(string.Get(23363),
    function(text)
      if string.IsNullOrEmpty(text) then return end;

      for k, v in pairs(tabooDatas) do
        if string.match(text, string.GetNocase(v)) ~= nil then
          ShowCenterMessage(string.Get(40327));
          return;
        end
      end

      --C:105-002 <設定玩家資料> +設定類型(1) 7.興趣 +字串長度(1) +字串(?)
      sendBuffer:Clear();
      sendBuffer:WriteByte(7);
      sendBuffer:WriteByte(string.GetLength(text));
      sendBuffer:WriteString(text);
      Network.Send(105, 2, sendBuffer);

    end
  );
end

function UIHouseBoard.OnClick_FriendlyRank()
  if currentPlayerId == Role.playerId then
    UI.Close(UIHouseBoard);
  end

  UIHouseBoardFunction.OpenFriendlyRank();
end

