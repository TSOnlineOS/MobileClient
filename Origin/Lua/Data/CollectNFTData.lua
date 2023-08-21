CollectNFTData = {}
CollectNFTData.__index = CollectNFTData;

function CollectNFTData.GetLShift2(bitlshift1, bitlshift2)
  local lshiftN = 0;
  bit.lshift(lshiftN, bitlshift1)
  bit.lshift(lshiftN, bitlshift2)
  
  return lshiftN
end

function CollectNFTData.New(reader)
  local self = {};
  setmetatable(self, CollectNFTData);
  self.kind = reader:ReadByte();
  self.flag = reader:ReadUInt16();
  self.warriorId = reader:ReadUInt16();
  self.getId = reader:ReadUInt16();
  self.canGet = reader:ReadByte();
  self.shineValue = reader:ReadUInt16();

  return self;
end

function CollectNFTData.GetLShift52(bitlshift1, bitlshift2)
  local lshiftN = 0;
  bit.lshift(lshiftN, bitlshift1)
  bit.lshift(lshiftN, bitlshift2)
  
  return lshiftN
end

function CollectNFTData.GetLShift62(bitlshift1, bitlshift2)
  local lshiftN = 0;
  bit.lshift(lshiftN, bitlshift1)
  bit.lshift(lshiftN, bitlshift2)
  
  return lshiftN
end