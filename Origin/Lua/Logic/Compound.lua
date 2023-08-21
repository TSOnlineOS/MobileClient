
Compound = {}
local this = Compound;

function Compound.CheckEnhanceMaterialItem(item)
  return item.elementValue > 0 or item.proofKind > 0 or item.stoneLv > 0 or item.Reinforced > 0 or item.affix1 > 0 or item.affix2 > 0 or item.affix3 > 0;
end

--取靈石屬性
function Compound.GetStoneAttr(itemId)
  local itemData = itemDatas[itemId];
  if itemData ~= nil and Between(itemData.spare3, 1, Item.MaxStoneAttrKind) then
    return itemData.spare3;
  else
    return 0;
  end
end

--取靈石種類
function Compound.GetStoneKind(itemId)
  local itemData = itemDatas[itemId];
  if itemData ~= nil and Between(itemData.threshold, 1, Item.MaxStoneKind) then
    return itemData.threshold;
  else
    return 0;
  end
end

--取靈石參考
function Compound.GetStoneLink(itemId)
  if itemDatas[itemId].skillLink == nil then return 0 end

  local result = 0;
  local stoneKind = this.GetStoneKind(itemId);
  if Contains(stoneKind, 1, 2) then
    result = itemDatas[itemId].skillLink;
  elseif stoneKind == 3 then
    result = itemDatas[itemId].skillLink;

    if result > Item.MaxStoneRateUp then
      result =Item.MaxStoneRateUp;
    end
  elseif stoneKind == 4 and Between(itemDatas[itemId].skillLink, 1, Item.MaxStoneLv) then
    result = itemDatas[itemId].skillLink;
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

--檢查靈石合成裝備限制
function Compound.CheckEquipLimit(equipId, stoneId)
  local shrNum = 0;

  --靈石合成裝備限制 (0:通用 1:武器 2:頭部 4:手套 8:衣服 16: 靴子 32:備用1 64: 備用2 128:備用3)
  local limit = this.GetStoneLink(stoneId);
  if limit == 0 then
    return true;
  end

  local fitType = itemDatas[equipId].fitType;
  if fitType == 1 then
    shrNum = 1;
  elseif fitType == 2 then
    shrNum = 3;
  elseif fitType == 3 then
    shrNum = 0;
  elseif fitType == 4 then
    shrNum = 2;
  elseif fitType == 5 then
    shrNum = 4;
  else
    return false;
  end

  local bit = bit.band(bit.rshift(limit, shrNum), 1);
  if bit == 1 then
    return true;
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
  return false;
end

--取靈石合成規則
function Compound.GetMixRule(stoneCnt, equipCnt)
  local isConform = true;
  local result = 0;

  for i = 1, Item.MaxMixStoneRules do
    isConform = true;

    --比對靈石合成規則
    for j = 1, Item.MaxStoneKind do --1一般靈石 2祝福靈石 3加機率 4指定階層
      if stoneCnt[j] ~= nil and stoneCnt[j] ~= Item.MixStoneTable[i][j] then
        isConform = false;
        break;
      end
    end

    --找到符合靈石合成規則
    if isConform then
      --符合規則且裝備數量1
      if equipCnt == 1 then
        return i;
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

function Compound.GetStoneString(stoneArrt, isContent)
  local str = "";
  if stoneArrt == 1 then
    str = string.Get(80311);
  elseif stoneArrt == 2 then
    if isContent == true then
      str = string.Get(80335);  --攻擊力
    else
      str = string.Get(80312);  --攻擊
    end
  elseif stoneArrt == 3 then
    if isContent == true then
      str = string.Get(80334);
    else
      str = string.Get(80313);
    end
  elseif stoneArrt == 4 then
    str = string.Get(80314);
  elseif stoneArrt == 5 then
    str = string.Get(80315);
  elseif stoneArrt == 6 then
    if isContent == true then
      str = string.Get(80336);
    else
      str = string.Get(80316);
    end
  elseif stoneArrt == 7 then
    if isContent == true then
      str = string.Get(24122);
    else
      str = string.Get(80317);
    end
  end

  return str;
end