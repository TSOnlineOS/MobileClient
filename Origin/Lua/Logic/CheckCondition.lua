ECondition = {
  Gold = 1,
  Lv = 2,
  AchievementScore = 6,
  Int = 7,
  Atk = 8,
  Agi = 9,
  Def = 10,
  Hpx = 11,
  Spx = 12,
  Honor = 13, 
  RoleCount = 14,
  MissionFlag = 15,
  MissionStep = 16,
  Flag = 17,
  FriendCount = 18,
  Turn = 19,
  NowLevel = 20,
}

CheckCondition = {};
local this = CheckCondition;

local checkConditionNotiy = {};

function CheckCondition.Initialize()
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
  NotifyManager.Register(ENotifyManager.CheckCondition, "CheckCondition", this.CheckCompeleteKind);
  this.Register("MissionAward", MissionAward.CheckCompeleteKind);
  this.Register("Achievement", Achievement.CheckCompeleteKind);
  this.Register("Jiugongge", Jiugongge.CheckCompeleteKind);
end

function CheckCondition.Register(kind, notifyFunc)
  table.insert(checkConditionNotiy, notifyFunc);
end

function CheckCondition.Clear()
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
  table.Clear(this.countDatas);
end

function CheckCondition.CheckCompeleteKind(data)
  for k, func in pairs(checkConditionNotiy) do
    if  type(data) == 'table' then
      func( unpack(data) );
    else
      func( data );
    end
  end
end

this.CalculationConditionValue = {};

this.CalculationConditionValue[ECondition.Gold] = function(data)
  --金幣
  return Role.GetPlayerGold();
end

this.CalculationConditionValue[ECondition.Lv] = function(data)
  --等級
  local turn = Role.player:GetAttribute(EAttribute.Turn);
  if turn == data.conditions.kindValue then
    return  Role.player:GetAttribute(EAttribute.Lv);
  end

  return 0;
end

--this.CalculationConditionValue[3] = function(data)
--  --一轉等級
--  local turn = Role.player:GetAttribute(EAttribute.Turn);
--  if turn >= 1 then
--    return  Role.player:GetAttribute(EAttribute.Lv);
--  end

--  return 0;
--end

--this.CalculationConditionValue[4] = function(data)
--  --二轉等級
--  local turn = Role.player:GetAttribute(EAttribute.Turn);
--  if turn >= 2 then
--    return  Role.player:GetAttribute(EAttribute.Lv);
--  end

--  return 0;
--end

--this.CalculationConditionValue[5] = function(data)
--  --三轉等級
--  local turn = Role.player:GetAttribute(EAttribute.Turn);
--  if turn >= 3 then
--    return  Role.player:GetAttribute(EAttribute.Lv);
--  end

--  return 0;
--end

this.CalculationConditionValue[ECondition.AchievementScore] = function(data)
  --成就積分
  return Achievement.GetTotalScore();
end 

this.CalculationConditionValue[ECondition.Int] = function(data)
  --知力
  return Role.player:GetAttribute(EAttribute.Int);
end

this.CalculationConditionValue[ECondition.Atk] = function(data)
  --攻擊力
  return Role.player:GetAttribute(EAttribute.Atk);
end

this.CalculationConditionValue[ECondition.Agi] = function(data)
  --敏捷
  return Role.player:GetAttribute(EAttribute.Agi);
end

this.CalculationConditionValue[ECondition.Def] = function(data)
  --防禦
  return Role.player:GetAttribute(EAttribute.Def);
end

this.CalculationConditionValue[ECondition.Hpx] = function(data)
  --體質
  return Role.player:GetAttribute(EAttribute.Hpx);
end

this.CalculationConditionValue[ECondition.Spx] = function(data)
  --能量
  return Role.player:GetAttribute(EAttribute.Spx);
end 

this.CalculationConditionValue[ECondition.Honor] = function(data)
  --官職
  return Role.player:GetAttribute(EAttribute.Honor);
end 

this.CalculationConditionValue[ECondition.RoleCount] = function(data)
  --檢查RoleCount  捕捉100 死亡101 殺區王102 武將列傳108 坐騎109
  return RoleCount.Get(data.conditions.kindValue);
end 

this.CalculationConditionValue[ECondition.MissionFlag] = function(data)
  --任務永標
  if MarkManager.GetMissionFlag(data.conditions.kindValue) then
    return 1;
  else
    return 0;
  end
end

this.CalculationConditionValue[ECondition.MissionStep] = function(data)
  --任務編號步驟
  local missioin = MarkManager.GetMission(data.conditions.kindValue);

  if missioin ~= nil then
    return missioin.step;
  else
    return 0;
  end
end

this.CalculationConditionValue[ECondition.Flag] = function(data)
  --永標
  if BitFlag.Get(data.conditions.kindValue) then
    return 1;
  else
    return 0;
  end
end

this.CalculationConditionValue[ECondition.FriendCount] = function(data)
  --歷史好友最大值
  return Social.maxRecordFriendCount;
end

this.CalculationConditionValue[ECondition.Turn] = function(data)
  --累計等級
  local turn = Role.player:GetAttribute(EAttribute.Turn);
  if turn >= data.conditions.kindValue then
    return  Role.player:GetAttribute(EAttribute.Lv) + (turn * Role.playerMaxLv);
  end

  return 0;
end

this.CalculationConditionValue[ECondition.NowLevel] = function(data)
  --當前等級(不考慮轉生)
  return Role.player:GetAttribute(EAttribute.Lv);
end