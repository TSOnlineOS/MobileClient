FurnitureData = {}
FurnitureData.__index = FurnitureData;

function FurnitureData.GetRShifta(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function FurnitureData.New(reader)
  local self = {};
  setmetatable(self, FurnitureData);

  self.Id = reader:ReadUInt16(); --[2]編號
  self.type = reader:ReadByte(); --[3]主分類 (放置位置) 1 = 地上 , 2 = 牆壁
  self.kind = reader:ReadByte(); --[4]類型
  self.faceTo = reader:ReadByte(); --[5]面向 2=側面 4=側面+背面
  self.dynamic = reader:ReadByte(); --[6]動態 0=進場景後不會持續動,1=進場景後持續動
  self.interactive = reader:ReadByte(); --[7]互動
  self.action = reader:ReadByte(); --[8]動作
  self.emoji = reader:ReadByte(); --[9]表情
  self.replay_GIF = reader:ReadByte(); --[10]互動圖循環
  self.playRound_GIF = reader:ReadByte(); --[11]互動圖播放回合
  self.playSpeed_GIF = reader:ReadByte(); --[12]互動圖速度
  self.musicName = LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16())); --[13]音樂檔編號
  self.replay_Music = reader:ReadByte(); --[14]音樂循環
  self.interactivePointCount = reader:ReadByte(); --[15]互動點數量
  self.firstInteractivePoint_X = reader:ReadInt16(); --[16]第一互動點X偏移
  self.firstInteractivePoint_Y = reader:ReadInt16(); --[17]第一互動點Y偏移
  self.secondInteractivePoint_X = reader:ReadInt16(); --[18]第二互動點X偏移
  self.secondInteractivePoint_Y = reader:ReadInt16(); --[19]第二互動點Y偏移
  self.level = reader:ReadByte(); --[20]品階
  self.seriesNumber = reader:ReadUInt16(); --[21]系列編號
  self.occupyBlockX = reader:ReadByte(); --[22]占用格數X軸
  self.occupyBlockY = reader:ReadByte(); --[23]占用格數Y軸
  self.decorateScore = reader:ReadByte(); --[24]裝潢分數
  self.addedOrder = reader:ReadInt16(); --[25]order附加值
  self.limited = reader:ReadByte(); --[26]限定商品 0=否, 1=是
  self.message = LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16())); --[27]要顯示的訊息
  self.effectId = reader:ReadInt16();

  return  self.Id, self;
end

function FurnitureData.GetRShiftB(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function FurnitureData.GetRShiftD(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function FurnitureData.GetRShiftE(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end