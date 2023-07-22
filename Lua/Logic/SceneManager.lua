ESceneType = {
  Map = 0, --大地圖
  Town = 1, --城鎮
  Hole = 2, --山洞
  Gym = 3, --練功區
  Topic = 4, --主題
  None = 255, --無
}

ESceneLimit = {
  NoDrop = 1, --不可丟棄物品
  NoUseItem = 2, --不可使用道具
  NoUseScroll = 3, --不可使用卷軸
  NoUseCharm = 4, --不可使用符咒
  NoTrade = 5, --不可進行安全交易
  NoTradePet = 6, --不可交易武將
  NoCatch = 7, --不可捕捉武將
  NoUPS = 8, --不可快遞
  NoPKNPC = 9, --不可PK NPC
  NoPKPlayer = 10, --不可PK 玩家
  NoJoinFight = 11, --不可參戰
  NoRide = 12, --不可騎馬
  NoMachinebox = 13, --不可使用機關盒
  NoFollowNpc = 14, --不顯示跟隨武將
  NoTeam = 15, --不可組隊
  ForcePK = 16, --強制PK
  NoDecExp = 17, --死亡不減少經驗
  NoPlayers = 18, --不顯示其它玩家
}

ESceneEffect = {
  None = 0, --無特效
  Leaf = 1, --落葉
  Snow = 2, --雪花
  Rain = 3, --下雷雨
  Dark = 4, --黑暗 元宵節活動用
  Star = 5, --星空
  OnlyRain = 6, --純下雨
  Cloud = 7, --大地圖雲
  Dragon = 8, --地獄場景光影
}

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

SceneManager = {};
local this = SceneManager;

this.changeSceneCheckCode = nil;
this.sceneId = 0; --場景編號
this.areaId = 0; --區域
this.instanceId = 0; --分流
this.dungeonId = 0;
this.dragonBoatEffect = nil;

this.sceneState = {
  sceneTag = 0,
  type = ESceneType.None, 
  name = "", 
  moveSpeed = 0,
  followDistance = math.pow(45, 2),
  bumpDistance = math.pow(80, 2),
  mapNpcTable = nil,
  goodsTable = nil,
  doorTable = nil,
  mineTable = nil,
  surfaceTable = nil,
  sceneInfoTable = nil,
  groupTable = nil,
  npcEventTable = nil,
  fightTable = nil,
  active = false,
};

local roleRoot = nil;
local elementRoot = nil;
local doorRoot = nil;

function SceneManager.Initialize()
  NotifyManager.Register(ENotifyManager.ExitScene, "SceneManager", this.OnExitScene);

  roleRoot = GameObject.Find("RoleRoot");
  elementRoot = GameObject.Find("ElementRoot");
  doorRoot = GameObject.Find("DoorRoot");
end

function SceneManager.GetNothing()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function SceneManager.GetNothing1()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function SceneManager.ExitScene(callBack, checkCode)
  if checkCode == nil then
    this.changeSceneCheckCode = math.random();
  end

  MoviePlayer.freeze = false;
  MoviePlayer.state = EMovieState.Idle;
  MoviePlayer.ClearMovie();

  this.Hide();

  NotifyManager.Notify(ENotifyManager.ExitScene);

  TexturePool.Clear();

  if this.dragonBoatEffect ~= nil then
    this.dragonBoatEffect:Stop();
  end
  
  CGResourceManager.ClearMemory(0.5, 0.5,
    function()
      if callBack == nil then return end
      if checkCode ~= nil and this.changeSceneCheckCode ~= checkCode then return end

      callBack(checkCode);
    end
  );
end

function SceneManager.GetNothing2()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function SceneManager.OnExitScene()
  this.sceneId = 0;
  this.areaId = 0;
  this.instanceId = 0;
  this.dungeonId = 0;

  this.sceneState.sceneTag = 0;
  this.sceneState.type = ESceneType.None;
  this.sceneState.moveSpeed = Role.baseSpeed;
  this.sceneState.name = "";

  this.sceneState.mapNpcTable = nil;
  this.sceneState.goodsTable = nil;
  this.sceneState.doorTable = nil;
  this.sceneState.mineTable = nil;
  this.sceneState.surfaceTable = nil;
  this.sceneState.sceneInfoTable = nil;
  this.sceneState.groupTable = nil;
  this.sceneState.npcEventTable = nil;
  this.sceneState.fightTable = nil;

  this.sceneState.active = false;
end

function SceneManager.ChangeScene(sceneId, sceneTag, instanceId)
  this.changeSceneCheckCode = math.random();

  this.ExitScene(
    function(checkCode)
      if checkCode ~= nil and this.changeSceneCheckCode ~= checkCode then return end

      if eveHeaderDatas[sceneId] ~= nil then
        DataManager.ReadData(DataManager.eveDataPath,
          function(file)
            if checkCode ~= nil and this.changeSceneCheckCode ~= checkCode then return end

            local reader = DatReader.New(file, 0, 0, 0, 0, 0, eveHeaderDatas[sceneId].position, eveHeaderDatas[sceneId].size);
            
            if Resource.IsNeedDownloadResource(sceneId) then return end

            this.OnEnterScene(EventData.New(reader), checkCode);
          end
        );
      else
        if Resource.IsNeedDownloadResource(sceneId) then return end

        logError(string.Concat("eveHeaderDatas[", sceneId, "] = nil"));
        this.OnEnterScene(nil, checkCode);
      end
    end,
    this.changeSceneCheckCode
  );

  local sceneData = sceneDatas[sceneId];

  this.sceneId = sceneId;
  this.areaId = 0;
  this.instanceId = instanceId;
  this.dungeonId = 0;
  if sceneData ~= nil and sceneData.kind == 2 then
    for k, v in pairs(dungeonDatas) do
      if v.sceneId == sceneId then
        this.dungeonId = v.id;
        break;
      end
    end
  end

  if sceneTag == nil then
    sceneTag = 0;
    if sceneData ~= nil then
      for k in pairs(sceneData) do
        sceneTag = k;
        break;
      end
    end
  end

  this.sceneState.sceneTag = sceneTag;

  local sceneHead = math.floor(sceneId / 1000);
  local sceneRound = sceneId % 1000;
  local sceneOneNum = math.floor(sceneRound / 100);

  --吞M新增大地圖區間
  if (sceneId >= 40000) and (sceneId <= 42000) then
    sceneRound = 0;
    sceneOneNum = 0;
  end
  
  if Contains(sceneId, 12804, 12822, 13452, 13842, 13843, 15841, 15842, 20852) then
    --例外山洞
    this.sceneState.type = ESceneType.Hole;
    this.sceneState.moveSpeed = Role.baseSpeed;
    this.sceneState.followDistance = math.pow(45, 2);
    this.sceneState.bumpDistance = math.pow(80, 2);

  elseif sceneOneNum == 8 and sceneHead ~= 10 then
    --練功區
    this.sceneState.type = ESceneType.Gym;
    this.sceneState.moveSpeed = Role.baseSpeed;
    this.sceneState.followDistance = math.pow(45, 2);
    this.sceneState.bumpDistance = math.pow(80, 2);

  elseif sceneOneNum == 5 or sceneOneNum == 6 then
    --山洞
    this.sceneState.type = ESceneType.Hole;
    this.sceneState.moveSpeed = Role.baseSpeed;
    this.sceneState.followDistance = math.pow(45, 2);
    this.sceneState.bumpDistance = math.pow(80, 2);

  elseif sceneRound ~= 0 then
    --場景
    this.sceneState.type = ESceneType.Town;
    this.sceneState.moveSpeed = Role.baseSpeed;
    this.sceneState.followDistance = math.pow(45, 2);
    this.sceneState.bumpDistance = math.pow(80, 2);

  else
    --大地圖
    this.sceneState.type = ESceneType.Map;
    this.sceneState.moveSpeed = Role.baseSpeed * 0.6;
    this.sceneState.followDistance = math.pow(20, 2);
    this.sceneState.bumpDistance = math.pow(40, 2);
  end

  if sceneData ~= nil then
    if sceneData.subId > 0 then
      this.sceneState.name = string.Concat(sceneData.name, sceneData.subId);
    else
      this.sceneState.name = sceneData.name;
    end
  else
    this.sceneState.name = "";
  end
  
  City.cityId = City.GetCityId(sceneId);
  Survive.kind = Survive.GetSurviveKind(sceneId);
  Battle.scene = Battle.GetSceneKind(sceneId);
  Warship.scene = Warship.GetSceneKind(sceneId);
end

function SceneManager.OnEnterScene(eventData, checkCode)
  if checkCode ~= nil and this.changeSceneCheckCode ~= checkCode then return end

  if eventData ~= nil then
    this.sceneState.mapNpcTable = eventData.Npc;
    this.sceneState.goodsTable = eventData.Goods;
    this.sceneState.doorTable = eventData.Door;
    this.sceneState.mineTable = eventData.Mine;
    this.sceneState.surfaceTable = eventData.Surface;
    this.sceneState.sceneInfoTable = eventData.SceneInfo;
    this.sceneState.groupTable = eventData.Group;
    this.sceneState.npcEventTable = eventData.NpcEvent;
    this.sceneState.fightTable = eventData.Fight;	
  end

  this.sceneState.active = true;

  NotifyManager.Notify(ENotifyManager.EnterScene, checkCode);

  SceneEffect.SetShowEffectSW(this.sceneId, this.sceneState.type);

  --進出副本介面開關
  if UI.IsVisible(UIMain) then 
    UIMain.UpdateDungeon();
    UIMain.UpdateMining();
  end

  if sceneDatas[this.sceneId] ~= nil and sceneDatas[this.sceneId].kind == 2 then 
    if UI.IsVisible(UIDungeon) then 
      UI.Close(UIDungeon);
    end
  end

  this.UpdateArea();

  if MoviePlayer.freeze then  
    if MoviePlayer.state == EMovieState.End then
      MoviePlayer.state = EMovieState.Idle;
      MoviePlayer.ClearMovie();
    end
  end

  CGResourceManager.ClearMemory(0.5, 0,
    function()
      if checkCode ~= nil and this.changeSceneCheckCode ~= checkCode then return end

      --C:012-001 <換場景完畢>
      Network.Send(12, 1);

      this.Show();

      if Define.SuperAI and this.dungeonId ~= 0 then
        MachineBox.SetAutoMove(true);
      else
        if MachineBox.client.general[EMachineBoxSwitch.AutoLogin] and MachineBox.autoMove then
        else
          MachineBox.SetAutoMove(false);
        end
      end
    end
  );
end

function SceneManager.GetNothing3()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function SceneManager.GetNothing4()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end


function SceneManager.GetNothing5()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function SceneManager.Show()
  if Role.player == nil then return end
  if FightField.isInBattle then return end

  --mask
  UILoading.FadeIn(nil, nil, 1);

  --object
  roleRoot:SetActive(true);
  elementRoot:SetActive(true);
  doorRoot:SetActive(true);

  --ui
  if not UI.IsVisible(UIMain) then
    UI.Open(UIMain);
  end

  if not UI.IsVisible(UINewChat) then
    UI.Open(UINewChat);
  end

  if not UI.IsVisible(UIShowSceneEffect) then
    UI.Open(UIShowSceneEffect);
  end

  --龍舟場景
  if DragonBoat.InRaceScene() then
    if not UI.IsVisible(UIDragonBoat) then
      UI.Open(UIDragonBoat);
    end

    return;
  end

  if not UI.IsVisible(UIInteractive) then
    UI.Open(UIInteractive);
  end

  if not UI.IsVisible(UIMainFunction) then
    UI.Open(UIMainFunction);
  end

  if not UI.IsVisible(UIMiniMap) then
    UI.Open(UIMiniMap);
  end

  if not UI.IsVisible(UIJoystick) then
    UI.Open(UIJoystick);
  end
end

function SceneManager.Hide()
  --mask
  UILoading.ImmediateOut();

  --do something
  TargetManager.CancelTarget();

  if Role.player ~= nil then
    Role.player:StopMove();
  end

  if CGTimer.ContainsListener(MoveController.SendRolePosition) then
    CGTimer.RemoveListener(MoveController.SendRolePosition);
  end

  --object
  roleRoot:SetActive(false);
  elementRoot:SetActive(false);
  doorRoot:SetActive(false);

  --ui
  --UI.Close(UIMain);
  --UI.Close(UINewChat);
  UI.Close(UIInteractive);
  UI.Close(UIMainFunction);
  UI.Close(UIEmotion);
  UI.Close(UIAction);
  UI.Close(UIMiniMap);
  UI.Close(UIJoystick);
  UI.Close(UIShowSceneEffect);

  --UI.Close(UIInvitation);
  --UI.Close(UITeleport);
  --UI.Close(UIDungeon);

  --event ui
  UI.Close(UIMessageboard);
  UI.Close(UIShop);
  --UI.Close(UINpcInn);
  UI.Close(UITrade);
  UI.Close(UIDragonBoat);
end

function SceneManager.GetNothing6()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function SceneManager.GetNothing7()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function SceneManager.GetNothing8()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function SceneManager.GetNothing9()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function SceneManager.UpdateArea()
  this.areaId = DoorManager.GetArea(Role.player.position);
  --logError(string.Concat("AreaId = ", this.areaId));
end

function SceneManager.CheckLimit(sceneId, kind)
  if sceneDatas[sceneId] == nil then return false end

  return CheckFlag(sceneDatas[sceneId].limits, kind);
end

--navigation
function SceneManager.GetPath(sceneId, areaId, targetPosition, currentPosition)
  if sceneDatas[sceneId] == nil then return end
  if areaId == 0 then return end
  if this.areaId == 0 then return end
  
  if sceneId == this.sceneId and areaId == this.areaId then
    return Vector2.New(targetPosition.x + MapManager.centerLeft, targetPosition.y + MapManager.centerTop);
  end

  local portalScene, portals, text = this.GetPathRecursively(this.sceneId * 1000 + this.areaId, sceneId * 1000 + areaId);

  if Define.IsDebugMode() then
    logError(string.Concat("Get Path ", this.sceneId, "(", this.areaId, ")", " to ", sceneId, "(", areaId, ")"));
    logError(text);
  end

  if portalScene == nil then return end

  local minDistance = nil;
  local portalPosition = nil;
  if portals ~= nil then
    for k, v in pairs(portals) do
      local doorId = math.floor(v * 0.001);
      local doorPriority = v % 1000;

      local doorPosition = DoorManager.GetDoorIdPosition(doorId);
      if doorPosition ~= nil then
        local sqrDistance = (doorPosition - currentPosition).sqrMagnitude - (doorPriority * 10000000);
  
        if minDistance == nil or sqrDistance < minDistance then
          minDistance = sqrDistance;
          portalPosition = doorPosition;
        end
      end
    end
  end
  
  return portalPosition;
end

function SceneManager.GetPathRecursively(searchCodes, targetCode, checkedScenes)
  if type(searchCodes) ~= "table" then
    searchCodes = { searchCodes };
  end

  if checkedScenes == nil then
    checkedScenes = {};
  end

  for i = 1, table.maxn(searchCodes) do
    checkedScenes[searchCodes[i]] = true;

    if navigationDatas[searchCodes[i]] ~= nil then
      if navigationDatas[searchCodes[i]][targetCode] ~= nil then
        local text = nil;
        
        if Define.IsDebugMode() then
          text = string.Concat(math.floor(searchCodes[i] / 1000), "(", (searchCodes[i] % 1000), ")", " -> ", math.floor(targetCode / 1000), "(", (targetCode % 1000), ")");
        end
        
        return searchCodes[i], navigationDatas[searchCodes[i]][targetCode], text;
      end
    end
  end

  local nextScenes = {};
  for i = 1, table.maxn(searchCodes) do
    if navigationDatas[searchCodes[i]] ~= nil then
      for k, v in pairs(navigationDatas[searchCodes[i]]) do
        if checkedScenes[k] == nil then
          table.insert(nextScenes, k);
        end
      end
    end
  end

  if table.maxn(nextScenes) == 0 then return end

  local portalScene, portalPosition, text = this.GetPathRecursively(nextScenes, targetCode, checkedScenes);

  if portalScene == nil then return end

  for i = 1, table.maxn(searchCodes) do
    if navigationDatas[searchCodes[i]] ~= nil then
      if navigationDatas[searchCodes[i]][portalScene] ~= nil then
        if Define.IsDebugMode() then
          text = string.Concat(math.floor(searchCodes[i] / 1000), "(", (searchCodes[i] % 1000), ")", " -> ", text);
        end

        return searchCodes[i], navigationDatas[searchCodes[i]][portalScene], text;
      end
    end
  end

  return;
end

function SceneManager.GetNothing10()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function SceneManager.GetNothing11()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end
