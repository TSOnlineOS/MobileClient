LoginAwardTagData = {};
LoginAwardTagData.__index = LoginAwardTagData;

function LoginAwardTagData.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function LoginAwardTagData.Script1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function LoginAwardTagData.Script2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function LoginAwardTagData.New(reader)
  local self = {};
  setmetatable(self, LoginAwardTagData);

  self.kind = reader:ReadByte(); --
  self.tag = reader:ReadByte(); --分頁編號
  self.tagString = reader:ReadUInt32();
  self.sort = reader:ReadByte(); --排序及顯示
  self.activityTime = reader:ReadUInt16(); --活動時間
  self.titleString = reader:ReadUInt32();
  self.contentString = reader:ReadUInt32();
  self.subTagString = LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16())); --子頁籤字串
  self.actSort = 0;

  return self;
end

function LoginAwardTagData.Script3()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function LoginAwardTagData.Script4()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function LoginAwardTagData.Add(kind, tag, tagString, sort, activityTime, actSort, title, isStop)
  local self = {};
  setmetatable(self, LoginAwardTagData);

  self.kind = kind; --
  self.tag = tag; --分頁編號
  self.tagString = tagString;
  self.sort = sort; --排序及顯示
  self.activityTime = activityTime; --活動時間
  self.actSort = actSort;
  self.title = title;
  self.isStop = isStop;

  return self;
end

function LoginAwardTagData.Script5()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function LoginAwardTagData.Script6()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end