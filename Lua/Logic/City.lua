--城池場景
ECityScene = {
  Big = 1, --城的大地圖
  Base = 2, --城的根據地
  Fight = 3, --城的戰場
  Street = 4, --城的街道
  Bank = 5, --城的錢莊     |固定
  Inn = 6, --城的客棧     |固定
  Pharmacy =7, --城的藥店     |固定
  Iron = 8, --城的鐵店     |固定
  MapId = 9, --城的大地圖編號(npcId)
  Tent = 10, --城的營帳
  All = 250, --城的全部
}

--城池建築
ECityStation = {
  Business = 1, --商行等級
  Barn = 2, --糧倉等級
  Pit = 3, --礦場等級
  Lumbering = 4, --伐木廠等級
  Drapery = 5, --布莊等級
  Artificer = 6, --巧匠房
}

--城池勢力
ECamp = {
  Defend = 1, --守方
  Attack = 2, --攻方
}

--器械種類
EGuard = {
  None = 0, --無
  Horse = 1, --馬
  HitCar = 2, --衝車
  KnifeCar = 3, --刀車
  ArrowCar = 4, --弩車
  RockCar = 5, --投石車
  WatchTower = 6, --箭樓
  WellHurdle = 7, --井欄
  WoodHurdle = 8, --木欄
  Soldier = 9, --兵
  CityGate = 10, --城門
  WoodGate = 11, --木門
  CityWall = 12, --城牆
  WoodWall = 13, --木牆
  Other = 14, --其他
}

--器械損壞狀態
EGuardStatus = {
  None = 0, --無
  OK = 1, --完好
  Normal = 2, --堪用
  Damage = 3, --毀壞
}

--器械駐紮狀態
EGuardLock = {
  None = 0,
  Mount = 1, --上駐紮
  DisMount = 2, --下駐紮
}

--城池生產
ECityPrac = {
  Mining = 1; --礦業
  Forestry = 2; --林業
  Livestock = 3; --畜產
  Farming = 4; --農業
  Build = 5; --建築
}

ECityLine = {
  AttackCamp = 1,
  Gate = 2,
  DefendCamp = 3,
}

City = {};
local this = City;

--const
this.maxCity = 5;
this.maxCityStation = 6;
this.maxCityStationLv = 3;
this.maxGuardNpc = 200;
this.defendLineOffset = -15;
this.attackLineOffset = 30;

this.maxPrac = {
  { 0, 0, 0, 0, 0 },
  { 7000, 4000, 10000, 13000, 170000 },
  { 14000, 8000, 20000, 26000, 340000 }
}
this.guardOffset = {}
this.guardOffset[0] = Vector2.New(70, 5);
this.guardOffset[1] = Vector2.New(65, -20);
this.guardOffset[2] = Vector2.New(-10, -45);
this.guardOffset[3] = Vector2.New(-50, -20);
this.guardOffset[4] = Vector2.New(-70, 15);
this.guardOffset[5] = Vector2.New(-50, 40);
this.guardOffset[6] = Vector2.New(10, 60);
this.guardOffset[7] = Vector2.New(60, 30);

this.followOffset = {}
this.followOffset[0] = {};
this.followOffset[0][1] = Vector2.New(-55, -35);
this.followOffset[0][2] = Vector2.New(55, -35);
this.followOffset[0][3] = Vector2.New(-55, 35);
this.followOffset[0][4] = Vector2.New(55, 35);
this.followOffset[1] = {};
this.followOffset[1][1] = Vector2.New(-60, 10);
this.followOffset[1][2] = Vector2.New(20, -40);
this.followOffset[1][3] = Vector2.New(-5, 30);
this.followOffset[1][4] = Vector2.New(70, -15);
this.followOffset[2] = {};
this.followOffset[2][1] = Vector2.New(-45, 30);
this.followOffset[2][2] = Vector2.New(-45, -30);
this.followOffset[2][3] = Vector2.New(45, 30);
this.followOffset[2][4] = Vector2.New(45, -30);
this.followOffset[3] = {};
this.followOffset[3][1] = Vector2.New(10, 40);
this.followOffset[3][2] = Vector2.New(-80, -5);
this.followOffset[3][3] = Vector2.New(75, 0);
this.followOffset[3][4] = Vector2.New(0, -45);
this.followOffset[4] = {};
this.followOffset[4][1] = Vector2.New(55, 35);
this.followOffset[4][2] = Vector2.New(-55, 35);
this.followOffset[4][3] = Vector2.New(55, -30);
this.followOffset[4][4] = Vector2.New(-55, -30);
this.followOffset[5] = {};
this.followOffset[5][1] = Vector2.New(80, -5);
this.followOffset[5][2] = Vector2.New(-10, 40);
this.followOffset[5][3] = Vector2.New(0, -45);
this.followOffset[5][4] = Vector2.New(-75, 0);
this.followOffset[6] = {};
this.followOffset[6][1] = Vector2.New(45, -30);
this.followOffset[6][2] = Vector2.New(45, 30);
this.followOffset[6][3] = Vector2.New(-45, -30);
this.followOffset[6][4] = Vector2.New(-45, 30);
this.followOffset[7] = {};
this.followOffset[7][1] = Vector2.New(-20, -40);
this.followOffset[7][2] = Vector2.New(60, 10);
this.followOffset[7][3] = Vector2.New(-70, -15);
this.followOffset[7][4] = Vector2.New(5, 30);

this.gateOffset = {}
this.gateOffset[1] = Vector2.New(30, 15);
this.gateOffset[2] = Vector2.New(-30, -15);
this.gateOffset[3] = Vector2.New(60, 30);
this.gateOffset[4] = Vector2.New(-60, -30);

this.stationResourceRate = { 0.2, 0.5, 1 };

--替代用人物模型
this.playerCampNpcId = {}
this.playerCampNpcId[ECamp.Attack] = 38323;
this.playerCampNpcId[ECamp.Defend] = 38324;

--部隊
this.maxArmy = 8;
this.armyItemId = {
  53001, --輕步兵
  53002, --勁裝兵
  53003, --重鎧兵
  53004, --強甲兵
  53012, --輕裝小將
  53013, --勁裝小將
  53014, --重鎧小將
  53015, --強甲小將
}

this.armyNpcId = {
  36001, --輕步兵
  36002, --勁裝兵
  36003, --重鎧兵
  36004, --強甲兵
  36005, --輕裝小將
  36006, --勁裝小將
  36007, --重鎧小將
  36008, --強甲小將
}

--器械
this.maxWeapon = 14;
this.weaponItemId = {
  53005, --木欄
  53006, --井欄
  53007, --衝車
  53008, --刀車
  53009, --努車
  53010, --投石車
  53011, --箭塔

  53016, --堅木欄
  53017, --強弓井欄
  53018, --牛頭衝車
  53019, --精鋼刀車
  53020, --連努車
  53021, --投石巨車
  53022, --神箭塔
}

this.weaponNpcId = {
  37001, --木欄
  37002, --井欄
  37003, --衝車
  37004, --刀車
  37005, --努車
  37006, --投石車
  37007, --箭塔

  37016, --堅木欄
  37017, --強弓井欄
  37018, --牛頭衝車
  37019, --精鋼刀車
  37020, --連努車
  37021, --投石巨車
  37022, --神箭塔
}

--var
this.cityId = 0;

this.isCrossWall = false;
this.guardLock = EGuardLock.None;

this.countDownSeconds = 0;

this.cities = {};
this.damageGuards = {};

--生產
this.pracArray = {};
this.pracArray[ECityPrac.Mining] = { count = 0, Lv = 0 };
this.pracArray[ECityPrac.Forestry] = { count = 0, Lv = 0 };
this.pracArray[ECityPrac.Livestock] = { count = 0, Lv = 0 };
this.pracArray[ECityPrac.Farming] = { count = 0, Lv = 0 };
this.pracArray[ECityPrac.Build] = { count = 0, Lv = 0 };

function City.Initialize()
  --代縣====================================================================
  this.cities[1] = CityData.New();
  this.cities[1].name = 60051;
  this.cities[1].big = 63000;
  this.cities[1].base = 12071;

  this.cities[1].fight.sceneId = 12075;
  this.cities[1].fight.position.x = 182;
  this.cities[1].fight.position.y = 2355;

  this.cities[1].tents[ECamp.Defend].sceneId = 12307;
  this.cities[1].tents[ECamp.Defend].position.x = 300;
  this.cities[1].tents[ECamp.Defend].position.y = 300;
  this.cities[1].tents[ECamp.Attack].sceneId = 12306;
  this.cities[1].tents[ECamp.Attack].position.x = 300;
  this.cities[1].tents[ECamp.Attack].position.y = 300;

  this.cities[1].bank = 12264;
  this.cities[1].inn = 12245;
  this.cities[1].pharmacy = 12224;
  this.cities[1].iron = 12205;
  this.cities[1].npcId = 39001;

  this.cities[1].streets[1] = 12072;
  this.cities[1].streets[2] = 12073;
  this.cities[1].streets[3] = 12074;
  --街道
  this.cities[1].toStreets[1][ECityScene.Bank].x = 0;
  this.cities[1].toStreets[1][ECityScene.Bank].y = 0;
  this.cities[1].toStreets[1][ECityScene.Inn].x = 0;
  this.cities[1].toStreets[1][ECityScene.Inn].y = 0;
  this.cities[1].toStreets[1][ECityScene.Pharmacy].x = 0;
  this.cities[1].toStreets[1][ECityScene.Pharmacy].y = 0;
  this.cities[1].toStreets[1][ECityScene.Iron].x = 0;
  this.cities[1].toStreets[1][ECityScene.Iron].y = 0;

  this.cities[1].toStreets[2][ECityScene.Bank].x = 7*20;
  this.cities[1].toStreets[2][ECityScene.Bank].y = 19*20;
  this.cities[1].toStreets[2][ECityScene.Inn].x = 36*20;
  this.cities[1].toStreets[2][ECityScene.Inn].y = 18*20;
  this.cities[1].toStreets[2][ECityScene.Pharmacy].x = 25*20;
  this.cities[1].toStreets[2][ECityScene.Pharmacy].y = 19*20;
  this.cities[1].toStreets[2][ECityScene.Iron].x = 0;
  this.cities[1].toStreets[2][ECityScene.Iron].y = 0;

  this.cities[1].toStreets[3][ECityScene.Bank].x = 7*20;
  this.cities[1].toStreets[3][ECityScene.Bank].y = 19*20;
  this.cities[1].toStreets[3][ECityScene.Inn].x = 36*20;
  this.cities[1].toStreets[3][ECityScene.Inn].y = 18*20;
  this.cities[1].toStreets[3][ECityScene.Pharmacy].x = 25*20;
  this.cities[1].toStreets[3][ECityScene.Pharmacy].y = 19*20;
  this.cities[1].toStreets[3][ECityScene.Iron].x = 45*20;
  this.cities[1].toStreets[3][ECityScene.Iron].y = 18*20;

  this.cities[1].fromFight.x = 142;
  this.cities[1].fromFight.y = 475;
  this.cities[1].fromBase.x = 1142;
  this.cities[1].fromBase.y = 435;
  --城牆
  this.cities[1].cityWall.sceneId = 12075;
  this.cities[1].cityWall.position.x = 60*20;
  this.cities[1].cityWall.position.y = 4*20;
  --城門
  this.cities[1].cityGate.npcId = 37011;
  this.cities[1].cityGate.position.x = 1590;
  this.cities[1].cityGate.position.y = 537;
  --木門
  this.cities[1].woodGate.npcId = 37010;
  this.cities[1].woodGate.position.x = 1220;
  this.cities[1].woodGate.position.y = 1180;
  --預設的GarNpc
  this.cities[1].defGarNpcs[1].npcId = 37002;
  this.cities[1].defGarNpcs[1].position.x = 68*20;
  this.cities[1].defGarNpcs[1].position.y = 22*20;

  this.cities[1].defGarNpcs[2].npcId = 37002;
  this.cities[1].defGarNpcs[2].position.x = 86*20;
  this.cities[1].defGarNpcs[2].position.y = 32*20;

  this.cities[1].defGarNpcs[3].npcId = 37007;
  this.cities[1].defGarNpcs[3].position.x = 72*20;
  this.cities[1].defGarNpcs[3].position.y = 24*20;

  this.cities[1].defGarNpcs[4].npcId = 37007;
  this.cities[1].defGarNpcs[4].position.x = 82*20;
  this.cities[1].defGarNpcs[4].position.y = 30*20;

  this.cities[1].defGarNpcs[5].npcId = 37007;
  this.cities[1].defGarNpcs[5].position.x = 72*20;
  this.cities[1].defGarNpcs[5].position.y = 31*20;

  this.cities[1].defGarNpcs[6].npcId = 37007;
  this.cities[1].defGarNpcs[6].position.x = 61*20;
  this.cities[1].defGarNpcs[6].position.y = 50*20;

  this.cities[1].defGarNpcs[7].npcId = 37007;
  this.cities[1].defGarNpcs[7].position.x = 69*20;
  this.cities[1].defGarNpcs[7].position.y = 53*20;

  this.cities[1].defGarNpcs[8].npcId = 37001;
  this.cities[1].defGarNpcs[8].position.x = 76*20;
  this.cities[1].defGarNpcs[8].position.y = 27*20;

  this.cities[1].defGarNpcs[9].npcId = 37001;
  this.cities[1].defGarNpcs[9].position.x = 69*20;
  this.cities[1].defGarNpcs[9].position.y = 29*20;

  this.cities[1].defGarNpcs[10].npcId = 37001;
  this.cities[1].defGarNpcs[10].position.x = 76*20;
  this.cities[1].defGarNpcs[10].position.y = 33*20;

  this.cities[1].defGarNpcs[11].npcId = 37001;
  this.cities[1].defGarNpcs[11].position.x = 64*20;
  this.cities[1].defGarNpcs[11].position.y = 29*20;

  this.cities[1].defGarNpcs[12].npcId = 37001;
  this.cities[1].defGarNpcs[12].position.x = 77*20;
  this.cities[1].defGarNpcs[12].position.y = 37*20;

  this.cities[1].defGarNpcs[13].npcId = 37001;
  this.cities[1].defGarNpcs[13].position.x = 65*20;
  this.cities[1].defGarNpcs[13].position.y = 52*20;

  this.cities[1].defGarNpcs[14].npcId = 37005;
  this.cities[1].defGarNpcs[14].position.x = 63*20;
  this.cities[1].defGarNpcs[14].position.y = 23*20;

  this.cities[1].defGarNpcs[15].npcId = 37006;
  this.cities[1].defGarNpcs[15].position.x = 86*20;
  this.cities[1].defGarNpcs[15].position.y = 37*20;

  this.cities[1].defGarNpcs[16].npcId = 37004;
  this.cities[1].defGarNpcs[16].position.x = 67*20;
  this.cities[1].defGarNpcs[16].position.y = 34*20;

  --真定城====================================================================
  this.cities[2] = CityData.New();
  this.cities[2].name = 60052;
  this.cities[2].big = 12001;
  this.cities[2].base = 12081;

  this.cities[2].fight.sceneId = 12085;
  this.cities[2].fight.position.x = 182;
  this.cities[2].fight.position.y = 2355;

  this.cities[2].tents[ECamp.Defend].sceneId = 12309;
  this.cities[2].tents[ECamp.Defend].position.x = 300;
  this.cities[2].tents[ECamp.Defend].position.y = 300;
  this.cities[2].tents[ECamp.Attack].sceneId = 12308;
  this.cities[2].tents[ECamp.Attack].position.x = 300;
  this.cities[2].tents[ECamp.Attack].position.y = 300;

  this.cities[2].bank = 12265;
  this.cities[2].inn = 12246;
  this.cities[2].pharmacy = 12225;
  this.cities[2].iron = 12206;
  this.cities[2].npcId = 39003;

  this.cities[2].streets[1] = 12082;
  this.cities[2].streets[2] = 12083;
  this.cities[2].streets[3] = 12084;

  this.cities[2].toStreets[1][ECityScene.Bank].x = 0;
  this.cities[2].toStreets[1][ECityScene.Bank].y = 0;
  this.cities[2].toStreets[1][ECityScene.Inn].x = 0;
  this.cities[2].toStreets[1][ECityScene.Inn].y = 0;
  this.cities[2].toStreets[1][ECityScene.Pharmacy].x = 0;
  this.cities[2].toStreets[1][ECityScene.Pharmacy].y = 0;
  this.cities[2].toStreets[1][ECityScene.Iron].x = 0;
  this.cities[2].toStreets[1][ECityScene.Iron].y = 0;

  this.cities[2].toStreets[2][ECityScene.Bank].x = 7*20;
  this.cities[2].toStreets[2][ECityScene.Bank].y = 19*20;
  this.cities[2].toStreets[2][ECityScene.Inn].x = 36*20;
  this.cities[2].toStreets[2][ECityScene.Inn].y = 18*20;
  this.cities[2].toStreets[2][ECityScene.Pharmacy].x = 25*20;
  this.cities[2].toStreets[2][ECityScene.Pharmacy].y = 19*20;
  this.cities[2].toStreets[2][ECityScene.Iron].x = 0;
  this.cities[2].toStreets[2][ECityScene.Iron].y = 0;

  this.cities[2].toStreets[3][ECityScene.Bank].x = 7*20;
  this.cities[2].toStreets[3][ECityScene.Bank].y = 19*20;
  this.cities[2].toStreets[3][ECityScene.Inn].x = 36*20;
  this.cities[2].toStreets[3][ECityScene.Inn].y = 18*20;
  this.cities[2].toStreets[3][ECityScene.Pharmacy].x = 25*20;
  this.cities[2].toStreets[3][ECityScene.Pharmacy].y = 19*20;
  this.cities[2].toStreets[3][ECityScene.Iron].x = 45*20;
  this.cities[2].toStreets[3][ECityScene.Iron].y = 18*20;

  this.cities[2].fromFight.x = 142;
  this.cities[2].fromFight.y = 475;
  this.cities[2].fromBase.x = 1142;
  this.cities[2].fromBase.y = 435;

  --城牆
  this.cities[2].cityWall.sceneId = 12085;
  this.cities[2].cityWall.position.x = 60*20;
  this.cities[2].cityWall.position.y = 4*20;
  --城門
  this.cities[2].cityGate.npcId = 37011;
  this.cities[2].cityGate.position.x = 1590;
  this.cities[2].cityGate.position.y = 537;
  --木門
  this.cities[2].woodGate.npcId = 37010;
  this.cities[2].woodGate.position.x = 1080;
  this.cities[2].woodGate.position.y = 1060;
  --預設的GarNpc
  this.cities[2].defGarNpcs[1].npcId = 37007;
  this.cities[2].defGarNpcs[1].position.x = 80*20;
  this.cities[2].defGarNpcs[1].position.y = 13*20;

  this.cities[2].defGarNpcs[2].npcId = 37007;
  this.cities[2].defGarNpcs[2].position.x = 86*20;
  this.cities[2].defGarNpcs[2].position.y = 16*20;

  this.cities[2].defGarNpcs[3].npcId = 37007;
  this.cities[2].defGarNpcs[3].position.x = 69*20;
  this.cities[2].defGarNpcs[3].position.y = 27*20;

  this.cities[2].defGarNpcs[4].npcId = 37007;
  this.cities[2].defGarNpcs[4].position.x = 79*20;
  this.cities[2].defGarNpcs[4].position.y = 33*20;

  this.cities[2].defGarNpcs[5].npcId = 37001;
  this.cities[2].defGarNpcs[5].position.x = 65*20;
  this.cities[2].defGarNpcs[5].position.y = 24*20;

  this.cities[2].defGarNpcs[6].npcId = 37001;
  this.cities[2].defGarNpcs[6].position.x = 74*20;
  this.cities[2].defGarNpcs[6].position.y = 30*20;

  this.cities[2].defGarNpcs[7].npcId = 37001;
  this.cities[2].defGarNpcs[7].position.x = 84*20;
  this.cities[2].defGarNpcs[7].position.y = 36*20;

  this.cities[2].defGarNpcs[8].npcId = 37001;
  this.cities[2].defGarNpcs[8].position.x = 65*20;
  this.cities[2].defGarNpcs[8].position.y = 30*20;

  this.cities[2].defGarNpcs[9].npcId = 37001;
  this.cities[2].defGarNpcs[9].position.x = 76*20;
  this.cities[2].defGarNpcs[9].position.y = 36*20;

  this.cities[2].defGarNpcs[10].npcId = 37002;
  this.cities[2].defGarNpcs[10].position.x = 71*20;
  this.cities[2].defGarNpcs[10].position.y = 33*20;

  this.cities[2].defGarNpcs[11].npcId = 37002;
  this.cities[2].defGarNpcs[11].position.x = 54*20;
  this.cities[2].defGarNpcs[11].position.y = 45*20;

  this.cities[2].defGarNpcs[12].npcId = 37002;
  this.cities[2].defGarNpcs[12].position.x = 57*20;
  this.cities[2].defGarNpcs[12].position.y = 47*20;

  this.cities[2].defGarNpcs[13].npcId = 37002;
  this.cities[2].defGarNpcs[13].position.x = 61*20;
  this.cities[2].defGarNpcs[13].position.y = 48*20;

  this.cities[2].defGarNpcs[14].npcId = 37005;
  this.cities[2].defGarNpcs[14].position.x = 66*20;
  this.cities[2].defGarNpcs[14].position.y = 37*20;

  --臨淄城====================================================================
  this.cities[3] = CityData.New();
  this.cities[3].name = 60053;
  this.cities[3].big = 11000;
  this.cities[3].base = 11031;

  this.cities[3].fight.sceneId = 11035;
  this.cities[3].fight.position.x = 182;
  this.cities[3].fight.position.y = 2355;

  this.cities[3].tents[ECamp.Defend].sceneId = 11304;
  this.cities[3].tents[ECamp.Defend].position.x = 300;
  this.cities[3].tents[ECamp.Defend].position.y = 300;
  this.cities[3].tents[ECamp.Attack].sceneId = 11303;
  this.cities[3].tents[ECamp.Attack].position.x = 300;
  this.cities[3].tents[ECamp.Attack].position.y = 300;

  this.cities[3].bank = 11262;
  this.cities[3].inn = 11243;
  this.cities[3].pharmacy = 11222;
  this.cities[3].iron = 11202;
  this.cities[3].npcId = 39002;

  this.cities[3].streets[1] = 11032;
  this.cities[3].streets[2] = 11033;
  this.cities[3].streets[3] = 11034;
  
  this.cities[3].toStreets[1][ECityScene.Bank].x = 0;
  this.cities[3].toStreets[1][ECityScene.Bank].y = 0;
  this.cities[3].toStreets[1][ECityScene.Inn].x = 0;
  this.cities[3].toStreets[1][ECityScene.Inn].y = 0;
  this.cities[3].toStreets[1][ECityScene.Pharmacy].x = 0;
  this.cities[3].toStreets[1][ECityScene.Pharmacy].y = 0;
  this.cities[3].toStreets[1][ECityScene.Iron].x = 0;
  this.cities[3].toStreets[1][ECityScene.Iron].y = 0;

  this.cities[3].toStreets[2][ECityScene.Bank].x = 7*20;
  this.cities[3].toStreets[2][ECityScene.Bank].y = 19*20;
  this.cities[3].toStreets[2][ECityScene.Inn].x = 36*20;
  this.cities[3].toStreets[2][ECityScene.Inn].y = 18*20;
  this.cities[3].toStreets[2][ECityScene.Pharmacy].x = 25*20;
  this.cities[3].toStreets[2][ECityScene.Pharmacy].y = 19*20;
  this.cities[3].toStreets[2][ECityScene.Iron].x = 0;
  this.cities[3].toStreets[2][ECityScene.Iron].y = 0;

  this.cities[3].toStreets[3][ECityScene.Bank].x = 7*20;
  this.cities[3].toStreets[3][ECityScene.Bank].y = 19*20;
  this.cities[3].toStreets[3][ECityScene.Inn].x = 36*20;
  this.cities[3].toStreets[3][ECityScene.Inn].y = 18*20;
  this.cities[3].toStreets[3][ECityScene.Pharmacy].x = 25*20;
  this.cities[3].toStreets[3][ECityScene.Pharmacy].y = 19*20;
  this.cities[3].toStreets[3][ECityScene.Iron].x = 45*20;
  this.cities[3].toStreets[3][ECityScene.Iron].y = 18*20;

  this.cities[3].fromFight.x = 142;
  this.cities[3].fromFight.y = 475;
  this.cities[3].fromBase.x = 1142;
  this.cities[3].fromBase.y = 435;

  --城牆
  this.cities[3].cityWall.sceneId = 11035;
  this.cities[3].cityWall.position.x = 60*20;
  this.cities[3].cityWall.position.y = 4*20;
  --城門
  this.cities[3].cityGate.npcId = 37011;
  this.cities[3].cityGate.position.x = 1590;
  this.cities[3].cityGate.position.y = 537;
  --木門
  this.cities[3].woodGate.npcId = 37010;
  this.cities[3].woodGate.position.x = 1220;
  this.cities[3].woodGate.position.y = 1180;
  --預設的GarNpc
  this.cities[3].defGarNpcs[1].npcId = 37007;
  this.cities[3].defGarNpcs[1].position.x = 69*20;
  this.cities[3].defGarNpcs[1].position.y = 23*20;

  this.cities[3].defGarNpcs[2].npcId = 37007;
  this.cities[3].defGarNpcs[2].position.x = 83*20;
  this.cities[3].defGarNpcs[2].position.y = 15*20;

  this.cities[3].defGarNpcs[3].npcId = 37007;
  this.cities[3].defGarNpcs[3].position.x = 83*20;
  this.cities[3].defGarNpcs[3].position.y = 32*20;

  this.cities[3].defGarNpcs[4].npcId = 37007;
  this.cities[3].defGarNpcs[4].position.x = 60*20;
  this.cities[3].defGarNpcs[4].position.y = 50*20;

  this.cities[3].defGarNpcs[5].npcId = 37007;
  this.cities[3].defGarNpcs[5].position.x = 64*20;
  this.cities[3].defGarNpcs[5].position.y = 52*20;

  this.cities[3].defGarNpcs[6].npcId = 37007;
  this.cities[3].defGarNpcs[6].position.x = 69*20;
  this.cities[3].defGarNpcs[6].position.y = 54*20;

  this.cities[3].defGarNpcs[7].npcId = 37001;
  this.cities[3].defGarNpcs[7].position.x = 70*20;
  this.cities[3].defGarNpcs[7].position.y = 27*20;

  this.cities[3].defGarNpcs[8].npcId = 37001;
  this.cities[3].defGarNpcs[8].position.x = 77*20;
  this.cities[3].defGarNpcs[8].position.y = 31*20;

  this.cities[3].defGarNpcs[9].npcId = 37001;
  this.cities[3].defGarNpcs[9].position.x = 61*20;
  this.cities[3].defGarNpcs[9].position.y = 35*20;

  this.cities[3].defGarNpcs[10].npcId = 37001;
  this.cities[3].defGarNpcs[10].position.x = 71*20;
  this.cities[3].defGarNpcs[10].position.y = 41*20;

  this.cities[3].defGarNpcs[11].npcId = 37002;
  this.cities[3].defGarNpcs[11].position.x = 63*20;
  this.cities[3].defGarNpcs[11].position.y = 30*20;

  this.cities[3].defGarNpcs[12].npcId = 37002;
  this.cities[3].defGarNpcs[12].position.x = 77*20;
  this.cities[3].defGarNpcs[12].position.y = 37*20;

  this.cities[3].defGarNpcs[13].npcId = 37002;
  this.cities[3].defGarNpcs[13].position.x = 66*20;
  this.cities[3].defGarNpcs[13].position.y = 37*20;

  this.cities[3].defGarNpcs[14].npcId = 37006;
  this.cities[3].defGarNpcs[14].position.x = 71*20;
  this.cities[3].defGarNpcs[14].position.y = 31*20;

  this.cities[3].defGarNpcs[15].npcId = 37004;
  this.cities[3].defGarNpcs[15].position.x = 56*20;
  this.cities[3].defGarNpcs[15].position.y = 31*20;

  this.cities[3].defGarNpcs[16].npcId = 37005;
  this.cities[3].defGarNpcs[16].position.x = 77*20;
  this.cities[3].defGarNpcs[16].position.y = 44*20;

  --琅琊城====================================================================
  this.cities[4] = CityData.New();
  this.cities[4].name = 60054;
  this.cities[4].big = 11000;
  this.cities[4].base = 11041;

  this.cities[4].fight.sceneId = 11045;
  this.cities[4].fight.position.x = 182;
  this.cities[4].fight.position.y = 2355;

  this.cities[4].tents[ECamp.Defend].sceneId = 11305;
  this.cities[4].tents[ECamp.Defend].position.x = 300;
  this.cities[4].tents[ECamp.Defend].position.y = 300;
  this.cities[4].tents[ECamp.Attack].sceneId = 11306;
  this.cities[4].tents[ECamp.Attack].position.x = 300;
  this.cities[4].tents[ECamp.Attack].position.y = 300;

  this.cities[4].bank = 11263;
  this.cities[4].inn = 11244;
  this.cities[4].pharmacy = 11223;
  this.cities[4].iron = 11203;
  this.cities[4].npcId = 39004;

  this.cities[4].streets[1] = 11032;
  this.cities[4].streets[2] = 11033;
  this.cities[4].streets[3] = 11034;

  this.cities[4].toStreets[1][ECityScene.Bank].x = 0;
  this.cities[4].toStreets[1][ECityScene.Bank].y = 0;
  this.cities[4].toStreets[1][ECityScene.Inn].x = 0;
  this.cities[4].toStreets[1][ECityScene.Inn].y = 0;
  this.cities[4].toStreets[1][ECityScene.Pharmacy].x = 0;
  this.cities[4].toStreets[1][ECityScene.Pharmacy].y = 0;
  this.cities[4].toStreets[1][ECityScene.Iron].x = 0;
  this.cities[4].toStreets[1][ECityScene.Iron].y = 0;
  this.cities[4].toStreets[2][ECityScene.Bank].x = 7*20;
  this.cities[4].toStreets[2][ECityScene.Bank].y = 19*20;
  this.cities[4].toStreets[2][ECityScene.Inn].x = 36*20;
  this.cities[4].toStreets[2][ECityScene.Inn].y = 18*20;
  this.cities[4].toStreets[2][ECityScene.Pharmacy].x = 25*20;
  this.cities[4].toStreets[2][ECityScene.Pharmacy].y = 19*20;
  this.cities[4].toStreets[2][ECityScene.Iron].x = 0;
  this.cities[4].toStreets[2][ECityScene.Iron].y = 0;
  this.cities[4].toStreets[3][ECityScene.Bank].x = 7*20;
  this.cities[4].toStreets[3][ECityScene.Bank].y = 19*20;
  this.cities[4].toStreets[3][ECityScene.Inn].x = 36*20;
  this.cities[4].toStreets[3][ECityScene.Inn].y = 18*20;
  this.cities[4].toStreets[3][ECityScene.Pharmacy].x = 25*20;
  this.cities[4].toStreets[3][ECityScene.Pharmacy].y = 19*20;
  this.cities[4].toStreets[3][ECityScene.Iron].x = 45*20;
  this.cities[4].toStreets[3][ECityScene.Iron].y = 18*20;

  this.cities[4].fromFight.x = 142;
  this.cities[4].fromFight.y = 475;
  this.cities[4].fromBase.x = 1142;
  this.cities[4].fromBase.y = 435;

  --城牆
  this.cities[4].cityWall.sceneId = 11045;
  this.cities[4].cityWall.position.x = 60*20;
  this.cities[4].cityWall.position.y = 4*20;
  --城門
  this.cities[4].cityGate.npcId = 37011;
  this.cities[4].cityGate.position.x = 1590;
  this.cities[4].cityGate.position.y = 537;
  --木門
  this.cities[4].woodGate.npcId = 37010;
  this.cities[4].woodGate.position.x = 1080;
  this.cities[4].woodGate.position.y = 1060;

  --預設的GarNpc
  this.cities[4].defGarNpcs[1].npcId = 37007;
  this.cities[4].defGarNpcs[1].position.x = 72*20;
  this.cities[4].defGarNpcs[1].position.y = 27*20;

  this.cities[4].defGarNpcs[2].npcId = 37007;
  this.cities[4].defGarNpcs[2].position.x = 75*20;
  this.cities[4].defGarNpcs[2].position.y = 29*20;

  this.cities[4].defGarNpcs[3].npcId = 37007;
  this.cities[4].defGarNpcs[3].position.x = 78*20;
  this.cities[4].defGarNpcs[3].position.y = 31*20;

  this.cities[4].defGarNpcs[4].npcId = 37007;
  this.cities[4].defGarNpcs[4].position.x = 53*20;
  this.cities[4].defGarNpcs[4].position.y = 46*20;

  this.cities[4].defGarNpcs[5].npcId = 37007;
  this.cities[4].defGarNpcs[5].position.x = 56*20;
  this.cities[4].defGarNpcs[5].position.y = 48*20;

  this.cities[4].defGarNpcs[6].npcId = 37007;
  this.cities[4].defGarNpcs[6].position.x = 60*20;
  this.cities[4].defGarNpcs[6].position.y = 54*20;

  this.cities[4].defGarNpcs[7].npcId = 37001;
  this.cities[4].defGarNpcs[7].position.x = 65*20;
  this.cities[4].defGarNpcs[7].position.y = 27*20;

  this.cities[4].defGarNpcs[8].npcId = 37001;
  this.cities[4].defGarNpcs[8].position.x = 81*20;
  this.cities[4].defGarNpcs[8].position.y = 36*20;

  this.cities[4].defGarNpcs[9].npcId = 37001;
  this.cities[4].defGarNpcs[9].position.x = 47*20;
  this.cities[4].defGarNpcs[9].position.y = 52*20;

  this.cities[4].defGarNpcs[10].npcId = 37001;
  this.cities[4].defGarNpcs[10].position.x = 53*20;
  this.cities[4].defGarNpcs[10].position.y = 55*20;

  this.cities[4].defGarNpcs[11].npcId = 37002;
  this.cities[4].defGarNpcs[11].position.x = 69*20;
  this.cities[4].defGarNpcs[11].position.y = 21*20;

  this.cities[4].defGarNpcs[12].npcId = 37002;
  this.cities[4].defGarNpcs[12].position.x = 63*20;
  this.cities[4].defGarNpcs[12].position.y = 21*20;

  this.cities[4].defGarNpcs[13].npcId = 37002;
  this.cities[4].defGarNpcs[13].position.x = 89*20;
  this.cities[4].defGarNpcs[13].position.y = 36*20;

  this.cities[4].defGarNpcs[14].npcId = 37004;
  this.cities[4].defGarNpcs[14].position.x = 74*20;
  this.cities[4].defGarNpcs[14].position.y = 34*20;

  this.cities[4].defGarNpcs[15].npcId = 37005;
  this.cities[4].defGarNpcs[15].position.x = 69*20;
  this.cities[4].defGarNpcs[15].position.y = 31*20;

  --大漠城====================================================================
  this.cities[5] = CityData.New();
  this.cities[5].name = 60055;
  this.cities[5].big = 19000;
  this.cities[5].base = 19031;

  this.cities[5].fight.sceneId = 19035;
  this.cities[5].fight.position.x = 182;
  this.cities[5].fight.position.y = 2355;

  this.cities[5].tents[ECamp.Defend].sceneId = 19303;
  this.cities[5].tents[ECamp.Defend].position.x = 300;
  this.cities[5].tents[ECamp.Defend].position.y = 300;
  this.cities[5].tents[ECamp.Attack].sceneId = 19302;
  this.cities[5].tents[ECamp.Attack].position.x = 300;
  this.cities[5].tents[ECamp.Attack].position.y = 300;

  this.cities[5].bank = 19262;
  this.cities[5].inn = 19242;
  this.cities[5].pharmacy = 19221;
  this.cities[5].iron = 19201;
  this.cities[5].npcId = 39005;

  this.cities[5].streets[1] = 19032;
  this.cities[5].streets[2] = 19033;
  this.cities[5].streets[3] = 19034;

  this.cities[5].toStreets[1][ECityScene.Bank].x = 0;
  this.cities[5].toStreets[1][ECityScene.Bank].y = 0;
  this.cities[5].toStreets[1][ECityScene.Inn].x = 0;
  this.cities[5].toStreets[1][ECityScene.Inn].y = 0;
  this.cities[5].toStreets[1][ECityScene.Pharmacy].x = 0;
  this.cities[5].toStreets[1][ECityScene.Pharmacy].y = 0;
  this.cities[5].toStreets[1][ECityScene.Iron].x = 0;
  this.cities[5].toStreets[1][ECityScene.Iron].y = 0;

  this.cities[5].toStreets[2][ECityScene.Bank].x = 7*20;
  this.cities[5].toStreets[2][ECityScene.Bank].y = 19*20;
  this.cities[5].toStreets[2][ECityScene.Inn].x = 36*20;
  this.cities[5].toStreets[2][ECityScene.Inn].y = 18*20;
  this.cities[5].toStreets[2][ECityScene.Pharmacy].x = 25*20;
  this.cities[5].toStreets[2][ECityScene.Pharmacy].y = 19*20;
  this.cities[5].toStreets[2][ECityScene.Iron].x = 0;
  this.cities[5].toStreets[2][ECityScene.Iron].y = 0;

  this.cities[5].toStreets[3][ECityScene.Bank].x = 7*20;
  this.cities[5].toStreets[3][ECityScene.Bank].y = 19*20;
  this.cities[5].toStreets[3][ECityScene.Inn].x = 36*20;
  this.cities[5].toStreets[3][ECityScene.Inn].y = 18*20;
  this.cities[5].toStreets[3][ECityScene.Pharmacy].x = 25*20;
  this.cities[5].toStreets[3][ECityScene.Pharmacy].y = 19*20;
  this.cities[5].toStreets[3][ECityScene.Iron].x = 45*20;
  this.cities[5].toStreets[3][ECityScene.Iron].y = 18*20;

  this.cities[5].fromFight.x = 142;
  this.cities[5].fromFight.y = 475;
  this.cities[5].fromBase.x = 1142;
  this.cities[5].fromBase.y = 435;

  --城牆
  this.cities[5].cityWall.sceneId = 19035;
  this.cities[5].cityWall.position.x = 6*20;
  this.cities[5].cityWall.position.y = 35*20;
  --城門
  this.cities[5].cityGate.npcId = 37011;
  this.cities[5].cityGate.position.x = 902;
  this.cities[5].cityGate.position.y = 536;
  --木門
  this.cities[5].woodGate.npcId = 37010;
  this.cities[5].woodGate.position.x = 1550;
  this.cities[5].woodGate.position.y = 1260;

  --預設的GarNpc
  this.cities[5].defGarNpcs[1].npcId = 37007;
  this.cities[5].defGarNpcs[1].position.x = 64*20;
  this.cities[5].defGarNpcs[1].position.y = 28*20;

  this.cities[5].defGarNpcs[2].npcId = 37007;
  this.cities[5].defGarNpcs[2].position.x = 48*20;
  this.cities[5].defGarNpcs[2].position.y = 40*20;

  this.cities[5].defGarNpcs[3].npcId = 37007;
  this.cities[5].defGarNpcs[3].position.x = 74*20;
  this.cities[5].defGarNpcs[3].position.y = 53*20;

  this.cities[5].defGarNpcs[4].npcId = 37001;
  this.cities[5].defGarNpcs[4].position.x = 42*20;
  this.cities[5].defGarNpcs[4].position.y = 33*20;

  this.cities[5].defGarNpcs[5].npcId = 37001;
  this.cities[5].defGarNpcs[5].position.x = 42*20;
  this.cities[5].defGarNpcs[5].position.y = 33*20;

  this.cities[5].defGarNpcs[6].npcId = 37001;
  this.cities[5].defGarNpcs[6].position.x = 48*20;
  this.cities[5].defGarNpcs[6].position.y = 34*20;

  this.cities[5].defGarNpcs[7].npcId = 37001;
  this.cities[5].defGarNpcs[7].position.x = 56*20;
  this.cities[5].defGarNpcs[7].position.y = 28*20;

  this.cities[5].defGarNpcs[8].npcId = 37001;
  this.cities[5].defGarNpcs[8].position.x = 56*20;
  this.cities[5].defGarNpcs[8].position.y = 33*20;

  this.cities[5].defGarNpcs[9].npcId = 37001;
  this.cities[5].defGarNpcs[9].position.x = 80*20;
  this.cities[5].defGarNpcs[9].position.y = 54*20;

  this.cities[5].defGarNpcs[10].npcId = 37001;
  this.cities[5].defGarNpcs[10].position.x = 72*20;
  this.cities[5].defGarNpcs[10].position.y = 58*20;

  this.cities[5].defGarNpcs[11].npcId = 37001;
  this.cities[5].defGarNpcs[11].position.x = 84*20;
  this.cities[5].defGarNpcs[11].position.y = 63*20;

  this.cities[5].defGarNpcs[12].npcId = 37001;
  this.cities[5].defGarNpcs[12].position.x = 80*20;
  this.cities[5].defGarNpcs[12].position.y = 66*20;

  this.cities[5].defGarNpcs[13].npcId = 37002;
  this.cities[5].defGarNpcs[13].position.x = 58*20;
  this.cities[5].defGarNpcs[13].position.y = 29*20;

  this.cities[5].defGarNpcs[14].npcId = 37006;
  this.cities[5].defGarNpcs[14].position.x = 61*20;
  this.cities[5].defGarNpcs[14].position.y = 21*20;

  this.cities[5].defGarNpcs[15].npcId = 37004;
  this.cities[5].defGarNpcs[15].position.x = 60*20;
  this.cities[5].defGarNpcs[15].position.y = 36*20;

  this.cities[5].defGarNpcs[16].npcId = 37005;
  this.cities[5].defGarNpcs[16].position.x = 38*20;
  this.cities[5].defGarNpcs[16].position.y = 38*20;

  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
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

function City.ClearMyOrganization()
  for k in pairs(this.pracArray) do
    this.pracArray[k].count = 0;
    this.pracArray[k].Lv = 0;
  end
end

function City.SetCityData(cityId, data)
  if this.cities[cityId] == nil then return end
  
  this.cities[cityId].level = data:ReadByte();
  this.cities[cityId].isOnWar = data:ReadBoolean();
  local orgName = data:ReadString(data:ReadByte());

  this.cities[cityId].chief = data:ReadInt64();
  if Role.players[this.cities[cityId].chief] ~= nil then
    Role.players[this.cities[cityId].chief]:UpdateViewJMP();
  end

  this.cities[cityId].subChief1 = data:ReadInt64();
  if Role.players[this.cities[cityId].subChief1] ~= nil then
    Role.players[this.cities[cityId].subChief1]:UpdateViewJMP();
  end

  this.cities[cityId].subChief2 = data:ReadInt64();
  if Role.players[this.cities[cityId].subChief2] ~= nil then
    Role.players[this.cities[cityId].subChief2]:UpdateViewJMP();
  end
  
  this.cities[cityId].allyChief = data:ReadInt64();
  if Role.players[this.cities[cityId].allyChief] ~= nil then
    Role.players[this.cities[cityId].allyChief]:UpdateViewJMP();
  end

  this.cities[cityId].allySubChief1 = data:ReadInt64();
  if Role.players[this.cities[cityId].allySubChief1] ~= nil then
    Role.players[this.cities[cityId].allySubChief1]:UpdateViewJMP();
  end

  this.cities[cityId].allySubChief2 = data:ReadInt64();
  if Role.players[this.cities[cityId].allySubChief2] ~= nil then
    Role.players[this.cities[cityId].allySubChief2]:UpdateViewJMP();
  end

  this.cities[cityId].orgId = data:ReadUInt32();
  local allyName = data:ReadString(data:ReadByte());
  this.cities[cityId].allyId = data:ReadUInt32();

  for k in pairs(this.cities[cityId].stationLv) do
    this.cities[cityId].stationLv[k] = 0;
  end

  Organization.SetOrgName(this.cities[cityId].orgId, orgName);
  Organization.SetOrgName(this.cities[cityId].allyId, allyName);

  --[[
  {$ifDef Ensign}
  this.cities[cityId].orgEnsignIndex = CY_OrganManage.getOrgEnsignIndex(CityManage.this.cities[cityId].orgId);
  this.cities[cityId].allyEnsignIndex = CY_OrganManage.getOrgEnsignIndex(CityManage.this.cities[cityId].allyId);
  {$endif}
  ]]--
  
  if UI.IsVisible(UICityStation) then
    UICityStation.UpdateUI();
  end

  for k, role in pairs(Role.mapNpcs) do
    if role.npcId == this.cities[cityId].npcId then
      role:SetDirection(ERoleDirection.LeftDown + math.max(this.cities[cityId].level, 1));
    end
  end
end

function City.GetStationLv(cityId, stationId)
  if this.cities[cityId] == nil then return 0 end
  if this.cities[cityId].stationLv[stationId] == nil then return 0 end

  return this.cities[cityId].stationLv[stationId];
end

function City.SetStationLv(cityId, stationId, level, updateOther)
  if this.cities[cityId] == nil then return end
  
  this.cities[cityId].stationLv[stationId] = level;

  if updateOther == false then return end

  if UI.IsVisible(UICityStation) then
    UICityStation.UpdateUI();
  end
end

function City.GetCityId(sceneId, sceneKind)
  if sceneKind == nil then
    sceneKind = ECityScene.Fight;
  end

  for cityId, cityData in pairs(this.cities) do
    --戰場
    if Contains(sceneKind, ECityScene.Fight, ECityScene.All) then
      if cityData.fight.sceneId == sceneId then
        return cityId;
      end
    end

    --根據地
    if Contains(sceneKind, ECityScene.Base, ECityScene.All) then
      if cityData.base == sceneId then
        return cityId;
      end
    end

    --街道
    if Contains(sceneKind, ECityScene.Street, ECityScene.All) then
      for j = 1, 3 do
        if cityData.streets[j] == sceneId then
          return cityId;
        end
      end
    end
    
    --錢莊
    if Contains(sceneKind, ECityScene.Bank, ECityScene.All) then
      if cityData.bank == sceneId then
        return cityId;
      end
    end
    
    --客棧
    if Contains(sceneKind, ECityScene.Inn, ECityScene.All) then
      if cityData.inn == sceneId then
        return cityId;
      end
    end
    
    --藥店
    if Contains(sceneKind, ECityScene.Pharmacy, ECityScene.All) then
      if cityData.pharmacy == sceneId then
        return cityId;
      end
    end
    
    --鐵店
    if Contains(sceneKind, ECityScene.Iron, ECityScene.All) then
      if cityData.iron == sceneId then
        return cityId;
      end
    end
    
    --攻方營帳
    if Contains(sceneKind, ECityScene.Tent, ECityScene.All) then
      if cityData.tents[ECamp.Defend].sceneId == sceneId then
        return cityId;
      end
    
      if cityData.tents[ECamp.Attack].sceneId == sceneId then
        return cityId;
      end
    end
    
    if Contains(sceneKind, ECityScene.MapId, ECityScene.All) then
      if cityData.npcId == sceneId then
        return cityId;
      end
    end
  end

  return 0;
end

function City.GetCamp(orgId)
  local cityInfo = this.cities[this.cityId];

  if cityInfo == nil then return ECamp.Attack; end

  if Contains(orgId, cityInfo.orgId, cityInfo.allyId) then
    return ECamp.Defend;
  end

  return ECamp.Attack;
end

function City.IsOutSide(position, cityId, line, campOffsetY)
  local baseLineY = 0;
  local lineOffsetY = 0;
  local slope = 1;

  if campOffsetY == nil then
    campOffsetY = 0;
  end

  if cityId == 1 then
    slope = -0.53333;
    baseLineY = 506.6;

    if line == ECityLine.AttackCamp then --攻方準備區
      lineOffsetY = 1296;
    elseif line == ECityLine.Gate then --前哨站
      lineOffsetY = 0;
    elseif line == ECityLine.DefendCamp then --守方準備區
      lineOffsetY = -855;
    end

  elseif cityId == 2 then
    slope = -0.53333;
    baseLineY = 506.6;
    
    if line == ECityLine.AttackCamp then
      lineOffsetY = 1286;
    elseif line == ECityLine.Gate then
      lineOffsetY = -30;
    elseif line == ECityLine.DefendCamp then
      lineOffsetY = -855;
    end

  elseif cityId == 3 then
    slope = -0.53333;
    baseLineY = 506.6;
    
    if line == ECityLine.AttackCamp then
      lineOffsetY = 1296;
    elseif line == ECityLine.Gate then
      lineOffsetY = 0;
    elseif line == ECityLine.DefendCamp then
      lineOffsetY = -855;
    end

  elseif cityId == 4 then
    slope = -0.53333;
    baseLineY = 506.6;
    
    if line == ECityLine.AttackCamp then
      lineOffsetY = 1286;
    elseif line == ECityLine.Gate then
      lineOffsetY = -30;
    elseif line == ECityLine.DefendCamp then
      lineOffsetY = -855;
    end

  elseif cityId == 5 then
    slope = 0.5;
    baseLineY = 2026;
    
    if line == ECityLine.AttackCamp then
      lineOffsetY = 1048;
    elseif line == ECityLine.Gate then
      lineOffsetY = 0;
    elseif line == ECityLine.DefendCamp then
      lineOffsetY = -1088;
    end
  end

  return position.x * slope + position.y > baseLineY + lineOffsetY + campOffsetY;
end

function City.CheckMove(role, position)
  if this.cityId == 0 then return true end

  --觀戰中可自由移動
  if role.data.isWatching then return true end

  --gm可自由移動
  if Role.IsGM(role.index) then return true end

  --城門是否已破
  local doorOpen = Role.guardNpcs[2] == nil or Role.guardNpcs[2]:GetAttribute(EAttribute.Hp) == 0;
  
  local camp = City.GetCamp(role.data.orgId);
  if camp == ECamp.Defend then
    if doorOpen then
      outSide = this.IsOutSide(position, this.cityId, ECityLine.AttackCamp, this.defendLineOffset);
    else
      outSide = this.IsOutSide(position, this.cityId, ECityLine.Gate, this.defendLineOffset);
    end

    if not outSide then
      return true;
    end

    if role.data.equips[6] == 23199 then
      return true;
    end
  elseif camp == ECamp.Attack then
    if doorOpen then
      outSide = this.IsOutSide(position, this.cityId, ECityLine.DefendCamp, this.attackLineOffset);
    elseif this.isCrossWall then
      outSide = this.IsOutSide(position, this.cityId, ECityLine.DefendCamp, this.attackLineOffset) and not this.IsOutSide(position, this.cityId, ECityLine.Gate, this.defendLineOffset);
    else
      outSide = this.IsOutSide(position, this.cityId, ECityLine.Gate, this.attackLineOffset);
    end

    if outSide then
      return true;
    end
  end

  return false;
end

function City.GetResourceRate(orgId, resourceKind)
  if orgId == 0 then return 0 end

  local stationId = 0;
  if resourceKind == EOrgResource.Gold then
    stationId = ECityStation.Business;
  elseif resourceKind == EOrgResource.Grain then
    stationId = ECityStation.Barn;
  elseif resourceKind == EOrgResource.Mineral then
    stationId = ECityStation.Pit;
  elseif resourceKind == EOrgResource.Wood then
    stationId = ECityStation.Lumbering;
  elseif resourceKind == EOrgResource.Cloth then
    stationId = ECityStation.Drapery;
  else
    return 0;
  end
  
  local maxLv = 0;
  local count = 0;

  for i = 1, this.maxCity do
    if this.cities[i].orgId == orgId then
      if this.cities[i].stationLv[stationId] > 0 then
        if this.cities[i].stationLv[stationId] > aGetMaxLv then
          maxLv = this.cities[i].stationLv[stationId];
        end

        if this.cities[i].stationLv[stationId] == this.maxCityStationLv then
          count = count + 1;
        end
      end
    end
  end

  local rate = 0;

  if maxLv == 1 then
    rate = 0.2;
  elseif maxLv == 2 then
    rate = 0.5;
  elseif maxLv == 3 then
    rate = 1;
  end

  if count == 2 then
    rate = rate + 0.5;
  elseif count == 3 then
    rate = rate + 1;
  elseif count == 4 then
    rate = rate + 1.5;
  elseif count == 5 then
    rate = rate + 2;
  end

  return rate;
end

function City.IsCityChief(roleId, cityId)
  if roleId == nil or roleId == 0 then return false end

  if cityId == nil then
    for i = 1, this.maxCity do
      if this.cities[i].chief == roleId then
        return true;
      elseif this.cities[i].allyChief == roleId then
        return true;
      end
    end
  else
    if this.cities[cityId].chief == roleId then
      return true;
    elseif this.cities[cityId].allyChief == roleId then
      return true;
    end
  end

  return false;
end

function City.IsCitySubChief(roleId, cityId)
  if roleId == nil or roleId == 0 then return false end
  
  if cityId == nil then
    for i = 1, this.maxCity do
      if this.cities[i].subChief1 == roleId then
        return true;
      elseif this.cities[i].subChief2 == roleId then
        return true;
      elseif this.cities[i].allySubChief1 == roleId then
        return true;
      elseif this.cities[i].allySubChief2 == roleId then
        return true;
      end
    end
  else
    if this.cities[cityId].subChief1 == roleId then
      return true;
    elseif this.cities[cityId].subChief2 == roleId then
      return true;
    elseif this.cities[cityId].allySubChief1 == roleId then
      return true;
    elseif this.cities[cityId].allySubChief2 == roleId then
      return true;
    end
  end

  return false;
end

function City.Clear()
  this.isCrossWall = false;
end