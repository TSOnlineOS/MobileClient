TextureSizeData ={}
TextureSizeData.__index = TextureSizeData

function TextureSizeData.Random()
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

function TextureSizeData.Random1()
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

function TextureSizeData.Random2()
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

function TextureSizeData.New(reader)
  local self = {};
  setmetatable(self, TextureSizeData);

  local length = reader:ReadByte();
  reader:Seek(reader.position - 1);
  self.textureName = reader:ReadString(length, false);
  self.width = reader:ReadInt32();
  self.height = reader:ReadInt32();
  
  return self.textureName, self;
end

function TextureSizeData.Random3()
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