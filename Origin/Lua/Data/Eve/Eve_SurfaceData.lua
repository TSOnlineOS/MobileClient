SurfaceData = {}
SurfaceData.__index = SurfaceData

function SurfaceData.Script4()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function SurfaceData.New(reader) 
  local self = {};
  setmetatable(self, SurfaceData);
  
  local id = reader:ReadUInt16(); --互動編號
  reader:ReadUInt16(); --關聯次數(沒有在用)
  self.sentenceCount = reader:ReadByte(); --Sentence數量

  self.optionIndex = reader:ReadByte(); --第一個選項在Sentence[]的index
  self.optionCount = reader:ReadByte(); --選項的個數
  self.optionMode = reader:ReadByte(); --選單觸發時 0.無, 1.買賣視窗, 2.招兵生產

  self.sentences = {};
	
  local ignoreCount = 0;
  for i = 1, self.sentenceCount  do
    local sentence = {};

    sentence.dataId = reader:ReadUInt16(); --DB編號
    sentence.dataKind = reader:ReadByte(); --1:Talk.dat 2:Item.dat 3:Npc.dat
    sentence.style = reader:ReadByte(); --1:Lable 2:Button 3:ListItem
    sentence.canCut = reader:ReadBoolean(); --False:不換行, True:換行 (只給Botton使用)

    if sentence.style == 3 and sentence.dataKind == 1 and sentence.dataId == 20393 then
      ignoreCount = ignoreCount + 1;
    else
      self.sentences[i] = sentence;
    end
  end

  self.sentenceCount = self.sentenceCount - ignoreCount;

  return id, self;
end

function SurfaceData.Script5()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function SurfaceData.Script6()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end