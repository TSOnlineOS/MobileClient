
EBlockPositionArea = {
  All = 0; --全部
  Ground = 1; --地板
  Wall = 2; --牆壁
  LeftWall = 3; --左邊牆
  RightWall = 4; --右邊牆
}

--家具占用的格子
EBlockProperty = {
  Empty = 0; --空的
  Furniture = 1; --家具
}

HouseEditorManager = {}
local this = HouseEditorManager;

--起始點位置
this.originalX = 0;
this.originalY = 0;
--格子數
this.sizeX = 0;
this.sizeY = 0;
this.sizeZ = 0;
--家具數量上限
this.maxAmountOfFurnitureOnScene = 0;
--地板角度
this.blockAngle = 26.55;
--格子大小
this.blockSize = 44.7;

local radians;

local houseEditorBlockRoot;
local houseEditorGround;
local houseEditorWall;

local houseEditorBlock;

local houseEditorIsOpen = false;

function HouseEditorManager.Destroy()
  poolMgr:DestroyPool("BaseHouseEditorBlock");
end

function HouseEditorManager.Initialize()
  houseEditorBlockRoot = GameObject.New();
  houseEditorBlockRoot.name = "HouseEditorRoot";
  houseEditorBlockRoot.transform:SetParent(Scene.transform);
  local canvas = houseEditorBlockRoot:AddComponent(typeof(Canvas));
  canvas.overrideSorting = true;
  canvas.sortingOrder = 3;
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
  houseEditorGround = GameObject.New();
  houseEditorGround.name = "HouseEditorGround";
  houseEditorGround.transform:SetParent(houseEditorBlockRoot.transform);

  --新增RectTransform
  local tempCanvas = houseEditorGround:AddComponent(typeof(Canvas));
  tempCanvas:Destroy();

  houseEditorWall = GameObject.New();
  houseEditorWall.name = "HouseEditorWall";
  houseEditorWall.transform:SetParent(houseEditorBlockRoot.transform);

  --新增RectTransform
  tempCanvas = houseEditorWall:AddComponent(typeof(Canvas));
  tempCanvas:Destroy();

  CGResourceManager.Load(
    "BaseHouseEditorBlock",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("BaseHouseEditorBlock", asset);
    end
  );
end

function HouseEditorManager.Open()
  if houseEditorSceneSetDatas[SceneManager.sceneId] == nil then return end

  houseEditorBlockRoot:SetActive(true);
  houseEditorIsOpen = true;
  this.SetAreaActive(0);

  FurnitureManager.SendAskAllFurnitures();
  FurnitureManager.OnOpenHouseEditor();
  Role.AllRoleSetVisible(ERoleVisible.Hide);
  UI.Open(UIHouseEditor);
  UI.Close(UIHouseFunction);
  UI.Close(UIJoystick);
  UI.Close(UIMain);
  UI.Close(UINewChat);
  UI.Close(UIMainFunction);
  UI.Close(UIInteractive);
  UI.Close(UIMiniMap);
  Function.UpdateVisible();
end

function HouseEditorManager.Close()
  if UI.IsVisible(UIFurnitureInteractive) then
    ShowCenterMessage(string.Get(22595));
    return
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
  houseEditorBlockRoot:SetActive(false);
  houseEditorIsOpen = false;
  FurnitureManager.OnCloseHouseEditor();
  Role.AllRoleSetVisible(ERoleVisible.Visible);
  UI.Close(UIHouseEditor);
  UI.Open(UIHouseFunction);
  SceneManager.Show();
  Function.UpdateVisible();

  --開啟商城抽抽樂介面
  if UIHouseEditor.IsGoGaCha() then
    UI.Open(UIMall, 4);
  end
end

function HouseEditorManager.EnterScene()
  if houseEditorSceneSetDatas[SceneManager.sceneId] == nil then return end
  this.EditorBlockInitialize();
end

function HouseEditorManager.ExitScene()
  if UI.IsVisible(UIHouseEditor) then
    this.Close();
  end
  this.CloseEditorMode();
end

function HouseEditorManager.EditorBlockInitialize()
  if houseEditorSceneSetDatas[SceneManager.sceneId] == nil then return end
  local data = houseEditorSceneSetDatas[SceneManager.sceneId];

  this.originalX = data.originalX;
  this.originalY = data.originalY;
  this.sizeX = data.sizeX;
  this.sizeY = data.sizeY;
  this.sizeZ = data.sizeZ;
  this.maxAmountOfFurnitureOnScene = data.maxAmountOfFurnitureOnScene;
  radians = this.blockAngle * Mathf.PI / 180;
  houseEditorBlock = {};
  houseEditorBlock[0] = {};
  houseEditorBlock[0][0] = {};
  houseEditorBlock[0][0][0] = {};
  houseEditorBlock[0][0][0].position = Vector2.New(this.originalX, this.originalY);

  --地板
  this.InitializeGroundBlock();

  --左邊牆
  this.InitializeLeftWallBlock();

  --右邊牆
  this.InitializeRightWallBlock();
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

  houseEditorBlockRoot:SetActive(false);
  houseEditorIsOpen = false;
  FurnitureManager.OnCloseHouseEditor();
end

function HouseEditorManager.CloseEditorMode()
  if houseEditorBlock == nil then return end
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
  for x = 1, this.sizeX do
    for y = 1, this.sizeY do
      if houseEditorBlock[x][y][0].block ~= nil then
        poolMgr:Release("BaseHouseEditorBlock", houseEditorBlock[x][y][0].block);
        houseEditorBlock[x][y][0].block = nil;
      end
    end
  end

  --左邊牆
  for x = 1, this.sizeX do
    for z = 1 , this.sizeZ do
      if houseEditorBlock[x][0][z].block ~= nil then
        poolMgr:Release("BaseHouseEditorBlock", houseEditorBlock[x][0][z].block);
        houseEditorBlock[x][0][z].block = nil;
      end
    end
  end

  --右邊牆
  for y = 1, this.sizeY do
    for z = 1 , this.sizeZ do
      if houseEditorBlock[0][y][z].block ~= nil then
        poolMgr:Release("BaseHouseEditorBlock", houseEditorBlock[0][y][z].block);
        houseEditorBlock[0][y][z].block = nil;
      end
    end
  end

  houseEditorBlock = nil;
end

function HouseEditorManager.InitializeGroundBlock()
  for x = 1, this.sizeX do
    houseEditorBlock[x] = {};
    for y = 1, this.sizeY do
      houseEditorBlock[x][y] = {};
      houseEditorBlock[x][y][0] = {};

      for k, v in pairs(EFurnitureKindType) do
        houseEditorBlock[x][y][0][v] = {};
        houseEditorBlock[x][y][0][v].furniture = nil;
        houseEditorBlock[x][y][0][v].property = EBlockProperty.Empty;
      end

      houseEditorBlock[x][y][0].block = this.GetHouseEditorBlockFromPool();
      houseEditorBlock[x][y][0].position = Vector2.New(this.originalX + this.blockSize * (y - x) * Mathf.Cos(radians),
        this.originalY - this.blockSize * (x + y - 1) * Mathf.Sin(radians) );

      this.SetHouseEditorBlock(houseEditorBlock[x][y][0].block, houseEditorBlock[x][y][0].position, EBlockPositionArea.Ground);
      this.SetHouseEditorBlockTexture(houseEditorBlock[x][y][0].block, EBlockPositionArea.Ground);
    end
  end
end

function HouseEditorManager.InitializeLeftWallBlock()
  for x = 1, this.sizeX do
    houseEditorBlock[x][0] = {};
    for z = 1 , this.sizeZ do
      houseEditorBlock[x][0][z] = {};

      for k, v in pairs(EFurnitureKindType) do
        houseEditorBlock[x][0][z][v] = {};
        houseEditorBlock[x][0][z][v].furniture = nil;
        houseEditorBlock[x][0][z][v].property = EBlockProperty.Empty;
      end

      houseEditorBlock[x][0][z].block = this.GetHouseEditorBlockFromPool();
      houseEditorBlock[x][0][z].position = Vector2.New(this.originalX - (this.blockSize * (x - 0.5) * Mathf.Cos(radians)),
        this.originalY  + (this.blockSize * Mathf.Sin(radians) * (z * 2 - x - 0.5)));

      this.SetHouseEditorBlock(houseEditorBlock[x][0][z].block, houseEditorBlock[x][0][z].position, EBlockPositionArea.Wall);
      this.SetHouseEditorBlockTexture(houseEditorBlock[x][0][z].block, EBlockPositionArea.LeftWall);
    end
  end
end

function HouseEditorManager.InitializeRightWallBlock()
  for y = 1, this.sizeY do
    houseEditorBlock[0][y] = {};
    for z = 1 , this.sizeZ do
      houseEditorBlock[0][y][z] = {};

      for k, v in pairs(EFurnitureKindType) do
        houseEditorBlock[0][y][z][v] = {};
        houseEditorBlock[0][y][z][v].furniture = nil;
        houseEditorBlock[0][y][z][v].property = EBlockProperty.Empty;
      end

      houseEditorBlock[0][y][z].block = this.GetHouseEditorBlockFromPool();
      houseEditorBlock[0][y][z].position = Vector2.New( this.originalX + (this.blockSize * (y - 0.5) * Mathf.Cos(radians)),
        this.originalY  + (this.blockSize * Mathf.Sin(radians) * (z * 2 - y - 0.5)));

      this.SetHouseEditorBlock(houseEditorBlock[0][y][z].block, houseEditorBlock[0][y][z].position, EBlockPositionArea.Wall);
      this.SetHouseEditorBlockTexture(houseEditorBlock[0][y][z].block, EBlockPositionArea.RightWall);
    end
  end
end

function HouseEditorManager.SetHouseEditorBlockTexture(block, positionArea)
  if block == nil then return end
  local rawImage;

  rawImage = block:GetComponent("RawImage");

  --設定地板編輯格子貼圖
  if positionArea == EBlockPositionArea.Ground then
    TextureManager.SetPng(ETextureUseType.UI, "common0_house001", rawImage);

    --設定左邊牆編輯格子貼圖
  elseif positionArea == EBlockPositionArea.LeftWall then
    TextureManager.SetPng(ETextureUseType.UI, "common0_house003", rawImage);

    --設定右邊牆編輯格子貼圖
  elseif positionArea == EBlockPositionArea.RightWall then
    TextureManager.SetPng(ETextureUseType.UI, "common0_house002", rawImage);
  end

  rawImage:SetNativeSize();
end

function HouseEditorManager.SetHouseEditorBlock(block, position, positionArea)
  local area = this.GetHouseEditorAreaRoot(positionArea);

  if area ~= nil then
    block.transform:SetParent(area.transform);
  end

  local rectTransform = block:GetComponent("RectTransform");
  rectTransform.anchoredPosition = position;
  rectTransform.localScale = Vector3.one;
end

function HouseEditorManager.SetAreaActive(furnitureType)
  if furnitureType == EFurnitureType.Ground then
    houseEditorGround:SetActive(true);
    houseEditorWall:SetActive(false);
  elseif furnitureType == EFurnitureType.Wall then
    houseEditorGround:SetActive(false);
    houseEditorWall:SetActive(true);
  else
    houseEditorGround:SetActive(true);
    houseEditorWall:SetActive(true);
  end
end

function HouseEditorManager.GetHouseEditorBlockFromPool()
  local houseEditorBlock = poolMgr:Get("BaseHouseEditorBlock");
  return houseEditorBlock;
end

function HouseEditorManager.GetBlockPosition(blockX, blockY, blockZ)
  if houseEditorBlock == nil then return end
  if blockX > this.sizeX then return end
  if blockY > this.sizeY then return end
  if blockZ > this.sizeZ then return end
  if houseEditorBlock[blockX][blockY][blockZ] == nil then return end
  return houseEditorBlock[blockX][blockY][blockZ].position
end

function HouseEditorManager.GetHouseEditorAreaRoot(area)
  if area == EBlockPositionArea.All then
    return houseEditorBlockRoot;
  elseif area == EBlockPositionArea.Ground then
    return houseEditorGround;
  elseif area == EBlockPositionArea.Wall then
    return houseEditorWall;
  else
    return nil;
  end
end

function HouseEditorManager.GetBlockProperty(blockX, blockY, blockZ, furnitureKindType)
  if houseEditorBlock == nil then return end
  if houseEditorBlock[blockX][blockY][blockZ] == nil then return end
  if houseEditorBlock[blockX][blockY][blockZ][furnitureKindType] == nil then return end

  return houseEditorBlock[blockX][blockY][blockZ][furnitureKindType].property;
end

function HouseEditorManager.GetBlockFurniture(blockX, blockY, blockZ, furnitureKindType)
  if houseEditorBlock == nil then return end
  if houseEditorBlock[blockX][blockY][blockZ] == nil then return end
  if houseEditorBlock[blockX][blockY][blockZ][furnitureKindType] == nil then return end

  return houseEditorBlock[blockX][blockY][blockZ][furnitureKindType].furniture;
end

function HouseEditorManager.GetFurnitureKindType(furnitureKind)
  for k, v in pairs(furnitureKindDatas) do
    if v.Id == furnitureKind then
      return v.type;
    end
  end
end

function HouseEditorManager.ChangeBlockProperty(blockX, blockY, blockZ, property, furnitureKindType)
  if houseEditorBlock == nil then return end
  if houseEditorBlock[blockX][blockY][blockZ] == nil then return end
  if houseEditorBlock[blockX][blockY][blockZ][furnitureKindType] == nil then return end

  houseEditorBlock[blockX][blockY][blockZ][furnitureKindType].property = property;
end

function HouseEditorManager.ChangeBlockFurniture(blockX, blockY, blockZ, furnitureController, furnitureKindType)
  if houseEditorBlock == nil then return end
  if houseEditorBlock[blockX][blockY][blockZ] == nil then return end
  if houseEditorBlock[blockX][blockY][blockZ][furnitureKindType] == nil then return end

  houseEditorBlock[blockX][blockY][blockZ][furnitureKindType].furniture = furnitureController;
end

function HouseEditorManager.ChangeBlockColor(x, y, z, color)
  if houseEditorBlock == nil then return end

  if color == Color.Alpha then
    color = Color.White;
  end

  if houseEditorBlock[x][y][z] ~= nil then
    houseEditorBlock[x][y][z].block:GetComponent("RawImage").color = color;
  end
end

--設定障礙點
function HouseEditorManager.ChangeBlockObstacle(blockX, blockY, blockZ, value)
  if MapManager.mapData == nil then return end

  local obstacleBlock = {{0, 0}, {-1, 1}, {1, 1}, {1, -1}, {-1, -1}};
  local distanceX = 10;
  local distanceY = 10;
  local position = this.GetBlockPosition(blockX, blockY, blockZ):Clone();
  local x, y;

  position.y = -position.y;

  for f, v in pairs(obstacleBlock) do
    local newPosition = Vector2.New(position.x + v[1] * distanceX, position.y + v[2] * distanceY);
    x, y = MapManager.GetBlock(newPosition);

    if MapManager.mapData.blocks[x][y] ~= 1 then
      MapManager.mapData.blocks[x][y] = value;
    end
  end
end

function HouseEditorManager.FindNearestBlock(position, furnitureController)
  if position == nil then return end
  local type = furnitureController.data.type;
  local nearestBlockPosition = Vector2.New(this.originalX, this.originalY);
  local shortestDistance = Vector2.Distance(nearestBlockPosition, position);
  local distance = shortestDistance;
  local blockX = 1;
  local blockY = 1;
  local blockZ = 0;

  if type == EFurnitureType.Ground then
    for x = 1, math.clamp( this.sizeX - furnitureController.occupyX + 1, 1, this.sizeX)do
      for y = 1, math.clamp( this.sizeY - furnitureController.occupyY + 1, 1, this.sizeY) do
        distance = Vector2.Distance(this.GetBlockPosition(x, y, 0), position);
        if distance < shortestDistance then
          shortestDistance = distance;
          blockX = x;
          blockY = y;
          blockZ = 0;
        end
      end
    end

  elseif type == EFurnitureType.Wall then
    blockX = 0;
    blockY = 1;
    blockZ = 1;

    for x = 1, math.clamp( this.sizeX - furnitureController.occupyX + 1, 1, this.sizeX) do
      for z = 1, math.clamp( this.sizeZ - furnitureController.occupyZ + 1, 1, this.sizeZ) do
        distance = Vector2.Distance(this.GetBlockPosition(x, 0, z), position);
        if distance < shortestDistance then
          shortestDistance = distance;
          blockX = x;
          blockY = 0;
          blockZ = z;
        end
      end
    end

    for y = 1, math.clamp( this.sizeY - furnitureController.occupyY + 1, 1, this.sizeY) do
      for z = 1, math.clamp( this.sizeZ - furnitureController.occupyZ + 1 , 1, this.sizeZ)do
        distance = Vector2.Distance(this.GetBlockPosition(0, y, z), position);
        if distance < shortestDistance then
          shortestDistance = distance;
          blockX = 0;
          blockY = y;
          blockZ = z;
        end
      end
    end
  else
    return nil
  end

  return blockX, blockY, blockZ
end

function HouseEditorManager.UpdateAllBlockState()
  for x = 1, this.sizeX do
    for y = 1, this.sizeY do
      for k, v in pairs(EFurnitureKindType) do
        this.ChangeBlockProperty(x, y, 0, EBlockProperty.Empty, v);
      end
      this.ChangeBlockObstacle(x, y, 0, 0);
      this.ChangeBlockColor(x, y, 0, Color.White);
    end
  end

  for x = 1, this.sizeX do
    for z = 1, this.sizeZ do
      for k, v in pairs(EFurnitureKindType) do
        this.ChangeBlockProperty(x, 0, z, EBlockProperty.Empty, v);
      end
      this.ChangeBlockObstacle(x, 0, z, 0);
      this.ChangeBlockColor(x, 0, z, Color.White);
    end
  end

  for y = 1, this.sizeY do
    for z = 1, this.sizeZ do
      for k, v in pairs(EFurnitureKindType) do
        this.ChangeBlockProperty(0, y, z, EBlockProperty.Empty, v);
      end
      this.ChangeBlockObstacle(0, y, z, 0);
      this.ChangeBlockColor(0, y, z, Color.White);
    end
  end

  FurnitureManager.SetFurnituresOccupyBlockProperty();
  FurnitureManager.UpdateFurnituresScoreOnScene();
  FurnitureManager.UpdateFurnituresAmountOnScene();
end

function HouseEditorManager.IsOpen()
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
  return houseEditorIsOpen;
end