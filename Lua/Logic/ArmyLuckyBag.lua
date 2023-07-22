ArmyLuckyBag = {}
local this = ArmyLuckyBag;

local serverLuckybagData = {};   --舊軍團福袋
local serverAllLuckBagData = {}; --伺服器福袋 index為紅包流水號
local showData = {};             --介面顯示用資料 開介面時選擇舊軍團福袋or伺服器福袋資料傳入
local isClick = false;
local UIState = 0;

function ArmyLuckyBag.Clear()
  table.Clear(serverLuckybagData);
  table.Clear(serverAllLuckBagData);
  table.Clear(showData);
  table.Clear(CountZeroShowData);
  isClick = false;
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

function ArmyLuckyBag.GetLuckyBagKind(index)
  return showData[index].LuckBagKind;
end

function ArmyLuckyBag.SetUIState(index)
  UIState = index;
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

function ArmyLuckyBag.SendGetLuckyBagProtocal(kind, index)
  if kind == 1 then
    ArmyLuckyBag.SendGetLuckybag(index);
  elseif kind == 2 then
    ArmyLuckyBag.SendGetServerLuckybag(index);
  end
end

--種類 97: <搶紅包活動> + Kind(1)
--                        種類 1: <搶紅包> + Index(1)
--                        種類 2: 查全部盤面
function ArmyLuckyBag.SendGetLuckybag(index)
  local data = this.GetLuckyBagDataByIdx(1, index)
  if data == nil then return end

  if isClick then
    ShowCenterMessage(string.Get(22841));
    return;
  end

  if (data.time - CGTimer.serverTime).TotalSeconds <= 0 then
    ShowCenterMessage(string.Get(22891));
    return;
  end

  sendBuffer:Clear()
  sendBuffer:WriteByte(97);
  sendBuffer:WriteByte(1);
  sendBuffer:WriteByte(data.index);
  Network.Send(77, 11, sendBuffer);
end

--種類 97: <搶紅包活動> + Kind(1)
--                        種類 1: <搶紅包> + Index(1)
--                        種類 2: 查全部盤面
function ArmyLuckyBag.SendGetServerLuckybag(index)
  local data = this.GetLuckyBagDataByIdx(2, index)
  if data == nil then return end

  if isClick then
    ShowCenterMessage(string.Get(22841));
    return;
  end

  if (data.time - CGTimer.serverTime).TotalSeconds <= 0 then
    ShowCenterMessage(string.Get(22891));
    return;
  end

  sendBuffer:Clear()
  sendBuffer:WriteByte(118);
  sendBuffer:WriteByte(1);
  sendBuffer:WriteInt32(data.index);
  Network.Send(77, 11, sendBuffer);
end

function ArmyLuckyBag.QueryLuckyBagData()
  sendBuffer:Clear()
  sendBuffer:WriteByte(97);
  sendBuffer:WriteByte(2);
  Network.Send(77, 11, sendBuffer);
end

function ArmyLuckyBag.QueryLuckyServerBagData()
  sendBuffer:Clear()
  sendBuffer:WriteByte(118);
  sendBuffer:WriteByte(2);
  Network.Send(77, 11, sendBuffer);
end

--[[
<搶紅包活動> + Kind(1) 
               種類 0: <個別紅包狀態> + 紅包索引(1) + 紅包ID(4) + 玩家姓名(?) + 到期時間(8) + 剩餘數量(1)
               種類 1: <發紅包> + Kind(1)
                                       1.發送成功, 
                                       2.無所屬軍團，不可使用, 
                                       3.入團未滿8小時，不能發福袋, 
                                       4.本日軍團福袋發放數量已額滿, 
                                       5.發送的福袋未被領取完畢，請勿重複發放。
                                       6.玩家發紅包 +玩家ID(8)
               種類 2: <搶紅包結果> + Kind(1)
                                           1.搶成功, 
                                           2.入團未滿8小時，不能搶福袋, 
                                           3.搶到紅包後需等待5秒才能再點擊, 
                                           4.福袋已經被搶完囉！, 
                                           5.本日已達領取上限。
                                           6.你已經搶過這個福袋了
]]--

function ArmyLuckyBag.ReciveData(data, actKind)
  local kind = data:ReadByte();
  local result;
  local index;
  local count;
  local preCount, curCount;


  --收資料前福帶數量


  local ownerId = { };
  local ownerName = { };
  local prizeKind = { };
  local itemID = {};
  local isFirst = {};
  local luckyBagDataTemp = {};

  if kind == 0 then
    index = data:ReadInt32();
    if actKind == 1 then
      preCount = this.GetLuckyBagCount(1);
      if serverLuckybagData[index] == nil then
        serverLuckybagData[index] = {};
      end
      serverLuckybagData[index].index = index;
      serverLuckybagData[index].prizeKind = data:ReadByte();
      serverLuckybagData[index].itemId = data:ReadInt32();
      serverLuckybagData[index].UID = data:ReadInt64();
      serverLuckybagData[index].name = data:ReadString(data:ReadByte());
      serverLuckybagData[index].time = System.DateTime.FromOADate(data:ReadDouble());
      serverLuckybagData[index].count= data:ReadByte();
      count = serverLuckybagData[index].count;
      serverLuckybagData[index].kind = data:ReadByte();
      serverLuckybagData[index].isFirst = data:ReadByte();

      ownerId = serverLuckybagData[index].UID;
      ownerName = serverLuckybagData[index].name;
      prizeKind = serverLuckybagData[index].prizeKind;
      itemID = serverLuckybagData[index].itemId;
      isFirst = serverLuckybagData[index].isFirst;

    elseif actKind == 2 then
      --伺服器福袋單筆資料
      preCount = this.GetLuckyBagCount(2);
      if serverAllLuckBagData[index] == nil then
        serverAllLuckBagData[index] = {};
      end

      serverAllLuckBagData[index].index = index;
      serverAllLuckBagData[index].prizeKind = data:ReadByte();
      serverAllLuckBagData[index].itemId = data:ReadInt32();
      serverAllLuckBagData[index].UID = data:ReadInt64();
      serverAllLuckBagData[index].name = data:ReadString(data:ReadByte());
      serverAllLuckBagData[index].time = System.DateTime.FromOADate(data:ReadDouble());
      serverAllLuckBagData[index].count = data:ReadInt32();
      count = serverAllLuckBagData[index].count;
      serverAllLuckBagData[index].kind = data:ReadByte();
      serverAllLuckBagData[index].target = data:ReadByte();
      serverAllLuckBagData[index].orgID = data:ReadInt32();
      serverAllLuckBagData[index].isFirst = data: ReadByte();
      if serverAllLuckBagData[index].isFirst == 1 then
        serverAllLuckBagData[index].showItemID = data: ReadInt32();
      end

      ownerId = serverAllLuckBagData[index].UID;
      ownerName = serverAllLuckBagData[index].name;
      prizeKind = serverAllLuckBagData[index].prizeKind;
      itemID = serverAllLuckBagData[index].itemId;
      isFirst = serverAllLuckBagData[index].isFirst;
      showItemID = serverAllLuckBagData[index].showItemID;
    end;

    local str = {};
    if (kind ~= 1) and (isFirst == 1) then
      if prizeKind == 0 then
        if actKind == 1 then
          str = string.Concat("<url=LuckyBag_", actKind, "_", index, ">", string.Get(23195), "</url>",  itemDatas[itemID]:GetName(true, true, true));
        else
          local itemaName = itemDatas[showItemID]:GetName(true, true, true);
          local str2 = string.format(string.Get(23250), itemaName);
          str = str2..string.Concat("<url=LuckyBag_", actKind, "_", index, ">", string.Get(23195), "</url>",  itemDatas[itemID]:GetName(true, true, true));
        end
      elseif (prizeKind == 2) or (prizeKind == 3) then
        local bagData = luckyBagDatas[itemID];
        str = string.Concat("<url=LuckyBag_", actKind, "_", index, ">", string.Get(23195), "</url>",  bagData:GetName());
      end

      if actKind == 1 then
        Chat.AddMessage(EChannel.Organization, str, ownerId, ownerName);
      else
        Chat.AddMessage(EChannel.World, str, ownerId, ownerName);
      end
    end

    --依據介面是否開啟決定是否刷新列表
    if UI.IsVisible(UIArmyLuckybag) then
      --更新介面資料
      ArmyLuckyBag.ResetShowData(true, actKind);
    end

    --現在福袋數量
    if actKind == 1 then
      curCount = this.GetLuckyBagCount(1);
    elseif actKind == 2 then
      curCount = this.GetLuckyBagCount(2);
    end
    
    --有紅包才顯示按鈕
    if ( preCount <= 0 and curCount > 0 ) or curCount <= 0 then
      UIMainFunction.OnVisible();
    end

    --顯示紅點
    if not UI.IsVisible(UIArmyLuckybag) and curCount > preCount then
      if actKind == 1 then
        RedDot.Add(ERedDot.ArmyLuckyBag);
      elseif actKind == 2 then
        RedDot.Add(ERedDot.ServerLuckyBag);
      end
    end
  elseif kind == 1 then--發紅包
    result = data:ReadByte();
    if result == 1 then
    elseif result == 2 then
      ShowCenterMessage(string.Get(22889));
    elseif result == 3 then
      ShowCenterMessage(string.Get(22893));
    elseif result == 4 then
      ShowCenterMessage(string.Get(22888));
    elseif result == 5 then
      ShowCenterMessage(string.Get(22887));
    elseif result == 6 then
      local roleId = data:ReadInt64();
      Chat.AddMessage(EChannel.Organization, string.format(string.Get(22886), Organization.members[roleId].name));
    end
  elseif kind == 2 then--搶紅包
    result = data:ReadByte();
    if actKind == 1 then
      if result == 1 then
        isClick = true;
        CGTimer.AddListener(this.RemoveClick, 5, false);
        ShowCenterMessage(string.Get(98017));
      elseif result == 2 then
        ShowCenterMessage(string.Get(22892));
      elseif result == 3 then
        ShowCenterMessage(string.Get(22841));
      elseif result == 4 then
        ShowCenterMessage(string.Get(23198));
        this.QueryLuckyBagData();
        this.QueryLuckyServerBagData();
      elseif result == 5 then
        ShowCenterMessage(string.Get(22890));
      elseif result == 6 then
        ShowCenterMessage(string.Get(22900));
      end
    elseif actKind == 2 then
      if result == 1 then
        isClick = true;
        CGTimer.AddListener(this.RemoveClick, 5, false);
        ShowCenterMessage(string.Get(23201));
      elseif result == 2 then
        ShowCenterMessage(string.Get(22841));
      elseif result == 3 then
        ShowCenterMessage(string.Get(23197));
      elseif result == 4 then
        ShowCenterMessage(string.Get(22891));
        this.QueryLuckyBagData();
        this.QueryLuckyServerBagData();
      elseif result == 5 then
        ShowCenterMessage(string.Get(22900));
      end
    end
  elseif kind == 3 then
    --伺服器福袋登入傳全部資料
    local dataCount = data:ReadInt32();
    preCount = this.GetLuckyBagCount(2);
    for i = 0, dataCount - 1, 1 do
      index = data:ReadInt32();
      if serverAllLuckBagData[index] == nil then
        serverAllLuckBagData[index] = {};
      end

      serverAllLuckBagData[index].index = index;
      serverAllLuckBagData[index].prizeKind = data:ReadByte();
      serverAllLuckBagData[index].itemId = data:ReadInt32();
      serverAllLuckBagData[index].UID = data:ReadInt64();
      serverAllLuckBagData[index].name = data:ReadString(data:ReadByte());
      serverAllLuckBagData[index].time = System.DateTime.FromOADate(data:ReadDouble());
      serverAllLuckBagData[index].count = data:ReadInt32();
      count = luckyBagDataTemp.count;
      serverAllLuckBagData[index].kind = data:ReadByte();
      serverAllLuckBagData[index].target = data:ReadByte();
      serverAllLuckBagData[index].orgID = data:ReadInt32();
      serverAllLuckBagData[index].isFirst = data: ReadByte();

      --serverAllLuckBagData[index] = luckyBagDataTemp;
    end

    --現在福袋數量
    curCount = this.GetLuckyBagCount(2);
    
    --有紅包才顯示按鈕
    if ( preCount <= 0 and curCount > 0 ) or curCount <= 0 then
      UIMainFunction.OnVisible();
    end

    --顯示紅點
    local showTemp = {};
    if not UI.IsVisible(UIArmyLuckybag)  then
      --ArmyLuckyBag.ResetShowData(false, 2);
      for k, v in pairs(serverAllLuckBagData) do
        showTemp = v;
        if Role.playerId ~= showTemp.UID then
          if (showTemp.kind ~= 1) and (showTemp.count > 0) then
            RedDot.Add(ERedDot.ServerLuckyBag);
            i = showData.Count;
          end
        end
      end
    end
  end
end

function ArmyLuckyBag.GetLuckyBagCount(index)
  if UIState ~= 0 then
    return table.Count(showData);
  end
  return ArmyLuckyBag.GetLuckyBagServerCount(index);
end

function ArmyLuckyBag.GetLuckyBagServerCount(index)
  if index == 1 then
    return table.Count(serverLuckybagData)
  elseif index == 2 then
    return table.Count(serverAllLuckBagData)
  end
end

function ArmyLuckyBag.GetLuckyBagDataByShowDataIdx(index)
  local show = showData[index];

  if show.LuckBagKind == 1 then
    for k, v in pairs(serverLuckybagData) do
      if showData[index].index == k then
        return serverLuckybagData[k];
      end
    end
  elseif show.LuckBagKind == 2 then
    for k, v in pairs(serverAllLuckBagData) do
      if showData[index].index == k then
        return serverAllLuckBagData[k];
      end
    end
  end
  return nil;

end

function ArmyLuckyBag.GetLuckyBagDataByIdx(kind, index)
  if kind == 1 then
    for k, v in pairs(serverLuckybagData) do
      if serverLuckybagData[index].index == index then
        return serverLuckybagData[index];
      end
    end
  elseif kind == 2 then
    for k, v in pairs(serverAllLuckBagData) do
      if serverAllLuckBagData[index].index == index then
        return serverAllLuckBagData[index];
      end
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
  return nil;
end

function ArmyLuckyBag.GetLuckyBagData(kind, index)
  if kind == 1 then
    return serverLuckybagData[index];
  elseif kind == 2 then
    return serverAllLuckBagData[index];
  end
  return nil;
end

function ArmyLuckyBag.ShowPlayerInfo(index)
  local sendData = this.GetLuckyBagDataByShowDataIdx(index);
  if sendData == nil then
    return;
  end
  sendBuffer:Clear();
  sendBuffer:WriteInt64(sendData.UID);
  Network.Send(14, 9, sendBuffer);
end

function ArmyLuckyBag.CheckTimeIsEnd()
  for k, v in pairs(showData) do
    if math.ceil( (v.time - CGTimer.serverTime).TotalSeconds ) <= 0 then
      return true
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
  return false;
end

function ArmyLuckyBag.ResetShowData(reset, uiState) --重設介面顯示資料
  local CountZeroShowData={};

  table.Clear(showData);
  table.Clear(CountZeroShowData);

  if uiState == 1 then
    for k, v in pairs(serverLuckybagData) do
      if (v.time - CGTimer.serverTime).TotalSeconds > 0 then
        v.LuckBagKind = 1;
        if (v.count <= 0) or (v.kind == 1)  then
        else
          table.insert(showData, v);
        end
      end
    end
  end

  if uiState == 2 then
    for k, v in pairs(serverAllLuckBagData) do
      if  (v.time - CGTimer.serverTime).TotalSeconds > 0 then
        v.LuckBagKind = 2;
        --數量小於0 已領取 自己發送的 排最後面
        if (v.count <= 0) or (v.kind == 1) or (Role.playerId == v.UID) then
          table.insert(CountZeroShowData, v);
        else
          table.insert(showData, v);
        end
      end
    end
  end

  table.sort(showData, function(a, b) return System.DateTime.Compare(a.time , b.time) > 0; end);

  --將要放最後面的資料回存
  for k, v in pairs(CountZeroShowData) do
    table.insert(showData, v);
  end

  if reset then
    UIArmyLuckybag.ResetBagList();
  end
end

function ArmyLuckyBag.IsActive()
  if activityTimes[82] ~= nil then
    return true
  end

  if activityTimes[95] ~= nil then
    return true;
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
  return false;
end

function ArmyLuckyBag.GetAward(itemId)
  local allBlissBagItem = BlissBagData.GetAllBlissBagItem(itemId);

  return allBlissBagItem[1].count, allBlissBagItem[#allBlissBagItem].count;
end

function ArmyLuckyBag.RemoveArmy()
  this.Clear();
  UIMainFunction.OnVisible();
end

function ArmyLuckyBag.AddArmy()
  this.QueryLuckyBagData();
end

function ArmyLuckyBag.RemoveClick()
  CGTimer.RemoveListener(this.RemoveClick);

  isClick = false;
end

function ArmyLuckyBag.IsOpen(openKind)

  if openKind == 1 then
    if activityTimes[82] ~= nil then  --軍團紅包
      return table.Count(serverLuckybagData) > 0;
    end
  elseif openKind == 2 then
    if activityTimes[95] ~= nil then  --分紅紅包
      return table.Count(serverAllLuckBagData) > 0;
    end
  end
end

function ArmyLuckyBag.UpdateOpen()
  UIArmyLuckybag.OnClick_Close();
  UIMainFunction.OnVisible();
end