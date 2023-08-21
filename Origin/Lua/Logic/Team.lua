ETeamInvitation = {
  Invite = 1,
  Join = 2,
}

ETeamState = {
  None = 0, --未組隊
  Leader = 1, --隊長
  Adviser = 2, --軍師
  TeamMembers = 3 --隊員
}

--[[
Now Abraham was old and far on in years: and the Lord had given him everything in full measure.
And Abraham said to his chief servant, the manager of all his property, Come now, put your hand under my leg:
And take an oath by the Lord, the God of heaven and the God of the earth, that you will not get a wife for my son Isaac from the daughters of the Canaanites among whom I am living;
But that you will go into my country and to my relations and get a wife there for my son Isaac.
And the servant said, If by chance the woman will not come with me into this land, am I to take your son back again to the land from which you came?
And Abraham said, Take care that you do not let my son go back to that land.
The Lord God of heaven, who took me from my father's house and from the land of my birth, and made an oath to me, saying, To your seed I will give this land: he will send his angel before you and give you a wife for my son in that land.
And if the woman will not come with you, then you are free from this oath; only do not take my son back there.
And the servant put his hand under Abraham's leg, and gave him his oath about this thing.
And the servant took ten of his master's camels, and all sorts of good things of his master's, and went to Mesopotamia, to the town of Nahor.
And he made the camels take their rest outside the town by the water-spring in the evening, at the time when the women came to get water.
And he said, O Lord, the God of my master Abraham, let me do well in what I have undertaken this day, and give your mercy to my master Abraham.
See, I am waiting here by the water-spring; and the daughters of the town are coming out to get water:
Now, may the girl to whom I say, Let down your vessel and give me a drink, and who says in answer, Here is a drink for you and let me give water to your camels: may she be the one marked out by you for your servant Isaac: so may I be certain that you have been good to my master Abraham.
And even before his words were ended, Rebekah, the daughter of Bethuel, the son of Milcah, who was the wife of Nahor, Abraham's brother, came out with her water-vessel on her arm.
She was a very beautiful girl, a virgin, who had never been touched by a man: and she went down to the spring to get water in her vessel.
And the servant came running to her and said, Give me a little water from your vessel.
And she said, Take a drink, my lord: and quickly letting down her vessel onto her hand, she gave him a drink.
And having done so, she said, I will get water for your camels till they have had enough.
And after putting the water from her vessel into the animals' drinking-place, she went quickly back to the spring and got water for all the camels.
And the man, looking at her, said nothing, waiting to see if the Lord had given his journey a good outcome.
And when the camels had had enough, the man took a gold nose-ring, half a shekel in weight, and two ornaments for her arms of ten shekels weight of gold;
And said to her, Whose daughter are you? is there room in your father's house for us?
And she said to him, I am the daughter of Bethuel, the son of Milcah, Nahor's wife.
And she said, We have a great store of dry grass and cattle-food, and there is room for you.
And with bent head the man gave worship to the Lord;
And said, Praise be to the Lord, the God of my master Abraham, who has given a sign that he is good and true to my master, by guiding me straight to the house of my master's family.
]]--


Team = {}
local this = Team;

--const
this.maxMember = 5;

--var
this.leaders = {}; --Key = 隊長ID Value = 軍師ID
this.members = {}; --Key = 玩家ID Value = 隊長ID

this.inviteStr = nil;

function Team.Clear()
  table.Clear(this.leaders);
  table.Clear(this.members);
end

function Team.EndOfLine()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Team.EndOfLine1()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Team.Invite(role)
  if role == nil then return end
  if Role.player == nil then return end

  --攻城戰觀戰中
  if Role.player.data.isWatching then return end

  local roleId = role.index;

  --戰鬥中
  if role.war ~= EWar.None then
    if role.war == EWar.Guest then
      ShowCenterMessage(string.Get(50085));
    else
      ShowCenterMessage(string.Get(40072));
    end

    return;
  end

  --GM
  if Role.IsGM(roleId) then
    ShowCenterMessage(string.Get(40006));
    return;
  end

  --場景限制
  if SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.NoTeam) then
    ShowCenterMessage(string.Get(40264));
    return;
  end

  local invitation = Invitation.Get(EInvitation.Team, roleId);

  if this.IsLeader(Role.playerId) then
    --對方已要求加入，直接回覆同意要求
    if invitation ~= nil and invitation.state == ETeamInvitation.Join then
      Invitation.Reply(EInvitation.Team, roleId, true);
      return;
    end

    --已在隊伍中
    if this.GetLeader(Role.playerId) == this.GetLeader(roleId) then
      ShowCenterMessage(string.Get(20385));
      return;
    end
    
    --已有隊伍
    if not this.IsAlone(roleId) then
      ShowCenterMessage(string.Get(20384));
      return;
    end

    --隊伍已滿
    local members = this.GetMember(Role.playerId, true);
    if table.Count(members) >= this.maxMember then
      ShowCenterMessage(string.Get(40143));
      return;
    end

    --C:013-007 <邀請組隊> +玩家ID(8)
    sendBuffer:Clear()
    sendBuffer:WriteInt64(roleId);
    Network.Send(13, 7, sendBuffer);
    
    this.inviteStr = string.format(string.Get(20164), role.name);

  elseif this.IsAlone(Role.playerId) then
    --對方已邀請加入，先拒絕再發出邀請
    if invitation ~= nil and invitation.state == ETeamInvitation.Invite then
      Invitation.Reply(EInvitation.Team, roleId, false);
    end

    if this.IsAlone(roleId) then
      --C:013-007 <邀請組隊> +玩家ID(8)
      sendBuffer:Clear()
      sendBuffer:WriteInt64(roleId);
      Network.Send(13, 7, sendBuffer);

      this.inviteStr = string.format(string.Get(20164), role.name);
    else
      local leader = this.GetLeader(roleId);
      
      if leader == nil then return end

      --隊伍已滿
      local members = this.GetMember(roleId, true);
      if table.Count(members) >= this.maxMember then
        ShowCenterMessage(string.Get(40142));
        return;
      end
      
      --對方已邀請加入，直接回覆同意邀請
      if invitation ~= nil and invitation.state == ETeamInvitation.Invite then
        Invitation.Reply(EInvitation.Team, roleId, true);
        return;
      end
      
      --C:013-001 <要求組隊> +玩家ID(8)
      sendBuffer:Clear()
      sendBuffer:WriteInt64(leader.index);
      Network.Send(13, 1, sendBuffer);

      this.inviteStr = string.format(string.Get(20383), role.name);
    end
  end
end

function Team.EndOfLine2()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Team.EndOfLine3()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Team.EndOfLine4()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Team.Leave()
  if this.members[Role.playerId] == nil then return end

  --C:013-004 <離開隊伍> +隊長玩家ID(8)
  sendBuffer:Clear()
  sendBuffer:WriteInt64(this.members[Role.playerId]);
  Network.Send(13, 4, sendBuffer);
end

local function AddMember(leaderId, roleId)
  logWarn(string.Concat("AddMember ", leaderId, " ", roleId));
  local leader = Role.players[leaderId];

  if this.leaders[leaderId] == nil then
    this.leaders[leaderId] = 0;
    this.members[leaderId] = leaderId;

    if leader ~= nil then
      local followNpcs = Role.GetFollowNpcs(leaderId);
      for k, v in pairs(followNpcs) do
        v:Teleport(leader.position);
        v:SetVisible(ERoleVisible.Hide);
      end

      local cartNpc = Role.cartNpcs[leaderId];
      if cartNpc ~= nil then
        cartNpc:Teleport(leader.position);
        cartNpc:SetVisible(ERoleVisible.Hide);
      end

      leader:UpdateViewTeam();
    end
  end

  this.members[roleId] = leaderId;

  if Role.players[roleId] ~= nil then
    if leader ~= nil then
      Role.players[roleId]:Teleport(leader.position);
      Role.players[roleId]:UpdateSpeed(leader.speed);
    end

    local followNpcs = Role.GetFollowNpcs(roleId);
    for k, v in pairs(followNpcs) do
      v:Teleport(Role.players[roleId].position);
      v:SetVisible(ERoleVisible.Hide);
    end

    local cartNpc = Role.cartNpcs[roleId];
    if cartNpc ~= nil then
      cartNpc:Teleport(Role.players[roleId].position);
      cartNpc:SetVisible(ERoleVisible.Hide);
    end

    Role.players[roleId]:UpdateViewTeam();
  end
end

function Team.EndOfLine5()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Team.EndOfLine6()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

local function RemoveMember(roleId)
  logWarn(string.Concat("RemoveMember ", roleId));
  this.members[roleId] = nil;

  if Role.players[roleId] ~= nil then
    local followNpcs = Role.GetFollowNpcs(roleId);
    for k, v in pairs(followNpcs) do
      v:Teleport(Role.players[roleId].position);
      v:SetVisible(ERoleVisible.Visible);
    end

    local cartNpc = Role.cartNpcs[roleId];
    if cartNpc ~= nil then
      cartNpc:Teleport(Role.players[roleId].position);
      cartNpc:SetVisible(ERoleVisible.Visible);
    end

    Role.players[roleId]:UpdateSpeed();
    Role.players[roleId]:UpdateViewTeam();
  end
end

local function RemoveLeader(roleId)
  this.leaders[roleId] = nil;

  for k, v in pairs(this.members) do
    if v == roleId then
      RemoveMember(k);
    end
  end
end

function Team.EndOfLine7()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Team.EndOfLine8()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Team.EndOfLine9()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Team.AddMember(leaderId, roleId, showMessage)
  leader = Role.players[leaderId];

  if leader == nil then return end

  role = Role.players[roleId];

  if role == nil then return end

  --實際加入隊伍
  AddMember(leaderId, roleId);

  Invitation.Check(EInvitation.Team);

  if UI.IsVisible(UITeam) then
    UITeam.UpdateUI();
  end

  if UI.IsVisible(UIMiniMap) then
    UIMiniMap.UpdateTeam();
  end

  for k, v in pairs(Role.players) do
    v:UpdateViewVisible();
  end

  if showMessage == false then return end

  if leader == this.GetLeader(Role.playerId) then
    Chat.AddMessage(EChannel.System, string.format(string.Get(20731), role.name));
    ShowCenterMessage(string.format(string.Get(20731), role.name));
  end
end

function Team.RemoveMember(roleId, showMessage)
  if this.members[roleId] == nil then return end

  local role = Role.players[roleId];
  if role == nil then return end

  local leader = Role.players[this.members[roleId]];
  if leader == nil then return end

  local myTeam = leader.index == this.members[Role.playerId];
  
  --離隊的人是否隊長
  if leader.index == roleId then
    --玩家的隊伍
    if myTeam and showMessage ~= false then
      ShowCenterMessage(string.Concat(role.name, string.Get(40092)));
      Chat.AddMessage(EChannel.System, string.Concat(role.name, string.Get(40092)));
    end

    --解散隊伍
    RemoveLeader(roleId);
  else
    --若是軍師則將設無軍師
    if this.leaders[leader.index] == roleId then
      this.leaders[leader.index] = 0;
    end

    --玩家的隊伍
    if myTeam and showMessage ~= false then
      ShowCenterMessage(string.Concat(role.name, string.Get(40093)));
      Chat.AddMessage(EChannel.System, string.Concat(role.name, string.Get(40093)));
    end

    --實際離開隊伍
    RemoveMember(roleId);

    --檢查是否只剩隊長一人
    local members = {};
    for k, v in pairs(this.members) do
      if v == leader.index then
        table.insert(members, k);
      end
    end

    --解散隊伍
    if table.maxn(members) <= 1 then
      RemoveLeader(leader.index);
    end
  end

  for k, v in pairs(Role.players) do
    v:UpdateViewVisible();
  end

  if UI.IsVisible(UITeam) then
    UITeam.UpdateUI();
  end

  if UI.IsVisible(UIMiniMap) then
    UIMiniMap.UpdateTeam();
  end
end

function Team.EndOfLine10()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Team.AddAdviser(roleId, showMessage)
  if this.members[roleId] == nil then return end

  this.leaders[this.members[roleId]] = roleId;

  if showMessage ~= false then
    if Role.players[roleId] ~= nil and this.GetLeader(roleId) == this.GetLeader(Role.playerId) then
      ShowCenterMessage(string.format(string.Get(20386), Role.players[roleId].name));
    end
  end

  local members = this.GetMember(roleId, true);
  for k, v in pairs(members) do
    v:UpdateViewTeam();
  end

  if UI.IsVisible(UITeam) then
    UITeam.UpdateUI();
  end

  if UI.IsVisible(UIMiniMap) then
    UIMiniMap.UpdateTeam();
  end
end

function Team.RemoveAdviser(roleId)
  if this.members[roleId] == nil then return end

  this.leaders[this.members[roleId]] = 0;

  local members = this.GetMember(roleId, true);
  for k, v in pairs(members) do
    v:UpdateViewTeam();
  end

  if UI.IsVisible(UITeam) then
    UITeam.UpdateUI();
  end

  if UI.IsVisible(UIMiniMap) then
    UIMiniMap.UpdateTeam();
  end
end

function Team.IsLeader(roleId)
  return this.leaders[roleId] ~= nil;
end

function Team.EndOfLine11()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Team.EndOfLine12()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Team.EndOfLine13()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Team.IsMember(roleId)
  return this.members[roleId] ~= nil;
end

function Team.IsAlone(roleId)
  return this.leaders[roleId] == nil and this.members[roleId] == nil;
end

function Team.IsAdviser(roleId)
  if this.members[roleId] == nil then return false end

  return this.leaders[this.members[roleId]] == roleId;
end

function Team.GetLeader(roleId)
  if this.members[roleId] ~= nil then
    return Role.players[this.members[roleId]];
  else
    return Role.players[roleId];
  end
end

function Team.GetAdviser(roleId)
  if this.members[roleId] == nil then return nil end
  
  return Role.players[this.leaders[this.members[roleId]]];
end

function Team.GetTeamState(roleId)
  if this.IsAlone(roleId) then
    return ETeamState.None;
  else
    if this.IsLeader(roleId) then
      return ETeamState.Leader;
    elseif this.IsAdviser(roleId) then
      return ETeamState.Adviser;
    else
      return ETeamState.TeamMembers;
    end 
  end
end

--[[
And Isaac answering said, But I have made him your master, and have given him all his brothers for servants; I have made him strong with grain and wine: what then am I to do for you, my son?
And Esau said to his father, Is that the only blessing you have, my father? give a blessing to me, even me! And Esau was overcome with weeping.
Then Isaac his father made answer and said to him, Far from the fertile places of the earth, and far from the dew of heaven on high will your living-place be:
By your sword will you get your living and you will be your brother's servant; but when your power is increased his yoke will be broken from off your neck.
So Esau was full of hate for Jacob because of his father's blessing; and he said in his heart, The days of weeping for my father are near; then I will put my brother Jacob to death.
Then Rebekah, hearing what Esau had said, sent for Jacob, her younger son, and said to him, It seems that your brother Esau is purposing to put you to death.
So now, my son, do what I say: go quickly to Haran, to my brother Laban;
And be there with him for a little time, till your brother's wrath is turned away;
Till the memory of what you have done to him is past and he is no longer angry: then I will send word for you to come back; are the two of you to be taken from me in one day?
Then Rebekah said to Isaac, My life is a weariness to me because of the daughters of Heth: if Jacob takes a wife from among the daughters of Heth, such as these, the women of this land, of what use will my life be to me?
--]]

function Team.GetMember(roleId, includeSelf)
  local result = {};
  if this.members[roleId] ~= nil then
    local leaderId = this.members[roleId];
    for k, v in pairs(this.members) do
      if v == leaderId then
        if k ~= roleId or includeSelf then
          if Role.players[k] ~= nil then
            table.insert(result, Role.players[k]);
          end
        end
      end
    end
  else
    if includeSelf and Role.players[roleId] ~= nil then
      table.insert(result, Role.players[roleId]);
    end
  end

  return result;
end

function Team.EndOfLine131()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Team.EndOfLine132()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end
