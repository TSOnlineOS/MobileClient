TextureOffsetData ={}
TextureOffsetData.__index = TextureOffsetData

function TextureOffsetData.Script1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function TextureOffsetData.New(reader)
  local self = {};
  setmetatable(self, TextureOffsetData);

  local length = reader:ReadByte();
  reader:Seek(reader.position - 1);
  self.textureName = reader:ReadString(length, false);
  self.offsetNum = reader:ReadInt32();
  self.offsets = {};
  for i = 1, self.offsetNum do
    self.offsets[i] = {};
    self.offsets[i].serial = reader:ReadInt32();
    self.offsets[i].x = reader:ReadInt32();
    self.offsets[i].y = reader:ReadInt32();
  end
  
  return self.textureName, self;
end

function TextureOffsetData.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function TextureOffsetData.Script2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end
