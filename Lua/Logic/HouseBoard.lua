HouseBoard = {};
local this = HouseBoard;

this.profileInfo = {};
this.profileInfo.marriage = 0;
this.profileInfo.sign = nil;
this.profileInfo.birth = {};
this.profileInfo.birth.month = 0;
this.profileInfo.birth.date = 0;
this.profileInfo.charm = 0;
this.profileInfo.signature = nil;
this.profileInfo.impression = nil;
this.profileInfo.favorite = nil;
this.profileInfo.area = nil;
this.profileInfo.hobby =nil;

--收禮資料
this.receiveData = {};
this.giftList = {};

--好友資料
this.totalFriendly = 0;
this.friendsData = {};
this.friends = {};      --其他玩家的好友清單

--星座
this.signList = {};

--記錄未被關閉的贈禮板的開啟順序
this.orderOfOpenBoardId = nil;

--玩家本身的好感度數值紀錄
this.playerCharm = 0;

local openBoardId;
local boardPlayerInfo;
local isLoadFromStack = false;
--功能開關
local featureIsOpen = true;

function HouseBoard.FeatureIsOpen()
  return featureIsOpen;
end

--C:105-001 <要求玩家個人資料> +玩家ID(8)
--C:105-008 <要求歷史禮物總量> +玩家ID(8)
--C:105-009 <要求送禮紀錄> +玩家ID(8)
function HouseBoard.SendDataRequest(roleId, subKind)
  sendBuffer:Clear();
  sendBuffer:WriteInt64(roleId);

  Network.Send(105, subKind, sendBuffer);
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

--C:105-004 <要求排行榜資料> +kind(1)
function HouseBoard.SendLeaderBoardRequest(kind)
  sendBuffer:Clear();
  sendBuffer:WriteByte(kind);
  Network.Send(105, 4, sendBuffer);
  UIHouseBoardFunction.UpdateRankTagSprite();
end

function HouseBoard.SendOpenBoardRequest(roleId, playerInfo, loadFromStack)

  --C:105-001 <要求玩家個人資料> +玩家ID(8)
  this.SendDataRequest(roleId, 1);

  openBoardId = roleId;
  boardPlayerInfo = playerInfo;
  isLoadFromStack = loadFromStack;

  if this.orderOfOpenBoardId == nil then
    this.orderOfOpenBoardId = Stack.New();
  end

  if isLoadFromStack == nil then
    if openBoardId ~= Role.playerId then
      local data = {};
      data.Id = openBoardId;
      data.info = boardPlayerInfo;
      this.orderOfOpenBoardId:Push(data);
    end
  end
end

function HouseBoard.SetPreviousBoardData()
  this.orderOfOpenBoardId:Pop();

  if this.orderOfOpenBoardId:Count() > 0 then
    local data = this.orderOfOpenBoardId:Peek();
    this.SendOpenBoardRequest(data.Id, data.info, true);
  end
end

function HouseBoard.SetProfileAndFriendData(data)
  table.Clear(this.profileInfo);

  local nowId = data:ReadInt64();

  this.profileInfo.marriage = data:ReadByte();
  this.profileInfo.sign = data:ReadByte();
  this.profileInfo.birth = {};
  this.profileInfo.birth.month = data:ReadByte();
  this.profileInfo.birth.date = data:ReadByte();
  this.profileInfo.charm = data:ReadInt32();
  local length = data:ReadByte();
  this.profileInfo.signature = data:ReadString(length);
  length = data:ReadByte();
  this.profileInfo.impression = data:ReadString(length);
  length = data:ReadByte();
  this.profileInfo.favorite = data:ReadString(length);
  length = data:ReadByte();
  this.profileInfo.area = data:ReadString(length);
  length = data:ReadByte();
  this.profileInfo.hobby = data:ReadString(length);

  --好友
  table.Clear(this.friends);

  local count = data:ReadByte();

  if count > 0 then
    for i = 1, count do
      local roleId = data:ReadInt64();

      this.friends[roleId] = {};
      this.friends[roleId].name = data:ReadString(data:ReadByte());
      this.friends[roleId].friendly = data:ReadInt16();
    end
  end

  if nowId == Role.playerId then
    this.playerCharm = this.profileInfo.charm;
  end

  if openBoardId == nil then
    UIHouseBoard.UpdateProfile();
    UIHouseBoard.UpdateFriend();
  else
    --C:105-008 <要求歷史禮物總量> +玩家ID(8)
    this.SendDataRequest(openBoardId, 8);
  end
end

function HouseBoard.SetGiftWallData(data)
  local count = data:ReadByte();

  local listTemp;

  if openBoardId ~= Role.playerId then
    listTemp = this.giftList;
  else
    listTemp = Social.giftList;
  end

  table.Clear(listTemp);

  for i = 1, count do
    local giftData = {};

    giftData = {};
    giftData.name = data:ReadString(data:ReadByte());
    giftData.Id = data:ReadUInt16();
    giftData.quant = data:ReadInt32();

    table.insert(listTemp, giftData);
  end

  SouvenirShop.SortByQuality(listTemp);

  --C:105-009 <要求送禮紀錄> +玩家ID(8)
  this.SendDataRequest(openBoardId, 9);
end

function HouseBoard.SetReceiveData(data)
  local listTemp;
  if openBoardId ~= Role.playerId then
    listTemp = this.receiveData;
  else
    listTemp = Social.receiveData;
  end

  table.Clear(listTemp);

  local count = data:ReadByte();

  for i = 1, count do
    local receiveData = {};

    receiveData.roleId = data:ReadInt64();
    receiveData.name = data:ReadString(data:ReadByte());
    receiveData.itemId = data:ReadUInt16();
    receiveData.quant = data:ReadByte();
    receiveData.time = data:ReadDouble();

    if receiveData.itemId ~= 0 then
      table.insert(listTemp, receiveData);
    end
  end

  this.SortByTime(listTemp);

  if isLoadFromStack then
    UIHouseBoard.UpdateUI(boardPlayerInfo);
    isLoadFromStack = nil;
  else
    if UI.IsVisible(UISocialFunction) then
      UI.Close(UISocialFunction);
    end

    if openBoardId == Role.playerId then
      if UI.IsVisible(UIStatus) then
        UIStatus.OpenProfile();
      end
    else
      UI.Open(UIHouseBoard, boardPlayerInfo);
    end
  end

  openBoardId = nil;
end

function HouseBoard.SetFriendList(currentPlayerId)
  table.Clear(this.friendsData);
  this.totalFriendly = 0;

  local listTemp;

  if currentPlayerId ~= Role.playerId then
    listTemp = this;
  else
    listTemp = Social;
  end

  --無好友:隨機塞四個NPC進去
  if table.Count(listTemp.friends) == 0 then
    this.SetNpcList();
  else
    for roleId in pairs(listTemp.friends) do
      table.insert(this.friendsData, roleId);
      this.totalFriendly = this.totalFriendly + listTemp.friends[roleId].friendly
    end

    this.SortFriendList(listTemp.friends);
  end
end

function HouseBoard.SetNpcList()
  local npcList = {};
  --找出所有跟隨型npc
  for id in pairs(npcDatas) do
    if npcDatas[id].kind == EHuman.FollowNpc then
      table.insert(npcList, id);
    end
  end

  --隨機取4位不同屬性的npc
  for i = 1, 4 do
    local index = math.random(#npcList);

    while npcDatas[npcList[index]].element ~= i do
      index = math.random(#npcList);
    end

    table.insert(this.friendsData, npcList[index]);
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

function HouseBoard.SortFriendList(friends)
  if friends == nil then return end

  --沒收到過禮物=>總好感度為0=>依ID排序
  if this.totalFriendly == 0 then
    table.sort(this.friendsData,
      function(a, b)
        return a < b;
      end
    );
  else
    --好感度排序
    table.sort(this.friendsData,
      function(a, b)
        return friends[a].friendly > friends[b].friendly
      end
    );
  end
end

function HouseBoard.SortByTime(list)
  table.sort(list,
    function(a, b)
      return a.time > b.time;
    end
  );
end

-- 檢查本地端紀錄是否超過100條
function HouseBoard.CheckReceiveData(list)
  local count = table.Count(list);

  if count > 100 then
    local offset = count - 100;
    local receiveListTemp = {};

    for i = 1, 100 do
      table.insert(receiveListTemp, list[i + offset]);
      list[i] = receiveListTemp[i];
      list[i + offset] = nil;
    end
  end
end

function HouseBoard.AddReceiveData(data)
  local receiveTemp = {};
  local roleId = data:ReadInt64();

  receiveTemp.roleId = roleId;
  receiveTemp.name = data:ReadString(data:ReadByte());
  receiveTemp.itemId = data:ReadUInt16();
  receiveTemp.quant = data:ReadByte();
  receiveTemp.time = data:ReadDouble();

  local listTemp;
  if roleId ~= Role.playerId then
    listTemp = Social;
    RedDot.Add(ERedDot.FriendGift);
    UICharmFeedback.CheckRedDot();
  else
    listTemp = this;
  end

  table.insert(listTemp.receiveData, receiveTemp);

  this.CheckReceiveData(listTemp.receiveData);
  this.SortByTime(listTemp.receiveData);

  local giftTemp = {};
  giftTemp.Id = receiveTemp.itemId;
  giftTemp.quant = receiveTemp.quant;
  giftTemp.name = receiveTemp.name;

  local isExist = false;

  --檢查歷史紀錄是否已存在禮物紀錄
  for i = 1, table.Count(listTemp.giftList) do
    if listTemp.giftList[i].Id == receiveTemp.itemId then
      listTemp.giftList[i].quant = listTemp.giftList[i].quant + receiveTemp.quant;
      listTemp.giftList[i].name = receiveTemp.name;
      isExist = true;
      break;
    end
  end

  --檢查歷史紀錄是否為0
  if table.Count(listTemp.giftList) == 0 or isExist == false then
    table.insert(listTemp.giftList, giftTemp);
  end

  SouvenirShop.SortByQuality(listTemp.giftList);

  if UI.IsVisible(UIHouseBoard) then
    UIHouseBoard.UpdateGiftsAndMessage();
    UIHouseBoard.UpdateFriend();
  end

  if UI.IsVisible(UIHouseBoardFunction) then
    UIHouseBoardFunction.UpdateGiftWall();
  end
end

function HouseBoard.SetSignList()
  table.Clear(this.signList);
  local num = 23380;

  for i = 1, 12 do
    this.signList[i] = string.Get(num + i);
  end
end

function HouseBoard.MarriageText(marriage)
  if marriage == 0 or marriage == nil then
    return string.Get(23360);
  elseif marriage == 1 then
    return string.Get(23359);
  end
end

function HouseBoard.MonthMaxDate(monthNumber)
  local february = 29;  --二月
  local lunar = 30;     --小月
  local solar = 31;     --大月

  if monthNumber < 8 then
    if monthNumber == 0 then
      return solar;
    elseif monthNumber % 2 == 0 then
      if monthNumber == 2 then
        return february;
      else
        return lunar;
      end
    else
      return solar;
    end
  elseif monthNumber > 7 then
    if monthNumber % 2 == 0 then
      return solar;
    else
      return lunar;
    end
  end
end
