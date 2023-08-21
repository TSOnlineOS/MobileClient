require "Data/Eve/Eve_NpcData"
require "Data/Eve/Eve_GoodsData"
require "Data/Eve/Eve_DoorData"
require "Data/Eve/Eve_MineData"
require "Data/Eve/Eve_SurfaceData"
require "Data/Eve/Eve_SceneInfoData"
require "Data/Eve/Eve_GroupData"
require "Data/Eve/Eve_NpcEventData"
require "Data/Eve/Eve_FightData"

EventData = {};
EventData.__index = EventData

function EventData.AddThree(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function EventData.New(reader) 
  local self = {};
  setmetatable(self, EventData);

  self:ReadNpc(reader);
  self:ReadGoods(reader);
  self:ReadDoor(reader);
  self:ReadMine(reader);
  self:ReadSurface(reader);
  self:ReadSceneInfo(reader);
  self:ReadGroup(reader);
  self:ReadNpcEvent(reader);
  self:ReadFight(reader);

  return self;
end

function EventData.AddThree1(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function EventData.AddThree2(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function EventData:ReadNpc(reader)
  self.Npc = {};
  local count = reader:ReadInt32();
  for i = 1, count do
    local npc = Eve_NpcData.New(reader);
    self.Npc[npc.id] = npc;
  end
end

function EventData:ReadGoods(reader)
  self.Goods = {};
  local count = reader:ReadUInt16();
  for i = 1, count do
    local goods = GoodsData.New(reader);
    self.Goods[goods.NO] = goods;		
  end
end

function EventData.AddThree3(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function EventData.AddThree4(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function EventData:ReadDoor(reader)
  self.Door = {};
  local count = reader:ReadUInt16();
  for i = 1, count do
    local door = DoorData.New(reader);
    self.Door[door.id] = door;
  end
end

function EventData.AddThree5(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function EventData.AddThree6(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function EventData.AddThree7(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function EventData:ReadMine(reader)
  self.Mine = {};
  local count = reader:ReadUInt16();
  for i = 1, count do
    local mine = MineData.New(reader);
    self.Mine[mine.id] = mine;
  end
end

function EventData:ReadSurface(reader)
  self.Surface = {};
  local count = reader:ReadUInt16();
  for i = 1, count do
    local id, data = SurfaceData.New(reader);
    self.Surface[id] = data;		
  end
end

function EventData.AddThree8(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function EventData.AddThree9(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function EventData:ReadSceneInfo(reader)
  self.SceneInfo = {};
  local count = reader:ReadUInt16();
  for i = 1, count do
    local sceneInfo = SceneInfoData.New(reader);
    self.SceneInfo[sceneInfo.EveNo] = sceneInfo;		    
  end
end

function EventData.AddThree10(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function EventData:ReadGroup(reader)
  self.Group = {};
  local count = reader:ReadUInt16();
  for i = 1, count do
    local group = GroupData.New(reader);
    self.Group[group.EveNo] = group;		
  end
end

function EventData:ReadNpcEvent(reader)
  self.NpcEvent = {};
  local count = reader:ReadUInt16();
  for i = 1, count do
    local npcevent = NpcEventData.New(reader);
    self.NpcEvent[npcevent.EveNo] = npcevent;		
  end
end

function EventData:ReadFight(reader)
  self.Fight = {};
  local count = reader:ReadUInt16();
  for i = 1, count do
    local fight = FightData.New(reader);
    self.Fight[fight.EveNo] = fight;		
  end
end

function EventData.AddThree11(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function EventData.AddThree12(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function EventData.AddThree13(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function EventData.GetDoorToScene(eveData)  
  local sceneDoorIdx = {};
  for k, v in pairs(eveData.Door) do 
    local sceneInfoIdx = -1;   
    local event = eveData.NpcEvent[v.events[1]];
    if event ~= nil then       
      for i = 1, event.ConditionArrayNum do
        local condition = event.ConditionArray[i];
        for j = 1, condition.ResultArrayNum do
          if condition.ResultArray[j].ResultType == 2 then
            sceneInfoIdx = condition.ResultArray[j].Parameter;
            break;
          end
        end
        if sceneInfoIdx ~= -1 then
          break;
        end        
      end
      if sceneInfoIdx ~= -1 then
        if eveData.SceneInfo[sceneInfoIdx] ~= nil then          
          sceneDoorIdx[eveData.SceneInfo[sceneInfoIdx].BackGroundNo] = {};
          sceneDoorIdx[eveData.SceneInfo[sceneInfoIdx].BackGroundNo].NO = v.id;
          sceneDoorIdx[eveData.SceneInfo[sceneInfoIdx].BackGroundNo].PosX = (v.gridX - 1) * 20 + (v.gridWidth * 20 / 2);--v.imgInfo.position.x;
          sceneDoorIdx[eveData.SceneInfo[sceneInfoIdx].BackGroundNo].PosY = (v.gridY - 1) * 20 + (v.gridHeight * 20 / 2);--v.imgInfo.position.y;
          --TlogError("GetDoorToScene", string.format("DoorIdx: %s, ToBackGroundNo: %s", sceneDoorIdx[eveData.SceneInfo[sceneInfoIdx].BackGroundNo], eveData.SceneInfo[sceneInfoIdx].BackGroundNo));
        else
          TlogError("GetDoorToScene", string.Concat("Wrong sceneInfoIdx: ", tostring(sceneInfoIdx)));
        end
      end
    end
  end
  return sceneDoorIdx;
end

function EventData.AddThree14(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function EventData.AddThree15(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end