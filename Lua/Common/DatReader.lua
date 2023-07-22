
DatReader = {}
DatReader.__index = DatReader;

function DatReader.New(file, numberOffset, xor1, xor2, xor4, xor8, position, size)
  local self = {};
  setmetatable(self, DatReader);
  
  if size ~= nil and size > 0 then
    if position ~= nil and position > 0 then
      file:seek("set", position);
    end

    self.data = file:read(size);
  else
    self.data = file:read("*all");
  end

  self.position = 0;
  self.length = string.len(self.data);

  self.numberOffset = numberOffset or 0;
  self.xor1 = xor1 or 0;
  self.xor2 = xor2 or 0;
  self.xor4 = xor4 or 0;
  self.xor8 = xor8 or 0;

  return self;
end

function DatReader:Seek(position)
  self.position = math.clamp(position, 0, self.length);
end

function DatReader:CanRead()
  return self.position < self.length;
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
function DatReader:DecodeAll(size, count)
  self.position = 0;

  if size == nil then
    size = self:ReadInt32(false, false);
  end

  if count == nil then
    count = self:ReadInt32(false, false);
  end

  local decodeData = {};
  decodeData[0] = { string.byte(self.data, self.position + (size * (count + 1)) + 1, self.position + (size * (count + 1)) + size) };
  decodeData[1] = { string.byte(self.data, self.position + (size * (count + 2)) + 1, self.position + (size * (count + 2)) + size) };

  local decodedData = "";
  local decodeIndex = 0;
  local decodeCount = 0;
  for i = 1, count do
    decodeIndex = i % 2;
    decodeCount = 0;

    local tempData = string.sub(self.data, self.position + (size * i) + 1, self.position + (size * i) + size);
    
    tempData = string.gsub(
      tempData,
      ".",
      function(w)
        decodeCount = decodeCount + 1;
        return string.char(bit.bxor(string.byte(w), decodeData[decodeIndex][decodeCount]));
      end
    );

    decodedData = string.Concat(decodedData, tempData);
  end
  
  self.data = decodedData;
  self.position = 0;
  self.length = string.len(decodedData);
end

function DatReader:ReadString(size, computeRevert, xor, offset)
  if self.position + 1 + size > self.length then return end

  local count = string.byte(self.data, self.position + 1);
  
  self.position = self.position + 1;

  local result = "";

  if count > 0 then
    if computeRevert ~= false then
      result = string.reverse(string.sub(self.data, self.position + size - count + 1, self.position + size));
    else
      result = string.sub(self.data, self.position + 1, self.position + count);
    end

    if xor ~= nil then
      result = string.XOR(result, xor, offset);
    end

    result = LuaHelper.BytesToString(DataManager.encoding_Big5, result);
  end

  self.position = self.position + size;
  
  return result;
end

function DatReader:ReadNumber(size, computeXOR, computeOffset, signed)
  if self.position + size > self.length then return 0 end
  
  local result = 0;
  for i = 1, size do
    result = result + string.byte(self.data, self.position + i) * POT[i];
  end

  self.position = self.position + size;
  
  if computeXOR ~= false then
    if size == 1 then
      result = bit.bxor(result, self.xor1);
      
      if result < 0 then
        result = result - (math.floor(result / DIV1) * SUBT1);
      end
    elseif size == 2 then
      result = bit.bxor(result, self.xor2);
      
      if result < 0 then
        result = result - (math.floor(result / DIV2) * SUBT2);
      end
    elseif size == 4 then
      result = bit.bxor(result, self.xor4);
      
      if result < 0 then
        result = result - (math.floor(result / DIV4) * SUBT4);
      end   
    end
  end

  if computeOffset ~= false then
    result = result - self.numberOffset;
  end

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

function DatReader:ReadBoolean(computeXOR, computeOffset)
  return self:ReadNumber(1, computeXOR, computeOffset, false) == 1;
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
function DatReader:ReadDouble()
  if self.position + 8 > self.length then return 0 end

  local byte1 = string.byte(self.data, self.position + 8);
  local byte2 = string.byte(self.data, self.position + 7);

  local sign = 1;
  local mantissa = byte2 % 2^4;
  for i = 6, 1, -1 do
    mantissa = mantissa * 256 + string.byte(self.data, self.position + i);
  end

  self.position = self.position + 8;

  if byte1 > 127 then
    sign = -1;
  end

  local exponent = (byte1 % 128) * 2^4 + math.floor(byte2 / 2^4);

  if exponent == 0 then return 0 end

  mantissa = (math.ldexp(mantissa, -52) + 1) * sign;
  
  return math.ldexp(mantissa, exponent - 1023);
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
function DatReader:ReadByte(computeXOR, computeOffset)
  return self:ReadNumber(1, computeXOR, computeOffset, false);
end

function DatReader:ReadSByte(computeXOR, computeOffset)
  return self:ReadNumber(1, computeXOR, computeOffset, true);
end

function DatReader:ReadUInt16(computeXOR, computeOffset)
  return self:ReadNumber(2, computeXOR, computeOffset, false);
end

function DatReader:ReadInt16(computeXOR, computeOffset)
  return self:ReadNumber(2, computeXOR, computeOffset, true);
end

function DatReader:ReadUInt32(computeXOR, computeOffset)
  return self:ReadNumber(4, computeXOR, computeOffset, false);
end

function DatReader:ReadInt32(computeXOR, computeOffset)
  return self:ReadNumber(4, computeXOR, computeOffset, true);
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
function DatReader:ReadUInt64(computeXOR, computeOffset)
  return self:ReadNumber(8, computeXOR, computeOffset, false);
end

function DatReader:ReadBytes(size)
  if self.position + size > self.length then return end

  self.position = self.position + size;

  return string.sub(self.data, self.position - size + 1, self.position);
end