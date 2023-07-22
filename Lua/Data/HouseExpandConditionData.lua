HouseExpandConditionData = {}
HouseExpandConditionData.__index = HouseExpandConditionData;

function HouseExpandConditionData.Random()
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

function HouseExpandConditionData.RandomA()
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

function HouseExpandConditionData.RandomB()
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

function HouseExpandConditionData.New(reader)
  local self = {};
  setmetatable(self, HouseExpandConditionData);

  self.totalLevel = reader:ReadByte(); --[1]總等級
  self.building = reader:ReadByte(); --[2]第幾棟
  self.floorLevel = reader:ReadByte(); --[3]樓層等級 0=第一層未擴建 1=第一層已擴建 2=第二層
  self.amountOfFurnitureKind = reader:ReadByte(); --[4]家具類型數量
  self.spend = reader:ReadByte(); --[5]花費金額(幾萬)

  return self
end

function HouseExpandConditionData.RandomC()
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

function HouseExpandConditionData.RandomD()
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

function HouseExpandConditionData.GetBuildingAndFloorLevel(level)
  for k, v in pairs(houseExpandConditionDatas) do
    if v.totalLevel == level then
      return v.building, v.floorLevel
    end
  end
end

function HouseExpandConditionData.RandomE()
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

function HouseExpandConditionData.RandomF()
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

function HouseExpandConditionData.RandomG()
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