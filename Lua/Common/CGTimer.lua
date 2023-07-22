local UnityTime = UnityEngine.Time;

CGTimer = {};
local this = CGTimer;

this.serverTimeSpan = nil;
this.serverTime = nil;
this.serverStartTime = nil;
this.roleCreateTime = nil;
this.onlineTime = nil;  --每日在線時間(跨日歸零從新計算)

this.time = 0;
this.deltaTime = 0;
this.timeScaleEndTime = nil;

local listeners = {};
local delayFunctions = {};
local countDownFunctions = {};

function CGTimer.Initialize()
  this.deltaTime = 0;
  this.time = UnityTime.realtimeSinceStartup;
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
end

function CGTimer.Update()
  if this.serverTimeSpan ~= nil then
    this.serverTime = System.DateTime.Now:Add(this.serverTimeSpan);
  end
  
  this.deltaTime = UnityTime.realtimeSinceStartup - this.time;
  this.time = UnityTime.realtimeSinceStartup;
  
  if this.timeScaleEndTime ~= nil and this.timeScaleEndTime < this.time then
    this.timeScaleEndTime = nil;
    
    UnityTime.timeScale = 1;
  end
  
  for k, v in pairs(listeners) do
    if this.time >= v.time then
      v.time = this.time + v.interval;
      k();
    end
  end
  
  for k, v in pairs(delayFunctions) do
    if this.time >= v[1] then
      local func = v[2];
      table.remove(delayFunctions, k);

      func();
    end
  end

  for k, v in pairs(countDownFunctions) do
    if this.time >= v.time then
      local func = k;
      countDownFunctions[k] = nil;

      func();
    end
  end
end

function CGTimer.SetServerTime(d)
  this.serverTime = System.DateTime.FromOADate(d);
  this.serverTimeSpan = this.serverTime - System.DateTime.Now;
end

function CGTimer.SetOnlineTime(d)
  this.onlineTime = System.DateTime.FromOADate(d);
end

function CGTimer.SetServerStartTime(d)
  this.serverStartTime = System.DateTime.FromOADate(d);
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
function CGTimer.SetRoleCreateTime(d)
  this.roleCreateTime = System.DateTime.FromOADate(d);
end

function CGTimer.AddListener(listener, trigInterval, immediately)
  if listener == nil then return end
  
  if listeners[listener] == nil then
    listeners[listener] = {};
  end
  
  if immediately == nil or immediately then
    listeners[listener].time = 0;
  else
    listeners[listener].time = this.time + trigInterval;
  end
  
  listeners[listener].interval = trigInterval;
end

function CGTimer.RemoveListener(listener)
  if listener == nil then return end

  listeners[listener] = nil;
end

function CGTimer.ContainsListener(listener)
  if listener == nil then return end

  return listeners[listener] ~= nil;
end

function CGTimer.DoFunctionDelay(delayTime, doFunction)
  table.insert(delayFunctions, { this.time + delayTime, doFunction });
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
function CGTimer.RemoveFunctionDelay(doFunction)
  for k, v in pairs(delayFunctions) do
    if doFunction == v[2] then
      table.remove(delayFunctions, k);
      break;
    end
  end
end

function CGTimer.DoCountdown(functionName, delayTime)
  if countDownFunctions[functionName] == nil then
    countDownFunctions[functionName] = {};
  end

  if countDownFunctions[functionName].time == nil then
    countDownFunctions[functionName].time = this.time + delayTime;
  else
    countDownFunctions[functionName].time = this.time + delayTime;
  end
end

function CGTimer.GetDoCountdownTime(functionName)
  for k, v in pairs(countDownFunctions) do
    if k == functionName then
      return math.ceil(countDownFunctions[k].time - this.time);
    end
  end

  return 0;
end

function CGTimer.SetTimeScale(timeScale, duration)
  this.timeScaleEndTime = this.time + duration;
  
  UnityTime.timeScale = timeScale;
end