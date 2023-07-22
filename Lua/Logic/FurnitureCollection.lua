EFurnitureCollectAttribute = {
  LV = 1,         --等級
  Score = 2,      --目前分數
  LevelScore = 3, --目標分數
  FurnitureKindCount = 4, --家具種類數量
}

EFurnitureCollectKind = {
  FurnitureKind = 1, --家具分類
  OrnamentKind = 2,  --裝飾分類
  DecorateKind = 3,  --裝潢分類
}

FurnitureCollection = {};
local this = FurnitureCollection;

local attributes = {};
local maxLevel = 0;

function FurnitureCollection.Initialize()
  this.CLear();
  maxLevel = table.Count(furnitureCollectLevelDatas);
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

function FurnitureCollection.CLear()
  attributes[EFurnitureCollectAttribute.LV] = 0;
  attributes[EFurnitureCollectAttribute.Score] = 0;
  attributes[EFurnitureCollectAttribute.LevelScore] = furnitureCollectLevelDatas[1].score;
  attributes[EFurnitureCollectAttribute.FurnitureKindCount] = 0;
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

function FurnitureCollection.SetCollectAttribute(attributeKind, number)
  attributes[attributeKind] = number;

  if attributeKind == EFurnitureCollectAttribute.Score then
    if attributes[EFurnitureCollectAttribute.Score] >= attributes[EFurnitureCollectAttribute.LevelScore] then
      this.ResetScoreAndLv();
    end
  end
end

function FurnitureCollection.GetCollectAttribute(kind)
  if attributes[kind] == nil then
    return 0;
  else
    return attributes[kind];
  end
end

function FurnitureCollection.GetFurnitureCollectionData()
  local list = {};

  list[EFurnitureCollectKind.FurnitureKind] = {};
  list[EFurnitureCollectKind.OrnamentKind] = {};
  list[EFurnitureCollectKind.DecorateKind] = {};

  list[EFurnitureCollectKind.FurnitureKind].title = string.Get(23533);
  list[EFurnitureCollectKind.OrnamentKind].title = string.Get(23534);
  list[EFurnitureCollectKind.DecorateKind].title = string.Get(23535);

  list[EFurnitureCollectKind.FurnitureKind].furniture = {};
  list[EFurnitureCollectKind.OrnamentKind].furniture = {};
  list[EFurnitureCollectKind.DecorateKind].furniture = {};

  for k, v in pairs(FurnitureManager.GetAllFurnitures()) do
    if furnitureDatas[k] ~= nil then
      local index = this.GetFurnitureCollectKind(furnitureDatas[k].kind);
      if index ~= 0 then
        table.insert(list[index].furniture, k);
      end
    end
  end

  for i = 1, table.Count(EFurnitureCollectKind) do
    table.sort(list[i].furniture, function(a, b)
      if furnitureDatas[a].decorateScore == furnitureDatas[b].decorateScore then
        return a < b;
      end

      return furnitureDatas[a].decorateScore > furnitureDatas[b].decorateScore;
    end
    );
  end

  return list;
end

function FurnitureCollection.GetFurnitureCollectKindMaxCount(kind)
  local count = 0;
  for k, v in pairs(furnitureDatas) do
    if kind == this.GetFurnitureCollectKind(v.kind) then
      count = count + 1;
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
  return count;
end

function FurnitureCollection.GetFurnitureCollectKind(furnitureDataKind)
  for k, v in pairs(furnitureKindDatas) do
    if v.Id == furnitureDataKind then
      if v.mainKind == EHouseEditorMainKind.DecorateKind then
        return EFurnitureCollectKind.DecorateKind;
      elseif v.mainKind == EHouseEditorMainKind.FurnishingKind then
        if v.furnishingSubKind == EFurnishingSubKind.FurnitureKind then
          return EFurnitureCollectKind.FurnitureKind;
        elseif v.furnishingSubKind == EFurnishingSubKind.OrnamentKind + 1 then    --串表裝潢分類數字是4所以要+1
          return EFurnitureCollectKind.OrnamentKind;
        end
      end
    end
  end

  return 0;
end

function FurnitureCollection.ResetScoreAndLv()
  for index = table.Count(furnitureCollectLevelDatas), 1, -1 do
    if attributes[EFurnitureCollectAttribute.Score] >= furnitureCollectLevelDatas[index].score then
      attributes[EFurnitureCollectAttribute.LV] = furnitureCollectLevelDatas[index].level;
      if furnitureCollectLevelDatas[index + 1] ~= nil then
        attributes[EFurnitureCollectAttribute.LevelScore] = furnitureCollectLevelDatas[index + 1].score;
      else
        attributes[EFurnitureCollectAttribute.LevelScore] = furnitureCollectLevelDatas[index].score;
      end
      break
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