EColorPart = {
  Helm = 1,        --頭盔
  Hair = 2,        --頭髮
  Skin = 3,        --皮膚
  Clothes = 4,     --衣服
  Orna1 = 5,       --配件1
  Orna2 = 6,       --配件2
  Orna3 = 7,       --配件3
  Orna4 = 8,       --配件4
  Boots = 9,       --鞋子
  Weapon = 10,     --武器
  WeaponOrna = 11, --武器配件
  Wrist = 12,      --護腕
  Eye = 13,        --眼睛
  Cape = 14,      --批風
}

ENpc = {
  Moral_4 = 1, --黃巾
  Moral_1 = 2, --魏
  Moral_2 = 3, --蜀
  Moral_3 = 4, --吳
  Moral_5 = 5, --無
  Villager = 6, --村民
  Boss = 7, --老闆
  Soldier = 8, --士兵
  Horse = 9, --馬
  Officer = 10, --官員
  Chest = 11, --箱子
  Ranger = 12, --遠距武器
  Jelly = 13, --果凍怪
  StoneDoor = 14, --石門
  Billboard = 15, --路牌
  Mine = 16, --礦石
  Warship = 17, --戰船
  Ghost = 18, --神魔
  Animal = 19, --動物
  Wall = 20, --城牆
  Floor = 21, --樓
  Elephant = 22, --大象
  Invisible = 23, --無形
  Gamble = 24, --網咖
  GM = 25, --GM
  Huge = 26, --巨大怪
  CityArmy = 27, --攻城士兵
  CityWeapon = 28, --攻城器械
  Activity = 29, --活動專用NPC
  City = 30, --大地圖Npc
  Mission = 31, --任務用Npc
  Turn = 32, --轉生武將
  EpicBattle = 33, --戰役用Npc
  EpicBattleTeam = 34, --戰役用三人小隊
  EpicBattleChase = 35, --戰役被追擊Npc
  Turn3 = 36, --二轉武將
  Enhance = 37, --強化怪
  SkyArena = 38, --天空競技場神仙
  PlayerWarship = 51, --玩家用戰船
  EnemyWarship = 52, --敵人用戰船
  Child = 53, --二代武將:單號是男
  CombineHuge = 56, --合體巨大怪
}

ENpcLimit = {
  PK = 1,
}

NpcInfo = {}
NpcInfo.__index = NpcInfo;

function NpcInfo.Random()
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

function NpcInfo.Random1()
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

function NpcInfo.Random2()
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

function NpcInfo.New(data, role)
  local self = {};
  setmetatable(self, NpcInfo);

  self.npcId = 0;
  self.level = 0;
  self.exp = 0;

  self.turn = 0;
  self.element = 0;
  self.career = 0;

  self.hp = 0;
  self.sp = 0;

  self.int = 0;
  self.atk = 0;
  self.def = 0;
  self.agi = 0;
  self.hpx = 0;
  self.spx = 0;

  self.equipInt = 0;
  self.equipAtk = 0;
  self.equipDef = 0;
  self.equipHpx = 0;
  self.equipSpx = 0;
  self.equipAgi = 0;

  self.upgradeLv = 0;
  self.specialSkill = false;

  self.skillLv = {};
  for i = 1, Role.maxNpcSkill do
    self.skillLv[i] = 1;
  end

  self.equips = {};

  if data ~= nil then
    self.npcId = data:ReadUInt16();
    self.level = data:ReadByte();
    self.exp = data:ReadByte();
  
    self.turn = data:ReadByte();
  
    self.hp = data:ReadUInt16();
    self.sp = data:ReadUInt16();
    
    self.int = data:ReadUInt16();
    self.atk = data:ReadUInt16();
    self.def = data:ReadUInt16();
    self.agi = data:ReadUInt16();
    self.hpx = data:ReadUInt16();
    self.spx = data:ReadUInt16();

    self.equipInt = data:ReadInt16();
    self.equipAtk = data:ReadInt16();
    self.equipDef = data:ReadInt16();
    self.equipAgi = data:ReadInt16();
    self.equipHpx = data:ReadInt16();
    self.equipSpx = data:ReadInt16();

    self.upgradeLv = data:ReadByte();
    self.specialSkill = data:ReadBoolean();

    for i = 1, Role.maxNpcSkill do
      self.skillLv[i] = data:ReadByte();
    end

    table.Clear(self.equips);
    local count = data:ReadByte();
    for i = 1, count do
      table.insert(self.equips, ThingData.New(data));
    end
  end

  if role ~= nil then
    self.npcId = role.npcId;
    self.level = role:GetAttribute(EAttribute.Lv);
    self.exp = math.floor(((role:GetAttribute(EAttribute.Exp) - Calc.GetNeedTExp(self.level)) * 100) / Calc.GetUpExp(self.level + 1));

    self.turn = role:GetAttribute(EAttribute.Turn);

    self.hp = role:GetAttribute(EAttribute.MaxHp);
    self.sp = role:GetAttribute(EAttribute.MaxSp);

    local equipAdd = 0;

    self.int = role:GetAttribute(EAttribute.Int);
    self.atk = role:GetAttribute(EAttribute.Atk);
    self.def = role:GetAttribute(EAttribute.Def);
    self.agi = role:GetAttribute(EAttribute.Agi);
    self.hpx = role:GetAttribute(EAttribute.Hpx);
    self.spx = role:GetAttribute(EAttribute.Spx);

    self.equipInt = role:GetAttribute(EAttribute.EquipInt);
    self.equipAtk = role:GetAttribute(EAttribute.EquipAtk);
    self.equipDef = role:GetAttribute(EAttribute.EquipDef);
    self.equipAgi = role:GetAttribute(EAttribute.EquipAgi);
    self.equipHpx = role:GetAttribute(EAttribute.EquipHpx);
    self.equipSpx = role:GetAttribute(EAttribute.EquipSpx);

    self.upgradeLv = role.data.upgradeLv;
    self.specialSkill = role.data.specialSkillLearned;

    for i = 1, Role.maxNpcSkill do
      self.skillLv[i] = role.data.skillLv[i];
    end

    table.Clear(self.equips);
    for i = EItemFitType.Equip_Head, EItemFitType.Equip_Spec do
      local itemSave = Item.GetBagItem(EThings.Equip, i, role.index);
      if itemSave ~= nil then
        table.insert(self.equips, itemSave);
      end
    end
  end

  if npcDatas[self.npcId] ~= nil then
    self.element = npcDatas[self.npcId].element;
  end

  return self;
end

function NpcInfo.Random3()
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

function NpcInfo:WriteBuffer(buffer)
  buffer:WriteUInt16(self.npcId);
  buffer:WriteByte(self.level);
  buffer:WriteByte(self.exp);

  buffer:WriteByte(self.turn);

  buffer:WriteUInt16(self.hp);
  buffer:WriteUInt16(self.sp);
  
  buffer:WriteUInt16(self.int);
  buffer:WriteUInt16(self.atk);
  buffer:WriteUInt16(self.def);
  buffer:WriteUInt16(self.agi);
  buffer:WriteUInt16(self.hpx);
  buffer:WriteUInt16(self.spx);

  buffer:WriteInt16(self.equipInt);
  buffer:WriteInt16(self.equipAtk);
  buffer:WriteInt16(self.equipDef);
  buffer:WriteInt16(self.equipAgi);
  buffer:WriteInt16(self.equipHpx);
  buffer:WriteInt16(self.equipSpx);

  buffer:WriteByte(self.upgradeLv);
  buffer:WriteBoolean(self.specialSkill);

  for i = 1, Role.maxNpcSkill do
    buffer:WriteByte(self.skillLv[i]);
  end

  buffer:WriteByte(table.Count(self.equips));
  for k, v in pairs(self.equips) do
    v:WriteBuffer(buffer);
  end
end

function NpcInfo.Random4()
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

function NpcInfo.Random5()
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

NpcData = {}
NpcData.__index = NpcData;

function NpcData.Random5()
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

function NpcData.New(reader)
  local self = {};
  setmetatable(self, NpcData);

  self.name = LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16())); --[1] 名稱 Length = 台10 泰14 越14
  self.kind = reader:ReadByte(); --[2] 類別 (1魏 2蜀 3吳 4…)
  local id = reader:ReadUInt16(); --[3] 編號
  
  if Define.IsInternal() then
    self.name = string.Concat(self.name, id);
  end
  
  self.picId = reader:ReadUInt16(); --[4] 角色圖
  self.maskId = reader:ReadUInt16(); --[5] 遮罩圖
  
  self.colorTints = {};
  self.colorTints[1] = reader:ReadInt32(); --[6] 帽,髮,膚
  self.colorTints[2] = reader:ReadInt32(); --[7] 衣,配1,配2
  self.colorTints[3] = reader:ReadInt32(); --[8] 配3,配4,鞋
  self.colorTints[4] = reader:ReadInt32(); --[9] 武底,武配1,腕
  
  self.canBeCatch = reader:ReadByte() == 1; --[10] 抓捕否 (0可捉 1不可捉)
  self.bodyKind = reader:ReadByte(); --[11] 體型 (1黃巾 2黃巾將 3村民 4正規軍 5頭盔士兵 6盜賊 7劉關張諸侯 8壯將 9自設 10大謀士 11紅女 12荀采 13女村民a 14女村民b)
  self.weaponKind = reader:ReadByte(); --[12] 武器種類 (1刀,2劍,3拂,4扇,5斧,6鎚,7鞭,8琴,9槍,10戟,11弓,12空手)
  self.level = reader:ReadByte(); --[13] 等級 (出場等級)
  self.hpBase = reader:ReadInt32(); --[14] Base HP
  self.spBase = reader:ReadInt32(); --[15] Base SP

  self.attributes = {};
  self.attributes[4] = reader:ReadUInt16(); --[16] Hp上升幅度 (1~400)
  self.attributes[5] = reader:ReadUInt16(); --[17] Sp上升幅度 (1~400)
  self.attributes[1] = reader:ReadUInt16(); --[18] 知力
  self.attributes[2] = reader:ReadUInt16(); --[19] 攻擊
  self.attributes[3] = reader:ReadUInt16(); --[20] 防禦
  self.attributes[6] = reader:ReadUInt16(); --[21] 敏捷
  
  self.moral = reader:ReadByte(); --[22] 陣營 (0無 1魏 2蜀 3吳 4黃巾 5遊俠)
  self.moralValue = reader:ReadUInt16(); --[23] 陣營值
  self.element = reader:ReadByte(); --[24] 元素 (1地  2水  3火  4風)

  self.skills = {};
  for i = 1, Role.maxNpcSkill do
    self.skills[i] = reader:ReadUInt16(); --[25] 技能 
  end

  self.specialSkill = reader:ReadUInt16(); --[35] 武將特有技  
  self.turn = reader:ReadByte(); --[36] 判斷有無轉生限制(0:未轉生 1:轉生後)
  self.passiveSkill = reader:ReadUInt16(); --[38] 被動技ID
  self.passiveSkillLv = reader:ReadByte(); --[39] 被動技等級
  self.saddleKind = reader:ReadUInt16(); --[40] 馬鞍
  self.upgradeItemId = reader:ReadUInt16(); --[41] 強化物品編號
  self.upgradeSkill = reader:ReadUInt16(); --[42] 強化技能

  local limit = reader:ReadUInt16();
  self.limits = {}; --[43] 限制條件 ENpcLimit (1:不可PK 2: 3: 4: 5: 6: 7: 8: 9: 10: 11: 12: 13: 14: 15: 16:)
  self.limits[1] = bit.band(limit, 255);
  self.limits[2] = bit.rshift(limit, 8);

  self.rideOffsetH = reader:ReadUInt16() - 1000; --[44] 座騎位移
  self.picOffsetX = reader:ReadUInt16() - 1000; --[45] 圖片位移x
  self.picOffsetY = reader:ReadUInt16() - 1000; --[46] 圖片位移y
  self.hudOffsetH = reader:ReadUInt16() - 1000; --[47] hud位移
  self.shadowKind = reader:ReadByte(); --[48] 影子類型 0:不使用 1:小影子 2:長影子 3:大影子
  self.rare = reader:ReadByte(); --[49] 稀有階級 1 ~ 3:銅 4:銀 5:金

  if Define.TextCount then
    DataManager.textCount = DataManager.textCount + string.Count(self.name);
  end
  
  return id, self;
end

function NpcData.Random()
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

function NpcData.Random2()
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

function NpcData.Random3()
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

function NpcData.Random4()
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

function NpcData.Random6()
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

function NpcData:GetAtlasParamsWithRedHat(...)
  return self:GetPicId(ERolePart.Body), 0, 0, 0, 0, 0, 0, self:GetPicId(ERolePart.Weapon), 0, (self.colorTints[1] % 1000000) + 910000000, self.colorTints[2], self.colorTints[3], self.colorTints[4], 0, ...;
end

function NpcData.RandomA()
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

function NpcData.RandomB()
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

function NpcData:GetAtlasParams(...)
  return self:GetPicId(ERolePart.Body), 0, 0, 0, 0, 0, 0, self:GetPicId(ERolePart.Weapon), 0, self.colorTints[1], self.colorTints[2], self.colorTints[3], self.colorTints[4], 0, ...;
end

function NpcData.RandomC()
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

function NpcData:GetMaskAtlasParams(...)
  return self.maskId, 0, 0, 0, 0, 0, 0, 0, 0, self.colorTints[1], self.colorTints[2], self.colorTints[3], self.colorTints[4], 0, ...;
end

function NpcData:GetColor(part)
  local colorIndex = math.floor((part - 1) / 3) + 1;

  if self.colorTints[colorIndex] == nil then return 4, 4, 4; end
  
  local n = (2 - ((part - 1) % 3)) * 3;

  local r = math.floor(self.colorTints[colorIndex] / math.pow(10, n + 2)) % 10;
  local g = math.floor(self.colorTints[colorIndex] / math.pow(10, n + 1)) % 10;
  local b = math.floor(self.colorTints[colorIndex] / math.pow(10, n + 0)) % 10;
  
  return r, g, b;
end

function NpcData.RandomD()
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

function NpcData.RandomE()
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

function NpcData.RandomF()
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

function NpcData:GetPicId(part)
  if part == ERolePart.Body then
    return self.picId;
  elseif part == ERolePart.Weapon then
    if self.bodyKind <= 0 or self.bodyKind > 40 then return 0 end
    if self.weaponKind <= 0 or self.weaponKind > 40 then return 0 end
    return npcWeaponDatas[self.bodyKind][self.weaponKind];
  else
    return 0;
  end
end

function NpcData.RandomG()
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

function NpcData.RandomH()
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

function NpcData.RandomI()
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

function NpcData:GetOffset()
  return self.picOffsetX, self.picOffsetY, self.rideOffsetH, self.hudOffsetH;
end

function NpcData:SetRoleAttributes(role)
  role:SetAttribute(EAttribute.Element, self.element);
  role:SetAttribute(EAttribute.MaxHp, self.hpBase);
  role:SetAttribute(EAttribute.Hp, self.hpBase);
  role:SetAttribute(EAttribute.Turn, self.turn);
end

function NpcData.RandomJ()
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

function NpcData:CheckLimit(flagIndex)
  return CheckFlag(self.limits, flagIndex);
end

function NpcData.RandomK()
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

function NpcData:GetTurn()
  if self.turn == 2 then
    return 1;
  else
    return 0;
  end
end

function NpcData.RandomL()
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


function NpcData.RandomM()
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


function NpcData.GetAddSpeed(picId, bodyKind, npcId)
  if bodyKind ~= 0 then
    if Contains(bodyKind,
                1,
                2,
                4,
                5,
                6,
                7,
                8,
                10,
                15,
                16,
                17,
                20
                ) then
      return -20; --強壯的NPC
    elseif Contains(bodyKind,
                    3,
                    9,
                    11,
                    12,
                    13,
                    14,
                    18,
                    19
                    ) then
      return -80; --瘦弱的NPC
    end
  else
    if Contains(picId,
                1010,
                1452,--崑崙神駒
                1515,--崑崙戰馬
                1817,--雪橇犬
                1584,--流馬
                1001,--獅子
                1399,--駱駝
                1640,--豹
                1642,--虎
                1643,--熊
                1644,--巨熊
                1650,--猛虎
                1653,--狼
                1657,--狼王
                1658,--豹王
                1660,--武裝駱駝
                1669,--獅子
                1670,--獅王
                1919,--獨角獸
                1915 --白虎
                ) then
      return 40 + (npcDatas[npcId].level - 5) * 0.7;
    elseif Contains(picId, 1583) then --1583(木牛)
      return 0;
    elseif Contains(picId,
                    1091,--巴豆妖
                    1092,--巴豆妖
                    1093,--巴豆妖
                    1094,--巴豆妖
                    1102,--蛋黃包
                    1128,--肉包
                    1129,--高麗菜
                    1131,--稻草人
                    1132,--霸王蔘
                    1133,--野山蔘
                    1123,--熊
                    1122,--鷹
                    1124,--蛇
                    1118
                    ) then
      return 20;
    end
  end
  
  return 0;
end

function NpcData.RandomN()
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

local BaDoYaoIds = { 22002, 22003, 22004, 22005, 22028, 22029, 22039, 22053, 22054, 22055, 22056, 22032, 22033, 22034, 22035, 41187, 18022, 18023 }
function NpcData.GetBaDoYaoIndex(npcId)
  for k, v in pairs(BaDoYaoIds) do
    if v == npcId then
      return k;
    end
  end

  return 0;
end

function NpcData.GetBagSize(npcId)
  if Contains(npcId, 41187, 18023, 18022) then
    return 35;
  elseif Contains(npcId, 22029) then
    return 25;
  else
    return 0;
  end
end

function NpcData:GetName()
  local name = self.name;

  if Define.IsInternal() then
    if UIDebug.RecordMode then
      name = string.gsub(name, "%d%d%d%d%d", "");
    end
  end

  return name
end

function NpcData.RandomO()
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

function NpcData.RandomP()
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

NpcSaveData = {}
NpcSaveData.__index = NpcSaveData;

function NpcSaveData.New()
  local self = {};
  setmetatable(self, NpcSaveData);
  
  self.npcId = 0;
  self.name = ""; --姓名 泰版:L=10 其他:L=14
  self.hp = 0;
  self.sp = 0;
  self.int = 0;
  self.atk = 0;
  self.def = 0;
  self.agi = 0;
  self.hpx = 0;
  self.spx = 0;
  self.level = 0;
  self.exp = 0;
  self.skillPoint = 0;
  self.dieCount = 0;
  self.faith = 0;
  self.skillLv = { 0, 0, 0 };
  self.equips = { 0, 0, 0, 0, 0 }
  self.canGrow = false;

  return self;
end

function NpcSaveData.RandomN()
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

function NpcSaveData.RandomNA()
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

NpcUpgradeData = {}
NpcUpgradeData.__index = NpcUpgradeData;

function NpcUpgradeData.RandomNA()
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

function NpcUpgradeData.New(reader)
  local self = {};
  setmetatable(self, NpcUpgradeData);

  local lv = reader:ReadByte(); --星等

  self.requireMoney = reader:ReadUInt32(); --需求遊戲幣
  self.requireDebris = reader:ReadUInt16(); --需求碎片數量
  self.requirePicture = reader:ReadByte(); --需求畫冊數量

  self.attributeAdd = reader:ReadByte(); --強化隨機數值
  self.skillLv = reader:ReadByte(); --強化技等級
  self.UpgradeLvIcon = reader:ReadByte();--星等圖示

  return lv, self;
end

NpcWebInfo = {}
NpcWebInfo.__index = NpcWebInfo;

function NpcWebInfo.RandomNA()
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

function NpcWebInfo.Random()
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

function NpcWebInfo.New(data)
  local self = {};
  setmetatable(self, NpcWebInfo);
  
  self.npcId = data:ReadUInt16();
  self.hpExpend = data:ReadInt32(); --擴充的HP
  self.sp = data:ReadUInt16(); --技力值 MaxSp
  self.int = data:ReadUInt16(); --知力 DB(玩家不可修改)
  self.atk = data:ReadUInt16(); --攻擊力 DB(玩家不可修改)
  self.def = data:ReadUInt16(); --防禦力 DB(玩家不可修改)
  self.agi = data:ReadUInt16(); --敏捷 DB(玩家不可修改)
  self.hpx = data:ReadUInt16(); --Hp上升幅度 DB(玩家不可修改)
  self.spx = data:ReadUInt16(); --Sp上升幅度 DB(玩家不可修改)
  self.level = data:ReadByte(); --等級
  self.exp = data:ReadInt32();  --經驗值
  self.skillPoint = data:ReadUInt16(); --技能點
  self.died = data:ReadByte(); --陣亡次數
  
  self.skillLv = {}; --技能
  for i = 0, Role.maxNpcSkill do
    self.skillLv[i] = data:ReadByte();
  end
  
  self.conjureGrow = data:ReadUInt16(); --喚獸使用熟練度  2004/3/27轉檔
  self.sublimeCount = data:ReadByte(); --昇華丹使用次數
  self.isSpecSkill = data:ReadBoolean(); --是否可以使用武將特等技
  self.soulID = data:ReadUInt16(); --魂玉ID,在變身前,原本的ID
  self.graspPill = data:ReadByte(); --領悟丹
  self.spPillCount = data:ReadByte(); --增加SP的丹
  self.hpPillCount = data:ReadByte(); --增加HP的丹
  self.upGradeLv = data:ReadByte(); --武將強化等級   Alen 20140801
  self.turnKind = data:ReadByte(); --轉生
  self.surplus = data:ReadByte(); --額外的能力點 Added by LH_20180415
  self.lvUpTime = DateTime.FromOADate(data:ReadDouble()); --升級時間
  
  return self;
end

function NpcWebInfo.Random1()
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

function NpcWebInfo.Random2()
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

function NpcWebInfo.Random3()
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