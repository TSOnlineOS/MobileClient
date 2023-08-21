Scene = {}
local this = Scene;

this.gameObject = nil;
this.transform = nil;

this.CameraDefaultSize = 300;
this.CameraDefaultSceneHalfWidth = 0;
this.CameraDefaultSceneHalfHeight = 0;

this.cameraPosition = Vector2.zero;
this.cameraSize = this.CameraDefaultSize;
this.sceneCamera = nil;
this.sceneCanvas = nil;
this.sceneCanvasRectTransform = nil;

this.uiCamera = nil;
this.uiCanvas = nil;
this.uiCanvasRectTransform = nil;

this.miniMapCamera = nil;

this.currentSceneHalfWidth = 0;
this.currentSceneHalfHeight = 0;
this.cameraScale = 1;

this.sceneBackGroundRectTransform = nil;
this.playerOffsetY = 35;

--[[
And these two had a dream on the same night; the chief wine-servant and the chief bread-maker of the king of Egypt, who were in prison, the two of them had dreams with a special sense.
And in the morning when Joseph came to them he saw that they were looking sad.
And he said to the servants of Pharaoh who were in prison with him, Why are you looking so sad?
Then they said to him, We have had a dream, and no one is able to give us the sense. And Joseph said, Does not the sense of dreams come from God? what was your dream?
Then the chief wine-servant gave Joseph an account of his dream, and said, In my dream I saw a vine before me;
And on the vine were three branches; and it seemed as if it put out buds and flowers, and from them came grapes ready for cutting.
And Pharaoh's cup was in my hand, and I took the grapes and crushing them into Pharaoh's cup, gave the cup into Pharaoh's hand.
Then Joseph said, This is the sense of your dream: the three branches are three days;
After three days Pharaoh will give you honour, and put you back into your place, and you will give him his cup as you did before, when you were his wine-servant.
But keep me in mind when things go well for you, and be good to me and say a good word for me to Pharaoh and get me out of this prison:
For truly I was taken by force from the land of the Hebrews; and I have done nothing for which I might be put in prison.
Now when the chief bread-maker saw that the first dream had a good sense, he said to Joseph, I had a dream; and in my dream there were three baskets of white bread on my head;
And in the top basket were all sorts of cooked meats for Pharaoh; and the birds were taking them out of the baskets on my head.
Then Joseph said, This is the sense of your dream: the three baskets are three days;
--]]

local dungeonWidth = 0;
local dungeonHeight = 0;
local dungeonCenterLeft = 0;
local dungeonCenterTop = 0;

function Scene.Initialize()
  this.gameObject = GameObject.Find("Scene");
  this.transform = this.gameObject.transform;
  
  this.sceneCamera = GameObject.Find("SceneCamera"):GetComponent("Camera");
  this.sceneCanvas = this.gameObject:GetComponent("Canvas");
  this.sceneCanvasRectTransform = this.sceneCanvas.gameObject:GetComponent("RectTransform");

  this.uiCamera = GameObject.Find("UICamera"):GetComponent("Camera");
  this.uiCanvas = GameObject.Find("UI"):GetComponent("Canvas");
  this.uiCanvasRectTransform = this.uiCanvas.gameObject:GetComponent("RectTransform");

  if this.sceneBackGroundRectTransform == nil then
    this.sceneBackGroundRectTransform = GameObject.Find("Image_SceneBackGround"):GetComponent("Image").gameObject:GetComponent("RectTransform");
  end

  local tempEvent = this.sceneBackGroundRectTransform.gameObject:GetComponent("UIEvent");
  tempEvent:ClearListener();
  tempEvent:SetListener(EventTriggerType.PointerClick, UIJoystick.OnClick_Scene);

  this.miniMapCamera = this.transform:Find("MiniMapCamera"):GetComponent("Camera");

  this.SetSceneView();

  this.CameraDefaultSceneHalfWidth = this.currentSceneHalfWidth;
  this.CameraDefaultSceneHalfHeight = this.currentSceneHalfHeight;
  this.sceneBackGroundRectTransform.sizeDelta = Vector2.New(this.CameraDefaultSceneHalfWidth * 2, this.CameraDefaultSceneHalfHeight * 2);
end

function Scene.SetSceneView()
  this.sceneCamera.transform.localPosition = Vector3.zero;

  local pos = Scene.ConvertPositionToUIScene(Vector3.zero);

  this.currentSceneHalfWidth = math.abs(pos.x);
  this.currentSceneHalfHeight = math.abs(pos.y);
end

function Scene.ConvertPositionToUIScene(vector2Pos)
  return ConvertPositionToUIScene(this.sceneCanvasRectTransform, vector2Pos, this.sceneCanvas.worldCamera);
end

function Scene.GetMouseScreenPosition(mousePosition)
  return ConvertPositionToUIScene(this.uiCanvasRectTransform, mousePosition, this.uiCamera);
end

function Scene.TestPas(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Scene.TestPas2(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Scene.TestPas1(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Scene.UpdateCameraSize(width, height)
  local size = Scene.GetSize(width, height);

  dungeonWidth = 0;
  dungeonHeight = 0;
  dungeonCenterLeft = 0;
  dungeonCenterTop = 0;
  if SceneManager.dungeonId ~= 0 and dungeonAreaDatas[SceneManager.dungeonId] ~= nil then
    for k,v in pairs(dungeonAreaDatas[SceneManager.dungeonId]) do
      if Role.player.position.x >= v.centerLeft and Role.player.position.x <= (v.centerLeft + v.areaWidth)
      and Role.player.position.y >= v.centerTop and Role.player.position.y <= (v.centerTop + v.areaHeight) then
          dungeonCenterLeft = v.centerLeft - MapManager.centerLeft;
          dungeonCenterTop = v.centerTop - MapManager.centerTop;
          dungeonWidth = v.areaWidth - MapManager.mapWidth;
          dungeonHeight = v.areaHeight - MapManager.mapHeight;
          size = Scene.GetSize(v.areaWidth, v.areaHeight);
        break;
      end
    end
  end

  if size == 0 then return end

  this.sceneCamera.orthographicSize = size;

  this.cameraScale = this.CameraDefaultSize / this.sceneCamera.orthographicSize;

  this.SetSceneView();
end

function Scene.GetSize(width, height)
  local size = 0;

  if SceneManager.sceneState.type == ESceneType.Hole and width < 832 and height < 640 then
    size = this.CameraDefaultSize;
  elseif this.CameraDefaultSceneHalfWidth * 2 > width then
    size = (UI.height * width / UI.width) * 0.5;
  elseif this.CameraDefaultSceneHalfHeight * 2 > height then   
    size = (UI.width * height / UI.width) * 0.5;
  else
    size = this.CameraDefaultSize;
  end

  return size;
end

function Scene.IsInCurrentView(x, y)
  return x <= this.cameraPosition.x + this.currentSceneHalfWidth and x >= this.cameraPosition.x - this.currentSceneHalfWidth and y <= this.cameraPosition.y + this.currentSceneHalfHeight and y >= this.cameraPosition.y - this.currentSceneHalfHeight;
end

function Scene.UpdateCamera(position, forceUpdate)
  if SceneManager.sceneState.type == ESceneType.Hole and MapManager.mapWidth < 832 and MapManager.mapHeight < 640 then
    this.cameraPosition.x = position.x;
    this.cameraPosition.y = position.y - this.playerOffsetY;
  elseif HouseManager.IsInHouse() then
    this.cameraPosition.x = math.clamp(position.x, this.currentSceneHalfWidth + MapManager.centerLeft + dungeonCenterLeft + (this.sceneCamera.orthographicSize / this.CameraDefaultSize - 1) * this.currentSceneHalfWidth, MapManager.mapWidth + dungeonWidth - this.currentSceneHalfWidth + MapManager.centerLeft + dungeonCenterLeft - (this.sceneCamera.orthographicSize / this.CameraDefaultSize - 1) * this.currentSceneHalfWidth);
    this.cameraPosition.y = math.clamp(position.y - this.playerOffsetY, this.currentSceneHalfHeight + MapManager.centerTop + dungeonCenterTop + (this.sceneCamera.orthographicSize / this.CameraDefaultSize - 1) * this.currentSceneHalfHeight, MapManager.mapHeight + dungeonHeight - this.currentSceneHalfHeight + MapManager.centerTop + dungeonCenterTop - (this.sceneCamera.orthographicSize / this.CameraDefaultSize - 1) * this.currentSceneHalfHeight);
  else
    this.cameraPosition.x = math.clamp(position.x, this.currentSceneHalfWidth + MapManager.centerLeft + dungeonCenterLeft, MapManager.mapWidth + dungeonWidth - this.currentSceneHalfWidth + MapManager.centerLeft + dungeonCenterLeft);
    this.cameraPosition.y = math.clamp(position.y - this.playerOffsetY, this.currentSceneHalfHeight + MapManager.centerTop + dungeonCenterTop, MapManager.mapHeight + dungeonHeight - this.currentSceneHalfHeight + MapManager.centerTop + dungeonCenterTop);
  end
  
  if forceUpdate then
    this.sceneCamera.transform.localPosition = Vector3.New(this.cameraPosition.x, -this.cameraPosition.y, 0);
  else
    if MachineBox.autoMove then
      if MachineBox.client.moveMode == EAutoMoveMode.Bee then
        this.sceneCamera.transform.localPosition = Vector3.New(this.cameraPosition.x, -this.cameraPosition.y, 0);
      elseif MachineBox.client.moveMode == EAutoMoveMode.Chase then
        this.sceneCamera.transform.localPosition = Vector3.New(this.cameraPosition.x, -this.cameraPosition.y, 0);
      end
    else
      this.sceneCamera.transform.localPosition = Vector3.New(this.cameraPosition.x, -this.cameraPosition.y, 0);
    end
  end
  
  this.miniMapCamera.transform.localPosition = Vector3.New(this.cameraPosition.x, -this.cameraPosition.y, 0);
end

function Scene.MovieUpdateCamera(position, width, height)
  this.cameraPosition.x = math.clamp(position.x, this.currentSceneHalfWidth, width - this.currentSceneHalfWidth);
  this.cameraPosition.y = math.clamp(position.y - this.playerOffsetY, this.currentSceneHalfHeight, height - this.currentSceneHalfHeight);

  this.sceneCamera.transform.localPosition = Vector3.New(this.cameraPosition.x, -this.cameraPosition.y, 0);    
end

function Scene.TestPasA(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Scene.TestPasB(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Scene.SetCameraColor(color)
  this.sceneCamera.backgroundColor = color;
end

function Scene.SetCameraSize(size)
  this.sceneCamera.orthographicSize = size;

  this.cameraScale = this.CameraDefaultSize / this.sceneCamera.orthographicSize;
end

function Scene.TestPasC(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function Scene.TestPasD(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end