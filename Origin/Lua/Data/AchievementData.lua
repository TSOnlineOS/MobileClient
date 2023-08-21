
TagData = {}
TagData.__index = TagData;

function TagData.Random()
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

function TagData.New(reader)
  local mainTag = reader:ReadByte();--主分類
  local subTag = reader:ReadByte();--次分類
  local name = reader:ReadUInt32();--頁籤名稱

  return mainTag, subTag, name;
end

AchievementData = {}
AchievementData.__index = AchievementData;

function AchievementData.New(reader)
  local self = {};
  setmetatable(self, AchievementData);
  
  self.Id = reader:ReadUInt16();--成就ID
  self.name = reader:ReadUInt32();--成就名稱
  local mainTag = reader:ReadByte();--主分類
  local subTag = reader:ReadByte();--次分類
  self.sotrId = reader:ReadByte();--成就順序
  self.showKind = reader:ReadByte();--顯示類別
  self.content = reader:ReadUInt32();--達成內容
  self.score = reader:ReadByte();--成就積分
  self.conditions = {};
  self.conditions.kind = reader:ReadByte();--成就類別
  self.conditions.kindValue = reader:ReadUInt32();--類別數值
  self.conditions.opr =  reader:ReadByte();--運算子
  self.conditions.value = reader:ReadUInt32();--成就達成數值
  self.itemId = reader:ReadUInt16();--獎勵物品ID
  self.itemCount = reader:ReadByte();--獎勵物品數量
  self.completeFlag = reader:ReadUInt16();--完成永標
  self.getFlag = reader:ReadUInt16();--領獎永標
  self.channel = reader:ReadByte();--廣播頻道
  self.channelContent = reader:ReadUInt32();--廣播內容
  self.titleId = 0;

  return mainTag, subTag, self;
end

function AchievementData.Random()
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

function AchievementData:GetName()
  return string.Get(self.name);
end

function AchievementData:GetTitle()
  if titleDatas[self.titleId] ~= nil then
    return string.Concat(string.Get(21934), string.Get(titleDatas[self.titleId].name));
  else
    return "";
  end
end

function AchievementData:GetContent()
  return string.Get(self.content);
end

function AchievementData.RandomA()
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

function AchievementData.RandomB()
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


function AchievementData:GetPogress()
  return string.Concat(self:GetConditionCurrentValue(), " / ", self.conditions.value);
end

function AchievementData.RandomC()
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

function AchievementData.RandomD()
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

function AchievementData:IsComplete()
  if self.conditions.opr == 1 then
    return self:GetConditionCurrentValue() == self.conditions.value;
  elseif self.conditions.opr == 2 then
    return self:GetConditionCurrentValue() > self.conditions.value;
  elseif self.conditions.opr == 3 then
    return self:GetConditionCurrentValue() >= self.conditions.value;
  elseif self.conditions.opr == 4 then
    return self:GetConditionCurrentValue() < self.conditions.value;
  elseif self.conditions.opr == 5 then
    return self:GetConditionCurrentValue() <= self.conditions.value;
  elseif self.conditions.opr == 6 then
    return self:GetConditionCurrentValue() ~= self.conditions.value;
  end

  return false;
end

function AchievementData.RandomE()
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

function AchievementData.RandomF()
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

function AchievementData.GetData(achievementId)
  for mainKey, mainValue in pairs(achievementDatas) do
    for subKey, subValue in pairs(mainValue) do
      for k, v in pairs(subValue) do
        if v.Id == achievementId then
          return v;
        end
      end
    end  
  end

  return nil;
end

function AchievementData.RandomG()
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

function AchievementData.RandomH()
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

function AchievementData:HaveCompeleteFlag()
  return BitFlag.Get(self.completeFlag);
end

function AchievementData:HaveGetFlag()
  return BitFlag.Get(self.getFlag);
end

function AchievementData.RandomI()
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

function AchievementData.RandomJ()
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

function AchievementData.RandomK()
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

function AchievementData:GetConditionCurrentValue()
  if CheckCondition.CalculationConditionValue[self.conditions.kind] == nil then
    return 0;
  end

  return CheckCondition.CalculationConditionValue[self.conditions.kind](self);
end