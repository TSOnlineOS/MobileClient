SoulData = {}
SoulData.__index = SoulData;

function SoulData.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function SoulData.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function SoulData.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function SoulData.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function SoulData.New(reader)
  local self = {};
  setmetatable(self, SoulData);

  self.quality = reader:ReadByte(); --靈魂品質(1.白 2.綠 3.藍 4.紫)
  self.startPoint = reader:ReadUInt16();  --初始總點數
  self.basicLvLimit = reader:ReadUInt16();  --基礎等級上限
  self.skill1GetProb = reader:ReadUInt16(); --技能1獲得機率
  self.skill2GetProb = reader:ReadUInt16(); --技能2獲得機率
  self.skill3GetProb = reader:ReadUInt16(); --技能3獲得機率
  self.skill4GetProb = reader:ReadUInt16(); --技能4獲得機率

  self.convertRate = {};  --轉化率

  for i = 0, 5 do --無～五星
    self.convertRate[i] = reader:ReadUInt16();
  end

  self.compoundHigherProb = reader:ReadUInt16();  --合成獲得高一品質的機率
  self.limitBreakthrough = reader:ReadByte(); --最大突破上限

  return self.quality, self;
end