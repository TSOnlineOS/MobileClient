EItemFitType = {
  --裝備
  Equip_Head = 1, --帽
  Equip_Body = 2, --衣
  Equip_Hand = 3, --武器
  Equip_Wrist = 4, --護脕
  Equip_Boots = 5, --鞋子
  Equip_Spec = 6, --特殊
  --時裝
  Style_Head = 7, --帽
  Style_Body = 8, --衣
  Style_Hand = 9, --武器
  Style_Wrist = 10, --護脕
  Style_Boots = 11, --鞋子
  --外顯時裝
  OutfitStyle_Head = 12, --帽
  OutfitStyle_Body = 13, --衣
  OutfitStyle_Hand = 14, --武器
  OutfitStyle_Wrist = 15, --護脕
  OutfitStyle_Boots = 16, --鞋子
  --其他
  Equip_Cape = 100, --披風
}

EStoneAttr = {  --(1知力、2攻擊、3防禦、4體質、5能量、6敏捷、7暴擊)
  Stone_None = 0,
  Stone_Int = 1,
  Stone_Atk = 2,
  Stone_Def = 3,
  Stone_Hpx = 4,
  Stone_Spx = 5,
  Stone_Agi = 6,
  Stone_DblAtk = 7,
}

--靈石分類
EStoneKind = {
  StoneKind_Normal = 1,  --一般靈石
  StoneKind_Bless = 2,   --祝福靈石
  StoneKind_Rate = 3,    --強化機率
  StoneKind_Assign = 4,  --指定階層
}

EItemKind = {
  Item_1 = 1, --短刀 
  Item_2 = 2, --劍 
  Item_3 = 3, --短戟 
  Item_4 = 4, --大刀 
  Item_5 = 5, --槍矛 
  Item_6 = 6, --長戟 
  Item_7 = 7, --弓弩 
  Item_8 = 8, --轉生裝備 
  Item_9 = 9, --書(羽扇) 
  Item_10 = 10, --衣服 
  Item_11 = 11, --頭飾 
  Item_12 = 12, --護腕 
  Item_13 = 13, --靴子 
  Item_14 = 14, --特殊物 
  Feather = 15, --附加羽毛 
  Item_16 = 16, --符咒 
  Item_17 = 17, --食物 
  Item_18 = 18, --補藥 
  Item_19 = 19, --毒藥 
  Item_20 = 20, --信物a 
  Item_21 = 21, --信物b 
  Item_22 = 22, --信物c 
  Item_23 = 23, --雜物 
  Item_24 = 24, --陶土 
  Item_25 = 25, --木材 
  Item_26 = 26, --硬殼 
  Item_27 = 27, --骨骼 
  Item_28 = 28, --玉 
  Item_29 = 29, --精髓  
  Item_30 = 30, --皮毛 
  Item_31 = 31, --布匹 
  Item_32 = 32, --紙 
  Item_33 = 33, --竹 
  Item_34 = 34, --植物 
  Item_35 = 35, --礦石 
  Ice = 36, --冰 
  NpcTurn = 37, --武將轉生信物
  SpecialAbility = 38, --外掛功能物 
  Item_39 = 39, --特殊武器 
  Item_40 = 40, --金 
  Item_41 = 41, --銀 
  Item_42 = 42, --銅 
  Item_43 = 43, --鐵 
  Item_44 = 44, --錫 
  Item_45 = 45, --紫水晶 
  Item_46 = 46, --紅水晶 
  Item_47 = 47, --給錯管制品用此代替 
  Transform = 48, --變身寶物 
  NpcFaith = 49, --攏絡物品 
  Item_50 = 50, --復活類 
  NpcTurn2 = 51, --武將二轉信物 
  Item_52 = 52, --修練物品 
  CityWeapon = 53, --攻城道具  
  Item_54 = 54, --軍團回城捲軸 
  Pearl = 55, --抗封印珍珠 
  Item_56 = 56, --生存裝備 
  SoulWeapon = 57, --靈性武器 
  Item_58 = 58, --武將特有技信物 
  NpcEquip = 59, --武將專用裝備 
  Item_60 = 60, --戰船與合成原料 
  Item_61 = 61, --水戰道具 
  SoulEquip = 62, --靈性裝備(排列規則-同類別須在同一區塊,編號與等級無分別)
  Item_66 = 66, --任務信物 
  Gem = 67, --靈石 
  Item_68 = 68, --造型
  DamageEquip = 69, --會損壞裝備類
  Item_80 = 80, --直接使用
  MountsEquip = 81, --座騎裝備
  Item_82 = 82, --直接使用 
  DoroCard = 83, --卡片
  TianGuanEquip = 84, --天官裝備
  TianGuanEnhance = 85, --天官強化道具
  Remove = 86, --消除令
  ExclusiveWeapon = 87, --專武
  Reinforced = 88, --升階洗鍊
  Furniture = 89, --家具
  Myth = 90, --神話裝
  Enchant = 91, --神話符文
  Hammer = 92, --神工錘
  Elf = 93, --elf
  Soul = 94,  --靈魂
}

EItemUseKind = {
  ItemUse_1 = 1, --Mp3功能  
  ItemUse_2 = 2, --回儲存點 
  ItemUse_3 = 3, --選擇儲存點  
  ItemUse_4 = 4, --不遇敵20秒  
  TransformDoll = 5, --變身娃娃  
  ItemUse_6 = 6, --天行卷軸  
  ItemUse_7 = 7, --城戰天譴旗 
  ItemUse_8 = 8, --鋤頭 
  ItemUse_9 = 9, --城戰變身魂玉 
  ItemUse_10 = 10, --領悟丹 
  ItemUse_11 = 11, --錢莊木人 
  ItemUse_12 = 12, --穿上就是聖誕惡魔 
  ItemUse_13 = 13, --自動攻擊敵人 
  ItemUse_14 = 14, --自動攻擊敵並使用物品 
  ItemUse_15 = 15, --使用法術攻擊敵人 
  ItemUse_16 = 16, --特殊神行卷軸 
  ItemUse_17 = 17, --特殊神行卷軸 
  ItemUse_18 = 18, --特殊神行卷軸 
  ItemUse_19 = 19, --特殊神行卷軸 
  ItemUse_20 = 20, --特殊神行卷軸 
  ItemUse_21 = 21, --特殊神行卷軸 
  ItemUse_22 = 22, --特殊神行卷軸 
  ItemUse_23 = 23, --特殊神行卷軸 
  ItemUse_24 = 24, --特殊神行卷軸 
  ItemUse_25 = 25, --體力全部回復 
  WorldChannelHorn = 26, --全頻功能
  ItemUse_27 = 27, --自動行走 
  ItemUse_28 = 28, --自動離線 
  ItemUse_29 = 29, --自動食用52類物品 
  ItemUse_30 = 30, --能力點數回溯一級 
  ItemUse_31 = 31, --特技點數回溯一級 
  ItemUse_32 = 32, --可隨身休息的客棧 
  ItemUse_35 = 35, --五大城回城卷軸 
  ItemUse_36 = 36, --五大城回城卷軸 
  ItemUse_37 = 37, --五大城回城卷軸 
  ItemUse_38 = 38, --五大城回城卷軸 
  ItemUse_39 = 39, --五大城回城卷軸 
  ExpEquip150Pa = 40, --使用時經驗值為1.5倍 
  ItemUse_41 = 41, --有機率出現兩倍的敏捷 
  ItemUse_42 = 42, --有機率出現兩倍殺傷力 
  ItemUse_43 = 43, --換上就是狸貓裝 
  ItemUse_44 = 44, --換上就是小熊裝 
  ItemUse_45 = 45, --換上就是貓咪裝 
  ItemUse_46 = 46, --合成後隨玩家屬性變化的羽化 
  ItemUse_47 = 47, --合成有機率得到雙倍物品 
  ItemUse_48 = 48, --可開啟得禮物 
  ItemUse_49 = 49, --特技紋章 
  ExpEquip200Pa = 50, --使用時經驗值為2倍 
  ItemUse_51 = 51, --使用時可自動吃補藥 
  ItemUse_52 = 52, --使用時可連三場自動攻擊 
  ItemUse_53 = 53, --捧花 
  ItemUse_54 = 54, --補hp與sp全滿 
  ItemUse_55 = 55, --使出滾石技能 
  ItemUse_56 = 56, --染髮劑 
  ItemUse_57 = 57, --換膚色 
  ItemUse_58 = 58, --發出鞭炮效果 
  ItemUse_59 = 59, --召喚獸 
  ExpEquipArgPa = 60, --福神倍率 
  ItemUse_61 = 61, --可擲一顆骰子 
  ItemUse_62 = 62, --解除心系輔助技 
  ItemUse_63 = 63, --可擲三顆骰子 
  ItemUse_64 = 64, --防止混亂 
  NpcAttributePill = 65, --加npc能力點數 
  ItemUse_66 = 66, --大戰役加防禦 
  ItemUse_67 = 67, --大戰役加攻擊 
  ItemUse_68 = 68, --大戰役加知力 
  ItemUse_69 = 69, --大戰役加傷害 
  ItemUse_70 = 70, --大戰役克封印 
  ItemUse_71 = 71, --大戰役SP消耗增加 
  ItemUse_72 = 72, --提升二代武將六圍 
  ItemUse_73 = 73, --餵食二代武將 
  ItemUse_74 = 74, --二代武將消去特技 
  ItemUse_75 = 75, --技能書 
  ItemUse_76 = 76, --特殊神行卷軸 
  ItemUse_77 = 77, --特殊神行卷軸 
  ItemUse_78 = 78, --特殊神行卷軸 
  ItemUse_79 = 79, --特殊神行卷軸 
  ItemUse_80 = 80, --特殊神行卷軸 
  ItemUse_81 = 81, --馬鞍 
  ItemUse_82 = 82, --進入吉普賽巴豆妖戰鬥 
  ItemUse_83 = 83, --二代武將變身 
  ItemUse_84 = 84, --肉博攻擊無效 
  ItemUse_85 = 85, --躲避狀態攻擊 
  ItemUse_86 = 86, --躲避召喚特技 
  ItemUse_87 = 87, --戰鬥中未死、下一回合HP加一百 
  ItemUse_88 = 88, --死亡時，攻擊之敵人也跟著死亡 
  ItemUse_89 = 89, --服用後有一倍半殺傷力 
  ItemUse_90 = 90, --挖礦可自動挖出高一級之礦物 
  FairyBean = 91,  --前往仙界
  ExpPill = 92, --經驗值丹 
  ExpGod = 93, --福神道具
  Firework = 108, --施放煙火
  ItemUse_111 = 111, --生存寶袋 
  ItemUse_112 = 112, --生存獎品 
  ItemUse_113 = 113, --生存獎品 
  ItemUse_114 = 114, --生存獎品 
  ItemUse_115 = 115, --每回合結束，所受狀態攻擊解除  
  ItemUse_118 = 118, --戰鬥中未死、兩回合加一定血量 
  ItemUse_119 = 119, --巾雞冠  
  ItemUse_124 = 124, --特殊神行卷軸 
  ItemUse_125 = 125, --特殊神行卷軸 
  ItemUse_126 = 126, --特殊神行卷軸 
  ItemUse_127 = 127, --特殊神行卷軸 
  ItemUse_128 = 128, --換上就是熊貓裝 
  ItemUse_129 = 129, --變換玩家髮型 
  ItemUse_130 = 130, --丟水球 
  ItemUse_131 = 131, --靈性裝備  
  ItemUse_139 = 139, --總HP提高100 
  ItemUse_140 = 140, --總SP提高50 
  PlayerAttributePill = 141, --加玩家能力點數  
  ItemUse_151 = 151, --特殊神行卷軸
  ItemUse_152 = 152, --特殊神行卷軸 
  ItemUse_153 = 153, --特殊神行卷軸 
  ItemUse_154 = 154, --特殊神行卷軸  
  ItemUse_155 = 155, --慈母之心 
  ItemUse_156 = 156, --進入鬼王戰鬥 
  ItemUse_157 = 157, --大戰役專用可開啟得禮物  
  ItemUse_164 = 164, --增加修練經驗值 
  ItemUse_165 = 165, --魔力全部回復 
  ItemUse_166 = 166, --轉蛋開啟得禮物 
  ItemUse_185 = 185, --每回合戰鬥回5%SP 
  ItemUse_186 = 186, --一次戰鬥可自動復生一次 
  ItemUse_187 = 187, --每回合戰鬥回10%HP 
  ItemUse_188 = 188, --武將覺醒之百寶袋 
  ItemUse_189 = 189, --換上就是龍舟裝 
  MachineBoxStone = 192, --機關盒晶石
  ItemUse_193 = 193, --改運換名符
  ItemUse_194 = 194, --商道錦囊
  NpcPicture = 195, --武將令牌(究極增加)  
  ItemUse_196 = 196, --增加技能點數1點(究極增加) 
  ItemUse_197 = 197, --記憶傳送符 
  ItemUse_198 = 198, --屬性轉換符 
  ItemUse_199 = 199, --隨身雜貨商 
  BattleAttributePill = 200, --戰鬥BUFF 
  ItemUse_201 = 201, --暢遊卡(水自動補滿) 
  ItemUse_202 = 202, --客棧升級 
  ItemUse_203 = 203, --世界BOSS加次數 
  ItemUse_204 = 204, --傳送符擴充 
  ItemUse_205 = 205, --武將能力重置 
  ItemUse_206 = 206, --機關盒擴充功能 
  ItemUse_207 = 207, --世界BOSS分數加倍 
  ItemUse_208 = 208, --職業轉換符 
  ItemUse_209 = 209, --物換星移 
  ItemUse_210 = 210, --強化狀態 
  Astrolabe = 211, --本命燈
  SkillPointPill = 212, --技能道具 
  ItemUse_213 = 213, --VIP會藉月卡 
  ItemUse_214 = 214, --史詩戰役加次數 
  ItemUse_215 = 215, --守護者之心 
  ItemUse_216 = 216, --加數值 
  Mounts = 217, --座騎外型 
  RoleCount = 218, --RoleCount代碼
  Exchange = 219, --兌換卡
  Doro = 220, --武將、卡片抽獎券
  ItemUse_222 = 222, --加永標
  BlissBagView = 223, --展開預覽福袋(抽獎值)
  LockBlissBag = 228, --需使用鑰匙開啟之寶箱福袋
  BlissBagKey = 229, --開啟寶箱用鑰匙
  EvolutionAdd = 230, --裝備進化加成
  ResetSkill = 231, --技能重置
  ExpBottle = 233, --經驗瓶
  WeaponRecipe = 234, --專武兌換
  RandomWeaponRecipe = 235, --隨機專武製作
  ArmyBlissBag = 236, --軍團福袋用
  --Elf = 239, --小精靈
  Soul = 240,  --靈魂
  SoulPoint = 243
}

ItemData = {}
ItemData.__index = ItemData;

function ItemData.Random()
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

function ItemData.RandomA()
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

function ItemData.New(reader)
  local self = {};
  setmetatable(self, ItemData);  
  
  self.name = LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16()));  --[1] 名稱
  self.kind = reader:ReadByte(); --[2] 類別

  self.Id = reader:ReadUInt16(); --[3] 編號  
  self.iconId = reader:ReadUInt16(); --[4] 男小圖號  

  self.picId = {};
  self.picId[1] = reader:ReadUInt16(); --[5] 男身圖號
  self.picId[2] = reader:ReadUInt16(); --[6] 女身圖號

  self.attribute = {};
  self.attribute[1] = {};
  self.attribute[2] = {};
  self.attribute[1].kind = reader:ReadUInt16(); --[7] 人物屬性幾號    --Attribute
  self.attribute[1].attrItem = reader:ReadByte(); --[8] 屬性細項      --AttrItem
  self.attribute[1].value = reader:ReadInt32(); --[9] 增減數值       --Value
  self.attribute[2].kind = reader:ReadUInt16(); --[10] 人物屬性幾號   --Attribute  
  self.attribute[2].attrItem = reader:ReadByte(); --[11] 屬性細項     --AttrItem  
  self.attribute[2].value = reader:ReadInt32(); --[12] 增減數值       --Value
  
  self.material = reader:ReadByte(); --[13] 材質 (1:金屬 2:石 3:木 4:紙 5:布 6:皮 7:食物 8:土壤 9:水 10:結晶 11:硬殼 12:骨)
  self.level = reader:ReadByte(); --[14] 等級
  self.fitType = reader:ReadByte(); --[15] 裝備方式 (1帽 2衣 3武器 4護脕 5鞋子 6特殊)
  self.specialAbility = reader:ReadUInt16(); --[16] 特別作用 (1Mp3功能,  2電子琴)

  self.colorTints = {};
  self.colorTints[1] = {};
  self.colorTints[2] = {};
  self.colorTints[1][1] = reader:ReadInt32(); --[17] 帽,髮,膚 (男)
  self.colorTints[1][2] = reader:ReadInt32(); --[18] 衣,配1,配2 (男)
  self.colorTints[1][3] = reader:ReadInt32(); --[19] 配3,配4,鞋 (男)
  self.colorTints[1][4] = reader:ReadInt32(); --[20] 武底,武配1,腕 (男)
  self.colorTints[2][1] = reader:ReadInt32(); --[21] 帽,髮,膚 (女)  
  self.colorTints[2][2] = reader:ReadInt32(); --[22] 衣,配1,配2 (女)  
  self.colorTints[2][3] = reader:ReadInt32(); --[23] 配3,配4,鞋 (女)  
  self.colorTints[2][4] = reader:ReadInt32(); --[24] 武底,武配1,腕 (女)
  
  self.openUsed = reader:ReadByte(); --[25] 開放否 (0開放 1否)
  self.needLv = reader:ReadByte(); --[26] 限制等級 (0~200Lv)含以上才可使用
  self.price = reader:ReadInt32(); --[27] 價格
  self.sellPrice = reader:ReadInt32(); --[28] 賣價
  self.gender = reader:ReadByte(); --[29] 性別限制 (1男用 2女用)
  self.restrict = reader:ReadByte(); --[30] 限制 處理限制  (0可丟棄 1丟棄則消滅 2不可轉讓 4非合成原料 8不可被合成 16不可賣予Npc 32不可存錢莊)
  self.threshold = reader:ReadInt32(); --[31] 發出數,1~225
  self.element = reader:ReadByte(); --[32] 屬性(0: 無 1:地 2:水 3:火 4:風 5: 心6: ? 7:光 8:暗)
  self.elementValue = reader:ReadInt32(); --[33] 屬值(100為不增不減,比100大為增,比100小為減)
  self.skillLink = reader:ReadUInt16(); --[34] 參考技能(10000~13014 技能ID)
  self.turn = reader:ReadByte(); --[35] 判斷有無轉生限制(0:未轉生 1:轉生後)
  self.giftDot = reader:ReadUInt16(); --[36] 戰役兌換獎品所需點數(戰功點數)
  self.spare2 = reader:ReadByte(); --[37] 備用2
  self.spare3 = reader:ReadUInt16(); --[38] 裝備處理
  self.restrict2 = reader:ReadByte(); --[39] 限制 處理限制2
  self.suitId = reader:ReadUInt16(); --[40] 套裝ID
  self.spare5 = reader:ReadByte(); --[41] 備用5
  self.directUse = reader:ReadByte(); --[42] 直接使用(0.否 1.是)
  self.roleCountIndex = reader:ReadUInt16(); --[43] RoleCount索引
  self.roleCountValue = reader:ReadInt32(); --[44]RoleCount值
  self.sort = reader:ReadByte(); --[45] 排序
  self.equipSwitch = {}; --裝備開關 1=隱藏頭髮 2=隱藏頭盔 4=隱藏護腕 8=隱藏鞋子 16=隱藏衣服 32=隱藏主手
  self.equipSwitch[1] = reader:ReadByte(); --[46]男 
  self.equipSwitch[2] = reader:ReadByte(); --[47]女
  self.btnState = reader:ReadByte(); --[48]使用鈕關閉原因
  self.durable = reader:ReadByte(); --[49]耐久顯示(0關 1開)
  self.furnaceKind = reader:ReadByte(); --[50]熔爐種類 1武將碎片 2裝備碎片 3.專武 4.神裝
  self.furnaceCount = reader:ReadUInt32(); --[51]熔爐碎片數量
  self.quality = reader:ReadByte(); --[52]品質 ( 0白 1綠 2藍 3紫 4紅 )
  self.auctionTag = reader:ReadByte(); --[53]拍賣主頁
  self.auctionSubTag = reader:ReadByte(); --[54]拍賣子類
  
  self.description = LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16())); --說明 Length <= 254
  self.description = string.ReomveSymbol(self.description, " ");

  if Define.TextCount then
    DataManager.textCount = DataManager.textCount + string.Count(self.name) + string.Count(self.description);
  end

  return self.Id, self;
end

function ItemData.RandomB()
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

function ItemData.RandomC()
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

function ItemData.RandomD()
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
function ItemData:GetName(withColor, withBrackets, allQualityColor)
  local result = self.name;

  if Define.IsDebugMode() then
    if not UIDebug.RecordMode then
      result = string.Concat(result, self.Id);
    end
  end
  
  if self.kind == EItemKind.ExclusiveWeapon then
    local npcName = npcDatas[self.spare3];
    if npcName ~= nil then
      result = string.Concat(result, " 「", npcName:GetName(), "」");
    end
  elseif  self.kind == EItemKind.Furniture then
    local furnitureInfo = furnitureDatas[self.spare3];

    if furnitureInfo ~= nil then
      for _, v in pairs(furnitureKindDatas) do
        if v.Id == furnitureInfo.seriesNumber and furnitureInfo.seriesNumber ~= 0 then
          result = string.Concat(v.kindName, "\n", result);
          break;
        end
      end
    end
  end
  
  if withColor == true and (self.quality > 0 or allQualityColor == true) then
    result = string.GetColorText(result, Color.ItemQuality[self.quality]);
  end
  
  if withBrackets == true then
    result = string.AddBrackets(result);
  end
  
  return result;
end

function ItemData:GetTrainLvText(itemSave)
  local result = "";

  if itemSave ~= nil and self.kind == 68 and itemSave.styleLv ~= nil and itemSave.styleLv > 0 then
    if fashionStressDatas[self.Id] ~= nil and itemSave.styleLv >= fashionStressDatas[self.Id].maxLv then
      result = string.Concat(result, string.format(string.Get(80499), string.Get(80496)));
    else
      result = string.Concat(result, string.format(string.Get(80499), string.format(string.Get(80488), itemSave.styleLv)));
    end
  end

  return result;
end

function ItemData.RandomF()
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

function ItemData.RandomG()
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

function ItemData.GetAttrText(attr)
  local result = nil;

  if attr == 1 then
    result = string.Get(20002);
  elseif attr == 2 then
    result = string.Get(20003);
  elseif attr == 3 then
    result = string.Get(20004);
  elseif attr == 4 then
    result = string.Get(20005);
  elseif attr == 5 then
    result = string.Get(20006);
  elseif attr == 7 then
    result = string.Get(20922);
  elseif attr == 8 then
    result = string.Get(20923);
  elseif attr == 25 then
    result = string.Get(20346);
  elseif attr == 26 then
    result = string.Get(20347);
  elseif attr == 101 then
    result = string.Get(23661); --攻擊力(%):
  elseif attr == 102 then
    result = string.Get(23662); --防禦力(%):
  elseif attr == 103 then
    result = string.Get(80318); --暴擊率:
  elseif attr == 104 then
    result = string.Get(23658); --爆擊傷害:
  elseif attr == 105 then
    result = string.Get(23665); --閃躲(%):
  elseif attr == 106 then
    result = string.Get(23666); --命中(%)
  elseif attr == 107 then
    result = string.Get(23663); --HP(%):
  elseif attr == 108 then
    result = string.Get(23664); --SP(%):
  elseif attr == 109 then
    result = string.Get(23660); --知力(%)
  elseif attr == 207 then
    result = string.Get(20348);
  elseif attr == 208 then
    result = string.Get(20349);
  elseif attr == 210 then
    result = string.Get(20350);
  elseif attr == 211 then
    result = string.Get(20351);
  elseif attr == 212 then
    result = string.Get(20352);
  elseif attr == 214 then
    result = string.Get(20353);
  elseif attr == 217 then
    result = string.Get(90136);
  elseif attr == 218 then
    result = string.Get(20040); --體質
  elseif attr == 219 then
    result = string.Get(20041); --能量
  elseif attr == 64 then
    result = string.Get(10406); --忠誠
  elseif attr == 87 then
    result = string.Get(23089); --爆擊傷害量
  elseif attr == 88 then
    result = string.Get(23090); --攻擊時HP回復
  elseif attr == 89 then
    result = string.Get(23091); --攻擊時SP回復
  elseif attr == 90 then
    result = string.Get(23092); --異常狀態抵祝率
  elseif attr == 91 then
    result = string.Get(23093); --反傷率
  else
    if attr > 0 then
      logError(" no define attr : " .. attr);
    end
  end
  
  return result;
end

function ItemData.RandomH()
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

function ItemData.RandomI()
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

function ItemData.RandomJ()
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

function ItemData.RandomK()
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

function ItemData.RandomL()
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

function ItemData:GetAttributeText(itemSave)
  local result = "";
  local styleValue = 0;
  local fashionData;

  if self.specialAbility == EItemUseKind.ItemUse_216 or self.specialAbility == EItemUseKind.SoulPoint then
    return result
  end

  if self.kind == EItemKind.Enchant then
    local attributeText = ItemData.GetAttrText(self.attribute[1].kind);
  
    if attributeText ~= nil then
      result = string.Concat(result, attributeText, self.attribute[1].value, " ~ ", self.attribute[2].value);
    end
    
    return result;
  end

  for i = 1, 2 do
    if self.attribute[i].value ~= 0 and self.attribute[i].value ~= 100 then
      local attributeText = nil;

      attributeText = ItemData.GetAttrText(self.attribute[i].kind);

      if attributeText ~= nil then
        if Item.IsStyle(self.fitType) then
          fashionData = fashionStressDatas[self.Id];
          if fashionData ~= nil and itemSave ~= nil then
            if fashionData.attributes[i].attr == self.attribute[i].kind then
              styleValue = (math.floor(itemSave.styleLv / 5) * fashionData.attributes[i].bonus) + (fashionData.attributes[i].value * itemSave.styleLv);
            end
          end
        end

        if self.attribute[i].value > 100 then
          if not string.IsNullOrEmpty(result) then
            result = string.Concat(result, "\n");
          end

          result = string.Concat(result, attributeText, " +", (self.attribute[i].value - 100 + styleValue));

        elseif self.attribute[i].value < 100 then
          if not string.IsNullOrEmpty(result) then
            result = string.Concat(result, "\n");
          end

          result = string.Concat(result, attributeText, " ", (self.attribute[i].value - 100 + styleValue));
        end
      end
    end
  end

  return result;
end

function ItemData.RandomM()
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

function ItemData:GetGodMainAttrText(itemSave, withoutColor, nextLv)
  local result = "";
  
  if itemSave ~= nil and self.kind == EItemKind.Myth and itemSave.myth ~= nil then
    local index = self.attribute[1].kind;
    if SacredEquipPrimaryDatas[index] ~= nil then
      local attributeText = ItemData.GetAttrText(SacredEquipPrimaryDatas[index].attNo);

      if attributeText ~= nil then
        if withoutColor then
          if nextLv ~= nil and SacredEquipPrimaryDatas[index].upgradeLv[nextLv] ~= nil then
            result = string.Concat(result, attributeText, "+", SacredEquipPrimaryDatas[index].upgradeLv[nextLv]);
          else
            result = string.Concat(result, attributeText, "+", SacredEquipPrimaryDatas[index].upgradeLv[itemSave.mythLv]);
          end
        else
          result = string.GetColorText(string.Concat(result, attributeText, "+", SacredEquipPrimaryDatas[index].upgradeLv[itemSave.mythLv], string.format(string.Get(23876), SacredEquipPrimaryDatas[index].upgradeLv[15])), Color.Black);
        end
      end
    end
  else
    local itemData = itemDatas[self.Id];
    if itemData ~= nil and self.kind == EItemKind.Myth then
      local index = itemData.attribute[1].kind;
      local attributeText = ItemData.GetAttrText(SacredEquipPrimaryDatas[index].attNo);
      result = string.GetColorText(string.Concat(result, attributeText, "+", SacredEquipPrimaryDatas[index].upgradeLv[0], string.format(string.Get(23876), SacredEquipPrimaryDatas[index].upgradeLv[15])), Color.Black);
    end
  end
  
  return result;
end

function ItemData.RandomN()
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

function ItemData.RandomO()
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

function ItemData.RandomP()
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

function ItemData:GetGodSubAttrText(itemSave, index)
  local result = "";
  
  if itemSave ~= nil and self.kind == EItemKind.Myth and itemSave.myth ~= nil then
    local attributeText = "";
    local tableCount = table.Count(itemSave.myth);
    local returnStr = "\n";
    local extraStr = "";
  
    if index ~= nil then
        attributeText = ItemData.GetAttrText(itemSave.myth[index].kind);
        if attributeText ~= nil then
          extraStr = string.GetColorText(string.Concat(itemSave.myth[index].extra), Color.DarkSky);
          result = string.GetColorText(string.Concat(result, attributeText, itemSave.myth[index].value, "+", extraStr), Color.DarkGreen);
        else
          result = string.GetColorText(string.Concat(result, string.Get(23652), string.Get(23668)), Color.Gray);
        end
    else
      for i = 1, 4 do
        attributeText = ItemData.GetAttrText(itemSave.myth[i].kind);
    
        if i == tableCount then
          returnStr = "";
        end
    
        if attributeText ~= nil then
          extraStr = string.GetColorText(string.Concat(itemSave.myth[i].extra), Color.DarkSky);
          result = string.GetColorText(string.Concat(result, attributeText, itemSave.myth[i].value, "+", extraStr, returnStr), Color.DarkGreen);
        else
          result = string.GetColorText(string.Concat(result, string.Get(23652), string.Get(23668), returnStr), Color.Gray);
        end
      end
    end
  end
  
  return result;
end

function ItemData:GetMythTitle(itemSave)
  local result = "";
  
  if itemSave ~= nil and self.kind == EItemKind.Myth then
    result = string.Concat(result, string.Get(23652), " +", itemSave.mythLv);
  end
  
  return result;
end

function ItemData:GetMainElementText(itemSave)
  local result = "";

  if Between(self.element, 1, 8) then
    local elementName = "";
    local color = Color.Black;

    elementName ,color = Item.GetElementName(self.element);
    result = string.Concat(result, string.Get(20354), elementName);

    local value = 0;
    if self.elementValue > 100 then
      value = self.elementValue - 100;
    end

    local growlv = 0;
    if itemSave ~= nil then
      growlv = itemSave.growLv;
    end

    value = value + growlv;

    if value > 0 then
      result = string.GetColorText(string.Concat(result, "+", (value)), color);
    else
      result = result;
    end
  end

  return result;
end

function ItemData.RandomQ()
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

function ItemData.RandomR()
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

function ItemData.RandomS()
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

function ItemData.RandomT()
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

--附屬性
function ItemData:GetElementText(itemSave)
  local result, elementName = "";
  local color = Color.Black;

  if itemSave ~= nil then
    if Between(itemSave.element, 1, 8) then
      elementName, color = Item.GetElementName(itemSave.element);
      result = string.Concat(string.Get(40243), elementName);

      if itemSave.elementValue > 100 then
        result = string.Concat(result, "+", (itemSave.elementValue - 100));
      else
        result = result;
      end
    end

    return result;
  end
end

function ItemData.RandomU()
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

function ItemData.RandomV()
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

function ItemData:GetDelTime(itemSave)
  local result = "";

  if itemSave ~= nil and itemSave.delTime ~= nil and itemSave.delTime > 0 then
    result = string.format(string.Get(21285), DateTime.FromOADate(itemSave.delTime):ToString("yyyy/MM/dd HH:mm"));
  end

  return result;
end

function ItemData.Randomx()
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

function ItemData:GetLevelText()
  local result = "";

  if self.needLv > 0 then
    local needLv = 0;
    if self.turn >= 3 then
      needLv = self.needLv + Role.playerMaxLv;
    else
      needLv = self.needLv;
    end

    if Contains(self.specialAbility, 60, 92, 93) and self.attribute[1].kind > 0  then
      result = string.Concat(string.Get(20355), needLv, " - ", self.attribute[1].kind);
    else
      result = string.Concat(string.Get(20355), needLv);
    end
  else
    if Contains(self.specialAbility, 60, 92, 93) and self.attribute[1].kind > 0 then
      result = string.Concat(string.Get(20355), "1 - ", self.attribute[1].kind);
    end
  end

  return result;
end

function ItemData:GetDamageText(itemSave)
  local result = "";

  if itemSave == nil then
    if self.durable == 1 then
      result = string.GetColorText(string.format(string.Get(20370), Item.durable), Color.ItemLimit);
    end
  else
    if itemDatas[itemSave.Id].durable == 1 and Item.IsTypeOfEquips(itemDatas[itemSave.Id].fitType) then
      local durable = Item.durable - itemSave.damage;

      if durable <= 25 then
        result = string.GetColorText(string.format(string.Get(20370), durable), Color.Red);
      else
        result = string.GetColorText(string.format(string.Get(20370), durable), Color.ItemLimit);
      end
    end
  end

  return result;
end

function ItemData.Random1()
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

function ItemData.Random2()
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

function ItemData.Random3()
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

function ItemData.Random4()
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

function ItemData.Random5()
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

function ItemData.Random6()
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

function ItemData:GetProofText(itemSave)
  local result = "";

  if itemSave ~= nil then
    local proofKind = itemSave.proofKind;

    if proofKind == 1 then
      result = string.Concat(string.Get(40399), string.Get(40401));
    elseif proofKind == 2 then
      result = string.Concat(string.Get(40399), string.Get(40402));
    elseif proofKind == 3 then
      result = string.Concat(string.Get(40399), string.Get(40403));
    elseif proofKind == 5 then
      result = string.Concat(string.Get(40399), string.Get(40404));
    elseif proofKind == 6 then
      result = string.Concat(string.Get(40399), string.Get(40405));
    elseif proofKind == 171 then
      result = string.Concat(string.Get(40399), string.Get(40406));
    elseif proofKind == 173 then
      result = string.Concat(string.Get(40399), string.Get(40407));
    end
  end

  return result;
end

function ItemData:GetStoneText(itemSave)
  local result = "";

  if itemSave ~= nil and itemSave.stoneAttr ~= nil and itemSave.stoneLv ~= nil and itemSave.stoneAttr > 0 and itemSave.stoneLv > 0 then
    local title = Item.GetStoneAttrStr(itemSave.stoneAttr, false);
    local content = Item.GetStoneAttrStr(itemSave.stoneAttr, true);
    local StrValue = Item.GetAttrHintStr(itemSave.stoneAttr, itemSave.stoneLv);

    result = string.Concat(result, string.format(string.Get(80310), itemSave.stoneLv, title, content, StrValue));
  end

  return result;
end

function ItemData.Random7()
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

function ItemData.Random8()
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

function ItemData:GetTianGuanText(itemSave)
  local result = "";

  if self.kind == EItemKind.TianGuanEquip then
    local tianGuanData = tianGuanDatas[self.Id];
    if tianGuanData ~= nil then
      local stoneLv = 0;
      if itemSave ~= nil then
        stoneLv = itemSave.stoneLv;
      end

      tianGuanData = tianGuanData[stoneLv];
      if tianGuanData ~= nil then
        result = string.Concat(result, string.Get(22011), string.GetChineseNumberLower(stoneLv), string.Get(21999), string.Get(21984), "：", tianGuanData:GetEffectText(" "));
      end
    end
  end

  return result;
end

function ItemData.Random9()
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

function ItemData.RandomA8()
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

function ItemData.RandomB8()
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

function ItemData:GetTurnText()
  local result = "";

  if self.turn > 0 then
    result = string.Concat(result, string.format(string.Get(71339), self.turn)); --轉生專用
  end

  return result;
end

function ItemData.RandomB9()
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

function ItemData.RandomB10()
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

function ItemData:GetRestrictText()
  local result = "";

  if bit.band(self.restrict, 64) == 64 and bit.band(self.restrict, 128) ~= 128 then
    result = string.Concat(result, string.Get(71340)); --玩家專用
  end

  if bit.band(self.restrict, 128) == 128 and bit.band(self.restrict, 64) ~= 64 then
    result = string.Concat(result, string.Get(71341)); --武將專用
  end

  return result;
end

function ItemData:GetRoleCountLimitText(itemSave)
  local result = "";
  if itemSave == nil then return result end
  
  local itemData = itemDatas[itemSave.Id];
  
  if itemData == nil then return result end
  
  if itemData.kind == EItemKind.SpecialAbility and bit.band(itemData.restrict2, 16) == 16 then
    local roleCount = RoleCount.Get(itemData.roleCountIndex);
    local max = RoleCount.Max(itemData.roleCountIndex);
  
    if roleCount >= max then
      local countString = string.GetColorText(string.format(string.Get(23433), roleCount , max), Color.Gray);
      result = string.Concat(result, string.Concat(countString, "\n", string.GetColorText(string.Get(23434), Color.Red)));
    else
      result = string.Concat(result, string.GetColorText(string.format(string.Get(23433), roleCount , max), Color.Gray));
    end
  end

  return result;
end

function ItemData.TrashB()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function ItemData.TrashB1()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function ItemData:GetReinforcedText(itemSave)
  local result = "";
  local attr_1 = 0;
  local attr_2 = 0;
  local class_1 = 0;
  local class_2 = 0;
  local attKind = 0;

  if self.kind == EItemKind.ExclusiveWeapon then
    if itemSave ~= nil and exclusiveWeaponDatas[itemSave.Id] ~= nil then
      if exclusiveWeaponDatas[itemSave.Id][itemSave.enhanceLv] ~= nil then
        if exclusiveWeaponDatas[itemSave.Id][itemSave.enhanceLv].att[1] ~= nil then
          attKind = exclusiveWeaponDatas[itemSave.Id][itemSave.enhanceLv].att[1].kind;
        end
      end
    end
  else
    attKind = self.attribute[1].kind;
  end

  for k, v in pairs(eqReinforcedDatas) do
    if v.fitType == self.fitType and v.attribute == attKind and v.quality == self.quality then
      class_1 = v.class_1;
      class_2 = v.class_2;
      break;
    end
  end

  if itemSave ~= nil and class_1 > 0 and class_2 > 0 and itemSave.Reinforced > 0 then
    if eqValueDatas[class_1] ~= nil then
      attr_1 = eqValueDatas[class_1].attribute;
    end

    if eqValueDatas[class_2] ~= nil then
      attr_2 = eqValueDatas[class_2].attribute;
    end

    if eqValueDatas[class_1].level[itemSave.Reinforced] ~= nil then
      result = string.GetColorText(string.Concat(string.Get(23207), ItemData.GetAttrText(attr_1), " +", eqValueDatas[class_1].level[itemSave.Reinforced]), Color.Orange);
    end

    if eqValueDatas[class_2].level[itemSave.Reinforced] ~= nil then
      result = string.Concat(result, "\n");
      result = string.Concat(result, string.GetColorText(string.Concat(string.Get(23208), ItemData.GetAttrText(attr_2), " +", eqValueDatas[class_2].level[itemSave.Reinforced]), Color.Orange));
    end
  end

  return result;
end

function ItemData.TrashB2()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function ItemData.TrashB3()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function ItemData.TrashB4()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function ItemData:GetAffixText(itemSave)
  local result = "";

  if itemSave ~= nil and itemSave.affix1 ~= nil and itemSave.affix2 ~= nil and itemSave.affix3 ~= nil then
    if itemSave.affix1 > 0 and eqAffixAllDatas[itemSave.affix1] ~= nil then
      result = string.GetColorText(string.Concat(string.Get(23077), ItemData.GetAttrText(eqAffixAllDatas[itemSave.affix1].attr), " +", eqAffixAllDatas[itemSave.affix1].level[1]), Color.Orange2);
    end

    if itemSave.affix2 > 0 and eqAffixAllDatas[itemSave.affix2] ~= nil then
      result = string.Concat(result, "\n");
      result = string.Concat(result, string.GetColorText(string.Concat(string.Get(23077), ItemData.GetAttrText(eqAffixAllDatas[itemSave.affix2].attr), " +", eqAffixAllDatas[itemSave.affix2].level[2]), Color.Orange2));
    end

    if itemSave.affix3 > 0 and eqAffixAllDatas[itemSave.affix3] ~= nil then
      result = string.Concat(result, "\n");
      result = string.Concat(result, string.GetColorText(string.Concat(string.Get(23077), ItemData.GetAttrText(eqAffixAllDatas[itemSave.affix3].attr), " +", eqAffixAllDatas[itemSave.affix3].level[3]), Color.Orange2));
    end
  end

  return result;
end

function ItemData.TrashB5()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function ItemData.TrashB6()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function ItemData.TrashB7()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function ItemData:GetSpiritualityText(itemSave)
  local result = "";

  if Contains(self.kind, EItemKind.SoulWeapon, EItemKind.SoulEquip) then
    result = string.Concat(result, string.Get(40425), ":");

    if itemSave ~= nil then
      local growLv = Item.GetGrowLv(self.Id, 0, itemSave.growExp);
      local prevExp = Item.GetGrowNeedCount(self.Id, growLv);
      local maxExp = Item.GetGrowUpCount(self.level, growLv + 1);

      if growLv < Item.MaxGrowLv then
        result = string.Concat(result, (itemSave.growExp - prevExp), "/", maxExp);
      else
        result = string.Concat(result, prevExp, "/", prevExp);
      end
    else
      if self.kind == EItemKind.SoulWeapon then
        result = string.Get(80373);
      elseif self.kind == EItemKind.SoulEquip then
        result = string.Get(80375);
      end
    end
  end

  return result;
end

function ItemData:GetTradeText(itemSave)
  local result = "";

  if itemSave ~= nil and bit.band(itemSave.specialKind, 1) == 1 then
    result = string.Concat(result, string.Get(71308), "\n");
  else
    if bit.band(self.restrict, 2) == 2 then
      result = string.Concat(result, string.Get(90157), "\n"); --不可交易
    end
  end

  return result;
end

function ItemData.TrashB8()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function ItemData.TrashB9()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function ItemData:GetNoneRuneText()
  local result = "";
  
  if self.specialAbility == 41 then
    result = string.format(string.Get(90158), self.skillLink);
  elseif self.specialAbility == 42 then
    result = string.format(string.Get(90159), self.skillLink);
  end

  return result;
end

function ItemData:GetCollectText()
  if self.kind == EItemKind.DoroCard and self.specialAbility == EItemUseKind.RoleCount then
    --卡片
    for k, v in pairs(collectCardSortDatas) do
      if v.roleCount == self.roleCountIndex then
        if not BitFlag.Get(v.getFlag) then
          return string.Get(21629);
        end
        break;
      end
    end
  elseif self.specialAbility == EItemUseKind.NpcPicture then
    --畫像
    if collectWarriorDatas[self.spare3] ~= nil and not BitFlag.Get(collectWarriorDatas[self.spare3].getFlag) then
      return string.Get(21629);
    end
  end
  
  return "";
end

function ItemData.TrashB10()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function ItemData.TrashB11()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function ItemData.TrashB12()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function ItemData.TrashB13()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function ItemData:GetSuitText(bagKind, followIndex)
  local result = "";
  local suitData = suitDatas[self.suitId];
  local itemData;
  
  if self.suitId ~= 0 and suitData ~= nil then
    local suitCount = 0;

    if Contains(bagKind, EThings.Equip, EThings.ChatNpc) then
      for i = 1, Item.MaxEquip + Item.MaxStyle do
        local item = Item.GetBagItem(bagKind, i, followIndex);

        if item ~= nil then
          itemData = itemDatas[item.Id];

          if itemData ~= nil and self.suitId == itemData.suitId then
            suitCount = suitCount + 1;
          end
        end
      end
    end

    result = string.format(string.Get(90325), string.Get(suitData.name), suitCount, suitData.maxSum);

    for i = 1, Item.MaxSuitAttr do
      if suitData.attributes[i].attribute > 0 then
        if suitCount >= suitData.attributes[i].suitSum then
          result = string.Concat(result, "\n", string.GetColorText(Item.GetSuitAttrStr(suitData.attributes[i].suitSum, suitData.attributes[i].attribute, suitData.attributes[i].value), Color.ItemSuit));
        else
          result = string.Concat(result, "\n", string.GetColorText(Item.GetSuitAttrStr(suitData.attributes[i].suitSum, suitData.attributes[i].attribute, suitData.attributes[i].value), Color.Gray));
        end
      end
    end
  end

  return result;
end

function ItemData:GetCantUseText()
  if self.btnState <= 0 then return "" end

  local str = itemHintDatas[self.btnState];

  if str == nil then return end

  return string.Get(str);
end

function ItemData:GetBowText()
  if self.kind == EItemKind.Item_7 then
    return string.Get(40422);
  end
end

function ItemData:SetIcon(rawImage, useType)
  useType = useType or ETextureUseType.UI;
  TextureManager.SetPng(useType, self.iconId, rawImage);
end

function ItemData:GetColorTint(colorPart, sex)
  local r = 4;
  local g = 4;
  local b = 4;

  if colorPart == EColorPart.Helm then
    r = (self.colorTints[sex][1] / 100000000) % 10;
    g = (self.colorTints[sex][1] / 10000000) % 10;
    b = (self.colorTints[sex][1] / 1000000) % 10;
  elseif colorPart == EColorPart.Hair then
    r = (self.colorTints[sex][1] / 100000) % 10;
    g = (self.colorTints[sex][1] / 10000) % 10;
    b = (self.colorTints[sex][1] / 1000) % 10;
  elseif colorPart == EColorPart.Skin then
    r = (self.colorTints[sex][1] / 100) % 10;
    g = (self.colorTints[sex][1] / 10) % 10;
    b = (self.colorTints[sex][1] / 1) % 10;
  elseif colorPart == EColorPart.Clothes then
    r = (self.colorTints[sex][2] / 100000000) % 10;
    g = (self.colorTints[sex][2] / 10000000) % 10;
    b = (self.colorTints[sex][2] / 1000000) % 10;
  elseif colorPart == EColorPart.Orna1 then
    r = (self.colorTints[sex][2] / 100000) % 10;
    g = (self.colorTints[sex][2] / 10000) % 10;
    b = (self.colorTints[sex][2] / 1000) % 10;
  elseif colorPart == EColorPart.Orna2 then
    r = (self.colorTints[sex][2] / 100) % 10;
    g = (self.colorTints[sex][2] / 10) % 10;
    b = (self.colorTints[sex][2] / 1) % 10;
  elseif colorPart == EColorPart.Orna3 then
    r = (self.colorTints[sex][3] / 100000000) % 10;
    g = (self.colorTints[sex][3] / 10000000) % 10;
    b = (self.colorTints[sex][3] / 1000000) % 10;
  elseif colorPart == EColorPart.Orna4 then
    r = (self.colorTints[sex][3] / 100000) % 10;
    g = (self.colorTints[sex][3] / 10000) % 10;
    b = (self.colorTints[sex][3] / 1000) % 10;
  elseif colorPart == EColorPart.Boots then
    r = (self.colorTints[sex][3] / 100) % 10;
    g = (self.colorTints[sex][3] / 10) % 10;
    b = (self.colorTints[sex][3] / 1) % 10;
  elseif colorPart == EColorPart.Weapon then
    r = (self.colorTints[sex][4] / 100000000) % 10;
    g = (self.colorTints[sex][4] / 10000000) % 10;
    b = (self.colorTints[sex][4] / 1000000) % 10;
  elseif colorPart == EColorPart.WeaponOrna then
    r = (self.colorTints[sex][4] / 100000) % 10;
    g = (self.colorTints[sex][4] / 10000) % 10;
    b = (self.colorTints[sex][4] / 1000) % 10;
  elseif colorPart == EColorPart.Wrist then
    r = (self.colorTints[sex][4] / 100) % 10;
    g = (self.colorTints[sex][4] / 10) % 10;
    b = (self.colorTints[sex][4] / 1) % 10;
  end

  return math.floor(r), math.floor(g), math.floor(b);
end

function ItemData.Rtx4090()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function ItemData.Rtx4091()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function ItemData.Rtx4092()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function ItemData:CheckShowEquip(sex, fitType)
  if self.equipSwitch[sex] ~= nil then
    if fitType == 0 then
      return not CheckFlag(self.equipSwitch[sex], 1);
    elseif fitType == EItemFitType.Equip_Head then
      return not CheckFlag(self.equipSwitch[sex], 2);
    elseif fitType == EItemFitType.Equip_Body then
      return not CheckFlag(self.equipSwitch[sex], 5);
    elseif fitType == EItemFitType.Equip_Hand then
      return not CheckFlag(self.equipSwitch[sex], 6);
    elseif fitType == EItemFitType.Equip_Wrist then
      return not CheckFlag(self.equipSwitch[sex], 3);
    elseif fitType == EItemFitType.Equip_Boots then
      return not CheckFlag(self.equipSwitch[sex], 4);
    elseif fitType == EItemFitType.Equip_Cape then
      return not CheckFlag(self.equipSwitch[sex], 7);
    end
  end

  return true;
end

function ItemData.IsSummonItem(itemId)
  return Contains(itemId, 23086, 23087, 23088, 23089, 23135, 23136, 23137, 23138, 23361, 23367, 23362, 23368);
end

function ItemData.Rtx4093()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function ItemData.IsLightDarkSummonItem(itemId)
  return Contains(itemId, 23361, 23367, 23362, 23368);
end

function ItemData:IsDirectUse()
  return self.kind == EItemKind.Item_80 and self.directUse == 1;
end

function ItemData.Rtx4093()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function ItemData.Rtx4094()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function ItemData.Rtx4095()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function ItemData:IsTsMoney() --吞食幣不可直接使用(物品介面顯示icon用)
  return self.kind == EItemKind.Item_80 and self.directUse == 0 and self.openUsed == 1 and self.btnState > 0;
end

--競技場金卷銀卷要顯示物品資訊
function ItemData:IsRoleCountException()
  return self.directUse == 1 and (self.kind == EItemKind.SpecialAbility or self.kind == EItemKind.Item_80) and self.specialAbility == EItemUseKind.RoleCount;
end

function ItemData.Rtx5050()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function ItemData.Rtx5051()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

ItemEvoData = {}
ItemEvoData.__index = ItemEvoData;

function ItemEvoData.Script1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function ItemEvoData.Script12()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function ItemEvoData.New(reader)
  local self = {};
  setmetatable(self, ItemEvoData);

  self.itemId = reader:ReadUInt16();
  self.count = 1;
  local requireItem1 = reader:ReadUInt16();
  local requireItem2 = reader:ReadUInt16();
  self.requireCurrency = reader:ReadByte();
  self.requireCurrencyValue = reader:ReadUInt32();

  return requireItem1, requireItem2, self;
end