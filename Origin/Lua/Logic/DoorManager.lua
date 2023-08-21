require "View/Door"

DoorManager = {};
local this = DoorManager;

this.doorRoot = nil;
this.areas = {};
this.doors = {};
this.currentMeetDoorID = 0;

this.portalTexture = "";
this.arrowTexture = "";

local clickDoorDistance = math.pow(300, 2);

function DoorManager.Destroy()
  poolMgr:DestroyPool("BaseDoor");
  poolMgr:DestroyPool("DoorMaterial");
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

function DoorManager.Initialize()
  this.doorRoot = GameObject.Find("DoorRoot").transform;

  CGResourceManager.Load(
    "BaseDoor",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("BaseDoor", asset);
    end
  );

  CGResourceManager.Load(
    "DoorMaterial",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("DoorMaterial", asset);
    end
  );

  this.portalTexture = "PortalDoor";
  this.arrowTexture = "ArrowDoor";
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
  NotifyManager.Register(ENotifyManager.EnterScene, "DoorManager", this.OnEnterScene);
  NotifyManager.Register(ENotifyManager.ExitScene, "DoorManager", this.OnExitScene);
end

function DoorManager.OnEnterScene(checkCode)
  local doorDatas = SceneManager.sceneState.doorTable;

  if doorDatas == nil then
    logError("DoorManager.OnEnterScene doorDatas = nil");
  end

  --event
  this.currentMeetDoorID = 0;

  --area
  table.Clear(this.areas);
  
  local minSceneCode = SceneManager.sceneId * 1000;
  local maxSceneCode = minSceneCode + 1000;

  for sceneCode, fromScenes in pairs(navigationDatas) do
    if sceneCode >= minSceneCode and sceneCode < maxSceneCode then
      local areaId = sceneCode % 1000;

      this.areas[areaId] = {};

      for k, toScenes in pairs(fromScenes) do
        for kk, doorId in pairs(toScenes) do
          table.insert(this.areas[areaId], math.floor(doorId * 0.001));
        end
      end
    end
  end

  --door
  if doorDatas ~= nil then
    for k, v in pairs(doorDatas) do
      if not v.close then
        this.CreateDoor(v);
      end
    end
  end

  CGTimer.AddListener(this.Update, 0.1, false);
end

function DoorManager.SetDoor(doorId, active)
  if active then
    if doorDatas ~= nil then
      for k, v in pairs(doorDatas) do
        if v.id == doorId then
          this.CreateDoor(v);
          break;
        end
      end
    end
  else
    this.DestroyDoor(doorId);
  end
end

function DoorManager.OnExitScene()
  --event
  this.currentMeetDoorID = 0;

  --area
  table.Clear(this.areas);

  --door
  for k in pairs(this.doors) do
    this.DestroyDoor(k);
  end

  CGTimer.RemoveListener(this.Update);
end

function DoorManager.CreateDoor(doorData)
  if doorData == nil then return end
  if this.doors[doorData.id] ~= nil and this.doors[doorData.id].view ~= nil then return end
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
  local door = {};
      
  door.id = doorData.id;
  door.areaId = 1;
  door.trigEvent = doorData.eventCount > 0;

  door.rect = Rect.New();
  door.rect.x = (doorData.gridX - 1) * MapManager.BLOCK_UNIT + MapManager.centerLeft;
  door.rect.y = (doorData.gridY - 1) * MapManager.BLOCK_UNIT + MapManager.centerTop;
  door.rect.width = doorData.gridWidth * MapManager.BLOCK_UNIT;
  door.rect.height = doorData.gridHeight * MapManager.BLOCK_UNIT;

  door.grid = Vector2.New(doorData.gridX + math.floor(doorData.gridWidth / 2), doorData.gridY + math.floor(doorData.gridHeight / 2));
  if MapManager.IsObstacle(door.grid.x, door.grid.y) then
    for x = 0, doorData.gridWidth - 1 do
      for y = 0, doorData.gridHeight - 1 do
        if not MapManager.IsObstacle(doorData.gridX + x, doorData.gridY + y) then
          door.grid.x = doorData.gridX + x;
          door.grid.y = doorData.gridY + y;
          break;
        end
      end
    end
  end

  door.lastBumpTime = CGTimer.time;
  
  if doorData.imgInfo.position ~= Vector2.zero then
    door.view = Door.New(doorData);
  end

  this.doors[doorData.id] = door;
end

function DoorManager.DestroyDoor(doorId)
  if this.doors[doorId] == nil then return end

  if this.doors[doorId].view ~= nil then
    this.doors[doorId].view:Destroy();
    this.doors[doorId].view = nil;
  end

  this.doors[doorId] = nil;
end

local function GetDoorPosition(door)
  return Vector2.New((door.grid.x - 0.5) * MapManager.BLOCK_UNIT + MapManager.centerLeft, (door.grid.y - 0.5) * MapManager.BLOCK_UNIT + MapManager.centerTop);
end

local function isClickDoorDistance(door)
  local sqrDistance = (GetDoorPosition(door) - Role.player.position).sqrMagnitude;

  if sqrDistance <= clickDoorDistance then
    return true;
  else
    return false;
  end
end 

function DoorManager.ClickDoor(mousePosition)
  if not Role.CanControl() then return false end
  if EventManager.IsRunning() then return false end

  for k, v in pairs(this.doors) do
    if v.trigEvent then
      if v.rect:Contains(mousePosition) then
        if MarkManager.navigationTarget == nil or v.rect:Contains(MarkManager.navigationTarget) then
          if isClickDoorDistance(v) then
            EventManager.OnClickDoorEvent(EEventTrigger.ClickDoor, v);
            return true;
          end
        end
      end
    end
  end
  
  return false;
end

function DoorManager.Update()
  if EventManager.IsRunning() then return end

  local isGot = false;
  local playerPosition = Role.player.position;
  
  for k, v in pairs(this.doors) do
    if v.trigEvent then
      if v.rect:Contains(playerPosition) then
        if MarkManager.navigationTarget == nil or v.rect:Contains(MarkManager.navigationTarget) then
          isGot = true;

          if this.currentMeetDoorID ~= v.id then
            this.currentMeetDoorID = v.id;
            MarkManager.CheckNavigationDoor(v);
            EventManager.OnDoorEvent(EEventTrigger.MeetDoor, v);
            break;
          end
        end
      end
    end
  end

  if not isGot then
    this.currentMeetDoorID = 0;
  end
end

function DoorManager.GetDoorIdPosition(doorId)
  for k, v in pairs(this.doors) do
    if v.id == doorId then
      return GetDoorPosition(v);      
    end
  end
end

function DoorManager.GetDoorGrid(doorId)
  for k, v in pairs(this.doors) do
    if v.id == doorId then
      return v.grid;
    end
  end
end

function DoorManager.GetArea(position)
  local gridX, gridY = MapManager.GetBlock(position);

  for k, v in pairs(this.areas) do
    if table.maxn(v) > 0 then
      local doorGrid = this.GetDoorGrid(v[1]);

      if doorGrid ~= nil then
        if FindWay.FindAStarPath(gridX, gridY, doorGrid.x, doorGrid.y, false, nil, nil, nil, nil, true) then
          return k;
        end
      end
    end
  end

  return 1;
end
