Breakthrough = {};
local this = Breakthrough;
local breakthroughTurn = 3;
local breakthroughLevel;
local breakthroughData = {};
local breakthroughFlag = false;
local breakthroughEXP;

function Breakthrough.CheckBreakthrough()
  if breakthroughFlag == false then return false end
  local turn = Role.player:GetAttribute(EAttribute.Turn);
  local level = Role.player:GetAttribute(EAttribute.Lv) - Role.playerMaxLv;
  return turn >= breakthroughTurn and level >= (Role.playerMaxLv + Role.playerTurn3MaxLv)
end

function Breakthrough.SetBreakthroughLevel(level)
  breakthroughLevel = level;
end

function Breakthrough.InitBreakthroughData()
  breakthroughData = breakthroughDatas;
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

function Breakthrough.SetBreakthroughFlag(flag)
  if breakthroughFlag ~= flag then
    breakthroughFlag = flag;
    if UI.IsVisible(UIStatus) then
      UIStatus.OnVisible(true);
      UIStatus.UpdateUI();
    end
  end
end

function Breakthrough.GetBreakthroughLevel()
  return breakthroughLevel;
end

function Breakthrough.GetBreakthroughLevelText()
  return string.format(string.Get(23570), RoleCount.Get(697));
end

function Breakthrough.GetBreakthrough(level)
  return breakthroughData[level]
end

function Breakthrough.GetBreakthroughCount()
  return breakthroughLevel
end

function Breakthrough.UpdateBreakthroughBar()
  local exp = breakthroughEXP;

  for _, v in ipairs(breakthroughData) do
    if exp >= v.exp then
      v.currentExp = v.exp;
      v.expValueText = "100%";
      v.expFullValueText = string.Get(40475);
      v.complete = true;
    else
      v.currentExp = math.max(exp, 0);
      v.expValueText = string.Concat(math.floor((v.currentExp / v.exp) * 100), "%");
      v.expFullValueText = string.Concat(v.currentExp, "/", v.exp);
      v.complete = false;
    end
    exp = exp - v.exp;
  end
end

function Breakthrough.UpdateBreakthrough(exp)
  if exp == nil then return end

  if breakthroughEXP ~= nil then
    local diff = exp - breakthroughEXP;
    if diff > 0 then
      local message = string.format(string.Get(40476), Role.player.name, diff);
      Chat.AddMessage(EChannel.System, message);
      ShowCenterMessage(message);
    end
  end

  breakthroughEXP = exp;

  if breakthroughEXP >= BreakthroughData.GetMaxEXP() then
    RedDot.Add(ERedDot.Breakthrough);
  end

  if UI.IsVisible(UIStatus) then
    this.UpdateBreakthroughBar();
    UIStatus.RefreshBreakthrough();
  end
end

function Breakthrough.Clear()
  breakthroughEXP = nil;
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