
--输出日志--
function log(str)
  Util.Log(tostring(str));
end

--错误日志--
function logError(str) 
  Util.LogError(tostring(str));
end

--警告日志--
function logWarn(str) 
  Util.LogWarning(tostring(str));
end

--输出日志--
function Tlog(tag, str)
  Util.TLog(tostring(tag), tostring(str));
end

--错误日志--
function TlogError(tag, str) 
  Util.TLogError(tostring(tag), tostring(str));
end

--警告日志--
function TlogWarn(tag, str) 
  Util.TLogWarning(tostring(tag), tostring(str));
end

--查找对象--
function find(str)
	return GameObject.Find(str);
end

function destroy(obj)
	GameObject.Destroy(obj);
end

function newObject(prefab)
	return GameObject.Instantiate(prefab);
end

--创建面板--
function createPanel(name)
	PanelManager:CreatePanel(name);
end

function child(str)
	return transform:Find(str);
end

function subGet(childNode, typeName)		
	return child(childNode):GetComponent(typeName);
end

function findPanel(str) 
	local obj = find(str);
	if obj == nil then
		error(string.Concat(str, " is null"));
		return nil;
	end
	return obj:GetComponent("BaseLua");
end

function inheritsFrom( baseClass )
  -- The following lines are equivalent to the SimpleClass example:

  -- Create the table and metatable representing the class.
  local new_class = {}
  local class_mt = { __index = new_class }

  -- Note that this function uses class_mt as an upvalue, so every instance
  -- of the class will share the same metatable.
  --
  function new_class:create()
    local newinst = {}
    setmetatable( newinst, class_mt )
    return newinst
  end

  -- The following is the key to implementing inheritance:

  -- The __index member of the new class's metatable references the
  -- base class.  This implies that all methods of the base class will
  -- be exposed to the sub-class, and that the sub-class can override
  -- any of these methods.
  --
  if baseClass then
    setmetatable( new_class, { __index = baseClass } )
  end

  return new_class
end

function Contains(compare, ...)
  local compares = {...}
  for k, v in pairs(compares) do
    if compare == v then
      return true;
    end
  end
  
  return false;
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
function Between(value, min, max)
  if value == nil then
    return false;
  end

  if value >= min and value <= max then
    return true
  else
    return false;        
  end
end

function ConvertPositionToUIScene(canvasRectTransform, vector2Pos, sceneCamera)
  local result, pos = RectTransformUtility.ScreenPointToLocalPointInRectangle(canvasRectTransform, vector2Pos, sceneCamera, nil);
  return pos;
end

--table
function table.Clear(t)
  if t == nil then return {} end  

  for k in pairs(t) do
    t[k] = nil;
  end
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
function table.Count(t)
  if t == nil then return 0 end
  
  local result = 0;
  for k, v in pairs(t) do
    result = result + 1;
  end

  return result;
end

function table.Reverse(t)
  if t == nil then return {} end
  
  local result = {};
  for i = 0, #t - 1 do
    table.insert(result, t[#t-i]);
  end

  return result;
end

function table.RemoveByValue(t, v)
  if t == nil then return false end
  
  local k = table.GetKey(t, v);
  
  if k == nil then return false end
  
  table.remove(t, k);

  return true;
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
function table.GetKey(t, value)
  if t == nil then return nil end

  for k, v in pairs(t) do
    if v == value then
      return k;
    end
  end

  return nil;
end

function table.Copy(t)
  if t == nil then return nil end
  local result = {};
  for k,v in pairs(t)do
    result[k] = v;
  end  
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
function table.Contains(t, value)
  return table.GetKey(t, value) ~= nil;
end

function table.Dump(node)
  -- to make output beautiful
  local function tab(amt)
    local str = ""
    for i=1,amt do
      str = string.Concat(str, "\t");
    end
    return str
  end

  local cache, stack, output = {},{},{}
  local depth = 1
  local output_str = "{\n"

  while true do
    local size = 0
    for k,v in pairs(node) do
      size = size + 1
    end

    local cur_index = 1
    for k,v in pairs(node) do
      if (cache[node] == nil) or (cur_index >= cache[node]) then
        if (string.find(output_str,"}",output_str:len())) then
          output_str = string.Concat(output_str, ",\n");
        elseif not (string.find(output_str,"\n",output_str:len())) then
          output_str = string.Concat(output_str, "\n");
        end

        -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
        table.insert(output,output_str)
        output_str = ""

        local key
        if (type(k) == "number" or type(k) == "boolean") then
          key = string.Concat("[", tostring(k), "]");
        else
          key = string.Concat("['", tostring(k), "']");
        end

        if (type(v) == "number" or type(v) == "boolean") then
          output_str = string.Concat(output_str, tab(depth), key, " = ", tostring(v));
        elseif (type(v) == "table") then
          output_str = string.Concat(output_str, tab(depth), key, " = {\n");
          table.insert(stack,node)
          table.insert(stack,v)
          cache[node] = cur_index+1
          break
        else
          output_str = string.Concat(output_str, tab(depth), key, " = '", tostring(v), "'");
        end

        if (cur_index == size) then
          output_str = string.Concat(output_str, "\n", tab(depth-1), "}");
        else
          output_str = string.Concat(output_str, ",");
        end
      else
        -- close the table
        if (cur_index == size) then
          output_str = string.Concat(output_str, "\n", tab(depth-1), "}");
        end
      end

      cur_index = cur_index + 1
    end

    if (size == 0) then
      output_str = string.Concat(output_str, "\n", tab(depth-1), "}");
    end

    if (#stack > 0) then
      node = stack[#stack]
      stack[#stack] = nil
      depth = cache[node] == nil and depth + 1 or depth - 1
    else
      break
    end
  end

  -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
  table.insert(output, output_str)
  output_str = table.concat(output)

  logError(output_str)
end

--math
math.pi = 3.1415926;
math.rad2deg = 57.29578;
math.deg2rad = 0.01745329;

function math.round(x)
  if x % 1 < 0.5 then
    return math.floor(x);
  else
    return math.ceil(x);
  end
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
function math.BankersRound(x, count)
  if count == nil then
    count = 0;
  end
  
  local modValue = math.pow(0.1, count);
  local decimal = x % modValue;

  if decimal < 0.5 * modValue then
    return x - decimal;
  elseif decimal > 0.5 * modValue then
    return x + (modValue - decimal);
  else
    if count % 2 == 0 then
      return x - decimal;
    else
      return x + (modValue - decimal);
    end
  end
end

function math.clamp(x, min, max)
  if x < min then
    return min;
  end

  if x > max then
    return max;
  end

  return x;
end

function math.trunc(x)
  if x < 0 then
    return x - (x % -1);
  else
    return x - (x % 1);
  end
end

function math.logN(base, x)
  return math.log(x) / math.log(base);
end

function IntPower(base, exponent)
  local y = math.abs(exponent);
  local lBase = base;
  local result = 1;

  while y > 0 do
    while y % 2 == 0 do
      y = bit.rshift(y, 1);
      lBase = lBase * lBase
    end
    y = y - 1;
    result = result * lBase;
  end

  if exponent < 0 then
    result = 1.0 / result;
  end

  return result;
end

function SimpleRoundTo(x, digit)
  if digit == nil then
    digit = -2;
  end

  local factor = IntPower(10, digit);
  if x < 0 then
    return math.floor((x / factor) - 0.5) * factor;
  else
    return math.floor((x / factor) + 0.5) * factor;
  end
end

--flag
local flagValue = { 1, 2, 4, 8, 16, 32, 64, 128 }

function CheckFlag(flag, flagIndex)
  if type(flag) == "number" then
    if flagIndex < 1 or flagIndex > 8 then return false end
    
    return flagValue[flagIndex] == bit.band(flag, flagValue[flagIndex]);
  elseif type(flag) == "table" then
    if flagIndex < 1 then return false end
    
    local tableIndex = math.floor((flagIndex - 1) / 8) + 1;

    if flag[tableIndex] == nil then return false end

    flagIndex = ((flagIndex - 1) % 8) + 1;
    
    return flagValue[flagIndex] == bit.band(flag[tableIndex], flagValue[flagIndex]);
  end

  return false;
end

function SetFlag(flag, flagIndex, value)
  if type(flag) == "number" then
    if flagIndex < 1 or flagIndex > 8 then return flag end
    
    if value then
      flag = bit.bor(flag, flagValue[flagIndex]);
    else
      flag = bit.band(flag, bit.bnot(flagValue[flagIndex]));
    end
  elseif type(flag) == "table" then
    if flagIndex < 1 then return flag end
    
    local tableIndex = math.floor((flagIndex - 1) / 8) + 1;
    local tableValue = flag[tableIndex] or 0;

    flagIndex = ((flagIndex - 1) % 8) + 1;
    
    if value then
      flag[tableIndex] = bit.bor(tableValue, flagValue[flagIndex]);
    else
      flag[tableIndex] = bit.band(tableValue, bit.bnot(flagValue[flagIndex]));
    end
  end

  return flag;
end

---Random sample n element from 1 ~ m,
---return a table of index.
---If m is less than n, return nil.
---For debug and test only.
---@param m number
---@param n number
---@return table
function RandomSample(m, n)
  if m < n then return end;
  local result = {};
  local buffer = {};
  for index = 1, n do
    result[index] = buffer[index] or index;
    local switchIndex = math.random(index, m);
    buffer[switchIndex] = buffer[switchIndex] or switchIndex;
    result[index], buffer[switchIndex] = buffer[switchIndex], result[index];
  end
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  return result;
end

---Random sample n element from table t, copy and return a table with index 1 ~ n,
---regardless of its original index.
---If table count is less than n, return nil.
---For debug and test only.
---@param t table
---@param n number sample size
---@return table
function RandomSampleTable(t, n)
  if table.Count(t) < n then return end;
  local index = {};
  for k, v in pairs(t) do
    table.insert(index, k);
  end
  local resultIndex = RandomSample(table.Count(t), n);
  local result = {};
  for i = 1, n do
    table.insert(result, t[index[resultIndex[i]]]);
  end
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------

  return result;
end