MapData = {}
MapData.__index = MapData

function MapData.New(reader)
  local self = {};
  setmetatable(self, MapData);

  self.width = reader:ReadUInt32();
  self.height = reader:ReadUInt32();

  self.mapPicCount= reader:ReadByte();
  self.mapPics = {};
  for i = 1, self.mapPicCount do
    self.mapPics[i] = {};
    self.mapPics[i].picId = reader:ReadUInt16();
    self.mapPics[i].position = Vector2.New(reader:ReadUInt16(), reader:ReadUInt16());
  end

  self.blockWidth = reader:ReadUInt16();
  self.blockHeight = reader:ReadUInt16();

  self.blocks = {};
  for i = 1, self.blockWidth do
    self.blocks[i] = {};
    for j = 1, self.blockHeight do
      self.blocks[i][j] = reader:ReadByte();
    end
  end

  self.waveCount = reader:ReadUInt16();
  self.waves = {};
  for i = 1, self.waveCount do
    self.waves[i] = {};
    self.waves[i].blockX = reader:ReadUInt16();
    self.waves[i].blockY = reader:ReadUInt16();
    self.waves[i].soundId = reader:ReadByte();
    self.waves[i].dist = reader:ReadByte();
  end

  self.elementCount = reader:ReadUInt16();
  self.elements = {};
  for i = 1, self.elementCount do
    self.elements[i] = {};
    self.elements[i].picId = reader:ReadUInt32();
    self.elements[i].position = Vector2.New(reader:ReadUInt16(), reader:ReadUInt16());
  end

  self.npcCount = reader:ReadByte();

  self.geolBaseAtt = reader:ReadByte();

  self.geolCount = reader:ReadByte();   
  self.geols = {};
  for i = 1, self.geolCount do
    self.geols[i] = {};
    self.geols[i].attr = reader:ReadByte();
    self.geols[i].left = reader:ReadUInt16();
    self.geols[i].top = reader:ReadUInt16();
    self.geols[i].right = reader:ReadUInt16();
    self.geols[i].bottom = reader:ReadUInt16();
  end
  
  self.placeName = reader:ReadString(9, false);
 
  self.gm_MapX = reader:ReadInt32();
  self.gm_MapY = reader:ReadInt32();

  self.color = LuaHelper.GetColor(reader:ReadByte(), reader:ReadByte(), reader:ReadByte(), 255);

  return self;
end

function MapData.Random()
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

function MapData.RandomA()
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

function MapData.RandomB()
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

function MapData.RandomC()
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

function MapData.RandomD()
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