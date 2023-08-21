EWaterScene = {
  None = 0,
  Camp = 1, --軍營
  Fight = 2, --戰役的戰場(水上)
  Fighlandt = 3, --戰役的戰場(陸上)
}

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

warshipBattleDatas = {};

Warship = {}
local this = Warship;

--const
this.MaxBoatInnateSkill = 4; --戰船最多可以有幾種技能

--var
this.battleId = 0;
this.scene = EWaterScene.None;

this.leaderboard = {};
this.warships = {};

function Warship.Initialize()
  --鄱陽湖
  warshipBattleDatas[1] = {};

  warshipBattleDatas[1].name = 80186;
  warshipBattleDatas[1].mode = WaterBattleMode_CK_AK; --戰役模式  
  warshipBattleDatas[1].maxTimeStamp = 60; --時間
  warshipBattleDatas[1].maxJoin = 40; --參加人數
  warshipBattleDatas[1].needKillPoint = 0; --殺敵數
  warshipBattleDatas[1].maxDestroyed = 1; --被摧毀
  warshipBattleDatas[1].maxKeyDestroyed = 1; --關鍵的NPC被摧毀 若沒有要設為0

  warshipBattleDatas[1].battleField = {};

  --===============================第一戰場=======================================
  warshipBattleDatas[1].battleField[1] = {};

  --軍帳
  warshipBattleDatas[1].battleField[1].campSceneInfo = {};
  warshipBattleDatas[1].battleField[1].campSceneInfo.sceneId = 49409;
  warshipBattleDatas[1].battleField[1].campSceneInfo.position = Vector2.New(500, 500);

  --戰役場景
  warshipBattleDatas[1].battleField[1].battleScene = {};
  
  warshipBattleDatas[1].battleField[1].battleScene[1] = {};
  warshipBattleDatas[1].battleField[1].battleScene[1].sceneId = 49401;
  warshipBattleDatas[1].battleField[1].battleScene[1].position = Vector2.New(500, 500);

  warshipBattleDatas[1].battleField[1].battleScene[2] = {};
  warshipBattleDatas[1].battleField[1].battleScene[2].sceneId = 49402;
  warshipBattleDatas[1].battleField[1].battleScene[2].position = Vector2.New(500, 500);

  warshipBattleDatas[1].battleField[1].battleScene[3] = {};
  warshipBattleDatas[1].battleField[1].battleScene[3].sceneId = 49403;
  warshipBattleDatas[1].battleField[1].battleScene[3].position = Vector2.New(500, 500);

  warshipBattleDatas[1].battleField[1].battleScene[4] = {};
  warshipBattleDatas[1].battleField[1].battleScene[4].sceneId = 49404;
  warshipBattleDatas[1].battleField[1].battleScene[4].position = Vector2.New(500, 500);

  --===============================第二戰場=======================================
  warshipBattleDatas[1].battleField[2] = {};

  --軍帳
  warshipBattleDatas[1].battleField[2].campSceneInfo = {};
  warshipBattleDatas[1].battleField[2].campSceneInfo.sceneId = 49419;
  warshipBattleDatas[1].battleField[2].campSceneInfo.position = Vector2.New(500, 500);

  --戰役場景
  warshipBattleDatas[1].battleField[2].battleScene = {};
  
  warshipBattleDatas[1].battleField[2].battleScene[1] = {};
  warshipBattleDatas[1].battleField[2].battleScene[1].sceneId = 49411;
  warshipBattleDatas[1].battleField[2].battleScene[1].position = Vector2.New(500, 500);

  warshipBattleDatas[1].battleField[2].battleScene[2] = {};
  warshipBattleDatas[1].battleField[2].battleScene[2].sceneId = 49412;
  warshipBattleDatas[1].battleField[2].battleScene[2].position = Vector2.New(500, 500);

  warshipBattleDatas[1].battleField[2].battleScene[3] = {};
  warshipBattleDatas[1].battleField[2].battleScene[3].sceneId = 49413;
  warshipBattleDatas[1].battleField[2].battleScene[3].position = Vector2.New(500, 500);

  warshipBattleDatas[1].battleField[2].battleScene[4] = {};
  warshipBattleDatas[1].battleField[2].battleScene[4].sceneId = 49414;
  warshipBattleDatas[1].battleField[2].battleScene[4].position = Vector2.New(500, 500);

  --===============================第三戰場=======================================
  warshipBattleDatas[1].battleField[3] = {};

  --軍帳
  warshipBattleDatas[1].battleField[3].campSceneInfo = {};
  warshipBattleDatas[1].battleField[3].campSceneInfo.sceneId = 49429;
  warshipBattleDatas[1].battleField[3].campSceneInfo.position = Vector2.New(500, 500);

  --戰役場景
  warshipBattleDatas[1].battleField[3].battleScene = {};
  
  warshipBattleDatas[1].battleField[3].battleScene[1] = {};
  warshipBattleDatas[1].battleField[3].battleScene[1].sceneId = 49421;
  warshipBattleDatas[1].battleField[3].battleScene[1].position = Vector2.New(500, 500);

  warshipBattleDatas[1].battleField[3].battleScene[2] = {};
  warshipBattleDatas[1].battleField[3].battleScene[2].sceneId = 49422;
  warshipBattleDatas[1].battleField[3].battleScene[2].position = Vector2.New(500,500);

  warshipBattleDatas[1].battleField[3].battleScene[3] = {};
  warshipBattleDatas[1].battleField[3].battleScene[3].sceneId = 49423;
  warshipBattleDatas[1].battleField[3].battleScene[3].position = Vector2.New(500, 500);

  warshipBattleDatas[1].battleField[3].battleScene[4] = {};
  warshipBattleDatas[1].battleField[3].battleScene[4].sceneId = 49424;
  warshipBattleDatas[1].battleField[3].battleScene[4].position = Vector2.New(500, 500);

  --===============================第四戰場=======================================
  warshipBattleDatas[1].battleField[4] = {};

  --軍帳
  warshipBattleDatas[1].battleField[4].campSceneInfo = {};
  warshipBattleDatas[1].battleField[4].campSceneInfo.sceneId = 49439;
  warshipBattleDatas[1].battleField[4].campSceneInfo.position = Vector2.New(500, 500);

  --戰役場景
  warshipBattleDatas[1].battleField[4].battleScene = {};
  
  warshipBattleDatas[1].battleField[4].battleScene[1] = {};
  warshipBattleDatas[1].battleField[4].battleScene[1].sceneId = 49431;
  warshipBattleDatas[1].battleField[4].battleScene[1].position = Vector2.New(500, 500);

  warshipBattleDatas[1].battleField[4].battleScene[2] = {};
  warshipBattleDatas[1].battleField[4].battleScene[2].sceneId = 49432;
  warshipBattleDatas[1].battleField[4].battleScene[2].position = Vector2.New(500, 500);

  warshipBattleDatas[1].battleField[4].battleScene[3] = {};
  warshipBattleDatas[1].battleField[4].battleScene[3].sceneId = 49433;
  warshipBattleDatas[1].battleField[4].battleScene[3].position = Vector2.New(500, 500);

  warshipBattleDatas[1].battleField[4].battleScene[4] = {};
  warshipBattleDatas[1].battleField[4].battleScene[4].sceneId = 49434;
  warshipBattleDatas[1].battleField[4].battleScene[4].position = Vector2.New(500, 500);

  --===============================第五戰場=======================================
  warshipBattleDatas[1].battleField[5] = {};

  --軍帳
  warshipBattleDatas[1].battleField[5].campSceneInfo = {};
  warshipBattleDatas[1].battleField[5].campSceneInfo.sceneId = 49449;
  warshipBattleDatas[1].battleField[5].campSceneInfo.position = Vector2.New(500, 500);

  --戰役場景
  warshipBattleDatas[1].battleField[5].battleScene = {};
  
  warshipBattleDatas[1].battleField[5].battleScene[1] = {};
  warshipBattleDatas[1].battleField[5].battleScene[1].sceneId = 49441;
  warshipBattleDatas[1].battleField[5].battleScene[1].position = Vector2.New(500, 500);

  warshipBattleDatas[1].battleField[5].battleScene[2] = {};
  warshipBattleDatas[1].battleField[5].battleScene[2].sceneId = 49442;
  warshipBattleDatas[1].battleField[5].battleScene[2].position = Vector2.New(500, 500);

  warshipBattleDatas[1].battleField[5].battleScene[3] = {};
  warshipBattleDatas[1].battleField[5].battleScene[3].sceneId = 49443;
  warshipBattleDatas[1].battleField[5].battleScene[3].position = Vector2.New(500, 500);

  warshipBattleDatas[1].battleField[5].battleScene[4] = {};
  warshipBattleDatas[1].battleField[5].battleScene[4].sceneId = 49444;
  warshipBattleDatas[1].battleField[5].battleScene[4].position = Vector2.New(500, 500);
end

function Warship.Random1()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Warship.Random2()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Warship.Random3()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Warship.SetWarship(roleId, npcId, bankIndex)
  if npcDatas[npcId] ~= nil then
    this.AddWarship(roleId, npcId, bankIndex);
  else
    this.RemoveWarship(roleId);
  end
end

function Warship.AddWarship(roleId, npcId, bankIndex)
  if npcDatas[npcId] == nil then return end

  if this.warships[roleId] == nil then
    this.warships[roleId] = WarshipData.New();
  end

  local warshipData = this.warships[roleId];
  local npcData = npcDatas[npcId];

  warshipData.isAnchor = true;

  warshipData.npcId = npcId;
  warshipData.name = npcData.name;
  warshipData.picId = npcData.picId;
  warshipData.bodyKind = npcData.bodyKind;
  warshipData.steerageTime = 0;
  warshipData.rudderKind = math.clamp(npcData.moral, 1, 6);
  warshipData.steerage = (warshipData.rudderKind / 2 + warshipData.rudderKind % 2) * 300; --舵速(1~3)

  --調整戰船航行速度  0.04  為一般馬的速度
  --    npcData.MoralVal  為企劃定好之速度級別(目前1~7) 1最快
  --    25  為各級別相差之級數
  --    0.0007 為人物速度之系數
  --速度設定須判斷是否在水戰場景
  --是 ==> 依NPC.dat之數值設定航速,  否 ==> 走原來在水上移動之速度,但船依舊要換(水戰之後專用)
  warshipData.speed = 0.02 - ((npcData.attributes[6] - warshipData.equipAgi) * 26) * 0.0007;

  --設定戰船固定技(最多4招)
  for i = 1, 4 do
    warshipData.skills[i].Id = FBoatSkill.GetOriginalID(npcData.skills[i]);
    warshipData.skills[i].Lv = 1;
  end

  --設定船的最大HP,SP及基本攻防,水戰場景外不須用到
  warshipData.hpx = npcData.hpx;
  warshipData.spx = npcData.spx;
  warshipData.atk = npcData.atk;
  warshipData.def = npcData.def;

  --算最大值
  warshipData.maxSailor = npcData.hpBase;
  warshipData.maxArmor = warshipData.hpx + warshipData.def + 1;
  warshipData.maxArms = npcData.spBase;
  warshipData.maxJewel = 250;

  --狀態4計量設初值(暫定須改成Server送下來之數據)
  warshipData.sailor = warshipData.maxSailor; --預設給最大值
  warshipData.armor = warshipData.maxArmor; --預設給最大值
  warshipData.arms = warshipData.maxArms; --預設給最大值
  warshipData.jewel = 0; --預設值為0

  --一進入場景要從多少開始顯示
  warshipData.showSailor = warshipData.sailor;
  warshipData.showArmor = warshipData.armor;
  warshipData.showArms = warshipData.arms;
  warshipData.showJewel = warshipData.jewel;

  --設舵的光影
  --WarWaterManage.SetRudderDirection(0);

  --主角才要做
  if roleId ~= Role.playerId then return end

  --將戰船技能設定到水戰快捷列上
  for i = 1, this.MaxBoatInnateSkill do
    --[[
    if warshipData.skills[i].Id ~= 0 then
      Se_HotKeyForm.SetSkillHotKey(i, warshipData.skills[i].Id, false);
    end
    ]]--
  end

  Inn.warshipIndex = bankIndex;
  --WarWaterManage.Update_WaterUI;
end

function Warship.Random4()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Warship.Random5()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Warship.Random6()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Warship.RemoveWarship(roleId)
  if this.warships[roleId] == nil then return end

  this.warships[roleId].isAnchor = false;
  
  --SetFollow;               --跟隨狀態設定
  
  --主角才要做
  if roleId ~= Role.playerId then return end

  --將戰船技能設定到水戰快捷列上
  for i = 1, this.MaxBoatInnateSkill do
    --[[
    if Se_HotKeyForm.WaterHotKey[i].Id ~= 0 then
      if Se_HotKeyForm.WaterHotKey[i].Id == this.warships[roleId].skills[i].Id then
        Se_MainStatus.ClearWaterHotKey(i);
      end
    end
    ]]--
  end

  Inn.warshipIndex = 0;
  --WarWaterManage.Update_WaterUI;
end

function Warship.GetSceneKind(sceneId)
end

function Warship.GetWarshipSpeed(roleId)
  local warshipData = this.warships[roleId];

  if warshipData == nil then return 0 end

  return 20 - ((npcDatas[warshipData.npcId].agi - warshipData.equipAgi) * 26) * 0.7;
end

function Warship.AddSailor(roleId, value)
  local warshipData = this.warships[roleId];

  if warshipData == nil then return end

  warshipData.sailor = math.min(warshipData.sailor + value, warshipData.maxSailor);

  ShowCenterMessage(string.Concat(string.Get(30034), value, string.Get(80086)));

  AudioManager.PlayOnce("AudioClip_WA0014", 0);

  --在水戰場景得寶要秀得寶光影
  --WarWaterManage.SetGetTreasure(Player.ShowX, Player.ShowY);
end

function Warship.Random7()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Warship.Random8()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Warship.Random9()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Warship.AddJewel(roleId, value)
  local warshipData = this.warships[roleId];

  if warshipData == nil then return end

  warshipData.jewel = math.min(warshipData.jewel + value, 250);

  ShowCenterMessage(string.Concat(string.Get(30034), value, string.Get(80087)));

  AudioManager.PlayOnce("AudioClip_WA0014", 0);

  --在水戰場景得寶要秀得寶光影
  --WarWaterManage.SetGetTreasure(Player.ShowX, Player.ShowY);
end

function Warship.AddArms(roleId, value)
  local warshipData = this.warships[roleId];

  if warshipData == nil then return end

  warshipData.arms = math.min(warshipData.arms + value, warshipData.maxArms);

  ShowCenterMessage(string.Concat(string.Get(30034), value, string.Get(90130)));

  AudioManager.PlayOnce("AudioClip_WA0014", 0);
end

function Warship.Random10()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Warship.Random11()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end