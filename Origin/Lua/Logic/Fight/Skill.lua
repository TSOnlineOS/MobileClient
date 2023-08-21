--const
  --技能編號
  SK_HandFight=10000;     --肉搏

  MaxSkillMed=10;         --最大Skill中繼點
  MaxArmyHorse=5;         --萬馬的數量
  MaxArmyElephant=9;      --驅象突的數量
  MaxArmyElephant2=17;    --象的數量

--[[
Now Abraham was old and far on in years: and the Lord had given him everything in full measure.
And Abraham said to his chief servant, the manager of all his property, Come now, put your hand under my leg:
And take an oath by the Lord, the God of heaven and the God of the earth, that you will not get a wife for my son Isaac from the daughters of the Canaanites among whom I am living;
But that you will go into my country and to my relations and get a wife there for my son Isaac.
And the servant said, If by chance the woman will not come with me into this land, am I to take your son back again to the land from which you came?
And Abraham said, Take care that you do not let my son go back to that land.
The Lord God of heaven, who took me from my father's house and from the land of my birth, and made an oath to me, saying, To your seed I will give this land: he will send his angel before you and give you a wife for my son in that land.
And if the woman will not come with you, then you are free from this oath; only do not take my son back there.
And the servant put his hand under Abraham's leg, and gave him his oath about this thing.
And the servant took ten of his master's camels, and all sorts of good things of his master's, and went to Mesopotamia, to the town of Nahor.
And he made the camels take their rest outside the town by the water-spring in the evening, at the time when the women came to get water.
And he said, O Lord, the God of my master Abraham, let me do well in what I have undertaken this day, and give your mercy to my master Abraham.
See, I am waiting here by the water-spring; and the daughters of the town are coming out to get water:
Now, may the girl to whom I say, Let down your vessel and give me a drink, and who says in answer, Here is a drink for you and let me give water to your camels: may she be the one marked out by you for your servant Isaac: so may I be certain that you have been good to my master Abraham.
And even before his words were ended, Rebekah, the daughter of Bethuel, the son of Milcah, who was the wife of Nahor, Abraham's brother, came out with her water-vessel on her arm.
She was a very beautiful girl, a virgin, who had never been touched by a man: and she went down to the spring to get water in her vessel.
And the servant came running to her and said, Give me a little water from your vessel.
And she said, Take a drink, my lord: and quickly letting down her vessel onto her hand, she gave him a drink.
And having done so, she said, I will get water for your camels till they have had enough.
And after putting the water from her vessel into the animals' drinking-place, she went quickly back to the spring and got water for all the camels.
And the man, looking at her, said nothing, waiting to see if the Lord had given his journey a good outcome.
And when the camels had had enough, the man took a gold nose-ring, half a shekel in weight, and two ornaments for her arms of ten shekels weight of gold;
And said to her, Whose daughter are you? is there room in your father's house for us?
And she said to him, I am the daughter of Bethuel, the son of Milcah, Nahor's wife.
And she said, We have a great store of dry grass and cattle-food, and there is room for you.
And with bent head the man gave worship to the Lord;
And said, Praise be to the Lord, the God of my master Abraham, who has given a sign that he is good and true to my master, by guiding me straight to the house of my master's family.
]]--

  ESkill_Kind = 
  {
    None = 0,
    HandFight = 10000,          --肉搏
    Catch = 15001,              --捕抓
    CatchNet = 15002,           --捕網
    CatchSucess = 15003,        --捕網成功
    EnterFight = -1,         --進入戰鬥
    ExitFight = -2,          --離開戰鬥
    ExitFail = 18002,           --離開戰鬥失敗
    Detect = 14001,             --偵查
    Espace = 14002,             --遁逃術
    UseItem =19001,            --使用物品
    Dis =11,                --消除系專用
    Poor = 20004,               --衰神附身
    God = 20005,                --福神附身
    Spell = 20008,              --符咒動畫

--地系
    FallStone = 10001,          --落石
    FallWood = 10002,           --擂木
    BambooTrap = 10003,         --竹陷阱
    Clump = 10004,              --樹精
    ThrowStone = 10005,         --投石
    GrassTree = 10006,          --030605J草木皆兵 (地牙)
    RollStone = 10007,          --滾石
    FlySand = 10008,            --飛沙走石
    DisBoundary = 10009,        --030605J解結界
    Boundary = 10010,           --結界
    Taishan = 10011,            --泰山壓頂
    Doom = 10012,               --030530J天崩地裂
    ArmyHorse = 10013,          --萬馬奔騰                        
    DisMirror = 10014,          --030605J解鏡
    Mirror = 10015,             --030605J鏡
    Rocky3 = 10016,             --岩怪 小
    Rocky21 = 10017,            --岩怪 小中
    Rocky2 = 10018,             --岩怪 中
    Rocky1 = 10019,             --岩怪 大
    
    EarthSword = 10021,         --地裂無雙劍
    EarthShock = 10022,         --地動破
    ElephantsCrush = 10023,     --驅象突
    HorizontalCrush = 10024,    --橫掃千軍
    Landslip = 10025,           --土崩陣
    SoulMirror = 10026,         --靈鏡

    WeightlessWave = 10027,     --無間震波
    SpiritAxe = 10028,          --割天裂魂斧
    ShootingStarShell = 10029,  --流星鐵砲
    ToothedBall = 10030,        --狼星砲
    GoldShield = 10031,         --金鐘罩
    WarElephant = 10032,        --戰象衝鋒
    GravelSeize = 10033,        --砂瀑擒
    GiantSnake = 10034,         --黑屠岩王殺

    GrassTree3 = 10037,         --地牙叢生
    Mirror2 = 10038,            --萬華鏡
    EW_Mirror = 10039,          -- 銳土鏡
    EW_SoulMirror = 10040,      -- 盾土靈鏡
    EW_Boundary = 10041,        -- 深淵結界
    Taunt = 10042,              --有客來
    LavaLandslip = 10043,       --爆漿流沙
    EW_Doom = 10045,            --仁巴無敵

    ClumpAtk = 20001,           --樹精損血
    MirrorAtk = 20003,         --030722-1J  鏡,害傷反彈
    StarDoom = 22030,           --雌雄流星斬
    GroupImmunityShield = 22031, --魔王領域(免疫盾)
--水系
    Flood = 11001,              --淹水
    IceWall = 11002,            --冰牆
    IceSword = 11003,           --冰劍
    PureRiver = 11004,          --清流
    Fountain = 11005,           --湧泉
    AddSp = 11006,              --回魔
    Heal = 11007,               --治療
    FloodWater = 11008,         --洪水
    AllAddSp = 11009,           --全回魔
    AllHeal = 11010,            --全治療
    HailStone = 11011,          --冰雹
    DisStatus = 11012,          --狀態解除
    Revive = 11013,             --復活
    IceBound = 11014,           --冰封
    DisIce = 11015,             --融冰

    WaterGod3 = 11016,          --水神 小
    WaterGod21 = 11017,         --水神 小中
    WaterGod2 = 11018,          --水神 中
    WaterGod1 = 11019,          --水神 大
    
    IceCircularSaw = 11021,     --冰旋斬
    FreezeVigor = 11022,        --冰魄錐
    SnowWintwer = 11023,        --霜寒凍裂
    BrightMirror = 11024,       --明鏡止水
    StatusRelease = 11025,      --進階狀解
    BodyMindHealth = 11026,     --妙手回春

    SkyFreezeStrike = 11027,    --天迴冰舞
    FreezePunch = 11028,        --霜雷拳
    SuperRefillMana = 11029,    --超回魔術
    GodWater = 11030,           --天降甘霖
    SuperDissolve = 11031,      --超狀解術
    DarkMind = 11032,           --冥河無想
    KnightStrike = 11033,       --斬騎凜一閃
    SkyIceStrike = 11034,       --六迴天冰舞

    WaterSquad = 11037,         --噴水廣場
    WaterGun = 11038,           --水槍
    EW_IceBound = 11039,        -- 強效冰封
    EW_StatusRelease = 11040,   -- 強效狀解
    EW_KnightStrike = 11041,    --專武斬騎凜一閃
    HolyWater =  11042,         --天水之滴
    IceArrow = 11048,           --冰矢術

    DodgeDead = 11043,          --瀕死一閃
    QuakeWater = 11044,         --三面埋伏
    EW_SlowIceSword = 11045,    --專武遲鈍冰劍
    EW_ChaosIceSword = 11046,   --專武混亂冰劍
    Waterspout = 22025,         --清流水龍捲
    CrossingSongArrow = 22032,  --瞬詠穿心(夏語遙專武)
    IceCrystalsShield = 22044,  --冰晶守護
--火系
    Ablaze = 12001,             --縱火
    RagFire = 12002,            --烈火
    FireArrow = 12003,          --火箭
    FireBall_A = 12004,         --火球A
    FWheel = 12005,             --火輪
    BestHit = 12006,            --會心一擊
    FireBall_B = 12007,         --火球B
    FireWheel = 12008,          --風火輪
    FlyFire = 12009,            --飛焰劍
    BlazeFlame = 12010,         --烈燄
    EightFire = 12011,          --八面火輪
    Rabid = 12012,              --狂炎斬
    ThreeFire = 12013,          --三昧真火
    Beacon = 12014,             --烽火燎原
    Through = 12015,            --白虹貫日
    Phoenix3 = 12016,           --鳳凰 小
    Phoenix21 = 12017,          --鳳凰 小中
    Phoenix2 = 12018,           --鳳凰 中
    Phoenix1 = 12019,           --鳳凰 大
    
    SunlightSword = 12021,      --殛陽劍
    FireDragonSnap = 12022,     --狂龍噬日
    FireInferno = 12023,        --熾焰無二
    FireAmulet = 12024,         --丹陽護體
    WildFightSoul = 12025,      --狂熱戰魂
    LightningStroke = 12026,    --五雷轟頂

    BombPunch = 12027,          --火爆一擊
    MagmaBomb = 12028,          --烈術豪火
    FireTwister = 12029,        --赤龍炬
    ThunderFire = 12030,        --雷火召臨
    SeaOfFire = 12031,          --陽炎
    FireGodWrath = 12032,       --祝融焚野
    DargonStrike = 12033,       --爵龍霸烈斬
    DargonKingStrike = 12034,   --龍王震兮
    NewDargonStrike = 12037,    --真。爵龍霸烈斬

    SKILL12038 = 12038,         --大聖斬妖、大聖斬妖奧義
    SKILL12040 = 12040,         --金晴火眼        Alen 20160420
    SKILL12041 = 12041,         --12041蛇矛魂噬擊 12042蛇矛魂噬擊奧義  Alen 20160606
    SKILL12043 = 12043,         --12043白虎藏地噬 12044白虎藏地噬奧義
    SKILL12054 = 12054,         --魔宋仁技能-火箭改

    RoshaMachete = 22027,       --連動角色-羅煞彎刀(冰旋斬)

    EW_LightningStroke = 12046, -- 狂雷烈擊
    EW_FireDragonSnap = 12047,  -- 殛龍殘日
    EW_FireInferno = 12048,     -- 熾燚融火
    EW_FireArrow = 12049,       --專武火箭
    EW_QuakeFire = 12050,       --專武震火
    EW_SeaOfFire = 12051,       --專武陽炎
    EW_HealthDrawer = 12052,    --專武式鬼吸魂
    EW_GoldShieldFire =12057,   --專武被動 火破金鐘

--風系
    DriveWind = 13001,          --御風術
    WhirlWind = 13002,          --旋風
    Avoid = 13003,              --閃躲
    CrazyWind = 13004,          --狂風
    Limpid = 13005,             --隱身
    Gale = 13006,               --暴風
    DizzyAtk = 13007,           --暈擊
    Dividebody = 13008,         --分身術
    PlantGarlic = 13009,        --種蒜
    DoubleHit = 13010,          --連擊
    Shrink = 13011,             --縮小
    Enlarge = 13012,            --放大    
    RandomHit = 13013,          --亂擊
    Vitalit = 13014,            --元氣

    Dragon3 = 13015,            --青龍 小
    Dragon21 = 13016,           --青龍 小中
    Dragon2 = 13017,            --青龍 中
    Dragon1 = 13018,            --青龍 大

    WindFaster = 13020,         --風之戰意
    TransferAttack = 13021,     --斗轉星移
    WindPressureBall = 13022,   --裂風彈
    Twister = 13023,            --龍捲颶風
    ShaowRepeated = 13024,      --幻影連擊
    Invisible = 13025,          --無形無相

    LightningDestroy = 13026,   --崩雷
    StormFlashingBall = 13027,  --風眩神離
    FlyingSword = 13028,        --斬騎飛劍
    MountainThrow = 13029,      --山嵐
    HealthDrawer = 13030,       --式鬼吸魂
    FlashingStiffWind = 13031,  --風擎雷鳴
    QuakeLightning = 13033,     --震電

    SKILL13036 = 13036,        --青龍偃月斬、真．青龍偃月斬  Alen 20160420
    WindShotBall = 13038, --裂風散彈
    WindAssultBall = 13039, --裂風連彈
    EW_Shrink = 13040,         -- 特‧縮小術
    EW_DizzyAtk = 13041,       -- 強力暈擊
    EW_Limpid = 13042,         -- 超‧隱身術
    EW_QuakeLightning = 13043, --專武震電
    BunCharge = 13044,         --肉包衝鋒
    ChanChan = 13047,          --醬醬
    ChikiChiki = 13048,        -- 一支一支
    WhirlWindParty = 13050,    --開派對囉
    DragonTransfer = 13051,   --巴龍風障
    WhirlWindCard = 13052,     --旋風卡(卡片技能)

    LightDragon = 22040,        --青龍皓月
    YiMuLightning = 22043,      --憶母狂雷
--心系
    LoudShout = 14006,          --大喝
    DisTrance = 14007,          --解昏睡
    Trance = 14008,             --昏睡
    SameHeart = 14012,          --同心
    Inspire = 14013,            --鼓舞
    DisPoision = 14014,         --解毒
    Poision = 14015,            --施毒
    Traitor = 14020,            --內鬨
    Chaos = 14021,              --混亂
    DisChaos = 14022,           --解混亂

    Stool1= 14029,             --大便1
    Stool2 = 14030,             --大便2

    CrossingBlinkArrow = 14033, --穿心瞬矢
    ExactShoot = 14036,         --百步穿楊
    ArrowOverSky = 14037,       --箭舞九天
    MagicProtect = 14056,       --魔法護身
    KillPill = 14057,           --殺生
    SKILL14060 = 14060,        --全體天雷   
    SoulCurse = 14062,  --蝕魂詛咒 
    EW_LoudShout = 14063,      -- 怒喝
    EW_ExactShoot = 14064,     -- 擊心瞬矢
    EW_Chaos = 14065,          -- 強力混亂

    GoldAttackCard = 14096,   --金錢攻擊卡(卡片技能)
    ShakeMalletCard = 14097,  --震地槌卡(卡片技能)
    DoubleHitCard = 14098,    --連擊卡(卡片技能)
    WarStepCard = 14099,      --怒濤戰踏卡(卡片技能)

    Protect = 20006,            --護主
    DisProtect = 20007,         --解除護主
    Chaos4 = 20014,             --四人混亂
    Dis4Status = 20015,         --四人狀解
    DragonHead = 20016,         --龍頭攻擊(三人暈擊)
    SweepClaw = 20017,          --右龍爪橫掃(六人風捲)
    LeftClaw = 20018,           --左龍爪(六人暴風)
    TurtleDis6Status = 20019,   --玄武六人狀解
    TurtleCast = 20020,         --玄武頭施法
    TurtleRHand = 20021,        --全體地牙(玄武右手)
    TurtleLHand = 20022,        --全體岩怪(玄武左手)
    TurtlePoison = 20023,       --玄武(四人施毒)    
    TurtleVitality = 20024,     --玄武十人元氣
    GodzillaBeam = 20056,       --哥吉拉肥胖光線
    GodzillaPunch = 20057,      --哥吉拉胖獸神拳
    GodzillaEarthquake = 20058, --哥吉拉胖獸剁地
    Clump3 = 20025,             --三人樹精
    IceBound3 = 20026,          --三人冰封
    WhirlWind3 = 20027,         --三人旋風
    WhirlWind6 = 13046,         --六人旋風(無盡風暴)
    Gale3 = 20028,              --三人暴風
    TigerCast = 20029,          --白虎頭

    SwordBreath = 20033,        --守護者劍氣
    CowDashCar = 20034,         --牛頭衝車
    SteelKnifeCar = 20035,      --精鋼刀車
    RepeatBoltCar = 20036,      --連弩車
    BigThrowCar = 20037,        --投石巨車
    StrongArrowTower = 20038,   --強弓井闌
    GodArrowTower = 20039,      --神箭塔
    RockWall = 20040,           --石牆
    BambooWall = 20041,         --竹牆
    BrickWall = 20042,          --磚牆
    BigRollStone = 20043,       --大滾石
    Explode = 20044,            --爆破
    Wrath = 20045,              --神怒天誅
    OutEnemy = 20046,           --退敵術
    SuperPoision = 20047,       --強效施毒(四人施毒) Alen 20140821

    SKILL20051 = 20051,        --九尾狐魅惑      Alen 20160420
    FireBlast = 20052,  --炎爆    
    Lightning = 20053, --雷擊 
    Dis6Status = 20054,  --六人狀解    
    Chaos2 = 20055,    --雙人混亂

    ZhangFeiLoudShout = 22041,  --俺乃張翼德

--器械
    ArrowTower = 16001,         --井闌
    CityWall = 16002,           --城門
    DashCar = 20009,         --衝車
    KnifeCar = 20010,         --刀車
    BoltCar = 20011,         --弩車
    ThrowCar = 20012,         --投石車

--職業技
    AngryMind = 14040,          --職業-1 霸意
    CrazySoul = 14053,          --職業-2 聖靈暴衝
    AngerShield = 14046,        --職業-3 凝氣護盾
    WarStep = 14042,            --職業-4 怒濤戰踏
    MagicalShield = 14044,      --職業-5 天降神盾
    TaiChiLightning = 14054,    --職業-6 乾坤天雷   
--武將特有技
    ShakeMallet = 21001,        --震地槌
    ColdAdularia = 21002,       --寒冰貫
    RedlotusFire = 21003,       --紅蓮業火
    RuptureSky = 21004,         --破空閃
    ViolentCattle = 21005,      --猛牛襲
    ThreeSidesIceSwords = 21006,--冰牙刃
    RoastFlame = 21007,         --炙燄怒
    BiteSpiritPoisonous = 21008,--魅毒風
    Meteor = 21009,             --殞星落
    BoxingOfSun = 21010,        --孫家獨門重拳
    PhoenixRabid = 21011,       --火凰殞天
    BackThrust = 21012,         --回馬槍
    LionSnap = 21013,           --獅咬
    FireSickle = 21014,         --火鐮    
    BravelyTwoGradation = 21015,--洸閃二段式
    WindMove = 21016,           --風動痕
    SwordHell = 21017,          --刀劍淵獄
    KurningSword = 21018,       --炎刃斬
    BigBow = 21019,             --黃忠弓
    DarkIncantation = 21020,    --闇黑黃咒(張角)
    YellowScarfViolentWave = 21021, --黃巾怒濤(張寶)
    YellowScarfAnger = 21022,   --黃巾之怒(張梁)
    HeavenDeadYellowSupersed = 21023, --蒼天已死黃天當立
    ColdGorgeous = 21024,       --冷豔鋸(關羽)
    SnakeEight = 21025,         --狂蛇奪首(張飛)
    PitySoldier = 21026,        --仁者無敵(劉備)強化技
    PeachJust = 21027,          --桃園結義(劉 關 張 合體技)    
    BeneAchillean = 21028,      --仁者無敵(劉備)攻擊技
    MagicSwordWater = 21029,    --洛水凝息(甄宓)
    MagicSwordEarth = 21030,    --岩葉飄劍破(楊修)
    FlyFireRandom = 21031,    --飛燄亂劍
    HotGinger = 21032,     --薑是老的辣
    DizzyAtkDouble = 21033, --前後暈擊
    IceHammer = 21034,  --冰槌術
    SkyFireSickle = 21035,  --天火鐮斬
    SkyFlame = 21036, --天火術    
    DolphinGraud = 21037,  --海豚守衛
    DarkDragonCrescentSlash = 21038,   --魔龍偃月斬
    EmperorSeize = 21039,  --帝王纏繞
    LastLand = 21040,  --背水一戰
    OverlordSlash = 21041, --霸王無雙斬
    CrazyDragonSpell = 21042, --諸葛狂龍咒
    Ambush = 21043, --偷渡伏擊
    TaiFuSoulMirror = 22024, --太傅靈光鏡
    
    MagicSwordFire=226,     --法劍-火
    MagicSwordWind=227,     --法劍-風
    
    --光
    LightArrow = 22001,   --光茅術
    LightHand = 22002,    --佛光掌
    Glare = 22003,        --眩光
    LightFlames = 22004,  --烈焰之光
    LightDisStatus = 22005, --光癒術
    LightShield = 22006,  --光之鏡    
    LightHealth = 22007,  --光芒灌注 
    LightThrow = 22009,   --光速投擲
    GoldAttack = 22010, --金幣攻擊
    
    WTiger3 = 22011,   --白虎招喚 小
    WTiger21 = 22012,  --白虎招喚 小中
    WTiger2 = 22013,   --白虎招喚 中
    WTiger1 = 22014,   --白虎招喚 大

    Cluster = 22015,    --集束光彈
    SightCaptivity = 22016, --瞳光之絆
    SKILL22021 = 22021,        --超光波          Alen 20160420
    SKILL22022 = 22022,        --22022權傾萬里(比照箭舞九天+30%攻) Added by LH_20170118
    KingWindMove = 22026,     --霸氣烈刃(風動痕修改)
    IdelHalo = 22046,     --偶像光環
    --暗
    DarkArrow = 23001,    --闇毒箭
    DarkCut = 23002,      --暗刃斬
    BlackRotaryCut = 23003,  --黑旋斬
    Voodoo = 23004,       --巫毒
    SwordSleeve = 23005,  --袖裡箭
    ThrowSkull = 23006,   --骷髏投擲
    VoodooDoll = 23007,   --巫毒娃娃
    Witchcraft = 23008,   --妖術激化
    Lethal = 23009,       --迷惑毒針
    FlyWheel = 23010,     --毒飛輪

    Basaltic3 = 23011,    --玄武招喚 小
    Basaltic21 = 23012,   --玄武招喚 小中
    Basaltic2 = 23013,    --玄武招喚 中
    Basaltic1 = 23014,    --玄武招喚 大
    
    DizzyCut = 23015,     --暈斬    
    DarknessBehead = 23016, --闇黑連斬    
    DarkFire = 23019,     --萬毒穿心 Alen 20160303
    EW_BlackRotaryCut = 23024, --專武黑旋斬
    EW_DizzyCut = 23027,    --專武暈斬
    SKILL22042 = 22042, --暗魂追討殺
    FloatWind = 23023, --飄颻流風
    EW_YaoWeiFenWu = 23029, --專武被動 曜威奮武

    --狀態(不對應技能ID)
    Tardy = 100,          --遲緩
    Vitality = 101,           --030605J元氣
    ShakeTake = 102,          --震攝    
    EW_Int = 103,            -- 專武被動-知力
    EW_Atk = 104,            -- 專武被動-攻擊
    EW_Def = 105,            -- 專武被動-防禦
    EW_Hpx = 106,            -- 專武被動-體質
    EW_Spx = 107,            -- 專武被動-能量
    EW_Dex = 108,            -- 專武被動-敏捷
    EW_StrikeRate = 109,     -- 專武被動-倍擊率
    EW_Earth = 110,          -- 專武被動-地屬
    EW_Water = 111,          -- 專武被動-水屬
    EW_Fire = 112,           -- 專武被動-火屬
    EW_Wind = 113,           -- 專武被動-風屬
    EWCommonFaint = 114,     -- 專武通用弱化
    EWCommonStrong = 115,     -- 專武通用強化
    PassiveGoldShield = 116, --隱忍不躁
    PoisonShield = 117, --智變克敵        
    EW_MirrorIngore = 118,  --專武被動無視鏡
    EW_Counter = 119, 
    EW_CounterDizzy = 120,
    EW_BaguaDex = 121,      --專武被動先天八卦-敏捷
    EW_CounterTrance = 122, --專武被動妖魂逆天
    EW_CounterTranceMe = 123,
    EW_SpecifyStatusIngore = 124, --專武被動曜威奮武(指定狀態無視)
    IceCrystalsShieldMe = 125,  --冰晶守護(變化狀態)
    IceCrystalsSeal = 126,      --冰晶守護(被打給封印)
        
    --暫無使用
    -- Fire3_4=104,                --熾焰無二
    -- FireBall_C =77,             --火球C
    -- FireBall_D =78,             --火球D
    -- BlazeSword =82,             --飛燄劍     
    -- SweepClaw2=240,         --左龍爪橫掃(涌泉)暫時不用
    -- TurtleHand=244,         --玄武手部攻擊
  }

  ESkill_Status = {
    Poor = ESkill_Kind.Poor,
    God = ESkill_Kind.God,    
    Spell = ESkill_Kind.Spell,    
    Boundary = ESkill_Kind.Boundary,    
    WhirlWind = ESkill_Kind.WhirlWind,    
    IceBound = ESkill_Kind.IceBound,
    Clump = ESkill_Kind.Clump,    
    Trance = ESkill_Kind.Trance,    
    DizzyAtk = ESkill_Kind.DizzyAtk,    
    ShakeTake = ESkill_Kind.ShakeTake,    
    FreezePunch = ESkill_Kind.FreezePunch,    
    GravelSeize = ESkill_Kind.GravelSeize,    
    SightCaptivity = ESkill_Kind.SightCaptivity,    
    IceWall = ESkill_Kind.IceWall,    
    Enlarge = ESkill_Kind.Enlarge,
    Limpid = ESkill_Kind.Limpid,    
    Avoid = ESkill_Kind.Avoid,    
    Mirror = ESkill_Kind.Mirror,    
    SameHeart = ESkill_Kind.SameHeart,    
    Inspire = ESkill_Kind.Inspire,    
    SoulMirror = ESkill_Kind.SoulMirror,    
    FireAmulet = ESkill_Kind.FireAmulet,    
    TransferAttack = ESkill_Kind.TransferAttack,    
    Invisible = ESkill_Kind.Invisible,
    GoldShield = ESkill_Kind.GoldShield,    
    Shrink = ESkill_Kind.Shrink,  
    Poision = ESkill_Kind.Poision,  
    SoulCurse = ESkill_Kind.SoulCurse,    
    Chaos = ESkill_Kind.Chaos,
    Tardy = ESkill_Kind.Tardy,    
    Stool1 = ESkill_Kind.Stool1,    
    Landslip = ESkill_Kind.Landslip,    
    ThunderFire = ESkill_Kind.ThunderFire,    
    HealthDrawer = ESkill_Kind.HealthDrawer,    
    FireSickle= ESkill_Kind.FireSickle,    
    DarkFire = ESkill_Kind.DarkFire,    
    Protect = ESkill_Kind.Protect,    
    MagicProtect = ESkill_Kind.MagicProtect,    
    WildFightSoul = ESkill_Kind.WildFightSoul,    
    BrightMirror = ESkill_Kind.BrightMirror,    
    WindFaster = ESkill_Kind.WindFaster,    
    AngryMind = ESkill_Kind.AngryMind,    
    CrazySoul = ESkill_Kind.CrazySoul,    
    AngerShield = ESkill_Kind.AngerShield,    
    MagicalShield = ESkill_Kind.MagicalShield,    
    LightShield = ESkill_Kind.LightShield,     
    DarkMind = ESkill_Kind.DarkMind,               
    PitySoldier = ESkill_Kind.PitySoldier,    
    EWCommonFaint = ESkill_Kind.EWCommonFaint,    
    EWCommonStrong = ESkill_Kind.EWCommonStrong,    
    EW_MirrorIngore = ESkill_Kind.EW_MirrorIngore,
    PassiveGoldShield = ESkill_Kind.PassiveGoldShield,    
    PoisonShield = ESkill_Kind.PoisonShield,    
    DolphinGraud = ESkill_Kind.DolphinGraud,
    Taunt = ESkill_Kind.Taunt,
    DodgeDead = ESkill_Kind.DodgeDead,
  }


  
EElement = 
{  
  Earth = 1,
  Water = 2,
  Fire = 3,
  Wind = 4,
  Mind = 5,
  None = 6,  
  Light = 7,
  Dark = 8,
}

Skill = {};
Skill.__index = Skill;

function Skill.New(id)
  local self = {};
  setmetatable(self, Skill);
  self.humIdx = id;    
  self.kind = 0;        --技能種類
  self.showKind = 1;    --顯示技能方式 1:舊SetLight 2:新SetLight
  self.disKind = {};    --Array[0~MaxLight] of Byte;  //030602J顯圖權:地身天
  self.lights = {};     --Array[0~MaxLight] of TLight;
  return self;
end

function Skill:SetLight(index, aId, interval, aStartPage, aEndPage, allPage, aTracer_Style, fromX, fromY,
                       alpha, circle, biasY, aObjX, aObjY, aSpeed, aCurvekind)
  if alpha == nil then 
    alpha =255;
  end
  if circle == nil then 
    circle  =true;
  end
  if biasY == nil then 
    biasY =0;
  end 
  if aObjX == nil then 
    aObjX =0;
  end 
  if aObjY == nil then 
    aObjY =0;
  end
  if aSpeed == nil then 
    aSpeed =0.36;
  end 
  if aCurvekind == nil then 
    aCurvekind =1
  end

  self:StopLight(index);
  self.lights[index] = EffectLight.New(aId, interval, aStartPage, aEndPage, allPage, aTracer_Style, fromX, fromY,alpha, circle, biasY, aObjX, aObjY, aSpeed, aCurvekind);
end

function Skill:SetLightWithOrder(index, aDisplay, aId, interval, aStartPage, aEndPage, allPage, aTracer_Style, fromX, fromY, 
                                alpha, circle, biasY, aObjX, aObjY, aSpeed, aCurvekind)

  if alpha == nil then 
    alpha =255;
  end
  if circle == nil then 
    circle  =true;
  end
  if biasY == nil then 
    biasY =0;
  end 
  if aObjX == nil then 
    aObjX =0;
  end 
  if aObjY == nil then 
    aObjY =0;
  end
  if aSpeed == nil then 
    aSpeed =0.36;
  end 
  if aCurvekind == nil then 
    aCurvekind =1
  end

  self.showKind = 2;
  self.disKind[index] = aDisplay;

  self:StopLight(index);
  self.lights[index] = EffectLight.New(aId, interval, aStartPage, aEndPage, allPage, aTracer_Style, fromX, fromY,alpha, circle, biasY, aObjX, aObjY, aSpeed, aCurvekind);
end

function Skill:SetLiveTime(index, second) 
  if self.lights[index] == nil then 
    return;
  end
  local effectLight = self.lights[index];
  if (effectLight.targetPos.x ~= 0 and effectLight.targetPos.y ~= 0) then  
    local dist = (effectLight.showPos - effectLight.targetPos).magnitude;
    effectLight.lightSpeed = dist / second;
  end
end

function Skill:StopLight(index)
  local effectLight = self.lights[index];
  if effectLight == nil then 
    return;
  end

  effectLight.picId = 0;
  effectLight.orderCount = 0;
  effectLight.arrive = false;
end

function Skill.IsSummonSkill(skillId)
  return Contains(skillId, 10016, 11016, 12016, 13015, 22011, 23011);
end

function Skill.IsBowSkill(skillId)
  return Contains(skillId, 14033,14036,14037, 14064); --弓箭技能     
end

function Skill.IsBasicSkill(skillId) 
  if Contains(skillId, SK_HandFight, 15001, 15002, 15003, 15004, 15005, -1, -2, 18002, 14001, 14002, 19001, 20004, 20005, 20008)then 
    return true;
  else
    return false;
  end
end

function Skill.GetDefaultSummonId(element)
  if Contains(element, EElement.Light, EElement.Dark)then
    return 14077;
  else
    return 14026;
  end
end

function Skill.FindTreeNode(skillId)
  for k, v in pairs(SkillTree) do
    for kk, vv in pairs(v) do
      if vv.skillId == skillId then
        return k, kk;
      end
    end
  end

  return 0, 0;
end

function Skill.GetSummonSkill(element)
  local summomSkillId = 0;

  if element == EElement.Earth then
    summomSkillId = 10016;
  elseif element == EElement.Water then
    summomSkillId = 11016;
  elseif element == EElement.Fire then
    summomSkillId = 12016;
  elseif element == EElement.Wind then
    summomSkillId = 13015;
  elseif element == EElement.Light then 
    summomSkillId = 22011;
  elseif element == EElement.Dark then 
    summomSkillId = 23011;
  end

  return summomSkillId;
end
