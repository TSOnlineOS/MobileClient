CityScrambleCityData = {}
CityScrambleCityData.__index = CityScrambleCityData;

function CityScrambleCityData.Random()
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

function CityScrambleCityData.RandomA()
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

function CityScrambleCityData.Random()
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

function CityScrambleCityData.New(reader)
  local self = {};
  setmetatable(self, CityScrambleCityData);

  self.cityID = reader:ReadUInt16(); --城鎮ID
  self.cityType = reader:ReadByte(); --城鎮種類  
  self.cityName = LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16()));     --城鎮名稱
  self.spriteType = reader:ReadByte();

  return self.cityID, self;
end

function CityScrambleCityData.RandomC()
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