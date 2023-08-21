EAward = {
  Login = 1,           --每日登入
  AccLogin = 2,        --累計登入
  Online = 3,          --在線好禮
  OpenServer = 4,      --開服好禮
  Code = 5,            --虛寶碼
  Month = 6,           --月卡
  Save = 7,            --儲值送
  Back = 8,            --消費返利
  Change = 9,          --好禮兌換
  Exp = 10,            --離線經驗
  Festival = 11,       --慶典兌換
  SaveGift = 12,       --儲值滿額禮物
  Consume = 13,        --消費送
  LottoNpc = 14,       --抽抽樂武將
  LottoCard = 15,      --抽抽樂卡片
  DragonBox = 16,      --藏龍寶箱
  MoneyTree = 17,      --搖錢樹
  SupportArmy = 18,    --支援軍團
  DoubleSave = 19,     --儲值雙倍送
  Furnace = 20,        --黃金熔爐
  Scratch = 21,        --刮刮樂
  ConsumeScratch = 22, --消費刮刮樂
  Poke = 23,           --戳戳樂送
  StagePass = 24,      --百戰天關
  ClassAward = 25,     --達標領獎
  ActLogin = 26,       --累積登入領獎
  ActAccLogin = 27,    --連續登入領獎
  ReturnLogin = 28,    --老手回歸
  Swimming = 29,       --泳池獎勵
  ReUseAct_1 = 30,     --重覆使用1(one RoleCount)
  ReUseAct_2 = 31,     --重覆使用2(one RoleCount)
  ReUseAct_3 = 32,     --重覆使用3
  ReUseAct_4 = 33,     --重覆使用4(領獎跟累積值會循環)
  ReUseAct_5 = 34,     --重覆使用5(領獎跟累積值會循環)
  ReUseAct_6 = 35,     --重覆使用6
  Collect = 36,        --全服收集
  Arena = 37,          --周年競技慶典
  SoulGacha = 38,      --靈魂抽送
  Prize_1 = 101,       --Prize活動1
  Prize_2 = 102,       --Prize活動2
  Prize_3 = 103,       --Prize活動3
  Prize_4 = 104,       --Prize活動4
  Prize_5 = 105,       --Prize活動5
  Prize_6 = 106,       --Prize活動6
  Prize_7 = 107,       --Prize活動7
  Prize_8 = 108,       --Prize活動8
}

EUITag = {
  Login = 1,           --每日登入
  Online = 2,          --在線好禮
  OpenServer = 3,      --開服好禮
  Code = 4,            --虛寶碼
  Month = 5,           --月卡
  Save = 6,            --儲值送
  Back = 7,            --消費返利
  Change = 8,          --好禮兌換
  Exp = 9,             --離線經驗
  Consume = 10,        --消費送
  LottoNpc = 11,       --抽抽樂武將
  LottoCard = 12,      --抽抽樂卡片
  DragonBox = 13,      --藏龍寶箱
  MoneyTree = 14,      --搖錢樹
  SupportArmy = 15,    --支援軍團
  DoubleSave = 16,     --儲值雙倍送
  Furnace = 17,        --黃金熔爐
  Scratch = 18,        --刮刮樂
  ConsumeScratch = 19, --消費刮刮樂
  Poke = 20,           --戳戳樂送
  StagePass = 21,      --百戰天關
  ClassAward = 22,     --達標領獎
  ActLogin = 23,       --累積登入領獎
  ActAccLogin = 24,    --連續登入領獎
  ReturnLogin = 25,    --老手回歸
  Swimming = 26,       --泳池獎勵
  ReUseAct_1 = 27,     --重覆使用1(one RoleCount)
  ReUseAct_2 = 28,     --重覆使用2(one RoleCount)
  ReUseAct_3 = 29,     --重覆使用3
  ReUseAct_4 = 30,     --重覆使用4
  ReUseAct_5 = 31,     --重覆使用5
  ReUseAct_6 = 32,     --重覆使用6
  Collect = 33,        --全服收集
  Arena = 34,          --周年競技慶典
  SoulGacha = 35,      --靈魂抽
  Prize_1 = 101,       --Prize活動1
  Prize_2 = 102,       --Prize活動2
  Prize_3 = 103,       --Prize活動3
  Prize_4 = 104,       --Prize活動4
  Prize_5 = 105,       --Prize活動5
  Prize_6 = 106,       --Prize活動6
  Prize_7 = 107,       --Prize活動7
  Prize_8 = 108,       --Prize活動8
}

EExp = {
  Free = 1,      --免費
  Money = 2,     --金幣取得
  Gold = 3,      --元寶取得
}

ESortOrder = {
  Available = 1000,  --可領取
  Processing = 2000, --進行中
  Complete = 3000,   --完成的
}

EActType = {
  Consume = 1,  --耗點
  Save = 2,     --儲點
}

EActKind = {
  Single = 1,           --單筆區間制
  AccDay = 2,           --當日累積區間(晚上12點送)
  AccSum = 3,           --總活動累積(最後一天送)
  FullPoint = 4,        --滿點倍數送(例滿400,1500的倍數  立即送)
  Condition = 5,        --達到固定點數送( 例滿1500,3000,5000  立即送)
  First = 6,            --帳號第一次
  AllServer = 7,        --全伺服器排行
  SelfServer = 8,       --伺服器各自排行
  SpecConsume = 9,      --特殊儲耗回饋
  ContConsume = 10,     --連續儲耗
  DayCondition = 11,    --每日條件與達成天數(lowp為條件 highp為天數)
}

ESpecSet = {
  UpToInterval = 1,     --點數大於區間最大都能領取 不限制只能領最高  但都只能領一次
  RepeatTop = 2,        --最高獎項可以重複領取
  FirstExtra = 3,       --活動期間的首次額外加送
  ClearByDay = 4,        --每日清除所有累積點數
  ReAcc = 5,            --超過最大限額 則扣除最大限額 重新累計
}

UILoginAward = {}
local this = UILoginAward;

this.name = "UILoginAward";
this.uiController = nil;

this.MaxDay = 28;
this.MaxAcc = 5;
this.MaxItem = 5;
this.ChangeIndex = 6;
this.MaxBack = 7;
this.MaxBackBG = 8;
this.ValidTag = 100;
this.BasePrize = 100;
this.ConsumeRedDot = false;
this.SaveRedDot = false;
this.BackRedDot = false;
this.FirstPrizeRedDot = false;
this.DragonBoxRedDot = false;
this.SupportArmyRedDot = false;
this.PokeOnceRedDot = false;
this.SoulGachaRedDot = false;
this.ReUseAct = false;
this.PrizeRedDot = { false, false, false, false, false, false };
this.MaxPrize = 8;
this.BackActicityStrat = 22;
this.BackActicityEnd = 23;
this.DragonBoxTime = 0;
this.MaxFruit = 10;
this.ScratchAnimationKind = 8;
this.MinChangeCount = 5;
this.MaxChangeCount = 50;

local transform_FrameRect;
local transform_ItemRoot;
local transform_Additional;

local awardObjs = {};
local accAwardObjs = {};
local fruitObjs = {};
local loginAward = {};
local changeItems = {};
local text_loginDays;
local text_Info;
local text_online;
local text_SaveDate;
local text_ConsumeDate;
local text_ChangeDate;
local text_BackDate;
local text_SaveValue;
local text_ConsumeValue;
local text_backDays;
local text_reciveDays;
local text_backPrice;
local text_time;
local text_Acc;
local text_exp;
local text_free;
local text_expInfo;
local text_rate = {};
local text_money = {};
local text_BackStartDay;
local text_BackEndDay;
local text_DragonBoxDate;
local text_SupportAmay;
local text_MoneyTreeLv;
local text_MoneyTreeTime;
local text_MoneyTreeDate;
local text_MoneyTreeGold;
local text_DoubleSaveDate;
local text_DoubleSaveVal;
local text_DoubleSaveBack;
local text_DoubleSaveDetail;
local text_SoulDate;
local text_SoulValue;

local gameObjs = {};

local inputField_Code;
local image_BackRecived;
local image_BackButton;
local rawImgame_Cover;
local rawImgame_MoneyTree;
local slider_time;
local slider_accTime;
local slider_treeTime;

local tagDatas = {};
local subTagDatas = {};
local changeAward = {};
local currentTag = EUITag.Login;
local currentSubPage = 1;

local scrollContent_Online;
local scrollItems_Online = {};
local scrollContent_OpenServer;
local scrollItems_OpenServer = {};
local scrollContent_Save;
local scrollItems_Save = {};
local scrollContent_Consume;
local scrollItems_Consume = {};
local scrollContent_Change;
local scrollItems_Change = {};
local scrollContent_SupportArmy;
local scrollItems_SupportArmy = {};
local scrollContent_Back;
local scrollItems_Back = {};
local scrollContent_DragonBox;
local scrollItems_DragonBox = {};
local scrollContent_Soul;
local scrollItems_Soul = {};

local onlineTime;
local reslutString = {20689, 98017, 20702, 80359, 20703, 60065, 22373, 23210};
local activeBackDay = 0;  --消費返利的進行天數
local leftTime = {};
local expDatas = {};
local prizeDatas = {};
local PlayerPrizeDatas = {};
local serverCollects = {};
local changeSubTagRedDot = {};

local images = {"common0_bod053", "common0_bod054", "common0_bod110", "common0_bod111", "common0_bod114"};
local dragonBoxRoleCount = 0;
local nowDragonBoxCountDown = 0;
local playerSupportArmy = 0;
local totalSupportArmy = 0;
local moneyTreeLv = 1;    --搖錢樹等級
local moneyTreeFurit = 0; --搖錢樹的果實數
local moneyGrowTime = 0;  --搖錢樹的開始栽培時間
local moneyTreeTime = 0;  --搖錢樹的開始栽培時間

local text_SBonus;
local text_Ticket_100;
local text_Ticket_500;
local text_Ticket_1000;
local text_ScratchReward;
local text_ScratchRewardHint;
local image_Btn_Scratch = {};
local rawImage_Scratch;
local rawImage_ScratchMask;
local gameObject_AnimationRoot;
local gameObject_ScratchMask;

local isPlayingScratch = false;
local isSendScratch = false;
local lastScratchKind = 0;
local currentScratchCard = 0;
local reUseActTitle;
local reUseActContent;
local mainTag;
local scratchCardRoleCount = {
  ERoleCount.Scratch_100,
  ERoleCount.Scratch_500,
  ERoleCount.Scratch_1000,
};

local text_ScratchCost = {};
local text_ScratchInfo;
local text_ScratchBonus;
local text_Btn_Scratch = {};

local consumeScratchCardRoleCount = {
  ERoleCount.CScratch_100,
  ERoleCount.CScratch_500,
  ERoleCount.CScratch_1000,
};

function UILoginAward.InitializeText(uiController)
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
  text_loginDays = uiController:FindText("LogainDays");
  text_Info = uiController:FindText("text_Info");
  text_online = uiController:FindText("Text_Online");
  text_SaveDate = uiController:FindText("Text_Date");
  text_ConsumeDate = uiController:FindText("Text_ConsumeDate");
  text_ChangeDate = uiController:FindText("Text_ChangeDate");
  text_BackDate = uiController:FindText("Text_BackDate");
  text_SaveValue = uiController:FindText("Text_SaveValue");
  text_ConsumeValue = uiController:FindText("Text_ConsumeValue");
  text_backDays = uiController:FindText("Text_accDays");
  text_reciveDays = uiController:FindText("Text_reciveDay");
  text_backPrice = uiController:FindText("Text_accGold");
  text_time = uiController:FindText("Text_Times");
  text_MoneyTreeTime = uiController:FindText("Text_TreeTime");
  text_Acc = uiController:FindText("Text_Acc");
  text_exp = uiController:FindText("Text_Exp");
  text_free = uiController:FindText("Text_Free");
  text_expInfo = uiController:FindText("Text_ExpInfo");
  text_BackStartDay = uiController:FindText("Text_StartDay");
  text_BackEndDay = uiController:FindText("Text_EndDay");
  text_DragonBoxDate = uiController:FindText("Text_DragonBoxDate");
  text_MoneyTreeDate = uiController:FindText("Text_MoneyTreeDate");
  text_SupportAmay = uiController:FindText("Text_Support");
  text_MoneyTreeLv = uiController:FindText("Text_Lv");
  text_MoneyTreeGold = uiController:FindText("Text_Gold");
  text_DoubleSaveDate = uiController:FindText("Text_DoubleSaveDate");
  text_DoubleSaveVal = uiController:FindText("Text_Save");
  text_DoubleSaveBack = uiController:FindText("Text_SaveBack");
  text_DoubleSaveDetail = uiController:FindText("Text_Detail");
  text_SBonus = uiController:FindText("Text_SBonus");
  text_Ticket_100 = uiController:FindText("Text_Ticket_100");
  text_Ticket_500 = uiController:FindText("Text_Ticket_500");
  text_Ticket_1000 = uiController:FindText("Text_Ticket_1000");
  text_ScratchReward = uiController:FindText("Text_ScratchReward");
  text_ScratchRewardHint = uiController:FindText("Text_ScratchRewardHint");
  text_SoulDate = uiController:FindText("Text_SoulDate");
  text_SoulValue = uiController:FindText("Text_SoulValue");

  for i = 1, 3 do
    text_rate[i] = uiController:FindText(string.Concat("Text_Rate_", i));
    text_money[i] = uiController:FindText(string.Concat("Text_Money_", i));
  end

  text_ScratchInfo = uiController:FindText("Text_ScratchInfo");
  text_ScratchBonus = uiController:FindText("Text_ScratchBonus");
  for i = 1, 3 do 
    text_ScratchCost[i] = uiController:FindText(string.Concat("Text_ScratchCost_", i));
    text_Btn_Scratch[i] = uiController:FindText(string.Concat("Text_Btn_Scratch_", i));
  end
end

function UILoginAward.InitializeGameObject(uiController)
  gameObjs.gameObject_ExpInfo = uiController:FindGameObject("ExpInfo");
  gameObjs.gameObject_ExpBtn = uiController:FindGameObject("ExpBtn");
  gameObjs.gameObject_Login = uiController:FindGameObject("Login");
  gameObjs.gameObject_Online = uiController:FindGameObject("Online");
  gameObjs.gameObject_OpenServer = uiController:FindGameObject("OpenServer");
  gameObjs.gameObject_Code = uiController:FindGameObject("Code");
  gameObjs.gameObject_Month = uiController:FindGameObject("Month");
  gameObjs.gameObject_Save = uiController:FindGameObject("Save");
  gameObjs.gameObject_Back = uiController:FindGameObject("Back");
  gameObjs.gameObject_Change = uiController:FindGameObject("Change");
  gameObjs.gameObject_Exp = uiController:FindGameObject("Exp");
  gameObjs.gameObject_Consume = uiController:FindGameObject("Consume");
  gameObjs.gameObject_DragonBox = uiController:FindGameObject("DragonBox");
  gameObjs.gameObject_MoneyTree = uiController:FindGameObject("MoneyTree");
  gameObjs.gameObject_SupportArmy = uiController:FindGameObject("SupportArmy");
  gameObjs.gameObject_SupportBG = uiController:FindGameObject("Image_Support");
  gameObjs.gameObject_DoubleSave = uiController:FindGameObject("DoubleSave");
  gameObjs.gameObject_Scratch = uiController:FindGameObject("Scratch");
  gameObjs.gameObject_Soul = uiController:FindGameObject("Soul");
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

function UILoginAward.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;
  transform_ItemRoot = uiController:FindGameObject("ItemRoot").transform;
  transform_Additional = uiController:FindGameObject("Additional").transform;
  image_BackRecived = uiController:FindGameObject("Image_BackReceived");
  image_BackButton = uiController:FindGameObject("Image_Btn_Back");  
  gameObject_AnimationRoot = uiController:FindGameObject("GameObject_AnimationRoot");
  gameObject_ScratchMask = uiController:FindGameObject("Image_ScratchMask");  
  rawImgame_Cover = uiController:FindRawImage("RawImage_Cover");
  rawImgame_MoneyTree = uiController:FindRawImage("rawImgame_MoneyTree");
  rawImage_Scratch = uiController:FindRawImage("RawImage_Scratch");
  rawImage_ScratchMask = uiController:FindRawImage("RawImage_ScrachMask");

  for i = 1, 3 do 
    image_Btn_Scratch[i] = uiController:FindImage(string.Concat("Image_Btn_Scratch_", i));
  end

  for i = 1, this.MaxDay do
    awardObjs[i] = {};
    awardObjs[i].item = UIItemController.New(transform_ItemRoot:Find(string.Concat("Image_Item (", i, ")")), this.OnClick_Award, i);
    awardObjs[i].image_Gained = transform_ItemRoot:Find(string.Concat("Image_Item (", i, ")")):Find("Image_Gained"):GetComponent("Image");
  end

  for i = 1, this.MaxAcc do
    accAwardObjs[i] = {};
    accAwardObjs[i].item = UIItemController.New(transform_Additional:Find(string.Concat("Image_Item_a (", i, ")")):Find("Item"), this.OnClick_AccAward, i);
    accAwardObjs[i].image_Gained = transform_Additional:Find(string.Concat("Image_Item_a (", i, ")")):Find("Item"):Find("Image_Gained"):GetComponent("Image");
    accAwardObjs[i].text_accDay = transform_Additional:Find(string.Concat("Image_Item_a (", i, ")")):Find("Item"):Find("Text_Day"):GetComponent("Text");
    accAwardObjs[i].gameObject = uiController:FindGameObject(string.Concat("Image_Item_a (", i, ")"));
  end

  this.InitializeText(uiController);

  this.InitializeGameObject(uiController);

  local event = uiController:FindEvent("Image_Mask");
  event:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);

  scrollContent_Online = uiController:FindScrollContent("ScrollContent_Online");
  scrollContent_Online.onInitialize = this.OnInitialize_scrollContent_Online;
  scrollContent_Online.onItemChange = this.OnItemChange_scrollContent_Online;
  scrollContent_Online:Initialize(1);

  scrollContent_OpenServer = uiController:FindScrollContent("ScrollContent_Open");
  scrollContent_OpenServer.onInitialize = this.OnInitialize_scrollContent_OpenServer;
  scrollContent_OpenServer.onItemChange = this.OnItemChange_scrollContent_OpenServer;
  scrollContent_OpenServer:Initialize(1);

  scrollContent_Save = uiController:FindScrollContent("ScrollContent_Save");
  scrollContent_Save.onInitialize = this.OnInitialize_scrollContent_Save;
  scrollContent_Save.onItemChange = this.OnItemChange_scrollContent_Save;
  scrollContent_Save:Initialize(1);

  scrollContent_Consume = uiController:FindScrollContent("ScrollContent_Consume");
  scrollContent_Consume.onInitialize = this.OnInitialize_scrollContent_Consume;
  scrollContent_Consume.onItemChange = this.OnItemChange_scrollContent_Consume;
  scrollContent_Consume:Initialize(1);

  scrollContent_Change = uiController:FindScrollContent("ScrollContent_Change");
  scrollContent_Change.onInitialize = this.OnInitialize_scrollContent_Change;
  scrollContent_Change.onItemChange = this.OnItemChange_scrollContent_Change;
  scrollContent_Change:Initialize(1);

  scrollContent_SupportArmy = uiController:FindScrollContent("ScrollContent_SupportArmy");
  scrollContent_SupportArmy.onInitialize = this.OnInitialize_scrollContent_SupportArmy;
  scrollContent_SupportArmy.onItemChange = this.OnItemChange_scrollContent_SupportArmy;
  scrollContent_SupportArmy:Initialize(1);

  scrollContent_Back = uiController:FindScrollContent("ScrollContent_Back");
  scrollContent_Back.onInitialize = this.OnInitialize_scrollContent_Back;
  scrollContent_Back.onItemChange = this.OnItemChange_scrollContent_Back;
  scrollContent_Back:Initialize(1);

  scrollContent_DragonBox = uiController:FindScrollContent("ScrollContent_DragonBox");
  scrollContent_DragonBox.onInitialize = this.OnInitialize_scrollContent_DragonBox;
  scrollContent_DragonBox.onItemChange = this.OnItemChange_scrollContent_DragonBox;
  scrollContent_DragonBox:Initialize(1);

  scrollContent_Soul = uiController:FindScrollContent("ScrollContent_Soul");
  scrollContent_Soul.onInitialize = this.OnInitialize_scrollContent_Soul;
  scrollContent_Soul.onItemChange = this.OnItemChange_scrollContent_Soul;
  scrollContent_Soul:Initialize(1);

  inputField_Code = uiController:FindInputField("InputField_Code");
  slider_time = uiController:FindSlider("Slider_Time");
  slider_accTime = uiController:FindSlider("Slider_AccTime");
  slider_treeTime = uiController:FindSlider("Slider_TreeTime");

  local event = uiController:FindEvent("Image_Btn_Code");
  event:SetListener(EventTriggerType.PointerClick, this.OnClick_Code);

  event = uiController:FindEvent("Image_Btn_Month");
  event:SetListener(EventTriggerType.PointerClick, this.OnClick_Month);

  event = uiController:FindEvent("Image_Tree");
  event:SetListener(EventTriggerType.PointerClick, this.OnClick_MoneyTree);

  event = uiController:FindEvent("Image_Btn_Back");
  event:SetListener(EventTriggerType.PointerClick, this.OnClick_BackGold);

  event = uiController:FindEvent("Image_Exp_Free");
  event:SetListener(EventTriggerType.PointerClick, this.OnClick_GetExp);
  event.parameter = EExp.Free;
  event = uiController:FindEvent("Image_Exp_Money");
  event:SetListener(EventTriggerType.PointerClick, this.OnClick_GetExp);
  event.parameter = EExp.Money;
  event = uiController:FindEvent("Image_Exp_Gold");
  event:SetListener(EventTriggerType.PointerClick, this.OnClick_GetExp);
  event.parameter = EExp.Gold;

  gameObjs.gameObject_StartTree = uiController:FindGameObject("Image_Start");
  event = gameObjs.gameObject_StartTree:GetComponent("UIEvent");
  event:SetListener(EventTriggerType.PointerClick, this.OnClick_StartTree);

  gameObjs.gameObject_GetNow = uiController:FindGameObject("Image_GetNow");
  event = gameObjs.gameObject_GetNow:GetComponent("UIEvent");
  event:SetListener(EventTriggerType.PointerClick, this.OnClick_GetNow);

  event = rawImage_ScratchMask.gameObject:GetComponent("UIEvent");
  event:SetListener(EventTriggerType.PointerClick, this.OnClick_Scratch);

  for i = 1, 3 do 
    event = image_Btn_Scratch[i].gameObject:GetComponent("UIEvent");
    event:SetListener(EventTriggerType.PointerClick, this.OnClick_SelectScratch);
    event.parameter = i;
  end 

  for i = 1, this.MaxFruit do
    local fruit = gameObjs.gameObject_MoneyTree.transform:Find("Fruits"):Find(string.Concat("Image_Fruit (", i, ")"))
    fruitObjs[i] = fruit:GetComponent("Image");

    event = fruit:GetComponent("UIEvent");
    event:SetListener(EventTriggerType.PointerClick, this.OnClick_Fruit);
    event.parameter = i;
  end
end

function UILoginAward.OnInitialize_scrollContent_Online(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Online[itemIndex] = {};
    scrollItems_Online[itemIndex].text = scrollItems[itemIndex]:Find("Text_Online"):GetComponent("Text");
    scrollItems_Online[itemIndex].status = scrollItems[itemIndex]:Find("Text_Status"):GetComponent("Text");
    scrollItems_Online[itemIndex].image_BGMask = scrollItems[itemIndex]:Find("Image_BGMask"):GetComponent("Image");
    scrollItems_Online[itemIndex].item = {};
    for i = 1, this.MaxItem do
      scrollItems_Online[itemIndex].item[i] = UIItemController.New(scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")));
    end
    scrollItems_Online[itemIndex].event = scrollItems[itemIndex]:Find("Image_Btn_Online"):GetComponent("UIEvent");
    scrollItems_Online[itemIndex].event.parameter = itemIndex + 1;
    scrollItems_Online[itemIndex].event:SetListener(EventTriggerType.PointerClick, this.OnClick_Online);
  end
end

function UILoginAward.OnItemChange_scrollContent_Online(dataIndex, itemIndex)
  local index = dataIndex + 1;
  scrollItems_Online[itemIndex].text.text = string.format(string.Get(20204), loginAward[EAward.Online].Date[index].day);
  for i = 1, this.MaxItem do
    if loginAward[EAward.Online].Date[index].itemId[i] > 0 then
      scrollItems_Online[itemIndex].item[i].transform.parent.gameObject:SetActive(true);
      scrollItems_Online[itemIndex].item[i]:SetItem(loginAward[EAward.Online].Date[index].itemId[i], loginAward[EAward.Online].Date[index].quant[i]);
      scrollItems_Online[itemIndex].item[i]:SetEvent(this.OnClick_ItemInfo, loginAward[EAward.Online].Date[index].itemId[i]);
    else
      scrollItems_Online[itemIndex].item[i].transform.parent.gameObject:SetActive(false);
    end
  end

  if loginAward[EAward.Online].Date[index].sort == ESortOrder.Available then
    scrollItems_Online[itemIndex].status.text = "";  --可領取
    scrollItems_Online[itemIndex].event.gameObject:SetActive(true);
    scrollItems_Online[itemIndex].image_BGMask.gameObject:SetActive(false);
  elseif loginAward[EAward.Online].Date[index].sort == ESortOrder.Complete then
    scrollItems_Online[itemIndex].status.text = string.Get(21061);  --完成
    scrollItems_Online[itemIndex].status.color = Color.LightBlue;
    scrollItems_Online[itemIndex].event.gameObject:SetActive(false);
    scrollItems_Online[itemIndex].image_BGMask.gameObject:SetActive(true);
  else
    scrollItems_Online[itemIndex].status.text = string.Get(21060);  --進行中
    scrollItems_Online[itemIndex].status.color = Color.LightGreen;
    scrollItems_Online[itemIndex].event.gameObject:SetActive(false);
    scrollItems_Online[itemIndex].image_BGMask.gameObject:SetActive(false);
  end

  scrollItems_Online[itemIndex].event.parameter = index;

  return true;
end

function UILoginAward.OnInitialize_scrollContent_OpenServer(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_OpenServer[itemIndex] = {};
    scrollItems_OpenServer[itemIndex].text = scrollItems[itemIndex]:Find("Text_Open"):GetComponent("Text");
    scrollItems_OpenServer[itemIndex].status = scrollItems[itemIndex]:Find("Text_Status"):GetComponent("Text");
    scrollItems_OpenServer[itemIndex].image_BGMask = scrollItems[itemIndex]:Find("Image_BGMask"):GetComponent("Image");
    scrollItems_OpenServer[itemIndex].item = {};
    for i = 1, this.MaxItem do
      scrollItems_OpenServer[itemIndex].item[i] = UIItemController.New(scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")));
    end
    scrollItems_OpenServer[itemIndex].event = scrollItems[itemIndex]:Find("Image_Btn_Open"):GetComponent("UIEvent");
    scrollItems_OpenServer[itemIndex].event:SetListener(EventTriggerType.PointerClick, this.OnClick_OpenServer);
    scrollItems_OpenServer[itemIndex].event.parameter = itemIndex + 1;
  end
end

function UILoginAward.OnItemChange_scrollContent_OpenServer(dataIndex, itemIndex)
  local index = dataIndex + 1;
  scrollItems_OpenServer[itemIndex].text.text = string.format(string.Get(20208), loginAward[EAward.OpenServer].Date[index].day);
  for i = 1, this.MaxItem do
    if loginAward[EAward.OpenServer].Date[index].itemId[i] > 0 then
      scrollItems_OpenServer[itemIndex].item[i].transform.parent.gameObject:SetActive(true);
      scrollItems_OpenServer[itemIndex].item[i]:SetItem(loginAward[EAward.OpenServer].Date[index].itemId[i], loginAward[EAward.OpenServer].Date[index].quant[i]);
      scrollItems_OpenServer[itemIndex].item[i]:SetEvent(this.OnClick_ItemInfo, loginAward[EAward.OpenServer].Date[index].itemId[i]);
    else
      scrollItems_OpenServer[itemIndex].item[i].transform.parent.gameObject:SetActive(false);
    end
  end

  if loginAward[EAward.OpenServer].Date[index].sort == ESortOrder.Available then
    scrollItems_OpenServer[itemIndex].status.text = "";
    scrollItems_OpenServer[itemIndex].event.gameObject:SetActive(true);
    scrollItems_OpenServer[itemIndex].image_BGMask.gameObject:SetActive(false);
  elseif loginAward[EAward.OpenServer].Date[index].sort == ESortOrder.Complete then
    scrollItems_OpenServer[itemIndex].status.text = string.Get(21061);  --完成
    scrollItems_OpenServer[itemIndex].status.color = Color.LightBlue;
    scrollItems_OpenServer[itemIndex].event.gameObject:SetActive(false);
    scrollItems_OpenServer[itemIndex].image_BGMask.gameObject:SetActive(true);
  else
    scrollItems_OpenServer[itemIndex].status.text = string.Get(21060);  --進行中
    scrollItems_OpenServer[itemIndex].status.color = Color.LightGreen;
    scrollItems_OpenServer[itemIndex].event.gameObject:SetActive(false);
    scrollItems_OpenServer[itemIndex].image_BGMask.gameObject:SetActive(false);
  end

  scrollItems_OpenServer[itemIndex].event.parameter = index;

  return true;
end

function UILoginAward.OnInitialize_scrollContent_Save(scrollItems)
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
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Save[itemIndex] = {};
    scrollItems_Save[itemIndex].text = scrollItems[itemIndex]:Find("Text_Save"):GetComponent("Text");
    scrollItems_Save[itemIndex].status = scrollItems[itemIndex]:Find("Text_Status"):GetComponent("Text");
    scrollItems_Save[itemIndex].image_BGMask = scrollItems[itemIndex]:Find("Image_BGMask"):GetComponent("Image");
    scrollItems_Save[itemIndex].item = {};
    for i = 1, this.MaxItem do
      scrollItems_Save[itemIndex].item[i] = UIItemController.New(scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")));
    end
    scrollItems_Save[itemIndex].event = scrollItems[itemIndex]:Find("Image_Btn_Save"):GetComponent("UIEvent");
    scrollItems_Save[itemIndex].event:SetListener(EventTriggerType.PointerClick, this.OnClick_Save);
    scrollItems_Save[itemIndex].event.parameter = itemIndex;
  end
end

function UILoginAward.OnItemChange_scrollContent_Save(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local isInTime;
  scrollItems_Save[itemIndex].text.text = string.format(string.Get(20995), loginAward[EAward.Save].Date[index].day);
  for i = 1, this.MaxItem do
    if loginAward[EAward.Save].Date[index].itemId[i] > 0 then
      scrollItems_Save[itemIndex].item[i].transform.parent.gameObject:SetActive(true);
      scrollItems_Save[itemIndex].item[i]:SetItem(loginAward[EAward.Save].Date[index].itemId[i], loginAward[EAward.Save].Date[index].quant[i]);
      scrollItems_Save[itemIndex].item[i]:SetEvent(this.OnClick_ItemInfo, loginAward[EAward.Save].Date[index].itemId[i]);
    else
      scrollItems_Save[itemIndex].item[i].transform.parent.gameObject:SetActive(false);
    end
  end

  scrollItems_Save[itemIndex].event.parameter = index;

  if isInTime == nil then
    isInTime = this.IsInTime(EAward.Save);
  end

  if isInTime then
    if loginAward[EAward.Save].Date[index].sort == ESortOrder.Available then
      scrollItems_Save[itemIndex].status.text = "";
      scrollItems_Save[itemIndex].event.gameObject:SetActive(true);
      scrollItems_Save[itemIndex].image_BGMask.gameObject:SetActive(false);
    elseif loginAward[EAward.Save].Date[index].sort == ESortOrder.Complete then
      scrollItems_Save[itemIndex].status.text = string.Get(21061);  --完成
      scrollItems_Save[itemIndex].status.color = Color.LightBlue;
      scrollItems_Save[itemIndex].event.gameObject:SetActive(false);
      scrollItems_Save[itemIndex].image_BGMask.gameObject:SetActive(true);
    else
      scrollItems_Save[itemIndex].status.text = string.Get(21060);  --進行中
      scrollItems_Save[itemIndex].status.color = Color.LightGreen;
      scrollItems_Save[itemIndex].event.gameObject:SetActive(false);
      scrollItems_Save[itemIndex].image_BGMask.gameObject:SetActive(false);
    end
  else
    scrollItems_Save[itemIndex].status.text = "";
    scrollItems_Save[itemIndex].event.gameObject:SetActive(false);
    scrollItems_Save[itemIndex].event.gameObject:SetActive(false);
    scrollItems_Save[itemIndex].image_BGMask.gameObject:SetActive(true);
  end

  return true;
end

function UILoginAward.OnInitialize_scrollContent_Soul(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Soul[itemIndex] = {};
    scrollItems_Soul[itemIndex].text = scrollItems[itemIndex]:Find("Text_Soul"):GetComponent("Text");
    scrollItems_Soul[itemIndex].status = scrollItems[itemIndex]:Find("Text_Status"):GetComponent("Text");
    scrollItems_Soul[itemIndex].image_BGMask = scrollItems[itemIndex]:Find("Image_BGMask"):GetComponent("Image");
    scrollItems_Soul[itemIndex].item = {};
    for i = 1, this.MaxItem do
      scrollItems_Soul[itemIndex].item[i] = UIItemController.New(scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")));
    end
    scrollItems_Soul[itemIndex].event = scrollItems[itemIndex]:Find("Image_Btn_Soul"):GetComponent("UIEvent");
    scrollItems_Soul[itemIndex].event:SetListener(EventTriggerType.PointerClick, this.OnClick_Soul);
    scrollItems_Soul[itemIndex].event.parameter = itemIndex;
  end
end

function UILoginAward.OnItemChange_scrollContent_Soul(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local isInTime;
  scrollItems_Soul[itemIndex].text.text = string.format(string.Get(23906), loginAward[EAward.SoulGacha].Date[index].day);
  for i = 1, this.MaxItem do
    if loginAward[EAward.SoulGacha].Date[index].itemId[i] > 0 then
      scrollItems_Soul[itemIndex].item[i].transform.parent.gameObject:SetActive(true);
      scrollItems_Soul[itemIndex].item[i]:SetItem(loginAward[EAward.SoulGacha].Date[index].itemId[i], loginAward[EAward.SoulGacha].Date[index].quant[i]);
      scrollItems_Soul[itemIndex].item[i]:SetEvent(this.OnClick_ItemInfo, loginAward[EAward.SoulGacha].Date[index].itemId[i]);
    else
      scrollItems_Soul[itemIndex].item[i].transform.parent.gameObject:SetActive(false);
    end
  end

  scrollItems_Soul[itemIndex].event.parameter = index;

  if isInTime == nil then
    isInTime = this.IsInTime(EAward.SoulGacha);
  end

  if isInTime then
    if loginAward[EAward.SoulGacha].Date[index].sort == ESortOrder.Available then
      scrollItems_Soul[itemIndex].status.text = "";
      scrollItems_Soul[itemIndex].event.gameObject:SetActive(true);
      scrollItems_Soul[itemIndex].image_BGMask.gameObject:SetActive(false);
    elseif loginAward[EAward.SoulGacha].Date[index].sort == ESortOrder.Complete then
      scrollItems_Soul[itemIndex].status.text = string.Get(21061);  --完成
      scrollItems_Soul[itemIndex].status.color = Color.LightBlue;
      scrollItems_Soul[itemIndex].event.gameObject:SetActive(false);
      scrollItems_Soul[itemIndex].image_BGMask.gameObject:SetActive(true);
    else
      scrollItems_Soul[itemIndex].status.text = string.Get(21060);  --進行中
      scrollItems_Soul[itemIndex].status.color = Color.LightGreen;
      scrollItems_Soul[itemIndex].event.gameObject:SetActive(false);
      scrollItems_Soul[itemIndex].image_BGMask.gameObject:SetActive(false);
    end
  else
    scrollItems_Soul[itemIndex].status.text = "";
    scrollItems_Soul[itemIndex].event.gameObject:SetActive(false);
    scrollItems_Soul[itemIndex].event.gameObject:SetActive(false);
    scrollItems_Soul[itemIndex].image_BGMask.gameObject:SetActive(true);
  end

  return true;
end

function UILoginAward.OnInitialize_scrollContent_Consume(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Consume[itemIndex] = {};
    scrollItems_Consume[itemIndex].text = scrollItems[itemIndex]:Find("Text_Consume"):GetComponent("Text");
    scrollItems_Consume[itemIndex].status = scrollItems[itemIndex]:Find("Text_Status"):GetComponent("Text");
    scrollItems_Consume[itemIndex].image_BGMask = scrollItems[itemIndex]:Find("Image_BGMask"):GetComponent("Image");
    scrollItems_Consume[itemIndex].item = {};
    for i = 1, this.MaxItem do
      scrollItems_Consume[itemIndex].item[i] = UIItemController.New(scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")));
    end
    scrollItems_Consume[itemIndex].event = scrollItems[itemIndex]:Find("Image_Btn_Consume"):GetComponent("UIEvent");
    scrollItems_Consume[itemIndex].event:SetListener(EventTriggerType.PointerClick, this.OnClick_Consume);
    scrollItems_Consume[itemIndex].event.parameter = itemIndex;
  end
end

function UILoginAward.GetPrizeInfoString(loginAwardData, id, index, isTitle)
  local result = "";

  for k, v in pairs(prizeDatas) do
    if v.id == id then
      if v.actKind == EActKind.Single then
        result = "";
      elseif v.actKind == EActKind.AccDay then
        result = "";
      elseif v.actKind == EActKind.AccSum then
        result = "";
      elseif v.actKind == EActKind.FullPoint then
        result = "";
      elseif v.actKind == EActKind.Condition then
        result = this.GetCondition(v.actType, loginAwardData, id, index, isTitle, v.wcheck);
      elseif v.actKind == EActKind.First then
        result = "";
      elseif v.actKind == EActKind.AllServer then
        result = "";
      elseif v.actKind == EActKind.SelfServer then
        result = "";
      elseif v.actKind == EActKind.SpecConsume then
        result = "";
      elseif v.actKind == EActKind.ContConsume then
        result = "";
      elseif v.actKind == EActKind.DayCondition then
        result = this.GetDayCondition(v.actType, loginAwardData, id, index, isTitle, v.wcheck);
      end
    end
  end

  return result;
end

function UILoginAward.GetCondition(type, loginAwardData, id, index, isTitle, wCheck)
  local result = "";
  local lowp = loginAwardData.actRule.lowp;
  local highp = loginAwardData.actRule.highp;

  if type == EActType.Consume then
    if isTitle then
      if wCheck[ESpecSet.ClearByDay] then
        result = string.format(string.Get(21860), PlayerPrizeDatas[id].totalSum);  --今日消費%d
      elseif wCheck[ESpecSet.ReAcc] then
        result = string.format(string.Get(21852), PlayerPrizeDatas[id].totalSum);  --消費滿%d
      else
        result = string.format(string.Get(21852), PlayerPrizeDatas[id].totalSum); --消費滿%d元寶
      end
    else
      if wCheck[ESpecSet.ClearByDay] then
        result = string.format(string.Get(21858), lowp);  --今日消費滿%d
      elseif wCheck[ESpecSet.ReAcc] then
        result = string.format(string.Get(21852), lowp);  --消費滿%d
      else
        result = string.format(string.Get(21852), lowp);  --消費滿%d元寶
      end
    end
  elseif type == EActType.Save then
    if isTitle then
      if wCheck[ESpecSet.ClearByDay] then
        result = string.format(string.Get(21861), PlayerPrizeDatas[id].totalSum);  --今日儲值%d
      elseif wCheck[ESpecSet.ReAcc] then
        result = string.format(string.Get(21853), PlayerPrizeDatas[id].totalSum);  --儲值滿%d
      else
        result = string.format(string.Get(21853), PlayerPrizeDatas[id].totalSum);  --儲值滿%d元寶
      end
    else
      if wCheck[ESpecSet.ClearByDay] then
        result = string.format(string.Get(21859), lowp);  --每日儲值滿%d
      elseif wCheck[ESpecSet.ReAcc] then
        result = string.format(string.Get(21853), lowp);  --儲值滿%d
      else
        result = string.format(string.Get(21853), lowp);  --儲值滿%d元寶
      end
    end
  end

  return result;
end

function UILoginAward.GetDayCondition(type, loginAwardData, id, index, isTitle)
  local result = "";
  local lowp = loginAwardData.actRule.lowp;
  local highp = loginAwardData.actRule.highp;

  if type == EActType.Consume then
    if isTitle then
      result = string.format(string.Get(21846), lowp, PlayerPrizeDatas[id].ruleValue[index]);
    else
      result = string.format(string.Get(21846), lowp, highp);
    end
  elseif type == EActType.Save then
    if isTitle then
      result = string.format(string.Get(21847), lowp, PlayerPrizeDatas[id].ruleValue[index]);
    else
      result = string.format(string.Get(21847), lowp, highp);
    end
  end

  return result;
end

function UILoginAward.OnItemChange_scrollContent_Consume(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local isInTime;

  local loginAwardData = nil;
  local infoString = "";

  if currentTag == EUITag.Consume then
    loginAwardData = loginAward[EAward.Consume].Date[index];
    infoString = string.Get(21622);
  elseif currentTag == EUITag.LottoNpc then
    loginAwardData = loginAward[EAward.LottoNpc].Date[index];
    infoString = string.Get(21743);
  elseif currentTag == EUITag.LottoCard then
    loginAwardData = loginAward[EAward.LottoCard].Date[index];
    infoString = string.Get(21746);
  elseif currentTag == EUITag.Furnace then
    loginAwardData = loginAward[EAward.Furnace].Date[index];
    infoString = string.Get(22226);
  elseif currentTag == EUITag.Poke then
    loginAwardData = loginAward[EAward.Poke].Date[index];
    infoString = string.Get(22481);
  elseif currentTag == EUITag.StagePass then
    loginAwardData = loginAward[EAward.StagePass].Date[index];
    infoString = string.Get(22528);
  elseif currentTag == EUITag.ClassAward then
    loginAwardData = loginAward[EAward.ClassAward].Date[index];
    infoString = string.Get(22610);
  elseif currentTag == EUITag.ActLogin then
    loginAwardData = loginAward[EAward.ActLogin].Date[index];
    infoString = string.Get(22648);
  elseif currentTag == EUITag.ActAccLogin then
    loginAwardData = loginAward[EAward.ActAccLogin].Date[index];
    infoString = string.Get(22651);
  elseif currentTag == EUITag.ReturnLogin then
    loginAwardData = loginAward[EAward.ReturnLogin].Date[index];
    infoString = string.Get(22648);
  elseif currentTag == EUITag.Swimming then
    loginAwardData = loginAward[EAward.Swimming].Date[index];
    infoString = string.Get(22731);
  elseif currentTag == EUITag.ReUseAct_1 then
    loginAwardData = loginAward[EAward.ReUseAct_1].Date[index];
    infoString = reUseActContent;
  elseif currentTag == EUITag.ReUseAct_2 then
    loginAwardData = loginAward[EAward.ReUseAct_2].Date[index];
    infoString = reUseActContent;
  elseif currentTag == EUITag.ReUseAct_3 then
    loginAwardData = loginAward[EAward.ReUseAct_3].Date[index];
    infoString = reUseActContent;
  elseif currentTag == EUITag.ReUseAct_4 then
    loginAwardData = loginAward[EAward.ReUseAct_4].Date[index];
    infoString = reUseActContent;
  elseif currentTag == EUITag.ReUseAct_5 then
    loginAwardData = loginAward[EAward.ReUseAct_5].Date[index];
    infoString = reUseActContent;
  elseif currentTag == EUITag.ReUseAct_6 then
    loginAwardData = loginAward[EAward.ReUseAct_6].Date[index];
    infoString = reUseActContent;
  elseif currentTag == EUITag.Collect then
    loginAwardData = loginAward[EAward.Collect].Date[index];
    infoString = string.Get(22762);
  elseif Contains(currentTag, EUITag.Prize_1, EUITag.Prize_2, EUITag.Prize_3, EUITag.Prize_4, EUITag.Prize_5, EUITag.Prize_6, EUITag.Prize_7, EUITag.Prize_8) then
    loginAwardData = loginAward[currentTag].Date[index];
    infoString = this.GetPrizeInfoString(loginAwardData, currentTag - this.BasePrize, index, false);
  end

  if loginAwardData ~= nil and infoString ~= nil then
    if currentTag >= EUITag.Prize_1 then
      scrollItems_Consume[itemIndex].text.text = infoString;
    else
      scrollItems_Consume[itemIndex].text.text = string.format(infoString, loginAwardData.day);
    end
  end

  for i = 1, this.MaxItem do
    if loginAwardData ~= nil and loginAwardData.itemId ~= nil and loginAwardData.itemId[i] ~= nil and loginAwardData.itemId[i] > 0 then
      scrollItems_Consume[itemIndex].item[i].transform.parent.gameObject:SetActive(true);
      scrollItems_Consume[itemIndex].item[i]:SetItem(loginAwardData.itemId[i], loginAwardData.quant[i]);
      scrollItems_Consume[itemIndex].item[i]:SetEvent(this.OnClick_ItemInfo, loginAwardData.itemId[i]);
    else
      scrollItems_Consume[itemIndex].item[i].transform.parent.gameObject:SetActive(false);
    end
  end

  scrollItems_Consume[itemIndex].event.parameter = index;

  if isInTime == nil then
    if currentTag == EUITag.Consume then
      isInTime = this.IsInTime(EAward.Consume);
    elseif currentTag == EUITag.LottoNpc then
      isInTime = this.IsInTime(EAward.LottoNpc);
    elseif currentTag == EUITag.LottoCard then
      isInTime = this.IsInTime(EAward.LottoCard);
    elseif currentTag == EUITag.Furnace then
      isInTime = this.IsInTime(EAward.Furnace);
    elseif currentTag == EUITag.Poke then
      isInTime = this.IsInTime(EAward.Poke);
    elseif currentTag == EUITag.StagePass then
      isInTime = this.IsInTime(EAward.StagePass);
    elseif currentTag == EUITag.ClassAward then
      isInTime = this.IsInTime(EAward.ClassAward);
    elseif currentTag == EUITag.ActLogin then
      isInTime = this.IsInTime(EAward.ActLogin);
    elseif currentTag == EUITag.ActAccLogin then
      isInTime = this.IsInTime(EAward.ActAccLogin);
    elseif currentTag == EUITag.ReturnLogin then
      isInTime = this.IsInTime(EAward.ReturnLogin);
    elseif currentTag == EUITag.Swimming then
      isInTime = this.IsInTime(EAward.Swimming);
    elseif currentTag == EUITag.ReUseAct_1 then
      isInTime = this.IsInTime(EAward.ReUseAct_1);
    elseif currentTag == EUITag.ReUseAct_2 then
      isInTime = this.IsInTime(EAward.ReUseAct_2);
    elseif currentTag == EUITag.ReUseAct_3 then
      isInTime = this.IsInTime(EAward.ReUseAct_3);
    elseif currentTag == EUITag.ReUseAct_4 then
      isInTime = this.IsInTime(EAward.ReUseAct_4);
    elseif currentTag == EUITag.ReUseAct_5 then
      isInTime = this.IsInTime(EAward.ReUseAct_5);
    elseif currentTag == EUITag.ReUseAct_6 then
      isInTime = this.IsInTime(EAward.ReUseAct_6);
    elseif currentTag == EUITag.Collect then
      isInTime = this.IsInTime(EAward.Collect);
    elseif Contains(currentTag, EUITag.Prize_1, EUITag.Prize_2, EUITag.Prize_3, EUITag.Prize_4, EUITag.Prize_5, EUITag.Prize_6, EUITag.Prize_7, EUITag.Prize_8) then
      isInTime = true;
    end
  end

  local awardData = nil;

  if currentTag == EUITag.Consume then
    awardData = loginAward[EAward.Consume];
  elseif currentTag == EUITag.LottoNpc then
    awardData = loginAward[EAward.LottoNpc];
  elseif currentTag == EUITag.LottoCard then
    awardData = loginAward[EAward.LottoCard];
  elseif currentTag == EUITag.Furnace then
    awardData = loginAward[EAward.Furnace];
  elseif currentTag == EUITag.Poke then
    awardData = loginAward[EAward.Poke];
  elseif currentTag == EUITag.StagePass then
    awardData = loginAward[EAward.StagePass];
  elseif currentTag == EUITag.ClassAward then
    awardData = loginAward[EAward.ClassAward];
  elseif currentTag == EUITag.ActLogin then
    awardData = loginAward[EAward.ActLogin];
  elseif currentTag == EUITag.ActAccLogin then
    awardData = loginAward[EAward.ActAccLogin];
  elseif currentTag == EUITag.ReturnLogin then
    awardData = loginAward[EAward.ReturnLogin];
  elseif currentTag == EUITag.Swimming then
    awardData = loginAward[EAward.Swimming];
  elseif currentTag == EUITag.ReUseAct_1 then
    awardData = loginAward[EAward.ReUseAct_1];
  elseif currentTag == EUITag.ReUseAct_2 then
    awardData = loginAward[EAward.ReUseAct_2];
  elseif currentTag == EUITag.ReUseAct_3 then
    awardData = loginAward[EAward.ReUseAct_3];
  elseif currentTag == EUITag.ReUseAct_4 then
    awardData = loginAward[EAward.ReUseAct_4];
  elseif currentTag == EUITag.ReUseAct_5 then
    awardData = loginAward[EAward.ReUseAct_5];
  elseif currentTag == EUITag.ReUseAct_6 then
    awardData = loginAward[EAward.ReUseAct_6];
  elseif currentTag == EUITag.Collect then
    awardData = loginAward[EAward.Collect];
  elseif currentTag == EUITag.Prize_1 then
    awardData = loginAward[EAward.Prize_1];
  elseif currentTag == EUITag.Prize_2 then
    awardData = loginAward[EAward.Prize_2];
  elseif currentTag == EUITag.Prize_3 then
    awardData = loginAward[EAward.Prize_3];
  elseif currentTag == EUITag.Prize_4 then
    awardData = loginAward[EAward.Prize_4];
  elseif currentTag == EUITag.Prize_5 then
    awardData = loginAward[EAward.Prize_5];
  elseif currentTag == EUITag.Prize_6 then
    awardData = loginAward[EAward.Prize_6];
  elseif currentTag == EUITag.Prize_7 then
    awardData = loginAward[EAward.Prize_7];
  elseif currentTag == EUITag.Prize_8 then
    awardData = loginAward[EAward.Prize_8];
  end

  if isInTime and awardData ~= nil then
    if loginAwardData ~= nil and loginAwardData.sort == ESortOrder.Available then
      scrollItems_Consume[itemIndex].status.text = "";
      scrollItems_Consume[itemIndex].event.gameObject:SetActive(true);
      scrollItems_Consume[itemIndex].image_BGMask.gameObject:SetActive(false);
    elseif awardData.Date[index].sort == ESortOrder.Complete then
      if currentTag > this.BasePrize then
        scrollItems_Consume[itemIndex].status.text = string.Get(21851);  --已配送
      else
        scrollItems_Consume[itemIndex].status.text = string.Get(21061);  --完成
      end
      scrollItems_Consume[itemIndex].status.color = Color.LightBlue;
      scrollItems_Consume[itemIndex].event.gameObject:SetActive(false);
      scrollItems_Consume[itemIndex].image_BGMask.gameObject:SetActive(true);
    else
      scrollItems_Consume[itemIndex].status.text = string.Get(21060);  --進行中
      scrollItems_Consume[itemIndex].status.color = Color.LightGreen;
      scrollItems_Consume[itemIndex].event.gameObject:SetActive(false);
      scrollItems_Consume[itemIndex].image_BGMask.gameObject:SetActive(false);
    end

    if Contains(currentTag, EUITag.ReUseAct_3, EUITag.ReUseAct_4, EUITag.ReUseAct_5, EUITag.ReUseAct_6) or
            (currentTag == EUITag.Poke and RoleCount.Max(ERoleCount.Poke) == 2147483647) then
      local topLowp = 0;
      local roleCount;

      for k, v in pairs(awardData.Date) do
        if topLowp <= awardData.Date[k].day then
          topLowp = awardData.Date[k].day;
        end
      end

      scrollItems_Consume[itemIndex].event.gameObject:SetActive(false);
      scrollItems_Consume[itemIndex].image_BGMask.gameObject:SetActive(false);

      local lowp = awardData.Date[index].day;
      if currentTag == EUITag.Poke then
        roleCount = ERoleCount.Poke;
      else
        roleCount = awardData.Date[index].roleCount;
      end
      local round = math.floor(RoleCount.Get(roleCount) / topLowp);
      local base = RoleCount.Get(roleCount) - (round * topLowp);

      if base >= lowp then
        scrollItems_Consume[itemIndex].status.text = string.Get(21061);  --完成
        scrollItems_Consume[itemIndex].status.color = Color.LightBlue;
      else
        local modCount = math.fmod(base, lowp);
        scrollItems_Consume[itemIndex].status.text = string.Concat(tostring(modCount), " / " , tostring(lowp));
        scrollItems_Consume[itemIndex].status.color = Color.LightGreen;
      end
    elseif currentTag == EUITag.ReturnLogin then
      if RoleCount.Get(ERoleCount.ReturnLogin) <= 0 then
        scrollItems_Consume[itemIndex].status.text = string.Get(22712);  --不符資格
        scrollItems_Consume[itemIndex].status.color = Color.Black;
      end
    elseif currentTag == EUITag.Poke then
      scrollItems_Consume[itemIndex].event.gameObject:SetActive(false);
      scrollItems_Consume[itemIndex].image_BGMask.gameObject:SetActive(false);

      if RoleCount.Get(ERoleCount.Poke) >= awardData.Date[index].day then
        scrollItems_Consume[itemIndex].status.text = string.Get(21061);  --完成
        scrollItems_Consume[itemIndex].status.color = Color.Black;
      else
        scrollItems_Consume[itemIndex].status.text = string.Concat(RoleCount.Get(ERoleCount.Poke), " / " , tostring(awardData.Date[index].day));
        scrollItems_Consume[itemIndex].status.color = Color.LightGreen;
      end
    end

    --prz 特別處理
    if currentTag >= this.BasePrize then
      local topLowp = 0;

      for k, v in pairs(prizeDatas) do
        if v.id == currentTag - this.BasePrize and v.actKind == EActKind.Condition and v.wcheck[ESpecSet.ReAcc] then
          for kk, vv in pairs(v.actRule) do
            if topLowp <= vv.lowp then
              topLowp = vv.lowp;
            end
          end
        end
      end

      for k, v in pairs(prizeDatas) do
        if v.id == currentTag - this.BasePrize and v.actKind == EActKind.Condition and v.wcheck[ESpecSet.ReAcc] then
          scrollItems_Consume[itemIndex].image_BGMask.gameObject:SetActive(false);
          local przId = currentTag - this.BasePrize;

          local lowp = loginAwardData.actRule.lowp;
          local round = math.floor(PlayerPrizeDatas[przId].totalSum / topLowp);
          local base = PlayerPrizeDatas[przId].totalSum - (round * topLowp);

          if base >= lowp then
            scrollItems_Consume[itemIndex].status.text = string.Get(21061);  --完成
            scrollItems_Consume[itemIndex].status.color = Color.LightBlue;
          else
            local modCount = math.fmod(base, lowp);
            scrollItems_Consume[itemIndex].status.text = string.Concat(tostring(modCount), " / " , tostring(lowp));
            scrollItems_Consume[itemIndex].status.color = Color.LightGreen;
          end
        end
      end
    end

  else
    scrollItems_Consume[itemIndex].status.text = "";
    scrollItems_Consume[itemIndex].event.gameObject:SetActive(false);
    scrollItems_Consume[itemIndex].event.gameObject:SetActive(false);
    scrollItems_Consume[itemIndex].image_BGMask.gameObject:SetActive(true);
  end

  return true;
end

function UILoginAward.OnInitialize_scrollContent_SupportArmy(scrollItems)
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
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_SupportArmy[itemIndex] = {};
    scrollItems_SupportArmy[itemIndex].item = {};
    scrollItems_SupportArmy[itemIndex].demandText = {};
    for i = 1, this.MaxItem do
      scrollItems_SupportArmy[itemIndex].item[i] = UIItemController.New(scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")));
      scrollItems_SupportArmy[itemIndex].demandText[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")):Find("Text_Quant"):GetComponent("Text");
    end

    scrollItems_SupportArmy[itemIndex].changeItem = UIItemController.New(scrollItems[itemIndex]:Find(string.Concat("Image_Item (", this.ChangeIndex, ")")));
    scrollItems_SupportArmy[itemIndex].limitText = scrollItems[itemIndex]:Find("Text_Limit"):GetComponent("Text");
    scrollItems_SupportArmy[itemIndex].name = scrollItems[itemIndex]:Find("Text_ItemName"):GetComponent("Text");
    scrollItems_SupportArmy[itemIndex].event = scrollItems[itemIndex]:Find("Image_Btn_Change"):GetComponent("UIEvent");
    scrollItems_SupportArmy[itemIndex].event:SetListener(EventTriggerType.PointerClick, this.OnClick_Change);
    scrollItems_SupportArmy[itemIndex].event.parameter = itemIndex;
    scrollItems_SupportArmy[itemIndex].status = scrollItems[itemIndex]:Find("Text_Status"):GetComponent("Text");
    scrollItems_SupportArmy[itemIndex].image_BGMask = scrollItems[itemIndex]:Find("Image_BGMask"):GetComponent("Image");
    scrollItems_SupportArmy[itemIndex].amayText = scrollItems[itemIndex]:Find("Text_SupportInfo"):GetComponent("Text");
  end
end

function UILoginAward.OnItemChange_scrollContent_SupportArmy(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local demand;
  local isInTime = nil;
  local awardKind = EAward.SupportArmy;

  for i = 1, this.MaxItem do
    if loginAward[awardKind].Date[index].itemId[i] > 0 then
      scrollItems_SupportArmy[itemIndex].item[i].transform.parent.gameObject:SetActive(true);
      demand = loginAward[awardKind].Date[index].quant[i];
    else
      scrollItems_SupportArmy[itemIndex].item[i].transform.parent.gameObject:SetActive(false);
    end
  end

  scrollItems_SupportArmy[itemIndex].limitText.text = "";
  scrollItems_SupportArmy[itemIndex].name.text = "";
  scrollItems_SupportArmy[itemIndex].amayText.text = string.format(string.Get(22103), totalSupportArmy, loginAward[awardKind].Date[index].day);

  if isInTime == nil then
    isInTime = this.IsInTime(awardKind);
  end

  if isInTime then
    if totalSupportArmy >= loginAward[awardKind].Date[index].day then
      scrollItems_SupportArmy[itemIndex].status.text = string.Get(21061);  --完成
      scrollItems_SupportArmy[itemIndex].status.color = Color.LightBlue;
      scrollItems_SupportArmy[itemIndex].image_BGMask.gameObject:SetActive(true);
    else
      scrollItems_SupportArmy[itemIndex].status.text = string.Get(21060);  --進行中
      scrollItems_SupportArmy[itemIndex].status.color = Color.LightGreen;
      scrollItems_SupportArmy[itemIndex].image_BGMask.gameObject:SetActive(false);
    end
  else
    scrollItems_SupportArmy[itemIndex].status.text = "";
    scrollItems_SupportArmy[itemIndex].image_BGMask.gameObject:SetActive(true);
  end

  scrollItems_SupportArmy[itemIndex].event.gameObject:SetActive(false);
  scrollItems_SupportArmy[itemIndex].changeItem:SetItem(loginAward[awardKind].Date[index].changeItemId, loginAward[awardKind].Date[index].changeQuant);
  scrollItems_SupportArmy[itemIndex].changeItem:SetEvent(this.OnClick_ItemInfo, loginAward[awardKind].Date[index].changeItemId);
  scrollItems_SupportArmy[itemIndex].event.parameter = index;

  return true;
end

function UILoginAward.OnInitialize_scrollContent_Change(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Change[itemIndex] = {};
    scrollItems_Change[itemIndex].item = {};
    scrollItems_Change[itemIndex].demandText = {};
    for i = 1, this.MaxItem do
      scrollItems_Change[itemIndex].item[i] = UIItemController.New(scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")));
      scrollItems_Change[itemIndex].demandText[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")):Find("Text_Quant"):GetComponent("Text");
    end

    scrollItems_Change[itemIndex].changeItem = UIItemController.New(scrollItems[itemIndex]:Find(string.Concat("Image_Item (", this.ChangeIndex, ")")));
    scrollItems_Change[itemIndex].limitText = scrollItems[itemIndex]:Find("Text_Limit"):GetComponent("Text");
    scrollItems_Change[itemIndex].changeKind = scrollItems[itemIndex]:Find("Text_ChangeKind"):GetComponent("Text");
    scrollItems_Change[itemIndex].name = scrollItems[itemIndex]:Find("Text_ItemName"):GetComponent("Text");
    scrollItems_Change[itemIndex].event = scrollItems[itemIndex]:Find("Image_Btn_Change"):GetComponent("UIEvent");
    scrollItems_Change[itemIndex].event:SetListener(EventTriggerType.PointerClick, this.OnClick_Change);
    scrollItems_Change[itemIndex].event.parameter = itemIndex;
    scrollItems_Change[itemIndex].status = scrollItems[itemIndex]:Find("Text_Status"):GetComponent("Text");
    scrollItems_Change[itemIndex].image_BGMask = scrollItems[itemIndex]:Find("Image_BGMask"):GetComponent("Image");
  end
end

function UILoginAward.OnItemChange_scrollContent_Change(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local bagItemCount, demand;
  local isInTime = nil;
  local simpleItemCount = 0;
  local simpleDemand = 0;
  local awardKind = EAward.Change;
  local itemData, itemId;
  local bag = Item.GetBag(EThings.Bag);

  for i = 1, this.MaxItem do
    itemId = changeAward[index].itemId[i];
    itemData = itemDatas[itemId];
    bagItemCount = 0;

    if itemId > 0 then
      scrollItems_Change[itemIndex].item[i].transform.parent.gameObject:SetActive(true);
      scrollItems_Change[itemIndex].item[i]:SetItem(itemId, 0);
      scrollItems_Change[itemIndex].item[i]:SetEvent(this.OnClick_ItemInfo, itemId);

      if itemData ~= nil and itemData:IsRoleCountException() then
        bagItemCount = RoleCount.Get(itemData.roleCountIndex);
        simpleItemCount = bagItemCount;
        demand = itemData.roleCountValue * changeAward[index].quant[i];
      else
        if itemId == 65301 then
          bagItemCount = Role.GetPoint();
          simpleItemCount = Item.GetSimpleValue(bagItemCount, true);
        elseif itemId == 65351 then
          bagItemCount = Role.GetPlayerGold();
          simpleItemCount = Item.GetSimpleValue(bagItemCount, true);
        elseif itemId == 65343 then  --吞食幣
          bagItemCount = Role.GetPlayerCurrency(ECurrency.TS);
          simpleItemCount = Item.GetSimpleValue(bagItemCount, true);
        else
          simpleItemCount = 0;
          bagItemCount = 0;

          if bag ~= nil then
            for k, bagInfo in pairs(bag) do
              if bagInfo ~= nil and bagInfo.Id == itemId and bagInfo.quant > 0 then
                bagItemCount = bagItemCount + bagInfo.quant;
                simpleItemCount = bagItemCount;
              end
            end
          end
        end
        demand = changeAward[index].quant[i];
      end

      simpleDemand = demand;

      if bagItemCount >= demand then
        scrollItems_Change[itemIndex].demandText[i].text = string.GetColorText(string.Concat(simpleItemCount, string.Get(30120), simpleDemand), Color.Black);
      else
        scrollItems_Change[itemIndex].demandText[i].text = string.GetColorText(string.Concat(simpleItemCount, string.Get(30120), simpleDemand), Color.Red);
      end
    else
      scrollItems_Change[itemIndex].item[i].transform.parent.gameObject:SetActive(false);
      scrollItems_Change[itemIndex].demandText.text = "";
    end
  end

  scrollItems_Change[itemIndex].name.text = itemDatas[changeAward[index].changeItemId]:GetName(true);

  local roleCount = RoleCount.Get(changeAward[index].roleCount);
  local limit = changeAward[index].flag;

  if isInTime == nil then
    isInTime = this.IsInTime(awardKind);
  end

  if isInTime then
    if limit > 0 then
      local limitStr;
      if Between(changeAward[index].roleCount,65 , 69) or
              Between(changeAward[index].roleCount,901 , 904) then
        limitStr = string.Get(22494);
      else
        limitStr = string.Get(21509);
      end

      if changeAward[index].sort == ESortOrder.Available then
        scrollItems_Change[itemIndex].status.text = "";
        scrollItems_Change[itemIndex].event.gameObject:SetActive(true);
        scrollItems_Change[itemIndex].image_BGMask.gameObject:SetActive(false);
        scrollItems_Change[itemIndex].limitText.text = string.GetColorText(string.format(limitStr, roleCount, limit), Color.Black);
      elseif changeAward[index].sort == ESortOrder.Complete then
        scrollItems_Change[itemIndex].status.text = string.Get(21061);  --完成
        scrollItems_Change[itemIndex].status.color = Color.LightBlue;
        scrollItems_Change[itemIndex].event.gameObject:SetActive(false);
        scrollItems_Change[itemIndex].image_BGMask.gameObject:SetActive(true);
        scrollItems_Change[itemIndex].limitText.text = string.GetColorText(string.format(limitStr, roleCount, limit), Color.Red);
      else
        scrollItems_Change[itemIndex].status.text = string.Get(21449);  --收集中
        scrollItems_Change[itemIndex].status.color = Color.LightGreen;
        scrollItems_Change[itemIndex].event.gameObject:SetActive(false);
        scrollItems_Change[itemIndex].image_BGMask.gameObject:SetActive(false);
        scrollItems_Change[itemIndex].limitText.text = string.GetColorText(string.format(limitStr, roleCount, limit), Color.Black);
      end
    else  --無限兌換
      if not this.CheckChangeItem(index) then
        scrollItems_Change[itemIndex].status.text = "";
        scrollItems_Change[itemIndex].event.gameObject:SetActive(true);
        scrollItems_Change[itemIndex].image_BGMask.gameObject:SetActive(false);
      else
        scrollItems_Change[itemIndex].status.text = string.Get(21449);  --收集中
        scrollItems_Change[itemIndex].status.color = Color.LightGreen;
        scrollItems_Change[itemIndex].event.gameObject:SetActive(false);
        scrollItems_Change[itemIndex].image_BGMask.gameObject:SetActive(false);
      end

      scrollItems_Change[itemIndex].limitText.text = string.GetColorText("", Color.Black);
    end
  else
    scrollItems_Change[itemIndex].status.text = "";
    scrollItems_Change[itemIndex].event.gameObject:SetActive(false);
    scrollItems_Change[itemIndex].image_BGMask.gameObject:SetActive(true);
  end

  if changeAward[index].changeKind == 1 then
    scrollItems_Change[itemIndex].changeKind.text = string.Get(23191);
  else
    scrollItems_Change[itemIndex].changeKind.text = "";
  end

  scrollItems_Change[itemIndex].changeItem:SetItem(changeAward[index].changeItemId, changeAward[index].changeQuant);
  scrollItems_Change[itemIndex].changeItem:SetEvent(this.OnClick_ItemInfo, changeAward[index].changeItemId);
  scrollItems_Change[itemIndex].event.parameter = index;

  return true;
end

function UILoginAward.OnInitialize_scrollContent_Back(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Back[itemIndex] = {};
    scrollItems_Back[itemIndex].textDay = {};
    scrollItems_Back[itemIndex].backGold = {};
    scrollItems_Back[itemIndex].rawImage = {};
    scrollItems_Back[itemIndex].gameObjectGold = {};
    scrollItems_Back[itemIndex].gameObjectArrow = {};
    scrollItems_Back[itemIndex].textStatus = {};

    for i = 1, this.MaxBack do
      scrollItems_Back[itemIndex].textDay[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")):Find("Text_days"):GetComponent("Text");
      scrollItems_Back[itemIndex].backGold[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")):Find("Text_price"):GetComponent("Text");
      scrollItems_Back[itemIndex].gameObjectGold[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")):Find("Image_gold");
      scrollItems_Back[itemIndex].gameObjectArrow[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")):Find("Image_arrow");
      scrollItems_Back[itemIndex].textStatus[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")):Find("Text_status"):GetComponent("Text");
    end

    for i = 1, this.MaxBackBG do
      scrollItems_Back[itemIndex].rawImage[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")):Find("Image_bag"):GetComponent("RawImage");
    end
  end
end

function UILoginAward.OnItemChange_scrollContent_Back(dataIndex, itemIndex)
  --local index = dataIndex + 1;

  for i = 1, this.MaxBack do
    scrollItems_Back[itemIndex].textDay[i].text = string.format(string.Get(20208), i);

    if activeBackDay == i then --進行中
      scrollItems_Back[itemIndex].textStatus[i].text = string.Get(21060);
      scrollItems_Back[itemIndex].backGold[i].text = RoleCount.Get(loginAward[EAward.Back].Date[i].roleCount);
      scrollItems_Back[itemIndex].gameObjectGold[i].gameObject:SetActive(true);
      scrollItems_Back[itemIndex].gameObjectArrow[i].gameObject:SetActive(true);
    elseif activeBackDay < i then --時間未到
      scrollItems_Back[itemIndex].textStatus[i].text = string.Get(21007);
      scrollItems_Back[itemIndex].backGold[i].text = "";
      scrollItems_Back[itemIndex].gameObjectGold[i].gameObject:SetActive(false);
      scrollItems_Back[itemIndex].gameObjectArrow[i].gameObject:SetActive(false);
    else
      scrollItems_Back[itemIndex].textStatus[i].text = string.Get(21233);
      scrollItems_Back[itemIndex].backGold[i].text = RoleCount.Get(loginAward[EAward.Back].Date[i].roleCount);
      scrollItems_Back[itemIndex].gameObjectGold[i].gameObject:SetActive(true);
      scrollItems_Back[itemIndex].gameObjectArrow[i].gameObject:SetActive(false);
    end
  end

  for i = 1, this.MaxBackBG do
    this.GetPng(scrollItems_Back[itemIndex].rawImage[i]);
  end

  return true;
end

function UILoginAward.OnInitialize_scrollContent_DragonBox(scrollItems)
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
  for itemIndex = 0, scrollItems.Length - 1 do

    scrollItems_DragonBox[itemIndex] = {};
    scrollItems_DragonBox[itemIndex].text_Level = scrollItems[itemIndex]:Find("Text_Level"):GetComponent("Text");
    scrollItems_DragonBox[itemIndex].image_Award = UIItemController.New(scrollItems[itemIndex]:Find("Image_Award"));
    scrollItems_DragonBox[itemIndex].RawImage_Award = scrollItems[itemIndex]:Find("Image_Award");
    scrollItems_DragonBox[itemIndex].text_Time = scrollItems[itemIndex]:Find("Text_Time"):GetComponent("Text");
  end
end

function UILoginAward.OnItemChange_scrollContent_DragonBox(dataIndex, itemIndex)
  local index = dataIndex + 1;

  scrollItems_DragonBox[itemIndex].text_Level.text = string.format(string.Get(22008), string.GetChineseNumberLower(index));
  scrollItems_DragonBox[itemIndex].image_Award:SetItem(loginAward[EAward.DragonBox].Date[index].itemId[1], loginAward[EAward.DragonBox].Date[index].quant[1]);
  scrollItems_DragonBox[itemIndex].image_Award:SetEvent(this.OnClick_DragonBox, index);

  dragonBoxRoleCount = RoleCount.Get(loginAward[EAward.DragonBox].Date[index].roleCount);

  if dragonBoxRoleCount == index - 1 then
    nowDragonBoxCountDown = itemIndex;
    CGTimer.AddListener(this.DragonBoxCountDown, 1, true);
  elseif dragonBoxRoleCount >= index then
    scrollItems_DragonBox[itemIndex].text_Time.text = string.Get(98017);
    TextureManager.SetPng(ETextureUseType.UI, "common0_icon065",  scrollItems_DragonBox[itemIndex].RawImage_Award:Find("BaseUIItem"):Find("RawImage_Icon"):GetComponent("RawImage"));
  elseif dragonBoxRoleCount < index then
    scrollItems_DragonBox[itemIndex].text_Time.text = string.Get(22004);
  end

  return true;
end

function UILoginAward.OnClick_Award(uiEvent)
  this.ShowAwardInfo(EAward.Login, uiEvent.parameter);
end

function UILoginAward.OnClick_AccAward(uiEvent)
  this.ShowAwardInfo(EAward.AccLogin, uiEvent.parameter);
end

function UILoginAward.OnClick_Online(uiEvent)
  this.SendGetAward(EAward.Online, uiEvent.parameter);
end

function UILoginAward.OnClick_OpenServer(uiEvent)
  this.SendGetAward(EAward.OpenServer, uiEvent.parameter);
end

function UILoginAward.OnClick_Save(uiEvent)
  this.SendGetAward(EAward.Save, uiEvent.parameter);
end

function UILoginAward.OnClick_Soul(uiEvent)
  this.SendGetAward(EAward.SoulGacha, uiEvent.parameter);
end

function UILoginAward.OnClick_Consume(uiEvent)
  if currentTag == EUITag.Consume then
    this.SendGetAward(EAward.Consume, uiEvent.parameter);
  elseif currentTag == EUITag.LottoNpc then
    this.SendGetAward(EAward.LottoNpc, uiEvent.parameter);
  elseif currentTag == EUITag.LottoCard then
    this.SendGetAward(EAward.LottoCard, uiEvent.parameter);
  elseif currentTag == EUITag.Furnace then
    this.SendGetAward(EAward.Furnace, uiEvent.parameter);
  elseif currentTag == EUITag.StagePass then
    this.SendGetAward(EAward.StagePass, uiEvent.parameter);
  elseif currentTag == EUITag.ClassAward then
    this.SendGetAward(EAward.ClassAward, uiEvent.parameter);
  elseif currentTag == EUITag.ActLogin then
    this.SendGetAward(EAward.ActLogin, uiEvent.parameter);
  elseif currentTag == EUITag.ActAccLogin then
    this.SendGetAward(EAward.ActAccLogin, uiEvent.parameter);
  elseif currentTag == EUITag.ReturnLogin then
    this.SendGetAward(EAward.ReturnLogin, uiEvent.parameter);
  elseif currentTag == EUITag.Swimming then
    this.SendGetAward(EAward.Swimming, uiEvent.parameter);
  elseif currentTag == EUITag.ReUseAct_1 then
    this.SendGetAward(EAward.ReUseAct_1, uiEvent.parameter);
  elseif currentTag == EUITag.ReUseAct_2 then
    this.SendGetAward(EAward.ReUseAct_2, uiEvent.parameter);
  elseif currentTag == EUITag.ReUseAct_3 then
    this.SendGetAward(EAward.ReUseAct_3, uiEvent.parameter);
  elseif currentTag == EUITag.ReUseAct_4 then
    this.SendGetAward(EAward.ReUseAct_4, uiEvent.parameter);
  elseif currentTag == EUITag.ReUseAct_5 then
    this.SendGetAward(EAward.ReUseAct_5, uiEvent.parameter);
  elseif currentTag == EUITag.ReUseAct_6 then
    this.SendGetAward(EAward.ReUseAct_6, uiEvent.parameter);
  elseif currentTag == EUITag.Collect then
    this.SendGetAward(EAward.Collect, uiEvent.parameter);
  end
end

function UILoginAward.OnClick_Change(uiEvent)
  local index = uiEvent.parameter;

  local checkChange, count = this.CheckChangeItem(index);
  if checkChange then
    ShowCenterMessage(string.Get(20702));
    return;
  end

  if not this.IsInTime(EAward.Change) then
    ShowCenterMessage(string.Get(60065));
    return;
  end

  if changeAward[index].flag > 0 and RoleCount.Get(changeAward[index].roleCount) >= changeAward[index].flag then
    ShowCenterMessage(string.Get(20729));
    return;
  end

  if not this.CheckLockEquip(index) then
    ShowCenterMessage(string.Get(22048));
    return;
  end

  local idx = currentSubPage * 100 + index;
  local val = 0;
  for k, v in pairs(loginAward[EAward.Change].Date) do
    if idx == v.day then
      val = k;
      break;
    end
  end

  if changeAward[index].flag > 0 then
    count = math.min(count, changeAward[index].flag - RoleCount.Get(changeAward[index].roleCount));
  end

  this.SendGetAward(EAward.Change, val, count);
end

function UILoginAward.OnClick_Code()
  if string.IsNullOrEmpty(inputField_Code.text) then return end

  sendBuffer:Clear();
  sendBuffer:WriteByte(5);
  sendBuffer:WriteStringWithByteL(inputField_Code.text);
  sendBuffer:WriteByte(1);
  Network.Send(87, 2, sendBuffer);
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

function UILoginAward.OnClick_Month()
end

function UILoginAward.OnClick_MoneyTree()
  if this.CheckMoneyTreeComplete() then
    Network.Send(87, 7);
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

function UILoginAward.OnClick_Fruit(uiEvent)
  sendBuffer:Clear();
  sendBuffer:WriteByte(uiEvent.parameter);
  Network.Send(87, 6);
end

function UILoginAward.OnClick_StartTree(uiEvent)
  UISell.Launch(39);
end

function UILoginAward.OnClick_GetNow(uiEvent)
  UISell.Launch(40);
end

function UILoginAward.OnClick_BackGold()
  if not BitFlag.Get(EBitFlag.Back) then
    sendBuffer:Clear();
    sendBuffer:WriteByte(EAward.Back);
    sendBuffer:WriteInt32(0);
    sendBuffer:WriteByte(1);
    Network.Send(87, 2, sendBuffer);
  else
    ShowCenterMessage(string.Get(98017));
  end
end

function UILoginAward.OnClick_GetExp(uiEvent)
  if RoleCount.Get(ERoleCount.OffLine_Exp) <= 0 then
    ShowCenterMessage(string.Get(98017));
    return;
  end

  if Role.player.war ~= EWar.None then
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
    return;
  end

  currentTag = EUITag.Exp;

  local kind = uiEvent.parameter;
  if kind == EExp.Free then
    UISell.Launch(30, this.UpdateUI);
  elseif kind == EExp.Money then
    UISell.Launch(28, this.UpdateUI);
  elseif kind == EExp.Gold then
    UISell.Launch(29, this.UpdateUI);
  end
end

function UILoginAward.CheckTopExp()
  local turn = Role.player:GetAttribute(EAttribute.Turn);
  local level = Role.player:GetAttribute(EAttribute.Lv);
  local exp = Role.player:GetAttribute(EAttribute.Exp);
  local turn3Lv = 0;

  if turn >= 3 then
    turn3Lv = level - Role.playerMaxLv;
    level = Role.playerMaxLv;
    exp = Role.player:GetAttribute(EAttribute.Turn3Exp);
  end

  if turn >= 3 then
    return turn3Lv == Role.playerMaxLv + Role.playerTurn3MaxLv;
  else
    return level == Role.playerMaxLv;
  end
end

function UILoginAward.OnClick_ItemInfo(uiEvent)
  local itemId = uiEvent.parameter;
  this.ViewItemInfo(itemId);
end

function UILoginAward.OnClick_DragonBox(uiEvent)
  if dragonBoxRoleCount >= uiEvent.parameter then return; end

  local item = loginAward[EAward.DragonBox].Date[uiEvent.parameter];
  
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

  if dragonBoxRoleCount < uiEvent.parameter - 1 then
    UI.Open(UIItemInfo, EThings.None, item.itemId[1], item.quant[1]);
  else
    UI.Open(UIItemInfo, EThings.None, item.itemId[1], item.quant[1], string.Get(22005),
  function()
    UISell.Launch(36, this.DragonBoxUISell);
  end
  );
  end

end

function UILoginAward.DragonBoxUISell()
  UI.Close(UIItemInfo);
  this.DragonBoxRedDot = false;
  this.UpdateRedDot();
  CGTimer.RemoveListener(this.DragonBoxCountDown);
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
  scrollContent_DragonBox:Refresh();
end

function UILoginAward.DragonBoxCountDown()
  if this.DragonBoxTime == 0 then
    scrollItems_DragonBox[nowDragonBoxCountDown].text_Time.text = string.Get(22004);
    CGTimer.RemoveListener(this.DragonBoxCountDown);
    return;
  end

  if DateTime.Compare(CGTimer.serverTime, this.DragonBoxTime) > 0 then
    scrollItems_DragonBox[nowDragonBoxCountDown].text_Time.text = string.Get(21062);
    this.DragonBoxRedDot = true;
    this.UpdateRedDot();
    CGTimer.RemoveListener(this.DragonBoxCountDown);
  elseif DateTime.Compare(CGTimer.serverTime, this.DragonBoxTime) < 0 then
    scrollItems_DragonBox[nowDragonBoxCountDown].text_Time.text = string.GetSecondSymbol(math.ceil(DateTime.Subtract(this.DragonBoxTime, CGTimer.serverTime).TotalSeconds));

  end
end

function UILoginAward.OnClick_Scratch(event)
  if not isSendScratch and not isPlayingScratch then 
    sendBuffer:Clear();
    if currentTag == EUITag.Scratch then 
      sendBuffer:WriteByte(EAward.Scratch);
    else
      sendBuffer:WriteByte(EAward.ConsumeScratch);
    end
    sendBuffer:WriteInt32(currentScratchCard);
    sendBuffer:WriteByte(1);
    Network.Send(87, 2, sendBuffer);
    isSendScratch = true;
  end  
end

function UILoginAward.PlayScratchAnimation(kind)
  isPlayingScratch = true;  
  AnimationController.Play(this.ScratchAnimationKind, gameObject_AnimationRoot.transform, nil, function() rawImage_ScratchMask.gameObject:SetActive(false); end);  
end

function UILoginAward.OnClick_SelectScratch(event) 
  local kind = event.parameter;
  
  local canSelect = false;
  if currentTag == EUITag.Scratch then 
    if kind == 1 then 
      if RoleCount.Get(ERoleCount.Scratch_Bonus) >= 100 or RoleCount.Get(scratchCardRoleCount[kind]) > 0 then 
        canSelect = true;
      end
    elseif kind == 2 then 
      if RoleCount.Get(ERoleCount.Scratch_Bonus) >= 500 or RoleCount.Get(scratchCardRoleCount[kind]) > 0 then 
        canSelect = true;
      end 
    elseif kind == 3 then 
      if RoleCount.Get(ERoleCount.Scratch_Bonus) >= 1000 or RoleCount.Get(scratchCardRoleCount[kind]) > 0 then 
        canSelect = true;
      end 
    end
  else
    if kind == 1 then 
      if RoleCount.Get(ERoleCount.CScratch_Bonus) >= 200 or RoleCount.Get(consumeScratchCardRoleCount[kind]) > 0 then 
        canSelect = true;
      end
    elseif kind == 2 then 
      if RoleCount.Get(ERoleCount.CScratch_Bonus) >= 500 or RoleCount.Get(consumeScratchCardRoleCount[kind]) > 0 then 
        canSelect = true;
      end 
    elseif kind == 3 then 
      if RoleCount.Get(ERoleCount.CScratch_Bonus) >= 1000 or RoleCount.Get(consumeScratchCardRoleCount[kind]) > 0 then 
        canSelect = true;
      end 
    end
  end

  if canSelect and not isSendScratch then
    this.ResetScratchData();
    currentScratchCard = kind;
    this.UpdateUI();
  else
    if currentTag == EUITag.Scratch then 
      ShowCenterMessage(string.Get(22247));
    else
      ShowCenterMessage(string.Get(22365));
    end
  end
end

--送協定
function UILoginAward.SendGetAward(kind, val, count)
  if kind ~= EAward.Login and Item.CheckBagIsFull() then return end

  local changeCount = 1;

  if count ~= nil and count >= this.MinChangeCount then
    ShowCountInput(string.Get(20253), 1, math.min(count, this.MaxChangeCount),
      function(text)
        if text == nil then return end

        changeCount = tonumber(text);
  
        sendBuffer:Clear();
        sendBuffer:WriteByte(kind);
        sendBuffer:WriteInt32(loginAward[kind].Date[val].day);
        sendBuffer:WriteByte(changeCount);
        Network.Send(87, 2, sendBuffer);
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
    );
  else
    sendBuffer:Clear();
    sendBuffer:WriteByte(kind);
    sendBuffer:WriteInt32(loginAward[kind].Date[val].day);
    sendBuffer:WriteByte(1);
    Network.Send(87, 2, sendBuffer);
  end
end

function UILoginAward.GetStagePassCount()
  local passCount = 0;

  if this.IsInTime(EAward.StagePass) then
    for k, v in pairs(weekDungeonDatas) do
      local dungeonData = Dungeon.GetData(v);
      if dungeonData ~= nil then
        local mission = MarkManager.GetMission(dungeonData.dayilyFlag);
        if mission ~= nil and mission.step > 0 then
          passCount = passCount + 1;
        end
      end
    end
  end

  return passCount;
end

--C:087-003 <要離線經驗資料>
function UILoginAward.GetServerExpDatas()
  sendBuffer:Clear();
  Network.Send(87, 3, sendBuffer);
end

--C:087-004 <查詢軍團資源活動資料>
function UILoginAward.QuertySupportArmy()
  Network.Send(87, 4);
end

--收協定
function UILoginAward.ReciveAward(data)
  local kind = data:ReadByte();
  local result = data:ReadByte();

  if result == 0 then
    if kind == EAward.Login then
      RedDot.Remove(ERedDot.LogainAward);
      this.UpdateLoginAward();
    elseif kind == EAward.Online then
      this.UpdateOnline();
      RedDot.Remove(ERedDot.Online);
    elseif kind == EAward.OpenServer then
      this.UpdateOpenServer();
      RedDot.Remove(ERedDot.OpenServer);
    elseif kind == EAward.Save then
      this.UpdateSave();
      RedDot.Remove(ERedDot.Save);
    elseif kind == EAward.SoulGacha then
      this.UpdateSoul();
      RedDot.Remove(ERedDot.SoulGacha);
    elseif kind == EAward.Consume then
      this.UpdateConsume();
      RedDot.Remove(ERedDot.Consume);
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
    elseif kind == EAward.LottoNpc then
      this.UpdateConsume();
      RedDot.Remove(ERedDot.LottoNpc);
    elseif kind == EAward.LottoCard then
      this.UpdateConsume();
      RedDot.Remove(ERedDot.LottoCard);
    elseif kind == EAward.Furnace then
      this.UpdateConsume();
      RedDot.Remove(ERedDot.Furnace);
    elseif kind == EAward.StagePass then
      this.UpdateConsume();
      RedDot.Remove(ERedDot.StagePass);
    elseif kind == EAward.ClassAward then
      this.UpdateConsume();
      RedDot.Remove(ERedDot.ClassAward);
    elseif kind == EAward.ActLogin then
      this.UpdateConsume();
      RedDot.Remove(ERedDot.ActLogin);
    elseif kind == EAward.ActAccLogin then
      this.UpdateConsume();
      RedDot.Remove(ERedDot.ActAccLogin);
    elseif kind == EAward.ReturnLogin then
      this.UpdateConsume();
      RedDot.Remove(ERedDot.ReturnLogin);
    elseif kind == EAward.Swimming then
      this.UpdateConsume();
      RedDot.Remove(ERedDot.Swimming);
    elseif kind == EAward.ReUseAct_1 then
      this.UpdateConsume();
      RedDot.Remove(ERedDot.ReUseAct_1);
    elseif kind == EAward.ReUseAct_2 then
      this.UpdateConsume();
      RedDot.Remove(ERedDot.ReUseAct_2);
    elseif kind == EAward.ReUseAct_3 then
      this.UpdateConsume();
      RedDot.Remove(ERedDot.ReUseAct_3);
    elseif kind == EAward.Collect then
      this.UpdateConsume();
      RedDot.Remove(ERedDot.Collect);
    elseif kind == EAward.Change then
      this.UpdateChange();
    elseif kind == EAward.SupportArmy then
      this.UpdateSupportArmy();
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
    elseif kind == EAward.Back then
      this.UpdateBack();
      RedDot.Remove(ERedDot.Back);
    elseif kind == EAward.Exp then
      RedDot.Remove(ERedDot.OffLineExp);
      this.UpdateExp();
    elseif kind == EAward.Festival then
      UIJiugongge.RefreshExchangePage();
    elseif kind == EAward.SaveGift then
      UIMall.RefreshItemPage();
      Mall.IsRedDot();
    elseif kind == EAward.SupportArmy then
      playerSupportArmy = data:ReadUInt32();
      totalSupportArmy = data:ReadUInt32();
      this.UpdateSupportArmy();
    elseif kind == EAward.Scratch or kind == EAward.ConsumeScratch then 
      ShowCenterMessage(string.Get(22234));
      local count = data:ReadUInt32();
      local value = 0;
      for i = 1, count do 
        local id = data:ReadUInt16();
        local itemCount = data:ReadUInt32();
        if itemDatas[id] ~= nil then 
          value = value + itemDatas[id].attribute[1].value *  itemCount;
        end
      end
      isSendScratch = false;
      text_ScratchReward.text = string.format(string.Get(22248), value);

      this.PlayScratchAnimation(kind);    
    end

    this.UpdateRedDot();
  else
    if reslutString[result] ~= nil then
      ShowCenterMessage(string.Get(reslutString[result]));
    end
  end
end

function UILoginAward.SortAward(a, b)
  if a.sort < b.sort then return true end
  if a.sort == b.sort then
    return a.day < b.day;
  end

  return false;
end

--S:087-002 <離線經驗資料結果> 數量(1) +<<倍率(2) +金錢](4)>>
function UILoginAward.ReciveExpData(data)
  local count = data:ReadByte();

  for i = 1, count do
    expDatas[i] = {};
    expDatas[i].rate = data:ReadUInt16();
    expDatas[i].money = data:ReadUInt32();
  end

  --UI.Open(UICompound, 9);
  if Network.InUnbound then return end;
  UI.Open(UILoginAward);
end

--S:087-005 <搖錢樹狀態> +等級(1) +果實數(1) + 栽培時間(8)
function UILoginAward.ReciveMoneyTree(data)
  moneyTreeLv = data:ReadByte();
  moneyTreeFurit = data:ReadByte();
  moneyGrowTime = data:ReadDouble();
  moneyTreeTime = DateTime.FromOADate(moneyGrowTime);

  this.UpdateUI();
end

--S:087-006 <收成結果> +result(1) 1:成功 2:失敗
function UILoginAward.ReciveFruit(data)
  local result = data:ReadByte();

  if result == 1 then
    moneyTreeFurit = 0;
    this.UpdateUI();
  end
end

--S:087-007 <收成結果> +result(1) 1:成功  +栽培時間(8) 2:失敗
function UILoginAward.ReciveHarvest(data)
  local result = data:ReadByte();

  if result == 1 then
    moneyTreeTime = DateTime.FromOADate(data:ReadDouble());
    this.UpdateUI();
  end
end

function UILoginAward.UpdateUI(tag, changeCover)
  if tag ~= nil then
    currentTag = this.GetCurrentTag(tag);
  end

  if Contains(currentTag, EUITag.Login, EUITag.Code, EUITag.Back, EUITag.MoneyTree, EUITag.Scratch, EUITag.ConsumeScratch, EUITag.Change) then
    if rawImgame_Cover ~= nil then
      rawImgame_Cover.enabled = false;
    end

    if rawImgame_MoneyTree ~= nil then
      TextureManager.SetPng(ETextureUseType.UI, "common0_bod121", rawImgame_MoneyTree);
    end
  else
    if changeCover ~= false then
      rawImgame_Cover.enabled = true;
      this.GetRandomeCoverPng();
    end
  end

  gameObjs.gameObject_Login:SetActive(currentTag == EUITag.Login);
  gameObjs.gameObject_Online:SetActive(currentTag == EUITag.Online);
  gameObjs.gameObject_OpenServer:SetActive(currentTag == EUITag.OpenServer);
  gameObjs.gameObject_Code:SetActive(currentTag == EUITag.Code);
  gameObjs.gameObject_Month:SetActive(currentTag == EUITag.Month);
  gameObjs.gameObject_Save:SetActive(currentTag == EUITag.Save);
  gameObjs.gameObject_Back:SetActive(currentTag == EUITag.Back);
  gameObjs.gameObject_Change:SetActive(currentTag == EUITag.Change);
  gameObjs.gameObject_SupportArmy:SetActive(currentTag == EUITag.SupportArmy);
  gameObjs.gameObject_Exp:SetActive(currentTag == EUITag.Exp);
  gameObjs.gameObject_Consume:SetActive(Contains(currentTag, EUITag.Consume, EUITag.LottoNpc, EUITag.LottoCard, EUITag.Furnace,
          EUITag.Poke, EUITag.StagePass, EUITag.ClassAward, EUITag.ActLogin, EUITag.ActAccLogin, EUITag.ReturnLogin, EUITag.Swimming,
          EUITag.ReUseAct_1, EUITag.ReUseAct_2, EUITag.ReUseAct_3, EUITag.ReUseAct_4, EUITag.ReUseAct_5, EUITag.ReUseAct_6, EUITag.Collect,
          EAward.Prize_1, EAward.Prize_2, EAward.Prize_3, EAward.Prize_4, EAward.Prize_5, EAward.Prize_6, EAward.Prize_7, EAward.Prize_8));
  gameObjs.gameObject_DragonBox:SetActive(currentTag == EUITag.DragonBox);
  gameObjs.gameObject_MoneyTree:SetActive(currentTag == EUITag.MoneyTree);
  gameObjs.gameObject_DoubleSave:SetActive(currentTag == EUITag.DoubleSave or currentTag == EUITag.Arena);
  gameObjs.gameObject_Scratch:SetActive(currentTag == EUITag.Scratch or currentTag == EUITag.ConsumeScratch);
  gameObjs.gameObject_Soul:SetActive(currentTag == EUITag.SoulGacha);

  if currentTag ~= EUITag.Code then
    inputField_Code.text = "";
  end

  this.UpdateLoginAward();
  this.UpdateOnline();
  this.UpdateOpenServer();
  this.UpdateCode();
  this.UpdateMonth();
  this.UpdateSave();
  this.UpdateBack();
  this.UpdateChange();
  this.UpdateSupportArmy();
  this.UpdateExp();
  this.UpdateConsume();
  this.UpdateDragonBox();
  this.UpdateMoneyTree();
  this.UpdateDoubleSave();
  this.UpdateScratch();
  this.UpdateSoul();
end

function UILoginAward.RefreshRoleCount()
  if UI.IsVisible(UILoginAward) then
    this.UpdateUI(nil, false);
  end
end

function UILoginAward.RefreshScratchRoleCount()
  this.UpdateScratchRedDot();
  this.UpdateConsumeScratchRedDot();
  this.RefreshRoleCount();  
end

--每日簽到
function UILoginAward.UpdateLoginAward()
  if currentTag ~= EUITag.Login then return end

  if not BitFlag.Get(EBitFlag.Login) then
    this.SendGetAward(EAward.Login, RoleCount.Get(ERoleCount.LoginSingDay) + 1);
  end

  for i = 1, this.MaxDay do
    if loginAward[EAward.Login] ~= nil and loginAward[EAward.Login].Date[i] ~= nil then
      awardObjs[i].item:SetItem(loginAward[EAward.Login].Date[i].itemId[1], loginAward[EAward.Login].Date[i].quant[1]);
    end
  end

  for i = 1, this.MaxAcc do
    if loginAward[EAward.AccLogin].Date[i] ~= nil then
      accAwardObjs[i].gameObject:SetActive(true);

      accAwardObjs[i].item:SetItem(loginAward[EAward.AccLogin].Date[i].itemId[1], loginAward[EAward.AccLogin].Date[i].quant[1]);
    else
      accAwardObjs[i].gameObject:SetActive(false);
    end
  end

  text_loginDays.text = string.format(string.Get(20200), RoleCount.Get(ERoleCount.ContinueLogin));

  if BitFlag.Get(EBitFlag.Login) then
    text_Info.text = string.Get(20764);
  else
    text_Info.text = "";
  end

  for i = 1, this.MaxDay do
    if i > RoleCount.Get(ERoleCount.LoginSingDay) then
      awardObjs[i].image_Gained.enabled = false;
    else
      awardObjs[i].image_Gained.enabled = true;
    end
  end

  for i = 1, this.MaxAcc do
    if i > RoleCount.Get(ERoleCount.ContinueLoginAward) then
      accAwardObjs[i].image_Gained.enabled = false;
    else
      accAwardObjs[i].image_Gained.enabled = true;
    end
  
    if loginAward[EAward.Login] ~= nil and loginAward[EAward.AccLogin].Date[i] ~= nil then
      accAwardObjs[i].text_accDay.text = loginAward[EAward.AccLogin].Date[i].day;
    end
  end

  this.UpdateRedDot();
end

--在線好禮
function UILoginAward.UpdateOnline()
  if currentTag ~= EUITag.Online then return end

  onlineTime = this.GetOnlineTime();

  for k, v in pairs(loginAward[EAward.Online].Date) do
    if not BitFlag.Get(v.flag) and onlineTime >= v.day then
      v.sort = ESortOrder.Available;
    elseif BitFlag.Get(v.flag) and onlineTime >= v.day then
      v.sort = ESortOrder.Complete;
    else
      v.sort = ESortOrder.Processing;
    end
  end

  table.sort(loginAward[EAward.Online].Date, this.SortAward);

  scrollContent_Online:Reset(table.maxn(loginAward[EAward.Online].Date));
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

  this.UpdateRedDot();
end

--開服好禮
function UILoginAward.UpdateOpenServer()
  if currentTag ~= EUITag.OpenServer then return end

  for k, v in pairs(loginAward[EAward.OpenServer].Date) do
    if not BitFlag.Get(v.flag) and Role.GetLoginDay() >= v.day then
      v.sort = ESortOrder.Available;
    elseif BitFlag.Get(v.flag) and Role.GetLoginDay() >= v.day then
      v.sort = ESortOrder.Complete;
    else
      v.sort = ESortOrder.Processing;
    end
  end

  table.sort(loginAward[EAward.OpenServer].Date, this.SortAward);

  scrollContent_OpenServer:Reset(table.maxn(loginAward[EAward.OpenServer].Date));

  this.UpdateRedDot();
end

--虛寶碼
function UILoginAward.UpdateCode()
  if currentTag ~= EUITag.Code then return end
end

function UILoginAward.ResetScratchData()
  isPlayingScratch = false;
  isSendScratch = false;
  currentScratchCard = 0;
  AnimationController.Destory(this.ScratchAnimationKind);
end

--儲值刮刮樂
function UILoginAward.UpdateText()
  for i = 1, 3 do 
    if currentTag == EUITag.Scratch then 
      text_ScratchCost[i].text = string.Get(22236 + i);
      text_Btn_Scratch[i].text = string.Get(22240 + i);
    else
      text_ScratchCost[i].text = string.Get(22366 + i);
      text_Btn_Scratch[i].text = string.Get(22358 + i);
    end
  end
  
  
  if currentTag == EUITag.Scratch then     
    text_ScratchInfo.rectTransform:SetInsetAndSizeFromParentEdge(Edge.Top, 0, 200);
    text_ScratchInfo.text = string.Get(22240);
    text_ScratchBonus.text = string.Get(22236);
  else
    text_ScratchInfo.rectTransform:SetInsetAndSizeFromParentEdge(Edge.Top, 0, 250);
    text_ScratchInfo.text = string.Get(22370);
    text_ScratchBonus.text = string.Get(22366);
  end
end

function UILoginAward.UpdateScratch()
  if currentTag ~= EUITag.Scratch and currentTag ~= EUITag.ConsumeScratch then 
    this.ResetScratchData();    
    return 
  end

  if lastScratchKind ~= currentTag then 
    isPlayingScratch = false;
    isSendScratch = false;
    currentScratchCard = 0;
    AnimationController.Destory(this.ScratchAnimationKind);
    this.UpdateText();
  end
  lastScratchKind = currentTag;  

  if currentTag == EUITag.Scratch then 
    text_SBonus.text = RoleCount.Get(ERoleCount.Scratch_Bonus);
    text_Ticket_100.text = RoleCount.Get(ERoleCount.Scratch_100);
    text_Ticket_500.text = RoleCount.Get(ERoleCount.Scratch_500);
    text_Ticket_1000.text = RoleCount.Get(ERoleCount.Scratch_1000);
  else
    text_SBonus.text = RoleCount.Get(ERoleCount.CScratch_Bonus);
    text_Ticket_100.text = RoleCount.Get(ERoleCount.CScratch_100);
    text_Ticket_500.text = RoleCount.Get(ERoleCount.CScratch_500);
    text_Ticket_1000.text = RoleCount.Get(ERoleCount.CScratch_1000);
  end

  if currentScratchCard == 0 then 
    gameObject_ScratchMask:SetActive(true);    
    if currentTag == EUITag.Scratch then 
      TextureManager.SetPng(ETextureUseType.UI, "common0_bod122", rawImage_Scratch);
      text_ScratchRewardHint.text = string.Get(22244);
    else
      TextureManager.SetPng(ETextureUseType.UI, "common0_bod126", rawImage_Scratch);
      text_ScratchRewardHint.text = string.Get(22362);
    end  
  else
    gameObject_ScratchMask:SetActive(false);
    if currentTag == EUITag.Scratch then 
      TextureManager.SetPng(ETextureUseType.UI, string.Concat("common0_bod", 121 + currentScratchCard) , rawImage_Scratch);      
      text_ScratchRewardHint.text = string.Get(22243 + currentScratchCard);
    else
      if currentScratchCard == 1 then 
      TextureManager.SetPng(ETextureUseType.UI, "common0_bod126" , rawImage_Scratch);      
      else
        TextureManager.SetPng(ETextureUseType.UI, string.Concat("common0_bod", 121 + currentScratchCard) , rawImage_Scratch);      
      end
      text_ScratchRewardHint.text = string.Get(22361 + currentScratchCard);
    end
  end

  for i = 1, 3 do 
    if currentScratchCard == i then 
      image_Btn_Scratch[i].sprite = UI.GetSprite("bod072");
    else
      image_Btn_Scratch[i].sprite = UI.GetSprite("bod071");
    end
  end

  if rawImage_ScratchMask.texture == nil and not isPlayingScratch then 
    TextureManager.SetPng(ETextureUseType.UI, "common0_bod125", rawImage_ScratchMask);
  end

  rawImage_ScratchMask.gameObject:SetActive(not isPlayingScratch);
end

--月卡
function UILoginAward.UpdateMonth()
  if currentTag ~= EUITag.Month then return end
end

--儲值送
function UILoginAward.UpdateSave()
  if currentTag ~= EUITag.Save then return end

  if this.SaveRedDot then
    this.SaveRedDot = false;
    RedDot.Remove(ERedDot.Save);
  end

  for k, v in pairs(loginAward[EAward.Save].Date) do
    if not BitFlag.Get(v.flag) and RoleCount.Get(ERoleCount.Save) >= v.day then
      v.sort = ESortOrder.Available;
    elseif BitFlag.Get(v.flag) and RoleCount.Get(ERoleCount.Save) >= v.day then
      v.sort = ESortOrder.Complete;
    else
      v.sort = ESortOrder.Processing;
    end
  end

  table.sort(loginAward[EAward.Save].Date, this.SortAward);

  if this.IsInTime(EAward.Save) then
    text_SaveValue.text = string.format(string.Get(20997), RoleCount.Get(ERoleCount.Save));
  else
    text_SaveValue.text = string.format(string.Get(20997), 0);
  end

  scrollContent_Save:Reset(table.maxn(loginAward[EAward.Save].Date));

  this.UpdateRedDot();
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

function UILoginAward.UpdateSoul()
  if currentTag ~= EUITag.SoulGacha then return end

  if this.SoulGachaRedDot then
    this.SoulGachaRedDot = false;
    RedDot.Remove(ERedDot.SoulGacha);
  end

  for k, v in pairs(loginAward[EAward.SoulGacha].Date) do
    if not BitFlag.Get(v.flag) and RoleCount.Get(ERoleCount.SoulGachaCount) >= v.day then
      v.sort = ESortOrder.Available;
    elseif BitFlag.Get(v.flag) and RoleCount.Get(ERoleCount.SoulGachaCount) >= v.day then
      v.sort = ESortOrder.Complete;
    else
      v.sort = ESortOrder.Processing;
    end
  end

  table.sort(loginAward[EAward.SoulGacha].Date, this.SortAward);

  if this.IsInTime(EAward.SoulGacha) then
    text_SoulValue.text = string.format(string.Get(23905), RoleCount.Get(ERoleCount.SoulGachaCount));
  else
    text_SoulValue.text = string.format(string.Get(23905), 0);
  end

  scrollContent_Soul:Reset(table.maxn(loginAward[EAward.SoulGacha].Date));

  this.UpdateRedDot();
end

--消費返利
function UILoginAward.UpdateBack()
  if currentTag ~= EUITag.Back then return end

  if this.BackRedDot then
    this.BackRedDot = false;
    RedDot.Remove(ERedDot.Back);
  end

  activeBackDay = this.GetActiveBackDay();

  text_backDays.text = string.format(string.Get(21005), activeBackDay);

  local activityTime = Activity.GetActivityTime(this.BackActicityStrat)[1];
  local startDate = activityTime:GetStartDate();
  local endDate = activityTime:GetEndDate();
  text_BackStartDay.text = string.format(string.Get(21976), startDate:ToString("MM/dd HH:mm"), endDate:ToString("MM/dd HH:mm"));

  activityTime = Activity.GetActivityTime(this.BackActicityEnd)[1];
  startDate = activityTime:GetStartDate();
  endDate = activityTime:GetEndDate();
  text_BackEndDay.text = string.format(string.Get(21977), startDate:ToString("MM/dd HH:mm"), endDate:ToString("MM/dd HH:mm"));

  local reciveLeftDate = this.MaxBack + 1 - activeBackDay;
  if reciveLeftDate > 0 then
    text_reciveDays.text = string.format(string.Get(21232), reciveLeftDate);
  else
    text_reciveDays.text = "";
  end

  local accBack = this.GetAccBack();

  if activeBackDay <= this.MaxBack then
    image_BackButton:SetActive(false);
    image_BackRecived:SetActive(false);
  else
    if not BitFlag.Get(EBitFlag.Back) then
      image_BackButton:SetActive(accBack > 0);
      image_BackRecived:SetActive(false);
    else
      image_BackButton:SetActive(false);
      image_BackRecived:SetActive(true);
    end
  end

  text_backPrice.text = string.format(string.Get(21006), accBack);

  scrollContent_Back:Reset(this.MaxItem);

  this.UpdateRedDot();
end

--支援軍團
function UILoginAward.UpdateSupportArmy()
  if currentTag ~= EUITag.SupportArmy then return end

  local limit;
  local kind = EAward.SupportArmy;

  if this.SupportArmyRedDot then
    this.SupportArmyRedDot = false;
    RedDot.Remove(ERedDot.SupportArmy);
  end

  gameObjs.gameObject_SupportBG:SetActive(true);
  text_SupportAmay.text = string.format(string.Get(22104), playerSupportArmy);

  for k, v in pairs(loginAward[kind].Date) do
    limit = v.day;
    if limit > 0 then
      if totalSupportArmy < limit then
        v.sort = ESortOrder.Available;
      elseif totalSupportArmy >= limit then
        v.sort = ESortOrder.Complete;
      else
        v.sort = ESortOrder.Processing;
      end
    end
  end

  table.sort(loginAward[kind].Date, this.SortAward);

  scrollContent_SupportArmy:Refresh();

  this.UpdateRedDot();
end

--好禮兌換
function UILoginAward.UpdateChange()
  if currentTag ~= EUITag.Change then return end

  local limit;
  local kind = EAward.Change;

  gameObjs.gameObject_SupportBG:SetActive(false);
  text_SupportAmay.text = "";
  text_ChangeDate.text = "";

  for k, v in pairs(changeAward) do
    limit = v.flag;
    if limit > 0 then
      if not this.CheckChangeItem(k) and RoleCount.Get(v.roleCount) < limit then
        v.sort = ESortOrder.Available;
      elseif limit > 0 and RoleCount.Get(v.roleCount) >= limit then
        v.sort = ESortOrder.Complete;
      else
        v.sort = ESortOrder.Processing;
      end
    else
      if not this.CheckChangeItem(k) then
        v.sort = ESortOrder.Available;
      else
        v.sort = ESortOrder.Processing;
      end
    end
  end

  scrollContent_Change:Refresh();

  this.UpdateRedDot();
end

--離線經驗
function UILoginAward.UpdateExp()
  if currentTag ~= EUITag.Exp then return end

  local exp = RoleCount.Get(ERoleCount.OffLine_Exp);
  local offlineTime = RoleCount.Get(ERoleCount.OffLine_Time);
  local hours = math.floor(offlineTime / 60);
  local mins = math.floor(offlineTime - 60 * hours);

  gameObjs.gameObject_ExpInfo:SetActive(exp <= 0 or this.CheckTopExp());
  gameObjs.gameObject_ExpBtn:SetActive(exp > 0 and not this.CheckTopExp());

  if this.CheckTopExp() then
    text_expInfo.text = string.Get(40475);  --經驗值已達上限
  else
    text_expInfo.text = string.Get(21373);  --目前無經驗可領取
  end

  slider_time.value = math.floor((offlineTime / 480) * 100);
  text_time.text = string.format(string.Get(21368), hours, mins);

  local offlineAccTime = RoleCount.Get(ERoleCount.OffLine_AccTime);
  hours = math.floor(offlineAccTime / 60);
  mins = math.floor(offlineAccTime - 60 * hours);
  slider_accTime.value = math.floor((offlineAccTime / 1440) * 100);

  text_Acc.text = string.format(string.Get(21440), hours, mins);
  text_exp.text = string.format(string.Get(21369), exp, "%");

  for k, v in pairs(expDatas) do
    text_rate[k].text = string.format(string.Get(21371), v.rate, "%");
    if k <= 1 then
      text_money[k].text = string.Get(21370);
    else
      text_money[k].text = v.money;
    end
  end

  this.UpdateRedDot();
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

function UILoginAward.UpdateDragonBox()
  scrollContent_DragonBox:Reset(table.Count(loginAward[EAward.DragonBox].Date));
end

function UILoginAward.UpdateMoneyTree()
  if currentTag ~= EUITag.MoneyTree then return end

  local moneyTreeData = nil;

  if moneyTreeLv == nil then
    text_MoneyTreeLv.text = "";
    slider_treeTime.gameObject:SetActive(false);
    gameObjs.gameObject_StartTree:SetActive(false);
    gameObjs.gameObject_GetNow:SetActive(false);
  elseif moneyGrowTime == 0 then
    moneyTreeData = moneyTreeDatas[moneyTreeLv];

    if moneyTreeData == nil then
      text_MoneyTreeLv.text = string.Get(21684);
      slider_treeTime.gameObject:SetActive(false);
      gameObjs.gameObject_StartTree:SetActive(false);
      gameObjs.gameObject_GetNow:SetActive(false);
      text_MoneyTreeGold.text = "";
    else
      text_MoneyTreeLv.text = string.format(string.Get(22136), moneyTreeLv);
      slider_treeTime.gameObject:SetActive(false);
      gameObjs.gameObject_StartTree:SetActive(true);
      gameObjs.gameObject_GetNow:SetActive(false);
      text_MoneyTreeGold.text = moneyTreeData.gold;
    end
  else
    text_MoneyTreeLv.text = string.format(string.Get(22136), moneyTreeLv);

    slider_treeTime.gameObject:SetActive(true);
    gameObjs.gameObject_StartTree:SetActive(false);

    if not CGTimer.ContainsListener(this.UpdateMoneyTreeSlider) then
      CGTimer.AddListener(this.UpdateMoneyTreeSlider, 1, true);
    end

    gameObjs.gameObject_GetNow:SetActive(not this.CheckMoneyTreeComplete());
  end

  for i = 1, this.MaxFruit do
    if i <= moneyTreeFurit then
      fruitObjs[i].gameObject:SetActive(true);
    else
      fruitObjs[i].gameObject:SetActive(false);
    end
  end
end

function UILoginAward.CheckMoneyTreeComplete()
  local result = false;

  if moneyTreeLv ~= nil and moneyGrowTime ~= 0 then
    local moneyTreeData = moneyTreeDatas[moneyTreeLv];
    local completetime = moneyTreeTime:AddMinutes(moneyTreeData.cdTime);
    result = CGTimer.serverTime:CompareTo(completetime) >= 0;
  end

  return result;
end

function UILoginAward.UpdateDoubleSave()
  if not Contains(currentTag, EUITag.DoubleSave, EUITag.Arena) then return end

  local activityTimeId, detailString;
  if currentTag == EUITag.DoubleSave then
    text_DoubleSaveVal.text = string.format(string.Get(22165), RoleCount.Get(ERoleCount.DoubleSaveVal));
    text_DoubleSaveBack.text = string.format(string.Get(22166), RoleCount.Get(ERoleCount.DoubleSaveBack));
    activityTimeId = this.GetActivityTime(EAward.DoubleSave);

    local tagData;
    for k, v in pairs(loginAwardTagDatas) do
      if v.kind == EAward.DoubleSave then
        tagData = v;
        break;
      end
    end

    if tagData ~= nil and tagData.contentString > 0 then
      detailString = string.Get(tagData.contentString);
    else
      detailString = string.Get(22167);
    end

  elseif currentTag == EUITag.Arena then
    text_DoubleSaveVal.text = string.format(string.Get(22783), RoleCount.Get(ERoleCount.GoldenTicket));
    text_DoubleSaveBack.text = string.format(string.Get(22784), RoleCount.Get(ERoleCount.SilverTicket));
    activityTimeId = this.GetActivityTime(EAward.Arena);
    detailString = string.Get(22782);
  end

  if activityTimeId > 0 then
    local startTime = this.GetStartTime(activityTimeId);
    local endTime = this.GetEndTime(activityTimeId);

    if startTime ~= nil and endTime ~= nil then
      text_DoubleSaveDetail.text = string.format(detailString, startTime:ToString("yyyy/MM/dd HH:mm"), endTime:ToString("yyyy/MM/dd HH:mm"));
    end
  end
end

function UILoginAward.UpdateMoneyTreeSlider()
  local moneyTreeData = moneyTreeDatas[moneyTreeLv];
  if moneyTreeData == nil then return end

  local completetime = moneyTreeTime:AddMinutes(moneyTreeData.cdTime);
  local seconds = math.ceil(DateTime.Subtract(completetime, CGTimer.serverTime).TotalSeconds);
  local completeSeconds = moneyTreeData.cdTime * 60;
  
  if seconds <= 0 then
    CGTimer.RemoveListener(this.UpdateMoneyTreeSlider);
    slider_treeTime.value = 100;
    text_MoneyTreeTime.text = string.Get(21061);
    this.UpdateMoneyTree();
  else
    local val = math.floor((1 - seconds / completeSeconds) * 100);
    slider_treeTime.value = val;
    text_MoneyTreeTime.text = string.format(string.Get(22140), string.GetSecondText(seconds));

    if math.fmod(seconds, 60) == 0 then
      --C:087-005 <查詢搖錢樹狀態>
      Network.Send(87, 5);
    end
  end
end

function UILoginAward.ActiveRedDot()
  if table.Count(loginAward) <= 0 then
    this.GetAwardData();
  end

  if this.CheckConsumeBitFlag() then
    this.ConsumeRedDot = true;
    RedDot.Add(ERedDot.Consume);
  end

  if this.CheckSoulBitFlag() then
    this.SoulGachaRedDot = true;
    RedDot.Add(ERedDot.SoulGacha);
  end

  if this.CheckSoulBitFlag() then
    this.SoulGachaRedDot = true;
    RedDot.Add(ERedDot.SoulGacha);
  end

  if this.IsInTime(EAward.Back) then
    if this.GetActiveBackDay() > this.MaxBack then
      if not BitFlag.Get(EBitFlag.Back) and this.GetAccBack() > 0 then
        this.BackRedDot = true;
        RedDot.Add(ERedDot.Back);
      end
    else
      this.BackRedDot = true;
      RedDot.Add(ERedDot.Back);
    end
  end

  if this.IsInTime(EAward.SupportArmy) then
    this.SupportArmyRedDot = true;
    RedDot.Add(ERedDot.SupportArmy);
  end

  if this.IsInTime(EAward.ReUseAct_4) then
    RedDot.Add(ERedDot.ReUseAct_4);
  end

  if this.IsInTime(EAward.ReUseAct_5) then
    RedDot.Add(ERedDot.ReUseAct_5);
  end

  if this.IsInTime(EAward.ReUseAct_6) then
    RedDot.Add(ERedDot.ReUseAct_6);
  end

  if RoleCount.Max(EUITag.Poke) > 0 and this.IsInTime(EAward.Poke) and RoleCount.Get(ERoleCount.Poke) < RoleCount.Max(EUITag.Poke) then
    this.PokeOnceRedDot = true;
    RedDot.Add(ERedDot.Poke);
  end

  this.UpdateScratchRedDot();
  this.UpdateConsumeScratchRedDot();
end

function UILoginAward.CheckConsumeBitFlag()
  local result = false;

  for k, v in pairs(loginAward[EAward.Consume].Date) do
    if not BitFlag.Get(v.flag) and this.IsInTime(EAward.Consume) then
      result = true;
      break;
    end
  end

  return result;
end

function UILoginAward.CheckSaveBitFlag()
  local result = false;

  for k, v in pairs(loginAward[EAward.Save].Date) do
    if not BitFlag.Get(v.flag) and this.IsInTime(EAward.Save) then
      result = true;
      break;
    end
  end

  return result;
end

function UILoginAward.CheckSoulBitFlag()
  local result = false;

  for k, v in pairs(loginAward[EAward.SoulGacha].Date) do
    if not BitFlag.Get(v.flag) and this.IsInTime(EAward.SoulGacha) then
      result = true;
      break;
    end
  end

  return result;
end

function UILoginAward.UpdateConsume()
  if not Contains(currentTag, EUITag.Consume, EUITag.LottoNpc, EUITag.LottoCard, EUITag.Furnace, EUITag.Poke,
          EUITag.StagePass, EUITag.ClassAward, EUITag.ActLogin, EUITag.ActAccLogin, EUITag.Prize_1, EUITag.ReturnLogin,
          EUITag.Swimming, EUITag.ReUseAct_1, EUITag.ReUseAct_2, EUITag.ReUseAct_3, EUITag.ReUseAct_4, EUITag.ReUseAct_5, EUITag.ReUseAct_6,
          EUITag.Collect, EUITag.Prize_1, EUITag.Prize_2, EUITag.Prize_3, EUITag.Prize_4, EUITag.Prize_5, EUITag.Prize_6, EUITag.Prize_7, EUITag.Prize_8) then return end

  if currentTag == EUITag.Consume and this.ConsumeRedDot then
    this.ConsumeRedDot = false;
    RedDot.Remove(ERedDot.Consume);
  end

  if this.PokeOnceRedDot and RoleCount.Max(EUITag.Poke) > 0 then
    this.PokeOnceRedDot = false;
    RedDot.Remove(ERedDot.Poke);
  end

  if currentTag > this.BasePrize then
    local idx = currentTag - this.BasePrize;

    if this.PrizeRedDot[idx] then
      this.PrizeRedDot[idx] = false;
      RedDot.Remove(ERedDot.Prize_1 + idx - 1);
    end
  end

  local loginAwardData = nil;
  local roleCount = 0;
  local infoString = "";

  if currentTag == EUITag.Consume then
    loginAwardData = loginAward[EAward.Consume].Date;
    roleCount = RoleCount.Get(ERoleCount.Consume);
    infoString = string.Get(21621);
  elseif currentTag == EUITag.LottoNpc then
    loginAwardData = loginAward[EAward.LottoNpc].Date;
    roleCount = RoleCount.Get(ERoleCount.LottoNpc);
    infoString = string.Get(21744);
  elseif currentTag == EUITag.LottoCard then
    loginAwardData = loginAward[EAward.LottoCard].Date;
    roleCount = RoleCount.Get(ERoleCount.LottoCard);
    infoString = string.Get(21747);
  elseif currentTag == EUITag.Furnace then
    loginAwardData = loginAward[EAward.Furnace].Date;
    roleCount = RoleCount.Get(ERoleCount.Furnace);
    infoString = string.Get(22227);
  elseif currentTag == EUITag.Poke then
    loginAwardData = loginAward[EAward.Poke].Date;
    roleCount = RoleCount.Get(ERoleCount.Poke);
    infoString = string.Get(22480);
  elseif currentTag == EUITag.StagePass then
    loginAwardData = loginAward[EAward.StagePass].Date;
    roleCount = this.GetStagePassCount();
    infoString = string.Get(22527);
  elseif currentTag == EUITag.ClassAward then
    loginAwardData = loginAward[EAward.ClassAward].Date;
    roleCount = RoleCount.Get(ERoleCount.ClassAward);
    infoString = string.Get(22611);
  elseif currentTag == EUITag.ActLogin then
    loginAwardData = loginAward[EAward.ActLogin].Date;
    roleCount = RoleCount.Get(ERoleCount.ActLogin);
    infoString = string.Get(22649);
  elseif currentTag == EUITag.ActAccLogin then
    loginAwardData = loginAward[EAward.ActAccLogin].Date;
    roleCount = RoleCount.Get(ERoleCount.MaxActAccLogin);
    infoString = string.Get(22652);
  elseif currentTag == EUITag.ReturnLogin then
    loginAwardData = loginAward[EAward.ReturnLogin].Date;
    roleCount = RoleCount.Get(ERoleCount.ReturnLogin);
    infoString = string.Get(22649);
  elseif currentTag == EUITag.Swimming then
    loginAwardData = loginAward[EAward.Swimming].Date;
    roleCount = RoleCount.Get(ERoleCount.Swimming);
    infoString = string.Get(22732);
  elseif currentTag == EUITag.ReUseAct_1 then
    loginAwardData = loginAward[EAward.ReUseAct_1].Date;
    infoString = reUseActTitle;
  elseif currentTag == EUITag.ReUseAct_2 then
    loginAwardData = loginAward[EAward.ReUseAct_2].Date;
    infoString = reUseActTitle;
  elseif currentTag == EUITag.ReUseAct_3 then
    loginAwardData = loginAward[EAward.ReUseAct_3].Date;
    infoString = reUseActTitle;
  elseif currentTag == EUITag.ReUseAct_4 then
    loginAwardData = loginAward[EAward.ReUseAct_4].Date;
    infoString = reUseActTitle;
  elseif currentTag == EUITag.ReUseAct_5 then
    loginAwardData = loginAward[EAward.ReUseAct_5].Date;
    infoString = reUseActTitle;
  elseif currentTag == EUITag.ReUseAct_6 then
    loginAwardData = loginAward[EAward.ReUseAct_6].Date;
    infoString = reUseActTitle;
  elseif currentTag == EUITag.Collect then
    loginAwardData = loginAward[EAward.Collect].Date;
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

    local serverIndex = loginAwardData[1].roleCount;

    if serverIndex ~= nil then
      roleCount = this.GetAllServerRoleCount(serverIndex);
    else
      roleCount = 0;
    end

    infoString = string.Get(22763);
  elseif Contains(currentTag, EUITag.Prize_1, EUITag.Prize_2, EUITag.Prize_3, EUITag.Prize_4, EUITag.Prize_5, EUITag.Prize_6, EUITag.Prize_7, EUITag.Prize_8) then
    loginAwardData = loginAward[currentTag].Date;
    roleCount = 0;
    infoString = this.GetPrizeInfoString(loginAwardData[1], currentTag - this.BasePrize, 1, true);
  end

  local serial = currentTag - this.BasePrize;

  if loginAwardData ~= nil then
    if currentTag > this.BasePrize then

      local pIdx = UILoginAward.GetPrizeIndexById(serial);

      for k, v in pairs(loginAwardData) do
        if v.actRule ~= nil  and pIdx > 0 then
          local condition = false;

          if Contains(prizeDatas[pIdx].actKind, EActKind.Condition) then
            if prizeDatas[pIdx].wcheck[ESpecSet.ReAcc] then
              condition = false;
            else
              condition = PlayerPrizeDatas[serial].totalSum >= v.actRule.lowp and v.actRule.lowp > 0;
            end
          elseif prizeDatas[pIdx].actKind == EActKind.AccSum then
            condition = false;
          elseif prizeDatas[pIdx].actKind == EActKind.FullPoint then
            condition = false;
          elseif prizeDatas[pIdx].actKind == EActKind.First then
            condition = false;
          elseif prizeDatas[pIdx].actKind == EActKind.AllServer then
            condition = false;
          elseif prizeDatas[pIdx].actKind == EActKind.SelfServer then
            condition = false;
          elseif prizeDatas[pIdx].actKind == EActKind.SpecConsume then
            condition = false;
          elseif prizeDatas[pIdx].actKind == EActKind.ContConsume then
            condition = false;
          elseif prizeDatas[pIdx].actKind == EActKind.DayCondition then
            condition = PlayerPrizeDatas[serial].ruleValue[k] >= v.actRule.highp and v.actRule.highp > 0;
          end

          if condition then
            v.sort = ESortOrder.Complete;    --已配送
          else
            v.sort = ESortOrder.Processing;  --進行中
          end
        end
      end
    else
      for k, v in pairs(loginAwardData) do
        if Contains(currentTag, EUITag.ReUseAct_1, EUITag.ReUseAct_2, EUITag.ReUseAct_3, EUITag.ReUseAct_4, EUITag.ReUseAct_5, EUITag.ReUseAct_6) then
          roleCount = RoleCount.Get(v.roleCount);
        end

        if not BitFlag.Get(v.flag) and roleCount >= v.day then
          v.sort = ESortOrder.Available;   --已獲得
        elseif BitFlag.Get(v.flag) and roleCount >= v.day then
          v.sort = ESortOrder.Complete;    --完成
        else
          v.sort = ESortOrder.Processing;  --進行中
        end
      end
    end

    table.sort(loginAwardData, this.SortAward);

    scrollContent_Consume:Reset(table.maxn(loginAwardData));
  end

  if currentTag >= EUITag.Prize_1 then
    if loginAwardData[1].actRule ~= nil and PlayerPrizeDatas[1].ruleValue ~= nil then
      text_ConsumeValue.text = infoString;
    else
      text_ConsumeValue.text = "";
    end

  else
    if this.IsInTime(EAward.Consume) or this.IsInTime(EAward.LottoNpc) or this.IsInTime(EAward.LottoCard) or
            this.IsInTime(EAward.Furnace) or this.IsInTime(EAward.Poke) or this.IsInTime(EAward.StagePass) or
            this.IsInTime(EAward.ClassAward) or this.IsInTime(EAward.ActLogin) or this.IsInTime(EAward.ActAccLogin) or
            this.IsInTime(EAward.ReturnLogin) or this.IsInTime(EAward.Swimming) or this.IsInTime(EAward.ReUseAct_1) or
            this.IsInTime(EAward.ReUseAct_2) or this.IsInTime(EAward.ReUseAct_3) or this.IsInTime(EAward.ReUseAct_4) or
            this.IsInTime(EAward.ReUseAct_5) or this.IsInTime(EAward.ReUseAct_6) or this.IsInTime(EAward.Collect) then

      if currentTag == EUITag.ActAccLogin then
        text_ConsumeValue.text = string.format(infoString, RoleCount.Get(ERoleCount.ActAccLogin));
      elseif Contains(currentTag, EUITag.ReUseAct_1, EUITag.ReUseAct_2, EUITag.ReUseAct_3, EUITag.ReUseAct_4, EUITag.ReUseAct_5, EUITag.ReUseAct_6) then
        text_ConsumeValue.text = string.format(infoString, roleCount);
      else
        text_ConsumeValue.text = string.format(infoString, roleCount);
      end
    else
      text_ConsumeValue.text = string.format(infoString, 0);
    end
  end

  this.UpdateRedDot();
end

function UILoginAward.GetAllServerRoleCount(index)
  local allServerRoleCount = 0;

  for k, v in pairs(serverCollects) do
    if v.index == index then
      allServerRoleCount = v.value;
      break;
    end
  end

  return allServerRoleCount;
end

function UILoginAward.GetPrizeIndexById(id)
  local result = 0;

  for k, v in pairs(prizeDatas) do
    if id == v.id then
      result = k;
    end
  end

  return result;
end

function UILoginAward.UpdateLeftSupportArmyTime()
  if currentTag == EUITag.SupportArmy then
    this.CalLeftTime(EAward.SupportArmy, text_ChangeDate);
  end
end

function UILoginAward.UpdateLeftBackTime()
  this.CalLeftTime(EAward.Back, text_BackDate);
end

function UILoginAward.UpdateLeftSaveTime()
  this.CalLeftTime(EAward.Save, text_SaveDate);
end

function UILoginAward.UpdateLeftSoulTime()
  this.CalLeftTime(EAward.SoulGacha, text_SoulDate);
end

function UILoginAward.UpdateLeftConsumeTime()
  if currentTag == EUITag.Consume then
    this.CalLeftTime(EAward.Consume, text_ConsumeDate);
  end
end

function UILoginAward.UpdateLeftLottoNpcTime()
  if currentTag == EUITag.LottoNpc then
    this.CalLeftTime(EAward.LottoNpc, text_ConsumeDate);
  end
end

function UILoginAward.UpdateLeftFurnaceTime()
  if currentTag == EUITag.Furnace then
    this.CalLeftTime(EAward.Furnace, text_ConsumeDate);
  end
end

function UILoginAward.UpdateLeftLottoCardTime()
  if currentTag == EUITag.LottoCard then
    this.CalLeftTime(EAward.LottoCard, text_ConsumeDate);
  end
end

function UILoginAward.UpdateLeftStagePassTime()
  if currentTag == EUITag.StagePass then
    this.CalLeftTime(EAward.StagePass, text_ConsumeDate);
  end
end

function UILoginAward.UpdateLeftClassAwardTime()
  if currentTag == EUITag.ClassAward then
    this.CalLeftTime(EAward.ClassAward, text_ConsumeDate);
  end
end

function UILoginAward.UpdateLeftActLoginTime()
  if currentTag == EUITag.ActLogin then
    this.CalLeftTime(EAward.ActLogin, text_ConsumeDate);
  end
end

function UILoginAward.UpdateLeftActAccLoginTime()
  if currentTag == EUITag.ActAccLogin then
    this.CalLeftTime(EAward.ActAccLogin, text_ConsumeDate);
  end
end

function UILoginAward.UpdateLeftReturnLoginTime()
  if currentTag == EUITag.ReturnLogin then
    this.CalLeftTime(EAward.ReturnLogin, text_ConsumeDate);
  end
end

function UILoginAward.UpdateLeftSwimmingTime()
  if currentTag == EUITag.Swimming then
    this.CalLeftTime(EAward.Swimming, text_ConsumeDate);
  end
end

function UILoginAward.UpdateLeftReUseActTime()
  if currentTag == EUITag.ReUseAct_1 then
    this.CalLeftTime(EAward.ReUseAct_1, text_ConsumeDate);
  end
end

function UILoginAward.UpdateLeftReUseAct_2()
  if currentTag == EUITag.ReUseAct_2 then
    this.CalLeftTime(EAward.ReUseAct_2, text_ConsumeDate);
  end
end

function UILoginAward.UpdateLeftReUseAct_3()
  if currentTag == EUITag.ReUseAct_3 then
    this.CalLeftTime(EAward.ReUseAct_3, text_ConsumeDate);
  end
end

function UILoginAward.UpdateLeftReUseAct_4()
  if currentTag == EUITag.ReUseAct_4 then
    this.CalLeftTime(EAward.ReUseAct_4, text_ConsumeDate);
  end
end

function UILoginAward.UpdateLeftReUseAct_5()
  if currentTag == EUITag.ReUseAct_5 then
    this.CalLeftTime(EAward.ReUseAct_5, text_ConsumeDate);
  end
end

function UILoginAward.UpdateLeftReUseAct_6()
  if currentTag == EUITag.ReUseAct_6 then
    this.CalLeftTime(EAward.ReUseAct_6, text_ConsumeDate);
  end
end

function UILoginAward.UpdateLeftCollect()
  if currentTag == EUITag.Collect then
    this.CalLeftTime(EAward.Collect, text_ConsumeDate);
  end
end

function UILoginAward.UpdateLeftPoke()
  if currentTag == EUITag.Poke then
    this.CalLeftTime(EAward.Poke, text_ConsumeDate);
  end
end

function UILoginAward.UpdateLeftDragonBoxTime()
  if currentTag == EUITag.DragonBox then
    this.CalLeftTime(EAward.DragonBox, text_DragonBoxDate);
  end
end

function UILoginAward.UpdateLeftMoneyTreeTime()
  if currentTag == EUITag.MoneyTree then
    this.CalLeftTime(EAward.MoneyTree, text_MoneyTreeDate);
  end
end

function UILoginAward.UpdateLeftDoubleSaveTime()
  if currentTag == EUITag.DoubleSave then
    this.CalLeftTime(EAward.DoubleSave, text_DoubleSaveDate);
  elseif currentTag == EUITag.Arena then
    this.CalLeftTime(EAward.Arena, text_DoubleSaveDate);
  end
end

function UILoginAward.UpdatePrize_1()
  if currentTag == EUITag.Prize_1 then
    this.CalLeftTime(EAward.Prize_1, text_ConsumeDate);
  end
end

function UILoginAward.UpdatePrize_2()
  if currentTag == EUITag.Prize_2 then
    this.CalLeftTime(EAward.Prize_2, text_ConsumeDate);
  end
end

function UILoginAward.UpdatePrize_3()
  if currentTag == EUITag.Prize_3 then
    this.CalLeftTime(EAward.Prize_3, text_ConsumeDate);
  end
end

function UILoginAward.UpdatePrize_4()
  if currentTag == EUITag.Prize_4 then
    this.CalLeftTime(EAward.Prize_4, text_ConsumeDate);
  end
end

function UILoginAward.UpdatePrize_5()
  if currentTag == EUITag.Prize_5 then
    this.CalLeftTime(EAward.Prize_5, text_ConsumeDate);
  end
end

function UILoginAward.UpdatePrize_6()
  if currentTag == EUITag.Prize_6 then
    this.CalLeftTime(EAward.Prize_6, text_ConsumeDate);
  end
end
function UILoginAward.UpdatePrize_7()
  if currentTag == EUITag.Prize_7 then
    this.CalLeftTime(EAward.Prize_7, text_ConsumeDate);
  end
end
function UILoginAward.UpdatePrize_8()
  if currentTag == EUITag.Prize_8 then
    this.CalLeftTime(EAward.Prize_8, text_ConsumeDate);
  end
end

function UILoginAward.UpdateOnlineTime()
  onlineTime = this.GetOnlineTime();

  text_online.text = string.format(string.Get(20206), onlineTime);

  this.UpdateOnlineRedDot();
end

function UILoginAward.UpdateOnlineRedDot()
  onlineTime = this.GetOnlineTime();

  for k, v in pairs(loginAward[EAward.Online].Date) do
    if onlineTime ~= nil and not BitFlag.Get(v.flag) and onlineTime >= v.day then
      if not RedDot.Check(ERedDot.Online) then
        RedDot.Add(ERedDot.Online);
        if currentTag == EUITag.Online then
          this.UpdateOnline();
        end
      end
    end
  end
end

function UILoginAward.UpdateChangeRedDot()
  local limit;
  local haveRedDot = false;
  local subTag = 0;
  if loginAward[EAward.Change] == nil then return end

  table.Clear(changeSubTagRedDot);

  for k, v in pairs(loginAward[EAward.Change].Date) do
    limit = v.flag;
    if limit > 0 then
      if not this.CheckChangeItem(k, true) and RoleCount.Get(v.roleCount) < limit then
        haveRedDot = true;
        if this.IsInTime(EAward.Change) then
          if not RedDot.Check(ERedDot.Change) then
            RedDot.Add(ERedDot.Change);
          end
          subTag = math.floor(v.day / 100);
          changeSubTagRedDot[subTag] = true;
        end
      end
    else
      if not this.CheckChangeItem(k, true) then
        haveRedDot = true;
        if this.IsInTime(EAward.Change) then
          if not RedDot.Check(ERedDot.Change) then
            RedDot.Add(ERedDot.Change);
          end
          subTag = math.floor(v.day / 100);
          changeSubTagRedDot[subTag] = true;
        end
      end
    end
  end

  if not haveRedDot then
    RedDot.Remove(ERedDot.Change);
    table.Clear(changeSubTagRedDot);
  end
end

function UILoginAward.UpdateRedDot()
  if table.Count(loginAward) <= 0 then
    this.GetAwardData();
  end

  if not BitFlag.Get(EBitFlag.Login) then
    if not RedDot.Check(ERedDot.LogainAward) then
      RedDot.Add(ERedDot.LogainAward);
    end
  end

  this.UpdateOnlineRedDot();

  for k, v in pairs(loginAward[EAward.OpenServer].Date) do
    if Role.GetLoginDay() >= v.day then
      if not BitFlag.Get(v.flag) then
        if not RedDot.Check(ERedDot.OpenServer) then
          RedDot.Add(ERedDot.OpenServer);
          if scrollContent_OpenServer ~= nil then
            scrollContent_OpenServer:Refresh();
          end
        end
      end
    end
  end

  for k, v in pairs(loginAward[EAward.Save].Date) do
    if RoleCount.Get(ERoleCount.Save) >= v.day then
      if not BitFlag.Get(v.flag) then
        if not RedDot.Check(ERedDot.Save) and this.IsInTime(EAward.Save) then
          RedDot.Add(ERedDot.Save);
          if scrollContent_Save ~= nil then
            scrollContent_Save:Refresh();
          end
        end
      end
    end
  end

  for k, v in pairs(loginAward[EAward.SoulGacha].Date) do
    if RoleCount.Get(ERoleCount.SoulGachaCount) >= v.day then
      if not BitFlag.Get(v.flag) then
        if not RedDot.Check(ERedDot.SoulGacha) and this.IsInTime(EAward.SoulGacha) then
          RedDot.Add(ERedDot.SoulGacha);
          if scrollContent_Soul ~= nil then
            scrollContent_Soul:Refresh();
          end
        end
      end
    end
  end

  for k, v in pairs(loginAward[EAward.Consume].Date) do
    if RoleCount.Get(ERoleCount.Consume) >= v.day then
      if not BitFlag.Get(v.flag) then
        if not RedDot.Check(ERedDot.Consume) and this.IsInTime(EAward.Consume) then
          RedDot.Add(ERedDot.Consume);
          if scrollContent_Consume ~= nil then
            scrollContent_Consume:Refresh();
          end
        end
      end
    end
  end

  for k, v in pairs(loginAward[EAward.LottoNpc].Date) do
    if RoleCount.Get(ERoleCount.LottoNpc) >= v.day then
      if not BitFlag.Get(v.flag) then
        if not RedDot.Check(ERedDot.LottoNpc) and this.IsInTime(EAward.LottoNpc) then
          RedDot.Add(ERedDot.LottoNpc);
          if scrollContent_Consume ~= nil then
            scrollContent_Consume:Refresh();
          end
        end
      end
    end
  end

  for k, v in pairs(loginAward[EAward.LottoCard].Date) do
    if RoleCount.Get(ERoleCount.LottoCard) >= v.day then
      if not BitFlag.Get(v.flag) then
        if not RedDot.Check(ERedDot.LottoCard) and this.IsInTime(EAward.LottoCard) then
          RedDot.Add(ERedDot.LottoCard);
          if scrollContent_Consume ~= nil then
            scrollContent_Consume:Refresh();
          end
        end
      end
    end
  end

  if RoleCount.Max(EUITag.Poke) <= 0 then
    for k, v in pairs(loginAward[EAward.Poke].Date) do
      if RoleCount.Get(ERoleCount.Poke) >= v.day then
        if not BitFlag.Get(v.flag) then
          if not RedDot.Check(ERedDot.Poke) and this.IsInTime(EAward.Poke) then
            RedDot.Add(ERedDot.Poke);
            if scrollContent_Consume ~= nil then
              scrollContent_Consume:Refresh();
            end
          end
        end
      end
    end
  end

  for k, v in pairs(loginAward[EAward.ClassAward].Date) do
    if RoleCount.Get(ERoleCount.ClassAward) >= v.day then
      if not BitFlag.Get(v.flag) then
        if not RedDot.Check(ERedDot.ClassAward) and this.IsInTime(EAward.ClassAward) then
          RedDot.Add(ERedDot.ClassAward);
          if scrollContent_Consume ~= nil then
            scrollContent_Consume:Refresh();
          end
        end
      end
    end
  end

  for k, v in pairs(loginAward[EAward.ActLogin].Date) do
    if RoleCount.Get(ERoleCount.ActLogin) >= v.day then
      if not BitFlag.Get(v.flag) then
        if not RedDot.Check(ERedDot.ActLogin) and this.IsInTime(EAward.ActLogin) then
          RedDot.Add(ERedDot.ActLogin);
          if scrollContent_Consume ~= nil then
            scrollContent_Consume:Refresh();
          end
        end
      end
    end
  end

  for k, v in pairs(loginAward[EAward.ActAccLogin].Date) do
    if RoleCount.Get(ERoleCount.MaxActAccLogin) >= v.day then
      if not BitFlag.Get(v.flag) then
        if not RedDot.Check(ERedDot.ActAccLogin) and this.IsInTime(EAward.ActAccLogin) then
          RedDot.Add(ERedDot.ActAccLogin);
          if scrollContent_Consume ~= nil then
            scrollContent_Consume:Refresh();
          end
        end
      end
    end
  end

  for k, v in pairs(loginAward[EAward.ReturnLogin].Date) do
    if RoleCount.Get(ERoleCount.ReturnLogin) >= v.day then
      if not BitFlag.Get(v.flag) then
        if not RedDot.Check(ERedDot.ReturnLogin) and this.IsInTime(EAward.ReturnLogin) then
          RedDot.Add(ERedDot.ReturnLogin);
          if scrollContent_Consume ~= nil then
            scrollContent_Consume:Refresh();
          end
        end
      end
    end
  end

  for k, v in pairs(loginAward[EAward.Swimming].Date) do
    if RoleCount.Get(ERoleCount.Swimming) >= v.day then
      if not BitFlag.Get(v.flag) then
        if not RedDot.Check(ERedDot.Swimming) and this.IsInTime(EAward.Swimming) then
          RedDot.Add(ERedDot.Swimming);
          if scrollContent_Consume ~= nil then
            scrollContent_Consume:Refresh();
          end
        end
      end
    end
  end

  for k, v in pairs(loginAward[EAward.ReUseAct_1].Date) do
    if RoleCount.Get(v.roleCount) >= v.day then
      if not BitFlag.Get(v.flag) then
        if not RedDot.Check(ERedDot.ReUseAct_1) and this.IsInTime(EAward.ReUseAct_1) then
          RedDot.Add(ERedDot.ReUseAct_1);
          if scrollContent_Consume ~= nil then
            scrollContent_Consume:Refresh();
          end
        end
      end
    end
  end

  for k, v in pairs(loginAward[EAward.ReUseAct_2].Date) do
    if RoleCount.Get(v.roleCount) >= v.day then
      if not BitFlag.Get(v.flag) then
        if not RedDot.Check(ERedDot.ReUseAct_2) and this.IsInTime(EAward.ReUseAct_2) then
          RedDot.Add(ERedDot.ReUseAct_2);
          if scrollContent_Consume ~= nil then
            scrollContent_Consume:Refresh();
          end
        end
      end
    end
  end

  for k, v in pairs(loginAward[EAward.ReUseAct_3].Date) do
    if RoleCount.Get(v.roleCount) >= v.day then
      if not BitFlag.Get(v.flag) then
        if not RedDot.Check(ERedDot.ReUseAct_3) and this.IsInTime(EAward.ReUseAct_3) then
          RedDot.Add(ERedDot.ReUseAct_3);
          if scrollContent_Consume ~= nil then
            scrollContent_Consume:Refresh();
          end
        end
      end
    end
  end

  if loginAward[EAward.Collect].Date ~= nil and loginAward[EAward.Collect].Date[1] ~= nil then
    local serverIndex = loginAward[EAward.Collect].Date[1].roleCount;
    local allServerRoleCount = this.GetAllServerRoleCount(serverIndex);
    for k, v in pairs(loginAward[EAward.Collect].Date) do
      if allServerRoleCount >= v.day then
        if not BitFlag.Get(v.flag) then
          if not RedDot.Check(ERedDot.Collect) and this.IsInTime(EAward.Collect) then
            RedDot.Add(ERedDot.Collect);
            if scrollContent_Consume ~= nil then
              scrollContent_Consume:Refresh();
            end
          end
        end
      end
    end
  end

  local stagePassCount = this.GetStagePassCount();
  for k, v in pairs(loginAward[EAward.StagePass].Date) do
    if stagePassCount >= v.day then
      if not BitFlag.Get(v.flag) then
        if not RedDot.Check(ERedDot.StagePass) and this.IsInTime(EAward.StagePass) then
          RedDot.Add(ERedDot.StagePass);
          if scrollContent_Consume ~= nil then
            scrollContent_Consume:Refresh();
          end
        end
      end
    end
  end

  for k, v in pairs(loginAward[EAward.Furnace].Date) do
    if RoleCount.Get(ERoleCount.Furnace) >= v.day then
      if not BitFlag.Get(v.flag) then
        if not RedDot.Check(ERedDot.Furnace) and this.IsInTime(EAward.Furnace) then
          RedDot.Add(ERedDot.Furnace);
          if scrollContent_Consume ~= nil then
            scrollContent_Consume:Refresh();
          end
        end
      end
    end
  end

  local accBack = this.GetAccBack();

  if activeBackDay == 0 then
    activeBackDay = this.GetActiveBackDay();
  end

  if not BitFlag.Get(EBitFlag.Back) and activeBackDay > this.MaxBack and accBack > 0 and this.IsInTime(EAward.Back) then
    if not RedDot.Check(ERedDot.Back) then
      RedDot.Add(ERedDot.Back);
    end
  end

  if not this.CheckTopExp() and RoleCount.Get(ERoleCount.OffLine_Exp) > 0 then
    if not RedDot.Check(ERedDot.OffLineExp) then
      RedDot.Add(ERedDot.OffLineExp);
    end
  else
    if RedDot.Check(ERedDot.OffLineExp) then
      RedDot.Remove(ERedDot.OffLineExp);
    end
  end

  if this.DragonBoxRedDot then
    RedDot.Add(ERedDot.DragonBox);
  else
    RedDot.Remove(ERedDot.DragonBox);  
  end

  this.UpdateChangeRedDot();
  this.UpdateScratchRedDot();
  this.UpdateConsumeScratchRedDot();
end

function UILoginAward.CheckActivityTag(kind)
  if not Contains(kind, EAward.Code, EAward.Back, EAward.Save, EAward.Change, EAward.Consume, EAward.LottoNpc,
          EAward.LottoCard, EAward.Furnace, EAward.DragonBox, EAward.MoneyTree, EAward.DoubleSave,
          EAward.Scratch, EAward.ConsumeScratch, EAward.Poke, EAward.StagePass, EAward.ClassAward,
          EAward.ActLogin, EAward.ActAccLogin, EAward.ReturnLogin, EAward.Swimming, EAward.SoulGacha, EAward.ReUseAct_1,
          EAward.ReUseAct_2, EAward.ReUseAct_3, EAward.ReUseAct_4, EAward.ReUseAct_5, EAward.ReUseAct_6, EAward.Collect, EAward.Arena) then return end

  if kind == EAward.Code then
    if Network.CheckServerSwitch(EServerSwitch.Review) then --送審關閉
      this.CloseActSort(kind);
  
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
  else
    if not this.IsInTime(kind) then --非活動時間
      this.CloseActSort(kind);
    end
  end
end

function UILoginAward.CloseActSort(kind)
  for k, v in pairs(loginAwardTagDatas) do
    if kind == v.kind then
      v.actSort = 0;
    end
  end
end

function UILoginAward.SetActSort()
  for k, v in pairs(loginAwardTagDatas) do
    v.actSort = v.sort;
  end
end

function UILoginAward.UpdateTagData()
  --prize
  for k, v in pairs(prizeDatas) do
    local diffStart = DateTime.Compare(CGTimer.serverTime, v.startTime);
    local diffEnd = DateTime.Compare(v.endTime, CGTimer.serverTime);
    if diffStart > 0 and diffEnd > 0 then
      local prizeData = LoginAwardTagData.Add(v.id + this.BasePrize, v.id + this.BasePrize, 0, v.id + this.BasePrize, 0, v.id + this.BasePrize, v.title, v.isStop)
      table.insert(loginAwardTagDatas, prizeData);
    end
  end

  table.sort(loginAwardTagDatas, this.SortTag);
  this.SetActSort();
  table.Clear(tagDatas);

  this.CheckActivityTag(EAward.Code);
  this.CheckActivityTag(EAward.Back);
  this.CheckActivityTag(EAward.Save);
  this.CheckActivityTag(EAward.SoulGacha);
  this.CheckActivityTag(EAward.Change);
  this.CheckActivityTag(EAward.SupportArmy);
  this.CheckActivityTag(EAward.Consume);
  this.CheckActivityTag(EAward.LottoNpc);
  this.CheckActivityTag(EAward.LottoCard);
  this.CheckActivityTag(EAward.StagePass);
  this.CheckActivityTag(EAward.ClassAward);
  this.CheckActivityTag(EAward.ActLogin);
  this.CheckActivityTag(EAward.ActAccLogin);
  this.CheckActivityTag(EAward.ReturnLogin);
  this.CheckActivityTag(EAward.Swimming);
  this.CheckActivityTag(EAward.ReUseAct_1);
  this.CheckActivityTag(EAward.ReUseAct_2);
  this.CheckActivityTag(EAward.ReUseAct_3);
  this.CheckActivityTag(EAward.ReUseAct_4);
  this.CheckActivityTag(EAward.ReUseAct_5);
  this.CheckActivityTag(EAward.ReUseAct_6);
  this.CheckActivityTag(EAward.Collect);
  this.CheckActivityTag(EAward.Poke);
  this.CheckActivityTag(EAward.Furnace);
  this.CheckActivityTag(EAward.DragonBox);
  this.CheckActivityTag(EAward.MoneyTree);
  this.CheckActivityTag(EAward.DoubleSave);
  this.CheckActivityTag(EAward.Arena);
  this.CheckActivityTag(EAward.Scratch);
  this.CheckActivityTag(EAward.ConsumeScratch);

  local tagStr = nil;
  for k, v in pairs(loginAwardTagDatas) do
    if not string.IsNullOrEmpty(v.subTagString) then
      tagStr = string.split(v.subTagString, ",");
      subTagDatas[v.kind] = {};
      subTagDatas[v.kind][1] = string.Get(v.tagString);
      subTagDatas[v.kind][2] = {};
      for kk, vv in pairs(tagStr) do
        table.insert(subTagDatas[v.kind][2], string.Get(tonumber(vv)))
      end
    end
  end

  local index = 0;
  for k, v in pairs(loginAwardTagDatas) do
    if v.actSort > 0 then
      index = index + 1;

      if v.tagString == 0 and not v.isStop then
        tagDatas[index] = { v.title, nil };
      else
        if not string.IsNullOrEmpty(v.subTagString) then
          tagDatas[index] = subTagDatas[v.kind];
        else
          tagDatas[index] = { string.Get(v.tagString), nil };
        end
      end
    end
  end
end

function UILoginAward.GetTitleString()
  for k, v in pairs(loginAwardTagDatas) do
    if v.tag == currentTag then
      return string.Get(v.titleString);
    end
  end

  return nil;
end

function UILoginAward.GetContentString()
  for k, v in pairs(loginAwardTagDatas) do
    if v.tag == currentTag then
      return string.Get(v.contentString);
    end
  end

  return nil;
end

function UILoginAward.SortTag(a, b)
  if a.sort < b.sort then return true end
  if a.sort == b.sort then
    return a.kind < b.kind;
  end

  return false;
end

function UILoginAward.SortActTag(a, b)
  if a.actSort < b.actSort then return true end
  if a.actSort == b.actSort then
    return a.kind < b.kind;
  end

  return false;
end

function UILoginAward.ImportPrize()
  for k, v in pairs(prizeDatas) do
    loginAward[v.id + this.BasePrize].Date = {};

    for kk, vv in pairs(v.actRule) do
      local items = {};
      local quants = {};
      local actRule = {};

      actRule.highp = vv.highp;
      actRule.lowp = vv.lowp;

      for kkk, vvv in pairs(vv.award) do
        items[kkk] = vvv.itemId;
        quants[kkk] = vvv.count;
      end

      if vv.award[1] ~= nil and vv.award[1].itemId > 0 then
        loginAward[v.id + this.BasePrize].Date[kk] = LoginAwardData.Add(v.id + this.BasePrize, kk, items, quants, 0, 0, 0, 0, actRule);
      end
    end
  end
end

function UILoginAward.GetAwardData()
  if table.Count(loginAward) > 0 then return end

  local index, group;
  for k, v in pairs(EAward) do
    loginAward[v] = {};
    loginAward[v].Date = {};
  end

  for k, v in pairs(loginAwardDatas) do
    if loginAward[v.group] ~= nil then
      if group ~= v.group then
        index = 0;
      end

      index = index + 1;
      loginAward[v.group].Date[index] = {};
      loginAward[v.group].Date[index] = v;
      loginAward[v.group].Date[index].sort = index;
      group = v.group;
    end
  end

  for k, v in pairs(loginAward[EAward.Change].Date) do
    for i = 1, this.MaxItem do
      if not table.Contains(changeItems, v.itemId[i]) and v.itemId[i] > 0 then
        table.insert(changeItems, v.itemId[i]);
      end
    end
  end
end

function UILoginAward.CheckConvertItem(itemId)
  for k, v in pairs(changeItems) do
    if itemId == v then
      return true;
    end
  end

  return false;
end

function UILoginAward.ViewItemInfo(itemId)
  UIItemInfo.Show(itemId);
end

function UILoginAward.ShowAwardInfo(kind, val)
  local itemId = loginAward[kind].Date[val].itemId[1];

  this.ViewItemInfo(itemId);
end

function UILoginAward.CheckChangeItem(index, bAllData)
  local itemCount, demand;
  local result = false;
  local award;

  if bAllData then
    award = loginAward[EAward.Change].Date[index];
  else
    award = changeAward[index];
  end

  if award == nil then return false end

  local itemData;
  local bag = Item.GetBag(EThings.Bag);
  local changeCount = -1;

  for i = 1, this.MaxItem do
    itemData = itemDatas[award.itemId[i]];
    itemCount = 0;

    if itemData ~= nil and award.itemId[i] > 0 then
      if itemData:IsRoleCountException() then
        itemCount = RoleCount.Get(itemData.roleCountIndex);
        demand = itemData.roleCountValue * award.quant[i];
      else
        if award.itemId[i] == 65301 then
          itemCount = Role.GetPoint();
        elseif award.itemId[i] == 65351 then
          itemCount = Role.GetPlayerGold();
        elseif  award.itemId[i] == 65343 then  --吞食幣
          itemCount = Role.GetPlayerCurrency(ECurrency.TS);
        else
          for k, bagInfo in pairs(bag) do
            if bagInfo ~= nil and bagInfo.Id == award.itemId[i] and bagInfo.quant > 0 then
              itemCount = itemCount + bagInfo.quant;
            end
          end
        end
        
        demand = award.quant[i];
      end

      if changeCount < 0 then
        changeCount = math.floor(itemCount / demand);
      else
        changeCount = math.min(math.floor(itemCount / demand), changeCount);
      end

      if itemCount < demand then
        result = true;
        break;
      end
    end
  end

  return result, changeCount;
end

function UILoginAward.CheckLockEquip(index)
  local fitType = true;
  local v = changeAward[index];

  if v == nil then return true end

  local unLockCount = 0;
  for i = 1, this.MaxItem do
    local itemId = v.itemId[i];
    local itemData = itemDatas[itemId];

    if itemData ~= nil and itemId > 0 then
      if Item.IsTypeOfEquips(itemData.fitType) then
        for i = 1, Item.MaxThingGrid do
          local itemSave = Item.GetBagItem(EThings.Bag, i);
          if itemSave ~= nil and itemSave.Id == itemId and not itemSave.isLock then
            unLockCount = unLockCount + 1;
          end
        end
      else
        fitType = false;
      end
    end

    if fitType and unLockCount <= 0 then
      return false;
    end
  end

  return true;
end

function UILoginAward.GetPng(rawImageBg)
  if rawImageBg.texture == nil then
    TextureManager.SetPng(ETextureUseType.UI, "common0_icon059", rawImageBg);
  end
end

function UILoginAward.GetRandomeCoverPng()
  if rawImgame_Cover == nil then return end

  TextureManager.SetPng(ETextureUseType.UI, images[math.random(1, table.Count(images))], rawImgame_Cover);
end

function UILoginAward.GetPrizeEndTime(id)
  for k, v in pairs(prizeDatas) do
    if v.id == id then
      return v.endTime;
    end
  end

  return nil;
end

function UILoginAward.CalLeftTime(kind, textFiled)
  if loginAward[kind] == nil then return end
  if textFiled == nil then return end

  if kind > this.BasePrize then
    local endTime = this.GetPrizeEndTime(kind - this.BasePrize);
    if endTime ~= nil then
      leftTime[kind] = endTime;
    else
      return;
    end
  else
    local activityTimeId = this.GetActivityTime(kind);

    if activityTimeId <= 0 then return end

    leftTime[kind] = this.GetEndTime(activityTimeId);
    if leftTime[kind] == nil then return end
  end

  if DateTime.Compare(leftTime[kind], CGTimer.serverTime) > 0 then
    local difftime = DateTime.Subtract(leftTime[kind], CGTimer.serverTime).TotalSeconds;

    if difftime <= 60 then
      textFiled.text = string.format(string.Get(21262), math.floor(difftime));
    else
      local day = math.floor(difftime / 60 / 60 / 24);
      difftime = difftime - 3600 * 24 * day;
      local hour = math.floor(difftime / 60 / 60);
      difftime = difftime - 3600 * hour;
      local minute = math.floor(difftime / 60);
      textFiled.text = string.Concat(string.Get(20644), string.format(string.Get(20996), day, hour, minute));
    end
  else
    textFiled.text = string.Get(60065);
  end
end

function UILoginAward.GetEndTime(activityTimeId)
  if activityTimeId <= 0 or activityTimes[activityTimeId] == nil then
    return nil;
  else
    return DateTime.New(
      activityTimes[activityTimeId][1].endYear,
      activityTimes[activityTimeId][1].endMonth,
      activityTimes[activityTimeId][1].endDay,
      activityTimes[activityTimeId][1].endHour,
      activityTimes[activityTimeId][1].endMinute,
      0
    );
  end
end

function UILoginAward.GetStartTime(activityTimeId)
  if activityTimeId <= 0 or activityTimes[activityTimeId] == nil then
    return nil;
  else
    return DateTime.New(
      activityTimes[activityTimeId][1].startYear,
      activityTimes[activityTimeId][1].startMonth,
      activityTimes[activityTimeId][1].startDay,
      activityTimes[activityTimeId][1].startHour,
      activityTimes[activityTimeId][1].startMinute,
      0
    );
  end
end

function UILoginAward.GetAccBack()
  local accBack = 0;

  if loginAward[EAward.Back] == nil then return end

  for i = 1, this.MaxBack do
    if loginAward[EAward.Back].Date[i] ~= nil then
      accBack = accBack + RoleCount.Get(loginAward[EAward.Back].Date[i].roleCount);
    end
  end

  return accBack;
end

function UILoginAward.GetActiveBackDay()
  local activityTimeId = this.GetActivityTime(EAward.Back);

  if activityTimeId <= 0 then return 0 end

  local backStartTime = DateTime.New(
    activityTimes[activityTimeId][1].startYear,
    activityTimes[activityTimeId][1].startMonth,
    activityTimes[activityTimeId][1].startDay,
    activityTimes[activityTimeId][1].startHour,
    activityTimes[activityTimeId][1].startMinute,
    0
  );

  local difftime = DateTime.Subtract(CGTimer.serverTime, backStartTime).TotalSeconds;

  return math.ceil(difftime / 60 / 60 / 24);
end

function UILoginAward.GetOnlineTime()
  local onlineSec = math.ceil((CGTimer.serverTime - CGTimer.onlineTime).TotalSeconds) + RoleCount.Get(ERoleCount.OnlineTime);

  return math.floor(onlineSec / 60);
end
function UILoginAward.IsInTime(kind)
  if loginAward[kind] == nil then return false end

  local activityTimeId = this.GetActivityTime(kind);

  if activityTimeId <= 0 then return false end

  local leftTime = this.GetEndTime(activityTimeId);
  if leftTime == nil then return false end
  local diffEnd = DateTime.Compare(leftTime, CGTimer.serverTime);

  local startTime = this.GetStartTime(activityTimeId);
  if startTime == nil then return false end
  local diffStart = DateTime.Compare(CGTimer.serverTime, startTime);

  if diffEnd > 0 and diffStart > 0 then
    local openDay = activityTimes[activityTimeId][1].openDay;
    local openDays = UIActivity.intTobit(openDay);

    if openDay > 0 then
      if openDays[UIActivity.GetDayOfWeek(tostring(CGTimer.serverTime.DayOfWeek))] == 1 then
        return true;
      else
        return false;
      end
    else
      return true;
    end

  else
    return false;
  end
end

function UILoginAward.GetActivityTime(kind)
  for k, v in pairs(loginAwardTagDatas) do
    if v.kind == kind then
      return v.activityTime;
    end
  end

  return 0;
end

function UILoginAward.OnOpen(tag)
  --開介面時先去要一次Sever時間校正
  Network.Send(1, 16);

  this.IninPlayerPrizeData();
  this.GetAwardData();
  this.ImportPrize();
  inputField_Code.text = "";
  this.ResetScratchData();
  this.UpdateTagData();

  if tag ~= nil then
    currentTag = tag;
  else
    currentTag = 1;
  end

  this.UpdateUI(currentTag);

  CGTimer.AddListener(this.UpdateOnlineTime, 1, true);
  CGTimer.AddListener(this.UpdateLeftSaveTime, 1, true);
  CGTimer.AddListener(this.UpdateLeftSoulTime, 1, true);
  CGTimer.AddListener(this.UpdateLeftConsumeTime, 1, true);
  CGTimer.AddListener(this.UpdateLeftLottoNpcTime, 1, true);
  CGTimer.AddListener(this.UpdateLeftLottoCardTime, 1, true);
  CGTimer.AddListener(this.UpdateLeftStagePassTime, 1, true);
  CGTimer.AddListener(this.UpdateLeftClassAwardTime, 1, true);
  CGTimer.AddListener(this.UpdateLeftActLoginTime, 1, true);
  CGTimer.AddListener(this.UpdateLeftActAccLoginTime, 1, true);
  CGTimer.AddListener(this.UpdateLeftReturnLoginTime, 1, true);
  CGTimer.AddListener(this.UpdateLeftSwimmingTime, 1, true);
  CGTimer.AddListener(this.UpdateLeftReUseActTime, 1, true);
  CGTimer.AddListener(this.UpdateLeftReUseAct_2, 1, true);
  CGTimer.AddListener(this.UpdateLeftReUseAct_3, 1, true);
  CGTimer.AddListener(this.UpdateLeftReUseAct_4, 1, true);
  CGTimer.AddListener(this.UpdateLeftReUseAct_5, 1, true);
  CGTimer.AddListener(this.UpdateLeftReUseAct_6, 1, true);
  CGTimer.AddListener(this.UpdateLeftCollect, 1, true);
  CGTimer.AddListener(this.UpdateLeftPoke, 1, true);
  CGTimer.AddListener(this.UpdateLeftFurnaceTime, 1, true);
  CGTimer.AddListener(this.UpdateLeftBackTime, 1, true);
  CGTimer.AddListener(this.UpdateLeftSupportArmyTime, 1, true);
  CGTimer.AddListener(this.UpdateLeftDragonBoxTime, 1, true);
  CGTimer.AddListener(this.UpdateLeftMoneyTreeTime, 1, true);
  CGTimer.AddListener(this.UpdateLeftDoubleSaveTime, 1, true);
  CGTimer.AddListener(this.UpdatePrize_1, 1, true);
  CGTimer.AddListener(this.UpdatePrize_2, 1, true);
  CGTimer.AddListener(this.UpdatePrize_3, 1, true);
  CGTimer.AddListener(this.UpdatePrize_4, 1, true);
  CGTimer.AddListener(this.UpdatePrize_5, 1, true);
  CGTimer.AddListener(this.UpdatePrize_6, 1, true);
  CGTimer.AddListener(this.UpdatePrize_7, 1, true);
  CGTimer.AddListener(this.UpdatePrize_8, 1, true);

  this.RemoveExpiredRedDot();

  this.ActivePrizeRedDot();

  this.GetPlayerPrizeData();

  return true;
end

function UILoginAward.GetPlayerPrizeData()
  for k, v in pairs(prizeDatas) do
    if v.isStop == false then
      sendBuffer:Clear();
      sendBuffer:WriteUInt32(v.id);
      Network.Send(98, 2, sendBuffer);
    end
  end
end

function UILoginAward.ActivePrizeRedDot()
  if this.FirstPrizeRedDot then return end

  for k, v in pairs(prizeDatas) do
    local diffStart = DateTime.Compare(CGTimer.serverTime, v.startTime);
    local diffEnd = DateTime.Compare(v.endTime, CGTimer.serverTime);

    if v.isStop == false and diffStart > 0 and diffEnd > 0 then
      this.PrizeRedDot[v.id] = true;

      RedDot.Add(ERedDot.Prize_1 + v.id - 1);
    end
  end

  this.FirstPrizeRedDot = true;
end

function UILoginAward.IninPlayerPrizeData()
  if table.Count(PlayerPrizeDatas) >= 0 then
    for i = 1, this.MaxPrize do
      PlayerPrizeDatas[i] = {};
      PlayerPrizeDatas[i].id = 0;
      PlayerPrizeDatas[i].totalSum = 0;
      PlayerPrizeDatas[i].daySum = 0;
      PlayerPrizeDatas[i].ruleValue = {};

      for j = 1, 7 do
        PlayerPrizeDatas[i].ruleValue[j] = 0;
      end
    end
  end
end

function UILoginAward.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(20067), this.OnClick_Close, this.OnClick_Help, this.OnClick_Tag, tagDatas, this.GetVisibleTag(currentTag), currentSubPage, this.CheckRedDot);
  end
end

function UILoginAward.OnClick_Help(checkShow)
  if currentTag == EUITag.Exp then
    if checkShow ~= true then
      UI.Open(UITutorialHint, 14, this);
    end
  elseif currentTag == EUITag.Scratch then
    if checkShow ~= true then
      UI.Open(UITutorialHint, 36, this);
    end
  elseif currentTag == EUITag.ConsumeScratch then
    if checkShow ~= true then
      UI.Open(UITutorialHint, 39, this);
    end
  elseif currentTag == EUITag.Furnace then
    if checkShow ~= true then
      UI.Open(UITutorialHint, 37, this);
    end
  elseif currentTag == EUITag.MoneyTree then
    if checkShow ~= true then
      UI.Open(UITutorialHint, 38, this);
    end
  elseif currentTag == EUITag.Poke then
    if checkShow ~= true then
      UI.Open(UITutorialHint, 41, this);
    end
  elseif currentTag == EUITag.ReUseAct_4 then
    if checkShow ~= true then
      UI.Open(UITutorialHint, 73, this);
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
  elseif currentTag == EUITag.ReUseAct_5 then
    if checkShow ~= true then
      UI.Open(UITutorialHint, 74, this);
    end
  elseif currentTag == EUITag.ReUseAct_6 then
    if checkShow ~= true then
      UI.Open(UITutorialHint, 75, this);
    end
  else
    return false;
  end

  return true;
end

function UILoginAward.CheckRedDot(mTag, subTag)
  if mainTag == mTag then
    return false;
  else
    mainTag = mTag;
  end

  mainTag = this.GetCurrentTag(mainTag);

  if mainTag == EUITag.Login then
    return RedDot.Check(ERedDot.LogainAward);
  elseif mainTag == EUITag.Online then
    return RedDot.Check(ERedDot.Online);
  elseif mainTag == EUITag.OpenServer then
    return RedDot.Check(ERedDot.OpenServer);
  elseif mainTag == EUITag.Save then
    return RedDot.Check(ERedDot.Save);
  elseif mainTag == EUITag.SoulGacha then
    return RedDot.Check(ERedDot.SoulGacha);
  elseif mainTag == EUITag.Back then
    return RedDot.Check(ERedDot.Back);
  elseif mainTag == EUITag.Change then
    if subTag ~= nil then
      return changeSubTagRedDot[subTag];
    else
      return RedDot.Check(ERedDot.Change);
    end
  elseif mainTag == EUITag.SupportArmy then
    return RedDot.Check(ERedDot.SupportArmy);
  elseif mainTag == EUITag.Exp then
    return RedDot.Check(ERedDot.OffLineExp);
  elseif mainTag == EUITag.Consume then
    return RedDot.Check(ERedDot.Consume);
  elseif mainTag == EUITag.LottoNpc then
    return RedDot.Check(ERedDot.LottoNpc);
  elseif mainTag == EUITag.LottoCard then
    return RedDot.Check(ERedDot.LottoCard);
  elseif mainTag == EUITag.Furnace then
    return RedDot.Check(ERedDot.Furnace);
  elseif mainTag == EUITag.DragonBox then
    return RedDot.Check(ERedDot.DragonBox);
  elseif mainTag == EUITag.DoubleSave then
    return RedDot.Check(ERedDot.DoubleSave);
  elseif mainTag == EUITag.Scratch then
    return RedDot.Check(ERedDot.Scratch);  
  elseif mainTag == EUITag.ConsumeScratch then
  return RedDot.Check(ERedDot.ConsumeScratch);
  elseif mainTag == EUITag.Poke then
    return RedDot.Check(ERedDot.Poke);
  elseif mainTag == EUITag.StagePass then
    return RedDot.Check(ERedDot.StagePass);
  elseif mainTag == EUITag.ClassAward then
    return RedDot.Check(ERedDot.ClassAward);
  elseif mainTag == EUITag.ActLogin then
    return RedDot.Check(ERedDot.ActLogin);
  elseif mainTag == EUITag.ActAccLogin then
    return RedDot.Check(ERedDot.ActAccLogin);
  elseif mainTag == EUITag.ReturnLogin then
    return RedDot.Check(ERedDot.ReturnLogin);
  elseif mainTag == EUITag.Swimming then
    return RedDot.Check(ERedDot.Swimming);
  elseif mainTag == EUITag.ReUseAct_1 then
    return RedDot.Check(ERedDot.ReUseAct_1);
  elseif mainTag == EUITag.ReUseAct_2 then
    return RedDot.Check(ERedDot.ReUseAct_2);
  elseif mainTag == EUITag.ReUseAct_3 then
    return RedDot.Check(ERedDot.ReUseAct_3);
  elseif mainTag == EUITag.ReUseAct_4 then
    return RedDot.Check(ERedDot.ReUseAct_4);
  elseif mainTag == EUITag.ReUseAct_5 then
    return RedDot.Check(ERedDot.ReUseAct_5);
  elseif mainTag == EUITag.ReUseAct_6 then
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
    return RedDot.Check(ERedDot.ReUseAct_6);
  elseif mainTag == EUITag.Collect then
    return RedDot.Check(ERedDot.Collect);
  elseif mainTag == EUITag.Prize_1 then
    return RedDot.Check(ERedDot.Prize_1);
  elseif mainTag == EUITag.Prize_2 then
    return RedDot.Check(ERedDot.Prize_2);
  elseif mainTag == EUITag.Prize_3 then
    return RedDot.Check(ERedDot.Prize_3);
  elseif mainTag == EUITag.Prize_4 then
    return RedDot.Check(ERedDot.Prize_4);
  elseif mainTag == EUITag.Prize_5 then
    return RedDot.Check(ERedDot.Prize_5);
  elseif mainTag == EUITag.Prize_6 then
    return RedDot.Check(ERedDot.Prize_6);
  elseif mainTag == EUITag.Prize_7 then
    return RedDot.Check(ERedDot.Prize_7);
  elseif mainTag == EUITag.Prize_8 then
    return RedDot.Check(ERedDot.Prize_8);
  end

  return false;
end

function UILoginAward.CheckShowRedDot()
  if this.IsInTime(EAward.DoubleSave) then
    RedDot.Add(ERedDot.DoubleSave);
  end
end

function UILoginAward.UpdateScratchRedDot()
  if this.IsInTime(EAward.Scratch) then
    if RoleCount.Get(ERoleCount.Scratch_Bonus) > 100 then 
      RedDot.Add(ERedDot.Scratch);
      return;
    end

    for k, v in pairs(scratchCardRoleCount)do 
      if RoleCount.Get(v) > 0 then 
        RedDot.Add(ERedDot.Scratch);
        return;
      end
    end
  end

  RedDot.Remove(ERedDot.Scratch);
end

function UILoginAward.UpdateConsumeScratchRedDot()
  if this.IsInTime(EAward.ConsumeScratch) then
    if RoleCount.Get(ERoleCount.CScratch_Bonus) > 200 then 
      RedDot.Add(ERedDot.ConsumeScratch);
      return;
    end

    for k, v in pairs(consumeScratchCardRoleCount)do 
      if RoleCount.Get(v) > 0 then 
        RedDot.Add(ERedDot.ConsumeScratch);
        return;
      end
    end
  end

  RedDot.Remove(ERedDot.ConsumeScratch);
end

function UILoginAward.OnClick_Tag(mainTag, subTag)
  currentTag = this.GetCurrentTag(mainTag);
  currentSubPage = subTag;

  if currentTag == EUITag.SupportArmy then
    this.QuertySupportArmy();
    scrollContent_SupportArmy:Reset(table.maxn(loginAward[EAward.SupportArmy].Date));
  elseif currentTag == EUITag.DoubleSave then
    RedDot.Remove(ERedDot.DoubleSave);
  elseif currentTag == EUITag.MoneyTree then
    Network.Send(87, 5);
  elseif Contains(currentTag, EUITag.ReUseAct_1, EUITag.ReUseAct_2, EUITag.ReUseAct_3, EUITag.ReUseAct_4, EUITag.ReUseAct_5, EUITag.ReUseAct_6) then
    reUseActTitle = this.GetTitleString();
    reUseActContent = this.GetContentString();

    if currentTag == EUITag.ReUseAct_4 then
      RedDot.Remove(ERedDot.ReUseAct_4);
    end

    if currentTag == EUITag.ReUseAct_5 then
      RedDot.Remove(ERedDot.ReUseAct_5);
    end

    if currentTag == EUITag.ReUseAct_6 then
      RedDot.Remove(ERedDot.ReUseAct_6);
    end
  elseif currentTag == EUITag.Collect then
    sendBuffer:Clear();
    sendBuffer:WriteByte(EAward.Collect);
    Network.Send(87, 1, sendBuffer);
  elseif currentTag == EUITag.Change then
    table.Clear(changeAward);

    for k, v in pairs(loginAward[EAward.Change].Date) do
      if v ~= nil and currentSubPage == math.floor(v.day / 100) then
        table.insert(changeAward, v)
      end
    end

    scrollContent_Change:Reset(table.Count(changeAward));
  end

  this.UpdateUI();

  return true;
end

function UILoginAward.GetCurrentTag(mainTag)
  local result = 0;
  local index = 0;

  for k, v in pairs(loginAwardTagDatas) do
    if v.actSort == mainTag and this.IsInTime(v.tag) then
      result = v.tag;
    end
  end

  if result == 0 then
    for k, v in pairs(loginAwardTagDatas) do
      if v.actSort > 0 then
        index = index + 1;
        if index == mainTag then
          return v.tag;
        end
      end
    end
  end

  return result;
end

function UILoginAward.GetVisibleTag(currentTag)
  for k, v in pairs(loginAwardTagDatas) do
    if v.tag == currentTag then
      return v.actSort;
    end
  end

  return currentTag;
end

function UILoginAward.CheckCrossDay()
  local reOpen = false;

  if currentTag == EUITag.Save then
    reOpen = not this.IsInTime(EAward.Save);
  elseif currentTag == EUITag.SoulGacha then
    reOpen = not this.IsInTime(EAward.SoulGacha);
  elseif currentTag == EUITag.Back then
    reOpen = not this.IsInTime(EAward.Back);
  elseif currentTag == EUITag.Change then
    reOpen = not this.IsInTime(EAward.Change);
  elseif currentTag == EUITag.SupportArmy then
    reOpen = not this.IsInTime(EAward.SupportArmy);
  elseif currentTag == EUITag.Consume then
    reOpen = not this.IsInTime(EAward.Consume);
  elseif currentTag == EUITag.LottoNpc then
    reOpen = not this.IsInTime(EAward.LottoNpc);
  elseif currentTag == EUITag.LottoCard then
    reOpen = not this.IsInTime(EAward.LottoCard);
  elseif currentTag == EUITag.Furnace then
    reOpen = not this.IsInTime(EAward.Furnace);
  elseif currentTag == EUITag.Poke then
    reOpen = not this.IsInTime(EAward.Poke);
  elseif currentTag == EUITag.StagePass then
    reOpen = not this.IsInTime(EAward.StagePass);
  elseif currentTag == EUITag.ClassAward then
    reOpen = not this.IsInTime(EAward.ClassAward);
  elseif currentTag == EUITag.ActLogin then
    reOpen = not this.IsInTime(EAward.ActLogin);
  elseif currentTag == EUITag.ActAccLogin then
    reOpen = not this.IsInTime(EAward.ActAccLogin);
  elseif currentTag == EUITag.ReturnLogin then
    reOpen = not this.IsInTime(EAward.ReturnLogin);
  elseif currentTag == EUITag.Swimming then
    reOpen = not this.IsInTime(EAward.Swimming);
  elseif currentTag == EUITag.ReUseAct_1 then
    reOpen = not this.IsInTime(EAward.ReUseAct_1);
  elseif currentTag == EUITag.ReUseAct_2 then
    reOpen = not this.IsInTime(EAward.ReUseAct_2);
  elseif currentTag == EUITag.ReUseAct_3 then
    reOpen = not this.IsInTime(EAward.ReUseAct_3);
  elseif currentTag == EUITag.ReUseAct_4 then
    reOpen = not this.IsInTime(EAward.ReUseAct_4);
  elseif currentTag == EUITag.ReUseAct_5 then
    reOpen = not this.IsInTime(EAward.ReUseAct_5);
  elseif currentTag == EUITag.ReUseAct_6 then
    reOpen = not this.IsInTime(EAward.ReUseAct_6);
  elseif currentTag == EUITag.Collect then
    reOpen = not this.IsInTime(EAward.Collect);
  elseif currentTag > this.BasePrize then
    local endTime = this.GetPrizeEndTime(currentTag - this.BasePrize);

    this.ClearEveryDayTotalSum();

    if DateTime.Compare(endTime, CGTimer.serverTime) > 0 then
      if UI.IsVisible(UILoginAward) then
        this.GetPlayerPrizeData();
      end
    else
      this.RefreshPrizeUI();
    end
  end

  if reOpen then
    UI.Close(UILoginAward);
    
    if Network.InUnbound then return end
    UI.Open(UILoginAward);
  end

  RedDot.Remove(ERedDot.Online);

  this.RemoveExpiredRedDot();
end

function UILoginAward.ClearEveryDayTotalSum()
  local serial = 0;

  for k, v in pairs(prizeDatas) do
    if v.wcheck[ESpecSet.ClearByDay] then
      serial = v.id;

      if serial > 0 and PlayerPrizeDatas[serial] ~= nil then
        PlayerPrizeDatas[serial].totalSum = 0;
      end
    end
  end

  if PlayerPrizeDatas[EActKind.ContConsume] ~= nil then
    PlayerPrizeDatas[EActKind.ContConsume].daySum = 0;
  end

  if PlayerPrizeDatas[EActKind.DayCondition] ~= nil then
    PlayerPrizeDatas[EActKind.DayCondition].daySum = 0;
  end
end

function UILoginAward.RemoveExpiredRedDot()
  for k, v in pairs(loginAwardTagDatas) do
    if v.activityTime > 0 and not this.IsInTime(v.kind) then
      if v.kind == EAward.Save then
        RedDot.Remove(ERedDot.Save);
      elseif v.kind == EAward.SoulGacha then
        RedDot.Remove(ERedDot.SoulGacha);
      elseif v.kind == EAward.Back then
        RedDot.Remove(ERedDot.Back);
      elseif v.kind == EAward.Change then
        RedDot.Remove(ERedDot.Change);
        table.Clear(changeSubTagRedDot);
      elseif v.kind == EAward.SupportArmy then
        RedDot.Remove(ERedDot.SupportArmy);
      elseif v.kind == EAward.Consume then
        RedDot.Remove(ERedDot.Consume);
      elseif v.kind == EAward.LottoNpc then
        RedDot.Remove(ERedDot.LottoNpc);
      elseif v.kind == EAward.LottoCard then
        RedDot.Remove(ERedDot.LottoCard);
      elseif v.kind == EAward.Furnace then
        RedDot.Remove(ERedDot.Furnace);
      elseif v.kind == EAward.DragonBox then
        RedDot.Remove(ERedDot.DragonBox);
      elseif v.kind == EAward.Scratch then 
        RedDot.Remove(ERedDot.Scratch);
      elseif v.kind == EAward.Poke then
        RedDot.Remove(ERedDot.Poke);
      elseif v.kind == EAward.StagePass then
        RedDot.Remove(ERedDot.StagePass);
      elseif v.kind == EAward.ClassAward then
        RedDot.Remove(ERedDot.ClassAward);
      elseif v.kind == EAward.ActLogin then
        RedDot.Remove(ERedDot.ActLogin);
      elseif v.kind == EAward.ActAccLogin then
        RedDot.Remove(ERedDot.ActAccLogin);
      elseif v.kind == EAward.ReturnLogin then
        RedDot.Remove(ERedDot.ReturnLogin);
      elseif v.kind == EAward.Swimming then
        RedDot.Remove(ERedDot.Swimming);
      elseif v.kind == EAward.ReUseAct_1 then
        RedDot.Remove(ERedDot.ReUseAct_1);
      elseif v.kind == EAward.ReUseAct_2 then
        RedDot.Remove(ERedDot.ReUseAct_2);
      elseif v.kind == EAward.ReUseAct_3 then
        RedDot.Remove(ERedDot.ReUseAct_3);
      elseif v.kind == EAward.ReUseAct_4 then
        RedDot.Remove(ERedDot.ReUseAct_4);
      elseif v.kind == EAward.ReUseAct_5 then
        RedDot.Remove(ERedDot.ReUseAct_5);
      elseif v.kind == EAward.ReUseAct_6 then
        RedDot.Remove(ERedDot.ReUseAct_6);
      elseif v.kind == EAward.Collect then
        RedDot.Remove(ERedDot.Collect);
      elseif v.kind == EAward.ConsumeScratch then 
        RedDot.Remove(ERedDot.ConsumeScratch);        
      end
    end
  end
end

function UILoginAward.GetKeyByvalue(t, value)
  if t == nil then return nil end

  for k, v in pairs(t) do
    if v.kind == value then
      return k;
    end
  end

  return nil;
end

function UILoginAward.GeLoginAwardKeyByvalue(t, value)
  if t == nil then return nil end

  for k, v in pairs(t) do
    if v.kind == value then
      return k;
    end
  end

  return nil;
end

function UILoginAward.OnClick_Close()
  CGTimer.RemoveListener(this.UpdateOnlineTime);
  CGTimer.RemoveListener(this.UpdateLeftSaveTime);
  CGTimer.RemoveListener(this.UpdateLeftSoulTime);
  CGTimer.RemoveListener(this.UpdateLeftConsumeTime);
  CGTimer.RemoveListener(this.UpdateLeftLottoNpcTime);
  CGTimer.RemoveListener(this.UpdateLeftLottoCardTime);
  CGTimer.RemoveListener(this.UpdateLeftStagePassTime);
  CGTimer.RemoveListener(this.UpdateLeftClassAwardTime);
  CGTimer.RemoveListener(this.UpdateLeftActLoginTime);
  CGTimer.RemoveListener(this.UpdateLeftActAccLoginTime);
  CGTimer.RemoveListener(this.UpdateLeftReturnLoginTime);
  CGTimer.RemoveListener(this.UpdateLeftSwimmingTime);
  CGTimer.RemoveListener(this.UpdateLeftReUseActTime);
  CGTimer.RemoveListener(this.UpdateLeftReUseAct_2);
  CGTimer.RemoveListener(this.UpdateLeftReUseAct_3);
  CGTimer.RemoveListener(this.UpdateLeftReUseAct_4);
  CGTimer.RemoveListener(this.UpdateLeftReUseAct_5);
  CGTimer.RemoveListener(this.UpdateLeftReUseAct_6);
  CGTimer.RemoveListener(this.UpdateLeftCollect);
  CGTimer.RemoveListener(this.UpdateLeftPoke);
  CGTimer.RemoveListener(this.UpdateLeftFurnaceTime);
  CGTimer.RemoveListener(this.UpdateLeftBackTime);
  CGTimer.RemoveListener(this.UpdateLeftSupportArmyTime);
  CGTimer.RemoveListener(this.UpdateLeftDragonBoxTime);
  CGTimer.RemoveListener(this.UpdateLeftMoneyTreeTime);
  CGTimer.RemoveListener(this.UpdateLeftDoubleSaveTime);
  CGTimer.RemoveListener(this.UpdateMoneyTreeSlider);
  CGTimer.RemoveListener(this.UpdatePrize_1);
  CGTimer.RemoveListener(this.UpdatePrize_2);
  CGTimer.RemoveListener(this.UpdatePrize_3);
  CGTimer.RemoveListener(this.UpdatePrize_4);
  CGTimer.RemoveListener(this.UpdatePrize_5);
  CGTimer.RemoveListener(this.UpdatePrize_6);
  CGTimer.RemoveListener(this.UpdatePrize_7);
  CGTimer.RemoveListener(this.UpdatePrize_8);

  AnimationController.Destory(this.ScratchAnimationKind);

  this.ClearOldPrizeData();

  UI.Close(UILoginAward);

  Announcement.CheckOpenUI();

  return true;
end

function UILoginAward.ClearOldPrizeData()
  for k, v in pairs(prizeDatas) do
    local key = this.GetKeyByvalue(loginAwardTagDatas, v.id + this.BasePrize);
    if key ~= nil then
      table.remove(loginAwardTagDatas, key);
    end

    table.Clear(loginAward[v.id + this.BasePrize]);
  end
end

function UILoginAward.CheckOpenExp()
  if Network.CheckServerSwitch(EServerSwitch.Review) then return end
  if Network.CheckServerSwitch(EServerSwitch.GameShow) then return end
  if not MarkManager.GetMissionFlag(11804) then return end

  if RoleCount.Get(ERoleCount.OffLine_Exp) > 0 then

    local tag = this.GetOffLineTag()

    if tag > 0 then
      this.GetServerExpDatas();
    end
  end
end

function UILoginAward.GetOffLineTag()
  for k, v in pairs(loginAwardTagDatas) do
    if v.kind == EAward.Exp then
      return v.sort;
    end
  end

  return 0;
end

function UILoginAward.Clear()
  this.FirstPrizeRedDot = false;
end

--S:098-001 L(4) + <<活動編號(4) +
--                   actType(4) +
--                   actKind(4) +
--                   開始時間(8) +
--                   結束時間(8) +
--                   目前這活動是否關閉(1) +
--                   L(1) + 活動名稱(L) +
--                   L(4) + <<lowp(4) + highp(4) + L(4) +<<物品編號(2) + 數量(4) + L(4) + <<保留(4)>> >>
--                   L(4) +<<物品編號(2) + 數量(4) >> +
--                   L(4) + << check(1)>> +
--                   L(4) + 保留(4) >>
function UILoginAward.RecivePrize(data)
  local count = data:ReadUInt32();
  for i = 1, count do
    local id = data:ReadUInt32();
    local actType = data:ReadUInt32();
    local actKind = data:ReadUInt32();
    local startTime = DateTime.FromOADate(data:ReadDouble());
    local endTime = DateTime.FromOADate(data:ReadDouble());
    local isStop = data:ReadBoolean();
    local len = data:ReadByte();
    local title = data:ReadString(len);

    prizeDatas[i] = {};
    prizeDatas[i].id = id;
    prizeDatas[i].actType = actType;
    prizeDatas[i].actKind = actKind;
    prizeDatas[i].startTime = startTime;
    prizeDatas[i].endTime = endTime;
    prizeDatas[i].isStop = isStop;
    prizeDatas[i].title = title;
    --logError(title)

    prizeDatas[i].actRule = {};
    for j = 1, data:ReadUInt32() do
      local lowp = data:ReadUInt32();
      local highp = data:ReadUInt32();
      prizeDatas[i].actRule[j] = {};
      prizeDatas[i].actRule[j].lowp = lowp;
      prizeDatas[i].actRule[j].highp = highp;

      local itemCount = data:ReadUInt32();
      prizeDatas[i].actRule[j].award = {};
      for k = 1, itemCount do
        local itemId = data:ReadUInt16();
        local count = data:ReadUInt32();
        prizeDatas[i].actRule[j].award[k] = {};
        prizeDatas[i].actRule[j].award[k].itemId = itemId;
        prizeDatas[i].actRule[j].award[k].count = count;
      end

      prizeDatas[i].actRule[j].reserve = {};
      local reserveCount = data:ReadUInt32();

      for l = 1, reserveCount do
        local reserve = data:ReadUInt32();
--        prizeDatas[i].actRule[j].reserve[l] = {};
--        prizeDatas[i].actRule[j].reserve[l] = reserve;  -- 暫時保留沒用
      end
    end

    prizeDatas[i].first = {};
    for j = 1, data:ReadUInt32() do
      prizeDatas[i].first[j] = {};
      prizeDatas[i].first[j].itemId = data:ReadUInt16();
      prizeDatas[i].first[j].count = data:ReadUInt32();
    end

    prizeDatas[i].wcheck = {};
    for j = 1, data:ReadUInt32() do
      prizeDatas[i].wcheck[j] = {};
      prizeDatas[i].wcheck[j] = data:ReadBoolean();
    end

    prizeDatas[i].reserve = {};
    for j = 1, data:ReadUInt32() do
      local reserve = data:ReadUInt32();
--      prizeDatas[i].reserve= reserve;  -- 暫時保留沒用
    end
  end

  this.RefreshPrizeUI();
end

--S:098-002 送玩家資料 serial(4) + TotalSum(4) + DaySum(4) + count(4) + <<ruleValye(2)>>
function UILoginAward.ReciveRolePrize(data)
  local id = data:ReadUInt32();

  PlayerPrizeDatas[id] = {};
  PlayerPrizeDatas[id].id = id;
  PlayerPrizeDatas[id].totalSum = data:ReadUInt32();
  PlayerPrizeDatas[id].daySum = data:ReadUInt32();
  PlayerPrizeDatas[id].ruleValue = {};

  for i = 1, data:ReadUInt32() do
    PlayerPrizeDatas[id].ruleValue[i] = data:ReadUInt16();
  end

  if UI.IsVisible(UILoginAward) then
    if currentTag > this.BasePrize then
    this.UpdateUI();
    end
  end
end

--S:098-003 關閉指定活動 +serial(4)
function UILoginAward.ReciveClosePrize(data)
  local stopId = data:ReadUInt32();

  if prizeDatas[stopId] ~= nil then
    prizeDatas[stopId].isStop = true;
  end

  this.RefreshPrizeUI();
end

--S:098-004 <全伺服器累計數值> +數量(1) <<+索引(1) +數值(8)>>
function UILoginAward.ReciveServerCollect(data)
  table.Clear(serverCollects);

  local len = data:ReadByte();

  for i = 1, len do
    serverCollects[i] = {};
    serverCollects[i].index = data:ReadByte();
    serverCollects[i].value = data:ReadUInt64();
  end

  if UI.IsVisible(UILoginAward) then
    this.UpdateUI();
  end

  this.UpdateRedDot();
end

function UILoginAward.RefreshPrizeUI()
  if UI.IsVisible(UILoginAward) then
    ShowCenterMessage(string.Get(21884));

    this.ClearOldPrizeData();

    UI.Close(UILoginAward);
  end
end