
EStoreKind = {
  Mall = 1,   --一般商城
  NTD = 2,    --大版面禮包
  Cash = 3,   --儲值
  NTD2 = 4,   --全版面禮包
  Doro = 5,   --抽卡
  Organization = 6, --軍團
  PVP = 7, --PVP
}

GoodsSaleTagData = {}
GoodsSaleTagData.__index = GoodsSaleTagData
function GoodsSaleTagData.New(reader)
  local self = {};
  setmetatable(self, GoodsSaleData);

  self.storeKind = reader:ReadByte();  --商店類別
  self.mainTag = reader:ReadByte();    --主分類
  self.subTag = reader:ReadByte();     --次分類
  self.showKind = reader:ReadByte();    --商品索引
  self.name = reader:ReadUInt32();     --頁籤名稱

  return self;
end

function GoodsSaleTagData.Demo()
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

function GoodsSaleTagData.Demo2()
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

GoodsSaleData = {}
GoodsSaleData.__index = GoodsSaleData
function GoodsSaleData.New(reader) 
  local self = {};
  setmetatable(self, GoodsSaleData);

  local storeKind = reader:ReadByte();            --商店類別
  self.currencyKind = reader:ReadByte();          --幣值(1.元寶, 3.遊戲幣)
  local mjrKind = reader:ReadByte();              --虛寶分類主項
  local sndKind = reader:ReadByte();              --虛寶分類次項
  local state = reader:ReadByte();                --是否上架(0開放 1關閉)
  self.open = state == 0;
  self.Id = reader:ReadUInt16();                  --虛寶編號
  self.value = reader:ReadByte();                 --每組數量
  self.showCredit = reader:ReadUInt16();          --訂價
  self.saleCredit = reader:ReadUInt16();          --售價
  self.saleKind = reader:ReadByte();              --販售種類
  self.flag = reader:ReadUInt16();                --購買標記
  self.dayCount = reader:ReadByte();              --限購次數
  self.memo = reader:ReadByte();                  --備註(1.New, 2.Hot, 3.SALE)
  
  self.smallTag = reader:ReadUInt32();            --特惠禮包左上紅底小標題
  self.specialEvent = reader:ReadUInt32();        --特惠禮包特殊活動用字

  self.timeKind = reader:ReadByte();              --時間種類(0.不限, 1.每天, 2.每月, 3.時間)
  self.startYear = reader:ReadUInt16();           --開始年
  self.startMonth = reader:ReadByte();            --開始月
  self.startDay = reader:ReadByte();              --開始日
  self.startHour = reader:ReadByte();             --開始時
  self.endYear = reader:ReadUInt16();             --結束年
  self.endMonth = reader:ReadByte();              --結束月
  self.endDay = reader:ReadByte();                --結束日
  self.endHour = reader:ReadByte();               --結束時

  self.buyLimitFlag = reader:ReadUInt16();        --限制購買標記

    self.bitFunction = reader:ReadByte();         --功能開關

  return storeKind, mjrKind, sndKind, self;
end

function GoodsSaleData.Demo2()
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

function GoodsSaleData:GetLimitString(roleCount)
  local result = "";

  if self.saleKind == 0 or Network.CheckServerSwitch(EServerSwitch.Review) then--0.不顯示，送審不顯示限購
    result =  "";    
  elseif self.saleKind == 1 then--1.日清(字串20520每日限購)
    result = string.Concat(string.Get(20520), roleCount, "/", self.dayCount);
  elseif self.saleKind == 2 then--2.週清(字串21438每週限購)
    result = string.Concat(string.Get(21438), roleCount, "/", self.dayCount);
  elseif self.saleKind == 3 then--3.月清(字串21439每月限購)
    result = string.Concat(string.Get(21439), roleCount, "/", self.dayCount);
  elseif self.saleKind == 4 then--4.終身(字串21437終身限購)
    result = string.Concat(string.Get(21437), roleCount, "/", self.dayCount);
  end

    return result;
end

function GoodsSaleData:GetSpecLimitTimeString()
  local result = "";
  
  if self.timeKind == 3 then --顯示下架時間
    result = string.Concat(result, self:GetSaleEndTimeString());
  end
  
  return result;
end

function GoodsSaleData.Demo3()
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

function GoodsSaleData.Demo4()
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

function GoodsSaleData.Demo5()
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

function GoodsSaleData:IsInSaleTime()
  if self.timeKind == 0 then return true end -- 0 不限時間

  local startTime, endTime = self:GetSaleTime();

  if startTime == nil or endTime == nil then
    logError("time == nil");
    return false;
  end

  return System.DateTime.Compare(startTime, CGTimer.serverTime) <= 0 and System.DateTime.Compare(endTime, CGTimer.serverTime) > 0 ;
end

function GoodsSaleData:GetSaleEndTimeString()
  local startTime, endTime = self:GetSaleTime();

  if startTime == nil or endTime == nil then
    logError("time == nil");
    return "";
  end

  return string.format( string.Get(22158), endTime:ToString("yyyy/MM/dd HH:mm") );
end

function GoodsSaleData.Demo6()
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

function GoodsSaleData.Demo7()
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

function GoodsSaleData:GetSaleTime()
  local startTime = nil;
  local endTime = nil;

-- self.timeKind == 0 then--0.不限時間 沒有填
  if self.timeKind == 1 then--1.每天
    startTime = System.DateTime.New(CGTimer.serverTime.Year, CGTimer.serverTime.Month, CGTimer.serverTime.Day, self.startHour, 0, 0);
    endTime = System.DateTime.New(CGTimer.serverTime.Year, CGTimer.serverTime.Month, CGTimer.serverTime.Day, self.endHour, 0, 0);
  elseif self.timeKind == 2 then--2.每月
    startTime = System.DateTime.New(CGTimer.serverTime.Year, CGTimer.serverTime.Month, self.startDay, self.startHour, 0, 0);
    endTime = System.DateTime.New(CGTimer.serverTime.Year, CGTimer.serverTime.Month, self.endDay, self.endHour, 0, 0);
  elseif self.timeKind == 3 then--3.時間
    startTime = System.DateTime.New(self.startYear, self.startMonth, self.startDay, self.startHour, 0, 0);
    endTime = System.DateTime.New(self.endYear, self.endMonth, self.endDay, self.endHour, 0, 0);
  end

  return startTime, endTime;
end

function GoodsSaleData.Demo8()
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

EGSActivityKind = {
  SavePoint = 1,   --
  MonthCard = 2,    --
  HalfMonthCard = 3,   --
}

GSActivityData = {}
GSActivityData.__index = GSActivityData
function GSActivityData.New(reader) 
  local self = {};
  setmetatable(self, GSActivityData);

  self.Id = reader:ReadByte();

  self.items = {};
  for i = 1, 14 do
    self.items[i] = {};
    self.items[i].Id = reader:ReadUInt16();
    self.items[i].count = reader:ReadUInt16();
    self.items[i].flag = reader:ReadUInt16();
    self.items[i].x = reader:ReadInt16();
    self.items[i].y = reader:ReadInt16();
  end

  self.messages = {};
  for i = 1, 5 do
    self.messages[i] = {};
    self.messages[i].Id = reader:ReadUInt32();
    self.messages[i].showKind = reader:ReadByte();
    self.messages[i].fontSize = reader:ReadByte();
    self.messages[i].x = reader:ReadInt16();
    self.messages[i].y = reader:ReadInt16();
  end

  self.prices = {};
  for i = 1, 4 do
    self.prices[i] = {};
    self.prices[i].Id = reader:ReadUInt32();
    self.prices[i].showKind = reader:ReadByte();
    self.prices[i].x = reader:ReadInt16();
    self.prices[i].y = reader:ReadInt16();
  end

  self.buttons = {};
  for i = 1, 4 do
    self.buttons[i] = {};
    self.buttons[i].Id = reader:ReadUInt32();
    self.buttons[i].Id2 = reader:ReadUInt32();
    self.buttons[i].flag = reader:ReadUInt16();
    self.buttons[i].getKind = reader:ReadByte();
    self.buttons[i].value = reader:ReadUInt16();
    self.buttons[i].buttonKind = reader:ReadByte();
    self.buttons[i].x = reader:ReadInt16();
    self.buttons[i].y = reader:ReadInt16();
  end

  return self;
end

function GSActivityData.Demo8()
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

function GSActivityData.Demo1()
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

function GSActivityData.Demo2()
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

function GSActivityData.Demo3()
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

function GSActivityData.GetActivityData(kind)
  for k, v in pairs(gsActivityDatas) do
    if kind == v.Id then
      return v;
    end
  end

  return nil;
end

function GSActivityData.Demo4()
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

function GSActivityData.Demo5()
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