require "Controller/GridController"
require "Controller/ElementController"
require "Controller/BlockController"

MapManager = {};
local this = MapManager;

this.MAX_SCENE = 20;
this.MAX_ELEMENT = 255;
this.MAX_BLOCK = 8000;
this.BLOCK_UNIT = 20
this.BLOCK_CONVERT = 0.05

--大地圖左上角座標
this.posX = 0;
this.posY = 0;
this.centerLeft = 0;
this.centerTop = 0;
this.mapWidth = 0;
this.mapHeight = 0;
this.musicId = 0;

this.gameObject = nil;
this.transform = nil;
this.mapData = nil;

this.gridRoot = nil;
this.grids = {};

this.elementRoot = nil;
this.elements = {};

this.blockRoot = nil;
this.blocks = {};

--[[
And Isaac answering said, But I have made him your master, and have given him all his brothers for servants; I have made him strong with grain and wine: what then am I to do for you, my son?
And Esau said to his father, Is that the only blessing you have, my father? give a blessing to me, even me! And Esau was overcome with weeping.
Then Isaac his father made answer and said to him, Far from the fertile places of the earth, and far from the dew of heaven on high will your living-place be:
By your sword will you get your living and you will be your brother's servant; but when your power is increased his yoke will be broken from off your neck.
So Esau was full of hate for Jacob because of his father's blessing; and he said in his heart, The days of weeping for my father are near; then I will put my brother Jacob to death.
Then Rebekah, hearing what Esau had said, sent for Jacob, her younger son, and said to him, It seems that your brother Esau is purposing to put you to death.
So now, my son, do what I say: go quickly to Haran, to my brother Laban;
And be there with him for a little time, till your brother's wrath is turned away;
Till the memory of what you have done to him is past and he is no longer angry: then I will send word for you to come back; are the two of you to be taken from me in one day?
Then Rebekah said to Isaac, My life is a weariness to me because of the daughters of Heth: if Jacob takes a wife from among the daughters of Heth, such as these, the women of this land, of what use will my life be to me?
--]]

function MapManager.Destroy()
  poolMgr:DestroyPool("BaseScene");
  poolMgr:DestroyPool("BaseElement");
  poolMgr:DestroyPool("BaseBlock");
  poolMgr:DestroyPool("BaseSceneEffect");
  poolMgr:DestroyPool("BaseMiniMap");
end

function MapManager.AviodCov()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function MapManager.Initialize()
  this.gridRoot = GameObject.Find("SceneRoot");
  this.elementRoot = GameObject.Find("ElementRoot");
  this.blockRoot = GameObject.Find("BlockRoot");
  this.gameObject = GameObject.Find("Scene");

  this.transform = this.gameObject.transform;

  CGResourceManager.Load(
    "BaseScene",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("BaseScene", asset);
    end
  );

  CGResourceManager.Load(
    "BaseElement",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("BaseElement", asset);
    end
  );

  CGResourceManager.Load(
    "BaseBlock",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("BaseBlock", asset);
    end
  );

  CGResourceManager.Load(
    "BaseSceneEffect",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("BaseSceneEffect", asset);
    end
  );

  CGResourceManager.Load(
    "BaseMiniMap",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("BaseMiniMap", asset);
    end
  );

  GridController.Initialize();

  ElementController.Initialize();

  NotifyManager.Register(ENotifyManager.EnterScene, "MapManager", this.OnEnterScene);
  NotifyManager.Register(ENotifyManager.ExitScene, "MapManager", this.OnExitScene);
end

function MapManager.OnEnterScene(checkCode)
  --log(string.Concat("Load Map : ", SceneManager.sceneId));
  
  if mapHeaderDatas[SceneManager.sceneId] == nil then return end

  DataManager.ReadData(DataManager.mapDataPath,
    function(file)
      if checkCode ~= nil and SceneManager.changeSceneCheckCode ~= checkCode then return end

      local reader = DatReader.New(file, 0, 0, 0, 0, 0, mapHeaderDatas[SceneManager.sceneId].position, mapHeaderDatas[SceneManager.sceneId].size);

      this.mapData = MapData.New(reader);

      if this.mapData == nil then return end
  
      this.mapWidth = this.mapData.width;
      this.mapHeight = this.mapData.height;
    
      if this.mapWidth < 800 then
        this.centerLeft = math.floor( ( (800 - this.mapWidth) * 0.5 ) * this.BLOCK_CONVERT ) * this.BLOCK_UNIT;
      end
    
      if this.mapHeight < 600 then
        this.centerTop = math.floor( ( (600 - this.mapHeight) * 0.5 ) * this.BLOCK_CONVERT ) * this.BLOCK_UNIT;
      end
    
      this.musicId = 0;
    
      this.CreateGrid();
      this.CreateElement();
    
      Scene.UpdateCameraSize(this.mapWidth, this.mapHeight);
    end
  );
end

function MapManager.OnExitScene()
  this.centerLeft = 0;
  this.centerTop = 0;

  this.ClearGrid();	
  this.ClearElement();
  this.ClearBlock();

  TextureManager.ClearUseType(ETextureUseType.Scene);

  this.mapData = nil;
end

function MapManager.AviodCov1()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function MapManager.AviodCov2()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function MapManager.AviodCov3()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function MapManager.CreateGrid()
  if this.mapData == nil then return end

  GridController.SetMaterial();
  local offsetData;
  for k, mapPicInfo in pairs(this.mapData.mapPics) do
    if textureOffsetDatas[tostring(mapPicInfo.picId)] ~= nil then
      offsetData = textureOffsetDatas[tostring(mapPicInfo.picId)];
      for i = 1, offsetData.offsetNum do
        this.grids[string.Concat(tostring(k), tostring(offsetData.offsets[i].serial))] = GridController.New(mapPicInfo, offsetData.offsets[i]);  
      end
    else
      this.grids[k] = GridController.New(mapPicInfo);  
    end

    if k == 1 then
      this.musicId = mapPicInfo.picId;
    end
  end
end

function MapManager.ClearGrid()
  for k in pairs(this.grids) do  
    this.grids[k]:Destroy();
    this.grids[k] = nil;
  end
end

function MapManager.CreateElement()
  if this.mapData == nil then return end

  ElementController.SetMaterial();

  for k, elementInfo in pairs(this.mapData.elements) do
    this.elements[k] = ElementController.New(elementInfo, k);
  end
end

function MapManager.ClearElement()
  for k in pairs(this.elements) do
    this.elements[k]:Destroy();
    this.elements[k] = nil;
  end
end

function MapManager.CreateBlock()
  if this.mapData.blocks ~= nil then
    for x = 1, this.mapData.blockWidth do
      for y = 1, this.mapData.blockHeight do
        this.blocks[x + ((y - 1) * this.mapData.blockWidth)] = BlockController.New(x, y, this.mapData.blocks[x][y]);
      end
    end
  end
end

function MapManager.AviodCov4()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function MapManager.AviodCov5()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function MapManager.AviodCov6()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function MapManager.ClearBlock()
  for k in pairs(this.blocks) do
    this.blocks[k]:Destroy();
    this.blocks[k] = nil;
  end
end

function MapManager.CreatDoor()
  for k, v in pairs(DoorManager.doors) do
    local x, y;
    for h = 1, v.rect.height / this.BLOCK_UNIT do
      for w = 1, v.rect.width / this.BLOCK_UNIT do
        x, y = MapManager.GetBlock(Vector2.New(v.rect.x + ((w) * this.BLOCK_UNIT), v.rect.y + ((h) * this.BLOCK_UNIT)));
        this.blocks[x + ((y - 1) * this.mapData.blockWidth)] = BlockController.New(x, y, 1);
      end
    end
  end
end

function MapManager.SetBlock(x, y, value)
  if this.mapData == nil then return end
  if this.mapData.blocks[x] == nil then return end  
  if this.mapData.blocks[x][y] == nil then return end
  
  this.mapData.blocks[x][y] = bit.bor(this.mapData.blocks[x][y], value);
end

function MapManager.IsObstacle(blockX, blockY)
  if this.mapData == nil then return true end
  if this.mapData.blocks[blockX] == nil then return true end  
  if this.mapData.blocks[blockX][blockY] == nil then return true end

  return bit.band(this.mapData.blocks[blockX][blockY], 1) == 1 or bit.band(this.mapData.blocks[blockX][blockY], 4) == 4;
end

function MapManager.GetBlock(position)
  return math.ceil((position.x - this.centerLeft) * this.BLOCK_CONVERT), math.ceil((position.y - this.centerTop) * this.BLOCK_CONVERT);
end

function MapManager.GetPosition(block)
  return block.x * MapManager.BLOCK_UNIT - MapManager.BLOCK_UNIT * 0.5 + MapManager.centerLeft, block.y * MapManager.BLOCK_UNIT - MapManager.BLOCK_UNIT * 0.5 + MapManager.centerTop;
end

function MapManager.IsSea(blockX, blockY)
  if this.mapData == nil then return false end
  if this.mapData.blocks[blockX] == nil then return false end  
  if this.mapData.blocks[blockX][blockY] == nil then return false end
  
  return bit.band(this.mapData.blocks[blockX][blockY], 2) == 2;
end

function MapManager.AviodCov7()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function MapManager.AviodCov8()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function MapManager.GetCityEmpty(player, targetPosition)
  local deltaX, deltaY; --位移距離
  local m; --斜率
  local vX, vY; --方向
  local tempBlockX, tempBlockY;
  local tempPosition;
  local startBlockX, startBlockY, targetBlockX, targetBlockY

  startBlockX, startBlockY = this.GetBlock(player.position);
  targetBlockX, targetBlockY = this.GetBlock(targetPosition);

  if startBlockX >= targetBlockX then
    vX = 1;
  else
    vX = -1;
  end

  if startBlockY >= targetBlockY then
    vY = 1;
  else
    vY = -1;
  end

  deltaX = math.abs(startBlockX - targetBlockX);
  deltaY = math.abs(startBlockY - targetBlockY);

  if deltaX == 0 and deltaY == 0 then
    return Vector2.New(this.GetPosition(Vector2.New(targetBlockX, targetBlockY)));
  end

  if deltaX >= deltaY then
    m = deltaY / deltaX;
  else
    m = deltaX / deltaY;
  end

  if deltaX >= deltaY then
    for i = 1, deltaX do
      tempBlockX = targetBlockX + (i * vX);
      tempBlockY = targetBlockY + math.ceil(i * m * vY);
      tempPosition = Vector2.New( this.GetPosition( Vector2.New(tempBlockX, tempBlockY) ) );
      if not this.IsObstacle(tempBlockX, tempBlockY) and City.CheckMove(player, tempPosition) then
        break;
      end
    end
  else
    for i = 1, deltaY do
      tempBlockX = targetBlockX + math.ceil(i * m * vX);   
      tempBlockY = targetBlockY + (i * vY);
      tempPosition = Vector2.New( this.GetPosition( Vector2.New(tempBlockX, tempBlockY) ) );
      if not this.IsObstacle(tempBlockX, tempBlockY) and City.CheckMove(player, tempPosition) then
        break;
      end
    end
  end

  return tempPosition;  
end

function MapManager.GetEmptyBlock(startBlockX, startBlockY, targetBlockX, targetBlockY)
  --取離目標最近的空格
  if not this.IsObstacle(targetBlockX, targetBlockY) then
    return targetBlockX, targetBlockY;
  end

  local deltaX, deltaY; --位移距離
  local m; --斜率
  local vX, vY; --方向
  local tempBlockX, tempBlockY;

  tempBlockX, tempBlockY = MapManager.GetNearEmpty(targetBlockX, targetBlockY)

  if tempBlockX ~= nil and tempBlockY ~= nil then
    return tempBlockX, tempBlockY;
  end

  if startBlockX >= targetBlockX then
    vX = 1;
  else
    vX = -1;
  end

  if startBlockY >= targetBlockY then
    vY = 1;
  else
    vY = -1;
  end

  deltaX = math.abs(startBlockX - targetBlockX);
  deltaY = math.abs(startBlockY - targetBlockY);

  if deltaX == 0 and deltaY == 0 then
    return targetBlockX, targetBlockY;
  end

  if deltaX >= deltaY then
    m = deltaY / deltaX;
  else
    m = deltaX / deltaY;
  end

  if deltaX >= deltaY then
    for i = 1, deltaX do
      tempBlockX = targetBlockX + (i * vX);
      tempBlockY = targetBlockY + math.ceil(i * m * vY);
      if not this.IsObstacle(tempBlockX, tempBlockY) then
        break;
      end
    end
  else
    for i = 1, deltaY do
      tempBlockX = targetBlockX + math.ceil(i * m * vX);   
      tempBlockY = targetBlockY + (i * vY);
      if not this.IsObstacle(tempBlockX, tempBlockY) then
        break;
      end
    end
  end

  return tempBlockX, tempBlockY;  
end

function MapManager.GetNearEmpty(targetBlockX, targetBlockY)
  local tempBlockX, tempBlockY;

  --上
  tempBlockX = targetBlockX;
  tempBlockY = targetBlockY - 1;
  if not this.IsObstacle(tempBlockX, tempBlockY) then
    return tempBlockX, tempBlockY;  
  end
  --下
  tempBlockX = targetBlockX;
  tempBlockY = targetBlockY + 1;
  if not this.IsObstacle(tempBlockX, tempBlockY) then
    return tempBlockX, tempBlockY;  
  end
  --左
  tempBlockX = targetBlockX - 1;
  tempBlockY = targetBlockY;
  if not this.IsObstacle(tempBlockX, tempBlockY) then
    return tempBlockX, tempBlockY;  
  end
  --右
  tempBlockX = targetBlockX + 1;
  tempBlockY = targetBlockY;
  if not this.IsObstacle(tempBlockX, tempBlockY) then
    return tempBlockX, tempBlockY;  
  end

  --左上
  tempBlockX = targetBlockX - 1;
  tempBlockY = targetBlockY - 1;
  if not this.IsObstacle(tempBlockX, tempBlockY) then
    return tempBlockX, tempBlockY;  
  end
  --左下
  tempBlockX = targetBlockX - 1;
  tempBlockY = targetBlockY + 1;
  if not this.IsObstacle(tempBlockX, tempBlockY) then
    return tempBlockX, tempBlockY;  
  end
  --右上
  tempBlockX = targetBlockX + 1;
  tempBlockY = targetBlockY - 1;
  if not this.IsObstacle(tempBlockX, tempBlockY) then
    return tempBlockX, tempBlockY;  
  end
  --右下
  tempBlockX = targetBlockX + 1;
  tempBlockY = targetBlockY + 1;
  if not this.IsObstacle(tempBlockX, tempBlockY) then
    return tempBlockX, tempBlockY;  
  end
end

function MapManager.GetNearObstacle(startBlockX, startBlockY, targetBlockX, targetBlockY)
  --取離開始最近的障礙點的前一格
  local deltaX, deltaY; --位移距離
  local m; --斜率
  local vX, vY; --方向
  local tempBlockX, tempBlockY;

  if targetBlockX >= startBlockX then
    vX = 1;
  else
    vX = -1;
  end

  if targetBlockY >= startBlockY then
    vY = 1;
  else
    vY = -1;
  end

  deltaX = math.abs(startBlockX - targetBlockX);
  deltaY = math.abs(startBlockY - targetBlockY);

  if deltaX == 0 and deltaY == 0 then
    return startBlockX, startBlockY;
  end

  if deltaX >= deltaY then
    m = deltaY / (deltaX + 0.01);
  else
    m = deltaX / (deltaY + 0.01);
  end

  if deltaX >= deltaY then
    for i = 1, deltaX do
      tempBlockX = startBlockX + (i * vX);
      tempBlockY = startBlockY + math.ceil(i * m * vY);
      if this.IsObstacle(tempBlockX, tempBlockY) then
        tempBlockX = tempBlockX - vX;
        tempBlockY = tempBlockY - math.ceil(m * vY);
        break;
      end

      tempBlockY = startBlockY + math.floor(i * m * vY);
      if this.IsObstacle(tempBlockX, tempBlockY) then
        tempBlockX = tempBlockX - vX;
        tempBlockY = tempBlockY - math.floor(m * vY);
        break;
      end
    end
  else
    for i = 1, deltaY do
      tempBlockX = startBlockX + math.ceil(i * m * vX);   
      tempBlockY = startBlockY + (i * vY);
      if this.IsObstacle(tempBlockX, tempBlockY) then
        tempBlockX = tempBlockX - math.ceil(m * vX);   
        tempBlockY = tempBlockY - vY;
        break;
      end

      tempBlockX = startBlockX + math.floor(i * m * vX);
      if this.IsObstacle(tempBlockX, tempBlockY) then
        tempBlockX = tempBlockX - math.floor(m * vX);
        tempBlockY = tempBlockY - vY;
        break;
      end
    end
  end

  return tempBlockX, tempBlockY;  
end

function MapManager.IsLineWay(startBlockX, startBlockY, targetBlockX, targetBlockY)
  local result = true; --有直線的移動路徑
  local deltaX, deltaY; --位移距離
  local m; --斜率
  local vX, vY; --方向
  local tempBlockX, tempBlockY;

  if startBlockX >= targetBlockX then
    vX = -1;
  else
    vX = 1;
  end

  if startBlockY >= targetBlockY then
    vY = -1;
  else
    vY = 1;
  end

  deltaX = math.abs(startBlockX - targetBlockX);
  deltaY = math.abs(startBlockY - targetBlockY);

  if deltaX == 0 and deltaY == 0 then
    return result;
  end

  if deltaX >= deltaY then
    m = deltaY / (deltaX + 0.01);
  else
    m = deltaX / (deltaY + 0.01);
  end

  if deltaX >= deltaY then
    for i = 1, deltaX do
      tempBlockX = startBlockX + (i * vX);
      tempBlockY = startBlockY + math.ceil(i * m * vY);
      if this.IsObstacle(tempBlockX, tempBlockY) then
        result = false;
        break;
      end

      tempBlockY = startBlockY + math.floor(i * m * vY);
      if this.IsObstacle(tempBlockX, tempBlockY) then
        result = false;
        break;
      end
    end
  else
    for i = 1, deltaY do
      tempBlockX = startBlockX + math.ceil(i * m * vX);   
      tempBlockY = startBlockY + (i * vY);
      if this.IsObstacle(tempBlockX, tempBlockY) then
        result = false;
        break;
      end

      tempBlockX = startBlockX + math.floor(i * m * vX);
      if this.IsObstacle(tempBlockX, tempBlockY) then
        result = false;
        break;
      end
    end
  end

  return result;
end

function MapManager.AviodCov9()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function MapManager.AviodCov10()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function MapManager.AviodCov11()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function MapManager.AviodCov12()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function MapManager.IsInSitu(startBlockX, startBlockY, targetBlockX, targetBlockY)
  return targetBlockX == startBlockX and targetBlockY == startBlockY;
end

function MapManager.GetWave(blockX, blockY)
  if this.mapData == nil then return nil end

  blockX = blockX - (this.centerLeft * this.BLOCK_CONVERT);	
  blockY = blockY - (this.centerTop * this.BLOCK_CONVERT);

  for k, waveInfo in pairs(this.mapData.waves) do
    if blockX >= waveInfo.blockX - waveInfo.dist and blockX <= waveInfo.blockX + waveInfo.dist and
       blockY >= waveInfo.blockY - waveInfo.dist and blockY <= waveInfo.blockY + waveInfo.dist then
      return waveInfo;
    end
  end

  return nil;
end

function MapManager.GetGeolAttr(x, y)
  if this.mapData == nil then return 0 end

  for k, geolInfo in pairs(this.mapData.geols) do
    if x > geolInfo.left and x < geolInfo.right and y > geolInfo.top and y < geolInfo.bottom then
	    return geolInfo.attr;
    end
  end

  return this.mapData.geolBaseAtt;
end

function MapManager.GetFixCenterLeft()
  return -this.posX + this.centerLeft;
end

function MapManager.GetFixCenterTop()
  return -this.posY + this.centerTop;
end

function MapManager.GetArrayBlockData()
  local result = {};

  if this.mapData.blocks ~= nil then
    for i = 1, this.mapData.blockWidth do
      for j = 1, this.mapData.blockHeight do
        table.insert(result, this.mapData.blocks[i][j]); 
      end
    end
  end

  return result;
end

function MapManager.AviodCov13()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function MapManager.AviodCov15()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function MapManager.AviodCov14()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function MapManager.GetStartEmptyBlock(startBlockX, startBlockY)
  --取離目前位置最近的空格
  local tempBlockX = startBlockX;
  local tempBlockY = startBlockY;
  local maxDistance = MapManager.mapData.blockWidth;

  if not this.IsObstacle(startBlockX, startBlockY) then
    return startBlockX, startBlockY;
  end

  for i = 1, maxDistance do
    for j = -i, i do
      for k = -i, i do
        if math.abs(j) == i or math.abs(k) == i then
          tempBlockX = startBlockX + j;
          tempBlockY = startBlockY + k;
          if not this.IsObstacle(tempBlockX, tempBlockY) then
            return tempBlockX, tempBlockY;
          end
        end
      end
    end
  end
end

function MapManager.GetStartEmptyBlockWithDirect(startBlockX, startBlockY, targetBlockX, targetBlockY)
  --取離目前位置到目標方向最近的空格
  if not this.IsObstacle(startBlockX, startBlockY) then
    return startBlockX, startBlockY;
  end

  local deltaX, deltaY; --位移距離
  local m; --斜率
  local vX, vY; --方向
  local tempBlockX, tempBlockY;

  tempBlockX, tempBlockY = MapManager.GetNearEmpty(startBlockX, startBlockY)

  if tempBlockX ~= nil and tempBlockY ~= nil then
    return tempBlockX, tempBlockY;
  end

  if startBlockX >= targetBlockX then
    vX = -1;
  else
    vX = 1;
  end

  if startBlockY >= targetBlockY then
    vY = -1;
  else
    vY = 1;
  end

  deltaX = math.abs(startBlockX - targetBlockX);
  deltaY = math.abs(startBlockY - targetBlockY);

  if deltaX == 0 and deltaY == 0 then
    return startBlockX, startBlockY;
  end

  if deltaX >= deltaY then
    m = deltaY / deltaX;
  else
    m = deltaX / deltaY;
  end

  if deltaX >= deltaY then
    for i = 1, deltaX do
      tempBlockX = startBlockX + (i * vX);
      tempBlockY = startBlockY + math.ceil(i * m * vY);
      if not this.IsObstacle(tempBlockX, tempBlockY) then
        break;
      end
    end
  else
    for i = 1, deltaY do
      tempBlockX = startBlockX + math.ceil(i * m * vX);
      tempBlockY = startBlockY + (i * vY);
      if not this.IsObstacle(tempBlockX, tempBlockY) then
        break;
      end
    end
  end

  return tempBlockX, tempBlockY;
end

function ActivityInfo.Script1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function ActivityInfo.Script2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function ActivityInfo.Script3()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end