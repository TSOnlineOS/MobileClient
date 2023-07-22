--事件NPC
MapNpcData = {}
MapNpcData.__index = MapNpcData;

function MapNpcData.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function MapNpcData.New()
  local self = {};
  setmetatable(self, MapNpcData);
  
  self.eventNpcData = nil;

  self.npcId = 0;
  self.motionType = 0; --0:玩家或其他玩家  NPC走法: 1: 原地不動(default) 2: 任意行走 3: 範圍隨機亂走 4: 依序行走
  self.motionBack = 0; --當MotionType=4時才可設定 1: 只行走到終點立即停止(default) 2: Loop
  self.motionSuspendMS = 0; --npc在每個Node停留時間
  self.motionSuspendTime = nil; --暫停計數時間 DateTime
  self.motionRect = Rect.New(); --用於固定範圍隨機
  self.lastBumpTime = nil; --紀錄與npc碰撞的時間 DateTime
  self.traceRadius = 0; --server追擊半徑
  self.isStopMove = false; --是否停止移動,活動用

  self.bbqLight = nil; --烤肉光影 TLight

  self.superBmp = ""; --精英圖騰

  self.eggStep = 0; --是否在轉蛋(0:無 1:運轉 2:掉球)
  self.eggLight = nil; --轉蛋光影 TLight
  self.eggKind = 0; --轉蛋的種類(1:四色 2:亮銀 3:黃金)
  self.eggItemID = 0; --所得到的轉蛋內容物
  self.eggThrowTime = 0; --轉蛋所掉出來的時間

  return self;
end

function MapNpcData.ScriptC()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function MapNpcData.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

--二代武將
ChildData = {}
ChildData.__index = ChildData;

function ChildData.New(data)
  local self = {};
  setmetatable(self, ChildData);
  
  self.kind = data:ReadByte(); --0:None 1:養育階段 2:養育階段死亡 3:成人
  self.sex = data:ReadByte(); --性別男:1 女:2
  self.turn = data:ReadByte(); --轉生種類
  self.element = data:ReadByte(); --元素 (1地 2水 3火 4風)

  self.skills = {}; --技能
  for i = 0, 9 do
    self.skills[i] = {};
    self.skills[i].Id = data:ReadUInt16();
    self.skills[i].Lv = data:ReadByte();
  end

  self.stodgeOldTime = data:ReadDouble(); --最後一次餵食時間 DateTime
  self.stodge = data:ReadUInt16(); --飽食,最大48小時
  self.satiationOldTime = data:ReadDouble(); --最後一次餵食時間 DateTime
  self.satiation = data:ReadUInt16(); --滿足,最大48小時
  self.int = data:ReadUInt16(); --*知力
  self.atk = data:ReadUInt16(); --*攻擊力
  self.def = data:ReadUInt16(); --*防禦力
  self.agi = data:ReadUInt16(); --*敏捷
  self.hpx = data:ReadUInt16(); --*Hp上升幅度
  self.spx = data:ReadUInt16(); --*Sp上升幅度
  self.intExp = data:ReadByte(); --知力EXP
  self.atkExp = data:ReadByte(); --攻擊力EXP
  self.defExp = data:ReadByte(); --防禦力EXP
  self.agiExp = data:ReadByte(); --敏捷EXP
  self.hpxExp = data:ReadByte(); --Hp上升EXP
  self.spxExp = data:ReadByte(); --Sp上升EXP
  self.childItemCount = data:ReadUInt16(); --給予物品次數
  self.career = data:ReadByte(); --職業種類
  data:ReadBytes(18); --Yube

  return self;
end

function ChildData.ScriptA()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function ChildData.ScriptB()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

--跟隨武將
FollowNpcData = {}
FollowNpcData.__index = FollowNpcData;

function FollowNpcData.ScriptB()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function FollowNpcData.ScriptC()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function FollowNpcData.New()
  local self = {};
  setmetatable(self, FollowNpcData);

  self.master = nil; --主人

  self.npcId = 0;
  self.name = "";

  self.beenRide = false; --被騎
  self.soulId = 0; --被魂玉變身前的ID

  self.order = 0; --排在玩家後面位置的順序

  self.isGoFight = false; --是否為出戰武將
  self.dieCount = 0; --死亡次數
  self.faith = 0; --忠誠度
  self.canGrow = 0; --0:可是攜帶的npc 1:可成長的npc 2:任務npc

  self.skillLv = { 0, 0, 0 }; --技能

  self.useSkillIdx = 0; --使用特技在特技欄的索引
  self.sublimeCount = 0; --昇華丹使用次數
  self.specialSkillLearned = false; --是否能使用特有技

  self.graspPill = {}; --領悟丹record
  self.graspPill.index = 0; --領悟丹位置
  self.graspPill.count = 0; --已使用領悟單次數

  self.spPillCount = 0; --增加SP的丹
  self.hpPillCount = 0; --增加HP的丹
  self.upgradeLv  = 0; --武將強化等級
  self.worldBossBuff = nil; --世界Boss戰BUFF DateTime

  --下野
  self.isRetire = false;
  
  return self;
end

function FollowNpcData.ScriptCF()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function FollowNpcData.ScriptCG()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

--城戰器械NPC
GuardNpcData = {}
GuardNpcData.__index = GuardNpcData;

function GuardNpcData.ScriptCG()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function GuardNpcData.New()
  local self = {};
  setmetatable(self, GuardNpcData);

  self.master = nil; --是否被駐紮 BeenGared

  self.npcId = 0;
  self.cityId = 0;

  self.kind = EGuard.None; --駐紮類別(0~10)
  self.status = 0; --損壞狀況 0:無 1:完好 2:堪用 3:毀壞

  self.orgId = 0;

  self.damageShowTime = 0; --損壞閃爍顯示時間

  return self;
end

function GuardNpcData.ScriptCGd()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

--寵物
PetNpcData = {}
PetNpcData.__index = PetNpcData;

function PetNpcData.ScriptCGd()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function PetNpcData.Scripta()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function PetNpcData.Scriptb()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function PetNpcData.New()
  local self = {};
  setmetatable(self, PetNpcData);

  self.master = nil;
--  self.isFar = false

  return self;
end

--城戰外來NPC
ForeignNpcData = {}
ForeignNpcData.__index = ForeignNpcData;

function ForeignNpcData.New()
  local self = {};
  setmetatable(self, ForeignNpcData);

  return self;
end

function ForeignNpcData.Scriptb()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

--馬車
CartNpcData = {}
CartNpcData.__index = CartNpcData;

function CartNpcData.ScriptA()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function CartNpcData.ScriptB()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function CartNpcData.New()
  local self = {};
  setmetatable(self, CartNpcData);

  self.master = nil;
  self.originalId = 0;

  return self;
end

--小屋裡的武將
HouseWarriorData = {}
HouseWarriorData.__index = HouseWarriorData;

function HouseWarriorData.ScriptB()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function HouseWarriorData.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function HouseWarriorData.ScriptC()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function HouseWarriorData.ScriptD()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function HouseWarriorData.New()
  local self = {};
  setmetatable(self, HouseWarriorData);

  return self;
end

function HouseWarriorData.ScriptE()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function HouseWarriorData.ScriptF()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

--挖礦NPC
MiningNpcData = {}
MiningNpcData.__index = MiningNpcData;

function MiningNpcData.ScriptD()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function MiningNpcData.New(name)
  local self = {};
  setmetatable(self, MiningNpcData);

  self.name = name;

  return self;
end

--玩家
PlayerData = {}
PlayerData.__index = PlayerData;

function PlayerData.New()
  local self = {};
  setmetatable(self, PlayerData);
  
  self.roleId = 0;
  self.name = "";
  self.sex = 0;
  self.face = 0;
  self.headStyle = 0;
  self.bodyStyle = 0;
  
  self.colorTints = {};
  self.colorTints[1] = 0;
  self.colorTints[2] = 0;

  self.serverId = 0;

  self.sceneId = 0;
  self.sceneTag = 0;
  self.instanceId = 0;

  self.poorMission = 0;
  self.godMission = 0;
  self.elfNo = 0;
  self.elfId = 0;

  self.equips = {};
  for i = 1, Role.maxEquip + Role.maxStyle +Role.maxOutfitStyle do
    self.equips[i] = 0;
  end
  
  self.onlineState = 0; --線上狀態

  --轉生資料
  self.turn = 0;
  self.career = 0;
  
  self.turn3Info = {};
  self.turn3Info.element = 0;
  self.turn3Info.exp = 0;
  self.turn3Info.int = 0;
  self.turn3Info.atk = 0;
  self.turn3Info.def = 0;
  self.turn3Info.agi = 0;
  self.turn3Info.hpx = 0;
  self.turn3Info.spx = 0;

  --技能
  self.skills = {};

  --FollowNpc
  self.followPositions = {};

  --City
  self.guardNpc = nil; --駐紮NPC
  self.isWatching = false; --觀戰中

  --龍舟
  self.dragonBoatSpeed = 0; --龍舟移動速度

  --軍團
  self.orgId = 0;

  --送花
  self.flowerId = 0;

  --丹
  self.attrPillCount = 0;
  self.hpPillCount = 0;
  self.spPillCount = 0;
  self.skillPillCount = 0;

  return self;
end

function PlayerData.Script1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function PlayerData.Script2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function PlayerData.Script3()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function PlayerData.Copy(data)
  local self = {};
  setmetatable(self, PlayerData);
  
  self.roleId = data.roleId;
  self.name = data.name;
  self.sex = data.sex;
  self.face = data.face;
  self.headStyle = data.headStyle;
  self.bodyStyle = data.bodyStyle;
  
  self.colorTints = data.colorTints;

  self.serverId = data.serverId;

  self.sceneId = data.sceneId;
  self.sceneTag = data.sceneTag;
  self.instanceId = data.instanceId;

  self.poorMission = data.poorMission;
  self.godMission = data.godMission;

  self.equips = { unpack(data.equips, 1, table.maxn(data.equips)) }; -- table只會複製reference、要把值拆開到一個新的table才行
  
  self.onlineState = data.onlineState; --線上狀態

  --轉生資料
  self.turn = data.turn;
  self.career = data.career;
  
  self.turn3Info = data.turn3Info;

  --技能
  self.skills = data.skills;

  --FollowNpc
  self.followPositions = data.followPositions;

  --City
  self.guardNpc = data.guardNpc; --駐紮NPC
  self.isWatching = data.isWatching; --觀戰中

  --龍舟
  self.dragonBoatSpeed = data.dragonBoatSpeed; --龍舟移動速度

  --軍團
  self.orgId = data.orgId;

  --送花
  self.flowerId = data.flowerId;

  return self;
end

function PlayerData.Script4()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function PlayerData.Script5()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function PlayerData:CheckShowEquip(fitType)
  if itemDatas[self.equips[EItemFitType.OutfitStyle_Head]] ~= nil then
    if not itemDatas[self.equips[EItemFitType.OutfitStyle_Head]]:CheckShowEquip(self.sex, fitType) then
      return false;
    end
  elseif itemDatas[self.equips[EItemFitType.Style_Head]] ~= nil then
    if not itemDatas[self.equips[EItemFitType.Style_Head]]:CheckShowEquip(self.sex, fitType) then
     return false;
    end
  elseif itemDatas[self.equips[EItemFitType.Equip_Head]] ~= nil then
    if not itemDatas[self.equips[EItemFitType.Equip_Head]]:CheckShowEquip(self.sex, fitType) then
      return false;
    end
  end
  
  if itemDatas[self.equips[EItemFitType.OutfitStyle_Body]] ~= nil then
    if not itemDatas[self.equips[EItemFitType.OutfitStyle_Body]]:CheckShowEquip(self.sex, fitType) then
      return false;
    end
  elseif itemDatas[self.equips[EItemFitType.Style_Body]] ~= nil then
    if not itemDatas[self.equips[EItemFitType.Style_Body]]:CheckShowEquip(self.sex, fitType) then
      return false;
    end
  elseif itemDatas[self.equips[EItemFitType.Equip_Body]] ~= nil then
    if not itemDatas[self.equips[EItemFitType.Equip_Body]]:CheckShowEquip(self.sex, fitType) then
      return false;
    end
  end
  
  if itemDatas[self.flowerId] ~= nil then
    if not itemDatas[self.flowerId]:CheckShowEquip(self.sex, fitType) then
      return false;
    end
  elseif itemDatas[self.equips[EItemFitType.OutfitStyle_Hand]] ~= nil then
    if not itemDatas[self.equips[EItemFitType.OutfitStyle_Hand]]:CheckShowEquip(self.sex, fitType) then
      return false;
    end
  elseif itemDatas[self.equips[EItemFitType.Style_Hand]] ~= nil then
    if not itemDatas[self.equips[EItemFitType.Style_Hand]]:CheckShowEquip(self.sex, fitType) then
      return false;
    end
  elseif itemDatas[self.equips[EItemFitType.Equip_Hand]] ~= nil then
    if not itemDatas[self.equips[EItemFitType.Equip_Hand]]:CheckShowEquip(self.sex, fitType) then
      return false;
    end
  end
  
  if itemDatas[self.equips[EItemFitType.OutfitStyle_Wrist]] ~= nil then
    if not itemDatas[self.equips[EItemFitType.OutfitStyle_Wrist]]:CheckShowEquip(self.sex, fitType) then
      return false;
    end
  elseif itemDatas[self.equips[EItemFitType.Style_Wrist]] ~= nil then
    if not itemDatas[self.equips[EItemFitType.Style_Wrist]]:CheckShowEquip(self.sex, fitType) then
      return false;
    end
  elseif itemDatas[self.equips[EItemFitType.Equip_Wrist]] ~= nil then
    if not itemDatas[self.equips[EItemFitType.Equip_Wrist]]:CheckShowEquip(self.sex, fitType) then
      return false;
    end
  end
  
  if itemDatas[self.equips[EItemFitType.OutfitStyle_Boots]] ~= nil then
    if not itemDatas[self.equips[EItemFitType.OutfitStyle_Boots]]:CheckShowEquip(self.sex, fitType) then
      return false;
    end
  elseif itemDatas[self.equips[EItemFitType.Style_Boots]] ~= nil then
    if not itemDatas[self.equips[EItemFitType.Style_Boots]]:CheckShowEquip(self.sex, fitType) then
      return false;
    end
  elseif itemDatas[self.equips[EItemFitType.Equip_Boots]] ~= nil then
    if not itemDatas[self.equips[EItemFitType.Equip_Boots]]:CheckShowEquip(self.sex, fitType) then
      return false;
    end
  end
  
  if itemDatas[self.equips[EItemFitType.Equip_Spec]] ~= nil then
    if not itemDatas[self.equips[EItemFitType.Equip_Spec]]:CheckShowEquip(self.sex, fitType) then
      return false;
    end
  end

  return true;
end

function PlayerData.Script6()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function PlayerData.Script7()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function PlayerData.Script8()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

local bodyPicId = 0;
local hairPicId = 0;
local helmPicId = 0;
local wristPicId = 0;
local bootsPicId = 0;
local clothesPicId = 0;
local equipPicId = 0;
local weaponPicId = 0;
local capePicId = 0;
local r, g, b;
local colorTint1 = 0;
local colorTint2 = 0;
local colorTint3 = 0;
local colorTint4 = 0;
local colorTint5 = 0;

function PlayerData.Script9()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function PlayerData:GetAtlasParams(titleId, ...)
  bodyPicId = self:GetPicId(ERolePart.Body);
  hairPicId = self:GetPicId(ERolePart.Hair);
  helmPicId = self:GetPicId(ERolePart.Helm);
  wristPicId = self:GetPicId(ERolePart.Wrist);
  bootsPicId = self:GetPicId(ERolePart.Boots);
  clothesPicId = self:GetPicId(ERolePart.Clothes);
  equipPicId = self:GetEquipPicId(EItemFitType.Equip_Spec);
  weaponPicId = self:GetPicId(ERolePart.Weapon);

  capePicId = self:GetPicId(ERolePart.Cape);
  local titleData = titleDatas[titleId];
  if titleData ~= nil then
    if self.sex == 1 then
      if titleData.capePicId[1] ~= 0 then
        capePicId = titleData.capePicId[1];
      end
    else
      if titleData.capePicId[2] ~= 0 then
        capePicId = titleData.capePicId[2];
      end
    end
  end

  colorTint1 = 0;
  r, g, b = self:GetColorTint(EColorPart.Helm);
  colorTint1 = colorTint1 + r * 100000000 + g * 10000000 + b * 1000000;
  r, g, b = self:GetColorTint(EColorPart.Hair);
  colorTint1 = colorTint1 + r * 100000 + g * 10000 + b * 1000;
  r, g, b = self:GetColorTint(EColorPart.Skin);
  colorTint1 = colorTint1 + r * 100 + g * 10 + b;

  colorTint2 = 0;
  r, g, b = self:GetColorTint(EColorPart.Clothes);
  colorTint2 = colorTint2 + r * 100000000 + g * 10000000 + b * 1000000;
  r, g, b = self:GetColorTint(EColorPart.Orna1);
  colorTint2 = colorTint2 + r * 100000 + g * 10000 + b * 1000;
  r, g, b = self:GetColorTint(EColorPart.Orna2);
  colorTint2 = colorTint2 + r * 100 + g * 10 + b;

  colorTint3 = 0;
  r, g, b = self:GetColorTint(EColorPart.Orna3);
  colorTint3 = colorTint3 + r * 100000000 + g * 10000000 + b * 1000000;
  r, g, b = self:GetColorTint(EColorPart.Orna4);
  colorTint3 = colorTint3 + r * 100000 + g * 10000 + b * 1000;
  r, g, b = self:GetColorTint(EColorPart.Boots);
  colorTint3 = colorTint3 + r * 100 + g * 10 + b;

  colorTint4 = 0;
  r, g, b = self:GetColorTint(EColorPart.Weapon);
  colorTint4 = colorTint4 + r * 100000000 + g * 10000000 + b * 1000000;
  r, g, b = self:GetColorTint(EColorPart.WeaponOrna);
  colorTint4 = colorTint4 + r * 100000 + g * 10000 + b * 1000;
  r, g, b = self:GetColorTint(EColorPart.Wrist);
  colorTint4 = colorTint4 + r * 100 + g * 10 + b;

  colorTint5 = 0;
  r, g, b = self:GetColorTint(EColorPart.Cape);
  colorTint5 = colorTint5 + r * 100 + g * 10 + b;

  return bodyPicId, hairPicId, helmPicId, wristPicId, bootsPicId, clothesPicId, equipPicId, weaponPicId, capePicId, colorTint1, colorTint2, colorTint3, colorTint4, colorTint5, ...;
end

function PlayerData.Script10()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function PlayerData.Script11()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function PlayerData.Script12()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function PlayerData.Script13()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function PlayerData:GetColorTint(colorPart, ignoreEquip)
  local r = 4;
  local g = 4;
  local b = 4;

  local specialEquip = itemDatas[self.equips[EItemFitType.Equip_Spec]];

  if colorPart == EColorPart.Helm then
    if self:CheckShowEquip(EItemFitType.Equip_Head) then
      if itemDatas[self.equips[EItemFitType.OutfitStyle_Head]] ~= nil then
        return itemDatas[self.equips[EItemFitType.OutfitStyle_Head]]:GetColorTint(colorPart, self.sex);
      elseif itemDatas[self.equips[EItemFitType.Style_Head]] ~= nil then
        return itemDatas[self.equips[EItemFitType.Style_Head]]:GetColorTint(colorPart, self.sex);
      elseif itemDatas[self.equips[EItemFitType.Equip_Head]] ~= nil then
        return itemDatas[self.equips[EItemFitType.Equip_Head]]:GetColorTint(colorPart, self.sex);
      else
        r = (self.colorTints[1] / 100000000) % 10;
        g = (self.colorTints[1] / 10000000) % 10;
        b = (self.colorTints[1] / 1000000) % 10;
      end
    end
  elseif colorPart == EColorPart.Hair then
    if ignoreEquip == true or self:CheckShowEquip(0) then
      r = (self.colorTints[1] / 100000) % 10;
      g = (self.colorTints[1] / 10000) % 10;
      b = (self.colorTints[1] / 1000) % 10;
    end
  elseif colorPart == EColorPart.Skin then
    r = (self.colorTints[1] / 100) % 10;
    g = (self.colorTints[1] / 10) % 10;
    b = (self.colorTints[1] / 1) % 10;
  elseif colorPart == EColorPart.Clothes then
    r = (self.colorTints[2] / 100000000) % 10;
    g = (self.colorTints[2] / 10000000) % 10;
    b = (self.colorTints[2] / 1000000) % 10;
  elseif colorPart == EColorPart.Orna1 then
    if self:CheckShowEquip(EItemFitType.Equip_Boots) then
      if itemDatas[self.equips[EItemFitType.OutfitStyle_Boots]] ~= nil then
        return itemDatas[self.equips[EItemFitType.OutfitStyle_Boots]]:GetColorTint(colorPart, self.sex);
      elseif itemDatas[self.equips[EItemFitType.Style_Boots]] ~= nil then
        return itemDatas[self.equips[EItemFitType.Style_Boots]]:GetColorTint(colorPart, self.sex);
      elseif itemDatas[self.equips[EItemFitType.Equip_Boots]] ~= nil then
        return itemDatas[self.equips[EItemFitType.Equip_Boots]]:GetColorTint(colorPart, self.sex);
      else
        r = (self.colorTints[2] / 100000) % 10;
        g = (self.colorTints[2] / 10000) % 10;
        b = (self.colorTints[2] / 1000) % 10;
      end
    end
  elseif colorPart == EColorPart.Orna2 then
  elseif colorPart == EColorPart.Orna3 then
    if self:CheckShowEquip(EItemFitType.Equip_Body) then
      if itemDatas[self.equips[EItemFitType.OutfitStyle_Body]] ~= nil then
        return itemDatas[self.equips[EItemFitType.OutfitStyle_Body]]:GetColorTint(colorPart, self.sex);
      elseif itemDatas[self.equips[EItemFitType.Style_Body]] ~= nil then
        return itemDatas[self.equips[EItemFitType.Style_Body]]:GetColorTint(colorPart, self.sex);
      elseif itemDatas[self.equips[EItemFitType.Equip_Body]] ~= nil then
        return itemDatas[self.equips[EItemFitType.Equip_Body]]:GetColorTint(colorPart, self.sex);
      end
    end
  elseif colorPart == EColorPart.Orna4 then
    if self:CheckShowEquip(EItemFitType.Equip_Body) then
      if itemDatas[self.equips[EItemFitType.OutfitStyle_Body]] ~= nil then
        return itemDatas[self.equips[EItemFitType.OutfitStyle_Body]]:GetColorTint(colorPart, self.sex);
      elseif itemDatas[self.equips[EItemFitType.Style_Body]] ~= nil then
        return itemDatas[self.equips[EItemFitType.Style_Body]]:GetColorTint(colorPart, self.sex);
      elseif itemDatas[self.equips[EItemFitType.Equip_Body]] ~= nil then
        return itemDatas[self.equips[EItemFitType.Equip_Body]]:GetColorTint(colorPart, self.sex);
      end
    end
  elseif colorPart == EColorPart.Boots then
    if self:CheckShowEquip(EItemFitType.Equip_Boots) then
      if itemDatas[self.equips[EItemFitType.OutfitStyle_Boots]] ~= nil then
        return itemDatas[self.equips[EItemFitType.OutfitStyle_Boots]]:GetColorTint(colorPart, self.sex);
      elseif itemDatas[self.equips[EItemFitType.Style_Boots]] ~= nil then
        return itemDatas[self.equips[EItemFitType.Style_Boots]]:GetColorTint(colorPart, self.sex);
      elseif itemDatas[self.equips[EItemFitType.Equip_Boots]] ~= nil then
        return itemDatas[self.equips[EItemFitType.Equip_Boots]]:GetColorTint(colorPart, self.sex);
      else
        r = (self.colorTints[2] / 100) % 10;
        g = (self.colorTints[2] / 10) % 10;
        b = (self.colorTints[2] / 1) % 10;
      end
    end
  elseif colorPart == EColorPart.Weapon then
    if self:CheckShowEquip(EItemFitType.Equip_Hand) then
      if itemDatas[self.flowerId] ~= nil then
      elseif itemDatas[self.equips[EItemFitType.OutfitStyle_Hand]] ~= nil then
        return itemDatas[self.equips[EItemFitType.OutfitStyle_Hand]]:GetColorTint(colorPart, self.sex);
      elseif itemDatas[self.equips[EItemFitType.Style_Hand]] ~= nil then
        return itemDatas[self.equips[EItemFitType.Style_Hand]]:GetColorTint(colorPart, self.sex);
      elseif itemDatas[self.equips[EItemFitType.Equip_Hand]] ~= nil then
        return itemDatas[self.equips[EItemFitType.Equip_Hand]]:GetColorTint(colorPart, self.sex);
      end
    end
  elseif colorPart == EColorPart.WeaponOrna then
    if self:CheckShowEquip(EItemFitType.Equip_Hand) then
      if itemDatas[self.equips[EItemFitType.OutfitStyle_Hand]] ~= nil then
        return itemDatas[self.equips[EItemFitType.OutfitStyle_Hand]]:GetColorTint(colorPart, self.sex);
      elseif itemDatas[self.equips[EItemFitType.Style_Hand]] ~= nil then
        return itemDatas[self.equips[EItemFitType.Style_Hand]]:GetColorTint(colorPart, self.sex);
      elseif itemDatas[self.equips[EItemFitType.Equip_Hand]] ~= nil then
        return itemDatas[self.equips[EItemFitType.Equip_Hand]]:GetColorTint(colorPart, self.sex);
      end
    end
  elseif colorPart == EColorPart.Wrist then
    if self:CheckShowEquip(EItemFitType.Equip_Wrist) then
      if itemDatas[self.equips[EItemFitType.OutfitStyle_Wrist]] ~= nil then
        return itemDatas[self.equips[EItemFitType.OutfitStyle_Wrist]]:GetColorTint(colorPart, self.sex);
      elseif itemDatas[self.equips[EItemFitType.Style_Wrist]] ~= nil then
        return itemDatas[self.equips[EItemFitType.Style_Wrist]]:GetColorTint(colorPart, self.sex);
      elseif itemDatas[self.equips[EItemFitType.Equip_Wrist]] ~= nil then
        return itemDatas[self.equips[EItemFitType.Equip_Wrist]]:GetColorTint(colorPart, self.sex);
      end
    end
  elseif colorPart == EColorPart.Cape then
    if self:CheckShowEquip(EItemFitType.Equip_Cape) then
      if City.IsCityChief(self.roleId) then
      elseif City.IsCitySubChief(self.roleId) then
        r = 0;
        g = 2;
        b = 8;
      end
    end
  end

  return math.floor(r), math.floor(g), math.floor(b);
end

function PlayerData.Script14()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function PlayerData.Script15()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function PlayerData:GetPicId(part, ignoreEquip)
  if part == ERolePart.Body then
    if self.sex == 1 then
      return 2000;
    else
      return 3000;
    end
  elseif part == ERolePart.Helm then
    return self:GetEquipPicId(EItemFitType.Equip_Head);
  elseif part == ERolePart.Hair then
    if ignoreEquip ~= true and not self:CheckShowEquip(0) then return 0 end
    if self.sex == 1 then
      return 2100 + self.headStyle;
    else
      return 3100 + self.headStyle;
    end
  elseif part == ERolePart.Clothes then
    return self:GetEquipPicId(EItemFitType.Equip_Body);
  elseif part == ERolePart.Boots then
    return self:GetEquipPicId(EItemFitType.Equip_Boots);
  elseif part == ERolePart.Weapon then
    return self:GetEquipPicId(EItemFitType.Equip_Hand);
  elseif part == ERolePart.Wrist then
    return self:GetEquipPicId(EItemFitType.Equip_Wrist);
  elseif part == ERolePart.Cape then
    return self:GetEquipPicId(EItemFitType.Equip_Cape);
  elseif part == ERolePart.BathBody then
    return 0;
  elseif part == ERolePart.BathHair then
    return 0;
  elseif part == ERolePart.BathHelm then
    return 0;
  elseif part == ERolePart.KissBody then
    return 0;
  elseif part == ERolePart.KissHair then
    return 0;
  else
    return 0;
  end
end

function PlayerData:GetEquipPicId(fitType)
  if not self:CheckShowEquip(fitType) then return 0 end

  if fitType == EItemFitType.Equip_Head then
    if itemDatas[self.equips[EItemFitType.OutfitStyle_Head]] ~= nil then
      return itemDatas[self.equips[EItemFitType.OutfitStyle_Head]].picId[self.sex];
    elseif itemDatas[self.equips[EItemFitType.Style_Head]] ~= nil then
      return itemDatas[self.equips[EItemFitType.Style_Head]].picId[self.sex];
    elseif itemDatas[self.equips[EItemFitType.Equip_Head]] ~= nil then
      return itemDatas[self.equips[EItemFitType.Equip_Head]].picId[self.sex];
    end
  elseif fitType == EItemFitType.Equip_Body then
    if itemDatas[self.equips[EItemFitType.OutfitStyle_Body]] ~= nil then
      return itemDatas[self.equips[EItemFitType.OutfitStyle_Body]].picId[self.sex];
    elseif itemDatas[self.equips[EItemFitType.Style_Body]] ~= nil then
      return itemDatas[self.equips[EItemFitType.Style_Body]].picId[self.sex];
    elseif itemDatas[self.equips[EItemFitType.Equip_Body]] ~= nil then
      return itemDatas[self.equips[EItemFitType.Equip_Body]].picId[self.sex];
    end
  elseif fitType == EItemFitType.Equip_Hand then
    if itemDatas[self.flowerId] ~= nil then
      return itemDatas[self.flowerId].picId[self.sex];
    elseif itemDatas[self.equips[EItemFitType.OutfitStyle_Hand]] ~= nil then
      return itemDatas[self.equips[EItemFitType.OutfitStyle_Hand]].picId[self.sex];
    elseif itemDatas[self.equips[EItemFitType.Style_Hand]] ~= nil then
      return itemDatas[self.equips[EItemFitType.Style_Hand]].picId[self.sex];
    elseif itemDatas[self.equips[EItemFitType.Equip_Hand]] ~= nil then
      return itemDatas[self.equips[EItemFitType.Equip_Hand]].picId[self.sex];
    end
  elseif fitType == EItemFitType.Equip_Wrist then
    if itemDatas[self.equips[EItemFitType.OutfitStyle_Wrist]] ~= nil then
      return itemDatas[self.equips[EItemFitType.OutfitStyle_Wrist]].picId[self.sex];
    elseif itemDatas[self.equips[EItemFitType.Style_Wrist]] ~= nil then
      return itemDatas[self.equips[EItemFitType.Style_Wrist]].picId[self.sex];
    elseif itemDatas[self.equips[EItemFitType.Equip_Wrist]] ~= nil then
      return itemDatas[self.equips[EItemFitType.Equip_Wrist]].picId[self.sex];
    end
  elseif fitType == EItemFitType.Equip_Boots then
    if itemDatas[self.equips[EItemFitType.OutfitStyle_Boots]] ~= nil then
      return itemDatas[self.equips[EItemFitType.OutfitStyle_Boots]].picId[self.sex];
    elseif itemDatas[self.equips[EItemFitType.Style_Boots]] ~= nil then
      return itemDatas[self.equips[EItemFitType.Style_Boots]].picId[self.sex];
    elseif itemDatas[self.equips[EItemFitType.Equip_Boots]] ~= nil then
      return itemDatas[self.equips[EItemFitType.Equip_Boots]].picId[self.sex];
    end
  elseif fitType == EItemFitType.Equip_Spec then
    if itemDatas[self.equips[EItemFitType.Equip_Spec]] ~= nil then
      return itemDatas[self.equips[EItemFitType.Equip_Spec]].picId[self.sex];
    end
  elseif fitType == EItemFitType.Equip_Cape then
    if City.IsCityChief(self.roleId) or City.IsCitySubChief(self.roleId) then
      if self.sex == 1 then
        return 2324;
      else
        return 3332;
      end
    end
  end
  
  return 0;
end

function PlayerData.Script15()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function PlayerData.Script16()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function PlayerData.Script17()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end