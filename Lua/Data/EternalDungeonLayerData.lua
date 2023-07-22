EternalDungeonLayerData = {}
EternalDungeonLayerData.__index = EternalDungeonLayerData;

local this = EternalDungeonLayerData;
local eternalDungeonLayerGroup = {};
local lastIdx = 1;

function EternalDungeonLayerData.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function EternalDungeonLayerData.New(reader)
  local self = {};
  setmetatable(self, EternalDungeonLayerData);
  
  self.id = reader:ReadUInt16(); 
  
  self.effect = {};
  for i = 1, 3 do
    self.effect[i] = reader:ReadUInt16();--玩家狀態
  end

  for i = lastIdx, self.id do
    eternalDungeonLayerGroup[i] = lastIdx;
  end
  lastIdx = self.id;
  eternalDungeonLayerGroup[lastIdx] = lastIdx;

  return self.id, self;
end

function EternalDungeonLayerData.Script1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function EternalDungeonLayerData.GetIdx(idx)
  if eternalDungeonLayerGroup[idx] ~= nil then
    return eternalDungeonLayerGroup[idx];
  else
    return eternalDungeonLayerGroup[lastIdx];
  end;
end

function EternalDungeonLayerData.Script2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function EternalDungeonLayerData.Script3()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function EternalDungeonLayerData.Script4()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function EternalDungeonLayerData.GetEffect(idx)
    local data = this.GetIdx(idx);
    return eternalDungeonLayerDatas[data].effect;
end

function EternalDungeonLayerData.Script5()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function EternalDungeonLayerData.Script6()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function EternalDungeonLayerData.Script7()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end
