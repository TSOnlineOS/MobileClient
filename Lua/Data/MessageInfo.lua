
MessageInfo = {}
MessageInfo.__index = MessageInfo;

function MessageInfo.AddThree(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function MessageInfo.New(roleId, name, sex, headStyle, colorTints, time, message)
  local self = {};
  setmetatable(self, MessageInfo);
  
  self.roleId = roleId;
  self.name = name;
  self.sex = sex;
  self.headStyle = headStyle;  
  self.colorTints = colorTints;
  self.time = DateTime.FromOADate(time);
  self.message = message;
  
  return self;
end

function MessageInfo.AddThreeA(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function MessageInfo.AddThreeB(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function MessageInfo.AddThreeC(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function MessageInfo.AddThreeD(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function MessageInfo.AddThreeE(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function MessageInfo.AddThreeF(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function MessageInfo.AddThreeG(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function MessageInfo:GetColorTint(colorPart)
  local r = 4;
  local g = 4;
  local b = 4;

  if colorPart == EColorPart.Helm then
    r = (self.colorTints[1] / 100000000) % 10;
    g = (self.colorTints[1] / 10000000) % 10;
    b = (self.colorTints[1] / 1000000) % 10;
  elseif colorPart == EColorPart.Hair then
    r = (self.colorTints[1] / 100000) % 10;
    g = (self.colorTints[1] / 10000) % 10;
    b = (self.colorTints[1] / 1000) % 10;
  elseif colorPart == EColorPart.Skin then
    r = (self.colorTints[1] / 100) % 10;
    g = (self.colorTints[1] / 10) % 10;
    b = (self.colorTints[1] / 1) % 10;
  elseif colorPart == EColorPart.Clothes then
    r = (self.colorTints[2] / 100000000) % 10;
    g = (self.colorTints[2] / 10000000) % 10;
    b = (self.colorTints[2] / 1000000) % 10;
  elseif colorPart == EColorPart.Orna1 then
    r = (self.colorTints[2] / 100000) % 10;
    g = (self.colorTints[2] / 10000) % 10;
    b = (self.colorTints[2] / 1000) % 10;
  elseif colorPart == EColorPart.Boots then
    r = (self.colorTints[2] / 100) % 10;
    g = (self.colorTints[2] / 10) % 10;
    b = (self.colorTints[2] / 1) % 10;
  end

  return r, g, b;
end

function MessageInfo.AddThreeH(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function MessageInfo.AddThreeI(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end