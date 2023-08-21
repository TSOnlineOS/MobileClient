Tft_Ground = {};
Tft_Ground.__index = Tft_Ground;

local tempVec = Vector2.zero;

--[[
Now in the days of Amraphel, king of Shinar, Arioch, king of Ellasar, Chedorlaomer, king of Elam, and Tidal, king of Goiim,
They made war with Bera, king of Sodom, and with Birsha, king of Gomorrah, Shinab, king of Admah, and Shemeber, king of Zeboiim, and the king of Bela (which is Zoar).
All these came together in the valley of Siddim (which is the Salt Sea).
For twelve years they were under the rule of Chedorlaomer, but in the thirteenth year they put off his control.
And in the fourteenth year, Chedorlaomer and the kings who were on his side, overcame the Rephaim in Ashteroth-karnaim, and the Zuzim in Ham, and the Emim in Shaveh-kiriathaim,
And the Horites in their mountain Seir, driving them as far as El-paran, which is near the waste land.
Then they came back to En-mishpat (which is Kadesh), making waste all the country of the Amalekites and of the Amorites living in Hazazon-tamar.
And the king of Sodom with the king of Gomorrah and the king of Admah and the king of Zeboiim and the king of Bela (that is Zoar), went out, and put their forces in position in the valley of Siddim,
Against Chedorlaomer, king of Elam, and Tidal, king of Goiim, and Amraphel, king of Shinar, and Arioch, king of Ellasar: four kings against the five.
Now the valley of Siddim was full of holes of sticky earth; and the kings of Sodom and Gomorrah were put to flight and came to their end there, but the rest got away to the mountain.
And the four kings took all the goods and food from Sodom and Gomorrah and went on their way.
And in addition they took Lot, Abram's brother's son, who was living in Sodom, and all his goods.
And one who had got away from the fight came and gave word of it to Abram the Hebrew, who was living by the holy tree of Mamre, the Amorite, the brother of Eshcol and Aner, who were friends of Abram.
And Abram, hearing that his brother's son had been made a prisoner, took a band of his trained men, three hundred and eighteen of them, sons of his house, and went after them as far as Dan.
--]]

function Tft_Ground.New(reader)
  local self = {};
  setmetatable(self, Tft_Ground);

  self.movieBackGround = nil;

  self.position = Vector2.zero; --圖左上座標
  self.destination = Vector2.zero; --目的地左上座標
  self.speedLevel = 2; --更新位置速度

  self.width = 0; --圖寬
  self.height = 0; --圖高
  
  self.oldTime = CGTimer.time;

  self.picName = reader:ReadString(13, false); --圖檔名

  self.nowStep = 0; --目前移動到第幾個路線  
  self.startStep = reader:ReadInt32(); --開始時點
  self.totalStep = reader:ReadInt32(); --總共路線點

  self.destXY = {}; --目的地座標屬性陣列
  for i = 0, self.totalStep do -- 59811.sty totalStep 小於 0
    local destInfo = {};
    destInfo.x = reader:ReadInt32(); --對應整張背景圖的絕對位置X 
    destInfo.y = reader:ReadInt32(); --對應整張背景圖的絕對位置y
    destInfo.arrive = reader:ReadBoolean(); --是否到達此點
    destInfo.speedLevel = reader:ReadInt32(); --移動速度:   1: 0.08, 2: 0.12,  3: 0.4
    destInfo.frame = reader:ReadInt32(); --是否鎖定RI  0: 不鎖  其他: 鎖定動作值(視動畫圖片張數而定)
    destInfo.musicNo = reader:ReadByte(); --0: 無   其餘：背景音樂檔編號 92/12/23
    reader:ReadBytes(7);

    self.destXY[i] = destInfo;
  end

  self.quakeOffset = Vector2.zero;
  self.quakeInterval = 0;
  self.quakeStep = 0;
  self.alpha = 0;
  
  return self;
end

function Tft_Ground.Demo()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Tft_Ground.Demo1()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Tft_Ground:Load()  
  self.movieBackGround = {};

  --演出地圖大小
  local sizeData = textureSizeDatas[self.picName];  
  if sizeData ~= nil then
    self.width = sizeData.width;  
    self.height = sizeData.height;
  else
    self.width = 0;
    self.height = 0;
  end  

  --載入地塊
  self.movieBackGround.gridRoot = GameObject.Find("MovieRoot");
  self.movieBackGround.grid = {};

  local offsetData = textureOffsetDatas[self.picName];
  if offsetData ~= nil then
    for i = 1, offsetData.offsetNum do
      local gameObject = poolMgr:Get("BaseScene")
      local offset = offsetData.offsets[i];
      local picName = string.Concat(self.picName, "_", tostring(offset.serial));

      gameObject.name = picName; 
      gameObject.transform:SetParent(self.movieBackGround.gridRoot.transform);

      self.movieBackGround.grid[i] = {}
      self.movieBackGround.grid[i].gameObject = gameObject;
      self.movieBackGround.grid[i].canvas = gameObject:GetComponent("Canvas");

      local texture = TextureManager.GetJpg(ETextureUseType.Scene, picName);
      self.movieBackGround.grid[i].rawImage = gameObject:GetComponent("RawImage");
      self.movieBackGround.grid[i].rawImage.texture = texture;
      self.movieBackGround.grid[i].rawImage.material = GridController.SceneMaterial;

      local rectTransform = gameObject:GetComponent("RectTransform");    
      rectTransform.localScale = Vector3.one;
      rectTransform.anchoredPosition = Vector2.New(offset.x, offset.y);
      rectTransform.sizeDelta = Vector2.New(texture.width, texture.height);
    end
  else
    local gameObject = poolMgr:Get("BaseScene");

    gameObject.name = self.picName;
    gameObject.transform:SetParent(self.movieBackGround.gridRoot.transform);

    self.movieBackGround.grid[1] = {};
    self.movieBackGround.grid[1].gameObject = gameObject;
    self.movieBackGround.grid[1].canvas = gameObject:GetComponent("Canvas");

    local texture = TextureManager.GetJpg(ETextureUseType.Scene, self.picName);
    self.movieBackGround.grid[1].rawImage = gameObject:GetComponent("RawImage");
    self.movieBackGround.grid[1].rawImage.texture = texture;
    self.movieBackGround.grid[1].rawImage.material = GridController.SceneMaterial;

    local rectTransform = gameObject:GetComponent("RectTransform");    
    rectTransform.localScale = Vector3.one;
    rectTransform.anchoredPosition = Vector2.zero;
    rectTransform.sizeDelta = Vector2.New(self.width, self.height);
  end
  
  logError(string.Concat("width: ", tostring(self.width), " height: ", tostring(self.height)));

  --設定演出場景大小
  self.movieBackGround.gameObject = GameObject.Find("MovieBackGround");
  
  self.movieBackGround.transform = self.movieBackGround.gameObject.transform;
  self.movieBackGround.rectTransform = self.movieBackGround.gameObject:GetComponent("RectTransform");

  self.movieBackGround.rectTransform.localScale = Vector3.one;
  self.movieBackGround.rectTransform.anchoredPosition = Vector2.zero;
  self.movieBackGround.rectTransform.sizeDelta = Vector2.New(self.width, self.height);

  self.movieBackGround.center = {};
  self.movieBackGround.center.x = 0;
  self.movieBackGround.center.y = 0; 
  self.movieBackGround.center.x = self.width * 0.5;
  self.movieBackGround.center.y = self.height * 0.5;  
   
  self.position.x = 0;
  self.position.y = 0;

  self.destination.x = 0;
  self.destination.y = 0;

  if self.destXY[0] ~= nil then -- 59811.sty totalStep 小於 0
    self.position.x = self.destXY[0].x;
    self.position.y = self.destXY[0].y;

    self.destination.x = self.destXY[0].x;
    self.destination.y = self.destXY[0].y;
  end

  self.speedLevel = 2;

  self.oldTime = CGTimer.time;

  Scene.UpdateCameraSize(self.width, self.height - (Scene.playerOffsetY * 2));

  self:Update();
end

function Tft_Ground.Demo2()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Tft_Ground.Demo3()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end
function Tft_Ground:Destroy()
  for k, v in pairs(self.movieBackGround.grid) do
    v.rawImage.texture = nil;
    poolMgr:Release("BaseScene", v.gameObject); 
  end
  self.movieBackGround.grid = nil;
  self.movieBackGround.rectTransform.sizeDelta = Vector2.zero(); 
  self.movieBackGround.transform = nil;
  self.movieBackGround.rectTransform = nil;
  self.movieBackGround.gameObject = nil;
  self.movieBackGround = nil; 
  --self.fadeImage = nil;
end

function Tft_Ground.Demo7()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Tft_Ground:Update()
  Scene.MovieUpdateCamera(self.position + self.quakeOffset, self.width, self.height);
  --[[
  if MoviePlayer.state == EMovieState.TestPlay then
    if MoviePlayer.isEfficacy1 then
      Scene.UpdateCamera(DX, DY);
      --self.fadeImage.alpha = 255 - MoviePlayer.nowAlpha;
    else
      Scene.UpdateCamera(DX, DY);    
    end
  else
    Scene.UpdateCamera(0, 0);    
  end
  --]]
end

function Tft_Ground:SortingOrder(order)
  for k, v in pairs(self.movieBackGround.grid) do
    v.canvas.sortingOrder = order;
  end
end

function Tft_Ground:UpdatePosition()
  self.position = MoviePlayer.GetPosition(self.position, self.destination, self.speedLevel, CGTimer.time - self.oldTime);
  self.oldTime = CGTimer.time;
  
  if self.position ~= self.destination then return false end

  self.destXY[self.nowStep].arrive = true;

  return true;
end

function Tft_Ground:NextStep()
  self.nowStep = math.min(self.nowStep + 1, self.totalStep);

  self.destination.x = self.destXY[self.nowStep].x;
  self.destination.y = self.destXY[self.nowStep].y;
  self.speedLevel = self.destXY[self.nowStep].speedLevel;
end

function Tft_Ground.Demo34()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Tft_Ground.Demo5()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Tft_Ground.Demo6()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end