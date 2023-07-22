--[[
Now at that time, Judah went away from his brothers and became the friend of a man of Adullam named Hirah.
And there he saw the daughter of a certain man of Canaan named Shua, and took her as his wife.
And she gave birth to a son, and he gave him the name Er.
And again she gave birth to a son, and he gave him the name Onan.
Then she had another son, to whom she gave the name Shelah; she was at Chezib when the birth took place.
And Judah took a wife for his first son Er, and her name was Tamar.
Now Er, Judah's first son, did evil in the eyes of the Lord, so that he put him to death.
Then Judah said to Onan, Go in to your brother's wife and do what it is right for a husband's brother to do; make her your wife and get offspring for your brother.
But Onan, seeing that the offspring would not be his, went in to his brother's wife, but let his seed go on to the earth, so that he might not get offspring for his brother.
And what he did was evil in the eyes of the Lord, so that he put him to death, like his brother.
Then Judah said to Tamar, his daughter-in-law, Go back to your father's house and keep yourself as a widow till my son Shelah becomes a man: for he had in his mind the thought that death might come to him as it had come to his brothers. So Tamar went back to her father's house.
And after a time, Bath-shua, Judah's wife, came to her end; and after Judah was comforted for her loss, he went to Timnah, where they were cutting the wool of his sheep, and his friend Hirah of Adullam went with him.
And when Tamar had news that her father-in-law was going up to Timnah to the wool-cutting,
She took off her widow's clothing, and covering herself with her veil, she took her seat near Enaim on the road to Timnah; for she saw that Shelah was now a man, but she had not been made his wife.
--]]

EHuman = {
  None = 0,        --沒
  Player = 1,      --玩家自己
  Players = 2,     --其他玩家
  MapNpc = 3,      --大地圖Npc
  FollowNpc = 4,   --跟隨Npc
  SceneElm = 5,    --場景元件
  GuardNpc = 6,    --駐紮Npc(攻城器械)
  MineNpc = 7,     --地雷Npc(事件),訂這種類型,才會有寶跟經
  OwnerNpc = 8,    --本身擁有的Npc
  Divide = 9,      --030716-1J 玩家分身
  Soldier = 11,    --攻城戰使用 兵
  Machine = 12,    --攻城戰使用 械
  CtrlMach = 13,   --玩家控制的器械
  AutoFollow = 14, --自動攻擊的武將
  CtrlSold = 15,   --玩家控制的兵
  ForeignNpc = 16, --外來的Npc
  CartNpc = 17,    --馬車Npc
  ChaosGod = 18,   --亂鬥天神
  PetNpc = 19,     --小寵物
  Question = 20,   --戰鬥問答
  WorldBoss = 21,  --世界Boss
  WorldBoss2 = 22, --第2類型世界Boss(不抵抗天雷)
  WorldBoss3 = 23, --第3類型世界Boss(霸意無效(玩家),隨機(被)爆擊)
  WorldBoss4 = 24, --第4類型世界Boss(被相克屬性攻擊傷害加倍)
  AutomanualPlayer = 28, --半自動對戰玩家
  AutomanualNpc = 29,    --半自動對戰Npc
  HouseWarrior = 30, --小屋裡的武將
  MiningNpc = 253, --小屋裡的武將
  SoulWarrior = 254,     --靈魂武將
  Duplicate = 255,
}

EAttribute = {
  None = 0,
  Element = 24, --元素 (1地 2水 3火 4風)
  Hp = 25, --體力值
  Sp = 26, --技力值
  Int = 27, --知力
  Atk = 28, --攻擊力
  Def = 29, --防禦力
  Agi = 30, --敏捷
  Hpx = 31, --Hp上升幅度
  Spx = 32, --Sp上升幅度
  Lv = 35, --等級
  Exp = 36, --經驗值
  SkillPoint = 37, --技能點數
  AttrPoint = 38, --屬性點數
  PracExp = 39, --修練經驗值
  Turn2Ball = 40, --天珠點數
  Moral = 50, --陣營 (1魏 2蜀 3吳 4黃巾 5遊俠)
  Honor = 62, --官勳(根據殺敵點公式求得)
  KillNum = 63, --殺敵點
  Faith = 64, --忠誠度
  BattleHonor = 66, --戰役官勳
  GovRequireValue = 67, --官府徵召兌獎值
  AstrolabePoint = 69, --七星命盤本命燈點數
  Turn = 70, --轉生狀態
  BuffInt = 71, --BUFF 知力
  BuffAtk = 72, --BUFF 攻擊力
  BuffDef = 73, --BUFF 防禦力
  BuffAgi = 74, --BUFF 敏捷
  BuffHpx = 75, --BUFF Hp上升幅度
  BuffSpx = 76, --BUFF Sp上升幅度
  Turn3Int = 81, --三轉 知力
  Turn3Atk = 82, --三轉 攻擊力
  Turn3Def = 83, --三轉 防禦力
  Turn3Hpx = 84, --三轉 Hp上升幅度
  Turn3Spx = 85, --三轉 Sp上升幅度
  Turn3Agi = 86, --三轉 敏捷
  UpgradeLv = 87, --強化等級
  StealHp = 88, --攻擊時HP回復
  StealSp = 89, --攻擊時SP回復
  ResistancePercent = 90, --異常狀態抵抗率
  ReactiveDamage = 91, --反傷率
  AtkPercent = 101, --攻擊力(%)
  DefPercent = 102, --防禦力(%)
  Crit = 103, --暴擊率(%)
  CritDamage = 104, --暴擊傷害(%)
  Dodge = 105, --閃躲(1~30%)
  Hit = 106, --命中(1~30%)
  HpPercent = 107, --最大HP(%)
  SpPercent = 108, --最大SP(%)
  IntPercent = 109, --知力(%)
  Skill = 110, --技能
  MaxHp = 205, --最大體力值
  MaxSp = 206, --最大技力值
  EquipMaxHp = 207, --裝備提昇最大Hp
  EquipMaxSp = 208, --裝備提昇最大Sp
  Buff = 209, --增益buff
  EquipAtk = 210, --裝備普通攻擊力
  EquipDef = 211, --裝備普通防禦力
  EquipInt = 212, --裝備知力
  EquipAgi = 214, --裝備敏捷力
  ExtraHp = 215, --額外的Hp(Client不用)
  ExtraSp = 216, --額外的Sp(Client不用)
  BoatSpeed = 217, --裝備提升船速
  EquipHpx = 218, --裝備Hpx
  EquipSpx = 219, --裝備Spx
  Seal = 221, --封印狀態 (0正常 1冰封 2旋風 3樹精 4? 5暈擊 6昏睡)
  Vary = 222, --變化狀態 (0正常 101結界 102閃躲 103鏡 104冰牆 105隱身 106? 107放大)
  Faint = 223, --衰弱狀態 (0正常 171施毒 172縮小 173混亂)
  Spec = 224, --特殊狀態 (0正常 251護主)
  Strong = 225, --強盛狀態 (0正常)
  EquipCriticle = 226, --裝備提升爆擊機率(PS:爆傷100%)
  MountsLv = 227, --座騎等級

  --Unity版新增
  Career = 251,
  Turn3Lv = 252, --三轉等級
  Turn3Exp = 253, --三轉經驗值
  Turn3Element = 254, --三轉屬性
  Marriage = 255, --婚姻狀態
}

--sealInfo 1~50    StrongInfo 51~100   VaryInfo 101~170    FaintInfo 171~240   SpecInfo 241~255
EStatus = {
  None = 0; --無
  IceBound = 1; --冰封
  WhirlWind = 2; --旋風
  Clump = 3; --樹精

  DizzyAtk = 5; --030609J 暈擊
  Trance = 6; --昏睡
  ShakeTake = 7; --震攝
  EW_Counter = 8; --金鐘反制

  WindFaster = 51; --風之戰意
  WildFightSoul = 52; --狂熱戰魂
  BrightMirror = 53; --明鏡止水
  AngryMind = 54; --霸意
  CrazySoul = 55; --聖靈暴衝
  PitySoldier = 58; --哀兵之道(劉備)
  MagicalShield = 59, 
  EWCommonStrong = 60, --通用強盛

  Boundary = 101; --結界
  Avoid = 102; --030609J 閃躲
  Mirror = 103; --030609J 鏡
  IceWall = 104; --冰牆
  Limpid = 105; --隱身
  Vitality = 106; --元氣
  Enlarge = 107; --放大
  SameHeart = 108; --同心
  Inspire = 109; --鼓舞
  SoulMirror = 110; --靈鏡
  FireAmulet = 111; --丹陽護體
  TransferAttack = 112;--斗轉星移
  Invisible = 113; --無形無相
  WarStep = 114; --凝氣護盾
  GoldShield = 115; --金鐘罩
  DolphieGraud = 116,
  ImmunityShield = 117, --魔王領域(免疫盾)
  DragonTransfer = 118, --巴龍風障(反彈狀態)

  IceCrystals = 119,  --冰晶守護(被打給冰封)

  God = 170; --福神附身
  Poision = 171; --中毒
  Shrink = 172; --縮小
  Chaos = 173; --混亂
  Traitor = 174; --內鬨
  Tardy = 175; --遲緩
  Stool1 = 176; --中大便毒
  Landslip = 177; --土崩陣

  ThunderFire = 179; --焚燒(雷火召臨)
  HealthDrawer = 180; --式鬼吸魂
  EWCommonFaint = 181,

  SoulCurse = 183; --蝕魂詛咒
  WeakPercent = 184, --削弱(%數)
  Taunt = 185,  --有客來
  WeakValue = 186, --削弱(定值)

  Poor = 240; --衰神附身
  Protect = 241, --護主
  Spell = 242,  --符咒
  MagicProtect = 243, --魔法防禦

  PassiveSkill = 256,  --被動技能
  PassiveSkill2 = 257,
  PassiveGoldShield = 258,
  PassivePoisonShield = 259,
}

ERolePose = {
  None = -1;
  Walk = 0, --走路
  PetWalk = 3, --寵物走路
  Stand = 8, --站立
  Prepare = 16, --備戰
  Riding = 18, --騎乘
  Lie = 26, --躺下
  Defend = 28, --擋住
  Hit = 30, --挨打
  Jump = 32, --跳
  Attack = 34, --一般攻擊(短)
  LongAttack = 36, --一般攻擊(長)
  Special = 38, --特殊攻擊(短)
  LongSpecial = 40, --衝鋒
  Magic = 42, --魔法攻擊
  Archery = 44, --射箭
  Sit = 46, --坐下
  Wave = 50, --揮手
  Kiss = 58, --KISS
  Meditation = 59,--冥想
  Bath = 60,--泡澡
  TowelBath = 61,--泡澡(有毛巾)
}

ERoleVisible = {
  Visible = 1, --顯示狀態
  Hide = 2, --Hide狀態
  TimeVisible = 3, --目前是顯示狀態,但有時間限制
  TimeHide = 4, --目前是Hide狀態,但有時間限制
}

EAnimationTrigger = {
  None = 0,
  Hello = 1,
  Block = 2,
  Hit = 3,
  OneHandAttack = 4,
  TwoHandAttack = 5,
  MagicAttack = 6,
  RangeAttack = 7,
}

ERoleDirection = {
  Up = 0,
  LeftUp = 1,
  Left = 2,
  LeftDown = 3,
  Down = 4,
  RightDown = 5,
  Right = 6,
  RightUp = 7,
}

EInteractive = {
  Trig = 1, --互動
  PK = 2, --PK
  PlayOne = 3, --參戰
  Watch = 4, --觀戰
  Friend = 5, --好友
  Team = 6, --組隊
  Organization = 7, --軍團
  UseItem = 8, --使用物品
  UseSkill = 9, --使用技能
  TradeItem = 10, --交易物品
  TradeNpc = 11, --交易武將
  Whisper = 12, --密語
}

EHotkey = {
  None = 0,
  Item = 1,
  Skill = 2,
}

EParctice = {
  None = 0,
  CuttingWood = 1, --中秋伐木
  Pharmacy = 2, --中秋搗藥
}

ERoleActivityInfo = {
  None = 0,
  FieldBattle = 1, --大陸擂台賽
  RandomPVP = 2, --亂鬥
  NpcChallenge = 3, --NPC挑戰
  OrgWarFlag = 4, --軍團戰旗子
  DeathMatch = 5, --死鬥
}

EFaceDirection = {
  Up = 0,
  LeftUp = 1,
  Left = 2,
  LeftDown = 3,
  Down = 4,
  RightDown = 5,
  Right = 6,
  RightUp = 7,
}

RoleController = {}
RoleController.__index = RoleController;

function RoleController.New(kind, index, data)
  local self = {};
  setmetatable(self, RoleController);

  self.kind = kind;
  self.index = index;
  self.data = data;

  self.moveController = MoveController.New(self);

  --Unity Object
  self.gameObject = nil;
  self.transform = nil;
  self.material = nil;

  --Body
  self.bodyObject = nil;
  self.canvas = nil;
  self.rawImage_Body = nil;
  self.event = nil;
  self.bodyEffect = nil;
  self.bath = nil;

  --Horse
  self.rawImage_Horse = nil;

  --HorseMask
  self.rawImage_HorseMask = nil;
  
  --Ghost
  self.rawImage_Ghost = nil;
  self.text_Ghost = nil;

  --Shadow
  self.rawImage_Shadow = nil;

  --HUD
  self.hudObject = nil;
  self.text_Name = nil;
  self.image_Element = nil;
  self.image_MiniMap = nil;
  self.rawImage_Emoji = nil;
  self.image_TeamState = nil;
  self.slider_Hp = nil;
  self.slider_Sp = nil;
  self.careerController = nil;
  self.text_Organization = nil;
  self.rawImage_Ensign = nil;
  self.rawImage_TitleBG = nil;
  self.text_Title = nil;
  self.gradient_Title = nil;
  self.outline_Title = nil;
  self.text_Activity = nil;
  self.transform_CommonStatus = nil;
  self.image_StatusUp = nil;
  self.image_StatusDown = nil;
  self.image_UpgradeLv = nil;

  --屬性
  self.attributes = {};
  self.buff = { kind = 0, value = 0 };

  --Controller用變數
  self.name = "";
  self.npcId = 0;
  self.actions = {};
  self.height = 0;
  self.visible = ERoleVisible.Visible;
  self.titleId = 0;

  self.war = EWar.None;
  
  self.direction = ERoleDirection.Down;
  self.position = Vector2.zero;
  self.speed = SceneManager.sceneState.moveSpeed;

  self.horseNpcId = 0;

  self.frameInterval = 0.2;

  self.animationId = 0;
  self.animationFrame = 0;
  self.animationForceId = -1;
  self.animationForceFrame = 255;
  self.animationTime = 0;
  self.animationTrigger = EAnimationTrigger.None;

  self.inBattle = false;
  self.isDead = false;
  self.isJumping = false;
  self.isMoving = false;
  self.isSitting = false;
  self.isTrigged = false;
  self.onTheSea = false;

  self.activityKind = ERoleActivityInfo.None;
  self.activityInfo = nil;

  return self;
end

function RoleController.Meanless()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function RoleController.Meanless1()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function RoleController.Meanless2()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function RoleController.Meanless3()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function RoleController.Meanless4()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function RoleController:Initialize()
  if self.kind ~= EHuman.Duplicate then 
    if not SceneManager.sceneState.active then return end
  end

  --不同場景玩家不顯示
  if self.kind == EHuman.Players and (self.data.sceneId ~= SceneManager.sceneId or self.data.instanceId ~= SceneManager.instanceId or self.data.isWatching) then
    self:Destroy();

    local followNpcs = Role.GetFollowNpcs(self.index);
    for k, v in pairs(followNpcs) do
      Role.FollowNpcDisappear(self.index, k, true);
    end

    Role.CartNpcDisappear(self.index);

    --離開場景清資料加在這
    self.npcId = 0;
    self.isTrigged = false;

  --攻城戰不顯示跟隨武將
  elseif self.kind == EHuman.FollowNpc and City.cityId ~= 0 then
    self:Destroy();

  --攻城戰不顯示馬車
  elseif self.kind == EHuman.CartNpc and City.cityId ~= 0 then
    self:Destroy();
    
  elseif self.gameObject == nil then
    self.gameObject = poolMgr:Get("BaseRole");

    if Contains(self.kind, EHuman.Player, EHuman.Players) then
      self.gameObject.name = string.Concat("Player_", self.index);
    elseif self.kind == EHuman.MapNpc then
      self.gameObject.name = string.Concat("MapNpc_", self.index);
    elseif self.kind == EHuman.FollowNpc then
      self.gameObject.name = string.Concat("FollowNpc_", self.index);
    elseif self.kind == EHuman.CartNpc then
      self.gameObject.name = string.Concat("CartNpc_", self.index);
    elseif self.kind == EHuman.GuardNpc then
      self.gameObject.name = string.Concat("GuardNpc_", self.index);
    elseif self.kind == EHuman.ForeignNpc then
      self.gameObject.name = string.Concat("ForeignNpc_", self.index);
    elseif self.kind == EHuman.PetNpc then
      self.gameObject.name = string.Concat("PetNpc_", self.index);
    elseif self.kind == EHuman.Duplicate then
      self.gameObject.name = string.Concat("Duplicate_", self.index);
    elseif self.kind == EHuman.HouseWarrior then
      self.gameObject.name = string.Concat("HouseWarrior_", self.index);
    elseif self.kind == EHuman.MiningNpc then
      self.gameObject.name = string.Concat("MiningNpc_", self.index);
    end

    self.gameObject.transform:SetParent(Role.roleRoot.transform);
    self.gameObject.transform.localPosition = Vector3.New(self.position.x, -self.position.y, 0);
    self.gameObject.transform.localScale = Vector3.one;

    self.transform = self.gameObject.transform;

    self.material = poolMgr:Get("RoleMaterial");
    self.material:SetColor("_Color", Color.White);
    self.material:SetColor("_TexColor", Color.White);
    self.material:SetFloat("_Outline", 0);
    self.material:SetFloat("_Invisible", 0);
    self.material:SetFloat("_InvisibleAlpha", 1);

    --Body
    self.canvas = self.gameObject:GetComponent(typeof(Canvas));
    self.bodyObject = self.transform:Find("Body").gameObject;
    
    self.rawImage_Body = self.bodyObject.transform:Find("RawImage_Body"):GetComponent(typeof(RawImage));
    self.rawImage_Body.enabled = false;
    self.rawImage_Body.material = self.material;
    self.rawImage_Body.raycastTarget = self.kind ~= EHuman.Player and self.kind ~= EHuman.FollowNpc and self.kind ~= EHuman.CartNpc;
    self.raycastMask_Body = self.rawImage_Body.transform:GetComponent("UIRawImageRaycastMask");

    self.jmpDrawer_Body = self.bodyObject.transform:Find("RawImage_Body"):GetComponent(typeof(JmpDrawer));
    self.jmpDrawer_Body.enabled = false;
    self.jmpDrawer_Body.luaListener = 
      function()
        self:UpdateViewTexture();
        self:UpdateViewShadow();

        if UI.IsVisible(UIStatus) and UIStatus.IsCurrentRole(self) then
          UIStatus.UpdateUI();
        end

        if FightField.isInBattle then 
          FightField.UpdateFightRoleJmp(self);
        end
      end

    self.event = self.bodyObject.transform:Find("RawImage_Body"):GetComponent(typeof(UIEvent));
    self.event:SetListener(EventTriggerType.PointerClick, self.OnClick);
    self.event.parameter = self;

    --Horse
    self.rawImage_Horse = self.bodyObject.transform:Find("RawImage_Horse"):GetComponent(typeof(RawImage));
    self.rawImage_Horse.enabled = false;
    self.rawImage_Horse.material = self.material;
    self.jmpDrawer_Horse = self.bodyObject.transform:Find("RawImage_Horse"):GetComponent(typeof(JmpDrawer));
    self.jmpDrawer_Horse.enabled = false;
    self.jmpDrawer_Horse.luaListener = 
      function()
        self:UpdateViewShadow();
        self:RestartAnimation();
      end

    --HorseMask
    self.rawImage_HorseMask = self.bodyObject.transform:Find("RawImage_HorseMask"):GetComponent(typeof(RawImage));
    self.rawImage_HorseMask.enabled = false;
    self.rawImage_HorseMask.material = self.material;
    self.jmpDrawer_HorseMask = self.bodyObject.transform:Find("RawImage_HorseMask"):GetComponent(typeof(JmpDrawer));
    self.jmpDrawer_HorseMask.enabled = false;
    self.jmpDrawer_HorseMask.luaListener = 
      function()
        self:RestartAnimation();
      end
    
    --Ghost
    self.rawImage_Ghost = self.bodyObject.transform:Find("RawImage_Ghost"):GetComponent(typeof(UIRawImage));
    self.rawImage_Ghost.material = self.material;
    self.rawImage_Ghost.enabled = false;

    self.text_Ghost = self.rawImage_Ghost.transform:Find("Text_Ghost"):GetComponent(typeof(Text));
    self.text_Ghost.text = "";
    
    self.rawImage_Ghost.gameObject:SetActive(false);
    
    --Shadow
    self.rawImage_Shadow = nil;
    self.rawImage_Shadow = self.bodyObject.transform:Find("RawImage_Shadow"):GetComponent(typeof(RawImage));
    self.rawImage_Shadow.enabled = false;
    self.rawImage_Shadow.material = UniversalJmp.GetShadowMatirial();
    self.jmpDrawer_Shadow = self.bodyObject.transform:Find("RawImage_Shadow"):GetComponent(typeof(JmpDrawer));
    self.jmpDrawer_Shadow.enabled = false;

    --HUD
    self.hudObject = self.transform:Find("HUD").gameObject;
    local layout = self.hudObject.transform:Find("Layout");
    
    self.image_Select = layout:Find("Image_Select"):GetComponent(typeof(Image));
    self.image_Select.gameObject:SetActive(false);

    layout = layout.transform:Find("Layout");

    self.hudVisibleObject = layout.gameObject;

    self.text_Name = layout:Find("Text_Name"):GetComponent(typeof(Text));
    self.text_Name.text = "";

    self.image_Element = self.text_Name.transform:Find("Image_Element"):GetComponent("Image");
    self.image_Element.gameObject:SetActive(false);

    --self.outline_Name = layout:Find("Text_Name"):GetComponent("Outline");

    self.image_MiniMap = self.transform:Find("Image_MiniMap"):GetComponent("Image");

    self.rawImage_Emoji = self.hudObject.transform:Find("RawImage_Emoji"):GetComponent(typeof(UIRawImage));
    self.rawImage_Emoji.enabled = false;

    self.image_TeamState = layout:Find("Image_TeamState"):GetComponent(typeof(Image));
    self.image_TeamState.gameObject:SetActive(false);

    self.slider_Hp = layout:Find("Slider_Hp"):GetComponent(typeof(UISlider));
    self.slider_Hp.gameObject:SetActive(false);

    self.slider_Sp = layout:Find("Slider_Sp"):GetComponent(typeof(UISlider));
    self.slider_Sp.gameObject:SetActive(false);

    self.image_UpgradeLv = self.slider_Hp.transform:Find("Image_UpgradeLv"):GetComponent("Image");
    self.image_UpgradeLv.gameObject:SetActive(false);

    self.text_Organization = layout:Find("Text_Organization"):GetComponent(typeof(Text));
    self.text_Organization.gameObject:SetActive(false);
    self.text_Organization.text = "";

    self.rawImage_Ensign = self.text_Organization.transform:Find("RawImage_Organization"):GetComponent(typeof(RawImage));
    self.rawImage_Ensign.gameObject:SetActive(false);

    self.rawImage_TitleBG = layout:Find("Image_TitleBG"):GetComponent(typeof(RawImage));
    self.text_Title = self.rawImage_TitleBG.transform:Find("Text_Title"):GetComponent("Text");
    self.gradient_Title = self.text_Title.transform:GetComponent("GradientColor");
    self.outline_Title = self.text_Title.transform:GetComponent("Outline8");
    self.rawImage_TitleBG.gameObject:SetActive(false);

    self.text_Activity = layout:Find("Text_Activity"):GetComponent(typeof(Text));
    self.text_Activity.gameObject:SetActive(false);

    self.transform_CommonStatus = layout:Find("Root_CommonStatus");
    self.image_StatusUp = self.transform_CommonStatus:Find("Image_StatusUp"):GetComponent(typeof(Image));
    self.image_StatusUp.gameObject:SetActive(false);
    self.image_StatusDown = self.transform_CommonStatus:Find("Image_StatusDown"):GetComponent(typeof(Image));
    self.image_StatusDown.gameObject:SetActive(false);
  end

  self:UpdateAll();
end

function RoleController.Meanless5()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end


function RoleController.Meanless6()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function RoleController:Destroy()
  TargetManager.Remove(self);

  if Role.moveTarget == self then
    Role.SetMoveTarget(nil);
  end
  
  if self.gameObject ~= nil then
    poolMgr:Release("BaseRole", self.gameObject);
    self.gameObject = nil;
    self.transform = nil;
  end
  
  if self.material ~= nil then
    poolMgr:Release("RoleMaterial", self.material);
    self.material = nil;
  end

  if self.careerController ~= nil then
    self.careerController:Destroy();
    self.careerController = nil;
  end

  if self.image_TeamState ~= nil then
    self.image_TeamState.rectTransform:SetParent(self.slider_Hp.transform.parent);
    self.image_TeamState.rectTransform.anchorMin = Vector2.New(0.5, 0.5);
    self.image_TeamState.rectTransform.anchorMax = Vector2.New(0.5, 0.5);
    self.image_TeamState.rectTransform.localScale = Vector3.one;
    self.image_TeamState.rectTransform:SetSiblingIndex(0);
  end

  if self.rawImage_Ensign ~= nil then
    self.rawImage_Ensign.rectTransform:SetParent(self.text_Organization.transform);
    self.rawImage_Ensign.rectTransform.anchorMin = Vector2.New(0, 0);
    self.rawImage_Ensign.rectTransform.anchorMax = Vector2.New(0, 0);
    self.rawImage_Ensign.rectTransform.anchoredPosition = Vector2.New(-2, 0);
    self.rawImage_Ensign.rectTransform.localScale = Vector3.one;
  end

  --Body
  self.canvas = nil;
  self.rawImage_Body = nil;
  if self.jmpDrawer_Body ~= nil then
    self.jmpDrawer_Body:Disable();
    self.jmpDrawer_Body = nil;
  end
  self.event = nil;
  if self.bodyEffect ~= nil then
    self.bodyEffect:Stop();
  end
  if self.bath ~= nil then
    if self.bath.texture ~= nil then
      TexturePool.Recycle(self.bath.texture);
      self.bath.texture = nil;
    end
    
    self.bath = nil;
  end

  --Horse
  self.rawImage_Horse = nil;
  if self.jmpDrawer_Horse ~= nil then
    self.jmpDrawer_Horse:Disable();
    self.jmpDrawer_Horse = nil;
  end
  
  --HorseMask
  self.rawImage_HorseMask = nil;
  if self.jmpDrawer_HorseMask ~= nil then
    self.jmpDrawer_HorseMask:Disable();
    self.jmpDrawer_HorseMask = nil;
  end
  
  --Ghost
  self.rawImage_Ghost = nil;
  self.text_Ghost = nil;

  --Shadow
  self.rawImage_Shadow = nil;
  self.jmpDrawer_Shadow = nil;

  --HUD
  self.hudObject = nil;
  self.image_Select = nil;
  self.hudVisibleObject = nil;
  self.text_Name = nil;
  self.image_Element = nil;
  self.image_UpgradeLv = nil;
  self.image_MiniMap = nil;
  self.rawImage_Emoji = nil;
  self.image_TeamState = nil;
  self.slider_Hp = nil;
  self.slider_Sp = nil;
  self.text_Organization = nil;
  self.rawImage_Ensign = nil;
  self.rawImage_TitleBG = nil;
  self.text_Title = nil;
  self.gradient_Title = nil;
  self.outline_Title = nil;
  self.text_Activity = nil;
  self.image_StatusUp = nil;
  self.image_StatusDown = nil;
end

function RoleController.AviodCov()
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

function RoleController.AviodCovA()
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

function RoleController.Copy(role, actions)
  local self = Role.CreateRole(EHuman.Duplicate, 0, nil);

  self.npcId = role.npcId;
  self.titleId = role.titleId;
  self.activityKind = role.activityKind;
  self.activityInfo = role.activityInfo;

  if actions ~= nil then
    self.actions = actions;
  end
  
  self:Initialize();

  self:UpdateSpeed(role.speed);
  self:UpdateName(role.name, role.text_Name.color);
  self:UpdateViewShadow(role.shadowKind);
  self:UpdateViewJMP(role);
  self:UpdateViewTitle();
  self:UpdateViewOrganization(role.data.orgId);

  return self;
end

function RoleController.AviodCov2()
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

function RoleController.AviodCov3()
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

function RoleController.AviodCov4()
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

function RoleController:ChangeScene(sceneId, position, sceneTag, instanceId)
  logWarn(string.Concat(self.name, " Change Scene !! SceneId = ", sceneId, " X = ", position.x, " Y = ", position.y, " InstanceId = ", instanceId));
  sceneTag = sceneTag or self.data.sceneTag;
  instanceId = instanceId or self.data.instanceId;

  --小屋裡換場景，玩家取消原本跟家具互動的動作
  if self.kind == EHuman.Player or self.kind == EHuman.Players then
    if houseEditorSceneSetDatas[SceneManager.sceneId] ~= nil then
      self:SetAnimationForceId(ERolePose.None);
      self:SetOnTheSea(false);
    end
  end

  if self.kind == EHuman.Player then
    if self.data.sceneId == sceneId and self.data.instanceId == instanceId then 
      self:Teleport(position, true);
      return;
    end

    for k, v in pairs(Role.players) do
      if v ~= self then
        v:Guard(0);
        v:ChangeScene(0, Vector2.zero, 0, 0);
      end
    end

    self.data.sceneId = sceneId;
    self.data.sceneTag = sceneTag;
    self.data.instanceId = instanceId;

    self.data.isWatching = false;
    
    self:Teleport(position, false, true);

    SceneManager.ChangeScene(sceneId, sceneTag, instanceId);

  elseif self.kind == EHuman.Players then
    if self.data.sceneId == sceneId and self.data.instanceId == instanceId then
      self:Teleport(position);
      self:UpdateAll();
      return;
    end
    
    self.data.sceneId = sceneId;
    self.data.sceneTag = sceneTag;
    self.data.instanceId = instanceId;

    self.data.isWatching = false;

    self:Teleport(position);

    self:Initialize();
  end

  if Contains(self.kind, EHuman.Player, EHuman.Players) and UI.IsVisible(UITeam) then
    UITeam.UpdateUI();
  end

  if HouseManager.IsInHouse() then
    --小屋裡其他玩家換場景，家具互動點檢查一次
    if self.kind == EHuman.Players then
      FurnitureManager.CheckAllFurnituresInteractive();
    end
    --玩家進小屋強制下馬
    self:Ride(0);
  end
end

function RoleController.AviodCov5()
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

--Update
function RoleController:UpdateMove()
  if self.visible ~= ERoleVisible.Visible and self.visible ~= ERoleVisible.TimeVisible then return end

  self.moveController:Update();
end

function RoleController:UpdateShow(checkView, timeScale)
  if self.gameObject == nil then return end
  if self.visible ~= ERoleVisible.Visible and self.visible ~= ERoleVisible.TimeVisible then return end
  if CGTimer.time < self.animationTime then return end
  
  if checkView then
    if self.position.x > Scene.cameraPosition.x + Scene.currentSceneHalfWidth + 50 then return end
    if self.position.x < Scene.cameraPosition.x - Scene.currentSceneHalfWidth - 50 then return end
    if self.position.y > Scene.cameraPosition.y + Scene.currentSceneHalfHeight + 50 then return end
    if self.position.y < Scene.cameraPosition.y - Scene.currentSceneHalfHeight - 50 then return end
  end

  self.frameInterval = 0.2;

  local frameCount = 0;
  local horseFrameCount = 0;
  local showMirror = false;

  if self.rawImage_Body.texture == UniversalJmp.GetFightTexture() then
    --秀打架
    frameCount = self.jmpDrawer_Body:GetFrameCount(0);
    self.jmpDrawer_Body:Draw(0, self.animationFrame % frameCount);

  elseif self.rawImage_Body.texture == UniversalJmp.GetShipTexture() then
    --秀船隻
    if self.isMoving then
      self.animationId = self:GetAnimationId(ERolePose.Walk);
      self.frameInterval = self:GetAnimationInterval(ERolePose.Walk);
    else
      self.animationId = self:GetAnimationId(ERolePose.Stand);
      self.frameInterval = self:GetAnimationInterval(ERolePose.Stand);
    end

    frameCount = self.jmpDrawer_Body:GetFrameCount(self.direction);
    self.jmpDrawer_Body:Draw(self.direction, self.animationFrame % frameCount);

  elseif self.bath ~= nil and self.rawImage_Body.texture == self.bath.texture then
    --泡澡
    if Contains(SceneManager.sceneId, 57401, 60441) or HouseManager.IsInHouse() then
      self.animationId = self:GetAnimationId(ERolePose.TowelBath);
      self.frameInterval = self:GetAnimationInterval(ERolePose.TowelBath);
    else
      self.animationId = self:GetAnimationId(ERolePose.Bath);
      self.frameInterval = self:GetAnimationInterval(ERolePose.Bath);
    end

    frameCount = self.jmpDrawer_Body:GetFrameCount(self.animationId);
    self.jmpDrawer_Body:Draw(self.animationId, self.animationFrame % frameCount);

  else
    --影子
    if self.shadowKind ~= EShadow.None and not self.onTheSea then
      self.jmpDrawer_Shadow:Draw(UniversalJmp.GetShadowAni(self.shadowKind, self.direction, self.inBattle));
    end

    --馬
    if self.horseNpcId ~= 0 and self.jmpDrawer_Horse.active and npcDatas[self.npcId] == nil and not self.onTheSea then
      if self.isMoving then
        self.animationId = self:GetAnimationId(ERolePose.Walk);
        self.frameInterval = self:GetAnimationInterval(ERolePose.Walk);
      else
        self.animationId = self:GetAnimationId(ERolePose.Stand);
        self.frameInterval = self:GetAnimationInterval(ERolePose.Stand);
      end

      self.animationId, showMirror = self:CheckAnimationId(self.animationId);
      horseFrameCount = self.jmpDrawer_Horse:GetFrameCount(self.animationId);
      self.jmpDrawer_Horse:Draw(self.animationId, self.animationFrame % horseFrameCount, showMirror);
      
      if self.jmpDrawer_HorseMask.active then
        self.jmpDrawer_HorseMask:Draw(self.animationId, self.animationFrame % horseFrameCount, showMirror);
      end
    end

    --秀身圖
    if self.animationForceId < 0 then
      if self.inBattle then
        if self.isDead then
          self.animationId = self:GetAnimationId(ERolePose.Lie);
          self.frameInterval = self:GetAnimationInterval(ERolePose.Lie);
        elseif self.isJumping then
          self.animationId = self:GetAnimationId(ERolePose.Jump);
          self.frameInterval = self:GetAnimationInterval(ERolePose.Jump);
        elseif self.animationTrigger == EAnimationTrigger.Block then
          self.animationId = self:GetAnimationId(ERolePose.Defend);
          self.frameInterval = self:GetAnimationInterval(ERolePose.Defend);
        elseif self.animationTrigger == EAnimationTrigger.Hit then
          self.animationId = self:GetAnimationId(ERolePose.Hit);
          self.frameInterval = self:GetAnimationInterval(ERolePose.Hit);
        elseif self.animationTrigger == EAnimationTrigger.OneHandAttack then
          self.animationId = self:GetAnimationId(ERolePose.Attack);
          self.frameInterval = self:GetAnimationInterval(ERolePose.Attack);
        elseif self.animationTrigger == EAnimationTrigger.TwoHandAttack then
          self.animationId = self:GetAnimationId(ERolePose.Special);
          self.frameInterval = self:GetAnimationInterval(ERolePose.Special);
        elseif self.animationTrigger == EAnimationTrigger.MagicAttack then
          self.animationId = self:GetAnimationId(ERolePose.Magic);
          self.frameInterval = self:GetAnimationInterval(ERolePose.Magic);
        elseif self.animationTrigger == EAnimationTrigger.RangeAttack then
          self.animationId = self:GetAnimationId(ERolePose.Archery);
          self.frameInterval = self:GetAnimationInterval(ERolePose.Archery);
        else
          self.animationId = self:GetAnimationId(ERolePose.Prepare);
          self.frameInterval = self:GetAnimationInterval(ERolePose.Prepare);
        end
      else
        if self.isDead then
          self.animationId = self:GetAnimationId(ERolePose.Lie);
          self.frameInterval = self:GetAnimationInterval(ERolePose.Lie);
        elseif self.isSitting then
          self.animationId = self:GetAnimationId(ERolePose.Sit);
          self.frameInterval = self:GetAnimationInterval(ERolePose.Sit);
        elseif self.horseNpcId ~= 0 and self.jmpDrawer_Horse.active and npcDatas[self.npcId] == nil then
          self.animationId = self:GetAnimationId(ERolePose.Riding);
          self.frameInterval = self:GetAnimationInterval(ERolePose.Riding);
        elseif self.data ~= nil and self.data.guardNpc ~= nil then
          if Contains(self.data.guardNpc.data.kind, EGuard.WatchTower, EGuard.WellHurdle, EGuard.KnifeCar) then
            self.animationId = self:GetAnimationId(ERolePose.Stand);
            self.frameInterval = self:GetAnimationInterval(ERolePose.Stand);
          elseif Contains(self.data.guardNpc.data.kind, EGuard.Horse) then
            self.animationId = self:GetAnimationId(ERolePose.Riding);
            self.frameInterval = self:GetAnimationInterval(ERolePose.Riding);
          elseif self.isMoving then
            self.animationId = self:GetAnimationId(ERolePose.Walk);
            self.frameInterval = self:GetAnimationInterval(ERolePose.Walk);
          else
            self.animationId = self:GetAnimationId(ERolePose.Stand);
            self.frameInterval = self:GetAnimationInterval(ERolePose.Stand);
          end
        elseif self.isMoving then
          self.animationId = self:GetAnimationId(ERolePose.Walk);
          self.frameInterval = self:GetAnimationInterval(ERolePose.Walk);
        elseif self.animationTrigger == EAnimationTrigger.Hello then
          self.animationId = self:GetAnimationId(ERolePose.Wave);
          self.frameInterval = self:GetAnimationInterval(ERolePose.Wave);
        else
          self.animationId = self:GetAnimationId(ERolePose.Stand);
          self.frameInterval = self:GetAnimationInterval(ERolePose.Stand);
        end
      end
    else
      if self.horseNpcId ~= 0 and self.jmpDrawer_Horse.active and npcDatas[self.npcId] == nil then
        self.animationId = self:GetAnimationId(ERolePose.Riding);
        self.frameInterval = self:GetAnimationInterval(ERolePose.Riding);
      else
        self.animationId = self:GetAnimationId(self.animationForceId);
        self.frameInterval = self:GetAnimationInterval(self.animationForceId);
      end
    end

    if not self.jmpDrawer_Body.active then return end

    if self.animationForceFrame ~= 255 then
      self.animationFrame = self.animationForceFrame;
    end

    self.animationId, showMirror = self:CheckAnimationId(self.animationId);
    frameCount = self.jmpDrawer_Body:GetFrameCount(self.animationId);
    self.jmpDrawer_Body:Draw(self.animationId, self.animationFrame % frameCount, showMirror);
  end

  self.animationFrame = self.animationFrame + 1;

  if timeScale ~= nil and timeScale > 0 then
    self.animationTime = CGTimer.time + (self.frameInterval / timeScale);
  else
    self.animationTime = CGTimer.time + self.frameInterval;
  end

  frameCount = math.max(frameCount, horseFrameCount);
  
  if frameCount == 0 or self.animationFrame >= frameCount then
    self.animationTrigger = EAnimationTrigger.None;

    if self.isDead or self.animationForceId == ERolePose.Lie then
      self.animationFrame = math.max(frameCount - 1, 0);
    else
      self.animationFrame = 0;
    end
  end
end

function RoleController.AviodCov6()
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

function RoleController.AviodCov7()
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

function RoleController.AviodCov8()
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

local enterDistance = math.pow(130, 2);
local exitDistance = math.pow(170, 2);
function RoleController:UpdateCollision()
  if self.gameObject == nil then return end
  if self.kind == EHuman.Player then return end
  if self.visible ~= ERoleVisible.Visible and self.visible ~= ERoleVisible.TimeVisible then return end

  if self.kind == EHuman.Players then
    if self.war ~= EWar.None and Team.IsMember(self.index) and not Team.IsLeader(self.index) then return end
  end

  if Role.player == nil then return end

  local sqrDistance = (self.position - Role.player.position).sqrMagnitude;

  if sqrDistance <= enterDistance then
    self:OnPlayerEnter();
  elseif sqrDistance > exitDistance then
    self:OnPlayerExit();
  end 
end

function RoleController:UpdateAll()
  self:UpdateSpeed();
  self:UpdateName();
  self:UpdateAllView();
end

function RoleController:UpdateSpeed(speed, updateFollow)
  if speed == nil then
    if Contains(self.kind, EHuman.Player, EHuman.Players) and DragonBoat.InRaceScene() then
      self.speed = self.data.dragonBoatSpeed * 2;
    elseif Contains(self.kind, EHuman.Player, EHuman.Players) and Role.IsGM(self.index) then
      self.speed = SceneManager.sceneState.moveSpeed + 60;
    else
      self.speed = SceneManager.sceneState.moveSpeed;

      --水戰場景才重設移動速度(依據出戰戰船)
      if Warship.scene == EWaterScene.Fight then
        if Contains(self.kind, EHuman.Player, EHuman.Players) then
          self.speed = self.speed + Warship.GetWarshipSpeed(self.index);
        else
          self.speed = self.speed + NpcData.GetAddSpeed(npcDatas[self.npcId].picId + 1000, 0, self.npcId);
        end

      elseif self.kind == EHuman.FollowNpc then
        if self.data.master ~= nil then
          self.speed = self.data.master.speed;
        end

      elseif self.kind == EHuman.CartNpc then
        local master = Role.players[self.index];
        if master ~= nil then
          self.speed = master.speed;
        end

      elseif self.kind == EHuman.PetNpc then
        self.speed = Role.baseSpeed;

      elseif self.kind == EHuman.MapNpc then
        if Between(npcDatas[self.npcId].picId, 472, 477) then
          self.speed = Role.baseSpeed;
        else
          self.speed = 160 * 0.5 * self.data.eventNpcData.motionSpeedLv * 0.4;
        end

      elseif npcDatas[self.horseNpcId] ~= nil then
        self.speed = self.speed + Mounts.GetSpeed(self:GetAttribute(EAttribute.MountsLv));

      elseif self.kind == EHuman.HouseWarrior then
        self.speed = Role.baseSpeed * 0.5;
      end
    end
  else
    self.speed = speed;
  end

  if Contains(self.kind, EHuman.Player, EHuman.Players) then
    if updateFollow ~= false then
      if Team.IsLeader(self.index) then
        --隊長
        local members = Team.GetMember(self.index);
        for k, v in pairs(members) do
          v:UpdateSpeed(self.speed, false);
        end
      elseif Team.IsMember(self.index) then
        --隊員
        local leader = Team.GetLeader(self.index);
        if leader ~= nil then
          self.speed = leader.speed;
        end
      else
        --無組隊
        local followNpcs = Role.GetFollowNpcs(self.index);
        for k, v in pairs(followNpcs) do
          v:UpdateSpeed(self.speed, false);
        end

        local cartNpc = Role.cartNpcs[self.index];
        if cartNpc ~= nil then
          cartNpc:UpdateSpeed(self.speed, false);
        end
      end
    end
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

function RoleController:UpdateName(name, color)
  if name == nil then
    name = "";

    if Contains(self.kind, EHuman.Player, EHuman.Players, EHuman.MiningNpc) then
      name = self.data.name;
    elseif self.kind == EHuman.FollowNpc then
      if self.data.name ~= "" then
        if Define.IsInternal() then
          if UIDebug.RecordMode then
            name = self.data.name;
          else
            name = string.Concat(self.data.name, self.npcId);
          end
        else
          name = self.data.name;
        end
      elseif npcDatas[self.npcId] ~= nil then
        name = npcDatas[self.npcId].name;
      end
    else
      if npcDatas[self.npcId] ~= nil then
        name = npcDatas[self.npcId].name;
        if UIDebug.RecordMode then
          name = string.gsub(name, '%d%d%d%d%d', '');
        end
      end
    end
  end

  self.name = name;

  self:UpdateViewName(color);
end

--[[
This is the book of the generations of Adam. In the day when God made man, he made him in the image of God;
Male and female he made them, naming them Man, and giving them his blessing on the day when they were made.
Adam had been living for a hundred and thirty years when he had a son like himself, after his image, and gave him the name of Seth:
And after the birth of Seth, Adam went on living for eight hundred years, and had sons and daughters:
And all the years of Adam's life were nine hundred and thirty: and he came to his end.
And Seth was a hundred and five years old when he became the father of Enosh:
And he went on living after the birth of Enosh for eight hundred and seven years, and had sons and daughters:
And all the years of Seth's life were nine hundred and twelve: and he came to his end.
And Enosh was ninety years old when he became the father of Kenan:
--]]

--View
function RoleController:UpdateAllView()
  self:UpdateViewPosition();
  self:UpdateViewScale();
  self:UpdateViewName();
  self:UpdateViewActivity();
  self:UpdateViewOrganization();
  self:UpdateViewTeam();
  self:UpdateViewShadow();
  self:UpdateViewRide();
  self:UpdateViewJMP();
  self:UpdateViewTitle();
  self:UpdateViewGhost();
  self:UpdateViewVisible();
end

function RoleController:UpdateViewPosition()
  if self.gameObject == nil then return end

  self.transform.localPosition = Vector3.New(self.position.x, -self.position.y, 0);
  
  if self.kind == EHuman.FollowNpc then
    self.canvas.sortingOrder = self.position.y - 1;
  elseif self.kind == EHuman.CartNpc then
    self.canvas.sortingOrder = self.position.y - 1;
  elseif self.kind == EHuman.GuardNpc then
    if Contains(self.data.kind, EGuard.WoodGate, EGuard.CityGate) then
      self.canvas.sortingOrder = self.position.y - 15;
    elseif Contains(self.data.kind, EGuard.KnifeCar) and self.direction == ERoleDirection.Down then
      self.canvas.sortingOrder = self.position.y + 1;
    else
      self.canvas.sortingOrder = self.position.y - 1;
    end
  elseif self.kind == EHuman.Duplicate then
  elseif FurnitureManager.PlayerIsInteractive(self.index) then
  else
    self.canvas.sortingOrder = self.position.y;
  end

  if self.kind == EHuman.Player then
    Scene.UpdateCamera(self.position);
  
    if UI.IsVisible(UIMiniMap) then
      UIMiniMap.UpdatePosition();
    end
  end
end

function RoleController:UpdateViewScale()
  if self.gameObject == nil then return end

  if SceneManager.sceneState.type == ESceneType.Map then
    if self.kind == EHuman.MapNpc and npcDatas[self.npcId] ~= nil and npcDatas[self.npcId].kind == ENpc.City then
      self.transform.localScale = Vector3.one;
    else
      self.transform.localScale = Vector3.one * 0.5;
    end
  else
    self.transform.localScale = Vector3.one;
  end
end

function RoleController.EndOfLine()
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

function RoleController.EndOfLine1()
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

function RoleController.EndOfLine2()
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

function RoleController:UpdateViewName(color)
  if self.gameObject == nil then return end
  
  if not Setting.CheckShowBody(self) then
    self.text_Name.gameObject:SetActive(false);
    return;
  end
  
  if color == nil then
    color = Color.Sky;
    if self.kind == EHuman.FollowNpc then
      --若為FNpc且可以成長則秀紅色的字眼,否則一律秀黃色字眼
      if self.data.canGrow == 0 then
        color = Color.Orange;
      elseif self.data.canGrow == 2 then
        color = Color.MissionNPC;
      else
        color = Color.Sky;
      end
    elseif self.kind == EHuman.MapNpc then
      color = Color.White;
    elseif self.kind == EHuman.Player then
      color = Color.Yellow;
    elseif self.kind == EHuman.GuardNpc then
      if City.GetCamp(self.data.orgId) == ECamp.Defend then
        color = Color.Defend
      else
        color = Color.Attack;
      end
    elseif self.kind == EHuman.Players then
      if City.cityId ~= 0 then
        if City.GetCamp(self.data.orgId) == ECamp.Attack then
          color = Color.Attack;
        else
          color = Color.Defend;
        end
      else
        if self:GetAttribute(EAttribute.Turn) == 0 then
          color = Color.Sky;
        else
          color = Color.Purple;
        end
      end
    elseif self.kind == EHuman.ForeignNpc then
      color = Color.Attack;
    elseif self.kind == EHuman.MiningNpc then
      color = Color.Gold;
    else
      if City.cityId ~= 0 then
        if Role.player.war ~= EWar.None and self.data ~= nil and self.data.orgId ~= nil then
          if City.GetCamp(self.data.orgId) == ECamp.Attack then
            color = Color.Attack
          else
            color = Color.Defend;
          end
        else
          color = Color.Sky;
        end
      else
        if Role.player.war ~= EWar.None then
          color = Color.Yellow
        else
          color = Color.Sky;
        end
      end
    end
  end

  self.text_Name.text = self.name;

  LuaHelper.SetColor(self.text_Name, color);
  --LuaHelper.SetColor(self.outline_Name, color);
  LuaHelper.SetColor(self.image_MiniMap, color);

  if self.kind == EHuman.Player then
    self.image_MiniMap.transform.localScale = Vector3.one;
  else
    self.image_MiniMap.transform.localScale = Vector3.one * 0.7;
  end

  if self.kind == EHuman.MapNpc and npcDatas[self.npcId] ~= nil and npcDatas[self.npcId].turn == 2 then
    self.image_Element.sprite = UI.GetSprite(string.Concat("HUDElement_", npcDatas[self.npcId].element));
    self.image_Element.gameObject:SetActive(self.image_Element.sprite ~= nil);
  else
    self.image_Element.sprite = nil;
    self.image_Element.gameObject:SetActive(false);
  end

  self:SetUpgradeLvShow();

  if npcDatas[self.npcId] ~= nil and npcDatas[self.npcId].kind == ENpc.Chest then
    self.text_Name.gameObject:SetActive(false);
  else
    self.text_Name.gameObject:SetActive(true);
  end

  if Contains(self.kind, EHuman.FollowNpc) then
    self.text_Name.gameObject:SetActive(Setting.CheckShowBody(self));
  end
end

function RoleController.EndOfLine3()
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

function RoleController.EndOfLine5()
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

function RoleController.EndOfLine6()
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

function RoleController:UpdateViewActivity()
  if self.gameObject == nil then return end
  if self.data == nil then return end

  local activityText = "";

  if self.activityInfo ~= nil then
    --大陸擂台比賽
    if self.activityKind == ERoleActivityInfo.FieldBattle then
      if self.activityInfo[1] + self.activityInfo[2] + self.activityInfo[3] > 0 then
        activityText = string.Concat(string.Get(40337), self.activityInfo[1], " ", string.Get(40338), self.activityInfo[2], " ", string.Get(40339), self.activityInfo[3]);
      end

    --亂鬥
    elseif self.activityKind == ERoleActivityInfo.RandomPVP then
      --前三名加秀名次訊息
      if Contains(self.activityInfo.topRank, 1, 2, 3) then
        activityText = string.Concat(string.Get(60048), string.Get(30096), self.activityInfo.topRank, string.Get(30097)); --擂台賽第X名
      end
      
      if Contains(SceneManager.sceneId, 10991, 49909) or Migrant.IsArenaScene(SceneManager.sceneId) and self.activityInfo.winCount > 0 then
        activityText = string.Concat(activityText, self.activityInfo.winCount, string.Get(30161)); --XX勝
      end

    --NPC挑戰擂台
    elseif self.activityKind == ERoleActivityInfo.NpcChallenge then
      if Contains(SceneManager.sceneId, 10991) and self.activityInfo > 0 then
        activityText = string.Concat(string.Get(30160), " ", tostring(self.activityInfo - 1), " ", string.Get(30161));
      end

    --軍團戰
    elseif self.activityKind == ERoleActivityInfo.OrgWarFlag then
      if self.activityInfo.state == 0 then
        activityText = string.Concat(string.Get(20644), " : ", string.Get(20001), "\n0 : 0");
      elseif self.activityInfo.state == 1 then
        activityText = string.Concat(string.Get(20644), " : ", math.ceil(self.activityInfo.time - CGTimer.time), " ", string.Get(40145), "\n", self.activityInfo.leftCount, " : ", self.activityInfo.rightCount);

        if self.activityInfo.time >= CGTimer.time + 1 then
          CGTimer.DoFunctionDelay(1, function() self:UpdateViewActivity() end);
        end
      elseif self.activityInfo.state == 2 then
        activityText = string.Concat(string.Get(21806), "\n", self.activityInfo.leftCount, " : ", self.activityInfo.rightCount);
      end

    --生死鬥
    elseif self.activityKind == ERoleActivityInfo.DeathMatch then
      if Contains(SceneManager.sceneId, 49952) and self.activityInfo.hp ~= nil then
        activityText = string.Concat("+", self.activityInfo.hp);
      end
    end
  end

  if not string.IsNullOrEmpty(activityText) then
    self.text_Activity.text = activityText;
    self.text_Activity.gameObject:SetActive(true);
  else
    self.text_Activity.gameObject:SetActive(false);
  end
end

function RoleController:UpdateViewOrganization(orgId)
  if self.gameObject == nil then return end

  local name = "";
  local ensign = nil;
  local color = Color.Orange;

  if orgId == nil then
    if Contains(self.kind, EHuman.Player, EHuman.Players, EHuman.GuardNpc) then
      orgId = self.data.orgId;
    elseif self.kind == EHuman.MapNpc then
      local cityId = City.GetCityId(self.npcId, ECityScene.MapId);
      if City.cities[cityId] ~= nil then
        orgId = City.cities[cityId].orgId;
      end
    elseif self.kind == EHuman.Duplicate and self.data ~= nil then
      orgId = self.data.orgId;
    end
  end

  if orgId ~= nil then
    name = Organization.GetOrgName(orgId);
    ensign = Organization.GetEnsign(orgId);
  end
  
  --城戰中不顯示團名
  if City.cityId ~= 0 then
    --[[
    if City.GetCamp(orgId) == ECamp.Attack then
      color = Color.Attack;
    else
      color = Color.Defend;
    end
    --]]
    name = "";
  end

  self.text_Organization.text = name;
  self.text_Organization.gameObject:SetActive(not string.IsNullOrEmpty(name));
  LuaHelper.SetColor(self.text_Organization, color);
  
  if ensign ~= nil then
    self.rawImage_Ensign.texture = ensign;
    self.rawImage_Ensign.gameObject:SetActive(true);

    if string.IsNullOrEmpty(name) then
      self.rawImage_Ensign.rectTransform:SetParent(self.text_Organization.transform.parent);
      self.rawImage_Ensign.rectTransform.localScale = Vector3.one;
      self.rawImage_Ensign.rectTransform:SetSiblingIndex(3);
    else
      self.rawImage_Ensign.rectTransform:SetParent(self.text_Organization.transform);
      self.rawImage_Ensign.rectTransform.anchorMin = Vector2.New(0, 0);
      self.rawImage_Ensign.rectTransform.anchorMax = Vector2.New(0, 0);
      self.rawImage_Ensign.rectTransform.anchoredPosition = Vector2.New(-2, 0);
      self.rawImage_Ensign.rectTransform.localScale = Vector3.one;
    end
  else
    self.rawImage_Ensign.texture = nil;
    self.rawImage_Ensign.gameObject:SetActive(false);
  end
end

function RoleController:UpdateViewTeam()
  if self.gameObject == nil then return end

  local active = false;
  if Contains(self.kind, EHuman.Player, EHuman.Players) then
    if Team.IsLeader(self.index) then
      self.image_TeamState.sprite = UI.GetSprite("com035");
      active = true;
    elseif Team.IsAdviser(self.index) then
      self.image_TeamState.sprite = UI.GetSprite("com034");
      active = true;
    end
  elseif self.kind == EHuman.Duplicate and self.data ~= nil then
    if self.data.teamState == ETeamState.Leader then
      self.image_TeamState.sprite = UI.GetSprite("com035");
      active = true;
    elseif self.data.teamState == ETeamState.Adviser then
      self.image_TeamState.sprite = UI.GetSprite("com034");
      active = true;
    end
  end

  self.image_TeamState.gameObject:SetActive(active);

  if active then
    if self.slider_Hp.gameObject.activeSelf then
      self.image_TeamState.rectTransform:SetParent(self.slider_Hp.transform);
      self.image_TeamState.rectTransform.anchorMin = Vector2.New(0, 0);
      self.image_TeamState.rectTransform.anchorMax = Vector2.New(0, 0);
      self.image_TeamState.rectTransform.localScale = Vector3.one * 0.63;
    
      if self.slider_Sp.gameObject.activeSelf then
        self.image_TeamState.rectTransform.anchoredPosition = Vector2.New(26, -12.5);
      else
        self.image_TeamState.rectTransform.anchoredPosition = Vector2.New(26, -8.5);
      end
    else
      self.image_TeamState.rectTransform:SetParent(self.slider_Hp.transform.parent);
      self.image_TeamState.rectTransform.anchorMin = Vector2.New(0.5, 0.5);
      self.image_TeamState.rectTransform.anchorMax = Vector2.New(0.5, 0.5);
      self.image_TeamState.rectTransform.localScale = Vector3.one;
      self.image_TeamState.rectTransform:SetSiblingIndex(0);
    end
  end
end

function RoleController.EndOfLineA()
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


function RoleController.EndOfLineB()
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

function RoleController.EndOfLineC()
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

function RoleController.EndOfLineD()
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

function RoleController:UpdateViewShadow(shadowKind)
  if self.gameObject == nil then return end

  if not Setting.CheckShowBody(self) then
    self.jmpDrawer_Shadow:Disable();
    return;
  end

  self.rawImage_Shadow.enabled = false;

  if shadowKind == nil then
    if npcDatas[self.npcId] ~= nil then
      self.shadowKind = npcDatas[self.npcId].shadowKind;
    elseif npcDatas[self.horseNpcId] ~= nil then
      self.shadowKind = npcDatas[self.horseNpcId].shadowKind;
    elseif self.data ~= nil and self.data.guardNpc ~= nil and Contains(self.data.guardNpc.data.kind, EGuard.Horse, EGuard.HitCar, EGuard.KnifeCar, EGuard.WatchTower, EGuard.WellHurdle) then
      self.shadowKind = EShadow.None;
    else
      self.shadowKind = EShadow.Human;
    end
  else
    self.shadowKind = shadowKind;
  end

  if self.shadowKind ~= EShadow.None then
    self.jmpDrawer_Shadow:DrawSpecial(UniversalJmp.GetShadow(self.shadowKind));
  else
    self.jmpDrawer_Shadow:Disable();
  end
  
  self:UpdateViewHeight();
end

function RoleController:UpdateViewRide()
  if self.gameObject == nil then return end
  if not Contains(self.kind, EHuman.Player, EHuman.Players) then return end

  if not Setting.CheckShowBody(self) then
    self.jmpDrawer_Horse:Disable();
    self.jmpDrawer_HorseMask:Disable();
    return;
  end

  if npcDatas[self.npcId] == nil and mountsDatas[self.horseNpcId] ~= nil and npcDatas[self.horseNpcId] ~= nil then
    self.jmpDrawer_Horse:GenerateAndDraw(npcDatas[self.horseNpcId]:GetAtlasParams(unpack(Role.followActions)));
    self.jmpDrawer_Horse.transform.localScale = Vector3.one * mountsDatas[self.horseNpcId].scale;
    self.jmpDrawer_HorseMask:GenerateAndDraw(npcDatas[self.horseNpcId]:GetMaskAtlasParams(unpack(Role.followActions)));
    self.jmpDrawer_HorseMask.transform.localScale = Vector3.one * mountsDatas[self.horseNpcId].scale;
  else
    self.jmpDrawer_Horse:Disable();
    self.jmpDrawer_Horse.transform.localScale = Vector3.one;
    self.jmpDrawer_HorseMask:Disable();
    self.jmpDrawer_HorseMask.transform.localScale = Vector3.one;

    self:UpdateViewShadow();
    self:RestartAnimation();
  end
end

function RoleController:UpdateViewJMP(copyRole)
  if self.gameObject == nil then return end

  if not Setting.CheckShowBody(self) then
    self.jmpDrawer_Body:Disable();

    if self.bath ~= nil then
      if self.bath.texture ~= nil then
        TexturePool.Recycle(self.bath.texture);
        self.bath.texture = nil;
      end
      
      self.bath = nil;
    end
    
    return;
  end

  if not self.jmpDrawer_Body.active then
    self.animationFrame = math.random(0, 3);
  end
  
  if npcDatas[self.npcId] ~= nil then
    if City.cityId ~= 0 and self.kind == EHuman.GuardNpc and table.Contains(City.weaponNpcId, self.npcId) then
      self.jmpDrawer_Body.luaListener();
    else
      if Contains(self.kind, EHuman.FollowNpc, EHuman.CartNpc) then
        self.jmpDrawer_Body:GenerateAndDraw2(npcDatas[self.npcId]:GetAtlasParams(unpack(self.actions)));
      else
        self.jmpDrawer_Body:GenerateAndDraw(npcDatas[self.npcId]:GetAtlasParams(unpack(self.actions)));
      end
    end
  elseif City.cityId ~= 0 and Contains(self.kind, EHuman.Players) then
    self.jmpDrawer_Body.luaListener();
  else
    if copyRole ~= nil then
      if copyRole.data ~= nil and copyRole.data.GetAtlasParams ~= nil then
        self.jmpDrawer_Body:GenerateAndDraw(copyRole.data:GetAtlasParams(self.titleId, unpack(self.actions)));
      end
    else
      if self.data ~= nil and self.data.GetAtlasParams ~= nil then
        if Contains(self.kind, EHuman.Player, EHuman.Duplicate) then
          self.jmpDrawer_Body:GenerateAndDraw(self.data:GetAtlasParams(self.titleId, unpack(self.actions)));
        else
          self.jmpDrawer_Body:GenerateAndDraw2(self.data:GetAtlasParams(self.titleId, unpack(self.actions)));
        end

        --洗澡
        if Contains(SceneManager.sceneId, 57401, 60441, 61441, 49985) or HouseManager.IsInHouse() then
          local bodyJmp = RolePicManager.GetJMP(ERolePart.Body, self.data:GetPicId(ERolePart.Body, true), ERolePose.Bath, ERolePose.TowelBath);
          local hairJmp = RolePicManager.GetJMP(ERolePart.Hair, self.data:GetPicId(ERolePart.Hair, true), ERolePose.Bath, ERolePose.TowelBath);
          local jmp = Jmp.Combine(bodyJmp, hairJmp);
          local bathColorTable = TSColor.Copy(jmp.colorTable, nil);

          bathColorTable = TSColor.Tint(bathColorTable, jmp.colorTable, EColorPart.Hair, self.data:GetColorTint(EColorPart.Hair, true));
          bathColorTable = TSColor.Tint(bathColorTable, jmp.colorTable, EColorPart.Skin, self.data:GetColorTint(EColorPart.Skin, true));

          JmpAtlasMaker.GenerateAtlas(
            jmp,
            bathColorTable,
            function(width, height, format, rawData, atlasRects)
              if self.bath == nil then
                self.bath = {};
              end

              self.bath.width = jmp.width;
              self.bath.height = jmp.height;

              self.bath.texture = TexturePool.Get(self.bath.texture, width, height, format);
              self.bath.texture:LoadRawTextureData(rawData);
              self.bath.texture:Apply();
        
              self.bath.rects = atlasRects;

              if self.onTheSea then
                self:UpdateViewTexture();
              end
            end,
            ERolePose.Bath,
            ERolePose.TowelBath
          );
        end
      end
    end
  end
end

function RoleController:UpdateViewTitle()
  if self.gameObject == nil then return end

  self.rawImage_TitleBG.gameObject:SetActive(false);

  if self.bodyEffect ~= nil then
    self.bodyEffect:Stop();
  end

  --攻城戰中不顯示稱號
  if City.cityId ~= 0 then return end

  local titleData = titleDatas[self.titleId];
  if titleData == nil then return end

  if titleData.hudTexture ~= 0 then
    TextureManager.SetPng(ETextureUseType.None, string.format("Title_%03d", titleData.hudTexture), self.rawImage_TitleBG);

    self.text_Title.text = string.Get(titleData.hudText);
    self.gradient_Title.colorTop = titleData.hudTopColor;
    self.gradient_Title.colorBottom = titleData.hudTopColor;
    self.outline_Title.effectColor = titleData.hudOutlineColor;

    self.rawImage_TitleBG.gameObject:SetActive(true);
  end

  if not Setting.CheckShowBody(self) then
    return;
  end

  if Setting.client.DisplayMode == 1 then
    if titleData.effectId ~= 0 then
      self.bodyEffect = EffectLight.New(titleData.effectId, titleData.effectInterval, titleData.effectStartFrame, titleData.effectEndFrame, titleData.effectTotalFrame, EEffectLightTracer.Child, 0, 0, 32);
      self.bodyEffect.rectTransform:SetParent(self.transform);
      self.bodyEffect.rectTransform.localPosition = Vector3.New(-self.bodyEffect.width * 0.5 * titleData.effectScale, self.bodyEffect.height * titleData.effectScale + titleData.effectOffset);
      self.bodyEffect.rectTransform.localScale = Vector3.one * titleData.effectScale;
    end
  end
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

function RoleController:UpdateViewTexture()
  if self.gameObject == nil then return end

  self.rawImage_Shadow.enabled = false;
  self.rawImage_Horse.enabled = false;
  self.rawImage_Body.enabled = false;
  self.rawImage_HorseMask.enabled = false;

  if City.cityId ~= 0 and self.kind == EHuman.GuardNpc and table.Contains(City.weaponNpcId, self.npcId) then
    self.jmpDrawer_Body:DrawSpecial(UniversalJmp.GetCityWeapon(self.npcId, City.GetCamp(self.data.orgId)));
  elseif Contains(self.kind, EHuman.Player, EHuman.Players, EHuman.ForeignNpc) then
    if self.war ~= EWar.None then
      self.jmpDrawer_Body:DrawSpecial(UniversalJmp.GetFight());
    elseif self.onTheSea then
      if Contains(SceneManager.sceneId, 57401, 60441, 61441, 49985) or HouseManager.IsInHouse() then
        if self.bath ~= nil then
          self.jmpDrawer_Body:DrawSpecial(self.bath.texture, self.bath.width, self.bath.height, self.bath.rects);
        end
      else
        self.jmpDrawer_Body:DrawSpecial(UniversalJmp.GetShip());
      end
    elseif City.cityId ~= 0 and Contains(self.kind, EHuman.Players) then
      self.jmpDrawer_Body:DrawSpecial(UniversalJmp.GetCityPlayer(City.GetCamp(self.data.orgId)));
    else
      self.jmpDrawer_Body:DrawDefault();
    end
  else
    self.jmpDrawer_Body:DrawDefault();
  end
  
  self:UpdateViewHeight();
  self:RestartAnimation();
end

function RoleController:UpdateViewHeight()
  if self.gameObject == nil then return end

  local offsetX = 0;
  local offsetY = 0;
  local rideOffset = 0;
  local hudOffset = 0;

  self.height = self.jmpDrawer_Body:GetHeight(ERolePose.Stand + 4);
  
  if Contains(self.kind, EHuman.Player, EHuman.Players, EHuman.ForeignNpc) and self.war ~= EWar.None then
    --戰鬥中
    self.jmpDrawer_Body.offsetX = 0;
    self.jmpDrawer_Body.offsetY = 32;

  elseif Contains(self.kind, EHuman.Player, EHuman.Players, EHuman.ForeignNpc) and self.onTheSea then
    if Contains(SceneManager.sceneId, 57401, 60441, 61441, 49985) or HouseManager.IsInHouse() then
      --泡澡
      self.jmpDrawer_Body.offsetX = 0;
      self.jmpDrawer_Body.offsetY = 22;
    else
      --坐船
      self.jmpDrawer_Body.offsetX = 0;
      self.jmpDrawer_Body.offsetY = 32;
    end

  elseif npcDatas[self.npcId] ~= nil then
    --NPC
    offsetX, offsetY, rideOffset, hudOffset = npcDatas[self.npcId]:GetOffset();

    self.jmpDrawer_Body.offsetX = offsetX;
    self.jmpDrawer_Body.offsetY = 32 + offsetY;
    
  elseif npcDatas[self.horseNpcId] ~= nil then
    --騎乘中
    offsetX, offsetY, rideOffset, hudOffset = npcDatas[self.horseNpcId]:GetOffset();

    self.jmpDrawer_Horse.offsetX = offsetX;
    self.jmpDrawer_Horse.offsetY = 32 + offsetY;

    self.jmpDrawer_HorseMask.offsetX = offsetX;
    self.jmpDrawer_HorseMask.offsetY = 32 + offsetY;

    self.jmpDrawer_Body.offsetX = 0;
    self.jmpDrawer_Body.offsetY = 32 + rideOffset;

    --身高+騎乘位移+動作位移
    hudOffset = rideOffset + 10;

  elseif self.data ~= nil and self.data.guardNpc ~= nil and Contains(self.data.guardNpc.data.kind, EGuard.Horse, EGuard.KnifeCar, EGuard.WatchTower, EGuard.WellHurdle) then
    --駐紮中
    offsetX, offsetY, rideOffset, hudOffset = npcDatas[self.data.guardNpc.npcId]:GetOffset();

    self.jmpDrawer_Body.offsetX = 0;
    self.jmpDrawer_Body.offsetY = 32 + rideOffset;

    --身高+騎乘位移
    hudOffset = rideOffset;

  else
    self.jmpDrawer_Body.offsetX = 0;
    self.jmpDrawer_Body.offsetY = 32;
  end

  self.jmpDrawer_Shadow.offsetX = offsetX;
  self.jmpDrawer_Shadow.offsetY = UniversalJmp.GetShadowOffsetY(self.shadowKind);
  
  if npcDatas[self.npcId] ~= nil and Contains(npcDatas[self.npcId].kind, ENpc.CombineHuge) then
    self.hudObject.transform.localPosition = Vector3.New(0, 128, 0);
  else
    self.hudObject.transform.localPosition = Vector3.New(offsetX, self.height + hudOffset, 0);
  end
end

function RoleController:UpdateViewGhost()
  if self.gameObject == nil then return end

  --城戰中不顯示
  if City.cityId ~= 0 then
    self.rawImage_Ghost.gameObject:SetActive(false);
    return;
  end

  local textureName = "";

  if Contains(self.kind, EHuman.Player, EHuman.Players, EHuman.Duplicate) then
    if self.data ~= nil then
      if self.data.poorMission ~= nil and self.data.poorMission > 0 then
        textureName = Role.poorTexture[math.floor(self.direction * 0.5)];
        self.text_Ghost.text = string.Concat(string.Get(49129), ":", self.data.poorMission);
        
      elseif self.data.godMission ~= nil then
        if self.data.godMission > 0 then
          if self.data.elfNo ~= nil and self.data.elfNo > 0 then
            
            textureName = Role.GetElfPic(self.data.elfId, math.floor(self.direction * 0.5));
            self.text_Ghost.text = string.Concat(string.Get(49130), ":", self.data.godMission);  --elf
          else
            textureName = Role.godTexture[math.floor(self.direction * 0.5)];
            self.text_Ghost.text = string.Concat(string.Get(49130), ":", self.data.godMission);
          end
        else
          textureName = "";
          self.text_Ghost.text = "";
        end
      end
    end
  end

  if not string.IsNullOrEmpty(textureName) then
    TextureManager.SetPng(ETextureUseType.None, textureName, self.rawImage_Ghost);
    self.rawImage_Ghost.rectTransform.sizeDelta = Vector2.one * self.rawImage_Ghost.texture.width;
    if self.data.elfLocation == 1 then --肩上
      self.rawImage_Ghost.rectTransform.anchoredPosition = Vector2.New(Role.ghostTexturePosition[math.floor(self.direction * 0.5)].x, 75);
    else
      self.rawImage_Ghost.rectTransform.anchoredPosition = Vector2.New(Role.ghostTexturePosition[math.floor(self.direction * 0.5)].x, 0);
    end
    self.rawImage_Ghost.enabled = true;
    self.rawImage_Ghost.gameObject:SetActive(true);
  else
    self.rawImage_Ghost.texture = nil;
    self.rawImage_Ghost.enabled = false;
    self.rawImage_Ghost.gameObject:SetActive(false);
  end
end

function RoleController:UpdateHUDHpSp(showHp, showSp)
  if self.gameObject == nil then return end
  
  local firstShow = not self.slider_Hp.gameObject.activeSelf and showHp;

  self.slider_Hp.gameObject:SetActive(showHp);
  if showHp then
    self.slider_Hp.maxValue = self:GetAttribute(EAttribute.MaxHp);
    self.slider_Hp.value = self:GetAttribute(EAttribute.Hp);
  end

  self.slider_Sp.gameObject:SetActive(showSp);
  if showSp then
    self.slider_Sp.maxValue = self:GetAttribute(EAttribute.MaxSp);
    self.slider_Sp.value = self:GetAttribute(EAttribute.Sp);
  end

  if firstShow then
    if self.careerController == nil then
      self.careerController = UICareerController.New(self.slider_Hp.gameObject.transform);      
      self.careerController.rectTransform.localScale = Vector3.one * 0.25;
      self.careerController.rectTransform.anchorMin = Vector2.New(0, 0);
      self.careerController.rectTransform.anchorMax = Vector2.New(0, 0);
    end
    self.careerController:SetCareer(self:GetAttribute(EAttribute.Turn), self:GetAttribute(EAttribute.Element), self:GetAttribute(EAttribute.Career), npcDatas[self.npcId] ~= nil, self:GetAttribute(EAttribute.Turn3Element));

    self.image_UpgradeLv.rectTransform.anchoredPosition = Vector3.one;
    self.image_UpgradeLv.rectTransform.anchorMin = Vector2.New(0, 0);
    self.image_UpgradeLv.rectTransform.anchorMax = Vector2.New(0, 0);
    self:SetUpgradeLvShow();

    if showSp then
      self.careerController.rectTransform.anchoredPosition = Vector2.New(9, -13);
      self.image_UpgradeLv.rectTransform.anchoredPosition = Vector2.New(29, -13);
    else
      self.careerController.rectTransform.anchoredPosition = Vector2.New(9, -9);
      self.image_UpgradeLv.rectTransform.anchoredPosition = Vector2.New(29, -9);
    end

    self:UpdateViewTeam();
  end
end

function RoleController.Meanless1()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end


function RoleController.Meanless2()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function RoleController:UpdateViewVisible()
  if self.gameObject == nil then return end

  local bodyVisible = self.visible ~= ERoleVisible.Hide and self.visible ~= ERoleVisible.TimeHide;
  local hudVisible = bodyVisible;

  if not Setting.CheckShowBody(self) then
    bodyVisible = false;
  end

  if not Setting.CheckShowHUD(self) then
    hudVisible = false;
  end
  
  if Contains(self.kind, EHuman.Player, EHuman.Players) then
    self.text_Organization.gameObject:SetActive(not string.IsNullOrEmpty(self.text_Organization.text) and Setting.CheckShowOrg(self));

    if Team.IsLeader(self.index) then
    elseif Team.IsMember(self.index) then
      local leader = Team.GetLeader(self.index);

      if leader ~= nil then
        if leader.war ~= EWar.None then
          bodyVisible = false;
          hudVisible = false;
        end

        if leader.onTheSea then
          bodyVisible = false;
          hudVisible = false;
        end
      end
    end

  elseif self.kind == EHuman.MapNpc then
    if Contains(npcDatas[self.npcId].kind, 15) then
      hudVisible = false;
    end
  elseif self.kind == EHuman.FollowNpc then
    if self.war ~= EWar.None then
      bodyVisible = false;
      hudVisible = false;
    end

    if self.onTheSea then
      bodyVisible = false;
      hudVisible = false;
    end

    if self.data.beenRide then
      hudVisible = false;
    end

    if self.data.master == nil or (self.data.master.horseNpcId ~= 0 and Cart.GetCartNpcId(self.data.master:GetAttribute(EAttribute.Turn), self.data.master:GetAttribute(EAttribute.Career)) ~= 0) then
      bodyVisible = false;
      hudVisible = false;
    end

  elseif self.kind == EHuman.CartNpc then
    if self.war ~= EWar.None then
      bodyVisible = false;
      hudVisible = false;
    end

    if self.onTheSea then
      bodyVisible = false;
      hudVisible = false;
    end

    local master = Role.players[self.index];
    if master == nil or master.horseNpcId == 0 then
      bodyVisible = false;
      hudVisible = false;
    end

  elseif self.kind == EHuman.GuardNpc then
    if self.war ~= EWar.None and self.data.master ~= nil then
      bodyVisible = false;
      hudVisible = false;
    end

    if self.onTheSea and self.data.master ~= nil then
      bodyVisible = false;
      hudVisible = false;
    end

    if self.data.master ~= nil then
      hudVisible = false;
    end

    if Contains(self.data.kind, EGuard.WoodHurdle, EGuard.CityGate, EGuard.WoodGate, EGuard.CityWall, EGuard.WoodWall) then
      hudVisible = false
    end
  end
  
  if not bodyVisible and not hudVisible then
    self:OnPlayerExit();
    self.image_MiniMap.gameObject:SetActive(false);
  else
    self.image_MiniMap.gameObject:SetActive(true);
  end

  --[[
  if not bodyVisible then
    if Role.target == self then
      TargetManager.CancelTarget();
    end
  end
  --]]

  self.bodyObject:SetActive(bodyVisible);
  self.hudVisibleObject:SetActive(hudVisible);

  if HouseManager.IsInHouse() then
    if self.visible == ERoleVisible.Hide then
      if self.bodyEffect ~= nil then
        self.bodyEffect:Stop();
      end
    elseif self.visible == ERoleVisible.Visible then
      self:UpdateViewTitle();
    end
  end
end

function RoleController.Meanless3()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function RoleController.Meanless4()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function RoleController.Meanless5()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end
--Material
function RoleController:SetOutline(color)
  if self.gameObject == nil then return end

  if color == Color.Alpha then
    self.material:SetFloat("_Outline", 0);
  else
    self.material:SetColor("_Color", color);
    self.material:SetFloat("_Outline", 1);
  end
end

function RoleController:SetTextureColor(color)
  if self.gameObject == nil then return end

  self.material:SetColor("_TexColor", color);  
end

--Interactive
function RoleController:CheckClick(position)
  if self.raycastMask_Body == nil then return false end

  return self.raycastMask_Body:IsRaycastLocationValid(position, Scene.sceneCamera);
end

function RoleController:GG()
  if Role.player == nil then return end
  
  MarkManager.StopNavigation();
  Role.SetMoveTarget(self);
end

function RoleController.OnClick(uiEvent)
  if Role.player == nil then return end
  if uiEvent.eventData.pointerId == -2 then
    if LuaHelper.IsStandalone or LuaHelper.IsAndroidPlatform then
      return
    end
  end

  local self = uiEvent.parameter;
  
  MarkManager.StopNavigation();
  Role.SetMoveTarget(self);
end

function RoleController.MeanlessA()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function RoleController.MeanlessB()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function RoleController.MeanlessC()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end


function RoleController:OnPlayerEnter()
  if self.isTrigged then return end
  logWarn(string.Concat("Player Enter !! index = ", self.index));
  self.isTrigged = true;

  if Role.player == nil then return end

  if self.kind == EHuman.MapNpc then
    if self.visible ~= ERoleVisible.TimeHide and self.visible ~= ERoleVisible.Hide then
      if self.data.eventNpcData.SVerTraceInfo == 0 then
        if self.data.eventNpcData.eventCount > 0 then
          --if self.bumpOldTime + 6 > CGTimer.time then
          --[[
          --紀錄被按下的那一個Door No. 目前暫時是用Client這邊的Data
          C_SendMapNPCMsg.EveNo = NowRunningEvE;  --目前暫時是用Client這邊的Data
          C_SendMapNPCMsg.Idx = self.index;  --目前暫時是用Client這邊的Data設定,I=1為第一個NPC
          C_SendMapNPCMsg.EventHappenKind = 2; --觸發的是Click事件

          NPCMousedownNO = C_SendMapNPCMsg.Idx; --Client 備份自己的Data
          WhoRunning = NPCArray[NPCMousedownNO]; --Client 備份自己的Data

          DoingEvent = True;
          ]]--
          if EventManager.OnNpcEvent(EEventTrigger.BumpNpc, self.data.eventNpcData) then return end
        end
      end
    end
  end

  TargetManager.Add(self);
end

function RoleController:OnPlayerExit()
  if not self.isTrigged then return end
  logWarn(string.Concat("Player Exit !! index = ", self.index));
  self.isTrigged = false;

  TargetManager.Remove(self);
end
  
function RoleController:CheckInteractive(kind)
  local active = RoleController.interactiveFunctions[kind][self.kind] ~= nil;
  local color = Color.White;

  if kind == EInteractive.Trig then
    if self.kind == EHuman.Players then
      if City.cityId == 0 then
        active = false;
      end
    end

    --攻城戰觀戰中
    if Role.player.data.isWatching then
      active = false;
    end

    if not Function.CheckShow(242) then
      active = false;
    end

  elseif kind == EInteractive.PK then
    if not SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.ForcePK) then
      if self.kind == EHuman.MapNpc then
        if Contains(npcDatas[self.npcId].kind, ENpc.Chest, ENpc.Billboard, ENpc.City) then
          active = false;
        end

        if SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.NoPKNPC) then
          active = false;
        end
      elseif self.kind == EHuman.Players then
        if SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.NoPKPlayer) then
          active = false;
        end
      end

      if not Function.CheckShow(239) then
        active = false;
      end
    end

    --攻城戰觀戰中
    if Role.player.data.isWatching then
      active = false;
    end
    
  elseif kind == EInteractive.PlayOne then
    if self.kind == EHuman.MapNpc then
      if Contains(npcDatas[self.npcId].kind, ENpc.Chest, ENpc.Billboard, ENpc.City) then
        active = false;
      end
    end

    if SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.NoJoinFight) then
      active = false;
    end
    
    if Role.target.war == EWar.None then
      color = Color.Gray;
    end

    if not Function.CheckShow(240) then
      active = false;
    end

    --攻城戰觀戰中
    if Role.player.data.isWatching then
      active = false;
    end

  elseif kind == EInteractive.Watch then
    if Role.target.war == EWar.None then
      color = Color.Gray;
    end

    if not Function.CheckShow(241) then
      active = false;
    end

  elseif kind == EInteractive.Friend then
    if not MarkManager.GetMissionFlag(11804) then
      active = false;
    end

    if not Function.CheckShow(238) then
      active = false;
    end

    --攻城戰觀戰中
    if Role.player.data.isWatching then
      active = false;
    end

  elseif kind == EInteractive.Team then
    if not MarkManager.GetMissionFlag(11804) then
      active = false;
    end

    if not Function.CheckShow(237) then
      active = false;
    end

    if SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.NoTeam) then
      active = false;
    end

    --攻城戰觀戰中
    if Role.player.data.isWatching then
      active = false;
    end

  elseif kind == EInteractive.Organization then
    if not Organization.IsChief(Role.playerId) and not Organization.IsSubChief(Role.playerId) then
      active = false;
    end

    if not Function.CheckShow(228) then
      active = false;
    end

    --攻城戰觀戰中
    if Role.player.data.isWatching then
      active = false;
    end
    
  elseif kind == EInteractive.UseItem then
    --攻城戰觀戰中
    if Role.player.data.isWatching then
      active = false;
    end

    active = false;

  elseif kind == EInteractive.UseSkill then
    --攻城戰觀戰中
    if Role.player.data.isWatching then
      active = false;
    end

    active = false;

  elseif kind == EInteractive.TradeItem then
    if SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.NoTrade) then
      active = false;
    end

    --攻城戰觀戰中
    if Role.player.data.isWatching then
      active = false;
    end

    active = false; --手持版不可交易

  elseif kind == EInteractive.TradeNpc then
    if SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.NoTradePet) then
      active = false;
    end

    --攻城戰觀戰中
    if Role.player.data.isWatching then
      active = false;
    end

    active = false; --手持版不可交易

  elseif kind == EInteractive.Whisper then
    if not Function.CheckShow(242) then
      active = false;
    end
  end

  return active, color;
end

function RoleController:OnInteractive(kind)
  if RoleController.interactiveFunctions[kind][self.kind] == nil then return end

  RoleController.interactiveFunctions[kind][self.kind](self);
end

function RoleController.MeanlessD()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function RoleController.MeanlessE()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function RoleController.MeanlessF()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

RoleController.interactiveFunctions = {}
for k, v in pairs(EInteractive) do
  RoleController.interactiveFunctions[v] = {}
end

RoleController.interactiveFunctions[EInteractive.Trig][EHuman.Players] = function(self)
  if City.cityId == 0 then return end

  --攻城戰觀戰中
  if Role.player.data.isWatching then return end

  if self.war == EWar.Guest then
    ShowCenterMessage(string.Get(50086));
    return;
  end

  if Role.IsGM(self.index) then
    ShowCenterMessage(string.Get(40034));
    return;
  end

  if City.GetCamp(self.data.orgId) == City.GetCamp(Organization.Id) then return end

  --組隊中目標改為隊長
  local leader = Team.GetLeader(self.index);
  if leader == Role.player then
    ShowCenterMessage(string.Get(40035));
    return;
  end

  --C:011-008 <攻城戰PK> +戰鬥類型(1) +玩家ID(8) +索引(1)
  sendBuffer:Clear()
  sendBuffer:WriteByte(EWar.CityPK);
  sendBuffer:WriteInt64(leader.index);
  sendBuffer:WriteByte(0);
  Network.Send(11, 8, sendBuffer);
end

RoleController.interactiveFunctions[EInteractive.Trig][EHuman.MapNpc] = function(self)
  --攻城戰觀戰中
  if Role.player.data.isWatching then return end

  --大地圖Npc
  Role.player:Meditation(false);

  --執行事件
  EventManager.OnNpcEvent(EEventTrigger.ClickNpc, self.data.eventNpcData);
end

RoleController.interactiveFunctions[EInteractive.Trig][EHuman.GuardNpc] = function(self)
  if self.data.status == EGuardStatus.Damage then return end

  --攻城戰觀戰中
  if Role.player.data.isWatching then return end

  if self.data.master == nil then
    if Team.IsMember(Role.playerId) and not Team.IsLeader(Role.playerId) then
      return;
    end
    
    local playerCamp = City.GetCamp(Organization.Id);

    if playerCamp == ECamp.Defend then
      if self.data.kind == EGuard.CityGate then
        if Role.player.data.guardNpc ~= nil then
          if not Contains(Role.player.data.guardNpc.kind, EGuard.Horse, EGuard.HitCar, EGuard.KnifeCar, EGuard.ArrowCar, EGuard.RockCar ,EGuard.WellHurdle) then
            return;
          end
        end
        
        ShowCheckMessage(
          function(result)
            if result then
              --C:041-001 <指定駐紮NPC> +索引(1)
              sendBuffer:Clear();
              sendBuffer:WriteByte(self.index);
              Network.Send(41, 1, sendBuffer);
            end
          end,
          string.Get(50118),
          Role.player
        );

        return;

      elseif self.data.kind == EGuard.WoodGate then
        if Role.player.data.guardNpc ~= nil then
          ShowCenterMessage(string.Get(50115));
          return;
        end

        ShowCheckMessage(
          function(result)
            if result then
              --C:041-001 <指定駐紮NPC> +索引(1)
              sendBuffer:Clear();
              sendBuffer:WriteByte(self.index);
              Network.Send(41, 1, sendBuffer);
            end
          end,
          string.Get(50113),
          Role.player
        );

        return;

      elseif Contains(self.data.kind, EGuard.CityWall, EGuard.WoodWall) then
        return;
      end
    end

    if Role.player.data.guardNpc ~= nil and Organization.Id == self.data.orgId then
      ShowCenterMessage(string.Get(50115));
      return;
    end

    if Organization.Id == 0 then
      ShowCenterMessage(string.Get(50117));
      return;
    end

    if self.war ~= EWar.None then
      ShowCenterMessage(string.Get(40249));
      return;
    end

    if Organization.Id == self.data.orgId then
      if Contains(self.data.kind, EGuard.WoodHurdle, EGuard.CityWall, EGuard.WoodWall) then
        return;
      end

      local text = "";
      if Contains(self.data.kind, EGuard.Horse, EGuard.HitCar, EGuard.KnifeCar, EGuard.ArrowCar, EGuard.RockCar, EGuard.WellHurdle) then
        text = string.Get(50111);
      else
        text = string.Get(50113);
      end

      ShowCheckMessage(
        function(result)
          if result then
            --C:041-001 <指定駐紮NPC> +索引(1)
            sendBuffer:Clear();
            sendBuffer:WriteByte(self.index);
            Network.Send(41, 1, sendBuffer);
          end
        end,
        text,
        Role.player
      );
    else
      if playerCamp == City.GetCamp(self.data.orgId) then
        ShowCenterMessage(string.Get(50116));
        return;
      end

      --C:011-008 <攻城戰PK> +戰鬥類型(1) +玩家ID(8) +索引(1)
      sendBuffer:Clear()
      sendBuffer:WriteByte(EWar.PKGarNpc);
      sendBuffer:WriteInt64(self.npcId);
      sendBuffer:WriteByte(self.index);
      Network.Send(11, 8, sendBuffer);
    end
  else
    if self.data.master == Role.player then
      local text = "";
      if Contains(self.data.kind, EGuard.Horse, EGuard.HitCar, EGuard.KnifeCar, EGuard.ArrowCar, EGuard.RockCar, EGuard.WellHurdle) then
        text = string.Get(50112);
      else
        text = string.Get(50114);
      end

      ShowCheckMessage(
        function(result)
          if result then
            --C:041-002 <取消駐紮NPC>
            Network.Send(41, 2);
          end
        end,
        text,
        self
      );
    else
      RoleController.interactiveFunctions[EInteractive.Trig][EHuman.Players](self.data.master);
    end
  end
end

RoleController.interactiveFunctions[EInteractive.Trig][EHuman.FollowNpc] = function(self)
  --攻城戰觀戰中
  if Role.player.data.isWatching then return end

  if self.data.master ~= Role.player then return end
  if npcDatas[self.npcId] == nil then return end

  if Contains(npcDatas[self.npcId].kind, 9, 22) then
    --座騎
    if not Contains(SceneManager.sceneId, 12001, 12002, 12003, 12825) then
      if npcDatas[self.npcId].kind == ENpc.Horse and Role.player.data.skills[14023] == nil then return end
      if npcDatas[self.npcId].kind == ENpc.Elephant and Role.player.data.skills[14034] == nil then return end
    end
    
    if City.GetCityId(SceneManager.sceneId, ECityScene.Fight) ~= 0 then return end

    if self.data.beenRide then
      --[[
      if Role.player:GetAttribute(EAttribute.Turn) >= 1 then
        --WF_CartSelectForm.appear;
      end
      ]]--

      TargetManager.CancelTarget();

      --C:015-005 <下馬>
      Network.Send(15, 5);
    else
      --[[
      --如果已有騎馬就離開
      if Role.player.horse ~= nil then
        ShowCenterMessage(string.Get(50076));
        return;
      end
      ]]--
      
      --場景限制
      if SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.NoRide) then
        ShowCenterMessage(string.Get(71208));
        return;
      end

      --出戰時不可騎
      if Role.fightNpc == self then
        ShowCenterMessage(string.Get(50072));
        return;
      end

      --變身中
      if Role.player.npcId ~= 0 then
        ShowCenterMessage(string.Get(50079));
        return;
      end

      --種魔豆
      if Magic.isMagicBean then
        ShowCenterMessage(string.Get(90001));
        return;
      end

      --[[      

      --烤肉
      if Player.isBBQ then
        ShowCenterMessage(string.Get(90081));
        return;
      end
      ]]--
      
      --CY_RidingMenu.SelIdx = aidx;
      ShowCheckMessage(
        function(result)
          if result then
            TargetManager.CancelTarget();

            --C:015-004 <上馬> +NPCID(2)
            sendBuffer:Clear()
            sendBuffer:WriteUInt16(self.npcId);
            Network.Send(15, 4, sendBuffer);
          end
        end,
        string.Get(50075),
        Role.player
      );
    end
  elseif NpcData.GetBaDoYaoIndex(self.npcId) ~= 0 then
    --快遞
    if Social.deliverNpcId ~= 0 then
      ShowCenterMessage(string.Get(40218), 1.2);
      return;
    end

    if SceneManager.sceneId == 10701 then
      ShowCenterMessage(string.Get(40097), 1.2);
      return;
    end

    if not Social.CheckDeliverScene(SceneManager.sceneId) then
      ShowCenterMessage(string.Get(40389), 1.2);
      return;
    end

    if SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.NoUPS) then
      ShowCenterMessage(string.Get(40389), 1.2);
      return;
    end

    if Migrant.IsGalaxyServer(Network.serverId) then
      ShowCenterMessage(string.Get(40389), 1.2);
      return;
    end

    if self.data.beenRide then
      ShowCenterMessage(string.Concat(string.Get(90160), self.name, string.Get(90161)));
      return;
    end

    UI.Open(UIDeliver, self.npcId);
  end
end

RoleController.interactiveFunctions[EInteractive.Trig][EHuman.CartNpc] = function(self)
  --WF_CartSelectForm.appear;
end

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

RoleController.interactiveFunctions[EInteractive.Trig][EHuman.HouseWarrior] = function(self)
  --logError("RoleController.interactiveFunctions[EInteractive.Trig][EHuman.HouseWarrior]");
end

RoleController.interactiveFunctions[EInteractive.PK][EHuman.Players] = function(self)
  --攻城戰觀戰中
  if Role.player.data.isWatching then return end

  --GM
  if Role.IsGM(self.index) then
    ShowCenterMessage(string.Get(40034));
    return;
  end

  --觀戰中
  if self.war == EWar.Guest then
    ShowCenterMessage(string.Get(50086));
    return;
  end

  --城戰
  if City.cityId ~= 0 then
    local playerCamp = City.GetCamp(Organization.Id);

    --同陣營
    if City.GetCamp(self.data.orgId) == playerCamp then
      if playerCamp == ECamp.Defend then
        if not City.IsOutSide(self.position, City.cityId, ECityLine.DefendCamp) then
          ShowCenterMessage(string.Get(40297));
          return;
        end

        if not City.IsOutSide(Role.player.position, City.cityId, ECityLine.DefendCamp) then
          ShowCenterMessage(string.Get(40335));
          return;
        end
      elseif playerCamp == ECamp.Attack then
        if City.IsOutSide(self.position, City.cityId, ECityLine.AttackCamp) then
          ShowCenterMessage(string.Get(40297));
          return;
        end
        
        if City.IsOutSide(Role.player.position, City.cityId, ECityLine.AttackCamp) then
          ShowCenterMessage(string.Get(40335));
          return;
        end
      end

      --組隊中目標改為隊長
      local leader = Team.GetLeader(self.index);
      if leader == Role.player then
        ShowCenterMessage(string.Get(40035));
        return;
      end

      --C:011-008 <攻城戰PK> +戰鬥類型(1) +玩家ID(8) +索引(1)
      sendBuffer:Clear()
      sendBuffer:WriteByte(EWar.PKAlly);
      sendBuffer:WriteInt64(leader.index);
      sendBuffer:WriteByte(0);
      Network.Send(11, 8, sendBuffer);
    else
      --組隊中目標改為隊長
      local leader = Team.GetLeader(self.index);
      if leader == Role.player then
        ShowCenterMessage(string.Get(40035));
        return;
      end

      --C:011-008 <攻城戰PK> +戰鬥類型(1) +玩家ID(8) +索引(1)
      sendBuffer:Clear()
      sendBuffer:WriteByte(EWar.CityPK);
      sendBuffer:WriteInt64(leader.index);
      sendBuffer:WriteByte(0);
      Network.Send(11, 8, sendBuffer);
    end

  --生存戰場
  elseif Survive.kind == ESurvive.Fight then
    --組隊中目標改為隊長
    local leader = Team.GetLeader(self.index);
    if leader == Role.player then
      ShowCenterMessage(string.Get(40035));
      return;
    end

    --C:011-010 <生存戰場PK> +戰鬥類型(1) +玩家ID(8)
    sendBuffer:Clear()
    sendBuffer:WriteByte(EWar.LifePk);
    sendBuffer:WriteInt64(leader.index);
    Network.Send(11, 10, sendBuffer);
  
  else
    --強制PK場景
    if not SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.ForcePK) then
      --PK開關沒開
      if not Setting.pkEnable then
        ShowCenterMessage(string.Get(20275));
        return;
      end

      --不可PK場景
      if SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.NoPKPlayer) then
        ShowCenterMessage(string.Get(40132));
        return;
      end
    end

    --戰役戰場內
    if Battle.scene ~= EBattleScene.None then
      ShowCenterMessage(string.Get(40132));
      return;
    end

    --戰鬥中
    if self.war ~= EWar.None then
      ShowCenterMessage(string.Get(40067));
      return;
    end

    --無界擂台
    if Migrant.IsGalaxyServer(Network.serverId) then
      ShowCenterMessage(string.Get(40132));
      return;
    end

    --如果玩家正在冥想，先讓玩家做站立動作
    Role.player:Meditation(false);

    --組隊中目標改為隊長
    local leader = Team.GetLeader(self.index);
    if leader == Role.player then
      ShowCenterMessage(string.Get(40035));
      return;
    end

    --C:011-002 進入戰鬥 + WarStyle(1)[2.pk玩家]+對像玩家ID(8)+MNpcIdx(2)
    sendBuffer:Clear()
    sendBuffer:WriteByte(EWar.PkPlayers);
    sendBuffer:WriteInt64(leader.index);
    sendBuffer:WriteUInt16(0);
    Network.Send(11, 2, sendBuffer);
  end
end

RoleController.interactiveFunctions[EInteractive.PK][EHuman.MapNpc] = function(self)
  --攻城戰觀戰中
  if Role.player.data.isWatching then return end

  --不可PK的NPC
  if npcDatas[self.npcId] ~= nil and npcDatas[self.npcId]:CheckLimit(ENpcLimit.PK) then
    ShowCenterMessage(string.Get(40239));
    return;
  end

  --場景條件限制
  if SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.NoPKNPC) then
    ShowCenterMessage(string.Get(40134));
    return;
  end

  --無界擂台
  if Migrant.IsGalaxyServer(Network.serverId) then
    ShowCenterMessage(string.Get(40134));
    return;
  end

  --玩家在戰役戰場內禁止PK
  if Battle.scene ~= EBattleScene.None then
    ShowCenterMessage(string.Get(40134));
    return;
  end

  --如果玩家正在冥想，先讓玩家做站立動作
  Role.player:Meditation(false);

  --C:011-002 進入戰鬥 + WarStyle(1)[3.pk場景Npc]+對像玩家ID(8)+MNpcIdx(2)
  sendBuffer:Clear()
  sendBuffer:WriteByte(EWar.PkMapNpc);
  sendBuffer:WriteInt64(self.npcId);
  sendBuffer:WriteUInt16(self.index);
  Network.Send(11, 2, sendBuffer);
end

RoleController.interactiveFunctions[EInteractive.PK][EHuman.GuardNpc] = function(self)
  --攻城戰觀戰中
  if Role.player.data.isWatching then return end

  if self.war ~= EWar.None then
    return;
  end
  
  --C:011-008 <攻城戰PK> +戰鬥類型(1) +玩家ID(8) +索引(1)
  sendBuffer:Clear()
  sendBuffer:WriteByte(EWar.PKGarNpc);
  sendBuffer:WriteInt64(self.npcId);
  sendBuffer:WriteByte(self.index);
  Network.Send(11, 8, sendBuffer);
end

RoleController.interactiveFunctions[EInteractive.PlayOne][EHuman.Players] = function(self)
  --攻城戰觀戰中
  if Role.player.data.isWatching then return end

  if self.war == EWar.None then return end
  if self.war == EWar.Guest then 
    ShowCenterMessage(string.Get(50085));
    return;
  end
  
  --場景條件限制
  if SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.NoJoinFight) then
    ShowCenterMessage(string.Get(40133));
    return;
  end

  --無界擂台
  if Migrant.IsGalaxyServer(Network.serverId) then
    ShowCenterMessage(string.Get(40133));
    return;
  end

  --組隊中目標改為隊長
  local leader = Team.GetLeader(self.index);
  if leader == Role.player then
    ShowCenterMessage(string.Get(40035));
    return;
  end

  --城戰
  if City.cityId ~= 0 then
    local playerCamp = City.GetCamp(Organization.Id);
    
    if playerCamp == ECamp.Defend then
      if not City.IsOutSide(Role.player.position, City.cityId, ECityLine.DefendCamp) then
        ShowCenterMessage(string.Get(40336));
        return;
      end
    elseif playerCamp == ECamp.Attack then
      if City.IsOutSide(Role.player.position, City.cityId, ECityLine.AttackCamp) then
        ShowCenterMessage(string.Get(40336));
        return;
      end
    end
  end

  --駐守前哨站
  if Role.player.data.guardNpc ~= nil and Role.player.data.guardNpc.index == 2 then
    ShowCenterMessage(string.Get(40345));
    return;
  end

  --如果玩家正在冥想，先讓玩家做站立動作
  Role.player:Meditation(false);

  --C:011-002 進入戰鬥 + WarStyle(1)[5.參戰]+對像玩家ID(8)+MNpcIdx(2)
  sendBuffer:Clear()
  sendBuffer:WriteByte(EWar.Join);
  sendBuffer:WriteInt64(leader.index);
  sendBuffer:WriteUInt16(0);
  Network.Send(11, 2, sendBuffer);
end

RoleController.interactiveFunctions[EInteractive.PlayOne][EHuman.MapNpc] = function(self)
  --攻城戰觀戰中
  if Role.player.data.isWatching then return end

  if self.war == EWar.None then return end

  --駐守前哨站
  if Role.player.data.guardNpc ~= nil and Role.player.data.guardNpc.index == 2 then
    ShowCenterMessage(string.Get(40345));
    return;
  end
  
  --C:011-003 <參戰> +玩家ID(8) +索引(2)
  sendBuffer:Clear()
  sendBuffer:WriteInt32(self.npcId);
  sendBuffer:WriteUInt16(self.index);
  Network.Send(11, 3, sendBuffer);
end

RoleController.interactiveFunctions[EInteractive.PlayOne][EHuman.GuardNpc] = function(self)
  --攻城戰觀戰中
  if Role.player.data.isWatching then return end

  if self.war == EWar.None then return end

  --駐守前哨站
  if Role.player.data.guardNpc ~= nil and Role.player.data.guardNpc.index == 2 then
    ShowCenterMessage(string.Get(40345));
    return;
  end
  
  --C:011-008 <攻城戰PK> +戰鬥類型(1) +玩家ID(8) +索引(1)
  sendBuffer:Clear()
  sendBuffer:WriteByte(EWar.JoinGarNpc);
  sendBuffer:WriteInt64(self.npcId);
  sendBuffer:WriteByte(self.index);
  Network.Send(11, 8, sendBuffer);
end

RoleController.interactiveFunctions[EInteractive.PlayOne][EHuman.ForeignNpc] = function(self)
  --攻城戰觀戰中
  if Role.player.data.isWatching then return end

  if self.war == EWar.None then return end

  --駐守前哨站
  if Role.player.data.guardNpc ~= nil and Role.player.data.guardNpc.index == 2 then
    ShowCenterMessage(string.Get(40345));
    return;
  end

  --C:011-008 <攻城戰PK> +戰鬥類型(1) +玩家ID(8) +索引(1)
  sendBuffer:Clear()
  sendBuffer:WriteByte(EWar.JoinForeignNpc);
  sendBuffer:WriteInt64(self.npcId);
  sendBuffer:WriteByte(self.index);
  Network.Send(11, 8, sendBuffer);
end

RoleController.interactiveFunctions[EInteractive.Watch][EHuman.Players] = function(self)
  if self.war == EWar.None then return end

  --駐守前哨站
  if Role.player.data.guardNpc ~= nil and Role.player.data.guardNpc.index == 2 then
    ShowCenterMessage(string.Get(40352));
    return;
  end

  --組隊中目標改為隊長
  local leader = Team.GetLeader(self.index);

  --C:011-002 進入戰鬥 + WarStyle(1)[4.觀戰]+對像玩家ID(8)+MNpcIdx(2)
  sendBuffer:Clear()
  sendBuffer:WriteByte(EWar.Guest);
  sendBuffer:WriteInt64(leader.index);
  sendBuffer:WriteUInt16(0);
  Network.Send(11, 2, sendBuffer);
end

RoleController.interactiveFunctions[EInteractive.Watch][EHuman.GuardNpc] = function(self)
  if self.war == EWar.None then return end

  --駐守前哨站
  if Role.player.data.guardNpc ~= nil and Role.player.data.guardNpc.index == 2 then
    ShowCenterMessage(string.Get(40352));
    return;
  end

  --C:011-008 <攻城戰PK> +戰鬥類型(1) +玩家ID(8) +索引(1)
  sendBuffer:Clear()
  sendBuffer:WriteByte(EWar.GuestGar);
  sendBuffer:WriteInt64(self.npcId);
  sendBuffer:WriteByte(self.index);
  Network.Send(11, 8, sendBuffer);
end

RoleController.interactiveFunctions[EInteractive.Watch][EHuman.ForeignNpc] = function(self)
  if self.war == EWar.None then return end

  --駐守前哨站
  if Role.player.data.guardNpc ~= nil and Role.player.data.guardNpc.index == 2 then
    ShowCenterMessage(string.Get(40352));
    return;
  end

  --C:011-008 <攻城戰PK> +戰鬥類型(1) +玩家ID(8) +索引(1)
  sendBuffer:Clear()
  sendBuffer:WriteByte(EWar.GuestForeign);
  sendBuffer:WriteInt64(self.npcId);
  sendBuffer:WriteByte(self.index);
  Network.Send(11, 8, sendBuffer);
end

RoleController.interactiveFunctions[EInteractive.Friend][EHuman.Players] = function(self)
  Social.Invite(self.index);
end

RoleController.interactiveFunctions[EInteractive.Team][EHuman.Players] = function(self)
  Team.Invite(self);
end

RoleController.interactiveFunctions[EInteractive.Organization][EHuman.Players] = function(self)
  Organization.Invite(self.index, self.name);
end

RoleController.interactiveFunctions[EInteractive.UseItem][EHuman.Player] = function(self)
  --攻城戰觀戰中
  if Role.player.data.isWatching then return end

  if Role.player.war ~= EWar.None then return end

  UI.Open(UIBag,
    function(bagIndex, itemId)
      if Item.GetBagItem(EThings.Bag, bagIndex) == nil then return end
      if itemDatas[itemId] == nil then return end

      Item.SendUseItem(bagIndex, 1, 0, 1);
    end,
    Vector2.New(250, 0),
    string.Get(20589)
  );
end

function RoleController.TestPas(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function RoleController.TestPas1(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function RoleController.TestPas2(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function RoleController.TestPas3(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

RoleController.interactiveFunctions[EInteractive.UseItem][EHuman.Players] = function(self, itemId)
  --攻城戰觀戰中
  if Role.player.data.isWatching then return end

  if Role.player.war ~= EWar.None then return end

  UI.Open(UIBag,
    function(bagIndex, itemId)
      if Item.GetBagItem(EThings.Bag, bagIndex) == nil then return end
      if itemDatas[itemId] == nil then return end

      if Contains(itemDatas[itemId].kind, 16) then return end
      
      --C:023-020 <對他人使用熱鍵物品或是熱鍵技能> +熱鍵種類(1) +熱鍵ID(2) +對象種類(1) +對象索引(1) +對象玩家ID(8)
      sendBuffer:Clear()
      sendBuffer:WriteByte(EHotkey.Item);
      sendBuffer:WriteUInt16(itemId);
      sendBuffer:WriteByte(self.kind);
      sendBuffer:WriteByte(0);
      sendBuffer:WriteUInt32(self.index);
      Network.Send(23, 20, sendBuffer);
    end,
    Vector2.New(250, 0),
    string.Get(20589)
  );
end

RoleController.interactiveFunctions[EInteractive.UseItem][EHuman.FollowNpc] = function(self, itemId)
  --攻城戰觀戰中
  if Role.player.data.isWatching then return end

  if Role.player.war ~= EWar.None then return end

  UI.Open(UIBag,
    function(bagIndex, itemId)
      if Item.GetBagItem(EThings.Bag, bagIndex) == nil then return end
      if itemDatas[itemId] == nil then return end

      --C:023-020 <對他人使用熱鍵物品或是熱鍵技能> +熱鍵種類(1) +熱鍵ID(2) +對象種類(1) +對象索引(1) +對象玩家ID(8)
      sendBuffer:Clear()
      sendBuffer:WriteByte(EHotkey.Item);
      sendBuffer:WriteUInt16(itemId);
      sendBuffer:WriteByte(self.kind);
      sendBuffer:WriteByte(self.index);
      sendBuffer:WriteUInt32(self.npcId);
      Network.Send(23, 20, sendBuffer);
    end,
    Vector2.New(250, 0),
    string.Get(20589)
  );
end

RoleController.interactiveFunctions[EInteractive.UseSkill][EHuman.Player] = function(self)
  --攻城戰觀戰中
  if Role.player.data.isWatching then return end

  if Role.player.war ~= EWar.None then return end

  UI.Open(UISkill,
    Role.player,
    function(skillId)
      if skillDatas[skillId] == nil then return end

      if skillId == 14003 then
        --MoneyMenu.DoStall;
        return;
      end
      
      if Contains(skillId, 10020, 11020, 12020, 13019, 14035) then
        ShowCenterMessage(string.Get(40094));
        return;
      end
      
      if Role.player:GetAttribute(EAttribute.Sp) < skillDatas[skillId].requireSp then
        ShowCenterMessage(string.Get(40032));
        return;
      end

      if not Contains(skillDatas[skillId].fightWay, 6, 7, 14) then
        ShowCenterMessage(string.Get(40094));
        return;
      end

      if skillDatas[skillId].fightWay == 6 then
        ShowCenterMessage(string.Get(40095));
        return;
      end
      
      --C:023-020 <對他人使用熱鍵物品或是熱鍵技能> +熱鍵種類(1) +熱鍵ID(2) +對象種類(1) +對象索引(1) +對象玩家ID(8)
      sendBuffer:Clear()
      sendBuffer:WriteByte(EHotkey.Skill);
      sendBuffer:WriteUInt16(skillId);
      sendBuffer:WriteByte(self.kind);
      sendBuffer:WriteByte(0);
      sendBuffer:WriteUInt32(self.index);
      Network.Send(23, 20, sendBuffer);
    end,
    Vector2.New(250, 0),
    string.Get(20588)
  );
end

RoleController.interactiveFunctions[EInteractive.UseSkill][EHuman.Players] = function(self)
  --攻城戰觀戰中
  if Role.player.data.isWatching then return end

  if Role.player.war ~= EWar.None then return end

  UI.Open(UISkill,
    Role.player,
    function(skillId)
      if skillDatas[skillId] == nil then return end

      if skillId == 14003 then
        --MoneyMenu.DoStall;
        return;
      end
      
      if Contains(skillId, 10020, 11020, 12020, 13019, 14035) then
        ShowCenterMessage(string.Get(40094));
        return;
      end
      
      if Role.player:GetAttribute(EAttribute.Sp) < skillDatas[skillId].requireSp then
        ShowCenterMessage(string.Get(40032));
        return;
      end

      if not Contains(skillDatas[skillId].fightWay, 6, 7, 14) then
        ShowCenterMessage(string.Get(40094));
        return;
      end

      --C:023-020 <對他人使用熱鍵物品或是熱鍵技能> +熱鍵種類(1) +熱鍵ID(2) +對象種類(1) +對象索引(1) +對象玩家ID(8)
      sendBuffer:Clear()
      sendBuffer:WriteByte(EHotkey.Skill);
      sendBuffer:WriteUInt16(skillId);
      sendBuffer:WriteByte(self.kind);
      sendBuffer:WriteByte(0);
      sendBuffer:WriteUInt32(self.index);
      Network.Send(23, 20, sendBuffer);
    end,
    Vector2.New(250, 0),
    string.Get(20588)
  );
end

RoleController.interactiveFunctions[EInteractive.UseSkill][EHuman.FollowNpc] = function(self)
  --攻城戰觀戰中
  if Role.player.data.isWatching then return end

  if Role.player.war ~= EWar.None then return end

  UI.Open(UISkill,
    Role.player,
    function(skillId)
      if skillDatas[skillId] == nil then return end

      if skillId == 14003 then
        --MoneyMenu.DoStall;
        return;
      end
      
      if Contains(skillId, 10020, 11020, 12020, 13019, 14035) then
        ShowCenterMessage(string.Get(40094));
        return;
      end
      
      if Role.player:GetAttribute(EAttribute.Sp) < skillDatas[skillId].requireSp then
        ShowCenterMessage(string.Get(40032));
        return;
      end

      if not Contains(skillDatas[skillId].fightWay, 6, 7, 14) then
        ShowCenterMessage(string.Get(40094));
        return;
      end

      --C:023-020 <對他人使用熱鍵物品或是熱鍵技能> +熱鍵種類(1) +熱鍵ID(2) +對象種類(1) +對象索引(1) +對象玩家ID(8)
      sendBuffer:Clear()
      sendBuffer:WriteByte(EHotkey.Skill);
      sendBuffer:WriteUInt16(skillId);
      sendBuffer:WriteByte(self.kind);
      sendBuffer:WriteByte(self.index);
      sendBuffer:WriteUInt32(self.npcId);
      Network.Send(23, 20, sendBuffer);
    end,
    Vector2.New(250, 0),
    string.Get(20588)
  );
end

RoleController.interactiveFunctions[EInteractive.TradeItem][EHuman.Players] = function(self)
  --攻城戰觀戰中
  if Role.player.data.isWatching then return end

  --GM
  if Role.IsGM(self.index) then
    ShowCenterMessage(string.Get(40060));
    return;
  end

  --觀戰中
  if self.war == EWar.Guest then
    ShowCenterMessage(string.Get(50087));
    return;
  end

  --場景條件限制
  if SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.NoTrade) then
    ShowCenterMessage(string.Get(40131));
    return;
  end

  --無界擂台
  if Migrant.IsGalaxyServer(Network.serverId) then
    ShowCenterMessage(string.Get(40131));
    return;
  end

  --生存戰場
  if Survive.kind ~= ESurvive.None then
    ShowCenterMessage(string.Get(40131));
    return;
  end
  
  --C:025-001 <交易物品> +玩家ID(8)
  sendBuffer:Clear();
  sendBuffer:WriteInt64(self.index);
  Network.Send(25, 1, sendBuffer);
end

RoleController.interactiveFunctions[EInteractive.TradeNpc][EHuman.Players] = function(self)
  --攻城戰觀戰中
  if Role.player.data.isWatching then return end

  --GM
  if Role.IsGM(self.index) then
    ShowCenterMessage(string.Get(40060));
    return;
  end

  --觀戰中
  if self.war == EWar.Guest then
    ShowCenterMessage(string.Get(50087));
    return;
  end

  --場景條件限制
  if SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.NoTradePet) then
    ShowCenterMessage(string.Get(40131));
    return;
  end

  --無界擂台
  if Migrant.IsGalaxyServer(Network.serverId) then
    ShowCenterMessage(string.Get(40130));
    return;
  end

  --生存戰場
  if Survive.kind ~= ESurvive.None then
    ShowCenterMessage(string.Get(40130));
    return;
  end

  --C:025-010 <交易武將> +玩家ID(8)
  sendBuffer:Clear();
  sendBuffer:WriteInt64(self.index);
  Network.Send(25, 10, sendBuffer);
end

RoleController.interactiveFunctions[EInteractive.Whisper][EHuman.Players] = function(self)
  UINewChat.ChangeChannel(EChannel.Whisper, self.name);
end

function RoleController.TestPas4(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end


function RoleController.TestPas5(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

--Animation
function RoleController:GetAnimationId(pose, direction)
  if direction == nil then
    direction = self.direction;
  end

  if npcDatas[self.npcId] ~= nil and npcDatas[self.npcId].kind == ENpc.Ranger then
    if Contains(pose, ERolePose.Attack, ERolePose.LongAttack, ERolePose.Special, ERolePose.LongSpecial, ERolePose.Magic, ERolePose.Archery) then
      return 2 + math.floor(direction / 4);
    else
      return 0 + math.floor(direction / 4);
    end
  else
    if Contains(pose, ERolePose.Prepare, ERolePose.Lie, ERolePose.Defend, ERolePose.Hit, ERolePose.Jump, ERolePose.Attack, ERolePose.LongAttack, ERolePose.Special, ERolePose.LongSpecial, ERolePose.Magic, ERolePose.Archery) then
      return pose + math.floor(direction / 4);
    elseif Contains(pose, ERolePose.Sit, ERolePose.Meditation) then
      return pose + math.floor(direction / 2);
    elseif Contains(pose, ERolePose.Bath, ERolePose.TowelBath) then
      return pose;
    else
      return pose + direction;
    end
  end
end

function RoleController:CheckAnimationId(animationId)
  if animationId == 5 then
    return 3, true;
  elseif animationId == 6 then
    return 2, true;
  elseif animationId == 7 then
    return 1, true;
  elseif animationId == 13 then
    return 11, true;
  elseif animationId == 14 then
    return 10, true;
  elseif animationId == 15 then
    return 9, true;
  elseif animationId == 23 then
    return 21, true;
  elseif animationId == 24 then
    return 20, true;
  elseif animationId == 25 then
    return 19, true;
  elseif animationId == 48 then
    return 47, true;
  elseif animationId == 49 then
    return 46, true;
  elseif animationId == 55 then
    return 53, true;
  elseif animationId == 56 then
    return 52, true;
  elseif animationId == 57 then
    return 51, true;
  else
    return animationId, false;
  end
end

function RoleController.TestPas6(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function RoleController.TestPas7(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function RoleController.TestPas8(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function RoleController.TestPas9(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function RoleController.TestPas10(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function RoleController:GetAnimationInterval(pose)
  local interval = 0.23;

  if pose == ERolePose.Attack then
    if self:GetAnimationFrame(self:GetAnimationId(pose)) > 2 then
      interval = 0.11;
    end
  elseif pose == ERolePose.Special then
    interval = 0.11;
  end

  if self.isMoving then
    interval = 0.1; --無

    local horseNpcId = self.horseNpcId;
    if self.kind == EHuman.FollowNpc and self.data.master ~= nil then
      horseNpcId = self.data.master.horseNpcId;
    end

    if npcDatas[horseNpcId] ~= nil then
      if npcDatas[horseNpcId].picId == 1010 then
        interval = 0.05; --駿馬
      elseif Contains(npcDatas[horseNpcId].picId, 91, 92, 93, 94, 102, 118, 122, 123, 124, 128, 129, 131, 132, 133) then
        interval = 0.04; --其他(特殊)
      elseif Contains(npcDatas[horseNpcId].bodyKind, 1, 2, 4, 5, 6, 7, 8, 10, 15, 16, 17, 20) then
        interval = 0.2; --強壯的NPC
      elseif Contains(npcDatas[horseNpcId].bodyKind, 3, 9, 11, 12, 13, 14, 18, 19) then
        interval = 0.3; --瘦弱的NPC
      end
    end
  end

  return interval;
end

function RoleController:RestartAnimation()
  self.animationTime = 0;
  self:UpdateShow(true);
end

function RoleController:SetAnimationForceFrame(animationFrame)
  if self.kind ~= EHuman.Duplicate then
    if npcDatas[self.npcId] ~= nil then
      if npcDatas[self.npcId].kind == ENpc.Chest then
        if frame == 1 then
          AudioManager.PlayOnce("AudioClip_WA0014", 0);
        end
      else
        return;
      end
    end
  end

  self.animationForceFrame = animationFrame;

  self:RestartAnimation();
end

function RoleController:SetAnimationForceId(animationId)
  if animationId >= 0 then
    if self.animationForceId == animationId then return end

    self.animationForceId = animationId;
  else
    if self.animationForceId == ERolePose.None then return end

    self.animationForceId = ERolePose.None;
  end

  self:RestartAnimation();
end

function RoleController:GetAnimationFrame(animationId)
  if self.jmpDrawer_Body == nil then return 0 end
  if not self.jmpDrawer_Body.active then return 0 end

  animationId = self:CheckAnimationId(animationId);

  return self.jmpDrawer_Body:GetFrameCount(animationId);
end

--[[
And these two had a dream on the same night; the chief wine-servant and the chief bread-maker of the king of Egypt, who were in prison, the two of them had dreams with a special sense.
And in the morning when Joseph came to them he saw that they were looking sad.
And he said to the servants of Pharaoh who were in prison with him, Why are you looking so sad?
Then they said to him, We have had a dream, and no one is able to give us the sense. And Joseph said, Does not the sense of dreams come from God? what was your dream?
Then the chief wine-servant gave Joseph an account of his dream, and said, In my dream I saw a vine before me;
And on the vine were three branches; and it seemed as if it put out buds and flowers, and from them came grapes ready for cutting.
And Pharaoh's cup was in my hand, and I took the grapes and crushing them into Pharaoh's cup, gave the cup into Pharaoh's hand.
Then Joseph said, This is the sense of your dream: the three branches are three days;
After three days Pharaoh will give you honour, and put you back into your place, and you will give him his cup as you did before, when you were his wine-servant.
But keep me in mind when things go well for you, and be good to me and say a good word for me to Pharaoh and get me out of this prison:
For truly I was taken by force from the land of the Hebrews; and I have done nothing for which I might be put in prison.
Now when the chief bread-maker saw that the first dream had a good sense, he said to Joseph, I had a dream; and in my dream there were three baskets of white bread on my head;
And in the top basket were all sorts of cooked meats for Pharaoh; and the birds were taking them out of the baskets on my head.
Then Joseph said, This is the sense of your dream: the three baskets are three days;
--]]

--value Animation
function RoleController:SetInBattle(inBattle)
  if self.inBattle == inBattle then return end
  
  self.inBattle = inBattle;

  self:RestartAnimation();
end

function RoleController:SetIsDead(isDead)
  if self.isDead == isDead then return end
  
  self.isDead = isDead;

  self:RestartAnimation();
end

function RoleController:SetIsMoving(isMoving, updateFollow)
  --駐紮中
  if self.data ~= nil and self.data.guardNpc ~= nil then
    if Contains(self.data.guardNpc.data.kind, EGuard.HitCar, EGuard.KnifeCar, EGuard.WatchTower, EGuard.CityGate, EGuard.WoodGate) then
      if updateFollow ~= false then
        if Team.IsLeader(self.index) then
          --隊長
          local members = Team.GetMember(self.index);
          for k, v in pairs(members) do
            v:SetIsMoving(isMoving, false);
          end
        elseif Team.IsMember(self.index) then
          --隊員
        else
          --無組隊
          local followNpcs = Role.GetFollowNpcs(self.index);
          for k, v in pairs(followNpcs) do
            v:SetIsMoving(isMoving, false);
          end

          local cartNpc = Role.cartNpcs[self.index];
          if cartNpc ~= nil then
            cartNpc:SetIsMoving(isMoving, false);
          end
        end
      end
    end
  end

  if self.isMoving == isMoving then return end
  
  self.isMoving = isMoving;

  if self.isMoving then
    self:SetAnimationForceId(ERolePose.None);
  end
  
  self:RestartAnimation();
end

function RoleController.AddThree(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function RoleController:SetIsSitting(isSitting)
  if self.isSitting == isSitting then return end

  self.isSitting = isSitting;

  self:RestartAnimation();
end

function RoleController:SetIsJumping(isJumping)
  if self.isJumping == isJumping then return end

  self.isJumping = isJumping;

  self:RestartAnimation();
end

function RoleController.AddThree1(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function RoleController.AddThree2(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function RoleController.AddThree3(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function RoleController:SetDirection(direction, updateFollow)
  if self.data ~= nil and self.data.guardNpc ~= nil then
    if Contains(self.data.guardNpc.data.kind, EGuard.WellHurdle, EGuard.Horse, EGuard.HitCar, EGuard.KnifeCar, EGuard.ArrowCar, EGuard.RockCar) then
      self.data.guardNpc:SetDirection(direction);
    end

    if Contains(self.data.guardNpc.data.kind, EGuard.HitCar, EGuard.KnifeCar, EGuard.WatchTower, EGuard.CityGate, EGuard.WoodGate) then
      if updateFollow ~= false then
        if Team.IsLeader(self.index) then
          --隊長
          local members = Team.GetMember(self.index);
          for k, v in pairs(members) do
            v:SetDirection(direction, false);
          end
        elseif Team.IsMember(self.index) then
          --隊員
        else
          --無組隊
          local followNpcs = Role.GetFollowNpcs(self.index);
          for k, v in pairs(followNpcs) do
            v:SetDirection(direction, false);
          end

          local cartNpc = Role.cartNpcs[self.index];
          if cartNpc ~= nil then
            cartNpc:SetDirection(direction, false);
          end
        end
      end
    end
  end

  if self.direction == direction then return end
  
  self.direction = direction;

  self:UpdateViewGhost();
  self:RestartAnimation();
end

function RoleController.AddThree4(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

--trigger Animation
function RoleController:Hello()
  self.animationTrigger = EAnimationTrigger.Hello;

  self:RestartAnimation();
end

function RoleController:Block()
  self.animationTrigger = EAnimationTrigger.Block;

  self:RestartAnimation();
end

function RoleController:Hit()
  self.animationTrigger = EAnimationTrigger.Hit;

  self:RestartAnimation();
end

function RoleController.AddThree5(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function RoleController.AddThree6(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function RoleController.AddThree7(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function RoleController:OneHandAttack()
  self.animationTrigger = EAnimationTrigger.OneHandAttack;

  self:RestartAnimation();
end

function RoleController.AddThree8(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function RoleController.AddThree9(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function RoleController:TwoHandAttack()
  self.animationTrigger = EAnimationTrigger.TwoHandAttack;

  self:RestartAnimation();
end

function RoleController:MagicAttack()
  self.animationTrigger = EAnimationTrigger.MagicAttack;

  self:RestartAnimation();
end

function RoleController:RangeAttack()
  self.animationTrigger = EAnimationTrigger.RangeAttack;

  self:RestartAnimation();
end


function RoleController.AddThree10(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

--Move
function RoleController:Move(position, callback, moveStraight, moveCurrentView, moveLine)
  if position == nil then return end
  
  --logError(string.format("Role[%d] Move To (%d, %d)", self.index, position.x, position.y));
  if self.visible ~= ERoleVisible.Visible and self.visible ~= ERoleVisible.TimeVisible then return end

  if self.data ~= nil and self.data.guardNpc ~= nil then
    if not Contains(self.data.guardNpc.data.kind, EGuard.Horse, EGuard.HitCar, EGuard.KnifeCar, EGuard.ArrowCar, EGuard.RockCar, EGuard.WellHurdle) then
      return;
    end
  end
  
  if self.kind == EHuman.Player then
    if not City.CheckMove(self, position) then
      --ShowCenterMessage(string.Get(40258));
      position = MapManager.GetCityEmpty(self, position);
    end
  elseif self.kind == EHuman.FollowNpc then
    if self.data.beenRide then
      return;
    end
  end
  
  self.moveController:MoveToLocalTarget(position, callback, moveStraight, moveCurrentView, moveLine);

  if self.kind == EHuman.Player then
    if Role.target ~= nil then
      if Role.target.kind == EHuman.Player then
        TargetManager.CancelTarget();
      elseif Role.target.data.master == Role.player then
        TargetManager.CancelTarget();
      end
    end
  end
end

--[[
And Isaac answering said, But I have made him your master, and have given him all his brothers for servants; I have made him strong with grain and wine: what then am I to do for you, my son?
And Esau said to his father, Is that the only blessing you have, my father? give a blessing to me, even me! And Esau was overcome with weeping.
Then Isaac his father made answer and said to him, Far from the fertile places of the earth, and far from the dew of heaven on high will your living-place be:
By your sword will you get your living and you will be your brother's servant; but when your power is increased his yoke will be broken from off your neck.
So Esau was full of hate for Jacob because of his father's blessing; and he said in his heart, The days of weeping for my father are near; then I will put my brother Jacob to death.
Then Rebekah, hearing what Esau had said, sent for Jacob, her younger son, and said to him, It seems that your brother Esau is purposing to put you to death.
So now, my son, do what I say: go quickly to Haran, to my brother Laban;
And be there with him for a little time, till your brother's wrath is turned away;
Till the memory of what you have done to him is past and he is no longer angry: then I will send word for you to come back; are the two of you to be taken from me in one day?
Then Rebekah said to Isaac, My life is a weariness to me because of the daughters of Heth: if Jacob takes a wife from among the daughters of Heth, such as these, the women of this land, of what use will my life be to me?
--]]

function RoleController:StopMove()
  self.moveController:StopMove();
end

function RoleController:Teleport(position, updateView, stopAutoMove)
  if Contains(self.kind, EHuman.Player, EHuman.Players) then
    table.Clear(self.data.followPositions);

    local followNpcs = Role.GetFollowNpcs(self.index);
    for k, v in pairs(followNpcs) do
      v:Teleport(position);
    end

    local cartNpc = Role.cartNpcs[self.index];
    if cartNpc ~= nil then
      cartNpc:Teleport(position);
    end
  end

  self:StopMove();
  self:SetPosition(position, updateView);

  if self.kind == EHuman.Player then
    if stopAutoMove == true and not (Define.SuperAI and SceneManager.dungeonId ~= 0) then
      MachineBox.SetAutoMove(false);
    end
    
    Scene.UpdateCameraSize(MapManager.mapWidth, MapManager.mapHeight);
    Scene.UpdateCamera(self.position);

    SceneManager.UpdateArea();
  end
end

function RoleController:SetPosition(position, updateView, updateFollow)
  self.position.x = position.x;
  self.position.y = position.y;

  if updateView ~= false then
    self:UpdateViewPosition();
  end

  if self.war ~= EWar.None then return end

  --跟隨
  if Contains(self.kind, EHuman.Player, EHuman.Players) then
    if not HouseManager.IsInHouse() then
      self:SetOnTheSea(MapManager.IsSea(MapManager.GetBlock(position)));
    end

    local forceFollowPosition = self.onTheSea;

    if forceFollowPosition then
      for i = 1, Role.maxFollowNpc do
        if self.data.followPositions[i] == nil then
          self.data.followPositions[i] = Vector2.zero;
        end

        self.data.followPositions[i].x = position.x;
        self.data.followPositions[i].y = position.y;
      end
    end

    if self.data ~= nil and self.data.guardNpc ~= nil then
      if Contains(self.data.guardNpc.data.kind, EGuard.HitCar, EGuard.ArrowCar, EGuard.RockCar) then
        if self.data.guardNpc.isMoving then
          self.data.guardNpc:StopMove();
        end
        self.data.guardNpc:SetPosition(position + City.guardOffset[self.direction]);
        
      elseif Contains(self.data.guardNpc.data.kind, EGuard.WellHurdle, EGuard.KnifeCar) then
        self.data.guardNpc:SetPosition(position);
      end

      if Contains(self.data.guardNpc.data.kind, EGuard.CityGate, EGuard.WoodGate) then
        forceFollowPosition = true;
        for i = 1, Role.maxFollowNpc do
          self.data.followPositions[i] = position + City.gateOffset[i];
        end
      elseif Contains(self.data.guardNpc.data.kind, EGuard.WatchTower, EGuard.KnifeCar) then
        forceFollowPosition = true;
        for i = 1, Role.maxFollowNpc do
          self.data.followPositions[i] = position + City.followOffset[self.direction][i];
        end
      end
    end
    
    if forceFollowPosition then
      if updateFollow ~= false then
        --隊長
        if Team.IsLeader(self.index) then
          local members = Team.GetMember(self.index);
          for k, v in pairs(members) do
            if self.data.followPositions[k] ~= nil then
              v:SetPosition(self.data.followPositions[k], nil, false);
            end
          end

        --隊員
        elseif Team.IsMember(self.index) then
          
        --無組隊
        else
          local followNpcs = Role.GetFollowNpcs(self.index);
          for k, v in pairs(followNpcs) do
            if self.data.followPositions[v.data.order] ~= nil then
              v:SetPosition(self.data.followPositions[v.data.order], nil, false);
            end
          end

          local cartNpc = Role.cartNpcs[self.index];
          if cartNpc ~= nil and self.data.followPositions[1] ~= nil then
            cartNpc:SetPosition(self.data.followPositions[1], nil, false);
          end
        end
      end

    else
      if self.data.followPositions[1] == nil or (self.data.followPositions[1] - self.position).sqrMagnitude > SceneManager.sceneState.followDistance then
        --隊長
        if Team.IsLeader(self.index) then
          local members = Team.GetMember(self.index);
          for k, v in pairs(members) do
            if self.data.followPositions[k] ~= nil then
              v:Move(self.data.followPositions[k]);
            end
          end

        --隊員
        elseif Team.IsMember(self.index) then

        --無組隊
        else
          local followNpcs = Role.GetFollowNpcs(self.index);
          for k, v in pairs(followNpcs) do
            if self.data.followPositions[v.data.order] ~= nil then
              v:Move(self.data.followPositions[v.data.order], nil, true);
            end
          end

          local cartNpc = Role.cartNpcs[self.index];
          if cartNpc ~= nil and self.data.followPositions[1] ~= nil then
            cartNpc:Move(self.data.followPositions[1], nil, true);
          end
        end

        --寵物
        if Role.pets[self.index] ~= nil then
          Role.pets[self.index]:Move(self.position, nil, true);
        end

        for i = Role.maxFollowNpc, 1, -1 do
          if self.data.followPositions[i] ~= nil then
            if self.data.followPositions[i + 1] == nil then
              self.data.followPositions[i + 1] = Vector2.zero;
            end
            
            self.data.followPositions[i + 1].x = self.data.followPositions[i].x;
            self.data.followPositions[i + 1].y = self.data.followPositions[i].y;
          end
        end

        if self.data.followPositions[1] == nil then
          self.data.followPositions[1] = Vector2.zero;
        end

        self.data.followPositions[1].x = self.position.x;
        self.data.followPositions[1].y = self.position.y;
      end
    end
  elseif self.kind == EHuman.FollowNpc then
    self:SetOnTheSea(self.data.master.onTheSea);

  elseif self.kind == EHuman.CartNpc then
    local master = Role.players[self.index];
    if master ~= nil then
      self:SetOnTheSea(master.onTheSea);
    end
  end

  if self.kind == EHuman.Player then
    Role.latestMoveTime = CGTimer.time;
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


--Behaviour
function RoleController:SetSelected(selected)
  if selected then
    self:SetOutline(Color.Yellow);
    self.image_Select.gameObject:SetActive(true);
  else
    self:SetOutline(Color.Alpha);
    self.image_Select.gameObject:SetActive(false);
  end
end

function RoleController:FaceTo(facePosition, checkFrame)
  local directX = 0;
  local directY = 0;

  if self.kind == EHuman.Player and UIJoystick.IsDrag() then
    directX, directY = UIJoystick.GetDirectDelta();
  else
    directX = facePosition.x - self.position.x;
    directY = facePosition.y - self.position.y;
  end
  
  local atan = math.abs(directY) / (math.abs(directX) + 0.001);
  
  local faceDirection = self.direction;
  if directX < 0 and directY > 0 and atan > 0.25 and atan < 2 then
    faceDirection = EFaceDirection.LeftDown; --面朝左下
  elseif directX < 0 and directY < 0 and atan > 0.25 and atan < 2 then
    faceDirection = EFaceDirection.LeftUp; --面朝左上
  elseif directX > 0 and directY > 0 and atan > 0.25 and atan < 2 then
    faceDirection = EFaceDirection.RightDown; --面朝右下
  elseif directX > 0 and directY < 0 and atan > 0.25 and atan < 2 then
    faceDirection = EFaceDirection.RightUp; --面朝右上
  elseif directX > 0 and atan <= 0.25 then
    faceDirection = EFaceDirection.Right; --面朝右
  elseif directX < 0 and atan <= 0.25 then
    faceDirection = EFaceDirection.Left; --面朝左
  elseif directY > 0 then
    faceDirection = EFaceDirection.Down; --面朝下
  elseif directY < 0 then
    faceDirection = EFaceDirection.Up; --面朝上
  end

  if checkFrame and self:GetAnimationFrame(self:GetAnimationId(ERolePose.Stand, faceDirection)) <= 0 then return end
  
  self:SetDirection(faceDirection);
end

function RoleController:Ride(npcId)
  if not Contains(self.kind, EHuman.Player, EHuman.Players) then return end

  if mountsDatas[npcId] ~= nil and npcDatas[npcId] ~= nil then
    self.horseNpcId = npcId;
  else
    self.horseNpcId = 0;
  end

  self:UpdateSpeed();
  self:UpdateViewRide();

  local followNpcs = Role.GetFollowNpcs(self.index);
  for k, v in pairs(followNpcs) do
    v:UpdateAllView();
  end

  local cartNpc = Role.cartNpcs[self.index];
  if cartNpc ~= nil then
    cartNpc:UpdateAllView();
  end

  if self.kind == EHuman.Player then
    Function.UpdateAniBtn(EFunction.Ride);
  end
end

function RoleController:Guard(guardIndex)
  if not Contains(self.kind, EHuman.Player, EHuman.Players) then return end

  local role = Role.guardNpcs[guardIndex];

  if self.data.guardNpc == role then return end

  if Role.target == role or Role.target == self.data.guardNpc then
    TargetManager.CancelTarget();
  end

  --本來有駐扎
  if self.data.guardNpc ~= nil then
    self.data.guardNpc.data.master = nil;
    
    self.data.guardNpc:UpdateViewVisible();
    self.data.guardNpc:RestartAnimation();
    self.data.guardNpc:UpdateViewHeight();

    if self.data.guardNpc.data.cityId == 5 then
      self.data.guardNpc:SetDirection(ERoleDirection.RightDown);
    else
      self.data.guardNpc:SetDirection(ERoleDirection.LeftDown);
    end
    
    local position = nil;
    if Contains(self.data.guardNpc.data.kind, EGuard.WoodGate) then
      if self.data.guardNpc.data.cityId == 5 then
        position = self.data.guardNpc.position + Vector2.New(-30, 31);
      else
        position = self.data.guardNpc.position + Vector2.New(30, -31);
      end
    end
    
    self.data.guardNpc = nil;

    if position ~= nil then
      self:SetPosition(position);
    end
  end

  self.data.guardNpc = role;

  self:UpdateSpeed();
  self:UpdateViewShadow();
  self:UpdateViewHeight();
  self:RestartAnimation();

  if role ~= nil then
    role.data.master = self;

    if Contains(role.data.kind, EGuard.Horse) then
      role:SetDirection(self.direction);
      role:SetPosition(self.position);
    elseif Contains(role.data.kind, EGuard.HitCar, EGuard.ArrowCar, EGuard.RockCar) then
      role:Move(self.position + City.guardOffset[self.direction]);
    elseif Contains(role.data.kind, EGuard.WoodGate) then
      if self.data.guardNpc.data.cityId == 5 then
        self:SetDirection(ERoleDirection.RightDown);
        self:SetPosition(Vector2.New(role.position.x + 30, role.position.y + 31));
        self:StopMove();
      else
        self:SetDirection(ERoleDirection.LeftDown);
        self:SetPosition(Vector2.New(role.position.x - 30, role.position.y + 31));
        self:StopMove();
      end
    else
      self:SetDirection(role.direction);
      self:SetPosition(role.position);
    end
    
    role:UpdateViewVisible();
    role:RestartAnimation();
    role:UpdateViewHeight();
  end
end

function RoleController.Demo()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function RoleController:Meditation(meditation)
  if not meditation then
    if self.kind == EHuman.Player then
      --C:032-002 <使用情感動作> +動作ID(1)
      sendBuffer:Clear()
      sendBuffer:WriteByte(ERolePose.Stand);
      Network.Send(32, 2, sendBuffer);
    end

    self:SetAnimationForceId(ERolePose.None);
  end
end

--Emotion
function RoleController:PlayEmoji(emojiId, loopTimes, position)
  if self.gameObject == nil then return end

  loopTimes = loopTimes or 4;

  TextureManager.SetPngByCallBack(ETextureUseType.UI, string.format("Emoji_%03d", emojiId), self.rawImage_Emoji,
    function(sucess)
      if sucess == true then
        if position ~= nil then
          self.rawImage_Emoji.transform.localPosition = position;
        else
          self.rawImage_Emoji.transform.localPosition = Vector3.New(5, -5, 0);
        end

        self.rawImage_Emoji:ShiftUV(1, 4, 0.2, loopTimes);
        self.rawImage_Emoji.enabled = true;
      else
        self.rawImage_Emoji.enabled = false;
      end
    end
  );
end

function RoleController.Demo2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function RoleController.Demo3()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function RoleController:StopEmoji()
  if self.gameObject == nil then return end

  self.rawImage_Emoji.enabled = false;
end

--Attribute
function RoleController:GetAttribute(kind, arg)
  if kind == EAttribute.Lv then
    if self:GetAttribute(EAttribute.Turn) >= 3 then
      if self.attributes[kind] ~= nil then
        return self.attributes[kind] + Role.playerMaxLv;
      else
        return Role.playerMaxLv;
      end
    end
  elseif kind == EAttribute.Moral then
    if self.attributes[EAttribute.Moral] == nil then
      return 0;
    else
      return self.attributes[EAttribute.Moral][arg];
    end
  elseif kind == EAttribute.Faith then
    if Contains(self.kind, EHuman.Player, EHuman.Players) then
      return 100;
    end
  elseif kind == EAttribute.Turn then
    if self.data ~= nil and self.data.turn ~= nil then
      return self.data.turn;
    elseif npcDatas[self.npcId] ~= nil then
      return npcDatas[self.npcId].turn;
    end
  elseif kind == EAttribute.Turn3Element then
    if Contains(self.kind, EHuman.Player, EHuman.Players) then
      return self.data.turn3Info.element;
    end
  elseif kind == EAttribute.Turn3Int then
    if Contains(self.kind, EHuman.Player, EHuman.Players) then
      return self.data.turn3Info.int;
    end
  elseif kind == EAttribute.Turn3Atk then
    if Contains(self.kind, EHuman.Player, EHuman.Players) then
      return self.data.turn3Info.atk;
    end
  elseif kind == EAttribute.Turn3Def then
    if Contains(self.kind, EHuman.Player, EHuman.Players) then
      return self.data.turn3Info.def;
    end
  elseif kind == EAttribute.Turn3Hpx then
    if Contains(self.kind, EHuman.Player, EHuman.Players) then
      return self.data.turn3Info.hpx;
    end
  elseif kind == EAttribute.Turn3Spx then
    if Contains(self.kind, EHuman.Player, EHuman.Players) then
      return self.data.turn3Info.spx;
    end
  elseif kind == EAttribute.Turn3Agi then
    if Contains(self.kind, EHuman.Player, EHuman.Players) then
      return self.data.turn3Info.agi;
    end
  elseif kind == EAttribute.Turn3Exp then
    if Contains(self.kind, EHuman.Player, EHuman.Players) then
      return self.data.turn3Info.exp;
    end
  elseif kind == EAttribute.Buff then
    if self.buff.kind == arg then
      return self.buff.value;
    else
      return 0;
    end
  elseif kind == EAttribute.Career then
    if self.data ~= nil and self.data.career ~= nil then
      return self.data.career;
    end
  end
  
  if self.attributes[kind] ~= nil then
    return self.attributes[kind];
  else
    return 0;
  end
end

function RoleController.Demo4()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function RoleController.Demo5()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function RoleController.Demo6()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function RoleController:SetAttribute(kind, value, arg)
  local updateUI = false;
  local resetUI = false;

  if kind == EAttribute.Element then
    --元素 (1地 2水 3火 4風)
    self.attributes[EAttribute.Element] = value;
  
  elseif kind == EAttribute.Hp then
    --體力值
    updateUI = true;
    
    self.attributes[EAttribute.Hp] = value;

  elseif kind == EAttribute.Sp then
    --技力值
    updateUI = true;
    
    self.attributes[EAttribute.Sp] = value;
  
  elseif kind == EAttribute.Int then
    --知力
    updateUI = true;

    self.attributes[EAttribute.Int] = value;
    
    if self.kind == EHuman.Player and self.transform ~= nil then
      NotifyManager.Notify("CheckCondition", ECondition.Int);
    end

  elseif kind == EAttribute.Atk then
    --攻擊力
    updateUI = true;

    self.attributes[EAttribute.Atk] = value;

    if self.kind == EHuman.Player and self.transform ~= nil then
      NotifyManager.Notify("CheckCondition", ECondition.Atk);
    end

  elseif kind == EAttribute.Def then
    --防禦力
    updateUI = true;

    self.attributes[EAttribute.Def] = value;

    if self.kind == EHuman.Player and self.transform ~= nil then
      NotifyManager.Notify("CheckCondition", ECondition.Def);
    end

  elseif kind == EAttribute.Agi then
    --敏捷
    updateUI = true;

    self.attributes[EAttribute.Agi] = value;

    if self.kind == EHuman.Player and self.transform ~= nil then
      NotifyManager.Notify("CheckCondition", ECondition.Agi);
    end

  elseif kind == EAttribute.Hpx then
    --Hp上升幅度
    self.attributes[EAttribute.Hpx] = value;

    self:SetAttribute(EAttribute.MaxHp, Calc.GetMaxHp(self));

    if self.kind == EHuman.Player and self.transform ~= nil then
      NotifyManager.Notify("CheckCondition", ECondition.Hpx);
    end

  elseif kind == EAttribute.Spx then
    --Sp上升幅度
    self.attributes[EAttribute.Spx] = value;

    self:SetAttribute(EAttribute.MaxSp, Calc.GetMaxSp(self));
 
    if self.kind == EHuman.Player and self.transform ~= nil then
      NotifyManager.Notify("CheckCondition", ECondition.Spx);
    end
    
  elseif kind == EAttribute.Lv then
    --等級
    local oriLv = self.attributes[EAttribute.Lv];

    self.attributes[EAttribute.Lv] = value;
    
    self:SetAttribute(EAttribute.MaxHp, Calc.GetMaxHp(self));
    self:SetAttribute(EAttribute.MaxSp, Calc.GetMaxSp(self));

    if self.kind == EHuman.Player and UI.IsVisible(UIActivity) then
      UIActivity.UpdateLV();
    end

    if self.kind == EHuman.Player and oriLv ~= nil and oriLv ~= value and value ~= 0 then
      AudioManager.PlayOnce("AudioClip_WA0013", 0);
      UIPlayAnimation.Play(UIPlayAnimation.EKind.LevelUp)
      
      Function.UpdateVisible();
      Dungeon.InitAvailableDungeonDatas();
    end

    if self.kind == EHuman.Player and self.transform ~= nil then
      NotifyManager.Notify("CheckCondition", ECondition.Lv);
      NotifyManager.Notify("CheckCondition", ECondition.NowLevel);

      PluginManager.SetLevel(self.attributes[EAttribute.Lv]);
    end
  
  elseif kind == EAttribute.Exp then
    --經驗值
    updateUI = true;

    if Contains(self.kind, EHuman.Player, EHuman.Players) and self:GetAttribute(EAttribute.Turn) == 3 then
      self.data.turn3Info.exp = value;
    else
      self.attributes[EAttribute.Exp] = value;
    end
  
  elseif kind == EAttribute.SkillPoint then
    --技能點數
    self.attributes[EAttribute.SkillPoint] = self.attributes[EAttribute.SkillPoint] or 0;

    if self.kind == EHuman.Player then
      if self.attributes[EAttribute.SkillPoint] > value then
        if value == 0 then
          RedDot.Remove(ERedDot.SkillPoint);
        end

      elseif self.attributes[EAttribute.SkillPoint] < value then
        RedDot.Add(ERedDot.SkillPoint);
      end
    end

    self.attributes[EAttribute.SkillPoint] = value;

    if UI.IsVisible(UISkillHint) then
      if UISkillHint.IsCurrentRole(self) then
        UISkillHint.UpdateUI();
      end
    end

    if UI.IsVisible(UISkillTree) then
      if UISkillTree.IsCurrentRole(self) then
        UISkillTree.UpdateSkillPoint();
      end
    end
  
  elseif kind == EAttribute.AttrPoint then
    --屬性點數
    updateUI = true;
    resetUI = true;

    self.attributes[EAttribute.AttrPoint] = self.attributes[EAttribute.AttrPoint] or 0;
    
    if self.kind == EHuman.Player then
      if self.attributes[EAttribute.AttrPoint] > value then
        if value == 0 then
          RedDot.Remove(ERedDot.AttributePoint);
        end
        
        ShowCenterMessage(string.Get(20074));

      elseif self.attributes[EAttribute.AttrPoint] < value then
        RedDot.Add(ERedDot.AttributePoint);
      end
    end

    self.attributes[EAttribute.AttrPoint] = value;

  elseif kind == EAttribute.PracExp then
    --修練經驗值
    self.attributes[EAttribute.PracExp] = value;

  elseif kind == EAttribute.Turn2Ball then
    --天珠點數
    self.attributes[EAttribute.Turn2Ball] = value;

    if UI.IsVisible(UISkillTree) then
      if UISkillTree.IsCurrentRole(self) then
        UISkillTree.UpdateTurn2Ball();
      end
    end
  
  elseif kind == EAttribute.Moral then
    --陣營 (1魏 2蜀 3吳 4黃巾 5遊俠)
    updateUI = true;

    if self.attributes[EAttribute.Moral] == nil then
      self.attributes[EAttribute.Moral] = { 0, 0, 0, 0, 0 };
    end

    self.attributes[EAttribute.Moral][arg] = value;

  elseif kind == EAttribute.Honor then
    --官勳(根據殺敵點公式求得)
    self.attributes[EAttribute.Honor] = value;

    if self.kind == EHuman.Player and self.transform ~= nil then
      NotifyManager.Notify("CheckCondition", ECondition.Honor);
    end  
  elseif kind == EAttribute.KillNum then
    --殺敵點
    self.attributes[EAttribute.KillNum] = value;

  elseif kind == EAttribute.Faith then
    --忠誠度
    updateUI = true;

    if Role.player.war == EWar.None and arg ~= false then
      local oriValue = self:GetAttribute(EAttribute.Faith);

      if oriValue > value then
        ShowCenterMessage(string.Concat(self.name, string.Get(50065), (oriValue - value)));
      elseif oriValue < value then
        ShowCenterMessage(string.Concat(self.name, string.Get(50064), (value - oriValue)));
      end
    end

    self.attributes[EAttribute.Faith] = value;

  elseif kind == EAttribute.BattleHonor then
    --戰役官勳
    self.attributes[EAttribute.BattleHonor] = value;
  
  elseif kind == EAttribute.GovRequireValue then
    --官府徵召兌獎值
    self.attributes[EAttribute.GovRequireValue] = value;
  
  elseif kind == EAttribute.AstrolabePoint then
    --七星命盤本命燈點數
    if self.kind ~= EHuman.Player then return end

    Astrolabe.SetPoint(value);
  
  elseif kind == EAttribute.Turn then
    --轉生狀態
    updateUI = true;
    resetUI = true;

    if not Contains(self.kind, EHuman.Player, EHuman.Players) then return end

    self.data.turn = value;

    Role.CartNpcAppear(self.index);
  
  elseif kind == EAttribute.BuffInt then
    --BUFF 知力
    updateUI = true;

    self.attributes[EAttribute.BuffInt] = value;
  
  elseif kind == EAttribute.BuffAtk then
    --BUFF 攻擊力
    updateUI = true;

    self.attributes[EAttribute.BuffAtk] = value;
  
  elseif kind == EAttribute.BuffDef then
    --BUFF 防禦力
    updateUI = true;

    self.attributes[EAttribute.BuffDef] = value;
  
  elseif kind == EAttribute.BuffAgi then
    --BUFF 敏捷
    updateUI = true;

    self.attributes[EAttribute.BuffAgi] = value;
  
  elseif kind == EAttribute.BuffHpx then
    --BUFF Hp上升幅度
    updateUI = true;

    self.attributes[EAttribute.BuffHpx] = value;
  
  elseif kind == EAttribute.BuffSpx then
    --BUFF Sp上升幅度
    updateUI = true;

    self.attributes[EAttribute.BuffSpx] = value;
  
  elseif kind == EAttribute.Turn3Int then
    --三轉 知力
    updateUI = true;

    if not Contains(self.kind, EHuman.Player, EHuman.Players) then return end

    self.data.turn3Info.int = value;
  
  elseif kind == EAttribute.Turn3Atk then
    --三轉 攻擊力
    updateUI = true;

    if not Contains(self.kind, EHuman.Player, EHuman.Players) then return end

    self.data.turn3Info.atk = value;
  
  elseif kind == EAttribute.Turn3Def then
    --三轉 防禦力
    updateUI = true;

    if not Contains(self.kind, EHuman.Player, EHuman.Players) then return end

    self.data.turn3Info.def = value;
  
  elseif kind == EAttribute.Turn3Hpx then
    --三轉 Hp上升幅度
    if not Contains(self.kind, EHuman.Player, EHuman.Players) then return end

    self.data.turn3Info.hpx = value;

    self:SetAttribute(EAttribute.MaxHp, Calc.GetMaxHp(self));
  
  elseif kind == EAttribute.Turn3Spx then
    --三轉 Sp上升幅度
    if not Contains(self.kind, EHuman.Player, EHuman.Players) then return end

    self.data.turn3Info.spx = value;

    self:SetAttribute(EAttribute.MaxSp, Calc.GetMaxSp(self));
  
  elseif kind == EAttribute.Turn3Agi then
    --三轉 敏捷
    updateUI = true;

    if not Contains(self.kind, EHuman.Player, EHuman.Players) then return end
    
    self.data.turn3Info.agi = value;
  
  elseif kind == EAttribute.Skill then
    --技能
    if self.kind == EHuman.Player then
      if value > 0 then
        if self.data.skills[arg] == nil then
          self.data.skills[arg] = { Id = arg, Lv = value };
        else
          self.data.skills[arg].Lv = value;
        end
      else
        if self.data.skills[arg] ~= nil then
          self.data.skills[arg] = nil;
        end
      end

      --事件學到技能加秀訊息(目前為心系技能)
      if skillDatas[arg].kind == 5 and value == 1 then
        AudioManager.PlayOnce("AudioClip_WA0014", 0);
        ShowCenterMessage(string.Concat(string.Get(50042), skillDatas[arg].name, string.Get(50043)));
      end

      if UI.IsVisible(UISkillHint) then
        if UISkillHint.IsCurrentRole(self) then
          UISkillHint.UpdateUI();
        end
      end
      
      if UI.IsVisible(UISkillTree) then
        if UISkillTree.IsCurrentRole(self) then
          UISkillTree.UpdateUI();
        end
      end
      
      if UI.IsVisible(UIHotkey) then
        if UIHotkey.IsCurrentRole(self) then
          UIHotkey.UpdateUI();
        end
      end
      --[[

      --擺攤按鈕出現
      if Skill[FSkill.FindOne(arg)].ID == 14003 and Skill[FSkill.FindOne(arg)].Lv > 0 then
        MoneyMenu.btnStall.Visible = true;

        if not MoneyMenu.Visible then
          Se_MainStatus.Button[0].IsAnimated = true;
        end
      end

      --技能重配點介面更新
      if BK_SkillRegressF.Visible then
        BK_SkillRegressF.ResetInfo;
      end
      ]]--
    elseif self.kind == EHuman.FollowNpc then
      for i = 1, Role.maxNpcSkill do
        if npcDatas[self.npcId].skills[i] == arg then
          self.data.skillLv[i] = value;
          break;
        end
      end

      if UI.IsVisible(UISkillHint) then
        if UISkillHint.IsCurrentRole(self) then
          UISkillHint.UpdateUI();
        end
      end

      if UI.IsVisible(UISkillTree) then
        if UISkillTree.IsCurrentRole(self) then
          UISkillTree.UpdateUI(true);
        end
      end
    end
  
  elseif kind == EAttribute.MaxHp then
    --最大體力值
    updateUI = true;

    self.attributes[EAttribute.MaxHp] = value;
  
  elseif kind == EAttribute.MaxSp then
    --最大技力值
    updateUI = true;

    self.attributes[EAttribute.MaxSp] = value;
  
  elseif kind == EAttribute.EquipMaxHp then
    --裝備提昇最大Hp
    self.attributes[EAttribute.EquipMaxHp] = value;
    
    self:SetAttribute(EAttribute.MaxHp, Calc.GetMaxHp(self));
  
  elseif kind == EAttribute.EquipMaxSp then
    --裝備提昇最大Sp
    self.attributes[EAttribute.EquipMaxSp] = value;

    self:SetAttribute(EAttribute.MaxSp, Calc.GetMaxSp(self)); 
  
  elseif kind == EAttribute.Buff then
    --增益buff
    self.buff.kind = arg;
    self.buff.value = value;
    
    if self.buff.kind == EAttribute.EquipHpx then
      self:SetAttribute(EAttribute.MaxHp, Calc.GetMaxHp(self));
    elseif self.buff.kind == EAttribute.EquipSpx then
      self:SetAttribute(EAttribute.MaxSp, Calc.GetMaxSp(self));
    end
  
  elseif kind == EAttribute.EquipAtk then
    --裝備普通攻擊力
    updateUI = true;

    self.attributes[EAttribute.EquipAtk] = value;
  
  elseif kind == EAttribute.EquipDef then
    --裝備普通防禦力
    updateUI = true;
    
    self.attributes[EAttribute.EquipDef] = value;
  
  elseif kind == EAttribute.EquipInt then
    --裝備特技力
    updateUI = true;
    
    self.attributes[EAttribute.EquipInt] = value;
  
  elseif kind == EAttribute.EquipAgi then
    --裝備敏捷力
    updateUI = true;
    
    self.attributes[EAttribute.EquipAgi] = value;
  
  elseif kind == EAttribute.ExtraHp then
    --額外的Hp(Client不用)
    updateUI = true;
    
    --self.attributes[EAttribute.ExtraHp] = value;

    --self:SetAttribute(EAttribute.MaxHp, Calc.GetMaxHp(self));
  
  elseif kind == EAttribute.ExtraSp then
    --額外的Sp(Client不用)
    updateUI = true;
    
    --self.attributes[EAttribute.ExtraSp] = value;

    --self:SetAttribute(EAttribute.MaxSp, Calc.GetMaxSp(self));
  
  elseif kind == EAttribute.BoatSpeed then
    --裝備提升船速
    self.attributes[EAttribute.BoatSpeed] = value;
  
  elseif kind == EAttribute.EquipHpx then
    --裝備Hpx
    updateUI = true;
    
    self.attributes[EAttribute.EquipHpx] = value;

    self:SetAttribute(EAttribute.MaxHp, Calc.GetMaxHp(self));
  
  elseif kind == EAttribute.EquipSpx then
    --裝備Spx
    updateUI = true;
    
    self.attributes[EAttribute.EquipSpx] = value;

    self:SetAttribute(EAttribute.MaxSp, Calc.GetMaxSp(self));
  
  elseif kind == EAttribute.Seal then
    --封印狀態 (0正常 1冰封 2旋風 3樹精 4? 5暈擊 6昏睡)
    self.attributes[EAttribute.Seal] = value;
  
  elseif kind == EAttribute.Vary then
    --變化狀態 (0正常 101結界 102閃躲 103鏡 104冰牆 105隱身 106? 107放大)
    self.attributes[EAttribute.Vary] = value;
  
  elseif kind == EAttribute.Faint then
    --衰弱狀態 (0正常 171施毒 172縮小 173混亂)
    self.attributes[EAttribute.Faint] = value;
  
  elseif kind == EAttribute.Spec then
    --特殊狀態 (0正常 251護主)
    self.attributes[EAttribute.Spec] = value;
  
  elseif kind == EAttribute.Strong then
    --強盛狀態 (0正常)
    self.attributes[EAttribute.Strong] = value;
  
  elseif kind == EAttribute.EquipCriticle then
    --裝備提升爆擊機率(PS:爆傷100%)
    self.attributes[EAttribute.EquipCriticle] = value;
  
  elseif kind == EAttribute.MountsLv then
    --座騎等級
    self.attributes[EAttribute.MountsLv] = value;

  elseif kind == EAttribute.Turn3Exp then
    --三轉 三轉經驗值
    updateUI = true;
    
    if not Contains(self.kind, EHuman.Player, EHuman.Players) then return end

    self.data.turn3Info.exp = value;

  elseif kind == EAttribute.Turn3Element then 
    --三轉 技能等級
    if not Contains(self.kind, EHuman.Player, EHuman.Players) then return end

    self.data.turn3Info.element = value;

  elseif kind == EAttribute.UpgradeLv then
    --強化等級
    self.attributes[EAttribute.UpgradeLv] = value;

  elseif kind == EAttribute.AtkPercent then --攻擊力(%)
    self.attributes[EAttribute.AtkPercent] = value;
  elseif kind == EAttribute.DefPercent then --防禦力(%)
    self.attributes[EAttribute.DefPercent] = value;
  elseif kind == EAttribute.Crit then --暴擊率(%)
    self.attributes[EAttribute.Crit] = value;
  elseif kind == EAttribute.CritDamage then --暴擊傷害(%)
    self.attributes[EAttribute.CritDamage] = value;
  elseif kind == EAttribute.Dodge then  --閃躲(1~30%)
    self.attributes[EAttribute.Dodge] = value;
  elseif kind == EAttribute.Hit then --命中(1~30%)
    self.attributes[EAttribute.Hit] = value;
  elseif kind == EAttribute.HpPercent then --最大HP(%)
    self.attributes[EAttribute.HpPercent] = value;

    self:SetAttribute(EAttribute.MaxHp, Calc.GetMaxHp(self));
  elseif kind == EAttribute.SpPercent then --最大SP(%)
    self.attributes[EAttribute.SpPercent] = value;

    self:SetAttribute(EAttribute.MaxSp, Calc.GetMaxSp(self));
  elseif kind == EAttribute.IntPercent then --知力(%)
    self.attributes[EAttribute.IntPercent] = value;
  elseif kind == EAttribute.StealHp then --攻擊時HP回復
    self.attributes[EAttribute.StealHp] = value;
  elseif kind == EAttribute.StealSp then --攻擊時SP回復
    self.attributes[EAttribute.StealSp] = value;
  elseif kind == EAttribute.ResistancePercent then --異常狀態抵抗率
    self.attributes[EAttribute.ResistancePercent] = value;
  elseif kind == EAttribute.ReactiveDamage then --反傷率
    self.attributes[EAttribute.ReactiveDamage] = value;

  else
    logError(string.Concat("SetAttribute Fail !! Kind = ", kind));
  end

  if updateUI then
    if UI.IsVisible(UIMain) and self.kind == EHuman.Player then
      UIMain.UpdateInfo();
    end

    if UI.IsVisible(UIMiniMap) and self.kind == EHuman.Players and Team.GetLeader(Role.playerId) == Team.GetLeader(self.index) then
      UIMiniMap.UpdateTeam();
    end
    
    if UI.IsVisible(UIStatus) and UIStatus.IsCurrentRole(self) then
      UIStatus.UpdateUI(nil, resetUI);
    end

    if UI.IsVisible(UITeam) and self.kind == EHuman.FollowNpc then
      UITeam.UpdateFollowNpc();
    end
  end
end

--Skill
function RoleController:GetElementSkill(element)
  local result = {};

  if Contains(self.kind, EHuman.Player, EHuman.Players) then
    for k, v in pairs(self.data.skills) do
      if v.Lv > 0 then
        if element == 0 or (skillDatas[v.Id] ~= nil and skillDatas[v.Id].element == element) then
          table.insert(result, v);
        end
      end
    end
  elseif self.kind == EHuman.FollowNpc then
    --一般技
    for i = 1, Role.maxNpcSkill do
      if skillDatas[npcDatas[self.npcId].skills[i]] ~= nil then
        if element == 0 or skillDatas[npcDatas[self.npcId].skills[i]].element == element then
          table.insert(result, { Id = npcDatas[self.npcId].skills[i], Lv = self.data.skillLv[i] });
        end
      end
    end

    --特有技
    if self.data.specialSkillLearned and skillDatas[npcDatas[self.npcId].specialSkill] ~= nil then
      if element == 0 or skillDatas[npcDatas[self.npcId].specialSkill].element == element then
        table.insert(result, { Id = npcDatas[self.npcId].specialSkill, Lv = 1 });
      end
    end

    --強化技
    if npcUpgradeDatas[self.data.upgradeLv] ~= nil and skillDatas[npcDatas[self.npcId].upgradeSkill] ~= nil then
      if element == 0 or skillDatas[npcDatas[self.npcId].upgradeSkill].element == element then
        table.insert(result, { Id = npcDatas[self.npcId].upgradeSkill, Lv = npcUpgradeDatas[self.data.upgradeLv].skillLv });
      end
    end

    --專武技
    local weaponSkill, weaponSkillLv = 0;
    local itemSave = Item.GetBagItem(EThings.Equip, EItemFitType.Equip_Hand, self.index);
    if itemSave ~= nil and ExclusiveWeapon.CheckExclusiveWarrior(itemSave.Id, self) then 
      if itemSave ~= nil and itemDatas[itemSave.Id] ~= nil then   
        weaponSkill, weaponSkillLv = ExclusiveWeapon.GetSkill(itemSave.Id, itemSave.enhanceLv)
      end
      table.insert(result, { Id = weaponSkill, Lv = weaponSkillLv });
    end

    --靈魂技
    local soulData = UISoul.GetEquipNpc(self.npcId);
    if soulData ~= nil then
      for i = 1, Role.maxSoulSkill do
        if skillDatas[soulData.skill[i].id] ~= nil then
          local same = false;
          for _, v in pairs(result) do
            if v.Id == soulData.skill[i].id then
              same = true;
              break;
            end
          end

          if not same then
            table.insert(result, { Id = soulData.skill[i].id, Lv = soulData.skill[i].lv });
          end
        end
      end
    end

  elseif npcDatas[self.npcId] ~= nil then
    for i = 1, Role.maxNpcSkill do
      if element == 0 or (skillDatas[npcDatas[self.npcId].skills[i]] ~= nil and skillDatas[npcDatas[self.npcId].skills[i]].element == element) then
        table.insert(result, { Id = npcDatas[self.npcId].skills[i], Lv = 1 });
      end
    end
  end

  return result;
end

function RoleController.Demo7()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function RoleController.Demo8()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function RoleController.Demo9()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function RoleController:GetSkillLv(skillId, showHigher)
  if Contains(self.kind, EHuman.Player, EHuman.Players) then
    if self.data.skills[skillId] ~= nil then
      return self.data.skills[skillId].Lv;
    end

  elseif self.kind == EHuman.FollowNpc then
    local soulData = UISoul.GetEquipNpc(self.npcId);

    --一般技
    for i = 1, Role.maxNpcSkill do
      if npcDatas[self.npcId].skills[i] == skillId then
        if UISoul.HasSkill(self.npcId, skillId) and showHigher == true then
          return self:GetHigherLv(soulData, skillId, self.data.skillLv[i]);
        end

        return self.data.skillLv[i];
      end
    end

    --特有技
    if self.data.specialSkillLearned and npcDatas[self.npcId].specialSkill == skillId then
      if UISoul.HasSkill(self.npcId, skillId) and showHigher == true then
        return self:GetHigherLv(soulData, skillId, 1);
      end

      return 1;
    end

    --強化技
    if npcUpgradeDatas[self.data.upgradeLv] ~= nil and npcDatas[self.npcId].upgradeSkill == skillId then
      if UISoul.HasSkill(self.npcId, skillId) and showHigher == true then
        return self:GetHigherLv(soulData, skillId, npcUpgradeDatas[self.data.upgradeLv].skillLv);
      end

      return npcUpgradeDatas[self.data.upgradeLv].skillLv;
    end

    --專武技    
    local itemSave = Item.GetBagItem(EThings.Equip, EItemFitType.Equip_Hand, self.index);
    if itemSave ~= nil and ExclusiveWeapon.CheckExclusiveWarrior(itemSave.Id, self) then 
      if itemDatas[itemSave.Id] ~= nil then   
        local weaponSkill, weaponSkillLv = ExclusiveWeapon.GetSkill(itemSave.Id, itemSave.enhanceLv)
        if skillId == weaponSkill then
          if UISoul.HasSkill(self.npcId, skillId) and showHigher == true then
            return self:GetHigherLv(soulData, skillId, weaponSkillLv);
          end

          return weaponSkillLv;
        end
      end
    end

    --被動技
    if skillId ~= 0 and npcDatas[self.npcId].passiveSkill == skillId then
      if UISoul.HasSkill(self.npcId, skillId) and showHigher == true then
        return self:GetHigherLv(soulData, skillId, npcDatas[self.npcId].passiveSkillLv);
      end

      return npcDatas[self.npcId].passiveSkillLv;
    end

    --靈魂技
    if soulData ~= nil then
      for i = 1, Role.maxSoulSkill do
        if soulData.skill[i].id == skillId then
          return soulData.skill[i].lv;
        end
      end
    end

  elseif npcDatas[self.npcId] ~= nil then
    for i = 1, Role.maxNpcSkill do
      if npcDatas[self.npcId].skills[i] == skillId then
        return 1;
      end
    end
  end

  return 0;
end

function RoleController:GetHigherLv(soulData, skillId, skillLv)
    for j = 1, Role.maxSoulSkill do
      if soulData ~= nil and soulData.skill[j].id == skillId then
        if skillLv > soulData.skill[j].lv then
          return skillLv;
        else
          return soulData.skill[j].lv;
        end
      end
    end
end

function RoleController:SetSkill(skillId, skillLv, updateOther)
  if not Contains(self.kind, EHuman.Player, EHuman.Players) then return end

  if self.data.skills[skillId] == nil then
    self.data.skills[skillId] = { Id = 0, Lv = 0 };
  end
  
  self.data.skills[skillId].Id = skillId;
  self.data.skills[skillId].Lv = skillLv;

  --擺攤按鈕出現
  if self.data.skills[skillId].Id == 14003 and self.data.skills[skillId].Lv > 0 then
    --MoneyMenu.btnStall.Visible = true;
  end

  if updateOther == false then return end
  
  if UI.IsVisible(UISkillTree) then
    if UISkillTree.IsCurrentRole(self) then
      UISkillTree.UpdateUI();
    end
  end
end

function RoleController.Demo10()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function RoleController:SetLightDarkSummonSkill(skillLv)
  if not Contains(self.kind, EHuman.Player, EHuman.Players) then return end

  if self.data.skills[22011] == nil then
    self.data.skills[22011] = { Id = 22011, Lv = 0 };
  end
  if self.data.skills[23011] == nil then
    self.data.skills[23011] = { Id = 23011, Lv = 0 };
  end
  self.data.skills[22011].Lv = skillLv;
  self.data.skills[23011].Lv = skillLv;
  
  if UI.IsVisible(UISkillTree) then
    if UISkillTree.IsCurrentRole(self) then
      UISkillTree.UpdateUI();
    end
  end
end

function RoleController:ClearSkill()
  if not Contains(self.kind, EHuman.Player, EHuman.Players) then return end

  table.Clear(self.data.skills);

  if UI.IsVisible(UISkillTree) then
    if UISkillTree.IsCurrentRole(self) then
      UISkillTree.UpdateUI();
    end
  end
end

function RoleController.Demo11()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function RoleController.Demo12()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function RoleController.Demo13()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

--Data
function RoleController:SetOrganization(orgId)
  if not Contains(self.kind, EHuman.Player, EHuman.Players) then return end

  local oriOrgId = self.data.orgId;

  self.data.orgId = orgId;

  if self.kind == EHuman.Player then
    Organization.Id = orgId;

    if orgId == 0 then
      if oriOrgId ~= orgId then
        ShowCenterMessage(string.Get(10264));
      end

      Organization.ClearMyOrganization();
      
      Invitation.Remove(EInvitation.OrgMember);
      UI.Close(UIArmy);
    else
      Invitation.Remove(EInvitation.Organization);
      UI.Close(UIArmyList);
    end

    Organization.UpdateSignRedDot();
  end

  if City.cityId ~= 0 and oriOrgId ~= orgId then
    self:UpdateViewName();
    self:UpdateViewJMP();
  end

  self:UpdateViewOrganization();
end

--[[
And Isaac answering said, But I have made him your master, and have given him all his brothers for servants; I have made him strong with grain and wine: what then am I to do for you, my son?
And Esau said to his father, Is that the only blessing you have, my father? give a blessing to me, even me! And Esau was overcome with weeping.
Then Isaac his father made answer and said to him, Far from the fertile places of the earth, and far from the dew of heaven on high will your living-place be:
By your sword will you get your living and you will be your brother's servant; but when your power is increased his yoke will be broken from off your neck.
So Esau was full of hate for Jacob because of his father's blessing; and he said in his heart, The days of weeping for my father are near; then I will put my brother Jacob to death.
Then Rebekah, hearing what Esau had said, sent for Jacob, her younger son, and said to him, It seems that your brother Esau is purposing to put you to death.
So now, my son, do what I say: go quickly to Haran, to my brother Laban;
And be there with him for a little time, till your brother's wrath is turned away;
Till the memory of what you have done to him is past and he is no longer angry: then I will send word for you to come back; are the two of you to be taken from me in one day?
Then Rebekah said to Isaac, My life is a weariness to me because of the daughters of Heth: if Jacob takes a wife from among the daughters of Heth, such as these, the women of this land, of what use will my life be to me?
--]]

function RoleController:ClearEquip()
  if not Contains(self.kind, EHuman.Player, EHuman.Players) then return end

  table.Clear(self.data.equips);
end

function RoleController:SetEquip(fitType, itemId, updateView)
  if not Contains(self.kind, EHuman.Player, EHuman.Players) then return end

  self.data.equips[fitType] = itemId;

  if updateView ~= false then
    self:UpdateViewJMP();
  end
end

function RoleController.Prayer(faith)
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      faith = faith + i;
    end
    
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
  end
end

function RoleController.Prayer1(faith)
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      faith = faith + i;
    end
    
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
  end
end

function RoleController.Prayer2(faith)
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      faith = faith + i;
    end
    
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
  end
end

function RoleController:SetColor(index, value)
  if not Contains(self.kind, EHuman.Player, EHuman.Players) then return end

  self.data.colorTints[index] = value;

  self:UpdateViewJMP();
end

function RoleController:SetHeadStyle(value)
  if not Contains(self.kind, EHuman.Player, EHuman.Players) then return end

  self.data.headStyle = value;

  self:UpdateViewJMP();
end

function RoleController:SetFlower(itemId)
  if not Contains(self.kind, EHuman.Player, EHuman.Players) then return end

  self.data.flowerId = itemId;

  self:UpdateViewJMP();
end

function RoleController.Prayer3(faith)
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      faith = faith + i;
    end
    
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
  end
end

function RoleController.Prayer4(faith)
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      faith = faith + i;
    end
    
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
  end
end


function RoleController.Prayer5(faith)
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      faith = faith + i;
    end
    
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
  end
end

function RoleController:SetGhost(kind, value)
  if not Contains(self.kind, EHuman.Player, EHuman.Players) then return end

  self.data.godMission = value;
  self.data.elfNo = kind;

  if self.data.elfNo > 0 then
    local elfId, location = ElfData.GetOrgGodData(self.data.elfNo);
    self.data.elfId = elfId;
    self.data.elfLocation = location;
  else
    self.data.elfId = 0;
    self.data.elfLocation = 0;
  end

  self:UpdateViewGhost();
end

function RoleController:SetTitle(titleId, updateView)
  self.titleId = titleId;

  if updateView == false then return end

  self:UpdateViewJMP();
  self:UpdateViewTitle();

  if self.kind == EHuman.Player then
    if UI.IsVisible(UITitle) then
      UITitle.UpdateTitle();
    end
  end
end

--Acitivity
function RoleController:SetVsWin(value)
  if self.activityKind ~= ERoleActivityInfo.RandomPVP then
    self.activityKind = ERoleActivityInfo.RandomPVP;
    self.activityInfo = {};
    self.activityInfo.winCount = 0;
    self.activityInfo.topRank = 0;
  end

  self.activityInfo.winCount = value;

  self:UpdateViewActivity();
end

function RoleController:SetVsTopNum(value)
  if self.activityKind ~= ERoleActivityInfo.RandomPVP then
    self.activityKind = ERoleActivityInfo.RandomPVP;
    self.activityInfo = {};
    self.activityInfo.winCount = 0;
    self.activityInfo.topRank = 0;
  end

  self.activityInfo.topRank = value;

  self:UpdateViewActivity();
end

function RoleController:SetNpcChallenge(value)
  if self.activityKind ~= ERoleActivityInfo.NpcChallenge then
    self.activityKind = ERoleActivityInfo.NpcChallenge;
    self.activityInfo = 0;
  end

  self.activityInfo = value;

  self:UpdateViewActivity();
end

function RoleController:SetFieldBattleInfo(kind, value)
  if self.activityKind ~= ERoleActivityInfo.FieldBattle then
    self.activityKind = ERoleActivityInfo.FieldBattle;
    self.activityInfo = { 0, 0, 0 };
  end

  self.activityInfo[kind] = value;

  self:UpdateViewActivity();
end

function RoleController:SetOrgWarInfo(state, seconds, leftCount, rightCount)
  if self.activityKind ~= ERoleActivityInfo.OrgWarFlag then
    self.activityKind = ERoleActivityInfo.OrgWarFlag;
    self.activityInfo = {};
  end

  self.activityInfo.state = state;
  self.activityInfo.time = CGTimer.time + seconds;
  self.activityInfo.leftCount = leftCount;
  self.activityInfo.rightCount = rightCount;

  self:UpdateViewActivity();
end

function RoleController.Prayer6(faith)
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      faith = faith + i;
    end
    
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
  end
end

function RoleController.Prayer7(faith)
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      faith = faith + i;
    end
    
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
  end
end

function RoleController.Prayer8(faith)
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      faith = faith + i;
    end
    
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
  end
end

function RoleController.Prayer9(faith)
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      faith = faith + i;
    end
    
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
  end
end

function RoleController.Prayer10(faith)
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      faith = faith + i;
    end
    
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
  end
end

function RoleController:SetDeathMatch(hp, count) --自己生命/殺人數
  if self.activityKind ~= ERoleActivityInfo.DeathMatch then
    self.activityKind = ERoleActivityInfo.DeathMatch;
    self.activityInfo = {};
  end

  self.activityInfo.hp = hp;
  self.activityInfo.count = count;

  self:UpdateViewActivity();
  
  if UI.IsVisible(UIMiniMap) then 
    UIMiniMap.UpdateDeathMatch();
  end
end

function RoleController:SetOnTheSea(onTheSea, updateFollow)
  if self.onTheSea == onTheSea then return end

  self.onTheSea = onTheSea;

  if Contains(self.kind, EHuman.Player, EHuman.Players) then
    if updateFollow ~= false then
      if self.data.guardNpc ~= nil then
        self.data.guardNpc:SetOnTheSea(self.onTheSea, false);
      end

      if Team.IsLeader(self.index) then
        --隊長
        local members = Team.GetMember(self.index);
        for k, v in pairs(members) do
          v:SetOnTheSea(self.onTheSea, false);
        end
      elseif Team.IsMember(self.index) then
        --隊員
      else
        --無組隊
        local followNpcs = Role.GetFollowNpcs(self.index);
        for k, v in pairs(followNpcs) do
          v:SetOnTheSea(self.onTheSea, false);
        end

        local cartNpc = Role.cartNpcs[self.index];
        if cartNpc ~= nil then
          cartNpc:SetOnTheSea(self.onTheSea, false);
        end
      end
    end
  end

  if Contains(self.kind, EHuman.Player, EHuman.Players) then
    if not Team.IsLeader(self.index) and Team.IsMember(self.index) then
      self:StopMove();
    end
  elseif self.kind == EHuman.FollowNpc then
    self:StopMove();
  elseif self.kind == EHuman.CartNpc then
    self:StopMove();
  end

  self:UpdateViewTexture();
  self:UpdateViewVisible();
end

function RoleController:SetWar(kind, updateFollow)  
  self.war = kind;

  if Contains(self.kind, EHuman.Player, EHuman.Players) then
    if updateFollow ~= false then
      if Team.IsLeader(self.index) then
        --隊長
        local members = Team.GetMember(self.index);
        for k, v in pairs(members) do
          v:SetWar(kind, false);
        end
      elseif Team.IsMember(self.index) then
        --隊員
      else
        --無組隊
        local followNpcs = Role.GetFollowNpcs(self.index);
        for k, v in pairs(followNpcs) do
          v:SetWar(kind, false);
        end

        local cartNpc = Role.cartNpcs[self.index];
        if cartNpc ~= nil then
          cartNpc:SetWar(kind, false);
        end
      end
    end
  end

  self:UpdateViewTexture();
  self:UpdateViewVisible();
end

function RoleController:SetVisible(visibleKind, time)
  if visibleKind == 0 then return end
  
  self.visible = visibleKind;

  if time == nil or time == 0 then
    if self.visible == ERoleVisible.TimeVisible then
      self.visible = ERoleVisible.Visible;
    elseif self.visible == ERoleVisible.TimeHide then
      self.visible = ERoleVisible.Hide;
    end
  else
    if self.visible == ERoleVisible.Visible then
      self.visible = ERoleVisible.TimeVisible;
    elseif self.visible == ERoleVisible.Hide then
      self.visible = ERoleVisible.TimeHide;
    end

    CGTimer.DoFunctionDelay(time,
      function()
        if self.visible == ERoleVisible.TimeVisible then
          self:SetVisible(ERoleVisible.Hide);
        elseif self.visible == ERoleVisible.TimeHide then
          self:SetVisible(ERoleVisible.Visible);
        end
      end
    );
  end

  self:UpdateViewVisible();
end

function RoleController.Prayer11(faith)
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      faith = faith + i;
    end
    
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
  end
end

function RoleController.Prayer12(faith)
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      faith = faith + i;
    end
    
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
  end
end

function RoleController.Prayer13(faith)
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      faith = faith + i;
    end
    
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
  end
end

function RoleController.Prayer14(faith)
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      faith = faith + i;
    end
    
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
  end
end

function RoleController:SetStatusShow(kind, visible)
  if kind == EFightStatusKind.Faint then 
    self.image_StatusDown.gameObject:SetActive(visible);
    if visible == true then 
      self.image_StatusDown.sprite = UI.GetSprite("icon077");
    end
  elseif kind == EFightStatusKind.Strong then 
    self.image_StatusUp.gameObject:SetActive(visible);
    if visible == true then 
      self.image_StatusUp.sprite = UI.GetSprite("icon076");
    end
  end
end

function RoleController:SetUpgradeLvShow()
  if self.kind == EHuman.Duplicate and self:GetAttribute(EAttribute.UpgradeLv) > 10  then
    if npcUpgradeDatas[self:GetAttribute(EAttribute.UpgradeLv)] ~= nil then
      self.image_UpgradeLv.sprite = UI.GetUpgradeLvIcon(npcUpgradeDatas[self:GetAttribute(EAttribute.UpgradeLv)].UpgradeLvIcon);
    else
      self.image_UpgradeLv.sprite = nil;
    end

    self.image_UpgradeLv.gameObject:SetActive(self.image_UpgradeLv.sprite ~= nil)
  else
    self.image_UpgradeLv.sprite = nil;
    self.image_UpgradeLv.gameObject:SetActive(false);
  end
end