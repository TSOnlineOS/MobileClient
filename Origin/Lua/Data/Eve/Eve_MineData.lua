MineData = {}
MineData.__index = MineData

function MineData.Demo()
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

function MineData.New(reader) 
  local self = {};
  setmetatable(self, MineData);
  
  self.id = reader:ReadUInt16();

  self.eventCount = reader:ReadUInt16();
  self.events = {};	
  for i = 1, self.eventCount do
	  self.events[i] = reader:ReadByte();		
  end

  self.gridX = reader:ReadInt32();
  self.gridY = reader:ReadInt32();
  self.gridWidth = reader:ReadInt32();
  self.gridHeight = reader:ReadInt32();

  self.sizeKind = reader:ReadByte();

  return self;
end

function MineData.Demo1()
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

function MineData.Demo2()
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