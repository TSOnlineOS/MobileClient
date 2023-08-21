EFunction = {
  FirstIAP = 1, --首儲
  Welfare = 3, --福利
  Mall = 4, --商城
  Invitation = 5, --邀請
  Ride = 6, --騎馬
  MachineBox = 7, --機關盒
  SkillTree = 8, --特技
  Equip = 9, --背包
  Status = 10, --狀態
  Team = 11, --隊伍
  Mission = 12, --任務
  Dungeon = 13, --副本
  Social = 14, --好友
  Organization = 15, --軍團
  Compound = 16, --合成
  Mounts = 17, --座騎
  Leaderboard = 18, --排行榜
  Achievement = 19, --成就
  Activity = 20, --活動
  Mail = 21, --信件
  Setting = 22, --設定
  Chat = 23, --聊天
  Emoji = 24, --表情
  Action = 25, --動作
  Dispatch = 26, --派遣
  BeeMove = 27, --自動行走
  AutoFight = 28, --自動戰鬥
  SlotMachine = 29, --轉轉樂
  Furnace = 30, --熔爐
  Jiugongge = 31, --日常
  Teleport = 32, --介面傳送
  Tutorial = 33, --吞食寶典
  CollectBook = 34, --收集冊
  FightAttack = 35, --戰鬥中攻擊
  FightSkill = 36, --戰鬥中特技
  FightDefense = 37, --戰鬥中防禦
  FightCatch = 38, --戰鬥中捕捉
  FightEscape = 39, --戰鬥中逃跑
  FightSOS = 40, --戰鬥中求救
  FightWinLose = 41, --戰鬥中勝敗條件
  FightBag = 42, --戰鬥中背包
  FightTeam = 43, --戰鬥中隊伍
  FightScout = 44, --戰鬥中偵查
  Auction = 45, --交易所
  BeStronger = 46, --變強
  Festival = 47, --慶典活動
  Title = 48, --稱號
  ExitWatchCity = 49, --離開督戰
  ExpSlotMachine = 50, --武將拉霸
  LimitedTimeSale = 51, --限時購買
  SeniorElection = 52, --學姊投票
  Cart = 53, --馬車
  Poke = 54, --戳戳樂
  SportsElection = 55, --競技慶典投票
  ServerLuckyBag = 56, --伺服器福袋
  UnboundedAct = 57, --無界活動
  PurchaseFree = 58, --免單
  ArmyLuckyBag = 59, --軍團紅包
  House = 60, --小屋
  HouseSetting = 61, --小屋設定
  HouseEdit = 62, --小屋編輯
  OtherHouse = 63, --其他小屋
  LeaveHouse = 64, --離開小屋
  Godskin = 65, --神話裝
  Soul = 66,  --靈魂
  Elf = 67,  --精靈
  Web = 68,  --Web拍賣
  Requiem = 69, --鎮魂
  BattlePass = 70, --通行證
  Mine = 71,  --挖礦
  Gacha = 73,  --抽抽樂
}

Function = {}
local this = Function;

this.functionObjects = {};

function Function.FindId(kind, group)
  for k, v in pairs(functionDatas) do
    if v.kind == kind then
      if group == nil or v.group == group then
        return k;
      end
    end
  end

  return 0;
end

function Function.PrefabInitialize(group, root)
  for k, v in pairs(functionDatas) do
    if v.group == group then
      this.functionObjects[k] = {};
      this.functionObjects[k].animation = nil;
      this.functionObjects[k].gameObject = poolMgr:Get("BaseUIFunction");
      this.functionObjects[k].gameObject.name = string.Concat("Function (", k, ")");

      local tempTransform = this.functionObjects[k].gameObject.transform;
      tempTransform:SetParent(root);
      tempTransform.localScale = Vector3.one;

      this.functionObjects[k].image_Ani = tempTransform:Find("RawImage_Ani"):GetComponent("UIRawImage");
      this.functionObjects[k].image_Icon = tempTransform:Find("Image_Function"):GetComponent("Image");
    
      local tempEvent = tempTransform:GetComponent("UIEvent");
      tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick);
      tempEvent.parameter = k;
      
      if v.aniBtn == '0' then
        this.functionObjects[k].image_Icon.sprite = UI.GetSprite(v.icon);
        this.functionObjects[k].image_Ani.gameObject:SetActive(false);
      else
        TextureManager.SetPng(ETextureUseType.None, v.aniBtn, this.functionObjects[k].image_Ani);
        this.functionObjects[k].image_Ani:ShiftUV(1, 4, 0.1, -1);
        this.functionObjects[k].animation = true;
        this.functionObjects[k].image_Icon.gameObject:SetActive(false);
      end
      
      this.functionObjects[k].text_Name = tempTransform:Find("Text_T21"):GetComponent("Text");
      this.functionObjects[k].text_Name.text = string.Get(v.name);

      this.functionObjects[k].image_RedDot = tempTransform:Find("Image_Dot"):GetComponent("Image");
      this.functionObjects[k].image_RedDot.gameObject:SetActive(false);
    end
  end
end

function Function.CheckShow(functionId)
  if Role.player == nil then return false end
  if DragonBoat.InRaceScene() then return false end --龍舟場景

  local functionData = functionDatas[functionId];

  if functionData == nil then return false end
  if functionData.showLv > 0 and not Role.CheckPlayerLv(functionData.showLv) then return false end

  if functionData.showFlag > 0 and not MarkManager.GetMissionFlag(functionData.showFlag) then
    if functionData.kind == EFunction.Mall and Network.serverSwitch == EServerSwitch.Review then
      return true;
    else
      return false;
    end
  end

  if bit.band(functionData.serverSwitch, Network.serverSwitch) ~= 0 then return false end

  if Role.player ~= nil and Role.player.data.isWatching and Contains(functionData.group, 1, 2, 3) and not Contains(functionData.kind, EFunction.Setting, EFunction.ExitWatchCity) then
    return false;
  end

  if Network.InUnbound and CheckFlag(functionData.serverSwitch, 3) then 
    return false     
  end --在無界不顯示

  if functionData.group == 2 then
    if UI.IsVisible(UIFight) then
      if not Contains(functionData.kind, EFunction.Setting, EFunction.MachineBox, EFunction.AutoFight) then
        return false;
      end
    elseif HouseManager.IsInHouse() and not HouseManager.IsCorrectWayIntoHouse() then
      if Contains(SceneManager.sceneId, 10821, 10853) then
        return false;
      else
        if not Contains(functionData.kind, EFunction.LeaveHouse) then
          return false;
        end
      end
    elseif HouseManager.IsInHouse() and HouseManager.IsMyHouse() then
      if not Contains(functionData.kind, EFunction.HouseEdit, EFunction.OtherHouse, EFunction.HouseSetting, EFunction.LeaveHouse) then
        return false;
      end
    elseif HouseManager.IsInHouse() then
      if not Contains(functionData.kind, EFunction.OtherHouse, EFunction.LeaveHouse) then
        return false;
      end
    else
      if Role.player ~= nil and Role.player.data.isWatching then
        if not Contains(functionData.kind, EFunction.Setting) then
          return false;
        end
      elseif not Contains(functionData.kind, EFunction.Ride, EFunction.AutoFight, EFunction.BeeMove, EFunction.BeStronger) then
        return false;
      end
    end

  elseif functionData.group == 3 then
    if not UIMainFunction.showAll then
      if City.cityId ~= 0 and Contains(functionData.kind, EFunction.Action) then
        return false;
      end

      if not Contains(functionData.kind, EFunction.SkillTree, EFunction.Equip, EFunction.Status, EFunction.Invitation,  EFunction.Gacha, EFunction.ExitWatchCity) then
        return false;
      end
    else
      if Contains(functionData.kind, EFunction.Invitation, EFunction.Action, EFunction.Emoji) then
        return false;
      end
    end

  elseif functionData.group == 5 then
    if Role.player ~= nil and Role.player.war == EWar.Guest then --觀戰中 只開啟偵查,逃跑
      if not Contains(functionData.kind, EFunction.FightEscape, EFunction.FightScout) then
        return false;
      end
    else
      if MachineBox.autoFight or not FightManager.commandActive then --非觀戰中, 開啟機關合&演出中只開啟偵查 勝敗條件
        if not Contains(functionData.kind, EFunction.FightWinLose, EFunction.FightScout) then
          return false;
        end
      end
    end
  elseif functionData.group == 6 then
    if Role.player ~= nil and Role.player.war == EWar.Guest then --觀戰中 只開啟偵查,逃跑
      if not Contains(functionData.kind, EFunction.FightEscape, EFunction.FightScout) then
        return false;
      end
    else
      if MachineBox.autoFight or not FightManager.commandActive then --非觀戰中, 開啟機關合&演出中只開啟偵查 勝敗條件
        if not Contains(functionData.kind, EFunction.FightWinLose, EFunction.FightScout) then
          return false;
        end
      end
    end
  end
  
  --額外檢查
  if functionData.kind == EFunction.FirstIAP then

  elseif functionData.kind == EFunction.Welfare then

  elseif functionData.kind == EFunction.Mall then

  elseif functionData.kind == EFunction.Invitation then

  elseif functionData.kind == EFunction.Ride then
    if Mounts.currentNpcId == 0 then return false end

  elseif functionData.kind == EFunction.MachineBox then

  elseif functionData.kind == EFunction.SkillTree then

  elseif functionData.kind == EFunction.Equip then

  elseif functionData.kind == EFunction.Status then

  elseif functionData.kind == EFunction.Team then

  elseif functionData.kind == EFunction.Mission then

  elseif functionData.kind == EFunction.Dungeon then

  elseif functionData.kind == EFunction.Social then

  elseif functionData.kind == EFunction.Organization then
    
  elseif functionData.kind == EFunction.Compound then

  elseif functionData.kind == EFunction.Mounts then

  elseif functionData.kind == EFunction.Leaderboard then

  elseif functionData.kind == EFunction.Achievement then

  elseif functionData.kind == EFunction.Activity then 

  elseif functionData.kind == EFunction.Mail then

  elseif functionData.kind == EFunction.Setting then
    
  elseif functionData.kind == EFunction.Chat then

  elseif functionData.kind == EFunction.Emoji then

  elseif functionData.kind == EFunction.Action then
  
  elseif functionData.kind == EFunction.Dispatch then

  elseif functionData.kind == EFunction.BeeMove then

  elseif functionData.kind == EFunction.AutoFight then

  elseif functionData.kind == EFunction.SlotMachine then

  elseif functionData.kind == EFunction.Furnace then

  elseif functionData.kind == EFunction.Jiugongge then

  elseif functionData.kind == EFunction.Teleport then

  elseif functionData.kind == EFunction.Tutorial then

  elseif functionData.kind == EFunction.CollectBook then

  elseif functionData.kind == EFunction.FightAttack then

  elseif functionData.kind == EFunction.FightSkill then
    if FightField.fightHum[FightField.conIdx] ~= nil and Contains(FightField.fightHum[FightField.conIdx].kind, EHuman.CtrlMach, EHuman.CtrlSold) then
      return true, Color.Gray;
    else
      return true, Color.White;
    end

  elseif functionData.kind == EFunction.FightDefense then

  elseif functionData.kind == EFunction.FightCatch then
    if FightField.fightHum[FightField.conIdx] ~= nil and Contains(FightField.fightHum[FightField.conIdx].kind, EHuman.CtrlMach, EHuman.CtrlSold, EHuman.FollowNpc) then
      return true, Color.Gray;
    else
      return true, Color.White;
    end

  elseif functionData.kind == EFunction.FightEscape then

  elseif functionData.kind == EFunction.FightSOS then

  elseif functionData.kind == EFunction.FightWinLose then

  elseif functionData.kind == EFunction.FightBag then

  elseif functionData.kind == EFunction.FightTeam then

  elseif functionData.kind == EFunction.FightScout then

  elseif functionData.kind == EFunction.Auction then

  elseif functionData.kind == EFunction.BeStronger then

  elseif functionData.kind == EFunction.Festival then
    if table.Count(festivalInfos) == 0 then
      return false;
    end

  elseif functionData.kind == EFunction.Title then

  elseif functionData.kind == EFunction.ExitWatchCity then
    if Role.player == nil or not Role.player.data.isWatching then
      return false;
    end

  elseif functionData.kind == EFunction.ExpSlotMachine then

  elseif functionData.kind == EFunction.LimitedTimeSale then 
    if UILimitedTimeSale.data == nil or not UILimitedTimeSale.CheckTime() then 
      return false;
    end
  elseif functionData.kind == EFunction.SeniorElection then
    if not UISeniorElection.CheckActivityTime(EElectionActivityID.SISTER) then
      return false;
    end
  elseif functionData.kind == EFunction.SportsElection then
    if not UISeniorElection.CheckActivityTime(EElectionActivityID.SPORTS_WATCH) then
      return false;
    end
  elseif functionData.kind == EFunction.ArmyLuckyBag then
    return  ArmyLuckyBag.IsOpen(1);
  elseif functionData.kind == EFunction.ServerLuckyBag then
    return ArmyLuckyBag.IsOpen(2);
  elseif functionData.kind == EFunction.PurchaseFree then
    return UIPurchaseFree.GetActivityOpen();
  elseif functionData.kind == EFunction.UnboundedAct then

  elseif functionData.kind == EFunction.House then

  elseif functionData.kind == EFunction.HouseEdit then
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
  elseif functionData.kind == EFunction.OtherHouse then

  elseif functionData.kind == EFunction.HouseSetting then

  elseif functionData.kind == EFunction.LeaveHouse then

  end
  return true;
end

function Function.CheckUse(functionId, showMessage)
  if Role.player == nil then return false end
  local functionData = functionDatas[functionId];

  if functionData == nil then return false end

  if functionData.requireLv > 0 and not Role.CheckPlayerLv(functionData.requireLv) then
    if showMessage ~= false then
      ShowCenterMessage(string.format(string.Get(20127), functionData.requireLv));
    end
    return false;
  end
  
  if functionData.requireFlag > 0 and not MarkManager.GetMissionFlag(functionData.requireFlag) then
    if showMessage ~= false then
      ShowCenterMessage(string.Get(functionData.requireMsg));
    end
    return false;
  end

  --額外檢查
  if functionData.kind == EFunction.FirstIAP then

  elseif functionData.kind == EFunction.Welfare then

  elseif functionData.kind == EFunction.Mall then

  elseif functionData.kind == EFunction.Invitation then

  elseif functionData.kind == EFunction.Ride then

  elseif functionData.kind == EFunction.MachineBox then

  elseif functionData.kind == EFunction.SkillTree then
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
  elseif functionData.kind == EFunction.Equip then
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
  elseif functionData.kind == EFunction.Status then

  elseif functionData.kind == EFunction.Team then

  elseif functionData.kind == EFunction.Mission then
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
  elseif functionData.kind == EFunction.Dungeon then

  elseif functionData.kind == EFunction.Social then

  elseif functionData.kind == EFunction.Organization then
    
  elseif functionData.kind == EFunction.Compound then

  elseif functionData.kind == EFunction.Mounts then

  elseif functionData.kind == EFunction.Leaderboard then
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
  elseif functionData.kind == EFunction.Achievement then

  elseif functionData.kind == EFunction.Activity then

  elseif functionData.kind == EFunction.Mail then

  elseif functionData.kind == EFunction.Setting then

  elseif functionData.kind == EFunction.Chat then

  elseif functionData.kind == EFunction.Emoji then

  elseif functionData.kind == EFunction.Action then
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
  elseif functionData.kind == EFunction.Dispatch then

  elseif functionData.kind == EFunction.BeeMove then

  elseif functionData.kind == EFunction.AutoFight then

  elseif functionData.kind == EFunction.SlotMachine then
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
  elseif functionData.kind == EFunction.Furnace then

  elseif functionData.kind == EFunction.Jiugongge then

  elseif functionData.kind == EFunction.Teleport then

  elseif functionData.kind == EFunction.Tutorial then

  elseif functionData.kind == EFunction.Auction then
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
  elseif functionData.kind == EFunction.BeStronger then

  elseif functionData.kind == EFunction.Festival then

  elseif functionData.kind == EFunction.Title then

  elseif functionData.kind == EFunction.ExitWatchCity then

  elseif functionData.kind == EFunction.ExpSlotMachine then

  elseif functionData.kind == EFunction.UnboundedAct then
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
  elseif functionData.kind == EFunction.ServerLuckyBag then

  elseif functionData.kind == EFunction.ArmyLuckyBag then

  elseif functionData.kind == EFunction.House then

  elseif functionData.kind == EFunction.HouseEdit then
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
  elseif functionData.kind == EFunction.OtherHouse then

  elseif functionData.kind == EFunction.HouseSetting then

  elseif functionData.kind == EFunction.LeaveHouse then

  end

  return true;
end

function Function.CheckRedDot(functionId)
  if Role.player == nil then return false end

  local functionData = functionDatas[functionId];

  if functionData == nil then return false end
  
  if functionData.kind == EFunction.FirstIAP then

  elseif functionData.kind == EFunction.Welfare then
    return RedDot.Check(ERedDot.LogainAward, ERedDot.Online, ERedDot.OpenServer, ERedDot.Save, ERedDot.Back, ERedDot.OffLineExp,
                        ERedDot.Change, ERedDot.Consume, ERedDot.LottoNpc, ERedDot.LottoCard, ERedDot.DragonBox, ERedDot.SupportArmy,
                        ERedDot.MoneyTree, ERedDot.DoubleSave, ERedDot.Collect, ERedDot.ReUseAct_1, ERedDot.ReUseAct_2,
                        ERedDot.Exp, ERedDot.Furnace, ERedDot.Arena, ERedDot.Scratch, ERedDot.ConsumeScratch, ERedDot.Poke,
                        ERedDot.StagePass, ERedDot.ClassAward, ERedDot.ActLogin, ERedDot.ActAccLogin, ERedDot.ReturnLogin, ERedDot.Swimming,
                        ERedDot.Prize_1, ERedDot.Prize_2, ERedDot.Prize_3,ERedDot.Prize_4, ERedDot.Prize_5, ERedDot.Prize_6,
                        ERedDot.ReUseAct_3, ERedDot.ReUseAct_4, ERedDot.ReUseAct_5, ERedDot.ReUseAct_6, ERedDot.SoulGacha);

  elseif functionData.kind == EFunction.Mall then
    return RedDot.Check(ERedDot.Mall);

  elseif functionData.kind == EFunction.Invitation then
    return RedDot.Check(ERedDot.FriendInvitation, ERedDot.TeamInvitation, ERedDot.DungeonInvitation, ERedDot.OrgInvitation, ERedDot.OrgMemberInvitation);

  elseif functionData.kind == EFunction.Ride then

  elseif functionData.kind == EFunction.MachineBox then
    return RedDot.Check(ERedDot.ExpBottle);

  elseif functionData.kind == EFunction.SkillTree then
    return RedDot.Check(ERedDot.SkillPoint);

  elseif functionData.kind == EFunction.Equip then
    return RedDot.Check(ERedDot.Bag);

  elseif functionData.kind == EFunction.Status then
    return RedDot.Check(ERedDot.AttributePoint, ERedDot.FriendGift, ERedDot.CharmReward, ERedDot.GiftFeedback, ERedDot.Breakthrough);

  elseif functionData.kind == EFunction.Team then

  elseif functionData.kind == EFunction.Mission then

  elseif functionData.kind == EFunction.Dungeon then
    return RedDot.Check(ERedDot.Dungeon);
    
  elseif functionData.kind == EFunction.Social then
    return RedDot.Check(ERedDot.FriendInvitation, ERedDot.FriendAdd, ERedDot.FriendGift);

  elseif functionData.kind == EFunction.Organization then
    return RedDot.Check(ERedDot.OrgMemberInvitation, ERedDot.OrgSign, ERedDot.OrgBoss, ERedDot.OrgProduction);
    
  elseif functionData.kind == EFunction.Compound then

  elseif functionData.kind == EFunction.Mounts then
    return RedDot.Check(ERedDot.MountLevel, ERedDot.MountAttribute, ERedDot.MountCollect);

  elseif functionData.kind == EFunction.Leaderboard then

  elseif functionData.kind == EFunction.Achievement then
    return RedDot.Check(ERedDot.Achievement);

  elseif functionData.kind == EFunction.Activity then

  elseif functionData.kind == EFunction.Mail then
    return RedDot.Check(ERedDot.Mail);

  elseif functionData.kind == EFunction.Gacha then
    return RedDot.Check(ERedDot.Gacha);

  elseif functionData.kind == EFunction.Setting then
    
  elseif functionData.kind == EFunction.Chat then
    return RedDot.Check(ERedDot.Whisper);

  elseif functionData.kind == EFunction.Emoji then

  elseif functionData.kind == EFunction.Action then

  elseif functionData.kind == EFunction.Dispatch then
    return RedDot.Check(ERedDot.Dispatch);
  elseif functionData.kind == EFunction.BeeMove then

  elseif functionData.kind == EFunction.AutoFight then

  elseif functionData.kind == EFunction.SlotMachine then

  elseif functionData.kind == EFunction.Furnace then

  elseif functionData.kind == EFunction.Jiugongge then
    return RedDot.Check(ERedDot.Jiugongge);

  elseif functionData.kind == EFunction.Teleport then

  elseif functionData.kind == EFunction.Tutorial then

  elseif functionData.kind == EFunction.CollectBook then 
    return RedDot.Check(ERedDot.CollectWarrior, ERedDot.CollectStyle, ERedDot.CollectCard, ERedDot.CollectCardSort,
      ERedDot.NFTCollectWarrior, ERedDot.NFTCollectStyle, ERedDot.NFTCollectCard, ERedDot.NFTCollectMount, ERedDot.NFTCollectShineValue);
    
  elseif functionData.kind == EFunction.Auction then

  elseif functionData.kind == EFunction.BeStronger then

  elseif functionData.kind == EFunction.Festival then
    return RedDot.Check(ERedDot.Festival);

  elseif functionData.kind == EFunction.Title then

  elseif functionData.kind == EFunction.ExitWatchCity then

  elseif functionData.kind == EFunction.ExpSlotMachine then

  elseif functionData.kind == EFunction.LimitedTimeSale then 
    return RedDot.Check(ERedDot.LimitedTimeSale);

  elseif functionData.kind == EFunction.ArmyLuckyBag then
    return RedDot.Check(ERedDot.ArmyLuckyBag);

  elseif functionData.kind == EFunction.ServerLuckyBag then
    return RedDot.Check(ERedDot.ServerLuckyBag);

  elseif functionData.kind == EFunction.UnboundedAct then

  elseif functionData.kind == EFunction.PurchaseFree then
    return RedDot.Check(ERedDot.PurchaseFree);

  elseif functionData.kind == EFunction.House then

  elseif functionData.kind == EFunction.HouseEdit then

  elseif functionData.kind == EFunction.OtherHouse then
    return RedDot.Check(ERedDot.OtherHouse);
  elseif functionData.kind == EFunction.HouseSetting then

  elseif functionData.kind == EFunction.LeaveHouse then

  elseif functionData.kind == EFunction.Requiem then
    return RedDot.Check(ERedDot.Requiem);
  elseif functionData.kind == EFunction.Mine then

  
  elseif functionData.kind == EFunction.BattlePass then
    return RedDot.Check(ERedDot.BattlePass);
  end
  return false;
end

function Function.CheckNeedPlayAniBtn(functionId)
  local functionData = functionDatas[functionId];
  
  if Role.player == nil then return false end
    
  if functionData.kind == EFunction.BeeMove then
    return MachineBox.autoMove;

  elseif functionData.kind == EFunction.AutoFight then
    return MachineBox.autoFight;

  elseif functionData.kind == EFunction.Ride then
    return Role.player.horseNpcId ~= 0;

  elseif functionData.kind == EFunction.Equip then
    return Item.CheckBagIsFull(false);

  else
    return this.CheckRedDot(functionId); --play rule by reddot
  end
  
  return false;
end

function Function.Use(functionId, param1, param2)
  local functionData = functionDatas[functionId];

  if functionData == nil then return end

  if not this.CheckUse(functionId) then return end

  if functionData.kind == EFunction.FirstIAP then
    UI.Open(UIFirstIAP);

  elseif functionData.kind == EFunction.Welfare then
    UILoginAward.GetServerExpDatas();

  elseif functionData.kind == EFunction.Gacha then
    UI.Open(UIMall, 1, 1, true);

  elseif functionData.kind == EFunction.Mall then
    UI.Open(UIMall, param1, param2, false);

  elseif functionData.kind == EFunction.Invitation then
    UI.Open(UIInvitation, false);

  elseif functionData.kind == EFunction.Ride then
    if Role.player.horseNpcId == 0 then
      if SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.NoRide) then
        ShowCenterMessage(string.Get(71208));
        return;
      end
      
      Mounts.Mount();
    else
      Mounts.Dismount();
    end

  elseif functionData.kind == EFunction.MachineBox then
    UI.Open(UIMachineBox);

  elseif functionData.kind == EFunction.SkillTree then
    UI.Open(UISkillTree);

  elseif functionData.kind == EFunction.Equip then
    UI.Open(UIStatus, EUIStatusTag.Equip);

  elseif functionData.kind == EFunction.Status then
    UI.Open(UIStatus, EUIStatusTag.Status);

  elseif functionData.kind == EFunction.Team then
    UI.Open(UITeam);
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
  elseif functionData.kind == EFunction.Mission then
    UI.Open(UIMission);

  elseif functionData.kind == EFunction.Dungeon then
    if Dungeon.CheckInDungeon() then
      ShowCenterMessage(string.Get(10325));
      return;
    end
    UI.Open(UIDungeon, param1, param2);        

  elseif functionData.kind == EFunction.Social then
    UI.Open(UISocial);

  elseif functionData.kind == EFunction.Organization then
    if Organization.Id ~= 0 then
      UI.Open(UIArmy);
    else
      ShowOptionMessage(
        function(result)
          if result == 1 then
            UI.Open(UIArmyList);         
          elseif result == 2 then
            ShowNameInput(string.Get(20287),
              function(text)
                if text == nil then return end
                if not string.CheckName(text) then return end
                
                if not Role.CheckPlayerLv(Organization.requireLv) then
                  ShowCenterMessage(string.format(string.Get(10138), Organization.requireLv));
                  return;
                end

                if Role.GetPlayerGold() < Organization.createMoney then
                  ShowCenterMessage(string.format(string.Get(10268), Organization.createMoney));
                  return;
                end
  
                --C:039-001 <創立軍團> +軍團名稱(?)
                sendBuffer:Clear();
                sendBuffer:WriteString(text);
                Network.Send(39, 1, sendBuffer);
              end
            );
          end
        end,
        string.Get(10189),
        { string.Get(20069), string.Get(10220) },
        Role.player
      );
    end
    
  elseif functionData.kind == EFunction.Compound then
    UI.Open(UICompound);
    
  elseif functionData.kind == EFunction.Godskin then
    UI.Open(UIGodskin);

  elseif functionData.kind == EFunction.Soul then
    UI.Open(UISoul);

  elseif functionData.kind == EFunction.Elf then
    UI.Open(UIElf);

  elseif functionData.kind == EFunction.Web then
    UI.Open(UIMarket);

  elseif functionData.kind == EFunction.Mounts then
    UI.Open(UIMounts);
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
  elseif functionData.kind == EFunction.Leaderboard then
    UI.Open(UILeaderboard);

  elseif functionData.kind == EFunction.Achievement then
    UI.Open(UIAchievement);

  elseif functionData.kind == EFunction.Activity then
    UI.Open(UIActivity, 0);

  elseif functionData.kind == EFunction.Mail then
    UI.Open(UIMail);
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
  elseif functionData.kind == EFunction.Setting then
    UI.Open(UISetting);

  elseif functionData.kind == EFunction.Chat then

  elseif functionData.kind == EFunction.Emoji then
    UI.Open(UIEmotion); 

  elseif functionData.kind == EFunction.Action then
    UI.Open(UIAction);
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
  elseif functionData.kind == EFunction.Dispatch then
    Dispatch.OpenUI();

  elseif functionData.kind == EFunction.BeeMove then
    MachineBox.SetAutoMove(not MachineBox.autoMove);

  elseif functionData.kind == EFunction.AutoFight then
    MachineBox.SetAutoFight(not MachineBox.autoFight, true);

  elseif functionData.kind == EFunction.SlotMachine then
    UI.Open(UISlotMachine);

  elseif functionData.kind == EFunction.Furnace then
    UIFurnace.QueryFurnace();

  elseif functionData.kind == EFunction.Jiugongge then
    UI.Open(UIJiugongge, EUIJiugonggeOpenWay.Jiugongge);

  elseif functionData.kind == EFunction.Teleport then
    UI.Open(UITeleport, param1, param2);

  elseif functionData.kind == EFunction.Tutorial then
    UI.Open(UITutorial);
    
  elseif functionData.kind == EFunction.CollectBook then
    UI.Open(UICollectBook);

  elseif Between(functionData.kind, EFunction.FightAttack, EFunction.FightScout) then
    UIFight.OnClick_Function(functionData.kind);

  elseif functionData.kind == EFunction.Auction then
    UI.Open(UIAuction);

  elseif functionData.kind == EFunction.BeStronger then
    UI.Open(UIBeStronger);

  elseif functionData.kind == EFunction.Festival then
    UI.Open(UIFestival);

  elseif functionData.kind == EFunction.Title then
    UI.Open(UITitle);

  elseif functionData.kind == EFunction.ExitWatchCity then
    ShowCheckMessage(
      function(result)
        if result then
          --C:011-009 <離開城戰觀戰>
          Network.Send(11, 9);
        end
      end,
      string.Get(22116),
      19026
    );
  elseif functionData.kind == EFunction.ExpSlotMachine then
    UI.Open(UIExpSlotMachine, ESlotMachineKind.EXP);
  elseif functionData.kind == EFunction.LimitedTimeSale then 
    UI.Open(UILimitedTimeSale);
  elseif functionData.kind == EFunction.SeniorElection then
    UI.Open(UISeniorElection, EElectionActivityID.SISTER);
  elseif functionData.kind == EFunction.Poke then
    UI.Open(UIPoke);
  elseif functionData.kind == EFunction.SportsElection then
    UI.Open(UISeniorElection, EElectionActivityID.SPORTS_WATCH);
  elseif functionData.kind == EFunction.ArmyLuckyBag then
    UI.Open(UIArmyLuckybag, 1);
  elseif functionData.kind == EFunction.ServerLuckyBag then
    UI.Open(UIArmyLuckybag, 2);
  elseif functionData.kind == EFunction.PurchaseFree then
    UI.Open(UIPurchaseFree);
  elseif functionData.kind == EFunction.UnboundedAct then
    UI.Open(UIActivity, 1);
  elseif functionData.kind == EFunction.House then
    if HouseManager.IsInHouse() and HouseManager.IsMyHouse() then return end
    HouseManager.SendEnterHouse(Role.playerId, EHouseBuilding.FirstBuilding, EHouseFloor.FirstFloor);
  elseif functionData.kind == EFunction.HouseEdit then
    HouseEditorManager.Open();
  elseif functionData.kind == EFunction.OtherHouse then
    UI.Open(UIHouseMap);
  elseif functionData.kind == EFunction.HouseSetting then
    FurnitureManager.SendAskAllFurnitures();
    UIHouseSetting.SendRequest();
  elseif functionData.kind == EFunction.LeaveHouse then
    --C:106-012 <離開小屋>
    Network.Send(106, 12);
  elseif functionData.kind == EFunction.Requiem then
    UI.Open(UIRequiem);
  elseif functionData.kind == EFunction.Mine then
    sendBuffer:Clear();
    sendBuffer:WriteByte(0);
    Network.Send(170, 1, sendBuffer);
  elseif functionData.kind == EFunction.BattlePass then
    BattlePass.RequireCheckBattlePassFunction(EBattlePassReuireState.OpenUI);
  end
end

function Function.UpdateVisible(...)
  for k, v in pairs(this.functionObjects) do
    if ... == nil or Contains(functionDatas[k].group, ...) then
      local active, color = this.CheckShow(k);

      v.gameObject:SetActive(active);

      if color ~= nil then
        LuaHelper.SetColor(v.image_Icon, color);
        LuaHelper.SetColor(v.text_Name, color);
      end
    end
  end

  this.UpdateAniBtn();

  if UI.IsVisible(UIMain) then
    UIMiniMap.UpdateTag();
  end

  if UI.IsVisible(UISetting) then
    UISetting.UpdateUI();
  end
end

function Function.UpdateRedDot()
  UIMainFunction.showRedDot = false;
  
  for k, v in pairs(this.functionObjects) do
    if this.CheckRedDot(k) then
      v.image_RedDot.gameObject:SetActive(true);

      if functionDatas[k].group == 3 then
        if this.CheckUse(k, false) then
          if not Contains(functionDatas[k].kind, EFunction.SkillTree, EFunction.Equip, EFunction.Status) then
            UIMainFunction.showRedDot = true;
          end
        end
      end
      
    else
      v.image_RedDot.gameObject:SetActive(false);
    end
  end
  
  UIMainFunction.UpdateRedDot();
  this.UpdateAniBtn();
end

function Function.OnClick(uiEvent)
  this.Use(uiEvent.parameter);
end

function Function.UpdateAniBtn(functionKind)
  local functionData;

  for k, v in pairs(this.functionObjects) do
    if v.animation ~= nil then
      functionData = functionDatas[k];
      if functionKind == nil or functionData.kind == functionKind then
        if this.CheckNeedPlayAniBtn(k) then
          v.image_Ani:ShiftUV(1, 4, 0.1, -1);
        else
          v.image_Ani:StopShiftUV();
        end
      end
    end
  end
end
