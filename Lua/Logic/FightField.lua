require("Controller/FightRoleController")
require("Logic/Fight/FightNumber")
require("Logic/Fight/Attack")
require("Logic/Fight/FightStatus")
require("Logic/Fight/FightWinLoseCondition")
require("Logic/Fight/FightPointEffect")

MaxFightHum = 20;
HalfChipColm = 1;                      -- 其中一方的Colm數,由0開始算
MaxChipColm = 4;                       -- 戰鬥區塊陣列,由1開始算起

MaxChipColm2 = bit.rshift(MaxChipColm, 1);      -- 戰鬥區塊中間Colm
MaxChipRow = 5;
MaxChipRow2 = bit.rshift(MaxChipRow, 1);

MaxSoulFightHum = 10;
MaxSoulChipColm = 2;

FieldSlopeW = 0.5188;   -- 戰鬥地塊斜率
FieldSlopeH = 0.4925;
FieldSinSitaW = 1 / math.sqrt(math.pow(FieldSlopeW, 2) + 1);
FieldCosSitaW = FieldSlopeW / math.sqrt(math.pow(FieldSlopeW, 2) + 1);
FieldSinSitaH = 1 / math.sqrt(math.pow(FieldSlopeH, 2)+1);
FieldCosSitaH = FieldSlopeH / math.sqrt(math.pow(FieldSlopeH, 2)+1);
FieldBothDist = 255;  -- 雙方的距離,指(0,0)和(2,0)距離(Width)差
FieldChipDistW = 75;
FieldChipDistH = 75;

FightField = {}
FightField._index = FightField;

local this = FightField;
this.roleActions = {
  ERolePose.Walk,
  ERolePose.Stand,
  ERolePose.Prepare,
  ERolePose.Lie,
  ERolePose.Defend,
  ERolePose.Hit,
  ERolePose.Jump,
  ERolePose.Attack,
  ERolePose.LongAttack,
  ERolePose.Special,
  ERolePose.LongSpecial,
  ERolePose.Magic,
  ERolePose.Archery,
  ERolePose.Riding,
  ERolePose.Meditation,
};

this.ffWar_Style = 0;     -- 戰埸戰鬥類型
this.isQandA = false;       -- 戰鬥問答不秀錐子
this.isShowTurtle = false;  -- 030718-1J  秀烏龜

this.size = Vector2.New(832, 640);
this.skillOffset = this.size * -0.5;
this.bias = Vector2.New(345, 195);

this.chip = { }; -- Vector2
this.SoulChip = { }; --Vector2 靈魂武將用

this.fightHum = { }; -- : Array[0~MaxFightHum] of TFightHum;     --0為玩家自己
this.attack = { }; --  Array[0~MaxFightHum] of TAttack;         --技能

this.speed = { }; -- array [0~19,0~14] of integer;

this.shakePos = { }; -- TPoint;
this.isShake = false;  -- boolean;    --是否地震 設值用SetShake

this.geolAtt = 0; -- Shortint;              --所載入的戰鬥地塊,離開戰

this.downSec = 0;  -- Shortint;      --倒數秒數
this.countDown = 0; -- Shortint;    --倒數計時的數字
this.countInterval = 0;
this.slowCntDown = 0;  -- hortint;    --倒數計時的數字
this.slowCntOldTime = 0; -- Double;   --倒數計時的時間

this.conIdx = 0;   -- Shortint;           --現行控制的fightHum idx

this.focusIdx = 0;           -- 所決定的施法的目標
 
this.flyTreasure = {};     --掉寶特效
this.flyTreasureData = {};

this.fightNo = 0;            -- 20041227

this.isDrawBlack = false;     --是否變黑
this.isDrawWhite = false;       --是否變白
this.blackAlpha = 0;
this.endBlackAlpha = 0;           --變黑用
this.changeAlpha = 0;

-- this.WorldBossInfo_BmpIdx = {};   --: array[1~2] of Integer;
this.worldBossInfo = {};          --1.傷害 2.回合
this.worldBossInfo[1] = 0;
this.worldBossInfo[2] = 0;

this.fightRound = 0;         -- 本戰場已進行的回合數 Added by LH_20150320
this.isShowRoundCnt = false;  -- Boolean;
this.showStartTick =  0; -- { }; -- Cardinal;
this.limit1 = 0;             -- 0.無特別限制 1.不可使用必勝
this.notShowCountDown = true;

this.roleBeforeMsg = {}; --0:自己  >1:其他的FollowNpc的經驗值 &其他的FollowNpc的忠誠度值

this.isInBattle = false;

-- Unity
this.fightRoot = nil;
this.fightResShadowRoot = nil;
this.gameObject = nil;
this.rawImage = nil;
this.fightSceneMaterial = nil;
this.rectTransform = nil;
this.canvas = nil;
this.isTransiting = false;
this.isCountDown = false;

this.selectFrames = {};
this.selectMask = nil;
this.scoutInfos = {};
this.scoutVisible = false;

this.fightTextRoot = nil;
this.fightText = {};
this.fightTextCountDown = 0;

this.arrowAlpha = 1;
this.arrowAlphaValue = 0;

this.FIGHT_GROUND_ORDER = 500; 
this.FIGHT_BODY_ORDER = 1500;
this.FIGHT_BODYLIGHT_ORDER = 2500;
this.FIGHT_SKY_ORDER = 3500;

this.enemy = {};

this.infoBtns = {};
this.infoGameObject = {};

this.timeScale = 2;
this.idleCount = 0;

--pcall Update使用
this.attackIdx = 0;
this.fightHunIdx = 0;

this.pvpItemCount = 0; --團p亂鬥使用物品記數

function FightField.CreatePlayerByData(roleId, index, data)
  if data == nil then 
    return nil;
  end

  local role = Role.CreateRole(EHuman.Duplicate, index, PlayerData.New());

  role.actions = this.roleActions;

  role.data.roleId = roleId;
  role.data.sex = data.sex;
  
  role:SetAttribute(EAttribute.Element, data.element);
  role:SetAttribute(EAttribute.Lv, data.lv);
  
  role.data.poorMission = data.poorMission;
  role.data.godMission = data.godMission;
  role.data.elfNo = data.elfNo;
  
  if role.data.elfNo > 0 and elfDatas[role.data.elfNo] ~= nil then
    role.data.elfId = elfDatas[role.data.elfNo].Id;
    role.data.elfLocation = elfDatas[role.data.elfNo].location;
  else
    role.data.elfLocation = 0;
  end
  
  role.data.face = data.face;
  role.data.headStyle = data.headStyle;
  role.data.bodyStyle = data.bodyStyle;
  role.data.colorTints[1] = data.colorTints[1];
  role.data.colorTints[2] = data.colorTints[2];
  
  if data.vsWin > 0 or data.vsTopNum > 0 then
    role.activityKind = ERoleActivityInfo.RandomPVP;
    role.activityInfo = {};
    role.activityInfo.winCount = data.vsWin;
    role.activityInfo.topRank = data.vsTopNum;
  end

  if data.dareWinNum > 0 then
    role.activityKind = ERoleActivityInfo.NpcChallenge;
    role.activityInfo = data.dareWinNum;
  end
  
  role.data.turn = data.turn;
  role.data.career = data.career;
  role.data.name = data.name;
  role.data.sceneId = SceneManager.sceneId;
  role.data.instanceId = SceneManager.instanceId;

  --equip
  role:ClearEquip();  
  for i = 1, data.equipCount do
    local itemId = data.itemId[i];

    if itemDatas[itemId] ~= nil then
      role.data.equips[itemDatas[itemId].fitType] = itemId;
    end
  end
  
  --外顯外觀裝備
    for i = 1, Role.maxOutfitStyle do
      local OutfitStylePart = data.equipCount + i;
      if data.itemId[OutfitStylePart] ~= nil then
        local itemId = data.itemId[OutfitStylePart];

        if itemDatas[itemId] ~= nil then
          role.data.equips[itemDatas[itemId].fitType + Role.maxOutfitStyle] = itemId;
        end
      end
    end
  
  role.data.orgId = data.orgId;
  role.data.teamState = data.teamState;

  role:Initialize();

  if roleId == Role.playerId then 
    role:UpdateName(role.data.name, Color.Yellow);
  else
    role:UpdateName(role.data.name, Color.Sky);
  end

  return role;
end

function FightField.Destroy()
  poolMgr:DestroyPool("BaseFightText");
  poolMgr:DestroyPool("BaseRoleHintText");

  for k, v in pairs(this.selectFrames)do
    for k2, v2 in pairs(v)do 
      GameObject.Destroy(v2.gameObject);
    end
  end
  table.Clear(this.selectFrames);

  if this.blackImage ~= nil then
    GameObject.Destroy(this.blackImage.gameObject);
    this.blackImage = nil;
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
  if this.gameObject ~= nil then
    GameObject.Destroy(this.gameObject);
    this.gameObject = nil;
  end
end

function FightField.Initialize()
  local fightScene = GameObject.Find("FightScene");
  this.fightRoot = fightScene.transform:Find("FightRoot");
  for i = this.fightRoot.childCount - 1, 0, -1 do
    local child = this.fightRoot:GetChild(i);
    if string.find(child.name, "FightField") ~= nil or string.find(child.name, "BaseFightScene") then
      GameObject.Destroy(child.gameObject);
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
  this.fightRoot = GameObject.Find("FightRoot");
  this.fightResShadowRoot = this.fightRoot.transform:Find("FightResShadowRoot");

  CGResourceManager.Load(
    "FightFieldMaterial",
    "",
    function(assetName, asset)
      this.fightSceneMaterial = asset;
    end
  );
  

  CGResourceManager.Load(
    "BaseFightScene",
    "",
    function(assetName, asset)
      this.gameObject = GameObject.Instantiate(asset);
      this.gameObject.transform:SetParent(this.fightRoot.transform);

      this.rectTransform = this.gameObject:GetComponent("RectTransform");
      this.rectTransform.sizeDelta = this.size;
      this.rectTransform.localScale = Vector3.one * (Scene.currentSceneHalfWidth / 400);

      this.rawImage = this.gameObject:GetComponent("RawImage");
    end
  );

  this.fightMask = this.fightRoot.transform:Find("FightMask"):GetComponent("Image");

  this.chip = { };
  for i = 0, MaxChipColm - 1 do
    this.chip[i] = { };
    for j = 0, MaxChipRow - 1 do
      this.chip[i][j] = Vector2.New(0,0);
    end
  end

  this.SoulChip = { };
  for i = 0, 1 do
    this.SoulChip[i] = { };
    for j = 0, MaxChipRow - 1 do
      this.SoulChip[i][j] = Vector2.New(0,0);
    end
  end

  for i = 1, 20 do
    this.speed[i] = { }
  end

  this.fightHum = { };
  this.attack = {};

  this.InitShowObj();
  FightNumber.Initialize();
  local selectRoot = this.fightRoot.transform:Find("SelectFrameRoot");
  local baseSelect = selectRoot.transform:Find("SelectFrame");
  for colm  = 0, 3 do 
    this.selectFrames[colm] = {};
    for row = 0, 4 do 
      local temp = {};
      temp.gameObject = GameObject.Instantiate(baseSelect).gameObject;
      temp.gameObject.name = string.Concat("SelectFrame_", colm, "_", row);
      temp.gameObject.transform:SetParent(selectRoot.transform);
      local image = temp.gameObject:GetComponent("UIRawImage");
      TextureManager.SetPng(ETextureUseType.None, "AwlYellow", image);
      image.rectTransform.sizeDelta = Vector2.New(image.texture.width, image.texture.height / 5);
      image:ShiftUV(1, 5, 0.1, -1); 
      temp.uiEvent = temp.gameObject:GetComponent("UIEvent");
      this.selectFrames[colm][row] = temp;
      this.selectFrames[colm][row].gameObject:SetActive(false);
    end
  end
  this.selectMask = this.fightRoot.transform:Find("SelectMask");
  this.selectMask.gameObject:SetActive(false);
  baseSelect.gameObject:SetActive(false);
  this.fightTextRoot = this.fightRoot.transform:Find("FightTextRoot").transform;
  CGResourceManager.Load(
    "BaseFightText",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("BaseFightText", asset);
    end
  );

  CGResourceManager.Load(
    "BaseRoleHintText",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("BaseRoleHintText", asset);
    end
  );
    
  this.fightRoot:SetActive(false)
end

function FightField.OpenUI()
  if not this.isInBattle then return end

  UI.Open(UIFight, this.isCountDown);
  
  UIMiniMap.UpdateVisible();
  if SceneManager.sceneId == 10853 and Contains(this.fightNo, 1, 2, 3) then
    UITeach.Guide(2);
  elseif SceneManager.sceneId == 10853 and Contains(this.fightNo, 4) then
    UITeach.Guide(5);
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
  Function.UpdateVisible();
end

function FightField.CloseUI()
  UI.Close(UIFight);  
  UIFight.UpdateUIStatus(Role.player);
  Hotkey.Close(EUseSource.UIFight);
  if not UI.IsVisible(UIMachineBox) then 
    UI.Close(UISkillPick);
  end
  UI.Close(UIConditionOfWinOrLose);
end

function FightField.Create(aGeolAtt, aFightNo)
  log("Enter Fight");
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
  --強制清除上一場的
  if this.isInBattle then
    this.ClearData();
  end

  --清除暫存訊息
  Role.deadMsgData.playerMsg = "";
  Role.deadMsgData.npcMsg = "";
  
  SceneManager.Hide();
  
  --戰鬥過場
  this.isTransiting = true;

  UILoading.FadeIn(0.6,
    function()
      this.isTransiting = false;
      this.OpenUI();
    end,
    1
  );
  
  --
  this.fightRoot:SetActive(true);
  -- 載入地質的資料
  this.isInBattle = true;
  this.limit1 = 0;
  this.showStartTick = CGTimer.time;
  this.isShowRoundCnt = false;
  this.worldBossInfo[1] = 0;
  this.worldBossInfo[2] = 0;
  this.geolAtt = aGeolAtt; --所載入的戰鬥地塊
  this.countDown = -1; --計數數字
  this.countOldTime = CGTimer.time;
  this.slowCntDown = -1; --計數數字
  this.slowCntOldTime = 1;
  this.isQandA = false;
  this.scoutVisible = false;

  for i = 0, MaxFightHum + MaxSoulFightHum do
    this.fightHum[i] = nil;
  end

  this.transitionKind = math.random(4) * 2;

  if MapManager.mapData ~= nil then 
    this.rawImage.material = this.fightSceneMaterial;
    this.fightSceneMaterial:SetColor("_Color", MapManager.mapData.color);
  end

  this.gameObject.name = string.format("FightField%d", this.geolAtt);
  this.gameObject:SetActive(true);

  TextureManager.SetPngByCallBack(ETextureUseType.Scene, string.Concat("FField", this.geolAtt), this.rawImage,
    function(sucess)
      if sucess == true then
        this.gameObject.transform:SetAsLastSibling();
      end
    end
  );

  if this.geolAtt == 111 then
    this.SetBigChipPos();
    --設定城戰座標副程式
  else
    this.SetChipPos();
    --設定地塊座標副程式
  end

  this.ConOldTime = CGTimer.time;
  this.SlowOldTime = CGTimer.time;
  
  this.FlyTreasure = {};

  this.GetRoleBeforeBattleStatus(); --得到玩家和其他FollowNpc進戰鬥前的經驗值

  this.fightNo = aFightNo;

  MachineBox.Statistics(EMachineBoxStats.Fight);
end

function FightField.SetBigChipPos()
  this.chip[0][0].x = 530;
  this.chip[0][0].y = 78;
  this.chip[0][1].x = 410;
  this.chip[0][1].y = 117;
  this.chip[0][2].x = 357;
  this.chip[0][2].y = 142;
  this.chip[0][3].x = 304;
  this.chip[0][3].y = 170;
  this.chip[0][4].x = 134;
  this.chip[0][4].y = 270;

  this.chip[1][0].x = 614;
  this.chip[1][0].y = 229;
  this.chip[1][1].x = 508;
  this.chip[1][1].y = 298;
  this.chip[1][2].x = 393;
  this.chip[1][2].y = 357;
  this.chip[1][3].x = 232;
  this.chip[1][3].y = 419;
  this.chip[1][4].x = 144;
  this.chip[1][4].y = 461;

  this.chip[2][0].x = 662;
  this.chip[2][0].y = 372;
  this.chip[2][1].x = 627;
  this.chip[2][1].y = 397;
  this.chip[2][2].x = 582;
  this.chip[2][2].y = 423;
  this.chip[2][3].x = 542;
  this.chip[2][3].y = 451;
  this.chip[2][4].x = 502;
  this.chip[2][4].y = 480;

  this.chip[3][0].x = 749;
  this.chip[3][0].y = 429;
  this.chip[3][1].x = 714;
  this.chip[3][1].y = 451;
  this.chip[3][2].x = 676;
  this.chip[3][2].y = 480;
  this.chip[3][3].x = 633;
  this.chip[3][3].y = 508;
  this.chip[3][4].x = 590;
  this.chip[3][4].y = 539;
end

function FightField.GetRoleBeforeBattleStatus()
  table.Clear(this.roleBeforeMsg);
  
  this.roleBeforeMsg[0] = {};
  this.roleBeforeMsg[0].index = 0;
  this.roleBeforeMsg[0].exp = Role.player:GetAttribute(EAttribute.Exp);
  this.roleBeforeMsg[0].lv = Role.player:GetAttribute(EAttribute.Lv);
  this.roleBeforeMsg[0].faith = Role.player:GetAttribute(EAttribute.Faith);

  local followNpcs = Role.GetFollowNpcs(Role.playerId);
  for k, v in pairs(followNpcs) do
    this.roleBeforeMsg[k] = {};
    this.roleBeforeMsg[k].index = k;
    this.roleBeforeMsg[k].exp = v:GetAttribute(EAttribute.Exp);
    this.roleBeforeMsg[k].lv = v:GetAttribute(EAttribute.Lv);
    this.roleBeforeMsg[k].faith = v:GetAttribute(EAttribute.Faith);
  end
end

function FightField.SetChipPos()
  local i, j;
  local gridW = { };
  local gridH = { };
  local temp = { };
  local bothDist = { };

  gridW.x = math.round(FieldChipDistW * FieldSinSitaW);
  gridW.y = math.round(FieldChipDistW * FieldCosSitaW);
  bothDist.x = math.round(FieldBothDist * FieldSinSitaW);
  -- 二方人馬差距的距離
  bothDist.y = math.round(FieldBothDist * FieldCosSitaW);

  gridH.x = -1 * math.round(FieldChipDistH * FieldSinSitaH);
  gridH.y = math.round(FieldChipDistH * FieldCosSitaH);

  local fieldX = this.size.x * 0.5;
  local fieldY = this.size.y * 0.5;
  --local go;
  for j = 0, MaxChipRow - 1 do
    temp.x = j * gridH.x;
    temp.y = j * gridH.y;
    for i = 0, MaxChipColm - 1 do
      if i > HalfChipColm then
        -- 分二方
        this.chip[i][j].x =(this.bias.x + i * gridW.x + temp.x + bothDist.x) - fieldX;
        this.chip[i][j].y = this.size.y -(this.bias.y + i * gridW.y + temp.y + bothDist.y) - fieldY;
      else
        this.chip[i][j].x = this.bias.x + i * gridW.x + temp.x - fieldX;
        this.chip[i][j].y = this.size.y -(this.bias.y + i * gridW.y + temp.y) - fieldY;
      end

      this.chip[i][j].y = -this.chip[i][j].y;

      -- Debug Test
      --go = poolMgr:Get("BaseScene");
      --go.gameObject.name = string.Concat("Test", i, j)
      --go.transform:SetParent(root.transform)
      --go.transform.localScale = Vector3.one;
      --go.transform.localPosition = Vector3.New(this.chip[i][j].x, this.chip[i][j].y, 0)
      --go.gameObject:GetComponent("RectTransform").sizeDelta = Vector2.New(30, 30);
    end
  end

  --加算第三排靈魂武將用
  for j = 0, MaxChipRow - 1 do
    temp.x = j * gridH.x;
    temp.y = j * gridH.y;
    for i = 0, 1 do
      if i  == 1 then
        local ColmNum = 1;
        this.SoulChip[i][j].x = (this.bias.x + ColmNum * gridW.x + temp.x + bothDist.x) - fieldX;
        this.SoulChip[i][j].y = this.size.y -(this.bias.y + ColmNum * gridW.y + temp.y + bothDist.y) - fieldY;
        this.SoulChip[i][j].y = -this.SoulChip[i][j].y;
        --logError(string.Concat(j,"SoulChip x:",this.SoulChip[i][j].x));
        --logError(string.Concat(j,"SoulChip y:",this.SoulChip[i][j].y));
      else
        local ColmNum = 2;
        this.SoulChip[i][j].x = this.bias.x + ColmNum * gridW.x + temp.x - fieldX;
        this.SoulChip[i][j].y = this.size.y -(this.bias.y + ColmNum * gridW.y + temp.y) - fieldY;
        this.SoulChip[i][j].y = -this.SoulChip[i][j].y;
        --logError("SoulChip x:" .. this.SoulChip[0][j].x);
        --logError("SoulChip y:" .. this.SoulChip[0][j].y);
      end
    end
  end

  --log("Chip Pos Done")
end

function FightField.ExitFight(isLogout)
  log("Exit Fight");

  if not this.isInBattle then return end

  UILoading.ImmediateOut();
  this.CloseUI();

  if isLogout == nil or isLogout == false then 
    this.ShowAtferBattleMessege();
    AudioManager.PlaySceneMusic();
  end

  this.ClearData();

  this.fightRoot:SetActive(false);

  CGResourceManager.ClearMemory(0, 0,
    function()
      if Role ~= nil and Role.deadMsgData.show then
        Role.deadMsgData.show = false;
        local tempMsg = "";
        if not string.IsNullOrEmpty(Role.deadMsgData.playerMsg) then tempMsg = tempMsg..Role.deadMsgData.playerMsg.."\n" end;
        if not string.IsNullOrEmpty(Role.deadMsgData.npcMsg) then tempMsg = tempMsg..Role.deadMsgData.npcMsg end;
        if tempMsg ~= "" then 
          ShowTalkMessage(
              nil,
              tempMsg,
              Role.player
          );
        end
      end
    end
  );

  this.isInBattle = false;

  TextureManager.ClearUseType(ETextureUseType.EffectLight);
  
  SceneManager.Show();

  if MachineBox.client.moveMode == EAutoMoveMode.WithoutTrack then
    Scene.UpdateCamera(Role.player.position, true);
  end
end

function FightField.ShowAtferBattleMessege()
  local value = 0;
  local isLvUp = false;


  for k, v in pairs(this.roleBeforeMsg) do   
    local role = Role.GetRole(EHuman.FollowNpc, Role.playerId, k);

    if role ~= nil then
      --faith
      value = role:GetAttribute(EAttribute.Faith) - v.faith;
      if value ~= 0 then
        if value > 0 then
          ShowCenterMessage(string.Concat(role.name, string.Get(50064), value));
        else
          ShowCenterMessage(string.Concat(role.name, string.Get(50065), math.abs(value)));
        end
      end

      --level
      value = role:GetAttribute(EAttribute.Lv);
      if value > v.lv then
        isLvUp = true;

        ShowCenterMessage(string.Concat(role.name, string.Get(50038), role:GetAttribute(EAttribute.Lv), string.Get(50039)));
        JumpText.Show("LevelUP", role.transfrom); 
      end
    end
  end

  if isLvUp then
    AudioManager.PlayOnce("AudioClip_WB0013");
  end
end

function FightField.ClearSingleAttack()
  this.attack[this.attackIdx]:Free();
end

function FightField.ClearData()
  this.ffWar_Style = 0;  
  this.rawImage.texture = nil;   
  this.isQandA = false;      
  this.isShowTurtle = false; 
  this.idleCount = 0;
  this.attackIdx = 0;
  this.fightHunIdx = 0;
  this.isCountDown = false;
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
  this.scoutVisible = false;
  for k, v in pairs(this.scoutInfos)do
    v.gameObject:SetActive(false);
  end

  for k, v in pairs(this.attack) do
    this.attackIdx = k;
    xpcall(this.ClearSingleAttack, logError);
  end
  table.Clear(this.attack)

  for k, v in pairs(this.fightHum) do
    this.FreeFightHum(v.index); 
  end
  table.Clear(this.fightHum)

  for k, v in pairs(this.flyTreasure) do
    v:Stop();
  end
  table.Clear(this.flyTreasure);
  table.Clear(this.flyTreasureData);

  this.SetShake(false);  

  this.geolAtt = 0; 
  this.downSec = 0; 
  this.countDown = 0; 
  this.countInterval = 0;
  this.slowCntDown = 0; 
  this.slowCntOldTime = 0; 
  this.conIdx = 0;   
  this.focusIdx = 0;
  this.fightNo = 0;
  this.fightRound = 0;         
  this.isShowRoundCnt = false;  
  this.showStartTick =  0; 
  this.limit1 = 0;
  DrugBuff.ClearFightBuff();
  this.pvpItemCount = 0;
end

function FightField.UpdateSigleAttack()
  this.attack[this.attackIdx]:Update();
end

function FightField.UpdateSigleFightRole()
  this.fightHum[this.fightHunIdx]:Update();
end

function FightField.UpdateDebugSkill()
  if this.playAllSkill and table.Count(this.skillList) > 0 and this.attack ~= nil and this.attack[this.ctrl] ~= nil and (this.attack[this.ctrl].nowSkill == nil) then
    TextureManager.ClearUseType(ETextureUseType.EffectLight);
    this.selectIdx = this.selectIdx + 1;
    UIDebug.UpdateUI();
    if this.selectIdx ~= 0 and this.selectIdx > table.Count(this.skillList) then
      this.skillIdx = 0;
      this.skillList = {}; 
    elseif this.skillList[this.selectIdx] ~= nil and this.skillList[this.selectIdx] ~= ESkill_Kind.ExitFight and this.skillList[this.selectIdx] ~= ESkill_Kind.CatchSucess then
      ShowCenterMessage( string.Concat("Skill : ", table.GetKey(ESkill_Kind, this.skillList[this.selectIdx]), " kind : ", this.skillList[this.selectIdx]), 3);      
      FightField.SetSkillKind(this.ctrl, this.skillList[this.selectIdx], this.tar, 5);
    end
  end
end

function FightField.Update()
  if isTransiting then return end

  this.UpdateAttack();
  this.UpdateFightHum();
  this.UpdateFightText();
  this.UpdateShake();
  this.Show();
end

function FightField.UpdateAttack()
  for k, v in pairs(this.attack) do
    if v ~= nil then
      this.attackIdx = k;
      if not xpcall(this.UpdateSigleAttack, logError) then 
        if this.attack[this.attackIdx] ~= nil then 
          xpcall(FightField.CloseAttack, logError);
          this.attack[this.attackIdx] = nil;
        end
      end
    end
  end
end

function FightField.UpdateFightHum()
  for k, v in pairs(this.fightHum) do
    if v ~= nil then
      this.fightHunIdx = k;
      xpcall(this.UpdateSigleFightRole, logError);
    end
  end
end

function FightField.UpdateFightText()
  if table.Count(this.fightText) == 0 then 
    return;
  end

  this.fightTextCountDown = this.fightTextCountDown + CGTimer.deltaTime;

  if this.fightTextCountDown > 0.5 then 
    for k,v in pairs(this.fightText) do
      poolMgr:Release("BaseFightText", v.gameObject);
    end
    table.Clear(this.fightText);
  end
end

function FightField.UpdateShake()
  if this.fightRoot ~= nil then 
    if this.isShake == true then 
      local shakePos = this.GetShakeValue();
      this.fightRoot.transform.localPosition = Vector3.New(shakePos.x, shakePos.y, 0);
      MapManager.gridRoot.transform.localPosition = Vector3.New(shakePos.x, shakePos.y, 0);
    end
  end
end

function FightField.GetShakeValue()
  return Vector2.New(5-(math.random(0,10)+1), 5-(math.random(0,10)+1))
end 

function FightField.Show()
  if this.isInBattle == false then return end

  this.DrawBlack();
  this.ShowCountDown();
  this.ShowRound();
  this.UpdateArrowAlpha();
end

function FightField.UpdateArrowAlpha()
  if not this.ctrlArrowRaw.gameObject.activeInHierarchy then 
    return;
  end
  if this.arrowAlpha == 1 then 
    this.arrowAlphaValue = this.arrowAlphaValue + 20;     
    if this.arrowAlphaValue >= 255 then 
      this.arrowAlphaValue = 255;
      this.arrowAlpha = 0;
    end    
  else
    this.arrowAlphaValue = this.arrowAlphaValue - 20; 
    if this.arrowAlphaValue < 0 then 
      this.arrowAlphaValue = 0;
      this.arrowAlpha = 1;
    end    
  end
  LuaHelper.SetColor(this.ctrlArrowRaw, LuaHelper.GetColor(255,255,255, this.arrowAlphaValue));    
end

function FightField.RoleAppear(data)

  local warType = data:ReadByte();
  local kind = data:ReadByte();
  local roleId = data:ReadInt64();
  local mapNpcIdx = data:ReadUInt16();
  local masterId = data:ReadInt64();
  local colm = data:ReadByte();
  local row = data:ReadByte();
  
  local initSet = {}
  initSet.maxHp = data:ReadUInt32();
  initSet.maxSp = data:ReadUInt32();
  initSet.hp = data:ReadUInt32();
  initSet.sp = data:ReadUInt32();
  initSet.lv = data:ReadUInt16();
  initSet.upgradeLv = data:ReadByte();
  initSet.element = data:ReadByte();

  local appData = nil;
  if Contains(kind, EHuman.Player, EHuman.Players, EHuman.Divide, EHuman.AutomanualPlayer) then
    appData = FightManager.ReciveFightAppearenceData(data, roleId);
  elseif Contains(kind, EHuman.FollowNpc, EHuman.AutomanualNpc) then
    appData = data:ReadString(data:ReadByte());
  end

  local soulEquipId = data:ReadUInt16();

  --logWarn(string.Concat("Receive Role Appear !! Kind ", kind, " RoleId ", roleId, " Row ", row, " Colm ", colm));
  
  --  log(string.Concat(roleId, "warType", warType))
  --  log(string.Concat(roleId, "kind", kind))
  --  log(string.Concat(roleId, "roleId", roleId))
  --  log(string.Concat(roleId, "mapNpcIdx", mapNpcIdx))
  --  log(string.Concat(roleId, "masterId ", masterId))
  --  log(string.Concat(roleId, "colm", colm))
  --  log(string.Concat(roleId, "row", row))

  --  log(string.Concat("initSet.MaxHp", initSet.maxHp))
  --  log(string.Concat("initSet.MaxSP ", initSet.maxSp))
  --  log(string.Concat("initSet.Hp", initSet.hp))
  --  log(string.Concat("initSet.Sp", initSet.sp))
  --  log(string.Concat("initSet.LV", initSet.lv))
  --  log(string.Concat("initSet.Element", initSet.element))

  if Contains(kind, EHuman.Player, EHuman.Players, EHuman.AutomanualPlayer) then
    masterId = 0;

    if Role.playerId == roleId then
      kind = EHuman.Player;

      --玩家若是在冥想時參戰或是被pk、pk他人，先改變自身的姿勢為站立再進戰鬥
      if Contains(warType, EWar.Join, EWar.PkPlayers) and Role.player.animationId == ERolePose.Meditation then
        Role.player:SetIsSitting(false);
      end

      Role.player:SetWar(warType);

      if Role.player.war == EWar.Guest then
        this.blnUseTout = true; 
      end
    end
  end

  if colm == 255 or row == 255 then return end
  
  if not Contains(kind, EHuman.Player, EHuman.Players, EHuman.Divide, EHuman.AutomanualPlayer) then 
    roleId = tonumber(roleId);

    if roleId == 37006 then
      --投石車
      roleId = 21001;
    elseif roleId == 37010 then
      --木門
      roleId = 37008;
    elseif roleId == 37011 then
      --城門
      roleId = 37009;
    elseif roleId == 37012 then
      --城牆
      roleId = 37013;
    elseif roleId == 37014 then
      --木牆
      roleId = 37015;
    end
  end

  local isWalk = false;
  if Contains(kind, EHuman.Player, EHuman.Players, EHuman.FollowNpc, EHuman.AutoFollow, EHuman.AutomanualPlayer) then
    isWalk = true;
  end
  
  local fightIndex = this.GetIdx(colm, row);
  
  --強制釋放原本位子的腳色
  if this.fightHum[fightIndex] ~= nil then
    this.fightHum[fightIndex]:ExitFight();

    if this.attack[fightIndex] ~= nil then
      this.attack[fightIndex]:CloseSkill();
    end
  end

  if fightIndex == 255 or fightIndex == -1 then return end

  local fightRole = FightRoleController.New();
  fightRole.kind = kind;
  fightRole.index = fightIndex;
  fightRole.id = roleId;

  local role;
  if Contains(kind, EHuman.Player, EHuman.Players, EHuman.Divide, EHuman.AutomanualPlayer) then
    role = this.CreatePlayerByData(roleId, fightIndex, appData);

    if role ~= nil then
      fightRole.data = role.data;
    end
  else
    role = Role.CreateRole(EHuman.Duplicate, fightIndex);
    role.npcId = roleId;
    role.actions = this.roleActions;
    role:Initialize();

    if kind == EHuman.FollowNpc and appData ~= nil then
      role:UpdateName(appData, Color.Sky);
    end
  end
  
  if role == nil or role.gameObject == nil or role.hudObject == nil then
    logError(string.Concat("Init FightHum Fail colm ", colm," row ", row));

    role:Destroy();
    role = nil;
    fightRole = nil;

    return;
  end

  role.kind = EHuman.Duplicate;
  role.hudObject:SetActive(true);
  role:UpdateViewVisible();
  role.gameObject.name = string.format("FightRole_%d_%d", colm, row);
  role.transform:SetParent(this.fightRoot.transform);
  role.transform.localPosition = Vector3.zero;
  role.transform.localScale = Vector3.one;
  role.image_Element.gameObject:SetActive(false);

  fightRole.scaleRoot = role.bodyObject;
  fightRole:SetRoleController(role);

  this.fightHum[fightIndex] = fightRole;
  this.attack[fightIndex] = Attack.New(fightIndex);
  
  --log(string.Concat("Init FightHum ", fightIndex, " Kind ", fightRole.kind, " id ", roleId));

  this.fightHum[fightIndex]:DoInFight(colm, row, masterId, isWalk, initSet, warType);

  local soulColm = 0;
  if Contains(colm, 2, 3) then
    soulColm = 1;
  else
    soulColm = 0;
  end

  if soulEquipId > 0 then
    FightField.SoulRoleAppear(npcSoulDatas[soulEquipId].npcId, soulColm, row, initSet.element);
  else
    FightField.SoulRoleFree(soulColm, row);
  end
end

function FightField.SoulRoleAppear(npcId, colm, row, element)
  --同元素才能裝備
  local initSet = {}
  initSet.maxHp = 1;
  initSet.maxSp =1;
  initSet.hp = 1;
  initSet.sp = 1;
  initSet.lv = 1;
  initSet.element = element;

  local appData = nil;
  --if Contains(kind, EHuman.Player, EHuman.Players, EHuman.Divide, EHuman.AutomanualPlayer) then
  --  appData = FightManager.ReciveFightAppearenceData(data, roleId);
  --elseif Contains(kind, EHuman.FollowNpc, EHuman.AutomanualNpc) then
  --  appData = data:ReadString(data:ReadByte());
  --end

  --logWarn(string.Concat("Receive Role Appear !! Kind ", kind, " RoleId ", roleId, " Row ", row, " Colm ", colm));

  --  log(string.Concat(roleId, "warType", warType))
  --  log(string.Concat(roleId, "kind", kind))
  --  log(string.Concat(roleId, "roleId", roleId))
  --  log(string.Concat(roleId, "mapNpcIdx", mapNpcIdx))
  --  log(string.Concat(roleId, "masterId ", masterId))
  --  log(string.Concat(roleId, "colm", colm))
  --  log(string.Concat(roleId, "row", row))

  --  log(string.Concat("initSet.MaxHp", initSet.maxHp))
  --  log(string.Concat("initSet.MaxSP ", initSet.maxSp))
  --  log(string.Concat("initSet.Hp", initSet.hp))
  --  log(string.Concat("initSet.Sp", initSet.sp))
  --  log(string.Concat("initSet.LV", initSet.lv))
  --  log(string.Concat("initSet.Element", initSet.element))

  if colm == 255 or row == 255 then return end

  local isWalk = true;

  local fightIndex = this.GetSoulIdx(colm, row);

  --強制釋放原本位子的腳色
  if this.fightHum[fightIndex] ~= nil then
    this.fightHum[fightIndex]:ExitFight();

    if this.attack[fightIndex] ~= nil then
      this.attack[fightIndex]:CloseSkill();
    end
  end

  if fightIndex == 255 or fightIndex == -1 then return end

  local fightRole = FightRoleController.New();
  fightRole.kind = EHuman.SoulWarrior;
  fightRole.index = fightIndex;
  fightRole.id = npcId;

  local role;
  role = Role.CreateRole(EHuman.Duplicate, fightIndex);
  role.npcId = npcId;
  role.actions = this.roleActions;
  role:Initialize();

  --if kind == EHuman.FollowNpc and appData ~= nil then
  --  role:UpdateName(appData, Color.Sky);
  --end


  if role == nil or role.gameObject == nil or role.hudObject == nil then
    logError(string.Concat("Init SoulFightHum Fail colm ", colm," row ", row));
    role:Destroy();
    role = nil;
    fightRole = nil;
    return;
  end

  role.kind = EHuman.Duplicate;
  role.hudObject:SetActive(true);
  role:UpdateViewVisible();
  role.gameObject.name = string.format("SoulFightRole_%d_%d", colm, row);
  role.transform:SetParent(this.fightRoot.transform);
  role.transform.localPosition = Vector3.zero;
  role.transform.localScale = Vector3.one;
  role.image_Element.gameObject:SetActive(false);

  fightRole.scaleRoot = role.bodyObject;
  fightRole:SetRoleController(role);

  this.fightHum[fightIndex] = fightRole;
  this.attack[fightIndex] = Attack.New(fightIndex);

  --log(string.Concat("Init FightHum ", fightIndex, " Kind ", fightRole.kind, " id ", roleId));

  this.fightHum[fightIndex]:SoulDoInFight(colm, row, nil, isWalk, initSet, 0);
end

function FightField.SoulRoleFree(colm, row)
  local fightIndex = this.GetSoulIdx(colm, row);

  --強制釋放原本位子的腳色
  if this.fightHum[fightIndex] ~= nil then
    this.fightHum[fightIndex]:ExitFight();

    if this.attack[fightIndex] ~= nil then
      this.attack[fightIndex]:CloseSkill();
    end
  end
end

function FightField.FreeFightHum(idx)
  -- 清空Chip
  this.fightHum[idx]:Clear();
  this.fightHum[idx] = nil;
end

function FightField.BackupFightInfo(humIdx)
  local hum = FightField.fightHum[humIdx];
  local info = {};
  info.pose_Kind = hum.roleController.animationId;
  info.speed = hum.roleController.speed;
  info.direction = hum.roleController.direction;
  info.beh_Kind = hum.beh_Kind;
  return info;
end

function FightField.RestoreFightInfo(humIdx, aEffCount)
  if aEffCount == nil then
    aEffCount = 1;
  end

  local status = 0;
  local me = FightField.fightHum[humIdx];

  if me == nil then
    log(string.Concat("Cant Find RestoreFightInfo:", humIdx));
    return;
  end

  -- 播戰鬥結果
  if aEffCount > 0 then
    --log("RestoreFightInfo PlayerEffect")
    -- 狀態技能解除,不能執行這段,會造成無窮迴圈
    me:PlayerEffect(aEffCount);
  end

  -- 還原位置
  if me:GetStatusKind(EFightStatusKind.Spec) ~= EStatus.Protect then
    me.jumpStart = false;
    me.arrive = false;
    me.fantasY = 0;
    me.isPlant = false;
    me:SetOverturn(false);
    me:ResetPosition();
    me.roleController:SetDirection(me:GetDirection());
  end

  if me.roleController:GetAttribute(EAttribute.Hp) <= 0 then
    me.roleController:SetAnimationForceId(ERolePose.None);
    me.roleController:SetAnimationForceFrame(255);
    me.roleController:SetIsDead(true);
    me:SetBeh(EFightBeh.Dead);
  else
    status = 0;
    local sealKind = me:GetStatusKind(EFightStatusKind.Seal);
    if sealKind == 2 then  --旋風中
      status = 2;       
    elseif sealKind == EStatus.Clump or sealKind == EStatus.IceBound or sealKind == EStatus.ShakeTake then
      status = 1; --受擊動作
    elseif sealKind == EStatus.DizzyAtk or sealKind == EStatus.Trance or sealKind == EStatus.EW_Counter then 
      status = 3; --倒地
    end

    me:SetSpeed(me.fightActInfo.speed); 
    me:SetBeh(me.fightActInfo.beh_Kind);
    if status == 0 then           
      me.roleController:SetAnimationForceId(ERolePose.None);
      me.roleController:SetDirection(me.fightActInfo.direction);      
      -- 還原狀態姿勢
      me.statusActInfo.pose_Kind = me.roleController.animationId;   --姿勢備份
      me.statusActInfo.speed = me.speed;           --速度 .
      me.statusActInfo.direction = me.roleController.direction;
      -- 方向 .
      me.statusActInfo.beh_Kind = me.beh_Kind;
      -- 行為 .
      me.roleController:SetIsJumping(false);
      me.roleController:SetIsMoving(false);
      me.roleController:SetInBattle(true);   
      me.roleController:SetIsDead(false);
      me.roleController:SetAnimationForceFrame(255);
    elseif status == 1 then      
      me.direction = me.statusActInfo.direction;   
      me.roleController:SetAnimationForceId(ERolePose.Hit);   
      me.roleController:SetIsDead(false);
    elseif status == 2 then 
      me.roleController:SetAnimationForceFrame(255);
      me.roleController:SetAnimationForceId(ERolePose.None);
      me.direction = me.statusActInfo.direction;
      me.roleController:SetIsDead(false);
    elseif status == 3 then 
      me.roleController:SetAnimationForceFrame(255);
      me.roleController:SetAnimationForceId(ERolePose.None);
      me.direction = me.statusActInfo.direction;
      me.roleController:SetIsJumping(false);
      me.roleController:SetIsMoving(false);
      me.roleController:SetInBattle(true);   
      me.roleController:SetIsDead(true);
    end
  end
end

function FightField.StatusBkUPFightInfo(humIdx)
  local me = this.fightHum[humIdx];

  me.statusActInfo.pose_Kind = me.pose_Kind;   --姿勢備份
  me.statusActInfo.speed = me.speed;           --速度 .
  me.statusActInfo.direction = me.roleController.direction;                 --方向 .
  me.statusActInfo.beh_Kind = me.beh_Kind;     --行為 .
end

function FightField.GetEnemyIdx(kind, aTarIdx)
  local target = this.fightHum[aTarIdx];
  local emyNum = 0;
  local emyIdxAy = {};
  local temp = -1;

  if kind == 1 then
    emyNum = 1;
    emyIdxAy[emyNum - 1] = this.GetFHumIdx(target.colm, target.row);
  elseif kind == 2 then     --打2人(前後)
    if Contains(target.colm, 0, 1) then
      for i = 1, 0, -1 do
        temp = this.GetFHumIdx(i, target.row);
        if temp ~= -1 and this.fightHum[temp] ~= nil then
          emyNum = emyNum + 1;
          emyIdxAy[emyNum - 1] = temp;
        end
      end
    elseif Contains(target.colm, 2, 3) then
      for i = 2, 3 do
        temp = this.GetFHumIdx(i, target.row);
        if temp ~= -1 and this.fightHum[temp] ~= nil then
          emyNum = emyNum + 1;
          emyIdxAy[emyNum - 1] = temp;
        end
      end
    end
  elseif kind == 3 then     --打3人(中左右)
    for i = target.row - 1, target.row + 1 do
      if i >= 0 and i < MaxChipRow then
        temp = this.GetFHumIdx(target.colm, i);
        if temp ~= -1 and this.fightHum[temp] ~= nil then
          emyNum = emyNum + 1;
          emyIdxAy[emyNum - 1] = temp;
        end
      end
    end
  elseif kind == 5 then     --打4人(十字打法)
    if Contains(target.colm, 0, 1) then                 --橫向2人
      for i = 1, 0, -1 do
        temp = this.GetFHumIdx(i, target.row);
        if temp ~= -1 and this.fightHum[temp] ~= nil then
          emyNum = emyNum + 1;
          emyIdxAy[emyNum - 1] = temp;
        end
      end
    elseif Contains(target.colm, 2, 3) then
      for i = 2, 3 do
        temp = this.GetFHumIdx(i, target.row);
        if temp ~= -1 and this.fightHum[temp] ~= nil then
          emyNum = emyNum + 1;
          emyIdxAy[emyNum - 1] = temp;
        end
      end
    end

    for i = target.row - 1, target.row + 1 do           --縱向3人
      if i >= 0 and i < MaxChipRow and i ~= target.row then
        temp = this.GetFHumIdx(target.colm, i);
        if temp ~= -1 and this.fightHum[temp] ~= nil then
          emyNum = emyNum + 1;
          emyIdxAy[emyNum - 1] = temp;
        end
      end
    end
  elseif kind == 6 then     --打6人(2colm*3Row)
    if Contains(target.colm, 0, 1) then
      for i = 1, 0, -1 do
        for j = target.row - 1, target.row + 1 do
          if j >= 0 and j < MaxChipRow then
            temp = this.GetFHumIdx(i, j);
            if temp ~= -1 and this.fightHum[temp] ~= nil then
              emyNum = emyNum + 1;
              emyIdxAy[emyNum - 1] = temp;
            end
          end
        end
      end
    elseif Contains(target.colm, 2, 3) then
      for i = 2, 3 do
        for j = target.row - 1, target.row + 1 do
          if j >= 0 and j < MaxChipRow then
            temp = this.GetFHumIdx(i, j);
            if temp ~= -1 and this.fightHum[temp] ~= nil then
              emyNum = emyNum + 1;
              emyIdxAy[emyNum - 1] = temp;
            end
          end
        end
      end
    end
  elseif kind == 7 then     --打5人 (1colm*5Row)
    for i = 0, MaxChipRow - 1 do
      temp = this.GetFHumIdx(target.colm, i);
      if temp ~= -1 and this.fightHum[temp] ~= nil then
        emyNum = emyNum + 1;
        emyIdxAy[emyNum - 1] = temp;
      end
    end
  elseif kind == 8 then     --打10人  (2colm*5Row)
    if Contains(target.colm, 0, 1) then --左方隊伍
      for i = 1, 0, -1 do
        for j = 0, MaxChipRow - 1 do
          temp = this.GetFHumIdx(i, j);
          if temp ~= -1 and this.fightHum[temp] ~= nil then
            emyNum = emyNum + 1;
            emyIdxAy[emyNum - 1] = temp;
          end
        end
      end
    elseif Contains(target.colm, 2, 3) then--右方隊伍
      for i = 2, 3 do
        for j = 0, MaxChipRow - 1 do
          temp = this.GetFHumIdx(i, j);
          if temp ~= -1 and this.fightHum[temp] ~= nil then
            emyNum = emyNum + 1;
            emyIdxAy[emyNum - 1] = temp;
          end
        end
      end
    end
  elseif kind == 255 then --敵我雙方全體
    for k, v in pairs(this.fightHum) do
      if v ~= nil then
        emyNum = emyNum + 1;
        table.insert(emyIdxAy, k);
      end
    end
  end

  return emyNum, emyIdxAy;
end

function FightField.GetPosFHumIdx(goalX, goalY)
  for i = 0, MaxFightHum do
    if this.fightHum[i] ~= nil and
      goalX == this.fightHum[i].goal.x and goalY == this.fightHum[i].goal.y then
      return i;
    end
  end
  return -1;
end

function FightField.GetIdx(colm, row)
  if colm < 0 or colm >= MaxChipColm or row < 0 or row >= MaxChipRow then --行列上限檢查
    return -1;
  end

  return colm * MaxChipRow + row;
end

function FightField.GetFHumIdx(colm, row)    
  local idx = FightField.GetIdx(colm, row);
  if this.fightHum[idx] ~= nil then 
    return idx;
  else
    return -1;
  end  
end

function FightField.GetHumId(colm, row)
  if this.fightHum[this.GetFHumIdx(colm, row)]~= nil then 
    return this.fightHum[this.GetFHumIdx(colm, row)].id;
  else
    return 0;
  end
end

function FightField.GetSoulIdx(colm, row)
  if colm < 0 or colm >= MaxSoulChipColm or row < 0 or row >= MaxChipRow then --行列上限檢查
    return -1;
  end

  return colm * MaxChipRow + row + MaxFightHum ;
end

function FightField.GetSoulFHumIdx(colm, row)
  local idx = FightField.GetSoulIdx(colm, row);
  if this.fightHum[idx] ~= nil then
    return idx;
  else
    return -1;
  end
end

  function FightField.AttackSkill(srcIdx, objIdx, skillId, fightArea)  --某SrcIdx對某ObjIdx使用Attack技能
  local fightHum = this.fightHum[srcIdx];
  if fightHum.roleController:GetAttribute(EAttribute.Hp) ==0 then
    return;
  end

  this.SetSkillKind(srcIdx, skillId, objIdx, fightArea);
  if not Skill.IsBasicSkill(skillId) and objIdx ~= nil then 
    this.ShowFightText(fightHum, skillId);
  end

  --使用技能需扣除SP    
  if fightHum.itemSkillId ~= skillId then 
    fightHum:SetAttrEffect(EAttribute.Sp, 1, skillDatas[skillId].requireSp);
  end
end

function FightField.DecShowStartTick(dtime)
  this.showStartTick = this.showStartTick - dtime;
end

function FightField.ShowRound()
  --只秀前三秒
  if CGTimer.time - 3 <= this.showStartTick then
    --UIFight.ShowRoundCount(string.format("Round %d", this.fightRound));
    UIFight.ShowRoundCount(string.format(string.Get(22437).." %d", this.fightRound));--回合改讀字串表
  else
    UIFight.ShowRoundCount("");
  end
end

function FightField.InitShowObj()
  this.InitCountDownObj();
  this.InitControlArrow();
  this.InitBlackObj();
end

function FightField.InitCountDownObj()
  local go = this.fightRoot.transform:Find("CountDownNum");
  if go == nil then return end

  this.CountDownNum = go:GetComponent("Text");
  this.CountDownNum.rectTransform.sizeDelta = Vector2.New(50, 50);
  this.CountDownNum.gameObject:SetActive(false);
end

function FightField.InitControlArrow()
  local go = this.fightRoot.transform:Find("ControlArrow");
  if go == nil then return end  
  this.ctrlArrowRaw = go:GetComponent("Image");
  this.ctrlArrowRaw.sprite = UI.GetSprite("com039");
  this.ctrlArrowRaw.rectTransform.sizeDelta = Vector2.New(82, 40); 
  this.ctrlArrowRaw.gameObject:SetActive(false);
end

function FightField.ShowSlowTurtle()  
  --不秀烏龜
  if not this.isShowTurtle  then 
    for k,v in pairs(this.fightHum) do 
      if v ~= nil and v.roleController ~= nil then 
        v.roleController:StopEmoji();
      end
    end
    return;
  end

  for i= 0, MaxFightHum do  
    if this.fightHum[i] ~= nil then 
      local continue = false;
      local fightRole = this.fightHum[i];
      if this.attack[i] ~= nil and this.attack[i].skillId == ESkill_Kind.EnterFight then 
        continue = true;
      end

      if fightRole.blnFirst then 
        continue = true;
      end

      if not ( Contains( fightRole.kind, EHuman.Player, EHuman.Players, EHuman.FollowNpc, EHuman.Divide, EHuman.CtrlMach, EHuman.CtrlSold)) then 
        continue = true;
      end

      if fightRole.roleController:GetAttribute(EAttribute.Hp) <= 0 then 
        continue = true;
      end
      
      if fightRole:IsInSealStatus() then 
        continue = true;
      end

      if fightRole.blnActSetOK then 
        continue = true ;
      end

      if continue == false then 
        fightRole.roleController:PlayEmoji(124, -1, Vector3.New(20, -30, 0));
      elseif continue == true then 
        fightRole.roleController:StopEmoji();
      end
    end
  end
end

function FightField.ShowCountDown()
  if Role.player.war == EWar.Guest or this.notShowCountDown  then 
    UIFight.ShowCountDown();
    return;
  end

  if this.countDown >= 0 then
    if this.countInterval < 0 then
      UIFight.ShowCountDown(this.countDown);
      this.countDown = this.countDown - 1;
      this.countInterval = 1;

      if this.countDown < 0 then 
        this.CloseSelectFrame();
        this.EndCountDown();
        this.CloseOnTurnUI();

        if not MachineBox.autoFight then  --閒置三回合自動開機關盒
          if this.idleCount >= 2 then 
            MachineBox.SetAutoFight(true, true);
          end
          this.idleCount = this.idleCount + 1;
        end
      end

      if (this.countDown<10) and (this.countDown>-1) then                --小於十秒
        AudioManager.PlayOnce("AudioClip_WA0008");
      end
    else
      this.countInterval = this.countInterval - CGTimer.deltaTime;
    end
  end

  if this.slowCntDown >= 0 then
    if this.slowCntOldTime < 0 then
      this.slowCntDown = this.slowCntDown - 1;
      this.slowCntOldTime = 1;

      if this.slowCntDown ==10 then 
        this.isShowTurtle = true;
      end

      --030718-1J  秀烏龜,20秒時間到不秀
      if this.slowCntDown ==-1 then 
        this.isShowTurtle = false;
      end
      this.ShowSlowTurtle();
    else
      this.slowCntOldTime = this.slowCntOldTime - CGTimer.deltaTime;
    end
  end
end

function FightField.CloseOnTurnUI()  --關閉選擇回合中的介面
  UIFight.ShowMainText(false);
  UIFight.ShowFightBtn(false, true);

  if UI.IsVisible(UITeam) and UITeam.IsCurrentTag(EUITeamTag.FightTeam) then 
    UI.Close(UITeam);
  end

  if UI.IsVisible(UISkillPick) and not UI.IsVisible(UIMachineBox) then 
    UI.Close(UISkillPick);
  end

  this.CloseSelectFrame();
  Hotkey.Close(EUseSource.UIFight);
end

function FightField.GetPlayerIdx()
  for k, v in pairs(this.fightHum) do 
    if v ~= nil then 
      if v.id == Role.playerId and v.kind == EHuman.Player then 
        return k;
      end
    end
  end
  return -1;
end

function FightField.SetCountDown(delaySet)
  if delaySet == nil then 
    delaySet = false;
  end
  local isStart = false;

  for k, v in pairs(this.attack) do
    if v.skillId == ESkill_Kind.EnterFight then 
      isStart = true;
      break;
    end
  end

  if not isStart then 
    this.ClearAllAttack();
  end

  if delaySet == false then
    this.fightRound = this.fightRound + 1;
    this.showStartTick = CGTimer.time;
    this.slowCntDown = this.downSec;
    this.slowCntOldTime = 1;
    this.isShowTurtle = false;
    for i = 0, MaxFightHum do 
      if this.fightHum[i] ~= nil then
        this.fightHum[i].blnFirst = false;
        this.fightHum[i].blnChoose = false;
        this.fightHum[i].blnActSetOK = false;
        this.fightHum[i].itemSkillId = 0;
      end
    end
  end

  this.conIdx = FightField.GetPlayerIdx();
  this.ShowControlMan();

  --玩家若是參戰者,不必出現倒數計時
  if this.isTransiting then 
    this.isCountDown = true;
  end
  UIFight.ShowMainText(false);
  UIFight.ShowFightBtn(true);
  UIFight.UpdateBagRole();
  if Role.player.war == EWar.Guest then
    FightField.EndCountDown()
    return;
  end

  if this.IsCanControl() == false then
    this.NextControlMan();
    if this.conIdx == -1 then
      return;
    end

    if this.IsCanControl() == false then
      this.NextControlMan();
      return;
    end
  end
 
  this.countDown = this.downSec;
  this.countInterval = 0;
  --  //問答時,不可控制玩家
  --  if Fightfield.FFwar_Style in [FWS_BEQ, FWS_GMBeQ] then
  --    ConIdx:=-1;

  if this.CheckMineral(this.fightHum[this.conIdx]) and not this.HaveHoe(this.conIdx) then
    ShowCenterMessage(string.Get(21563));
  end

  if this.CheckMineral(this.fightHum[this.conIdx]) and not this.FightNpcHaveHoe() then
    ShowCenterMessage(string.Get(21563));
  end

  this.HandleAutoDig(); --處理自動攻擊

  if UI.IsVisible(UIMain) then
    UIMain.UpdateBuff();
    UIMain.SetDropdownActive(false);
  end
end

function FightField.IsCanControl()
  if this.conIdx == -1 or this.fightHum[this.conIdx] == nil then 
    return false;
  elseif this.fightHum[this.conIdx].roleController:GetAttribute(EAttribute.Hp) == 0 then
    return false;
  elseif Contains(this.fightHum[this.conIdx]:GetStatusKind(EFightStatusKind.Faint), EStatus.Chaos, EStatus.Taunt) then
    return false;
  elseif this.fightHum[this.conIdx]:IsInSealStatus() then
    return false;
  else
    return true;
  end
end

function FightField.HandleAutoDig()
  if Role.player.war == EWar.None then return end
  if Role.player.war == EWar.Guest then return end
  if MachineBox.autoFight and SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.NoMachinebox) then
    MachineBox.SetAutoFight(false);
    ShowCenterMessage(string.Get(20340));
    return;
  end

  if MachineBox.autoFight then
    local idx = -1;
    local count = 0;
    local fightMode;

    while  this.conIdx ~= -1 do      
      count = count + 1;
      if count > MaxFightHum then break end
      local nowRole = this.fightHum[this.conIdx];
      if MachineBox.autoFight then
        fightMode = MachineBox.GetFightMode(FightField.fightHum[FightField.conIdx].npcId);
      end

      if fightMode == EMachineBoxFight.Att then --普攻(機關盒)
        idx = this.GetAutoTarget();
        if idx ~= -1 then
          if this.CheckEscape() or this.CheckMineralMobEscape() then
            nowRole.useSkID = 18001;
            this.fightHum[idx]:DoClick();
          else
            local exitThreshold = MachineBox.GetExitThreshold(this.fightHum[this.conIdx].npcId);
            if exitThreshold > 0 and this.GetPartyMaxLv() - nowRole.roleController:GetAttribute(EAttribute.Lv) >= exitThreshold then
              nowRole.useSkID = 18001;
              this.fightHum[idx]:DoClick();
            else
              nowRole.useSkID = 10000;
              this.fightHum[idx]:DoClick();
            end
          end
        end
      elseif fightMode == EMachineBoxFight.Skill then --技能(機關盒)
        idx = this.GetAutoTarget();
        if idx ~= -1 then
          if this.CheckEscape() or this.CheckMineralMobEscape() then
            nowRole.useSkID = 18001;
            this.fightHum[idx]:DoClick();
          else
            local exitThreshold = MachineBox.GetExitThreshold(this.fightHum[this.conIdx].npcId);
            if exitThreshold > 0 and this.GetPartyMaxLv() - nowRole.roleController:GetAttribute(EAttribute.Lv) >= exitThreshold then
              nowRole.useSkID = 18001;
              this.fightHum[idx]:DoClick();
            else
              if this.GetPartyMemberCount(EFightParty.Left) > MachineBox.GetAOEThreshold(this.fightHum[this.conIdx].npcId) then
                this.CaseSkill(nowRole, MachineBox.GetSkill(this.fightHum[this.conIdx].npcId ,EMachineBoxSkill.AOE));
              else
                this.CaseSkill(nowRole, MachineBox.GetSkill(this.fightHum[this.conIdx].npcId ,EMachineBoxSkill.Single));
              end

              this.fightHum[idx]:DoClick();
            end
          end
        end
      elseif fightMode == EMachineBoxFight.Def then  --防禦(機關盒)
        if this.CheckEscape() or this.CheckMineralMobEscape() then
          nowRole.useSkID = 18001;
          nowRole:DoClick();
        else
          if this.conIdx ~= -1 then
            local exitThreshold = MachineBox.GetExitThreshold(this.fightHum[this.conIdx].npcId);
            if exitThreshold > 0 and this.GetPartyMaxLv() - nowRole.roleController:GetAttribute(EAttribute.Lv) >= exitThreshold then
              nowRole.useSkID = 18001;
              nowRole:DoClick();
            else
              nowRole.useSkID = 17001; --防禦(17001)
              nowRole:DoClick();
            end
          end
        end
      end
    end
  end
end

function FightField.EndCountDown()
  this.countDown = -1;
  this.conIdx = -1;
  this.ctrlArrowRaw.gameObject:SetActive(false);
  UIFight.ShowCountDown();
end

function FightField.NextControlMan()
  if this.conIdx == -1 then
    return;
  end

  local idx = FightField.GetPlayerIdx();
  if this.fightHum[idx] ~= nil and this.CheckCanAct(idx) then 
    this.conIdx = idx;
    this.ShowControlMan();
    UIFight.UpdateBagRole();
    UIFight.OnNilToSkillID();
  else
    idx = this.FindMasterID(this.conIdx);
    if idx ~= -1 then
      this.conIdx = idx;
      this.ShowControlMan();
      UIFight.UpdateBagRole();
      UIFight.OnNilToSkillID();
    else
      this.conIdx = -1;     --己沒有下一個控制者
      this.EndCountDown();  --結束倒數計時
      this.CloseOnTurnUI();
    end
  end
end

function FightField.ShowControlMan()
  this.ctrlArrowRaw.gameObject:SetActive(false);
--    //觀戰者不秀角錐
  if Role.player == nil or Role.player.war == EWar.Guest then
    return ;
  end
--  //戰鬥問答不秀錐子
  if this.isQandA then
    return;
  end
  if this.conIdx == -1 or this.fightHum[this.conIdx] == nil or this.fightHum[this.conIdx].blnFirst then
    return;
  end
  -- if this.attack[this.conIdx] ~= nil and this.attack[this.conIdx].skillId == ESkill_Kind.EnterFight then
  --   return;
  -- end
  local fightHum = this.fightHum[this.conIdx];
  local pos = fightHum:GetChipPos();

  this.ctrlArrowRaw.rectTransform.anchoredPosition = Vector2.New(pos.x - (this.ctrlArrowRaw.rectTransform.sizeDelta.x / 2) + 2, -(pos.y - (this.ctrlArrowRaw.rectTransform.sizeDelta.y / 2)));
  this.ctrlArrowRaw.gameObject:SetActive(true);
  UIFight.ShowFightBtn(true);

  -- 切換快捷鍵
  if Contains(fightHum.kind, EHuman.CtrlMach, EHuman.CtrlSold) then 
    Hotkey.Close(EUseSource.UIFight);
  else
    Hotkey.Show(UIFight.GetRole(), EHotkeyDisplayMode.Both);    
  end
end

function FightField.CheckCanAct(index)
  local fightRole = this.fightHum[index];
  if fightRole ~= nil and fightRole:IsInSealStatus() == false and Contains(fightRole:GetStatusKind(EFightStatusKind.Faint), EStatus.Chaos, 174, EStatus.Taunt) == false
  and fightRole.blnFirst == false and fightRole.roleController.attributes[EAttribute.Hp] > 0 and fightRole.blnChoose == false and 
  fightRole.blnActSetOK == false then 
    return true;
  else
    return false;
  end
end

function FightField.FindMasterID(seekIdx)
  for i = 0, MaxFightHum do 
    if this.fightHum[i] ~= nil and this.fightHum[i].masterID == Role.playerId and Contains(this.fightHum[i].kind, EHuman.FollowNpc, EHuman.Divide ,EHuman.Player, EHuman.CtrlMach, EHuman.CtrlSold, EHuman.ChaosGod)      
    and this.CheckCanAct(i) then 
      return i;
    end
  end
  return -1;-- 沒有找到
end

function FightField.CheckIsBow(ItemId)
  if itemDatas[ItemId] ~= nil and (itemDatas[ItemId].kind == 7 or Contains(ItemId, 57601, 57602, 57603, 57604))   then --靈性弓
    return true;
  end
  return false;
end

function  FightField.SetConSkill(skillID)   --設定目前操作者的SkillID
  if this.conIdx == -1 then  
    return;
  end

  if Contains(skillID,        --擋非戰鬥特技,讓它們在戰鬥時沒作用
    14003, 14004, 14005,                 --買賣術,探勘術,煉丹術
    14009, 14010, 14011,                 --雇傭,挖礦術,鎔鑄術
    14016, 14017, 14018, 14019, 14020,   --交易術,靜坐,深掘術,鍛造術,窩裡反
    14023,                               --騎馬
    14026, 14027, 14028,                 --召喚,導師,團結
    14032,                               --精煉術
    14034,                               --騎乘術
    10020,11020,12020,13019,14035,       --地動訣,水心訣,火陽訣,風傲訣,轉生
    14038,14039,14041,14043,14045,       --大周天，霸氣，力拔山兮、英氣護身、心眼奕敵
    14047,14048,14049,14050,14051,       --用計、智取、禦敵、策動、仙竅
    14052,                               --化血還魂
    14025,                               --掠奪            
    14077) then                          --光暗招喚
    ShowCenterMessage(string.Get(60046), 1.2); --本技能無法在戰鬥中使用
    return;
  elseif Skill.IsBowSkill(skillID) then --弓箭技能     
    if this.conIdx == this.GetPlayerIdx() then  --玩家自己
      local weaponId = Role.player.data.equips[EItemFitType.Equip_Hand];
      if not FightField.CheckIsBow(weaponId) then 
        ShowCenterMessage(string.Get(71049), 1.2);    --本技能無法在戰鬥中使用
        return;
      end
    end
  elseif Contains(skillID, 10016, 11016, 12016, 13015, 22011, 23011) then
    local role = nil;    
    if this.conIdx == this.GetPlayerIdx() or this.fightHum[this.conIdx].kind == EHuman.Divide then 
      role = Role.player;
    else
      role = Role.GetFollowNpc(Role.playerId, this.fightHum[this.conIdx].npcId);
    end
    if not Item.CheckSummonEquip(skillID, role) then  --召喚技能 沒裝備對應道具
      ShowCenterMessage(string.Get(20362), 1.2);
      return;
    end      
  end

  this.fightHum[this.conIdx].useSkID = skillID;
  this.fightHum[this.conIdx].useItemID = 0;
  FightManager.blnUseTout = false;    --設目前沒在使用偵查術  

  if skillDatas[skillID] ~= nil and skillID ~= 17001 then  --防禦不顯示
    UIFight.ShowMainText(true);   
  end
end

function FightField.UpdateSelectFrame()
  local fightHum = this.fightHum[this.conIdx];

  for k, v in pairs(this.selectFrames)do
    for k2, v2 in pairs(v)do 
      v2.gameObject:SetActive(false);
    end
  end
  if fightHum ~= nil then   
    local hitPKind = fightHum.party_Kind;
    if skillDatas[fightHum.useSkID] ~= nil then  
      if fightHum.useSkID == 11016 then 
        --水神全秀
        FightField.OpenSelectFrame(0); 
      elseif Contains(skillDatas[fightHum.useSkID].fightWay, 1, 2, 3, 11, 15, 21, 22) then --攻擊技, 敵隊伍顯示
        if hitPKind == EFightParty.Right then 
          FightField.OpenSelectFrame(2);
        else
          FightField.OpenSelectFrame(1);
        end
      elseif Contains(skillDatas[fightHum.useSkID].fightWay, 4, 5, 6, 7, 14, 18, 19) then
        if hitPKind == EFightParty.Right then 
          FightField.OpenSelectFrame(1);
        else
          FightField.OpenSelectFrame(2);
        end
      elseif skillDatas[fightHum.useSkID].fightWay == 8 then --復活秀死人
        if hitPKind == EFightParty.Right then 
          FightField.OpenSelectFrame(1, true);
        else
          FightField.OpenSelectFrame(2, true);
        end
      else
        --其餘全秀
        FightField.OpenSelectFrame(0);    
      end
    elseif itemDatas[fightHum.useItemID] ~= nil then 
      --判斷物品
      --不可對敵方使用食物(17)、補品(18)、外掛功能(38)、修鍊物品(52)類
      if Contains(itemDatas[fightHum.useItemID].kind, 17, 18, 38, 52) then      
        if hitPKind == EFightParty.Right then 
          FightField.OpenSelectFrame(1);
        else
          FightField.OpenSelectFrame(2);
        end      
      elseif itemDatas[fightHum.useItemID].kind == 19 then    --不能對我方使用毒藥
        if hitPKind == EFightParty.Right then 
          FightField.OpenSelectFrame(2);
        else
          FightField.OpenSelectFrame(1);        
        end
      elseif  itemDatas[fightHum.useItemID].kind == 50 then    --復活道具目標是死人
        if hitPKind == EFightParty.Right then 
          FightField.OpenSelectFrame(1, true);
        else
          FightField.OpenSelectFrame(2, true);
        end      
      else
        --其餘全秀
        FightField.OpenSelectFrame(0);    
      end
    end
  end
end

function FightField.OpenSelectFrame(partykind, targetDead)
  this.selectMask.gameObject:SetActive(true);
  for k, v in pairs(this.fightHum) do
    local active = v.beh_Kind ~= EFightBeh.Dead and v.beh_Kind ~= EFightBeh.FlyOut;
    if targetDead == true then
      active = true;--v.beh_Kind == EFightBeh.Dead;  --復活類的全部秀
    end
    if partykind == 0 then
      this.selectFrames[v.colm][v.row].gameObject:SetActive(active);
    elseif partykind == 2 then
      if v.kind ~= EHuman.SoulWarrior then
        if v.party_Kind == EFightParty.Left then
          this.selectFrames[v.colm][v.row].gameObject:SetActive(active);
        else
          this.selectFrames[v.colm][v.row].gameObject:SetActive(false);
        end
      end
    elseif partykind == 1 then
      if v.kind ~= EHuman.SoulWarrior then
        if v.party_Kind == EFightParty.Right then
          this.selectFrames[v.colm][v.row].gameObject:SetActive(active);
        else
          this.selectFrames[v.colm][v.row].gameObject:SetActive(false);
        end
      end
    end
  end
end

function FightField.CloseSelectFrame()
  this.selectMask.gameObject:SetActive(false);
  for k, v in pairs(this.selectFrames) do
    for k2, v2 in pairs(v)do 
      v2.gameObject:SetActive(false);
    end
  end
end

function FightField.SetConItem(itemID)
  if this.conIdx == -1 then
    return;
  end

  if bit.band(itemDatas[itemID].restrict2, 4) == 4 then   ----戰鬥中不能使用
    ShowCenterMessage(string.Get(80099), 2);
    return;
  end

  if this.fightHum[this.conIdx].kind == EHuman.ChaosGod then
    -- 若使用角色為天空競技場NPC，則一律禁止用背包物品
    ShowCenterMessage(string.Get(22493));
    return;
  end

  --全回血物不能在攻城戰場使用
  if Contains(itemDatas[itemID].specialAbility, EItemUseKind.ItemUse_25, EItemUseKind.ItemUse_54, EItemUseKind.ItemUse_165) then
    if Contains(this.ffWar_Style, EFFWar_Style.WorldBoss, EFFWar_Style.CityPK) then
      ShowCenterMessage(string.Get(40265));
      return;
    end

--    if City.GetCityId(SceneManager.sceneId) == 0 then
--      ShowCenterMessage(string.Get(40265), 1.2);
--      return;
--    end

--         //無界Server不可用符
--         if RE_MigrantManageTools.IsGalaxyServer(ServerID) then
--         begin
--           AC_shortMsgForm.showMsg(string.Get(40138), 1200);   //該地禁止使用符
--           exit;
--         end

--         //生存戰場不可用符
--         if Player.LifeScene_kind=LifeScene_Fight then
--         begin
--           AC_shortMsgForm.showMsg(string.Get(40138), 1200);   //該地禁止使用符
--           exit;
--         end
  end

  if itemDatas[itemID].kind == 38 then    --經驗值丸戰鬥中不能使用
    if Contains(itemDatas[itemID].specialAbility, 92, 205) then
      return;
    end
  end

  if Contains(itemDatas[itemID].kind, 16, 64) then
    if this.fightHum[this.conIdx].roleController:GetAttribute(EAttribute.Lv) < itemDatas[itemID].needLv then
      ShowCenterMessage(string.Concat(string.Get(40106), itemDatas[itemID]:GetName(true)), 1.2);
      return;
    end

    local oriRole = UIFight.GetRole();
    if oriRole ~= nil then  --轉生資料要去原本RoleController抓
      if oriRole:GetAttribute(EAttribute.Turn) < itemDatas[itemID].turn then
        ShowCenterMessage(string.Get(71093), 1.2);
        return;
      end
    end
  end
  
  this.fightHum[this.conIdx].useItemID = itemID;
  this.fightHum[this.conIdx].useSkID = 0;

  FightManager.blnUseTout = false;   --關閉偵察術
  if itemDatas[itemID] ~= 0 then 
    UIFight.ShowMainText(true);
  end
end

function FightField.CloseAttack()
  if this.attack[this.attackIdx] ~= nil then 
    this.attack[this.attackIdx]:CloseSkill();
  end
end

function FightField.ClearAllAttack()
  for k, v in pairs(this.attack) do 
    this.attackIdx = k;
    xpcall(FightField.CloseAttack, logError);    
  end

  table.Clear(this.attack);

  for k , v in pairs(this.fightHum)do 
    if v ~= nil then 
      v:PlayerEffect();
    end
  end
end


this.testFlip = false;
function FightField.TestSkill()
  if this.selectIdx == nil then
    this.selectIdx = 1;
  end

  if this.testFlip then 
    this.ctrl = this.GetFHumIdx(3, 2);
    this.tar = this.GetFHumIdx(0, 2);
  else    
    this.ctrl = this.GetFHumIdx(0, 2);
    this.tar = this.GetFHumIdx(3, 2); 
  end

  this.TestEnd();
  local skilldata = skillDatas[this.skillList[this.selectIdx]];

  FightField.SetSkillKind(this.ctrl, this.skillList[this.selectIdx], this.tar, skilldata.fightArea);
  if this.testFlip then 
    this.testFlip = false;
  else
    this.testFlip = true;
  end  
  --FightField.fightHum[this.ctrl]:SetStatus(EFightStatusKind.Passive, this.skillList[this.selectIdx]);
end

function FightField.TestAllSkill()
  if this.selectIdx == nil then
    this.selectIdx = 1;
  end

  -- this.ctrl = this.GetFHumIdx(3, 2);
  -- this.tar = this.GetFHumIdx(0, 2);
  this.ctrl = this.GetFHumIdx(0, 2);
  this.tar = this.GetFHumIdx(3, 2); 
  
  this.TestEnd();
  this.playAllSkill = true;
  CGTimer.AddListener(this.UpdateDebugSkill, 0.2);
end

function FightField.TestEnd()
  this.skillIdx = 0;
  if this.attack[this.ctrl] ~= nil and this.attack[this.ctrl].nowSkill ~= nil then
    this.attack[this.ctrl].nowSkill.isLightEnd = true;
  end

  this.playAllSkill = false;
  CGTimer.RemoveListener(this.UpdateDebugSkill);
  TextureManager.ClearUseType(ETextureUseType.EffectLight);
end

function FightField.TestMode()
  this.Create(110, 1);
  local  initSet = {};
  initSet = {}
  initSet.maxHp = 1;
  initSet.maxSp =1;
  initSet.hp = 1;
  initSet.sp = 1;
  initSet.lv = 1;
  initSet.element = 1;
  -- FightField.CreateTestRole(12001, 3, 2, initSet);
  FightField.CreateTestRole(45371, 0, 2, initSet);
  for colm = 2, 3 do 
    for row = 0, 4 do 
      FightField.CreateTestRole(45371, colm, row, initSet);
    end
  end
  
  this.skillList = UIDebug.testSkillList;
end

function FightField.CreateTestRole(npcId, colm, row, initSet)
  local fightIndex = this.GetIdx(colm, row);

  if fightIndex == 255 or fightIndex == -1 then return end

  local fightRole = FightRoleController.New();
  fightRole.kind = EHuman.FollowNpc;
  fightRole.index = fightIndex;
  fightRole.id = npcId;
  
  local role = Role.CreateRole(EHuman.Duplicate, fightIndex);
  role.npcId = npcId;
  role.actions = this.roleActions;
  role:Initialize();
  
  if role == nil or role.gameObject == nil or role.hudObject == nil then
    logError(string.Concat("Init FightHum Fail colm ", colm," row ", row));
    role:Destroy();
    role = nil;
    fightRole = nil;
    return;
  end

  role.kind = EHuman.Duplicate;
  role.hudObject:SetActive(true);
  role:UpdateViewVisible();
  role.gameObject.name = string.format("FightRole_%d_%d", colm, row);
  role.transform:SetParent(this.fightRoot.transform);
  role.transform.localPosition = Vector3.zero;
  role.transform.localScale = Vector3.one;
  role.image_Element.gameObject:SetActive(false);

  fightRole.scaleRoot = role.bodyObject;
  fightRole:SetRoleController(role);

  this.fightHum[fightIndex] = fightRole;
  this.attack[fightIndex] = Attack.New(fightIndex);

  this.fightHum[fightIndex]:DoInFight(colm, row, 0, true, initSet, 3);
end

function FightField.NextSkill()
  if this.attack[this.ctrl] ~= nil and this.attack[this.ctrl].nowSkill ~= nil then
    this.attack[this.ctrl].nowSkill.isLightEnd = true;
  end

  if this.playAllSkill ~= true then
    this.TestEnd();
    this.TestSkill();
  end
end

function FightField.SetSkillKind(srcIdx, skiId, objIdx, fightArea)
  if skiId == ESkill_Kind.None then 
    return 
  end

  if this.attack[srcIdx] == nil then 
    this.attack[srcIdx] = Attack.New(srcIdx);
  end    
  this.attack[srcIdx]:SetKind(skiId, objIdx, fightArea);    
end

function FightField.DoQandA(data)
  local showRole = nil;
  local selects = {};
  local question = data:ReadString(data:ReadByte());
  
  for i = 1, 3 do
    selects[i] = data:ReadString(data:ReadByte());
  end
  
  selects[4] = data:ReadString(data.length);

  if this.isInBattle then
    UIFight.SetCountDownPosY(0);

    for k, v in pairs(this.fightHum) do
      if v ~= nil then
        if v.id > 0 and v.party_Kind == EFightParty.Left then
          showRole = v.roleController;
          this.isQandA = true;
          this.ctrlArrowRaw.gameObject:SetActive(false);
          break;
        end
      end
    end
  end

  ShowOptionMessage(
    function(result)
      sendBuffer:Clear();
      sendBuffer:WriteInt32(result);
      Network.Send(16, 1, sendBuffer);

      AudioManager.PlayOnce("AudioClip_WA0018");

      if this.isInBattle then
       this.EndCountDown();
      end
    end,
    question,
    selects,
    showRole
  );
end

function FightField.StopStatus(humIdx, kind)
  if this.fightHum[humIdx] == nil then 
    return;
  end
  
  if this.fightHum[humIdx].status[kind] ~= nil then 
    this.fightHum[humIdx].status[kind]:StopAllLight();
  end  
end

function FightField.SetShake(shake)
  if shake == false then 
    this.fightRoot.transform.localPosition  = Vector3.zero;
    MapManager.gridRoot.transform.localPosition = Vector3.zero;
  end
  this.isShake = shake;
end

function FightField.FindID(id, humKind, npcIdx)
--[[
id:要查的 玩家ID或是NpcID
humKind: 要查的種類  Hum_Players or Hum_FollowNpc or Hum_ManNpc
npcIdx: 0:指家 1以上,指
--]]  
  if Role.player.war == EWar.None then
    return 0;
  end

  for k, v in pairs(this.fightHum) do
    if v ~= nil and
      v.id == id  and 
      v.kind == humKind and
      v.npcIdx == npcIdx then
      return k;
    end
  end

  return 0;
end

function FightField.InitBlackObj()
  local blackObj = this.fightRoot.transform:Find("BlackObj");
  if blackObj ~= nil then
    destroy(blackObj.gameObject);
  end

  local gameObject = GameObject.New();
  gameObject.name = "BlackObj";
  gameObject.transform:SetParent(this.fightRoot.transform);
  local canvas = gameObject:AddComponent(typeof(Canvas));
  canvas.overrideSorting = true;
  canvas.sortingOrder = this.FIGHT_GROUND_ORDER - 300;
  this.blackImage = gameObject:AddComponent(typeof(Image));
  this.blackImage.color = LuaHelper.GetColor(40, 40, 40, 255);
  local rectTrans = gameObject:GetComponent("RectTransform");
  if rectTrans ~= nil then 
    rectTrans.anchorMin = Vector2.New(0, 0);
    rectTrans.anchorMax = Vector2.New(1, 1);
    rectTrans.pivot = Vector2.New(0.5, 0.5);
    rectTrans.offsetMin = Vector2.New(-50, -50);
    rectTrans.offsetMax = Vector2.New(50, 50);
  end
  gameObject:SetActive(false);
end

function FightField.DrawBlack()
  if not this.isDrawBlack then
    return;
  end

  if this.blackAlpha >= 255 then
    this.blackImage.color = LuaHelper.GetColor(40, 40, 40, 255);
  else
    this.blackImage.color = LuaHelper.GetColor(40, 40, 40, this.blackAlpha);
  end

  if this.blackAlpha >= this.endBlackAlpha then
    this.blackAlpha = this.endBlackAlpha;
  else
    this.blackAlpha = this.blackAlpha + this.changeAlpha;
  end
end

function FightField.SetDrawBlack(startAlpha, endAlpha, changeAlpha)
  this.blackAlpha = startAlpha;
  this.endBlackAlpha = endAlpha;
  this.changeAlpha = changeAlpha;
  this.isDrawBlack = true;
  this.blackImage.gameObject:SetActive(this.isDrawBlack);
end

function FightField.CloseDrawBlack()
  this.isDrawBlack = false;
  this.blackImage.gameObject:SetActive(this.isDrawBlack);
end

function FightField.GetNextPos(sPos, rj, dist)
  local fixedW, fixedH;   --移到下一個格子長和寬的x,y差值
  fixedW = {};
  fixedW.x = math.round(dist * FieldSinSitaW);
  fixedW.y = math.round(dist * FieldCosSitaW);

  fixedH = {};
  fixedH.x = math.round(dist * FieldSinSitaH);
  fixedH.y = math.round(dist * FieldCosSitaH);
  
  local goal = Vector2.zero;
  if rj == 0 then     
    goal.x = sPos.x - dist;
    goal.y = sPos.y;
  elseif rj == 1 then         
    goal.x = sPos.x - fixedW.x;
    goal.y = sPos.y - fixedW.y;
  elseif rj == 2 then           
    goal.x = sPos.x;
    goal.y = sPos.y - dist;      
  elseif rj == 3 then       
    goal.x = sPos.x - fixedH.x;
    goal.y = sPos.y + fixedH.y;      
  elseif rj == 4 then       
    goal.x = sPos.x + dist;
    goal.y = sPos.y;
  elseif rj == 5 then           
    goal.x = sPos.x + fixedW.x;
    goal.y = sPos.y + fixedW.y;      
  elseif rj == 6 then       
    goal.x = sPos.x;
    goal.y = sPos.y + dist;
  elseif rj == 7 then           
    goal.x = sPos.x + fixedH.x;
    goal.y = sPos.y - fixedH.y;      
  else  
    goal.x = sPos.x;
    goal.y = sPos.y;      
  end
  return goal;
end

function FightField.GetSpotOfCutLine(srcX, srcY, aTarX, aTarY, aSpot, aAllSpot)
  local fixedW, fixedH, goal;   --移到下一個格子長和寬的x,y差值
  local sinSitaW, cosSitaW;     --Width斜率的Sin和Cos
  local dx, dy, aTotalDist, aDist, slop;
  
  goal = {};
  goal.x = srcX;
  goal.y = srcY;

  dx = srcX - aTarX;
  dy = srcY - aTarY;
  aTotalDist = math.round(math.sqrt(math.pow(dx, 2) + math.pow(dy, 2)));
  if aTotalDist == 0 then
    return goal;
  end

  aDist = math.round(aTotalDist / (aAllSpot - 1 + 0.001) * (aSpot - 1));
  slop = math.abs(dy / (dx + 0.001));

  sinSitaW = 1 / math.sqrt(math.pow(slop, 2) + 1);
  cosSitaW = slop / math.sqrt(math.pow(slop, 2) + 1);
  fixedW = {};
  fixedW.x = math.round(aDist * sinSitaW);
  fixedW.y = math.round(aDist * cosSitaW);

  if dx >= 0 then
    goal.x = srcX - fixedW.x;
  else
    goal.x = srcX + fixedW.x;
  end

  if dy >= 0 then
    goal.y = srcY - fixedW.y;
  else
    goal.y = srcY + fixedW.y;
  end

  return goal;
end

function FightField.SaveFlyTreasure(fColm, fRow, colm, row, itemId)
  table.insert( this.flyTreasureData, FlyTreasure.New(fColm, fRow, colm, row, itemId));
end

function FightField.AddFlyTreasure(sColm, sRow, dColm, dRow, itemId)  
  local srcX, srcY, goalX, goalY;
  local item;
  local gID;

  if (dColm>3)or(dRow>4) then
    logError("戰鬥中收到物品目的座標不對")    
    return;
  end

  srcX = this.chip[sColm][sRow].x;
  srcY = this.chip[sColm][sRow].y;
  goalX = this.chip[dColm][dRow].x;
  goalY = this.chip[dColm][dRow].y;

  item =  itemDatas[itemId];
  if item ~= nil then      
    gID = tostring(item.iconId);
      --todo
      --找無圖檔,塞入問號圖
--      if se_CtrlImgDB.GetBmpIndex(gID)=-1 then
--        gID = DefItemGID;
--      end
  else
    gID = "1000";
  end
  local effect = EffectLight.New(gID, 10, 1, 1, 1, EEffectLightTracer.Curve, srcX, srcY, 255, false, 0, goalX, goalY);
  effect:SetTimeScale(FightField.timeScale);   
  effect:SetSortingOrder(this.FIGHT_SKY_ORDER);
  table.insert(this.flyTreasure, effect);    
end

--偵查顯示資訊
function FightField.ShowScoutInfos()
  local visible = not this.scoutVisible;
  for k, v in pairs(this.scoutInfos)do
    v.gameObject:SetActive(false);
  end

  if visible then 
    this.UpdateScoutInfo();
  end

  this.scoutVisible = visible;
end

function FightField.CloseScoutInfoSingle(fightRole)
  local index = fightRole.colm * MaxChipRow + fightRole.row;
  if this.scoutInfos[index] ~= nil then 
    this.scoutInfos[index].gameObject:SetActive(false);
  end
end

function FightField.UpdateScoutInfoSingle(fightRole)
  --靈魂武將不顯示
  if fightRole.kind == EHuman.SoulWarrior then return -1; end

  local index = fightRole.colm * MaxChipRow + fightRole.row;
  if this.scoutInfos[index] == nil then 
    local o = {};   
    o.gameObject = poolMgr:Get("BaseRoleHintText");     
    o.transform = o.gameObject.transform;   
    o.transform:SetParent(this.fightTextRoot);
    o.transform.localPosition = Vector3.zero;
    o.transform.localScale = Vector3.one;    
    o.rect = o.gameObject:GetComponent("RectTransform");
    o.text = o.transform:Find("Text"):GetComponent("Text");
    o.textRect = o.text:GetComponent("RectTransform");
    this.scoutInfos[index] = o;
  end

  local infos = this.scoutInfos[index];      
  local str = "";
  local role = fightRole.roleController;
  local pos =  Vector3.New(this.chip[fightRole.colm][fightRole.row].x, -this.chip[fightRole.colm][fightRole.row].y, 0);
  local element = role:GetAttribute(EAttribute.Element);
--[[
  str = string.Concat("LV.", role:GetAttribute(EAttribute.Lv), " ", string.GetColorText(string.GetElement(element), Color.CareerKind[element][1]));
  str = string.Concat(str, "\n", "HP ", role:GetAttribute(EAttribute.Hp), "/", role:GetAttribute(EAttribute.MaxHp));
  str = string.Concat(str, "\n", "SP ", role:GetAttribute(EAttribute.Sp), "/", role:GetAttribute(EAttribute.MaxSp));
]]
  str = string.Concat(string.Get(22447), role:GetAttribute(EAttribute.Lv), " ", string.GetColorText(string.GetElement(element), Color.CareerKind[element][1]));
  str = string.Concat(str, "\n", string.Get(20401)," ", role:GetAttribute(EAttribute.Hp), "/", role:GetAttribute(EAttribute.MaxHp));
  str = string.Concat(str, "\n", string.Get(20402)," ", role:GetAttribute(EAttribute.Sp), "/", role:GetAttribute(EAttribute.MaxSp));

  infos.text.text = str;
  infos.gameObject:SetActive(true);
  infos.textRect:ForceUpdateRectTransforms();

  infos.positionKey = fightRole.colm * 10 + (4 - fightRole.row);

  local offsetY = (3 - fightRole.row) * 5;

  if fightRole.colm == 0 or fightRole.colm == 2 then
    infos.transform.localPosition = Vector3.New(pos.x -5 , pos.y + 20 + offsetY, 0);
  else
    infos.transform.localPosition = Vector3.New(pos.x + 15, pos.y + 10 + offsetY, 0);
  end  
  return index;
end

function FightField.UpdateScoutInfoSize()
  for k, v in pairs(this.scoutInfos) do 
    if v ~= nil then 
      v.rect.sizeDelta = Vector2.New(v.textRect.sizeDelta.x + 5, 50);  
    end
  end
end

function FightField.UpdateScoutInfo()
  local sortIndex = {};
  for k, v in pairs(this.fightHum) do
    if v ~= nil then   
      local index = this.UpdateScoutInfoSingle(v)
      if index > 0 then
        table.insert(sortIndex, this.scoutInfos[index].positionKey);
      end
    end
  end
  CGTimer.DoFunctionDelay(0.05, FightField.UpdateScoutInfoSize);
  table.sort(sortIndex);
  for i = table.maxn(sortIndex), 1, -1 do
    for k, v in pairs(this.scoutInfos) do
      if sortIndex[i] == v.positionKey then
        v.transform:SetSiblingIndex(0);
        break;
      end
    end
  end
end

function FightField.ShowFightText(fightRole, skillId)
  if fightRole == nil or skillDatas[skillId] == nil then  
    return;
  end

  this.fightTextCountDown = 0;

  local o = {};   
  o.gameObject = poolMgr:Get("BaseFightText");
  o.gameObject.transform:SetParent(fightRole.roleController.transform);
  o.gameObject.transform.localPosition = Vector3.New(0, 120, 0);
  o.gameObject.transform.localScale = Vector3.one;   
  o.bg = o.gameObject:GetComponent("Image");
  o.text = o.gameObject.transform:Find("Text").gameObject:GetComponent("Text");

  o.text.text = skillDatas[skillId].name;

  if Color.SkillKind[skillDatas[skillId].kind] ~= nil then
    o.bg.color = Color.SkillKind[skillDatas[skillId].kind];
  else
    o.bg.color = Color.SkillKind[0];
  end

  table.insert(this.fightText, o);
end

function FightField.GetPartyMaxLv()
  local lv;
  local maxLv = 0;
  local side = this.fightHum[this.GetPlayerIdx()].party_Kind;

  for k, v in pairs(this.fightHum)do
    if v ~= nil and v.party_Kind ~= side then
      lv = v.roleController:GetAttribute(EAttribute.Lv)
      if lv > maxLv then
        maxLv = lv;
      end
    end
  end

  return maxLv;
end

function FightField.GetPartyMemberCount(kind)
  local count = 0;

  for k, v in pairs(this.fightHum)do
    if v ~= nil and v.party_Kind == kind and v.roleController:GetAttribute(EAttribute.Hp) > 0 then
      count = count + 1;
    end
  end

  return count;
end

function FightField.CheckMineralMobEscape()
  if MachineBox.client.general[EMachineBoxSwitch.Hoe] then
    return this.CheckMineral(this.fightHum[this.conIdx]) and not this.HaveHoe(this.conIdx);
  else
    return MachineBox.client.general[EMachineBoxSwitch.Mineral] and this.CheckMineral(this.fightHum[this.conIdx]) and not this.HaveHoe(this.conIdx);
  end
end

function FightField.CheckMineral(role)
  local npcData;
  for k, v in pairs(this.fightHum)do
    if v ~= nil and v.party_Kind == EFightParty.Left then
      npcData = npcDatas[v.roleController.npcId];
      if npcData ~= nil and npcData.kind == 16 then
        return true;
      end
    end
  end

  return false;
end

function FightField.HaveHoe(conIdx)
  if conIdx == this.GetPlayerIdx() then
    return Item.CheckHaveHoe(0);
  else
    local followNpc = Role.GetFollowNpc(Role.playerId, this.fightHum[conIdx].npcId);
    return Item.CheckHaveHoe(followNpc.index);
  end
end

function FightField.FightNpcHaveHoe()
  local followNpc = Role.GetFollowNpc(Role.playerId, this.fightHum[this.conIdx].npcId);
  if followNpc ~= nil then
    return Item.CheckHaveHoe(followNpc.index);
  end

  return true;
end

function FightField.CaseSkill(role, skillId)
  --預設普攻
  role.useSkID = 10000;

  local skillData = skillDatas[skillId];
  if skillId == 0 or skillData == nil then return end

  --檢查技能種類
  if Contains(skillData.fightWay, 6, 7, 8, 14, 19) and skillData:Except() then return end

  --檢查SP
  if role.roleController:GetAttribute(EAttribute.Sp) < skillData.requireSp then return end

  local oriRole = nil;
  if Contains(role.kind, EHuman.Player, EHuman.Players, EHuman.Divide) then
    oriRole = Role.player;
  elseif role.kind == EHuman.FollowNpc then
    oriRole = Role.GetFollowNpc(Role.playerId, role.npcId);
  end

  --無技能資料
  if oriRole == nil then return end

  --檢查技能等級
  if oriRole:GetSkillLv(skillId) <= 0 then return end

  --檢查召喚紋章
  if Contains(skillId, 10016, 11016, 12016, 13015, 22011, 23011) and not Item.CheckSummonEquip(skillId, oriRole) then return end

  if Skill.IsBowSkill(skillId) then --弓箭技能     
    if Contains(role.kind, EHuman.Player, EHuman.Players, EHuman.Divide) then  --玩家自己
      local weaponId = Role.player.data.equips[EItemFitType.Equip_Hand];
      if itemDatas[weaponId] == nil or itemDatas[weaponId].kind ~= 7 then         
        return;
      end
    end
  end

  role.useSkID = skillId;
end

--取得攻擊的對向
function FightField.GetPartyOne(partyKind)
  local result = -1;

  if partyKind == EFightParty.Left then
    for i = 0, 1 do
      result = this.Getsurvivor(i);
      if result ~= -1 then break end
    end
  else
    for i = 3, 2, -1 do
      result = this.Getsurvivor(i);
      if result ~= -1 then break end
    end
  end

  return result;
end

function FightField.Getsurvivor(i)
  local result = -1;
  local fHumIdx;

  for j = 0, 4 do
    fHumIdx = this.GetFHumIdx(i, j);
    if this.fightHum[fHumIdx] ~= nil and this.fightHum[fHumIdx].roleController.attributes[EAttribute.Hp] ~= 0 then
      result = fHumIdx;
      break;
    end
  end

  return result
end

--取得敵方人數
function FightField.GetEnemyCount(partyKind)
  local count = 0;
  local fHumIdx;

  table.Clear(this.enemy);

  if partyKind == EFightParty.Left then
    for i = 0, 1 do
      this.enemy[i] = {};
      for j = 0, 4 do
        fHumIdx = this.GetFHumIdx(i, j);
        if this.fightHum[fHumIdx] ~= nil and this.fightHum[fHumIdx].roleController.attributes[EAttribute.Hp] ~= 0 then
          count = count + 1;
          this.enemy[i][j] = i * 5 + j;
        else
          this.enemy[i][j] = -1;
        end
      end
    end
  else
    for i = 3, 2 do
      this.enemy[i] = {};
      for j = 0, 4 do
        fHumIdx = this.GetFHumIdx(i, j);
        if this.fightHum[fHumIdx] ~= nil and this.fightHum[fHumIdx].roleController.attributes[EAttribute.Hp] ~= 0 then
          count = count + 1;
          this.enemy[i][j] = i * 5 + j;
        else
          this.enemy[i][j] = -1;
        end
      end
    end
  end

  return count;
end

--取得敵方怪有三隻以上並排的第二隻
function FightField.GetTreeRowCenter(partyKind)
  local result = -1;

  if partyKind == EFightParty.Left then
    for i = 0, 1 do
      for j = 0, 4 do
        if this.CheckEnemy(i, j) and this.CheckEnemy(i, j + 1) and this.CheckEnemy(i, j + 2) then
          result = this.GetFHumIdx(i, j + 1);
          break;
        end
      end
      if result ~= -1 then break end
    end
  else
    for i = 3, 2 do
      for j = 0, 4 do
        if this.CheckEnemy(i, j) and this.CheckEnemy(i, j + 1) and this.CheckEnemy(i, j + 2) then
          result = this.GetFHumIdx(i, j + 1);
          break;
        end
      end
      if result ~= -1 then break end
    end
  end

  return result;
end

function FightField.CheckEnemy(i, j)
  if this.enemy[i][j] ~= nil and this.enemy[i][j] >= 0 then
    return true;
  else
    return false;
  end
end

function FightField.GetAutoTarget()
  local idx = -1;

  if this.fightHum[this.GetPlayerIdx()].party_Kind == EFightParty.Right then
    if this.GetEnemyCount(EFightParty.Left) < 3 then
      idx = this.GetPartyOne(EFightParty.Left);
    else
      idx = this.GetTreeRowCenter(EFightParty.Left);
      if idx < 0 then
        idx = this.GetPartyOne(EFightParty.Left);
      end
    end
  else
    if this.GetEnemyCount(EFightParty.Right) < 3 then
      idx = this.GetPartyOne(EFightParty.Right);
    else
      idx = this.GetTreeRowCenter(EFightParty.Right);
      if idx < 0 then
        idx = this.GetPartyOne(EFightParty.Right);
      end
    end
  end

  return idx;
end

function FightField.CheckEscape()
  local result = false;
  local escapeCount = MachineBox.GetEscape() - 1;

  if escapeCount <= 0 then return false end

  if this.fightHum[this.GetPlayerIdx()].party_Kind == EFightParty.Right then
    if this.GetEnemyCount(EFightParty.Left) > escapeCount then
      result = true;
    end
  else
    if this.GetEnemyCount(EFightParty.Right) > escapeCount then
      result = true;
    end
  end

  return result;
end

function FightField.GetFightRoleByRole(role)
  for k, v in pairs(this.fightHum)do
    if role.kind == EHuman.FollowNpc then 
      if role.npcId == v.npcId and role.data.master.index == v.masterID then       
       return v;
      end
    else
      if role.index == v.id and role.kind == v.kind then       
        return v;
      end
    end
  end
  return nil;
end

function FightField.UpdateFightRoleJmp(role)
  local fightRole = this.GetFightRoleByRole(role);
  if fightRole ~= nil then 
    fightRole.roleController:UpdateViewJMP(role);     
  end
end

function FightField.UpdateFightRoleAttribute(role, kind) 
  --只有max hp& max sp需要更新
  if not Contains(kind, EAttribute.MaxHp, EAttribute.MaxSp, EAttribute.EquipHpx, EAttribute.EquipSpx) then     
    return;
  end
  local fightRole = this.GetFightRoleByRole(role);
  if fightRole ~= nil then 
    local value = 0;
    if Contains(kind, EAttribute.MaxHp, EAttribute.EquipHpx) then           
      fightRole.roleController:SetAttribute(EAttribute.MaxHp, role:GetAttribute(EAttribute.MaxHp));
    elseif Contains(kind, EAttribute.MaxSp, EAttribute.EquipSpx) then           
      fightRole.roleController:SetAttribute(EAttribute.MaxSp, role:GetAttribute(EAttribute.MaxSp));
    end
    
    if this.scoutVisible then 
      this.UpdateScoutInfoSingle(fightRole);
    end
  end
end

function FightField.GetConFightRoleKind()
  if this.fightHum[this.conIdx] ~= nil then 
    return this.fightHum[this.conIdx].kind;
  else
    return EHuman.None;
  end
end

function FightField.AddTeamSp(party, sp)
  for k, v in pairs(this.fightHum)do 
    if v~=nil and v.party_Kind == party and (v.kind == EHuman.Player or v.kind == EHuman.Players or v.kind == EHuman.FollowNpc)then 
      local addSp = sp + v.roleController:GetAttribute(EAttribute.Sp);
      addSp = math.min(addSp, v.roleController:GetAttribute(EAttribute.MaxSp));      
      v.roleController:SetAttribute(EAttribute.Sp, addSp);
      v:AddNumberUp(sp, EEffectLightTracer.Line, v.nowPos.x, v.nowPos.y-200, 0.24, 3);
      v:UpdateUIInfo();      
    end
  end
end

function FightField.GetRoleByNpcId(npcId)
  for k, v in pairs(this.fightHum)do 
    if v.npcId == npcId then 
      return v;
    end
  end
  return nil;
end

function FightField.CheckFollowNpcIsInBattle(roleIdx)
  local npcs = Role.GetFollowNpcs(Role.playerId);
  if npcs[roleIdx] == nil then 
    return false;
  end
  return npcs[roleIdx] == Role.fightNpc;
end

function FightField.CheckFollowNpcCurrentControl(roleIdx)
  local npcs = Role.GetFollowNpcs(Role.playerId);
  if npcs[roleIdx] == nil then 
    return false;
  end
  return this.fightHum[this.conIdx].npcId ==  npcs[roleIdx].npcId;
end

function FightField.SetPvpItemCount(count)
  this.pvpItemCount = count;
end

function FightField.SetRoleVisibleByID(npcId, status)
  for k, v in pairs(this.fightHum)do 
    if v.npcId == npcId then 
      v.roleController:SetVisible(status);
    end
  end
end

function FightField.IsGiantBoss(npcId)
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
  if Between(npcId, 35029, 35034) or Between(npcId, 35054, 35056) or Between(npcId, 35060, 35062) or Between(npcId, 38361, 38363)
    or npcId == 35063 then
    return true;
  else
    return false;
  end
end