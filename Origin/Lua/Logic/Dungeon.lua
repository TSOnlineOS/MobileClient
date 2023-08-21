DungeonInvitation = {};
function DungeonInvitation.New(data)
--房間序號(4) +副本ID(2) +房長ID(8) +長度(1) +房長名(?) +等級(1) +轉生(1) +屬性(1) +職業(1)  
  local self = {};
  setmetatable(self, DungeonInvitation);
  self.roomId = data:ReadUInt32();
  self.dungeonId = data:ReadUInt16();
  self.roleId = data:ReadInt64();

  self.kind = EInvitation.Dungeon;
  self.name = data:ReadString(data:ReadByte());  
  self.level = data:ReadByte();
  self.turn = data:ReadByte();
  self.element = data:ReadByte();  
  self.turn3Element = data:ReadByte();
  self.career = data:ReadByte();

  if self.turn >= 3 then
    self.level = self.level + Role.playerMaxLv;
  end

  return self;
end

DungeonPlayerData = {};
function DungeonPlayerData.New(data, isReadStatus)
  local self = {};
  setmetatable(self, DungeonPlayerData);

  self.id = data:ReadInt64();
  self.name = data:ReadString(data:ReadByte());
  self.lv = data:ReadByte();
  self.sex = data:ReadByte();
  self.headStyle = data:ReadByte();
  self.colorTints = {};
  self.colorTints[1] = data:ReadUInt32();
  self.colorTints[2] = data:ReadUInt32();

  self.equip = {};
  for i = 1, Role.maxEquip + Role.maxStyle do 
    self.equip[i] = data:ReadUInt16();
  end
  
  self.turn = data:ReadByte();
  if self.turn >= 3 then
    self.lv = self.lv + Role.playerMaxLv;
  end

  self.titleId = data:ReadUInt16();

  self.prepare = false;
  if isReadStatus then 
    self.prepare = data:ReadByte() ~= 0;
  end
  
  return self;
end


DungeonRoom = {};
function DungeonRoom.New(data)
  --房間編號(4)+房間名稱長度(1)+房間名稱(?)+房長ID(8)+是否需要密碼(1)+副本編號(2)+當前人數(1)
  local self = {};
  setmetatable(self, DungeonRoom);
  self.id = data:ReadUInt32();  
  self.name = data:ReadString(data:ReadByte());
  self.ownerId = data:ReadInt64();  
  self.isLock = (data:ReadByte() ~= 0);
  self.dungeonId = data:ReadUInt16();
  self.peopleCount = data:ReadByte();
  return self;
end

Dungeon = {};
local this = Dungeon;

this.maxWeekDungeonNode = 20;

this.dungeonRoomDatas = {};
this.availableDungeonDatas = {};
this.useableDungeons = {}; --有使用次數
this.dungeonNowRoomPlayers = {};
this.nowDungeonKind = 0;
this.nowDungeonId = 0;
this.nowDungeonRoom = nil;
this.nowDungeonOwnerId = 0;
this.nowDungeonStartTime = 0;
this.nowDungeonEndTime = 0;
this.nowDungeonPassword = "";
this.lastSendRecriutTime = nil;
this.isInRoom = false;
this.isSending = false;
this.limitIndex = 0;
this.limitIndex = 0;
local inviteName = "";
local time;
local startLimitRoleCount;


function Dungeon.ClearRoomData()
  this.isSending = false;
  this.isInRoom = false;
  this.CheckRedDot();
  table.Clear(this.dungeonNowRoomPlayers);  
  table.Clear(this.dungeonRoomDatas);
  this.nowDungeonKind = 0;
  this.nowDungeonRoom = nil;
  this.nowDungeonOwnerId = 0;  
  this.nowDungeonId = 0;
  this.nowDungeonPassword = "";
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

function Dungeon.ClearTimeData()
  this.nowDungeonStartTime = 0;
  this.nowDungeonEndTime = 0;
  CGTimer.RemoveListener(Dungeon.UpdateTime);
end

function Dungeon.Clear()  
  table.Clear(this.availableDungeonDatas);
  this.isSending = false;
  Dungeon.ClearRoomData();
  Dungeon.ClearTimeData();
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

function Dungeon.Initialize()
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
  this.InitAvailableDungeonDatas();
end

function Dungeon.UpdateTime()
  local sec = math.floor((this.nowDungeonEndTime:Subtract(CGTimer.serverTime)).TotalSeconds);
  if sec > 0 then    
    UIMain.UpdateDungeonTime(math.floor(sec / 60), sec % 60);    
  else
    --todo Trigger 
    CGTimer.RemoveListener(Dungeon.UpdateTime);
  end
end

function Dungeon.GetComboData(id)
  if dungeonComboDatas[id] == nil then 
    return nil;
  end
  return dungeonComboDatas[id][1], dungeonComboDatas[id][#dungeonComboDatas[id]];
end

function Dungeon.InitAvailableDungeonDatas()
  this.availableDungeonDatas = {}; 
  this.useableDungeons = {};

  --整理等級可用的副本資料
  local lv = Role.player:GetAttribute(EAttribute.Lv);
  local allTable = {};
  for k, v in pairs(dungeonDatas) do
    if v.kind == 3 and allTable[v.kind] ~= nil then
    elseif v.kind == 5 and allTable[v.kind] ~= nil then
    else
      if v.kind == 2 then
        if v.minLv <= lv and v.maxLv >= lv then
          if allTable[v.kind] == nil then
            allTable[v.kind] = {};
          end
          table.insert(allTable[v.kind], v);
        end
      else
        if allTable[v.kind] == nil then
          allTable[v.kind] = {};
        end
        table.insert(allTable[v.kind], v);
      end

      local usedCount = 0;
      if MarkManager.missions[v.dayilyFlag] ~= nil then 
        usedCount = MarkManager.missions[v.dayilyFlag].step;
      end

      if v.dayilyCount - usedCount > 0 and v.minLv <= lv and v.maxLv >= lv then
        this.useableDungeons[v.id] = v;
      end
    end
  end
  
  for kind, value in pairs(allTable) do
    table.insert(this.availableDungeonDatas, value);
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
  this.CheckRedDot();
end

function Dungeon.GetMainPageCount()
  return table.Count(this.availableDungeonDatas);
end

function Dungeon.GetSubPageCount(index)
  if this.availableDungeonDatas[index] == nil then
    return 0;
  end

  return table.Count(this.availableDungeonDatas[index]);
end

function Dungeon.GetMainTagName(index)
  if this.availableDungeonDatas[index] ~= nil and this.availableDungeonDatas[index][1] ~= nil then   
    if this.availableDungeonDatas[index][1].kind == 1 then 
      return string.Get(10125);
    elseif this.availableDungeonDatas[index][1].kind == 2 then 
      return string.Get(20147);
    elseif this.availableDungeonDatas[index][1].kind == 3 then
      return string.Get(22385);--周副本
    elseif this.availableDungeonDatas[index][1].kind == 4 then
      return string.Get(23283);--節慶副本
    else
      return string.Get(24100);--狂周副本
    end
  else
    return "";
  end
end

function Dungeon.GetSubTagName(index, subIndex)
  if this.availableDungeonDatas[index] ~= nil then
    if this.availableDungeonDatas[index][1].kind == 3 then
      return string.Get(22386);--百戰天關
    elseif this.availableDungeonDatas[index][1].kind == 5 then
      return string.Get(24099);--靈魂挑戰
    else
      if this.availableDungeonDatas[index][subIndex] ~= nil then
    return string.Get(this.availableDungeonDatas[index][subIndex].name);
      else
      return "";
      end
      end
  else
    return "";
  end
end

function Dungeon.OnClickText(roomId, locked)
  local data = sceneDatas[SceneManager.sceneId];
  if data == nil or data.kind == 2 then     
    ShowCenterMessage(string.Get(10325));
    return;
  end

  if table.Count(this.dungeonNowRoomPlayers) == 0 then 
    if locked == "true" then 
      ShowStrInput(string.Get(20156), function(text) Dungeon.SendJoinRoom(roomId, text) end);
    else
      this.SendJoinRoom(roomId, "", 1);
    end
  else
    if not UI.IsVisible(UIDungeon) then 
      UI.Open(UIDungeon);
    end
  end
end

--C:013-004 <離開隊伍> +隊長玩家ID(8)
function Dungeon.LeaveSinglePlayDungeon()
  sendBuffer:Clear()
  sendBuffer:WriteInt64(Role.playerId);
  Network.Send(13, 4, sendBuffer);
end

function Dungeon.SendAskRoomData()
  table.Clear(this.dungeonRoomDatas);
  Network.Send(47, 1);
end

function Dungeon.SetNowDungeon(dungeonId, roomId, ownerId, ownerName)
  this.nowDungeonOwnerId = ownerId;
  this.nowDungeonId = dungeonId;
  
  this.nowDungeonRoom = {};
  this.nowDungeonRoom.id  = roomId;
  this.nowDungeonRoom.ownerId = ownerId;
  this.nowDungeonRoom.name = ownerName;
  this.nowDungeonRoom.dungeonId = dungeonId;
  this.nowDungeonRoom.isLock = false;
end

function Dungeon.CheckForQualification(dungeonid)
  local dungeonData = this.GetData(dungeonid);
  if dungeonData.kind ~= 3 or dungeonData.kind ~= 5 then
    -- 不是周副本都算符合
    return true;
  end
  
  if Role.fightNpc == nil then 
    --目前副本限制條件都只判斷出戰NPC
    return true;
  end

  for k, v in pairs(dungeonData.needPar) do
    if v.kind == 1 then     --國家      
      if Role.fightNpc:GetAttribute(EAttribute.Moral) ~= nil then
        if Role.fightNpc:GetAttribute(EAttribute.Moral) ~= v.parameter then
          return false
        end
      end 
    elseif v.kind == 2 then --屬性      
      if Role.fightNpc:GetAttribute(EAttribute.Element) ~= nil then
        if Role.fightNpc:GetAttribute(EAttribute.Element) ~= v.parameter then
          return false
        end
      end 
    elseif v.kind == 3 then --轉生
      if Role.fightNpc:GetAttribute(EAttribute.Turn) ~= nil then
        if Role.fightNpc:GetAttribute(EAttribute.Turn) ~= v.parameter then
          return false
        end
      end 
    elseif v.kind == 4 then --只定技
      if Role.fightNpc:GetSkillLv(v.parameter) <= 0 or (UISoul.GetEquipNpc(Role.fightNpc.npcId) ~= nil and not UISoul.HasSkill(Role.fightNpc.npcId, v.parameter)) then
        return false;
      end
    elseif v.kind == 5 then --禁用技能
      if Role.fightNpc:GetSkillLv(v.parameter) > 0 or (UISoul.GetEquipNpc(Role.fightNpc.npcId) ~= nil and UISoul.HasSkill(Role.fightNpc.npcId, v.parameter)) then
        return false;
      end
    elseif v.kind == 8 then --靈魂屬性
      if UISoul.GetEquipNpc(Role.fightNpc.npcId) == nil or UISoul.GetEquipNpc(Role.fightNpc.npcId).element ~= v.parameter then
        return false;
      end
    elseif v.kind == 9 then --靈魂等級大於
      if UISoul.GetEquipNpc(Role.fightNpc.npcId) == nil or UISoul.GetEquipNpc(Role.fightNpc.npcId).lv < v.parameter then
        return false;
      end
    elseif v.kind == 10 then --靈魂等級小於
      if UISoul.GetEquipNpc(Role.fightNpc.npcId) == nil or UISoul.GetEquipNpc(Role.fightNpc.npcId).lv > v.parameter then
        return false;
      end
    end
  end
  return true;
end

function Dungeon.SendCreateDungeon(id, usePassword, nowKind)
  if this.isSending == true then 
    return 
  end 
  local dungeonData = this.GetData(id);
  if dungeonData.kind == 3 or dungeonData.kind == 5 and dungeonData.maxPlayer == 1 then
  --周副本單人關卡 C端先自行判斷有無資格
    if not this.CheckForQualification(id) then
      --顯示中央訊息 "不符合限制條件，無法進入關卡！
        ShowCenterMessage(string.Get(22414));
      return
    end
  end
  this.isSending = true;

  sendBuffer:Clear()
  sendBuffer:WriteUInt16(id);
  if usePassword == nil then --0.否 1.是 
    sendBuffer:WriteByte(0);
  else
    if usePassword == false then 
      sendBuffer:WriteByte(0);
    else
      sendBuffer:WriteByte(1);
    end
  end
  Network.Send(47, 2, sendBuffer);

  this.nowDungeonKind = nowKind;
  this.nowDungeonId = id;
  if this.nowDungeonKind == 1 then 
    this.nowDungeonOwnerId  = Role.playerId;
    this.nowDungeonRoom = {};
    this.nowDungeonRoom.dungeonId = id;
    this.nowDungeonRoom.name = Role.player.name;
  end
end

function Dungeon.SendJoinRoom(roomId, password)
  if this.isSending == true then 
    return 
  end
  this.isSending = true;

  sendBuffer:Clear()
  sendBuffer:WriteUInt32(roomId);
  if password == nil then 
    password = "";
  end  

  local convertedString = LuaHelper.StringToBytes(DataManager.encoding_Big5, password);
  
  sendBuffer:WriteByte(string.len(convertedString));
  sendBuffer:WriteString(password);

  Network.Send(47, 3, sendBuffer);
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
  if this.dungeonRoomDatas[roomId] ~= nil then 
    local data = this.dungeonRoomDatas[roomId];
    this.nowDungeonRoom = data;
    this.nowDungeonId = data.dungeonId;
    this.nowDungeonOwnerId = data.ownerId;
  end  
end

function Dungeon.SendResetCount(dungeonId)
  UISell.Launch(13, nil, dungeonId);
end

function Dungeon.SendSkip(dungeonId)
  sendBuffer:Clear()
  sendBuffer:WriteUInt16(dungeonId);
  Network.Send(47, 5, sendBuffer);
end

function Dungeon.SendSetPassword()  
  Network.Send(47, 6);
end

function Dungeon.SendSetRoomName(roomName)  
  if not string.CheckName(roomName) then return end

  sendBuffer:Clear()
  local convertedString = LuaHelper.StringToBytes(DataManager.encoding_Big5, roomName);  
  sendBuffer:WriteByte(string.len(convertedString));
  sendBuffer:WriteString(roomName);
  Network.Send(47, 7, sendBuffer);
end

function Dungeon.SendInvite(roleId)  
  sendBuffer:Clear()
  sendBuffer:WriteInt64(roleId);
  if Social.friends[roleId] ~= nil then
    inviteName = Social.friends[roleId].name;
  else
    inviteName = "";
  end
  Network.Send(47, 8, sendBuffer);
end

function Dungeon.SendRecurit(channel)   --channel: 1.公會 2.世界
  if this.lastSendRecriutTime ~= nil and (CGTimer.time - this.lastSendRecriutTime) <= 20 then
    ShowCenterMessage(string.Get(10318))
    return;      
  else
    this.lastSendRecriutTime = CGTimer.time;
  end
      
  sendBuffer:Clear()    
  sendBuffer:WriteByte(channel);
  Network.Send(47, 9, sendBuffer);
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

function Dungeon.SendLeaveTeam()
  Network.Send(47, 10);
end

function Dungeon.SendPrepare()
  Network.Send(47, 11);
end

function Dungeon.SendStartMultiplayerDungeon()
  Network.Send(47, 12);
end

function Dungeon.SendJoinAnyway(dungeonId)
  sendBuffer:Clear()
  sendBuffer:WriteUInt16(dungeonId);
  Network.Send(47, 13, sendBuffer);
end

function Dungeon.SendKickPlayer(roleId)
  sendBuffer:Clear()
  sendBuffer:WriteInt64(roleId);
  Network.Send(47, 17, sendBuffer);
end

function Dungeon.SendGetWeekDungeonPrize(para)
  --C:047-022 <領周副本全通獎勵>
  if Item.CheckBagIsFull() then
    ShowCenterMessage(string.Get(80359));  --背包已滿
    return
  end
  sendBuffer:Clear()
  sendBuffer:WriteByte(para);
  Network.Send(47, 22, sendBuffer);
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

function Dungeon.ReciveCreateDungeon(data)
  this.isSending = false;
  local result = data:ReadByte();
  --0.成功 1.無此副本編號 2.等級不符 3.已在副本房間中 4.次數用盡 5.不可組隊 6.人數已滿 7.暫無可用空間]
  if result == 0 then 
    this.isInRoom = true;
    this.CheckRedDot();
    if UI.IsVisible(UIDungeon) then  
      if this.nowDungeonKind == 2 then --單人副本
        UI.Close(UIDungeon);
      elseif this.nowDungeonKind == 1 or this.nowDungeonKind == 3 then --多人 
        this.dungeonNowRoomPlayers = {};
        local player = {};
        player.id = Role.playerId;
        player.name = Role.player.name;
        player.lv = Role.player:GetAttribute(EAttribute.Lv);
        player.turn = Role.player:GetAttribute(EAttribute.Turn);
        player.prepare = false;    
        this.dungeonNowRoomPlayers[1] = player;
  
        UIDungeon.UpdateTeamUI(); 
        
        Dungeon.ReciveSetPassword(data);
      end
    end
  else
    this.ClearRoomData();
    if result == 1 then 
      --無此副本編號
      ShowCenterMessage(string.Get(10327));
    elseif result == 2 then 
      --等級不符
      ShowCenterMessage(string.Get(10328));
    elseif result == 3 then 
      --已在副本房間中
      ShowCenterMessage(string.Get(10325));
    elseif result == 4 then 
      --次數用盡
      ShowCenterMessage(string.Get(10329));
    elseif result == 5 then 
      --不可組隊
      ShowCenterMessage(string.Get(10316));
    elseif result == 6 then 
      --人數已滿
      ShowCenterMessage(string.Get(10330));
    elseif result == 7 then 
      --該房間不存在
      ShowCenterMessage(string.Get(10317));
    elseif result == 8 then
      --戰鬥中
      ShowCenterMessage(string.Get(80099));
    elseif result == 9 then
      --魔豆正在使用中
      ShowCenterMessage(string.Get(90001));
    end
  end
end

function Dungeon.ReciveInviteResult(result)
  if result == 0 then 
    ShowCenterMessage(string.format( string.Get(21238), inviteName))
  else
    ShowCenterMessage(string.Get(40156));
  end
  inviteName = "";
end

function Dungeon.ReciveJoinRoom(data)
  this.isSending = false;
  local result = data:ReadByte();
  if result == 0 then 
    this.isInRoom = true;
    this.CheckRedDot();
    local roomId = data:ReadUInt32(); 

    if this.dungeonRoomDatas[roomId] ~= nil then 
      this.nowDungeonRoom = this.dungeonRoomDatas[roomId];
      this.nowDungeonOwnerId = this.nowDungeonRoom.ownerId;
      this.nowDungeonId = this.dungeonRoomDatas[roomId].dungeonId;
    end

    local count = data:ReadByte();
    this.dungeonNowRoomPlayers = {};
    local datas = {};
    for i = 1, count do 
      local player = DungeonPlayerData.New(data, true);
      datas[player.id] = player;
    end  
    --排序房主第一位
    this.dungeonNowRoomPlayers[1] = datas[this.nowDungeonOwnerId];
    for k, v in pairs(datas)do
      if v.id ~= this.nowDungeonOwnerId then 
        table.insert(this.dungeonNowRoomPlayers, v);
      end      
    end
    local playerSelf = {};
    playerSelf.id = Role.playerId;
    playerSelf.name = Role.player.name;
    playerSelf.lv = Role.player:GetAttribute(EAttribute.Lv);
    playerSelf.turn = Role.player:GetAttribute(EAttribute.Turn);
    playerSelf.prepare = false;    
    table.insert(this.dungeonNowRoomPlayers, playerSelf);

    this.nowDungeonId = data:ReadUInt16(); --副本ID(2)
    if not UI.IsVisible(UIDungeon) then 
      UI.Open(UIDungeon, 1, 1, true, true);
    else
      UIDungeon.UpdateTeamUI();
    end    
  else    
    this.ClearRoomData();
    this.SendAskRoomData();
    if result == 1 then 
      --無此副本編號
      ShowCenterMessage(string.Get(10327));
    elseif result == 2 then 
      --等級不符
      ShowCenterMessage(string.Get(10328));
    elseif result == 3 then 
      --已在副本房間中
      ShowCenterMessage(string.Get(10325));
    elseif result == 4 then     
      --次數用盡
      ShowCenterMessage(string.Get(10329));
    elseif result == 5 then 
      --不可組隊
      ShowCenterMessage(string.Get(10316));
    elseif result == 6 then     
      --人數已滿
      ShowCenterMessage(string.Get(10330));
    elseif result == 7 then 
      --該房間不存在
      ShowCenterMessage(string.Get(10317));
    elseif result == 8 then
      --戰鬥中
      ShowCenterMessage(string.Get(80099));
    elseif result == 9 then 
      --密碼錯誤
      ShowCenterMessage(string.Get(10319));
    end
  end  
end

function Dungeon.ReciveResetCount(data)
  local result = data:ReadByte();
  if result == 0 then 
    --成功
    ShowCenterMessage(string.Get(80361));
  elseif result == 1 then 
    --無此副本編號
    ShowCenterMessage(string.Get(10327));
  elseif result == 2 then 
    logError("No Count Limit");
  elseif result == 3 then 
    logError("Not Reach Count Limit");
  end
  this.InitAvailableDungeonDatas();
  if UI.IsVisible(UIDungeon) then     
    UIDungeon.UpdateInfo()
  end
end

function Dungeon.ReciveSkipResult(data)
  --結果[0.成功 1.無此副本編號 2.等級不符 3.已在副本房間中 4.次數用盡 5.不可組隊 6.人數已滿 8.戰鬥中 9.無掃蕩標記]
  local result = data:ReadByte();
  if result == 0 then 
    Dungeon.ReciveDungeonResult(data, true);
  elseif result == 1 then 
    --無此副本編號
    ShowCenterMessage(string.Get(10327));
  elseif result == 2 then 
    --等級不符
    ShowCenterMessage(string.Get(10328));
  elseif result == 3 then 
    --已在副本房間中
    ShowCenterMessage(string.Get(10325));
  elseif result == 4 then 
    --次數用盡
    ShowCenterMessage(string.Get(10329));
  elseif result == 5 then 
    --不可組隊
    ShowCenterMessage(string.Get(10316));
  elseif result == 6 then 
    --人數已滿
    ShowCenterMessage(string.Get(10330));
  elseif result == 7 then 
    --該房間不存在
    ShowCenterMessage(string.Get(10317));
  elseif result == 8 then
    --戰鬥中
    ShowCenterMessage(string.Get(80099));
  elseif result == 9 then 
    --無掃蕩標記
    ShowCenterMessage(string.Get(10331));
  end  
end

function Dungeon.RecivePlayerJoinRoom(data)
  local player = DungeonPlayerData.New(data, false);
  if player.id ~= Role.playerId then 
    table.insert(this.dungeonNowRoomPlayers, player);
    if UI.IsVisible(UIDungeon) then 
      UIDungeon.UpdateTeamRole()
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
end

function Dungeon.ReciveChangeRoomOwner(data)
  local roleId = data:ReadInt64();

  local index = 1;
  local data = nil;
  for k, v in pairs(this.dungeonNowRoomPlayers)do
    if v.id == roleId then
      data = v;
      index = k;
      v.prepare = false;
      break;
    end
  end

  if data ~= nil then 
    table.remove(this.dungeonNowRoomPlayers, index);
    table.insert(this.dungeonNowRoomPlayers, 1,data); --排序到第一位    
    this.nowDungeonRoom.ownerId = data.id;
    this.nowDungeonOwnerId = data.id;
    ShowCenterMessage(string.format(string.Get(10320), data.name))
  end

  if UI.IsVisible(UIDungeon) then 
    UIDungeon.UpdateTeamRole();
    UIDungeon.DisCountDown();
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

function Dungeon.RecivePlayerLeave(data)
  local leavePlayer = data:ReadInt64();
  --[0.自己離開 1.房長踼離 2.房長解散]
  local result = data:ReadByte();    
  if leavePlayer == Role.playerId then 
    this.ClearRoomData();
    this.InitAvailableDungeonDatas();
    if result == 0 then
      --自行離開組隊
      ShowCenterMessage(string.Get(10333))
    elseif result == 1 then       
      --房長踢離
      ShowCenterMessage(string.Get(10334))
    elseif result == 2 then       
      --斷線離開
      ShowCenterMessage(string.Get(10335))
    elseif result == 3 then       
      --離開副本
      ShowCenterMessage(string.Get(10335))
    elseif result == 4 then 
      --斷線重登後離開副本
      ShowCenterMessage(string.Get(10336))      
    end

    if UI.IsVisible(UIDungeon) then 
      UIDungeon.OnReturnToTags();
    end
  else
    for k, v in pairs(this.dungeonNowRoomPlayers)do
      if v.id == leavePlayer then
	    if (result == 0) or (Team.GetTeamState(Role.playerId) ~= ETeamState.None) then
		  ShowCenterMessage(string.format(string.Get(10332), v.name));
		end
        table.remove( this.dungeonNowRoomPlayers, k);
        break;
      end
    end
    if UI.IsVisible(UIDungeon) then 
      UIDungeon.UpdateTeamRole()
    end
  end
end

function Dungeon.ReciveSetPassword(data)
  local strLen = data:ReadByte();
  local password = data:ReadString(strLen);
  this.nowDungeonPassword = password;
  UIDungeon.UpdateTeamPassword();
end

function Dungeon.ReciveSetRoomName(data)
  local length = data:ReadByte();
  
  local roomName = data:ReadString(length);  
  this.nowDungeonRoom.name = roomName;

  if UI.IsVisible(UIDungeon) then 
    UIDungeon.UpdateTeamRoomName();
  end
end

function Dungeon.ReciveDungeonResult(data, readResult)
  --結果(1) +副本編號(2) +數量(1) <<+獎勵ID(2) +數量(4)>>
  local result = true;
  if readResult == nil or readResult == false then 
   result = data:ReadByte();
  end
  local dungeonId = data:ReadUInt16();
  local dungeonData = this.GetData(dungeonId);
  local title = string.Get(dungeonData.name);

  local count = data:ReadByte();
  local reward = {};
  local itemTitle = string.Get(30034);
  for i = 1, count do 
    local itemId = data:ReadUInt16();
    local quant = data:ReadUInt32();    
    if itemDatas[itemId] ~= nil then 
      table.insert(reward, RewardItem.New(itemTitle, itemId ,itemDatas[itemId].iconId, quant));
    end
  end
  UI.Open(UIResult, Role.player, title, "", reward, Dungeon.LeaveSinglePlayDungeon, result == 0);
  if UI.IsVisible(UIDungeon)then 
    UIDungeon.UpdateInfo();
  end
  Dungeon.ClearTimeData();
end

function Dungeon.RecivePlayerPrePare(data)
  --RoleID(8)+是否準備(1)
  local roleId = data:ReadInt64();
  local prepare = data:ReadByte() ~= 0;
  if roleId == this.nowDungeonOwnerId then     
    --房主準備代表開始讀秒
    if UI.IsVisible(UIDungeon) then 
      UIDungeon.StartCountdown();
    end    
  else
    for k, v in pairs(this.dungeonNowRoomPlayers)do
      if v.id == roleId then 
        v.prepare = prepare;
        break;
      end
    end

    if UI.IsVisible(UIDungeon) then 
      UIDungeon.UpdateTeamStatus();
      if roleId == Role.playerId then 
        UIDungeon.UpdateTeamCloseButton(prepare);
      end
    end
  end
end

function Dungeon.ReciveRoomData(data)
  --+數量(2)+<<房間編號(4)+房間名稱長度(1)+房間名稱(?)+房長ID(8)+是否需要密碼(?)+副本編號(2)+當前人數(1)>>
  local count = data:ReadUInt16();  
  for i = 1, count do 
    local roomData = DungeonRoom.New(data);    
    if this.dungeonRoomDatas[roomData.id] == nil then 
      this.dungeonRoomDatas[roomData.id] = roomData;
    end
  end
  if UI.IsVisible(UIDungeon) then 
    UIDungeon.ResetScrollContent();
  end
end

function Dungeon.ReciveDungeonRecurit(data)
  --頻道種類(1) +房間序號(4) +副本ID(2) +房長ID(8) +長度(1) +房長名(?) +有無密碼(1) 
  local roomId = data:ReadUInt32();
  local dungeonId = data:ReadUInt16();
  local ownerId = data:ReadInt64();
  local ownerName = data:ReadString(data:ReadByte());
  local chanelkind = data:ReadByte(); --1.軍團 2.公開
  local isLock = data:ReadByte() == 1;
  
  if this.dungeonRoomDatas[roomId] == nil then   
    local roomData = {};
    roomData.id = roomId;
    roomData.name = ownerName;
    roomData.ownerId = ownerId;
    roomData.isLock = isLock;
    roomData.dungeonId = dungeonId;
    roomData.peopleCount = 1;
    this.dungeonRoomDatas[roomId] = roomData;
  end
  local locked = "";
  if isLock then 
    locked = "true";
  else
    locked = "false";
  end
  local str = string.Concat("<url=Dungeon_", roomId, "_", locked, ">", string.Get(10338), "</url>", string.format(string.Get(10337), this.GetName(dungeonId)));
  if chanelkind == 1 then 
    Chat.AddMessage(EChannel.Organization, str, ownerId, ownerName);
  else
    Chat.AddMessage(EChannel.World, str, ownerId, ownerName);    
  end
end

function Dungeon.ReciveEndTime(data)
  this.nowDungeonStartTime = DateTime.FromOADate(data:ReadDouble());

  this.nowDungeonEndTime = 0;

  this.isInRoom = false;
  this.CheckRedDot();  
  
  if this.nowDungeonId == 0 or this.nowDungeonId == nil then   --斷線重連
    this.nowDungeonId = data:ReadUInt16();
  end

  local dungeonData = this.GetData(this.nowDungeonId);
  if dungeonData ~= nil then 
    this.nowDungeonEndTime = this.nowDungeonStartTime:AddMinutes(dungeonData.time);   
    CGTimer.AddListener(Dungeon.UpdateTime, 1, true);
  end
end

function Dungeon.StartLimitTimeDungeonTime(index, t)
  this.limitIndex = index;
  this.limitTime = t;
  startLimitRoleCount = RoleCount.Get(index);
  time = (t - startLimitRoleCount) * 60;
  CGTimer.AddListener(this.UpdateLimitTimeDungeonTime, 1, true);
end

function Dungeon.UpdateLimitTimeDungeonTime()
  if RoleCount.Get(this.limitIndex) ~= startLimitRoleCount then
    startLimitRoleCount = RoleCount.Get(this.limitIndex);
    time = (this.limitTime - startLimitRoleCount) * 60;
  end
  
  time = time - 1;
  
  if time > 0 then
    UIMain.UpdateDungeonTime(math.floor(time / 60), time % 60);
    if(math.floor(time / 60)<10)then
      MachineBox.CheckLimitTimeDungeonItem();
    end
  else
    CGTimer.RemoveListener(Dungeon.UpdateLimitTimeDungeonTime);
  end
end

function Dungeon.CheckTeamIsReady()
  local isReady = true;
  for k, v in pairs(Dungeon.dungeonNowRoomPlayers)do
    if v.id ~= Role.playerId and v.prepare == false then 
      isReady = false;
    end
  end
  return isReady;
end

function Dungeon.GetData(id)
  return dungeonDatas[id];
end

function Dungeon.GetName(id)
  local dungeonData = this.GetData(id);
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
  if dungeonData ~= nil then 
    return string.Get(dungeonData.name);
  else
    return "";
  end
end

function Dungeon.CheckInDungeon()
  if this.nowDungeonId == 0 then 
    return false;
  end

  local dungeonData = this.GetData(this.nowDungeonId);
  if dungeonData ~= nil and MarkManager.GetMission(dungeonData.missionFlag) ~= nil then 
    local mission = MarkManager.GetMission(dungeonData.missionFlag);

    if markDatas[mission.id] == nil then return false end
    if markDatas[mission.id].steps == nil then return false end
  
    local step = markDatas[mission.id].steps[mission.step];
  
    if step == nil then return false end
  
    local sceneId = step.endSceneId;
    local areaId = step.endAreaId;
    local position = step.endPosition;
    local npcIndex = step.endEventId;
    
    local haveCondition = false;
    local doneCondition = true;
  
    for i = 1, 5 do
      local condition = step.conditions[i];
  
      if condition.kind ~= 0 then
        haveCondition = true;
  
        if condition.kind == 1 then
          --捕捉npc
          doneCondition = Role.GetFollowNpc(Role.playerId, condition.id) ~= nil;
  
        elseif condition.kind == 2 then
          --擊殺npc
  
        elseif condition.kind == 3 then
          --收集道具
          doneCondition = Item.GetItemCount(condition.id) >= condition.count;
        end
  
        if not doneCondition then
          sceneId = condition.sceneId;
          areaId = condition.areaId;
          position = condition.position;
          npcIndex = condition.eventId;
          break;
        end
      end
    end
    return SceneManager.sceneId == sceneId;
  else
    return false;
  end
end

function Dungeon.CheckRedDot()
  if table.Count(this.useableDungeons) == 0 and this.isInRoom == false then 
    RedDot.Remove(ERedDot.Dungeon);
  else
    RedDot.Add(ERedDot.Dungeon);
  end
end