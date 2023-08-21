
--七星命盤
EAstrolabeAttribute = {
  Hpx = 1, --體質
  Def = 2, --防禦力
  Int = 3, --知力
  Spx = 4, --能量
  Agi = 5, --敏捷力
  Atk = 6, --攻擊力
  Criticle = 7, --暴擊機率
}

Astrolabe = {}
local this = Astrolabe;

--const
this.maxAstrolabe = 7;
this.maxAstrolabeLv = 10;
this.levelUpShowTime = 2;
this.maxNatalPoint = 65535;

--var
this.natalPoint = 0;
this.starLv = { 0, 0, 0, 0, 0, 0, 0 };

function Astrolabe.Clear()
  for i = 1, this.maxAstrolabe do
    this.starLv[i] = 0;
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
end

function Astrolabe.SetPoint(value)
  this.natalPoint = value;

  if UI.IsVisible(UIStatus) then
    UIStatus.UpdateUI();
  end
end

function Astrolabe.SetLv(data)
  local isLevelUp = data:ReadBoolean();
  for i = 1, this.maxAstrolabe do
    this.starLv[i] = data:ReadByte();
  end
  
  if UI.IsVisible(UIStatus) then
    if isLevelUp then
      UIStatus.AstrolabeLevelUp();
    end
    
    UIStatus.UpdateUI();
  end

  if Role.player ~= nil then
    Role.player:SetAttribute(EAttribute.MaxHp, Calc.GetMaxHp(Role.player));
    Role.player:SetAttribute(EAttribute.MaxSp, Calc.GetMaxSp(Role.player));
  end
end

function Astrolabe.GetAttribute(kind, level)
  if astrolabeDatas[kind] == nil then return 0 end

  if level == nil then
    level = this.starLv[kind];
  end

  if astrolabeDatas[kind].attributes[level] == nil then return 0 end

  local value = 0;
  for i = 1, level do
    if astrolabeDatas[kind].attributes[i] ~= nil then
      value = value + astrolabeDatas[kind].attributes[i].value;
    end
  end

  return value;
end

function Astrolabe.FindNextStar()
  local result = 1;
  if this.starLv[1] == this.starLv[this.maxAstrolabe] then return result end

  for i = 2, this.maxAstrolabe do
    if this.starLv[i] < this.starLv[i - 1] then
      result = i;
      break;
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