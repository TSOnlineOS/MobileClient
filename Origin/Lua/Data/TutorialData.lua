TutorialData = {}
TutorialData.__index = TutorialData;

function TutorialData.New(reader)
  local self = {};
  setmetatable(self, TutorialData);

  local id = reader:ReadByte();

  self.mainKind = reader:ReadByte();
  self.subKind = reader:ReadByte();

  self.name = reader:ReadUInt32();
  self.content = reader:ReadUInt32();

  self.guideId = reader:ReadByte();
  self.flagId = reader:ReadUInt16();

  return id, self;
end

function TutorialData.AddThree(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function TutorialData.AddThree1(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

GuideData = {}
GuideData.__index = GuideData;

function GuideData.AddThree1(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function GuideData.New(reader)
  local self = {};
  setmetatable(self, GuideData);

  local id = reader:ReadByte();
  local step = reader:ReadByte();

  self.title = reader:ReadUInt32();
  self.picId = reader:ReadUInt16();

  self.focus = {};
  self.focus.description = LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16()));
  self.focus.style = reader:ReadByte();
  self.focus.sizeOffset = reader:ReadInt16();
  self.focus.anchoredTag = LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16()));
  self.focus.anchoredRoot = LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16()));
  self.focus.anchoredObject = LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16()));
  self.focus.anchoredParam = reader:ReadUInt32();

  self.markFlagId = reader:ReadUInt16();
  self.bitFlagId = reader:ReadUInt16();

  self.closeUI = reader:ReadBoolean();
  
  return id, step, self;
end

function GuideData.AddThree2(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function GuideData.AddThre1(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end