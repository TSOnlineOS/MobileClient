DataFight = {};
local this = DataFight;

--const
this.maxEnemy = 5;
this.maxDailyFightTimes = 5;
this.maxTeamNpc = 4;
this.maxTeamSkill = 5;
this.classRange = 3;

--var
this.class = 0;
this.score = 0;
this.todayScore = 0;
this.todayAwardIndex = 0;
this.rank = 0;
this.awardAvailible = false;
this.npcFightCount = 0;

this.enemyInfos = {};
this.historyInfos = {};
this.teamInfos = {};

function DataFight.Clear()
  this.class = 0;
  this.score = 0;
  this.todayScore = 0;
  this.todayAwardIndex = 0;
  this.rank = 0;
  this.awardAvailible = false;
  
  table.Clear(this.enemyInfos);
  table.Clear(this.historyInfos);
  table.Clear(this.teamInfos);
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

function DataFight.SetPlayerData(class, score, rank, awardRank, awardAvailible, todayScore, todayAwardIndex, npcFightCount)
  this.class = class;
  this.score = score;
  this.todayScore = todayScore;
  this.todayAwardIndex = todayAwardIndex;
  this.rank = rank;
  this.awardRank = awardRank;
  this.awardAvailible = awardAvailible;
  this.npcFightCount = npcFightCount;

  if UI.IsVisible(UIDataFight) then
    UIDataFight.UpdateUI();
  else
    UI.Open(UIDataFight);
  end
end

function DataFight.AddEnemy(playerInfo)
  this.enemyInfos[playerInfo.index] = playerInfo;

  if UI.IsVisible(UIDataFight) then
    UIDataFight.UpdateUI();
  end
end

function DataFight.AddHistory(playerInfo)
  local key = nil;
  for k, v in pairs(this.historyInfos) do
    if v.index == playerInfo.index then
      key = k;
      break;
    end
  end

  if key ~= nil then
    this.historyInfos[key] = playerInfo;
  else
    table.insert(this.historyInfos, 1, playerInfo);
  end

  if UI.IsVisible(UIDataFight) then
    UIDataFight.UpdateUI();
  end
end

function DataFight.ClearTeam(index)
  if index ~= nil then
    this.teamInfos[index] = nil;
  else
    table.Clear(this.teamInfos);
  end
end

function DataFight.SetTeam(index, npcId, level, hp, extraSkills, skills)
  if this.teamInfos[index] == nil then
    this.teamInfos[index] = {};
  end

  this.teamInfos[index].npcId = npcId;
  this.teamInfos[index].level = level;
  this.teamInfos[index].hp = hp;
  this.teamInfos[index].extraSkills = extraSkills;
  this.teamInfos[index].skills = skills;
  
  if UI.IsVisible(UIDataFight) then
    UIDataFight.UpdateTeam(true);
  end
end

function DataFight.SetClassTexture(rawImage, class)
  if class > 0 then
    TextureManager.SetPng(ETextureUseType.UI, string.format("DataFight_Class_%d", math.floor((class - 1) / this.classRange) + 1), rawImage);
  else
    TextureManager.SetPng(ETextureUseType.UI, "DataFight_Class_6", rawImage);
  end
end