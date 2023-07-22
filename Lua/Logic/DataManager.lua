require "Common/DatReader"
require "Data/HumanData"
require "Data/PlayerInfo"
require "Data/Eve/EventData"
require "Data/MapData"
require "Data/WemData"
require "Data/ItemData"
require "Data/CommonAwardData"
require "Data/SceneData"
require "Data/NpcData"
require "Data/RankData"
require "Data/CityData"
require "Data/EVOStatusData"
require "Data/MarkData"
require "Data/AstrolabeData"
require "Data/SkillData"
require "Data/CompoundData"
require "Data/SuitData"
require "Data/FashionStressData"
require "Data/GoodsItemData"
require "Data/BlissBagData"
require "Data/WarpData"
require "Data/RandomNameData"
require "Data/LoginAwardData"
require "Data/LoginAwardTagData"
require "Data/AchievementData"
require "Data/ActivityInfo"
require "Data/ActivityTime"
require "Data/ActivityFeverTime"
require "Data/MountsData"
require "Data/TextureSizeData"
require "Data/TextureOffsetData"
require "Data/SceneFightData"
require "Data/LimitTimeDungeonData"
require "Data/AnotherWroldLvData"
require "Data/UISellData"
require "Data/ItemHintData"
require "Data/DungeonData"
require "Data/DispatchData"
require "Data/FunctionData"
require "Data/StoreValueData"
require "Data/TutorialData"
require "Data/ArmyData"
require "Data/WarriorCollectionData"
require "Data/ExchangeData"
require "Data/LeaderboardData"
require "Data/JiugonggeInfo"
require "Data/JiugonggeMissionData"
require "Data/CollectWarriorData"
require "Data/CollectWarriorSortData"
require "Data/CollectStyleData"
require "Data/CollectStyleValueData"
require "Data/CollectCardData"
require "Data/CollectCardSortData"
require "Data/CollectNFTData"
require "Data/FestivalInfo"
require "Data/FireworkPositionData"
require "Data/TitleData"
require "Data/TianGuanData"
require "Data/FurnaceSlotData"
require "Data/FurnaceSelectData"
require "Data/MoneyTreeData"
require "Data/ExclusiveWeaponData"
require "Data/FNpcSlotData"
require "Data/CityScrambleCityData"
require "Data/CityScrambleCityRewardData"
require "Data/CityScrambleGroundData"
require "Data/DataFightData"
require "Data/EQAffixData"
require "Data/EQReinforcedData"
require "Data/EQRateData"
require "Data/EQValueData"
require "Data/EternalDungeonPrizeData"
require "Data/EternalDungeonLayerData"
require "Data/FieldEffectData"
require "Data/SouvenirData"
require "Data/CharmRewardData"
require "Data/MonopolyCellRewardData"
require "Data/MissionAwardData"
require "Data/FurnitureData"
require "Data/FurnitureKindData"
require "Data/HouseEditorSceneSetData"
require "Data/HouseExpandConditionData"
require "Data/WarriorCombinationData"
require "Data/FurnitureCollectLevelData"
require "Data/NumberOfHouseWarriorData"
require "Data/SacredEquipPrimaryData"
require "Data/SacredEquipSubData"
require "Data/SacredEquipUpgradeData"
require "Data/ElfData"
require "Data/ElfExpData"
require "Data/BreakthroughData"
require "Data/FurnitureEffectData"
require "Data/SoulLevelData"
require "Data/SoulData"
require "Data/NpcSoulData"
require "Data/SacrificeSlotData"
require "Data/RequiemBossData"
require "Data/PassAwardData"


DataManager = {};
local this = DataManager;

if Define.TextCount then
  local textCount = 0;
  this.textCount = 0;
end

itemDatas = {};
commonAwardDatas = {};
sceneDatas = {};
npcDatas = {};
npcWeaponDatas = {};
rankDatas = {};
eveHeaderDatas = {};
evoStatusDatas = {};
mapHeaderDatas = {};
wemDatas = {};
markDatas = {};
bitMarkDatas = {};
talkDatas = {};
astrolabeDatas = {};
skillDatas = {};
compoundDatas = {};
suitDatas = {};
fashionStressDatas = {};
goodsSaleData = {};
goodsSaleTagData = {};
blissBagDatas = {};
luckyBagDatas = {};
navigationDatas = {};
warpDatas = {};
achievementDatas = {};
activityInfos = {};
activityTimes = {};
activityFeverTimes = {};
randomNameDatas = {};
loginAwardDatas = {};
loginAwardTagDatas = {};
achievementTagData = {};
mountsDatas = {};
mountsGrowDatas = {};
textDatas = {};
illegalDatas = {};
textureSizeDatas = {};
textureOffsetDatas = {};
dungeonDatas = {};
weekDungeonDatas = {}; --週副本資料
soulDungeonDatas = {}; --狂週副本資料
dungeonComboDatas = {};
uisellDatas = {};
itemHintDatas = {};
sceneFightDatas = {};
limitTimeDungeonDatas = {};
anotherWorldLvDatas = {};
lvUpDatas = {};
dispatchData = {};
dispatchBonusData = {};
functionDatas = {};
storeValueDatas = {};
tutorialDatas = {};
guideDatas = {};
tabooDatas = {};
armyArchitectureDatas = {};
armySignDatas = {};
armyAwardDatas = {};
armyProductionDatas = {};
warriorCollectionDatas = {};
leaderboardDatas = {};
leaderboardTagDatas = {};
npcUpgradeDatas = {};
exchangeDatas = {};
jiugonggeInfos = {};
jiugonggeMissions = {};
collectWarriorDatas = {};
collectWarriorSortDatas = {};
collectStyleDatas = {};
collectStyleValueDatas = {};
collectCardDatas = {};
collectCardSortDatas = {};
collectNFTDatas = {};
auctionTagDatas = {};
festivalInfos = {};
beStrongerDatas = {};
dungeonAreaDatas = {};
gsActivityDatas = {};
orgBossAwardDatas = {};
fireWorkPositionDatas = {};
titleDatas = {};
tianGuanDatas = {};
furnaceSlotDatas = {};
furnaceSelectDatas = {};
moneyTreeDatas = {};
itemEvolutionDatas = {};
dataFightGoalDatas = {};
dataFightAwardDatas = {};
fNpcSlotDatas = {};
exclusiveWeaponDatas = {};
cityScrambleCityDatas = {};
cityScrambleCityRewardDatas = {};
cityScrambleGroundDatas = {};
eqAffixDatas = {};
eqAffixAllDatas = {};
eqReinforcedDatas = {};
eqRateDatas = {};
eqValueDatas = {};
eternalDungeonPrizeDatas = {};
eternalDungeonLayerDatas = {};
fieldEffectDatas = {};
souvenirDatas = {};
charmRewardDatas = {};
furnitureDatas = {};
furnitureKindDatas = {};
houseEditorSceneSetDatas = {};
houseExpandConditionDatas = {};
warriorCombinationDatas = {};
furnitureCollectLevelDatas = {};
numberOfHouseWarriorDatas = {};
breakthroughDatas = {};
furnitureEffectDatas = {};

elfDatas = {};
elfExpDatas = {};
SacredEquipPrimaryDatas = {};
--SacredEquipSubDatas = {};
SacredEquipUpgradeDatas = {};
monopolyCellRewardDatas = {};
missionAwardDatas = {};
soulLevelDatas = {};
soulDatas = {};
npcSoulDatas = {};
sacrificeSlotDatas = {};
requiemBossDatas = {};
passAwardDatas = {};

--test
testNaviDatas = {};

this.initialized = false;

DataManager.talkDataPath = "CompreseData/Talk_C.dat";
DataManager.eveDataPath = "CompreseData/Eve.emg";
DataManager.mapDataPath = "CompreseData/Ground.mmg";

this.encoding_Unicode = nil;
this.encoding_Big5 = nil;
this.encoding_UTF8 = nil;

function DataManager.Initialize()
  this.encoding_Unicode = LuaHelper.GetEncoding(1200);
  this.encoding_Big5 = LuaHelper.GetEncoding(950);
  this.encoding_UTF8 = LuaHelper.GetEncoding(65001);

  this.LoadResourcePacked();
end

function DataManager.LoadResourcePacked()
  if Define.TextCount then
    this.textCount = 0;
  end

  log("Text");
  this.ReadData("Data/IOS_TextData_C.dat", this.OnLoadTextData);

  log("Talk");
  this.ReadData(DataManager.talkDataPath, this.OnLoadTalkData);

  log("eve");
  this.ReadData(DataManager.eveDataPath, this.OnLoadEveHeaderData);

  log("Ground");
  this.ReadData(DataManager.mapDataPath, this.OnLoadMapData);

  log("Wem");
  this.ReadData("Data/Wem.mmg", this.OnLoadWemData);
  
  log("Item");
  this.ReadData("Data/IOS_Item_C.dat", this.OnLoadItemData);
  
  log("CommonAwardData");
  this.ReadData("Data/IOS_CommonAward_C.dat", this.OnLoadCommonAwardData);
  
  log("SceneSet");
  this.ReadData("Data/IOS_SceneSet_C.dat", this.OnLoadSceneSetData);
  
  log("Npc");
  this.ReadData("Data/IOS_Npc_C.dat", this.OnLoadNpcData);
  
  log("WeapBody");
  this.ReadData("Data/IOS_WeapBody.dat", this.OnLoadNpcWeaponData);
  
  log("Rank");
  this.ReadData("Data/IOS_Rank.dat", this.OnLoadRankData);
  
  log("EVOStatus");
  this.ReadData("Data/IOS_EVOStatus.dat", this.OnLoadEVOStatusData);
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
  log("Mark");
  this.ReadData("Data/IOS_Mark_C.dat", this.OnLoadMarkData);
  
  log("MARK_STEP_C");
  this.ReadData("Data/IOS_MarkStep_C.dat", this.OnLoadMarkStepData);
  
  log("Formula");
  this.ReadData("Data/IOS_Formula.dat", this.OnLoadFormulaData);
  
  log("Astrolabe");
  this.ReadData("Data/IOS_Astrolabe.dat", this.OnLoadAstrolabeData);
  
  log("Skill");
  this.ReadData("Data/IOS_Skill_C.dat", this.OnLoadSkillData);
  
  log("FashionStress");
  this.ReadData("Data/IOS_FashionStress_C.dat", this.OnLoadFashionStressData);
  
  log("Suit");
  this.ReadData("Data/IOS_Suit_C.dat", this.OnLoadSuitData);
  
  log("GS");
  this.ReadData("Data/IOS_GS_C.dat", this.OnLoadGoodsSaleData);
  
  log("GSTag");
  this.ReadData("Data/IOS_GSTag_C.dat", this.OnLoadGoodsSaleTagData);
  
  log("BlissBag");
  this.ReadData("Data/IOS_BlissBag_C.dat", this.OnLoadBlissBagData);
  
  log("luckyBag");
  this.ReadData("Data/IOS_LuckyBag2_C.dat", this.OnLoadLuckyBagData);

  log("Warp");
  this.ReadData("Data/IOS_Warp_C.dat", this.OnLoadWarpData);

  log("RandomName");
  this.ReadData("Data/IOS_RandomName.dat", this.OnLoadRandomNameData);

  log("LoginAwardData");
  this.ReadData("Data/IOS_LoginAwardData_C.dat", this.OnLoadLoginAwardData);

  log("LoginAwardTagData");
  this.ReadData("Data/IOS_LoginAwardTagData_C.dat", this.OnLoadLoginAwardTagData);

  log("ACTag");
  this.ReadData("Data/IOS_ACTag_C.dat", this.OnLoadAchievementTagData);

  log("AchievementData_C");
  this.ReadData("Data/IOS_AchievementData_C.dat", this.OnLoadAchievementData);

  log("ActivityInfo_C");
  this.ReadData("Data/IOS_ActivityInfo_C.dat", this.OnLoadActivityInfo);

  log("ActivityTime_C")
  this.ReadData("Data/IOS_ActivityTime_C.dat", this.OnLoadActivityTime);

  log("ActivityFeverTime_C")
  this.ReadData("Data/IOS_ActivityFeverTime_C.dat", this.OnLoadActivityFeverTime);

  log("Mounts");
  this.ReadData("Data/IOS_Mounts_C.dat", this.OnLoadMountsData);

  log("MountsGrow");
  this.ReadData("Data/IOS_MountsGrow_C.dat", this.OnLoadMountsGrowData);

  log("Illegal");
  this.ReadData("Data/IOS_Illegal_C.dat", this.OnLoadIllegalData);

  log("TextureSize");
  this.ReadData("Data/IOS_TextureSize.dat", this.OnLoadTextureSizeData);

  log("TextureOffset");
  this.ReadData("Data/IOS_TextureOffset.dat", this.OnLoadTextureOffsetData);
  
  --this.ReadData("Data/Compound.Dat", this.OnLoadCompoundData);

  log("Dungeon");
  this.ReadData("Data/IOS_Dungeon_C.dat", this.OnLoadDungeonData);

  log("Dungeoncombo");
  this.ReadData("Data/IOS_DungeonCombo_C.dat", this.OnLoadDungeonComboData);

  log("SceneFightData");
  this.ReadData("Data/IOS_SceneFight_C.dat", this.OnLoadSceneFightData);

  log("LimitTimeDungeonData");
  this.ReadData("Data/IOS_LimitTimeDungeon_C.dat", this.OnLoadLimitTimeDungeonData);

  log("AnotherWorldLvData");
  this.ReadData("Data/IOS_AnotherWorldLv_C.dat", this.OnLoadAnotherWorldLvData);
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
  log("LvUp");
  this.ReadData("Data/IOS_LvUp_C.dat", this.LvUpData);

  log("DoorGroup");
  this.ReadData("Data/IOS_DoorGroupData.dat", this.OnLoadDoorGroupData);

  log("UISell");
  this.ReadData("Data/IOS_UISell_C.dat", this.OnLoadUISellData);

  log("ItemHint");
  this.ReadData("Data/IOS_ItemHint_C.dat", this.OnLoadUIItemHintData);

  log("Dispatch")
  this.ReadData("Data/IOS_Dispatch_C.dat", this.OnLoadDispatchData);

  log("DispatchBonusData")
  this.ReadData("Data/IOS_DispatchBonus_C.dat", this.OnLoadDispatchBonusData);

  log("MarkGroup");
  this.ReadData("Data/IOS_MarkGroupData.dat", this.OnLoadMarkGroupData);

  log("FunctionData");
  this.ReadData("Data/IOS_UiOpen_C.dat", this.OnLoadFunctionData);

  log("StoreValueData");
  this.ReadData("Data/IOS_StoreValue_C.dat", this.OnLoadStoreValueData);

  log("TutorialData");
  this.ReadData("Data/IOS_Hotkey_C.dat", this.OnLoadTutorialData);

  log("GuideData");
  this.ReadData("Data/IOS_TeachInfo_C.dat", this.OnLoadGuideData);

  log("TabooData");
  this.ReadData("Data/IOS_IllegalChat_C.dat", this.OnLoadTabooData);

  log("ArmyArchitecture");
  this.ReadData("Data/IOS_ArmyArchitecture_C.dat", this.OnLoadArmyArchitectureData);

  log("ArmySign");
  this.ReadData("Data/IOS_ArmySign_In_C.dat", this.OnLoadArmySignData);

  log("ArmyAward");
  this.ReadData("Data/IOS_ArmyWeeklyAward_C.dat", this.OnLoadArmyAwardData);

  log("ArmyProduction");
  this.ReadData("Data/IOS_ArrayRes_C.dat", this.OnLoadArmyProductionData);

  log("Leaderboard");
  this.ReadData("Data/IOS_LeaderbordInfo_C.dat", this.OnLoadLeaderboardInfo);

  log("NpcUpgrade");
  this.ReadData("Data/IOS_NpcUpgrade_C.dat", this.OnLoadNpcUpgradeData);

  log("Exchange");
  this.ReadData("Data/IOS_Exchange_C.dat", this.OnLoadExchange);

  log("JiugonggeInfo")
  this.ReadData("Data/IOS_JiugonggeInfo_C.dat", this.OnLoadJiugonggeInfo);

  log("JiugonggeMission");
  this.ReadData("Data/IOS_JiugonggeMission_C.dat", this.OnLoadJiugonggeMission);

  log("CollectWarriorData")
  this.ReadData("Data/IOS_CollectWarrior_C.dat", this.OnLoadCollectWarriorData);

  log("CollectWarriorSortData")
  this.ReadData("Data/IOS_CollectWarriorSort_C.dat", this.OnLoadCollectWarriorSortData);

  log("CollectStyle")
  this.ReadData("Data/IOS_CollectStyle_C.dat", this.OnLoadCollectStyleData);

  log("CollectStyleValueData")
  this.ReadData("Data/IOS_CollectStyleValue_C.dat", this.OnLoadCollectStyleValueData);
  
  log("CollectNFTData")
  this.ReadData("Data/IOS_CollectNFT_C.dat", this.OnLoadCollectNFTData);

  log("CollectCard")
  this.ReadData("Data/IOS_CollectCard_C.dat", this.OnLoadCollectCardData);

  log("CollectCardSort")
  this.ReadData("Data/IOS_CollectCardSort_C.dat", this.OnLoadCollectCardSortData);

  log("SellTag")
  this.ReadData("Data/IOS_SellTag_C.dat", this.OnLoadSellTagData);

  log("BeStronger")
  this.ReadData("Data/IOS_BeStronger_C.dat", this.OnLoadBeStrongerData);

  log("FestivalInfo")
  this.ReadData("Data/IOS_FestivalInfo_C.dat", this.OnLoadFestivalInfo);

  log("DungeonArea")
  this.ReadData("Data/IOS_DungeonArea_C.dat", this.OnLoadDungeonArea);

  log("GSActivityData")
  this.ReadData("Data/IOS_GSActivity_C.dat", this.OnLoadGSActivity);

  log("OrgBossAwardData")
  this.ReadData("Data/IOS_LegionBoss_C.dat", this.OnLoadOrgBossAwardData);

  log("FireworkPositionData")
  this.ReadData("Data/IOS_FireWorkPosition_C.dat", this.OnLoadFireworkPositionData);

  log("TitelData")
  this.ReadData("Data/IOS_TitleData_C.dat", this.OnLoadTitleData);
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
  log("TianGuanData")
  this.ReadData("Data/IOS_Strengthening_C.dat", this.OnLoadTianGuanData);

  log("MoneyTreeData")
  this.ReadData("Data/IOS_MoneyTree_C.dat", this.OnLoadMoneyTreeData);

  log("FurnaceSlotData");
  this.ReadData("Data/IOS_FurnaceSlot_C.dat", this.OnLoadFurnaceSlotData);

  log("FurnaceSelectData");
  this.ReadData("Data/IOS_FurnaceSelect_C.dat", this.OnLoadFurnaceSelectData);

  log("ItemEvolutionData");
  this.ReadData("Data/IOS_Evolution_C.dat", this.OnLoadItemEvolutionData);

  log("DataFightGoalData");
  this.ReadData("Data/IOS_PVPgoal_C.dat", this.OnLoadDataFightGoalData);

  log("DataFightAwardData");
  this.ReadData("Data/IOS_PVPReward_C.dat", this.OnLoadDataFightAwardData);

  log("FNpcSlot");
  this.ReadData("Data/IOS_FNpcSlot_C.dat", this.OnLoadFNpcSlotData);
  
  log("ExclusiveWeaponData");
  this.ReadData("Data/IOS_ExclusiveWeapon_C.dat", this.OnLoadExclusiveWeaponData);

   log("CityScrambleCityData");
  this.ReadData("Data/IOS_CityScrambleCityData_C.dat", this.OnLoadCityScrambleCityData);

  log("CityScrambleCityRewardData");
  this.ReadData("Data/IOS_CityScrambleCityRewardData_C.dat", this.OnLoadCityScrambleCityRewardData);

  log("CityScrambleGroundData");
  this.ReadData("Data/IOS_CityScrambleGroundData_C.dat", this.OnLoadCityScrambleGroundData);

  log("ExclusiveWeaponData")
  this.ReadData("Data/IOS_ExclusiveWeapon_C.dat", this.OnLoadExclusiveWeaponData);

  log("EQAffixData")
  this.ReadData("Data/IOS_EquipmentAffix_C.dat", this.OnLoadEQAffixData);

  log("EQReinforcedData")
  this.ReadData("Data/IOS_EquipmentReinforced_C.dat", this.OnLoadEQReinforcedData);

  log("EQRateData")
  this.ReadData("Data/IOS_EquipmentReinforcedRate_C.dat", this.OnLoadEQRateData);

  log("EQValueData")
  this.ReadData("Data/IOS_EquipmentReinforcedValue_C.dat", this.OnLoadEQValueData);

  log("EternalDungeonPrizeData")
  this.ReadData("Data/IOS_EternalDungeonPrize_C.dat", this.OnLoadEternalDungeonPrizeData);

  log("EternalDungeonLayerData")
  this.ReadData("Data/IOS_EternalDungeonLayer_C.dat", this.OnLoadEternalDungeonLayerData);

  log("FieldEffectData")
  this.ReadData("Data/IOS_FieldEffect_C.dat", this.OnLoadFieldEffectData);

  log("SouvenirData")
  this.ReadData("Data/IOS_Souvenir_C.dat", this.OnLoadSouvenirData);

  log("CharmRewardData")
  this.ReadData("Data/IOS_CharmReward_C.dat", this.OnLoadCharmRewardData);

  log("MonopolyCellRewardData")
  this.ReadData("Data/IOS_MonopolyCellReward_C.dat", this.OnLoadMonopolyCellRewardData);

  log("MissionAwardData")
  this.ReadData("Data/IOS_MissionAward_C.dat", this.OnLoadMissionAwardData);

  log("FurnitureData")
  this.ReadData("Data/IOS_Furniture_C.dat", this.OnLoadFurnitureData);

  log("FurnitureKindData")
  this.ReadData("Data/IOS_FurnitureKind_C.dat", this.OnLoadFurnitureKindData);

  log("HouseEditorSceneSetData")
  this.ReadData("Data/IOS_HouseEditorSceneSet_C.dat", this.OnLoadHouseEditorSceneSetData);

  log("HouseExpandConditionData")
  this.ReadData("Data/IOS_HouseExpandCondition_C.dat", this.OnLoadHouseExpandConditionData);

  log("WarriorCombinationData")
  this.ReadData("Data/IOS_WarriorCombination_C.dat", this.OnLoadWarriorCombinationData);

  log("FurnitureCollectLevelData")
  this.ReadData("Data/IOS_FurnitureCollectLevel_C.dat", this.OnLoadFurnitureCollectLevelData);
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
  log("NumberOfHouseWarriorData")
  this.ReadData("Data/IOS_NumberOfHouseWarrior_C.dat", this.OnLoadNumberOfHouseWarriorData);
  
  log("ElfData")
  this.ReadData("Data/IOS_Elf_C.dat", this.OnLoadElfData);
  
  log("ElfExpData")
  this.ReadData("Data/IOS_ElfExp_C.dat", this.OnLoadElfExpData);
  
  log("SacredEquipPrimaryData")
  this.ReadData("Data/IOS_SacredEquipPrimaryStatus_C.dat", this.OnLoadSacredEquipPrimaryData);
  
  log("SacredEquipSubData")
  this.ReadData("Data/IOS_SacredEquipSubStatus_C.dat", this.OnLoadSacredEquipSubData);
  
  log("OnLoadSacredEquipUpgradeData")
  this.ReadData("Data/IOS_SacredEquipUpgrade_C.dat", this.OnLoadSacredEquipUpgradeData);
  
  log("breakthroughData")
  this.ReadData("Data/IOS_EXPUpgrade_C.dat", this.OnLoadBreakthroughData);

  log("FurnitureEffectData")
  this.ReadData("Data/IOS_FurnitureEffect_C.dat", this.OnLoadFurnitureEffectData);
  
  log("SoulLevelData")
  this.ReadData("Data/IOS_SoulLevel_C.dat", this.OnLoadSoulLevelData);

  log("SoulData")
  this.ReadData("Data/IOS_Soul_C.dat", this.OnLoadSoulData);

  log("NpcSoulData")
  this.ReadData("Data/IOS_NpcSoul_C.dat", this.OnLoadNpcSoulData);

  log("SacrificeSlotData");
  this.ReadData("Data/IOS_SacrificeSlot_C.dat", this.OnLoadSacrificeSlotData);

  log("RequiemBossData");
  this.ReadData("Data/IOS_RequiemBoss_C.dat", this.OnLoadRequiemBossData);
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
  log("PassAwardData");
  this.ReadData("Data/IOS_PassAward_C.dat", this.OnLoadPassAwardData);

  if Define.TextCount then
    logError(string.Concat("Total Text Count = ", this.textCount));
  end

  this.initialized = true;
end

function DataManager.ReadData(name, callback)
  if callback == nil then
    logError(string.Concat("Load Data \"", name, "\" Fail !! Callback = nil"));
    return;
  end
  
  local file, errorMsg;
  if LuaHelper.IsStandalone or (LuaHelper.CheckDefine("ForceUseAsset") and not LuaHelper.IsMacOS )then
    file, errorMsg = io.open(LuaHelper.StringToBytes(this.encoding_Big5, CGResourceManager.GetResourcePackedLocalPath(name)), "rb");
  else
    file, errorMsg = io.open(CGResourceManager.GetResourcePackedLocalPath(name), "rb");
  end
  
  if errorMsg ~= nil then
    logWarn(string.Concat("Load Resource Data \"", name, "\" Fail !! ", errorMsg));
    file, errorMsg = io.open(CGResourceManager.GetStreamingAssetsPath(name), "rb");
  end
  
  if errorMsg ~= nil then
    logError(string.Concat("Load Streaming Data \"", name, "\" Fail !! ", errorMsg));
    return;
  end
  
  callback(file);
  
  file:close();
end

function DataManager.OnLoadEveHeaderData(file)
  local reader = DatReader.New(file);
  
  local count = reader:ReadUInt16();    
  for i = 1, count do
    local str = reader:ReadString(23, false);
    local id = tonumber(string.sub(str, 1, string.find(str, ".eve") - 1));

    eveHeaderDatas[id] = {};
    eveHeaderDatas[id].position = reader:ReadInt32() + 103;
    eveHeaderDatas[id].size = reader:ReadInt32();    
  end
end

function DataManager.OnLoadMapData(file)
  local reader = DatReader.New(file);
  
  reader:Seek(reader.length - 2);
  local count = reader:ReadUInt16();
  reader:Seek(reader.length - (2 + count * 29)); --Name 21 + pos 4 + size 4 = 29

  for i = 1, count do
    local str = reader:ReadString(20, false);
    local id = tonumber(string.sub(str, 1, string.find(str, ".map") - 1));

    mapHeaderDatas[id] = {};
    mapHeaderDatas[id].position = reader:ReadInt32();
    mapHeaderDatas[id].size = reader:ReadInt32();
  end
end

function DataManager.OnLoadWemData(file)
  local reader = DatReader.New(file);
  
  reader:Seek(reader.length - 2);
  local count = reader:ReadUInt16();
  reader:Seek(reader.length - (2 + count * 29)); --Name 21 + pos 4 + size 4 = 29
  
  local wemDataPositions = {};
  
  for i = 1, count do
    local str = reader:ReadString(20, false);
    local id = tonumber(string.sub(str, 1, string.find(str, ".wem") - 1));

    wemDataPositions[id] = reader:ReadInt32();
    reader:ReadInt32();
  end

  for k, v in pairs(wemDataPositions) do
    reader:Seek(v);
    wemDatas[k] = WemData.New(reader);
  end
end

function DataManager.OnLoadItemData(file)  
  local reader = DatReader.New(file);

  if Define.TextCount then
    textCount = this.textCount;
  end

  local count = reader:ReadInt32();  
  for i = 1, count do 
    local id, data = ItemData.New(reader);

    if id ~= 0 then
      itemDatas[id] = data;
    end
  end

  if Define.TextCount then
    logWarn(string.Concat("ItemData Text Count = ", (this.textCount - textCount)));
  end
end

function DataManager.OnLoadCommonAwardData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();  
  for i = 1, count do 
    local id, data = CommonAwardData.New(reader);

    commonAwardDatas[id] = data;
  end
end

function DataManager.OnLoadSceneSetData(file)
  local reader = DatReader.New(file);

  if Define.TextCount then
    textCount = this.textCount;
  end

  local count = reader:ReadInt32();
  for i = 1, count do
    local id, data = SceneData.ReadSceneSetData(reader);

    if id ~= 0 then
      if sceneDatas[id] == nil then
        sceneDatas[id] = SceneData.New();
      end

      sceneDatas[id] = data;
    end
  end

  if Define.TextCount then
    logWarn(string.Concat("SceneSetData Text Count = ", (this.textCount - textCount)));
  end
end

function DataManager.OnLoadNpcData(file)
  local reader = DatReader.New(file);

  if Define.TextCount then
    textCount = this.textCount;
  end

  local count = reader:ReadInt32();
  for i = 1, count do
    local id, data = NpcData.New(reader);
    
    if id ~= 0 then
      npcDatas[id] = data;
    end
  end

  if Define.TextCount then
    logWarn(string.Concat("NpcData Text Count = ", (this.textCount - textCount)));
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
end

function DataManager.OnLoadNpcWeaponData(file)
  local reader = DatReader.New(file, 5, 99, 60650, 132123440);

  for bodyKind = 0, 40 do
    if npcWeaponDatas[bodyKind] == nil then
      npcWeaponDatas[bodyKind] = {};
    end

    for weaponKind = 0, 40 do
      npcWeaponDatas[bodyKind][weaponKind] = reader:ReadUInt16();
    end
  end
end

function DataManager.OnLoadRankData(file)
  local reader = DatReader.New(file, 9, 253, 60650, 193000628);

  while reader:CanRead() do
    local id, data = RankData.New(reader);

    if id ~= 0 then
      rankDatas[id] = data;
    end
  end
end

function DataManager.OnLoadEVOStatusData(file)
  local reader = DatReader.New(file);

  reader:DecodeAll(260, math.floor(reader.length / 260) - 3);

  while reader:CanRead() do
    local id, data = EVOStatusData.New(reader);

    if id ~= 0 then
      evoStatusDatas[id] = data;
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
end

function DataManager.OnLoadMarkData(file)
  local reader = DatReader.New(file);

  if Define.TextCount then
    textCount = this.textCount;
  end

  local count = reader:ReadInt32();
  for i = 1, count do
    local id, data = MarkData.ReadInfo(reader);

    if id ~= 0 then
      markDatas[id] = data;

      if data.bitId ~= 0 then
        bitMarkDatas[data.bitId] = id;
      end
    end
  end

  if Define.TextCount then
    logWarn(string.Concat("MarkData Text Count = ", (this.textCount - textCount)));
  end
end

function DataManager.OnLoadMarkStepData(file)
  local reader = DatReader.New(file);

  if Define.TextCount then
    textCount = this.textCount;
  end

  local count = reader:ReadInt32();
  for i = 1, count do
    local id, step, data = MarkData.ReadStep(reader);

    if markDatas[id] ~= nil then
      if markDatas[id].steps == nil then
        markDatas[id].steps = {};
      end

      markDatas[id].steps[step] = data;
    end
  end

  if Define.TextCount then
    logWarn(string.Concat("MarkStepData Text Count = ", (this.textCount - textCount)));
  end
end

function DataManager.OnLoadMarkGroupData(file)
  local reader = DatReader.New(file);

  while reader:CanRead() do
    local id = reader:ReadInt32();
    local count = reader:ReadByte();
    
    if markDatas[id] ~= nil and markDatas[id].steps ~= nil then
      for i = 1, count do
        local stepId = reader:ReadByte();

        if markDatas[id].steps[stepId] ~= nil then
          for j = 1, 5 do
            markDatas[id].steps[stepId].conditions[j].areaId = reader:ReadByte();
          end
          markDatas[id].steps[stepId].endAreaId = reader:ReadByte();
        else
          ShowCenterMessage(string.Concat("Check MarkGroupData ID = ", id, " Step = ", stepId));
          reader:ReadBytes(6);
        end
      end
    else
      ShowCenterMessage(string.Concat("Check MarkGroupData ID = ", id));
      for i = 1, count do
        reader:ReadBytes(7);
      end
    end
  end
end

function DataManager.OnLoadTalkData(file)
  local reader = DatReader.New(file);

  if Define.TextCount then
    textCount = this.textCount;
  end

  local id;
  local count = reader:ReadInt32();
  for i = 1, count do
    id = reader:ReadUInt16(); --[1] 編號
    talkDatas[id] = LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16())); --[2] 對話內容 Length = 254

    if Define.TextCount then
      DataManager.textCount = DataManager.textCount + string.Count(talkDatas[id]);
    end
  end

  talkDatas[0] = nil;

  if Define.TextCount then
    logWarn(string.Concat("TalkData Text Count = ", (this.textCount - textCount)));
  end
end

function DataManager.LoadingFinish(path, success)
  local loadInfo = this.loadingDataTB[path];
  if loadInfo ~= nil then
    loadInfo.isLoaded = true;
    loadInfo.isSuccess = success;
    if not success then
      logError(string.Concat("Load Fail: ", path));
    end
  end
  
  for _,v in pairs(this.loadingDataTB) do
    if not v.isLoaded then
      return;
    end
  end  
  this.initialized = true;
  NotifyManager.Notify(ENotifyManager.FinishLoading, nil);
end

function DataManager.OnLoadFormulaData(file)
  local reader = DatReader.New(file);

  Calc.Initialize(reader);
end

function DataManager.OnLoadAstrolabeData(file)
  local reader = DatReader.New(file);

  reader:DecodeAll();

  for i = 0, Astrolabe.maxAstrolabe do
    local index, data = AstrolabeData.New(reader);

    if index ~= 0 then
      astrolabeDatas[index] = data;
    end
  end
end

function DataManager.OnLoadSkillData(file)
  local reader = DatReader.New(file);

  if Define.TextCount then
    textCount = this.textCount;
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
  local count = reader:ReadInt32();
  for i = 1, count do
   local id, data = SkillData.New(reader);

    if id ~= 0 then
      skillDatas[id] = data;
    end
  end

  if Define.TextCount then
    logWarn(string.Concat("SkillData Text Count = ", (this.textCount - textCount)));
  end
end

function DataManager.OnLoadCompoundData(file)
  local reader = DatReader.New(file, 3, 211, 64444, 168229221);

  while reader:CanRead() do
    local data = CompoundData.New(reader);

    table.insert(compoundDatas, data);
  end
end

function DataManager.OnLoadSuitData(file)
  local reader = DatReader.New(file);

  if Define.TextCount then
    textCount = this.textCount;
  end
  local count = reader:ReadInt32();
  for i = 1, count do
    local id, data = SuitData.New(reader);
    suitDatas[id] = data;
  end

  if Define.TextCount then
    logWarn(string.Concat("SuitData Text Count = ", (this.textCount - textCount)));
  end
end

function DataManager.OnLoadGoodsSaleData(file)
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
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for i = 1, count do
    local storeKind, mjrKind, sndKind, data = GoodsSaleData.New(reader);

    if goodsSaleData[storeKind] == nil then
      goodsSaleData[storeKind] = {};
    end

    if goodsSaleData[storeKind][mjrKind] == nil then
      goodsSaleData[storeKind][mjrKind] = {};
    end

    if goodsSaleData[storeKind][mjrKind][sndKind] == nil then
      goodsSaleData[storeKind][mjrKind][sndKind] = {};      
    end

    table.insert(goodsSaleData[storeKind][mjrKind][sndKind], data);
  end
end

function DataManager.OnLoadGoodsSaleTagData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for i = 1, count do
    local data = GoodsSaleTagData.New(reader);

    table.insert(goodsSaleTagData, data);
  end
end

function DataManager.OnLoadBlissBagData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
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
  for i = 1, count do
    local id, data = BlissBagData.New(reader);

    if blissBagDatas[id] == nil then
      blissBagDatas[id] = {};
      blissBagDatas[id].items = {};
    end

    if blissBagDatas[id].kindCount == nil then
      blissBagDatas[id].kindCount = data.kind;
    else
      if data.kind > blissBagDatas[id].kindCount then
        blissBagDatas[id].kindCount = data.kind;
      end
    end

    table.insert(blissBagDatas[id].items, data);
  end
end

function DataManager.OnLoadLuckyBagData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();

  for i = 1, count do
    local id, data = LuckyBagData.New(reader);

    luckyBagDatas[id] = data;
  end
end

function DataManager.OnLoadFashionStressData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();

  for i = 1, count do
    local id, data = FashionStressData.New(reader);

    if id ~= 0 then
      fashionStressDatas[id] = data;
    end
  end
end

function DataManager.OnLoadWarpData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
    for i = 1, count do
      local data = WarpData.New(reader);
      warpDatas[i - 1] = data;
    end
end

function DataManager.OnLoadAchievementData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local mjrKind, sndKind, data = AchievementData.New(reader);

    if achievementDatas[mjrKind] == nil then
      achievementDatas[mjrKind] = {};
    end

    if achievementDatas[mjrKind][sndKind] == nil then
      achievementDatas[mjrKind][sndKind] = {};
    end

    table.insert(achievementDatas[mjrKind][sndKind], data);
  end
end

function DataManager.OnLoadActivityInfo(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local uiKind, mainKind, subKind, data = ActivityInfo.New(reader);
 
    if mainKind ~= 0 then
      count = count + 1;
      if count > 0 then  
      --[[  if activityInfos[mainKind] == nil then
          activityInfos[mainKind] = {};
        end

        if activityInfos[mainKind][subKind] == nil then
          activityInfos[mainKind][subKind] = {};
        end

        table.insert(activityInfos[mainKind][subKind], data);
      ]]
        --新活動表多一個選擇顯示介面
        if activityInfos[uiKind] == nil then
          activityInfos[uiKind] = {};
        end
        
        if activityInfos[uiKind][mainKind] == nil then
          activityInfos[uiKind][mainKind] = {};
        end

        if activityInfos[uiKind][mainKind][subKind] == nil then
          activityInfos[uiKind][mainKind][subKind] = {};
        end

        table.insert(activityInfos[uiKind][mainKind][subKind], data);
        --完--
      end
    end
  end
end

function DataManager.OnLoadActivityTime(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local  data = ActivityTime.New(reader);

    count = count + 1;
    if count > 0 then
      if activityTimes[data.Id] == nil then
        activityTimes[data.Id] = {};
      end
      
      if data.switch >= 1 then
        table.insert(activityTimes[data.Id], data);
      end
    end
  end
end

function DataManager.OnLoadActivityFeverTime(file)
  local reader = DatReader.New(file);
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
  local count = reader:ReadInt32();
  for i = 1, count do
    local  data = ActivityFeverTime.New(reader);

    if count > 0 then
      if activityFeverTimes[data.Id] == nil then
        activityFeverTimes[data.Id] = {};
      end      

      if data.switch >= 1 then
        table.insert(activityFeverTimes[data.Id], data);  
      end
    end
  end
end

function DataManager.OnLoadRandomNameData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();  
  for i = 1, count do
    local id, data = RandomNameData.New(reader);

    if id ~= 0 then
      randomNameDatas[id] = data;
    end
  end
end

function DataManager.OnLoadLoginAwardData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local data = LoginAwardData.New(reader);

    loginAwardDatas[i] = data;
  end
end

function DataManager.OnLoadLoginAwardTagData(file)
  local reader = DatReader.New(file);
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
  local count = reader:ReadInt32();
  for i = 1, count do
    local data = LoginAwardTagData.New(reader);

    loginAwardTagDatas[i] = data;
  end
end

function DataManager.OnLoadAchievementTagData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for i = 1, count do
    local mjrKind, sndKind, name = TagData.New(reader);

    if achievementTagData[tonumber(mjrKind)] == nil then
      achievementTagData[tonumber(mjrKind)] = {};
    end

    achievementTagData[tonumber(mjrKind)][tonumber(sndKind)] = name;
  end
end

function DataManager.OnLoadMountsData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local id, data = MountsData.New(reader);

    mountsDatas[id] = data;
  end
end

function DataManager.OnLoadMountsGrowData(file)
  local reader = DatReader.New(file);
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
  local count = reader:ReadInt32();
  for i = 1, count do
    local level, data = MountsGrowData.New(reader);

    mountsGrowDatas[level] = data;
  end
end

function DataManager.OnLoadTextData(file)
  local reader = DatReader.New(file);

  if Define.TextCount then
    textCount = this.textCount;
  end

  local count = reader:ReadInt32();
  for i = 1, count do
    local key = reader:ReadUInt32();
    local text = LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16()));
    textDatas[key] = text;

    if Define.TextCount then
      DataManager.textCount = DataManager.textCount + string.Count(text);
    end
  end

  if Define.TextCount then
    logWarn(string.Concat("TextData Text Count = ", (this.textCount - textCount)));
  end
end

function DataManager.OnLoadIllegalData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    table.insert(illegalDatas, LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16())));
  end
end

function DataManager.OnLoadTextureSizeData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadUInt16();

  for i = 1, count do
    local key, data = TextureSizeData.New(reader);
    textureSizeDatas[key] = data;
  end
end

function DataManager.OnLoadTextureOffsetData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadUInt16();

  for i = 1, count do
    local key, data = TextureOffsetData.New(reader);
    textureOffsetDatas[key] = data;
  end
end

function DataManager.OnLoadDungeonData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
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
  table.Clear(weekDungeonDatas);
  table.Clear(soulDungeonDatas);
  for i = 1, count do
    local data = DungeonData.New(reader);
    dungeonDatas[data.id] = data;

    if data.kind == 3 then
      table.insert(weekDungeonDatas, data.id);
    elseif data.kind == 5 then
      table.insert(soulDungeonDatas, data.id);
    end
  end
end

function DataManager.OnLoadDungeonComboData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();

  for i = 1, count do
    local data = DungeonComboData.New(reader);
    if dungeonComboDatas[data.id] == nil then 
      dungeonComboDatas[data.id] = {};
    end

    table.insert(dungeonComboDatas[data.id], data);
  end
end

function DataManager.OnLoadSceneFightData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local data = SceneFightData.New(reader);

    sceneFightDatas[i] = data;
  end
end

function DataManager.OnLoadLimitTimeDungeonData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local data = LimitTimeDungeonData.New(reader);

    limitTimeDungeonDatas[i] = data;
  end
end

function DataManager.OnLoadAnotherWorldLvData(file)
  local reader = DatReader.New(file);
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
  local count = reader:ReadInt32();
  for i = 1, count do
    local data = AnotherWroldLvData.New(reader);

    anotherWorldLvDatas[i] = data;
  end
end

function DataManager.OnLoadUISellData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local data = UISellData.New(reader);

    uisellDatas[i] = data;
  end
end

function DataManager.OnLoadUIItemHintData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local data = ItemHintData.New(reader);

    itemHintDatas[data.id] = data.string;
  end
end

function DataManager.LvUpData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();

  for i = 1, count do
    local lv = reader:ReadByte();
    if lvUpDatas[lv] == nil then 
      lvUpDatas[lv] = {};
    end

    lvUpDatas[lv].stringId = reader:ReadUInt32();
  end
end

function DataManager.OnLoadDoorGroupData(file)
  local reader = DatReader.New(file);

  while reader:CanRead() do
    local sceneId = reader:ReadInt32();
    local count = reader:ReadByte();

    for i = 1, count do
      local targetSceneId = reader:ReadInt32();
      local doorCount = reader:ReadByte();

      for j = 1, doorCount do 
        local doorId = reader:ReadByte();
        local priority = reader:ReadByte();
        local targetAreaId = reader:ReadByte();
        local areaId = reader:ReadByte();

        local fromCode = sceneId * 1000 + areaId;
        local targetCode = targetSceneId * 1000 + targetAreaId;
        
        if navigationDatas[fromCode] == nil then
          navigationDatas[fromCode] = {};
        end

        if navigationDatas[fromCode][targetCode] == nil then
          navigationDatas[fromCode][targetCode] = {};
        end
        
        table.insert(navigationDatas[fromCode][targetCode], doorId * 1000 + priority);
      end
    end
  end
end

function DataManager.OnLoadTestNavi(file)
  local reader = DatReader.New(file);
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
  while reader:CanRead() do
    local fromSceneId = reader:ReadInt32();

    if testNaviDatas[fromSceneId] == nil then
      testNaviDatas[fromSceneId] = {};
    end

    local count = reader:ReadInt32();
    for i = 1, count do
      local toSceneId = reader:ReadInt32();
      local doorId = reader:ReadInt32();

      if testNaviDatas[fromSceneId][toSceneId] == nil then
        testNaviDatas[fromSceneId][toSceneId] = {};
      end

      local temp = {};
      temp.doorId = doorId;
      temp.position = Vector2.New(reader:ReadInt32(), reader:ReadInt32());
      temp.nextScenePosition = Vector2.New(reader:ReadInt32(), reader:ReadInt32());

      table.insert( testNaviDatas[fromSceneId][toSceneId], temp);
    end
  end
end

function DataManager.OnLoadDispatchData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local mainKind, subKind, data = DispatchData.New(reader);

    if dispatchData[mainKind] == nil then
      dispatchData[mainKind] = {};
    end

    if dispatchData[mainKind][subKind] == nil then
      dispatchData[mainKind][subKind] = {};
    end

    table.insert(dispatchData[mainKind][subKind], data);
  end
end

function DataManager.OnLoadDispatchBonusData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local id, data = DispatchBonusData.New(reader);

    dispatchBonusData[id] = data;
  end
end

function DataManager.OnLoadFunctionData(file)
  local reader = DatReader.New(file);
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
  local count = reader:ReadInt32();
  for i = 1, count do
    local id, data = FunctionData.New(reader);

    functionDatas[id] = data;
  end
end

function DataManager.OnLoadStoreValueData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local kind, data = StoreValueData.New(reader);

    if storeValueDatas[kind] == nil then
      storeValueDatas[kind] = {};
    end

    table.insert(storeValueDatas[kind], data);
  end
end

function DataManager.OnLoadTutorialData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local id, data = TutorialData.New(reader);

    tutorialDatas[id] = data;
  end
end

function DataManager.OnLoadGuideData(file)
  local reader = DatReader.New(file);
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
  local count = reader:ReadInt32();
  for i = 1, count do
    local id, step, data = GuideData.New(reader);

    if guideDatas[id] == nil then
      guideDatas[id] = {};
    end

    guideDatas[id][step] = data;
  end
end

function DataManager.OnLoadTabooData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    table.insert(tabooDatas, LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16())));
  end
end

function DataManager.OnLoadArmyArchitectureData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local lv, data = ArmyArchitectureData.New(reader);

    armyArchitectureDatas[lv] = data;
  end
end

function DataManager.OnLoadArmySignData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local lv, data = ArmySignData.New(reader);

    armySignDatas[lv] = data;
  end
end

function DataManager.OnLoadArmyAwardData(file)
  local reader = DatReader.New(file);
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
  local count = reader:ReadInt32();
  for i = 1, count do
    local data = ArmyAwardData.New(reader);

    armyAwardDatas[i] = data;
  end
end

function DataManager.OnLoadArmyProductionData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local kind, unit, data = ArmyProductionData.New(reader);

    if armyProductionDatas[kind] == nil then
      armyProductionDatas[kind] = {};
    end

    armyProductionDatas[kind][unit] = data;
  end
end

function DataManager.OnLoadWarriorCollection(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local data = WarriorCollectionData.New(reader);

    warriorCollectionDatas[i] = data;
  end
end

function DataManager.OnLoadLeaderboardInfo(file)
  local reader = DatReader.New(file);
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
  local count = reader:ReadInt32();
  for i = 1, count do
    local id, data = LeaderboardData.New(reader);

    leaderboardDatas[id] = data;

    local mainTag = 0;
    for k, v in pairs(leaderboardTagDatas) do
      if leaderboardDatas[v[1]].mainTagText == data.mainTagText then
        mainTag = k;
      end
    end

    if mainTag == 0 then
      table.insert(leaderboardTagDatas, { id });
    else
      table.insert(leaderboardTagDatas[mainTag], id);
    end
  end
end

function DataManager.OnLoadExchange(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  local index = 1;
  local id;

  for i = 1, count do
    local groupId, data = ExchangeData.New(reader);

    if id ~= groupId then
      id = groupId;
      index = 1;
    end

    if exchangeDatas[id] == nil then
      exchangeDatas[id] = {};
    else
      index = index + 1;
    end

    exchangeDatas[id][index] = {};
    exchangeDatas[id][index].itemId = data.itemId;
    exchangeDatas[id][index].count = data.count;
  end
end

function DataManager.OnLoadNpcUpgradeData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local lv, data = NpcUpgradeData.New(reader);
    
    npcUpgradeDatas[lv] = data;
  end
end

function DataManager.OnLoadJiugonggeInfo(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local data = JiugonggeInfo.New(reader);
    
    table.insert(jiugonggeInfos, data);
  end
end

function DataManager.OnLoadJiugonggeMission(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local data = JiugonggeMissionData.New(reader);

    table.insert(jiugonggeMissions, data);
  end
end

function DataManager.OnLoadCollectWarriorData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
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
  for i = 1, count do
    local data = CollectWarriorData.New(reader);
    collectWarriorDatas[data.id] = data;
    collectWarriorDatas[data.id].name = npcDatas[data.id].name;
  end
end

function DataManager.OnLoadCollectWarriorSortData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();

  for i = 1, count do
    local data = CollectWarriorSortData.New(reader);
    collectWarriorSortDatas[data.index] = data;
  end
end

function DataManager.OnLoadCollectStyleData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();

  for i = 1, count do
    local data = CollectStyleData.New(reader);
    collectStyleDatas[data.id] = data;
  end
end

function DataManager.OnLoadCollectStyleValueData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();

  for i = 1, count do
    collectStyleValueDatas[i] = CollectStyleValueData.New(reader);
  end
end

function DataManager.OnLoadCollectNFTData(file)
  local reader = DatReader.New(file);
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
  local count = reader:ReadInt32();
  for i = 1, count do
    local data = CollectNFTData.New(reader);
    collectNFTDatas[data.warriorId] = data;
  end
end

function DataManager.OnLoadCollectCardData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();

  for i = 1, count do
    local data = CollectCardData.New(reader);
    collectCardDatas[data.id] = data;
  end
end

function DataManager.OnLoadCollectCardSortData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();

  for i = 1, count do
    local data = CollectCardSortData.New(reader);
    collectCardSortDatas[data.id] = data;
  end
end

function DataManager.OnLoadSellTagData(file)
  local reader = DatReader.New(file);
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
  local count = reader:ReadInt32();
  local mainTag;
  local subTag;
  local text;
  for i = 1, count do
    mainTag = reader:ReadByte();
    subTag = reader:ReadByte();
    text = string.Get(reader:ReadUInt32());

    if auctionTagDatas[mainTag] == nil then
      auctionTagDatas[mainTag] = {};
    end

    if subTag == 0 then
      auctionTagDatas[mainTag][1] = text;
    else
      if auctionTagDatas[mainTag][2] == nil then
        auctionTagDatas[mainTag][2] = {};
      end

      auctionTagDatas[mainTag][2][subTag] = text;
    end
  end
end

function DataManager.OnLoadBeStrongerData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  local name;
  local subname;
  local key;
  for i = 1, count do
    name = reader:ReadUInt32();
    subname = reader:ReadUInt32();

    key = nil;
    for k, v in pairs(beStrongerDatas) do
      if v.name == name then
        key = k;
        break;
      end
    end

    if key == nil then
      local beStrongerData = {};
      beStrongerData.name = name;
      beStrongerData.subname = {};
      beStrongerData.methods = {};

      table.insert(beStrongerDatas, beStrongerData);
      key = table.maxn(beStrongerDatas);
    end

    beStrongerData = beStrongerDatas[key];
    
    if subname ~= 0 then
      if not table.Contains(beStrongerData.subname, subname) then 
        table.insert(beStrongerData.subname, subname);
      end
    end

    local methodData = {};
    methodData.name = reader:ReadUInt32();
    methodData.subname = subname;
    methodData.functionId = reader:ReadByte();
    methodData.param1 = reader:ReadByte();
    methodData.param2 = reader:ReadByte();
    methodData.checkvalue = reader:ReadUInt16();

    table.insert(beStrongerData.methods, methodData);
  end
end

function DataManager.OnLoadFestivalInfo(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local data = FestivalInfo.New(reader);
    
    table.insert(festivalInfos, data);
  end
end

function DataManager.OnLoadDungeonArea(file)
  local reader = DatReader.New(file);
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
  local count = reader:ReadInt32();
  for i = 1, count do
    local id, data = DungeonAreaData.New(reader);
    
    if dungeonAreaDatas[id] == nil then
      dungeonAreaDatas[id] = {};
    end

    table.insert(dungeonAreaDatas[id], data);
  end
end

function DataManager.OnLoadGSActivity(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local data = GSActivityData.New(reader);
    
    table.insert(gsActivityDatas, data);
  end
end

function DataManager.OnLoadOrgBossAwardData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local data = OrgBossAwardData.New(reader);
    
    table.insert(orgBossAwardDatas, data);
  end
end

function DataManager.OnLoadFireworkPositionData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local data = FireworkPositionData.New(reader);
    
    table.insert(fireWorkPositionDatas, data);
  end
end

function DataManager.OnLoadTitleData(file)
  local reader = DatReader.New(file);
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
  local finded = false;
  local count = reader:ReadInt32();
  for i = 1, count do
    local id, data = TitleData.New(reader);
    
    titleDatas[id] = data;

    if data.flagId ~= 0 then
      finded = false;
      for k, v in pairs(leaderboardDatas) do
        for i = 1, 3 do
          if data.flagId == v.rankAwards[i].flagId then
            v.rankAwards[i].titleId = id;
            finded = true;
            break;
          end
        end

        if finded then
          break;
        end
      end
    end
  end

  for k, v in pairs(achievementDatas) do
    for kk, vv in pairs(v) do
      for kkk, vvv in pairs(vv) do
        for titleId, titleData in pairs(titleDatas) do
          if titleData.flagId == vvv.completeFlag then
            vvv.titleId = titleId;
            break;
          end
        end
      end
    end
  end
end

function DataManager.OnLoadTianGuanData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for i = 1, count do
    local itemId, level, data = TianGuanData.New(reader);

    if level > Item.maxTianGuanLv then
      Item.maxTianGuanLv = level;
    end

    if tianGuanDatas[itemId] == nil then
      tianGuanDatas[itemId] = {};
    end

    tianGuanDatas[itemId][level] = data;
  end
end

function DataManager.OnLoadFurnaceSlotData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();
  for i = 1, count do
    local data = FurnaceSlotData.New(reader);

    furnaceSlotDatas[i] = data;
  end
end

function DataManager.OnLoadFurnaceSelectData(file)
  local reader = DatReader.New(file);
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
  local count = reader:ReadInt32();
  for i = 1, count do
    local data = FurnaceSelectData.New(reader);

    furnaceSelectDatas[i] = data;
  end
end

function DataManager.OnLoadMoneyTreeData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();

  for i = 1, count do
    local lv, data = MoneyTreeData.New(reader);

    moneyTreeDatas[lv] = data;
  end
end

function DataManager.OnLoadItemEvolutionData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();

  for i = 1, count do
    local requireItem1, requireItem2, data = ItemEvoData.New(reader);

    if itemEvolutionDatas[requireItem1] == nil then
      itemEvolutionDatas[requireItem1] = {};
    end

    if itemEvolutionDatas[requireItem1][requireItem2] == nil then
      itemEvolutionDatas[requireItem1][requireItem2] = {};
    end

    table.insert(itemEvolutionDatas[requireItem1][requireItem2], data);
  end
end

function DataManager.OnLoadDataFightGoalData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();

  for i = 1, count do
    local data = DataFightGoalData.New(reader);

    table.insert(dataFightGoalDatas, data);
  end
end

function DataManager.OnLoadDataFightAwardData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
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
  for i = 1, count do
    local kind, rank, data = DataFightAwardData.New(reader);
    
    if kind == 1 then
      dataFightAwardDatas[rank] = data;
    end
  end
end

function DataManager.OnLoadFNpcSlotData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();

  for i = 1, count do
    local index, data = FNpcSlotData.New(reader);

    fNpcSlotDatas[index] = data;
  end
end

function DataManager.OnLoadExclusiveWeaponData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for i = 1, count do
    local id, lv, data = ExclusiveWeaponData.New(reader);
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
    if exclusiveWeaponDatas[id] == nil then 
      exclusiveWeaponDatas[id] = {};
    end
    exclusiveWeaponDatas[id][lv] = data;
  end
end

function DataManager.OnLoadEternalDungeonPrizeData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for i = 1, count do
    local id, data = EternalDungeonPrizeData.New(reader);
    eternalDungeonPrizeDatas[id] = data;
  end
end

function DataManager.OnLoadEternalDungeonLayerData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for i = 1, count do
    local id, data = EternalDungeonLayerData.New(reader);
    eternalDungeonLayerDatas[id] = data;
  end
end

function DataManager.OnLoadFieldEffectData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for i = 1, count do
    local id, data = FieldEffectData.New(reader);
    if fieldEffectDatas[id] == nil then
      fieldEffectDatas[id] = {};
    end
    table.insert(fieldEffectDatas[id], data);
  end
end

function DataManager.OnLoadCityScrambleCityData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for i = 1, count do
    local id, data = CityScrambleCityData.New(reader);
    cityScrambleCityDatas[id] = data;
  end
end

function DataManager.OnLoadCityScrambleCityRewardData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for i = 1, count do
    local id, kind, data = CityScrambleCityRewardData.New(reader);

    if cityScrambleCityRewardDatas[id] == nil then 
      cityScrambleCityRewardDatas[id] = {};
    end
    cityScrambleCityRewardDatas[id][kind] = data;
  end
end

function DataManager.OnLoadCityScrambleGroundData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for i = 1, count do
    local id, data = CityScrambleGroundData.New(reader);
    cityScrambleGroundDatas[id] = data;
  end
end

function DataManager.OnLoadEQAffixData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();

  for i = 1, count do
    local index, kind, data = EQAffixData.New(reader);

    local fitType;
    if bit.band(kind, 1) == 1 then
      fitType = EItemFitType.Equip_Head;
      this.InsertEqAffixData(fitType, data);
    end

    if bit.band(kind, 2) == 2 then
      fitType = EItemFitType.Equip_Body;
      this.InsertEqAffixData(fitType, data);
    end

    if bit.band(kind, 4) == 4 then
      fitType = EItemFitType.Equip_Hand;
      this.InsertEqAffixData(fitType, data);
    end

    if bit.band(kind, 8) == 8 then
      fitType = EItemFitType.Equip_Wrist;
      this.InsertEqAffixData(fitType, data);
    end

    if bit.band(kind, 16) == 16 then
      fitType = EItemFitType.Equip_Boots;
      this.InsertEqAffixData(fitType, data);
    end

    if bit.band(kind, 32) == 32 then
      fitType = EItemFitType.Equip_Spec;
      this.InsertEqAffixData(fitType, data);
    end

    eqAffixAllDatas[index] = data;
  end
end

function DataManager.InsertEqAffixData(fitType, data)
  if eqAffixDatas[fitType] == nil then
    eqAffixDatas[fitType] = {};
  end

  table.insert(eqAffixDatas[fitType], data);
end

function DataManager.OnLoadEQReinforcedData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for i = 1, count do
    local data = EQReinforcedData.New(reader);

    eqReinforcedDatas[i] = data;
  end
end

function DataManager.OnLoadElfData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for i = 1, count do
    local no, data = ElfData.New(reader);
  
    if no == 999 then
      elfDatas[i] = data;
    else
      elfDatas[no] = data;
    end
  end
end

function DataManager.OnLoadElfExpData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for i = 1, count do
    local lv, data = ElfExpData.New(reader);
    
    elfExpDatas[lv] = data;
  end
end

function DataManager.OnLoadSacredEquipPrimaryData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for i = 1, count do
    local data = SacredEquipPrimaryData.New(reader);
  
    SacredEquipPrimaryDatas[i] = data;
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
end

function DataManager.OnLoadSacredEquipSubData(file)
  --local reader = DatReader.New(file);
  --local count = reader:ReadInt32();
  --for i = 1, count do
  --  local data = SacredEquipSubData.New(reader);
  --
  --  SacredEquipSubDatas[i] = data;
  --end
end

function DataManager.OnLoadSacredEquipUpgradeData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for i = 1, count do
    local data = SacredEquipUpgradeData.New(reader);
    
    SacredEquipUpgradeDatas[i] = data;
  end
end

function DataManager.OnLoadEQRateData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for i = 1, count do
    local level, data = EQRateData.New(reader);

    eqRateDatas[level] = data;
  end
end

function DataManager.OnLoadEQValueData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for i = 1, count do
    local data = EQValueData.New(reader);

    eqValueDatas[i] = data;
  end
end

function DataManager.OnLoadSouvenirData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for i = 1, count do
    local id, data = SouvenirData.New(reader);

    souvenirDatas[id] = data;
  end
end

function DataManager.OnLoadCharmRewardData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for i = 1, count do
    local data = CharmRewardData.New(reader);

    charmRewardDatas[i] = data;
  end
end

function DataManager.OnLoadMonopolyCellRewardData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for index = 1,count do
    local round,cellID,data = MonopolyRewardData.New(reader);
    if monopolyCellRewardDatas[round] == nil then
      monopolyCellRewardDatas[round] = {};
    end
    if monopolyCellRewardDatas[round][cellID] == nil then
      monopolyCellRewardDatas[round][cellID] = {};
    end
    monopolyCellRewardDatas[round][cellID] = data;
  end
  MonopolyRewardData.CalculateRoundRefreshIndex();
end

function DataManager.OnLoadMissionAwardData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for index = 1, count do
    local data = MissionAwardData.New(reader);
    missionAwardDatas[index] = data;
  end
end

function DataManager.OnLoadFurnitureData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();

  for i = 1, count do
    local id, data = FurnitureData.New(reader);

    if id ~= 0 then
      furnitureDatas[id] = data;
    end
  end
end

function DataManager.OnLoadFurnitureKindData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
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
  for i = 1, count do
    local id, data = FurnitureKindData.New(reader);
    furnitureKindDatas[id] = data;
  end
end

function DataManager.OnLoadHouseEditorSceneSetData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();

  for i = 1, count do
    local id, data = HouseEditorSceneSetData.New(reader);

    if id ~= 0 then
      houseEditorSceneSetDatas[id] = data;
    end
  end
end

function DataManager.OnLoadHouseExpandConditionData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();

  for i = 1, count do
    local data = HouseExpandConditionData.New(reader);
    houseExpandConditionDatas[i] = data;
  end
end

function DataManager.OnLoadWarriorCombinationData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();


  for i = 1, count do
    local data = WarriorCombinationData.New(reader);
    warriorCombinationDatas[i] = data;
  end
end

function DataManager.OnLoadFurnitureCollectLevelData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();

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
  for i = 1, count do
    local level, data = FurnitureCollectLevelData.New(reader);
    furnitureCollectLevelDatas[level] = data;
  end
end

function DataManager.OnLoadNumberOfHouseWarriorData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();

  for i = 1, count do
    local number, data = NumberOfHouseWarriorData.New(reader);
    numberOfHouseWarriorDatas[number] = data;
  end
end

function DataManager.OnLoadBreakthroughData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  while reader.position < reader.length do
    local data = BreakthroughData.New(reader);
    if not data:IsEmpty() then
      table.insert(breakthroughDatas, data);
    end
  end
  Breakthrough.SetBreakthroughLevel(table.Count(breakthroughDatas));
  Breakthrough.InitBreakthroughData();
end

function DataManager.OnLoadFurnitureEffectData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();

  for i = 1, count do
    local id, data = FurnitureEffectData.New(reader);
    furnitureEffectDatas[id] = data;
  end
end

function DataManager.OnLoadNpcSoulData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();

  for i = 1, count do
    local id, data = NpcSoulData.New(reader);
    npcSoulDatas[id] = data;
  end
end

function DataManager.OnLoadSoulData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();

  for i = 1, count do
    local number, data = SoulData.New(reader);
    soulDatas[number] = data;
  end
end

function DataManager.OnLoadPassAwardData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
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
  for i = 1, count do
    local data = PassAwardData.New(reader);
    passAwardDatas[i] = data;
  end
end

function DataManager.OnLoadSoulLevelData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();

  for i = 1, count do
    local level, data = SoulLevelData.New(reader);
    soulLevelDatas[level] = data;
  end
end

function DataManager.OnLoadSacrificeSlotData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for index = 1, count do
    local id, data = SacrificeSlotData.New(reader);
    table.insert(sacrificeSlotDatas, id, data);
  end
end

function DataManager.OnLoadRequiemBossData(file)
  local reader = DatReader.New(file);
  local count = reader:ReadInt32();
  for index = 1, count do
    local id, data = RequiemBossData.New(reader);
    table.insert(requiemBossDatas, id, data);
  end
end