PlayerInfo = {}
PlayerInfo.__index = PlayerInfo;

function PlayerInfo.GetLShift(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end

function PlayerInfo.GetLShift1(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end

function PlayerInfo.GetLShift2(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end

function PlayerInfo.New(roleId, data, readOrgData, readFriendData)
  local self = {};
  setmetatable(self, PlayerInfo);

  --基本資料
  self.roleId = roleId;
  self.name = data:ReadString(data:ReadByte());
  self.level = data:ReadByte();
  self.element = data:ReadByte();
  self.turn3Info = {};
  self.turn3Info.element = data:ReadByte();
  self.turn = data:ReadByte();
  self.career = data:ReadByte();

  if self.turn >= 3 then
    self.level = self.level + Role.playerMaxLv;
  end

  --頭像資料
  self.sex = data:ReadByte();
  self.headStyle = data:ReadByte();

  self.colorTints = {};
  self.colorTints[1] = data:ReadInt32();
  self.colorTints[2] = data:ReadInt32();

  --軍團資料 +是否在線(1) +累積活躍值(4) +週活躍值(4) +標記(5) +BOSS傷害量(4)
  if readOrgData then
    self.online = data:ReadBoolean();
    self.score = data:ReadInt32();
    self.weekScore = data:ReadInt32();
    self.dutyFlags = {};
    for j = 1, 5 do
      self.dutyFlags[j] = data:ReadByte();
    end
    self.bossDamage = data:ReadUInt32();
  end

  --好友資料 +是否在線(1) +信任度(2) +功能標記(1) +結交時間(8) +離線時間(8)
  if readFriendData then
    self.online = data:ReadBoolean();
    self.friendly = data:ReadUInt16();
    self.friendFlag = data:ReadByte();
    self.friendAddTime = System.DateTime.FromOADate(data:ReadDouble());
    self.friendOfflineTime = System.DateTime.FromOADate(data:ReadDouble());
  end

  self.incomingMsg = false;
  self.face = 0;

  return self;
end

function PlayerInfo.GetLShift3(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end

function PlayerInfo:GetColorTint(colorPart)
  local r = 4;
  local g = 4;
  local b = 4;

  if colorPart == EColorPart.Helm then
    r = (self.colorTints[1] / 100000000) % 10;
    g = (self.colorTints[1] / 10000000) % 10;
    b = (self.colorTints[1] / 1000000) % 10;
  elseif colorPart == EColorPart.Hair then
    r = (self.colorTints[1] / 100000) % 10;
    g = (self.colorTints[1] / 10000) % 10;
    b = (self.colorTints[1] / 1000) % 10;
  elseif colorPart == EColorPart.Skin then
    r = (self.colorTints[1] / 100) % 10;
    g = (self.colorTints[1] / 10) % 10;
    b = (self.colorTints[1] / 1) % 10;
  elseif colorPart == EColorPart.Clothes then
    r = (self.colorTints[2] / 100000000) % 10;
    g = (self.colorTints[2] / 10000000) % 10;
    b = (self.colorTints[2] / 1000000) % 10;
  elseif colorPart == EColorPart.Orna1 then
    r = (self.colorTints[2] / 100000) % 10;
    g = (self.colorTints[2] / 10000) % 10;
    b = (self.colorTints[2] / 1000) % 10;
  elseif colorPart == EColorPart.Boots then
    r = (self.colorTints[2] / 100) % 10;
    g = (self.colorTints[2] / 10) % 10;
    b = (self.colorTints[2] / 1) % 10;
  end

  return r, g, b;
end

function PlayerInfo.GetLShift4(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end

function PlayerInfo.GetLShift5(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end