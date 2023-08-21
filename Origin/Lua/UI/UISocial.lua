EUISocialTag = {
  Friend = 1,
  Invitation = 2,
  Black = 3,
}

UISocial = {}
local this = UISocial;

this.name = "UISocial";
this.uiController = nil;

local transform_FrameRect;

local text_Name;
local text_Count;

local scrollContent_Friend;
local scrollItems_Friend = {};

local  image_ReceiveAll;
local  event_ReceiveAll;
local  image_SendAll;
local  event_SendAll;

local event_Search;

--var
local currentTag = EUISocialTag.Friend;
local mainTag;

local datas = {};
local tagDatas = {};

function UISocial.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  this.uiController.onVisible = this.OnVisible;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;

  text_Name = uiController:FindText("Text_Name");
  text_Count = uiController:FindText("Text_Count");

  scrollContent_Friend = uiController:FindScrollContent("ScrollContent_Friend");
  scrollContent_Friend.onInitialize = this.OnInitialize_ScrollContent_Friend;
  scrollContent_Friend.onItemChange = this.OnItemChange_ScrollContent_Friend;
  scrollContent_Friend:Initialize(1);
  
  image_ReceiveAll = uiController:FindGameObject("Image_ReceiveAll"):GetComponent("Image");
  event_ReceiveAll= uiController:FindEvent("Image_ReceiveAll");
  event_ReceiveAll:SetListener(EventTriggerType.PointerClick, this.OnClick_ReceiveAll);
  image_SendAll = uiController:FindGameObject("Image_SendAll"):GetComponent("Image");
  event_SendAll= uiController:FindEvent("Image_SendAll");
  event_SendAll:SetListener(EventTriggerType.PointerClick, this.OnClick_SendAll);
  
  event_Search = uiController:FindEvent("Image_Search");
  event_Search:SetListener(EventTriggerType.PointerClick, this.OnClick_Search);

  --tag
  tagDatas[1] = { string.Get(10180), nil };
  tagDatas[2] = { string.Get(10181), nil };
  tagDatas[3] = { string.Get(10183), nil };
end

function UISocial.OnOpen(kind, options)
  currentTag = EUISocialTag.Friend;

  return true;
end

function UISocial.OnClose()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if UI.IsVisible(UIAlert) then
    UI.Close(UIAlert);
  end

  if UI.IsVisible(UISocialFunction) then
    UI.Close(UISocialFunction);
  end
end

function UISocial.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(20740), this.OnClick_Close, this.OnClick_Help, this.OnClick_Tag, tagDatas, currentTag, 1, this.CheckRedDot);

    this.UpdateUI(false);
  end
end

function UISocial.UpdateUI(refresh)
  table.Clear(datas);
  
  text_Count.text = "";
  if currentTag == EUISocialTag.Friend then
    RedDot.Remove(ERedDot.FriendAdd);
    RedDot.Remove(ERedDot.FriendGift);
    
    if not image_ReceiveAll.gameObject.activeSelf then
      image_ReceiveAll.gameObject:SetActive(true);
    end
    if not image_SendAll.gameObject.activeSelf then
      image_SendAll.gameObject:SetActive(true);
    end
    
    if Social.CheckCanReceiveGift() then
      image_ReceiveAll.sprite = UI.GetSprite("but167D");
    else
      image_ReceiveAll.sprite = UI.GetSprite("but153D");
    end
    
    if Social.CheckCanSendGift() then
      event_SendAll:SetColor(Color.White);
    else
      event_SendAll:SetColor(Color.LightGray);
      --3----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        DemoCode.SetColorNum(10);
        local area =  DemoCode.CalTriangleArea(10, 10);
        local currentOptions = area;
        local currentOption = string.Get(80098);
      end
      --4-----------------------------------------------------
    end
    
    for roleId in pairs(Social.friends) do
      table.insert(datas, roleId);
    end

    text_Count.text = string.Concat(table.Count(datas), "/", Social.maxFriend);
    
    table.sort(datas,
      function(a, b)
        if Social.friends[a].online and not Social.friends[b].online then
          return true;
        elseif not Social.friends[a].online and Social.friends[b].online then
          return false;
        else
          return a < b;
        end
      end
    );
  
  elseif currentTag == EUISocialTag.Black then
    for roleId in pairs(Social.blacks) do
      table.insert(datas, roleId);
    end
  end
  
  --非好友介面關閉一鍵收送禮按鈕
  if currentTag ~= EUISocialTag.Friend then
    if image_ReceiveAll.gameObject.activeSelf then
      image_ReceiveAll.gameObject:SetActive(false);
    end
    if image_SendAll.gameObject.activeSelf then
      image_SendAll.gameObject:SetActive(false);
    end
  end
  
  if refresh ~= false then
    scrollContent_Friend:Refresh(table.maxn(datas));
  else
    scrollContent_Friend:Reset(table.maxn(datas));
  end
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
end

function UISocial.CheckRedDot(mTag, subTag)
  if mainTag == mTag then
    return false;
  else
    mainTag = mTag;
  end
  
  if mainTag == EUISocialTag.Friend then
    return RedDot.Check(ERedDot.FriendAdd, ERedDot.FriendGift);
  elseif mainTag == EUISocialTag.Invitation then
    return RedDot.Check(ERedDot.FriendInvitation);
  end

  return false;
end

function UISocial.OnClick_Close()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  
  UI.Close(UISocial);

  return true;
end

function UISocial.OnClick_Help(checkShow)
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if checkShow ~= true then
    UI.Open(UITutorialHint, 20, this);
  end

  return true;
end

function UISocial.OnClick_Tag(tag)
  if tag == EUISocialTag.Invitation then
    UI.Open(UIInvitation, true, EInvitation.Social);
    return false;
  end

  currentTag = tag;

  this.UpdateUI(false);

  return true;
end

function UISocial.OnClick_Search()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  ShowNameInput(string.Get(20502),
    function(name)
      if name == nil then return end

      --C:014-009 <查詢玩家資訊> +玩家ID(8) +L(1) +名字(L)
      sendBuffer:Clear();
      sendBuffer:WriteInt64(0);
      sendBuffer:WriteStringWithByteL(name);
      Network.Send(14, 9, sendBuffer);
    end
  );
end

function UISocial.OnClick_Friend(uiEvent)
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  
  local playerInfo = uiEvent.parameter;

  UI.Open(UISocialFunction, playerInfo, ConvertPositionToUIScene(this.uiController.transform, uiEvent.eventData.position, this.uiController.canvas.worldCamera));
end

function UISocial.OnClick_Receive(uiEvent)
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  
  local playerInfo = uiEvent.parameter;

  if playerInfo.friendFlag == nil then return end
  
  if RoleCount.Get(ERoleCount.FriendGiftReceive) >= Social.maxGiftReceive then
    ShowCenterMessage(string.Get(10195));
    return;
  end

  if not CheckFlag(playerInfo.friendFlag, 2) then
    ShowCenterMessage(string.Get(20512));
    return;
  end

  if CheckFlag(playerInfo.friendFlag, 3) then
    ShowCenterMessage(string.Get(20511));
    return;
  end

  --C:014-008 <好友收禮> +玩家ID(8)
  sendBuffer:Clear();
  sendBuffer:WriteInt64(playerInfo.roleId);
  Network.Send(14, 8, sendBuffer);
end

function UISocial.OnClick_Send(uiEvent)
  local playerInfo = uiEvent.parameter;

  if playerInfo.friendFlag == nil then return end
  
  if RoleCount.Get(ERoleCount.FriendGiftSend) >= Social.maxGiftSend then
    ShowCenterMessage(string.Get(10194));
    return;
  end

  if CheckFlag(playerInfo.friendFlag, 1) then
    ShowCenterMessage(string.Get(20513));
    return;
  end
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --C:014-007 <好友送禮> +玩家ID(8)
  sendBuffer:Clear();
  sendBuffer:WriteInt64(playerInfo.roleId);
  Network.Send(14, 7, sendBuffer);
  
  ShowCenterMessage(string.Get(20510));
end

function UISocial.OnClick_SendAll()
  --禮物發送已達最大數量
  if RoleCount.Get(ERoleCount.FriendGiftSend) >= Social.maxGiftSend then
    ShowCenterMessage(string.Get(10194));
    return;
  end
  
  --沒有可以送禮的人
  if not Social.CheckCanSendGift() then
    ShowCenterMessage(string.Get(23567));
    return;
  end
  Social.SendAllGift();
  ShowCenterMessage(string.Get(20510));
end

function UISocial.OnClick_ReceiveAll()
  --禮物收取已達最大數量
  if RoleCount.Get(ERoleCount.FriendGiftReceive) >= Social.maxGiftReceive then
    ShowCenterMessage(string.Get(10195));
    return;
  end
  
  --沒有禮物可收取
  if not Social.CheckCanReceiveGift() then
    ShowCenterMessage(string.Get(20512));
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    return;
  end
  Social.ReceiveAllGift();
  ShowCenterMessage(string.Get(20511));
end

function UISocial.OnInitialize_ScrollContent_Friend(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Friend[itemIndex] = {};
    scrollItems_Friend[itemIndex].event_BG = scrollItems[itemIndex]:GetComponent("UIEvent");
    scrollItems_Friend[itemIndex].event_BG:SetListener(EventTriggerType.PointerClick, this.OnClick_Friend);

    scrollItems_Friend[itemIndex].text_Level = scrollItems[itemIndex]:Find("Text_Level"):GetComponent("Text");
    scrollItems_Friend[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_Friend[itemIndex].text_Friendly = scrollItems[itemIndex]:Find("Text_Friendly"):GetComponent("Text");

    scrollItems_Friend[itemIndex].uiCareer = UICareerController.New(scrollItems[itemIndex]:Find("Career"));

    scrollItems_Friend[itemIndex].slider_Friendly = scrollItems[itemIndex]:Find("Slider_Friendly"):GetComponent("Slider");
    scrollItems_Friend[itemIndex].slider_Friendly.maxValue = Social.maxFriendly;
    
    scrollItems_Friend[itemIndex].image_LoginLight = scrollItems[itemIndex]:Find("Image_Login"):Find("Image_LoginMask"):Find("Image_LoginLight"):GetComponent("Image");
  

    scrollItems_Friend[itemIndex].image_Receive = scrollItems[itemIndex]:Find("Image_Receive"):GetComponent("Image");
    scrollItems_Friend[itemIndex].event_Receive = scrollItems[itemIndex]:Find("Image_Receive"):GetComponent("UIEvent");
    scrollItems_Friend[itemIndex].event_Receive:SetListener(EventTriggerType.PointerClick, this.OnClick_Receive);
    scrollItems_Friend[itemIndex].event_Send = scrollItems[itemIndex]:Find("Image_Send"):GetComponent("UIEvent");
    scrollItems_Friend[itemIndex].event_Send:SetListener(EventTriggerType.PointerClick, this.OnClick_Send);

    scrollItems_Friend[itemIndex].image_RedDot = scrollItems[itemIndex]:Find("Image_Dot"):GetComponent("Image");
    scrollItems_Friend[itemIndex].image_RedDot.gameObject:SetActive(false);
  end
end

function UISocial.OnItemChange_ScrollContent_Friend(dataIndex, itemIndex)
  local roleId = datas[dataIndex + 1];

  if roleId == nil then return false end

  local playerInfo = nil;

  if currentTag == EUISocialTag.Friend then
    playerInfo = Social.friends[roleId];
    if playerInfo == nil then return false end

    scrollItems_Friend[itemIndex].text_Level.text = playerInfo.level;
    scrollItems_Friend[itemIndex].text_Level.gameObject:SetActive(true);

    if playerInfo.online then
      scrollItems_Friend[itemIndex].image_LoginLight.sprite = UI.GetSprite("server_2");
    else
      scrollItems_Friend[itemIndex].image_LoginLight.sprite = UI.GetSprite("server_1");
    end

    scrollItems_Friend[itemIndex].uiCareer:SetCareer(playerInfo.turn, playerInfo.element, playerInfo.career, false, playerInfo.turn3Info.element);

    scrollItems_Friend[itemIndex].text_Friendly.text = string.Concat(string.Get(20158), ":", playerInfo.friendly);
    scrollItems_Friend[itemIndex].slider_Friendly.value = playerInfo.friendly;

    if playerInfo.friendFlag == nil or RoleCount.Get(ERoleCount.FriendGiftReceive) >= Social.maxGiftReceive or not CheckFlag(playerInfo.friendFlag, 2) or CheckFlag(playerInfo.friendFlag, 3) then
      scrollItems_Friend[itemIndex].image_Receive.sprite = UI.GetSprite("but153D");
    else
      scrollItems_Friend[itemIndex].image_Receive.sprite = UI.GetSprite("but167D");
    end

    if playerInfo.friendFlag == nil or RoleCount.Get(ERoleCount.FriendGiftSend) >= Social.maxGiftSend or CheckFlag(playerInfo.friendFlag, 1) then
      scrollItems_Friend[itemIndex].event_Send:SetColor(Color.LightGray);
    else
      scrollItems_Friend[itemIndex].event_Send:SetColor(Color.White);
      --3----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        DemoCode.SetColorNum(10);
        local area =  DemoCode.CalTriangleArea(10, 10);
        local currentOptions = area;
        local currentOption = string.Get(80098);
      end
      --4-----------------------------------------------------
    end

  elseif currentTag == EUISocialTag.Black then
    playerInfo = Social.blacks[roleId];
    if playerInfo == nil then return false end

    scrollItems_Friend[itemIndex].text_Level.gameObject:SetActive(false);
    scrollItems_Friend[itemIndex].image_LoginLight.sprite = UI.GetSprite("server_1");
    scrollItems_Friend[itemIndex].uiCareer:SetCareer();

    scrollItems_Friend[itemIndex].text_Friendly.text = string.Concat(string.Get(20158), ":0");
    scrollItems_Friend[itemIndex].slider_Friendly.value = 0;

    scrollItems_Friend[itemIndex].image_Receive.sprite = UI.GetSprite("but153D");
    scrollItems_Friend[itemIndex].event_Send:SetColor(Color.LightGray);
  end

  scrollItems_Friend[itemIndex].text_Name.text = playerInfo.name;

  scrollItems_Friend[itemIndex].event_BG.parameter = playerInfo;
  scrollItems_Friend[itemIndex].event_Receive.parameter = playerInfo;
  scrollItems_Friend[itemIndex].event_Send.parameter = playerInfo;

  if currentTag == EUISocialTag.Friend and Social.CheckTurnStatus(playerInfo.level, playerInfo.turn) and not Social.IsBlack(roleId) then
    scrollItems_Friend[itemIndex].image_RedDot.gameObject:SetActive(Social.CheckVisitedFriendRedDot(playerInfo));
  else
    scrollItems_Friend[itemIndex].image_RedDot.gameObject:SetActive(false);
  end

  if Social.CheckCanReceiveGift() then
    image_ReceiveAll.sprite = UI.GetSprite("but167D");
  else
    image_ReceiveAll.sprite = UI.GetSprite("but153D");
  end
  
  if Social.CheckCanSendGift() then
    event_SendAll:SetColor(Color.White);
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
  else
    event_SendAll:SetColor(Color.LightGray);
  end
  
  return true;
end

