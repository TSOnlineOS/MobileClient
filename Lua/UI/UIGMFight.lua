UIGMFight = {};
local this = UIGMFight;

this.name = "UIGMFight";
this.uiController = nil;

local teamGroup = {};
local text_Viewer = nil;

local data_Team = {};
local data_Viewer = {};

local selectOption = {};
function UIGMFight.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;

  text_Viewer = this.uiController:FindText("Text_Viewer");
  local tempEvent = nil;
  tempEvent = uiController:FindEvent("Image_ViewAdd");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ViewAdd);

  tempEvent = uiController:FindEvent("Image_Close");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);

  tempEvent = uiController:FindEvent("Image_EnterFight");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_EnterFight);

  tempEvent = uiController:FindEvent("Image_ViewRemove");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ViewRemove);
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  
  for i = 0, 1 do --0左 1右
    teamGroup[i] = {};
    teamGroup[i].gameObect = uiController:FindGameObject(string.Concat("Image_TeamBG",i));
    teamGroup[i].event_Add = teamGroup[i].gameObect.transform:Find("Image_Add"):GetComponent("UIEvent")
    teamGroup[i].event_Add:SetListener(EventTriggerType.PointerClick, this.OnClick_Add);
    teamGroup[i].event_Add.parameter = i;

    teamGroup[i].event_Remove = teamGroup[i].gameObect.transform:Find("Image_Remove"):GetComponent("UIEvent")
    teamGroup[i].event_Remove:SetListener(EventTriggerType.PointerClick, this.OnClick_Remove);
    teamGroup[i].event_Remove.parameter = i;
    teamGroup[i].text_Teammate = teamGroup[i].gameObect.transform:Find("Text_Teammate"):GetComponent("Text")

    data_Team[i] = {};
  end  
end

function UIGMFight.OnOpen()
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  this.UpdateUI();
  return true;
end

function UIGMFight.OnClose()
end

function UIGMFight.UpdateUI()
  local str = nil;
  for i = 0, 1 do 
    if table.Count(data_Team[i]) > 0 then 
      teamGroup[i].event_Add.gameObject:SetActive(false);
      teamGroup[i].event_Remove.gameObject:SetActive(true);
      str = "";
      for k, v in pairs(data_Team[i])do 
        str = string.Concat(str, Role.players[v].name, "\n");
      end
      teamGroup[i].text_Teammate.text = str;
    else
      teamGroup[i].text_Teammate.text = "";
      teamGroup[i].event_Add.gameObject:SetActive(true);
      teamGroup[i].event_Remove.gameObject:SetActive(false);
    end
  end

  str = "";
  text_Viewer.text = "";
  for i = 1, #data_Viewer do 
    if data_Viewer[i] ~= nil then 
      if i % 2 == 0 then 
        str = string.Concat(str, Role.players[data_Viewer[i]].name, " ");
      else
        str = string.Concat(str, Role.players[data_Viewer[i]].name, "\n");
      end
    end
  end
  text_Viewer.text = str;
end

function UIGMFight.OnClick_Add(event)
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  local parameter = event.parameter;
  local teamLeaders = {};
  selectOption = {};
  for k, v in pairs(Team.leaders)do 
    local otherTeam = 0;
    if parameter == 0 then 
      otherTeam = 1;
    end
    local roleController = Role.players[k];    
    if not table.Contains(data_Team[otherTeam], k) and roleController.data.sceneId == SceneManager.sceneId then 
      table.insert(teamLeaders, roleController.name);
      table.insert(selectOption, k);
    end
  end
  if parameter == 0 then 
    ShowOptionMessage(this.SelectLLeaderCallback, "Select Leader", teamLeaders, nil, nil);
  else
    ShowOptionMessage(this.SelectRLeaderCallback, "Select Leader", teamLeaders, nil, nil);
  end
end

function UIGMFight.SelectLLeaderCallback(result)
  local leaderId = selectOption[result];
  data_Team[0] = {};
  table.insert(data_Team[0], leaderId);
  local members = Team.GetMember(leaderId, false);
  for k, v in pairs(members)do 
    table.insert(data_Team[0], v.index);
  end
  this.UpdateUI();
end

function UIGMFight.SelectRLeaderCallback(result)
  local leaderId = selectOption[result];
  data_Team[1] = {};
  table.insert(data_Team[1], leaderId);
  local members = Team.GetMember(leaderId, false);
  for k, v in pairs(members)do 
    table.insert(data_Team[1], v.index);
  end
  this.UpdateUI();
end

function UIGMFight.OnClick_ViewAdd(event)
  local playersName = {};
  selectOption = {};
  for k, v in pairs(Role.players)do 
    if not table.Contains(data_Team[0], k) and not table.Contains(data_Team[1], k) then 
      table.insert( playersName, v.name);
      table.insert( selectOption, k);
    end
  end
  ShowOptionMessage(this.SelectViewerCallBack, "Select Viewer", playersName, nil, nil);
end

function UIGMFight.SelectViewerCallBack(result)
  local viewer = selectOption[result];
  table.insert(data_Viewer, viewer);
  this.UpdateUI();
end

function UIGMFight.OnClick_Remove(event)
  local parameter = event.parameter;
  table.Clear(data_Team[parameter]);
  this.UpdateUI();
end

function UIGMFight.OnClick_EnterFight(event)
  if table.Count(data_Team[0]) <= 0 or table.Count(data_Team[1]) <= 0 then 
    return 
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  sendBuffer:Clear()
  sendBuffer:WriteInt64(data_Team[0][1]);
  sendBuffer:WriteInt64(data_Team[1][1]);
  local vierCount = table.Count(data_Viewer);
  sendBuffer:WriteByte(vierCount);
  for i = 1, vierCount do 
    sendBuffer:WriteInt64(data_Viewer[i]);
  end
  Network.Send(101, 1, sendBuffer);
end

function UIGMFight.OnClick_Close(event)
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  UI.Close(UIGMFight);
end

function UIGMFight.OnClick_ViewRemove(event)
  table.Clear(data_Viewer);
  this.UpdateUI();
end
