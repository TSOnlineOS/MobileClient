
--家具種類的類型，同類型的家具不能疊一起
EFurnitureKindType = {
  Decorate = 1; --裝潢
  Carpet = 2; --地毯
  Furniture = 3; --家具
}

EHouseEditorMainKind = {
  All = 0, --全部
  FurnishingKind = 1, --家飾類
  DecorateKind = 2, --裝潢類
}

EFurnishingSubKind = {
  Series = 1, --系列
  FurnitureKind = 2, --家具類
  OrnamentKind = 3, --裝飾類
}

EDecorateSubKind = {
  DecorateKind = 1, --裝潢類
}

FurnitureKindData = {}
FurnitureKindData.__index = FurnitureKindData;
local this = FurnitureKindData;

function FurnitureKindData.GetRShiftB(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function FurnitureKindData.GetRShiftBA(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function FurnitureKindData.GetRShiftBC(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function FurnitureKindData.New(reader)
  local self = {};
  setmetatable(self, FurnitureKindData);

  self.Id = reader:ReadByte(); --[1]編號
  self.kindName = LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16())); --[2]種類名稱
  self.pictureName = LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16())); --[3]圖檔名稱
  self.type = reader:ReadByte(); --[4]分類，同分類的家具不能疊一起
  self.mainKind = reader:ReadByte(); --[5]主類型
  self.furnishingSubKind = reader:ReadByte(); --[6]家飾次類型
  self.decorateSubKind = reader:ReadByte(); --[7]裝潢次類型

  self.mainKinds = this.GetSeparateNumber(self.mainKind);
  self.furnishingSubKinds = this.GetSeparateNumber(self.furnishingSubKind);
  self.decorateSubKinds = this.GetSeparateNumber(self.decorateSubKind);

  return self.Id, self;
end

function FurnitureKindData.GetRShiftU(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function FurnitureKindData.GetSeparateNumber(number)
  local Count = 1;
  local numbers = {};

  numbers[0] = 0;

  while number ~= 0 do
    if number % 2 ~= 0 then
      number = number - 1;
      numbers[Count] = Count;
    end

    number = number / 2;
    Count = Count + 1;
  end

  return numbers
end

function FurnitureKindData.GetRShift1(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function FurnitureKindData.GetRShiftB2(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function FurnitureKindData.GetRShiftB3(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function FurnitureKindData.GetRShiftB4(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function FurnitureKindData.GetTypeByFurnitureDataKind(furnitureDataKind)
  for k, v in pairs(furnitureKindDatas) do
    if v.Id == furnitureDataKind then
      return v.type;
    end
  end
end

function FurnitureKindData.GetMainKindsByFurnitureDataKind(furnitureDataKind)
  for k, v in pairs(furnitureKindDatas) do
    if v.Id == furnitureDataKind then
      return v.mainKinds;
    end
  end
end

function FurnitureKindData.GetRShiftB5(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function FurnitureKindData.GetRShiftB6(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function FurnitureKindData.GetRShiftB7(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function FurnitureKindData.GetRShiftB8(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end