PassAwardData = {}
PassAwardData.__index = PassAwardData;

function PassAwardData.GetRShiftB(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function PassAwardData.New(reader)
  local self = {};
  setmetatable(self, PassAwardData);

  self.Id = reader:ReadByte(); --活動ID
  self.Lv = reader:ReadByte(); --等級
  self.Exp = reader:ReadUInt16(); --總積分
  self.itemId = {};
  self.itemQuantity = {};
  self.isTook = {};
  for i = 1, 3 do
    self.itemId[i] = reader:ReadUInt16(); --獎勵道具ID
    self.itemQuantity[i] = reader:ReadUInt32(); --獎勵道具數量
    self.isTook[i] = false; --是否領取
  end
  
  return self;
end

function PassAwardData.GetRShiftA(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function PassAwardData.GetData(Id, Lv)
  for _, v in ipairs(passAwardDatas) do
    if Id == v.Id and  Lv == v.Lv then
      return v;
    end
  end
end

function PassAwardData.GetRShift1(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end


function PassAwardData.GetRShift2(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function PassAwardData.RequestCertainPassDatas(Id)
  local passData = {};
  for _, v in ipairs(passAwardDatas) do
    if Id == v.Id then
      table.insert(passData, v);
    end
  end
  return passData;
end

function PassAwardData.GetRShift4(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function PassAwardData.GetRShift5(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function PassAwardData.GetRShift6(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function PassAwardData.SetFreeTakeStatus(Id, takeLv)
  for _, v in ipairs(passAwardDatas) do
    if Id == v.Id and v.Lv <= takeLv then
      v.isTook[1] = true;
    else
      v.isTook[1] = false;
    end
  end
end

function PassAwardData.SetPaidTakeStatus(Id, takeLv)
  for _, v in ipairs(passAwardDatas) do
    if Id == v.Id and v.Lv <= takeLv then
      v.isTook[2] = true;
      v.isTook[3] = true;
    else
      v.isTook[2] = false;
      v.isTook[3] = false;
    end
  end
end

function PassAwardData.GetRShift7(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end


function PassAwardData.GetRShift8(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function PassAwardData.CheckFreeAwardCanTook(Id, currentLv)
  if currentLv == 0 then return false end;
  for _, v in ipairs(passAwardDatas) do
    if Id == v.Id and v.Lv <= currentLv and v.isTook[1] == false then
      return true;
    end
  end
  return false;
end

function PassAwardData.CheckPaidAwardCanTook(Id, currentLv)
  if currentLv == 0 then return false end;
  for _, v in ipairs(passAwardDatas) do
    if Id == v.Id and v.Lv <= currentLv then
      if  v.isTook[2] == false or v.isTook[3] == false then
        return true;
      end
    end
  end
  return false;
end

function PassAwardData.GetRShift9(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function PassAwardData.GetCurrentPassId()
  local Id = 0;
  for _, v in ipairs(passAwardDatas) do
    if Id ~= v.Id then
      Id = v.Id;
      if activityTimes[Id] ~= nil and activityTimes[Id][1].serverStartTime ~= 0 and DateTime.Compare(CGTimer.serverTime, activityTimes[Id][1].serverStartTime) >= 0 and DateTime.Compare(CGTimer.serverTime, activityTimes[Id][1].serverCloseTime) < 0 then
        return Id;
      end
    end
  end
  
  return 0;
end

function PassAwardData.GetRShiftA9(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end


function PassAwardData.GetRShiftB9(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function PassAwardData.GetRShiftC9(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end