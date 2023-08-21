
UIMain = {}
local this = UIMain;

this.name = "UIMain";
this.uiController = nil;

--ui
local uiCareer;
local image_HeadIcon;
local image_PlayerInfo;
local text_Lv;
local text_Name;
local text_Hp;
local text_Sp;
local text_Exp;
local text_Gold;
local text_Ts;
local text_Point;
local text_OrgGold;
local slider_Hp;
local slider_Sp;
local slider_Exp;
local scrollContent_Buff;
local scrollItems_Buff = {};

--dungeon元件
local gameObject_Dungeon;
local gameObject_Leave;
local text_DungeonTimeM;
local text_DungeonTimeS;
local text_DungeonInfo;
local dungeonVisible = false;
local dropdown_AnotherWorldLv;

--挖礦場
local gameObject_Mining;
local slider_Percent;
local text_Percent;
local text_Mine;

--var
local buffDatas = {};
local IslimitTimeDungeon = false;

function UIMain.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;

  Function.PrefabInitialize(2, uiController:FindGameObject("Function_Left").transform);

  uiCareer = UICareerController.New(uiController:FindGameObject("GameObject_Career"));
  image_PlayerInfo = uiController:FindImage("Image_PlayerInfo"):GetComponent("RectTransform");
  image_HeadIcon = HeadIconController.New(image_PlayerInfo:Find("Icon"));
  image_OneClick = uiController:FindImage("Image_OneClick");
  
  text_Lv = uiController:FindText("Text_Lv");
  text_Name = uiController:FindText("Text_Name");
  text_Hp = uiController:FindText("Text_Hp");
  text_Sp = uiController:FindText("Text_Sp");
  text_Exp = uiController:FindText("Text_Exp");
  
  text_Gold = uiController:FindText("Text_Gold (1)");
  text_Ts = uiController:FindText("Text_Gold (2)");
  text_Point = uiController:FindText("Text_Gold (3)");
  text_OrgGold = uiController:FindText("Text_Gold (4)");

  slider_Hp = uiController:FindSlider("Slider_Hp");
  slider_Sp = uiController:FindSlider("Slider_Sp");
  slider_Exp = uiController:FindSlider("Slider_Exp");
  
  scrollContent_Buff = uiController:FindScrollContent("ScrollContent_Buff");
  scrollContent_Buff.onInitialize = this.OnInitialize_ScrollContent_Buff;
  scrollContent_Buff.onItemChange = this.OnItemChange_ScrollContent_Buff;
  scrollContent_Buff:Initialize(1);

  dropdown_AnotherWorldLv = uiController:FindDropdown("Dropdown_Lv");
  dropdown_AnotherWorldLv:AddListener(this.OnDropChange_AnotherWorldLv);

  local tempEvent = uiController:FindEvent("Image_PlayerInfo");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_PlayerInfo);

  gameObject_Dungeon = uiController:FindGameObject("GameObject_Dungeon");
  gameObject_Leave = uiController:FindGameObject("Leave");

  text_DungeonTimeM = uiController:FindText("Text_DungeonTimeM");
  text_DungeonTimeS = uiController:FindText("Text_DungeonTimeS");
  text_DungeonInfo = uiController:FindText("Text_DungeonInfo");

  tempEvent = uiController:FindEvent("Image_OnReel");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_DungeonHide);
  
  tempEvent = uiController:FindEvent("Image_DungeonExit");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_DungeonExit);
  gameObject_Dungeon:SetActive(false);

  gameObject_Mining = uiController:FindGameObject("GameObject_Mining");
  text_Percent = uiController:FindText("Text_Percent");
  text_Mine = uiController:FindText("Text_Mine");
  slider_Percent = uiController:FindSlider("Slider_Percent");
  gameObject_Mining:SetActive(false);
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

function UIMain.OnOpen()
  Function.UpdateVisible();

  this.UpdateInfo();
  this.UpdateBuff();
  this.UpdateMoney();
  this.UpdateIcon();
  this.UpdateDungeon();
  this.UpdateMining();

  return true;
end

function UIMain.UpdateIcon()
  image_HeadIcon:ChangeIcon(Role.player.data.sex, Role.player.data.headStyle);
  image_HeadIcon:ChangeIconColor(EHeadIconPart.Hair, Role.player.data:GetColorTint(EColorPart.Hair));
  image_HeadIcon:ChangeIconColor(EHeadIconPart.Skin, Role.player.data:GetColorTint(EColorPart.Skin));
  image_HeadIcon:ChangeBaseHeadIconOutlineAlpha();
end

function UIMain.UpdateInfo()
  if Role.player == nil then return end

  text_Lv.text = Role.player:GetAttribute(EAttribute.Lv);
  text_Name.text = Role.player.name;

  local turn = Role.player:GetAttribute(EAttribute.Turn);
  
  uiCareer:SetCareer(turn, Role.player:GetAttribute(EAttribute.Element), Role.player:GetAttribute(EAttribute.Career), false, Role.player:GetAttribute(EAttribute.Turn3Element));

  slider_Hp.maxValue = Calc.GetMaxHp(Role.player);
  slider_Hp.value = Role.player:GetAttribute(EAttribute.Hp);
  text_Hp.text = string.Concat(slider_Hp.value, "/", slider_Hp.maxValue);

  slider_Sp.maxValue = Calc.GetMaxSp(Role.player);
  slider_Sp.value = Role.player:GetAttribute(EAttribute.Sp);
  text_Sp.text = string.Concat(slider_Sp.value, "/", slider_Sp.maxValue);

  local level = Role.player:GetAttribute(EAttribute.Lv);
  local exp = Role.player:GetAttribute(EAttribute.Exp);

  if turn >= 3 then
    level = level - Role.playerMaxLv;
    exp = Role.player:GetAttribute(EAttribute.Turn3Exp);
  end
  
  if (turn >= 3 and level >= Role.playerMaxLv + Role.playerTurn3MaxLv) or (turn < 3 and level == Role.playerMaxLv) then
    slider_Exp.maxValue = 1;
    slider_Exp.value = 1;
    text_Exp.text = "100%";
  else
    slider_Exp.maxValue = Calc.GetUpExp(level + 1, turn);
    slider_Exp.value = exp - Calc.GetNeedTExp(level, turn);
    text_Exp.text = string.Concat(math.floor((slider_Exp.value / slider_Exp.maxValue) * 100), "%");
  end
end

function UIMain.UpdateMoney()
  text_Gold.text = Role.GetPlayerGold();
  text_Ts.text = Role.GetPlayerCurrency(ECurrency.TS);
  text_Point.text = Role.GetPoint();
  text_OrgGold.text = Role.GetPlayerOrgGold();
end

function UIMain.UpdateBuff()
  table.Clear(buffDatas);

  --時間型BUFF
  for k, v in pairs(ETimeBuff) do
    if DrugBuff.timeBuffs[v] ~= nil and DrugBuff.timeBuffs[v].time ~= nil then
      table.insert(buffDatas, DrugBuff.maxBuffCount + v);
    end
  end

  --全頻號角
  if Chat.hornCount ~= nil then
    table.insert(buffDatas, DrugBuff.maxBuffCount + table.Count(ETimeBuff) + EOtherBuff.WorldChannelHorn);
  end

  --世界王
  if WorldBoss.active then
    table.insert(buffDatas, DrugBuff.maxBuffCount + table.Count(ETimeBuff) + EOtherBuff.WorldBoss);
  end

  --軍團戰備戰
  if Organization.GetDutyFlag(EOrgDuty.OrgWar, Role.playerId) then
    table.insert(buffDatas, DrugBuff.maxBuffCount + table.Count(ETimeBuff) + EOtherBuff.OrgWarPrepare);
  end

  --半月卡
  if StoreValue.IsHaveHalfMonthCard() then
    table.insert(buffDatas, DrugBuff.maxBuffCount + table.Count(ETimeBuff) + EOtherBuff.HalfMonthCard);
  end

  --戰鬥BUFF
  for k, v in pairs(DrugBuff.fightBuffs) do
    table.insert(buffDatas, DrugBuff.maxBuffCount + table.Count(ETimeBuff) + table.Count(EOtherBuff) + k);
  end
  
  --藥品
  for k, v in pairs(DrugBuff.buffs) do
    if evoStatusDatas[v.id] ~= nil then
      table.insert(buffDatas, k);
    end
  end

  --[[
  --解鎖
  if DrugBuff.openCount + 5 < DrugBuff.maxBuffCount then
    table.insert(buffDatas, 0);
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
    
  --]]

  scrollContent_Buff:Reset(table.maxn(buffDatas));
end

function UIMain.OnClick_Buff(uiEvent)
  local buffIndex = uiEvent.parameter;
  if buffIndex == 0 then
    --解鎖
    if DrugBuff.openCount + 5 >= DrugBuff.maxBuffCount then return end
    
    ShowCheckMessage(
      function(result)
        if result then
          --C:066-034 <開啟增益狀態欄位>
          Network.Send(66, 34);
        end
      end,
      string.format(string.Get(80458), DrugBuff.openPoints[DrugBuff.openCount + 1]),
      Role.player
    );

  elseif Between(buffIndex, DrugBuff.maxBuffCount + 1, DrugBuff.maxBuffCount + table.Count(ETimeBuff)) then
    --時間型BUFF
    local buffInfo = DrugBuff.timeBuffs[buffIndex - DrugBuff.maxBuffCount];

    if buffInfo.value ~= nil then
      ShowCenterMessage(string.Concat(string.Get(buffInfo.text), string.Get(71156), buffInfo.value, " ", string.Get(71268), " ", buffInfo.time:ToString("yyyy/MM/dd HH:mm:ss")));
    else
      ShowCenterMessage(string.Concat(string.Get(buffInfo.text), " ", string.Get(71268), " ", buffInfo.time:ToString("yyyy/MM/dd HH:mm:ss")));
    end

  elseif buffIndex == DrugBuff.maxBuffCount + table.Count(ETimeBuff) + EOtherBuff.WorldChannelHorn then
    --全頻號角
    ShowCenterMessage(string.Concat(string.Get(80467), Chat.hornCount));

  elseif buffIndex == DrugBuff.maxBuffCount + table.Count(ETimeBuff) + EOtherBuff.WorldBoss then
    --世界王
    local mission = MarkManager.GetMission(12207);
    if mission ~= nil then
      ShowCenterMessage(string.format(string.Get(71286), mission.step));
    else
      ShowCenterMessage(string.format(string.Get(71286), 0));
    end

    mission = MarkManager.GetMission(12231);
    if mission ~= nil then
      if mission.step == 1 then
        ShowCenterMessage(string.Get(71306));
      else
        ShowCenterMessage(string.format(string.Get(71305), mission.step));
      end
    end

  elseif buffIndex == DrugBuff.maxBuffCount + table.Count(ETimeBuff) + EOtherBuff.OrgWarPrepare then
    --軍團戰備戰
    ShowCenterMessage(string.Get(21805));

  elseif buffIndex == DrugBuff.maxBuffCount + table.Count(ETimeBuff) + EOtherBuff.HalfMonthCard then
    --半月卡
    ShowCenterMessage(string.format(string.Get(21854), StoreValue.GetHalfMonthCardEndDate():ToString("yyyy/MM/dd")));

  elseif Between(buffIndex, DrugBuff.maxBuffCount + table.Count(ETimeBuff) + table.Count(EOtherBuff) + 1, DrugBuff.maxBuffCount + table.Count(ETimeBuff) + table.Count(EOtherBuff) + table.Count(DrugBuff.fightBuffs)) then
    --戰鬥BUFF
    local buffInfo = DrugBuff.fightBuffs[buffIndex - (DrugBuff.maxBuffCount + table.Count(ETimeBuff) + table.Count(EOtherBuff))];

    if buffInfo.kind == EFightBuff.Def then
      --防禦力
      if buffInfo.value >= 1000 then
        ShowCenterMessage(string.Concat(buffInfo.role.name, " ", string.Get(90308), "+", tostring(buffInfo.value - 1000)));
      else
        ShowCenterMessage(string.Concat(buffInfo.role.name, " ", string.Get(90308), tostring(buffInfo.value - 1000)));
      end
    elseif buffInfo.kind == EFightBuff.Atk then
      --攻擊力
      if buffInfo.value >= 1000 then
        ShowCenterMessage(string.Concat(buffInfo.role.name, " ", string.Get(90309), "+", tostring(buffInfo.value - 1000)));
      else
        ShowCenterMessage(string.Concat(buffInfo.role.name, " ", string.Get(90309), tostring(buffInfo.value - 1000)));
      end
    elseif buffInfo.kind == EFightBuff.Int then
      --知力
      if buffInfo.value >= 1000 then
        ShowCenterMessage(string.Concat(buffInfo.role.name, " ", string.Get(90310), "+", tostring(buffInfo.value - 1000)));
      else
        ShowCenterMessage(string.Concat(buffInfo.role.name, " ", string.Get(90310), tostring(buffInfo.value - 1000)));
      end
    elseif buffInfo.kind == EFightBuff.Eff then
      --傷害力
      ShowCenterMessage(string.Concat(buffInfo.role.name, " ", string.format(string.Get(90311), buffInfo.value)));
    elseif buffInfo.kind == EFightBuff.Imm then
      --抵抗封印技
      ShowCenterMessage(string.Concat(buffInfo.role.name, " ", string.format(string.Get(90312), buffInfo.value)));
    elseif buffInfo.kind == EFightBuff.Cur then
      --每回合SP減少
      ShowCenterMessage(string.Concat(buffInfo.role.name, " ", string.format(string.Get(90313), buffInfo.value)));
    end
  else
    --藥品
    local buffInfo = DrugBuff.buffs[buffIndex];
    
    if buffInfo == nil then return end
    if evoStatusDatas[buffInfo.id] == nil then return end

    ShowCenterMessage(evoStatusDatas[buffInfo.id].description);
    ShowCenterMessage(string.Concat(string.Get(90086), buffInfo.count, string.Get(90023), 3));
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
end

function UIMain.OnClick_PlayerInfo()
  if Role.player ~= nil and Role.player.data.isWatching then return end
  
  if not Contains(SceneManager.sceneId, 10821, 10853) then
    Function.Use(12);
  end
end

function UIMain.OnInitialize_ScrollContent_Buff(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Buff[itemIndex] = {};
    scrollItems_Buff[itemIndex].item = UIItemController.New(scrollItems[itemIndex]:Find("Image_BG"));
  end
end

function UIMain.OnItemChange_ScrollContent_Buff(dataIndex, itemIndex)
  local buffIndex = buffDatas[dataIndex + 1];

  if buffIndex == nil then return false end

  if buffIndex == 0 then
    --解鎖
    scrollItems_Buff[itemIndex].item:SetItem(0);
    scrollItems_Buff[itemIndex].item:SetLock(true);

  elseif Between(buffIndex, DrugBuff.maxBuffCount + 1, DrugBuff.maxBuffCount + table.Count(ETimeBuff)) then
    --時間型BUFF
    local buffInfo = DrugBuff.timeBuffs[buffIndex - DrugBuff.maxBuffCount];

    scrollItems_Buff[itemIndex].item:SetItem(buffInfo.itemId, 1);
    scrollItems_Buff[itemIndex].item:SetLock(false);

  elseif buffIndex == DrugBuff.maxBuffCount + table.Count(ETimeBuff) + EOtherBuff.WorldChannelHorn then
    --全頻號角
    scrollItems_Buff[itemIndex].item:SetItem(Chat.hornItem, 1);
    scrollItems_Buff[itemIndex].item:SetLock(false);

  elseif buffIndex == DrugBuff.maxBuffCount + table.Count(ETimeBuff) + EOtherBuff.WorldBoss then
    --世界王
    scrollItems_Buff[itemIndex].item:SetItem(WorldBoss.ticketItemId, 1);
    scrollItems_Buff[itemIndex].item:SetLock(false);

  elseif buffIndex == DrugBuff.maxBuffCount + table.Count(ETimeBuff) + EOtherBuff.OrgWarPrepare then
    --軍團戰備戰
    scrollItems_Buff[itemIndex].item:SetItem(Activity.orgWarPrepareItemId, 1);
    scrollItems_Buff[itemIndex].item:SetLock(false);

  elseif buffIndex == DrugBuff.maxBuffCount + table.Count(ETimeBuff) + EOtherBuff.HalfMonthCard then
    --半月卡
    scrollItems_Buff[itemIndex].item:SetItem(StoreValue.halfMonthCardItemId, 1);
    scrollItems_Buff[itemIndex].item:SetLock(false);

  elseif Between(buffIndex, DrugBuff.maxBuffCount + table.Count(ETimeBuff) + table.Count(EOtherBuff) + 1, DrugBuff.maxBuffCount + table.Count(ETimeBuff) + table.Count(EOtherBuff) + table.Count(DrugBuff.fightBuffs)) then
    --戰鬥BUFF
    local buffInfo = DrugBuff.fightBuffs[buffIndex - (DrugBuff.maxBuffCount + table.Count(ETimeBuff) + table.Count(EOtherBuff))];

    scrollItems_Buff[itemIndex].item:SetItem(buffInfo.itemId, buffInfo.round - FightField.fightRound, nil, true);
    scrollItems_Buff[itemIndex].item:SetLock(false);

  else
    --藥品
    scrollItems_Buff[itemIndex].item:SetItem(evoStatusDatas[DrugBuff.buffs[buffIndex].id].itemId, DrugBuff.buffs[buffIndex].count);
    scrollItems_Buff[itemIndex].item:SetLock(false);
  end
  
  scrollItems_Buff[itemIndex].item:SetEvent(this.OnClick_Buff, buffIndex);

  return true;
end

--dungeon
function UIMain.UpdateDungeon()
  local sceneData = sceneDatas[SceneManager.sceneId];

  local active = sceneData ~= nil and sceneData.kind == 2;

  if SceneManager.sceneId == Activity.orgWarSceneId then
    active = true;
  elseif SceneManager.sceneId == Activity.orgBossSceneId then
    active = false;
  elseif HouseManager.IsInHouse() then
    active = false;
  end

  IslimitTimeDungeon = false;
  for k, v in pairs(limitTimeDungeonDatas) do
    if SceneManager.sceneId == v.sceneId then
      active = true;

      local time = RoleCount.Get(v.limitIndex);
      if time > 0 then
        Dungeon.StartLimitTimeDungeonTime(v.limitIndex, v.limitTime);
        IslimitTimeDungeon = true;
        this.UpdateAnotherWorldLv(v.missionId);
      end

      break;
    end
  end

  if not active then
    gameObject_Dungeon:SetActive(false);
    return;
  end

  if IslimitTimeDungeon then
    dropdown_AnotherWorldLv.gameObject:SetActive(true);
    gameObject_Leave:SetActive(false);
    this.UpdateDungeonInfo(string.Get(23236));
    CGTimer.RemoveListener(Dungeon.UpdateTime);
  else
    dropdown_AnotherWorldLv.gameObject:SetActive(false);
    gameObject_Leave:SetActive(true);
    this.UpdateDungeonInfo();
    CGTimer.RemoveListener(Dungeon.UpdateLimitTimeDungeonTime);
  end
  
  if gameObject_Dungeon.activeInHierarchy == true then return end

  dungeonVisible = true;
  gameObject_Dungeon:SetActive(true);
  LuaHelper.DoTweenAnchoredPosition(gameObject_Dungeon.transform, Vector2.New(0, 0), 1);
  text_DungeonTimeM.text = "";
  text_DungeonTimeS.text = "";
end

function UIMain.UpdateDungeonTime(minute, second)
  text_DungeonTimeM.text = minute;  
  text_DungeonTimeS.text = string.format("%02d", second);
end

function UIMain.UpdateDungeonInfo(info)
  if not string.IsNullOrEmpty(info) then
    text_DungeonInfo.gameObject:SetActive(true);
    text_DungeonInfo.text = info;
  else
    text_DungeonInfo.gameObject:SetActive(false);
    text_DungeonInfo.text = "";
  end
end

function UIMain.OnClick_DungeonExit(event)
  if FightField.isInBattle then 
    ShowCenterMessage(string.Get(80099));
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
  
  ShowCheckMessage(
    function(result)
      if result then
        Dungeon.LeaveSinglePlayDungeon();
      end
    end,
    string.Get(21630),
    Role.player
  );
end

function UIMain.OnClick_DungeonHide(event)
  dungeonVisible = not dungeonVisible;
  if dungeonVisible then
    LuaHelper.DoTweenAnchoredPosition(gameObject_Dungeon.transform, Vector2.New(0, 0), 1);
  else
    LuaHelper.DoTweenAnchoredPosition(gameObject_Dungeon.transform, Vector2.New(130, 0), 1);
  end
end

function UIMain.UpdateAnotherWorldLv(missionId)
  local turn = Role.player:GetAttribute(EAttribute.Turn);
  local level = Role.player:GetAttribute(EAttribute.Lv);
  local step = 0;
  local tableCount = table.Count(anotherWorldLvDatas) / 4;
  if MarkManager.missions[missionId] ~= nil then
    step = MarkManager.missions[missionId].step;
    step = math.max((step - turn * tableCount) - 1, 0);
  end
  dropdown_AnotherWorldLv:ClearOptions();
  for k, v in pairs(anotherWorldLvDatas) do
    if v.turn == turn then
      dropdown_AnotherWorldLv:AddOption(v.level);
      
      if step == 0 then
        if level >= v.level then
          step = math.max((v.id - turn * tableCount) - 1, 0);
        end
      end
    end
  end

  dropdown_AnotherWorldLv.value = step;
end

function UIMain.OnDropChange_AnotherWorldLv(step)
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end
  
  --C:097-002 修改限時副本任務階段 +階段(1)
  local turn = Role.player:GetAttribute(EAttribute.Turn);
  local tableCount = table.Count(anotherWorldLvDatas) / 4;
  
  step = step + turn * tableCount + 1;
  
  sendBuffer:Clear();
  sendBuffer:WriteByte(step);
  Network.Send(97, 2, sendBuffer);
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

function UIMain.SetDropdownActive(enable)
  if IslimitTimeDungeon then
    dropdown_AnotherWorldLv.gameObject:SetActive(enable);
  
    if not enable then
      local dropdownList = dropdown_AnotherWorldLv.gameObject.transform:Find("Dropdown List");
      if dropdownList ~= nil then
        local gameObject = dropdownList.gameObject;
        if gameObject ~= nil then
          if gameObject.activeInHierarchy == false then
            GameObject.Destroy(gameObject);
          end
        end
      end
    end
  end
end

function UIMain.UpdateMining()
  if SceneManager.sceneId ~= 49996 then
    gameObject_Mining:SetActive(false);
    return;
  else
    gameObject_Mining:SetActive(true);
  end
end

function UIMain.UpdateMiningPercent(type, lastMining)
  if SceneManager.sceneId == 49996 then
    slider_Percent.maxValue = UIMine.MaxMine;
    slider_Percent.value = lastMining;
    text_Percent.text = string.Concat(math.floor(lastMining / UIMine.MaxMine * 100), "%");
    text_Mine.text = string.format(string.Get(23894), type);
  end
end
