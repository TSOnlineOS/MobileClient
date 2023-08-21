
--const
local DoorFrame = 6;
local DoorInterval = 0.3;

local ArrowFrame = 11;
local ArrowInterval = 0.1;

--var
local tempVec = Vector2.New(0, 0);

Door = {}
Door.__index = Door;

function Door.RandomA()
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

function Door.RandomB()
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

function Door.New(doorData)    
  local self = {};
  setmetatable(self, Door);

  self.gameObject = poolMgr:Get("BaseDoor");
  self.gameObject.name = string.format("Door_%d", doorData.id);
  self.gameObject.transform:SetParent(DoorManager.doorRoot);
  self.gameObject.transform.localScale = Vector3.one;

  self.rectTransform = self.gameObject:GetComponent("RectTransform");
  self.rawImage = self.gameObject:GetComponent("UIRawImage");
  self.canvas = self.gameObject:GetComponent("Canvas");

  self.width = 0;
  self.height = 0;

  self.material = poolMgr:Get("DoorMaterial");
  
  local scale = 1;

  if doorData.imgInfo.imageKind == 1 then
    if SceneManager.sceneId % 1000 == 0 or ((SceneManager.sceneId >= 40000) and (SceneManager.sceneId <= 42000)) then
      scale = 0.25;
    end

    self.rawImage.material = self.material;
    TextureManager.SetPng(ETextureUseType.None, DoorManager.portalTexture, self.rawImage);

    self.width = self.rawImage.texture.width * scale;
    self.height = (self.rawImage.texture.height / DoorFrame) * scale;

    tempVec.x = self.width;
    tempVec.y = self.height;
    self.rectTransform.sizeDelta = tempVec;

    tempVec.x = doorData.imgInfo.position.x + MapManager.centerLeft - (self.width / 2);
    tempVec.y = -(doorData.imgInfo.position.y + MapManager.centerTop - self.height + (self.height / 4));
    self.rectTransform.anchoredPosition = tempVec;

    self.rawImage:ShiftUV(1, DoorFrame, DoorInterval, -1);

    self.canvas.sortingOrder = self.height + math.abs(self.rectTransform.anchoredPosition.y);      
  elseif doorData.imgInfo.imageKind == 2 then
    if SceneManager.sceneState.type == ESceneType.Map then
      scale = 0.5;
    end
    
    self.rawImage.material = self.material;
    TextureManager.SetPng(ETextureUseType.None, DoorManager.arrowTexture, self.rawImage);

    self.width = self.rawImage.texture.width * scale;
    self.height = (self.rawImage.texture.height / ArrowFrame) * scale;

    tempVec.x = self.width;
    tempVec.y = self.height;
    self.rectTransform.sizeDelta = tempVec;

    tempVec.x = doorData.imgInfo.position.x + MapManager.centerLeft - (self.width / 2);
    tempVec.y = -(doorData.imgInfo.position.y + MapManager.centerTop - 20);
    self.rectTransform.anchoredPosition = tempVec;

    self.rawImage:ShiftUV(1, ArrowFrame, ArrowInterval, -1);

    self.canvas.sortingOrder = MapManager.mapHeight;      
  end

  return self;  
end

function Door.RandomC()
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

function Door:Destroy()
  poolMgr:Release("BaseDoor", self.gameObject);

  poolMgr:Release("DoorMaterial", self.material);
  self.rawImage.material = nil;
  self.rawImage.texture = nil;
end

function Door.RandomD()
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

function Door.RandomE()
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

function Door.RandomF()
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
