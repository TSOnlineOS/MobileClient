ActivityTime= {}
ActivityTime.__index = ActivityTime;

function ActivityTime.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
  
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function ActivityTime.New(reader)
  local self = {};
  setmetatable(self, ActivityTime);
  
  self.Id = reader:ReadUInt16();--活動ID
  self.switch = reader:ReadByte();--開關(0:關，1:開，2:開服活動，3:??，4:跨天活動)
  self.startYear = reader:ReadUInt16();--開始年
  self.startMonth = reader:ReadByte();--開始月
  self.startDay = reader:ReadByte();--開始日
  self.startHour = reader:ReadByte();--開始時
  self.startMinute = reader:ReadByte();--開始分
  self.endYear = reader:ReadUInt16();--結束年
  self.endMonth = reader:ReadByte();--結束月
  self.endDay = reader:ReadByte();--結束日
  self.endHour = reader:ReadByte();--結束時
  self.endMinute = reader:ReadByte();--結束分
  self.openDay = reader:ReadByte();--開啟日
  self.openHour = reader:ReadByte();--時段1(時)
  self.openMinute = reader:ReadByte();--時段1(分)
  self.closeHour = reader:ReadByte();--結束時段1(時)
  self.closeMinute = reader:ReadByte();--結束時段1(分)
  self.serverStartTime = 0;
  self.serverCloseTime = 0;
  self.state = 0;

  return self;
end

function ActivityTime.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function ActivityTime.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function ActivityTime.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function ActivityTime.Trash4()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function ActivityTime:GetStartDate()
  return DateTime.New(self.startYear, self.startMonth, self.startDay, self.startHour, self.startMinute, 0);
end

function ActivityTime.Trash5()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function ActivityTime:GetEndDate()
  return DateTime.New(self.endYear, self.endMonth, self.endDay, self.endHour, self.endMinute, 0);
end

function ActivityTime.Trash6()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function ActivityTime.Trash7()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function ActivityTime:IsActive()
  return self.switch == 1 and System.DateTime.Compare( CGTimer.serverTime, self:GetStartDate() ) >= 0 and System.DateTime.Compare( CGTimer.serverTime, self:GetEndDate() ) < 0;
end

function ActivityTime.Trash8()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function ActivityTime.Trash9()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end
