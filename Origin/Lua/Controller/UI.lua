require "Common/Stack"

require "Controller/UIItemController"
require "Controller/UISkillController"
require "Controller/UICareerController"
require "Controller/UIStatusDetail"
require "Controller/UICardController"
require "Controller/UICardSmallController"
require "Controller/UICityScrambleGroundController"
require "Controller/UIEternalDungeonLayerController"

require "UI/UICenterMessage"
require "UI/UIMarqueeMessage"
require "UI/UILogin"
require "UI/UIJoystick"
require "UI/UICreateRole"
require "UI/UIMain"
require "UI/UINewChat"
require "UI/UIMission"
require "UI/UIDebug"
require "UI/UIBlockEditor"
require "UI/UIEmotion"
require "UI/UIBag"
require "UI/UIItemInfo"
require "UI/UIMachineBox"
require "UI/UICheck"
require "UI/UISetting"
require "UI/UIMail"
require "UI/UIInteractive"
require "UI/UIFight"
require "UI/UITeam"
require "UI/UIInvitation"
require "UI/UIStatus"
require "UI/UISkillHint"
require "UI/UILoading"
require "UI/UIArmy"
require "UI/UIArmyList"
require "UI/UISkill"
require "UI/UITrade"
require "UI/UIDeliver"
require "UI/UIShop"
require "UI/UIBank"
require "UI/UIInn"
require "UI/UIShowSceneEffect"
require "UI/UIMessageboard"
require "UI/UICityStation"
require "UI/UIMiniMap"
require "UI/UIMall"
require "UI/UIMallPaySelect"
require "UI/UIMainFunction"
require "UI/UIHotkey" 
require "UI/UISkillTree"
require "UI/UILoginAward"
require "UI/UIAchievement"
require "UI/UIMounts"
require "UI/UIAlert"
require "UI/UIAction"
require "UI/UIFrame"
require "UI/UITeleport"
require "UI/UICompound"
require "UI/UIGodskin"
require "UI/UIGodskinFilter"
require "UI/UISocial"
require "UI/UISocialFunction"
require "UI/UIServerArea"
require "UI/UINpcInn"
require "UI/UIResult"
require "UI/UIInvite"
require "UI/UIDungeon"
require "UI/UINpcInfo"
require "UI/UIAnnouncement"
require "UI/UISkillPick"
require "UI/UIPlayAnimation"
require "UI/UILeaderboard"
require "UI/UIPathTest"
require "UI/UIConditionOfWinOrLose"
require "UI/UIActivity"
require "UI/UIDispatch"
require "UI/UISlotMachine"
require "UI/UIUseContract"
require "UI/UIPreviewModel"
require "UI/UIFirstIAP"
require "UI/UITutorial"
require "UI/UITutorialHint"
require "UI/UITeach"
require "UI/UINpcStore"
require "UI/UINpcTurn"
require "UI/UIFurnace"
require "UI/UIMissionSwitch"
require "UI/UIJiugongge"
require "UI/UIAccount"
require "UI/UITurn"
require "UI/UICollectBook"
require "UI/UIDoro"
require "UI/UIAuction"
require "UI/UIAuctionSell"
require "UI/UIValueBar"
require "UI/UIBeStronger"
require "UI/UIChessMahjong"
require "UI/UISeniorElection"
require "UI/UIFestival"
require "UI/UIReciptHelper"
require "UI/UITitle"
require "UI/UIExpSlotMachine"
require "UI/UILimitedTimeSale"
require "UI/UIDragonBoat"
require "UI/UIPoke"
require "UI/UIWeaponSkillView"
require "UI/UIGMFight"
require "UI/UIDataFight"
require "UI/UIArmyLuckybag"
require "UI/UIPurchaseFree"
require "UI/UICityScramble"
require "UI/UIEternalDungeon"
require "UI/UIHouseBoard"
require "UI/UIHouseBoardFunction"
require "UI/UISouvenirShop"
require "UI/UICharmFeedback"
require "UI/UIMonopoly"
require "UI/UIMissionAward"
require "UI/UIFurnitureInteractive"
require "UI/UIHouseEditor"
require "UI/UIHouseFunction"
require "UI/UIHouseExpand"
require "UI/UIHouseSetting"
require "UI/UIHouseSettingFunction"
require "UI/UIElf"
require "UI/UIHouseMap"
require "UI/UISoul"
require "UI/UISoulInfo"
require "UI/UIMarket"
require "UI/UIRequiem"
require "UI/UIMine"
require "UI/UIBattlePass"
require "UI/UIMyCardInput"
--require "TempXQJ/UIGuildBuild_demo"
--require "TempXQJ/UIHero_demo"

--[[
Now after two years had gone by, Pharaoh had a dream; and in his dream he was by the side of the Nile;
And out of the Nile came seven cows, good-looking and fat, and their food was the river-grass.
And after them seven other cows came out of the Nile, poor-looking and thin; and they were by the side of the other cows.
And the seven thin cows made a meal of the seven fat cows. Then Pharaoh came out of his sleep.
But he went to sleep again and had a second dream, in which he saw seven heads of grain, full and good, all on one stem.
And after them came up seven other heads, thin and wasted by the east wind.
And the seven thin heads made a meal of the good heads. And when Pharaoh was awake he saw it was a dream.
And in the morning his spirit was troubled; and he sent for all the wise men of Egypt and all the holy men, and put his dream before them, but no one was able to give him the sense of it.
Then the chief wine-servant said to Pharaoh, The memory of my sin comes back to me now;
Pharaoh had been angry with his servants, and had put me in prison in the house of the captain of the army, together with the chief bread-maker;
And we had a dream on the same night, the two of us, and the dreams had a special sense.
And there was with us a young Hebrew, the captain's servant, and when we put our dreams before him, he gave us the sense of them.
And it came about as he said: I was put back in my place, and the bread-maker was put to death by hanging.
Then Pharaoh sent for Joseph, and they took him quickly out of prison; and when his hair had been cut and his dress changed, he came before Pharaoh.
And Pharaoh said to Joseph, I have had a dream, and no one is able to give me the sense of it; now it has come to my ears that you are able to give the sense of a dream when it is put before you.
Then Joseph said, Without God there will be no answer of peace for Pharaoh.
Then Pharaoh said, In my dream I was by the side of the Nile:
And out of the Nile came seven cows, fat and good-looking, and their food was the river-grass;
Then after them came seven other cows, very thin and poor-looking, worse than any I ever saw in the land of Egypt;
And the thin cows made a meal of the seven fat cows who came up first;
And even with the fat cows inside them they seemed as bad as before. And so I came out of my sleep.
And again in a dream I saw seven heads of grain, full and good, coming up on one stem:
And then I saw seven other heads, dry, thin, and wasted by the east wind, coming up after them:
And the seven thin heads made a meal of the seven good heads; and I put this dream before the wise men, but not one of them was able to give me the sense of it.
Then Joseph said, These two dreams have the same sense: God has made clear to Pharaoh what he is about to do.
The seven fat cows are seven years, and the seven good heads of grain are seven years: the two have the same sense.
The seven thin and poor-looking cows who came up after them are seven years; and the seven heads of grain, dry and wasted by the east wind, are seven years when there will be no food.
As I said to Pharaoh before, God has made clear to him what he is about to do.
Seven years are coming in which there will be great wealth of grain in Egypt;
And after that will come seven years when there will not be enough food; and the memory of the good years will go from men's minds; and the land will be made waste by the bad years;
And men will have no memory of the good time because of the need which will come after, for it will be very bitter.
And this dream came to Pharaoh twice, because this thing is certain, and God will quickly make it come about.
And now let Pharaoh make search for a man of wisdom and good sense, and put him in authority over the land of Egypt.
Let Pharaoh do this, and let him put overseers over the land of Egypt to put in store a fifth part of the produce of the land in the good years.
And let them get together all the food in those good years and make a store of grain under Pharaoh's control for the use of the towns, and let them keep it.
And let that food be kept in store for the land till the seven bad years which are to come in Egypt; so that the land may not come to destruction through need of food.
And this seemed good to Pharaoh and to all his servants.
Then Pharaoh said to his servants, Where may we get such a man as this, a man in whom is the spirit of God?
And Pharaoh said to Joseph, Seeing that God has made all this clear to you, there is no other man of such wisdom and good sense as you:
You, then, are to be over my house, and all my people will be ruled by your word: only as king will I be greater than you.
And Pharaoh said to Joseph, See, I have put you over all the land of Egypt.
]]--

Color = {
  Alpha = LuaHelper.GetColor(0, 0, 0, 0),
  Black = LuaHelper.GetColor(0, 0, 0, 255),
  NearBlack = LuaHelper.GetColor(1, 1, 1, 255),
  White = LuaHelper.GetColor(255, 255, 255, 255),
  Red = LuaHelper.GetColor(255, 0, 0, 255),
  DarkRed = LuaHelper.GetColor(168, 0, 0, 255),
  Green = LuaHelper.GetColor(0, 255, 0, 255),
  LightGreen = LuaHelper.GetColor(99, 210, 152, 255),
  VeryLightGreen = LuaHelper.GetColor(196, 226, 221, 255),
  DarkGreen = LuaHelper.GetColor(0, 168, 0, 255),
  Blue = LuaHelper.GetColor(0, 0, 255, 255),
  DarkBlue = LuaHelper.GetColor(0, 0, 168, 255),
  LightBlue = LuaHelper.GetColor(64, 60, 144, 255),
  VeryLightBlue = LuaHelper.GetColor(0, 180, 255, 255),
  Purple = LuaHelper.GetColor(255, 0, 255, 255),
  DarkPurple= LuaHelper.GetColor(168, 0, 168, 255),
  NewLv = LuaHelper.GetColor(168, 0, 255, 255),
  Pink = LuaHelper.GetColor(255, 168, 168, 255),
  DarkPink = LuaHelper.GetColor(168, 168, 84, 255);
  Yellow = LuaHelper.GetColor(255, 255, 0, 255);
  DarkYellow= LuaHelper.GetColor(168, 172, 0, 255);
  Gold = LuaHelper.GetColor(255, 192, 4, 255);
  Orange = LuaHelper.GetColor(255, 128, 0, 255);
  Orange2 = LuaHelper.GetColor(255, 48, 0, 255);
  DarkOrange= LuaHelper.GetColor(168, 84, 0, 255);
  Sky = LuaHelper.GetColor(0, 255, 255, 255);
  DarkSky = LuaHelper.GetColor(0, 172, 168, 255);
  LightGray = LuaHelper.GetColor(192, 192, 192, 255);
  Gray = LuaHelper.GetColor(128, 128, 128, 255);
  DarkGray = LuaHelper.GetColor(80, 80, 80, 255);
  Coffee = LuaHelper.GetColor(224, 64, 240, 255);
  Coffee2 = LuaHelper.GetColor(77, 18, 18, 255);
  
  Goal = LuaHelper.GetColor(29, 169, 52, 255);
  DarkUnsatisfiedGoal = LuaHelper.GetColor(240, 80, 80, 255);
  UnsatisfiedGoal = LuaHelper.GetColor(240, 100, 100, 255);
  
  Defend = LuaHelper.GetColor(80, 180, 255, 255); --守方
  Attack = LuaHelper.GetColor(255, 100, 88, 255); --攻方
  MissionNPC = LuaHelper.GetColor(255, 160, 255, 255); --任務NPC,可成長
  MountsGray = LuaHelper.GetColor(30, 30, 30, 255);

  ItemSuit = LuaHelper.GetColor(255, 114, 0, 255);
  ItemAtt = LuaHelper.GetColor(73, 128, 133, 255);
  ItemLimit = LuaHelper.GetColor(98, 96, 186, 255);

  PurchaseFreeBlue = LuaHelper.GetColor(222, 235, 247, 255);
  HouseGrayBlue = LuaHelper.GetColor(66, 89, 133, 255);
  HouseDarkBlue = LuaHelper.GetColor(37, 55, 85, 255);

  MountCollect = LuaHelper.GetColor(252, 247, 243, 255);
  MountNotCollect = LuaHelper.GetColor(214, 208, 195, 255);
  
  ItemQuality = {
    [0] = LuaHelper.GetColor(255, 255, 255, 255);
    [1] = LuaHelper.GetColor(60, 179, 79, 255);
    [2] = LuaHelper.GetColor(57, 86, 208, 255);
    [3] = LuaHelper.GetColor(94, 58, 187, 255);
    [4] = LuaHelper.GetColor(234, 53, 53, 255);
  };

  SkillKind = {
    [0] = LuaHelper.GetColor(255, 255, 255, 255);
    [1] = LuaHelper.GetColor(253, 221, 87, 255);--地
    [2] = LuaHelper.GetColor(63, 199, 255, 255);--水
    [3] = LuaHelper.GetColor(247, 73, 73, 255);--火
    [4] = LuaHelper.GetColor(88, 231, 69, 255);--風
    [5] = LuaHelper.GetColor(69, 92, 231, 255);--心
    [6] = LuaHelper.GetColor(248, 183, 135, 255);--光
    [7] = LuaHelper.GetColor(0, 0, 0, 255);--暗
  };

  ElementHint = {
    [1] = LuaHelper.GetColor(255, 168, 0, 255);--地
    [2] = LuaHelper.GetColor(56, 86, 208, 255);--水
    [3] = LuaHelper.GetColor(234, 53, 53, 255);--火
    [4] = LuaHelper.GetColor(60, 179, 79, 255);-- 風
  };

  CareerKind = {
    [0] = {
      [1] = LuaHelper.GetColor(224, 224, 224, 255);--無 color
      [2] = LuaHelper.GetColor(178, 178, 178, 255);--outline
      [3] = LuaHelper.GetColor(255, 255, 255, 255);--gradientcolor
      [4] = LuaHelper.GetColor(99, 82, 72, 255);-- color CreateRole Disable
    };
    [1] = {
      [1] = LuaHelper.GetColor(255, 168, 0, 255);--地 color
      [2] = LuaHelper.GetColor(118, 83, 16, 255);--outline
      [3] = LuaHelper.GetColor(255, 199, 90, 255);--gradientcolor
      [4] = LuaHelper.GetColor(165, 78, 19, 255);--地 color CreateRole
      [5] = LuaHelper.GetColor(234, 175, 131, 255);--gradientcolor CreateRole
    };
    [2] = {
      [1] = LuaHelper.GetColor(57, 86, 208, 255);--水 color
      [2] = LuaHelper.GetColor(12, 30, 103, 255);--outline
      [3] = LuaHelper.GetColor(100, 126, 243, 255);--gradientcolor
      [4] = LuaHelper.GetColor(91, 162, 192, 255);--水 color CreateRole
      [5] = LuaHelper.GetColor(177, 248, 249, 255);--gradientcolor CreateRole
    };
    [3] = {
      [1] = LuaHelper.GetColor(234, 53, 53, 255);--火 color
      [2] = LuaHelper.GetColor(75, 1, 1, 255);--outline
      [3] = LuaHelper.GetColor(255, 143, 143, 255);--gradientcolor
      [4] = LuaHelper.GetColor(217, 63, 78, 255);--火 color CreateRole
      [5] = LuaHelper.GetColor(239, 205, 151, 255);--gradientcolor CreateRole
    };
    [4] = {
      [1] = LuaHelper.GetColor(60, 179, 79, 255);--風 color
      [2] = LuaHelper.GetColor(10, 101, 25, 255);--outline
      [3] = LuaHelper.GetColor(146, 223, 158, 255);--gradientcolor
      [4] = LuaHelper.GetColor(66, 143, 66, 255);--風 color CreateRole
      [5] = LuaHelper.GetColor(219, 235, 162, 255);--gradientcolor CreateRole
    };
    [5] = {
      [1] = LuaHelper.GetColor(94, 58, 187, 255);--心 color
      [2] = LuaHelper.GetColor(44, 14, 120, 255);--outline
      [3] = LuaHelper.GetColor(170, 139, 249, 255);--gradientcolor
    };
    [7] = {
      [1] = LuaHelper.GetColor(118, 237, 227, 255);--光 color
      [2] = LuaHelper.GetColor(24, 118, 110, 255);--outline
      [3] = LuaHelper.GetColor(188, 255, 249, 255);--gradientcolor
    };
    [8] = {
      [1] = LuaHelper.GetColor(42, 42, 42, 255);--暗 color
      [2] = LuaHelper.GetColor(0, 0, 0, 255);--outline
      [3] = LuaHelper.GetColor(84, 84, 84, 255);--gradientcolor
    };
    [9] = {
      [1] = LuaHelper.GetColor(191, 29, 151, 255);--轉 color
      [2] = LuaHelper.GetColor(101, 18, 81, 255);--outline
      [3] = LuaHelper.GetColor(233, 123, 205, 255);--gradientcolor
    };
    [10] = {
      [1] = LuaHelper.GetColor(229, 107, 26, 255);--俠、霸、賢、仙 color
      [2] = LuaHelper.GetColor(152, 67, 11, 255);--outline
      [3] = LuaHelper.GetColor(255, 174, 120, 255);--gradientcolor
    };
  };

  Channel = {
    [0] = LuaHelper.GetColor(248, 196, 136, 255);
    [1] = LuaHelper.GetColor(248, 244, 152, 255);
    [2] = LuaHelper.GetColor(196, 220, 152, 255);
    [3] = LuaHelper.GetColor(128, 200, 152, 255);
    [4] = LuaHelper.GetColor(104, 204, 240, 255);
    [5] = LuaHelper.GetColor(136, 196, 56, 255);
    [6] = LuaHelper.GetColor(255, 255, 255, 255);
    [7] = LuaHelper.GetColor(255, 0, 0, 255);
    [8] = LuaHelper.GetColor(240, 148, 24, 255);
    [9] = LuaHelper.GetColor(248, 240, 0, 255);
    [10] = LuaHelper.GetColor(255, 128, 0, 255);
  };

  CityScramble = {
    [0] = LuaHelper.GetColor(239,123,4,255);--未佔領
    [1] = LuaHelper.GetColor(58,107,236,255);--魏(主城) 藍
    [2] = LuaHelper.GetColor(6,203,37,255);--蜀(主城) 綠
    [3] = LuaHelper.GetColor(253,33,28,255);--吳(主城) 紅
  };
--[[
  Channel = {
    [0] = LuaHelper.GetColor(255, 78, 0, 255);--系統訊息
    [1] = LuaHelper.GetColor(49, 49, 49, 255);--全頻
    [2] = LuaHelper.GetColor(134, 181, 184, 255); --輕頻
    [3] = LuaHelper.GetColor(224, 61, 61, 255);--密頻
    [4] = LuaHelper.GetColor(255, 78, 0, 255);--gm頻
    [5] = LuaHelper.GetColor(32, 126, 54, 255);--隊頻
    [6] = LuaHelper.GetColor(40, 125, 204, 255); --團頻
    [7] = LuaHelper.GetColor(95, 53, 152, 255);--盟頻
    [8] = LuaHelper.GetColor(95, 53, 152, 255);
    [10] = LuaHelper.GetColor(255, 255, 255, 255);--自己講的話
    [11] = LuaHelper.GetColor(255, 78, 0, 255);--系統公告
  };
  --]]
}

AtlasName = {
  Common = "Common",
  Common0 = "common0", 
  Common1 = "common1"
}

UISortingOrder = {
  Scene = 100,
  General = 200,
  Hint = 250,
  Top = 300,
}

UIInsetScreen = {
  "iPhone10,3",     --iPhone_X
  "iPhone10,6",     --iPhone_X
  "iPhone11,2",     --iPhone_XS
  "iPhone11,4",     --iPhone_XS_Max_China
  "iPhone11,6",     --iPhone_XS_Max
  "iPhone11,8",     --iPhone_XR
  "iPhone12,1",     --iPhone_11
  "iPhone12,3",     --iPhone_11_Pro
  "iPhone12,5",     --iPhone_11_Pro_Max"
  "iPhone12,8",     --iPhone_SE_2"
  "iPhone13,1",     --iPhone_12_mini"
  "iPhone13,2",     --iPhone_12"
  "iPhone13,3",     --iPhone_12_Pro"
  "iPhone13,4",     --iPhone_12_Pro_Max"
}

UI = {};
local this = UI;

this.gameObject = nil;
this.transform = nil;
this.rectTransform = nil;
this.camera = nil;

this.width = 1024;
this.height = 768;
this.scale = 1;

this.fullRect = Rect.New(0, 0, 1, 1);

this.loadCount = 0;
this.maxMainTab = 20;
this.maxSubTab = 30;
this.screenRatio = 0;

this.tabUIPosition = Vector2.New(60, -25);
this.tabUISize = Vector2.New(760, 430);
this.nonTabUIPosition = Vector2.New(0, -25);
this.nonTabUISize = Vector2.New(880, 430);

this.showMainUI = true;
this.showMiniMap = false;
this.showMission = true;
this.showAllMission = false;

local previusStack = Stack.New();
local uiTable = {};

function UI.GetLShift(bitlshift1, bitlshift2)
  local lshiftN = 0;
  bit.lshift(lshiftN, bitlshift1)
  bit.lshift(lshiftN, bitlshift2)
  
  return lshiftN
end

function UI.Destroy()
  poolMgr:DestroyPool("BBaseUIEternalDungeonLayer");
  poolMgr:DestroyPool("BaseUICityGround");
  poolMgr:DestroyPool("BaseUIItem");
  poolMgr:DestroyPool("BaseUISkill");
  poolMgr:DestroyPool("BaseUIFunction");
  poolMgr:DestroyPool("BaseHeadIcon");
  poolMgr:DestroyPool("BaseUICareer");
  poolMgr:DestroyPool("BaseCard");
  poolMgr:DestroyPool("BaseCardSmall");
  poolMgr:DestroyPool("BaseUIStatusDetail");

  for i = 1, 5 do
    poolMgr:DestroyPool(string.Concat("GuideTip_", i));
  end

  for k, v in pairs(uiTable) do
    if k ~= UILoading then
      GameObject.Destroy(v.uiController.gameObject);
      v.uiController = nil;
    end
  end
  table.Clear(uiTable);
end

function UI.GetLShift1(bitlshift1, bitlshift2)
  local lshiftN = 0;
  bit.lshift(lshiftN, bitlshift1)
  bit.lshift(lshiftN, bitlshift2)
  
  return lshiftN
end

function UI.GetLShift2(bitlshift1, bitlshift2)
  local lshiftN = 0;
  bit.lshift(lshiftN, bitlshift1)
  bit.lshift(lshiftN, bitlshift2)
  
  return lshiftN
end

function UI.GetLShift3(bitlshift1, bitlshift2)
  local lshiftN = 0;
  bit.lshift(lshiftN, bitlshift1)
  bit.lshift(lshiftN, bitlshift2)
  
  return lshiftN
end

function UI.GetLShift4(bitlshift1, bitlshift2)
  local lshiftN = 0;
  bit.lshift(lshiftN, bitlshift1)
  bit.lshift(lshiftN, bitlshift2)
  
  return lshiftN
end

function UI.Initialize()
  this.gameObject = GameObject.FindGameObjectWithTag("UICamera");
  this.transform = this.gameObject.transform.parent;
  this.camera = this.gameObject:GetComponent("Camera");
  this.rectTransform = GameObject.Find("UI"):GetComponent("RectTransform");
  
  this.height = Screen.height / Screen.width * this.width;
  this.scale = this.height / 600; 
  this.screenRatio = string.format("%.2f", Screen.width / Screen.height);
end

function UI.LoadText()
  this.loadCount = 0;

  this.loadCount = this.loadCount + 1;
  CGResourceManager.Load(
    "GenJyuuGothic_Bold",
    "Text",
    function(assetName, asset)
      this.loadCount = this.loadCount - 1;
      asset.material.mainTexture.filterMode = FilterMode.Point;
    end
  );
end

function UI.GetLShift5(bitlshift1, bitlshift2)
  local lshiftN = 0;
  bit.lshift(lshiftN, bitlshift1)
  bit.lshift(lshiftN, bitlshift2)
  
  return lshiftN
end

function UI.GetLShift6(bitlshift1, bitlshift2)
  local lshiftN = 0;
  bit.lshift(lshiftN, bitlshift1)
  bit.lshift(lshiftN, bitlshift2)
  
  return lshiftN
end

function UI.LoadSomething()
  this.loadCount = 0;

  this.loadCount = this.loadCount + 1;
  CGResourceManager.Load(
    "BaseUIItem",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("BaseUIItem", asset);
      this.loadCount = this.loadCount - 1;
    end
  );

  this.loadCount = this.loadCount + 1;
  CGResourceManager.Load(
    "BaseUISkill",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("BaseUISkill", asset);
      this.loadCount = this.loadCount - 1;
    end
  );

  this.loadCount = this.loadCount + 1;
  CGResourceManager.Load(
    "BaseUIFunction",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("BaseUIFunction", asset);
      this.loadCount = this.loadCount - 1;
    end
  );

    --頭像圖
  this.loadCount = this.loadCount + 1;
  CGResourceManager.Load(
    "BaseHeadIcon",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("BaseHeadIcon", asset);
      this.loadCount = this.loadCount - 1;
    end
  );

    --屬性圖
  this.loadCount = this.loadCount + 1;
  CGResourceManager.Load(
    "BaseUICareer",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("BaseUICareer", asset);
      this.loadCount = this.loadCount - 1;
    end
  );

    --卡片
    this.loadCount = this.loadCount + 1;
    CGResourceManager.Load(
      "BaseCard",
      "",
      function(assetName, asset)
        poolMgr:CreatePool("BaseCard", asset);
        this.loadCount = this.loadCount - 1;
      end
    );
    
    this.loadCount = this.loadCount + 1;
    CGResourceManager.Load(
      "BaseCardSmall",
      "",
      function(assetName, asset)
        poolMgr:CreatePool("BaseCardSmall", asset);
        this.loadCount = this.loadCount - 1;
      end
    );
    
    this.loadCount = this.loadCount + 1;
    CGResourceManager.Load(
      "BaseUICityGround",
      "",
      function(assetName, asset)
        poolMgr:CreatePool("BaseUICityGround", asset);
        this.loadCount = this.loadCount - 1;
      end
    );
    
    this.loadCount = this.loadCount + 1;
    CGResourceManager.Load(
      "BaseUIEternalDungeonLayer",
      "",
      function(assetName, asset)
        poolMgr:CreatePool("BaseUIEternalDungeonLayer", asset);
        this.loadCount = this.loadCount - 1;
      end
    );
  
  this.loadCount = this.loadCount + 1;
  CGResourceManager.Load(
    "BaseUIStatusDetail",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("BaseUIStatusDetail", asset);
      this.loadCount = this.loadCount - 1;
    end
  );
end

function UI.CheckLoad()
  if this.loadCount == 0 then
    return true;
  end

  return false;
end

function UI.Update()
  for k in pairs(uiTable) do
    if UI.IsVisible(k) then
      if k.Update ~= nil then
        k.Update();
      end
    end
  end
end

function UI.GetLShift7(bitlshift1, bitlshift2)
  local lshiftN = 0;
  bit.lshift(lshiftN, bitlshift1)
  bit.lshift(lshiftN, bitlshift2)
  
  return lshiftN
end

function UI.GetLShift8(bitlshift1, bitlshift2)
  local lshiftN = 0;
  bit.lshift(lshiftN, bitlshift1)
  bit.lshift(lshiftN, bitlshift2)
  
  return lshiftN
end

function UI.GetLShift9(bitlshift1, bitlshift2)
  local lshiftN = 0;
  bit.lshift(lshiftN, bitlshift1)
  bit.lshift(lshiftN, bitlshift2)
  
  return lshiftN
end

function UI.GetLShift10(bitlshift1, bitlshift2)
  local lshiftN = 0;
  bit.lshift(lshiftN, bitlshift1)
  bit.lshift(lshiftN, bitlshift2)
  
  return lshiftN
end

function UI.ResetShow()
  this.showMainUI = true;
  this.showMiniMap = false;
  this.showMission = true;
  this.showAllMission = false;
end

--Open
function UI.Preload(ui, open, forceUseArgs, args)
  if uiTable[ui] == nil then
    local uiTransform = this.transform:Find(ui.name);

    if uiTransform ~= nil then
      this.OnLoadUI(ui, uiTransform.gameObject, open, forceUseArgs, args);
    else
      UI.DownloadUI(ui, open, forceUseArgs, args); --包檔載資源
    end
  else

  end
end

function UI.TrashA()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function UI.TrashB()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function UI.DownloadUI(ui, open, forceUseArgs, args)
  CGResourceManager.Load(
    string.Concat("UI_", string.sub(ui.name, 3, string.len(ui.name))),
    "UI",
    function(assetName, asset)
      if uiTable[ui] ~= nil then return end
          
      if asset == nil then
        logError(string.Concat(ui.name, " Not Found !!"));
        return;
      end

      local uiObject = GameObject.Instantiate(asset);

      if uiObject == nil then
        logError(string.Concat(ui.name, " Instantiate Fail !!"));
        return;
      end

      uiObject.name = ui.name;
      uiObject.transform:SetParent(this.transform);
      uiObject.transform.localPosition = Vector3.zero;
      uiObject.transform.localScale = Vector3.one;
      uiObject.transform.localRotation = Quaternion.identity;

      local rectTransform = uiObject:GetComponent("RectTransform");
      rectTransform.sizeDelta = Vector2.zero;

      this.OnLoadUI(ui, uiObject, open, forceUseArgs, args);
    end,
    args
  );
end

function UI.Open(ui, ...)
  this.DoOpen(ui, false, ...);
end

function UI.OpenAlwaysUseArgument(ui, ...)
  this.DoOpen(ui, true, ...);
end

function UI.TrashC()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function UI.TrashD()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function UI.TrashE()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function UI.TrashF()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function UI.DoOpen(ui, forceUseArgs, ...)
  if ui == nil then return end
  
  local args = { ... }
  
  if uiTable[ui] == nil then
    this.Preload(ui, true, forceUseArgs, args);
    return;
  end

  if not ui.uiController:Open(...) then return end

  this.InsertUI(ui);

  if ui.uiController.usePreviousStack or forceUseArgs then
    local push = true;

    --將最上層的介面關閉
    if previusStack:Count() > 0 then
      local previousUI = previusStack:Peek();

      if previousUI[1] == ui then
        push = false;
      end

      if push then
        if ui.uiController.usePreviousStack or (previousUI[2] and forceUseArgs) then
          previousUI[1].uiController:Hide(true);

          this.RemoveUI(previousUI[1]);
        end
      end
    end

    --將目前要開啟的介面加入堆疊中
    if push then
      previusStack:Push({ ui, forceUseArgs, args });
    end
  end

  this.ForIphoneXScreen(GameObject.Find(ui.name))
end

function UI.OnLoadUI(ui, uiObject, open, forceUseArgs, args)
  local uiController = uiObject:GetComponent("UIController");

  if uiController == nil then
    logError(string.Concat(ui.name, "UIController Not Found !!"));
    return;
  end

  uiTable[ui] = ui;

  uiController:Initialize(ui.name);
  uiController:ChangeStyle(Setting.client.uiStyle);

  if open == true then
    this.DoOpen(ui, forceUseArgs, unpack(args, 1, table.maxn(args)));
  end
end

--Close
function UI.Close(ui, ...)
  if ui == nil then return end
  
  local args = ...;
  
  if uiTable[ui] == nil then return end
  
  local currentUI = nil;
  
  if previusStack:Count() > 0 then
    currentUI = previusStack:Peek();

    if currentUI[1] == ui then
      previusStack:Pop();
    else
      currentUI = nil;
    end
  end
  
  ui.uiController:Close(args);

  this.RemoveUI(ui);

  if currentUI ~= nil then
    if previusStack:Count() > 0 then
      local previousUI = previusStack:Peek();

      if currentUI[1].uiController.usePreviousStack or (currentUI[2] and previousUI[2]) then
        if previousUI[2] then
          previusStack:Pop();
          this.DoOpen(previousUI[1], previousUI[2], unpack(previousUI[3], 1, table.maxn(previousUI[3])));
        else
          previousUI[1].uiController:Hide(false);

          this.InsertUI(previousUI[1]);
        end
      end
    end
  end
end

function UI.CloseAllPreviousUI()
  while previusStack:Count() > 0 do
    local previousUI = previusStack:Pop();
    
    previousUI[1].uiController:Close();
  end
end

--[[
Now in the days of Amraphel, king of Shinar, Arioch, king of Ellasar, Chedorlaomer, king of Elam, and Tidal, king of Goiim,
They made war with Bera, king of Sodom, and with Birsha, king of Gomorrah, Shinab, king of Admah, and Shemeber, king of Zeboiim, and the king of Bela (which is Zoar).
All these came together in the valley of Siddim (which is the Salt Sea).
For twelve years they were under the rule of Chedorlaomer, but in the thirteenth year they put off his control.
And in the fourteenth year, Chedorlaomer and the kings who were on his side, overcame the Rephaim in Ashteroth-karnaim, and the Zuzim in Ham, and the Emim in Shaveh-kiriathaim,
And the Horites in their mountain Seir, driving them as far as El-paran, which is near the waste land.
Then they came back to En-mishpat (which is Kadesh), making waste all the country of the Amalekites and of the Amorites living in Hazazon-tamar.
And the king of Sodom with the king of Gomorrah and the king of Admah and the king of Zeboiim and the king of Bela (that is Zoar), went out, and put their forces in position in the valley of Siddim,
Against Chedorlaomer, king of Elam, and Tidal, king of Goiim, and Amraphel, king of Shinar, and Arioch, king of Ellasar: four kings against the five.
Now the valley of Siddim was full of holes of sticky earth; and the kings of Sodom and Gomorrah were put to flight and came to their end there, but the rest got away to the mountain.
And the four kings took all the goods and food from Sodom and Gomorrah and went on their way.
And in addition they took Lot, Abram's brother's son, who was living in Sodom, and all his goods.
And one who had got away from the fight came and gave word of it to Abram the Hebrew, who was living by the holy tree of Mamre, the Amorite, the brother of Eshcol and Aner, who were friends of Abram.
And Abram, hearing that his brother's son had been made a prisoner, took a band of his trained men, three hundred and eighteen of them, sons of his house, and went after them as far as Dan.
--]]

local viewException = {
  UICenterMessage,
  UIMarqueeMessage,
  UIDebug,
  UIShowSceneEffect,
  UIJoystick,
  UIMiniMap,
  UIInteractive,
  UIMainFunction,
  UINewChat,
  UIMain,
}

local screenView = {};

function UI.InsertUI(ui)
  if table.Contains(viewException, ui) then return end
  if not ui.uiController.usePreviousStack and table.Contains(screenView, ui) then return end

  table.insert(screenView, ui);

  if #screenView == 0 then return end

  PluginManager.ViewUI(screenView[#screenView].name)
end

function UI.GetBitxorA(bitxor)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoXorN = 10;
    DemoXorN = bit.bxor(DemoXorN, bitxor)
    
    return DemoXorN;
  end
end

function UI.GetBitxorB(bitxor)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoXorN = 10;
    DemoXorN = bit.bxor(DemoXorN, bitxor)
    
    return DemoXorN;
  end
end

function UI.RemoveUI(ui)
  if table.Contains(viewException, ui) then return end

  local count = table.maxn(screenView);
  for i = count, 1, -1 do
    if screenView[i] == ui then
      table.remove(screenView, i);
      if ui.uiController.usePreviousStack then
        break;
      end
    end
  end

  if #screenView == 0 then return end

  PluginManager.ViewUI(screenView[#screenView].name)
end

function UI.GetCurrentUI()
  return screenView[#screenView];
end

function UI.GetBitxorC(bitxor)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoXorN = 10;
    DemoXorN = bit.bxor(DemoXorN, bitxor)
    
    return DemoXorN;
  end
end

function UI.GetBitxorD(bitxor)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoXorN = 10;
    DemoXorN = bit.bxor(DemoXorN, bitxor)
    
    return DemoXorN;
  end
end

function UI.GetBitxorE(bitxor)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoXorN = 10;
    DemoXorN = bit.bxor(DemoXorN, bitxor)
    
    return DemoXorN;
  end
end

local closeException = {
  UICenterMessage,
  UIMarqueeMessage,
}

function UI.CloseAll()
  this.CloseAllPreviousUI();
  for k, ui in pairs(uiTable) do
    if not table.Contains(closeException, ui) then
      UI.Close(ui);
    end
  end
end

--Hide
local hidedUI = {};

function UI.HideAll(hide, ...)
  if hide then
    local exceptUI = {...};
    
    for k, v in pairs(uiTable) do
      if table.GetKey(exceptUI, v.name) == nil then
        this.Hide(v);
      end
    end
  else
    for k, v in pairs(uiTable) do
      if table.GetKey(exceptUI, v.name) == nil then
        this.Unhide(v);
      end
    end
  end
end

function UI.Hide(ui)    
  if uiTable[ui] == nil then return end
  if uiTable[ui].uiController == nil then return end
  if uiTable[ui].uiController.canvas == nil then return end

  uiTable[ui].uiController.canvas.enabled = false;

  if uiTable[ui].uiController.visible and uiTable[ui].OnVisible ~= nil then
    uiTable[ui].OnVisible(false);
  end

  table.insert(hidedUI, ui);
end

function UI.GetBitxorF(bitxor)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoXorN = 10;
    DemoXorN = bit.bxor(DemoXorN, bitxor)
    
    return DemoXorN;
  end
end

function UI.GetBitxorG(bitxor)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoXorN = 10;
    DemoXorN = bit.bxor(DemoXorN, bitxor)
    
    return DemoXorN;
  end
end

function UI.GetBitxorH(bitxor)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoXorN = 10;
    DemoXorN = bit.bxor(DemoXorN, bitxor)
    
    return DemoXorN;
  end
end

function UI.GetBitxorI(bitxor)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoXorN = 10;
    DemoXorN = bit.bxor(DemoXorN, bitxor)
    
    return DemoXorN;
  end
end

function UI.Unhide(ui)
  if uiTable[ui] == nil then return end
  if uiTable[ui].uiController == nil then return end
  if uiTable[ui].uiController.canvas == nil then return end

  uiTable[ui].uiController.canvas.enabled = true;
  
  if uiTable[ui].uiController.visible and uiTable[ui].OnVisible ~= nil then
    uiTable[ui].OnVisible(true);
  end

  table.RemoveByValue(hidedUI, ui);
end

function UI.IsVisible(ui)
  if ui == nil then return false end
  if ui.uiController == nil then return false end
  if ui.uiController.visible == nil then return false end
  
  return ui.uiController.visible or ui.uiController.gameObject.activeSelf;
end

function UI.UpdateStyle()
  for k, v in pairs(uiTable) do
    if v.uiController ~= nil then
      v.uiController:ChangeStyle(Setting.client.uiStyle);
    end
  end
end

function UI.AviodCov()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function UI.ForIphoneXScreen(uiObject)
  if not table.Contains(UIInsetScreen, SystemInfo.deviceModel) then
    return
  end

  local uiName = uiObject.name;

  if uiName == UIMain.name then
    uiObject.transform.offsetMin = Vector2.New(46, 34);--left bottom
    uiObject.transform.offsetMax = Vector2.New(-46, 0);--right top
  elseif uiName == UINewChat.name then
    uiObject.transform.offsetMin = Vector2.New(46, 34);
    uiObject.transform.offsetMax = Vector2.New(0, 0);
  elseif uiName == UIInteractive.name then
    uiObject.transform.offsetMin = Vector2.New(0, 34);
    uiObject.transform.offsetMax = Vector2.New(-46, 0);
  elseif uiName == UIMainFunction.name then
    uiObject.transform.offsetMin = Vector2.New(0, 34);
    uiObject.transform.offsetMax = Vector2.New(-46, 0);
  elseif uiName == UIMiniMap.name then
    uiObject.transform.offsetMin = Vector2.New(46, 0);
    uiObject.transform.offsetMax = Vector2.New(-46, 0);
  elseif uiName == UIHotkey.name then
    uiObject.transform.offsetMin = Vector2.New(0, 0);
    uiObject.transform.offsetMax = Vector2.New(-46, 0);
  elseif uiName == UIFight.name then
    uiObject.transform.offsetMin = Vector2.New(46, 34);
    uiObject.transform.offsetMax = Vector2.New(-46, 0);
  elseif uiName == UISkillPick.name then
    uiObject.transform.offsetMin = Vector2.New(0, 34);
    uiObject.transform.offsetMax = Vector2.New(0, 0);
  elseif uiName == UICheck.name then
    uiObject.transform.offsetMin = Vector2.New(0, 34);
    uiObject.transform.offsetMax = Vector2.New(0, 0);
  elseif uiName == UILoading.name then
    uiObject.transform.offsetMin = Vector2.New(0, 0);
    uiObject.transform.offsetMax = Vector2.New(0, 0);
  end
end

function UI.AviodCov1()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function UI.AviodCov2()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

--Settter
EAnchorKind = {
  Left = 1,
  LeftTop = 2,
  Top = 3,
  RightTop = 4,
  Right = 5,
  RightBottom = 6,
  Bottom = 7,
  LeftBottom = 8,
  MiddleCenter = 9
}

EAnchor = {
  Left = Vector2.New(0, 0.5);
  LeftTop = Vector2.New(0, 1);
  Top = Vector2.New(0.5, 1);
  RightTop = Vector2.New(1, 1);
  Right = Vector2.New(1, 0.5);
  RightBottom = Vector2.New(1, 0);
  Bottom = Vector2.New(0.5, 0);
  LeftBottom = Vector2.New(0, 0);
  Center = Vector2.New(0.5, 0.5);
}

function UI.SetAnchor(rectTransform, anchorKind)
  if anchorKind == EAnchorKind.Left then
    rectTransform.anchorMin = EAnchor.Left;
    rectTransform.anchorMax = EAnchor.Left;
  elseif anchorKind == EAnchorKind.LeftTop then
    rectTransform.anchorMin = EAnchor.LeftTop;
    rectTransform.anchorMax = EAnchor.LeftTop;
  elseif anchorKind == EAnchorKind.Top then
    rectTransform.anchorMin = EAnchor.Top;
    rectTransform.anchorMax = EAnchor.Top;
  elseif anchorKind == EAnchorKind.RightTop then
    rectTransform.anchorMin = EAnchor.RightTop;
    rectTransform.anchorMax = EAnchor.RightTop;
  elseif anchorKind == EAnchorKind.Right then
    rectTransform.anchorMin = EAnchor.Right;
    rectTransform.anchorMax = EAnchor.Right;
  elseif anchorKind == EAnchorKind.RightBottom then
    rectTransform.anchorMin = EAnchor.RightBottom;
    rectTransform.anchorMax = EAnchor.RightBottom;
  elseif anchorKind == EAnchorKind.Bottom then
    rectTransform.anchorMin = EAnchor.Bottom;
    rectTransform.anchorMax = EAnchor.Bottom;
  elseif anchorKind == EAnchorKind.LeftBottom then
    rectTransform.anchorMin = EAnchor.LeftBottom;
    rectTransform.anchorMax = EAnchor.LeftBottom;
  else
    rectTransform.anchorMin = EAnchor.Center;
    rectTransform.anchorMax = EAnchor.Center;
  end
end

function UI.GetSprite(spriteName)
  return CGAtlasManager.Get("common0", string.Concat("common0_", spriteName));
end

function UI.SetIcon(iconId, rawImage)
  TextureManager.SetPng(ETextureUseType.UI, iconId, rawImage);
end

function UI.GetSeverLight(kind)
  if kind == 0 then
    return this.GetSprite("server_1");
  elseif kind == 1 then
    return this.GetSprite("server_2");
  elseif kind == 2 then
    return this.GetSprite("server_3");
  elseif kind == 3 then
    return this.GetSprite("server_4");
  end

  return nil;
end

function UI.GetSwitchSprite(switchOn)
  if switchOn then
    return this.GetSprite("but032L");
  else
    return this.GetSprite("but032D");
  end
end

function UI.AviodCov3()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function UI.AviodCov4()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function UI.GetTagSprite(focus)
  if focus then
    return this.GetSprite("kin001L");
  else
    return this.GetSprite("kin001D");
  end
end

function UI.GetSubTagSprite(focus)
  if focus then
    return this.GetSprite("kin002L");
  else
    return this.GetSprite("kin002D");
  end
end

function UI.AviodCov5()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function UI.AviodCov6()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function UI.AviodCov7()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function UI.GetCurrencySprite(currency)
  if currency == ECurrency.Money then
    return this.GetSprite("icon018");
  elseif currency == ECurrency.Silver then
    return this.GetSprite("icon023");
  elseif currency == ECurrency.Gold then
    return this.GetSprite("icon022");
  elseif currency == ECurrency.OrgGold then
    return this.GetSprite("icon063");
  elseif currency == ECurrency.DataFight then
    return this.GetSprite("icon066");
  elseif currency == ECurrency.furnitureAdvanced then
    return this.GetSprite("icon136");
  elseif currency == ECurrency.furnitureNormal then
    return this.GetSprite("icon137");
  elseif currency == ECurrency.Elf then
    return this.GetSprite("icon155");
  elseif currency == ECurrency.TS then
    return this.GetSprite("icon154");
  elseif currency == ECurrency.Soul then
    return this.GetSprite("icon158");
  elseif currency == ECurrency.ColorSoul then
    return this.GetSprite("icon161");
  elseif currency == ECurrency.WarriorTicket then
    return this.GetSprite("icon165");
  elseif currency == ECurrency.CardTicket then
    return this.GetSprite("icon164");
  elseif currency == ECurrency.ExclusiveWeaponTicket then
    return this.GetSprite("icon163");
  elseif currency == ECurrency.OutfitTicket then
    return this.GetSprite("icon162");
  else
    return nil;
  end
end

function UI.GetMallMemoSprite(memo) 
  if memo == 1 then 
    return this.GetSprite("com097"); 
  elseif memo == 2 then 
    return this.GetSprite("com098"); 
  elseif memo == 3 then 
    return this.GetSprite("com096"); 
  elseif memo == 4 then 
    return this.GetSprite("com122"); 
  elseif memo == 5 then
    return this.GetSprite("com125"); 
  elseif memo == 6 then
    return this.GetSprite("com131");
  elseif memo == 7 then
    return this.GetSprite("com134");
  end 
 
  return nil; 
end 

function UI.GetRankSprite(rank)
  if rank == 1 then
    return this.GetSprite("icon015");
  elseif rank == 2 then
    return this.GetSprite("icon016");
  elseif rank == 3 then
    return this.GetSprite("icon017");
  end

  return nil;
end

function UI.AviodCov8()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end


function UI.AviodCov9()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function UI.GetTeamStateSprite(state)
  if state == ETeamState.Leader then
    return this.GetSprite("com035");
  elseif state == ETeamState.Adviser then
    return this.GetSprite("com034");
  else 
    return nil;
  end
end

function UI.GetCheckBoxSprite(state)
  if state then
    return this.GetSprite("but004L");
  else
    return this.GetSprite("but004D");
  end
end

function UI.GetExpBottleBgSprite(state)
  if state then
    return this.GetSprite("bod009");
  else
    return this.GetSprite("com037");
  end
end

function UI.GetMissionStateSprite(state)
  if state then
    return this.GetSprite("com093");
  else
    return this.GetSprite("com092");
  end
end

function UI.GetFirstIAPSprite(frequency)
  if LuaHelper.CheckDefine("DemoCode") then
    local faith = 0;
    for i = 1, 3 do
      faith = faith + i;
    end
    
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
    
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      human = satan + haven;
    else
      human = satan - haven;
    end
  end
  
  if frequency == 1 then
    return this.GetSprite("bod055");
  elseif frequency == 2 then
    return this.GetSprite("bod058");
  elseif frequency == 3 then
    return this.GetSprite("bod059");
  end
end

function UI.GetUpgradeLvIcon(iconNumber)
  if iconNumber ~= 0 then
    return this.GetSprite(string.format("icon%03d",iconNumber));
  else
    return this.GetSprite("icon060");
  end
end
