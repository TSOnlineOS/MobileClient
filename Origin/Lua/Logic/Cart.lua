
Cart = {}
local this = Cart;

--var
this.followNpcs = {};

function Cart.Clear()
  table.Clear(this.followNpcs);
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

function Cart.AddNpc(index, npcId, level, hp, name)
  if this.followNpcs[index] == nil then
    this.followNpcs[index] = {};
  end

  this.followNpcs[index].npcId = npcId;
  this.followNpcs[index].Lv = level;
  this.followNpcs[index].hp = hp;
  this.followNpcs[index].name = name;

  if UI.IsVisible(UITeam) then
    UITeam.UpdateUI();
  end
end

function Cart.RemoveNpc(index)
  if this.followNpcs[index] == nil then return end

  this.followNpcs[index] = nil;

  if UI.IsVisible(UITeam) then
    UITeam.UpdateUI();
  end
end

function Cart.GetCartNpcId(turn, career)
  if turn == 1 then
    return 30006;
  elseif turn == 2 then
    if career == ECareer.XiaKe then
      return 30014;
    elseif career == ECareer.BaWang then
      return 30016;
    elseif career == ECareer.XianShi then
      return 30013;
    elseif career == ECareer.DiXian then
      return 30015;
    end
  elseif turn == 3 then
    if career == ECareer.XiaKe then
      return 30019;
    elseif career == ECareer.BaWang then
      return 30021;
    elseif career == ECareer.XianShi then
      return 30018;
    elseif career == ECareer.DiXian then
      return 30020;
    end
  end

  return 0;
end

function Cart.GetCartSize()
  if Role.player == nil or Role.player:GetAttribute(EAttribute.Turn) < 1 then
    return 0;
  end

  if Role.player:GetAttribute(EAttribute.Turn) < 2 then
    return 2;
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
  return 4;
end