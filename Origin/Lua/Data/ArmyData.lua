
ArmyArchitectureData = {}
ArmyArchitectureData.__index = ArmyArchitectureData;

function ArmyArchitectureData.New(reader)
  local self = {};
  setmetatable(self, ArmyArchitectureData);
  
  local lv = reader:ReadByte();

  self.buildings = {};
  
  --本部
  self.buildings[1] = {};
  self.buildings[1].picId = reader:ReadUInt32();
  self.buildings[1].upExp = reader:ReadUInt32();
  self.buildings[1].maxMember = reader:ReadByte();
  
  --天工
  self.buildings[2] = {};
  self.buildings[2].picId = reader:ReadUInt32();
  self.buildings[2].upExp = reader:ReadUInt32();
  self.buildings[2].buildExp = reader:ReadByte();
  --self.buildings[2].buildSpeed = reader:ReadUInt16() * 0.0001;
  --self.buildings[2].armyAdd = reader:ReadUInt16() * 0.0001;
  --self.buildings[2].weaponAdd = reader:ReadUInt16() * 0.0001;
  self.buildings[2].dispatchSpeed = reader:ReadUInt16() * 0.0001;

  --鏢騎
  self.buildings[3] = {};
  self.buildings[3].picId = reader:ReadUInt32();
  self.buildings[3].upExp = reader:ReadUInt32();
  self.buildings[3].buildExp = reader:ReadByte();
  self.buildings[3].bossLv = reader:ReadByte();
  self.buildings[3].storeLv = reader:ReadByte();
  --self.buildings[3].attributes = {};
  --self.buildings[3].attributes[1] = { kind = reader:ReadByte(), value = reader:ReadByte() }
  --self.buildings[3].attributes[2] = { kind = reader:ReadByte(), value = reader:ReadByte() }

  --郎中
  self.buildings[4] = {};
  self.buildings[4].picId = reader:ReadUInt32();
  self.buildings[4].upExp = reader:ReadUInt32();
  self.buildings[4].buildExp = reader:ReadByte();
  self.buildings[4].attributes = {};
  self.buildings[4].attributes[1] = { kind = reader:ReadByte(), value = reader:ReadByte() }
  self.buildings[4].attributes[2] = { kind = reader:ReadByte(), value = reader:ReadByte() }

  --御史
  self.buildings[5] = {};
  self.buildings[5].picId = reader:ReadUInt32();
  self.buildings[5].upExp = reader:ReadUInt32();
  self.buildings[5].buildExp = reader:ReadByte();
  self.buildings[5].attributes = {};
  self.buildings[5].attributes[1] = { kind = reader:ReadByte(), value = reader:ReadByte() }
  self.buildings[5].attributes[2] = { kind = reader:ReadByte(), value = reader:ReadByte() }

  return lv, self;
end

function ArmyArchitectureData.Demo()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

ArmySignData = {}
ArmySignData.__index = ArmySignData;

function ArmySignData.New(reader)
  local self = {};
  setmetatable(self, ArmySignData);

  local lv = reader:ReadByte();

  self.title = reader:ReadUInt32();
  self.requireArmyLv = reader:ReadByte();
  self.requireScore = reader:ReadUInt32();
  self.requireLv = reader:ReadByte();

  self.awards = {};
  for i = 1, 5 do
    self.awards[i] = {};
    self.awards[i].itemId = reader:ReadUInt16();
    self.awards[i].count = reader:ReadUInt32();
  end

  return lv, self;
end

function ArmySignData.Demo()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

ArmyAwardData = {}
ArmyAwardData.__index = ArmyAwardData;

function ArmyAwardData.New(reader)
  local self = {};
  setmetatable(self, ArmyAwardData);

  self.requireScore = reader:ReadUInt16();
  self.awardItemId = reader:ReadUInt16();

  return self;
end

function ArmyAwardData.Demo()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

OrgBossAwardData = {}
OrgBossAwardData.__index = OrgBossAwardData;

function OrgBossAwardData.New(reader)
  local self = {};
  setmetatable(self, OrgBossAwardData);

  self.itemId = reader:ReadUInt16();
  self.count = reader:ReadByte();

  return self;
end

function OrgBossAwardData.Demo()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

ArmyProductionData = {}
ArmyProductionData.__index = ArmyProductionData;

function ArmyProductionData.New(reader)
  local self = {};
  setmetatable(self, ArmyProductionData);

  local kind = reader:ReadByte();
  local unit = reader:ReadByte();

  self.npcId = reader:ReadUInt16();
  self.requires = {};
  for i = 1, 6 do
    self.requires[i] = reader:ReadUInt16();
  end

  return kind, unit, self;
end

function ArmyProductionData.Demo()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end