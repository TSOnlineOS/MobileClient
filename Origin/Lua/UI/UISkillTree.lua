
--Tag屬性
local ESkillTag = {
  Npc = 0,
  Earth = 1,
  Water = 2,
  Fire = 3,
  Wind = 4,
  Mind = 5,
  Turn1 = 6,
  Turn2 = 7,
  LightDark = 8,
  Hero = 9,  
}
--skillInfo = { skillId, position, addLv, { childs } }
local skillInfos = {};
skillInfos[ESkillTag.Npc] = {};

skillInfos[ESkillTag.Earth] = {};
skillInfos[ESkillTag.Earth][1] = { 10001, Vector2.New(-3, 137), { 2, 9 } };
skillInfos[ESkillTag.Earth][2] = { 10003, Vector2.New(-82, 56), { 3 } };
skillInfos[ESkillTag.Earth][3] = { 10005, Vector2.New(-156, 15.5), { 4, 7 } };
skillInfos[ESkillTag.Earth][4] = { 10008, Vector2.New(-190, -66), { 5, 6 } };
skillInfos[ESkillTag.Earth][5] = { 10013, Vector2.New(-273, -28.5), { 0 } };
skillInfos[ESkillTag.Earth][6] = { 10012, Vector2.New(-273, -105.5), { 0 } };
skillInfos[ESkillTag.Earth][7] = { 10007, Vector2.New(-118, -66), { 8 } };
skillInfos[ESkillTag.Earth][8] = { 10011, Vector2.New(-44, -109), { 0 } };
skillInfos[ESkillTag.Earth][9] = { 10002, Vector2.New(74, 56), { 10 } };
skillInfos[ESkillTag.Earth][10] = { 10004, Vector2.New(146, 15), { 11 } };
skillInfos[ESkillTag.Earth][11] = { 10006, Vector2.New(221, -24.5), { 12, 15 } };
skillInfos[ESkillTag.Earth][12] = { 10010, Vector2.New(180, -106), { 13, 14 } };
skillInfos[ESkillTag.Earth][13] = { 10015, Vector2.New(97, -146), { 0 } };
skillInfos[ESkillTag.Earth][14] = { 10014, Vector2.New(97, -69), { 0 } };
skillInfos[ESkillTag.Earth][15] = { 10009, Vector2.New(259, -106), { 0 } };
skillInfos[ESkillTag.Earth][16] = { 14026, Vector2.New(-3, -19) }; --召喚技

skillInfos[ESkillTag.Water] = {};
skillInfos[ESkillTag.Water][1] = { 11001, Vector2.New(-38, 140), { 2, 8 } };
skillInfos[ESkillTag.Water][2] = { 11003, Vector2.New(-118, 59), { 3 } };
skillInfos[ESkillTag.Water][3] = { 11005, Vector2.New(-195, 59), { 4 } };
skillInfos[ESkillTag.Water][4] = { 11008, Vector2.New(-270, 19), { 5 } };
skillInfos[ESkillTag.Water][5] = { 11011, Vector2.New(-197, -26), { 6, 7 } };
skillInfos[ESkillTag.Water][6] = { 11015, Vector2.New(-233, -107), { 0 } };
skillInfos[ESkillTag.Water][7] = { 11014, Vector2.New(-157, -107), { 0 } };
skillInfos[ESkillTag.Water][8] = { 11002, Vector2.New(39, 59), { 9 } };
skillInfos[ESkillTag.Water][9] = { 11004, Vector2.New(117, 59), { 10, 13 } };
skillInfos[ESkillTag.Water][10] = { 11007, Vector2.New(79, -22), { 11 } };
skillInfos[ESkillTag.Water][11] = { 11010, Vector2.New(42, -104), { 12 } };
skillInfos[ESkillTag.Water][12] = { 11013, Vector2.New(118, -104), { 0 } };
skillInfos[ESkillTag.Water][13] = { 11006, Vector2.New(157, -22), { 14 } };
skillInfos[ESkillTag.Water][14] = { 11009, Vector2.New(240, 14), { 15 } };
skillInfos[ESkillTag.Water][15] = { 11012, Vector2.New(240, -62), { 0 } };
skillInfos[ESkillTag.Water][16] = { 14026, Vector2.New(-38, -19) }; --召喚技

skillInfos[ESkillTag.Fire] = {};
skillInfos[ESkillTag.Fire][1] = { 12001, Vector2.New(-52, 139), { 2, 7 } };
skillInfos[ESkillTag.Fire][2] = { 12003, Vector2.New(-132, 56.5), { 3 } };
skillInfos[ESkillTag.Fire][3] = { 12006, Vector2.New(-210, 56.5), { 4 } };
skillInfos[ESkillTag.Fire][4] = { 12009, Vector2.New(-210, -20.5), { 5 } };
skillInfos[ESkillTag.Fire][5] = { 12012, Vector2.New(-210, -100), { 6 } };
skillInfos[ESkillTag.Fire][6] = { 12015, Vector2.New(-287, -100), { 0 } };
skillInfos[ESkillTag.Fire][7] = { 12002, Vector2.New(24, 56.5), { 8, 12 } };
skillInfos[ESkillTag.Fire][8] = { 12005, Vector2.New(106.5, 17), { 9 } };
skillInfos[ESkillTag.Fire][9] = { 12008, Vector2.New(180, -23.5), { 10 } };
skillInfos[ESkillTag.Fire][10] = { 12011, Vector2.New(180, -101), { 11 } };
skillInfos[ESkillTag.Fire][11] = { 12014, Vector2.New(102, -101), { 0 } };
skillInfos[ESkillTag.Fire][12] = { 12004, Vector2.New(106.5, 93), { 13 } };
skillInfos[ESkillTag.Fire][13] = { 12007, Vector2.New(185, 93), { 14 } };
skillInfos[ESkillTag.Fire][14] = { 12010, Vector2.New(258, 54), { 15 } };
skillInfos[ESkillTag.Fire][15] = { 12013, Vector2.New(258, -23.5), { 0 } };
skillInfos[ESkillTag.Fire][16] = { 14026, Vector2.New(-52, -20) };

--召喚技
--turn2BaseSkills[ECareer.XiaKe] = { 14038, 14043, 14044, 14045, 14046 }; --俠客
--turn2BaseSkills[ECareer.BaWang] = { 14038, 14039, 14040, 14041, 14042 }; --霸王
--turn2BaseSkills[ECareer.XianShi] = { 14038, 14047, 14048, 14049, 14050 }; --賢士
--turn2BaseSkills[ECareer.DiXian] = { 14038, 14051, 14052, 14053, 14054 }; --嫡仙
--turn2BaseSkills[ECareer.XiaKe] = { 14038, 14043, 14044, 14045, 14046 }; --俠客
--turn2BaseSkills[ECareer.BaWang] = { 14038, 14039, 14040, 14041, 14042 }; --霸王
--turn2BaseSkills[ECareer.XianShi] = { 14038, 14047, 14048, 14049, 14050 }; --賢士
--turn2BaseSkills[ECareer.DiXian] = { 14038, 14051, 14052, 14053, 14054 }; --嫡仙

--turn2BaseSkills[ECareer.XiaKe] = { 14038, 14043, 14044, 14045, 14046 }; --俠客
--turn2BaseSkills[ECareer.BaWang] = { 14038, 14039, 14040, 14041, 14042 }; --霸王
--turn2BaseSkills[ECareer.XianShi] = { 14038, 14047, 14048, 14049, 14050 }; --賢士
--turn2BaseSkills[ECareer.DiXian] = { 14038, 14051, 14052, 14053, 14054 }; --嫡仙

--turn2BaseSkills[ECareer.XiaKe] = { 14038, 14043, 14044, 14045, 14046 }; --俠客
--turn2BaseSkills[ECareer.BaWang] = { 14038, 14039, 14040, 14041, 14042 }; --霸王
--turn2BaseSkills[ECareer.XianShi] = { 14038, 14047, 14048, 14049, 14050 }; --賢士
--turn2BaseSkills[ECareer.DiXian] = { 14038, 14051, 14052, 14053, 14054 }; --嫡仙

skillInfos[ESkillTag.Wind] = {};
skillInfos[ESkillTag.Wind][1] = { 13001, Vector2.New(6, 147), { 2, 8 } };
skillInfos[ESkillTag.Wind][2] = { 13003, Vector2.New(-73, 65), { 3 } };
skillInfos[ESkillTag.Wind][3] = { 13005, Vector2.New(-150, 65), { 4 } };
skillInfos[ESkillTag.Wind][4] = { 13008, Vector2.New(-229, 65), { 5, 6 } };
skillInfos[ESkillTag.Wind][5] = { 13012, Vector2.New(-267, -18.5), { 7 } };
skillInfos[ESkillTag.Wind][6] = { 13011, Vector2.New(-191, -18.5), { 7 } };
skillInfos[ESkillTag.Wind][7] = { 13014, Vector2.New(-228, -100), { 0 } };
skillInfos[ESkillTag.Wind][8] = { 13002, Vector2.New(83, 65), { 9 } };
skillInfos[ESkillTag.Wind][9] = { 13004, Vector2.New(156, 23), { 10, 13 } };
skillInfos[ESkillTag.Wind][10] = { 13007, Vector2.New(112, -58), { 11 } };
skillInfos[ESkillTag.Wind][11] = { 13010, Vector2.New(33, -58), { 12 } };
skillInfos[ESkillTag.Wind][12] = { 13013, Vector2.New(-45, -58), { 0 } };
skillInfos[ESkillTag.Wind][13] = { 13006, Vector2.New(187, -58), { 14 } };
skillInfos[ESkillTag.Wind][14] = { 13009, Vector2.New(263, -58), { 0 } };
skillInfos[ESkillTag.Wind][15] = { 14026, Vector2.New(6, 23) }; --召喚技

skillInfos[ESkillTag.Mind] = {};

skillInfos[ESkillTag.Turn1] = {};
skillInfos[ESkillTag.Turn1][1] = { 10020, Vector2.New(-238, 119), { 2, 5 } };
skillInfos[ESkillTag.Turn1][2] = { 10022, Vector2.New(-276, 36.5), { 3 } };
skillInfos[ESkillTag.Turn1][3] = { 10024, Vector2.New(-276, -41.5), { 4 } };
skillInfos[ESkillTag.Turn1][4] = { 10023, Vector2.New(-276, -118) };
skillInfos[ESkillTag.Turn1][5] = { 10021, Vector2.New(-199.5, 36.5), { 5 } };
skillInfos[ESkillTag.Turn1][6] = { 10025, Vector2.New(-199.5, -41.5), { 6 } };
skillInfos[ESkillTag.Turn1][7] = { 10026, Vector2.New(-199.5, -118) };

skillInfos[ESkillTag.Turn1][8] = { 11020, Vector2.New(-80, 119), { 9, 12 } };
skillInfos[ESkillTag.Turn1][9] = { 11021, Vector2.New(-116.5, 36.5), { 10 } };
skillInfos[ESkillTag.Turn1][10] = { 11022, Vector2.New(-116.5, -41.5), { 11 } };
skillInfos[ESkillTag.Turn1][11] = { 11023, Vector2.New(-116.5, -118) };
skillInfos[ESkillTag.Turn1][12] = { 11024, Vector2.New(-41, 36.5), { 13 } };
skillInfos[ESkillTag.Turn1][13] = { 11025, Vector2.New(-41, -41.5), { 14 } };
skillInfos[ESkillTag.Turn1][14] = { 11026, Vector2.New(-41, -118) };

skillInfos[ESkillTag.Turn1][15] = { 12020, Vector2.New(80, 119), { 16, 19 } };
skillInfos[ESkillTag.Turn1][16] = { 12023, Vector2.New(42, 36.5), { 17 } };
skillInfos[ESkillTag.Turn1][17] = { 12026, Vector2.New(42, -41.5), { 18 } };
skillInfos[ESkillTag.Turn1][18] = { 12025, Vector2.New(42, -118) };
skillInfos[ESkillTag.Turn1][19] = { 12021, Vector2.New(118, 36.5), { 20 } };
skillInfos[ESkillTag.Turn1][20] = { 12024, Vector2.New(118, -41.5), { 21 } };
skillInfos[ESkillTag.Turn1][21] = { 12022, Vector2.New(118, -118) };

skillInfos[ESkillTag.Turn1][22] = { 13019, Vector2.New(240, 119), { 23, 26 } };
skillInfos[ESkillTag.Turn1][23] = { 13022, Vector2.New(202.5, 36.5), { 24 } };
skillInfos[ESkillTag.Turn1][24] = { 13024, Vector2.New(202.5, -41.5), { 25 } };
skillInfos[ESkillTag.Turn1][25] = { 13023, Vector2.New(202.5, -118) };
skillInfos[ESkillTag.Turn1][26] = { 13021, Vector2.New(278, 36.5), { 27 } };
skillInfos[ESkillTag.Turn1][27] = { 13020, Vector2.New(278, -41.5), { 28 } };
skillInfos[ESkillTag.Turn1][28] = { 13025, Vector2.New(278, -118) };
--turn2BaseSkills[ECareer.XiaKe] = { 14038, 14043, 14044, 14045, 14046 }; --俠客
--turn2BaseSkills[ECareer.BaWang] = { 14038, 14039, 14040, 14041, 14042 }; --霸王
--turn2BaseSkills[ECareer.XianShi] = { 14038, 14047, 14048, 14049, 14050 }; --賢士
--turn2BaseSkills[ECareer.DiXian] = { 14038, 14051, 14052, 14053, 14054 }; --嫡仙
--turn2BaseSkills[ECareer.XiaKe] = { 14038, 14043, 14044, 14045, 14046 }; --俠客
--turn2BaseSkills[ECareer.BaWang] = { 14038, 14039, 14040, 14041, 14042 }; --霸王
--turn2BaseSkills[ECareer.XianShi] = { 14038, 14047, 14048, 14049, 14050 }; --賢士
--turn2BaseSkills[ECareer.DiXian] = { 14038, 14051, 14052, 14053, 14054 }; --嫡仙

--turn2BaseSkills[ECareer.XiaKe] = { 14038, 14043, 14044, 14045, 14046 }; --俠客
--turn2BaseSkills[ECareer.BaWang] = { 14038, 14039, 14040, 14041, 14042 }; --霸王
--turn2BaseSkills[ECareer.XianShi] = { 14038, 14047, 14048, 14049, 14050 }; --賢士
--turn2BaseSkills[ECareer.DiXian] = { 14038, 14051, 14052, 14053, 14054 }; --嫡仙

--turn2BaseSkills[ECareer.XiaKe] = { 14038, 14043, 14044, 14045, 14046 }; --俠客
--turn2BaseSkills[ECareer.BaWang] = { 14038, 14039, 14040, 14041, 14042 }; --霸王
--turn2BaseSkills[ECareer.XianShi] = { 14038, 14047, 14048, 14049, 14050 }; --賢士
--turn2BaseSkills[ECareer.DiXian] = { 14038, 14051, 14052, 14053, 14054 }; --嫡仙

skillInfos[ESkillTag.Turn2] = {};
skillInfos[ESkillTag.Turn2][1] = { 0, Vector2.New(-0.5, -9), { 2, 3, 4, 5 } };
skillInfos[ESkillTag.Turn2][2] = { 0, Vector2.New(-0.5, 123), { 6, 7 } };
skillInfos[ESkillTag.Turn2][3] = { 0, Vector2.New(118.5, -9), { 8, 9 } };
skillInfos[ESkillTag.Turn2][4] = { 0, Vector2.New(-0.5, -142), { 10, 11 } };
skillInfos[ESkillTag.Turn2][5] = { 0, Vector2.New(-120, -9), { 12, 13 } };
skillInfos[ESkillTag.Turn2][6] = { 0, Vector2.New(-87, 66) };
skillInfos[ESkillTag.Turn2][7] = { 0, Vector2.New(87, 66) };
skillInfos[ESkillTag.Turn2][8] = { 0, Vector2.New(257, 30) };
skillInfos[ESkillTag.Turn2][9] = { 0, Vector2.New(257, -47) };
skillInfos[ESkillTag.Turn2][10] = { 0, Vector2.New(87, -87) };
skillInfos[ESkillTag.Turn2][11] = { 0, Vector2.New(-87, -87) };
skillInfos[ESkillTag.Turn2][12] = { 0, Vector2.New(-256, -47) };
skillInfos[ESkillTag.Turn2][13] = { 0, Vector2.New(-256, 30) };

skillInfos[ESkillTag.Hero] = {};
skillInfos[ESkillTag.Hero][ESkillTag.Earth] = { 10027, 10028, 10029, 10030, 10031, 10032, 10033, 10034 };
skillInfos[ESkillTag.Hero][ESkillTag.Water] = { 11027, 11028, 11029, 11030, 11031, 11032, 11033, 11034 };
skillInfos[ESkillTag.Hero][ESkillTag.Fire] = { 12027, 12028, 12029, 12030, 12031, 12032, 12033, 12034 };
skillInfos[ESkillTag.Hero][ESkillTag.Wind] = { 13026, 13027, 13028, 13029, 13030, 13031, 13032, 13033 };

skillInfos[ESkillTag.LightDark] = {};
skillInfos[ESkillTag.LightDark][1] = { 22001, Vector2.New(-380, 55) };
skillInfos[ESkillTag.LightDark][2] = { 22002, Vector2.New(-295, 55) };
skillInfos[ESkillTag.LightDark][3] = { 22003, Vector2.New(-210, 55) };
skillInfos[ESkillTag.LightDark][4] = { 22004, Vector2.New(-125, 55) };
skillInfos[ESkillTag.LightDark][5] = { 22007, Vector2.New(-40, 55) };
skillInfos[ESkillTag.LightDark][6] = { 22010, Vector2.New( 45, 55) };
skillInfos[ESkillTag.LightDark][7] = { 22015, Vector2.New( 130, 55) };
skillInfos[ESkillTag.LightDark][8] = { 22016, Vector2.New( 215, 55) };
skillInfos[ESkillTag.LightDark][9] = { 22011, Vector2.New( 300, 55) };

skillInfos[ESkillTag.LightDark][10] = { 23001, Vector2.New(-380, -122.5) };
skillInfos[ESkillTag.LightDark][11] = { 23002, Vector2.New(-295, -122.5) };
skillInfos[ESkillTag.LightDark][12] = { 23003, Vector2.New(-210, -122.5) };
skillInfos[ESkillTag.LightDark][13] = { 23004, Vector2.New(-125, -122.5) };
skillInfos[ESkillTag.LightDark][14] = { 23009, Vector2.New(-40, -122.5) };
skillInfos[ESkillTag.LightDark][15] = { 23010, Vector2.New( 45, -122.5) };
skillInfos[ESkillTag.LightDark][16] = { 23015, Vector2.New( 130, -122.5) };
skillInfos[ESkillTag.LightDark][17] = { 23016, Vector2.New( 215, -122.5) };
skillInfos[ESkillTag.LightDark][18] = { 23011, Vector2.New( 300, -122.5) };
--turn2BaseSkills[ECareer.XiaKe] = { 14038, 14043, 14044, 14045, 14046 }; --俠客
--turn2BaseSkills[ECareer.BaWang] = { 14038, 14039, 14040, 14041, 14042 }; --霸王
--turn2BaseSkills[ECareer.XianShi] = { 14038, 14047, 14048, 14049, 14050 }; --賢士
--turn2BaseSkills[ECareer.DiXian] = { 14038, 14051, 14052, 14053, 14054 }; --嫡仙
--turn2BaseSkills[ECareer.XiaKe] = { 14038, 14043, 14044, 14045, 14046 }; --俠客
--turn2BaseSkills[ECareer.BaWang] = { 14038, 14039, 14040, 14041, 14042 }; --霸王
--turn2BaseSkills[ECareer.XianShi] = { 14038, 14047, 14048, 14049, 14050 }; --賢士
--turn2BaseSkills[ECareer.DiXian] = { 14038, 14051, 14052, 14053, 14054 }; --嫡仙

--turn2BaseSkills[ECareer.XiaKe] = { 14038, 14043, 14044, 14045, 14046 }; --俠客
--turn2BaseSkills[ECareer.BaWang] = { 14038, 14039, 14040, 14041, 14042 }; --霸王
--turn2BaseSkills[ECareer.XianShi] = { 14038, 14047, 14048, 14049, 14050 }; --賢士
--turn2BaseSkills[ECareer.DiXian] = { 14038, 14051, 14052, 14053, 14054 }; --嫡仙

--turn2BaseSkills[ECareer.XiaKe] = { 14038, 14043, 14044, 14045, 14046 }; --俠客
--turn2BaseSkills[ECareer.BaWang] = { 14038, 14039, 14040, 14041, 14042 }; --霸王
--turn2BaseSkills[ECareer.XianShi] = { 14038, 14047, 14048, 14049, 14050 }; --賢士
--turn2BaseSkills[ECareer.DiXian] = { 14038, 14051, 14052, 14053, 14054 }; --嫡仙


local turn2BaseSkills = {}
turn2BaseSkills[ECareer.XiaKe] = { 14038, 14043, 14044, 14045, 14046 }; --俠客
turn2BaseSkills[ECareer.BaWang] = { 14038, 14039, 14040, 14041, 14042 }; --霸王
turn2BaseSkills[ECareer.XianShi] = { 14038, 14047, 14048, 14049, 14050 }; --賢士
turn2BaseSkills[ECareer.DiXian] = { 14038, 14051, 14052, 14053, 14054 }; --嫡仙
  
UISkillTree = {}
local this = UISkillTree;

this.name = "UISkillTree";
this.uiController = nil;

--const
local Turn2_MaxSkill = 13; --轉生技能最多52種(每一職業各13種)
local Turn2_SingleSkill = 13; --轉生技能每職業最多13種
local Turn2_MaxBall = 12; --轉生天珠最多144顆
local Turn2_SingleBall = 12; --轉生天珠每職業最多36顆
local mindSkillPerPage = 24; --一頁最多數量

local transform_FrameRect;
local transform_Selected;
local transform_NpcSkill;
local transform_SoulSkill;
local transform_MindSkill;
local transform_HeroSkill;
local transform_HeroElement = {};
local transform_LightDarkSkill;
local rectTransform_LayOut;
local rawImage_TreeLine = {};

local gameObject_SkillPoint;
local gameObject_BallText;
--info
local text_Point;
local text_Ball;
local text_RoleName;
local text_HintName;
local text_HintLv;
local text_HintLvValue;
local text_HintLv0;
local text_HintLvAdd;
local text_HintDescription;
local text_HintKind;

local rawImage_HintIcon;

local event_Submit;
local event_Cancel;
local event_Reset;
local event_Add;
local event_Sub;

--mind
local event_MindSkillArrowL;
local event_MindSkillArrowR;

--turn2
local turn2Balls = {};

--lightDark
local lightGroup = {};
local darkGroup = {};
local event_Change;

--var
local currentRole = nil; --目前選擇的角色
local currentFollowIndex = 0; --目前選擇的角色武將索引
local currentElement = 0; --目前選擇的角色屬性

local currentTag = ESkillTag.Earth; --目前選擇的頁籤
local currentSkill = nil; --目前選擇的技能
local currentHeroSkill = nil; --目前要設定的英雄技能索引
local currentMindPage = 0;

local useSkillPoint = 0;
local totalSkillPoint = 0;

local useTurn2Ball = 0;
local totalBallCount = 0;

local tagDatas = {};
local skills = {};
local learnSkills = {};

function UISkillTree.Initialize(go)
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  this.uiController.onVisible = this.OnVisible;

  local tempEvent;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;

  transform_Selected = uiController:FindGameObject("Image_Selected").transform;
  transform_NpcSkill = uiController:FindGameObject("NpcSkill").transform;
  transform_SoulSkill = uiController:FindGameObject("SoulSkill").transform;
  transform_MindSkill = uiController:FindGameObject("MindSkill").transform;
  transform_HeroSkill = uiController:FindGameObject("HeroSkill").transform;
  transform_LightDarkSkill = uiController:FindGameObject("LightDarkSkill").transform;
  rectTransform_LayOut = uiController:FindGameObject("Layout"):GetComponent("RectTransform");
  gameObject_SkillPoint = uiController:FindGameObject("Text_SkillPoint");
  gameObject_BallText = uiController:FindGameObject("Text_BallText");
  for i = ESkillTag.Earth, ESkillTag.Wind do
    transform_HeroElement[i] = uiController:FindGameObject(string.Concat("Image_Element (", i, ")")).transform;
  end

  for j = ESkillTag.Earth, ESkillTag.Turn2 do
    if j ~= ESkillTag.Mind then
      rawImage_TreeLine[j] = uiController:FindRawImage(string.Concat("RawImage_TreeLine (", j, ")"));
    end
  end

  --info
  text_Point = uiController:FindText("Text_Point");
  text_Ball = uiController:FindText("Text_Ball");
  text_RoleName = uiController:FindText("Text_RoleName");
  text_HintName = uiController:FindText("Text_HintName");
  text_HintLv = uiController:FindText("Text_HintLv");
  text_HintLvValue = uiController:FindText("Text_HintLvValue");
  text_HintLv0 = uiController:FindText("Text_HintLv0");
  text_HintLvAdd = uiController:FindText("Text_HintLvAdd");
  text_HintDescription = uiController:FindText("Text_HintDescription");
  text_HintKind = uiController:FindText("Text_HintKind");

  rawImage_HintIcon = uiController:FindRawImage("RawImage_SkillHint");

  tempEvent = uiController:FindEvent("Image_ArrowRight");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_SwitchRole);
  tempEvent.parameter = 1;

  tempEvent = uiController:FindEvent("Image_ArrowLeft");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_SwitchRole);
  tempEvent.parameter = -1;

  event_Submit = uiController:FindEvent("Image_Yes");
  event_Submit:SetListener(EventTriggerType.PointerClick, this.OnClick_Submit);

  event_Cancel = uiController:FindEvent("Image_Reset");
  event_Cancel:SetListener(EventTriggerType.PointerClick, this.OnClick_Cancel);

  event_Reset = uiController:FindEvent("Image_ResetSkill");
  event_Reset:SetListener(EventTriggerType.PointerClick, this.OnClick_Reset);

  event_Add = uiController:FindEvent("Image_Add");
  event_Add:SetListener(EventTriggerType.PointerClick, this.OnClick_SwitchLv);
  event_Add.parameter = 1;

  event_Sub = uiController:FindEvent("Image_Sub");
  event_Sub:SetListener(EventTriggerType.PointerClick, this.OnClick_SwitchLv);
  event_Sub.parameter = -1;

  --mind
  event_MindSkillArrowL = uiController:FindEvent("Image_MindSkillArrowL");
  event_MindSkillArrowL:SetListener(EventTriggerType.PointerClick, this.OnClick_SwitchMindSkill);
  event_MindSkillArrowL.parameter = -1;

  event_MindSkillArrowR = uiController:FindEvent("Image_MindSkillArrowR");
  event_MindSkillArrowR:SetListener(EventTriggerType.PointerClick, this.OnClick_SwitchMindSkill);
  event_MindSkillArrowL.parameter = 1;

  --二轉天珠按鈕
  for i = 1, Turn2_SingleBall do
    local tempTransform = rawImage_TreeLine[ESkillTag.Turn2].transform:Find(string.Concat("Image_BallBtn",i));
    turn2Balls[i] = {};
    turn2Balls[i].gameObject = tempTransform:Find("Image_Icon").gameObject;
    turn2Balls[i].learn = false;
    
    tempEvent = tempTransform:GetComponent("UIEvent");
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Ball);
    tempEvent.parameter = i;
  end

  lightGroup = {};
  lightGroup.gameObject = uiController:FindGameObject("Image_Light");
  -- lightGroup.image = lightGroup.gameObject.transform:Find("Image").gameObject:GetComponent("Image");
  lightGroup.uiCareer = UICareerController.New(lightGroup.gameObject);

  tempEvent = lightGroup.gameObject:GetComponent("UIEvent");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClickElementBtn);
  tempEvent.parameter = 7; --元素種類

  darkGroup = {};
  darkGroup.gameObject = uiController:FindGameObject("Image_Dark");
  -- darkGroup.image = darkGroup.gameObject.transform:Find("Image").gameObject:GetComponent("Image");
  darkGroup.uiCareer = UICareerController.New(darkGroup.gameObject);

  tempEvent = darkGroup.gameObject:GetComponent("UIEvent");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClickElementBtn);
  tempEvent.parameter = 8;

  event_Change = uiController:FindEvent("Image_Change");
  event_Change:SetListener(EventTriggerType.PointerClick, this.OnClickChangeBtn);
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
end

function UISkillTree.CheckPlayerData()
  --檢查技能點數是否異常  
  local skillPoint = Role.player:GetSkillLv(skillInfos[ESkillTag.Earth][1][1]) + Role.player:GetSkillLv(skillInfos[ESkillTag.Water][1][1]) +
    Role.player:GetSkillLv(skillInfos[ESkillTag.Fire][1][1]) + Role.player:GetSkillLv(skillInfos[ESkillTag.Wind][1][1]) + Role.player:GetAttribute(EAttribute.SkillPoint);
  if skillPoint == 0 then 
    TLogError("玩家技能資料異常");
    Network.Send(8, 13, sendBuffer);
  end
end

function UISkillTree.OnOpen()
  RedDot.Remove(ERedDot.SkillPoint);
  
  currentFollowIndex = 0;
  currentRole = Role.player;
  currentElement = currentRole:GetAttribute(EAttribute.Element);
  this.CheckPlayerData();

  return true;
end

function UISkillTree.OnVisible(visible)
  if visible then
    this.UpdateRole();

    UIFrame.Active(transform_FrameRect, string.Get(50311), this.OnClick_Close, this.OnClick_Help, this.OnClick_Tag, tagDatas, currentTag);
  end
end

function UISkillTree.OnClose()
  
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  
  RedDot.Remove(ERedDot.SkillPoint);
  Hotkey.Close(EUseSource.UISkillTree);
end

--init
local function InitPlayerSkill()
  --mind
  local skillCount = table.Count(skillInfos[ESkillTag.Mind]);

  table.Clear(skillInfos[ESkillTag.Mind]);

  local mindSkills = Role.player:GetElementSkill(ESkillTag.Mind);
  for k, v in pairs(mindSkills) do
    table.insert(skillInfos[ESkillTag.Mind], { v.Id, nil, 0 });
  end
  
  --turn2
  local career = currentRole:GetAttribute(EAttribute.Career);
  for k, v in pairs(skillInfos[ESkillTag.Turn2]) do
    if k <= 5 then
      if turn2BaseSkills[career] ~= nil then
        v[1] = turn2BaseSkills[career][k];
      end
    else
      if Role.playerData.heroSkills[k] ~= nil then
        v[1] = Role.playerData.heroSkills[k];
      end
    end
  end

  return skillCount ~= table.Count(skillInfos[ESkillTag.Mind]);
end

local function InitNPCSkill()
  local skillCount = table.Count(skillInfos[ESkillTag.Npc]);

  table.Clear(skillInfos[ESkillTag.Npc]);

  local npcData;
  if currentRole.data.soulId ~= 0 then 
    npcData = npcDatas[currentRole.data.soulId];
  else
    npcData = npcDatas[currentRole.npcId];
  end

  if npcData ~= nil then
    for k, skillId in pairs(npcData.skills) do
      if skillDatas[skillId] ~= nil then
        table.insert(skillInfos[ESkillTag.Npc], { skillId });
      end
    end
  
    --武將特有技
    if currentRole.data.specialSkillLearned then
      if skillDatas[npcData.specialSkill] ~= nil then
        table.insert(skillInfos[ESkillTag.Npc], { npcData.specialSkill });
      end
    end
    
    --被動
    if skillDatas[npcData.passiveSkill] ~= nil then 
      table.insert(skillInfos[ESkillTag.Npc], { npcData.passiveSkill });
    end
  
    --武將強化技
    if currentRole.data.upgradeLv > 0 then
      if skillDatas[npcData.upgradeSkill] ~= nil then
        table.insert(skillInfos[ESkillTag.Npc], { npcData.upgradeSkill });
      end
    end

    --專武技    
    local weaponSkill = ExclusiveWeapon.GetSkillByRole(currentRole);
    if weaponSkill ~= 0 then 
      table.insert(skillInfos[ESkillTag.Npc], { weaponSkill });     
    end
  end

  return skillCount ~= table.Count(skillInfos[ESkillTag.Npc]);
end

--ui update
function UISkillTree.UpdateRole()
  table.Clear(tagDatas);
  if currentRole.kind == EHuman.Player then 
    tagDatas[ESkillTag.Earth] = { string.GetElement(1), nil };
    tagDatas[ESkillTag.Water] = { string.GetElement(2), nil };
    tagDatas[ESkillTag.Fire] = { string.GetElement(3), nil };
    tagDatas[ESkillTag.Wind] = { string.GetElement(4), nil };
    tagDatas[ESkillTag.Mind] = { string.GetElement(5), nil };

    if currentRole:GetAttribute(EAttribute.Turn) >= 1 then
      tagDatas[ESkillTag.Turn1] = { string.Get(90108), nil };

      if currentRole:GetAttribute(EAttribute.Career) > 0 then
        tagDatas[ESkillTag.Turn2] = { string.Get(40451 + currentRole:GetAttribute(EAttribute.Career)), nil };
      end
    end

    if currentRole:GetAttribute(EAttribute.Turn) >= 3 then 
      tagDatas[ESkillTag.LightDark] = { string.Get(22861), nil };
    end
  else
    tagDatas[1] = { string.Get(50311), nil };
    ---2--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local area =  DemoCode.CalTriangleArea(100, 100)
      area = area * 1 + 2;
      if area > DemoCode.GetBitxor(20) then  --test avg
        local avg = DemoCode.CalAvg(10, 20, 30);
      end
    end
    --3----------------------------------------------------
  end

  if currentRole.kind == EHuman.Player then
    currentTag = currentElement;
  else
    currentTag = ESkillTag.Npc;
  end
  
  text_RoleName.text = currentRole.name;

  this.ClearAllAddLvData();
  this.UpdateUI(true);

  if currentFollowIndex == 0 then
    Hotkey.Show(Role.player, EHotkeyDisplayMode.SingleSkill, this.GetCurrentClick());
  else
    Hotkey.Show(currentRole, EHotkeyDisplayMode.SingleSkill, this.GetCurrentClick());    
  end
end

function UISkillTree.GetSortOrder()
  return this.uiController.canvas.sortingOrder;
end

function UISkillTree.UpdateUI(reset)
  local dirty = false;
  if currentRole.kind == EHuman.Player then
    dirty = InitPlayerSkill();
  else
    dirty = InitNPCSkill();
  end

  if reset or dirty then
    currentSkill = nil;

    if rawImage_TreeLine[currentTag] ~= nil then
      if currentTag ~= ESkillTag.Mind then
        local idx = currentTag;
        if currentTag > ESkillTag.Mind then 
          idx = currentTag - 1;
        end
        TextureManager.SetPng(ETextureUseType.UI, string.Concat("SkillTreeLine", idx), rawImage_TreeLine[currentTag]);
      end
    end
  
    for k, v in pairs(rawImage_TreeLine) do
      v.gameObject:SetActive(k == currentTag);
    end
  
    transform_NpcSkill.gameObject:SetActive(currentTag == ESkillTag.Npc);
    transform_SoulSkill.gameObject:SetActive(currentTag == ESkillTag.Npc);
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
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------  --5-----------------------------------------------------
    --  if LuaHelper.CheckDefine("DemoCode") then
    --    --
    --  end
    --  --6-----------------------------------------------------
    --  --5-----------------------------------------------------
    --  if LuaHelper.CheckDefine("DemoCode") then
    --    --
    --  end
    --  --6-----------------------------------------------------
    --  --5-----------------------------------------------------
    --  if LuaHelper.CheckDefine("DemoCode") then
    --    --
    --  end
    --  --6-----------------------------------------------------  --5-----------------------------------------------------
    --  if LuaHelper.CheckDefine("DemoCode") then
    --    --
    --  end
    --  --6-----------------------------------------------------
    --  --5-----------------------------------------------------
    --  if LuaHelper.CheckDefine("DemoCode") then
    --    --
    --  end
    --  --6-----------------------------------------------------
    --  --5-----------------------------------------------------
    --  if LuaHelper.CheckDefine("DemoCode") then
    --    --
    --  end
    --  --6-----------------------------------------------------
    transform_MindSkill.gameObject:SetActive(ESkillTag.Mind == currentTag);
    event_MindSkillArrowL.gameObject:SetActive(ESkillTag.Mind == currentTag);
    event_MindSkillArrowR.gameObject:SetActive(ESkillTag.Mind == currentTag);
  
    transform_HeroSkill.gameObject:SetActive(currentTag == ESkillTag.Hero);
    transform_LightDarkSkill.gameObject:SetActive(currentTag == ESkillTag.LightDark);
    gameObject_SkillPoint:SetActive(currentTag ~= ESkillTag.LightDark);
    gameObject_BallText:SetActive(currentTag ~= ESkillTag.LightDark);

    if currentTag == ESkillTag.LightDark then 
      darkGroup.uiCareer:SetCareer(0, 8, ECareer.None, false);
      lightGroup.uiCareer:SetCareer(0, 7, ECareer.None, false);
    end
  
    for k in pairs(skills) do
      skills[k]:Destroy();
      skills[k] = nil;
    end
    table.Clear(skills);
    
    if currentTag == ESkillTag.Npc then
      for k, skillInfo in pairs(skillInfos[currentTag]) do
        local skillId = skillInfo[1];

        local skillController = UISkillController.New(transform_NpcSkill, this.OnClick_Skill, skillInfo);
        skillController:SetSkill(skillId, currentRole:GetSkillLv(skillId) + this.GetAddLv(skillId), currentElement);
  
        table.insert(skills, skillController);
      end

      --靈魂技
      local soulData = UISoul.GetEquipNpc(currentRole.npcId);
      if soulData ~= nil then
        for i = 1, Role.maxSoulSkill do
          local skillInfo = skillDatas[soulData.skill[i].id];
          if skillInfo ~= nil then
            local skillController = UISkillController.New(transform_SoulSkill, this.OnClick_Skill, skillInfo);
            skillController:SetSkill(soulData.skill[i].id, soulData.skill[i].lv);
            skillController:SetShowCost(false);

            table.insert(skills, skillController);
          end
        end
      end
  
    elseif currentTag == ESkillTag.Mind then
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
      
      event_MindSkillArrowL.gameObject:SetActive(currentMindPage > 0);
      event_MindSkillArrowR.gameObject:SetActive(currentMindPage < math.floor((table.Count(skillInfos[currentTag]) / 24)));
      for i = 1, mindSkillPerPage do
        local skillInfo = skillInfos[currentTag][currentMindPage * mindSkillPerPage + i];
        if skillInfo ~= nil then
          local skillId = skillInfo[1];
          if skillId ~= nil then
            local skillController = UISkillController.New(transform_MindSkill, this.OnClick_Skill, skillInfo);
            skillController:SetSkill(skillId, currentRole:GetSkillLv(skillId) + this.GetAddLv(skillId), currentElement);
      
            table.insert(skills, skillController);
          end
        end
      end
  
    elseif currentTag == ESkillTag.Hero then
      for i = ESkillTag.Earth, ESkillTag.Wind do
        for k, skillId in pairs(skillInfos[currentTag][i]) do
          local skillController = UISkillController.New(transform_HeroElement[i], this.OnClick_Skill, { skillId });
          skillController:SetSkill(skillId, currentRole:GetSkillLv(skillId) + this.GetAddLv(skillId), currentElement);
  
          table.insert(skills, skillController);
        end
      end
  
    else
      for k, skillInfo in pairs(skillInfos[currentTag]) do
        local skillId = skillInfo[1];
        skillId = this.TransferSummonID(skillId);
        
        local root = nil;
        if currentTag == ESkillTag.LightDark then 
          root = transform_LightDarkSkill;
        else
          root = rawImage_TreeLine[currentTag].transform;
        end
        local skillController = UISkillController.New(root, this.OnClick_Skill, skillInfo);
        skillController:SetSkill(skillId, currentRole:GetSkillLv(skillId) + this.GetAddLv(skillId), currentElement);
        skillController:SetLock(false);
        skillController.transform.localPosition = skillInfo[2];
        skillController.index = k;
        if currentTag == ESkillTag.LightDark then   
          skillController:SetShowCost(false);
          local skillElement = skillDatas[skillId].element; 
          if currentRole:GetAttribute(EAttribute.Turn3Element) ~= skillElement and skillElement ~= EElement.Mind then           
            skillController:SetLock(true);
          end
        end
        table.insert(skills, skillController);
      end
    end

  else
    for k, v in pairs(skills) do
      local skillId = v.parameter[1];
      skillId = this.TransferSummonID(skillId);
      v:SetLock(false);      
      v:SetSkill(skillId, currentRole:GetSkillLv(skillId) + this.GetAddLv(skillId), currentElement);
      if currentTag == ESkillTag.LightDark then 
        v:SetShowCost(false);
        local skillElement = skillDatas[skillId].element; 
        if currentRole:GetAttribute(EAttribute.Turn3Element) ~= skillElement and skillElement ~= EElement.Mind then            
          v:SetLock(true);
        end
      end
    end
  end

  if currentTag == ESkillTag.LightDark then 
    local element = currentRole:GetAttribute(EAttribute.Turn3Element);
    for k, v in pairs(skills) do
      local skillElement =  skillDatas[v.skillId].element;
      if element ~= skillElement then 
        v:SetColor(Color.Gray);
      end
    end
  end

  this.UpdateSkillPoint();
  this.UpdateTurn2Ball();
  this.UpdateSelect();
  this.UpdateSubmit();
  this.UpdateReset();
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
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
end

function UISkillTree.TransferSummonID(skillId)
  if Contains(skillId, 14026, 14077) and currentTag == currentElement then --玩家招喚ID轉換
    if ItemData.IsSummonItem(currentRole.data.equips[EItemFitType.Equip_Spec]) then 
      return Skill.GetSummonSkill(currentElement);    
    end
  else
    if skillDatas[skillId] ~= nil then 
      local element = skillDatas[skillId].element;
      if skillId == 22011 then --光
        if not Contains(currentRole.data.equips[EItemFitType.Equip_Spec], 23361, 23367) or element ~= currentRole:GetAttribute(EAttribute.Turn3Element) or currentRole:GetSkillLv(skillId) == 0 then          
          return 14077;
        end
      elseif skillId == 23011 then --暗
        if not Contains(currentRole.data.equips[EItemFitType.Equip_Spec], 23362, 23368) or element ~= currentRole:GetAttribute(EAttribute.Turn3Element) or currentRole:GetSkillLv(skillId) == 0 then          
          return 14077;
        end
      end
    end
  end
  return skillId;
end

function UISkillTree.UpdateHint()
  if currentSkill ~= nil and skillDatas[currentSkill.skillId] ~= nil then
    local skillData = skillDatas[currentSkill.skillId];

    skillData:SetIcon(rawImage_HintIcon);
    rawImage_HintIcon.enabled = true;
  
    text_HintName.text = skillData.name;
    text_HintDescription.text = skillData:GetDescription(currentRole, nil, this.GetAddLv(currentSkill.skillId));
    if skillData.fightWay == 1 then 
      text_HintKind.gameObject:SetActive(true);
      text_HintKind.text = string.Get(21596);
    elseif currentRole ~= nil and currentRole.kind == EHuman.FollowNpc then 
      if npcDatas[currentRole.npcId] ~= nil and npcDatas[currentRole.npcId].passiveSkill == currentSkill.skillId then 
        text_HintKind.gameObject:SetActive(true);
        text_HintKind.text = string.Get(71281);
      else
        text_HintKind.gameObject:SetActive(false);
      end
    else
      text_HintKind.gameObject:SetActive(false);
    end
    
    if Contains(currentTag, ESkillTag.Hero, ESkillTag.LightDark)then
      event_Add.gameObject:SetActive(false);
      event_Sub.gameObject:SetActive(false);
    else
      event_Add.gameObject:SetActive(true);
      event_Sub.gameObject:SetActive(true);
    end
  else
    rawImage_HintIcon.texture = nil;
    rawImage_HintIcon.enabled = false;
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
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------

    text_HintName.text = "";
    text_HintDescription.text = "";
    text_HintKind.gameObject:SetActive(false);
    event_Add.gameObject:SetActive(false);
    event_Sub.gameObject:SetActive(false);
  end

  this.UpdateHintLv();
end

function UISkillTree.UpdateHintLv()
  text_HintLv.gameObject:SetActive(false);
  text_HintLvValue.gameObject:SetActive(false);
  text_HintLv0.gameObject:SetActive(false);
  text_HintLvAdd.text = "";

  if currentSkill == nil then return end

  local skillId = currentSkill.skillId;
  local skillData = skillDatas[skillId];

  if skillData == nil then return end
  
  local skillLv = 0;
  if currentRole ~= nil then
    skillLv = currentRole:GetSkillLv(skillId);
  end

  text_HintLvValue.text = skillLv;
  text_HintLvAdd.text = "";

  local addLv = this.GetAddLv(skillId);
  if skillLv + addLv > 0 then
    text_HintLv.gameObject:SetActive(true);
    text_HintLvValue.gameObject:SetActive(true);

    if Skill.IsSummonSkill(currentSkill.skillId) and not Item.CheckSummonEquip(currentSkill.skillId, currentRole) then
      text_HintLv0.gameObject:SetActive(true);
      text_HintLv0.text = string.Get(21427);
    else
      text_HintLv0.gameObject:SetActive(false);
    end

    if addLv > 0 then
      text_HintLvAdd.text = string.Concat("+ ", addLv);
    end
  else
    text_HintLv.gameObject:SetActive(false);
    text_HintLvValue.gameObject:SetActive(false);
    text_HintLv0.gameObject:SetActive(true);
    text_HintLv0.text = string.Get(21426);
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
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    
    if skillData.learnPoint > 0 then
      local pointRate = 1;
      if Between(skillData.element, 1, 4) and skillData.element ~= currentElement then
        pointRate = 2;
      end

      if currentTag == ESkillTag.LightDark then 
        text_HintLvAdd.text = "";
      else
        text_HintLvAdd.text = string.Concat("(", string.Get(20561), tostring(skillData.learnPoint * pointRate), string.Get(20562), ")");
      end
    end
  end
  this.uiController:RebuilderRectTransfrom(rectTransform_LayOut);
end

function UISkillTree.UpdateSelect()
  if currentSkill == nil or skillDatas[currentSkill.skillId] == nil then
    for k, v in pairs(skills) do
      if v.skillId ~= 0 then
        currentSkill = v;
        break;
      end
    end
  end

  if currentSkill ~= nil then
    transform_Selected.gameObject:SetActive(true);
    transform_Selected:SetParent(currentSkill.transform);
    transform_Selected.localPosition = Vector3.zero;
    transform_Selected.localScale = Vector3.one;

    if UI.IsVisible(UIHotkey) then
      UIHotkey.SelectedItem(currentSkill.skillId, EHotKeyType.Skill);
    end
  else
    transform_Selected.gameObject:SetActive(false);
  end

  if currentTag == ESkillTag.Hero then
    for k, v in pairs(skills) do
      if v == currentSkill or v.skillLv > 0 then
        v:SetColor(Color.White);
      else
        v:SetColor(Color.Gray);
      end
    end
  end
  
  this.UpdateHint();
  this.UpdateSubmit();
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
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
end

function UISkillTree.UpdateSubmit()
  if currentTag == ESkillTag.Hero then
    event_Submit.gameObject:SetActive(true);
    event_Cancel.gameObject:SetActive(true);
  else
    event_Submit.gameObject:SetActive(useSkillPoint + useTurn2Ball > 0);
    event_Cancel.gameObject:SetActive(useSkillPoint + useTurn2Ball > 0);
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
    
  end
end

function UISkillTree.UpdateReset()
  local skillLearn = false;

  if currentRole.kind == EHuman.Player then
    for i = ESkillTag.Earth, ESkillTag.Wind do
      for k, v in pairs(skillInfos[i]) do
        if  not Contains(v[1], 0, 14026, 14077) then --招喚不用判斷
          if Role.player:GetSkillLv(v[1]) > 0 then
            skillLearn = true;
            break;
          end
        end
      end
    end

    for k, v in pairs(skillInfos[ESkillTag.Mind]) do
      if v[1] ~= 0 then
        if Role.player:GetSkillLv(v[1]) > 1 then
          skillLearn = true;
          break;
        end
      end
    end
  end

  event_Reset.gameObject:SetActive(skillLearn and currentTag ~= ESkillTag.LightDark);
end

function UISkillTree.UpdateSkillPoint()
  totalSkillPoint = currentRole:GetAttribute(EAttribute.SkillPoint);

  text_Point.text = totalSkillPoint - useSkillPoint;
end

function UISkillTree.UpdateTurn2Ball()
  if currentTag == ESkillTag.Turn2 then
    for i = 1, Turn2_SingleBall do
      if Role.playerData.turn2Balls[i] or turn2Balls[i].learn then
        turn2Balls[i].gameObject:SetActive(true);
      else
        turn2Balls[i].gameObject:SetActive(false);
      end
    end
  end

  totalTurn2Ball = Role.playerData.turn2BallCount;

  text_Ball.text = totalTurn2Ball - useTurn2Ball;
end

--reset
function UISkillTree.ClearAllAddLvData()
  for k, v in pairs(skillInfos[ESkillTag.Turn2]) do
    if k > 5 then
      v[1] = 0;
    end
  end

  for k, v in pairs(turn2Balls) do
    v.learn = false;
  end

  table.Clear(learnSkills);

  useSkillPoint = 0;
  useTurn2Ball = 0;
end

--get
function UISkillTree.GetCurrentClick()
  if currentSkill ~= nil then
    return currentSkill.skillId;
  else
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
    return 0;
  end
end

function UISkillTree.GetSkillLv(element, index, excludeAdd)
  local skillId = skillInfos[element][index][1];

  if excludeAdd == true then
    return currentRole:GetSkillLv(skillId);
  else
    return currentRole:GetSkillLv(skillId) + this.GetAddLv(skillId);
  end
end

function UISkillTree.GetAddLv(skillId)
  if learnSkills[skillId] ~= nil then
    return learnSkills[skillId];
  else
    return 0;
  end
end

function UISkillTree.IsCurrentRole(role)
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  return currentRole == role;
end

--check
function UISkillTree.CheckElement(element, showMessage)
  local antiElement = ESkillTag.Npc;
  if currentElement == ESkillTag.Earth then
    antiElement = ESkillTag.Fire;
  elseif currentElement == ESkillTag.Water then
    antiElement = ESkillTag.Wind;
  elseif currentElement == ESkillTag.Fire then
    antiElement = ESkillTag.Earth;
  elseif currentElement == ESkillTag.Wind then
    antiElement = ESkillTag.Water;
  end

  if antiElement == element then
    if showMessage ~= false then
      if antiElement == ESkillTag.Earth then
        --1--------------------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
          local code = DemoCode.GetBitxor(20);
          code = code * 10;
        end
        ---2--------------------------------------------------------------
        ShowCenterMessage(string.Get(20551));
      elseif antiElement == ESkillTag.Water then 
        ShowCenterMessage(string.Get(20552));
      elseif antiElement == ESkillTag.Fire then 
        ShowCenterMessage(string.Get(20553));
        --1--------------------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
          local code = DemoCode.GetBitxor(20);
          code = code * 10;
        end
        ---2--------------------------------------------------------------
      elseif antiElement == ESkillTag.Wind then 
        ShowCenterMessage(string.Get(20554));
      end
    end
    
    return false;
  end

  return true;
end

--add level
function UISkillTree.AddSkillLv(value)
  local skillInfo = currentSkill.parameter;
  local skillId = skillInfo[1];
  local skillData = skillDatas[skillId];
  local skillLv = currentRole:GetSkillLv(skillId);
  local skillIndex = currentSkill.index;

  local addLv = this.GetAddLv(skillId);

  if skillData == nil then return end

  if Contains(skillId, 14026, 14077) or Skill.IsSummonSkill(skillId) then return end

  if currentTag == ESkillTag.LightDark then 
    --光暗不加點
    return;
  elseif currentRole.kind == EHuman.Player then
    --玩家額外檢查
    if Contains(currentTag, ESkillTag.Turn2, ESkillTag.Hero) and currentRole:GetAttribute(EAttribute.Turn) < 2 then
      return;
    end

    --檢查已經學過
    if currentTag == ESkillTag.Hero then
      if skillLv + addLv > 0 then
        ShowCenterMessage(string.Get(90085));
        --1--------------------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
          local code = DemoCode.GetBitxor(20);
          code = code * 10;
        end
        ---2--------------------------------------------------------------
        --1--------------------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
          local code = DemoCode.GetBitxor(20);
          code = code * 10;
        end
        ---2--------------------------------------------------------------
        return false;
      end
    end
    
    if not this.CheckElement(skillData.element) then return end

  else
    --武將額外檢查
    local npcData = nil;
    if currentRole.data.soulId ~= 0 then 
      npcData = npcDatas[currentRole.data.soulId];
    else
      npcData = npcDatas[currentRole.npcId];
    end
    
     --特有技、強化技,被動無法升級
    if skillId == npcData.specialSkill or skillId == npcData.upgradeSkill or skillId == npcData.passiveSkill then
      return;
    end
    
    --專武技無法升級
    if skillId == ExclusiveWeapon.GetSkillByRole(currentRole) then 
      return 
    end
  end
  
  local treeData = nil;
  if SkillTree[currentTag] ~= nil then
    for k, v in pairs(SkillTree[currentTag]) do
      if v.skillId == skillId then
        treeData = v;
        break;
      end
    end
  end

  if value > 0 then
    if currentTag == ESkillTag.Turn1 then
      --一轉技能額外檢查
      if skillId == 10020 then
        --至少需學完地系一線
        if this.GetSkillLv(ESkillTag.Earth, 5, true) > 0 or
          this.GetSkillLv(ESkillTag.Earth, 6, true) > 0 or
          this.GetSkillLv(ESkillTag.Earth, 8, true) > 0 or
          this.GetSkillLv(ESkillTag.Earth, 13, true) > 0 or
          this.GetSkillLv(ESkillTag.Earth, 14, true) > 0 or
          this.GetSkillLv(ESkillTag.Earth, 15, true) > 0 then
        else
          ShowCenterMessage(string.Get(60042));
          return;
        end
      elseif skillId == 11020 then
        --至少需學完水系一線
        if this.GetSkillLv(ESkillTag.Water, 6, true) > 0 or
          this.GetSkillLv(ESkillTag.Water, 7, true) > 0 or
          this.GetSkillLv(ESkillTag.Water, 12, true) > 0 or
          this.GetSkillLv(ESkillTag.Water, 13, true) > 0 then
        else
          ShowCenterMessage(string.Get(60043));
          return;
        end
      elseif skillId == 12020 then
        --至少需學完火系一線
        if this.GetSkillLv(ESkillTag.Fire, 6, true) > 0 or
          this.GetSkillLv(ESkillTag.Fire, 11, true) > 0 or
          this.GetSkillLv(ESkillTag.Fire, 15, true) > 0 then
        else
          ShowCenterMessage(string.Get(60044));
          return;
        end
      elseif skillId == 13019 then
        --至少需學完風系一線
        if this.GetSkillLv(ESkillTag.Wind, 7, true) > 0 or
          this.GetSkillLv(ESkillTag.Wind, 12, true) > 0 or
          this.GetSkillLv(ESkillTag.Wind, 14, true) > 0 then
        else
          ShowCenterMessage(string.Get(60045));
          return;
        end
      end
    elseif currentTag == ESkillTag.Turn2 then
      --檢查路徑上的球
      ballIndex = skillIndex - 1;
      if ballIndex > 0 then
        if not Role.playerData.turn2Balls[ballIndex] and not turn2Balls[ballIndex].learn then
          ShowCenterMessage(string.Get(90083));
          --1--------------------------------------------------------------
          if LuaHelper.CheckDefine("DemoCode") then
            local code = DemoCode.GetBitxor(20);
            code = code * 10;
          end
          ---2--------------------------------------------------------------
          --1--------------------------------------------------------------
          if LuaHelper.CheckDefine("DemoCode") then
            local code = DemoCode.GetBitxor(20);
            code = code * 10;
          end
          ---2--------------------------------------------------------------
          return;
        end
      end
    end

    --加點時檢查上限
    if skillLv + addLv == skillData.maxLv then  
      ShowCenterMessage(string.Get(20582));
      return;
    end

    local needPoint = 0;
    if skillLv + addLv == 0 then
      --第一點
      --檢查前置技能
      if table.Count(skillData.preSkills) > 0 then
        local checkCount = 0;
        local failCount = 0;
        local checkMessage = string.Get(20581);

        for k, preSkillId in pairs(skillData.preSkills) do
          --只算同頁的欲加點數
          local preSkillAddLv = 0;
          for kk, vv in pairs(skillInfos[currentTag]) do
            if vv[1] == preSkillId then
              preSkillAddLv = this.GetAddLv(preSkillId);
              break;
            end
          end
          
          if skillDatas[preSkillId] ~= nil then
            checkCount = checkCount + 1;
            if currentRole:GetSkillLv(preSkillId) + preSkillAddLv == 0 then
              if failCount > 0 then
                checkMessage = string.Concat(checkMessage, string.Get(20587));
              end

              checkMessage = string.Concat(checkMessage, skillDatas[preSkillId].name);
              failCount = failCount + 1;
            end
          end
        end

        if checkCount > 0 and checkCount == failCount then
          ShowCenterMessage(checkMessage);
          return;
        end
      end
      
      needPoint = skillData.learnPoint;
      if Between(skillData.element, 1, 4) and skillData.element ~= currentElement then
        needPoint = needPoint * 2;
      end

      if totalSkillPoint - useSkillPoint < needPoint then
        ShowCenterMessage(string.Concat(string.Get(20583), needPoint, string.Get(20584)));
        return;
      end
    else
      --後面的點數
      needPoint = skillData.levelUpPoint;

      if totalSkillPoint - useSkillPoint < needPoint then
        ShowCenterMessage(string.Get(20585));
        return;
      end
    end

    useSkillPoint = useSkillPoint + needPoint;

    if learnSkills[skillId] == nil then
      learnSkills[skillId] = 1;
    else
      learnSkills[skillId] = learnSkills[skillId] + 1;
    end
    addLv = addLv + 1;

  else
    --扣點時檢查下限
    if addLv == 0 or skillLv + addLv == 0 then
      return;
    end

    local needPoint = 0;
    if skillLv + addLv == 1 then
      --第一點
      --檢查子技能
      if skillInfo[3] ~= nil then
        for k, v in pairs(skillInfo[3]) do
          if v > 0 then
            if this.GetSkillLv(currentTag, v) > 0 then
              logError("Child Skill Learned !!");
              return;
            end
          else
            if this.GetSkillLv(ESkillTag.Turn1, (currentTag - 1) * 7 + 1) > 0 then
              logError("Child Skill Learned !!");
              return;
            end
          end
        end
      end
      
      needPoint = skillData.learnPoint;
      if Between(skillData.element, 1, 4) and skillData.element ~= currentElement then
        needPoint = needPoint * 2;
      end
    else
      --後面的點數
      needPoint = skillData.levelUpPoint;
    end

    useSkillPoint = useSkillPoint - needPoint;

    learnSkills[skillId] = learnSkills[skillId] - 1
    if learnSkills[skillId] == 0 then
      learnSkills[skillId] = nil;
    end
    addLv = addLv - 1;
  end
  
  if currentTag == ESkillTag.Hero then
    if currentHeroSkill ~= nil then
      currentHeroSkill[1] = skillId;
      currentHeroSkill = nil;

      this.OnClick_Tag(ESkillTag.Turn2);
      return;
    end
  elseif currentTag == ESkillTag.Turn2 then
    if skillIndex > 5 and skillLv + addLv == 0 then
      skillInfo[1] = 0;

      currentHeroSkill = skillInfo;

      this.OnClick_Tag(ESkillTag.Hero);
      return;
    end
  end

  currentSkill:SetLevel(skillLv + addLv, currentElement);

  this.UpdateSkillPoint();
  this.UpdateSubmit();
  this.UpdateHintLv();
  this.UpdateHint();
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  
end

function UISkillTree.SendPlayerSkill()
  local addBalls = {};
  local addSkills = {};
  local turn2Skills = {};
  local isTurn2 = false;
  
  for i = 1, Turn2_SingleBall do
    if turn2Balls[i] ~= nil then
      if turn2Balls[i].learn then
        table.insert(addBalls, i);
      end
    end 
  end

  for i = ESkillTag.Earth, ESkillTag.Turn2 do    
    for k, v in pairs(skillInfos[i]) do      
      local skillId = v[1];
      if this.GetAddLv(skillId) > 0 then         
        if i == ESkillTag.Mind then 
        --心系要檢查是否跟二轉重複
          local check = false;
          for k2, v2 in pairs(skillInfos[ESkillTag.Turn2]) do 
            if v2[1] == skillId then 
              check = true;
              break;
            end
          end
          if check == false then 
            table.insert(addSkills, { skillId, this.GetSkillLv(i, k) });        
          end
        else
          table.insert(addSkills, { skillId, this.GetSkillLv(i, k) });        
        end

        if i == ESkillTag.Turn2 then
          isTurn2 = true;
          if k > 5 then
            table.insert(turn2Skills, { k, skillId });
          end
        end
      end
    end
  end

  if table.Count(addSkills) == 0 and table.Count(addBalls) == 0 then
    ShowCenterMessage(string.Get(20571));
    --1--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local code = DemoCode.GetBitxor(20);
      code = code * 10;
    end
    ---2--------------------------------------------------------------
---  --1--------------------------------------------------------------
    --  if LuaHelper.CheckDefine("DemoCode") then
    --    local code = DemoCode.GetBitxor(20);
    --    code = code * 10;
    --  end
    --  ---2--------------------------------------------------------------
  
    --1--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local code = DemoCode.GetBitxor(20);
      code = code * 10;
    end
    ---2--------------------------------------------------------------
---  --1--------------------------------------------------------------
    --  if LuaHelper.CheckDefine("DemoCode") then
    --    local code = DemoCode.GetBitxor(20);
    --    code = code * 10;
    --  end
    --  ---2--------------------------------------------------------------
    --1--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local code = DemoCode.GetBitxor(20);
      code = code * 10;
    end
    ---2--------------------------------------------------------------
---  --1--------------------------------------------------------------
    --  if LuaHelper.CheckDefine("DemoCode") then
    --    local code = DemoCode.GetBitxor(20);
    --    code = code * 10;
    --  end
    --  ---2--------------------------------------------------------------
    return;
  end
  
  if table.Count(addBalls) > 0 or isTurn2 then
    --C:028-005 <二轉寄能升級> +長度(4) <<+天珠(1)>> +長度(4) <<+技能ID(2) +技能等級(1)>> +長度(4) <<+不知道是啥索引(1) +技能ID(2)>>
    sendBuffer:Clear();
    sendBuffer:WriteUInt32(table.Count(addBalls));
    for k, v in pairs(addBalls) do
      sendBuffer:WriteByte(v);
    end
  
    sendBuffer:WriteUInt32(table.Count(addSkills));
    for k, v in pairs(addSkills) do
      sendBuffer:WriteUInt16(v[1]);
      sendBuffer:WriteByte(v[2]);
    end
  
    sendBuffer:WriteUInt32(table.Count(turn2Skills));
    for k, v in pairs(turn2Skills) do
      sendBuffer:WriteByte(v[1]);
      sendBuffer:WriteUInt16(v[2]);
    end
    Network.Send(28, 5, sendBuffer);
  else
    --C:028-001 <玩家技能升級> <<+技能ID(2) +技能等級(1)>>
    sendBuffer:Clear();
    for k, v in pairs(addSkills) do
      sendBuffer:WriteUInt16(v[1]);
      sendBuffer:WriteByte(v[2]);
    end
    Network.Send(28, 1, sendBuffer);
  end

  this.ClearAllAddLvData();
end

function UISkillTree.SendNpcSkill()
  local addSkills = {};

  for k, v in pairs(skillInfos[ESkillTag.Npc]) do
    local skillId = v[1];
    if this.GetAddLv(skillId) > 0 then
      table.insert(addSkills, { skillId, this.GetSkillLv(ESkillTag.Npc, k) });
    end
  end
  
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------

  --C:028-002 <武將技能升級> +武將索引(1) <<+技能ID(2) +技能等級(1)>>
  sendBuffer:Clear();
  sendBuffer:WriteByte(currentFollowIndex);
  for k, v in pairs(addSkills) do
    sendBuffer:WriteUInt16(v[1]);
    sendBuffer:WriteByte(v[2]);
  end
  Network.Send(28, 2, sendBuffer);

  this.ClearAllAddLvData();
end

--click
function UISkillTree.OnClick_Close()
  UI.Close(UISkillTree);

  return true;
end



function UISkillTree.OnClick_Help(checkShow)
  if checkShow ~= true then
    if currentTag == ESkillTag.Earth then 
      UI.Open(UITutorialHint, 4, this);
    elseif currentTag == ESkillTag.Water then 
      UI.Open(UITutorialHint, 5, this);
    elseif currentTag == ESkillTag.Fire then 
      UI.Open(UITutorialHint, 6, this);
    elseif currentTag == ESkillTag.Wind then 
      UI.Open(UITutorialHint, 7, this);
    elseif currentTag == ESkillTag.Mind then 
      UI.Open(UITutorialHint, 8, this);
    else
      local element = currentRole:GetAttribute(EAttribute.Element)
      UI.Open(UITutorialHint, 3+element, this);
    end
  end

  return true;
end

function UISkillTree.OnClick_Tag(mainTag, subTag)
  if not this.CheckElement(mainTag) then return false end

  currentTag = mainTag;

  this.UpdateUI(true);
  this.UpdateSubmit();
  this.UpdateSelect();
  
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
---  --1--------------------------------------------------------------
  --  if LuaHelper.CheckDefine("DemoCode") then
  --    local code = DemoCode.GetBitxor(20);
  --    code = code * 10;
  --  end
  --  ---2--------------------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
---  --1--------------------------------------------------------------
  --  if LuaHelper.CheckDefine("DemoCode") then
  --    local code = DemoCode.GetBitxor(20);
  --    code = code * 10;
  --  end
  --  ---2--------------------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
---  --1--------------------------------------------------------------
  --  if LuaHelper.CheckDefine("DemoCode") then
  --    local code = DemoCode.GetBitxor(20);
  --    code = code * 10;
  --  end
  --  ---2--------------------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
---  --1--------------------------------------------------------------
  --  if LuaHelper.CheckDefine("DemoCode") then
  --    local code = DemoCode.GetBitxor(20);
  --    code = code * 10;
  --  end
  --  ---2--------------------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  return true;
end

function UISkillTree.OnClick_SwitchRole(uiEvent)
  currentRole = nil;

  if uiEvent.parameter > 0 then
    for i = currentFollowIndex + 1, Role.maxFollowNpc do
      currentRole = Role.GetRole(EHuman.FollowNpc, Role.playerId, i);

      if currentRole ~= nil then
        currentFollowIndex = i;
        break;
      end
    end
  else
    if currentFollowIndex == 0 then 
      currentFollowIndex = Role.maxFollowNpc + 1;
    end

    for i = currentFollowIndex - 1, 1, -1 do
      currentRole = Role.GetRole(EHuman.FollowNpc, Role.playerId, i);

      if currentRole ~= nil then
        currentFollowIndex = i;
        break;
      end
    end
  end

  if currentRole == nil then
    currentFollowIndex = 0;
    currentRole = Role.player;
  end

  currentElement = currentRole:GetAttribute(EAttribute.Element);

  this.OnVisible(true);
end

function UISkillTree.OnClick_SwitchMindSkill(uiEvent)
  currentMindPage = math.clamp(currentMindPage + uiEvent.parameter, math.floor((table.Count(skillInfos[ESkillTag.Mind]) / mindSkillPerPage)));
  
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  this.UpdateUI(true);
end

function UISkillTree.OnClick_Skill(uiEvent)
  local skillController = uiEvent.parameter;
  if currentTag == ESkillTag.LightDark then  --解鎖確認
    if skillController.skillLv == 0 then 
      this.UnLockSkill(skillController.skillId, skillController.index);
      -- return;
    end
  end

  --點擊未學習的英雄技能
  if currentTag == ESkillTag.Turn2 and skillController.skillId == 0 then
    --檢查路徑上的球
    ballIndex = skillController.index - 1;
    if ballIndex > 0 then
      if not Role.playerData.turn2Balls[ballIndex] and not turn2Balls[ballIndex].learn then
        ShowCenterMessage(string.Get(90083));
        return;
      end
    end

    --檢查前置技能
    if Contains(skillController.index, 6, 7) then
      if this.GetSkillLv(ESkillTag.Turn2, 1) == 0 or this.GetSkillLv(ESkillTag.Turn2, 2) == 0 then
        ShowCenterMessage(string.Concat(string.Get(20581), skillDatas[skillInfos[ESkillTag.Turn2][1][1]].name, string.Get(90093), skillDatas[skillInfos[ESkillTag.Turn2][2][1]].name));
        return;
      end
    elseif Contains(skillController.index, 8, 9) then
      if this.GetSkillLv(ESkillTag.Turn2, 1) == 0 or this.GetSkillLv(ESkillTag.Turn2, 3) == 0 then
        ShowCenterMessage(string.Concat(string.Get(20581), skillDatas[skillInfos[ESkillTag.Turn2][1][1]].name, string.Get(90093), skillDatas[skillInfos[ESkillTag.Turn2][3][1]].name));
        return;
      end
    elseif Contains(skillController.index, 10, 11) then
      if this.GetSkillLv(ESkillTag.Turn2, 1) == 0 or this.GetSkillLv(ESkillTag.Turn2, 4) == 0 then
        ShowCenterMessage(string.Concat(string.Get(20581), skillDatas[skillInfos[ESkillTag.Turn2][1][1]].name, string.Get(90093), skillDatas[skillInfos[ESkillTag.Turn2][4][1]].name));
        return;
      end
    elseif Contains(skillController.index, 12, 13) then
      if this.GetSkillLv(ESkillTag.Turn2, 1) == 0 or this.GetSkillLv(ESkillTag.Turn2, 5) == 0 then
        ShowCenterMessage(string.Concat(string.Get(20581), skillDatas[skillInfos[ESkillTag.Turn2][1][1]].name, string.Get(90093), skillDatas[skillInfos[ESkillTag.Turn2][5][1]].name));
        --1--------------------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
          local code = DemoCode.GetBitxor(20);
          code = code * 10;
        end
        ---2--------------------------------------------------------------
---  --1--------------------------------------------------------------
        --  if LuaHelper.CheckDefine("DemoCode") then
        --    local code = DemoCode.GetBitxor(20);
        --    code = code * 10;
        --  end
        --  ---2--------------------------------------------------------------
        --1--------------------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
          local code = DemoCode.GetBitxor(20);
          code = code * 10;
        end
        ---2--------------------------------------------------------------
---  --1--------------------------------------------------------------
        --  if LuaHelper.CheckDefine("DemoCode") then
        --    local code = DemoCode.GetBitxor(20);
        --    code = code * 10;
        --  end
        --  ---2--------------------------------------------------------------
        --1--------------------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
          local code = DemoCode.GetBitxor(20);
          code = code * 10;
        end
        ---2--------------------------------------------------------------
---  --1--------------------------------------------------------------
        --  if LuaHelper.CheckDefine("DemoCode") then
        --    local code = DemoCode.GetBitxor(20);
        --    code = code * 10;
        --  end
        --  ---2--------------------------------------------------------------
        --1--------------------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
          local code = DemoCode.GetBitxor(20);
          code = code * 10;
        end
        ---2--------------------------------------------------------------
---  --1--------------------------------------------------------------
        --  if LuaHelper.CheckDefine("DemoCode") then
        --    local code = DemoCode.GetBitxor(20);
        --    code = code * 10;
        --  end
        --  ---2--------------------------------------------------------------
        return;
      end
    end

    currentHeroSkill = skillController.parameter;
    this.OnClick_Tag(ESkillTag.Hero);
    return;
  end
  
  --重複點擊直接投點
  if currentSkill == skillController then
    this.AddSkillLv(1);
    return;
  end

  currentSkill = skillController;
  currentSkill.transform.localScale = Vector2.one;
  this.UpdateSelect();
end

function UISkillTree.OnClick_Ball(uiEvent)
  local ballIndex = uiEvent.parameter;

  if Role.playerData.turn2Balls[ballIndex] or turn2Balls[ballIndex].learn then return end

  --判斷天珠可不可以按
  local skillIndex = 0;
  if Between(ballIndex, 1, 4) then
    skillIndex = 1;
  elseif Contains(ballIndex, 5, 6) then
    skillIndex = 2;
  elseif Contains(ballIndex, 7, 8) then
    skillIndex = 3;
  elseif Contains(ballIndex, 9, 10) then
    skillIndex = 4;
  elseif Contains(ballIndex, 11, 12) then
    skillIndex = 5;
  end

  if skillIndex == 0 then return end

  if this.GetSkillLv(ESkillTag.Turn2, skillIndex) == 0 then
    local skillId = skillInfos[ESkillTag.Turn2][skillIndex][1];

    ShowCenterMessage(string.Concat(string.Get(20581), skillDatas[skillId].name));
    return;
  end

  if useTurn2Ball >= totalTurn2Ball then
    ShowCenterMessage(string.Get(90092));
    --1--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local code = DemoCode.GetBitxor(20);
      code = code * 10;
    end
    ---2--------------------------------------------------------------
---  --1--------------------------------------------------------------
    --  if LuaHelper.CheckDefine("DemoCode") then
    --    local code = DemoCode.GetBitxor(20);
    --    code = code * 10;
    --  end
    --  ---2--------------------------------------------------------------
    --1--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local code = DemoCode.GetBitxor(20);
      code = code * 10;
    end
    ---2--------------------------------------------------------------
---  --1--------------------------------------------------------------
    --  if LuaHelper.CheckDefine("DemoCode") then
    --    local code = DemoCode.GetBitxor(20);
    --    code = code * 10;
    --  end
    --  ---2--------------------------------------------------------------
    return;
  end
  
  useTurn2Ball = useTurn2Ball + 1;
  
  turn2Balls[ballIndex].gameObject:SetActive(true);
  turn2Balls[ballIndex].learn = true;
  
  this.UpdateTurn2Ball();
  this.UpdateSubmit();
end

function UISkillTree.OnClick_SwitchLv(uiEvent)
  this.AddSkillLv(uiEvent.parameter);
end

function UISkillTree.OnClick_Submit()
  if currentTag == ESkillTag.Hero then
    this.AddSkillLv(1);
    return;
  end

  --檢查是否戰鬥中
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end
  
  --檢查是否被關監
  if SceneManager.sceneId == 10701 then  
    ShowCenterMessage(string.Get(40097));
    --1--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local code = DemoCode.GetBitxor(20);
      code = code * 10;
    end
    ---2--------------------------------------------------------------
---  --1--------------------------------------------------------------
    --  if LuaHelper.CheckDefine("DemoCode") then
    --    local code = DemoCode.GetBitxor(20);
    --    code = code * 10;
    --  end
    --  ---2--------------------------------------------------------------
    --1--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local code = DemoCode.GetBitxor(20);
      code = code * 10;
    end
    ---2--------------------------------------------------------------
---  --1--------------------------------------------------------------
    --  if LuaHelper.CheckDefine("DemoCode") then
    --    local code = DemoCode.GetBitxor(20);
    --    code = code * 10;
    --  end
    --  ---2--------------------------------------------------------------
    --1--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local code = DemoCode.GetBitxor(20);
      code = code * 10;
    end
    ---2--------------------------------------------------------------
    return;
  end
  
  if currentTag == ESkillTag.Npc then
    this.SendNpcSkill();
  else
    this.SendPlayerSkill();
  end
end

function UISkillTree.OnClick_Cancel()
  if currentTag == ESkillTag.Hero then
    this.OnClick_Tag(ESkillTag.Turn2);
    return;
  end

  totalSkillPoint = currentRole:GetAttribute(EAttribute.SkillPoint);  
  totalBallCount = Role.playerData.turn2BallCount;

  this.ClearAllAddLvData();
  this.UpdateUI(true);
end

function UISkillTree.OnClick_Reset()
  UISell.Launch(17);
end

function UISkillTree.OnClickElementBtn(event)
  local element = event.parameter;
  if currentRole:GetAttribute(EAttribute.Turn3Element) == 0 then 
    ShowCheckMessage(
      function(result)
        if result then
          --第一次選擇屬性
          sendBuffer:Clear();
          sendBuffer:WriteByte(element);
          Network.Send(8, 12, sendBuffer);
        end
      end,
      string.format( string.Get(22862), string.GetElement(element)),
      currentRole
    );
  end
end

function UISkillTree.OnClickChangeBtn(event)
  local currentElement = currentRole:GetAttribute(EAttribute.Turn3Element);
  if currentElement == EElement.Light then 
    currentElement = EElement.Dark;
  else
    currentElement = EElement.Light;
  end

  UISell.Launch(58, function() ShowCenterMessage(string.format( string.Get(22880), string.GetElement(currentElement))) end , currentElement);
end

function UISkillTree.UnLockSkill(skillId, index)
  local skill = skillDatas[skillId];
  if Skill.IsSummonSkill(skillId) then 
    return;  
  end

  if skill.element == Role.player:GetAttribute(EAttribute.Turn3Element) then 
    local skillName = skill.name;
    UISell.Launch(57, function() ShowCenterMessage(string.format( string.Get(22881), skillName)) end, skillId); 
  else
    if skillId == 14077 then 
      if index == 9 then 
        ShowCenterMessage(string.Get(22928));
      else
        ShowCenterMessage(string.Get(22929));
      end      
    else
      ShowCenterMessage(string.Get(22866));
    end
  end
end

