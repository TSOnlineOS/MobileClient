EUIDungeonTag = 
{
  Multiple = 1,
  Single = 2,
  Team = 3,
  WeekDungeon = 4,
  SoulDungeon = 5,
}

ENeedKindTag = 
{
  Area = 1,      --國家
  Elements = 2,  --屬性
  --Gender = 3,    --性別
  Rebirth = 3,   --轉生
  UseSkill = 4,  --使用技能
  NoSill = 5,    --禁用技能
  MaxRound = 6,  --回合數(上限)
  LimitRound = 7,--回合數(下限)
  SoulElement = 8,
  SoulLevelLarger = 9,
  SoulLevelSmaller = 10,
}

UIDungeon = {};
local this = UIDungeon;

this.name = "UIDungeon";
this.uiController = nil;

local transform_FrameRect;

--多人頁
local gameObject_MultipleRoot;
local scrollContent_Room;
local scrollItems_Room = {};
local rawImage_MBG;

local text_MName;
local text_MLv;
local text_MTime;
local text_MPeople;
local text_NeedPar1;
local text_NeedPar2;
local text_NeedTitle1;
local text_NeedTitle2;
local text_MReward_Title;

local event_MBuyCount;
local event_MJoin;
local event_MCreate;
local event_MRefresh;
local event_MBack;

local last_RefreshTime = 0;

local table_MBox = {};
local roomDatas = {};
--
--單人頁
local gameObject_SingleRoot;
local rawImage_SBG;

local text_SName;
local text_SLv;
local text_SPeople;
local text_STime;
local text_SCount;
local text_SInfo;

local event_SBuyCount;
local event_SJoin;
local event_SSkip;

local singleRewards = {};
local singleExtraRewrad = {};
--
--組隊頁
local gameObject_TeamRoot;
local gameObject_LeaderRoot;
local image_TeamOk;
local text_TeamOk;
local text_RoomName;
local text_TeamName;
local gameObject_changeName;
local roleSet = {};
local text_TeamPass;
local image_TeamPass;
local event_Kick;
local event_KickBg;

local gameObject_WeekDungeonRequire;
local text_NeedPar1_T;
local text_NeedPar2_T;

--百戰天關 靈魂挑戰
local gameObject_WeekRoot;
local rawImage_WeekDungeonBG;
local event_AllPassPrize;
local event_GetAllPassPrize;
local item_AllPassPrize;
local image_GetAllPassPrize;
local event_ToNext;
local event_ToBack;
local text_WeekName;

local nodeInfos = {};

local nowPagKind = EUIDungeonTag.Multiple;
local nowPag = 0;
--

--CountDown
local gameObject_CountdownMask;
local text_Countdown;
local countdown = 0;
local countdownStart = false;
--
local currentMainPage = 1;
local currentSubPage = 1;
local tagDatas = {};
local nowDungeonData = nil;
local weekPageMainData = nil;

function UIDungeon.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  this.uiController.onVisible = this.OnVisible;

  transform_FrameRect = uiController:FindGameObject("FrameRect"):GetComponent("RectTransform");
  gameObject_MultipleRoot = uiController:FindGameObject("MultipleRoot");

  text_MName = uiController:FindText("Text_T2_MName");
  text_MLv = uiController:FindText("Text_MLv");
  text_MTime = uiController:FindText("Text_MTime");  
  text_MPeople = uiController:FindText("Text_MPeople");
  text_NeedPar1 = uiController:FindText("Text_NeedPar1");
  text_NeedPar2 = uiController:FindText("Text_NeedPar2");
  text_NeedTitle1 = uiController:FindText("Text_T19_Share1");
  text_NeedTitle2 = uiController:FindText("Text_T19_Share2");
  text_MReward_Title = uiController:FindText("Text_T4_MReward");

  scrollContent_Room = uiController:FindScrollContent("ScrollContent_Room");
  scrollContent_Room.onInitialize = this.OnInitialize_scrollContent_Room;
  scrollContent_Room.onItemChange = this.OnItemChange_scrollContent_Room;
  scrollContent_Room:Initialize(1);

  event_MBuyCount = uiController:FindEvent("Image_MBuyCount");
  event_MBuyCount:SetListener(EventTriggerType.PointerClick, this.OnClickMBuyCount);
  
  event_MJoin = uiController:FindEvent("Image_MJoin");
  event_MJoin:SetListener(EventTriggerType.PointerClick, this.OnClickMJoin);

  event_MCreate = uiController:FindEvent("Image_MCreate");
  event_MCreate:SetListener(EventTriggerType.PointerClick, this.OnClickMCreate);

  event_MRefresh = uiController:FindEvent("Image_MRefresh"); 
  event_MRefresh:SetListener(EventTriggerType.PointerClick, this.OnClickMRefresh);

  event_MBack = uiController:FindEvent("Image_Back");
  event_MBack:SetListener(EventTriggerType.PointerClick, this.OnClickMBack);
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

  for i = 1, 3 do 
    local temp = {};
    temp.event = uiController:FindEvent(string.Concat("Image_MBox", i));
    temp.event:SetListener(EventTriggerType.PointerClick, this.OnClickMBox);
    temp.event.parameter = i;

    temp.item = UIItemController.New(temp.event.transform);

    temp.text = temp.event.transform:Find("Text_T4"):GetComponent("Text");
    table.insert( table_MBox, temp);
  end

  gameObject_SingleRoot = uiController:FindGameObject("SingleRoot");

  text_SName = uiController:FindText("Text_T2_SName");
  text_SLv = uiController:FindText("Text_SLv");  
  text_SPeople = uiController:FindText("Text_SPeople");
  text_STime = uiController:FindText("Text_STime");
  text_SCount = uiController:FindText("Text_SCount");
  text_SInfo = uiController:FindText("Text_SInfo");
  text_WeekName = uiController:FindText("Text_T2_WeekName");

  event_SBuyCount = uiController:FindEvent("Image_SBuyCount");
  event_SBuyCount:SetListener(EventTriggerType.PointerClick, this.OnClickSBuyCount);

  event_SJoin = uiController:FindEvent("Image_SJoin");
  event_SJoin:SetListener(EventTriggerType.PointerClick, this.OnClickSJoin);

  event_SSkip = uiController:FindEvent("Image_SSkip");
  event_SSkip:SetListener(EventTriggerType.PointerClick, this.OnClickSSkip);
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

  for i = 1, 2 do 
    local temp = {};
    temp.image = uiController:FindImage(string.Concat("Image_SReward", i));
    temp.event = temp.image.gameObject:GetComponent("UIEvent");
    temp.item = UIItemController.New(temp.image.transform);
    singleRewards[i] = temp;
  end

  singleExtraRewrad = {};
  singleExtraRewrad.image = uiController:FindImage("Image_ExtraReward");
  singleExtraRewrad.item = UIItemController.New(singleExtraRewrad.image.transform);
  singleExtraRewrad.infoText = uiController:FindText("Text_ExtraInfo");

  gameObject_TeamRoot = uiController:FindGameObject("TeamRoot");
  gameObject_LeaderRoot = uiController:FindGameObject("LeaderRoot");
  --百戰天關
  this.Initialize2(go);
  --
  local temp = nil;
  temp = uiController:FindEvent("Image_TeamOk");
  temp:SetListener(EventTriggerType.PointerClick, this.OnClickTeamOk);

  image_TeamOk = temp.gameObject:GetComponent("Image");
  text_TeamOk = temp.transform:Find("Text_").gameObject:GetComponent("Text");
  text_TeamName = uiController:FindText("Text_T1_TeamName");
  text_RoomName = uiController:FindText("Text_T2_RoomName");
  
  gameObject_WeekDungeonRequire = uiController:FindGameObject("WeekDungeonRequire"); 
  text_NeedPar1_T = uiController:FindText("Text_NeedPar1_T");
  text_NeedPar2_T = uiController:FindText("Text_NeedPar2_T");

  temp = uiController:FindEvent("Image_ChangeName");
  temp:SetListener(EventTriggerType.PointerClick, this.OnClickChangeName);
  gameObject_changeName = temp.gameObject;

  temp = uiController:FindEvent("Image_TeamExit");
  temp:SetListener(EventTriggerType.PointerClick, this.OnClickTeamExit);

  temp = uiController:FindEvent("Image_TeamPass");
  temp:SetListener(EventTriggerType.PointerClick, this.OnClickTeamPass);
  image_TeamPass = temp.gameObject:GetComponent("Image");
  text_TeamPass = temp.transform:Find("Text").gameObject:GetComponent("Text");

  event_Kick = uiController:FindEvent("Image_TeamKick");
  event_Kick:SetListener(EventTriggerType.PointerClick, this.OnClickTeamKick);
  event_KickBg = uiController:FindEvent("Image_KickBg");
  event_KickBg:SetListener(EventTriggerType.PointerClick, this.OnClickKickBg);
  
  event_KickBg.gameObject:SetActive(false);

  temp = uiController:FindEvent("Image_TeamRecruit");
  temp:SetListener(EventTriggerType.PointerClick, this.OnClickTeamRecruit);

  for i = 1, 5 do 
    temp = {};
    temp.gameObject = uiController:FindGameObject(string.Concat("Role", i));
    temp.gameObject_Add = temp.gameObject.transform:Find("Image_Add").gameObject;
    temp.event_Add = temp.gameObject_Add:GetComponent("UIEvent");
    temp.event_Add:SetListener(EventTriggerType.PointerClick, this.OnClickTeamAdd);
    temp.rawImage_BG = temp.gameObject.transform:Find("RawImage_BG").gameObject:GetComponent("RawImage");

    temp.root = temp.gameObject.transform:Find("Root");
    temp.jmpDrawer_Role = temp.root.transform:Find("GameObject_Role").transform:Find("RawImage_Role").gameObject:GetComponent("RawImage").gameObject:AddComponent(typeof(JmpDrawer));
    
    local roleEvent = temp.jmpDrawer_Role.gameObject:GetComponent("UIEvent");
    roleEvent:SetListener(EventTriggerType.PointerClick, this.OnClickTeamRole);
    roleEvent.parameter = i;

    temp.text_Name = temp.root.transform:Find("Text_Name").gameObject:GetComponent("Text");
    temp.text_Lv = temp.root.transform:Find("Text_LvRoot"):Find("Text_Lv").gameObject:GetComponent("Text");
    temp.gameObject_Prepare = temp.root.transform:Find("Image_Prepare").gameObject;

    roleSet[i] = temp;
  end  

  rawImage_SBG = uiController:FindRawImage("RawImage_SBG");
  rawImage_MBG = uiController:FindRawImage("RawImage_MBG");

  --countdown
  gameObject_CountdownMask = uiController:FindGameObject("Image_CountdownMask");
  text_Countdown = uiController:FindText("Text_Countdown");
  gameObject_CountdownMask:SetActive(false);
end

function UIDungeon.Initialize2(go)
  local uiController = go:GetComponent("UIController"); 
  --百戰天關 
  gameObject_WeekRoot = uiController:FindGameObject("WeekRoot");
  local gameObject_NodeRoot = uiController:FindGameObject("NodeRoot");

  rawImage_WeekDungeonBG = uiController:FindRawImage("RawImage_WeekDungeonBG");

  event_AllPassPrize = uiController:FindEvent("Image_AllPassPrize"); 
  event_AllPassPrize:SetListener(EventTriggerType.PointerClick, this.OnClick_AllPassPrize);

  item_AllPassPrize = UIItemController.New(event_AllPassPrize.transform);

  event_GetAllPassPrize = uiController:FindEvent("Image_GetAllPassPrize"); 
  event_GetAllPassPrize:SetListener(EventTriggerType.PointerClick, this.OnClick_GetAllPassPrize);

  image_GetAllPassPrize = event_GetAllPassPrize.gameObject:GetComponent("Image");
  
   
  event_ToNext = uiController:FindEvent("Image_ToNext");
  event_ToNext:SetListener(EventTriggerType.PointerClick, this.OnClick_ToNext);
  event_ToBack = uiController:FindEvent("Image_ToBack"); 
  event_ToBack:SetListener(EventTriggerType.PointerClick, this.OnClick_ToBack);
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
  


  for i = 1, Dungeon.maxWeekDungeonNode do
    local temp = {};
    temp.gameObject = gameObject_NodeRoot.transform:Find(string.Concat("BaseUIWeekDungeon", i)).gameObject;
    local tempTransform = temp.gameObject.transform;
    temp.image_Icon = tempTransform:GetComponent("Image");
    temp.gameObject_Complete = tempTransform:Find("NodeComple").gameObject;
    temp.NameText = tempTransform:Find("Text_Name"):GetComponent("Text");
    
    temp.event = tempTransform:GetComponent("UIEvent");
    temp.event:SetListener(EventTriggerType.PointerClick, this.OnClick_WeekNode);
    temp.event.parameter = i;

    nodeInfos[i] = temp;
  end
end

function UIDungeon.LoadUIPic()
  TextureManager.SetPng(ETextureUseType.UI, "common0_com075", rawImage_SBG);
  TextureManager.SetPng(ETextureUseType.UI, "common0_com075", rawImage_MBG); 
  TextureManager.SetPng(ETextureUseType.UI, "common0_bod127", rawImage_WeekDungeonBG);
  for i = 1, 5 do 
    TextureManager.SetPng(ETextureUseType.UI, "common0_com040", roleSet[i].rawImage_BG);
  end
end

function UIDungeon.ResetScrollContent()
  table.Clear(roomDatas);
  for k, v in pairs(Dungeon.dungeonRoomDatas)do
    if v.dungeonId == nowDungeonData.id then 
      table.insert(roomDatas, v);
    end
  end
  scrollContent_Room:Reset(table.maxn(roomDatas)); 
end

function UIDungeon.UpdateTags()
  Dungeon.InitAvailableDungeonDatas();

  table.Clear(tagDatas);
  local mainPageCount = Dungeon.GetMainPageCount();
  for i = 1, mainPageCount do
    local subPageCount = Dungeon.GetSubPageCount(i);

    tagDatas[i] = {};
    tagDatas[i][1] = Dungeon.GetMainTagName(i);

    tagDatas[i][2] = {};
    for j = 1, subPageCount do
      tagDatas[i][2][j] = Dungeon.GetSubTagName(i, j);
    end
  end
end

function UIDungeon.CheckRedDot(mainTag, subTag)
  if Dungeon.availableDungeonDatas[mainTag] == nil then 
    return false;
  end

  if subTag == nil then 
    for k,v in pairs(Dungeon.availableDungeonDatas[mainTag])do 
      if Dungeon.useableDungeons[v.id] ~= nil then 
        return true;
      end
    end
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    return false;
  else
    local data = Dungeon.availableDungeonDatas[mainTag][subTag];  
    if data == nil then 
      return false;
    end  
    return Dungeon.useableDungeons[data.id] ~= nil;
  end
end

function UIDungeon.OnInitialize_scrollContent_Room(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Room[itemIndex] = {};
    scrollItems_Room[itemIndex].image_Lock = scrollItems[itemIndex]:Find("Image_Lock");
    scrollItems_Room[itemIndex].name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_Room[itemIndex].member = scrollItems[itemIndex]:Find("Text_Member"):GetComponent("Text");

    scrollItems_Room[itemIndex].joinEvent = scrollItems[itemIndex]:Find("Image_JoinBG"):GetComponent("UIEvent");
    scrollItems_Room[itemIndex].joinEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_JoinTeam);
  end
end

function UIDungeon.OnItemChange_scrollContent_Room(dataIndex, itemIndex)
  local index = dataIndex+ 1 ;
  local roomData = roomDatas[index];  
  if roomData == nil then
    return false;
  end

  scrollItems_Room[itemIndex].image_Lock.gameObject:SetActive(roomData.isLock);
  scrollItems_Room[itemIndex].name.text = roomData.name;
  local MaxTeamPeopleCount = 5;
  if nowDungeonData ~= nil then
    MaxTeamPeopleCount = nowDungeonData.maxPlayer;
  end
  scrollItems_Room[itemIndex].member.text = string.Concat(string.Get(98063), roomData.peopleCount, "/"..MaxTeamPeopleCount);

  scrollItems_Room[itemIndex].joinEvent.parameter = index;
  return true;
end

function UIDungeon.Update()
  this.UpdateRole();
  this.UpdateCountdown();
end

function UIDungeon.OnOpen(mainPage, subPage, isInvite, isTeamPage)
  if Dungeon.availableDungeonDatas[4] ~= nil and Dungeon.availableDungeonDatas[4][1] ~= nil then
    mainPage = 4;  
    subPage = 1;
  end
  if mainPage == 0 or mainPage == nil then 
    mainPage = 1;  
  end
  if subPage == 0 or subPage == nil then
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
    
    subPage = 1;
  end
  this.LoadUIPic();
  this.UpdateTags();
  countdownStart = false;
  countdown = 0;
  currentMainPage = mainPage;
  currentSubPage = subPage;

  if isTeamPage == nil and table.Count(Dungeon.dungeonNowRoomPlayers) == 0 then
    this.OnClick_Tag(currentMainPage, currentSubPage);
  else
    this.UpdateTeamUI();
  end
  return true;
end

function UIDungeon.OnReturnToTags()
  transform_FrameRect.anchoredPosition = UI.tabUIPosition;
  transform_FrameRect.sizeDelta = UI.tabUISize;
  UIFrame.SetTab(tagDatas, 1, 1);

  this.UpdatePage(1, 1);
  UIFrame.SetCloseEvent(this.OnClick_Close);   
end

function UIDungeon.OnClose()
  if UI.IsVisible(UIAlert) then
    UI.Close(UIAlert);
  end
  
  for i = 1, 5 do 
    if roleSet[i] ~= nil then  
      roleSet[i].jmpDrawer_Role:Disable();
    end
  end

  return true;
end

function UIDungeon.OnVisible(visible)
  if visible then 
    if isTeamPage == nil and table.Count(Dungeon.dungeonNowRoomPlayers) == 0 then
      transform_FrameRect.anchoredPosition = UI.tabUIPosition;
      transform_FrameRect.sizeDelta = UI.tabUISize;
      UIFrame.Active(transform_FrameRect, string.Get(10118), this.OnClick_Close, nil, this.OnClick_Tag, tagDatas, currentMainPage, currentSubPage, this.CheckRedDot);  

      this.UpdatePage(currentMainPage, currentSubPage);
    else
      this.UpdateTeamUI();
    end
  end
end

function UIDungeon.OnClick_TeamClose()
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
  UI.Close(UIDungeon);
end

function UIDungeon.OnClick_Close()
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
  UI.Close(UIDungeon);
end

function UIDungeon.OnClick_Tag(mainTag, subTag)
  nowDungeonData = Dungeon.availableDungeonDatas[mainTag][subTag];
  if nowDungeonData.kind == 1 or nowDungeonData.kind == 4 then 
    nowPagKind = EUIDungeonTag.Multiple; --種類4依照種類1 已經說好了 不給改
  elseif nowDungeonData.kind == 2 then 
    nowPagKind = EUIDungeonTag.Single;
  elseif nowDungeonData.kind == 5 then
    nowPagKind = EUIDungeonTag.SoulDungeon;
  else
    nowPagKind = EUIDungeonTag.WeekDungeon; 
  end

  this.UpdatePage(mainTag, subTag);

  return true;
end

function UIDungeon.UpdatePage(mainTag, subTag)
  currentMainPage = mainTag;
  currentSubPage = subTag;

  if nowPagKind == EUIDungeonTag.WeekDungeon then
    weekPageMainData = weekDungeonDatas;
  elseif  nowPagKind == EUIDungeonTag.SoulDungeon then
    weekPageMainData = soulDungeonDatas;
    nowPag = 0;
  end

  if Dungeon.availableDungeonDatas[currentMainPage][1].kind == 3 or Dungeon.availableDungeonDatas[currentMainPage][1].kind == 5 then
    local WeekDataIdx = 0;
    WeekDataIdx = currentSubPage+ nowPag*Dungeon.maxWeekDungeonNode;
    nowDungeonData = Dungeon.GetData(weekPageMainData[WeekDataIdx]);
  else
    nowDungeonData = Dungeon.availableDungeonDatas[currentMainPage][currentSubPage];
  end

  if nowPagKind == EUIDungeonTag.Multiple then  --多人
    Dungeon.SendAskRoomData();
    this.UpdateMultipleInfo();
  elseif nowPagKind == EUIDungeonTag.Single then --單人
    this.UpdateSingleInfo();
  elseif nowPagKind == EUIDungeonTag.WeekDungeon or nowPagKind == EUIDungeonTag.SoulDungeon then
    this.UpdateWeekDungeonInfo(); --特殊副本(周副本)
  else
    this.UpdateSingleInfo();
  end
end

function UIDungeon.GetNeedParStr(requireData)
  if requireData == nil then
    return "";
  end
  local aStr = "";
  if requireData.kind == ENeedKindTag.Area then
    aStr = string.Get(22416);
    for i = 0, 4 do
      if requireData.parameter == i+1 then
        aStr = string.format(aStr, string.Get(10086+i));
        break;
      end
    end
  elseif requireData.kind == ENeedKindTag.Elements then
    aStr = string.Get(22415);
    for i = 0, 3 do
      if requireData.parameter == i+1 then
        aStr = string.format(aStr, string.Get(20002+i));
        break;
      end
    end
  elseif requireData.kind == ENeedKindTag.Gender then
    aStr = string.Get(22417);
    for i = 0, 1 do
      if requireData.parameter == i+1 then
        aStr = string.format(aStr, string.Get(20838+i));
        break;
      end
    end
  elseif requireData.kind == ENeedKindTag.Rebirth then
    aStr = string.format(string.Get(22418), requireData.parameter); 
  elseif requireData.kind == ENeedKindTag.UseSkill then
    local skillData = skillDatas[requireData.parameter];
    aStr = string.format(string.Get(22421), skillData.name);
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
    
  elseif requireData.kind == ENeedKindTag.NoSill then
    local skillData = skillDatas[requireData.parameter];
    aStr = string.format(string.Get(22422), skillData.name);
  elseif requireData.kind == ENeedKindTag.MaxRound then
    aStr = string.format(string.Get(22419), requireData.parameter);
  elseif requireData.kind == ENeedKindTag.LimitRound then
    aStr = string.format(string.Get(22420), requireData.parameter);
  elseif requireData.kind == ENeedKindTag.SoulElement then
    aStr = string.Get(24103);
    for i = 0, 3 do
      if requireData.parameter == i + 1 then
        aStr = string.format(aStr, string.Get(20002 + i));
        break;
      end
    end
  elseif requireData.kind == ENeedKindTag.SoulLevelLarger then
    aStr = string.format(string.Get(24104), requireData.parameter);
  elseif requireData.kind == ENeedKindTag.SoulLevelSmaller then
    aStr = string.format(string.Get(24105), requireData.parameter);
  end
  return aStr;
end

--WeekDungeon
function UIDungeon.UpdateWeekDungeonInfo()
  if not gameObject_WeekRoot.activeInHierarchy then 
    gameObject_MultipleRoot:SetActive(false);
    gameObject_SingleRoot:SetActive(false);
    gameObject_TeamRoot:SetActive(false);
    gameObject_WeekRoot:SetActive(true);
  end

  this.ResetScrollContent();
  
  event_ToNext.gameObject:SetActive(true);
  event_ToBack.gameObject:SetActive(true);

  if nowPag <= 0 then
    event_ToBack.gameObject:SetActive(false);
  end

  if (nowPag*Dungeon.maxWeekDungeonNode + Dungeon.maxWeekDungeonNode) >= table.Count(weekPageMainData) then
    event_ToNext.gameObject:SetActive(false);
  end

  if nowPagKind == EUIDungeonTag.WeekDungeon then
    text_WeekName.text = string.Get(22386);
  elseif nowPagKind == EUIDungeonTag.SoulDungeon then
    text_WeekName.text = string.Get(24099);
  end

  local dungeonData = {};
  local usedCount = 0;
  local allPass = true;
  local allPassPrizeMark = 0;
  for i = 1, Dungeon.maxWeekDungeonNode do
    local DatasIdx = i+nowPag*Dungeon.maxWeekDungeonNode;
    dungeonData = Dungeon.GetData(weekPageMainData[DatasIdx]);
    local nodeInfo = nodeInfos[i];
    if dungeonData ~= nil and nodeInfo ~= nil then
      nodeInfo.gameObject:SetActive(true);
      nodeInfo.NameText.text = DatasIdx;
      usedCount = 0;
      if MarkManager.missions[dungeonData.dayilyFlag] ~= nil then 
        usedCount = MarkManager.missions[dungeonData.dayilyFlag].step;
      end

      if nowPagKind == EUIDungeonTag.SoulDungeon then
        if i > 1 then
          local tempIdx =  i - 1 + nowPag * Dungeon.maxWeekDungeonNode;
          if MarkManager.missions[Dungeon.GetData(weekPageMainData[tempIdx]).dayilyFlag] == nil then
            nodeInfo.image_Icon.color = Color.Gray;
            nodeInfo.event.enabled = false;
          else
            nodeInfo.image_Icon.color = Color.White;
            nodeInfo.event.enabled = true;
          end
        end
      else
        nodeInfo.image_Icon.color = Color.White;
        nodeInfo.event.enabled = true;
      end

      if nowDungeonData.dayilyCount <= usedCount then
        nodeInfo.gameObject_Complete:SetActive(true);
        nodeInfo.image_Icon.sprite = UI.GetSprite("com135L");
      else
        nodeInfo.gameObject_Complete:SetActive(false);
        nodeInfo.image_Icon.sprite = UI.GetSprite("com135D");
        allPass = false;
      end
    elseif nodeInfo ~= nil then
      nodeInfo.gameObject:SetActive(false);
    end

    if dungeonData ~= nil and i == 1 then
      --已第一筆週副本來抓全通獎   
      allPassPrizeMark = dungeonData.costPoint;--取得全通獎勵的以領獎標記 用消耗點數的欄位代替(周副本每區的第一關)
      if dungeonData.allPassPrize ~= 0 and itemDatas[dungeonData.allPassPrize] ~= nil then
        event_GetAllPassPrize.gameObject:SetActive(true);
        event_AllPassPrize.gameObject:SetActive(true);
        item_AllPassPrize:SetItem(dungeonData.allPassPrize, 1);
        item_AllPassPrize:SetEvent(this.OnClick_AllPassPrize); 
      else
        event_GetAllPassPrize.gameObject:SetActive(false);
        event_AllPassPrize.gameObject:SetActive(false);
      end
    end   
  end 
     
  --if (allPass) and (MarkManager.missions[12803] ~= nil) and (MarkManager.missions[12803].step == 0) then 
  if allPass and not MarkManager.GetMissionFlag(allPassPrizeMark) then 
    event_GetAllPassPrize.enabled = true;
    LuaHelper.SetColor(image_GetAllPassPrize, Color.White); 
  else 
    event_GetAllPassPrize.enabled = false;
    LuaHelper.SetColor(image_GetAllPassPrize, Color.Gray);
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
    
  end
end

--Multiple
function UIDungeon.UpdateMultipleInfo()
  if not gameObject_MultipleRoot.activeInHierarchy then 
    gameObject_MultipleRoot:SetActive(true);
    gameObject_SingleRoot:SetActive(false);
    gameObject_TeamRoot:SetActive(false);
    gameObject_WeekRoot:SetActive(false);
  end

  this.ResetScrollContent();

  text_MName.text = string.Get(nowDungeonData.name);
  text_MLv.text  =  nowDungeonData.minLv;
  text_MTime.text = string.Concat(nowDungeonData.time, string.Get(49024));
  text_MPeople.text = nowDungeonData.maxPlayer;

  if nowDungeonData.kind == 3 or nowDungeonData.kind == 5 then
    -- 特殊多人副本
    text_NeedTitle1.text = string.Get(22411);
    text_NeedTitle2.text = string.Get(22412);
    text_MReward_Title.text = string.Get(22413);
    text_NeedPar1.text = this.GetNeedParStr(nowDungeonData.needPar[0]);
    text_NeedPar2.text = this.GetNeedParStr(nowDungeonData.needPar[1]);

    event_MBuyCount.gameObject:SetActive(false);
    event_MJoin.gameObject:SetActive(true); 
    event_MCreate.gameObject:SetActive(true);
    event_MBack.gameObject:SetActive(true);
  else
    -- 一般多人副本
    local usedCount = 0;
    if MarkManager.missions[nowDungeonData.dayilyFlag] ~= nil then 
      usedCount = MarkManager.missions[nowDungeonData.dayilyFlag].step;
    end
    local dayilyCount = nowDungeonData.dayilyCount - usedCount;

    text_NeedTitle1.text = string.Get(10106);
    text_NeedTitle2.text = "";
    text_NeedPar1.text = dayilyCount;
    text_NeedPar2.text = "";
    text_MReward_Title.text = string.Get(10108);
    
    event_MBuyCount.gameObject:SetActive(dayilyCount == 0);
    event_MJoin.gameObject:SetActive(dayilyCount > 0);
    event_MCreate.gameObject:SetActive(dayilyCount > 0);
    event_MBack.gameObject:SetActive(false);
  end

  local comboData = dungeonComboDatas[nowDungeonData.lootTable];
  for i = 1, 3 do
    if comboData[i] ~= nil then
      table_MBox[i].event.gameObject:SetActive(true);
      local startTime = 0;
      if comboData[i -1] ~= nil then
        startTime = comboData[i -1].kindValue / 60;
      end
      if nowDungeonData.kind == 3 then
        table_MBox[i].text.text = "";--周副本不需要顯示
      else
        table_MBox[i].text.text = string.Concat(string.Get(21239), math.round(startTime), string.Get(49024));
      end
      local items = comboData[i]:GetReward();
      if items ~= nil and itemDatas[items.itemId] ~= nil then
        table_MBox[i].item:SetItem(items.itemId, items.itemValue);
        table_MBox[i].item:SetEvent(this.OnClickMBox, i);
      end
    else
      table_MBox[i].event.gameObject:SetActive(false);
    end
  end
end

function UIDungeon.UpdateInfo()
  if gameObject_SingleRoot.activeInHierarchy then 
    this.UpdateSingleInfo();
  elseif gameObject_MultipleRoot.activeInHierarchy then 
    this.UpdateMultipleInfo();
  elseif gameObject_TeamRoot.activeInHierarchy then
    this.UpdateTeamUI();
  else
    this.UpdateWeekDungeonInfo();
  end
end

function UIDungeon.OnClick_WeekNode(uiEvent)
  local WeekDataIdx = 0;
  WeekDataIdx = uiEvent.parameter+ nowPag*Dungeon.maxWeekDungeonNode;
  local dungeonData = Dungeon.GetData(weekPageMainData[WeekDataIdx]);
  if dungeonData ~= nil then 
    nowPagKind = EUIDungeonTag.Multiple; 
    nowDungeonData = dungeonData;
    this.UpdatePage(currentMainPage, uiEvent.parameter);
  end
end

function UIDungeon.OnClick_GetAllPassPrize(uiEvent) 
  --送領全通獎 
  local dungeonData = {};
  local usedCount = 0;
  local WeekDataIdx = 0;
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
  

  for i = 1, Dungeon.maxWeekDungeonNode do
    WeekDataIdx = i+ nowPag*Dungeon.maxWeekDungeonNode;
    dungeonData = Dungeon.GetData(weekPageMainData[WeekDataIdx]);
    if dungeonData ~= nil then 
      usedCount = 0;

      if MarkManager.missions[dungeonData.dayilyFlag] ~= nil then 
        usedCount = MarkManager.missions[dungeonData.dayilyFlag].step;
      end

      if usedCount == 0 then return end
    end
  end
  
  Dungeon.SendGetWeekDungeonPrize(nowPag);
end

function UIDungeon.OnClick_ToNext(uiEvent) 
  --周副本轉換至其它區
  if nowPag >= 1 then
    return;
  end
  nowPag = nowPag+1;
  this.UpdateWeekDungeonInfo();
end

function UIDungeon.OnClick_ToBack(uiEvent) 
  --周副本轉換至其它區 
  if nowPag <= 0 then
    return;
  end
  nowPag = nowPag-1; 
  this.UpdateWeekDungeonInfo();
end

function UIDungeon.OnClick_AllPassPrize(uiEvent)
  local WeekDataIdx = 0;
  WeekDataIdx = 1+ nowPag*Dungeon.maxWeekDungeonNode;
  local dungeonData = Dungeon.GetData(weekPageMainData[WeekDataIdx]);
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
  
  if dungeonData ~= nil then
    UIItemInfo.Show(dungeonData.allPassPrize);
  end
end

function UIDungeon.OnClick_JoinTeam(uiEvent)
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end
  
  local roomData = roomDatas[uiEvent.parameter];
  if roomData.isLock then
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
    ShowStrInput(string.Get(20156), function(text) if text == nil then return end;  Dungeon.SendJoinRoom(roomData.id, text) end);
  else
    Dungeon.SendJoinRoom(roomData.id);
  end
end

function UIDungeon.OnClickMBack(uiEvent)
  this.OnClick_Tag(currentMainPage, 1);
end
 
function UIDungeon.OnClickMBuyCount(uiEvent)
  Dungeon.SendResetCount(nowDungeonData.id);
end

function UIDungeon.OnClickMJoin(uiEvent)
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end
  
  Dungeon.SendJoinAnyway(nowDungeonData.id);
end

function UIDungeon.OnClickMCreate(uiEvent)
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end

  ShowCheckBoxAlert(string.Get(10109), string.Get(10112), this.OnClickToogleSubmit);
end

function UIDungeon.OnClickMRefresh(uiEvent)
  if CGTimer.time - last_RefreshTime > 3 then 
    last_RefreshTime = CGTimer.time;
    Dungeon.SendAskRoomData();
  end
end

function UIDungeon.OnClickMBox(uiEvent)
  local comboData = dungeonComboDatas[nowDungeonData.lootTable][uiEvent.parameter];  
  local item = comboData:GetReward();
  if item ~= nil then 
    UIItemInfo.Show(item.itemId);
  end
end

--Single
function UIDungeon.UpdateSingleInfo()
  if not gameObject_SingleRoot.activeInHierarchy then 
    gameObject_MultipleRoot:SetActive(false);
    gameObject_SingleRoot:SetActive(true);
    gameObject_TeamRoot:SetActive(false);
    gameObject_WeekRoot:SetActive(false);
  end
  text_SName.text = string.Get(nowDungeonData.name);
  text_SLv.text = string.Concat(nowDungeonData.minLv, "~", nowDungeonData.maxLv);
  text_SPeople.text = nowDungeonData.maxPlayer;
  text_STime.text = string.Concat(nowDungeonData.time, string.Get(49024));
  text_SInfo.text = string.Get(nowDungeonData.infoText);
  
  local usedCount = 0;
  if MarkManager.missions[nowDungeonData.dayilyFlag] ~= nil then 
    usedCount = MarkManager.missions[nowDungeonData.dayilyFlag].step;
  end
  local dayilyCount = nowDungeonData.dayilyCount - usedCount;
  text_SCount.text = dayilyCount;
  event_SBuyCount.gameObject:SetActive(dayilyCount == 0);
  event_SJoin.gameObject:SetActive(dayilyCount > 0);
  event_SSkip.gameObject:SetActive(dayilyCount > 0 and MarkManager.GetMissionFlag(nowDungeonData.skipFlag));  
  --
  --獎勵
  local turn = Role.player:GetAttribute(EAttribute.Turn);
  local minData, maxData = Dungeon.GetComboData(nowDungeonData.lootTable);
  local tempItem = minData:GetReward();
  if tempItem ~= nil and itemDatas[tempItem.itemId] ~= nil then
    singleRewards[1].item:SetItem(tempItem.itemId, tempItem.itemValue);
    singleRewards[1].item:SetEvent(this.OnClick_SingleBox, tempItem.itemId);
  end
  
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  tempItem = maxData:GetReward();
  if tempItem ~= nil and itemDatas[tempItem.itemId] ~= nil then
    singleRewards[2].item:SetItem(tempItem.itemId, tempItem.itemValue);
    singleRewards[2].item:SetEvent(this.OnClick_SingleBox, tempItem.itemId);
  end

  if turn >= 1 and dungeonComboDatas[nowDungeonData.extraLoot] ~= nil then
    maxData = nil;
    for k, v in pairs(dungeonComboDatas[nowDungeonData.extraLoot])do
      if v.kindValue == turn then 
        maxData = v;
        break;        
      end
    end
    local item = maxData:GetReward();
    if maxData ~= nil and item ~= nil and itemDatas[item.itemId] ~= nil then
      singleExtraRewrad.image.gameObject:SetActive(true);
      singleExtraRewrad.item:SetItem(item.itemId, item.itemValue);
      singleExtraRewrad.item:SetEvent(this.OnClick_SingleBox, item.itemId);

      singleExtraRewrad.infoText.text = string.Concat(turn, string.Get(10115));
    else
      singleExtraRewrad.image.gameObject:SetActive(false);
    end
  else
    singleExtraRewrad.image.gameObject:SetActive(false);
  end
end

function UIDungeon.OnClick_SingleBox(event)
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  UIItemInfo.Show(event.parameter);
end

function UIDungeon.OnClickSBuyCount(uiEvent)
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
  Dungeon.SendResetCount(nowDungeonData.id);
end

function UIDungeon.OnClickSJoin(uiEvent)
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
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
  
  if nowDungeonData == nil then 
    return 
  end
  Dungeon.SendCreateDungeon(nowDungeonData.id, false,nowDungeonData.kind);
end

function UIDungeon.OnClickSSkip(uiEvent)
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end
  
  --todo Check flag
  if nowDungeonData == nil then 
    return 
  end
  Dungeon.SendSkip(nowDungeonData.id)
end

function UIDungeon.OnClickSReward(uiEvent)
end

--Team
function UIDungeon.UpdateTeamCloseButton(prepare)  
  if prepare == nil then 
    prepare = false;
    for k, v in pairs(Dungeon.dungeonNowRoomPlayers)do
      if v.id == Role.playerId then 
        prepare = v.prepare;
        break;
      end
    end
  end

  if not prepare then 
    UIFrame.SetCloseEvent(this.OnClick_TeamClose);    
  else
    UIFrame.SetCloseEvent(nil);
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
  end
end

function UIDungeon.UpdateTeamUI()
  if not gameObject_TeamRoot.activeInHierarchy then
    if nowDungeonData == nil or (Dungeon.nowDungeonId ~= 0 and nowDungeonData.id ~= Dungeon.nowDungeonId) then
       nowDungeonData = Dungeon.GetData(Dungeon.nowDungeonId);
    end
    transform_FrameRect.anchoredPosition = UI.nonTabUIPosition;
    transform_FrameRect.sizeDelta = UI.nonTabUISize;
    UIFrame.Active(transform_FrameRect, string.Get(10118), this.OnClick_Close, nil, this.OnClick_Tag, nil, nil, nil, this.CheckRedDot);

    this.UpdateTeamCloseButton();
    gameObject_MultipleRoot:SetActive(false);
    gameObject_SingleRoot:SetActive(false);
    gameObject_TeamRoot:SetActive(true); 
    gameObject_WeekRoot:SetActive(false);
    UIDungeon.UpdateTeamPassword();
    event_KickBg.gameObject:SetActive(false);
  end

  UIDungeon.UpdateTeamRole();
end

function UIDungeon.UpdateRole()
  if not gameObject_TeamRoot.activeInHierarchy then 
    return;
  end
end

function UIDungeon.UpdateTeamStatus()
  local isLeader = (Dungeon.nowDungeonOwnerId == Role.playerId);
  for i = 1, 5 do 
    if Dungeon.dungeonNowRoomPlayers[i] ~= nil then 
      local playerData = Dungeon.dungeonNowRoomPlayers[i]; 
      roleSet[i].root.gameObject:SetActive(true); 
      roleSet[i].gameObject_Add.gameObject:SetActive(false);

      if i == 1 then --房主不顯示
        roleSet[i].gameObject_Prepare:SetActive(false);
      else
        roleSet[i].gameObject_Prepare:SetActive(playerData.prepare);
      end

       if playerData.id == Role.playerId then         
        this.ShowLeaderButtons(isLeader);
        if isLeader then 
          local isReady = Dungeon.CheckTeamIsReady();
          if isReady then 
            LuaHelper.SetColor(image_TeamOk, Color.White);
          else
            LuaHelper.SetColor(image_TeamOk, Color.Gray);
          end
          text_TeamOk.text = string.Get(10116); --開始
        else
          if playerData.prepare then 
            LuaHelper.SetColor(image_TeamOk, Color.Gray);
            text_TeamOk.text = string.Get(20991); --取消
          else
            LuaHelper.SetColor(image_TeamOk, Color.White);
            text_TeamOk.text = string.Get(10121); --準備
          end
        end
      end
    else
      roleSet[i].root.gameObject:SetActive(false); 
      roleSet[i].gameObject_Add.gameObject:SetActive(isLeader);
    end
  end
end

function UIDungeon.UpdateTeamRoomName()  
  text_RoomName.text = Dungeon.nowDungeonRoom.name;
  if nowDungeonData ~= nil and nowDungeonData.kind == 3 then 
    gameObject_WeekDungeonRequire:SetActive(true);
    text_NeedPar1_T.text = this.GetNeedParStr(nowDungeonData.needPar[0]);
    text_NeedPar2_T.text = this.GetNeedParStr(nowDungeonData.needPar[1]);
  else 
    gameObject_WeekDungeonRequire:SetActive(false);
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
    
  end
end

function UIDungeon.UpdateTeamRole()  
  text_TeamName.text = Dungeon.GetName(Dungeon.nowDungeonRoom.dungeonId);
  this.UpdateTeamRoomName();  
  local isLeader = (Dungeon.nowDungeonOwnerId == Role.playerId);
  gameObject_changeName:SetActive(isLeader);
  for i = 1, 5 do 
    if Dungeon.dungeonNowRoomPlayers[i] ~= nil then  
      local playerInfo = Dungeon.dungeonNowRoomPlayers[i];

      if playerInfo.id == Role.playerId then
        roleSet[i].jmpDrawer_Role:GenerateAndDraw(Role.player.data:GetAtlasParams(Role.player.titleId, ERolePose.Prepare + 1));
        roleSet[i].jmpDrawer_Role.offsetY = 0;
      else
        local playerData = PlayerData.New();
        
        playerData.roleId = playerInfo.id;
        playerData.sex = playerInfo.sex;
        playerData.headStyle = playerInfo.headStyle;
        
        playerData.colorTints[1] = playerInfo.colorTints[1];
        playerData.colorTints[2] = playerInfo.colorTints[2];
      
        playerData.equips = {};
        for i = 1, Role.maxEquip + Role.maxStyle do
          if playerInfo.equip[i] ~= nil then
            playerData.equips[i] = playerInfo.equip[i];
          end
        end

        roleSet[i].jmpDrawer_Role:GenerateAndDraw(playerData:GetAtlasParams(playerInfo.titleId, ERolePose.Prepare + 1));
        roleSet[i].jmpDrawer_Role.offsetY = 0;
      end
      
      roleSet[i].root.gameObject:SetActive(true); 
      roleSet[i].gameObject_Add.gameObject:SetActive(false);

      
      roleSet[i].text_Name.text = playerInfo.name;

      roleSet[i].text_Lv.text = playerInfo.lv;

      if i == 1 then --房主不顯示
        roleSet[i].gameObject_Prepare:SetActive(false);
      else
        roleSet[i].gameObject_Prepare:SetActive(playerInfo.prepare);
      end

      if playerInfo.id == Role.playerId then         
        this.ShowLeaderButtons(isLeader);
        if isLeader then 
          local isReady = Dungeon.CheckTeamIsReady();
          if isReady then 
            LuaHelper.SetColor(image_TeamOk, Color.White);
          else
            LuaHelper.SetColor(image_TeamOk, Color.Gray);
          end
          text_TeamOk.text = string.Get(10116); --開始
        else
          if playerInfo.prepare then 
            LuaHelper.SetColor(image_TeamOk, Color.Gray);
            text_TeamOk.text = string.Get(20991); --取消
          else
            LuaHelper.SetColor(image_TeamOk, Color.White);
            text_TeamOk.text = string.Get(10121); --準備
          end
        end
      end
    else
      roleSet[i].root.gameObject:SetActive(false);       
      roleSet[i].gameObject_Add.gameObject:SetActive(isLeader);
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
    end
  end
end

function UIDungeon.OnClickTeamOk(uiEvent)
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
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
    
    return;
  end
  
  if Dungeon.nowDungeonOwnerId == Role.playerId then 
    --其他人都準備才能送
    local isReady = Dungeon.CheckTeamIsReady();

    if isReady then 
      Dungeon.SendStartMultiplayerDungeon();
    end
  else
    Dungeon.SendPrepare();
  end
end

function UIDungeon.OnClickTeamExit(uiEvent)
  Dungeon.SendLeaveTeam();
end

function UIDungeon.OnClickTeamAdd(uiEvent)
  local isFriendOnline = false;
  for roleId, playerInfo in pairs(Social.friends) do
    --判斷在線
    if playerInfo.online then
      if UIDungeon.FilterDungeonFriend(playerInfo) then
        isFriendOnline = true;
        break;
      end
    end
  end
  if isFriendOnline then 
    UI.Open(UIInvite, Dungeon.SendInvite, UIDungeon.FilterDungeonFriend);
  else
    ShowCenterMessage(string.Get(21529));
  end
end

function UIDungeon.FilterDungeonFriend(playerInfo)
  local data = dungeonDatas[Dungeon.nowDungeonId];
  if data.minLv <= playerInfo.level and data.maxLv >= playerInfo.level then         
    return true;
  else
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    return false;
  end
end

function UIDungeon.OnClickTeamPass(uiEvent)
  --Dungeon.SendSetPassword();
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
end

function UIDungeon.OnClickTeamRecruit(uiEvent)
  ShowChatChannelList(string.Get(10119), this.ClickChannel);
end

function UIDungeon.ClickChannel(uiEvent)
  if uiEvent ~= nil then
    if uiEvent.parameter == EChannel.World then
      Dungeon.SendRecurit(2);
    elseif uiEvent.parameter == EChannel.Organization then
      if Organization.Id ~= nil and Organization.Id ~= 0 then 
        Dungeon.SendRecurit(1);
      else
        ShowCenterMessage(string.Get(20539));
      end
    end
  end
end

function UIDungeon.OnClickChangeName(uiEvent)
  ShowStrInput(string.Get(50021), function(text) if text == nil then return; end Dungeon.SendSetRoomName(text) end);
end

function UIDungeon.OnClickTeamRole(uiEvent)
  local index = uiEvent.parameter;
  if Dungeon.nowDungeonOwnerId == Role.playerId and index ~= 1 then --點自己不需要出現
    this.ShowKickButton(index);
  end
end

function UIDungeon.OnClickTeamKick(uiEvent)
  event_KickBg.gameObject:SetActive(false);
  if Dungeon.dungeonNowRoomPlayers[uiEvent.parameter] ~= nil then 
    Dungeon.SendKickPlayer(Dungeon.dungeonNowRoomPlayers[uiEvent.parameter].id);
  end
end

function UIDungeon.OnClickKickBg(uiEvent)
  event_KickBg.gameObject:SetActive(false);
end

function UIDungeon.ShowLeaderButtons(isLeader)
  gameObject_LeaderRoot:SetActive(isLeader);
end

function UIDungeon.ShowKickButton(index)
  if index <=0 or index >5 then 
    return;
  end
  event_KickBg.gameObject:SetActive(true);
  event_Kick.parameter = index;
  event_Kick.transform.position = roleSet[index].root.transform.position;
end

function UIDungeon.UpdateTeamPassword()  
  if Dungeon.nowDungeonPassword ~= "" then 
    image_TeamPass.gameObject:SetActive(true);
    image_TeamPass.sprite = UI.GetSprite("bod008");
    text_TeamPass.text = string.Concat(string.Get(10314), ":", Dungeon.nowDungeonPassword);
    
    --gameObject_WeekDungeonRequire:SetActive(false); 原本想說顯示密碼就不顯示周副本限制字串
  else
    image_TeamPass.gameObject:SetActive(false);
    --image_TeamPass.sprite = UI.GetSprite("bod004");
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
    
    text_TeamPass.text = "";
  end
end

function UIDungeon.OnClickToogleSubmit(boolToogle)
  if boolToogle ~= nil then
    if Role.player.war ~= EWar.None then
      ShowCenterMessage(string.Get(80099));
      return;
    end
    Dungeon.SendCreateDungeon(nowDungeonData.id, boolToogle, 1);
  else
      -- Cancel Alert CallBack in Here
  end
end

--countdown
function UIDungeon.DisCountDown()
  gameObject_CountdownMask:SetActive(false)
  countdownStart = false;
end

function UIDungeon.UpdateCountdown()  
  if countdownStart == false then 
    gameObject_CountdownMask:SetActive(false)
  else
    gameObject_CountdownMask:SetActive(true)
    countdown = countdown - CGTimer.deltaTime;
    if countdown > 0 then 
      text_Countdown.text = math.round(countdown);
    else
      text_Countdown.text = 0;
    end
  end
end

function UIDungeon.StartCountdown()
  countdown = 5;
  countdownStart = true;
end