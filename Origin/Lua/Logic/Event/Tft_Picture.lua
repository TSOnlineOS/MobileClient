Tft_Picture = {};
Tft_Picture.__index = Tft_Picture;

local tempVec = Vector2.zero;
local MAX_ALPHA = 32;

--[[
Now at that time, Judah went away from his brothers and became the friend of a man of Adullam named Hirah.
And there he saw the daughter of a certain man of Canaan named Shua, and took her as his wife.
And she gave birth to a son, and he gave him the name Er.
And again she gave birth to a son, and he gave him the name Onan.
Then she had another son, to whom she gave the name Shelah; she was at Chezib when the birth took place.
And Judah took a wife for his first son Er, and her name was Tamar.
Now Er, Judah's first son, did evil in the eyes of the Lord, so that he put him to death.
Then Judah said to Onan, Go in to your brother's wife and do what it is right for a husband's brother to do; make her your wife and get offspring for your brother.
But Onan, seeing that the offspring would not be his, went in to his brother's wife, but let his seed go on to the earth, so that he might not get offspring for his brother.
And what he did was evil in the eyes of the Lord, so that he put him to death, like his brother.
Then Judah said to Tamar, his daughter-in-law, Go back to your father's house and keep yourself as a widow till my son Shelah becomes a man: for he had in his mind the thought that death might come to him as it had come to his brothers. So Tamar went back to her father's house.
And after a time, Bath-shua, Judah's wife, came to her end; and after Judah was comforted for her loss, he went to Timnah, where they were cutting the wool of his sheep, and his friend Hirah of Adullam went with him.
And when Tamar had news that her father-in-law was going up to Timnah to the wool-cutting,
She took off her widow's clothing, and covering herself with her veil, she took her seat near Enaim on the road to Timnah; for she saw that Shelah was now a man, but she had not been made his wife.
--]]

function Tft_Picture.New(reader)
  local self = {};
  setmetatable(self, Tft_Picture);

  self.picName = reader:ReadString(13, false); --圖檔名 
  self.width = 0; --圖的寬度
  self.height = 0; --圖的長度

  self.nowStep = 0; --目前移動到第幾個路線
  self.startStep = reader:ReadInt32(); --開始時點
  self.totalStep = reader:ReadInt32(); --總共有幾個路線點
  self.transparentColor = reader:ReadInt32(); --透明色
  self.alpha = reader:ReadInt32(); --alpha值

  self.h = reader:ReadInt32(); --垂直切割數
  self.w = reader:ReadInt32(); --水平切割數
  self.interval = reader:ReadInt32() * 0.001; --切換圖片速度
  self.frame = 0; --目前播放第幾張切割圖片

  self.destXY = {}; --目的地座標屬性陣列
  for i = 0, self.totalStep do
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

  self.position = Vector2.zero; --圖左上座標
  self.destination = Vector2.zero; --目的地左上座標
  self.speedLevel = 2; --目前移動速度

  self.oldTime = 0;
  self.overTime = 0;

  self.gameObject = nil;
  self.rectTransform = nil;
  self.rawImage = nil;
  self.canvas = nil;

  return self;
end

function Tft_Picture:Load(parent, index)
  self.gameObject = poolMgr:Get("BaseSty");
  self.gameObject.transform:SetParent(parent.transform);
  self.gameObject.name = string.format("moviepic_%05d", index);     
  self.rectTransform = self.gameObject:GetComponent("RectTransform");
  self.rectTransform.anchoredPosition = Vector2.zero;
  self.rawImage = self.gameObject:GetComponent("UIRawImageEx");

  if (string.find(self.picName, "l", 1, true) == 1) then
    self.picName = string.upper(self.picName);
  end
  
  if self.h > 1 then    
    TextureManager.SetPng(ETextureUseType.None, string.Concat(self.picName, "_1"), self.rawImage);
    self.rawImage:ContinuedPlay(self.picName, 1, self.h, 1, -1);  
    self.sizeData = textureSizeDatas[string.Concat(self.picName, "_1")];
  else
    TextureManager.SetPng(ETextureUseType.None, self.picName, self.rawImage);
    self.sizeData = textureSizeDatas[self.picName];
  end
  
  if self.rawImage.texture ~= nil then
    if self.sizeData ~= nil then
      self.width = self.sizeData.width;  
      self.height = self.sizeData.height;
    else
      self.width = self.rawImage.texture.width;  
      self.height = self.rawImage.texture.height;  
    end
  end

  self.canvas = self.gameObject:GetComponent("Canvas");         
  self.rectTransform.sizeDelta = Vector2.New(self.width, self.height);  
  self.parent = parent;

  tempVec.x = self.destXY[0].x - (self.width * 0.5) - parent.center.x;
  tempVec.y = -(self.destXY[0].y - self.height - parent.center.y);
  self.rectTransform.anchoredPosition = tempVec;

  --划龍舟動畫特別處理
  if self.picName == "L10788" then
    for i = 0, self.totalStep do
      self.destXY[i].x = math.max(self.destXY[i].x, Scene.currentSceneHalfWidth);
    end
  end

  self.position.x = self.destXY[0].x;
  self.position.y = self.destXY[0].y;
  self.destination.x = self.destXY[0].x;
  self.destination.y = self.destXY[0].y;

  self.nowStep = 0;
  self.speedLevel = 2;
  self.frame = 1;
  self.oldTime = CGTimer.time;
  self.overTime = CGTimer.time;

  self.material = nil;

  if self.alpha == 255 then 
    self.material = poolMgr:Get("LightOpaqueMaterial");
  else
    self.material = poolMgr:Get("LightMaterial");
    self.material:SetFloat("_InvisibleAlpha", self.alpha / MAX_ALPHA);
  end

  self.rawImage.material = self.material;
end

function Tft_Picture.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Tft_Picture.Script1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Tft_Picture.Script2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Tft_Picture:Destroy()
  self.parent = nil;  
  self.canvas = nil;
  self.rectTransform = nil;

  if self.alpha == 255 then
    poolMgr:Release("LightOpaqueMaterial", self.material);
  else
    poolMgr:Release("LightMaterial", self.material);
  end
  
  self.rawImage:StopChangeTexture();
  self.rawImage.material = nil;

  poolMgr:Release("BaseSty", self.gameObject);
  self.gameObject = nil;
end

function Tft_Picture:Show()  
  if self.destXY[self.nowStep] == nil then return end

  if self.h == 1 and self.w == 1 then
    --單圖
    self.frame = 1;
  elseif self.destXY[self.nowStep].frame == 0 then
    --切換圖片張數
    if self:IsOverTime() then
      self.frame = self.frame + 1;
      if self.frame > self.h * self.w then
        self.frame = 1;
      end
    end
    self.rawImage:ChangeOrder(self.frame);
  else
    --其餘張數鎖定在固定一張
    self.frame = self.destXY[self.nowStep].frame;
    self.rawImage:ChangeOrder(self.frame);
  end
  
  tempVec.x = self.position.x - (self.width * 0.5) - self.parent.center.x;
  tempVec.y = -(self.position.y - self.height - self.parent.center.y);

  self.rectTransform.anchoredPosition = tempVec;
end
    
function Tft_Picture:IsOverTime()
  if CGTimer.time - self.overTime > self.interval then
    self.overTime = CGTimer.time;
    return true;
  end

  return false;
end

function Tft_Picture:SortingOrder(order)
  self.canvas.sortingOrder = order + self.position.y;
end

function Tft_Picture.Script3()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Tft_Picture.Script4()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Tft_Picture:UpdatePosition()
  self.position = MoviePlayer.GetPosition(self.position, self.destination, self.speedLevel, CGTimer.time - self.oldTime);
  self.oldTime = CGTimer.time;

  if self.position ~= self.destination then return false end

  self.destXY[self.nowStep].arrive = true;
  
  return true;
end

function Tft_Picture:NextStep()
  self.nowStep = math.min(self.nowStep + 1, self.totalStep);

  self.destination.x = self.destXY[self.nowStep].x;
  self.destination.y = self.destXY[self.nowStep].y;
  self.speedLevel = self.destXY[self.nowStep].speedLevel;

  if self.destXY[self.nowStep].musicNo > 0 then
    MovieSound.PlayMovieSound(self.destXY[self.nowStep].musicNo);
  end
end

function Tft_Picture.Script5()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Tft_Picture.Script6()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Tft_Picture.Script7()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end