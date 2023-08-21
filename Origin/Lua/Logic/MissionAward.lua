MissionAward = {};
local this = MissionAward;

local EMissionAwardResult = {
  unknown = 0,
  success = 1,
  unqualified = 2,
  received = 3,
  bagFull = 4
}

function MissionAward.GetMissionOrderByStatus(activityId)
  local sortedMissionData = {};
  local completeMission = {};
  local inProgressMission = {};
  local receivedAwardMission = {};
  local refresh = false;
  for _, value in ipairs(missionAwardDatas) do
    if activityId ~= nil then
      if value.activityId == activityId then
        if value:HaveGetFlag() then
          table.insert(receivedAwardMission, value);
        elseif value:IsComplete() then
          table.insert(completeMission, value);
          refresh = true;
        else
          table.insert(inProgressMission, value);
        end
      end
    else
      if value:HaveGetFlag() then
        table.insert(receivedAwardMission, value);
      elseif value:IsComplete() then
        table.insert(completeMission, value);
        refresh = true;
      else
        table.insert(inProgressMission, value);
      end
    end
  end

  for _, value in pairs(completeMission) do
    table.insert(sortedMissionData, value);
  end

  for _, value in pairs(inProgressMission) do
    table.insert(sortedMissionData, value);
  end

  for _, value in pairs(receivedAwardMission) do
    table.insert(sortedMissionData, value);
  end
  return sortedMissionData, refresh
end

function MissionAward.CheckCompeleteKind(conditionKind, roleCountIndex)
  local festivalReddot = false;
  local battlePassReddot = false;
  for _, value in ipairs(missionAwardDatas) do
    if value.conditions.kind == conditionKind and value.conditions.kindValue == roleCountIndex then
      if value:IsComplete() and not value:HaveGetFlag() then
        if value.activityId == 98 and not festivalReddot then
          festivalReddot = true;
        elseif not battlePassReddot then
          battlePassReddot = true;
        end
      end
    end
  end
  
  if festivalReddot then
    RedDot.Add(ERedDot.Festival);
  end
  
  if battlePassReddot then
    BattlePass.UpdateRedDot();
  end
end

function MissionAward.GetMissionCountById(activityId)
  local count = 0;
  for _, value in ipairs(missionAwardDatas) do
    if value.activityId == activityId then
      count = count + 1;
    end;
  end
  
  return count;
end

--region protocol
--C:077-011<活動協定> 活動種類(1) 種類122 <領通用任務獎勵> +任務ID(2)
function MissionAward.SendCompleteMission(missionID)
  if missionID == nil then return end
  if Item.GetBagLeftCount(EThings.Bag) < 1 then
    ShowCenterMessage(string.Get(80359));
    return
  end
  sendBuffer:Clear();
  sendBuffer:WriteByte(122);
  sendBuffer:WriteUInt16(missionID);
  Network.Send(77, 11, sendBuffer);
end

--[[
S:077-011<活動協定> + 活動種類(1)
  種類122:<領通用任務獎勵> +結果(1)
        結果 0=未知失敗
            1=成功 + 任務ID(2)
            2=未符合資格 + 任務ID(2)
            3=以領過 + 任務ID(2)
            255=功能未開啟
]]--
function MissionAward.ReceiveMissionAward(data)
  local result = data:ReadByte();
  local missionId;
  local resultMessage;
  if result == 255 and UI.IsVisible(UIBattlePass) then
    UI.Close(UIBattlePass);
    ShowCenterMessage(string.Get(71336));
    return;
  end
  if result == EMissionAwardResult.unknown then
    resultMessage = string.Get(10144);
  elseif result == EMissionAwardResult.unqualified then
    resultMessage = string.Get(22712);
    missionId = data:ReadUInt16();
  elseif result == EMissionAwardResult.received then
    resultMessage = string.Get(21060);
    missionId = data:ReadUInt16();
  elseif result == EMissionAwardResult.bagFull then
    resultMessage = string.Get(80359);
    missionId = data:ReadUInt16();
  else
    missionId = data:ReadUInt16();
  end

  if resultMessage ~= nil then
    ShowCenterMessage(resultMessage);
  else
    if missionAwardDatas[missionId].activityId == 98 then
      UIFestival.UpdateRedDot();
      UIMissionAward.UpdateMissionPage();
    else
      ShowCenterMessage(string.Concat(string.format(string.Get(21179), itemDatas[missionAwardDatas[missionId].itemId]:GetName(true), missionAwardDatas[missionId].itemCount)));
      Chat.AddMessage(EChannel.System, string.format(string.Get(21179), itemDatas[missionAwardDatas[missionId].itemId]:GetName(true), missionAwardDatas[missionId].itemCount));
      BattlePass.UpdateRedDot();
      UIBattlePass.UpdateMissionPage();
    end
  end
end
--endregion