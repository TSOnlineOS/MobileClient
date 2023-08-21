UIBlockEditor = {}
local this = UIBlockEditor;

this.name = "UIBlockEditor";
this.uiController = nil;

local image_GreenSL;
local image_RedSL;
local image_BlueSL;

this.currentColor = nil;
this.mapData = nil;

local Color = {
  Green = 0,
  Red = 1,
  Blue = 2,
}

function UIBlockEditor.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;

  image_GreenSL = uiController:FindImage("Image_GreenSL");
  image_RedSL = uiController:FindImage("Image_RedSL");
  image_BlueSL = uiController:FindImage("Image_BlueSL");

  local tempEvent;
  tempEvent = uiController:FindEvent("Image_Green");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Green);
  tempEvent = uiController:FindEvent("Image_Red");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Red);
  tempEvent = uiController:FindEvent("Image_Blue");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Blue);

  tempEvent = uiController:FindEvent("Image_Save");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_SaveData);

  tempEvent = uiController:FindEvent("Image_Merge");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Merge);
end


function UIBlockEditor.OnOpen(callbackFunction, message, showChooses, showRole, showIcon, showYes, showCancel)
  this.LoadMap();
  this.currentColor = Color.Green;
  this.SwitchSelectColor();
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
  return true;
end

function UIBlockEditor.OnClose()
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
  
  this.mapData = nil;
  return true;
end

function UIBlockEditor.LoadMap()
  local mapId = SceneManager.sceneId

  if mapHeaderDatas[mapId] == nil then logError(string.Concat("No mapId : ", mapId, " Data.")) return end

  DataManager.ReadData(DataManager.mapDataPath,
    function(file)
      local reader = DatReader.New(file, 0, 0, 0, 0, 0, mapHeaderDatas[mapId].position, mapHeaderDatas[mapId].size);
      this.mapData = MapData.New(reader);
    end
  );
end

function UIBlockEditor.SetBlock(x, y, value)
  if this.mapData == nil then return end
  if this.mapData.blocks[x] == nil then return end  
  if this.mapData.blocks[x][y] == nil then return end
  
  this.mapData.blocks[x][y] = value;
end

function UIBlockEditor.OnClick_Green()
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
  
  this.currentColor = Color.Green;
  this.SwitchSelectColor();
end

function UIBlockEditor.OnClick_Red()
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
  this.currentColor = Color.Red;
  this.SwitchSelectColor();
end

function UIBlockEditor.OnClick_Blue()
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
  this.currentColor = Color.Blue;
  this.SwitchSelectColor();
end

function UIBlockEditor.SwitchSelectColor()
  image_GreenSL.gameObject:SetActive(this.currentColor == Color.Green);
  image_RedSL.gameObject:SetActive(this.currentColor == Color.Red);
  image_BlueSL.gameObject:SetActive(this.currentColor == Color.Blue);
end

function UIBlockEditor.OnClick_SaveData()
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
  local path = LuaHelper.SaveFilePanel("Save mapData", "", SceneManager.sceneId, "map");
  if string.len(path) <= 0 then return end
  
  path = string.gsub(path, "/", "\\\\");
  logError(path);
  this.ExportMapDataToBytes(this.mapData, path);
end

function UIBlockEditor.OnClick_Merge()
  local path = LuaHelper.OpenFolderPanel("Select folder", "" ,"");
  if string.len(path) <= 0 then return end

  path = string.gsub(path, "/", "\\\\");

  local reader = DatReader.New(io.open(CGResourceManager.GetResourcePackedLocalPath(DataManager.mapDataPath), "rb"));
  local datas = reader:ReadBytes(reader.length);
  local db = DataBuffer.New(string.Concat(path, "\\\\Ground.mmg"), true);
  db:WriteBytes(datas);

  local files = LuaHelper.GetDirectoryFiles(string.Concat(path, "\\\\"), "*.map");
  local temp;
  local str;
  local id;

  if files ~= nil then
    for i = 0, files.Length - 1 do
      temp = DatReader.New(io.open(files[i], "rb"));
      str = string.gsub(files[i], path, "");
      id = this.GetNameID(str);
      db:Seek(mapHeaderDatas[id].position);
      db:WriteBytes(temp.data);
      temp = nil;
    end
  end

  db:Flush();
  db:Close();
  db = nil;
end

function UIBlockEditor.GetNameID(name)
  local idx1 = string.find(name, ".", 1, true);
  local idx2 = string.find(name, "\\", 1, true);
  if idx1 ~= nil then
    name = string.sub(name, 1, idx1 - 1);
  end

  if idx2 ~= nil then
    name = string.sub(name, idx2 + 1);
  end
 
  return tonumber(name);
end

function UIBlockEditor.ExportMapDataToBytes(data, path)
  
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  local bb = DataBuffer.New(path, true);

  bb:WriteUInt32(data.width);
  bb:WriteUInt32(data.height);
  
  bb:WriteByte(data.mapPicCount);

  for i = 1, data.mapPicCount do
    bb:WriteUInt16(data.mapPics[i].picId);
    bb:WriteUInt16(data.mapPics[i].position.x);
    bb:WriteUInt16(data.mapPics[i].position.y);
  end

  bb:WriteUInt16(data.blockWidth);
  bb:WriteUInt16(data.blockHeight);

  for i = 1, data.blockWidth do
    for j = 1, data.blockHeight do
      bb:WriteByte(data.blocks[i][j]);
    end
  end

  bb:WriteUInt16(data.waveCount);

  for i = 1, data.waveCount do
    bb:WriteUInt16(data.waves[i].blockX);
    bb:WriteUInt16(data.waves[i].blockY);
    bb:WriteUInt16(data.waves[i].soundId);
    bb:WriteUInt16(data.waves[i].dist);
  end

  bb:WriteUInt16(data.elementCount);

  for i = 1, data.elementCount do
    bb:WriteUInt32(data.elements[i].picId);
    bb:WriteUInt16(data.elements[i].position.x);
    bb:WriteUInt16(data.elements[i].position.y);
  end

  bb:WriteByte(data.npcCount);

  bb:WriteByte(data.geolBaseAtt);
  bb:WriteByte(data.geolCount);

  for i = 1, data.geolCount do
    bb:WriteByte(data.geols[i].attr);
    bb:WriteUInt16(data.geols[i].left)
    bb:WriteUInt16(data.geols[i].top)
    bb:WriteUInt16(data.geols[i].right)
    bb:WriteUInt16(data.geols[i].bottom)
  end
  
  bb:WriteString(data.placeName);

  bb:WriteInt32(data.gm_MapX);
  bb:WriteInt32(data.gm_MapY);

  bb:WriteByte(data.color.r);
  bb:WriteByte(data.color.g);
  bb:WriteByte(data.color.b);

  bb:Flush();
  bb:Close();
  bb = nil;
end