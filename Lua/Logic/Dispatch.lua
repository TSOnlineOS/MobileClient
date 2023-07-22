Dispatch = {};
local this = Dispatch;

this.MaxSilderCount = 4;
this.MaxKindCount = 5;
this.ConditionCount = 2;
this.ListenerTrick = 1;

EDispatchBonuseKind = {
  Moral = 1, --陣營
  Element = 2, --屬性
}

local showNpc = {};
local normalSaveData = {};
local normalEffectSaveData = {};

local normalDispatchKind = 0;
local barCount = 0;
local processValue = 0;

function Dispatch.Clear()
  table.Clear(showNpc);
  table.Clear(normalSaveData);
  table.Clear(normalEffectSaveData);
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

function Dispatch.OpenUI(kind)
  this.SendQueryData();
end

function Dispatch.SetShowNpcData()
  table.Clear(showNpc);

  local tempData;
  for k, v in pairs(Inn.npcs) do
    tempData = {}
    tempData.innIndex = k;
    tempData.data = v;
    table.insert(showNpc, tempData)
  end
end

function Dispatch.GetShowNpcCount()
  return table.Count(showNpc);
end

function Dispatch.GetShowNpcData(index)
  return showNpc[index];
end

function Dispatch.GetShowNpcDataByInnIndex(index)
  for k, v in pairs(showNpc) do
    if index == v.innIndex then
      return v;
    end
  end
end

function Dispatch.IsHaveProcessData(index)
  local dispatchSaveTable = Dispatch.GetDispatchTable();

  if dispatchSaveTable ~= nil then
    for k, v in pairs(dispatchSaveTable) do
      if index == v.index and v.kind ~= 0 then
        return true;
      end
    end    
  end

  return false;
end

function Dispatch.GetProcessData(dispatchKind)
  local result = nil;
  local dispatchSaveTable = Dispatch.GetDispatchTable();

  if dispatchSaveTable ~= nil then
    for k, v in pairs(dispatchSaveTable) do
      if dispatchKind == v.kind then
        result = v;
        break;
      end
    end    
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

function Dispatch.GetProcessValue(index)
  local dispatchSaveTable = Dispatch.GetDispatchTable();

  if dispatchSaveTable ~= nil then
    for k, v in pairs(dispatchSaveTable) do
      if index == v.index and v.innIndex ~= 0 then
        if CGTimer.serverTime:CompareTo(v.endTime) >= 0 then
          return 1;
        else
          return (CGTimer.serverTime - v.startTime).TotalSeconds / (v.endTime - v.startTime).TotalSeconds;
        end
      end
    end    
  end

  return 0;
end

function Dispatch.GetProcessDataByIndex(index)
  local dispatchSaveTable = Dispatch.GetDispatchTable();

  if dispatchSaveTable ~= nil then
    for k, v in pairs(dispatchSaveTable) do
      if index == v.index and v.innIndex ~= 0 then
        return v;
      end
    end    
  end

  return nil;
end

function Dispatch.GetDispatchTable()
  return normalSaveData;
end

function Dispatch.IsComplete(processData)
   return  CGTimer.serverTime:CompareTo(processData.endTime) >= 0;
end

function Dispatch.IsMeetEffect(index, npcData)
  local effectTable = Dispatch.GetFindEffectTable()
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
  if effectTable ~= nil and effectTable[index] ~= nil then
    local bonusDataIndex = effectTable[index];
    if dispatchBonusData[bonusDataIndex] ~= nil then
      return dispatchBonusData[bonusDataIndex]:IsNpcMeetCondition(npcData)
    end
  end

  return false;
end

function Dispatch.IsMeetProcessEffect(processData, index, npcData)
  if processData.effect[index] ~= nil then
    local bonusDataIndex = processData.effect[index];
    if dispatchBonusData[bonusDataIndex] ~= nil then
      return dispatchBonusData[bonusDataIndex]:IsNpcMeetCondition(npcData);
    end
  end

  return false;
end

function Dispatch.GetEffectText(index)
  local effectTable = Dispatch.GetFindEffectTable()

  if effectTable ~= nil and effectTable[index] ~= nil then
    local bonusDataIndex = effectTable[index];
    if dispatchBonusData[bonusDataIndex] ~= nil then
      return dispatchBonusData[bonusDataIndex]:GetContent();
    end
  end

  return "";
end

function Dispatch.GetProcessEffectText(processData, index)
  if processData.effect[index] ~= nil then
    local bonusDataIndex = processData.effect[index];
    if dispatchBonusData[bonusDataIndex] ~= nil then
      return dispatchBonusData[bonusDataIndex]:GetContent();
    end
  end

  return "";
end

function Dispatch.GetEffect(index, processData)
  local bonusDataIndex = nil;
  if type(processData) == "table" then
    if processData.effect == nil then return end
    bonusDataIndex = processData.effect[index];
  else
    processData = Dispatch.GetFindEffectTable();
    if processData == nil then return end
    bonusDataIndex = processData[index];
  end

  if bonusDataIndex == nil then return end

  local bonusData = dispatchBonusData[bonusDataIndex];

  if bonusData == nil then return end

  return bonusData;
end

function Dispatch.GetFindEffectTable()
  return normalEffectSaveData;
end

function Dispatch.GetAwardData(dispatchKind, npcLv)
  local result = nil;

  if dispatchData[1][dispatchKind] ~= nil then
    for k, v in pairs(dispatchData[1][dispatchKind]) do
      if npcLv > v.minLv then
        result = commonAwardDatas[v.awardId];
      else
        break;
      end
    end
  end

  return result;
end

function Dispatch.GetAwardExp(dispatchKind, npcLv)
  local result = 0;
  local kind = 0;
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
  if dispatchData[1][dispatchKind] ~= nil then
    for k, v in pairs(dispatchData[1][dispatchKind]) do
      if npcLv > v.minLv then
        kind = v.expKind;
        result = v.exp;
      else
        break;
      end
    end
  end

  if kind == 1 then
    return kind, result * 0.001 * 100; --數值千分比
  end 

  return kind, result;
end

function Dispatch.GetAwardLevel(dispatchKind, npcLv)
  local result = 0;

  if dispatchData[1][dispatchKind] ~= nil then
    for k, v in pairs(dispatchData[1][dispatchKind]) do
      if npcLv > v.minLv then
        result = result + 1;
      else
        break;
      end
    end
  end

  return result;
end

function Dispatch.GetBarCount()
  return barCount;
end

function Dispatch.SwitchGetAwardPage()
  local data = this.GetCompleteDispatch();
  UIDispatch.SwitchPage(data);
end

function Dispatch.GetCompleteDispatch()
  local dispatchSaveTable = Dispatch.GetDispatchTable();

  for k, v in pairs(dispatchSaveTable) do
    if v.kind ~= 0 and this.IsComplete(v) then
      return v;
    end
  end

  return nil;
end

function Dispatch.GetDispatchSaveKind()
  return normalDispatchKind;
end

function Dispatch.GetName(subKind)
  if subKind == 1 then
    return string.Get(20548);
  elseif subKind == 2 then
    return string.Get(40235);
  elseif subKind == 3 then
    return string.Get(20779);
  elseif subKind == 4 then
    return string.Get(20856);
  elseif subKind == 5 then
    return string.Get(20857);
  end

  return "";
end

function Dispatch.GetContent(subKind)
  if subKind == 1 then
    return string.Get(20549);
  elseif subKind == 2 then
    return string.Get(20550);
  elseif subKind == 3 then
    return string.Get(20638);
  elseif subKind == 4 then
    return string.Get(20639);
  elseif subKind == 5 then
    return string.Get(20640);
  end

  return "";
end

function Dispatch.AddSliderListener()
  if UI.IsVisible(UIDispatch) then
    UIDispatch.AddSliderListener();
  end

  CGTimer.AddListener(this.CheckRedDot, Dispatch.ListenerTrick, true);
end

local haveEmpty;
function Dispatch.CheckRedDot()
  haveEmpty = false;
  for i = 1, this.MaxSilderCount do
    if not Dispatch.IsHaveProcessData(i) and Dispatch.GetBarCount() >= i then
      haveEmpty = true;
      break;
    end
  end

  --還有次數、沒有派遣
  if RoleCount.Max(ERoleCount.Dispatch) - RoleCount.Get(ERoleCount.Dispatch) > 0 and haveEmpty then
    RedDot.Add(ERedDot.Dispatch);
  else
    RedDot.Remove(ERedDot.Dispatch);
  end

  --派遣可以領獎
  for i = 1, this.MaxSilderCount do
    if Dispatch.IsHaveProcessData(i) then
      processValue = Dispatch.GetProcessValue(i);
      if processValue >= 1 then
        RedDot.Add(ERedDot.Dispatch);
      end
    end
  end
end

function Dispatch.SendQueryData()
--C:086-001 <查詢派遣相關資料>
  Network.Send(86, 1, sendBuffer:Clear());
end

function Dispatch.ReciveOpenUI()
--S:086-001 <回傳資料完成>
  UI.Open(UIDispatch);
end

function Dispatch.SendDispatchStart(dispatchKind, selectNpcIndex)
--C:086-002 <派遣武將出發> +客棧武將索引(1)
  local showNpc = this.GetShowNpcData(selectNpcIndex);
  if showNpc == nil then return end

  sendBuffer:Clear();
  sendBuffer:WriteByte(showNpc.innIndex);
  Network.Send(86, 2, sendBuffer);
end

function Dispatch.ReciveDispatchSave(data)
--S:086-003 <更新派遣資料> +數量(1) +<<+進度條索引(1) + 開始時間(8) + 結束時間(8) +派遣種類(1) +客棧武將索引(1) +效果索引1(1) +效果索引2(1)>>
  local count = data:ReadByte();
  local dispatchTable = Dispatch.GetDispatchTable();

  for i = 1, count do 
    local id, saveData = this.ReadSaveDate(data)
    dispatchTable[id] = saveData;
  end

  normalSaveData = dispatchTable;

  --增加檢查派遣進度、紅點提示
  Dispatch.AddSliderListener();
end

function Dispatch.ReadSaveDate(data)
  local result = {};

  result.index = data:ReadByte();
  result.startTime = DateTime.FromOADate(data:ReadDouble());
  result.endTime = DateTime.FromOADate(data:ReadDouble());
  result.kind = data:ReadByte();
  result.innIndex = data:ReadByte();
  result.effect = {};
  table.insert(result.effect, data:ReadByte());
  table.insert(result.effect, data:ReadByte());

  return result.index, result;
end

function Dispatch.ReciveDispatchEffect(data)
--S:086-004 <更新派遣效果> +派遣串表索引(1) +效果索引1(1) +效果索引2(1)
  table.Clear(normalEffectSaveData);
  normalDispatchKind = data:ReadByte();
  table.insert(normalEffectSaveData, data:ReadByte());
  table.insert(normalEffectSaveData, data:ReadByte());
end

function Dispatch.SendCompelete(index)
--C:086-005 <完成派遣> +進度條索引(1)
  sendBuffer:Clear();
  sendBuffer:WriteByte(index);
  Network.Send(86, 5, sendBuffer);
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

function Dispatch.ReciveBarCount(data)
--S:086-006 <更新派遣最大數量> 數量(1)
   barCount = data:ReadByte();
end