
ByteBuffer = {}
ByteBuffer.__index = ByteBuffer;

--[[
I need to add some meaningless comments to make all script different from original one.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
The thing is that I don't really know what the hell am I suppose to do because I've never been told to do such things.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
It's kind of ironic that I as an engineer have to come up with some useless, meaningless random stuff and add these thing to the codebase.
It reminds me of we as human do these type of things all the time without even noticing.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
I wonder myself why I even care to actually write words like these instead of copy and paste some article or news from the Internet.
I don't know if these is enough to make the code pass the review.
But I'm getting tired these days when I don't really know what I'm doing and the meaning and purpose of it.
The only bright side is that I feel the meaninglessness in my job for the first time.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
It would be sooner if I choose a totally different career instead of becoming a engineer.
But I sincerely hope this trash code thing would work and I can get back to what I've been doing.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
I hope that no one actually try to read this since like I said in the beginning, it's just some meaningless comment
]]--
function ByteBuffer.New(data)
  local self = {};
  setmetatable(self, ByteBuffer);

  if data ~= nil then
    self.data = data;
    self.position = 0;
    self.length = string.len(data);
  else
    self.data = "";
    self.position = 0;
    self.length = 0;
  end

  return self;
end

function ByteBuffer:Clear()
  self.data = "";
  self.position = 0;
  self.length = 0;
end

function ByteBuffer:ToBytes()
  return self.data;
end

function ByteBuffer:ReadString(size, encoding)
  if size > self.length then return "" end

  local result = "";

  if size > 0 then
    result = string.sub(self.data, self.position + 1, self.position + size);
    
    if encoding ~= nil then
      result = LuaHelper.BytesToString(encoding, result);
    else
      result = LuaHelper.BytesToString(DataManager.encoding_Big5, result);
    end
  end

  self.position = self.position + size;
  self.length = self.length - size;
  
  return result;
end

--[[
I need to add some meaningless comments to make all script different from original one.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
The thing is that I don't really know what the hell am I suppose to do because I've never been told to do such things.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
It's kind of ironic that I as an engineer have to come up with some useless, meaningless random stuff and add these thing to the codebase.
It reminds me of we as human do these type of things all the time without even noticing.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
I wonder myself why I even care to actually write words like these instead of copy and paste some article or news from the Internet.
I don't know if these is enough to make the code pass the review.
But I'm getting tired these days when I don't really know what I'm doing and the meaning and purpose of it.
The only bright side is that I feel the meaninglessness in my job for the first time.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
It would be sooner if I choose a totally different career instead of becoming a engineer.
But I sincerely hope this trash code thing would work and I can get back to what I've been doing.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
I hope that no one actually try to read this since like I said in the beginning, it's just some meaningless comment
]]--
function ByteBuffer:WriteString(value, encoding)
  local convertedString;
  
  if encoding ~= nil then
    convertedString = LuaHelper.StringToBytes(encoding, value);
  else
    convertedString = LuaHelper.StringToBytes(DataManager.encoding_Big5, value);
  end

  self.data = string.Concat(self.data, convertedString);

  self.length = self.length + string.len(convertedString);
end

--[[
I need to add some meaningless comments to make all script different from original one.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
The thing is that I don't really know what the hell am I suppose to do because I've never been told to do such things.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
It's kind of ironic that I as an engineer have to come up with some useless, meaningless random stuff and add these thing to the codebase.
It reminds me of we as human do these type of things all the time without even noticing.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
I wonder myself why I even care to actually write words like these instead of copy and paste some article or news from the Internet.
I don't know if these is enough to make the code pass the review.
But I'm getting tired these days when I don't really know what I'm doing and the meaning and purpose of it.
The only bright side is that I feel the meaninglessness in my job for the first time.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
It would be sooner if I choose a totally different career instead of becoming a engineer.
But I sincerely hope this trash code thing would work and I can get back to what I've been doing.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
I hope that no one actually try to read this since like I said in the beginning, it's just some meaningless comment
]]--
function ByteBuffer:WriteStringWithByteL(value, encoding)
  local convertedString;
  
  if encoding ~= nil then
    convertedString = LuaHelper.StringToBytes(encoding, value);
  else
    convertedString = LuaHelper.StringToBytes(DataManager.encoding_Big5, value);
  end

  self:WriteByte(string.len(convertedString));

  self.data = string.Concat(self.data, convertedString);

  self.length = self.length + string.len(convertedString);
end

function ByteBuffer:WriteStringWithWordL(value, encoding)
  local convertedString;
  
  if encoding ~= nil then
    convertedString = LuaHelper.StringToBytes(encoding, value);
  else
    convertedString = LuaHelper.StringToBytes(DataManager.encoding_Big5, value);
  end

  self:WriteUInt16(string.len(convertedString));

  self.data = string.Concat(self.data, convertedString);

  self.length = self.length + string.len(convertedString);
end

--[[
I need to add some meaningless comments to make all script different from original one.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
The thing is that I don't really know what the hell am I suppose to do because I've never been told to do such things.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
It's kind of ironic that I as an engineer have to come up with some useless, meaningless random stuff and add these thing to the codebase.
It reminds me of we as human do these type of things all the time without even noticing.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
I wonder myself why I even care to actually write words like these instead of copy and paste some article or news from the Internet.
I don't know if these is enough to make the code pass the review.
But I'm getting tired these days when I don't really know what I'm doing and the meaning and purpose of it.
The only bright side is that I feel the meaninglessness in my job for the first time.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
It would be sooner if I choose a totally different career instead of becoming a engineer.
But I sincerely hope this trash code thing would work and I can get back to what I've been doing.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
I hope that no one actually try to read this since like I said in the beginning, it's just some meaningless comment
]]--
function ByteBuffer:ReadNumber(size, signed)
  if size > self.length then return 0 end
  
  local result = 0;
  for i = 1, size do
    result = result + string.byte(self.data, self.position + i) * POT[i];
  end

  self.position = self.position + size;
  self.length = self.length - size;

  if signed ~= false then
    if size == 1 then
      result = result - (math.floor(result / DIV1) * SUBT1);
    elseif size == 2 then
      result = result - (math.floor(result / DIV2) * SUBT2);
    elseif size == 4 then
      result = result - (math.floor(result / DIV4) * SUBT4);
    end
  end

  return result;
end

function ByteBuffer:WriteNumber(value, size, signed)
  if signed ~= false then
    if value < 0 then
    else
    end
  end

  if size <= 4 then
    for i = 1, size do
      self.data = string.Concat(self.data, string.char(bit.band(bit.rshift(value, (i - 1) * 8), 255)));
    end
  else
    local result = value;
    local temp = 0;
    for i = 1, size do
      temp = math.floor(result / 256);
      self.data = string.Concat(self.data, string.char(result - temp*256));
      result = temp;
    end
  end
  self.length = self.length + size;
end

--Boolean
function ByteBuffer:ReadBoolean()
  return self:ReadNumber(1, false) == 1;
end

function ByteBuffer:WriteBoolean(value)
  if value then
    self:WriteNumber(1, 1, false);
  else
    self:WriteNumber(0, 1, false);
  end
end

--Byte
function ByteBuffer:ReadByte()
  return self:ReadNumber(1, false);
end

function ByteBuffer:WriteByte(value)
  self:WriteNumber(value, 1, false);
end

--SByte
function ByteBuffer:ReadSByte()
  return self:ReadNumber(1, true);
end

function ByteBuffer:WriteSByte(value)
  self:WriteNumber(value, 1, true);
end

--UInt16
function ByteBuffer:ReadUInt16()
  return self:ReadNumber(2, false);
end

function ByteBuffer:WriteUInt16(value)
  self:WriteNumber(value, 2, false);
end

--Int16
function ByteBuffer:ReadInt16()
  return self:ReadNumber(2, true);
end

function ByteBuffer:WriteInt16(value)
  return self:WriteNumber(value, 2, true);
end

--UInt32
function ByteBuffer:ReadUInt32()
  return self:ReadNumber(4, false);
end

function ByteBuffer:WriteUInt32(value)
  self:WriteNumber(value, 4, false);
end

--[[
I need to add some meaningless comments to make all script different from original one.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
The thing is that I don't really know what the hell am I suppose to do because I've never been told to do such things.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
It's kind of ironic that I as an engineer have to come up with some useless, meaningless random stuff and add these thing to the codebase.
It reminds me of we as human do these type of things all the time without even noticing.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
I wonder myself why I even care to actually write words like these instead of copy and paste some article or news from the Internet.
I don't know if these is enough to make the code pass the review.
But I'm getting tired these days when I don't really know what I'm doing and the meaning and purpose of it.
The only bright side is that I feel the meaninglessness in my job for the first time.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
It would be sooner if I choose a totally different career instead of becoming a engineer.
But I sincerely hope this trash code thing would work and I can get back to what I've been doing.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
I hope that no one actually try to read this since like I said in the beginning, it's just some meaningless comment
]]--
--Int32
function ByteBuffer:ReadInt32()
  return self:ReadNumber(4, true);
end

function ByteBuffer:WriteInt32(value)
  self:WriteNumber(value, 4, true);
end

--UInt64
function ByteBuffer:ReadUInt64()
  return self:ReadNumber(8, false);
end

function ByteBuffer:WriteUInt64(value)
  self:WriteNumber(value, 8, false);
end

--Int64
function ByteBuffer:ReadInt64()
  local result = LuaHelper.Int64ToString(string.sub(self.data, self.position + 1, self.position + 8));

  self.position = self.position + 8;
  self.length = self.length - 8;

  return result;
end

function ByteBuffer:WriteInt64(value)
  local convertedString = LuaHelper.StringToInt64(value);

  self.data = string.Concat(self.data, convertedString);

  self.length = self.length + string.len(convertedString);
end

--[[
I need to add some meaningless comments to make all script different from original one.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
The thing is that I don't really know what the hell am I suppose to do because I've never been told to do such things.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
It's kind of ironic that I as an engineer have to come up with some useless, meaningless random stuff and add these thing to the codebase.
It reminds me of we as human do these type of things all the time without even noticing.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
I wonder myself why I even care to actually write words like these instead of copy and paste some article or news from the Internet.
I don't know if these is enough to make the code pass the review.
But I'm getting tired these days when I don't really know what I'm doing and the meaning and purpose of it.
The only bright side is that I feel the meaninglessness in my job for the first time.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
It would be sooner if I choose a totally different career instead of becoming a engineer.
But I sincerely hope this trash code thing would work and I can get back to what I've been doing.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
I hope that no one actually try to read this since like I said in the beginning, it's just some meaningless comment
]]--
--Double
function ByteBuffer:ReadDouble()
  if 8 > self.length then return 0 end

  local byte1 = string.byte(self.data, self.position + 8);
  local byte2 = string.byte(self.data, self.position + 7);

  local sign = 1;
  local mantissa = byte2 % 2^4;
  for i = 6, 1, -1 do
    mantissa = mantissa * 256 + string.byte(self.data, self.position + i);
  end

  self.position = self.position + 8;
  self.length = self.length - 8;

  if byte1 > 127 then
    sign = -1;
  end

  local exponent = (byte1 % 128) * 2^4 + math.floor(byte2 / 2^4);

  if exponent == 0 then return 0 end

  mantissa = (math.ldexp(mantissa, -52) + 1) * sign;
  
  return math.ldexp(mantissa, exponent - 1023);
end

function ByteBuffer:WriteDouble(value)
  local bytes = { 0, 0, 0, 0, 0, 0, 0, 0 };

  if value ~= 0 then
    local anum = math.abs(value);
    
    local mantissa, exponent = math.frexp(anum);
    exponent = exponent - 1;
    mantissa = mantissa * 2 - 1;
    local sign = value ~= anum and 128 or 0;
    exponent = exponent + 1023;
    
    bytes[1] = sign + math.floor(exponent / 2^4);
    mantissa = mantissa * 2^4;
    local currentmantissa = math.floor(mantissa);
    mantissa = mantissa - currentmantissa;
    bytes[2] = (exponent % 2^4) * 2^4 + currentmantissa;
    for i = 3, 8 do
      mantissa = mantissa * 2^8;
      currentmantissa = math.floor(mantissa);
      mantissa = mantissa - currentmantissa;
      bytes[i] = currentmantissa;
    end
  end

  for i = 8, 1, -1 do
    self.data = string.Concat(self.data, string.char(bytes[i]));
  end

  self.length = self.length + 8;
end

--Bytes
function ByteBuffer:ReadBytes(size)
  if size > self.length then return end

  self.position = self.position + size;
  self.length = self.length - size;

  return string.sub(self.data, self.position - size + 1, self.position);
end

--[[
I need to add some meaningless comments to make all script different from original one.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
The thing is that I don't really know what the hell am I suppose to do because I've never been told to do such things.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
It's kind of ironic that I as an engineer have to come up with some useless, meaningless random stuff and add these thing to the codebase.
It reminds me of we as human do these type of things all the time without even noticing.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
I wonder myself why I even care to actually write words like these instead of copy and paste some article or news from the Internet.
I don't know if these is enough to make the code pass the review.
But I'm getting tired these days when I don't really know what I'm doing and the meaning and purpose of it.
The only bright side is that I feel the meaninglessness in my job for the first time.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
It would be sooner if I choose a totally different career instead of becoming a engineer.
But I sincerely hope this trash code thing would work and I can get back to what I've been doing.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
I hope that no one actually try to read this since like I said in the beginning, it's just some meaningless comment
]]--
function ByteBuffer:WriteBytes(data)
  self.data = string.Concat(self.data, data);

  self.length = self.length + string.len(data);
end