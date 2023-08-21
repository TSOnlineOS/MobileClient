Activity = {}
local this = Activity;

--const
this.maxSubTag = 10;

this.orgWarFlagCount = 5; --軍團戰旗子數
this.orgWarMinutes = 30; --軍團戰時間
this.orgWarSceneId = 49943; --軍團戰場景ID
this.orgWarMaxMember = 30; --軍團戰備戰人數上限
this.orgWarPrepareItemId = 65501; --軍團戰備戰ICON物品ID
this.orgBossSceneId = 49951; --軍團BOSS場景ID

--var
local showData = {};

function Activity.Clear()
  table.Clear(showData);

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
  this.ClearTime();
end
--[[
function Activity.GetMainPageCount()
  if goodsSaleData == nil then
    return 0;
  end

  return table.Count(activityInfos);
end

function Activity.GetSubPageCount(mainPageIndex)
  if activityInfos[mainPageIndex] == nil then
    return 0;
  end

  return table.Count(activityInfos[mainPageIndex]);
end]]
--新增加uiIndex--
function Activity.GetUICount()
  if goodsSaleData == nil then
    return 0;
  end

  return table.Count(activityInfos);
end

function Activity.GetMainPageCount(uiIndx)
  if goodsSaleData == nil then
    return 0;
  end

  if activityInfos[uiIndx] == nil then
    return 0;
  end

  return table.Count(activityInfos[uiIndx]);
end

function Activity.GetSubPageCount(uiIndx, mainPageIndex)
  if activityInfos[uiIndx][mainPageIndex] == nil then
    return 0;
  end

  return table.Count(activityInfos[uiIndx][mainPageIndex]);
end
--完--
function Activity.GetActivityCount()
  return table.Count(showData);
end
--[[
function Activity.GetMainTagName(mainPageIndex, subPageIndex)
  if activityInfos[mainPageIndex] == nil then
    return "";
  end

  if activityInfos[mainPageIndex][subPageIndex] == nil then
    return "";
  end

  return activityInfos[mainPageIndex][subPageIndex][1]:GetMainTag();
end

function Activity.GetSubTagName(mainPageIndex, subPageIndex)
  if activityInfos[mainPageIndex] == nil then
    return "";
  end

  if activityInfos[mainPageIndex][subPageIndex] == nil then
    return "";
  end

  return activityInfos[mainPageIndex][subPageIndex][1]:GetSubTag();
end]]
--新增加uiIndex--
function Activity.GetMainTagName(uiIndex, mainPageIndex, subPageIndex)
  if activityInfos[uiIndex] == nil then
    return "";
  end
  if activityInfos[uiIndex][mainPageIndex] == nil then
    return "";
  end

  if activityInfos[uiIndex][mainPageIndex][subPageIndex] == nil then
    return "";
  end

  return activityInfos[uiIndex][mainPageIndex][subPageIndex][1]:GetMainTag();
end

function Activity.GetSubTagName(uiIndex, mainPageIndex, subPageIndex)
  if activityInfos[uiIndex] == nil then
    return "";
  end
  if activityInfos[uiIndex][mainPageIndex] == nil then
    return "";
  end

  if activityInfos[uiIndex][mainPageIndex][subPageIndex] == nil then
    return "";
  end

  return activityInfos[uiIndex][mainPageIndex][subPageIndex][1]:GetSubTag();
end
--完--
function Activity.GetActivityTime(activityId)
  local activityTime = {};

  if activityTime[activityId] == nil then
    activityTime[activityId] = {};
  end
  if activityTimes[activityId] == nil then
    
    logError("activityId:"..activityId); 
    
  end


  for k, v in pairs(activityTimes[activityId]) do
    table.insert(activityTime[activityId], v);
  end

  return activityTime[activityId];
end
--[[
function Activity.SetShowActivityInfo(mainPageIndex, subPageIndex)
  table.Clear(showData);

  if activityInfos[mainPageIndex] == nil then
    return;
  end

  if activityInfos[mainPageIndex][subPageIndex] == nil then
    return;
  end

  for k, v in pairs(activityInfos[mainPageIndex][subPageIndex]) do
    table.insert(showData, v);
  end
end]] 
--新增加uiIndex-- 
function Activity.SetShowActivityInfo(uiIndex, mainPageIndex, subPageIndex)
  table.Clear(showData);
  if activityInfos[uiIndex] == nil then
    return;
  end

  if activityInfos[uiIndex][mainPageIndex] == nil then
    return;
  end

  if activityInfos[uiIndex][mainPageIndex][subPageIndex] == nil then
    return;
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
  for k, v in pairs(activityInfos[uiIndex][mainPageIndex][subPageIndex]) do
    table.insert(showData, v);
  end
end
--完--

function Activity.GetShowActivityInfo(showIndex)
  return showData[showIndex];
end

--Countdown
this.activityEndTime = nil;

function Activity.SetEndTime(startDateTime, activityMinutes)
  this.activityEndTime = startDateTime:AddMinutes(activityMinutes);
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
  CGTimer.AddListener(this.UpdateTime, 1, true);
end

function Activity.ClearTime()
  this.activityEndTime = nil;

  CGTimer.RemoveListener(this.UpdateTime);
end

function Activity.UpdateTime()
  if this.activityEndTime ~= nil then
    local sec = math.floor((this.activityEndTime:Subtract(CGTimer.serverTime)).TotalSeconds);
    if sec > 0 then
      UIMain.UpdateDungeonTime(math.floor(sec / 60), sec % 60);
      return;
    else
      UIMain.UpdateDungeonTime(0, 0);
    end
  end

  CGTimer.RemoveListener(this.UpdateTime);
end
