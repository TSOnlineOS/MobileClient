EUITeleportTag = {
  Skypoint = 1,  --天行
  Memory = 2,    --記憶傳送
  FightArea = 3, --練功區
  LimitFightArea = 4, --限時練功區
  Turn = 5, --轉生
  Mining = 6  --挖礦
}

UITeleport = {}
local this = UITeleport;

this.name = "UITeleport";
this.uiController = nil;

this.MaxFlyScroll = 5; --最多記憶傳送符
this.MaxFlyScrollExtend = 5; --記憶傳送符最大擴充數量
this.MaxSkypoints = 16;

this.flyPointCount = 0;
this.flyPoints = {}; --記憶傳送符

--ui
local transform_FrameRect;

local gameObject_Skypoint;
local gameObject_Memory;
local gameObject_FightArea;
local gameObject_LimitFightArea;

--var
local currentTag = EUITeleportTag.Skypoint;
local currentSubPage = 1;
local currentClick = 0;

local tagDatas = {};
local warp = {};
local image_Element;
local career;

local scrollContent_Teleport;
local scrollItems_Teleport = {};
local scrollContent_Area;
local scrollItems_Area = {};
local scrollContent_Skypoint;
local scrollItems_Skypoint = {};
local scrollContent_LimitArea;
local scrollItems_LimitArea = {};

local fightArea = {};
local fightAreaPage = {};
local subPageData = {};  --練功區分頁
local turnPageData = {}; --轉生區分頁

local limitfightArea = {};

function UITeleport.Clear()
  this.flyPointCount = 0;
  table.Clear(this.flyPoints);
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    --local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
end

function UITeleport.Initialize(go)
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  this.uiController.onVisible = this.OnVisible;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;
  gameObject_Skypoint = uiController:FindGameObject("Skypoint");
  gameObject_FightArea = uiController:FindGameObject("FightArea");
  gameObject_Memory = uiController:FindGameObject("Memory");
  gameObject_LimitFightArea = uiController:FindGameObject("LimitFightArea");

  tagDatas[1] = { string.Get(99676), nil};
  tagDatas[2] = { string.Get(99677), nil};  --記錄點

  scrollContent_Skypoint = uiController:FindScrollContent("ScrollContent_SkyPoint");
  scrollContent_Skypoint.onInitialize = this.OnInitialize_scrollContent_Skypoint;
  scrollContent_Skypoint.onItemChange = this.OnItemChange_scrollContent_Skypoint;
  scrollContent_Skypoint:Initialize(1);

  scrollContent_Teleport = uiController:FindScrollContent("ScrollContent_Teleport");
  scrollContent_Teleport.onInitialize = this.OnInitialize_scrollContent_Teleport;
  scrollContent_Teleport.onItemChange = this.OnItemChange_scrollContent_Teleport;
  scrollContent_Teleport:Initialize(1);

  scrollContent_Area = uiController:FindScrollContent("ScrollContent_FightArea");
  scrollContent_Area.onInitialize = this.OnInitialize_scrollContent_Area;
  scrollContent_Area.onItemChange = this.OnItemChange_scrollContent_Area;
  scrollContent_Area:Initialize(1);

  scrollContent_LimitArea = uiController:FindScrollContent("ScrollContent_LimitFightArea");
  scrollContent_LimitArea.onInitialize = this.OnInitialize_scrollContent_LimitArea;
  scrollContent_LimitArea.onItemChange = this.OnItemChange_scrollContent_LimitArea;
  scrollContent_LimitArea:Initialize(1);
end

function UITeleport.OnInitialize_scrollContent_Skypoint(scrollItems)
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    --local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Skypoint[itemIndex] = {};
    scrollItems_Skypoint[itemIndex].point = {};
    for i = 1, this.MaxSkypoints do
      scrollItems_Skypoint[itemIndex].point[i] = {}
      scrollItems_Skypoint[itemIndex].point[i].event = scrollItems[itemIndex]:Find(string.Concat("Image_warp_", i)):GetComponent("UIEvent");
      scrollItems_Skypoint[itemIndex].point[i].event:SetListener(EventTriggerType.PointerClick, this.OnClick_Warp);
      scrollItems_Skypoint[itemIndex].point[i].text = scrollItems[itemIndex]:Find(string.Concat("Image_warp_", i)):Find("Text"):GetComponent("Text");
    end
  end
end

function UITeleport.OnItemChange_scrollContent_Skypoint(dataIndex, itemIndex)
  local idx;
  for i = 1, this.MaxSkypoints do
    idx = dataIndex * this.MaxSkypoints + i;

    if warp[idx] ~= nil then
      scrollItems_Skypoint[itemIndex].point[i].text.text = string.Get(warp[idx].name);
      scrollItems_Skypoint[itemIndex].point[i].event:SetColor(Color.White);
    else
      scrollItems_Skypoint[itemIndex].point[i].text.text = "?"
      scrollItems_Skypoint[itemIndex].point[i].event:SetColor(Color.LightGray);
    end

    scrollItems_Skypoint[itemIndex].point[i].event.parameter = idx;
  end

  return true;
end

function UITeleport.OnInitialize_scrollContent_Teleport(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Teleport[itemIndex] = {};
    scrollItems_Teleport[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_Scene"):GetComponent("Text");
    scrollItems_Teleport[itemIndex].text_Memory = scrollItems[itemIndex]:Find("Image_Btn_1"):Find("Text_1"):GetComponent("Text");
    scrollItems_Teleport[itemIndex].event_Memory = scrollItems[itemIndex]:Find("Image_Btn_1"):GetComponent("UIEvent");
    scrollItems_Teleport[itemIndex].event_Memory:SetListener(EventTriggerType.PointerClick, this.OnClick_Memory);
    scrollItems_Teleport[itemIndex].event_Teleport = scrollItems[itemIndex]:Find("Image_Btn_2"):GetComponent("UIEvent");
    scrollItems_Teleport[itemIndex].event_Teleport:SetListener(EventTriggerType.PointerClick, this.OnClick_Teleport);
  end
end

function UITeleport.OnInitialize_scrollContent_Area(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Area[itemIndex] = {};
    scrollItems_Area[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_fightArea"):GetComponent("Text");
    scrollItems_Area[itemIndex].text_Lv = scrollItems[itemIndex]:Find("Text_lv"):GetComponent("Text");
    scrollItems_Area[itemIndex].text_Element = scrollItems[itemIndex]:Find("Text_element"):GetComponent("Text");
    scrollItems_Area[itemIndex].text_Boss = scrollItems[itemIndex]:Find("Text_boss"):GetComponent("Text");
    scrollItems_Area[itemIndex].text_Memory = scrollItems[itemIndex]:Find("Image_Btn_fighArea"):Find("Text_1"):GetComponent("Text");
    scrollItems_Area[itemIndex].itemEventArea = scrollItems[itemIndex]:Find("Image_Btn_fighArea"):GetComponent("UIEvent");
    scrollItems_Area[itemIndex].itemEventArea:SetListener(EventTriggerType.PointerClick, this.OnClick_FightArea);
  end
end

function UITeleport.UpdateMemoryPage()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    --local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  scrollContent_Teleport:Reset(this.MaxFlyScroll + this.MaxFlyScrollExtend);
end

function UITeleport.RefreshMemoryPage()
  scrollContent_Teleport:Refresh();
end

function UITeleport.OnItemChange_scrollContent_Teleport(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local sceneData, sceneName;

  if index > this.MaxFlyScroll + this.flyPointCount then
    scrollItems_Teleport[itemIndex].text_Memory.text = string.Get(98031);
    scrollItems_Teleport[itemIndex].text_Name.text = string.GetColorText(string.Get(98030), Color.DarkRed);
    scrollItems_Teleport[itemIndex].event_Memory.parameter = 0;
    scrollItems_Teleport[itemIndex].event_Teleport.parameter = nil;
    scrollItems_Teleport[itemIndex].event_Teleport:SetColor(Color.LightGray);
  else
    scrollItems_Teleport[itemIndex].text_Memory.text = string.Get(99674);
    scrollItems_Teleport[itemIndex].event_Memory.parameter = index;

    if table.Count(this.flyPoints) >= index and this.flyPoints[index] ~= nil then
      sceneData = sceneDatas[this.flyPoints[index].sceneId];

      if sceneData ~= nil then
        if sceneData.subId > 0 then
          sceneName = string.Concat(sceneData.name, sceneData.subId);
        else
          sceneName = sceneData.name;
        end

        scrollItems_Teleport[itemIndex].text_Name.text = string.format(string.Get(99713), sceneName, this.flyPoints[index].position.x, this.flyPoints[index].position.y);
        scrollItems_Teleport[itemIndex].event_Teleport.parameter = index;
        scrollItems_Teleport[itemIndex].event_Teleport:SetColor(Color.White);
      else
        scrollItems_Teleport[itemIndex].text_Name.text = string.GetColorText(string.Get(99672), Color.Gray);
        scrollItems_Teleport[itemIndex].event_Teleport.parameter = nil;
        scrollItems_Teleport[itemIndex].event_Teleport:SetColor(Color.LightGray);
      end
    else
      scrollItems_Teleport[itemIndex].text_Name.text = string.GetColorText(string.Get(99672), Color.Gray);
      scrollItems_Teleport[itemIndex].event_Teleport.parameter = nil;
      scrollItems_Teleport[itemIndex].event_Teleport:SetColor(Color.LightGray);
    end
  end

  return true;
end

function UITeleport.OnItemChange_scrollContent_Area(dataIndex, itemIndex)

  if currentTag == EUITeleportTag.FightArea then
    this.OnItemChange_scrollContent_Area_FightArea(dataIndex, itemIndex);
  elseif currentTag == EUITeleportTag.Turn then
    this.OnItemChange_scrollContent_Area_Turn(dataIndex, itemIndex);
  else
    this.OnItemChange_scrollContent_Mining(dataIndex, itemIndex);
  end

  return true;
end

function UITeleport.OnItemChange_scrollContent_Area_FightArea(dataIndex, itemIndex)
  local index = dataIndex + 1;
  scrollItems_Area[itemIndex].itemEventArea.parameter = index;

  if sceneDatas[fightAreaPage[index].sceneId] ~= nil then
    local sceneName;
    local sceneData = sceneDatas[fightAreaPage[index].sceneId];
    if sceneData ~= nil then
      if sceneData.subId > 0 then
        sceneName = string.Concat(sceneData.name, sceneData.subId);
      else
        sceneName = sceneData.name;
      end
    end

    scrollItems_Area[itemIndex].text_Name.text = sceneName;
    scrollItems_Area[itemIndex].text_Lv.text = string.format(string.Get(99711), fightAreaPage[index].npcLow, fightAreaPage[index].npcHigh);
  end

  local element = "" ;
  if fightAreaPage[index].element > 0 then
    element = string.Concat(element, this.GetElementString(index));
  end
  scrollItems_Area[itemIndex].text_Element.text = element;

  local bossName = "";
  local stringId = fightAreaPage[index].infoStr;

  if stringId > 0 then
    bossName = string.Concat(bossName, string.Get(stringId));
  end

  scrollItems_Area[itemIndex].text_Boss.text = bossName;
end

function UITeleport.OnItemChange_scrollContent_Area_Turn(dataIndex, itemIndex)
  local index = dataIndex + 1;
  scrollItems_Area[itemIndex].itemEventArea.parameter = index;

  if sceneDatas[fightAreaPage[index].sceneId] ~= nil then
    local turnmsg = string.Get(fightAreaPage[index].infoStr);
    scrollItems_Area[itemIndex].text_Name.text = turnmsg;
  end

  scrollItems_Area[itemIndex].text_Lv.text = "";
  scrollItems_Area[itemIndex].text_Element.text = "";
  scrollItems_Area[itemIndex].text_Boss.text = "";
end

function UITeleport.OnItemChange_scrollContent_Mining(dataIndex, itemIndex)
  local index = dataIndex + 1;
  scrollItems_Area[itemIndex].itemEventArea.parameter = index;
  scrollItems_Area[itemIndex].text_Name.text = string.Concat(string.Get(23796), index);

  scrollItems_Area[itemIndex].text_Lv.text = "";
  scrollItems_Area[itemIndex].text_Element.text = "";
  scrollItems_Area[itemIndex].text_Boss.text = "";
end

function UITeleport.OnInitialize_scrollContent_LimitArea(scrollItems)
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    --local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_LimitArea[itemIndex] = {};
    scrollItems_LimitArea[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_fightArea"):GetComponent("Text");
    scrollItems_LimitArea[itemIndex].text_Lv = scrollItems[itemIndex]:Find("Text_lv"):GetComponent("Text");
    scrollItems_LimitArea[itemIndex].text_Info = scrollItems[itemIndex]:Find("Text_info"):GetComponent("Text");
    scrollItems_LimitArea[itemIndex].text_Time = scrollItems[itemIndex]:Find("Text_time"):GetComponent("Text");
    scrollItems_LimitArea[itemIndex].text_Memory = scrollItems[itemIndex]:Find("Image_Btn_fighArea"):Find("Text_1"):GetComponent("Text");
    scrollItems_LimitArea[itemIndex].itemEventArea = scrollItems[itemIndex]:Find("Image_Btn_fighArea"):GetComponent("UIEvent");
    scrollItems_LimitArea[itemIndex].itemEventArea:SetListener(EventTriggerType.PointerClick, this.OnClick_LimitFightArea);
  end
end

function UITeleport.OnItemChange_scrollContent_LimitArea(dataIndex, itemIndex)
  local index = dataIndex + 1;
  if limitTimeDungeonDatas[index] == nil then return false end
  
  local time = RoleCount.Get(limitTimeDungeonDatas[index].limitIndex);
  if time > limitTimeDungeonDatas[index].limitTime then
    time = 0;
  else
    time = limitTimeDungeonDatas[index].limitTime - time;
  end

  scrollItems_LimitArea[itemIndex].text_Name.text = string.Get(limitTimeDungeonDatas[index].msg);
  scrollItems_LimitArea[itemIndex].text_Time.text = string.format(string.Get(80475), time);
  scrollItems_LimitArea[itemIndex].text_Lv.text = string.Concat(string.Get(20355), limitTimeDungeonDatas[index].limitLv);
  scrollItems_LimitArea[itemIndex].text_Info.text = string.GetColorText(string.Get(23249), Color.Red);
  scrollItems_LimitArea[itemIndex].itemEventArea.parameter = index;

  return true;
end

function UITeleport.GetElementString(index)
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    --local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  local result = "";

  if bit.band(fightAreaPage[index].element, 1) == 1 then  --無
    local element, color = Item.GetElementName(0);
    result = string.Concat(result,string.GetColorText(element, color));
  end

  if bit.band(fightAreaPage[index].element, 2) == 2 then  --地
    local element, color = Item.GetElementName(1);
    result = string.Concat(result,string.GetColorText(element, color));
  end

  if bit.band(fightAreaPage[index].element, 4) == 4 then  --水
    local element, color = Item.GetElementName(2);
    result = string.Concat(result,string.GetColorText(element, color));
  end

  if bit.band(fightAreaPage[index].element, 8) == 8 then  --火
    local element, color = Item.GetElementName(3);
    result = string.Concat(result,string.GetColorText(element, color));
  end

  if bit.band(fightAreaPage[index].element, 16) == 16 then  --風
    local element, color = Item.GetElementName(4);
    result = string.Concat(result,string.GetColorText(element, color));
  end

  if bit.band(fightAreaPage[index].element, 32) == 32 then --心
    local element, color = Item.GetElementName(5);
    result = string.Concat(result,string.GetColorText(element, color));
  end

  if bit.band(fightAreaPage[index].element, 64) == 64 then  --光
    local element, color = Item.GetElementName(7);
    result = string.Concat(result,string.GetColorText(element, color));
  end

  if bit.band(fightAreaPage[index].element, 128) == 128 then  --暗
    local element, color = Item.GetElementName(8);
    result = string.Concat(result,string.GetColorText(element, color));
  end

  return result;
end

function UITeleport.OnOpen(tag, tag2)
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    --local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if tag ~= nil then
    currentTag = tag;
  else
    currentTag = EUITeleportTag.Skypoint;
  end

  if tag2 ~= nil and tag2 > 0 then
    currentSubPage = tag2;
  else
    currentSubPage = 1;
  end

  return true;
end

function UITeleport.OnVisible(visible)
  if visible then
    fightArea = this.GetFightData();

    if fightArea ~= nil then
      tagDatas[3] = {};
      tagDatas[3][1] = string.Get(99710);  --練功區
      tagDatas[3][2] = {};

      table.Clear(subPageData);
      table.Clear(turnPageData);

      for k, v in pairs(fightArea) do
        if sceneDatas[v.sceneId] ~= nil then
          --100為轉生相關
          if v.group < 100 and not table.Contains(subPageData, v.groupName) then
            table.insert(subPageData, v.groupName);
          elseif v.group > 100 and not table.Contains(turnPageData, v.groupName) then
            table.insert(turnPageData, v.groupName);
          end
        end
      end

      for k, v in pairs(subPageData) do
        tagDatas[3][2][k] = string.Get(v);
      end
    end

    limitfightArea = this.GetLimitFightData();
    if fightArea ~= nil then
      tagDatas[4] = {};
      tagDatas[4][1] = string.Concat(string.Get(90095), string.Get(99710));  --限時練功區
      tagDatas[4][2] = nil;
    end

    tagDatas[5] = {};
    tagDatas[5][1] = string.Get(23214);  --轉生區
    tagDatas[5][2] = {};

    for k, v in pairs(turnPageData) do
      tagDatas[5][2][k] = string.Get(v);
    end

    this.SetupSkyPointData();

    tagDatas[6] = { string.Get(23796), nil};

    UIFrame.Active(transform_FrameRect, string.Get(99675), this.OnClick_Close, nil, this.OnClick_Tag, tagDatas, currentTag, currentSubPage);
    
    this.UpdateUI();
  else
    table.Clear(fightArea);
  end
end

function UITeleport.GetFightData()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    --local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  table.Clear(fightArea);
  local area = {};

  for k, v in pairs(sceneFightDatas) do
    if v.open == 1 then
      if v.mark == 0 then
        table.insert(area, v);
      else
        if CheckFlag(MarkManager.flags, markDatas[v.mark].bitId) then
          table.insert(area, v);
        end
      end
    end
  end

  table.sort(area,
    function(a, b)
      if a.group < b.group then return true end
      if a.group == b.group then
        return a.npcLow < b.npcLow;
      end

      return false;
    end
  );

  return area;
end

function UITeleport.UpdatFightArea()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    --local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if not (currentTag == EUITeleportTag.FightArea or currentTag == EUITeleportTag.Turn or currentTag == EUITeleportTag.Mining) then return end

  if currentTag == EUITeleportTag.FightArea then
      this.GetFightAreaPage(subPageData[currentSubPage]);
  else
      this.GetFightAreaPage(turnPageData[currentSubPage]);
  end

  if currentTag == EUITeleportTag.FightArea or currentTag == EUITeleportTag.Turn then
    scrollContent_Area:Reset(table.maxn(fightAreaPage));
  else
    scrollContent_Area:Reset(1);
  end
end

function UITeleport.OnClick_FightArea(uiEvent)
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  if currentTag ~= EUITeleportTag.Mining then
    if Team.IsMember(Role.playerId) and not Team.IsLeader(Role.playerId) then
      ShowCenterMessage(string.Get(20519));
      return;
    end

    if Role.player.war ~= EWar.None then
      ShowCenterMessage(string.Get(80099));
      return true;
    end

    if not Role.CanControl() then return end

    if fightAreaPage[uiEvent.parameter] == nil then return end

    local position = Vector2.New(fightAreaPage[uiEvent.parameter].x, fightAreaPage[uiEvent.parameter].y);

    MarkManager.StartNavigation(0, fightAreaPage[uiEvent.parameter].sceneId, fightAreaPage[uiEvent.parameter].areaId, position, 0)
  else
    if this.CheckTeleport() then return end

    if Team.IsMember(Role.playerId) and not Team.IsLeader(Role.playerId) then
      ShowCenterMessage(string.Get(20518));
      return;
    end

    --C:170-002 進礦場 +礦種類(1)
    sendBuffer:Clear();
    sendBuffer:WriteByte(1);
    Network.Send(170,2,sendBuffer);
  end
  this.OnClick_Close();
end

function UITeleport.GetLimitFightData()
  table.Clear(limitfightArea);
  local area = {};

  for k, v in pairs(sceneFightDatas) do
    if v.open == 1 then
      if v.mark == 0 then
        table.insert(area, v);
      else
        if CheckFlag(MarkManager.flags, markDatas[v.mark].bitId) then
          table.insert(area, v);
        end
      end
    end
  end

  return area;
end

function UITeleport.UpdatLimitFightArea()
  if currentTag ~= EUITeleportTag.LimitFightArea then return end
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------

  scrollContent_LimitArea:Reset(table.maxn(limitTimeDungeonDatas));
end

function UITeleport.OnClick_LimitFightArea(uiEvent)
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return true;
  end
  
  if not Team.IsAlone(Role.playerId) then
    ShowCenterMessage(string.Get(20518));
    return true;
  end

  if not Role.CanControl() then return end

  --C:097-001 <進入限時副本> +副本ID(1)
  sendBuffer:Clear();
  sendBuffer:WriteByte(uiEvent.parameter);
  Network.Send(97, 1, sendBuffer);

  this.OnClick_Close();
end

function UITeleport.OnClose()
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  return true;
end

function UITeleport.UpdateUI()
  gameObject_Skypoint:SetActive(currentTag == EUITeleportTag.Skypoint);
  gameObject_FightArea:SetActive(currentTag == EUITeleportTag.FightArea or currentTag == EUITeleportTag.Turn or currentTag == EUITeleportTag.Mining);
  gameObject_Memory:SetActive(currentTag == EUITeleportTag.Memory);
  gameObject_LimitFightArea:SetActive(currentTag == EUITeleportTag.LimitFightArea);

  this.UpdateSkypoint();
  this.UpdatFightArea();
  this.UpdateMemory();
  this.UpdatLimitFightArea();
end

function UITeleport.UpdateSkypoint()
  if currentTag ~= EUITeleportTag.Skypoint then return end

  scrollContent_Skypoint:Reset(math.max(1, math.ceil(table.maxn(warp) / this.MaxSkypoints)));
end

function UITeleport.UpdateMemory()
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  if currentTag ~= EUITeleportTag.Memory then return end

  this.UpdateMemoryPage();
end

function UITeleport.OnClick_Close()
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  UI.Close(UITeleport);

  return true;
end

function UITeleport.OnClick_Tag(mainTag, subTag)
  currentTag = mainTag;
  currentSubPage = subTag;

  this.UpdateUI();

  return true;
end

function UITeleport.GetFightAreaPage(groupName)
  table.Clear(fightAreaPage);

  for k, v in pairs(fightArea) do
    if v.groupName == groupName then
      table.insert(fightAreaPage, v);
    end
  end
end

function UITeleport.OnClick_Warp(uiEvent)
  if this.CheckTeleport() then return end

  local idx = uiEvent.parameter;
  if warp[idx] ~= nil then
    ShowCheckMessage(
      function(result)
        if result then
          this.SendUseWarp(warp[idx].scene, warp[idx].no);
          UI.Close(UITeleport);
        end
      end,
      string.format(string.Get(90174), string.Get(warp[idx].name)),
      Role.player
    );
  end
end

function UITeleport.OnClick_Memory(uiEvent)
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return true;
  end
  
  local index = uiEvent.parameter;
  if index == nil then return end

  if uiEvent.parameter ~= 0 then
    if this.flyPoints[index].sceneId > 0 then
      ShowCheckMessage(
        function(result)
          if result then
            this.SendMemory(index);
          end
        end,
        string.Get(20369),
        Role.player
      );
    else
      this.SendMemory(index);
    end
  else
    --解鎖
    UISell.Launch(8);
  end
end

function UITeleport.SendMemory(index)
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  --記憶
  sendBuffer:Clear();
  sendBuffer:WriteByte(2);
  sendBuffer:WriteByte(index);
  Network.Send(23, 73, sendBuffer);
end

function UITeleport.OnClick_Teleport(uiEvent)
  if uiEvent.parameter == nil then return end
  
  if this.CheckTeleport() then return end

  currentClick = uiEvent.parameter;

  if this.flyPoints[currentClick] == nil then
    ShowCenterMessage(string.Get(99672));
    return;
  end

  UISell.Launch(7, this.CloseUI, 1, currentClick);
end

function UITeleport.CloseUI()
  UI.Close(UITeleport);
end

function UITeleport.SetupSkyPointData()
  table.Clear(warp);
  MarkManager.UpdateShowMission();

  local idx = 0;
  for i = 0, table.Count(warpDatas) - 1 do
    if warpDatas[i].mark ~= 0 and CheckFlag(MarkManager.flags, markDatas[warpDatas[i].mark].bitId) then
      idx = idx + 1;
      warp[idx] = {};
      warp[idx] = warpDatas[i];
      warp[idx].no = i;
    end
  end
end

--C:068-001 <使用晶石天行異能> +場景ID(2) +NO(1)
function UITeleport.SendUseWarp(sceneId, no)
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  sendBuffer:Clear();
  sendBuffer:WriteUInt16(sceneId);
  sendBuffer:WriteByte(no);
  Network.Send(68, 1, sendBuffer);
end

function UITeleport.CheckTeleport()
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return true;
  end

  if SceneManager.sceneId == 10701 then
    ShowCenterMessage(string.Get(40097));
    return true;
  end

  if not Team.IsAlone(Role.playerId) then
    ShowCenterMessage(string.Get(20518));
    return true;
  end

  return false;
end