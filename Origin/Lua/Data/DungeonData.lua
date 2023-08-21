DungeonData = {}
DungeonData.__index = DungeonData;

function DungeonData.Random()
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

function DungeonData.New(reader)
  local self = {};
  setmetatable(self, DungeonData);
  
  self.id = reader:ReadUInt16(); 
  self.name = reader:ReadUInt32();
  self.kind = reader:ReadByte();
  self.minLv = reader:ReadUInt16();
  self.maxLv = reader:ReadUInt16();
  self.maxPlayer = reader:ReadByte();
  self.missionFlag = reader:ReadUInt16();
  self.dayilyFlag = reader:ReadUInt16();
  self.dayilyCount = reader:ReadUInt16();
  self.skipFlag = reader:ReadUInt16();
  self.time = reader:ReadUInt16();
  self.sceneId = reader:ReadUInt16();
  self.costPoint = reader:ReadUInt16();
  self.lootTable = reader:ReadUInt16();
  self.extraLoot = reader:ReadUInt16();
  self.infoText = reader:ReadUInt32();

  self.needPar = {};
  for i = 0, 1 do
    self.needPar[i] = {}
    self.needPar[i].kind = reader:ReadByte(); --條件種類
    self.needPar[i].parameter = reader:ReadUInt16(); --條件摻數
  end
  self.allPassPrize = reader:ReadUInt16(); --全通獎
  
  return self;
end

function DungeonData.Randoms()
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

function DungeonData.Randoma()
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

DungeonComboData = {}
DungeonComboData.__index = DungeonComboData;

function DungeonComboData.Random()
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

function DungeonComboData.New(reader)
  local self = {};
  setmetatable(self, DungeonComboData);
  self.id = reader:ReadUInt16(); 
  self.kind = reader:ReadByte();
  self.kindValue = reader:ReadUInt32();
  self.items = {};
  for i = 0, 3 do 
    self.items[i] = {};
    self.items[i].itemId = reader:ReadUInt16(); 
    self.items[i].itemValue = reader:ReadUInt32(); 
  end  

  return self;
end

function DungeonComboData.Random1()
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

function DungeonComboData.Random2()
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

function DungeonComboData.Random3()
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

function DungeonComboData:GetReward()
  local turn = Role.player:GetAttribute(EAttribute.Turn);
  while turn > 0 do 
    if self.items[turn].itemId ~= 0 then 
      return self.items[turn];
    end
    turn = turn -1;    
  end
  return self.items[0];
end

function DungeonComboData.Random4()
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

function DungeonComboData.Random5()
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

DungeonAreaData = {}
DungeonAreaData.__index = DungeonAreaData;

function DungeonAreaData.New(reader)
  local self = {};
  setmetatable(self, DungeonAreaData);

  local id = reader:ReadByte(); 
  self.areaWidth = reader:ReadUInt16(); 
  self.areaHeight = reader:ReadUInt16(); 
  self.centerLeft = reader:ReadUInt16(); 
  self.centerTop = reader:ReadUInt16();

  return id, self;
end

function DungeonAreaData.Random()
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

function DungeonAreaData.RandomC()
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

function DungeonAreaData.RandomB()
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

function DungeonAreaData.RandomA()
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