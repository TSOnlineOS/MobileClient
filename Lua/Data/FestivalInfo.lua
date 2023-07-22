FestivalInfo = {}
FestivalInfo.__index = FestivalInfo;

local this = FestivalInfo;

local length = 0;

function FestivalInfo.TrashB()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function FestivalInfo.TrashD()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function FestivalInfo.TrashE()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function FestivalInfo.TrashF()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function FestivalInfo.New(reader)
  local self = {};
  setmetatable(self, FestivalInfo);
  
  self.Id = reader:ReadByte();--項目編號
  self.functionkind = reader:ReadByte();--活動類別
  self.kind = reader:ReadByte();--類別編號				
  self.activityId = reader:ReadByte();--活動ID
  self.title = reader:ReadUInt32();--標題字串
  self.description = reader:ReadUInt32();--說明
  self.awardDescription = reader:ReadUInt32();--獲得物說明
  self.picture = reader:ReadUInt16();--圖片編號
  self.rolePicture = reader:ReadUInt16();--角色圖號
  self.roleW = reader:ReadUInt16();
  self.roleH = reader:ReadUInt16();
  self.roleX = reader:ReadInt16();
  self.roleY = reader:ReadInt16();
  self.topR = reader:ReadByte();
  self.topG = reader:ReadByte();
  self.topB = reader:ReadByte();
  self.bottomR = reader:ReadByte();
  self.bottomG = reader:ReadByte();
  self.bottomB = reader:ReadByte();

  return self;
end

function FestivalInfo.TrashG()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function FestivalInfo.TrashH()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end