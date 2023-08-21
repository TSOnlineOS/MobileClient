EBlissBagKind = {
  BlissBag = 1;
  LuckyBag = 2;
}

BlissBagData = {}
BlissBagData.__index = BlissBagData;

function BlissBagData.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function BlissBagData.New(reader)
  local self = {};
  setmetatable(self, BlissBagData);

  local id = reader:ReadUInt16();

  self.itemId = reader:ReadUInt16();
  self.count = reader:ReadUInt32();
  self.pr = reader:ReadUInt32();
  self.kind = reader:ReadByte();

  return id, self;
end

function BlissBagData.TrashA()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function BlissBagData.IsBlissBag(itemId)
  return blissBagDatas[itemId] ~= nil;
end

function BlissBagData.TrashB()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function BlissBagData.TrashC()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end


function BlissBagData.GetAllBlissBagItem(itemId)
  local itemData = itemDatas[itemId];

  if itemData == nil then return end

  if not BlissBagData.IsBlissBag(itemId) then return end

  return blissBagDatas[itemId].items;
end

LuckyBagData = {}
LuckyBagData.__index = LuckyBagData;

function LuckyBagData.New(reader)
  local self = {};
  setmetatable(self, LuckyBagData);

  local id = reader:ReadUInt16();
  self.name = reader:ReadUInt32();
  self.icon = reader:ReadUInt16();
  self.items = {};

  for i = 1, 30 do
    self.items[i] = {};
    self.items[i].block = reader:ReadByte();
    self.items[i].itemId = reader:ReadUInt16();
    self.items[i].count = reader:ReadUInt32();
  end

  return id, self;
end

function LuckyBagData.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function LuckyBagData.Trasha()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function LuckyBagData.Trashb()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function LuckyBagData:GetName()
  return string.Get(self.name);
end

function LuckyBagData:GetCount()
  local itemCount = 0;
  local blockCount = 0;

  for i = 1, 30 do
    if self.items[i].itemId ~= 0 then
      itemCount = itemCount + 1 ;
      blockCount = self.items[i].block;
    else
      break;
    end
  end

  return itemCount, blockCount;
end

function LuckyBagData.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function LuckyBagData.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function LuckyBagData.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end