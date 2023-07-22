FightData = {}
FightData.__index = FightData

function FightData.AddThree(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function FightData.New(reader) 
  local self = {};
  setmetatable(self, FightData);
  
  self.EveNo = reader:ReadUInt16();
  self.FightType = reader:ReadByte();
  self.BKMusic = reader:ReadByte();
  self.LinkToResult = reader:ReadByte();

  self.LeftEnemyArrayNum = reader:ReadUInt16();
  self.LeftEnemyAy = {};
  for i = 1, self.LeftEnemyArrayNum do
	  self.LeftEnemyAy[i] = self:ReadEnemy(reader);
  end

  self.RightEnemyArrayNum = reader:ReadUInt16();
  self.RightEnemyAy = {};
  for i = 1, self.RightEnemyArrayNum do
	  self.RightEnemyAy[i] = self:ReadEnemy(reader);
  end	

  self.FightEventArrayNum = reader:ReadUInt16();
  self.FightEventAy = {};
  for i = 1, self.FightEventArrayNum do
	  self.FightEventAy[i] = self:ReadFightEvent(reader);
  end
  self.FightLimit = reader:ReadUInt32();  
  return self;
end

function FightData.AddThree1(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function FightData.AddThree2(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function FightData:ReadEnemy(reader)
  local enemy = {};

  enemy.NO = reader:ReadUInt16();
  enemy.NPCID = reader:ReadUInt16();
  enemy.LocationPos = reader:ReadByte();
  enemy.AI = reader:ReadByte();

  return enemy;
end

function FightData.AddThree3(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function FightData:ReadFightEvent(reader)
  local fightEvent = {};

  fightEvent.EventNo = reader:ReadUInt16();
  fightEvent.EventName = {};
  for i = 1, 9 do
    fightEvent.EventName[i] = reader:ReadByte();
  end            

  fightEvent.WinConditionArrayNum = reader:ReadByte();
  fightEvent.WinConditionAy = {};
  for i = 1, fightEvent.WinConditionArrayNum do
	  fightEvent.WinConditionAy[i] = {};

    fightEvent.WinConditionAy[i].logic = {};
    fightEvent.WinConditionAy[i].logic.ConditionNo = reader:ReadByte();
    fightEvent.WinConditionAy[i].logic.ConditionClass = reader:ReadByte();
    fightEvent.WinConditionAy[i].logic.Parameter = reader:ReadUInt16();
    fightEvent.WinConditionAy[i].logic.ParameterStyle = reader:ReadByte();
    fightEvent.WinConditionAy[i].logic.ConditionValue = reader:ReadInt32();
    fightEvent.WinConditionAy[i].logic.AndNum = reader:ReadByte();

    fightEvent.WinConditionAy[i].LeaderNo = reader:ReadUInt16();
    fightEvent.WinConditionAy[i].WinConditionOps = reader:ReadByte();
  end

  return fightEvent;
end

function FightData.AddThree4(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function FightData.AddThree5(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end