
UICityStation = {}
local this = UICityStation;

this.name = "UICityStation";
this.uiController = nil;

--ui
local transform_FrameRect;

local image_Up;

local text_Name;
local text_Level;
local text_CityLimit;
local text_Require;
local text_Description;
local text_StationLv;
local text_NextStationLv;

local rawImage_Station;
local rawImage_NextStation;

local event_Build;
local event_Up;
local event_Destroy;

--var
local currentStation = ECityStation.Business;

local tagDatas = {};

function UICityStation.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;
  this.uiController.onClose = this.OnClose;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;

  image_Up = uiController:FindImage("Image_Up");

  text_Name = uiController:FindText("Text_Name");
  text_Level = uiController:FindText("Text_Level");
  text_CityLimit = uiController:FindText("Text_CityLimit");
  text_Require = uiController:FindText("Text_Require");
  text_Description = uiController:FindText("Text_Description");
  text_StationLv = uiController:FindText("Text_StationLv");
  text_NextStationLv = uiController:FindText("Text_NextStationLv");

  rawImage_Station = uiController:FindRawImage("RawImage_Station");
  rawImage_NextStation = uiController:FindRawImage("RawImage_NextStation");

  local tempEvent;

  event_Build = uiController:FindEvent("Image_Build");
  event_Build:SetListener(EventTriggerType.PointerClick, this.OnClick_Up);

  event_Up = uiController:FindEvent("Image_Up");
  event_Up:SetListener(EventTriggerType.PointerClick, this.OnClick_Up);

  event_Destroy = uiController:FindEvent("Image_Destroy");
  event_Destroy:SetListener(EventTriggerType.PointerClick, this.OnClick_Destroy);

  tagDatas[ECityStation.Business] = { string.Get(71146), nil };
  tagDatas[ECityStation.Barn] = { string.Get(71147), nil };
  tagDatas[ECityStation.Pit] = { string.Get(71148), nil };
  tagDatas[ECityStation.Lumbering] = { string.Get(71149), nil };
  tagDatas[ECityStation.Drapery] = { string.Get(71150), nil };
  tagDatas[ECityStation.Artificer] = { string.Get(71151), nil };
end

function UICityStation.OnOpen()
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
  currentStation = ECityStation.Business;

  return true;
end

function UICityStation.OnVisible(visible)
  if visible then
    --tag
    UIFrame.Active(transform_FrameRect, string.Get(22083), this.OnClick_Close, this.OnClick_Help, this.OnClick_Tag, tagDatas, currentStation);

    this.UpdateUI();
  end
end

function UICityStation.OnClose()
  EventManager.SetConduct(true);
end

function UICityStation.UpdateUI()
  local cityId = City.GetCityId(SceneManager.sceneId, ECityScene.All);
  local stationLv = City.GetStationLv(cityId, currentStation);
  local stationName = "";
  local resourceName = "";

  if currentStation == ECityStation.Business then
    stationName = string.Get(71146);
    resourceName = string.Get(20820);
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
  elseif currentStation == ECityStation.Barn then
    stationName = string.Get(71147);
    resourceName = string.Get(20821);
  elseif currentStation == ECityStation.Pit then
    stationName = string.Get(71148);
    resourceName = string.Get(20822);
  elseif currentStation == ECityStation.Lumbering then
    stationName = string.Get(71149);
    resourceName = string.Get(20823);
  elseif currentStation == ECityStation.Drapery then
    stationName = string.Get(71150);
    resourceName = string.Get(20824);
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
  elseif currentStation == ECityStation.Artificer then
    stationName = string.Get(71151);
    resourceName = "";
  end

  text_Name.text = stationName;
  text_Level.text = stationLv;
  
  --Info
  local stationCount = 0;
  for k, v in pairs(City.cities[cityId].stationLv) do
    if v > 0 then
      stationCount = stationCount + 1;
    end
  end
  text_CityLimit.text = string.Concat(string.Get(40279), string.GetCityLevelText(City.cities[cityId].level), "\n", string.format(string.Get(22084), City.cities[cityId].level + 2), "\n", string.format(string.Get(22085), stationCount));

  --Request
  local requireText = "";
  if stationLv == 0 then
    requireText = string.Concat(requireText, string.Get(71164));
  else
    requireText = string.Concat(requireText, string.Get(71165));
  end

  requireText = string.Concat(requireText, string.Get(90128), "\n");

  local cost = 1000000 * (stationLv + 1);
  if currentStation == ECityStation.Business then
    requireText = string.Concat(requireText, "                x ", cost, "\n");
    requireText = string.Concat(requireText, "                x ", 0, "\n");
    requireText = string.Concat(requireText, "                x ", 0, "\n");
    requireText = string.Concat(requireText, "                x ", 0, "\n");
    requireText = string.Concat(requireText, "                x ", 0);
  elseif currentStation == ECityStation.Barn then
    requireText = string.Concat(requireText, "                x ", 0, "\n");
    requireText = string.Concat(requireText, "                x ", cost, "\n");
    requireText = string.Concat(requireText, "                x ", 0, "\n");
    requireText = string.Concat(requireText, "                x ", 0, "\n");
    requireText = string.Concat(requireText, "                x ", 0);
  elseif currentStation == ECityStation.Pit then
    requireText = string.Concat(requireText, "                x ", 0, "\n");
    requireText = string.Concat(requireText, "                x ", 0, "\n");
    requireText = string.Concat(requireText, "                x ", cost, "\n");
    requireText = string.Concat(requireText, "                x ", 0, "\n");
    requireText = string.Concat(requireText, "                x ", 0);
  elseif currentStation == ECityStation.Lumbering then
    requireText = string.Concat(requireText, "                x ", 0, "\n");
    requireText = string.Concat(requireText, "                x ", 0, "\n");
    requireText = string.Concat(requireText, "                x ", 0, "\n");
    requireText = string.Concat(requireText, "                x ", cost, "\n");
    requireText = string.Concat(requireText, "                x ", 0);
  elseif currentStation == ECityStation.Drapery then
    requireText = string.Concat(requireText, "                x ", 0, "\n");
    requireText = string.Concat(requireText, "                x ", 0, "\n");
    requireText = string.Concat(requireText, "                x ", 0, "\n");
    requireText = string.Concat(requireText, "                x ", 0, "\n");
    requireText = string.Concat(requireText, "                x ", cost);
  elseif currentStation == ECityStation.Artificer then
    requireText = string.Concat(requireText, "                x ", cost, "\n");
    requireText = string.Concat(requireText, "                x ", cost, "\n");
    requireText = string.Concat(requireText, "                x ", cost, "\n");
    requireText = string.Concat(requireText, "                x ", cost, "\n");
    requireText = string.Concat(requireText, "                x ", cost);
  end

  text_Require.text = requireText;

  TextureManager.SetPng(ETextureUseType.UI, string.Concat("Station", currentStation, math.max(stationLv, 1)), rawImage_Station);
  TextureManager.SetPng(ETextureUseType.UI, string.Concat("Station", currentStation, math.min(stationLv + 1, City.maxCityStationLv)), rawImage_NextStation);

  text_StationLv.text = stationLv;
  if stationLv + 1 > City.maxCityStationLv then
    text_NextStationLv.text = "MAX";
    event_Up:SetColor(Color.LightGray);
  else
    text_NextStationLv.text = stationLv + 1;
    event_Up:SetColor(Color.White);
  end

  --Description
  if Contains(currentStation, ECityStation.Business, ECityStation.Barn, ECityStation.Pit, ECityStation.Lumbering, ECityStation.Drapery) then
    text_Description.text = string.Concat(
      stationName, string.Get(71152), resourceName, string.Get(71153), "\n",
      string.Get(71154), "1", string.Get(71155), resourceName, ",", string.Get(20287), resourceName, string.Get(71156), tostring(1 + City.stationResourceRate[1]), "\n",
      string.Get(71154), "2", string.Get(71155), resourceName, ",", string.Get(20287), resourceName, string.Get(71156), tostring(1 + City.stationResourceRate[2]), "\n",
      string.Get(71154), "3", string.Get(71155), resourceName, ",", string.Get(20287), resourceName, string.Get(71156), tostring(1 + City.stationResourceRate[3]), "\n",
      string.GetColorText(string.Concat(string.Get(71157), stationName, string.Get(71158)), Color.Red)
    );
  else
    text_Description.text = string.Concat(stationName, string.Get(71159), "\n",
      string.Get(71154), "1", string.Get(71160), "\n",
      string.Get(71154), "2", string.Get(71161), "\n",
      string.Get(71154), "3", string.Get(71162), "\n",
      string.GetColorText(string.Get(71163), Color.Red)
    );
  end

  event_Build.gameObject:SetActive(stationLv == 0);
  event_Up.gameObject:SetActive(stationLv > 0);
  event_Destroy.gameObject:SetActive(stationLv > 0);
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

function UICityStation.OnClick_Close()
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
  
  UI.Close(UICityStation);
end

function UICityStation.OnClick_Tag(mainTag, subTag)
  currentStation = mainTag;

  this.UpdateUI();

  return true;
end

function UICityStation.OnClick_Up()
  if not Organization.IsChief(Role.playerId) then
    ShowCenterMessage(string.Get(40186));
    return;
  end

  local cityId = City.GetCityId(SceneManager.sceneId, ECityScene.All);
  local stationLv = City.GetStationLv(cityId, currentStation);

  if stationLv >= City.maxCityStationLv then return end

  if stationLv == 0 then
    local stationCount = 0;
    for k, v in pairs(City.cities[cityId].stationLv) do
      if v > 0 then
        stationCount = stationCount + 1;
      end
    end

    if stationCount >= City.cities[cityId].level + 2 then
      ShowCenterMessage(string.Get(71169));
      return;
    end
  end
  
  local cost = 1000000 * (stationLv + 1);
  
  local text = "";
  if stationLv == 0 then
    text = string.Concat(text, string.Get(71164));
  else
    text = string.Concat(text, string.Get(71165));
  end

  text = string.Concat(text, string.Get(90128));

  if currentStation == ECityStation.Business then
    text = string.Concat(text, cost, string.Get(20287), "(", string.Get(20820), ")", string.Get(71166));
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
  elseif currentStation == ECityStation.Barn then
    text = string.Concat(text, cost, string.Get(20287), "(", string.Get(20821), ")", string.Get(71166));
  elseif currentStation == ECityStation.Pit then
    text = string.Concat(text, cost, string.Get(20287), "(", string.Get(20822), ")", string.Get(71166));
  elseif currentStation == ECityStation.Lumbering then
    text = string.Concat(text, cost, string.Get(20287), "(", string.Get(20823), ")", string.Get(71166));
  elseif currentStation == ECityStation.Drapery then
    text = string.Concat(text, cost, string.Get(20287), "(", string.Get(20824), ")", string.Get(71166));
  elseif currentStation == ECityStation.Artificer then
    text = string.Concat(text, string.Get(50171), string.Get(20820), "、", string.Get(20821), "、", string.Get(20822), "、", string.Get(20823), "、", string.Get(20824), string.Get(71168), cost, string.Get(71166));
  else
    return;
  end

  if stationLv == 0 then
    text = string.Concat(text, string.Get(71164), string.Get(71167));
  else
    text = string.Concat(text, string.Get(71165), string.Get(71167));
  end

  ShowCheckMessage(
    function(result)
      if result then
        if currentStation == ECityStation.Business then
          if Organization.resources[EOrgResource.Gold] < cost then
            ShowCenterMessage(string.Get(71171));
            return;
          end
        elseif currentStation == ECityStation.Barn then
          if Organization.resources[EOrgResource.Grain] < cost then
            ShowCenterMessage(string.Get(71171));
            return;
          end
        elseif currentStation == ECityStation.Pit then
          if Organization.resources[EOrgResource.Mineral] < cost then
            ShowCenterMessage(string.Get(71171));
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
            return;
          end
        elseif currentStation == ECityStation.Lumbering then
          if Organization.resources[EOrgResource.Wood] < cost then
            ShowCenterMessage(string.Get(71171));
            return;
          end
        elseif currentStation == ECityStation.Drapery then
          if Organization.resources[EOrgResource.Cloth] < cost then
            ShowCenterMessage(string.Get(71171));
            return;
          end
        elseif currentStation == ECityStation.Artificer then
          if Organization.resources[EOrgResource.Gold] < cost or
            Organization.resources[EOrgResource.Grain] < cost or
            Organization.resources[EOrgResource.Mineral] < cost or
            Organization.resources[EOrgResource.Wood] < cost or
            Organization.resources[EOrgResource.Cloth] < cost then
            ShowCenterMessage(string.Get(71171));
            return;
          end
        end

        --C:039-055 <升級建築> +建築索引(1)
        sendBuffer:Clear();
        sendBuffer:WriteByte(currentStation);
        Network.Send(39, 55, sendBuffer);
      end
    end,
    text,
    Role.target
  );
end

function UICityStation.OnClick_Destroy()
  if not Organization.IsChief(Role.playerId) then
    ShowCenterMessage(string.Get(40186));
    return;
  end
  
  ShowCheckMessage(
    function(result)
      if result then
        --C:039-056 <拆毀建築> +建築索引(1)
        sendBuffer:Clear();
        sendBuffer:WriteByte(currentStation);
        Network.Send(39, 56, sendBuffer);
      end
    end,
    string.Get(71170),
    Role.target
  )
end