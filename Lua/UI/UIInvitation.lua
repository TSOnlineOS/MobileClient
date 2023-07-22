
UIInvitation = {}
local this = UIInvitation;

this.name = "UIInvitation";
this.uiController = nil;

--ui
local scrollContent_Invitation;
local scrollItems_Invitation = {};

local event_RejectAll;
local event_AgreeAll;

--var
local checkFilter = false;
local filter = nil;
local datas = {};

function UIInvitation.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  
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

  scrollContent_Invitation = uiController:FindScrollContent("ScrollContent_Team");
  scrollContent_Invitation.onInitialize = this.OnInitialize_ScrollContent_Invitation;
  scrollContent_Invitation.onItemChange = this.OnItemChange_ScrollContent_Invitation;
  scrollContent_Invitation:Initialize(1);

  local tempEvent;

  event_RejectAll = uiController:FindEvent("Image_RefuseAll");
  event_RejectAll:SetListener(EventTriggerType.PointerClick, this.OnClick_RejectAll);

  event_AgreeAll = uiController:FindEvent("Image_AgreeAll");
  event_AgreeAll:SetListener(EventTriggerType.PointerClick, this.OnClick_AgreeAll);

  tempEvent = uiController:FindEvent("Image_Mask");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);
end

function UIInvitation.OnOpen(showAgreeAll, ...)
  filter = {...};
  checkFilter = table.Count(filter) > 0;

  event_AgreeAll.gameObject:SetActive(showAgreeAll or false);

  return this.UpdateUI(true);
end

function UIInvitation.UpdateUI(reset)
  table.Clear(datas);
  
  for kk, invitationKind in pairs(EInvitation) do
    if not checkFilter or table.Contains(filter, invitationKind) then
      for k, v in pairs(Invitation.invitations[invitationKind]) do
        table.insert(datas, v);
      end
    end
  end

  table.sort(datas,
    function(a, b)
      if a.kind ~= b.kind then
        return a.kind > b.kind;
      else
        return DateTime.Compare(a.time, b.time) > 0;
      end
    end
  );

  if reset == true then
    scrollContent_Invitation:Reset(table.maxn(datas));
  else
    scrollContent_Invitation:Refresh(table.maxn(datas));
  end
  
  if table.maxn(datas) <= 0 then
    if reset == true then
      ShowCenterMessage(string.Get(10296));
    end

    return false;
  end

  return true;
end

function UIInvitation.OnClick_Close()
  RedDot.Remove(ERedDot.FriendInvitation);
  RedDot.Remove(ERedDot.TeamInvitation);
  RedDot.Remove(ERedDot.DungeonInvitation);
  RedDot.Remove(ERedDot.OrgInvitation);
  RedDot.Remove(ERedDot.OrgMemberInvitation);
  
  UI.Close(UIInvitation);
end

function UIInvitation.OnClick_RejectAll()
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end
  
  for kk, invitationKind in pairs(EInvitation) do
    if not checkFilter or table.Contains(filter, invitationKind) then
      for roleId in pairs(Invitation.invitations[invitationKind]) do
        Invitation.Reply(invitationKind, roleId, false, false);
      end
    end
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

  this.UpdateUI();
end

function UIInvitation.OnClick_AgreeAll()
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end

  if not checkFilter or table.Contains(filter, EInvitation.Friend) then
    for roleId in pairs(Invitation.invitations[EInvitation.Friend]) do
      Invitation.Reply(EInvitation.Friend, roleId, true, false);
    end
  end
  
  if not checkFilter or table.Contains(filter, EInvitation.Team) then
    --no agree all
  end

  if not checkFilter or table.Contains(filter, EInvitation.Dungeon) then
    --no agree all
  
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

  if not checkFilter or table.Contains(filter, EInvitation.OrgMember) then
    for roleId in pairs(Invitation.invitations[EInvitation.OrgMember]) do
      Invitation.Reply(EInvitation.OrgMember, roleId, true, false);
    end
  end

  this.UpdateUI();
end

function UIInvitation.OnClick_Reject(uiEvent)
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end

  local invitationInfo = uiEvent.parameter;

  Invitation.Reply(invitationInfo.kind, invitationInfo.roleId, false);
end

function UIInvitation.OnClick_Agree(uiEvent)
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end

  local invitationInfo = uiEvent.parameter;

  Invitation.Reply(invitationInfo.kind, invitationInfo.roleId, true);
  
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

function UIInvitation.OnInitialize_ScrollContent_Invitation(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Invitation[itemIndex] = {};
    scrollItems_Invitation[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_Invitation[itemIndex].transform_Career = scrollItems_Invitation[itemIndex].text_Name.transform:Find("Career");
    scrollItems_Invitation[itemIndex].uiCareer = UICareerController.New(scrollItems_Invitation[itemIndex].transform_Career);
    scrollItems_Invitation[itemIndex].text_Level = scrollItems_Invitation[itemIndex].transform_Career:Find("Text_Level"):GetComponent("Text");
    
    scrollItems_Invitation[itemIndex].text_Info1 = scrollItems[itemIndex]:Find("Text_Info (1)"):GetComponent("Text");
    scrollItems_Invitation[itemIndex].text_Info2 = scrollItems_Invitation[itemIndex].text_Level.transform:Find("Text_Info (2)"):GetComponent("Text");
    scrollItems_Invitation[itemIndex].text_State = scrollItems[itemIndex]:Find("Text_State"):GetComponent("Text");

    scrollItems_Invitation[itemIndex].event_Reject = scrollItems[itemIndex]:Find("Image_Refuse"):GetComponent("UIEvent");
    scrollItems_Invitation[itemIndex].event_Reject:SetListener(EventTriggerType.PointerClick, this.OnClick_Reject);

    scrollItems_Invitation[itemIndex].event_Agree = scrollItems[itemIndex]:Find("Image_Agree"):GetComponent("UIEvent");
    scrollItems_Invitation[itemIndex].event_Agree:SetListener(EventTriggerType.PointerClick, this.OnClick_Agree);
  end
end

function UIInvitation.OnItemChange_ScrollContent_Invitation(dataIndex, itemIndex)
  local invitationInfo = datas[dataIndex + 1];
  
  if invitationInfo == nil then return false end

  scrollItems_Invitation[itemIndex].transform_Career.sizeDelta = Vector2.zero;
  scrollItems_Invitation[itemIndex].uiCareer:SetCareer();

  scrollItems_Invitation[itemIndex].text_Level.text = "";
  scrollItems_Invitation[itemIndex].text_Name.text = "";

  scrollItems_Invitation[itemIndex].text_Info1.text = "";
  scrollItems_Invitation[itemIndex].text_Info2.text = "";

  scrollItems_Invitation[itemIndex].text_State.text = "";

  if invitationInfo.kind == EInvitation.Friend then
    scrollItems_Invitation[itemIndex].transform_Career.sizeDelta = Vector2.one * 64;
    scrollItems_Invitation[itemIndex].uiCareer:SetCareer(invitationInfo.turn, invitationInfo.element, invitationInfo.career, false, invitationInfo.turn3Element);

    scrollItems_Invitation[itemIndex].text_Level.text = invitationInfo.level;
    scrollItems_Invitation[itemIndex].text_Name.text = invitationInfo.name;

    scrollItems_Invitation[itemIndex].text_Info1.text = string.Get(20258);

  elseif invitationInfo.kind == EInvitation.Team then
    scrollItems_Invitation[itemIndex].transform_Career.sizeDelta = Vector2.one * 64;
    scrollItems_Invitation[itemIndex].uiCareer:SetCareer(invitationInfo.turn, invitationInfo.element, invitationInfo.career, false, invitationInfo.turn3Element);

    scrollItems_Invitation[itemIndex].text_Level.text = invitationInfo.level;
    scrollItems_Invitation[itemIndex].text_Name.text = invitationInfo.name;

    if invitationInfo.state == ETeamInvitation.Invite then
      scrollItems_Invitation[itemIndex].text_Info1.text = string.Get(10129);
    elseif invitationInfo.kind == ETeamInvitation.Join then
      scrollItems_Invitation[itemIndex].text_Info1.text = string.Get(10130);
    end

  elseif invitationInfo.kind == EInvitation.Dungeon then
    scrollItems_Invitation[itemIndex].transform_Career.sizeDelta = Vector2.one * 64;
    scrollItems_Invitation[itemIndex].uiCareer:SetCareer(invitationInfo.turn, invitationInfo.element, invitationInfo.career, false, invitationInfo.turn3Element);

    scrollItems_Invitation[itemIndex].text_Level.text = invitationInfo.level;
    scrollItems_Invitation[itemIndex].text_Name.text = invitationInfo.name;

    scrollItems_Invitation[itemIndex].text_Info1.text = string.Concat(string.Get(10131), Dungeon.GetName(invitationInfo.dungeonId));

  elseif invitationInfo.kind == EInvitation.OrgMember then
    scrollItems_Invitation[itemIndex].transform_Career.sizeDelta = Vector2.one * 64;
    scrollItems_Invitation[itemIndex].uiCareer:SetCareer(invitationInfo.turn, invitationInfo.element, invitationInfo.career, false, invitationInfo.turn3Element);

    scrollItems_Invitation[itemIndex].text_Level.text = invitationInfo.level;
    scrollItems_Invitation[itemIndex].text_Name.text = invitationInfo.name;

    scrollItems_Invitation[itemIndex].text_Info1.text = string.Get(20259);

  elseif invitationInfo.kind == EInvitation.Organization then
    scrollItems_Invitation[itemIndex].text_Level.text = invitationInfo.level;
    scrollItems_Invitation[itemIndex].text_Name.text = invitationInfo.name;

    scrollItems_Invitation[itemIndex].text_Info1.text = string.Concat(string.Get(20108), string.Get(20069));
    scrollItems_Invitation[itemIndex].uiCareer:SetCareer(invitationInfo.turn, invitationInfo.element, invitationInfo.career, false, invitationInfo.turn3Element);
    --scrollItems_Invitation[itemIndex].text_Info2.text = string.Concat(string.Get(10167), ":", invitationInfo.score);

    if armyArchitectureDatas[invitationInfo.level] ~= nil then
      scrollItems_Invitation[itemIndex].text_State.text = string.Concat(invitationInfo.memberCount, "/", armyArchitectureDatas[invitationInfo.level].buildings[1].maxMember);
    else
      scrollItems_Invitation[itemIndex].text_State.text = invitationInfo.memberCount;
    end
  end
  
  scrollItems_Invitation[itemIndex].event_Reject.parameter = invitationInfo;
  scrollItems_Invitation[itemIndex].event_Agree.parameter = invitationInfo;
  
  return true;
end