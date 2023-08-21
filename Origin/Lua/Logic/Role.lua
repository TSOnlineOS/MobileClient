require "Controller/RoleController"
require "Controller/HeadIconController"
require "Logic/MagicBeanShow"
require "Logic/DefendSmokeShow"

ERoleId = {
  None = 0, --無(一般玩家)
  BOSS = 1, --主管級
  RD = 2, --程式
  GD = 3, --企劃
  ART = 4, --美術
  BGM = 5, --大GM
  BGM2 = 6, --大GM2
  SGM = 7, --小GM
  SGM2 = 8, --小GM
  SER = 9, --客服
  COM = 10, --公司人員
  TEST = 11, --檢測人員
  SYS = 12, --系統人員
  PRO = 13, --產品
}

ECareer = {
  None = 0, 
  XiaKe = 1, --俠客
  BaWang = 2, --霸王
  XianShi = 3, --賢士
  DiXian = 4, --嫡仙  
}

EChild = {
  None = 0,
  Foster = 1, --領養
  Died = 2, --養育階段死亡
  Adults = 3, --成年
  Appointment = 4, --仕官
}

--[[
Now Dinah, the daughter whom Leah had by Jacob, went out to see the women of that country.
And when Shechem, the son of Hamor the Hivite who was the chief of that land, saw her, he took her by force and had connection with her.
Then his heart went out in love to Dinah, the daughter of Jacob, and he said comforting words to her.
And Shechem said to Hamor, his father, Get me this girl for my wife.
Now Jacob had word of what Shechem had done to his daughter; but his sons were in the fields with the cattle, and Jacob said nothing till they came.
Then Hamor, the father of Shechem, came out to have a talk with Jacob.
Now the sons of Jacob came in from the fields when they had news of it, and they were wounded and very angry because of the shame he had done in Israel by having connection with Jacob's daughter; and they said, Such a thing is not to be done.
But Hamor said to them, Shechem, my son, is full of desire for your daughter: will you then give her to him for a wife?
And let our two peoples be joined together; give your daughters to us, and take our daughters for yourselves.
Go on living with us, and the country will be open to you; do trade and get property there.
And Shechem said to her father and her brothers, If you will give ear to my request, whatever you say I will give to you.
However great you make the bride-price and payment, I will give it; only let me have the girl for my wife.
But the sons of Jacob gave a false answer to Shechem and Hamor his father, because of what had been done to Dinah their sister.
And they said, It is not possible for us to give our sister to one who is without circumcision, for that would be a cause of shame to us:
But on this condition only will we come to an agreement with you: if every male among you becomes like us and undergoes circumcision;
Then we will give our daughters to you and take your daughters to us and go on living with you as one people.
But if you will not undergo circumcision as we say, then we will take our daughter and go.
And their words were pleasing to Hamor and his son Shechem.
And without loss of time the young man did as they said, because he had delight in Jacob's daughter, and he was the noblest of his father's house.
--]]

Role = {};
local this = Role;

--const
this.playerTurn3MaxLv = 50; --玩家三轉加開等級
this.playerMaxLv = 200; --人物最大等級
this.baseSpeed = 160;
this.maxEquip = 6; --裝備最大數量
this.maxStyle = 5; --時裝最大數量
this.maxOutfitStyle = 5; --外顯時裝最大數量

this.maxFollowNpc = 4; --最大跟隨武將數
this.maxNpcSkill = 3; --武將最多可以學會的技能

this.maxAttrPill = 30; --太上金丹
this.maxHpPill = 50; --健體玉液
this.maxSpPill = 50; --幻能玉液
this.maxSkillPill = 10; --技能丹
this.maxDailyExpPill = 50; --每日經驗丹次數

this.badoGameNpcId = 38010; --年獸  22030 惡魔巴豆妖

this.clickDistance = 130; --點選安全距離值

this.npcMaxMed = 30; --NPC路徑最大中繼點數量
this.npcMaxHpPill = 50; --健體仙丹使用上限
this.npcMaxSpPill = 50; --幻能仙丹使用上限
this.npcMaxGraspPill = 20; --領悟丹使用上限
this.npcMaxSublimePill = 10; --昇華丹使用上限
this.hpPillAdd = 50; --HP丹增加素質
this.spPillAdd = 10; --SP丹增加素質

this.maxGold = 999999999; --每個玩家最大的金錢儲存量
this.maxBankGold = 999999999; --每個玩家最大的錢莊金錢儲存量
this.maxSaleGold = 2000000000; --拍賣網最大的金錢

this.maxGovRequireValue = 10; --官府徵召兌獎值上限

this.maxSoulSkill = 4;  --靈魂技能數量上限

this.playerActions = {
  ERolePose.Walk,
  ERolePose.Stand,
  ERolePose.Prepare,
  ERolePose.Riding,
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
  ERolePose.Sit,
  ERolePose.Wave,
  ERolePose.Meditation,
};

this.followActions = { ERolePose.Stand, ERolePose.Walk };

this.ghostTexturePosition = {}
this.ghostTexturePosition[0] = Vector2.New(40, 0);
this.ghostTexturePosition[1] = Vector2.New(40, 0);
this.ghostTexturePosition[2] = Vector2.New(-40, 0);
this.ghostTexturePosition[3] = Vector2.New(-40, 0);

this.poorTexture = {}; --衰神
this.poorTexture[0] = "PoorGhost1"; --左上
this.poorTexture[1] = "PoorGhost2"; --左下
this.poorTexture[2] = "PoorGhost3"; --右下
this.poorTexture[3] = "PoorGhost4"; --右上

this.godTexture = {}; --福神
this.godTexture[0] = "GodGhost1"; --左上
this.godTexture[1] = "GodGhost2"; --左下
this.godTexture[2] = "GodGhost3"; --右下
this.godTexture[3] = "GodGhost4"; --右上

this.elfTexture = {};
this.elfTexture[0] = "GodGhost1"; --左上
this.elfTexture[1] = "GodGhost2"; --左下
this.elfTexture[2] = "GodGhost3"; --右下
this.elfTexture[3] = "GodGhost4"; --右上

this.childTexture = {}; --嬰靈
this.childTexture[0] = "ChildGhost1"; --左上
this.childTexture[1] = "ChildGhost2"; --左下
this.childTexture[2] = "ChildGhost3"; --右下
this.childTexture[3] = "ChildGhost4"; --右上

this.hairStyleCount = {}; --髮型數量
this.hairStyleCount[0] = { 5, 7 }; --未轉
this.hairStyleCount[1] = { 11, 14 }; --一轉
this.hairStyleCount[2] = { 16, 19 }; --二轉
this.hairStyleCount[3] = { 16, 19 }; --三轉

--var
this.player = nil; --主角
this.playerId = 0;
this.playerData = {};
this.playerData.point = 0;
this.playerData.gold = 0; --身上金錢
this.playerData.saleGold = 0; --拍賣金錢
this.playerData.orgGold = 0; --軍團幣
this.playerData.bankLv = 0; --錢莊等級
this.playerData.innLv = 0; --客棧等級
this.playerData.bagLv = 0; --背包等級
this.playerData.child = nil; --二代武將資料
this.playerData.pracCount = 0; --修行值
this.playerData.pracLv = 0; --修行等級
this.playerData.turn2BallCount = 0; --可用天珠數
this.playerData.turn2Balls = {}; --天珠
this.playerData.heroSkills = {};
--this.playerData.autoDigKind = 0; --自動攻擊丸種類
--this.playerData.autoDig = 0; --自動攻擊丸次數
this.playerData.loginDay = 0; --登入天數
this.playerData.continueLogin = 0; --連績登入天數

this.playerData.currencys = {}; --數值貨幣(依貨幣種類儲存)，跟原有的gold、point、orgGold..相同，只是方便之後加新貨幣的超作流程

this.moveTarget = nil; --目前移動目標
this.target = nil; --目前鎖定目標
this.fightNpc = nil; --出戰武將
this.childNpc = nil; --二代武將

this.players = {}; --玩家
this.mapNpcs = {}; --事件NPC
this.followNpcs = {}; --跟隨武將
this.cartNpcs = {}; --馬車
this.pets = {}; --寵物
this.guardNpcs = {}; --城戰攻城器械
this.foreignNpcs = {}; --城戰外來NPC
this.houseWarriors = {}; --小屋裡的武將
this.deliverNpc = nil; --快遞巴豆夭
this.miningNpc = nil; --挖礦NPC

this.roleRoot = nil;
this.latestMoveTime = 0;

this.deadMsgData = {};
this.deadMsgData.show = false;
this.deadMsgData.playerMsg = "";
this.deadMsgData.npcMsg = "";

--脫胎換骨
this.rebornNpcId = 0; --脫胎換骨中NpcId
this.rebornAttributes = { 0, 0, 0, 0, 0, 0 }; --脫胎換骨數值

function Role.Random()
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

function Role.Destroy()
  poolMgr:DestroyPool("RoleMaterial");
  poolMgr:DestroyPool("BaseRole");
end

function Role.Initialize()
  --人物根物件
  this.roleRoot = GameObject.Find("RoleRoot");

  --人物用材質球
  CGResourceManager.Load(
    "RoleMaterial",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("RoleMaterial", asset);
    end
  );
  
  --人物物件
  CGResourceManager.Load(
    "BaseRole",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("BaseRole", asset);
    end
  );

  NotifyManager.Register(ENotifyManager.EnterScene, "Role", this.OnEnterScene);
  NotifyManager.Register(ENotifyManager.ExitScene, "Role", this.OnExitScene);

  DataManager.ReadData("Data/IOS_Avatar_C.dat", this.OnLoadRandomColorData);
end

function Role.Random1()
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

function Role.Random2()
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

function Role.Update()
  for k, v in pairs(this.players) do
    v:UpdateMove();
    v:UpdateShow(true);
  end

  for k, v in pairs(this.mapNpcs) do
    v:UpdateMove();
    v:UpdateShow(true);
  end

  for k, v in pairs(this.followNpcs) do
    for kk, vv in pairs(v) do
      vv:UpdateMove();
      vv:UpdateShow(true);
    end
  end

  for k, v in pairs(this.cartNpcs) do
    v:UpdateMove();
    v:UpdateShow(true);
  end

  for k, v in pairs(this.pets) do
    v:UpdateMove();
    v:UpdateShow(true);
  end

  for k, v in pairs(this.guardNpcs) do
    v:UpdateMove();
    v:UpdateShow(true);
  end

  for k, v in pairs(this.foreignNpcs) do
    v:UpdateMove();
    v:UpdateShow(true);
  end

  for k, v in pairs(this.houseWarriors) do
    v:UpdateMove();
    v:UpdateShow(true);
  end

  if this.deliverNpc ~= nil then
    this.deliverNpc:UpdateMove();
    this.deliverNpc:UpdateShow(true);
  end

  if this.miningNpc ~= nil then
    this.miningNpc:UpdateMove();
    this.miningNpc:UpdateShow(true);
  end

  if not FightField.isInBattle and this.player ~= nil then
    for k, v in pairs(this.players) do
      v:UpdateCollision();
    end

    for k, v in pairs(this.mapNpcs) do
      v:UpdateCollision();
    end

    for k, v in pairs(this.guardNpcs) do
      v:UpdateCollision();
    end

    for k, v in pairs(this.foreignNpcs) do
      v:UpdateCollision();
    end
  end
end

function Role.Clear()
  for index in pairs(this.players) do
    this.players[index]:Destroy();
    this.players[index] = nil;
  end

  for index in pairs(this.followNpcs) do
    for followIndex in pairs(this.followNpcs[index]) do
      this.followNpcs[index][followIndex]:Destroy();
      this.followNpcs[index][followIndex] = nil;
    end
  end

  for index in pairs(this.cartNpcs) do
    this.cartNpcs[index]:Destroy();
    this.cartNpcs[index] = nil;
  end
end

function Role.OnEnterScene(checkCode)
  for roleId, role in pairs(this.players) do
    role:Initialize();
    role:SetOnTheSea(MapManager.IsSea(MapManager.GetBlock(role.position)));

    if DragonBoat.InRaceScene() then
      role:SetDirection(ERoleDirection.Left);
    end
  end

  for roleId in pairs(this.followNpcs) do
    for followIndex, role in pairs(this.followNpcs[roleId]) do
      role:Initialize();
    end
  end

  for roleId, role in pairs(this.cartNpcs) do
    role:Initialize();
  end
end

function Role.OnExitScene()
  for roleId, role in pairs(this.players) do
    role:SetWar(EWar.None);
  end

  for index in pairs(this.guardNpcs) do
    this.guardNpcs[index]:Destroy();
    this.guardNpcs[index] = nil;
  end

  for index in pairs(this.foreignNpcs) do
    this.foreignNpcs[index]:Destroy();
    this.foreignNpcs[index] = nil;
  end

  TargetManager.CancelTarget();
  Team.Clear();
end

function Role.Random3()
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

function Role.Random4()
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

function Role.Random5()
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

function Role.Random6()
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

function Role.CreateRole(kind, index, data)
  return RoleController.New(kind, index, data);
end

function Role.GetRole(kind, index1, index2)
  if kind == EHuman.Player or kind == EHuman.Players then
    return this.players[index1];
  elseif kind == EHuman.MapNpc then
    return this.mapNpcs[index1];
  elseif kind == EHuman.FollowNpc then
    if index2 == 0 then
      return this.players[index1];
    elseif this.followNpcs[index1] ~= nil then
      return this.followNpcs[index1][index2];
    else
      return nil;
    end
  else
    return nil;
  end
end

function Role.GetFollowNpcs(roleId)
  if this.followNpcs[roleId] == nil then return {} end

  return this.followNpcs[roleId];
end

function Role.GetFollowNpc(roleId, npcId)
  if type(npcId) == "string" then
    npcId = tonumber(npcId);
  end
  
  if this.followNpcs[roleId] == nil then return nil end

  for k, v in pairs(this.followNpcs[roleId]) do
    if v.npcId == npcId then
      return v;
    end
  end

  return nil;
end

function Role.Random7()
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

function Role.Random8()
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

function Role.Random9()
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

function Role.PlayerAppear(index, data)
  logWarn(string.format("Player[%d] Appear !!", index));

  if this.players[index] == nil then
    if index == this.playerId then
      this.players[index] = this.CreateRole(EHuman.Player, index, PlayerData.New());
    else
      this.players[index] = this.CreateRole(EHuman.Players, index, PlayerData.New());
    end
  end

  local role = this.players[index];

  role.actions = this.playerActions;

  role.data.roleId = index;
  role.data.sex = data:ReadByte();
  
  role:SetAttribute(EAttribute.Element, data:ReadByte());
  role:SetAttribute(EAttribute.Turn3Element, data:ReadByte());
  role:SetAttribute(EAttribute.Lv, data:ReadByte());
  
  role.data.poorMission = data:ReadByte();
  role.data.godMission = data:ReadUInt32();
  role.data.elfNo = data:ReadUInt16();

  role.data.elfId = 0;
  if role.data.elfNo > 0 and elfDatas[role.data.elfNo] ~= nil then
    role.data.elfId = elfDatas[role.data.elfNo].Id;
    role.data.elfLocation = elfDatas[role.data.elfNo].location;
  else
    role.data.elfLocation = 0;
  end
  
  local sceneId = data:ReadUInt16();
  local position = Vector2.New(data:ReadUInt16(), data:ReadUInt16());

  role.data.face = data:ReadByte();
  role.data.headStyle = data:ReadByte();
  role.data.bodyStyle = data:ReadByte();  
  role.data.colorTints[1] = data:ReadInt32();
  role.data.colorTints[2] = data:ReadInt32();

  local pvpWin = data:ReadUInt16();
  local pvpRank = data:ReadByte();
  if pvpWin > 0 or pvpRank > 0 then
    role.activityKind = ERoleActivityInfo.RandomPVP;
    role.activityInfo = {};
    role.activityInfo.winCount = pvpWin;
    role.activityInfo.topRank = pvpRank;
  end

  role.data.onlineState = data:ReadByte();

  local npcChallenge = data:ReadByte();
  if npcChallenge > 0 then
    role.activityKind = ERoleActivityInfo.NpcChallenge;
    role.activityInfo = npcChallenge;
  end

  role.data.serverId = data:ReadByte();
  role.data.turn = data:ReadByte();
  role.data.career = data:ReadByte();
  role.data.name = data:ReadString(data:ReadByte());
  role.data.instanceId = data:ReadUInt16();
  role.horseNpcId = data:ReadUInt16();
  role:SetAttribute(EAttribute.MountsLv, data:ReadByte());

  --裝備
  role:ClearEquip();
  local equipCount = data:ReadByte();
  for i = 1, equipCount do
    local itemId = data:ReadUInt16();

    if itemDatas[itemId] ~= nil then
      role:SetEquip(itemDatas[itemId].fitType, itemId, false);
    end
  end
  
  --稱號
  role.titleId = data:ReadUInt16();

  --軍團
  role.data.orgId = data:ReadUInt32();
  
  --外顯外觀裝備
  local outfitStyleCount = data:ReadByte();
  for i = 1, outfitStyleCount do
    local itemId = data:ReadUInt16();
  
    if itemDatas[itemId] ~= nil then
      role:SetEquip(itemDatas[itemId].fitType + Role.maxOutfitStyle, itemId, false);
    end
  end
  
  --GM
  if this.IsGM(index) then
    role.data.sex = 0;
    role.data.bodyStyle = 120;
  end
  
  if index == this.playerId then
    this.player = role;

    for fitType, itemId in pairs(role.data.equips) do
      if itemDatas[itemId] ~= nil then
        local itemSave = ThingData.New();
        
        itemSave.Id = itemId;
        itemSave.quant = 1;
        itemSave.damage = 0;
        if not Item.IsOutfitStyle(fitType) then
          Item.SetBagItem(EThings.Equip, itemDatas[itemId].fitType, itemSave, false);
        else
          Item.SetBagItem(EThings.Equip, fitType, itemSave, false);
        end
      end
    end

    Function.UpdateVisible();
  end

  role:ChangeScene(sceneId, position);

  this.CartNpcAppear(index);

  if HouseEditorManager.IsOpen() then
    role:SetVisible(ERoleVisible.Hide);
  end

  return role;
end

function Role.PlayerDisappear(index)
  Invitation.Remove(EInvitation.Team, index);
  
  if this.followNpcs[index] ~= nil then
    for i = 1, this.maxFollowNpc do
      this.FollowNpcDisappear(index, i, true);
    end
  end

  if this.cartNpcs[index] ~= nil then
    this.CartNpcDisappear(index);
  end

  if this.players[index] == nil then return end

  this.players[index]:Destroy();
  this.players[index] = nil;

  if UI.IsVisible(UITeam) then
    UITeam.UpdateUI();
  end

  if HouseManager.IsInHouse() then
    FurnitureManager.CheckAllFurnituresInteractive();
  end
end

function Role.EndOfLine()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Role.EndOfLine1()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Role.EndOfLine2()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Role.MapNpcAppear(index, eventNpcData, actions)
  if npcDatas[eventNpcData.npcId] == nil then return end
  logWarn(string.format("MapNpc[%d] Appear !!", eventNpcData.id));
  
  if this.mapNpcs[index] == nil then
    this.mapNpcs[index] = this.CreateRole(EHuman.MapNpc, index, MapNpcData.New());
  end

  local role = this.mapNpcs[index];
  local npcData = npcDatas[eventNpcData.npcId];

  if npcData ~= nil then
    npcData:SetRoleAttributes(role);
  end

  role.data.eventNpcData = eventNpcData;

  role.npcId = eventNpcData.npcId;
  role.actions = actions;

  role.data.motionType = eventNpcData.motionType;
  role.data.motionBack = eventNpcData.motionBack;
  role.data.motionSuspendMS = eventNpcData.motionSuspendMS;
  role.data.motionRect.x = (eventNpcData.motionNodes[1].x - 1) * 20 + MapManager.centerLeft;
  role.data.motionRect.y = (eventNpcData.motionNodes[1].y - 1) * 20 + MapManager.centerTop;
  role.data.motionRect.width = eventNpcData.motionNodes[0].x * 20;
  role.data.motionRect.height = eventNpcData.motionNodes[0].y * 20;

  role.data.traceRadius = eventNpcData.traceRadius;

  if npcData ~= nil and npcData.turn == 2 then
    if npcData.element == 1 then
      role.data.superBmp = "Earth";
    elseif npcData.element == 2 then
      role.data.superBmp = "Water";
    elseif npcData.element == 3 then
      role.data.superBmp = "Fire";
    elseif npcData.element == 4 then
      role.data.superBmp = "Wind";
    elseif npcData.element == 7 then
      role.data.superBmp = "Light";
    elseif npcData.element == 8 then
      role.data.superBmp = "Dark";
    else
      role.data.superBmp = "";
    end
  end

  --年獸特別處理
  if eventNpcData.npcId == 38010 and EventManager.inNewYearEvent then
    --??
  else
    if eventNpcData.roleStatus.isHide then
      role:SetVisible(ERoleVisible.Hide);
    elseif eventNpcData.roleStatus.isVisible then
      role:SetVisible(ERoleVisible.Visible);
    end
  end

  --泰國代言人,艾兒,顯示
  if Define.Thai then
    if SceneManager.sceneId == 12003 then
      if eventNpcData.npcId == 19030 then
        role:SetVisible(ERoleVisible.Visible);
      end
    end
  end

  --送花小豆妖縮小化
  --[[
  if eventNpcData.npcId == 38021 then
    role.Shrink = 5;
    role.Faint_Kind = EStatus.Shrink;
  end
  ]]--

  --動作設定
  if eventNpcData.roleStatus.isLie then  --躺下
    role:SetAnimationForceId(ERolePose.Lie);
    role:SetAnimationForceFrame(3);
  end
  
  if LuaHelper.CheckDefine("DemoCode") then
    local folk = 69;
    local dog = 27;
    local stupid = 0;
    if this ~= nil then
      stupid = folk + dog;
    else
      stupid = stupid + 1;
    end
  
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
  end
  
  --馬子設定
  if eventNpcData.roleStatus.rideNpcId ~= 0 then
    role:Ride(eventNpcData.roleStatus.rideNpcId, 0);
  end

  role.moveController.pathMedIndex = 0;

  role:SetPosition(eventNpcData.position);
  role:SetDirection(eventNpcData.direction);

  if eventNpcData.motionType == 1 then
    --原地不動
    if eventNpcData.traceRadius == 0 then
      --設障礙點
      if role.visible ~= ERoleVisible.Hide then
        local x, y = MapManager.GetBlock(eventNpcData.position)

        MapManager.SetBlock(x, y, 4);

        --若是修練的仙人,則在外面多設障礙點
        if eventNpcData.npcId == 15166 then
          for i = x - 1, x + 1 do
            for j = y - 1, y + 1 do
              MapManager.SetBlock(i, j, 4);
            end
          end

          MapManager.SetBlock(x, y + 2, 4);
        end
      end
    end
  elseif eventNpcData.motionType == 3 then
    --區域隨機移動
    for i = 1, this.npcMaxMed - 1 do
      role.moveController.pathMed[i] = Vector2.zero;
      role.moveController.pathMed[i].x = role.data.motionRect.x + math.random(role.data.motionRect.width);
      role.moveController.pathMed[i].y = role.data.motionRect.y + math.random(role.data.motionRect.height);
    end
    role.moveController.pathMedIndex = this.npcMaxMed - 1;

    if table.Count(role.moveController.pathMed) > 1 then
      role.moveController:StartDefaultPath();
    end
  elseif eventNpcData.motionType == 4 then
    if Contains(eventNpcData.npcId, 44007, 44010, 44011) then
      --如果為戰役特殊Npc,不讀行走節點
      role.data.motionType = 1;
    elseif npcData.kind == 52 then
      --如果為水戰特殊npc,不讀行走節點
      role.data.motionType = 1;
    else
      --指定路線讀取
      for i = 1, eventNpcData.motionNodeCount do
        --NPC目前只定十個中斷點
        if i <= this.npcMaxMed then
          role.moveController.pathMedIndex = role.moveController.pathMedIndex + 1;
          role.moveController.pathMed[i] = Vector2.zero;
          role.moveController.pathMed[i].x = (eventNpcData.motionNodes[i].x - 1) * MapManager.BLOCK_UNIT + MapManager.centerLeft
          role.moveController.pathMed[i].y = (eventNpcData.motionNodes[i].y - 1) * MapManager.BLOCK_UNIT + MapManager.centerTop;
        end
      end

      if table.Count(role.moveController.pathMed) > 1 then
        role.moveController:StartDefaultPath();
      end
    end
  end
  
  --城池外觀處理
  if npcData.kind == 30 then
    for i = 1, City.maxCity do
      if City.cities[i].npcId == role.npcId then
        role:SetDirection(ERoleDirection.LeftDown + math.max(City.cities[i].level, 1));
      end
    end
  end

  role:Initialize();

  return role;
end

function Role.MapNpcDisappear(index)
  if this.mapNpcs[index] == nil then return end

  this.mapNpcs[index]:Destroy();
  this.mapNpcs[index] = nil;
end

function Role.EndOfLine3()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Role.EndOfLine4()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Role.FollowNpcAppear(roleId, followIndex, npcId, canGrow, name, beenRide, soulId, data, npcSave, isNew)
  if npcDatas[npcId] == nil then return end
  logWarn(string.format("FollowNpc[%d][%d] Appear !!", roleId, followIndex));

  if this.followNpcs[roleId] == nil then
    this.followNpcs[roleId] = {};
  end

  if this.followNpcs[roleId][followIndex] == nil then
    this.followNpcs[roleId][followIndex] = this.CreateRole(EHuman.FollowNpc, followIndex, FollowNpcData.New());
  end

  local role = this.followNpcs[roleId][followIndex];
  local npcData = npcDatas[npcId];

  if npcData ~= nil then
    npcData:SetRoleAttributes(role);
  end

  role.data.master = this.players[roleId];

  if role.data.order == 0 then
    role.data.order = table.Count(this.followNpcs[roleId]);
  end
  
  role.npcId = npcId;
  role.actions = this.followActions;

  if canGrow ~= nil then
    role.data.canGrow = canGrow;
  end

  if name ~= nil then
    role.data.name = name;
  end

  if beenRide ~= nil then
    role.data.beenRide = beenRide;
  end

  if soulId ~= nil then
    role.data.soulId = soulId;
  end
  
  if this.players[roleId] ~= nil and this.players[roleId].kind == EHuman.Player then
    role:SetAttribute(EAttribute.SkillPoint, 0);
    role:SetAttribute(EAttribute.AttrPoint, 0);
    role:SetAttribute(EAttribute.Moral, npcData.moralValue, npcData.moral);
    role:SetAttribute(EAttribute.Honor, 0);
    role:SetAttribute(EAttribute.KillNum, 0);
    role:SetAttribute(EAttribute.Lv, 1);
    role:SetAttribute(EAttribute.Exp, Calc.GetUpExp(1, 0));
    role:SetAttribute(EAttribute.Int, npcData.attributes[1]);
    role:SetAttribute(EAttribute.Atk, npcData.attributes[2]);
    role:SetAttribute(EAttribute.Def, npcData.attributes[3]);
    role:SetAttribute(EAttribute.Agi, npcData.attributes[6]);
    role:SetAttribute(EAttribute.Hpx, npcData.attributes[4]);
    role:SetAttribute(EAttribute.Spx, npcData.attributes[5]);
    role:SetAttribute(EAttribute.Faith, 60, false);

    role:SetIsDead(false);

    for i = 1, this.maxNpcSkill do
      if npcData.skills[i] ~= 0 then
        role.data.skillLv[i] = 1;
      else
        role.data.skillLv[i] = 0;
      end
    end
    
    role:SetAttribute(EAttribute.MaxHp, Calc.GetMaxHp(role));
    role:SetAttribute(EAttribute.MaxSp, Calc.GetMaxSp(role));

    role:SetAttribute(EAttribute.Hp, role:GetAttribute(EAttribute.MaxHp));
    role:SetAttribute(EAttribute.Sp, role:GetAttribute(EAttribute.MaxSp));
  end

  if data ~= nil then
    role:SetAttribute(EAttribute.Exp, data:ReadInt32());
    role:SetAttribute(EAttribute.Lv, data:ReadByte());
    role:SetAttribute(EAttribute.Hp, data:ReadUInt32());
    role:SetAttribute(EAttribute.Sp, data:ReadUInt16());
    role:SetAttribute(EAttribute.Int, data:ReadUInt16());
    role:SetAttribute(EAttribute.Atk, data:ReadUInt16());
    role:SetAttribute(EAttribute.Def, data:ReadUInt16());
    role:SetAttribute(EAttribute.Agi, data:ReadUInt16());
    role:SetAttribute(EAttribute.Hpx, data:ReadUInt16());
    role:SetAttribute(EAttribute.Spx, data:ReadUInt16());
    role.data.dieCount = data:ReadByte();
    role:SetAttribute(EAttribute.Faith, data:ReadByte(), false);
    role.data.canGrow = data:ReadByte();
    role:SetAttribute(EAttribute.SkillPoint, data:ReadUInt16());
    role.data.name = data:ReadString(data:ReadByte());

    for i = 1, this.maxNpcSkill do
      role.data.skillLv[i] = data:ReadByte();
    end
    
    if this.players[roleId] ~= nil and this.players[roleId].kind == EHuman.Player then
      for i = 1, this.maxEquip do
        Item.SetBagItem(EThings.Equip, i, ThingData.New(data), i == this.maxEquip, followIndex);
      end
    end
    
    role.data.sublimeCount = data:ReadByte();
    role.data.specialSkillLearned = data:ReadBoolean();
    role.data.soulId = data:ReadInt32();

    role.data.hpPillCount = data:ReadByte();
    role.data.spPillCount = data:ReadByte();
    
    role:SetAttribute(EAttribute.MaxHp, Calc.GetMaxHp(role));
    role:SetAttribute(EAttribute.MaxSp, Calc.GetMaxSp(role));

    role.data.upgradeLv = data:ReadByte();
  end

  if npcSave ~= nil then
    role:SetAttribute(EAttribute.Hp, npcSave.hp);
    role:SetAttribute(EAttribute.Sp, npcSave.sp);
    role:SetAttribute(EAttribute.Int, npcSave.int);
    role:SetAttribute(EAttribute.Atk, npcSave.atk);
    role:SetAttribute(EAttribute.Def, npcSave.def);
    role:SetAttribute(EAttribute.Agi, npcSave.agi);
    role:SetAttribute(EAttribute.Hpx, npcSave.hpx);
    role:SetAttribute(EAttribute.Spx, npcSave.spx);
    role:SetAttribute(EAttribute.Lv, npcSave.level);
    role:SetAttribute(EAttribute.Exp, npcSave.exp);
    role.data.dieCount = npcSave.dieCount;
    role:SetAttribute(EAttribute.Faith, npcSave.faith, false);
    role:SetAttribute(EAttribute.SkillPoint, npcSave.skillPoint);

    for i = 1, this.maxNpcSkill do
      role.data.skillLv[i] = npcSave.skillLv[i];
    end

    role:SetAttribute(EAttribute.MaxHp, Calc.GetMaxHp(role));
    role:SetAttribute(EAttribute.MaxSp, Calc.GetMaxSp(role));
  end

  role:Initialize();
  
  if this.players[roleId] ~= nil then
    role:SetPosition(this.players[roleId].position);

    if role.data.beenRide then
      this.players[roleId]:Ride(role.npcId, role.data.soulId);
    end

    --組隊中不顯示
    if not Team.IsAlone(roleId) then
      role:SetVisible(ERoleVisible.Hide);
    end
  end

  if roleId == this.playerId then
    MachineBox.ReloadNpcSetting();
    --if Player.OnTransFNpc then
      --因武將轉生引起
      --[[
      if HumManage.TransFNpcLight == nil then
        HumManage.TransFNpcLight = TLight.Create;
      end
      HumManage.TransFNpcLight.SetLight(10001, 40, 1, 15, 15, Tracer_StandAni,
                                        FollowNpc[FIdx].MapX-Ground.PosX, FollowNpc[FIdx].MapY-Ground.PosY,
                                        40, False, 50);
      ]]--
    --else
    if isNew then
      ShowCenterMessage(string.Concat(role.name, string.Get(40040)));
      AudioManager.PlayOnce("AudioClip_WA0014", 0);
    end

    if UI.IsVisible(UITeam) then
      UITeam.UpdateFollowNpc();
    end

    if UI.IsVisible(UINpcInn) then
      UINpcInn.UpdateUI();
    end

    if UI.IsVisible(UIMiniMap) then
      UIMiniMap.UpdateMission();
    end

    if UI.IsVisible(UIMission) then
      UIMission.UpdateMission();
    end
  end

  if HouseEditorManager.IsOpen() then
    role:SetVisible(ERoleVisible.Hide);
  end

  return role;
end

function Role.EndOfLine2()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Role.EndOfLine5()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Role.EndOfLine6()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Role.EndOfLine7()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Role.FollowNpcDisappear(roleId, followIndex, isShowCenterMsg)
  if this.followNpcs[roleId] == nil then return end
  if this.followNpcs[roleId][followIndex] == nil then return end

  local role = this.followNpcs[roleId][followIndex];

  for k, v in pairs(this.followNpcs[roleId]) do
    if v.data.order > role.data.order then
      v.data.order = v.data.order - 1;
    end
  end
  
  if role.data.beenRide then
    --DisMountHorse;
  end

  if roleId == this.playerId then
    if isShowCenterMsg then
      ShowCenterMessage(string.Concat(role.name, string.Get(40041)));
    end
    
    if this.player.war ~= EWar.None then
      Chat.AddMessage(EChannel.System, string.Concat(role.name, string.Get(30169)));
    end

    AudioManager.PlayOnce("AudioClip_WA0014", 0);

    --放逐的是出戰武將
    if role == this.fightNpc then
      this.SetFightNpc(0);
    end
    
    --放逐的是二代武將
    if role == this.childNpc then
      this.SetChildNpc(0);
    end
    
    Item.ClearBag(EThings.Equip, followIndex);
  end

  this.followNpcs[roleId][followIndex]:Destroy();
  this.followNpcs[roleId][followIndex] = nil;

  if roleId == this.playerId then
    MachineBox.ReloadNpcSetting();

    if UI.IsVisible(UIEquip) then
      UIEquip.UpdateUI();
    end

    if UI.IsVisible(UISkill) then
      UISkill.UpdateUI();
    end

    if UI.IsVisible(UIStatus) then
      UIStatus.UpdateUI();
    end

    if UI.IsVisible(UITeam) then
      UITeam.UpdateFollowNpc();
    end
    
    if UI.IsVisible(UIMiniMap) then
      UIMiniMap.UpdateMission();
    end

    if UI.IsVisible(UIMission) then
      UIMission.UpdateMission();
    end
  end
end

function Role.CartNpcAppear(roleId)
  local master = this.players[roleId];
  if master == nil then return end

  local npcId = Cart.GetCartNpcId(master:GetAttribute(EAttribute.Turn), master:GetAttribute(EAttribute.Career));
  local npcData = npcDatas[npcId];
  if npcData == nil then return end

  logWarn(string.format("CartNpc[%d] Appear !!", roleId));
  
  if this.cartNpcs[roleId] == nil then
    this.cartNpcs[roleId] = this.CreateRole(EHuman.CartNpc, roleId);
  end

  local role = this.cartNpcs[roleId];
  
  role.npcId = npcId;
  role.actions = this.followActions;

  role:Initialize();
  role:SetPosition(master.position);

  --組隊中不顯示
  if not Team.IsAlone(roleId) then
    role:SetVisible(ERoleVisible.Hide);
  end

  local followNpcs = Role.GetFollowNpcs(roleId);
  for k, v in pairs(followNpcs) do
    v:UpdateAllView();
  end

  if HouseEditorManager.IsOpen() then
    role:SetVisible(ERoleVisible.Hide);
  end

  return role;
end

function Role.EndOfLine8()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Role.EndOfLine9()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Role.EndOfLine10()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function Role.CartNpcDisappear(roleId)
  if this.cartNpcs[roleId] == nil then return end

  this.cartNpcs[roleId]:Destroy();
  this.cartNpcs[roleId] = nil;
end

function Role.PetAppear(index, isFar)
  local npcId = MachineBox.GetPetId();
  if npcDatas[npcId] == nil then return end

  if this.pets[index] == nil then
    this.pets[index] = this.CreateRole(EHuman.PetNpc, 0, PetNpcData.New());
  end

  local role = this.pets[index];
  local npcData = npcDatas[npcId];

  if npcData ~= nil then
    npcData:SetRoleAttributes(role);
  end

  role.npcId = npcId;
  role.data.master = this.players[index];
  --role.data.isFar = isFar;

  role:Initialize();

  if this.players[index] ~= nil then
    role:SetPosition(this.players[index].position);
  end

  return role;
end

function Role.PetDisappear(index)
  if this.pets[index] == nil then return end

  this.pets[index]:Destroy();
  this.pets[index] = nil;
end

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

function Role.GuardNpcAppear(index, npcId, hp, orgId, position)
  if npcDatas[npcId] == nil then return end
  logWarn(string.format("GuardNpc[%d] Appear !!", index));
  
  if this.guardNpcs[index] == nil then
    this.guardNpcs[index] = this.CreateRole(EHuman.GuardNpc, index, GuardNpcData.New());
  end
  
  local role = this.guardNpcs[index];
  local npcData = npcDatas[npcId];

  if npcData ~= nil then
    npcData:SetRoleAttributes(role);
  end
  
  role.npcId = npcId;
  role:SetAttribute(EAttribute.Hp, hp);

  role.data.cityId = City.GetCityId(SceneManager.sceneId, ECityScene.Fight);
  role.data.orgId = orgId;
  role.data.camp = City.GetCamp(role.data.orgId);

  if hp > 0 then
    role.data.status = EGuardStatus.OK;
  else
    role.data.status = EGuardStatus.Damage;
    role:SetIsDead(true);
  end
  
  role.data.master = nil;
  role.data.damageShowTime = 0;

  local style = npcData.picId % 1000;
  if style == 10 then
    role.data.kind = EGuard.Horse;
  elseif style == 159 or style == 471 then
    role.data.kind = EGuard.HitCar;
  elseif style == 161 or style == 651 then
    role.data.kind = EGuard.WellHurdle;
  elseif style == 162 or style == 652 then
    role.data.kind = EGuard.KnifeCar;
  elseif style == 163 or style == 446 then
    role.data.kind = EGuard.RockCar;
  elseif style == 164 or style == 656 then
    role.data.kind = EGuard.ArrowCar;
  elseif style == 185 or style == 646 then
    role.data.kind = EGuard.WoodHurdle;
  elseif style == 186 or style == 647 then
    role.data.kind = EGuard.WatchTower;
  elseif style == 187 then
    role.data.kind = EGuard.CityGate;
  elseif style == 189 then
    role.data.kind = EGuard.WoodGate;
  elseif style == 203 then
    role.data.kind = EGuard.CityWall;
  elseif style == 205 then
    role.data.kind = EGuard.WoodWall;
  else
    role.data.kind = EGuard.Other
  end
  
  role:SetPosition(position);

  if role.data.cityId == 5 then
    role:SetDirection(ERoleDirection.RightDown);
  else
    role:SetDirection(ERoleDirection.LeftDown);
  end

  role:Initialize();

  return role;
end

function Role.GuardNpcDisappear(index, showDamage)
  if this.guardNpcs[index] == nil then return end

  if showDamage and this.guardNpcs[index].data.kind ~= EGuard.WoodGate then
    this.guardNpcs[index].data.status = EGuardStatus.Damage;
    this.guardNpcs[index]:SetIsDead(true);
    --this.guardNpcs[index]:FadeOut(function() this.GuardNpcDisappear(index, false) end);
  else
    this.guardNpcs[index]:Destroy();
    this.guardNpcs[index] = nil;
  end
end

function Role.ForeignNpcAppear(index, npcId, position, war)
  if npcDatas[npcId] == nil then return end
  logWarn(string.format("ForeignNpc[%d] Appear !!", index));
  
  if this.foreignNpcs[index] == nil then
    this.foreignNpcs[index] = this.CreateRole(EHuman.ForeignNpc, index, ForeignNpcData.New());
  end
  
  local role = this.foreignNpcs[index];
  local npcData = npcDatas[npcId];

  if npcData ~= nil then
    npcData:SetRoleAttributes(role);
  end

  role.npcId = npcId;

  role:SetWar(war);
  role:SetPosition(position);

  role:Initialize();

  return role;
end

function Role.ForeignNpcDisappear(index)
  if this.foreignNpcs[index] == nil then return end

  this.foreignNpcs[index]:Destroy();
  this.foreignNpcs[index] = nil;
end

function Role.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Role.Script1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Role.Script2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Role.HouseWarriorAppear(index, npcId)
  if npcDatas[npcId] == nil then return end

  if this.houseWarriors[index] == nil then
    this.houseWarriors[index] = this.CreateRole(EHuman.HouseWarrior, index, HouseWarriorData.New());
  end

  local role = this.houseWarriors[index];
  local npcData = npcDatas[npcId];

  if npcData ~= nil then
    npcData:SetRoleAttributes(role);
  end

  role.npcId = npcId;
  role.data.master = this.players[index];

  role:Initialize();
  role:SetPosition(this.player.position);
  role.moveController:StartRandomPath();

  return role;
end

function Role.HouseWarriorDisappear(index)
  if this.houseWarriors[index] == nil then return end

  this.houseWarriors[index]:Destroy();
  this.houseWarriors[index] = nil;
end

function Role.MiningNPCAppear(npcId, name, position)
  if npcDatas[npcId] == nil then return end

  if this.miningNpc == nil then
    this.miningNpc = this.CreateRole(EHuman.MiningNpc, 1, MiningNpcData.New(name));
  end

  this.miningNpc.npcId = npcId;
  this.miningNpc:SetPosition(position);
  this.miningNpc:Initialize();
  this.miningNpc.moveController:StartRandomPath();

  return this.miningNpc;
end

function Role.MiningNPCDisappear()
  if this.miningNpc == nil then return end

  this.miningNpc:Destroy();
  this.miningNpc = nil;
end

function Role.CreateNpc(index, npcId, position)
  if npcDatas[npcId] == nil then return end
  
  local role = this.CreateRole(EHuman.Duplicate, index, npcDatas[npcId]);   
  local npcData = npcDatas[npcId];

  if npcData ~= nil then
    npcData:SetRoleAttributes(role);
  end

  role.npcId = npcId;
  role.actions = this.playerActions;

  role:SetPosition(position);

  role:Initialize();

  return role;
end

function Role.Script3()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Role.Script4()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Role.Script5()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Role.SetAttribute(kind, index, attrKind, attrValue, attrArg)
  if kind == EHuman.Player then
    if this.player == nil then return end

    if attrKind == EAttribute.Exp then
      local exp;

      if Role.player:GetAttribute(EAttribute.Turn) >= 3 then
        exp = attrValue - this.player:GetAttribute(EAttribute.Turn3Exp);
      else
        exp = attrValue - this.player:GetAttribute(EAttribute.Exp);
      end

      MachineBox.Statistics(EMachineBoxStats.Exp, 0, exp);
    end

    this.player:SetAttribute(attrKind, attrValue, attrArg);

  elseif kind == EHuman.Players then
    if this.players[index] == nil then return end

    this.players[index]:SetAttribute(attrKind, attrValue, attrArg);

  elseif kind == EHuman.MapNpc then
    if this.mapNpcs[index] == nil then return end

    this.mapNpcs[index]:SetAttribute(attrKind, attrValue, attrArg);

  elseif kind == EHuman.FollowNpc then
    if this.followNpcs[this.playerId] == nil then return end
    if this.followNpcs[this.playerId][index] == nil then return end

    this.followNpcs[this.playerId][index]:SetAttribute(attrKind, attrValue, attrArg);

  elseif kind == EHuman.GuardNpc then
    if this.guardNpcs[index] == nil then return end

    this.guardNpcs[index]:SetAttribute(attrKind, attrValue, attrArg);

  elseif kind == EHuman.ForeignNpc then
    if this.foreignNpcs[index] == nil then return end

    this.foreignNpcs[index]:SetAttribute(attrKind, attrValue, attrArg);
  end
end

function Role.SetMoveTarget(role)
  if role ~= nil then
    if not this.CanControl() then return end
    if role.kind == EHuman.FollowNpc and role.data.master == this.player or role == this.player then return end

    local sqrMagnitude = (role.position - this.player.position).sqrMagnitude;
    if sqrMagnitude <= math.pow(this.clickDistance, 2) then
      if this.target == role then
        if role.kind == EHuman.MapNpc then
          role:OnInteractive(EInteractive.Trig);
        end
      else
        TargetManager.ChangeTarget(role);
      end
      return;
    end

    this.moveTarget = role;
    this.player:Move(role.position);
  else
    this.moveTarget = nil;
  end
end

function Role.SetTarget(role)
  if this.player == nil then return end
  if this.target ~= nil and this.target == role then return end

  if this.target ~= nil then
    this.target:SetSelected(false);
    this.target = nil;

    UIInteractive.UpdateTarget();
  end

  if role == nil then return end
  if role.kind == EHuman.FollowNpc and role.data.master ~= this.player then return end
  if FightField.isInBattle then return end

  if this.moveTarget == role then
    this.player:StopMove();

    if role.kind == EHuman.MapNpc then
      role:OnInteractive(EInteractive.Trig);
    end

    this.SetMoveTarget(nil);
  end
  
  this.target = role;
  this.target:SetSelected(true);

  UIInteractive.UpdateTarget();
end

function Role.SetFightNpc(npcId)
  this.fightNpc = nil;

  if this.followNpcs[this.playerId] ~= nil then
    for k, v in pairs(this.followNpcs[this.playerId]) do
      if v.npcId == npcId then
        this.fightNpc = v;
        break;
      end
    end
  end

  if UI.IsVisible(UITeam) then
    UITeam.UpdateFollowNpc();
  end

  if this.player.war ~= EWar.None then
    UI.Close(UITeam);
  end
end

function Role.SetChildNpc(followIndex)
  this.childNpc = nil;

  if this.followNpcs[this.playerId] ~= nil then
    this.childNpc = this.followNpcs[this.playerId][followIndex];
  end
end

function Role.Script6()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Role.Script7()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Role.Script8()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Role.GetRoleIdKind(roleId)
  --[[
  if Contains(roleId, 5, 6, 7, 8, 9, 10, 23, 81) then --程式
    return ERoleId.RD;
  end

  if Define.IsDebugMode() then
    if isDeBugServer then
      return ERoleId.RD;
    end

    if roleId == 123123 or roleId == 456456 then --程式
      return ERoleId.RD;
    end
  end

  if Contains(roleId, 11, 12, 13, 14, 15, 16, 91, 92, 93) then --企劃
    return ERoleId.GD;
  end

  if Contains(roleId, 17, 18, 19, 20, 21, 22) then --美術
    return ERoleId.ART;
  end

  if roleId >= 100 and roleId <= 150 then --大GM
    return ERoleId.BGM;
  end

  if LuaHelper.CheckDefine("TW") then
    if roleId >= 151 and roleId <= 400 then --小GM
      return ERoleId.SGM;
    end
  else
    --目前這裡指大陸的GM
    if roleId >= 151 and roleId <= 300 then --小GM
      return ERoleId.SGM;
    end

    if roleId >= 301 and roleId <= 350 then
      return ERoleId.BGM2;
    end

    if roleId >= 351 and roleId <= 400 then
      return ERoleId.SGM2;
    end
  end

  if roleId >= 1001 and roleId <= 1057 then --客服
    return ERoleId.SER;
  end

  if Contains(roleId, 64006, 64007, 26, 27, 28, 29, 30, 31, 32, 34, 35, 36, 37, 38, 74, 75, 76, 77, 78, 79, 80) or (roleId >= 1058 and roleId <= 1119) then  --公司人員
    return ERoleId.COM;
  end

  if Contains(roleId, 24, 25, 27, 28, 29, 30, 31, 32, 34, 35, 36, 37, 38, 39, 40) then  --檢測人員
    return ERoleId.TEST;
  end

  if Contains(roleId, 33, 63, 72, 73) then  --系統
    return ERoleId.SYS;
  end

  if (roleId >= 41 and roleId <= 62) or Contains(roleId, 64, 65) then  --產品
    return ERoleId.PRO;
  end
  ]]--
  return ERoleId.None; --無(一般玩家)
end

function Role.IsGM(roleId)
  return Contains(this.GetRoleIdKind(roleId), ERoleId.BGM, ERoleId.SGM, ERoleId.BGM2, ERoleId.SGM2);
end

function Role.RjToAnimationId(roleRj)
  if roleRj < ERolePose.Stand then
    return ERolePose.Walk;
  elseif roleRj < ERolePose.Prepare then
    return ERolePose.Stand;
  elseif roleRj < ERolePose.Riding then
    return ERolePose.Prepare;
  elseif roleRj < ERolePose.Lie then
    return ERolePose.Riding;
  elseif roleRj < ERolePose.Defend then
    return ERolePose.Lie;
  elseif roleRj < ERolePose.Hit then
    return ERolePose.Defend;
  elseif roleRj < ERolePose.Jump then
    return ERolePose.Hit;
  elseif roleRj < ERolePose.Attack then
    return ERolePose.Jump;
  elseif roleRj < ERolePose.LongAttack then
    return ERolePose.Attack;
  elseif roleRj < ERolePose.Special then
    return ERolePose.LongAttack;
  elseif roleRj < ERolePose.LongSpecial then
    return ERolePose.Special;
  elseif roleRj < ERolePose.Magic then
    return ERolePose.LongSpecial;
  elseif roleRj < ERolePose.Archery then
    return ERolePose.Magic;
  elseif roleRj < ERolePose.Sit then
    return ERolePose.Archery;
  elseif roleRj < ERolePose.Wave then
    return ERolePose.Sit;
  elseif roleRj < ERolePose.Kiss then
    return ERolePose.Wave;
  elseif roleRj < ERolePose.Meditation then
    return ERolePose.Kiss;
  else
    return ERolePose.Meditation;
  end
end

function Role.UpdateAllView()
  logError(" UpdateAllView : ");
  for k, v in pairs(this.players) do
    v:UpdateAllView();
  end

  for k, v in pairs(this.mapNpcs) do
    v:UpdateAllView();
  end

  for k, v in pairs(this.followNpcs) do
    for kk, vv in pairs(v) do
      vv:UpdateAllView();
    end
  end

  for k, v in pairs(this.pets) do
    v:UpdateAllView();
  end

  for k, v in pairs(this.guardNpcs) do
    v:UpdateAllView();
  end

  for k, v in pairs(this.foreignNpcs) do
    v:UpdateAllView();
  end
end

function Role.Script9()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Role.Script10()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

--PlayerData
function Role.ReceivePlayerData(data)
  if this.player == nil then return end

  this.player:SetAttribute(EAttribute.Element, data:ReadByte()); --元素(1)
  local hp = data:ReadUInt32(); --體力值(4)
  local sp = data:ReadUInt16(); --技力值(2)
  this.player:SetAttribute(EAttribute.Int, data:ReadUInt16()); --知力(2)
  this.player:SetAttribute(EAttribute.Atk, data:ReadUInt16()); --攻擊力(2)
  this.player:SetAttribute(EAttribute.Def, data:ReadUInt16()); --防禦力(2)
  this.player:SetAttribute(EAttribute.Agi, data:ReadUInt16()); --敏捷(2)
  this.player:SetAttribute(EAttribute.Hpx, data:ReadUInt16()); --Hp上升幅度(2)
  this.player:SetAttribute(EAttribute.Spx, data:ReadUInt16()); --Sp上升幅度(2)
  this.player:SetAttribute(EAttribute.Lv, data:ReadByte()); --等級(1)
  this.player:SetAttribute(EAttribute.Exp, data:ReadInt32()); --經驗值(4)
  this.player:SetAttribute(EAttribute.SkillPoint, data:ReadUInt16()); --技能點數(2)
  this.player:SetAttribute(EAttribute.AttrPoint, data:ReadUInt16()); --屬性點數(2)
  this.player:SetAttribute(EAttribute.KillNum, data:ReadInt32()); --殺敵點(4)
  this.player:SetAttribute(EAttribute.BattleHonor, data:ReadUInt16()); --戰役官勳(2)
  this.player:SetAttribute(EAttribute.GovRequireValue, data:ReadByte()); --官府徵召兌獎值(1)
  this.player:SetAttribute(EAttribute.AstrolabePoint, data:ReadUInt16()); --七星命盤本命燈點數(2)
  this.player:SetAttribute(EAttribute.Honor, Calc.GetHonor(this.player:GetAttribute(EAttribute.KillNum))); --根據殺敵點換算公式求得  
  this.player:SetAttribute(EAttribute.MaxHp, data:ReadUInt32()); --最大Hp(4)
  this.player:SetAttribute(EAttribute.MaxSp, data:ReadUInt16()); --最大Sp(2)

  this.player:SetAttribute(EAttribute.EquipAtk, data:ReadInt32()); --裝備普通攻擊力(4)
  this.player:SetAttribute(EAttribute.EquipDef, data:ReadInt32()); --裝備普通防禦力(4)
  this.player:SetAttribute(EAttribute.EquipInt, data:ReadInt32()); --裝備特技力(4)
  this.player:SetAttribute(EAttribute.EquipAgi, data:ReadInt32()); --裝備敏捷力(4)
  this.player:SetAttribute(EAttribute.EquipMaxHp, data:ReadInt32()); --裝備提昇最大Hp(4)
  this.player:SetAttribute(EAttribute.EquipMaxSp, data:ReadInt32()); --裝備提昇最大Sp(4)
  this.player:SetAttribute(EAttribute.EquipHpx, data:ReadInt32()); --裝備Hpx(4)
  this.player:SetAttribute(EAttribute.EquipSpx, data:ReadInt32()); --裝備Spx(4)

  this.player:SetAttribute(EAttribute.Moral, data:ReadUInt16(), 1); --陣營 魏(2)
  this.player:SetAttribute(EAttribute.Moral, data:ReadUInt16(), 2); --陣營 蜀(2)
  this.player:SetAttribute(EAttribute.Moral, data:ReadUInt16(), 3); --陣營 吳(2)
  this.player:SetAttribute(EAttribute.Moral, data:ReadUInt16(), 4); --陣營 黃巾(2)
  this.player:SetAttribute(EAttribute.Moral, data:ReadUInt16(), 5); --陣營 遊俠(2)
  
  this.SetPracCount(data:ReadUInt32()); --修行值(4)

  --[[ 舊版軍團製造
  City.pracArray[ECityPrac.Mining].count = data:ReadUInt32(); --礦業
  City.pracArray[ECityPrac.Mining].Lv = Calc.GetPracLv(City.pracArray[ECityPrac.Mining].Count, 0); --得到目前的生產的等級
  City.pracArray[ECityPrac.Forestry].count = data:ReadUInt32();  --林業
  City.pracArray[ECityPrac.Forestry].Lv = Calc.GetPracLv(City.pracArray[ECityPrac.Forestry].Count, 0); --得到目前的生產的等級
  City.pracArray[ECityPrac.Livestock].count = data:ReadUInt32(); --畜產
  City.pracArray[ECityPrac.Livestock].Lv = Calc.GetPracLv(City.pracArray[ECityPrac.Livestock].Count, 0); --得到目前的生產的等級
  City.pracArray[ECityPrac.Farming].count = data:ReadUInt32(); --農業
  City.pracArray[ECityPrac.Farming].Lv = Calc.GetPracLv(City.pracArray[ECityPrac.Farming].Count, 0); --得到目前的生產的等級
  City.pracArray[ECityPrac.Build].count = data:ReadUInt32(); --建築
  City.pracArray[ECityPrac.Build].Lv = Calc.GetPracLv(City.pracArray[ECityPrac.Build].Count, 0);  --得到目前的生產的等級
  --]]

  this.player:SetOrganization(data:ReadUInt32());
  
  this.autoEatCount = data:ReadByte();  --剩餘的自動吃補丸
  
  table.Clear(this.playerData.heroSkills);
  -- table.Clear(this.playerData.turn2Balls);

  this.player:ClearSkill();
  local skillCount = data:ReadUInt16();
  for i = 1, skillCount do
    this.player:SetSkill(data:ReadUInt16(), data:ReadByte(), false);
  end

  this.player:SetAttribute(EAttribute.Turn3Element, data:ReadByte());
  this.player:SetAttribute(EAttribute.Turn3Exp, tonumber(data:ReadInt64()));
  this.player:SetAttribute(EAttribute.Turn3Int, data:ReadUInt16());
  this.player:SetAttribute(EAttribute.Turn3Atk, data:ReadUInt16());
  this.player:SetAttribute(EAttribute.Turn3Def, data:ReadUInt16());
  this.player:SetAttribute(EAttribute.Turn3Agi, data:ReadUInt16());
  this.player:SetAttribute(EAttribute.Turn3Hpx, data:ReadUInt16());
  this.player:SetAttribute(EAttribute.Turn3Spx, data:ReadUInt16());
  local skillCount = data:ReadUInt16();
  for i = 1, skillCount do
    this.player:SetSkill(data:ReadUInt16(), data:ReadByte(), false);
  end

  this.player:SetAttribute(EAttribute.Hp, hp);
  this.player:SetAttribute(EAttribute.Sp, sp);

  local newAttrCount = data:ReadByte();
  for i = 1, newAttrCount do
    this.player:SetAttribute(data:ReadByte(), data:ReadInt32());
  end

  if UI.IsVisible(UISkillTree) then
    if UISkillTree.IsCurrentRole(this.player) then
      UISkillTree.ClearAllAddLvData();
      UISkillTree.UpdateUI(true);
    end
  end
end

function Role.Script11()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Role.Script12()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Role.Script13()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Role.Script14()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Role.ReceivePlayerSkillData(data)
  if this.player == nil then return end

  this.player:SetAttribute(EAttribute.Element, data:ReadByte()); --元素(1)
  this.player:SetAttribute(EAttribute.SkillPoint, data:ReadUInt16()); --技能點數(2)

  this.player:ClearSkill();
  local skillCount = data:ReadUInt16();
  for i = 1, skillCount do
    this.player:SetSkill(data:ReadUInt16(), data:ReadByte(), false);
  end

  if UI.IsVisible(UISkillTree) then
    if UISkillTree.IsCurrentRole(this.player) then
      UISkillTree.ClearAllAddLvData();
      UISkillTree.UpdateUI(true);
    end
  end
end

function Role.SetPracCount(value)
  this.playerData.pracCount = value; 
  this.playerData.pracLv = Calc.GetPracLv(value, 0);
end

--元寶
function Role.SetPoint(point, showMessage)
  this.playerData.point = point;
  
  if UI.IsVisible(UIMain) then
    UIMain.UpdateMoney();
  end

  if showMessage == false then return end

  local text = string.Concat(string.Get(20750), this.playerData.point);

  if not Define.Free then
    local playTime = data:ReadDouble();
    if playTime ~= 0 then
      text = string.Concat(text, "\n", string.Get(20751), DateTime.FromOADate(playTime):ToString());
    end

    if Define.Indo then
      local expireTime = data:ReadDouble();
      if expireTime ~= 0 then
        text = string.Concat(text, "\n", string.Get(40413), DateTime.FromOADate(expireTime):ToString());
      end
    end
  else
    if Define.Perfect then
      local playTime = data:ReadDouble();
      if playTime ~= 0 then
        text = string.Concat(text, "\n", string.Get(20751), DateTime.FromOADate(playTime):ToString());
      end
    end
  end
  
  ShowCenterMessage(text, 10);
  Chat.AddMessage(EChannel.System, text);
end

function Role.GetPoint()
  return this.playerData.point;
end

--綁定元寶
function Role.SetLockPoint(point)
  this.playerData.lockPoint = point;

  if UI.IsVisible(UIMain) then
    UIMain.UpdateMoney();
  end
end

function Role.GetLockPoint()
  return this.playerData.lockPoint;
end

--總元寶
function Role.GetAllPoint()
  return this.playerData.point + this.playerData.lockPoint;
end

function Role.Demo()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Role.Demo1()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Role.Demo2()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end


function Role.Demo3()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

--各種幣
function Role.ReceivePlayerGold(data)
  this.playerData.gold = data:ReadInt32();
  this.playerData.saleGold = data:ReadInt32();

  --更新BK_MoneyAccountF的資料顯現
  --BK_MoneyAccountF.Refresh;

  --更新Se_MainStatus的資料顯現
  --Se_MainStatus.Button[0].hint = string.Concat(string.Get(30135), this.Gold, string.Get(30128));

  --ShowCenterMessage(string.Concat(string.Get(30135), this.playerData.gold, string.Get(30128)));

  Mounts.OnMoneyChange();
  NotifyManager.Notify("CheckCondition", ECondition.Gold);
end

--遊戲幣
function Role.AddPlayerGold(value)
  if this.playerData.gold + value > this.maxGold then return end

  this.playerData.gold = this.playerData.gold + value;

  --ShowCenterMessage(string.Concat(string.Get(30034), value, string.Get(30027)));

  AudioManager.PlayOnce("AudioClip_WA0014", 0);
  
  --[[
  --在水戰場景得寶要秀得寶光影
  if Player.WaterBattleScene_Kind=MR_WaterSceneKind_Fight then
    WarWaterManage.SetGetTreasure(Player.ShowX, Player.ShowY);
  end
  ]]--

  if UI.IsVisible(UIMain) then
    UIMain.UpdateMoney();
  end

  Mounts.OnMoneyChange();
  NotifyManager.Notify("CheckCondition", ECondition.Gold);
end

function Role.DelPlayerGold(value)
  if this.playerData.gold < value then return end

  this.playerData.gold = this.playerData.gold - value;

  --ShowCenterMessage(string.Concat(string.Get(30035), value, string.Get(30027)));

  if UI.IsVisible(UIMain) then
    UIMain.UpdateMoney();
  end

  Mounts.OnMoneyChange();
end

function Role.GetPlayerGold()
  return this.playerData.gold;
end

function Role.Demo4()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Role.Demo5()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Role.Demo6()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

--拍賣幣
function Role.AddPlayerSaleGold(value)
  if this.playerData.saleGold + value > this.maxSaleGold then return end

  this.playerData.saleGold = this.playerData.saleGold + value;
end

function Role.DelPlayerSaleGold(value)
  if this.playerData.saleGold < value then return end

  this.playerData.saleGold = this.playerData.saleGold - value;
end

--軍團幣
function Role.SetPlayerOrgGold(value)
  this.playerData.orgGold = value;
  
  if UI.IsVisible(UIMain) then
    UIMain.UpdateMoney();
  end
end

function Role.GetPlayerOrgGold()
  return this.playerData.orgGold;
end

function Role.GetPlayerCurrency(currency) 
  if this.playerData.currencys[currency] == nil then
    return 0;
  end 

  return this.playerData.currencys[currency];
end

function Role.SetPlayerCurrency(currency, value)
  if this.playerData.currencys[currency] == nil then
    this.playerData.currencys[currency] = {};
  end
  this.playerData.currencys[currency] = value;
end

function Role.Demo7()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Role.Demo8()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Role.Demo9()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Role.CheckCurrency(currency, value, showMessage)
  if currency == ECurrency.Gold then
    if this.GetPoint() < value then
      if showMessage == true then
        ShowCenterMessage(string.Get(22313));
      end

      return false;
    end
  elseif currency == ECurrency.Money then
    if this.GetPlayerGold() < value then
      if showMessage == true then
        ShowCenterMessage(string.Get(22314));
      end

      return false;
    end
  elseif currency == ECurrency.OrgGold then
    if this.GetPlayerOrgGold() < value then
      if showMessage == true then
        ShowCenterMessage(string.Get(22315));
      end

      return false;
    end
  else
    if this.GetPlayerCurrency(currency) < value then
      if showMessage == true then
        ShowCenterMessage("GGGGGG");
      end

      return false;
    end
  end

  return true;
end

--擴充等級
function Role.SetBankLv(level)
  this.playerData.bankLv = level;

  if UI.IsVisible(UIBank) then
    UIBank.UpdateUI();
  end
end

function Role.GetInnLv()
  return this.playerData.innLv;
end

function Role.GetBankLv()
  return this.playerData.bankLv;
end

function Role.Demo10()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Role.Demo11()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Role.SetBagLv(level)
  this.playerData.bagLv = level;
end

function Role.GetBagLv()
  return this.playerData.bagLv;
end

function Role.CanControl()
  if this.player == nil then return false end
  if EventManager.IsRunning() then return false end
  if MoviePlayer.IsPlaying() then return false end
  if Team.IsMember(this.playerId) and not Team.IsLeader(this.playerId) then return false end
  if MagicBeanShow.isMagicBean then return false end
  if DragonBoat.InRaceScene() then return false end --龍舟場景

  return true;
end

function Role.SetLoginDay(data)
  this.playerData.loginDay = data:ReadUInt16();
  this.playerData.continueLogin = data:ReadUInt16();

  if UI.IsVisible(UILoginAward) then
    UILoginAward.UpdateUI();
  end
end

function Role.GetLoginDay()
  return this.playerData.loginDay;
end

function Role.ShowIndexToAttribute(index)
  if index == 1 then
    return EAttribute.Int;
  elseif index == 2 then
    return EAttribute.Atk;
  elseif index == 3 then
    return EAttribute.Def;
  elseif index == 4 then
    return EAttribute.Hpx;
  elseif index == 5 then
    return EAttribute.Spx;
  elseif index == 6 then
    return EAttribute.Agi;
  else
    return EAttribute.None;
  end
end

function Role.CheckPlayerLv(minLv, maxLv)
  if Role.player == nil then return false end

  local checkLv = (Role.player:GetAttribute(EAttribute.Turn) * this.playerMaxLv) + this.player:GetAttribute(EAttribute.Lv);

  if minLv ~= nil then
    if checkLv < minLv then
      return false;
    end
  end

  if maxLv ~= nil then
    if checkLv > maxLv then
      return false;
    end
  end

  return true;
end

function Role.Demo12()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Role.Demo13()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Role.Demo14()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

--Player Avartar
function Role.GetPlayerJmpHD(sex, style)
  local jmp = nil;
  local scale = 1;

  if sex == 1 then
    --男
    if Contains(style, 0, 5) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 1943);
      scale = 1;
    elseif Contains(style, 1, 6) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 1944);
      scale = 1;
    elseif Contains(style, 2, 7) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 1945);
      scale = 1;
    elseif Contains(style, 3, 8) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 1946);
      scale = 1;
    elseif Contains(style, 4, 9) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 1947);
      scale = 1;
    elseif Contains(style, 10) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 2008);
      scale = 1;
    elseif Contains(style, 11) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 2009);
      scale = 1;
    elseif Contains(style, 12) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 2010);
      scale = 1;
    elseif Contains(style, 13) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 2011);
      scale = 1;
    elseif Contains(style, 14) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 2012);
      scale = 1;
    elseif Contains(style, 15) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 2013);
      scale = 1;
    elseif Contains(style, 16) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 2019);
      scale = 1;
    elseif Contains(style, 17) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 2020);
      scale = 1;
    elseif Contains(style, 18) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 2021);
      scale = 1;
    elseif Contains(style, 19) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 2022);
      scale = 1;
    elseif Contains(style, 20) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 2023);
      scale = 1;
    end

    if jmp == nil then
      local bodyJmp = RolePicManager.GetJMP(ERolePart.Body, 2000);
      local hairJmp = RolePicManager.GetJMP(ERolePart.Hair, 2100 + style);

      jmp = Jmp.Combine(bodyJmp, hairJmp);
      scale = 2;
    end
  else
    --女
    if Contains(style, 0, 7) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 1949);
      scale = 1;
    elseif Contains(style, 1, 8) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 1950);
      scale = 1;
    elseif Contains(style, 2, 9) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 1951);
      scale = 1;
    elseif Contains(style, 3, 10) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 1952);
      scale = 1;
    elseif Contains(style, 4, 11) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 1953);
      scale = 1;
    elseif Contains(style, 5, 12) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 1954);
      scale = 1;
    elseif Contains(style, 6, 13) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 1948);
      scale = 1;
    elseif Contains(style, 14) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 2001);
      scale = 1;
    elseif Contains(style, 15) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 2002);
      scale = 1;
    elseif Contains(style, 16) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 2003);
      scale = 1;
    elseif Contains(style, 17) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 2004);
      scale = 1;
    elseif Contains(style, 18) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 2005);
      scale = 1;
    elseif Contains(style, 19) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 2006);
      scale = 1;
    elseif Contains(style, 20) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 2007);
      scale = 1;
    elseif Contains(style, 21) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 2014);
      scale = 1;
    elseif Contains(style, 22) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 2015);
      scale = 1;
    elseif Contains(style, 23) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 2016);
      scale = 1;
    elseif Contains(style, 24) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 2017);
      scale = 1;
    elseif Contains(style, 25) then
      jmp = RolePicManager.GetJMP(ERolePart.Body, 2018);
      scale = 1;
    end

    if jmp == nil then
      local bodyJmp = RolePicManager.GetJMP(ERolePart.Body, 3000);
      local hairJmp = RolePicManager.GetJMP(ERolePart.Hair, 3100 + style);
  
      jmp = Jmp.Combine(bodyJmp, hairJmp);
      scale = 2;
    end
  end
  
  return jmp, scale;
end

function Role.GetElfUIPic(index)
  local direction = 1;
  local elfPic = "elf";
  local elfId = elfDatas[index].Id;
  
  this.elfTexture[direction] = string.Concat(elfPic, elfId, "_", tostring(direction + 1));
  return this.elfTexture[direction];
end

function Role.GetElfPic(elfId, direction)
  if elfId ~= nil and elfId > 0 then
    local elfPic = "elf";
    this.elfTexture[direction] = string.Concat(elfPic, elfId, "_", tostring(direction + 1));
    return this.elfTexture[direction];
  else
    if direction == 0 then
      return this.godTexture[0];
    elseif direction == 1 then
      return this.godTexture[1];
    elseif direction == 2 then
      return this.godTexture[2];
    elseif direction == 3 then
      return this.godTexture[3];
    end
  end
end

function Role.SetColorTint(colorTints, colorTint1, colorTint2)
  --帽
  colorTints[1].r = math.floor(colorTint1 / 100000000) % 10;
  colorTints[1].g = math.floor(colorTint1 / 10000000) % 10;
  colorTints[1].b = math.floor(colorTint1 / 1000000) % 10;
  
  --髮
  colorTints[2].r = math.floor(colorTint1 / 100000) % 10;
  colorTints[2].g = math.floor(colorTint1 / 10000) % 10;
  colorTints[2].b = math.floor(colorTint1 / 1000) % 10;

  --膚
  colorTints[3].r = math.floor(colorTint1 / 100) % 10;
  colorTints[3].g = math.floor(colorTint1 / 10) % 10;
  colorTints[3].b = math.floor(colorTint1 / 1) % 10;

  --衣
  colorTints[4].r = math.floor(colorTint2 / 100000000) % 10;
  colorTints[4].g = math.floor(colorTint2 / 10000000) % 10;
  colorTints[4].b = math.floor(colorTint2 / 1000000) % 10;
  
  --褲
  colorTints[5].r = math.floor(colorTint2 / 100000) % 10;
  colorTints[5].g = math.floor(colorTint2 / 10000) % 10;
  colorTints[5].b = math.floor(colorTint2 / 1000) % 10;
  
  --鞋
  colorTints[6].r = math.floor(colorTint2 / 100) % 10;
  colorTints[6].g = math.floor(colorTint2 / 10) % 10;
  colorTints[6].b = math.floor(colorTint2 / 1) % 10;
end

function Role.Demo15()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Role.Demo16()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

local randomColors = {};

function Role.OnLoadRandomColorData(file)
  local reader = DatReader.New(file);

  local count = reader:ReadInt32();  
  for i = 1, count do
    local sex = reader:ReadByte();
    local color = {};
    color[1] = { r = reader:ReadByte(), g = reader:ReadByte(), b = reader:ReadByte() };
    color[2] = { r = reader:ReadByte(), g = reader:ReadByte(), b = reader:ReadByte() };
    color[3] = { r = reader:ReadByte(), g = reader:ReadByte(), b = reader:ReadByte() };

    if randomColors[sex] == nil then
      randomColors[sex] = {};
    end

    table.insert(randomColors[sex], color);
  end
end

function Role.SetColorRandom(colorTints, sex)
  if randomColors[sex] == nil then return end

  local randomColor = randomColors[sex][math.random(table.Count(randomColors[sex]))];
  
  local temp;
  for i = 2, 4 do
    colorTints[i].r = randomColor[i - 1].r;
    colorTints[i].g = randomColor[i - 1].g;
    colorTints[i].b = randomColor[i - 1].b;

    if math.random(2) == 1 then
      temp = 1;
    else
      temp = -1;
    end

    local randRGB = math.random(3);
    if randRGB == 1 then
      colorTints[i].r = colorTints[i].r + temp; 
      colorTints[i].r = math.max(colorTints[i].r, 0);
      colorTints[i].r = math.min(colorTints[i].r, 9);
    elseif randRGB == 2 then
      colorTints[i].g = colorTints[i].g + temp;
      colorTints[i].g = math.max(colorTints[i].g, 0);
      colorTints[i].g = math.min(colorTints[i].g, 9);
    else
      colorTints[i].b = colorTints[i].b + temp;
      colorTints[i].b = math.max(colorTints[i].b, 0);
      colorTints[i].b = math.min(colorTints[i].b, 9);
    end
  end
end

function Role.AllRoleSetVisible(visibleKind)
  for roleId, role in pairs(this.players) do
    role:SetVisible(visibleKind);
  end

  for roleId, role in pairs(this.mapNpcs) do
    role:SetVisible(visibleKind);
  end

  for roleId, role in pairs(this.followNpcs) do
    for kk, vv in pairs(role) do
      vv:SetVisible(visibleKind);
    end
  end

  for roleId, role in pairs(this.cartNpcs) do
    role:SetVisible(visibleKind);
  end

  for roleId, role in pairs(this.houseWarriors) do
    role:SetVisible(visibleKind);
  end
end

function Role.Demo17()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Role.Demo18()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Role.Demo19()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end