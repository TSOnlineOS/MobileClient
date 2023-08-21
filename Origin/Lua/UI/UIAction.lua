UIAction = {}
local this = UIAction;

this.name = "UIAction";
this.uiController = nil;

function UIAction.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;

  local actionRoot = uiController:FindGameObject("Image_ContentBG");
  local tempEvent;

  for i = 1, 14 do
    tempEvent = actionRoot.transform:Find(string.Concat("Image_Action (", i, ")")):GetComponent("UIEvent");
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Action);
    tempEvent.parameter = i;
  end

  tempEvent = uiController:FindEvent("Image_Mask");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);
end

function UIAction.OnOpen()
  return true;
end

function UIAction.OnClick_Close()
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
  UI.Close(UIAction);
end

function UIAction.OnClick_Action(uiEvent)
  local pose = ERolePose.Stand;

  if uiEvent.parameter == 1 then
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
    pose = ERolePose.Sit;
  elseif uiEvent.parameter == 2 then
    pose = ERolePose.Wave;
  elseif uiEvent.parameter == 3 then
    pose = ERolePose.Hit;
  elseif uiEvent.parameter == 4 then
    pose = ERolePose.Prepare;
  elseif uiEvent.parameter == 5 then
    pose = ERolePose.Lie;
  elseif uiEvent.parameter == 6 then
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
    pose = ERolePose.Jump;
  elseif uiEvent.parameter == 7 then
    pose = ERolePose.Magic;
  elseif uiEvent.parameter == 8 then
    pose = ERolePose.Attack;
  elseif uiEvent.parameter == 9 then
    pose = ERolePose.Walk;
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
  elseif uiEvent.parameter == 10 then
    pose = ERolePose.Stand;
  elseif uiEvent.parameter == 11 then
    pose = ERolePose.Special;
  elseif uiEvent.parameter == 12 then
    pose = ERolePose.Archery;
  elseif uiEvent.parameter == 13 then
    pose = ERolePose.Meditation;
  elseif uiEvent.parameter == 14 then
    pose = ERolePose.Kiss;
  else
    return;
  end

  if Role.player.horseNpcId ~= 0 then
    ShowCenterMessage(string.Get(20515));
    return;
  end

  local leader = Team.GetLeader(Role.playerId);
  if leader ~= nil and leader.isMoving then
    ShowCenterMessage(string.Get(40331), 1.2);
    return;
  end
  
  if Role.player.data.guardNpc ~= nil then
    ShowCenterMessage(string.Get(40275), 1.2);
    return;
  end

  --[[
  if pose == ERolePose.Kiss then
    if Role.player.FirstShowEquip_Spec(Role.player.data.equips[EItemFitType.Equip_Spec]) or (Role.player.data.equips[EItemFitType.Equip_Spec] ~= 19760 and Role.player.data.equips[EItemFitType.Equip_Spec] ~= 19761) then //沒有禮服
      return;
    end
  end
  ]]--

  if MapManager.IsSea(MapManager.GetBlock(Role.player.position)) then
    if Contains(SceneManager.sceneId, 57401, 60441) then
      --溫泉場景只能躺下或坐下
      if pose ~= ERolePose.Sit and pose ~= ERolePose.Lie then
        return;
      end
    else
      --海上不可做動作
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
      return;
    end
  end

  --C:006-002 <玩家停止移動> +方向(1) +座標X(2) +座標Y(2)
  sendBuffer:Clear()
  sendBuffer:WriteByte(Role.player.direction);
  sendBuffer:WriteUInt16(Role.player.position.x);
  sendBuffer:WriteUInt16(Role.player.position.y);
  --sendBuffer:WriteByte((Role.player:GetAttribute(EAttribute.Lv) + Role.player.index) % 13);
  --sendBuffer:WriteByte(math.random(220));
  Network.Send(6, 2, sendBuffer);
  
  --C:032-002 <使用情感動作> +動作ID(1)
  sendBuffer:Clear()
  sendBuffer:WriteByte(pose);
  Network.Send(32, 2, sendBuffer);

  Role.player:SetAnimationForceId(pose);
  
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

  --GoogleAnalytics.Call("LogEvent", this.name, GAEventAction.ClickButton, GALabel.Action, pose);

  UI.Close(UIAction);
end