SceneInfoData = {}
SceneInfoData.__index = SceneInfoData

function SceneInfoData.Script1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function SceneInfoData.Script2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function SceneInfoData.New(reader) 
  local self = {};
  setmetatable(self, SceneInfoData);
  
  self.EveNo = reader:ReadUInt16();
  self.BackGroundNo = reader:ReadUInt16();
  self.EveFileName = reader:ReadUInt16();
  self.PlayerAppearX = reader:ReadInt32();
  self.PlayerAppearY = reader:ReadInt32();
  self.Direction = reader:ReadByte();
  self.AreaName = {};
  for i = 1, 21 do
   self.AreaName[i] = reader:ReadByte();
  end	
  self.LinkCount = reader:ReadUInt16();
  self.SceneEffect = reader:ReadByte();

  return self;
end

function SceneInfoData.Script3()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function SceneInfoData.Script4()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end
