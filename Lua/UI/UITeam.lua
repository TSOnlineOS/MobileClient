EUITeamTag = {
  Team = 1,
  Cart = 2,
  FindTeam = 3,
  FindPlayer = 4,
  FightTeam = 5,
}

UITeam = {}
local this = UITeam;

this.name = "UITeam";
this.uiController = nil;

--ui
local transform_FrameRect;

local gameObject_Team;
local gameObject_List;

local text_PlayerName;
local text_PlayerHp;
local text_PlayerLv;
local text_LeaveTeam;
local text_TeamTitle;

local followNpcs = {};
local teamMembers = {};

local image_PlayerState;
local image_LeaveTeam;

local uiCareer_Player;

--list
local text_Empty;

local scrollContent_List;
local scrollItems_List = {};

--var
local tagOffset = 0;
local currentTag = EUITeamTag.Team;
local tagDatas = {};
local datas = {};
local exchangeFollowIndex = 0;
local exchangeCartIndex = 0;

function UITeam.Initialize(go)
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  this.uiController.onVisible = this.OnVisible;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;

  gameObject_Team = uiController:FindGameObject("Team");
  gameObject_List = uiController:FindGameObject("List");

  local tempObject;
  local tempEvent;
  
  tempObject = uiController:FindGameObject("Image_FollowNpcBG");
  for i = 1, Role.maxFollowNpc do
    local child = tempObject.transform:Find(string.Concat("Image_FollowNpc (", i, ")"));
    
    followNpcs[i] = {};
    followNpcs[i].text_Name = child:Find("Text_Name"):GetComponent("Text");
    followNpcs[i].text_Hp = child:Find("Text_Hp"):GetComponent("Text");
    followNpcs[i].text_Lv = child:Find("Text_Lv"):GetComponent("Text");
    followNpcs[i].uiCareer = UICareerController.New(child:Find("Career"));

    followNpcs[i].image_State = followNpcs[i].text_Lv.transform:Find("Image_State"):GetComponent("Image");

    followNpcs[i].text_State = child:Find("Image_SwitchState"):Find("Text_State"):GetComponent("Text");
    followNpcs[i].event_State = child:Find("Image_SwitchState"):GetComponent("UIEvent");
    followNpcs[i].event_State:SetListener(EventTriggerType.PointerClick, this.OnClick_FollowNpcState);

    followNpcs[i].image_Kick = child:Find("Image_Kick"):GetComponent("Image");
    followNpcs[i].text_Kick = followNpcs[i].image_Kick.transform:Find("Text_Kick"):GetComponent("Text");
    followNpcs[i].event_Kick = child:Find("Image_Kick"):GetComponent("UIEvent");
    followNpcs[i].event_Kick:SetListener(EventTriggerType.PointerClick, this.OnClick_FollowNpcKick);

    followNpcs[i].event_Edit = followNpcs[i].text_Name.transform:Find("Image_Edit"):GetComponent("UIEvent");
    followNpcs[i].event_Edit:SetListener(EventTriggerType.PointerClick, this.OnClick_FollowNpcEdit);
    followNpcs[i].event_Edit.parameter = i;
  end

  tempObject = uiController:FindGameObject("Image_TeamBG");
  for i = 1, 4 do
    local child = tempObject.transform:Find(string.Concat("Image_Team (", i, ")"));

    teamMembers[i] = {};
    teamMembers[i].text_Name = child:Find("Text_Name"):GetComponent("Text");
    teamMembers[i].text_Hp = child:Find("Text_Hp"):GetComponent("Text");
    teamMembers[i].text_Lv = child:Find("Text_Lv"):GetComponent("Text");
    teamMembers[i].uiCareer = UICareerController.New(child:Find("Career"));
    teamMembers[i].image_Empty = child:Find("Image_Empty"):GetComponent("Image");

    teamMembers[i].image_State = teamMembers[i].text_Name.transform:Find("Image_State"):GetComponent("Image");
    --teamMembers[i].text_State = child:Find("Image_State"):Find("Text_State"):GetComponent("Text");
    
    teamMembers[i].text_Up = child:Find("Image_Up"):Find("Text_Up"):GetComponent("Text");
    teamMembers[i].event_Up = child:Find("Image_Up"):GetComponent("UIEvent");
    teamMembers[i].event_Up:SetListener(EventTriggerType.PointerClick, this.OnClick_TeamUp);

    teamMembers[i].image_Down = child:Find("Image_Down"):GetComponent("Image");
    teamMembers[i].text_Down = teamMembers[i].image_Down.transform:Find("Text_Down"):GetComponent("Text");
    teamMembers[i].event_Down = child:Find("Image_Down"):GetComponent("UIEvent");
    teamMembers[i].event_Down:SetListener(EventTriggerType.PointerClick, this.OnClick_TeamDown);
  end

  text_PlayerName = uiController:FindText("Text_PlayerName");
  text_PlayerHp = uiController:FindText("Text_PlayerHp");
  text_PlayerLv = uiController:FindText("Text_PlayerLv");
  text_LeaveTeam = uiController:FindText("Text_LeaveTeam");
  text_TeamTitle = uiController:FindText("Text_TeamTitle");

  image_PlayerState = uiController:FindImage("Image_PlayerState");
  image_LeaveTeam = uiController:FindImage("Image_LeaveTeam");

  uiCareer_Player = UICareerController.New(uiController:FindGameObject("GameObject_PlayerCareer"));

  tempEvent = uiController:FindEvent("Image_LeaveTeam");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_LeaveTeam);

  text_Empty = uiController:FindText("Text_Empty");

  scrollContent_List = uiController:FindScrollContent("ScrollContent_List");
  scrollContent_List.onInitialize = this.OnInitialize_ScrollContent_List;
  scrollContent_List.onItemChange = this.OnItemChange_ScrollContent_List;
  scrollContent_List:Initialize(1);
end

function UITeam.OnOpen(tag)
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  if tag ~= nil then
    currentTag = tag;
  else
    currentTag = EUITeamTag.Team;
  end

  return true;
end

function UITeam.OnClose()
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if UI.IsVisible(UIAlert) then
    UI.Close(UIAlert);
  end
end

function UITeam.OnVisible(visible)
  if visible then
    table.Clear(tagDatas);
    if Cart.GetCartSize() > 0 then
      tagDatas[1] = { string.Get(20371), nil };
      tagDatas[2] = { string.Get(22491), nil };
      tagDatas[3] = { string.Get(21022), nil };
      tagDatas[4] = { string.Get(21023), nil };
    else
      tagDatas[1] = { string.Get(20371), nil };
      tagDatas[2] = { string.Get(21022), nil };
      tagDatas[3] = { string.Get(21023), nil };
    end

    tagOffset = 0;
    if currentTag == EUITeamTag.FightTeam then
      tagOffset = EUITeamTag.FightTeam - EUITeamTag.Team;
    end
    
    UIFrame.Active(transform_FrameRect, string.Get(20371), this.OnClick_Close, nil, this.OnClick_Tag, tagDatas, currentTag - tagOffset);

    this.UpdateUI();
  end
end

function UITeam.UpdateUI(refresh)
  exchangeFollowIndex = 0;
  exchangeCartIndex = 0;

  gameObject_Team:SetActive(Contains(currentTag, EUITeamTag.Team, EUITeamTag.Cart, EUITeamTag.FightTeam));
  gameObject_List:SetActive(Contains(currentTag, EUITeamTag.FindTeam, EUITeamTag.FindPlayer));

  this.UpdatePlayer();
  this.UpdateFollowNpc();
  this.UpdateTeam();
  this.UpdateList(refresh);
end

function UITeam.UpdatePlayer()
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if not Contains(currentTag, EUITeamTag.Team, EUITeamTag.Cart, EUITeamTag.FightTeam) then return end

  if currentTag == EUITeamTag.Cart then
    text_PlayerName.transform.parent.gameObject:SetActive(false);
  else
    text_PlayerName.transform.parent.gameObject:SetActive(true);

    uiCareer_Player:SetCareer(Role.player:GetAttribute(EAttribute.Turn), Role.player:GetAttribute(EAttribute.Element), Role.player:GetAttribute(EAttribute.Career), false, Role.player:GetAttribute(EAttribute.Turn3Element));
    text_PlayerName.text = Role.player.name;
    text_PlayerHp.text = string.Concat(Role.player:GetAttribute(EAttribute.Hp), " / ", Role.player:GetAttribute(EAttribute.MaxHp));
    text_PlayerLv.text = Role.player:GetAttribute(EAttribute.Lv);
  end
end

function UITeam.UpdateFollowNpc()
  if not Contains(currentTag, EUITeamTag.Team, EUITeamTag.Cart, EUITeamTag.FightTeam) then return end
  
  for i = 1, Role.maxFollowNpc do
    local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, i);
    if followNpc ~= nil then
      if followNpc.data.canGrow == 0 then
        followNpcs[i].text_Name.text = string.GetColorText(followNpc.name, Color.Orange);
      elseif followNpc.data.canGrow == 2 then
        followNpcs[i].text_Name.text = string.GetColorText(followNpc.name, Color.MissionNPC);
      else
        followNpcs[i].text_Name.text = followNpc.name;
      end

      if followNpc.data.isRetire then
        followNpcs[i].text_Hp.text = string.Concat("0 / ", followNpc:GetAttribute(EAttribute.MaxHp));
      else
        followNpcs[i].text_Hp.text = string.Concat(followNpc:GetAttribute(EAttribute.Hp), " / ", followNpc:GetAttribute(EAttribute.MaxHp));
      end

      followNpcs[i].text_Hp.gameObject:SetActive(true);
      followNpcs[i].text_Lv.text = followNpc:GetAttribute(EAttribute.Lv);
      followNpcs[i].text_Lv.gameObject:SetActive(true);

      followNpcs[i].uiCareer:SetCareer(followNpc:GetAttribute(EAttribute.Turn), followNpc:GetAttribute(EAttribute.Element), followNpc:GetAttribute(EAttribute.Career), true);

      if followNpc.data.isRetire then
        followNpcs[i].image_State.gameObject:SetActive(true);
        followNpcs[i].text_State.text = string.Get(21384);
      elseif followNpc == Role.fightNpc then
        followNpcs[i].image_State.gameObject:SetActive(true);
        followNpcs[i].text_State.text = string.Get(50317);
      else
        followNpcs[i].image_State.gameObject:SetActive(false);
        followNpcs[i].text_State.text = string.Get(50316);
      end

      if currentTag == EUITeamTag.Cart then
        followNpcs[i].event_State.gameObject:SetActive(false);
        followNpcs[i].event_State.parameter = nil;
  
        followNpcs[i].event_Kick.gameObject:SetActive(true);
        followNpcs[i].event_Kick.parameter = followNpc;
        if i == exchangeFollowIndex then
          followNpcs[i].image_Kick.sprite = UI.GetSprite("but167D");
          followNpcs[i].text_Kick.text = string.Get(21669);
        else
          followNpcs[i].image_Kick.sprite = UI.GetSprite("but065D");
          followNpcs[i].text_Kick.text = string.Get(30023);
        end
      else
        followNpcs[i].event_State.gameObject:SetActive(followNpc.data.canGrow > 0);
        followNpcs[i].event_State.parameter = followNpc;
  
        followNpcs[i].event_Kick.gameObject:SetActive(true);
        followNpcs[i].event_Kick.parameter = followNpc;
        followNpcs[i].image_Kick.sprite = UI.GetSprite("but065D");
        followNpcs[i].text_Kick.text = string.Get(50320);
      end

      followNpcs[i].event_Edit.gameObject:SetActive(followNpc.data.canGrow > 0);
    else
      followNpcs[i].text_Name.text = "";
      followNpcs[i].text_Hp.gameObject:SetActive(false);
      followNpcs[i].text_Lv.gameObject:SetActive(false);

      followNpcs[i].uiCareer:SetCareer();

      followNpcs[i].event_State.gameObject:SetActive(false);
      followNpcs[i].event_State.parameter = nil;

      followNpcs[i].event_Kick.gameObject:SetActive(false);
      followNpcs[i].event_Kick.parameter = nil;

      followNpcs[i].event_Edit.gameObject:SetActive(false);
    end
  end
end

function UITeam.UpdateTeam()
  if not Contains(currentTag, EUITeamTag.Team, EUITeamTag.Cart, EUITeamTag.FightTeam) then return end

  if currentTag == EUITeamTag.Cart then
    text_TeamTitle.text = string.Get(22491);
    image_PlayerState.gameObject:SetActive(false);
  
    ---2--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local area =  DemoCode.CalTriangleArea(100, 100)
      area = area * 1 + 2;
      if area > DemoCode.GetBitxor(20) then  --test avg
        local avg = DemoCode.CalAvg(10, 20, 30);
      end
    end
    --3----------------------------------------------------

    for i = 1, 4 do
      local followNpc = nil;
      if i <= Cart.GetCartSize() then
        followNpc = Cart.followNpcs[i];
      end
      
      if followNpc ~= nil and npcDatas[followNpc.npcId] ~= nil then
        teamMembers[i].text_Name.text = followNpc.name;
        teamMembers[i].text_Hp.text = string.Concat(followNpc.hp, " / ", followNpc.hp);
        teamMembers[i].text_Hp.gameObject:SetActive(true);
        teamMembers[i].text_Lv.text = followNpc.Lv;
        teamMembers[i].text_Lv.gameObject:SetActive(true);
        teamMembers[i].uiCareer:SetCareer(npcDatas[followNpc.npcId].turn, npcDatas[followNpc.npcId].element, ECareer.None, true);
        teamMembers[i].image_Empty.enabled = false;

        teamMembers[i].image_State.gameObject:SetActive(false);
        --teamMembers[i].text_State.text = "";

        teamMembers[i].event_Up.gameObject:SetActive(false);
        teamMembers[i].event_Up.parameter = i;

        teamMembers[i].event_Down.gameObject:SetActive(true);
        teamMembers[i].event_Down.parameter = i;
        if i == exchangeCartIndex then
          teamMembers[i].image_Down.sprite = UI.GetSprite("but167D");
          teamMembers[i].text_Down.text = string.Get(21669);
        else
          teamMembers[i].image_Down.sprite = UI.GetSprite("but064D");
          teamMembers[i].text_Down.text = string.Get(30022);
        end
      else
        teamMembers[i].text_Name.text = "";
        teamMembers[i].text_Hp.gameObject:SetActive(false);
        teamMembers[i].text_Lv.gameObject:SetActive(false);

        teamMembers[i].uiCareer:SetCareer();

        if i <= Cart.GetCartSize() then
          teamMembers[i].image_Empty.sprite = UI.GetSprite("com089");
        else
          teamMembers[i].image_Empty.sprite = UI.GetSprite("bod008");
        end
        teamMembers[i].image_Empty.enabled = true;
        teamMembers[i].image_State.gameObject:SetActive(false);
        --teamMembers[i].text_State.text = "";

        teamMembers[i].event_Up.gameObject:SetActive(false);
        teamMembers[i].event_Up.parameter = nil;

        teamMembers[i].event_Down.gameObject:SetActive(false);
        teamMembers[i].event_Down.parameter = nil;
      end
    end
  else
    text_TeamTitle.text = string.Get(20282);

    if Team.IsLeader(Role.playerId) then
      image_PlayerState.gameObject:SetActive(true);
      image_PlayerState.sprite = UI.GetTeamStateSprite(ETeamState.Leader);
    elseif Team.IsAdviser(Role.playerId) then
      image_PlayerState.gameObject:SetActive(true);
      image_PlayerState.sprite = UI.GetTeamStateSprite(ETeamState.Adviser);
    else
      image_PlayerState.gameObject:SetActive(false);
    end
  
    ---2--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local area =  DemoCode.CalTriangleArea(100, 100)
      area = area * 1 + 2;
      if area > DemoCode.GetBitxor(20) then  --test avg
        local avg = DemoCode.CalAvg(10, 20, 30);
      end
    end
    --3----------------------------------------------------

    local members = Team.GetMember(Role.playerId);
    local isLeader = Team.IsLeader(Role.playerId);

    for k, v in pairs(members) do
      if v.index == Role.playerId then
        table.remove(members, k);
        break;
      end
    end

    if table.maxn(members) > 0 then
      image_LeaveTeam.gameObject:SetActive(true);

      if isLeader then
        text_LeaveTeam.text = string.Get(40092);
      else
        text_LeaveTeam.text = string.Get(40093);
      end
    else
      image_LeaveTeam.gameObject:SetActive(false);

      text_LeaveTeam.text = string.Get(40093);
    end

    for i = 1, 4 do
      if members[i] ~= nil then
        teamMembers[i].text_Name.text = members[i].name;
        teamMembers[i].text_Hp.text = string.Concat(members[i]:GetAttribute(EAttribute.Hp), " / ", members[i]:GetAttribute(EAttribute.MaxHp));
        teamMembers[i].text_Hp.gameObject:SetActive(true);
        teamMembers[i].text_Lv.text = members[i]:GetAttribute(EAttribute.Lv);
        teamMembers[i].text_Lv.gameObject:SetActive(true);
        teamMembers[i].uiCareer:SetCareer(members[i]:GetAttribute(EAttribute.Turn), members[i]:GetAttribute(EAttribute.Element), members[i]:GetAttribute(EAttribute.Career), false, members[i]:GetAttribute(EAttribute.Turn3Element));
        teamMembers[i].image_Empty.enabled = false;

        if Team.IsLeader(members[i].index) then
          teamMembers[i].image_State.gameObject:SetActive(true);
          teamMembers[i].image_State.sprite = UI.GetTeamStateSprite(ETeamState.Leader);
          --teamMembers[i].text_State.text = string.Get(50344);

          teamMembers[i].event_Up.gameObject:SetActive(false);
          teamMembers[i].event_Up.parameter = nil;

          teamMembers[i].event_Down.gameObject:SetActive(false);
          teamMembers[i].event_Down.parameter = nil;

        elseif Team.IsAdviser(members[i].index) then
          teamMembers[i].image_State.gameObject:SetActive(true);
          teamMembers[i].image_State.sprite = UI.GetTeamStateSprite(ETeamState.Adviser);

          teamMembers[i].event_Up.gameObject:SetActive(isLeader);
          teamMembers[i].event_Up.parameter = members[i];
          teamMembers[i].text_Up.text = string.Get(20117);

          teamMembers[i].event_Down.gameObject:SetActive(isLeader);
          teamMembers[i].event_Down.parameter = members[i];
          teamMembers[i].text_Down.text = string.Get(20118);
          
        else
          teamMembers[i].image_State.gameObject:SetActive(false);
          --teamMembers[i].text_State.text = string.Get(50318);

          teamMembers[i].event_Up.gameObject:SetActive(isLeader);
          teamMembers[i].event_Up.parameter = members[i];
          teamMembers[i].text_Up.text = string.Get(20116);

          teamMembers[i].event_Down.gameObject:SetActive(isLeader);
          teamMembers[i].event_Down.parameter = members[i];
          teamMembers[i].image_Down.sprite = UI.GetSprite("but064D");
          teamMembers[i].text_Down.text = string.Get(10120);
        end
      else
        teamMembers[i].text_Name.text = "";
        teamMembers[i].text_Hp.gameObject:SetActive(false);
        teamMembers[i].text_Lv.gameObject:SetActive(false);

        teamMembers[i].uiCareer:SetCareer();

        teamMembers[i].image_Empty.sprite = UI.GetSprite("com089");
        teamMembers[i].image_Empty.enabled = true;
        teamMembers[i].image_State.gameObject:SetActive(false);
        --teamMembers[i].text_State.text = "";

        teamMembers[i].event_Up.gameObject:SetActive(false);
        teamMembers[i].event_Up.parameter = nil;

        teamMembers[i].event_Down.gameObject:SetActive(false);
        teamMembers[i].event_Down.parameter = nil;
      end
    end
  end
end

function UITeam.UpdateList(refresh)
  if not Contains(currentTag, EUITeamTag.FindTeam, EUITeamTag.FindPlayer) then return end

  table.Clear(datas);
  if currentTag == EUITeamTag.FindTeam then
    ---2--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local area =  DemoCode.CalTriangleArea(100, 100)
      area = area * 1 + 2;
      if area > DemoCode.GetBitxor(20) then  --test avg
        local avg = DemoCode.CalAvg(10, 20, 30);
      end
    end
    --3----------------------------------------------------
    for k, v in pairs(Role.players) do
      if v ~= Role.player then
        if Team.IsLeader(k) then
          if v.data.sceneId == SceneManager.sceneId and v.data.instanceId == SceneManager.instanceId then
            table.insert(datas, v);
          end
        end
      end
    end

    if table.maxn(datas) == 0 then
      text_Empty.text = string.Get(21105);
    else
      text_Empty.text = "";
    end

  elseif currentTag == EUITeamTag.FindPlayer then
    ---2--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local area =  DemoCode.CalTriangleArea(100, 100)
      area = area * 1 + 2;
      if area > DemoCode.GetBitxor(20) then  --test avg
        local avg = DemoCode.CalAvg(10, 20, 30);
      end
    end
    --3----------------------------------------------------
    for k, v in pairs(Role.players) do
      if v ~= Role.player then
        if Team.IsAlone(k) then
          if v.data.sceneId == SceneManager.sceneId and v.data.instanceId == SceneManager.instanceId then
            table.insert(datas, v);
          end
        end
      end
    end

    if table.maxn(datas) == 0 then
      text_Empty.text = string.Get(21106);
    else
      text_Empty.text = "";
    end
  end

  if refresh ~= false then
    scrollContent_List:Refresh(table.maxn(datas));
  else
    scrollContent_List:Reset(table.maxn(datas));
  end
end

function UITeam.IsCurrentTag(tag)
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  return currentTag == tag;
end

function UITeam.OnClick_Close()
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  UI.Close(UITeam);

  return true;
end

function UITeam.OnClick_Tag(tag)
  if Contains(currentTag, EUITeamTag.FightTeam) then return false end

  if Cart.GetCartSize() == 0 then
    if tag >= EUITeamTag.Cart then
      tag = tag + 1;
    end
  end

  currentTag = tag + tagOffset;
  
  this.UpdateUI();

  return true;
end

function UITeam.OnClick_FollowNpcEdit(uiEvent)
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end
  
  local editIndex = uiEvent.parameter;
  local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, editIndex);

  if followNpc == nil then return end
  if npcDatas[followNpc.npcId] == nil then return end

  ShowNameInput(string.Get(98035),
    function(text)
      if string.IsNullOrEmpty(text) then return end
      
      if Define.IsInternal() then
        if not UIDebug.RecordMode then
          if npcDatas[followNpc.npcId].name ~= string.Concat(text, followNpc.npcId) and not string.CheckName(text) then return end
        end
      else
        if npcDatas[followNpc.npcId].name ~= text and not string.CheckName(text) then return end
      end

      --C:015-006 <跟隨武將改名> +索引(1) +名字(?)
      sendBuffer:Clear();
      sendBuffer:WriteByte(editIndex);
      sendBuffer:WriteString(text);
      Network.Send(15, 6, sendBuffer);
    end,
    5
  );
end

function UITeam.OnClick_FollowNpcState(uiEvent)
  if uiEvent.parameter == nil then return end
  
  if uiEvent.parameter.isDead then
    ShowCenterMessage(string.Get(60032));
    return;
  end

  if uiEvent.parameter.data.isRetire then
    ShowCenterMessage(string.Get(71312));
    return;
  end
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------

  if Role.player.war ~= EWar.None and not FightField.IsCanControl() then
    return;
  end
  
  if uiEvent.parameter == Role.fightNpc then
    --C:019-002 <出戰武將收回>
    Network.Send(19, 2);
  else
    if uiEvent.parameter.data.beenRide then
      ShowCenterMessage(string.Get(50073));
      return;
    end

    --C:019-001 <跟隨武將出戰> +NPCID(2)
    sendBuffer:Clear()
    sendBuffer:WriteUInt16(uiEvent.parameter.npcId);
    Network.Send(19, 1, sendBuffer);
    ---2--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local area =  DemoCode.CalTriangleArea(100, 100)
      area = area * 1 + 2;
      if area > DemoCode.GetBitxor(20) then  --test avg
        local avg = DemoCode.CalAvg(10, 20, 30);
      end
    end
    --3----------------------------------------------------
  end
end

function UITeam.OnClick_FollowNpcKick(uiEvent)
  local followNpc = uiEvent.parameter;
  if followNpc == nil then return end

  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(40277));
    return;
  end

  if followNpc.isDead then
    ShowCenterMessage(string.Get(60033));
    return;
  end

  if followNpc.data.beenRide then
    ShowCenterMessage(string.Get(50074));
    return;
  end
  
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------

  if followNpc.npcId == Role.rebornNpcId then
    if Role.rebornKind == 1 then
      ShowCenterMessage(string.Get(21188));
    elseif Role.rebornKind == 2 then
      ShowCenterMessage(string.Get(71291));
    end
    
    return;
  end

  if currentTag == EUITeamTag.Cart then
    if exchangeCartIndex ~= 0 then
      exchangeFollowIndex = followNpc.index;

      --C:015-012 <交換武將> +跟隨索引(1) +馬車索引(1)
      sendBuffer:Clear();
      sendBuffer:WriteByte(exchangeFollowIndex);
      sendBuffer:WriteByte(exchangeCartIndex);
      Network.Send(15, 12, sendBuffer);
    else
      local isFull = true;
      for i = 1, Cart.GetCartSize() do
        if Cart.followNpcs[i] == nil or npcDatas[Cart.followNpcs[i].npcId] == nil then
          isFull = false;
          break;
        end
      end

      if isFull then
        exchangeFollowIndex = followNpc.index;
        this.UpdateFollowNpc();
      else
        --C:015-010 <武將存入馬車> +索引(1)
        sendBuffer:Clear();
        sendBuffer:WriteByte(followNpc.index);
        Network.Send(15, 10, sendBuffer);
      end
    end
    
  else
    if UISoul.GetEquipNpc(followNpc.npcId) ~= nil then
      ShowCenterMessage(string.Get(23794));
      return;
    end
  
    ---2--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local area =  DemoCode.CalTriangleArea(100, 100)
      area = area * 1 + 2;
      if area > DemoCode.GetBitxor(20) then  --test avg
        local avg = DemoCode.CalAvg(10, 20, 30);
      end
    end
    --3----------------------------------------------------
    ShowCheckMessage(
      function(result)
        if result then
          if Role.player.war ~= EWar.None then
            ShowCenterMessage(string.Get(40277));
            return;
          end
  
          local haveEquip = false;
          for i = EItemFitType.Equip_Head, EItemFitType.Equip_Spec do
            if Item.GetBagItem(EThings.Equip, i, followNpc.index) ~= nil then
              haveEquip = true;
              break;
            end
          end
  
          local checkMessage;
          if haveEquip then
            ShowCheckMessage(
              function(result)
                if result then
                  if Role.player.war ~= EWar.None then
                    ShowCenterMessage(string.Get(40277));
                    return;
                  end
          
                  --C:015-002 <跟隨武將放逐> +索引(1)
                  sendBuffer:Clear()
                  sendBuffer:WriteByte(followNpc.index);
                  Network.Send(15, 2, sendBuffer);
                end
              end,
              string.Get(10083),
              followNpc
            );
          else
            --C:015-002 <跟隨武將放逐> +索引(1)
            sendBuffer:Clear()
            sendBuffer:WriteByte(followNpc.index);
            Network.Send(15, 2, sendBuffer);
          end
        end
      end,
      string.Get(20372),
      followNpc
    );
  end
end

function UITeam.OnClick_TeamUp(uiEvent)
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end
  
  if uiEvent.parameter == nil then return end
  if not Team.IsLeader(Role.playerId) then return end

  if Team.IsAdviser(uiEvent.parameter.index) then
    --C:013-009 <換隊長> +玩家ID(8)
    sendBuffer:Clear()
    sendBuffer:WriteInt64(uiEvent.parameter.index);
    Network.Send(13, 9, sendBuffer);
  else
    --C:013-005 <設定軍師> +玩家ID(8)
    sendBuffer:Clear()
    sendBuffer:WriteInt64(uiEvent.parameter.index);
    Network.Send(13, 5, sendBuffer);
  end
end

function UITeam.OnClick_TeamDown(uiEvent)
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end
  
  if currentTag == EUITeamTag.Cart then
    if exchangeFollowIndex ~= 0 then
      exchangeCartIndex = uiEvent.parameter;

      --C:015-012 <交換武將> +跟隨索引(1) +馬車索引(1)
      sendBuffer:Clear();
      sendBuffer:WriteByte(exchangeFollowIndex);
      sendBuffer:WriteByte(exchangeCartIndex);
      Network.Send(15, 12, sendBuffer);
    else
      local isFull = true;
      for i = 1, Role.maxFollowNpc do
        if Role.GetRole(EHuman.FollowNpc, Role.playerId, i) == nil then
          isFull = false;
          break;
        end
      end

      if isFull then
        exchangeCartIndex = uiEvent.parameter;
        this.UpdateTeam();
      else
        --C:015-011 <武將領出馬車> +索引(1)
        sendBuffer:Clear();
        sendBuffer:WriteByte(uiEvent.parameter);
        Network.Send(15, 11, sendBuffer);
      end
    end

  else
    if uiEvent.parameter == nil then return end
    if not Team.IsLeader(Role.playerId) then return end
    
    if Team.IsAdviser(uiEvent.parameter.index) then
      --C:013-006 <取消軍師> +玩家ID(8)
      sendBuffer:Clear()
      sendBuffer:WriteInt64(uiEvent.parameter.index);
      Network.Send(13, 6, sendBuffer);
    else
      --C:013-010 <踼隊員> +玩家ID(8)
      sendBuffer:Clear()
      sendBuffer:WriteInt64(uiEvent.parameter.index);
      Network.Send(13, 10, sendBuffer);
    end
  end
end

function UITeam.OnClick_LeaveTeam(uiEvent)
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end
  
  Team.Leave();
end

function UITeam.OnClick_List(uiEvent)
  if uiEvent.parameter == nil then return end

  Team.Invite(uiEvent.parameter);
end

function UITeam.OnInitialize_ScrollContent_List(scrollItems)
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_List[itemIndex] = {};

    local tempTransform = scrollItems[itemIndex]:Find("Layout"):Find("Leader");
    scrollItems_List[itemIndex].leader = {};
    scrollItems_List[itemIndex].leader.gameObject = tempTransform.gameObject;
    scrollItems_List[itemIndex].leader.image_State = tempTransform:Find("Image_State"):GetComponent("Image");
    scrollItems_List[itemIndex].leader.text_Name = tempTransform:Find("Text_Name"):GetComponent("Text");
    scrollItems_List[itemIndex].leader.uiCareer = UICareerController.New(tempTransform:Find("Career"));
    scrollItems_List[itemIndex].leader.text_Level = tempTransform:Find("Text_Level"):GetComponent("Text");

    tempTransform = scrollItems[itemIndex]:Find("Layout"):Find("Adviser");
    scrollItems_List[itemIndex].adviser = {};
    scrollItems_List[itemIndex].adviser.gameObject = tempTransform.gameObject;
    scrollItems_List[itemIndex].adviser.image_State = tempTransform:Find("Image_State"):GetComponent("Image");
    scrollItems_List[itemIndex].adviser.text_Name = tempTransform:Find("Text_Name"):GetComponent("Text");
    scrollItems_List[itemIndex].adviser.uiCareer = UICareerController.New(tempTransform:Find("Career"));
    scrollItems_List[itemIndex].adviser.text_Level = tempTransform:Find("Text_Level"):GetComponent("Text");

    scrollItems_List[itemIndex].slider_Slot = scrollItems[itemIndex]:Find("Slider_Slot"):GetComponent("Slider");
    scrollItems_List[itemIndex].slider_Slot.maxValue = Team.maxMember;

    scrollItems_List[itemIndex].text_Slot = scrollItems[itemIndex]:Find("Text_Slot"):GetComponent("Text");

    scrollItems_List[itemIndex].event_Invite = scrollItems[itemIndex]:Find("Image_Invite"):GetComponent("UIEvent");
    scrollItems_List[itemIndex].event_Invite:SetListener(EventTriggerType.PointerClick, this.OnClick_List);

    scrollItems_List[itemIndex].text_Invite = scrollItems_List[itemIndex].event_Invite.transform:Find("Text_Invite"):GetComponent("Text");
  end
end

function UITeam.OnItemChange_ScrollContent_List(dataIndex, itemIndex)
  local role = datas[dataIndex + 1];

  if role == nil then return false end

  if currentTag == EUITeamTag.FindTeam then
    scrollItems_List[itemIndex].adviser.gameObject:SetActive(true);

    scrollItems_List[itemIndex].leader.image_State.gameObject:SetActive(true);

    scrollItems_List[itemIndex].leader.text_Name.text = role.name;
    scrollItems_List[itemIndex].leader.uiCareer:SetCareer(role:GetAttribute(EAttribute.Turn), role:GetAttribute(EAttribute.Element), role:GetAttribute(EAttribute.Career), false, role:GetAttribute(EAttribute.Turn3Element));
    scrollItems_List[itemIndex].leader.text_Level.text = role:GetAttribute(EAttribute.Lv);

    local adviser = Team.GetAdviser(role.index);

    if adviser ~= nil then
      scrollItems_List[itemIndex].adviser.gameObject:SetActive(true);
      scrollItems_List[itemIndex].adviser.text_Name.text = adviser.name;
      scrollItems_List[itemIndex].adviser.uiCareer:SetCareer(adviser:GetAttribute(EAttribute.Turn), adviser:GetAttribute(EAttribute.Element), role:GetAttribute(EAttribute.Career), false, role:GetAttribute(EAttribute.Turn3Element));
      scrollItems_List[itemIndex].adviser.text_Level.text = adviser:GetAttribute(EAttribute.Lv);
    else
      scrollItems_List[itemIndex].adviser.gameObject:SetActive(false);
    end
  
    local memberCount = table.maxn(Team.GetMember(role.index, true));
    scrollItems_List[itemIndex].text_Slot.text = string.Concat(memberCount, "/", Team.maxMember);
    scrollItems_List[itemIndex].slider_Slot.value = memberCount;
    scrollItems_List[itemIndex].slider_Slot.gameObject:SetActive(true);

    scrollItems_List[itemIndex].text_Invite.text = string.Get(10130);

    if Team.IsAlone(Role.playerId) then
      scrollItems_List[itemIndex].event_Invite:SetColor(Color.White);
      scrollItems_List[itemIndex].event_Invite.parameter = role;
    else
      scrollItems_List[itemIndex].event_Invite:SetColor(Color.Gray);
      scrollItems_List[itemIndex].event_Invite.parameter = nil;
    end

  elseif currentTag == EUITeamTag.FindPlayer then
    scrollItems_List[itemIndex].adviser.gameObject:SetActive(false);

    scrollItems_List[itemIndex].leader.image_State.gameObject:SetActive(false);

    scrollItems_List[itemIndex].leader.text_Name.text = role.name;
    scrollItems_List[itemIndex].leader.uiCareer:SetCareer(role:GetAttribute(EAttribute.Turn), role:GetAttribute(EAttribute.Element), role:GetAttribute(EAttribute.Career), false, role:GetAttribute(EAttribute.Turn3Element));
    scrollItems_List[itemIndex].leader.text_Level.text = role:GetAttribute(EAttribute.Lv);

    scrollItems_List[itemIndex].text_Slot.text = "";
    scrollItems_List[itemIndex].slider_Slot.gameObject:SetActive(false);

    scrollItems_List[itemIndex].text_Invite.text = string.Get(10129);

    if Team.IsAlone(Role.playerId) or Team.IsLeader(Role.playerId) then
      scrollItems_List[itemIndex].event_Invite:SetColor(Color.White);
      scrollItems_List[itemIndex].event_Invite.parameter = role;
    else
      scrollItems_List[itemIndex].event_Invite:SetColor(Color.Gray);
      scrollItems_List[itemIndex].event_Invite.parameter = nil;
    end
  end
  
  return true;
end
