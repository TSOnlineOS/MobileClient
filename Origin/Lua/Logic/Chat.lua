
require "Data/MessageInfo"

EChannel = {
  System = 0; --系統訊息
  World = 1; --全頻
  Scene = 2; --輕頻
  Whisper = 3; --密頻
  GM = 4; --gm頻
  Team = 5; --隊頻
  Organization = 6; --團頻
  Ally = 7; --盟頻
  Self = 10; --自己講的話
  Announcement = 11; --系統公告
}

Chat = {}
local this = Chat;

--const
if Define.IsInternal() then
  this.maxLeaveMessage = 23;
else
  this.maxLeaveMessage = 500;
end

this.worldChannelLv = 15;
this.maxItem = 100;
this.maxNpc = 100;
this.maxMessage = 300;

this.chanelTittle = {};
this.chanelTittle[0] = 20927;
this.chanelTittle[1] = 20928;
this.chanelTittle[2] = 20929;
this.chanelTittle[3] = 20936;
this.chanelTittle[4] = 20937;
this.chanelTittle[5] = 20938;
this.chanelTittle[6] = 20939;
this.chanelTittle[7] = 20940;
this.chanelTittle[11] = 20927;
                               --中文           注音          ASCII       全形符號      半型英數字符號      雙引號        ˊ       ˇ     ˊ     ˙
this.chatRegexPattern = "^[\\u4E00-\\u9FA5\\u3105-\\u3129\\x20-\\x7E\\u3000-\\u301f\\uff01-\\uff5e\\u201c\\u201d\\u02ca\\u02c7\\u02cb\\u02d9\\u2027]*$";

--var
this.hornItem = 46029;
this.hornCount = 0; --全頻號角次數

this.lastMessages = {};
this.messages = {};
for k, v in pairs(EChannel) do
  this.messages[v] = {};
end

this.leaveMessages = {};

this.banKind = false;
this.banExpireTime = nil;

local currentItemIndex = 1;
local currentNpcIndex = 1;

local messageNpcs = {};

function Chat.Clear()
  table.Clear(this.lastMessages);
  for k, v in pairs(EChannel) do
    table.Clear(this.messages[v]);
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
  currentItemIndex = 1;
  Item.ClearBag(EThings.Chat);

  currentNpcIndex = 1;
  table.Clear(messageNpcs);

  table.Clear(this.leaveMessages);

  this.banKind = false;
  this.banExpireTime = nil;

  ClearMarqueeMessage();
end

function Chat.Ban(kind, expireTime)
  this.banKind = kind;
  this.banExpireTime = expireTime;
  
  if kind == 1 then
    Chat.AddMessage(EChannel.System, string.Get(40076));
  elseif kind == 2 then
    Chat.AddMessage(EChannel.System, string.Get(40323));
  elseif kind == 3 then
    Chat.AddMessage(EChannel.System, string.format(string.Get(21282),this.banExpireTime:ToString("yyyy/MM/dd HH:mm")));
  elseif kind == 4 then
    Chat.AddMessage(EChannel.System, string.Get(21283)); 
  end
end

function Chat.CheckBan()
  if this.banKind == 0 then return false end
  if this.banExpireTime == nil then return false end

  if DateTime.Compare(CGTimer.serverTime, this.banExpireTime) > 0 then
    this.banKind = 0;
    this.banExpireTime = nil;
    return false;
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
  ShowCenterMessage(string.Get(20303));
  return true;
end

function Chat.ReceiveMessage(channel, data)
  local roleId = data:ReadInt64();
  local titleId = data:ReadUInt16();
  local name = data:ReadString(data:ReadByte());
  local message = data:ReadString(data:ReadByte(), DataManager.encoding_Unicode);
  
  if not TextChecker.Check(message, this.chatRegexPattern, 0, 0) then return end

  local titleData = titleDatas[titleId];
  if titleData ~= nil and titleData.chatText ~= 0 then
    name = string.format(string.Get(titleData.chatText), name);
  end

  local itemCount = data:ReadByte();
  local items = {};
  for i = 1, itemCount do
    items[i] = ThingData.New(data);
  end

  local npcCount = data:ReadByte();
  local npcs = {};
  for i = 1, npcCount do
    npcs[i] = NpcInfo.New(data);
  end

  if channel ~= EChannel.System then
    for k, v in pairs(tabooDatas) do
      message = string.gsub(message, string.GetNocase(v),
        function(s)
          local count = string.Count(s);
          local result = "";
          for i = 1, count do
            result = string.Concat(result, "*");
          end
          return result;
        end
      );
    end
  end
  
  Chat.AddMessage(channel, message, roleId, name, items, npcs);
end

function Chat.AddMessage(channel, message, roleId, name, items, npcs)
  if roleId == nil then
    roleId = 0;
  end

  if Social.IsBlack(roleId) then return end

  if string.IsNullOrEmpty(name) then
    if Role.players[roleId] ~= nil then
      name = Role.players[roleId].name;
    else
      name = "";
    end
  end

  if channel == EChannel.Whisper and roleId == Role.playerId then
    name = string.Concat("to ", name);
  end

  if items ~= nil then
    for k, itemSave in pairs(items) do
      if itemDatas[itemSave.Id] ~= nil then
        Item.SetBagItem(EThings.Chat, currentItemIndex, itemSave);
        local itemName = itemDatas[itemSave.Id]:GetName(true, true, true);
        itemName = string.gsub(itemName, "%%", function(w) return "%%" end);
        message = string.gsub(message, string.Concat("%[ITEM_", itemSave.Id, "%]"), string.Concat("<url=ItemMessage_", currentItemIndex, ">", itemName, "</url>"), 1);
        currentItemIndex = currentItemIndex + 1;
        if currentItemIndex > this.maxItem then
          currentItemIndex = 1;
        end
      end
    end
  end

  if npcs ~= nil then
    for k, npcInfo in pairs(npcs) do
      if npcDatas[npcInfo.npcId] ~= nil then
        messageNpcs[currentNpcIndex] = npcInfo;

        npcInfo.chatNpcIndex = currentNpcIndex;
        Item.ClearBag(EThings.ChatNpc, currentNpcIndex);

        for k, itemSave in pairs(npcInfo.equips) do
          if itemDatas[itemSave.Id] ~= nil then 
            Item.SetBagItem(EThings.ChatNpc, itemDatas[itemSave.Id].fitType, itemSave, false, currentNpcIndex);
          end
        end
        table.Clear(npcInfo.equips);

        message = string.gsub(message, string.Concat("%[NPC_", npcInfo.npcId, "%]"), string.Concat("<url=NpcMessage_", currentNpcIndex, ">", string.AddBrackets(npcDatas[npcInfo.npcId].name), "</url>"), 1);

        currentNpcIndex = currentNpcIndex + 1;
        if currentNpcIndex > this.maxNpc then
          currentNpcIndex = 1;
        end
      end
    end
  end

  local messageInfo = {};

  messageInfo.channel = channel;
  messageInfo.roleId = roleId;
  messageInfo.name = name;
  messageInfo.message = message;
  messageInfo.time = CGTimer.serverTime;
  
  table.insert(this.lastMessages, messageInfo);
  if table.maxn(this.lastMessages) > this.maxMessage then
    table.remove(this.lastMessages, 1);
  end

  --[[
  table.insert(this.messages[channel], messageInfo);
  if table.maxn(this.messages[channel]) > this.maxMessage then
    table.remove(this.messages[channel], 1);
  end
  --]]
  
  if channel == EChannel.Whisper and roleId ~= Role.playerId then
    RedDot.Add(ERedDot.Whisper);
  end

  UINewChat.UpdateMessage();
end

function Chat.CanUseChannel(channel, showMessage)
  if channel == EChannel.World then
    if not Role.CheckPlayerLv(this.worldChannelLv) then
      if showMessage then
        ShowCenterMessage(string.format(string.Get(10138), this.worldChannelLv));
      end

      return false;
    end

    if this.hornCount <= 0 then
      if showMessage then
        ShowCenterMessage(string.Get(20704));
      end

      return false;
    end
  
  elseif channel == EChannel.Scene then
  
  elseif channel == EChannel.Whisper then
  
  elseif channel == EChannel.Team then
    if Team.IsAlone(Role.playerId) then
      if showMessage then
        ShowCenterMessage(string.Get(20111));
      end

      return false;
    end
    
  elseif channel == EChannel.Organization then
    if Organization.Id == 0 then
      if showMessage then
        ShowCenterMessage(string.Get(50117));
      end

      return false;
    end

  elseif channel == EChannel.Ally then
    if Organization.orgs[Organization.Id] == nil or Organization.orgs[Organization.Id].allyId == 0 then
      if showMessage then
        ShowCenterMessage(string.Get(20846));
      end
      
      return false;
    end

  else
    return false;
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
  return true;
end

function Chat.AddItemMessage(bagKind, bagIndex, followIndex)
  UI.Close(UIItemInfo);

  UINewChat.AddItem(Item.GetBagItem(bagKind, bagIndex, followIndex));
end

function Chat.AddNpcMessage(role)
  if role == nil then return end
  
  UINewChat.AddNpc(NpcInfo.New(nil, role));
end

function Chat.ShowItemMessage(index)
  local itemSave = Item.GetBagItem(EThings.Chat, index);
  if itemSave == nil then return end

  UIItemInfo.Show(itemSave.Id, itemSave);
end

function Chat.ShowNpcMessage(index)
  if messageNpcs[index] == nil then return end

  UI.Open(UINpcInfo, messageNpcs[index]);
end

--leave message
function Chat.AddLeaveMessage(roleId, name, sex, headStyle, colorTints, time, message)
  table.insert(this.leaveMessages, 1, MessageInfo.New(roleId, name, sex, headStyle, colorTints, time, message));
  
  if table.maxn(this.leaveMessages) > this.maxLeaveMessage then
    table.remove(this.leaveMessages, table.maxn(this.leaveMessages));
  end

  if UI.IsVisible(UIMessageboard) then
    UIMessageboard.UpdateUI();
  end
end

function Chat.DelLeaveMessage(index)
  if this.leaveMessages[index] == nil then return end

  table.remove(this.leaveMessages, index);

  if UI.IsVisible(UIMessageboard) then
    UIMessageboard.UpdateUI();
  end
end