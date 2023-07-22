NpcSoulData = {}
NpcSoulData.__index = NpcSoulData;

function NpcSoulData.New(reader)
  local self = {};
  setmetatable(self, NpcSoulData);

  self.id = reader:ReadUInt16();  --[1] 物品編號
  self.npcId = reader:ReadUInt16();  --[2] NPC編號(1000X黃巾 1100X魏 1200X蜀 1300X吳 1400X精怪 1500X神魔 1600X歷史虛幻
  self.quality = reader:ReadByte();  --[4] 品質 (0.白 1.綠 2.藍 3.紫)

  return self.id, self;
end

function NpcSoulData.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function NpcSoulData.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

SoulThing = {}
SoulThing.__index = SoulThing;

function SoulThing.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function SoulThing.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function SoulThing.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function SoulThing.New(data)
  local self = {};
  setmetatable(self, SoulThing);

  self.sn = 0;
  self.Id = 0; --編號(物品ID)
  self.quant = 1; --數量(固定)
  self.element = 0; --屬性
  self.equipId = 0; --裝備武將ID
  self.lv = 0; --等級
  self.quality = 0; --品質
  self.starLv = 0;  --突破等級
  self.startAtt = {}; --初始六維
  self.nowAtt = {}; --目前六維
  self.skill = {};  --技能
  self.isLock = false; --鎖定
  self.isMining = false; --挖礦

  if data ~= nil then
    self.sn = data:ReadInt64();
    self.Id = data:ReadUInt16();
    self.element = data:ReadByte();
    self.equipId = data:ReadUInt16();
    self.lv = data:ReadUInt16();
    self.starLv = data:ReadByte();


    --[[
    攻擊力
    防禦力
    知力
    敏捷
    體質
    能量
    ]]--

    for j = 1, 6 do
      self.startAtt[j] = data:ReadUInt16();
    end

    for j = 1, 6 do
      self.nowAtt[j] = data:ReadUInt16();
    end

    for j = 1, Role.maxSoulSkill do
      self.skill[j] = {};
      self.skill[j].id = data:ReadUInt16();
      self.skill[j].lv = data:ReadByte();
    end

    self.lock = data:ReadByte();

    if bit.band(self.lock, 1) == 0 then
      self.isLock = false;
    elseif bit.band(self.lock, 1) == 1 then
      self.isLock = true;
    end

    if bit.band(self.lock, 2) == 0 then
      self.isMining = false;
    elseif bit.band(self.lock, 2) == 2 then
      self.isMining = true;
    end

    if itemDatas[self.Id] then
      self.quality = itemDatas[self.Id].quality;
    end
  end

  return self;
end

function SoulThing.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function SoulThing.Copy(data)
  local self = {};
  setmetatable(self, SoulThing);
  
  self.sn = data.sn;
  self.Id = data.Id; --編號
  self.quant = data.quant; --數量(固定)
  self.element = data.element; --屬性
  self.equipId = data.equipId; --裝備武將ID
  self.lv = data.lv; --等級
  self.quality = data.quality; --品質
  self.starLv = data.starLv;  --突破等級
  self.startAtt = data.startAtt; --初始六維
  self.nowAtt = data.nowAtt; --目前六維
  self.skill = data.skill;  --技能
  self.isLock = data.isLock; --鎖定
  self.isMining = data.isMining; --挖礦
  
  return self;
end

function SoulThing.CopyForMarket(data, bagIndex)
  local self = {};
  setmetatable(self, SoulThing);
  
  self.sn = data.sn;
  self.Id = data.Id; --編號
  self.quant = data.quant; --數量(固定)
  self.element = data.element; --屬性
  self.equipId = data.equipId; --裝備武將ID
  self.lv = data.lv; --等級
  self.quality = data.quality; --品質
  self.starLv = data.starLv;  --突破等級
  self.startAtt = data.startAtt; --初始六維
  self.nowAtt = data.nowAtt; --目前六維
  self.skill = data.skill;  --技能
  self.isLock = data.isLock; --鎖定
  self.isMining = data.isMining; --挖礦
  self.bagIndex = bagIndex;
  
  return self;
end

function SoulThing.Trash4()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function SoulThing.Trash5()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function SoulThing.Trash6()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function SoulThing:GetAttribute(attribute)
  if attribute == EAttribute.Element then
    return self.element;
  elseif attribute == EAttribute.Atk then
    return self.startAtt[1] + self.nowAtt[1];
  elseif attribute == EAttribute.Def then
    return self.startAtt[2] + self.nowAtt[2];
  elseif attribute == EAttribute.Int then
    return self.startAtt[3] + self.nowAtt[3];
  elseif attribute == EAttribute.Agi then
    return self.startAtt[4] + self.nowAtt[4];
  elseif attribute == EAttribute.Hpx then
    return self.startAtt[5] + self.nowAtt[5];
  elseif attribute == EAttribute.Spx then
    return self.startAtt[6] + self.nowAtt[6];
  end
end

function SoulThing.Trash7()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function SoulThing:GetSixAtt(index)
  return self.startAtt[index] + self.nowAtt[index];
end

function SoulThing.Trash8()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function SoulThing.Trash9()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function SoulThing:GetSkillLv(skillId)
  for i = 1, Role.maxSoulSkill do
    if self.skill[i].id == skillId then
      return self.skill[i].lv;
    end
  end

  return 0;
end

function SoulThing:GetLimitLv()
  return soulDatas[self.quality].basicLvLimit + self.starLv * 20;
end

function SoulThing.Trash10()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function SoulThing.Tras11()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function SoulThing:SkillIsMax(skillId)
  for i = 1, Role.maxSoulSkill do
    if self.skill[i].id == skillId then
      local skillData = skillDatas[self.skill[i].id];
      return self.skill[i].lv == skillData.maxLv;
    end
  end
end

function SoulThing:GetConvertAtt(attribute)
  return math.floor(self:GetAttribute(attribute) * self:GetConvertPercent());
end

function SoulThing.Tras12()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end


function SoulThing.Tras13()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end


function SoulThing.Tras14()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end


function SoulThing.Tras15()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function SoulThing:GetConvertSixAtt(index)
  return math.floor(self:GetSixAtt(index) * self:GetConvertPercent());
end

function SoulThing:GetConvertPercent()
  return soulDatas[self.quality].convertRate[self.starLv] / 10000;
end

function SoulThing.Tras16()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function SoulThing.Tras17()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end