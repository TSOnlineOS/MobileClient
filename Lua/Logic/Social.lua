local json = require 'cjson'

EMailState = {
  Unread = 0,
  Read = 1,
  Take = 2,
}

Social = {}
local this = Social

function Social.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Social.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Social.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Social.Initialize()
  this.LoadBlack();

  CGTimer.AddListener(this.CheckMailRedDot, 60, false);
end

function Social.Clear()
  table.Clear(this.friends);
  table.Clear(this.mails);
  this.maxRecordFriendCount = 0;

  CGTimer.RemoveListener(this.CheckMailRedDot);
end

function Social.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

--Friend
this.maxFriend = 50;
this.maxFriendly = 9999;
this.maxGiftReceive = 10;
this.maxGiftSend = 20;

this.maxRecordFriendCount = 0;

this.friends = {};
local visitedFriends = {};

function Social.Invite(roleId, name)
  --GM
  if roleId ~= nil and Role.IsGM(roleId) then
    ShowCenterMessage(string.Get(40002));
    return;
  end

  --已在好友名單
  if roleId ~= nil and this.IsFriend(roleId) then
    ShowCenterMessage(string.Get(20508));
    return;
  end
  
  if LuaHelper.CheckDefine("DemoCode") then
    local folk = 69;
    local dog = 27;
    local stupid = 0;
    if this ~= nil then
      stupid = folk + dog;
    else
      stupid = stupid + 1;
    end
  
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
  
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
  
  --已在邀請名單
  if Invitation.Get(EInvitation.Friend, roleId) ~= nil then
    Invitation.Reply(EInvitation.Friend, roleId, true);
    return;
  end

  if name ~= nil then
    --C:014-005 <發送好友名單邀請> +L(1) +名字(L) +訊息(1)
    sendBuffer:Clear()
    sendBuffer:WriteStringWithByteL(name);
    Network.Send(14, 5, sendBuffer);
  elseif roleId ~= nil and Role.players[roleId] ~= nil then
    --C:014-005 <發送好友名單邀請> +L(1) +名字(L) +訊息(1)
    sendBuffer:Clear()
    sendBuffer:WriteStringWithByteL(Role.players[roleId].name);
    Network.Send(14, 5, sendBuffer);
  end
end

function Social.AddFriend(roleId, playerInfo, update)
  logWarn(string.format("Add Friend ID = %d Name = %s", roleId, playerInfo.name));
  
  if LuaHelper.CheckDefine("DemoCode") then
    local folk = 69;
    local dog = 27;
    local stupid = 0;
    if this ~= nil then
      stupid = folk + dog;
    else
      stupid = stupid + 1;
    end
    
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
    
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
  
  this.friends[roleId] = playerInfo;

  if update == false then return end

  if RoleCount.Get(ERoleCount.FriendGiftReceive) < Social.maxGiftReceive then
    for k, v in pairs(this.friends) do
      if CheckFlag(v.friendFlag, 2) and not CheckFlag(v.friendFlag, 3) then
        RedDot.Add(ERedDot.FriendGift);
        break;
      end
    end
  end

  if UI.IsVisible(UISocial) then
    UISocial.UpdateUI();
  end
end

function Social.RemoveFriend(roleId)
  logWarn(string.format("Remove Friend ID = %d", roleId));
  
  if this.friends[roleId] == nil then return end

  ShowCenterMessage(string.Concat(string.Get(50066), this.friends[roleId].name, string.Get(50070)));
  
  this.friends[roleId] = nil;
  
  if LuaHelper.CheckDefine("DemoCode") then
    local folk = 69;
    local dog = 27;
    local stupid = 0;
    if this ~= nil then
      stupid = folk + dog;
    else
      stupid = stupid + 1;
    end
    
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
    
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
  
  if UI.IsVisible(UISocial) then
    UISocial.UpdateUI();
  end
end

function Social.IsFriend(roleId)
  return this.friends[roleId] ~= nil;
end

function Social.SetFriendly(roleId, value)
  if this.friends[roleId] == nil then return end

  this.friends[roleId].friendly = value;

  if UI.IsVisible(UISocial) then
    UISocial.UpdateUI();
  end

  if UI.IsVisible(UIHouseBoard) then
    UIHouseBoard.UpdateFriend();
  end
end

function Social.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Social.Trash4()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Social.SetFunctionFlag(roleId, value)
  if this.friends[roleId] == nil then return end

  if not CheckFlag(this.friends[roleId].friendFlag, 1) and CheckFlag(value, 1) then
    --送禮
    this.PlayDeliver(22063, 1);
  elseif not CheckFlag(this.friends[roleId].friendFlag, 2) and CheckFlag(value, 2) then
    --被送禮
    if RoleCount.Get(ERoleCount.FriendGiftReceive) < this.maxGiftReceive then
      this.PlayDeliver(22063, 2);
    
      RedDot.Add(ERedDot.FriendGift);
    end
  end

  this.friends[roleId].friendFlag = value;

  if UI.IsVisible(UISocial) then
    UISocial.UpdateUI();
  end

  if UI.IsVisible(UIHouseBoard) then
    UIHouseBoard.UpdateFriend();
  end
end

function Social.UpdateFriendName(roleId, name)
  if this.friends[roleId] == nil then return end

  this.friends[roleId].name = name;
  
  if UI.IsVisible(UISocial) then
    UISocial.UpdateUI();
  end

  if UI.IsVisible(UIHouseBoard) then
    UIHouseBoard.UpdateFriend();
  end
end

function Social.Trash5()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Social.Trash6()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Social.RefreshRoleCount(data)
  if RoleCount.Get(ERoleCount.FriendGiftReceive) >= this.maxGiftReceive then
    RedDot.Remove(ERedDot.FriendGift);
  end

  if UI.IsVisible(UISocial) then
    UISocial.UpdateUI();
  end
end

function Social.SendAllGift()
  local friendsCanSend = {};
  
  --可以送禮的加入table
  for roleId in pairs(Social.friends) do
    if not CheckFlag(Social.friends[roleId].friendFlag, 1)then
      table.insert(friendsCanSend, Social.friends[roleId]);
    end
  end
  
  --在線上的優先
  table.sort(friendsCanSend,
    function(a, b)
      if a.online and not b.online then
        return true;
      else
        return false;
      end
    end
  );
  
  local giftsNeedSend = Social.maxGiftSend - RoleCount.Get(ERoleCount.FriendGiftSend);
  if giftsNeedSend <= 0 then return end
  
  --決定最終送禮人數
  local finalSendIDs = {};
  for i = 1 , giftsNeedSend do
    if friendsCanSend[i] ~= nil then
      table.insert(finalSendIDs, friendsCanSend[i].roleId);
    end
  end
  
  local sendCount = table.Count(finalSendIDs) --需要送禮玩家數量
  if sendCount <= 0 then return end

  --C:014-018 <好友一鍵送禮> 數量(1)+<<玩家ID(8)>>
  sendBuffer:Clear();
  sendBuffer:WriteByte(sendCount);
  --依序加入buffer
  for i = 1, sendCount do
    sendBuffer:WriteInt64(finalSendIDs[i]);
  end
  Network.Send(14, 18, sendBuffer);
end

function Social.ReceiveAllGift()
  local receiveGifts = {};
  
  --可以收禮的加入table
  for roleId in pairs(Social.friends) do
    if CheckFlag(Social.friends[roleId].friendFlag, 2) and not  CheckFlag(Social.friends[roleId].friendFlag, 3) then
      table.insert(receiveGifts, Social.friends[roleId]);
    end
  end
  
  local giftsNeedReceive = Social.maxGiftReceive - RoleCount.Get(ERoleCount.FriendGiftReceive);
  if giftsNeedReceive <= 0 then return end
  if table.Count(receiveGifts) <= 0 then return end
  
  --C:014-019 <好友一鍵收禮> 數量(1)+<<玩家ID(8)>>
  sendBuffer:Clear();
  sendBuffer:WriteByte(table.Count(receiveGifts));
  
  --依序收禮
  for i = 1, giftsNeedReceive do
    if receiveGifts[i] ~= nil then
      sendBuffer:WriteInt64(receiveGifts[i].roleId);
    end
  end
  
  Network.Send(14, 19, sendBuffer);
end

function Social.CheckCanSendGift()
  if RoleCount.Get(ERoleCount.FriendGiftSend) >= Social.maxGiftSend then return false end
  
  for roleId in pairs(Social.friends) do
    if not CheckFlag(Social.friends[roleId].friendFlag, 1)then
     return true;
    end
  end
  return false;
end

function Social.CheckCanReceiveGift()
  if RoleCount.Get(ERoleCount.FriendGiftReceive) >= Social.maxGiftReceive then return false end
  
  for roleId in pairs(Social.friends) do
    if CheckFlag(Social.friends[roleId].friendFlag, 2) and not  CheckFlag(Social.friends[roleId].friendFlag, 3) then
      return true;
    end
  end
  return false;
end

function Social.Trash7()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Social.Trash8()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Social.Trash9()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Social.ClearVisitedFriendsTable()
  visitedFriends = {};
end

function Social.AddVisitedFriends(roleId)
  if roleId == Role.playerId then return end
  visitedFriends[roleId] = 0;
end

function Social.CheckVisitedFriendRedDot(playerInfo)
  if not Social.CheckTurnStatus(playerInfo.level, playerInfo.turn) then
    return false;
  end

  if visitedFriends[playerInfo.roleId] ~= nil then
    return false;
  end

  return true;
end

function Social.Trash10()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Social.Trash11()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Social.Tras12()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

--BlackList
this.blacks = nil;

function Social.LoadBlack()
  local jsonText = CGResourceManager.ReadText(string.Concat("BlackList", string.GetRoleKey(), ".txt"));
  
  if not string.IsNullOrEmpty(jsonText) then
    this.blacks = json.decode(jsonText);
  end

  if this.blacks == nil then
    this.blacks = {};
  end
end

function Social.AddBlack(roleId, name)
  if this.blacks == nil then
    this.blacks = {};
  end

  if this.blacks[roleId] == nil then
    this.blacks[roleId] = {};
  end
  
  if LuaHelper.CheckDefine("DemoCode") then
    local folk = 69;
    local dog = 27;
    local stupid = 0;
    if this ~= nil then
      stupid = folk + dog;
    else
      stupid = stupid + 1;
    end
  
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      human = satan + haven;
    else
      human = satan - haven;
    end
  end
  
  ShowCenterMessage(string.format(string.Get(20777), name));

  this.blacks[roleId].roleId = roleId;
  this.blacks[roleId].name = name;

  this.SaveBlack();
  
  if UI.IsVisible(UISocial) then
    UISocial.UpdateUI();
  end
end

function Social.UpdateBlackName(roleId, name)
  if this.blacks == nil then return end
  if this.blacks[roleId] == nil then return end

  this.blacks[roleId].name = name;

  this.SaveBlack();
  
  if UI.IsVisible(UISocial) then
    UISocial.UpdateUI();
  end
end

function Social.RemoveBlack(roleId)
  if this.blacks[roleId] == nil then return end
  
  if LuaHelper.CheckDefine("DemoCode") then
    local folk = 69;
    local dog = 27;
    local stupid = 0;
    if this ~= nil then
      stupid = folk + dog;
    else
      stupid = stupid + 1;
    end
    
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      human = satan + haven;
    else
      human = satan - haven;
    end
  end
  
  ShowCenterMessage(string.format(string.Get(20778), this.blacks[roleId].name));

  this.blacks[roleId] = nil;

  this.SaveBlack();

  if UI.IsVisible(UISocial) then
    UISocial.UpdateUI();
  end
end

function Social.SaveBlack()
  if this.blacks == nil then return end

  local jsonText = json.encode(this.blacks);
  
  CGResourceManager.WriteText(string.Concat("BlackList", string.GetRoleKey(), ".txt"), jsonText);
end

function Social.IsBlack(roleId)
  if this.blacks == nil then return false end
  
  if LuaHelper.CheckDefine("DemoCode") then
    local folk = 69;
    local dog = 27;
    local stupid = 0;
    if this ~= nil then
      stupid = folk + dog;
    else
      stupid = stupid + 1;
    end
    
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      human = satan + haven;
    else
      human = satan - haven;
    end
  end
  
  return this.blacks[roleId] ~= nil;
end

--Mail
this.mails = {};

function Social.AddMail(mailId, data, updateOther)
  if this.mails[mailId] == nil then
    this.mails[mailId] = {};
  end

  --S:083-001 <新增信件> +數量(4) <<+信件ID(4) +時間(8) +狀態(1) +L(2) +內容(L) +附件數量(1) <<+附件種類(1)>> >>
  --狀態 0:未讀 1:已讀 2:已領
  --附件種類 1:物品 +物品資料(?)
  --附件種類 2:武將 +武將資料(?)
  this.mails[mailId].time = System.DateTime.FromOADate(data:ReadDouble());
  this.mails[mailId].state = data:ReadByte();
  this.mails[mailId].message = string.gsub(data:ReadString(data:ReadUInt16()), "<%%(.-)%%>", string.Parse);
  this.mails[mailId].contents = {};

  local count = data:ReadByte();
  for i = 1, count do
    this.mails[mailId].contents[i] = {};
    this.mails[mailId].contents[i].kind = data:ReadByte();

    if this.mails[mailId].contents[i].kind == 1 then
      this.mails[mailId].contents[i].data = ThingData.New(data);
    elseif this.mails[mailId].contents[i].kind == 2 then
      this.mails[mailId].contents[i].data = NpcInfo.New(data);
    end
  end
  
  --[[
  logError(mailId);
  logError(this.mails[mailId].kind);
  logError(this.mails[mailId].time);
  logError(this.mails[mailId].state);
  logError(this.mails[mailId].message);
  logError(count);
  for i = 1, count do
    logError(this.mails[mailId].contents[i].Id);
    logError(this.mails[mailId].contents[i].quant);
  end
  --]]

  if this.mails[mailId].state < EMailState.Read or (count > 0 and this.mails[mailId].state < EMailState.Take) then
    RedDot.Add(ERedDot.Mail);
  end

  if updateOther == false then return end
  
  if UI.IsVisible(UIMail) then
    UIMail.UpdateUI();
  end
end

function Social.ReadMail(mailId, updateOther)
  if this.mails[mailId] == nil then return end

  this.mails[mailId].state = math.max(this.mails[mailId].state, EMailState.Read);

  if updateOther == false then return end

  if UI.IsVisible(UIMail) then
    UIMail.UpdateUI();
  end
end

function Social.TakeMail(mailId, updateOther)
  if this.mails[mailId] == nil then return end

  this.mails[mailId].state = math.max(this.mails[mailId].state, EMailState.Take);

  if updateOther == false then return end

  this.CheckMailRedDot();

  if UI.IsVisible(UIMail) then
    UIMail.UpdateUI();
  end
end

function Social.Meanless()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function Social.Meanless1()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function Social.Meanless2()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function Social.RemoveMail(mailId, updateOther)
  if this.mails[mailId] == nil then return end

  this.mails[mailId] = nil;

  if updateOther == false then return end

  this.CheckMailRedDot();

  if UI.IsVisible(UIMail) then
    UIMail.UpdateUI();
  end
end

function Social.CheckMailRedDot()
  local allTaked = true;
  for k, v in pairs(this.mails) do
    if DateTime.Compare(v.time, CGTimer.serverTime) > 0 then
      if table.Count(v.contents) > 0 then
        if v.state < EMailState.Take then
          allTaked = false;
          break;
        end
      elseif v.state < EMailState.Read then
        allTaked = false;
        break;
      end
    end
  end
  
  if allTaked then
    RedDot.Remove(ERedDot.Mail);
  end
end

--[[
local function GetMailFileName(roleId)
  return string.format("Mail_%d_%d_%d.txt", Role.playerId, Network.serverId, roleId);
end

function Social.GetMail(roleId)
  local jsonText = CGResourceManager.ReadText(GetMailFileName(roleId));

  if not string.IsNullOrEmpty(jsonText) then
    return json.decode(jsonText);
  else
    return nil;
  end
end

function Social.SaveMail(roleId, mails)
  CGResourceManager.WriteText(GetMailFileName(roleId), json.encode(mails));
end
]]--

--Deliver
this.deliverNpcId = 0;
this.deliverIndex = 0;
this.deliverTime = 0;
this.deliverMaxTime = 0;
this.deliverItems = { 0, 0, 0, 0, 0 };

function Social.Meanless4()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function Social.PlayDeliver(npcId, mode)
  if Role.deliverNpc == nil then
    Role.deliverNpc = Role.CreateRole(EHuman.Duplicate, 0);
  end

  Role.deliverNpc.npcId = npcId;
  Role.deliverNpc:SetPosition(Role.player.position);
  Role.deliverNpc:Initialize();
  Role.deliverNpc.speed = 400;

  if mode == 1 then
    --出去
    local followNpc = Role.GetFollowNpc(Role.playerId, npcId);
    if followNpc ~= nil then
      followNpc:SetVisible(ERoleVisible.Hide);

      Role.deliverNpc:SetPosition(followNpc.position);
    else
      Role.deliverNpc:SetPosition(Role.player.position);
    end

    Role.deliverNpc:SetVisible(ERoleVisible.Visible);

    Role.deliverNpc:Move(Role.player.position + Vector2.right * 600,
      function()
        Role.deliverNpc:SetVisible(ERoleVisible.Hide);
      end,
      true
    );
  elseif mode == 2 or mode == 4 then
    --進來又出去
    Role.deliverNpc:SetPosition(Role.player.position + Vector2.right * 600);
    Role.deliverNpc:SetVisible(ERoleVisible.Visible);

    Role.deliverNpc:Move(Role.player.position,
      function()
        Role.deliverNpc:Move(Role.player.position + Vector2.right * 600,
          function()
            Role.deliverNpc:SetVisible(ERoleVisible.Hide);
          end,
          true
        );
      end,
      true
    );
  elseif mode == 3 then
    --進來
    Role.deliverNpc:SetPosition(Role.player.position + Vector2.right * 600);
    Role.deliverNpc:SetVisible(ERoleVisible.Visible);

    local followNpc = Role.GetFollowNpc(Role.playerId, npcId);
    if followNpc ~= nil then
      Role.deliverNpc:Move(followNpc.position,
        function()
          Role.deliverNpc:SetVisible(ERoleVisible.Hide);
          followNpc:SetVisible(ERoleVisible.Visible);
        end,
        true
      );
    else
      Role.deliverNpc:Move(Role.player.position,
        function()
          Role.deliverNpc:SetVisible(ERoleVisible.Hide);
        end,
        true
      );
    end
  end
end

function Social.StartDeliver(npcId)
  this.deliverNpcId = npcId;

  this.PlayDeliver(this.deliverNpcId, 1);

  if UI.IsVisible(UIDeliver) then
    UIDeliver.UpdateUI();
  end
end

function Social.StopDeliver()
  this.PlayDeliver(this.deliverNpcId, 3);

  this.deliverNpcId = 0;
  this.deliverIndex = 0;
  this.deliverTime = 0;
  this.deliverMaxTime = 0;

  for i = 1, 5 do
    this.deliverItems[i] = 0;
  end

  if UI.IsVisible(UIDeliver) then
    UIDeliver.UpdateUI();
  end
end

function Social.SetDeliverIndex(index)
  if index > 1 then
    this.PlayDeliver(this.deliverNpcId, 2);
  end

  this.deliverIndex = index;
  this.deliverTime = CGTimer.time;

  local baDoYaoIndex = NpcData.GetBaDoYaoIndex(this.deliverNpcId);
  if baDoYaoIndex <= 7 then
    this.deliverMaxTime = 30;
  else
    this.deliverMaxTime = 24;
  end

  if UI.IsVisible(UIDeliver) then
    UIDeliver.UpdateUI();
  end
end

function Social.Meanless5()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function Social.Meanless6()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function Social.Meanless7()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function Social.CheckDeliverScene(sceneId)
  if sceneId == 12180 then return false end
  
  --鬼城場景
  if math.floor(sceneId / 1000) == 60 then
    if Contains(sceneId, 60001, 60011, 60301, 60401, 60411, 60421) or
       Between(sceneId, 60501, 60512) or
       Between(sceneId, 60801, 60806) or
       Between(sceneId, 60807, 60810) then
      return true;
    else
      return false;
    end
  end

  return true;
end

--Received Gifts List
this.receiveData = {};
this.giftList = {};

function Social.Meanless8()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function Social.Meanless9()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function Social.CheckTurnStatus(level, turn)
  if Role.player:GetAttribute(EAttribute.Turn) > 0 then
    return level >= 60 or turn > 0;
  else
    return Role.player:GetAttribute(EAttribute.Lv) >= 60 and (level >= 60 or turn > 0);
  end
end

function Social.Meanless10()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end