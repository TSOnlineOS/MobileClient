EternalDungeonPrizeData = {}
EternalDungeonPrizeData.__index = EternalDungeonPrizeData;

local this = EternalDungeonPrizeData;
local eternalDungeonPrizeGroup = {};
local lastIdx = 1;

function EternalDungeonPrizeData.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end

function EternalDungeonPrizeData.Scripta()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end

function EternalDungeonPrizeData.Scriptb()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end

function EternalDungeonPrizeData.New(reader)
  local self = {};
  setmetatable(self, EternalDungeonPrizeData);
  
  self.id = reader:ReadInt32(); 
  
  self.prize = {};
  for i = 1, 5 do
    self.prize[i] = {}
    self.prize[i].itemId = reader:ReadUInt16();--物品Id
    self.prize[i].count = reader:ReadByte(); --物品數量
  end

  for i = lastIdx, self.id do
    eternalDungeonPrizeGroup[i] = lastIdx;
  end
  lastIdx = self.id;
  eternalDungeonPrizeGroup[lastIdx] = lastIdx;

  return self.id, self;
end

function EternalDungeonPrizeData.ScriptC()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end

function EternalDungeonPrizeData.ScriptD()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end

function EternalDungeonPrizeData.GetIdx(idx)
  if eternalDungeonPrizeGroup[idx] ~= nil then
    return eternalDungeonPrizeGroup[idx];
  else
    return eternalDungeonPrizeGroup[lastIdx];
  end;
end

function EternalDungeonPrizeData.ScriptE()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end

function EternalDungeonPrizeData.ScriptF()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end

function EternalDungeonPrizeData.ScriptG()
  if LuaHelper.CheckDefine("DemoCode") then
    local index = 56;
    
    for i = 1, Astrolabe.maxAstrolabeLv do
      index = index - i;
    end
    
    return index
  end
end