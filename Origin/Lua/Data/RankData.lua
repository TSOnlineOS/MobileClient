RankData = {}
RankData.__index = RankData;

function RankData.New(reader)
  local self = {};
  setmetatable(self, RankData);

  self.name = reader:ReadString(20); --官職名稱
  self.honor = reader:ReadUInt16(); --所需官勳

  self.attributes = {}; --官職效果
  for i = 1, 4 do
    self.attributes[i] = {};
    self.attributes[i].kind = reader:ReadByte();
    self.attributes[i].value = reader:ReadInt32();
  end

  return self;
end

function RankData.Script1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function RankData.GetAttribute(honor, kind)
  local rank = 0;
  for k, v in pairs(rankDatas) do
    if v.honor <= honor then
      rank = k;
    else
      break;
    end
  end
  
  if rankDatas[rank] ~= nil then
    for k, v in pairs(rankDatas[rank].attributes) do
      if v.kind == kind then
        return v.value;
      end
    end
  end

  return 0;
end

function RankData.Script2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function RankData.Script3()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function RankData.Script4()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end