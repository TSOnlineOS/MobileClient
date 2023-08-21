DoorData = {}
DoorData.__index = DoorData

function DoorData.GuessNumberD(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function DoorData.GuessNumber1(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function DoorData.GuessNumber2(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function DoorData.New(reader) 
  local self = {};
  setmetatable(self, DoorData);
  
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

  self.imgInfo = {};
  self.imgInfo.imageKind = reader:ReadByte();
  self.imgInfo.position = Vector2.New(reader:ReadUInt16(), reader:ReadUInt16());
  
  self.close = reader:ReadBoolean();      

  if self.gridX < 0 then
    self.gridX = 0;
  end

  if self.gridY < 0 then
    self.gridY = 0;
  end

  return self;
end

function DoorData.GuessNumber3(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end