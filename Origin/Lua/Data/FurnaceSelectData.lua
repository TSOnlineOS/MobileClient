FurnaceSelectData = {};
FurnaceSelectData.__index = FurnaceSelectData;

function FurnaceSelectData.New(reader)
  local self = {};
  setmetatable(self, FurnaceSelectData);

  self.Id = reader:ReadUInt16();
  self.kind = reader:ReadByte();
  self.sample = reader:ReadUInt16();

  self.awardKind = {};
  self.awardPro = {};

  for i = 1, 6 do
    self.awardKind[i] = reader:ReadByte();
    self.awardPro[i] = self.awardKind[i];
  end

  return self;
end

function FurnaceSelectData.Demo()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function FurnaceSelectData.DemoA()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function FurnaceSelectData.DemoB()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function FurnaceSelectData.DemoC()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function FurnaceSelectData.DemoD()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end