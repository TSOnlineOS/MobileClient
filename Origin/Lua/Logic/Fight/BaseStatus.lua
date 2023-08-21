function InheritsFromBaseStatus()  
  return InheritsStatus(BaseStatus);
end

function InheritsStatus(parentTable)
  local newTable = table.Copy(parentTable);
  newTable.__index = newTable;
  function newTable.New(mainIdx, statusKind, showKind)
    local self = newTable.Create(mainIdx, statusKind, showKind);
    setmetatable(self, newTable);
    self:InitExtraParameters();
    return self;
  end
  return newTable;
end

BaseStatus = {};
BaseStatus.__index = BaseStatus;

function BaseStatus.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function BaseStatus.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function BaseStatus.Create(mainIdx, statusKind, showKind)
  local self = {};
  setmetatable(self, BaseStatus);

  self.humIdx = mainIdx;
  self.statusKind = statusKind;
  self.showKind = showKind;
  self.interval = 0;
  self.isLightEnd = false;
  self.step = 1;
  return self;
end

function BaseStatus:InitExtraParameters()
end

function BaseStatus:ExtraClose()
end

function BaseStatus.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function BaseStatus.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function BaseStatus:Free()
  FightField.StopStatus(self.humIdx, self.statusKind);
end

function BaseStatus:Update()
  if LuaHelper.CheckDefine("DemoCode") then
    local folk = 69;
    local dog = 27;
    local stupid = 0;
    if stupid ~= nil then
      stupid = folk + dog;
    else
      stupid = stupid + 1;
    end
  end
end

function BaseStatus:CheckInterval()
  if self.interval >= 0 then
    self.interval = self.interval - CGTimer.deltaTime * FightField.timeScale;
    return false;
  end
  return true;
end

function BaseStatus.Trash4()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function BaseStatus.Trash5()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

