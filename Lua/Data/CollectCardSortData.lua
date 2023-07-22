
CollectCardSortData = {}
CollectCardSortData.__index = CollectCardSortData;

function CollectCardSortData.New(reader)
  local self = {};
  self.id = reader:ReadUInt16();
  self.warriorId = reader:ReadUInt16();  
  self.roleCount = reader:ReadUInt16();
  self.getFlag = reader:ReadUInt16();
  return self;
end

function CollectCardSortData.GetRShiftAs(bitrshift1, bitrshift2)
  local rshiftN = 0
  bit.rshift(rshiftN, bitrshift1)
  bit.rshift(rshiftN, bitrshift2)
  
  return rshiftN
end

function CollectCardSortData.GetRShiftBs(bitrshift1, bitrshift2)
  local rshiftN = 0
  bit.rshift(rshiftN, bitrshift1)
  bit.rshift(rshiftN, bitrshift2)
  
  return rshiftN
end

function CollectCardSortData.GetRShift2Cs(bitrshift1, bitrshift2)
  local rshiftN = 0
  bit.rshift(rshiftN, bitrshift1)
  bit.rshift(rshiftN, bitrshift2)
  
  return rshiftN
end