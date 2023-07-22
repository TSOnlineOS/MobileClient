EInvitation = {
  Friend = 1,
  Team = 2,
  Dungeon = 3,
  OrgMember = 4,
  Organization = 5,
}

Invitation = {};
local this = Invitation;

this.invitations = {};
for k, v in pairs(EInvitation) do
  this.invitations[v] = {};
end

function Invitation.Clear()
  for k, v in pairs(EInvitation) do
    table.Clear(this.invitations[v]);
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

function Invitation.Add(kind, roleId, data, updateOther)
  if this.invitations[kind] == nil then return end

  if this.invitations[kind][roleId] == nil then
    this.invitations[kind][roleId] = {};
  end

  local invitation = this.invitations[kind][roleId];

  invitation.kind = kind;
  invitation.roleId = roleId;
  invitation.time = CGTimer.serverTime;
  
  if kind == EInvitation.Friend then
    invitation.name = data:ReadString(data:ReadByte());
    invitation.level = data:ReadByte();
    invitation.element = data:ReadByte();
    invitation.turn3Element = data:ReadByte();
    invitation.turn = data:ReadByte();
    invitation.career = data:ReadByte();
    data:ReadBytes(11);

    RedDot.Add(ERedDot.FriendInvitation);
    ShowCenterMessage(string.format(string.Get(21234), invitation.name));

  elseif kind == EInvitation.Team then
    local role = Role.players[invitation.roleId];
    invitation.name = role.name;
    invitation.level = role:GetAttribute(EAttribute.Lv);
    invitation.element = role:GetAttribute(EAttribute.Element);
    invitation.turn3Element = role:GetAttribute(EAttribute.Turn3Element);
    invitation.turn = role:GetAttribute(EAttribute.Turn);
    invitation.career = role:GetAttribute(EAttribute.Career);

    if invitation.turn >= 3 then
      invitation.level = invitation.level - Role.playerMaxLv;
    end
    
    invitation.state = data;

    RedDot.Add(ERedDot.TeamInvitation);
    ShowCenterMessage(string.format(string.Get(21234), Role.players[invitation.roleId].name));

  elseif kind == EInvitation.Dungeon then
    invitation.name = data.name;  
    invitation.level = data.level;
    invitation.element = data.element;  
    invitation.turn = data.turn;
    invitation.turn3Element = data.turn3Element;
    invitation.career = data.career;

    invitation.roomId = data.roomId;
    invitation.dungeonId = data.dungeonId;

    RedDot.Add(ERedDot.DungeonInvitation);
    ShowCenterMessage(string.format(string.Get(21234), invitation.name));

  elseif kind == EInvitation.OrgMember then
    invitation.name = data:ReadString(data:ReadByte());
    invitation.level = data:ReadByte();
    invitation.element = data:ReadByte();
    invitation.turn3Element = data:ReadByte();
    invitation.turn = data:ReadByte();
    invitation.career = data:ReadByte();

    RedDot.Add(ERedDot.OrgMemberInvitation);

  elseif kind == EInvitation.Organization then
    invitation.orgId = data:ReadUInt32();
    invitation.name = data:ReadString(data:ReadByte());
    invitation.level = data:ReadByte();
    invitation.score = data:ReadUInt32();
    invitation.leaderName = data:ReadString(data:ReadByte());
    invitation.memberCount = data:ReadByte();

    for k, v in pairs(this.invitations[kind]) do
      if k ~= roleId and v.orgId == invitation.orgId then
        invitation = nil;
        this.invitations[kind][roleId] = nil;
        return;
      end
    end

    RedDot.Add(ERedDot.OrgInvitation);
    ShowCenterMessage(string.format(string.Get(21234), invitation.name));
  end

  if invitation.turn ~= nil and invitation.turn >= 3 then
    invitation.level = invitation.level + Role.playerMaxLv;
  end

  if updateOther == false then return end
  
  if UI.IsVisible(UIInvitation) then
    UIInvitation.UpdateUI();
  end
end

function Invitation.Remove(kind, roleId, updateOther)
  if this.invitations[kind] == nil then return end

  local isEmpty = true;

  if roleId ~= nil then
    if this.invitations[kind][roleId] == nil then return end
  
    this.invitations[kind][roleId] = nil;
  
    for k, v in pairs(this.invitations[kind]) do
      isEmpty = false;
      break;
    end
  else
    table.Clear(this.invitations[kind]);
  end

  if isEmpty then
    if kind == EInvitation.Friend then
      RedDot.Remove(ERedDot.FriendInvitation);
  
    elseif kind == EInvitation.Team then
      RedDot.Remove(ERedDot.TeamInvitation);
  
    elseif kind == EInvitation.Dungeon then
      RedDot.Remove(ERedDot.DungeonInvitation);

    elseif kind == EInvitation.OrgMember then
      RedDot.Remove(ERedDot.OrgMemberInvitation);
  
    elseif kind == EInvitation.Organization then
      RedDot.Remove(ERedDot.OrgInvitation);
    end
  end

  if updateOther == false then return end
  
  if UI.IsVisible(UIInvitation) then
    UIInvitation.UpdateUI();
  end
end

function Invitation.Get(kind, roleId)
  if this.invitations[kind] == nil then return nil end
  if this.invitations[kind][roleId] == nil then return nil end

  return this.invitations[kind][roleId];
end

function Invitation.Check(kind)
  if this.invitations[kind] == nil then return end

  if kind == EInvitation.Friend then
  elseif kind == EInvitation.Team then
    local playerIsLeader = Team.IsLeader(Role.playerId);
    local playerIsAlone = Team.IsAlone(Role.playerId);
    local remove = false;
  
    for roleId, info in pairs(this.invitations[kind]) do
      remove = false;
  
      if info.state == ETeamInvitation.Invite then
        if not playerIsAlone then
          remove = true;
        elseif not Team.IsAlone(roleId) and not Team.IsLeader(roleId) then
          remove = true;
        end
      elseif info.state == ETeamInvitation.Join then
        if not playerIsAlone and not playerIsLeader then
          remove = true;
        elseif not Team.IsAlone(roleId) then
          remove = true;
        end
      end
  
      if remove then
        this.Remove(kind, roleId, false);
      end
    end
  elseif kind == EInvitation.Dungeon then
  elseif kind == EInvitation.OrgMember then
  elseif kind == EInvitation.Organization then
  end

  if UI.IsVisible(UIInvitation) then
    UIInvitation.UpdateUI();
  end
end
--[[
Now at that time, Judah went away from his brothers and became the friend of a man of Adullam named Hirah.
And there he saw the daughter of a certain man of Canaan named Shua, and took her as his wife.
And she gave birth to a son, and he gave him the name Er.
And again she gave birth to a son, and he gave him the name Onan.
Then she had another son, to whom she gave the name Shelah; she was at Chezib when the birth took place.
And Judah took a wife for his first son Er, and her name was Tamar.
Now Er, Judah's first son, did evil in the eyes of the Lord, so that he put him to death.
Then Judah said to Onan, Go in to your brother's wife and do what it is right for a husband's brother to do; make her your wife and get offspring for your brother.
But Onan, seeing that the offspring would not be his, went in to his brother's wife, but let his seed go on to the earth, so that he might not get offspring for his brother.
And what he did was evil in the eyes of the Lord, so that he put him to death, like his brother.
Then Judah said to Tamar, his daughter-in-law, Go back to your father's house and keep yourself as a widow till my son Shelah becomes a man: for he had in his mind the thought that death might come to him as it had come to his brothers. So Tamar went back to her father's house.
And after a time, Bath-shua, Judah's wife, came to her end; and after Judah was comforted for her loss, he went to Timnah, where they were cutting the wool of his sheep, and his friend Hirah of Adullam went with him.
And when Tamar had news that her father-in-law was going up to Timnah to the wool-cutting,
She took off her widow's clothing, and covering herself with her veil, she took her seat near Enaim on the road to Timnah; for she saw that Shelah was now a man, but she had not been made his wife.
--]]


function Invitation.Reply(kind, roleId, result, updateOther)
  if this.invitations[kind] == nil then return end
  if this.invitations[kind][roleId] == nil then return end

  local invitation = this.invitations[kind][roleId];
  
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      human = satan + haven;
    else
      human = satan - haven;
    end
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
    local faith = 0;
    for i = 1, 3 do
      faith = faith + i;
    end
  
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
  end
  
  if kind == EInvitation.Friend then
    --C:014-006 <回覆好友名單邀請> +玩家ID(8) +結果(1)
    sendBuffer:Clear();
    sendBuffer:WriteInt64(roleId);  
    if result then
      sendBuffer:WriteByte(1);
    else
      sendBuffer:WriteByte(2);
    end  
    Network.Send(14, 6, sendBuffer);

    return;

  elseif kind == EInvitation.Team then
    if result then
      local role = Role.players[roleId];
      if role == nil then
        ShowCenterMessage("Player In Different Scene !!");
        return;
      end

      if SceneManager.areaId ~= DoorManager.GetArea(role.position) then
        ShowCenterMessage("Player In Different Scene !!");
        return;
      end

      if role.war ~= EWar.None then
        ShowCenterMessage(string.Get(40322));
        return;
      end
    end
      
    if invitation.state == ETeamInvitation.Invite then
      if result and table.maxn(Team.GetMember(roleId, true)) >= Team.maxMember then
        ShowCenterMessage(string.Get(40142));
        return;
      end

      --C:013-008 <回覆邀請組隊> +結果(1) +玩家ID(8)
      sendBuffer:Clear();
      if result then
        sendBuffer:WriteByte(1);
      else
        sendBuffer:WriteByte(2);
      end  
      sendBuffer:WriteInt64(roleId);
      Network.Send(13, 8, sendBuffer);

    elseif invitation.state == ETeamInvitation.Join then
      if result and table.maxn(Team.GetMember(Role.playerId, true)) >= Team.maxMember then
        ShowCenterMessage(string.Get(40143));
        return;
      end
      
      --C:013-003 <回覆要求組隊> +結果(1) +玩家ID(8)
      sendBuffer:Clear();  
      if result then
        sendBuffer:WriteByte(1);
      else
        sendBuffer:WriteByte(2);
      end  
      sendBuffer:WriteInt64(roleId);
      Network.Send(13, 3, sendBuffer);
    end

  elseif kind == EInvitation.Dungeon then
    if result then
      if Dungeon.nowDungeonRoom ~= nil then 
        ShowCenterMessage(string.Get(21243));
        return;
      else        
        Dungeon.SendJoinRoom(invitation.roomId);
        Dungeon.SetNowDungeon(invitation.dungeonId, invitation.roomId, roleId, invitation.name);
      end
    end

  elseif kind == EInvitation.OrgMember then
    --C:039-102 <回覆申請> +玩家ID(8) +結果(1)
    sendBuffer:Clear()
    sendBuffer:WriteInt64(roleId);
    if result then
      sendBuffer:WriteByte(1);
    else
      sendBuffer:WriteByte(2);
    end  
    Network.Send(39, 102, sendBuffer);

    return;

  elseif kind == EInvitation.Organization then
    --C:039-003 <回應加入軍團> +玩家ID(8) +結果(1)
    sendBuffer:Clear()
    sendBuffer:WriteInt64(roleId);
    if result then
      sendBuffer:WriteByte(1);
      roleId = nil;
    else
      sendBuffer:WriteByte(2);
    end  
    Network.Send(39, 3, sendBuffer);
  end

  this.Remove(kind, roleId, updateOther);
end