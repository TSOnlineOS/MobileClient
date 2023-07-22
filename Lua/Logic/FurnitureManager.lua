
EFurnitureAttribute = {
  AmountOfFurnituresOnScene = 1,
  FurnituresWithoutDecorateOnScene = 2,
}

FurnitureManager = {}
local this = FurnitureManager;

this.attributes = {};
local allFurnitures = {};
local furnituresOnScene = {};
local furnituresInBag = {};
local interactingPlayers = {};
local serFurnitureData = {};

local selectedFurniture;
local playerIsInteracting = false;
local interactiveDistance = 0;

function FurnitureManager.Initialize()
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
  this.attributes[EFurnitureAttribute.AmountOfFurnituresOnScene] = 0;
  this.attributes[EFurnitureAttribute.FurnituresWithoutDecorateOnScene] = 0;
end

function FurnitureManager.Destroy()
  Furniture.Destroy();
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

function FurnitureManager.EnterScene()
  this.CheckAllFurnituresInteractive();
end

function FurnitureManager.ExitScene()
  this.DestroyAllFurnituresOnScene();
  this.StopLoopMusic();
  this.ClearFurnituresInBag();
  playerIsInteracting = false;
  interactingPlayers = {};
  allFurnitures = {};
end

function FurnitureManager.ClearFurnituresInBag()
  furnituresInBag = {};
end

function FurnitureManager.GetFurnituresInBag()
  return furnituresInBag;
end

function FurnitureManager.CheckAllFurnituresInteractive()
  if HouseEditorManager.IsOpen() then return end

  for k, v in pairs(furnituresOnScene) do
    v:UpdateCollision();
  end

  this.CheckPlayerIsInteractive();
end

function FurnitureManager.DestroyAllFurnituresOnScene()
  for f, v in pairs(furnituresOnScene) do
    v:ClearOldBlockProperty();
    v:Destroy();
  end
  furnituresOnScene = {};
end

function FurnitureManager.ReceiveAllFurnituresOnScene()
  for f, v in pairs(furnituresOnScene) do
    FurnitureManager.RemoveFurnitureOnScene(v);
    v:Destroy();
  end

  furnituresOnScene = {};
end

function FurnitureManager.CreateFurniture(id, showUIInteractive, blockX, blockY, blockZ, direction)
  if furnitureDatas[id] == nil then return end
  if blockX ~= nil and blockY ~= nil and blockZ ~= nil and direction ~= nil then
    if not this.CanPlaceInsideBlock(id, blockX, blockY, blockZ, direction) then return end
  end

  this.ResetFurnituresIndex();
  local furnitureController;
  local furnitureCount = table.Count(furnituresOnScene);

  furnitureController = FurnitureController.New(furnitureCount, id);
  furnituresOnScene[furnitureController.index] = furnitureController;

  if showUIInteractive then
    local cameraPosition = Vector2.New(furnitureController:GetMiddlePosition().x, -furnitureController:GetMiddlePosition().y);
    Scene.UpdateCamera(cameraPosition);
    UI.Open(UIFurnitureInteractive, furnitureController);
  end

  if blockX ~= nil and blockY ~= nil and blockZ ~= nil and direction ~= nil then
    furnitureController:SetPositionAndDirection(blockX, blockY, blockZ, direction);
    furnitureController:SetOccupyBlockProperty();
    furnitureController:SetOldOccupyBlock();
  end

  furnitureController:UpdateCollision();
end

function FurnitureManager.RemoveFurnitureOnScene(furnitureController)
  if furnitureController == selectedFurniture then
    selectedFurniture = nil;
  end

  if furnitureController ~= nil then
    furnituresOnScene[furnitureController.index] = nil;
    this.AddFurnitureAmount(furnitureController.Id, 1);
  end

  this.ResetFurnituresIndex();
end

function FurnitureManager.ResetFurnituresIndex()
  local index = 0;
  local tempFurnituresTable = {};

  for f, v in pairs(furnituresOnScene) do
    v.index = index;
    tempFurnituresTable[index] = v;
    index = index + 1;
  end

  furnituresOnScene = {};

  for f, v in pairs(tempFurnituresTable) do
    furnituresOnScene[v.index] = v;
    v:ResetName();
  end
end

function FurnitureManager.OnClickFurniture(furnitureController)
  if selectedFurniture ~= nil then
    if playerIsInteracting then
      selectedFurniture:RemoveOccupyPoint(Role.playerId);
      selectedFurniture:InteractiveWithCheckOccupyPoint(false, Role.player);
      selectedFurniture:Deselect();
      return
    end

    if table.Count(selectedFurniture.interactiveKind) == 0 then
      selectedFurniture:Deselect();
      if selectedFurniture == furnitureController then
        selectedFurniture = nil;
        return
      end
    end

    if table.Count(selectedFurniture.interactiveKind) == 1 and selectedFurniture.effectType == EFurnitureEffect.PlayOnStart then
      selectedFurniture:Deselect();
      if selectedFurniture == furnitureController then
        selectedFurniture = nil;
        return
      end
    end
  end

  selectedFurniture = furnitureController;

  if selectedFurniture ~= nil then
    MarkManager.StopNavigation();
    Role.SetMoveTarget(selectedFurniture);

    if not CGTimer.ContainsListener(this.CheckInteractive) then
      local angle = 180 - HouseEditorManager.blockAngle * 2;
      local radians = angle * Mathf.PI / 180;
      local hypotenuse = math.pow(selectedFurniture.occupyX, 2) + math.pow(selectedFurniture.occupyY, 2) - 2 * selectedFurniture.occupyX * selectedFurniture.occupyY * Mathf.Cos(radians);
      local hypotenuseLength = HouseEditorManager.blockSize * HouseEditorManager.blockSize * hypotenuse * 0.25;
      interactiveDistance = math.max(hypotenuseLength, math.pow(Role.clickDistance, 2));
      CGTimer.AddListener(this.CheckInteractive, 0, true);
    end
  end
end

function FurnitureManager.CheckInteractive()
  if selectedFurniture == nil then
    CGTimer.RemoveListener(this.CheckInteractive);
    interactiveDistance = 0;
    return
  end

  local sqrDistance = (selectedFurniture.position - Role.player.position).sqrMagnitude;

  if sqrDistance <= interactiveDistance then
    if selectedFurniture:IsSelected() then
      selectedFurniture:Deselect();
      selectedFurniture:RemoveOccupyPoint(Role.playerId);
      selectedFurniture:InteractiveWithCheckOccupyPoint(false, Role.player);
      selectedFurniture = nil;
    else
      selectedFurniture:Selected();
      selectedFurniture:Interactive();
    end
    CGTimer.RemoveListener(this.CheckInteractive);
    interactiveDistance = 0;
  elseif UIJoystick.IsDrag() or UIJoystick.IsClick() then
    this.OnClickFurniture(nil);
  end
end

function FurnitureManager.OnOpenHouseEditor()
  --編輯模式開啟時停止家具動作
  for k, v in pairs(furnituresOnScene) do
    v:Deselect();

    if v.isInteracting then
      v:SetTexture(v:GetTextureNumber(false), 0);
      v:CancelAllPlayerInteractive();
    end

    if v.data.dynamic == EFurnitureDynamic.Dynamic then
      v:CancelDynamicAnimation();
    end

    if v.data.kind == EFurnitureKind.Decorate then
      v:SetRaycastTarget(true);
    end
    if v.effectType == EFurnitureEffect.PlayOnStart then
      v:CancelAutoEffect();
    end
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
end

function FurnitureManager.OnCloseHouseEditor()
  this.SetFurnitureTransParent();

  --編輯模式關閉時開啟家具動作
  for k, v in pairs(furnituresOnScene) do
    if v.data.dynamic == EFurnitureDynamic.Dynamic then
      v:AddDynamicAnimation();
    end

    if v.effectType == EFurnitureEffect.PlayOnStart then
      v:AddEffectAnimation();
    end

    local dataType = FurnitureKindData.GetTypeByFurnitureDataKind(v.data.kind);

    if dataType ~= EFurnitureKindType.Furniture then
      v:SetRaycastTarget(false);
    end
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
end

function FurnitureManager.SendFurnitureData()
  --C:106-006 <小屋家具> +房屋編號(1) +樓層(1) +家具數量(4) +家具資料<<家具ID(2) +家具座標X(1) +家具座標Y(1) +家具座標Z(1) +家具方向(1)>>
  local house = HouseManager.GetCurrentBuilding();
  local floor = HouseManager.GetCurrentFloor();
  local furnitureCount = table.Count(furnituresOnScene);
  if house == nil or floor == nil then return end

  sendBuffer:Clear();
  sendBuffer:WriteByte(house);
  sendBuffer:WriteByte(floor);
  sendBuffer:WriteUInt32(furnitureCount);
  for k, v in pairs(furnituresOnScene) do
    sendBuffer:WriteUInt16(v.Id);
    sendBuffer:WriteByte(v.blockX);
    sendBuffer:WriteByte(v.blockY);
    sendBuffer:WriteByte(v.blockZ);
    sendBuffer:WriteByte(v.direction);
  end
  Network.Send(106, 6, sendBuffer);
end

function FurnitureManager.SendAskAllFurnitures()
  --C:106-008 <要求玩家背包資料>
  sendBuffer:Clear();
  Network.Send(106, 8, sendBuffer);
end

function FurnitureManager.SetFurnituresOccupyBlockProperty()
  for k, v in pairs(furnituresOnScene) do
    if not v.onSetting then
      v:SetOccupyBlockProperty();
    end
  end
end

function FurnitureManager.UpdateFurnituresScoreOnScene()
  local score = 0;

  for k, v in pairs(furnituresOnScene) do
    score = score + v.data.decorateScore;
  end

  HouseManager.SetCurrentFloorScore(score);
  UIHouseEditor.UpdateScoreInfo();
end

function FurnitureManager.UpdateFurnituresAmountOnScene()
  local amount = 0;
  local amountWithoutDecorate = 0;
  amount = table.Count(furnituresOnScene);
  amountWithoutDecorate = this.NumberOfFurnituresWithoutDecorateAmountOnScene();
  this.SetAttribute(EFurnitureAttribute.AmountOfFurnituresOnScene, amount);
  this.SetAttribute(EFurnitureAttribute.FurnituresWithoutDecorateOnScene, amountWithoutDecorate);
  UIHouseEditor.UpdateAmountInfo();
end

function FurnitureManager.NumberOfFurnituresWithoutDecorateAmountOnScene()
  local amount = 0;

  for k, v in pairs(furnituresOnScene) do
    local dataType = FurnitureKindData.GetTypeByFurnitureDataKind(v.data.kind);

    if dataType ~= EFurnitureKindType.Decorate then
      amount = amount + 1;
    end
  end

  return amount;
end

function FurnitureManager.SetAttribute(attributeKind, value)
  this.attributes[attributeKind] = value;
end

function FurnitureManager.SetAllFurnituresTable(furnitures)
  allFurnitures = furnitures;
  FurnitureCollection.SetCollectAttribute(EFurnitureCollectAttribute.FurnitureKindCount, table.Count(furnitures));
  local score = 0;
  for k, v in pairs(furnitures) do
    if furnitureDatas[k] ~= nil then
      score = score + furnitureDatas[k].decorateScore;
    end
  end
  FurnitureCollection.SetCollectAttribute(EFurnitureCollectAttribute.Score, score);
end

function FurnitureManager.SetFurnitureTransParent(currentMainKind)
  for k, v in pairs(furnituresOnScene) do
    v:SetAlpha(1);
    v:SetRaycastTarget(true);

    local dataMainKinds = FurnitureKindData.GetMainKindsByFurnitureDataKind(v.data.kind);

    if currentMainKind ~= nil then
      if not table.Contains(dataMainKinds, currentMainKind) then
        v:SetAlpha(0.5);
        v:SetRaycastTarget(false);
      end
    end
  end
end

function FurnitureManager.SetFurnitureTransParentByName(name)
  for k, v in pairs(furnituresOnScene) do
    v:SetAlpha(0.5);
    v:SetRaycastTarget(false);

    if string.find(npcDatas[v.Id].name, name) ~= nil then
      v:SetAlpha(1);
      v:SetRaycastTarget(true);
    end
  end
end

function FurnitureManager.GetFurnitureAmount(id)
  if furnitureDatas[id] == nil then return end

  return furnituresInBag[id] or 0;
end

function FurnitureManager.GetFurnitureLevel(id)
  if furnitureDatas[id] == nil then return end

  return furnitureDatas[id].level or 1;
end

function FurnitureManager.SetFurnitureAmount(id, amount)
  if furnitureDatas[id] == nil then return end

  furnituresInBag[id] = amount;

  if UI.IsVisible(UIHouseEditor) then
    UIHouseEditor.UpdateFurnituresByCurrentSecondSubKind();
  end
end

function FurnitureManager.AddFurnitureAmount(id, amount)
  if furnitureDatas[id] == nil then return end

  local newAmount = this.GetFurnitureAmount(id) + amount;
  this.SetFurnitureAmount(id, newAmount);
end

function FurnitureManager.StopLoopMusic()
  AudioManager.StopFurnitureLoopMusic();
end

function FurnitureManager.CanPlaceFurniture(id)
  --檢查數量
  local dataType = FurnitureKindData.GetTypeByFurnitureDataKind(furnitureDatas[id].kind);

  if dataType == EFurnitureKindType.Decorate then
    return true;
  elseif this.attributes[EFurnitureAttribute.FurnituresWithoutDecorateOnScene] < HouseEditorManager.maxAmountOfFurnitureOnScene then
    return true;
  else
    ShowCenterMessage(string.Get(23556));
    return false;
  end
end

function FurnitureManager.SetPlayerIsInteracting(isInteracting)
  playerIsInteracting = isInteracting;
end

function FurnitureManager.GetPlayerIsInteracting()
  return playerIsInteracting;
end

function FurnitureManager.AddInteractingPlayer(playerIndex, furniture)
  interactingPlayers[playerIndex] = furniture;
end

function FurnitureManager.RemoveInteractingPlayer(playerIndex)
  local player = Role.players[playerIndex];
  interactingPlayers[playerIndex] = nil;

  if player ~= nil then
    player:UpdateViewPosition();
  end
end

function FurnitureManager.CheckPlayerIsInteractive()
  for k, v in pairs(interactingPlayers) do
    local pointPosition = v:GetInteractivePointPositionByPlayer(k);

    if Role.players[k] == nil then
      if pointPosition ~= nil then
        v:RemoveOccupyPoint(k);
      end
      interactingPlayers[k] = nil;
    elseif pointPosition == nil or (Role.players[k].position - pointPosition).magnitude > 2 or
            houseEditorSceneSetDatas[Role.players[k].data.sceneId] == nil then
      v:RemoveOccupyPoint(k);
      v:InteractiveWithCheckOccupyPoint(false, Role.players[k]);
    end
  end
end

function FurnitureManager.PlayerIsInteractive(index)
  for k, v in pairs(interactingPlayers) do
    if k == index and v ~= nil then
      return true;
    end
  end

  return false;
end

function FurnitureManager.CanPlaceOnGround()
  --小屋有障礙點的家具不能放滿，留空間走
  local furnituresOccupyBlockCount = 0;

  for k, v in pairs(furnituresOnScene) do
    if HouseEditorManager.GetFurnitureKindType(v.data.kind) == EFurnitureKindType.Furniture and v.data.type == EFurnitureType.Ground then
      furnituresOccupyBlockCount = furnituresOccupyBlockCount + v:NumberOfOccupyBlocks();
    end
  end

  if furnituresOccupyBlockCount >= HouseEditorManager.sizeX * HouseEditorManager.sizeY then
    return true;
  end

  return false;
end

function FurnitureManager.CanPlaceInsideBlock(id, blockX, blockY, blockZ, direction)
  --確定家具沒有放超過格子
  local x = 0;
  local y = 0;
  local z = 0;
  local data = furnitureDatas[id];
  if data == nil then return false end

  if direction == EFurnitureDirection.LeftDown or direction == EFurnitureDirection.RightUp then
    if data.type == EFurnitureType.Ground then
      x = data.occupyBlockX;
      y = data.occupyBlockY;
      z = 0;
    elseif data.type == EFurnitureType.Wall then
      x = 0;
      y = data.occupyBlockY;
      z = data.occupyBlockX;
    end
  elseif direction == EFurnitureDirection.RightDown or direction == EFurnitureDirection.LeftUp then
    if data.type == EFurnitureType.Ground then
      x = data.occupyBlockY;
      y = data.occupyBlockX;
      z = 0;
    elseif data.type == EFurnitureType.Wall then
      x = data.occupyBlockY;
      y = 0;
      z = data.occupyBlockX;
    end
  end

  if blockX + x <= HouseEditorManager.sizeX + 1 and blockY + y <= HouseEditorManager.sizeY + 1 and blockZ + z <= HouseEditorManager.sizeZ + 1 then
    return true;
  end

  return false;
end

function FurnitureManager.ReceiveFurnitureInteractive(id, x, y, z, furnitureKindType, interactive)
  local furniture = HouseEditorManager.GetBlockFurniture(x, y, z, furnitureKindType)
  furniture:ReceiveInteractive(id, interactive);
end

function FurnitureManager.ReceiveFurnitureData(furnitureData)
  serFurnitureData = {};
  serFurnitureData = furnitureData;
  this.CreateFurnitureData();
  this.OnCloseHouseEditor();
  --收到家具資料，檢查互動點
  this.CheckAllFurnituresInteractive();

  HouseManager.TeleportStuckPlayer();
end

function FurnitureManager.CreateFurnitureData()
  this.DestroyAllFurnituresOnScene();
  if serFurnitureData == nil then return end
  if table.Count(serFurnitureData) <= 0 then return end

  for i = 1, table.Count(serFurnitureData) do
    this.CreateFurniture(serFurnitureData[i].Id, false, serFurnitureData[i].blockX, serFurnitureData[i].blockY, serFurnitureData[i].blockZ, serFurnitureData[i].direction);
  end
end

function FurnitureManager.GetAllFurnitures()
  return allFurnitures;
end