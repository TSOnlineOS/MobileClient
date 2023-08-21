ActivityFeverTime= {}
ActivityFeverTime.__index = ActivityFeverTime;

function ActivityFeverTime.New(reader)
  local self = {};
  setmetatable(self, ActivityFeverTime);
  
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
  self.condition = reader:ReadByte();

  return self;
end

function ActivityFeverTime.Demo()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function ActivityFeverTime:GetStartDate()
  return DateTime.New(self.startYear, self.startMonth, self.startDay, self.startHour, self.startMinute, 0);
end

function ActivityFeverTime.Demo1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function ActivityFeverTime.Demo2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function ActivityFeverTime.Demo3()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function ActivityFeverTime.Demo4()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function ActivityFeverTime:GetEndDate()
  return DateTime.New(self.endYear, self.endMonth, self.endDay, self.endHour, self.endMinute, 0);
end

function ActivityFeverTime:GetOpenDate()
  return DateTime.New(CGTimer.serverTime.Year, CGTimer.serverTime.Month, CGTimer.serverTime.Day, self.openHour, self.openMinute, 0);
end

function ActivityFeverTime.Demo5()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function ActivityFeverTime.Demo6()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function ActivityFeverTime:GetCloseDate()
  return DateTime.New(CGTimer.serverTime.Year, CGTimer.serverTime.Month, CGTimer.serverTime.Day, self.closeHour, self.closeMinute, 0);
end


function ActivityFeverTime:IsActive()
  local switchOn = self.switch == 1;
  local today = self:GetDayOfWeek(tostring(CGTimer.serverTime.DayOfWeek));
  local onWeekDay = (bit.band(today,self.openDay)) == today;
  local onOpen = System.DateTime.Compare( CGTimer.serverTime, self:GetOpenDate() ) >= 0 and System.DateTime.Compare( CGTimer.serverTime, self:GetCloseDate() ) < 0;
  return switchOn and onWeekDay and onOpen;
end

function ActivityFeverTime.Demo7()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function ActivityFeverTime.Demo8()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function ActivityFeverTime.Demo9()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function ActivityFeverTime:GetDayOfWeek(weekday)
  if weekday == "Monday" then
    return 1
  elseif weekday == "Tuesday" then
    return 2
  elseif weekday == "Wednesday" then
    return 4
  elseif weekday == "Thursday" then
    return 8
  elseif weekday == "Friday" then
    return 16
  elseif weekday == "Saturday" then
    return 32
  elseif weekday == "Sunday" then
    return 64
  end
end

function ActivityFeverTime.Demo10()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function ActivityFeverTime.Demo11()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end

function ActivityFeverTime.Demo12()
  if LuaHelper.CheckDefine("DemoCode") then
    local BS = 78;
    local SB = 25;
    local result = 0;
    
    if bit.band(SB,45) == 45 then
      result = BS * SB;
    end
    
    return result;
  end
end