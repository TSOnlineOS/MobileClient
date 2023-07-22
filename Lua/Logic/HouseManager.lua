
EHouseBuilding = {
  FirstBuilding = 1,
  SecondBuilding = 2,
  ThirdBuilding = 3,
  FourthBuilding = 4,
}

EHouseFloor = {
  FirstFloor = 1,
  SecondFloor = 2,
}

EHouseFloorLevel = {
  FirstUnExpanded = 0, --第一層未擴建
  FirstExpanded = 1, --第一層已擴建
  SecondExpanded = 2, --第二層(第二層只有已擴建)
}

HouseManager = {}
local this = HouseManager;

local current_Building = EHouseBuilding.FirstBuilding;        --現在所在小屋
local current_BuildingLevel = EHouseBuilding.FirstBuilding;   --已開啟到小屋
local current_Floor = EHouseFloor.FirstFloor;
local building = {};
local houseOwnerId;
local houseTotalLevel;
local isMyHouse = false;
local isInHouse = false;
local correctWayIntoHouse = false;
local recHouseProtocal = false;
local firstEnterHouse = false;

function HouseManager.Initialize()
  for i = 1, table.Count(EHouseBuilding) do
    building[i] = {};
    building[i].floorScore = {};

    building[i].floorLevel = EHouseFloorLevel.FirstUnExpanded;
    building[i].floorScore[1] = 0;
    building[i].floorScore[2] = 0;
  end
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
  FurnitureManager.Initialize();
  Furniture.Initialize();
  HouseEditorManager.Initialize();
  WarriorInHouse.Initialize();
  FurnitureCollection.Initialize();
  NotifyManager.Register(ENotifyManager.EnterScene, "HouseManager", this.OnEnterScene);
  NotifyManager.Register(ENotifyManager.ExitScene, "HouseManager", this.OnExitScene);
end

function HouseManager.Destroy()
  FurnitureManager.Destroy();
  HouseEditorManager.Destroy();
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
end

function HouseManager.OnEnterScene()
  if houseEditorSceneSetDatas[SceneManager.sceneId] == nil then return end

  if recHouseProtocal then
    correctWayIntoHouse = true;
  end

  firstEnterHouse = true;
  recHouseProtocal = false;
  isInHouse = true;
  HouseEditorManager.EnterScene();
  FurnitureManager.EnterScene();
  this.SendAskFurnitureData(houseOwnerId);
end

function HouseManager.OnExitScene()
  FurnitureManager.ExitScene();
  HouseEditorManager.ExitScene();
  UIHouseEditor.ExitScene();
  FurnitureCollection.CLear();
  UI.Close(UIHouseFunction);
  correctWayIntoHouse = false;
  firstEnterHouse = false;
  isInHouse = false;

  for k, v in pairs(Role.houseWarriors) do
    Role.HouseWarriorDisappear(k);
  end
end

function HouseManager.SetIsInHouse(inHouse)
  isInHouse = inHouse;
end

function HouseManager.IsInHouse()
  return isInHouse;
end

function HouseManager.IsMyHouse()
  return isMyHouse;
end

function HouseManager.IsCorrectWayIntoHouse()
  return correctWayIntoHouse;
end

function HouseManager.SetIsMyHouse(isMy)
  isMyHouse = isMy;
end

function HouseManager.OnClick_ChangeFloor(floor)
  if not correctWayIntoHouse then return end

  if floor == EHouseFloor.SecondFloor then
    if building[current_Building].floorLevel < EHouseFloorLevel.SecondExpanded and isMyHouse then
      this.ShowCheckExpandMessage(EHouseFloorLevel.SecondExpanded, current_Building);
    elseif building[current_Building].floorLevel == EHouseFloorLevel.SecondExpanded then
      this.ChangeHouse(current_Building, floor);
    else
      ShowCenterMessage(string.Get(40466));
    end
  elseif floor == EHouseFloor.FirstFloor then
    this.ChangeHouse(current_Building, floor);
  end
end

function HouseManager.ShowCheckExpandMessage(target_HouseFloorLevel, target_BuildingLevel)
  if target_BuildingLevel < current_BuildingLevel then return end
  if target_BuildingLevel == current_BuildingLevel and target_HouseFloorLevel <= building[target_BuildingLevel].floorLevel then return end

  local message = "";
  local maxFloor = table.Count(EHouseFloor);
  local floor = math.floor(building[current_BuildingLevel].floorLevel / maxFloor) + 1;
  local amountOfFurnitureKind, goldSpend = this.GetSpendElement();

  --確定擴建前先檢查一次家具類型
  FurnitureManager.SendAskAllFurnitures();

  if this.CanExpandToTargetBuildingFloor(target_HouseFloorLevel, target_BuildingLevel) then
    if target_BuildingLevel == current_BuildingLevel then
      if (building[current_BuildingLevel].floorLevel + 1) % 2 == 0 then
        floor = floor + 1;
      end
      message = string.Concat(string.format(string.Get(23559), floor), "\n(", string.format(string.Get(23561), amountOfFurnitureKind, goldSpend), ")");
    else
      message = string.Concat(string.format(string.Get(23560), target_BuildingLevel), "\n(", string.format(string.Get(23561), amountOfFurnitureKind, goldSpend), ")");
    end
  else
    if target_BuildingLevel == current_BuildingLevel then
      message = string.Concat(string.format(string.Get(23562), floor, floor), "\n(", string.format(string.Get(23561), amountOfFurnitureKind, goldSpend), ")");
    else
      message = string.Concat(string.format(string.Get(23563), target_BuildingLevel - 1, maxFloor));
    end
  end

  ShowCheckMessage(
  function(result)
    if result then
      if FurnitureCollection.GetCollectAttribute(EFurnitureCollectAttribute.FurnitureKindCount) == nil then return end

      if amountOfFurnitureKind <= FurnitureCollection.GetCollectAttribute(EFurnitureCollectAttribute.FurnitureKindCount) and goldSpend * 10000 <= Role.playerData.gold then
        UI.Open(UIHouseExpand);
      else
        ShowCenterMessage(string.Get(23595));
      end
    end
  end,
  string.format(message)
  );
end

function HouseManager.CanExpandToTargetBuildingFloor(target_HouseFloorLevel, target_BuildingLevel)
  local buildingValue = table.Count(EHouseFloorLevel);
  return building[current_BuildingLevel].floorLevel + current_BuildingLevel * buildingValue == target_HouseFloorLevel + target_BuildingLevel * buildingValue - 1;
end

function HouseManager.GetSpendElement()
  local buildingValue = table.Count(EHouseFloorLevel);
  local totalValue = building[current_BuildingLevel].floorLevel + current_BuildingLevel * buildingValue + 1;
  local target_BuildingLevel = math.floor(totalValue / buildingValue);
  local target_HouseFloorLevel = totalValue - target_BuildingLevel * buildingValue;

  for k, v in pairs(houseExpandConditionDatas) do
    if v.building == target_BuildingLevel and v.floorLevel == target_HouseFloorLevel then
      return v.amountOfFurnitureKind, v.spend;
    end
  end

  return nil;
end

function HouseManager.ChangeHouse(house, floor)
  if house == nil or floor == nil then return end
  this.SendEnterHouse(houseOwnerId, house, floor);
end

function HouseManager.SendAskFurnitureData(ownerId)
  if ownerId == nil then return end
  if not correctWayIntoHouse then return end
  --C:106-001 <要求房屋資料> +玩家ID(8) +房屋編號(1) +樓層(1)
  sendBuffer:Clear();
  sendBuffer:WriteInt64(ownerId);
  sendBuffer:WriteByte(HouseManager.GetCurrentBuilding());
  sendBuffer:WriteByte(HouseManager.GetCurrentFloor());
  Network.Send(106, 1, sendBuffer);
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
end

function HouseManager.SendExpandHouse()
  if not correctWayIntoHouse then return end
  --C:106-004 <小屋擴建>
  sendBuffer:Clear();
  Network.Send(106, 4, sendBuffer);
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
end

function HouseManager.SendEnterHouse(playerId, building, floor)
  if playerId == nil or building == nil or floor == nil then return end
  houseOwnerId = playerId;
  this.SetIsMyHouse(houseOwnerId == Role.playerId);

  --C:106-002 <進入小屋> +玩家ID(8) +房屋編號(1) +樓層(1)
  sendBuffer:Clear();
  sendBuffer:WriteInt64(playerId);
  sendBuffer:WriteByte(building);
  sendBuffer:WriteByte(floor);
  Network.Send(106, 2, sendBuffer);
end

function HouseManager.SendAskHouseTotalLevel()
  if houseOwnerId == nil then return end

  --C:106-013 <要求小屋總等級> +房屋主人ID(8)
  sendBuffer:Clear();
  sendBuffer:WriteInt64(houseOwnerId);
  Network.Send(106, 13, sendBuffer);
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
end

function HouseManager.ReceiveEnterHouse()
  recHouseProtocal = true;
  correctWayIntoHouse = true;
  UI.Open(UIHouseFunction);
end

function HouseManager.ReceiveHouseInfo(houseName)
  if firstEnterHouse then
    ShowCenterMessage(string.Concat(houseName, " ", string.format(string.Get(23528), current_Building, current_Floor)));
    FurnitureManager.SendAskAllFurnitures();
    firstEnterHouse = false;
  end
end

function HouseManager.GetCurrentBuilding()
  return current_Building or 0;
end

function HouseManager.GetCurrentBuildingLevel()
  return current_BuildingLevel or 0;
end

function HouseManager.GetCurrentFloorLevel()
  return building[current_Building].floorLevel or 0;
end

function HouseManager.GetCurrentFloor()
  return current_Floor or 0;
end

function HouseManager.GetCurrentFloorScore()
  return building[current_Building].floorScore[current_Floor];
end

function HouseManager.GetFloorScore(house, floor)
  if house == nil or floor == nil then return end
  return building[house].floorScore[floor];
end

function HouseManager.GetHouseOwnerId()
  return houseOwnerId or 0;
end

function HouseManager.SetCurrentHouseAndFloor(house, floor)
  if house == nil or floor == nil then return end
  current_Building = house;
  current_Floor = floor;

  if UI.IsVisible(UIHouseFunction) then
    UIHouseFunction.ChangeUIFloor(current_Floor);
  end
end

function HouseManager.SetCurrentFloorScore(score)
  building[current_Building].floorScore[current_Floor] = score;
end

function HouseManager.SetFloorScore(house, floor, score)
  if building[house] == nil then return end
  if building[house].floorScore == nil then return end
  if building[house].floorScore[floor] == nil then return end
  building[house].floorScore[floor] = score;
end

function HouseManager.SetHouseOwnerId(playerId)
  if playerId == nil then return end
  houseOwnerId = playerId;
  isMyHouse = houseOwnerId == Role.playerId;
  Social.AddVisitedFriends(playerId);
end

function HouseManager.SetTotalLevel(level)
  if level == nil then return end
  local buildingLevel, floorLevel = HouseExpandConditionData.GetBuildingAndFloorLevel(level);
  if buildingLevel == nil or floorLevel == nil then return end

  for i = 1, table.Count(EHouseBuilding) do
    if i < buildingLevel then
      building[i].floorLevel = EHouseFloorLevel.SecondExpanded;
    elseif i == buildingLevel then
      building[i].floorLevel = floorLevel;
    else
      building[i].floorLevel = EHouseFloorLevel.FirstUnExpanded;
    end
  end

  houseTotalLevel = level;
  current_BuildingLevel = buildingLevel;

  if UI.IsVisible(UIHouseMap) then
    UIHouseMap.SetHouseOpen();
    UIHouseMap.UpdateUI();
  end

  if UI.IsVisible(UIHouseFunction) then
    UIHouseFunction.CheckRedDot();
  end
end


function HouseManager.GetTotalLevel()
  return houseTotalLevel;
end

function HouseManager.HouseCanOpen(house)
  if house == 1 then return true end
  return building[house - 1].floorLevel == EHouseFloorLevel.SecondExpanded;
end

function HouseManager.HouseIsOpen(house)
  return house <= current_BuildingLevel;
end

function HouseManager.FloorIsOpen(house, floor)
  local floorOpen = false;
  if floor == 1 then
    floorOpen = true;
  elseif floor == 2 then
    floorOpen = building[house].floorLevel == EHouseFloorLevel.SecondExpanded;
  end
  
  return this.HouseIsOpen(house) and floorOpen;
end


function HouseManager.TeleportStuckPlayer()
  if Role.player == nil then return end

  if HouseManager.IsInHouse() and not FurnitureManager.GetPlayerIsInteracting() then
      local startBlockX, startBlockY = MapManager.GetBlock(Role.player.position);
      if MapManager.IsObstacle(startBlockX, startBlockY) then
        local targetBlockX, targetBlockY = MapManager.GetStartEmptyBlock(startBlockX, startBlockY);
        if not MapManager.IsObstacle(targetBlockX, targetBlockY) then
          local newPosition = Vector2.New(MapManager.GetPosition(Vector2.New(targetBlockX, targetBlockY)));
          Role.player:SetAnimationForceId(ERolePose.None);
          this.TeleportPlayer(Role.player, newPosition);
        end
      end
  end
end

function HouseManager.TeleportPlayer(player, position)
  if player == nil or position == nil then return end
  if not correctWayIntoHouse then return end
  CGTimer.RemoveListener(MoveController.SendRolePosition);
  --C:106-009 <小屋玩家瞬移> +房間主人ID(8) +房屋編號(1) +樓層(1) +玩家ID(8) +座標X(2) +座標Y(2)
  sendBuffer:Clear();
  sendBuffer:WriteInt64(HouseManager.GetHouseOwnerId());
  sendBuffer:WriteByte(HouseManager.GetCurrentBuilding());
  sendBuffer:WriteByte(HouseManager.GetCurrentFloor());
  sendBuffer:WriteInt64(player.index);
  sendBuffer:WriteUInt16(position.x);
  sendBuffer:WriteUInt16(position.y);
  Network.Send(106, 9, sendBuffer);
end