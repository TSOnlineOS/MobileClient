
EDrugAttribute = {
  Atk = 1, --攻擊力
  Int = 2, --知力
  Def = 3, --防禦力
  Agi = 4, --敏捷力
  Hpx = 5, --體質
  Spx = 6, --能量
  Rhp = 7, --回血
  Rsp = 8, --回魔
  Cri = 9, --暴擊機率
  Rev = 10, --復活
}

ETimeBuff = {
  VipBenefit = 1,
  EquipProtect = 2,
  DoubleExp = 3,
  IntUp = 4,
  AtkUp = 5,
  DefUp = 6,
  AgiUp = 7,
  HpxUp = 8,
  SpxUp = 9,
}

EOtherBuff = {
  WorldChannelHorn = 1, --全頻號角
  WorldBoss = 2, --世界王
  OrgWarPrepare = 3, --軍團戰備戰
  HalfMonthCard = 4, --半月卡
}

EFightBuff = {
  Def = 66, --自身防禦 Spec_DefBuff
  Atk = 67, --自身攻擊力 Spec_AtkBuff
  Int = 68, --自身知力 Spec_IntBuff
  Eff = 69, --自身傷害力 Spec_EffBuff
  Imm = 70, --抗封印效果 Spec_ImmBuff
  Cur = 71, --詛咒消耗 Spec_CurBuff
}

DrugBuff = {}
local this = DrugBuff;

this.maxBuffCount = 20;
this.maxBuffKind = 10;

this.openPoints = { 5, 10, 39, 59, 99, 149, 199, 259, 319, 389, 459, 529, 529, 599, 599 };

this.openCount = 0;

this.buffs = {};
for i = 1, this.maxBuffCount do
  this.buffs[i] = {};
  this.buffs[i].id = 0;
  this.buffs[i].count = 0;
end

this.attributes = {};
for i = 1, this.maxBuffKind do
  this.attributes[i] = 0;
end

this.timeBuffs = {};
this.timeBuffs[ETimeBuff.VipBenefit] = { time = nil, value = nil, text = 71269, itemId = 46577 }; --暢玩卡
this.timeBuffs[ETimeBuff.EquipProtect] = { time = nil, value = nil, text = 71359, itemId = 46992 }; --守護者之心
this.timeBuffs[ETimeBuff.DoubleExp] = { time = nil, value = nil, text = 80464, itemId = 46925 }; --經驗加倍
this.timeBuffs[ETimeBuff.IntUp] = { time = nil, value = 0, text = 20037, itemId = 46502 }; --知力上升
this.timeBuffs[ETimeBuff.AtkUp] = { time = nil, value = 0, text = 20038, itemId = 46501 }; --攻擊力上升
this.timeBuffs[ETimeBuff.DefUp] = { time = nil, value = 0, text = 0, itemId = 0 }; --防禦力上升
this.timeBuffs[ETimeBuff.AgiUp] = { time = nil, value = 0, text = 0, itemId = 0 }; --敏捷上升
this.timeBuffs[ETimeBuff.HpxUp] = { time = nil, value = 0, text = 0, itemId = 0 }; --體力增幅上升
this.timeBuffs[ETimeBuff.SpxUp] = { time = nil, value = 0, text = 0, itemId = 0 }; --魔力增幅上升

this.fightBuffs = {};

function DrugBuff.Clear()
  this.openCount = 0;
  
  for k in pairs(this.buffs) do
    this.buffs[k].id = 0;
    this.buffs[k].count = 0;
  end

  for k in pairs(this.attributes) do
    this.attributes[k] = 0;
  end

  for k in pairs(this.timeBuffs) do
    this.timeBuffs[k].time = nil;
    if this.timeBuffs[k].value ~= nil then
      this.timeBuffs[k].value = 0;
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
end

function DrugBuff.SetTimeBuff(kind, time, value)
  if this.timeBuffs[kind] == nil then return end

  if time ~= 0 then
    this.timeBuffs[kind].time = DateTime.FromOADate(time);
    this.timeBuffs[kind].value = value;
  else
    this.timeBuffs[kind].time = nil;

    if value ~= nil then
      this.timeBuffs[kind].value = 0;
    else
      this.timeBuffs[kind].value = nil;
    end
  end
  
  if UI.IsVisible(UIMain) then
    UIMain.UpdateBuff();
  end

  if UI.IsVisible(UIMall) then
    UIMall.RefreshItemPage();
  end
end

function DrugBuff.GetTimeBuff(kind)
  if this.timeBuffs[kind] ~= nil and this.timeBuffs[kind].time ~= nil and DateTime.Compare(CGTimer.serverTime, this.timeBuffs[kind].time) < 0 then
    return this.timeBuffs[kind].time;
  end
  
  return nil;
end

function DrugBuff.CheckTimeBuff()
  local updateUI = false;

  for k, v in pairs(ETimeBuff) do
    if this.timeBuffs[v] ~= nil and this.timeBuffs[v].time ~= nil and DateTime.Compare(CGTimer.serverTime, this.timeBuffs[v].time) > 0 then
      this.timeBuffs[v].time = nil;
      updateUI = true;
    end
  end

  if updateUI and UI.IsVisible(UIMain) then
    UIMain.UpdateBuff();
  end
end

function DrugBuff.SetData(data)
  local count = data:ReadByte();
  for i = 1, count do
    this.buffs[i].id = data:ReadByte();
    this.buffs[i].count = data:ReadByte();

    --計算加總數值
    if evoStatusDatas[this.buffs[i].id] ~= nil then
      this.attributes[evoStatusDatas[this.buffs[i].id].kind] = this.attributes[evoStatusDatas[this.buffs[i].id].kind] + evoStatusDatas[this.buffs[i].id].value;
    end
  end

  if UI.IsVisible(UIMain) then
    UIMain.UpdateBuff();
  end
end

function DrugBuff.SetOpenCount(openCount)
  this.openCount = openCount;

  if UI.IsVisible(UIMain) then
    UIMain.UpdateBuff();
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

function DrugBuff.GetAttribute(kind)
  return 0;
end

function DrugBuff.SetFightBuff(role, kind, value, round)
  local index = 0;
  for k, v in pairs(this.fightBuffs) do
    if v.role == role and v.kind == kind then
      index = k;
      break;
    end
  end

  if round > 0 then
    local buffInfo = nil;
    if index == 0 then
      buffInfo = {};
      table.insert(this.fightBuffs, buffInfo);
    else
      buffInfo = this.fightBuffs[index];
    end

    buffInfo.role = role;
    buffInfo.kind = kind;
    buffInfo.value = value;
    buffInfo.round = FightField.fightRound + round;

    if kind == EFightBuff.Def then
      buffInfo.itemId = 64019;
    elseif kind == EFightBuff.Atk then
      buffInfo.itemId = 64020;
    elseif kind == EFightBuff.Int then
      buffInfo.itemId = 64021;
    elseif kind == EFightBuff.Eff then
      buffInfo.itemId = 64022;
    elseif kind == EFightBuff.Imm then
      buffInfo.itemId = 64023;
    elseif kind == EFightBuff.Cur then
      buffInfo.itemId = 64024;
    else
      buffInfo.itemId = 0;
    end
  else
    if index == 0 then return end

    table.remove(this.fightBuffs, index);
  end

  if UI.IsVisible(UIMain) then
    UIMain.UpdateBuff();
  end
end

function DrugBuff.ClearFightBuff()
  table.Clear(this.fightBuffs);
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
  if UI.IsVisible(UIMain) then
    UIMain.UpdateBuff();
  end
end