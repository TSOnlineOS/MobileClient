WarshipData = {}
WarshipData.__index = WarshipData;

function WarshipData.Random()
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

function WarshipData.New()
  local self = {};
  setmetatable(self, WarshipData);
  
  self.isAnchor = false; --是否下錨

  self.npcId = 0; --船的id
  self.name = "";
  self.picId = 0; --圖號
  self.bodyKind = 0;

  self.speed = 0; --航速
  self.campKind = 0; --陣營(目前分為2方,陣營相同為我方戰船,不同為敵方戰船)

  self.hold_Kind = 0; --被鎖定目標的Hum_Kind
  self.hold_Idx = 0; --自己鎖定的目標(敵我雙方皆可)

  self.followID = 0; --被自己跟隨的對像(id)==>有跟隨對像要起錨,跟隨對像消失時要下錨
  self.followPos = Vector2.zero; --要跟隨的位置(Server給)

  self.sedHum_Kind = 0;
  self.sedID = 0; --送Server用 被攻擊者 ID
  self.sedSkillID = 0; --送Server用 使用何種技能攻擊

  self.moveTime = 0; --判斷送點時間
  self.steerageTime = 0; --時間標記
  self.steerage = 0; --舵速
  self.rudderKind = 0; --舵的型式(6種1~6)
  self.hpx = 0;
  self.spx = 0;
  self.atk = 0;
  self.def = 0; --船的4圍
  self.equipAgi = 0; --裝備敏捷力

  --水兵,裝甲,載彈 用4圍導入公式換算出來
  self.maxSailor = 0; --最大水兵值
  self.sailor = 0; --水兵值
  self.showSailor = 0; --顯示的水兵值
  self.maxArmor = 0; --最大裝甲值
  self.armor = 0; --裝甲值
  self.showArmor = 0; --顯示的裝甲值
  self.maxArms = 0; --最大載彈值
  self.arms = 0; --載彈值
  self.showArms = 0; --顯示的載彈值
  self.maxJewel = 0; --最大財寶值
  self.jewel = 0; --財寶值
  self.showJewel = 0; --顯示的財寶值

  --水戰時,戰船固定技(讀Excel)
  self.skills = {};
  for i = 1, Warship.MaxBoatInnateSkill do
    self.skills[i] = {};
    self.skills[i].Id = 0;
    self.skills[i].Lv = 0;
    self.skills[i].useTime = 0; --上一次的使用時間(判斷Cool Down Count用)
    self.skills[i].disable = false; --是否不可使用
  end

  return self;
end

function WarshipData.Random1()
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

function WarshipData.Random2()
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

function WarshipData:SetSkill(index, skillId, skillLv)
  self.skills[index].Id = skillId;
  self.skills[index].Lv = skillLv;
  
  --將戰船技能設定 水戰快捷列
  if self.skills[index].Id ~= 0 then
    --Se_HotKeyForm.SetSkillHotKey(index, self.skills[index].Id, False);
  end

  --ShipSkillTreeForm.UpdataPlayerSkillInfo;
end

function WarshipData.Random3()
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

function WarshipData.Random4()
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

function WarshipData:SetAttribute(attrKind, attrValue)
  if attrKind == EWarshipAttribute.Sailor then
    self.sailor = attrValue;
  elseif attrKind == EWarshipAttribute.MaxSailor then
    self.maxSailor = attrValue;
  elseif attrKind == EWarshipAttribute.Armor then
    self.armor = attrValue;
  elseif attrKind == EWarshipAttribute.MaxArmor then
    self.maxArmor = attrValue;
  elseif attrKind == EWarshipAttribute.Arms then
    self.arms = attrValue;
  elseif attrKind == EWarshipAttribute.MaxArms then
    self.maxArms = attrValue;
  elseif attrKind == EWarshipAttribute.MaxJewel then
    self.jewel = attrValue;
  elseif attrKind == EWarshipAttribute.EquipAgi then
    self.equipAgi = attrValue;
  end
end

function WarshipData.Random5()
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

function WarshipData.Random6()
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