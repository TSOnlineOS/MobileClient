ENavigationEvent = {
  None = 0,
  Npc = 1,
  Door = 2,
}

MarkData ={}
MarkData.__index = MarkData

function MarkData.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function MarkData.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function MarkData.New()
  local self = {};
  setmetatable(self, MarkData);

  self.name = "";
  self.kind = 0;
  self.bitId = 0;
  self.gainWay = 0;
  self.description = "";
  self.steps = nil;
  
  return self;
end

function MarkData.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function MarkData.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function MarkData.ReadInfo(reader)
  local data = MarkData.New();

  data.name = LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16())); --[1] 任務名稱 Length = 254
  data.kind = reader:ReadByte(); --[2] 類別 (0:無，1:主線，2:支線 3:指引 4:單人副本 5:多人副本 6:其他 7:每日清類型) 8:日清但不秀在任務天書

  local id = reader:ReadUInt16(); --[3] 編號

  data.bitId = reader:ReadUInt16(); --[4] 已完成任務編號
  data.gainWay = reader:ReadByte(); --[5] 獲取方式 (0: 事件觸發者 1:觸發者及所有隊員)
  data.description = LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16())); --[6] 說明 Length = 254

  if Define.TextCount then
    DataManager.textCount = DataManager.textCount + string.Count(data.name) + string.Count(data.description);
  end

  return id, data;
end

function MarkData.Trash4()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function MarkData.Trash5()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function MarkData.Trash6()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function MarkData.Trash7()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function MarkData.ReadStep(reader)
  local data = {};

  local id = reader:ReadUInt16(); --標記編號
  local step = reader:ReadByte(); --標記步驟

  data.description = LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16())); --步驟說明

  data.conditions = {}; --步驟條件
  for i = 1, 5 do
    data.conditions[i] = {};
    data.conditions[i].kind = reader:ReadByte(); --需求形式 0:無 1:捕捉npc 2:擊殺npc 3:收集道具
    data.conditions[i].id = reader:ReadUInt16(); --需求編號
    data.conditions[i].count = reader:ReadByte(); --需求數量
    data.conditions[i].sceneId = reader:ReadUInt16();
    data.conditions[i].areaId = 0;
    data.conditions[i].position = Vector2.New(reader:ReadUInt16(), reader:ReadUInt16());
    data.conditions[i].eventKind = reader:ReadByte();
    data.conditions[i].eventId = reader:ReadByte();
  end

  data.endGuide = LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16())); --完成指引
  data.endSceneId = reader:ReadUInt16(); --完成場景
  data.endAreaId = 0;
  data.endPosition = Vector2.New(reader:ReadUInt16(), reader:ReadUInt16()); --完成位置
  data.endEventKind = reader:ReadByte();
  data.endEventId = reader:ReadByte();

  data.teleport = reader:ReadByte(); --可否傳送
  data.checkTeam = reader:ReadBoolean(); --檢查組隊

  if Define.TextCount then
    DataManager.textCount = DataManager.textCount + string.Count(data.description);
  end

  return id, step, data;
end

function MarkData.Trash8()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function MarkData.Trash9()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function MarkData.Trash10()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end