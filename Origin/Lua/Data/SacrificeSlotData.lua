SacrificeSlotData = {}
SacrificeSlotData.__index = SacrificeSlotData;
local this = SacrificeSlotData;

function SacrificeSlotData.Demo()
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

function SacrificeSlotData.DemoA()
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

function SacrificeSlotData.New(reader)
  local self = {};
  setmetatable(self, SacrificeSlotData);

  self.id = reader:ReadUInt16();
  self.awardItem = reader:ReadUInt16();
  self.itemCount = reader:ReadByte();

  self.icons = {};
  for i = 1, 3 do
    self.icons[i] = {};
    self.icons[i] = reader:ReadByte();
  end
  return self.id, self;
end

function SacrificeSlotData:GetAwardText(multiply)
  local count = self.itemCount * multiply;
  local awardName = self:GetName();
  if awardName == nil then
    return
  end
  return string.format(string.Get(23840), awardName, count);
end

function SacrificeSlotData.DemoC()
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

function SacrificeSlotData.DemoB()
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

function SacrificeSlotData:GetName()
  if self.itemName == nil then
    if itemDatas[self.awardItem] ~= nil then
      self.itemName = itemDatas[self.awardItem]:GetName(true);
    else
      logWarn("itemID is Empty");
    end
  end
  return self.itemName
end
