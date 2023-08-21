require "Logic/Event/EventHandler"

EEventTrigger = {
  ClickNpc = 1,         --點擊Npc
  BumpNpc = 2,          --碰撞Npc
  ScanNpc = 3,          --掃描Npc
  ClickDoor = 4,        --點擊門
  NotInUse_5 = 5,       --未使用
  WaitToNext = 6,       --事件下一步
  Mine = 7,             --地雷(現在由Server觸發)
  MeetDoor = 8,         --碰撞門
  ClickSurface = 9,     --點擊互動動選單選項
}

EEventState = {
  Idle = 1,             --空閒
  Running = 2,          --執行中
  Waiting = 3,          --等待
}

EventManager = {};
local this = EventManager;

--const
this.bumpTimeGap = 6;

--var
this.initialized = false;

this.C_SSessioning = false;
this.C_EvetConductGate = false;
this.C_Interacting = false;

this.currentContext = { state = EEventState.Idle, triggerKind = 0, triggerID = 0, triggerObj = nil };

this.inNewYearEvent = false;
this.weekNum = 1; --目前是每月的第幾週

this.inBattle = false;
this.isChangingScene = false

local surfaceDatas = nil;

function EventManager.Initialize()
  NotifyManager.Register(ENotifyManager.EnterScene, "EventManager", this.OnEnterScene);

  this.initialized = true;
end

function EventManager.Update()
  this.NextEvent();
end

function EventManager.Random()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function EventManager.Random1()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function EventManager.Random2()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function EventManager.IsRunning()
  return this.currentContext.state ~= EEventState.Idle;
end

--server command
function EventManager.ReceiveCommonEvent(data)
  local eventInfo = {};

  eventInfo.resultDiagnosis = data:ReadByte(); --0為正常運作 1之後為error訊息 
  eventInfo.resultGroupNo = data:ReadUInt16(); --紀錄該Result所屬的Group 0為初始Group表示不屬於任何Group
  eventInfo.resultNo = data:ReadByte(); --用來辨別Result執行的先後順序
  eventInfo.resultType = data:ReadByte(); --設定各種結果型態
  eventInfo.resultClass = data:ReadByte(); --種類0為對話及Fight	
  eventInfo.parameter = data:ReadUInt16(); --名稱  如果resultType為Talk及Fight那設為0
  eventInfo.parameterStyle = data:ReadByte(); --屬性
  eventInfo.resultValue = data:ReadInt32(); --如果resultType為Talk及Fight那設為0,有正負0~510 (Client收到減255)
  eventInfo.resultMeanNo = data:ReadUInt16();

  if MoviePlayer.state == EMovieState.End and MoviePlayer.freeze then
    TlogError("EventManager", "freeze false");
    MoviePlayer.freeze = false;
    MoviePlayer.ClearMovie();    
  end

  TlogWarn("EventManager", string.Concat("Start Common Event !! ", eventInfo.resultType));
  this.SetSession(false, false); 

  if EventHandler[eventInfo.resultType] == nil then return end

  EventHandler[eventInfo.resultType](eventInfo, this, surfaceDatas);	
end

function EventManager.TestPas(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function EventManager.TestPas1(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function EventManager.TestPas2(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function EventManager.ReceiveChangeSceneEvent()
  TlogWarn("EventManager", "Start Change Scene Event !!");
  this.isChangingScene = true;
  this.SetSession(false);
  this.SetConduct(true);

  if MoviePlayer.state == EMovieState.End and not MoviePlayer.freeze then
    MoviePlayer.freeze = true;
  end
  
  if MoviePlayer.state == EMovieState.Ready or MoviePlayer.state == EMovieState.Play then 
    return;
  end

  if not (Define.SuperAI and SceneManager.dungeonId ~= 0) then
    MachineBox.SetAutoMove(false);
  end
end

function EventManager.ReceiveEndEvent(kind)
  TlogWarn("EventManager", string.Concat("End Event Kind: ", tostring(kind)));
  
  this.ClearEventState();
  
  if kind == 45 or kind == 46 then
    Role.deadMsgData.show = true;
  end

  --other
  if kind == 45 then
    MarkManager.StopNavigation();
  else
    MarkManager.ContinueNavigation();
  end
end

function EventManager.ClearEventState()
  --event
  this.C_SSessioning = false;
  this.C_EvetConductGate = false;
  this.C_Interacting = false;
  
  --context
  if Contains(this.currentContext.triggerKind, EEventTrigger.MeetDoor) then
    if this.currentContext.triggerObj ~= nil then
      this.currentContext.triggerObj.lastBumpTime = CGTimer.time + this.bumpTimeGap;
    end
  end

  this.currentContext.state = EEventState.Idle;
  this.currentContext.triggerKind = 0;
  this.currentContext.triggerID = 0;
  this.currentContext.triggerObj = nil;
  this.isChangingScene = false;
  this.inBattle = false;

  --movie
  MoviePlayer.state = EMovieState.Idle;
  MoviePlayer.ClearMovie();
end

--set
function EventManager.SetSession(isSession)
  this.C_SSessioning = isSession;
end

function EventManager.TestPasA(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function EventManager.TestPasB(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function EventManager.TestPasC(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function EventManager.SetConduct(isConduct)
  this.C_EvetConductGate = isConduct;
end

function EventManager.SetInteracting(isInteracting)
  this.C_Interacting = isInteracting;
end

function EventManager.SetBattle(inBattle)
  this.inBattle = inBattle;
end

--event
function EventManager.OnEnterScene(checkCode)
  surfaceDatas = SceneManager.sceneState.surfaceTable;

  if surfaceDatas == nil then
    logError("EventManager.OnEnterScene surfaceDatas = nil");
  end
end

function EventManager.OnNpcEvent(triggerKind, npcEventData)
  --檢查是否在事件中
  if this.IsRunning() then return false end
  
  --檢查有無事件
  if npcEventData.eventCount == 0 then return false end

  --檢查是否GM
  if Contains(Role.GetRoleIdKind(Role.playerId), ERoleId.BGM, ERoleId.SGM, ERoleId.BGM2, ERoleId.SGM2) then return false end

  this.TriggerEvent(triggerKind, npcEventData.id, nil, true);

	return true;
end

function EventManager.TestPasD(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function EventManager.TestPasE(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function EventManager.TestPasF(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function EventManager.OnDoorEvent(triggerKind, door)
  if (triggerKind ~= EEventTrigger.MeetDoor) then
    return false;
  end

  --檢查是否在事件中
  if this.IsRunning() then return false end

  --檢查觸發間隔  
  if (door.lastBumpTime > CGTimer.time) then return false end

  this.TriggerEvent(triggerKind, door.id, door, true);

  return true;
end

function EventManager.OnClickDoorEvent(triggerKind, door)
  if (triggerKind ~= EEventTrigger.ClickDoor) then
    return false;
  end

  --檢查是否在事件中
  if this.IsRunning() then return false end  

  this.TriggerEvent(triggerKind, door.id, door, false);

  return true;
end

--send to server
function EventManager.TriggerEvent(triggerKind, triggerID, triggerObj, isStopMove)
  if triggerID == 0 then return end
  if Team.IsMember(this.playerId) and not Team.IsLeader(this.playerId) then return false end
  
  logWarn(string.Concat("Trigger Event !! Kind = ", triggerKind, " No = ", triggerID));

  --C:020 <事件觸發> +觸發種類(1) +索引(2)
  sendBuffer:Clear();
  sendBuffer:WriteUInt16(triggerID);
  Network.Send(20, triggerKind, sendBuffer);
  if isStopMove then 
    Role.player:StopMove();
  end

  this.currentContext.state = EEventState.Running;
  this.currentContext.triggerKind = triggerKind;
  this.currentContext.triggerID = triggerID;  
  this.currentContext.triggerObj = triggerObj;
  
  if (this.currentContext.triggerKind >= 1) and (this.currentContext.triggerKind <= 6) then
    this.C_SSessioning = true;
  end
end

function EventManager.SelectEvent(code)
  if Team.IsMember(Role.playerId) and not Team.IsLeader(Role.playerId) then return false end

  --C:020-009 <事件選擇> +選擇碼(1)
  sendBuffer:Clear();
  sendBuffer:WriteByte(code);
  Network.Send(20, 9, sendBuffer);

  this.SetInteracting(false);
end

function EventManager.NextEvent()
  if not this.C_EvetConductGate then return end
  if this.C_SSessioning then return end
  if this.C_Interacting then return end
  if Team.IsMember(Role.playerId) and not Team.IsLeader(Role.playerId) then return end
  if FightField.isInBattle then return end
  if UI.IsVisible(UILoading) then return end

  --C:020-006 <事件下一步>
  Network.Send(20, 6);
  
  this.C_EvetConductGate = false;
  this.C_SSessioning = true;
end

function EventManager.TestPas22(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function EventManager.TestPas23(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function EventManager.TestPas24(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function EventManager.TestPas25(pat)
  if LuaHelper.CheckDefine("DemoCode") then
    if pat > 100 then
      for i = 1 , 100 do
        pat = pat - i;
      end
      return pat;
    else
      return nil;
    end
  end
end

function EventManager.PrintEventState()
  logError("EventConduct: "..tostring(this.C_EvetConductGate).." EventSession: "..tostring(this.C_SSessioning).." EventInteracting: "..tostring(this.C_Interacting));  
end