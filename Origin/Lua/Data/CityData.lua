
CitySceneInfo = {}
CitySceneInfo.__index = CitySceneInfo;

function CitySceneInfo.New()
  local self = {};
  setmetatable(self, CitySceneInfo);
  
  self.sceneId = 0;
  self.position = Vector2.zero;

  return self;
end

function CitySceneInfo.Random()
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

CityNpcInfo = {}
CityNpcInfo.__index = CityNpcInfo;

function CityNpcInfo.Random()
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

function CityNpcInfo.Random1()
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

function CityNpcInfo.New()
  local self = {};
  setmetatable(self, CityNpcInfo);
  
  self.npcId = 0;
  self.position = Vector2.zero;

  return self;
end

CityData = {}
CityData.__index = CityData;

function CityData.Random()
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

function CityData.Random1()
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

function CityData.New()
  local self = {};
  setmetatable(self, CityData);

  --Server
  self.level = 0;
  self.isOnWar = false;
  self.chief = 0;
  self.subChief = { 0, 0, 0 }
  self.allyChief = 0;
  self.allySubChief = { 0, 0, 0 }
  self.orgId = 0;
  self.allyId = 0;
  self.stationLv = { 0, 0, 0, 0, 0, 0 };

  --Client
  self.name = "";
  self.doorIdx = 0; --在大地圖中,是第幾個進出點
  self.big = 0; --在大地圖
  self.base = 0; --在根據地
  self.fight = CitySceneInfo.New(); --在戰場
  self.bank = 0; --錢莊
  self.inn = 0;  --客棧
  self.pharmacy = 0;    --藥店
  self.iron = 0; --鐵店
  self.npcId = 0; --在大地圖編號(NpcID)

  self.streets = {}; --在街道
  for i = 1, 3 do
    self.streets[i] = 0;
  end

  self.toStreets = {}; --由錢莊或打鐵鋪出來,依等級,所要對映的x,y
  for i = 1, 3 do
    self.toStreets[i] = {};
    for j = ECityScene.Bank, ECityScene.Iron do
      self.toStreets[i][j] = Vector2.zero;
    end
  end

  self.fromFight = Vector2.zero; --由戰場到街道
  self.fromBase = Vector2.zero; --由根據地到街道

  self.tents = {} --攻守方的營帳
  for i = ECamp.Defend, ECamp.Attack do
     self.tents[i] = CitySceneInfo.New();
  end

  self.cityWall = CitySceneInfo.New(); --城牆的座標
  self.cityGate = CityNpcInfo.New(); --城門的座標
  self.woodGate = CityNpcInfo.New(); --木門的座標
  self.defGarNpcs = {}; --新城所預設的GarNpc
  for i = 1, 16 do
    self.defGarNpcs[i] = CityNpcInfo.New();
  end

  return self;
end

function CityData.Random2()
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

function CityData.Random3()
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