CompoundData = {}
CompoundData.__index = CompoundData;

function CompoundData.GetRShift(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function CompoundData.GetRShifts(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function CompoundData.New(reader)
  local self = {};
  setmetatable(self, CompoundData);

  self.compoundD = reader:ReadUInt16(); --[1]合成類別D1短刀 2劍 3短戟 4大刀 5槍矛 6長戟 7弓弩 8琴 9書 10衣服 11頭飾 12護腕 13靴子 14特殊物  15附加羽毛 16符咒 17食物 18補藥 19毒藥 20信物a 21信物b 22信物c 23雜物 24陶土 25木材 26硬殼 27骨骼 28金屬 29結晶  30皮毛 31布匹 32紙 33竹 34植物 35礦石 36冰 37特技神器
  self.materialA = reader:ReadByte();   --[2] 材質A(1金屬 2石 3木4紙 5布 6皮7食物8土壤9水10結晶11硬殼12骨…)
  self.materialB = reader:ReadByte();   --[3] 材質A(1金屬 2石 3木4紙 5布 6皮7食物8土壤9水10結晶11硬殼12骨…)
  self.materialC = reader:ReadByte();   --[4] 材質A(1金屬 2石 3木4紙 5布 6皮7食物8土壤9水10結晶11硬殼12骨…)
  self.aDegree = reader:ReadByte();     --[5] A比 (0~5)
  self.bDegree = reader:ReadByte();     --[6] B比 (0~5)
  self.cDegree = reader:ReadByte();     --[7] C比 (0~5)

  return self;
end

function CompoundData.GetRShiftg(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end