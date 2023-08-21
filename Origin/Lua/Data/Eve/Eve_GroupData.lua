GroupData = {}
GroupData.__index = GroupData

function GroupData.GetLShift4(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end

function GroupData.New(reader) 
  local self = {};
  setmetatable(self, GroupData);
  
  self.EveNo = reader:ReadUInt16();
  self.EventNo = reader:ReadUInt16();
  self.ConditionNo = reader:ReadByte();
  self.UseMode = reader:ReadByte();
  self.MemberNum = reader:ReadByte();
  self.MemberNoAy = {}
  for i = 1, self.MemberNum do
	self.MemberNoAy[i] = reader:ReadByte();
  end
  self.ProbabilityRateAy = {}
  for i = 1, self.MemberNum do
    self.ProbabilityRateAy[i] = reader:ReadByte();
  end		
  self.PickMember = reader:ReadByte();

  return self;
end

function GroupData.GetLShift1(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end

function GroupData.GetLShift2(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end

function GroupData.GetLShift3(bitlshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoThrArea = 0;
    bit.lshift(DemoThrArea, bitlshift)
    
    return DemoThrArea
  end
end
