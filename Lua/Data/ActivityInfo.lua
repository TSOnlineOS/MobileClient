EActivity = {
  Halloween = 1, --萬聖節活動
  LoveBado = 2, --最愛巴豆妖活動
  FNpc_LvUp_HalfPrice = 3, --跟隨武將點數升級半價(未轉生)
  FNpc1_LvUp_HalfPrice = 4, --跟隨武將點數升級半價(一轉)
  FNpc2_LvUp_HalfPrice = 5, --跟隨武將點數升級半價(二轉)
  XMas2007 = 6, --2007聖誕活動
  XMasCashGif2007 = 7, --2007聖誕禮物雨活動
  NYCashGift = 8, --2004-2005跨年活動(禮物雨)
  HappyNewYearFire = 9, --2004-2005跨年活動(發放煙火&倒數計時)
  ValentineCashGift = 10, --2月14日情人節禮物雨
  TenBrother = 11, --2008 10兄弟活動(勇闖封魔陣)
  Cooking = 12, --2008農曆團員大辦桌活動
  CNYSlot = 13, --轉轉樂加倍送
  Lantern = 14, --燈籠元宵
  City1_AddPlume = 15, --城戰活動(代縣城)
  GovRequire = 16, --官府徵召(支援前線)
  Day77Valentine = 17, --7夕情人節
  MoonFestivalRabbit = 18, --中秋抓玉兔活動
  City2_AddPlume = 19, --城戰活動(真定城)
  City3_AddPlume = 20, --城戰活動(臨淄城)
  City4_AddPlume = 21, --城戰活動(琅琊城)
  City5_AddPlume = 22, --城戰活動(大漠城)
  MayDay = 23, --51勞動節活動
  Anniversary = 24, --周年慶活動
  SwapItem = 25, --活動兌換
  DragonBoatRace = 26, --划龍舟活動
  EpicBattle01 = 27, --史詩戰役01-黃巾平定戰
  EpicBattle02 = 28, --史詩戰役02-三英戰呂布
  DailyGift = 29, --每日逛商城福袋
  JudgmentTower = 30, --搶救二喬(試煉之塔)
  MixVS = 31, --團P
  ChaosVS = 32, --亂鬥擂台
  DareNpc = 33, --挑戰擂台賽
  KingOfTheWorld = 34, --世界BOSS競賽
  StoredValue = 35, --儲值送
  Consumption = 36, --消費反利
  JiugonggeFestival = 37, --九宮格節慶
  JiugonggeNew = 38, --九宮格新手
  JiugonggeRegular = 39, --九宮格每日
  HalfMonthCard = 40, --半月卡領獎
  FestivalSwap = 41, --節慶兌換
  ConsumptionGift = 42, --消費送
  WarriorLotteryGift = 43, --武將十抽送
  CardLotteryGift = 44, --卡片十抽送
  OrganizationFight = 45, --軍團據點戰
  CityScramble = 111, --城鎮爭霸
  BattlePass = 128, --通行證
}

ActivityInfo = {}
ActivityInfo.__index = ActivityInfo;

function ActivityInfo.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function ActivityInfo.New(reader)
  local self = {};
  setmetatable(self, ActivityInfo);
  
  self.Id = reader:ReadUInt16(); --活動ID
  self.lv = reader:ReadByte(); --活動限制等級
  local mainKind = reader:ReadByte(); --主類別
  local uiKind = reader:ReadByte(); --介面類別
  self.mainTag = reader:ReadUInt32(); --主類別名稱
  local subKind = reader:ReadByte(); --子類別
  self.subTag = reader:ReadUInt32(); --子類別名稱
  self.description = reader:ReadUInt32(); --活動說明
  self.kind = reader:ReadByte(); --活動種類
  self.awards = {};
  for i = 1, 5 do
    self.awards[i] = {};
    self.awards[i].kind = reader:ReadByte(); --獎勵種類
    self.awards[i].id = reader:ReadUInt16(); --顯示獎勵
  end

  self.bitFunction = reader:ReadByte();

  return uiKind, mainKind, subKind, self;
end

function ActivityInfo.Script1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function ActivityInfo.Script2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function ActivityInfo.Script3()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function ActivityInfo:GetMainTag()
  return string.Get(self.mainTag);
end

function ActivityInfo.Script4()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function ActivityInfo:GetSubTag()
  return string.Get(self.subTag);
end

function ActivityInfo.Script5()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function ActivityInfo.Script6()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function ActivityInfo:GetActivityName()
  return string.Get(self.subTag);
end

function ActivityInfo:GetDescription()
  return string.Get(self.description);
end

function ActivityInfo.Script7()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end