require "Common/define"
require "Common/functions"
require "Common/string"
require "Common/TextParse"

require "Logic/DataManager"
require "Logic/Event/EventManager"
require "Logic/Map/Scene"
require "Logic/Map/MapManager"
require "Logic/SceneManager"
require "Logic/SceneEffect/SceneEffect"
require "Logic/NotifyManager"
require "Logic/MapNpcManager"
require "Logic/DoorManager"
require "Logic/GdThingManager"

require "Logic/Plugins/PluginManager"
require "Logic/Plugins/GoogleAnalytics"
require "Logic/Plugins/TalkingDataPlugin"
require "Logic/Plugins/Notification"

require "Logic/LuaClass"
require "Logic/CtrlManager"
require "Logic/Item"
require "Logic/Role"
require "Logic/Social"
require "Logic/WorldBoss"
require "Logic/Calculator"
require "Logic/City"
require "Logic/Warship"
require "Logic/Astrolabe"
require "Logic/DrugBuff"
require "Logic/Chat"
require "Logic/Inn"
require "Logic/Organization"
require "Logic/MarkManager"
require "Logic/AudioManager"
require "Logic/FightField"
require "Logic/FightManager"
require "Logic/EffectLight"
require "Logic/Setting"
require "Logic/MachineBox"
require "Logic/NpcStore"
require "Logic/Resource"
require "Logic/Team"
require "Logic/Battle"
require "Logic/Survive"
require "Logic/Migrant"
require "Logic/Galaxy"
require "Logic/Event/MovieObjectManager"
require "Logic/Event/MoviePlayer"
require "Logic/Mall"
require "Logic/Achievement"
require "Logic/Marry"
require "Logic/JumpText"
require "Logic/TargetManager"
require "Logic/BitFlag"
require "Logic/Compound"
require "Logic/Mounts"
require "Logic/RoleCount"
require "Logic/Dungeon"
require "Logic/Announcement"
require "Logic/Invitation"
require "Logic/RedDot"
require "Logic/FindWay"
require "Logic/UISell"
require "Logic/StoreValue"
require "Logic/Dispatch"
require "Logic/Function"
require "Logic/Jiugongge"
require "Logic/UniversalJmp"
require "Logic/CollectStyle"
require "Logic/CollectCard"
require "Logic/CheckCondition"
require "Logic/Hotkey"
require "Logic/Cart"
require "Logic/DragonBoat"
require "Logic/DataFight"
require "Logic/ExclusiveWeapon"
require "Logic/ArmyLuckyBag"
require "Logic/HouseBoard"
require "Logic/SouvenirShop"
require "Logic/Monopoly"
require "Logic/MissionAward"
require "Logic/HouseEditorManager"
require "Logic/HouseManager"
require "Logic/FurnitureManager"
require "Logic/Furniture"
require "Logic/FurnitureCollection"
require "Logic/WarriorInHouse"
require "Logic/Breakthrough"
require "Logic/Market"
require "Logic/Requiem"
require "Logic/BattlePass"
require "Controller/AnimationController"
require "Controller/MoveController"
require "Controller/UI"
require "Controller/FurnitureController"
require "Common/DemoCode_demo"
require "Common/DemoScript_demo"
require "Common/DemoFunction_demo"

require "Common/CGTimer"
require "Logic/Activity"

require "IAP/IAP"
require "IAP/IAPData"
require "IAP/MyCard"
require "IAP/AliPay"
require "IAP/PointCard"

--管理器--
Game = {};
local this = Game;

local co = nil;

function Game.InitViewPanels()

end

--初始化完成，发送链接服务器信息--
function Game.Start()
  log("Game.Start !!");
  math.randomseed(os.time())

  LuaHelper.SetChildsActive(GameObject.Find("Scene"), true);
  LuaHelper.SetChildsActive(GameObject.Find("FightScene"), true);


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
  UI.Initialize();
  UI.Open(UILoading);

  Game.InitializeTest();
  CGTimer.Initialize();
  Setting.Initialize();
  City.Initialize();
  Battle.Initialize();
  Warship.Initialize();
  EventManager.Initialize();
  Scene.Initialize();
  AudioManager.Initialize();
  MarkManager.Initialize();
  Announcement.Initialize();
  CGGoogleSignIn.Init();
  CGFacebook.Init();
  CGAppleSignIn.Init();

  co = coroutine.create(Game.StartLoadTSRemak);

  --CGTimer.AddListener(this.CheckTextureManagerCost, 60, false);
end

function Game.InitializeTest()
  if LuaHelper.IsEditor and not LuaHelper.CheckDefine("ForceUseAsset") then
    require "Test/MissionPathTest"
    require "Test/tableio"
  end
end

function Game.Update()
  if co ~= nil then
    if coroutine.status(co) == "suspended" then
      coroutine.resume(co);
    else
      co = nil;
    end
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
  CGTimer.Update();
  Network.Update();
  UI.Update();
  Role.Update();
  FightField.Update();
  EffectLight.Update();
  AudioManager.Update();
  MoviePlayer.Update();
  JumpText.Update();
  EventManager.Update();
  Game.Input();
end

function Game.CheckTextureManagerCost()
  TextureManager.CheckTextureCost();
end

function Game.StartLoadTSRemak()
  if not LuaHelper.IsApplePlatform or Resource.HaveDownloadResource() then    
    Resource.SaveDownloadResource();
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
    UILoading.StartLoadAsset();

    log("Resource.CheckResourceSize");
    Resource.CheckResourceSize();
    while not Resource.checkSizeDone do
      coroutine.yield();
    end

    log("Resource.LoadAllAssets");
    Resource.LoadAllAssets();
    while not Resource.assetLoaded do
      coroutine.yield();
    end

    log("Resource.UpdateDataPacked");
    Resource.UpdateDataPacked();
    while not Resource.dataLoaded do
      coroutine.yield();
    end

    log("Resource.UpdateResourcePacked");
    Resource.UpdateResourcePacked();
    while not Resource.imageLoaded do
      coroutine.yield();
    end

    Resource.SaveDownloadDone();
  end

  if Resource.HaveDownloadResource() then
    UILoading.SetSliderText(Str_LoadData);
    UILoading.SetSliderValue(0.8);--80%

    local sec = tonumber(os.clock() + 0.5); 
    while (os.clock() < sec) do 
      coroutine.yield();
    end 
  end

  log("CGAtlas.Initialize");
  CGAtlasManager.Initialize();
  while not CGAtlasManager.initialized do
    coroutine.yield();
  end

  log("DataManager.Initialize");
  DataManager.Initialize();
  while not DataManager.initialized do
    coroutine.yield();
  end

  if Resource.HaveDownloadResource() then
    UILoading.SetSliderText(Str_LoadResource);
    UILoading.SetSliderValue(0.95);--95%

    local sec = tonumber(os.clock() + 0.5); 
    while (os.clock() < sec) do 
      coroutine.yield();
    end 
  end

  log("Network.Initialize");
  Network.Initialize();
  while not Network.initialized do
    coroutine.yield();
  end

  log("UI.LoadTextAsset");
  UI.LoadText();
  while not UI.CheckLoad() do
    coroutine.yield();
  end

  log("UI.LoadSomething");
  UI.LoadSomething();
  while not UI.CheckLoad() do
    coroutine.yield();
  end

  log("TextureManager.Initialize");
  TextureManager.Init();

  log("RolePicManager.Initialize");
  RolePicManager.Init();

  log("UniversalJmp.Initialize");
  UniversalJmp.Initialize();

  log("Role.Initialize");
  Role.Initialize();

  log("MapManager.Initialize");
  MapManager.Initialize();

  log("EffectLight.Initialize");
  EffectLight.Initialize();

  log("FightField.Initialize");
  FightField.Initialize();

  log("SceneManager.Initialize");
  SceneManager.Initialize();

  log("MapNpcManager.Initialize");
  MapNpcManager.Initialize();

  log("DoorManager.Initialize");
  DoorManager.Initialize();

  log("HouseManager.Initialize");
  HouseManager.Initialize();

  log("GdThingManager.Initialize");
  GdThingManager.Initialize();

  log("MovieObjectManager.Initialize");
  MovieObjectManager.Initialize();

  log("MoviePlayer.Initialize");
  MoviePlayer.Initialize();

  log("JumpText.Initialize");
  JumpText.Initialize();

  log("RoleCount.Initialize");
  RoleCount.Initialize();

  log("CheckCondition.Initialize");
  CheckCondition.Initialize();

  log("Organization.Initialize");
  Organization.Initialize();

  log("UILoading.LoadMaterial");  
  UILoading.LoadMaterial();

  if Resource.HaveDownloadResource() then
    UILoading.SetSliderValue(1);--100%

    local sec = tonumber(os.clock() + 0.5); 
    while (os.clock() < sec) do 
      coroutine.yield();
    end 
  end

  --Open UI
  log("Open UI");
  UI.Open(UICenterMessage);
  UI.Open(UIMarqueeMessage);

  if CGResourceManager.ReadText(UIUseContract.ContractName) == "" or CGResourceManager.ReadText(UIUseContract.PrivacyName) == "" then
    UI.Open(UIUseContract);
  else
    UI.Open(UILogin);
  end

  --Preload UI
  log("Preload UI")
  Game.PreLoadUI();

  --PreLoadParticle
  Game.PreLoadParticle();

  UI.Close(UILoading);
  UILoading.ClearLoadingBG();

  CGResourceManager.ClearMemory(0, 0, nil);
end

function Game.Logout(restart)
  if UI.IsVisible(UILogin) then
    UILogin.LoginFail();
    return;
  end

  if Setting.client.lastLoginKind == ELogin.Google then
    CGGoogleSignIn.Logout();
  elseif Setting.client.lastLoginKind == ELogin.FB and LuaHelper.IsStandalone then
    CGFacebook.Logout();
  elseif Setting.client.lastLoginKind == ELogin.Apple then
    CGAppleSignIn.Logout();
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
  MachineBox.SetAutoFight(false, true);
  EventManager.ClearEventState();
  
  --斷線
  Network.Disconnect();
  --BUFF到期檢查
  CGTimer.RemoveListener(DrugBuff.CheckTimeBuff);
  
  --清資料
  this.ClearAll();

  if restart then
    Resource.UserCheckUpdate();
  else
    UI.Open(UILogin);
  end
end

function Game.ClearAll()
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
  EffectLight.ClearAll();
  SceneManager.ExitScene();
  WorldBoss.Clear();
  Role.Clear();
  Item.Clear();
  GdThingManager.Clear();
  MarkManager.Clear();
  FightField.ExitFight(true);
  Mounts.Clear();
  Achievement.Clear();
  Team.Clear();
  Social.Clear();
  RoleCount.Clear();
  Dungeon.Clear();
  Invitation.Clear();
  Chat.Clear();
  MachineBox.Clear();
  DrugBuff.Clear();
  UISell.Clear();
  Inn.Clear();
  Organization.Clear();
  Dispatch.Clear();
  RedDot.Clear();
  UICenterMessage.Clear();
  UIFurnace.Clear();
  Jiugongge.Clear();
  CollectStyle.Clear();
  CollectCard.Clear();
  Mall.ClearDoro();
  DefendSmokeShow.Clear();
  StoreValue.Clear();
  Activity.Clear();
  UILoginAward.Clear();
  UIMiniMap.Clear();
  UISlotMachine.Clear();
  UITeleport.Clear();
  UILimitedTimeSale.ClearData();
  Cart.Clear();
  UIPoke.Clear();
  Astrolabe.Clear();
  DataFight.Clear();
  City.Clear();
  UICompound.ClearAffixInfo();
  ArmyLuckyBag.Clear();
  Breakthrough.Clear();
  Requiem.Clear();
  UISoul.ClearAffInfo();
  if UI.IsVisible(UINewChat) then
    UINewChat.ClearMessage();
  end
  
  UI.ResetShow();
  UI.CloseAll();
end

function Game.OnLogin()
  --資料傳完、登入遊戲

  PluginManager.Init();
  PluginManager.GameStart();

  --設定插件資料
  PluginManager.Login(Role.playerId);
  PluginManager.SetServer(Network.serverId);
  PluginManager.SetLevel(Role.player:GetAttribute(EAttribute.Lv));

  --成就登入後相關
  Achievement.InitTotalScore();
  Achievement.CheckMainFunctionRedDot();
  Achievement.CheckAllCompeleteAchievement();

  --九宮格登入後相關
  Jiugongge.Initialize();
  Jiugongge.CheckMainFunctionRedDot();

  --慶典登入後相關
  UIFestival.UpdateRedDot();
  
  --通行證登入後相關
  BattlePass.RequireCheckBattlePassFunction(EBattlePassReuireState.CheckRedDot);
  
  --關介面
  UI.Close(UILogin);

  --等主介面打開後開介面
  CGTimer.AddListener(this.WaitUIMain, 0.1);

  --福利紅點
  UILoginAward.ActiveRedDot();
  CGTimer.AddListener(UILoginAward.UpdateRedDot, 60, true);

  --BUFF到期檢查
  CGTimer.AddListener(DrugBuff.CheckTimeBuff, 60, false);

  --商城紅點
  Mall.ClearDoroCheck();
  Mall.IsRedDot();

  Requiem.Init();
  UIMonopoly.SetAutoRoll(false);
  UICharmFeedback.CheckRedDot();

  --推播設定
  --Notification.Init();

  --玩家上線直接先檢查是否有掉單
  IAP.LoginCheckOrder();
  
  UICollectBook.CalShineValue(true);

  MachineBox.Initialize();
  NpcStore.Initialize();
  Social.Initialize();
  Dungeon.Initialize();
end

function Game.WaitUIMain()
  if UI.IsVisible(UIMain) then
    if MarkManager.GetMissionFlag(11804) then
      Announcement.CheckHaveAnnouncement();
    end

    UILoginAward.CheckOpenExp();

    if Define.IsDebugMode() then
      UI.Open(UIDebug);
    end

    CGTimer.RemoveListener(this.WaitUIMain);
  end
end

function Game.PreLoadUI()
  UI.Preload(UIMain, false);
  UI.Preload(UIMainFunction, false);
  UI.Preload(UIMiniMap, false);
  UI.Preload(UIJoystick, false);
  UI.Preload(UIShowSceneEffect, false);

  UI.Preload(UIFight, false);
  UI.Preload(UIFrame, false);
  UI.Preload(UIValueBar, false);
  UI.Preload(UINewChat, false);
  UI.Preload(UIInteractive, false);
  UI.Preload(UIPlayAnimation, false);
  UI.Preload(UIBag, false);
  UI.Preload(UIItemInfo, false);
--  UI.Preload(UIDispatch, false);
end

function Game.PreLoadParticle()
  CGParticleManager.PreLoad(1);
end

function Game.Input()
  if Input.GetKeyDown(KeyCode.Escape) then
    if UI.IsVisible(UILoading) or UI.IsVisible(UIFight) then return end

    local currentUI = UI.GetCurrentUI();

    if currentUI == UILogin then
      Game.ShowQiutMessage();
    elseif currentUI ~= nil then
      --UI.Close(currentUI);
    else
      Game.ShowQiutMessage();
    end
  end
end

function Game.ShowQiutMessage()
  ShowCheckMessage(
    function(result)
      if result then
        Game.Quit();
      end
    end,
    string.Get(50112)
  );
end

function Game.OnApplicationFocus(focus)
end

function Game.OnApplicationPause(pause)
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

function Game.OnApplicationQuit(pause)
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

function Game.Quit()
  PluginManager.QuitGame();

  LuaHelper.Quit();
end

--销毁--
function Game.OnDestroy()
  --logWarn('OnDestroy--->>>');
  PluginManager.QuitGame();
end
