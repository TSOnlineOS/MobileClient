EBattlePassReuireState = {
  OpenUI = 1,
  CheckRedDot = 2,
  BuyPass = 3,
  BuyPassPointCard = 4,
}

BattlePass = {}
local this = BattlePass;
this.battlePassStorValueIndex = 133;

local requireState;
--var
local awardDatas = {}
local currentPassId = 0;
local currentPassLv = 0;
local currentPassExp = 0;
local totalExp = 0;
local totalLv = 0;
local expLimit = 0;
local paidFlagId = 6060;
local battlePassActivityKind = 128;
local isHavePass = false;
local isAskedTime = false;
local isFunctionOpen = false;

local cashIndex;
local myCardName;
local myCardPassword;

--region Set
function BattlePass.SetPassData()
  currentPassId = PassAwardData.GetCurrentPassId();
  totalExp = RoleCount.Get(ERoleCount.BattlePassExp);
  table.Clear(awardDatas);
  if currentPassId == 0 then --目前查無已開啟通行證
    isHavePass = false;
  else
    isHavePass = true;
    awardDatas = PassAwardData.RequestCertainPassDatas(currentPassId);
    totalLv = table.Count(awardDatas);
    this.SetLvAndExp();
  end
end

function BattlePass.SetLvAndExp()
  currentPassLv, currentPassExp = this.CalculateLv();
  
  if currentPassLv < totalLv then
    expLimit = this.GetLvExpLimit(currentPassLv + 1);
  else
    expLimit = this.GetLvExpLimit(currentPassLv);
  end
end
--endregion

--region Get
function BattlePass.GetPassActivityKind()
  return battlePassActivityKind;
end

function BattlePass.GetTotalLv()
  return totalLv;
end

function BattlePass.GetAwardData()
  return awardDatas;
end

function BattlePass.GetCurrentPassId()
  return currentPassId;
end

function BattlePass.GetCurrentPassExp()
  return currentPassExp;
end

function BattlePass.GetCurrentPassLv()
  return currentPassLv;
end

function BattlePass.GetCurrentExpLimit()
  return expLimit;
end
--endregion

--region RedDot
function BattlePass.UpdateExp()
  if not isFunctionOpen then return end;
  totalExp = RoleCount.Get(ERoleCount.BattlePassExp);
  this.UpdateRedDot();
  
  if UI.IsVisible(UIBattlePass) then
    this.SetLvAndExp();
    UIBattlePass.UpdateUI();
  end
end

function BattlePass.UpdateAwardTake()
  if not isFunctionOpen then return end;
  local currentId = PassAwardData.GetCurrentPassId();
  local freeAwardStage = RoleCount.Get(ERoleCount.BattleFreeLv);
  local paidAwardStage = RoleCount.Get(ERoleCount.BattlePaidLv);
  PassAwardData.SetFreeTakeStatus(currentId, freeAwardStage);
  PassAwardData.SetPaidTakeStatus(currentId, paidAwardStage);
  this.UpdateRedDot();
  if UI.IsVisible(UIBattlePass) then
    UIBattlePass.UpdateUI();
  end
end

function BattlePass.UpdateRedDot()
  if not isFunctionOpen then return end;
  
  if not isAskedTime then
    Network.Send(1, 16)
    isAskedTime = true;
  end;
  
  local currentId = PassAwardData.GetCurrentPassId();
  
  if activityTimes[currentId] == nil or currentId == 0 then --無資料
    RedDot.Remove(ERedDot.BattlePass);
    return;
  end
  
  if activityTimes[currentId][1].serverStartTime == 0 or DateTime.Compare(CGTimer.serverTime, activityTimes[currentId][1].serverStartTime) < 0 then --不在時間內
    RedDot.Remove(ERedDot.BattlePass);
    return;
  end
  
  local missionAwardRedDot =  this.UpdateMissionAwardRedDot();
  local awardTookRedDot = this.UpdateAwardTookRedDot();
  
  if UI.IsVisible(UIBattlePass) then
    UIBattlePass.UpdateFromReddot(missionAwardRedDot, awardTookRedDot);
  end
  
  if missionAwardRedDot or awardTookRedDot then
    RedDot.Add(ERedDot.BattlePass);
  else
    RedDot.Remove(ERedDot.BattlePass);
    return;
  end
end

function BattlePass.UpdateMissionAwardRedDot()
  if not isFunctionOpen then return false end;
  if PassAwardData.GetCurrentPassId() == 0 then return false end;
  local _, refresh = MissionAward.GetMissionOrderByStatus(PassAwardData.GetCurrentPassId());
  return refresh
end

function BattlePass.UpdateAwardTookRedDot()
  if not isFunctionOpen then return false end;
  local currentId = PassAwardData.GetCurrentPassId();
  local totalExp = RoleCount.Get(ERoleCount.BattlePassExp);
  if currentId == 0 or totalExp == 0 then return false end;
  local currentLv, _ = this.CalculateLv(currentId, totalExp);
  local refresh = PassAwardData.CheckFreeAwardCanTook(currentId, currentLv);
  if not refresh and BitFlag.Get(paidFlagId) then
    refresh = PassAwardData.CheckPaidAwardCanTook(currentId, currentLv);
  end
  
  return refresh;
end
--endregion

function BattlePass.CheckHavePass()
  return isHavePass;
end

function BattlePass.GetSellData()
  if not isHavePass then return nil end;
  
  local sellData
  for _, v in pairs(goodsSaleData[4][1][1]) do
    if v.saleCredit == this.battlePassStorValueIndex then
      sellData = v;
    end
  end
  
  return sellData;
end

function BattlePass.GetStoreValueData(sellData)
  if not isHavePass then return nil end;
  
  if sellData == nil then return nil end;
  
  local storeValueData;
  storeValueData = StoreValue.GetData(sellData.saleCredit);
  
  return storeValueData;
end

function BattlePass.CalculateLv(id, exp)
  local calculateExp;
  local passData = {};
  if exp ~= nil then
    calculateExp = exp
  else
    calculateExp = totalExp;
  end;
  if id ~= nil then
    passData = PassAwardData.RequestCertainPassDatas(id);
  else
    passData = awardDatas;
  end
  if calculateExp <= 0 or table.Count(passData) == 0 then return 0, 0 end;
  for k, v in ipairs(passData) do
    if calculateExp == v.Exp then
      if passData[k + 1] == nil then
        return v.Lv, (v.Exp - passData[k - 1].Exp);
      else
        return v.Lv, 0;
      end
    elseif calculateExp > v.Exp then
      if passData[k + 1] ~= nil and passData[k + 1].Exp > calculateExp then
        return v.Lv, (calculateExp - v.Exp);
      elseif passData[k + 1] == nil then
        return v.Lv, (v.Exp - passData[k - 1].Exp);
      end
    elseif calculateExp < v.Exp and v.Lv == 1 then
      return 0, calculateExp;
    end
  end
  return 0, 0;
end

function BattlePass.GetLvExpLimit(lv)
  if table.Count(awardDatas) == 0 then return end;
  for k, v in ipairs(awardDatas) do
    if lv == v.Lv then
      if awardDatas[k - 1] ~= nil then
        return (v.Exp - awardDatas[k - 1].Exp);
      else
        return v.Exp;
      end
    end
  end
end

function BattlePass.Clear()
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  table.Clear(awardDatas);
  isAskedTime = false;
  isHavePass = false;
  currentPassId = 0;
  currentPassLv = 0;
  currentPassExp = 0;
  totalExp = 0;
  totalLv = 0;
  expLimit = 0;
  myCardName = nil;
  myCardPassword = nil;
  cashIndex = nil
  requireState = nil;
end

function BattlePass.RequireCheckBattlePassFunction(state, passCashIndex)
  requireState = state;
  Network.Send(1, 16);
  currentPassId = PassAwardData.GetCurrentPassId();
  if currentPassId ~= 0 then
    if state == EBattlePassReuireState.BuyPass then
      cashIndex = passCashIndex;
    end
    
    --C:077-011<活動協定> 活動種類(1) 種類128 <通行證相關> + 種類(1)
    --                        種類 0:詢問通行證功能開啟
    --                        種類 1:一鍵領通行證獎勵
    sendBuffer:Clear();
    sendBuffer:WriteByte(battlePassActivityKind);
    sendBuffer:WriteByte(0);
    Network.Send(77, 11, sendBuffer);
  elseif state == EBattlePassReuireState.OpenUI then
    ShowCenterMessage(string.Get(20377));
  end
end

function BattlePass.RequireCheckBattlePassFunctionByMyCard(number, passward)
  requireState = EBattlePassReuireState.BuyPassPointCard;
  myCardName = number;
  myCardPassword = passward;
  Network.Send(1, 16);
  currentPassId = PassAwardData.GetCurrentPassId();
  if currentPassId ~= 0 then
    --C:077-011<活動協定> 活動種類(1) 種類128 <通行證相關> + 種類(1)
    --                        種類 0:詢問通行證功能開啟
    --                        種類 1:一鍵領通行證獎勵
    sendBuffer:Clear();
    sendBuffer:WriteByte(battlePassActivityKind);
    sendBuffer:WriteByte(0);
    Network.Send(77, 11, sendBuffer);
  else
    ShowCenterMessage(string.Get(20377));
    if UI.IsVisible(UIBattlePass) then
      UI.Close(UIBattlePass)
    end
  end
end

function BattlePass.ReceiveFunctionOpen(isOpen)
  isFunctionOpen = isOpen;
  
  if not isFunctionOpen then
    ShowCenterMessage(string.Get(71336));
    return
  end
  
  if requireState == EBattlePassReuireState.OpenUI then
      if not this.IsInTime() then
        ShowCenterMessage(string.Get(20377));
        return
      end
    if UI.IsVisible(UIMall) then
      UI.Close(UIMall);
    end
      this.UpdateRedDot();
      UI.Open(UIBattlePass);
  elseif requireState == EBattlePassReuireState.CheckRedDot then
    if not this.IsInTime() then return end;
    this.UpdateAwardTake();
  elseif requireState == EBattlePassReuireState.BuyPass then
    if not this.IsInTime() then
      ShowCenterMessage(string.Get(20377));
      if UI.IsVisible(UIBattlePass) then
        UI.Close(UIBattlePass)
      end
      return
    end
    StoreValue.Buy(StoreValue.GetCurrentPlatform(), this.battlePassStorValueIndex, cashIndex);
  elseif requireState == EBattlePassReuireState.BuyPassPointCard then
    if not this.IsInTime() then
      ShowCenterMessage(string.Get(20377));
      if UI.IsVisible(UIBattlePass) then
        UI.Close(UIBattlePass)
      end
      return
    end
    StoreValue.BuyPointCard(StoreValue.GetCurrentPlatform(), myCardName, myCardPassword);
  end
  myCardName = nil;
  myCardPassword = nil;
  cashIndex = nil
  requireState = nil;
end

function BattlePass.CheckFunctionOpen()
  return isFunctionOpen;
end
--region CrossDay
function BattlePass.IsInTime()
  local passId = PassAwardData.GetCurrentPassId();
  
  if passId == 0 then
    --目前查無已開啟通行證
    return false;
  end
  
  local leftTime = this.GetEndTime(passId);
  if leftTime == nil then return false end
  local diffEnd = DateTime.Compare(leftTime, CGTimer.serverTime);
  
  local startTime = this.GetStartTime(passId);
  if startTime == nil then return false end
  local diffStart = DateTime.Compare(CGTimer.serverTime, startTime);
  
  if diffEnd > 0 and diffStart > 0 then
    local openDay = activityTimes[passId][1].openDay;
    local openDays = UIActivity.intTobit(openDay);
    
    if openDay > 0 then
      if openDays[UIActivity.GetDayOfWeek(tostring(CGTimer.serverTime.DayOfWeek))] == 1 then
        return true;
      else
        return false;
      end
    else
      return true;
    end
  
  else
    return false;
  end
end

function BattlePass.CheckCrossDay()
  if not this.IsInTime() then
    if UI.IsVisible(UIBattlePass) then
      UI.Close(UIBattlePass);
    end
    RedDot.Remove(ERedDot.BattlePass);
  else
    BattlePass.UpdateRedDot();
    if UI.IsVisible(UIBattlePass) then
      UIBattlePass.UpdateUI();
    end
  end
end

function BattlePass.GetEndTime(activityTimeId)
  if activityTimeId <= 0 or activityTimes[activityTimeId] == nil then
    return nil;
  else
    return DateTime.New(
      activityTimes[activityTimeId][1].endYear,
      activityTimes[activityTimeId][1].endMonth,
      activityTimes[activityTimeId][1].endDay,
      activityTimes[activityTimeId][1].endHour,
      activityTimes[activityTimeId][1].endMinute,
      0
    );
  end
end

function BattlePass.GetStartTime(activityTimeId)
  if activityTimeId <= 0 or activityTimes[activityTimeId] == nil then
    return nil;
  else
    return DateTime.New(
      activityTimes[activityTimeId][1].startYear,
      activityTimes[activityTimeId][1].startMonth,
      activityTimes[activityTimeId][1].startDay,
      activityTimes[activityTimeId][1].startHour,
      activityTimes[activityTimeId][1].startMinute,
      0
    );
  end
end
--endregion