Achievement = {}
local this = Achievement;

this.maxSubTag = 10;

local showData = {};

--成就總分
local totalScoreInited = false;
local totalScore = 0;

function Achievement.Clear()
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  totalScore = 0;
  totalScoreInited = false;
  table.Clear(showData);
end

function Achievement.GetMainPageCount()
  if goodsSaleData == nil then
    return 0;
  end

  return table.Count(achievementTagData);
end

function Achievement.GetSubPageCount(mainPageIndex)
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  if achievementTagData[mainPageIndex] == nil then
    return 0;
  end

  return table.Count(achievementTagData[mainPageIndex]) - 1;
end

function Achievement.GetAchievementCount()
  return table.Count(showData);
end

function Achievement.GetMainTagName(mainPageIndex)
  if achievementTagData[mainPageIndex] == nil then
    return "";
  end

  if achievementTagData[mainPageIndex][0] == nil then
    return "";
  end

  return string.Get(achievementTagData[mainPageIndex][0]);
end

function Achievement.GetSubTagName(mainPageIndex, subPageIndex)
  if achievementTagData[mainPageIndex] == nil then
    return "";
  end

  if achievementTagData[mainPageIndex][subPageIndex] == nil then
    return "";
  end

  return string.Get(achievementTagData[mainPageIndex][subPageIndex]);
end

function Achievement.SetShowAchievementData(mainPageIndex, subPageIndex)
  table.Clear(showData);

  if achievementDatas[mainPageIndex] == nil then
    return;
  end

  if achievementDatas[mainPageIndex][subPageIndex] == nil then
    return;
  end

  local normal = {};--一般成就
  local complete = {};--完成的成就
  local get = {};--領取過獎勵

  for k, v in pairs(achievementDatas[mainPageIndex][subPageIndex]) do
    if v:HaveGetFlag() then
      table.insert(get, v);
    elseif v:HaveCompeleteFlag() or v:IsComplete() then
      table.insert(complete, v);
    else
      table.insert(normal, v);
    end  
  end

  for k, v in pairs(complete) do
    table.insert(showData, v);
  end

  for k, v in pairs(normal) do
    table.insert(showData, v);
  end 

  for k, v in pairs(get) do
    table.insert(showData, v);
  end
end

function Achievement.GetShowAchievementData(showIndex)
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  return showData[showIndex];
end

function Achievement.CheckAllCompeleteAchievement()
  for mainKey, mainValue in pairs(achievementDatas) do
    for subKey, subValue in pairs(mainValue) do
      for k, v in pairs(subValue) do
        if not v:HaveCompeleteFlag() and v:IsComplete() then
          Achievement.SendCompleteAchievement(v.Id);
        end
      end
    end  
  end
end

function Achievement.CheckMainFunctionRedDot()
  for mainKey, mainValue in pairs(achievementDatas) do
    for subKey, subValue in pairs(mainValue) do
      for k, v in pairs(subValue) do
        if v:HaveCompeleteFlag() and not v:HaveGetFlag() then
          RedDot.Add(ERedDot.Achievement);
          return;
        end
      end
    end  
  end

  RedDot.Remove(ERedDot.Achievement);
end

function Achievement.CheckMainPageRedDot(mainPageIndex)
  if achievementDatas[mainPageIndex] == nil then
    return false;
  end

  for k, v in pairs(achievementDatas[mainPageIndex]) do
    for subKey, subValue in pairs(v) do
      if subValue:HaveCompeleteFlag() and not subValue:HaveGetFlag() then
        return true;
      end
    end
  end

  return false;
end

function Achievement.CheckSubPageRedDot(mainPageIndex, subPageIndex)
  if achievementDatas[mainPageIndex] == nil then
    return false;
  end

  if achievementDatas[mainPageIndex][subPageIndex] == nil then
    return false;
  end

  for k, v in pairs(achievementDatas[mainPageIndex][subPageIndex]) do
    if v:HaveCompeleteFlag() and not v:HaveGetFlag()then
      return true;
    end
  end

  return false;
end

function Achievement.CheckCompeleteAchievement(mainPageIndex, subPageIndex)
  if achievementDatas[mainPageIndex] == nil then
    return;
  end

  if achievementDatas[mainPageIndex][subPageIndex] == nil then
    return;
  end

  for k, v in pairs(achievementDatas[mainPageIndex][subPageIndex]) do
    if not v:HaveCompeleteFlag() and v:IsComplete()then
      Achievement.SendCompleteAchievement(v.Id);
    end
  end
end

function Achievement.CheckCompeleteKind(conditionKind, roleCountIndex)
  if not totalScoreInited then return end --玩家登入完成後會初始化成就積分、防止在玩家登在入完成前，協定仍在設定資料時就去檢查成就
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------

  for mainKey, mainValue in pairs(achievementDatas) do
    for subKey, subValue in pairs(mainValue) do
      for k, v in pairs(subValue) do
        if v.conditions.kind == conditionKind and not v:HaveCompeleteFlag() and v:IsComplete() then
          if roleCountIndex ~= nil then
            if v.conditions.kindValue == roleCountIndex then
              Achievement.SendCompleteAchievement(v.Id);
            end
          else
            Achievement.SendCompleteAchievement(v.Id);
          end
        end
      end
    end  
  end
end

--成就總分計算
function Achievement.InitTotalScore()
  if totalScoreInited then return end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  

  for mainKey, mainValue in pairs(achievementDatas) do
    for subKey, subValue in pairs(mainValue) do
      for k, v in pairs(subValue) do
--        if v:HaveCompeleteFlag() or v:IsComplete() then
        if v:HaveGetFlag() then --有領獎的再計算積分
          totalScore = totalScore + v.score;
        end
      end
    end  
  end

  totalScoreInited = true;
end

function Achievement.UpdateTotalScore(achievementId)
  local data = AchievementData.GetData(achievementId);
  if data == nil then return end

  totalScore = totalScore + data.score;

  if UI.IsVisible(UIAchievement) then
    UIAchievement.UpdateTotoalScoreText();
  end

  NotifyManager.Notify("CheckCondition", ECondition.AchievementScore);
end

function Achievement.GetTotalScore()
  return totalScore;
end

--收送協定
--C:082-001 <完成成就> +Count(1)[最大10筆] +<<成就ID(2)>>
function Achievement.SendCompleteAchievement(achievementId)
  if Network.InUnbound then return end
  
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
  
  --S回傳一筆一筆回傳，C端自行紀錄10筆資料太容易出錯
  sendBuffer:Clear();
  sendBuffer:WriteByte(1);
  sendBuffer:WriteUInt16(achievementId);
  Network.Send(82, 1, sendBuffer);  
end

--[[ 成就完成
S:082-001 <完成成就> +結果(1) +成就ID(2)
                      結果 0: 成功 
                      結果 1: 無成就資料
                      結果 2: 成就已完成
                      結果 3: 成就條件不通過
                      結果 4: 成就資料錯誤
]]--
function Achievement.ReciveCompleteAchievement(data)
  local result = data:ReadByte();
  local id = data:ReadUInt16();

  if result == 0 then
    if UI.IsVisible(UIAchievement) then
      UIAchievement.RefreshAchievementPage();
    end
    RedDot.Add(ERedDot.Achievement);
--    Achievement.UpdateTotalScore(id);領獎時更新成就積分
  elseif result == 1 then
    logError(string.Get(10321));
  elseif result == 2 then
    logError(string.Get(10322));
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
  elseif result == 3 then
    logError(string.Get(10323));
  elseif result == 4 then
    logError(string.Get(10324));
  else
    logError(string.Concat("complete achievement error : ", result));   
  end
end

--C:082-002 <成就領獎> +成就ID(2)
function Achievement.SendGetItem(achievementId)
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
  sendBuffer:Clear()
  sendBuffer:WriteUInt16(achievementId);
  Network.Send(82, 2, sendBuffer);
end

--[[ 成就領獎
S:082-002 <成就領獎> +結果(1)
                      結果 0: 成功 +成就ID(2)
                      結果 1: 失敗
]]--
function Achievement.ReciveGetAchievement(data)
  local result = data:ReadByte();
  if result == 0 then
    local id = data:ReadUInt16();
    if UI.IsVisible(UIAchievement) then
      UIAchievement.RefreshAchievementPage();
      UIFrame.UpdateRedDot();
    end
    Achievement.UpdateTotalScore(id);
    Achievement.CheckMainFunctionRedDot();
  else
    logError(string.Concat("get achievement award error : ", result));
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
  end
end