LoginAwardData = {};
LoginAwardData.__index = LoginAwardData;

function LoginAwardData.Demo()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function LoginAwardData.New(reader)
  local self = {};
  setmetatable(self, LoginAwardData);

  self.group = reader:ReadByte(); --群組
  self.changeKind = reader:ReadByte(); --兌換方式
  self.day = reader:ReadUInt32(); --天數

  self.itemId = {};
  self.quant = {};

  for i = 1, 5 do
    self.itemId[i] = reader:ReadUInt16();
    self.quant[i] = reader:ReadInt32();
  end

  self.changeItemId = reader:ReadUInt16();
  self.changeQuant = reader:ReadInt32();
  self.roleCount = reader:ReadUInt16();
  self.flag = reader:ReadUInt16();

  return self;
end

function LoginAwardData.Demo1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function LoginAwardData.Demo2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function LoginAwardData.Demo3()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function LoginAwardData.Add(group, day, items, quants, changeItemId, changeQuant, roleCount, flag, actRule)
  local self = {};
  setmetatable(self, LoginAwardData);

  self.group = group; --群組
  self.day = day; --天數
  self.itemId = items;
  self.quant = 999;
  self.changeItemId = changeItemId;
  self.changeQuant = 999;
  self.roleCount = roleCount;
  self.flag = flag;
  self.actRule = actRule;

  return self;
end

function LoginAwardData.Demo4()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function LoginAwardData.Demo5()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end