local json = require "cjson"
EUISetting = {
  System = 1,
  Option = 2,
}

UISetting = {}
local this = UISetting;

this.name = "UISetting";
this.uiController = nil;

--ui
local transform_FrameRect;
local gameObject_Resolution;

local image_PK;
local image_War;
local image_MusicEnable;
local image_SoundEnable;
local image_NpcInfo;

local dropdown_Player;
local dropdown_Display;
local dropdown_Resolution;

local text_RoleId;

local event_Functions = {};

local text_Channels = {};
local imeage_Channels = {};

--var
local serverName = "default";

--[[
local currentTag = 1;
local currentSubPage = 1;

local tagDatas = {};
--]]

function UISetting.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;

  local tempEvent;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;



  --system
  local functionRoot = uiController:FindGameObject("Function").transform;
  for i = 1, 6 do
    event_Functions[i] = functionRoot:Find(string.Concat("Image_Function (", i, ")")):GetComponent("UIEvent");
    event_Functions[i]:SetListener(EventTriggerType.PointerClick, this.OnClick_Function);
    event_Functions[i].parameter = i;
  end

  --option
  image_PK = uiController:FindImage("Image_PK");
  image_War = uiController:FindImage("Image_War");
  image_MusicEnable = uiController:FindImage("Image_MusicEnable");
  image_SoundEnable = uiController:FindImage("Image_SoundEnable");
  image_NpcInfo = uiController:FindImage("Image_NpcInfo");

  dropdown_Player = uiController:FindDropdown("Dropdown_Player");
  dropdown_Player:AddOption(string.Get(10055));
  dropdown_Player:AddOption(string.Get(10056));
  dropdown_Player:AddOption(string.Get(10057));
  dropdown_Player:AddOption(string.Get(10058));
  dropdown_Player:AddOption(string.Get(10059));
  dropdown_Player:AddListener(this.OnDropChange_Player);
  dropdown_Player.value = Setting.client.playerInfoMode - 1;
  
  dropdown_Display = uiController:FindDropdown("Dropdown_Display");
  dropdown_Display:AddOption(string.Get(10055));
  dropdown_Display:AddOption(string.Get(23323));
  dropdown_Display:AddOption(string.Get(23324));
  dropdown_Display:AddListener(this.OnDropChange_Display);
  dropdown_Display.value = Setting.client.DisplayMode - 1;

  gameObject_Resolution = uiController:FindGameObject("Resolution");
  gameObject_Resolution:SetActive(LuaHelper.IsStandalone);
  if LuaHelper.IsStandalone then
    dropdown_Resolution = uiController:FindDropdown("Dropdown_Resolution");
    local width, height;
    width, height = this.GetResolution(1);
    dropdown_Resolution:AddOption(string.format("%d * %d", width, height));
    width, height = this.GetResolution(2);
    dropdown_Resolution:AddOption(string.format("%d * %d", width, height));
    width, height = this.GetResolution(3);
    dropdown_Resolution:AddOption(string.format("%d * %d", width, height));
    width, height = this.GetResolution(4);
    dropdown_Resolution:AddOption(string.format("%d * %d", width, height));
    dropdown_Resolution:AddListener(this.OnDropChange_Resolution);
    dropdown_Resolution.value = Setting.client.resolution - 1;
  end

  text_RoleId = uiController:FindText("Text_RoleId");

  for k, v in pairs(EChannel) do
    text_Channels[v] = uiController:FindText(string.Concat("Text_Channel (", v, ")"));
    if text_Channels[v] ~= nil then
      tempEvent = text_Channels[v].transform:Find("Image_Prev"):GetComponent("UIEvent");
      tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ChannelPrev);
      tempEvent.parameter = v;
      
      tempEvent = text_Channels[v].transform:Find("Image_Next"):GetComponent("UIEvent");
      tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ChannelNext);
      tempEvent.parameter = v;
      
      imeage_Channels[v] = text_Channels[v].transform:Find("Image_Enable"):GetComponent("Image");
      
      tempEvent = text_Channels[v].transform:Find("Image_Enable"):GetComponent("UIEvent");
      tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ChannelEnable);
      tempEvent.parameter = v;      
    end
  end

  tempEvent = uiController:FindEvent("Image_PK");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_PK);

  tempEvent = uiController:FindEvent("Image_War");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_War);

  tempEvent = uiController:FindEvent("Image_MusicEnable");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_MusicEnable);

  tempEvent = uiController:FindEvent("Image_SoundEnable");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_SoundEnable);

  tempEvent = uiController:FindEvent("Image_NpcInfo");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_NpcInfo);
end

function UISetting.OnOpen()
  if Network.InUnbound then
    serverName = string.Get(22966);
  else
    for k, v in pairs(Network.servers) do
      if Network.serverId == v.id then
        serverName = v.name;
      end
    end
  end
  text_RoleId.text = string.format(string.Get(20767), serverName, tonumber(string.sub(Role.playerId, -10)));
  
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  return true;
end

function UISetting.OnVisible(visible)
  if visible then
    --[[
    tagDatas[1] = { string.Get(98032), nil };
    tagDatas[2] = { string.Get(98029), { string.Get(10094), string.Get(98034), string.Get(98035)} };
    --]]

    UIFrame.Active(transform_FrameRect, string.Get(98038), this.OnClick_Close, this.OnClick_Help, this.OnClick_Tag, tagDatas);

    this.UpdateUI();
  end
end

function UISetting.OnClick_Help(checkShow)
  if checkShow ~= true then
    UI.Open(UITutorialHint, 57, this);
  end
  
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
---
  return true;
end

function UISetting.UpdateUI()
  image_PK.sprite = UI.GetSwitchSprite(Setting.pkEnable);
  image_War.sprite = UI.GetSwitchSprite(Setting.client.playOneEnable);
  image_MusicEnable.sprite = UI.GetSwitchSprite(Setting.client.musicEnable);
  image_SoundEnable.sprite = UI.GetSwitchSprite(Setting.client.soundEnable);
  image_NpcInfo.sprite = UI.GetSwitchSprite(Setting.client.npcInfoMode == 1);

  for k, channel in pairs(EChannel) do
    if text_Channels[channel] ~= nil then
      LuaHelper.SetColor(text_Channels[channel], Color.Channel[Setting.client.channelStyle[channel]]);
    end

    if imeage_Channels[channel] ~= nil then
      imeage_Channels[channel].sprite = UI.GetSwitchSprite(Setting.client.channelEnable[channel]);
    end
  end

  for k, v in pairs(event_Functions) do
    if (k == 3 or k == 4) and Network.CheckServerSwitch(EServerSwitch.Review) then --3客服、4官網送審版本關閉
      v.gameObject:SetActive(false);
    else
      v.gameObject:SetActive(Function.CheckShow(229 + k));
    end
  
    if k == 5 then --NFT關閉帳號綁定按鈕
      v.gameObject:SetActive(false);
    end
  
    --安卓和PC關閉刪除帳號按鈕
    if LuaHelper.IsAndroidPlatform or LuaHelper.IsStandalone then
      if k == 6 then
        v.gameObject:SetActive(false);
      end
    end

  end
end

function UISetting.OnClick_Close()
  Setting.Save();
  
  UI.Close(UISetting);
  
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  
  return true;
end

--[[
function UISetting.OnClick_Tag(mainTag, subTag)
  currentTag = mainTag;
  currentSubPage = subTag;

  this.UpdateUI();

  return true;
end
--]]

function UISetting.OnClick_Function(uiEvent)
  if uiEvent.parameter == 1 then
    ---2--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local area =  DemoCode.CalTriangleArea(100, 100)
      area = area * 1 + 2;
      if area > DemoCode.GetBitxor(20) then  --test avg
        local avg = DemoCode.CalAvg(10, 20, 30);
      end
    end
    --3----------------------------------------------------
    
    --離開遊戲
    --GoogleAnalytics.Call("LogEvent", this.name, GAEventAction.ClickButton, GALabel.Quit);
    ShowCheckMessage(
      function(result)
        if result then
          Game.Quit();
        end
      end,
      string.Get(20394),
      Role.player
    );

  elseif uiEvent.parameter == 2 then
    --登出
    --GoogleAnalytics.Call("LogEvent", this.name, GAEventAction.ClickButton, GALabel.LogOut);
    ShowCheckMessage(
      function(result)
        if result then
          Game.Logout();
        end
      end,
      string.Get(20393),
      Role.player
    );

  elseif uiEvent.parameter == 3 then
    --客服中心
    local data = {};
    data["game_kind"] = 6;
    data["uid"] = Role.playerId;
    data["gamedata"] = {};
    data["gamedata"].server = serverName;
    data["gamedata"].id = tonumber(string.sub(Role.playerId, -10));
    data["gamedata"].nickname = Role.player.name;
    data["gamedata"].level = Role.player:GetAttribute(EAttribute.Lv);
    if LuaHelper.IsAndroidPlatform then
      data["gamedata"].version = string.Concat(string.Get(20773), LuaHelper.GetVersion());
    elseif LuaHelper.IsApplePlatform then
      data["gamedata"].version = string.Concat(string.Get(20774), LuaHelper.GetVersion());
    else
      data["gamedata"].version = string.Concat(string.Get(20775), LuaHelper.GetVersion());
    end
    data["systemdata"] = {};
    data["systemdata"].imei = SystemInfo.deviceUniqueIdentifier;
    data["systemdata"].os = SystemInfo.operatingSystem;
    data["systemdata"].phone = SystemInfo.deviceName;

    if Application.internetReachability == NetworkReachability.ReachableViaLocalAreaNetwork then
      data["systemdata"].network = "WIFI";
    elseif Application.internetReachability == NetworkReachability.ReachableViaCarrierDataNetwork then
      data["systemdata"].network = "手機連線網路";
    else
      data["systemdata"].network = "";
    end

    --GoogleAnalytics.Call("LogEvent", this.name, GAEventAction.ClickButton, GALabel.CustomerService);
    local url = string.Get(24065);
    Application.OpenURL(string.Concat(url, UnityWebRequest.EscapeURL(json.encode(data), DataManager.encoding_UTF8)));

  elseif uiEvent.parameter == 4 then
    --連結官網
    --GoogleAnalytics.Call("LogEvent", this.name, GAEventAction.ClickButton, GALabel.OfficialSite);
    Application.OpenURL(string.Get(24066));
  elseif uiEvent.parameter == 5 then
    --帳號綁定
    UI.Open(UIAccount);
  elseif uiEvent.parameter == 6 then
    --刪除帳號
    Setting.SendDeleteAccount(0);
  end
end

function UISetting.OnClick_PK()
  Setting.pkEnable = not Setting.pkEnable;

  --C:033-001 <PK開關> +PK開關(1)[0關 1開]
  sendBuffer:Clear()
  sendBuffer:WriteBoolean(Setting.pkEnable);
  Network.Send(33, 1, sendBuffer);

  this.UpdateUI();
  --GoogleAnalytics.Call("LogEvent", this.name, GAEventAction.ClickButton, GALabel.PK);
end

function UISetting.OnClick_War()
  Setting.client.playOneEnable = not Setting.client.playOneEnable;

  --C:033-002 <參戰開關> +參戰開關(1)[0關 1開]
  sendBuffer:Clear()
  sendBuffer:WriteBoolean(Setting.client.playOneEnable);
  Network.Send(33, 2, sendBuffer);

  this.UpdateUI();
  --GoogleAnalytics.Call("LogEvent", this.name, GAEventAction.ClickButton, GALabel.PlayOne);
end

function UISetting.OnDropChange_Player()
  Setting.client.playerInfoMode = dropdown_Player.value + 1;

  for k, v in pairs(Role.players) do
    v:UpdateViewVisible();
  end

  this.UpdateUI();
  --GoogleAnalytics.Call("LogEvent", this.name, GAEventAction.ClickButton, GALabel.PlayerInfo);
end

function UISetting.OnDropChange_Display()
  if dropdown_Display.value + 1 ~= Setting.client.DisplayMode then
    ShowCenterMessage(string.Get(23325));
  end
  
  Setting.client.DisplayMode = dropdown_Display.value + 1;
  
  this.SetDisplay();

  this.UpdateUI();
  
end

function UISetting.OnDropChange_Resolution()
  if Setting.client.resolution == dropdown_Resolution.value + 1 then
    return
  end
  Setting.client.resolution = dropdown_Resolution.value + 1;
  local width, height = this.GetResolution(dropdown_Resolution.value + 1);
  if width ~= nil and height ~= nil then
    Screen.SetResolution(width, height, false);
    Setting.Save();
  end
end

function UISetting.SetDisplay()
  if Setting.client.DisplayMode == 1 then
    TexturePool.SetMaxTextureSize(ETextureSize.high);
  elseif Setting.client.DisplayMode == 2 then
    TexturePool.SetMaxTextureSize(ETextureSize.middle);
  else
    TexturePool.SetMaxTextureSize(ETextureSize.low);
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
end

function UISetting.OnClick_NpcInfo()
  Setting.client.npcInfoMode = Setting.client.npcInfoMode + 1;
  if Setting.client.npcInfoMode > 2 then
    Setting.client.npcInfoMode = 1;
  end

  for k, v in pairs(Role.followNpcs) do
    for kk, vv in pairs(v) do
      vv:UpdateAllView();
    end
  end

  for k, v in pairs(Role.cartNpcs) do
    v:UpdateAllView();
  end

  this.UpdateUI();
  
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  --GoogleAnalytics.Call("LogEvent", this.name, GAEventAction.ClickButton, GALabel.NpcInfo);
end

function UISetting.OnClick_MusicEnable()
  Setting.client.musicEnable = not Setting.client.musicEnable;

  AudioManager.SwitchMusic(Setting.client.musicEnable);
  
  this.UpdateUI();
  --GoogleAnalytics.Call("LogEvent", this.name, GAEventAction.ClickButton, GALabel.NpcInfo);
end

function UISetting.OnClick_SoundEnable()
  Setting.client.soundEnable = not Setting.client.soundEnable;

  AudioManager.SwitchSound(Setting.client.soundEnable);
  
  this.UpdateUI();
  
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  --GoogleAnalytics.Call("LogEvent", this.name, GAEventAction.ClickButton, GALabel.Sound);
end

function UISetting.OnClick_ChannelEnable(uiEvent)
  Setting.client.channelEnable[uiEvent.parameter] = not Setting.client.channelEnable[uiEvent.parameter];

  this.UpdateUI();

  if UI.IsVisible(UINewChat) then
    UINewChat.UpdateMessage();
  end
end

function UISetting.OnClick_ChannelPrev(uiEvent)
  Setting.client.channelStyle[uiEvent.parameter] = Setting.client.channelStyle[uiEvent.parameter] - 1;

  if Setting.client.channelStyle[uiEvent.parameter] < 0 then
    Setting.client.channelStyle[uiEvent.parameter] = 9;
  end

  if Setting.client.channelStyle[uiEvent.parameter] > 9 then
    Setting.client.channelStyle[uiEvent.parameter] = 0;
  end

  this.UpdateUI();

  if UI.IsVisible(UINewChat) then
    UINewChat.UpdateMessage();
  end
end

function UISetting.OnClick_ChannelNext(uiEvent)
  Setting.client.channelStyle[uiEvent.parameter] = Setting.client.channelStyle[uiEvent.parameter] + 1;

  if Setting.client.channelStyle[uiEvent.parameter] < 0 then
    Setting.client.channelStyle[uiEvent.parameter] = 9;
  end

  if Setting.client.channelStyle[uiEvent.parameter] > 9 then
    Setting.client.channelStyle[uiEvent.parameter] = 0;
  end

  this.UpdateUI();

  if UI.IsVisible(UINewChat) then
    UINewChat.UpdateMessage();
  end
end

function UISetting.OnClick_ConfirmDeleteAccount()
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
        Setting.SendDeleteAccount(1);
      end
    end,
    string.Get(24080),
    Role.player
  );
end

function UISetting.OnClick_CheckCancelDeletAccount()
  ShowCheckMessage(
    function(result)
      if result then
        Setting.SendDeleteAccount(2);
      end
    end,
    string.Get(24098),
  Role.player
  );
end

function UISetting.GetResolution(option)
  if option == 1 then
    return 1280, 720
  elseif option == 2 then
    return 1600, 900
  elseif option == 3 then
    return 1920, 1080
  elseif option == 4 then
    return 800, 600
  end
end

--[[ 目前沒有接的功能
function UISetting.OnClick_MusicMode()
  Setting.client.musicMode = Setting.client.musicMode + 1;
  if Setting.client.musicMode > 2 then
    Setting.client.musicMode = 1;
  end

  AudioManager.SwitchSoundMode(Setting.client.musicMode);
  
  this.UpdateUI();
end

function UISetting.OnClick_MusicVolume(uiEvent)
  Setting.client.musicVolume = math.clamp(Setting.client.musicVolume + uiEvent.parameter, 0, 10);

  AudioManager.SetMusicVolume(Setting.client.musicVolume * 0.1);
  
  this.UpdateUI();
end

function UISetting.OnClick_SoundVolume(uiEvent)
  Setting.client.soundVolume = math.clamp(Setting.client.soundVolume + uiEvent.parameter, 0, 10);

  AudioManager.SetSoundVolume(Setting.client.soundVolume * 0.1);
  
  this.UpdateUI();
end

function UISetting.OnClick_ChannelBG(uiEvent)
  Setting.client.chatStyle = Setting.client.chatStyle + uiEvent.parameter;
  if Setting.client.chatStyle < 1 then
    Setting.client.chatStyle = 3;
  end

  if Setting.client.chatStyle > 3 then
    Setting.client.chatStyle = 1;
  end

  this.UpdateUI();
end
--]]