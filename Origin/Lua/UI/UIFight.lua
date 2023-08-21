UIFightBtn = {};
UIFightBtn.__index = UIFightBtn;
function UIFightBtn.New(image, btnIdx, onClick)
  local self = {};
  setmetatable(self, UIFightBtn);
  self.image = image;
  self.functionCheckId = UIFightBtn.GetFunctionId(btnIdx);    
  local tempEvent = self.image.gameObject:GetComponent("UIEvent");
  tempEvent:SetListener(EventTriggerType.PointerClick, onClick);

  self.text = self.image.transform:Find("T2_Text"):GetComponent("Text");  
  tempEvent.parameter = btnIdx;
  return self;
end

function UIFightBtn:SetText(str)
  self.text.text = str;
end

function UIFightBtn:CheckShow()
  self.image.gameObject:SetActive(Function.CheckShow(self.functionCheckId));
end

function UIFightBtn:CheckUse()
  return Function.CheckUse(self.functionCheckId);
end

function UIFightBtn.GetFunctionId(btnIdx)
  if btnIdx == 0 then 
    return 250;
  elseif btnIdx == 1 then 
    return 249;
  elseif btnIdx == 2 then 
    return 248;
  elseif btnIdx == 3 then 
    return 251;      
  elseif btnIdx == 4 then 
    return 252;                
  elseif btnIdx == 5 then 
    return 253;                    
  elseif btnIdx == 6 then 
    return 253;                      
  end
  return 0;      
end

--const
local MaxSingleSkills = 50;
local MaxSkillsBtn = 8;
local MaxNPCSkillBtn = 5;

UIFight = {}
local this = UIFight;

this.name = "UIFight";
this.uiController = nil;

--ui
local gameObject_Buttom;
local gameObject_Right;
local gameObject_MainInfo;
local gameObject_WorldBoss;
local gameObject_DebugBtn;

local text_CountDown;
local text_Round;
local text_MainInfo;
local text_wDamage;
local text_wRound;

--var

--技能
local nowIsPlayer = true;

--當前選擇

local nowNPCSkillId = {};
local playerSkillData = {};

--左側按鈕組
local event_Scout = nil; --偵查
local event_Bag = nil;
local event_ChangeTeam = nil;

--自動戰鬥

--中央訊息
local textShowTime = nil;
local event_Cancel;
local image_Function;
local rawImage_Skill;
--世界Boss

this.nameColor = LuaHelper.GetColor(86, 255, 102, 255);
this.targetColor = LuaHelper.GetColor(255, 150, 0, 255);
this.selectColor = LuaHelper.GetColor(255, 67, 67, 255);

function UIFight.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;

  local tempEvent;

  gameObject_Buttom = uiController:FindGameObject("ButtomFunction");
  gameObject_Right = uiController:FindGameObject("RightFunction");
  gameObject_MainInfo = uiController:FindGameObject("Image_TextBg");
  gameObject_WorldBoss = uiController:FindGameObject("Root_WorldBossInfo");
  gameObject_DebugBtn = uiController:FindGameObject("Root_DebugBtn");

  Function.PrefabInitialize(5, gameObject_Buttom.transform);
  Function.PrefabInitialize(6, gameObject_Right.transform);

  text_Round = uiController:FindText("Text_Round");
  text_CountDown = uiController:FindText("Text_CountDown");
  text_CountDown.text = "";
  text_MainInfo = uiController:FindText("Text_MainInfo");
  text_wDamage = uiController:FindText("Text_wDamage");
  text_wRound = uiController:FindText("Text_wRound");
  
  tempEvent = uiController:FindEvent("Image_Win");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Debug);
  tempEvent.parameter = 1;
  tempEvent.gameObject:SetActive(Define.IsDebugMode());

  tempEvent = uiController:FindEvent("Image_Lose");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Debug);
  tempEvent.parameter = 2;
  tempEvent.gameObject:SetActive(Define.IsDebugMode());
  
  event_Cancel = uiController:FindEvent("Image_Cancel");
  event_Cancel:SetListener(EventTriggerType.PointerClick, this.OnClick_Cancel);

  image_Function = uiController:FindImage("Image_Function");
  rawImage_Skill = uiController:FindRawImage("RawImage_Skill");
end

function UIFight.OnOpen(isShowFightBtn)
  if isShowFightBtn == nil then 
    isShowFightBtn = false;
  end
  FightManager.SetCommandActive(true);
  this.SetCountDownPosY(100);
  this.ShowFightBtn(isShowFightBtn);
  this.ShowMainText(false);
  this.OnNilToSkillID();
  this.UpdateWorldBoss();
  this.UpdateUIStatus(Role.player);
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
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
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
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
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
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
  
  gameObject_DebugBtn:SetActive(not UIDebug.RecordMode);

  return true;
end

function UIFight.OnVisible()
  Function.UpdateAniBtn();
end

function UIFight.UpdateWorldBoss()
  --世界王
  if FightField.ffWar_Style == EFFWar_Style.WorldBoss then
    gameObject_WorldBoss.gameObject:SetActive(true);

    text_wDamage.transform.parent.gameObject:SetActive(true);
    text_wDamage.text = FightField.worldBossInfo[1];
    text_wRound.text = FightField.worldBossInfo[2];

  --軍團戰
  elseif FightField.ffWar_Style == EFFWar_Style.OrgWar then
    gameObject_WorldBoss.gameObject:SetActive(true);

    text_wDamage.transform.parent.gameObject:SetActive(false);
    text_wDamage.text = FightField.worldBossInfo[1];
    text_wRound.text = FightField.worldBossInfo[2];

  --軍團BOSS
  elseif FightField.ffWar_Style == EFFWar_Style.OrgBoss then
    gameObject_WorldBoss.gameObject:SetActive(true);

    text_wDamage.transform.parent.gameObject:SetActive(true);
    text_wDamage.text = FightField.worldBossInfo[1];
    text_wRound.text = FightField.worldBossInfo[2];

  --一般戰鬥
  else
    gameObject_WorldBoss.gameObject:SetActive(false);
  end
end

function UIFight.SetCountDownPosY(value)
  text_CountDown.rectTransform.anchoredPosition = Vector2.New(0, value);
end

function UIFight.ShowCountDown(value)
  if text_CountDown == nil or value == nil then
    text_CountDown.gameObject:SetActive(false);
    return;
  end
  
  text_CountDown.gameObject:SetActive(true);
  text_CountDown.text = value;
end

function UIFight.ShowRoundCount(value)
  if text_Round == nil or value == nil then return end

  text_Round.text = value;
end

function UIFight.UpdateUIStatus(role)
  --[[
  if UI.IsVisible(UIStatus) then     
    UIStatus.OnOpen(UIStatus.GetCurrentTag(), role);
    UIStatus.UpdateUI(true);
    if UIStatus.GetCurrentTag() == EUIStatusTag.Equip then
      UIBag.UpdateUI(true);
    end

    if UI.IsVisible(UIItemInfo) then
      UI.Close(UIItemInfo);
    end
  end
  --]]
end

function UIFight.UpdateBagRole()
  local nowFightRole = FightField.fightHum[FightField.conIdx];
  if nowFightRole ~= nil and Role.player.war ~= EWar.Guest then    
    if nowFightRole.kind == EHuman.Player or nowFightRole.kind == EHuman.Players then
      this.UpdateUIStatus(Role.player);
    elseif nowFightRole.kind == EHuman.FollowNpc then 
      this.UpdateUIStatus(Role.GetFollowNpc(Role.playerId, nowFightRole.npcId));
    elseif nowFightRole.kind == EHuman.Divide then 
      return;      
    end
  end
end

--Fight Btn
function UIFight.ShowFightBtn(isShow, isCloseSkill)
  local isGuest = Role.player.war == EWar.Guest;
  --強制刷新當前技能
  if isShow and FightField.fightHum[FightField.conIdx] ~= nil then

    this.ShowSkills();
  end

  FightManager.SetCommandActive(isShow);
end

function UIFight.SortSkill(a, b)
  if skillDatas[a.Id].element < skillDatas[b.Id].element then
    return true;
  end

  return a.Id < b.Id;
end

--Extra--
function UIFight.GetRole()
  local role;

  if openUI == "UIMachineBox" then
    if nowIsPlayer then
      role = Role.player;
    else
      role = Role.fightNpc;
    end
  else
    local fightRole = FightField.fightHum[FightField.conIdx];                 
    if nowIsPlayer then       
      if fightRole ~= nil then 
        if fightRole.kind == EHuman.Player then
          role = Role.player;
        else            
          --分身
          role = fightRole.roleController;
        end
      end
    else
      if fightRole ~= nil then      
        if fightRole.kind == EHuman.FollowNpc  then          
          role = Role.GetFollowNpc(Role.playerId, fightRole.npcId);
        else
          role = fightRole.roleController;
        end
      end
    end
  end

  return role;
end

--Skill--
function UIFight.ShowSkills()
  if FightField.conIdx == FightField.GetPlayerIdx() then
    nowIsPlayer = true;
  else
    --顯示武將/分身 技能
    if FightField.conIdx >= 1 then
      local nowFHum = FightField.fightHum[FightField.conIdx];
      local nowKind = nowFHum.kind;
      if Contains(nowKind, EHuman.Player, EHuman.Players, EHuman.Divide) then
        nowIsPlayer = true;
      elseif nowKind == EHuman.FollowNpc then
        --二代武將 todo
        --if nowFHum.child.Kind = Child_Appointment then
        --  if not Se_ChildSkillForm.visible then
        --    Se_ChildSkillForm.Appear;    //戰鬥技能form

        --一般武將
        if this.childNpc == nil or this.childNpc ~= Role.GetFollowNpc(Role.playerId, nowFHum.npcId) then -- todo Enum:Child_None
          nowIsPlayer = false;
        end
      end
    end
  end
end


function UIFight.OnNilToSkillID()
  gameObject_Buttom:SetActive(true);
  FightField.CloseSelectFrame();
  gameObject_MainInfo:SetActive(false);
end

function UIFight.UpdateFunctionIcon()
  local skId = FightField.fightHum[FightField.conIdx].useSkID;
  if skId == SK_HandFight then 
    image_Function.gameObject:SetActive(true);
    rawImage_Skill.gameObject:SetActive(false);
    image_Function.sprite = UI.GetSprite("but020D");
  elseif skId == 15002 then 
    image_Function.gameObject:SetActive(true);
    rawImage_Skill.gameObject:SetActive(false);
    image_Function.sprite = UI.GetSprite("but023D");
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
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
  elseif skId == 0 then 
    image_Function.gameObject:SetActive(true);
    rawImage_Skill.gameObject:SetActive(false);
    if FightField.fightHum[FightField.conIdx].useItemID ~= 0 then 
      image_Function.sprite = UI.GetSprite("but102");
    end
  else
    image_Function.gameObject:SetActive(false);    
    local skillData = skillDatas[skId];
    if skillData == nil then return end
    rawImage_Skill.gameObject:SetActive(true);
    skillData:SetIcon(rawImage_Skill);
    
  end
end

function UIFight.OnClick_Cancel()
  this.OnNilToSkillID();
  FightField.SetConSkill(0);
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
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

--Main Text Info
function UIFight.ShowMainText(isShow)
  if isShow then
    gameObject_Buttom:SetActive(false);    
    gameObject_MainInfo:SetActive(true);
    
    local roleController = FightField.fightHum[FightField.conIdx].roleController;
    text_MainInfo.text = roleController.name;
    LuaHelper.SetColor(text_MainInfo, roleController.text_Name.color);    
    this.UpdateFunctionIcon();
    FightField.UpdateSelectFrame();
  else
    this.OnNilToSkillID();
  end
end

function UIFight.GetSortOrder()
  return this.uiController.canvas.sortingOrder;
end

--click
function UIFight.OnClick_Function(kind)
  if kind ~= EFunction.FightSkill then
    UI.Close(UISkillPick);
  end
  
  if kind == EFunction.FightAttack then
    --普攻
    FightField.SetConSkill(SK_HandFight);    
  elseif kind == EFunction.FightSkill then
    --特技
    if UI.IsVisible(UISkillPick) then
      UI.Close(UISkillPick);
      return;
    end

    if Contains(FightField.fightHum[FightField.conIdx].kind, EHuman.Soldier, EHuman.Machine, EHuman.CtrlMach, EHuman.CtrlSold)  then  --攻城類不可用
      return;
    end

    UI.Open(UISkillPick,
      this.name,
      function(skill, role)
        if skill ~= nil then
          if skill.requireSp <= role:GetAttribute(EAttribute.Sp) then
            FightField.SetConSkill(skill.id);
          else
            ShowCenterMessage(string.Get(40032));
          end
        end

        if UI.IsVisible(UISkillPick) then
          UI.Close(UISkillPick);
        end
      end,
      FightField.fightHum[FightField.conIdx].npcId
    );

  elseif kind == EFunction.FightDefense then
    --防禦
    if FightField.conIdx == -1 then return end

    this.ShowFightBtn(false);
    this.ShowMainText(true); --  string.Concat(string.GetColorText(FightField.fightHum[FightField.conIdx].roleController.name, this.nameColor), "\n", string.Get(40314), string.GetColorText(string.Get(20293), Color.Black)));
    
    FightField.SetConSkill(17001);
    FightField.fightHum[FightField.conIdx]:DoClick();

  elseif kind == EFunction.FightCatch then
    --捕捉
    if FightField.fightHum[FightField.conIdx] ~= nil and FightField.fightHum[FightField.conIdx].kind ~= EHuman.Player then 
      return;
    end

    if table.Count(Role.GetFollowNpcs(Role.playerId)) >= Role.maxFollowNpc then 
      ShowCenterMessage(string.Get(20500));
      return;
    end

    FightField.SetConSkill(15002);

  elseif kind == EFunction.FightEscape then
    --逃跑
    if Role.player.war == EWar.Guest then         
      this.ShowFightBtn(false);
      
      --C:011-001 <結束觀戰>
      Network.Send(11, 1);
      --3----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        DemoCode.SetColorNum(10);
        local area =  DemoCode.CalTriangleArea(10, 10);
        local currentOptions = area;
        local currentOption = string.Get(80098);
      end
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

    if FightField.conIdx == -1 then return end

    if Contains(FightField.ffWar_Style, EFFWar_Style.LifePK, EFFWar_Style.WorldBoss) then
      ShowCenterMessage(string.Get(40094));
      return;
    end

    this.ShowFightBtn(false);
    this.ShowMainText(true); --string.Concat(string.GetColorText(FightField.fightHum[FightField.conIdx].roleController.name, this.nameColor), "\n", string.Get(40314), string.GetColorText(string.Get(20295), Color.Black)));

    FightField.SetConSkill(18001);
    FightField.fightHum[FightField.conIdx]:DoClick();

  elseif kind == EFunction.FightSOS then
    --對外求救
    -- string.Concat(string.GetColorText(FightField.fightHum[FightField.conIdx].roleController.name, this.nameColor), string.Get(40314), string.GetColorText(string.Get(20296), Color.Black)));
    ShowCenterMessage(string.Get(60050));
    --C:011-006 <求救>
    Network.Send(11, 6);

  elseif kind == EFunction.FightWinLose then
    --勝敗條件
    FightWinLoseCondition.ShowWinLoseList();

  elseif kind == EFunction.FightBag then
    --背包
    if Role.player.war == EWar.Guest then 
      ShowCenterMessage(string.Get(40458));
      return;
    end

    if FightField.fightHum[FightField.conIdx].kind == EHuman.Divide then 
      ShowCenterMessage(string.Get(40140));
      return;
    end
    
    local role = nil;
    if FightField.conIdx == FightField.GetPlayerIdx() then 
      role = Role.player;
    else
      role = Role.GetFollowNpc(Role.playerId, FightField.fightHum[FightField.conIdx].npcId);  
    end

    UI.Open(UIStatus, EUIStatusTag.FightEquip, role);

  elseif kind == EFunction.FightTeam then
    --隊伍
    UI.Open(UITeam, EUITeamTag.FightTeam);

  elseif kind == EFunction.FightScout then
    --偵查
    FightField.ShowScoutInfos();
  end
end

function UIFight.OnClick_Debug(uiEvent)
  if not Define.IsDebugMode() then return end

  --C:011-000 <金手指結束戰鬥> +Win/Lose(1)
  sendBuffer:Clear();
  sendBuffer:WriteByte(uiEvent.parameter);
  Network.Send(11, 0, sendBuffer);

  if UI.IsVisible(UISkillPick) then
    UI.Close(UISkillPick);
  end
end