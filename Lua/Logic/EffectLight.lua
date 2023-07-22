EEffectLightKind = 
{
  None = 0,       --無用途
  Ground = 1,     --地1張
  Body1 = 2,      --身體可秀2張
  Body2 = 3,      
  Status = 4,    
  Shoot = 5,
  Sky1 = 6,       --空中可秀4張
  Sky2 = 7,                                           
  Sky3 = 8,
  Sky4 = 9,
}
  
EEffectLightTracer = {
  None = 0;       --無
  Stand = 1;      --原地不動      //結束在end圖
  StandAni = 2;   --原地動畫播完  //播完消失,picId設為0,
  Line = 3;       --直線過去      //到達時,arrive設為false
  Curve = 4;      --跳躍線過去    //到達時,arrive設為false
  Child = 5;      --某物件的子物件
}

 --顯圖權
 EEffectLightDis = {
  None = 0;    --無顯圖權,照原來秀法
  Ground = 1;  --秀在地
  Body = 2;    --秀在身
  Sky = 3;     --秀在天
 }

EEffectLightCurve = {
  UP = 1;
  Down = 2;
}
  
EffectLight = {}
EffectLight.__index = EffectLight;
local this = EffectLight;

local lights = {};
this.MAX_ALPHA = 32;
this.light_root = nil;
this.scenelight_root = nil;

function EffectLight.Destroy()
  poolMgr:DestroyPool("BaseLight");
  poolMgr:DestroyPool("BaseChildLight");
  poolMgr:DestroyPool("LightOpaqueMaterial");
  poolMgr:DestroyPool("LightMaterial");
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

function EffectLight.Initialize()
  this.light_root = GameObject.Find("LightRoot");
  this.scenelight_root = GameObject.Find("SceneLightRoot");

  CGResourceManager.Load(
    "BaseLight",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("BaseLight", asset);
    end
  );

  CGResourceManager.Load(
    "BaseChildLight",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("BaseChildLight", asset);
    end
  );

  CGResourceManager.Load(
    "LightOpaqueMaterial",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("LightOpaqueMaterial", asset);
    end
  );
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
  CGResourceManager.Load(
    "LightMaterial",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("LightMaterial", asset);
    end
  );

  CGResourceManager.Load(
          "LightMaterialExtra",
          "",
          function(assetName, asset)
            poolMgr:CreatePool("LightMaterialExtra", asset);
          end
  );
end

function EffectLight.New(aId, aInterval, aStartPage, aEndPage, aAllPage, aTracer_Style, fromX, fromY, aAlpha, aCircle, aBiasY, targetX, targetY, aSpeed, aCurvekind, isScene, timeScale)
  if fromX == nil then 
    fromX = 0;    
  end

  if fromY == nil then 
    fromY = 0;    
  end

  if aAlpha == nil then 
    aAlpha = 255;
  end

  if aCircle == nil then 
    aCircle = true;
  end

  if aBiasY == nil then 
    aBiasY = 0;
  end

  if targetX == nil then 
    targetX = 0;
  end

  if targetY == nil then 
    targetY = 0;
  end

  if aSpeed == nil then 
    aSpeed = 0.36;
  end

  if aCurvekind == nil then 
    aCurvekind = EEffectLightCurve.UP
  end

  if isScene == nil then
    isScene = false;
  end

  if timeScale == nil then 
    timeScale = 1;
  end

  local self = {};
  setmetatable(self, EffectLight);
  --Unity

  if aTracer_Style == EEffectLightTracer.Child then
    self.gameObject = poolMgr:Get("BaseChildLight");
  else
    self.gameObject = poolMgr:Get("BaseLight");
  end

  self.gameObject.name = string.Concat("EffectLight_", aId);
  if isScene then
    self.gameObject.transform:SetParent(this.scenelight_root.transform);
  else
    self.gameObject.transform:SetParent(this.light_root.transform);
  end

  self.gameObject.transform.localPosition = Vector3.zero;
  self.gameObject.transform.localScale = Vector3.one;
  self.gameObject.transform.localRotation = Quaternion.identity;

  self.gameObject:SetActive(true);

  self.baseOrderValue = 0;

  self.rectTransform = self.gameObject:GetComponent("RectTransform");
  self.rectTransform.localScale = Vector3.New(1, 1, 1);  
  self.rawImage = self.gameObject:GetComponent("RawImage");
  self.rawImage.raycastTarget = false;

  self.canvas = self.gameObject:GetComponent("Canvas");

  --Data
  self.fileName = nil;
  if type(aId) == 'string' then
    self.picId = 1;
    self.fileName = aId;  
  elseif tonumber(aId) ~= nil then
    self.picId = aId;                 --圖號
    self.fileName = string.format("L%5d", self.picId)
  else
    self.picId = 1;
    self.fileName = aId;
  end

  local file;
  if aAllPage > 1 then
    file = string.Concat(self.fileName, "_", tostring(aStartPage));
    self.isSinglePage = false;
  else
    file = self.fileName;
    self.isSinglePage = true;
  end

  TextureManager.SetPng(ETextureUseType.EffectLight, file, self.rawImage);
  self.rawImage.uvRect = Rect.New(0,0,1,1);

  self.width = 0;
  self.height= 0;
  if self.rawImage.texture ~= nil then
    if textureSizeDatas[file] ~= nil then
      self.width = textureSizeDatas[file].width;
      self.height = textureSizeDatas[file].height;
    else
      self.width = self.rawImage.texture.width;
      self.height = self.rawImage.texture.height;
    end
    
    self.rectTransform.sizeDelta = Vector2.New(self.width, self.height);  
    
    self.nowPage = 0;
    self.startPage = aStartPage;             --起始張數
    self.endPage = aEndPage;               --尾部張數
    self.allPage = aAllPage;               --光影總張數  
    self.showPos = Vector2.New(fromX, fromY);    --秀圖(移動性)座標
    self.startPos = Vector2.New(fromX, fromY);     --來源座標
    self.targetPos = Vector2.zero;  --目地座標
    self.isArrive = false;          --到達與否

    self.lastOrder = -1;
    self.orderCount = 0;            --現行播放第幾張
    self.orderTime = CGTimer.time;             --double;
    self.moveOldTime = CGTimer.time;           
    self.interval = aInterval;      --光影間隔時間
    self.alpha = aAlpha; 
    self.material = nil;
    self:SetMaterial();    

    self.isCircle = aCircle           --是否循環播放
    self.biasY = aBiasY; 
    self.tracer_Style = aTracer_Style;           --軌跡
    self.totalDist = 0;             --總距離(目前用在跳)
    self.curve_kind = aCurvekind;       --曲線種類     
    self:SetGetPosition(aSpeed);       --光影速度
    self.isShade = false;           --是否顯示陰影

    --遞增減alpha,所需變數
    self.allAlpha = 0;  --初始alpha值
    self.lastAlpha = 0;
    self.trimAStart = false; --是否變動alpha值
    self.alphaOldTime = 0;
    self.alphaAllTime = 0;

    --公轉光影所需的變數
    self.isRotate = false;         --是否自轉
    self.angle = false;            --圓的角度
    self.changeAngle = 0;          --改變的角度
    self.radius = 0;               --半徑
    self.rotateOldTime = 0;        --上次公轉的時間
    self.rotateInterval = 0;       --每次更換角度的時間間隔

  --    //殘影所需的變數
  --    isResidual: boolean;           //是否殘影
  --    ResCount: Byte;                //殘影個數
  --    ResOldTime: double;            //上次殘影抓的時間
  --    ResInterval: Word;             //每次抓取殘影的時間間隔
  --    ResMed: array[0~MaxLightResidual] of TPoint; //殘影暫存區
  --    ResChangeAlpha: ShortInt;     //殘影變更值

    self.defRand = Vector2.zero;            --設定亂數值
    self.rand = Vector2.zero;               --亂數值
  --    IsMirror: boolean;                 //是否要鏡射該光影

    --播圖方式----------------------------------------------------
    self.timeScale = timeScale;
    self.startTime = 0;
    if self.tracer_Style == EEffectLightTracer.Stand then 

    elseif self.tracer_Style == EEffectLightTracer.Line then       
      self.targetPos = Vector2.New(targetX, targetY)
      self:InitMoveData();
    elseif self.tracer_Style == EEffectLightTracer.Curve then         
      self:SetTracer_Curve(fromX, fromY, targetX, targetY);
    end

    self:SetRandom(0, 0);    --預設值
    self:ChangeUV();
    self:SetPosition();     
  else
    self.picId = 0;    
  end
  
  self.endCallback = nil;

  table.insert(lights, self);

  return self;
end

function EffectLight:SetMaterial()
  if self.alpha == 255 then
    self.material = poolMgr:Get("LightOpaqueMaterial");
    self.material.shader = UnityEngine.Shader.Find("Custom/LightOpaqueShader");
    self:SetColor(Color.Black);
  else
    --self.material = poolMgr:Get("LightMaterial")
    --self.material.shader = UnityEngine.Shader.Find("Custom/LightShader");
    --self.material:SetFloat("_InvisibleAlpha", self.alpha / this.MAX_ALPHA);
    --self:SetColor(Color.White);
    self.material = poolMgr:Get("LightMaterialExtra") --AssetsBundle無法使用shader.Find
    self.material:SetFloat("_InvisibleAlpha", self.alpha / this.MAX_ALPHA);
    self:SetColor(Color.White);
    self:SetColorMix(false);
  end
  self:SetAddColor(1);
  self.rawImage.material = self.material;
end

function EffectLight:SetColorMix(aEnable)
  if self.material then
    if aEnable then
      self.material:SetFloat("_COLORMIX", 1);
    else
      self.material:SetFloat("_COLORMIX", 0);
    end
  end
end

function EffectLight:Free(isAllClear)
  if self.endCallback ~= nil then
    self.endCallback(self);
  end

  self.rawImage.uvRect = Rect.New(0,0,1,1);
  if self.material ~= nil  then 
    if self.material.shader.name == "Custom/LightOpaqueShader" then 
      poolMgr:Release("LightOpaqueMaterial", self.material)         
    elseif self.material.shader.name == "Custom/LightShader" then 
      poolMgr:Release("LightMaterial", self.material)
    elseif self.material.shader.name == "Custom/LightShaderExtra" then
      poolMgr:Release("LightMaterialExtra", self.material)
    end
    self.material = nil;
    self.rawImage.material = nil;      
  end
  
  self.rawImage.texture = nil;
  
  if self.tracer_Style == EEffectLightTracer.Child then
    poolMgr:Release("BaseChildLight", self.gameObject);
  else
    poolMgr:Release("BaseLight", self.gameObject); 
  end

  if isAllClear == nil  then 
    table.RemoveByValue(lights, self)  
  end
end

function EffectLight:SetTimeScale(scale)
  self.timeScale = scale;
  self:InitMoveData();
end

function EffectLight.ClearAll()
  for k, v in pairs(lights) do     
    if v ~= nil then 
      v:Free(true);
    end
  end 
  table.Clear(lights);
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

function EffectLight.Update()
  for k, v in pairs(lights) do 
    if v ~= nil then 
      v:UpdateAll();
    end
  end
end

function EffectLight:IsOrderTime(dTime)  --單位為毫秒,故*1000
  if math.round((CGTimer.time - self.orderTime) * 1000 * self.timeScale)> dTime then  
    self.orderTime = CGTimer.time;
    return true;
  end
  return false;
end

function EffectLight:InitMoveData()
  self.moveOldTime = CGTimer.time;
  self.totalDist = math.round((self.targetPos - self.showPos).magnitude);
  self.totalTime = self.totalDist / (self.lightSpeed * self.timeScale);
end

function EffectLight:GetPosition()
  local nowTime = CGTimer.time - self.moveOldTime;
  local weight = nowTime / self.totalTime;
  if self.isArrive then  
    self.picId = 0;
    self.tracer_Style = EEffectLightTracer.None;
  end
             
  if (weight >= 1) then    
    self.showPos.x = self.targetPos.x;
    self.showPos.y = self.targetPos.y;
    self.isArrive = true;
  else    
    self.isArrive = false;    
    self.showPos = Vector2.Lerp(self.startPos, self.targetPos, weight);
  end      
end

function EffectLight:SetGetPosition(aSpeed)
  self.lightSpeed = aSpeed * 1000; --換算成每秒移動
end

function EffectLight:SetTracer_Curve(aFromX, aFromY, aObjX, aObjY) --設定曲線
  self.tracer_Style = EEffectLightTracer.Curve;    
  self.showPos = Vector2.New(aFromX, aFromY);
  self.startPos = Vector2.New(aFromX, aFromY);
  self.targetPos = Vector2.New(aObjX, aObjY);  
  self:InitMoveData();
end

function EffectLight:SetRotate(aAngle, aChangeAngle, aRadius, aRotateInterval)   --設定公轉,起始角度; 改變角度;半徑; 轉的時間差
  self.isRotate = true;                        --是否自轉
  self.angle = aAngle;                         --圓的角度
  self.changeAngle = aChangeAngle;             --改變的角度
  self.radius = aRadius;                       --半徑
  self.rotateOldTime = CGTimer.time;                    --上次公轉的時間
  self.rotateInterval = aRotateInterval;       --每次更換角度的時間間隔
end

function EffectLight.SetResidual(aResCount, aResInterval, aResChanageAlpha)  --設定殘影,殘影個數; 殘影間隔時間; 殘影變化值
--  isResidual:=True;
--  if aResCount>MaxLightResidual then
--    ResCount:=MaxLightResidual
--  else
--    ResCount:=aResCount;

--  ResInterval:=aResInterval;
--  ResOldTime:=now;
--  ResChangeAlpha:=aResChanageAlpha;
--  fillchar(ResMed, sizeof(ResMed), 0);
end

function EffectLight:SetRandom(aRandX, aRandY)
  self.defRand = Vector2.New(aRandX, aRandY);
  self.rand = Vector2.zero;               --亂數值
end

function EffectLight:SetColor(color)
  if self.material then 
    self.material:SetColor("_Color", color);
  end
end

function EffectLight:SetAddColor(value)
  if self.material then 
    self.material:SetFloat("_AddColor", value);
  end
end

function EffectLight:SetAlpha(aAllAlpha, atrimA, pCount)  --030527 jo遞增減alpha,漸淡效果
  if not (aAllAlpha >= 1 and aAllAlpha <= 254) then 
    return;
  end

  if self.alpha == 255 and self.material ~= nil and self.material.shader.name == "Custom/LightOpaqueShader" then 
    poolMgr:Release("LightOpaqueMaterial", self.material);
    self.material = poolMgr:Get("LightMaterial");
    self.material.shader = UnityEngine.Shader.Find("Custom/LightMaterial");
    self.rawImage.material = self.material;
  end

  self.allAlpha = aAllAlpha;
  self.lastAlpha = self.allAlpha + (atrimA * pCount);
  self.alphaAllTime = pCount / 30;
  self.alphaOldTime = CGTimer.time;

  if self.lastAlpha < 1 then
    self.lastAlpha = 1;
  elseif self.lastAlpha > 254 then
    self.lastAlpha = 254;
  end

  self.trimAStart = true;
end

function EffectLight:ChangeUV()
  local startPos;

  if self.isSinglePage or self.rawImage == nil then
    return;
  else
    self.lastOrder = self.orderCount;
  end
  
  if (self.startPage > self.endPage) then --倒著撥      
    self.nowPage = self.startPage - self.orderCount;
  else --順撥
    self.nowPage = self.orderCount + self.startPage;
  end

  TextureManager.SetPng(ETextureUseType.EffectLight, string.Concat(self.fileName, "_", tostring(self.nowPage)), self.rawImage); 
end

--function  EffectLight.ShowResidual()   --顯示光影的殘影

--end

function EffectLight:ShowUpdate()
  if self.picId == 0 then 
    self:Free();
    return;
  end
  
  local aHead, aTail, aOrder;
  local tempPos = Vector2.New(self.showPos.x, self.showPos.y);

--  UpdateRandom;
  self:UpdateTracer_Curve();   --更新曲線的 ShowY;
  self:UpdateRotate();         --公轉
--  UpdateResidual;       //殘影

  --ShowResidual;   //顯示其殘影

  if self.startPage <= self.endPage then  --從頭播
    aHead = self.startPage;
    aTail = self.endPage;
  else                        --從尾播    
    aHead = self.endPage;
    aTail = self.startPage; 
  end

  if self:IsOrderTime(self.interval) then  --換張時間計數
    self.orderCount = self.orderCount + 1;
    aOrder = self.orderCount;
    --if (trimAStart=true) and ((aHead+OrderCount)>aTail) then  OrderCount:=aTail-aHead; //030527 jo阿發變化直到最後一張時,停留在最後一張把阿發變化完成

    if (aHead + aOrder > aTail) then  --播完
      if (self.tracer_Style == EEffectLightTracer.StandAni)then      
        self.picId  = 0;
        self.tracer_Style = EEffectLightTracer.None;      
        self:Free();
        return;            
      elseif self.isCircle and (self.tracer_Style ~= EEffectLightTracer.StandAni) then  --重新播放and不為Tracer_StandAni
        self.orderCount = 0;
        self:ChangeUV();
      else          
        self.orderCount = aTail;  --停在最後一張        
      end
    else
      self:ChangeUV();
    end
  end
  
  if self.tracer_Style == EEffectLightTracer.Line or self.tracer_Style == EEffectLightTracer.Curve or self.isRotate == true then 
    self:SetPosition();
  end

  if self.tracer_Style == EEffectLightTracer.Curve then
    self.showPos.y = tempPos.y;
  end

  if self.isRotate then  
    self.showPos.x = tempPos.x;
    self.showPos.y = tempPos.y;
  end
end

function EffectLight:UpdateTracer_Curve()    --更新曲線
  local jy;
  local nowDist;      --現在距離
  local sRc;

  if self.tracer_Style == EEffectLightTracer.Curve then  
    if isShade then       --顯示陰影
--      sRC:=Rect(0,0,23,11);
--      se_CtrlImgDB.DrawToMemPlus(ShadowIdx, ShowX, ShowY, sRC);
    end
    nowDist = math.round((self.showPos- self.targetPos).magnitude);
    jy = math.round(360*(0.5-math.abs((nowDist/(self.totalDist+0.001))-0.5)));
    jy = math.round(jy-0.003*math.pow(jy,2));
    if self.curve_kind == EEffectLightCurve.UP then       
      self.showPos.y = self.showPos.y - jy;        
    elseif self.curve_kind == EEffectLightCurve.Down then       
      self.showPos.y = self.showPos.y + jy;            
    end
  end
end

function EffectLight:UpdateRotate()
  if not self.isRotate then return; end
  self.showPos.x = self.showPos.x + math.floor(self.radius * math.cos(self.angle* 0.01745329));
  self.showPos.y = self.showPos.y + math.floor(self.radius * math.sin(self.angle* 0.01745329));

  if (CGTimer.time - self.rotateOldTime) * 1000 * self.timeScale >= self.rotateInterval then  
    self.angle = (self.angle + self.changeAngle)%360 ;
    self.rotateOldTime = CGTimer.time;
  end  
end

function  EffectLight:UpdateAlpha()
  if not self.trimAStart then
    return;
  end

  local nowTime = CGTimer.time - self.alphaOldTime;
  local weight = nowTime / self.alphaAllTime;
  local isTransparent = (self.alpha ~= 255);
  self.alpha =  self.allAlpha + (self.lastAlpha - self.allAlpha) * weight;

  if weight == 1 then    
    self.trimAStart = false;
  end    

  if self.alpha == 255 and isTransparent then 
    poolMgr:Release("LightMaterial", self.material);
    self.material = poolMgr:Get("LightOpaqueMaterial");
    self.material.shader = UnityEngine.Shader.Find("Custom/LightOpaqueMaterial");
    self.rawImage.material = self.material;
  end
end

function EffectLight:SetPosition()
  local t = Vector2.New(self.showPos.x - (self.width * self.rectTransform.localScale.x )/ 2, 
                  -self.showPos.y + (self.height * self.rectTransform.localScale.y) - self.biasY);  
  if t.x ~= nil and t.y ~= nil then 
    self.gameObject.transform.localPosition = Vector3.New(t.x, t.y, 0);
    if self.canvas ~= nil then
      self.canvas.sortingOrder = -t.y + self.baseOrderValue;
    end
  end
end

function EffectLight:SetSortingOrder(order)
  self.baseOrderValue = order;
  if self.canvas ~= nil then
    self.canvas.sortingOrder = -1 * (-self.showPos.y + self.height - self.biasY) + self.baseOrderValue;
  end
end

function EffectLight.ToScreenPos(pos)
  local fieldX = Scene.sceneCaemera.transform.localPosition.x - Scene.currentSceneHalfWidth
  local fieldY = Scene.sceneCaemera.transform.localPosition.y - Scene.currentSceneHalfHeight  
  return Vector2.New(pos.x + fieldX, fieldY - pos.y)
end

function EffectLight:UpdateAll()
  if self.material == nil or self.rawImage.material == nil then 
    self:SetMaterial();
  end 
  
  if self.tracer_Style == EEffectLightTracer.Line or
    self.tracer_Style == EEffectLightTracer.Curve then 
    self:GetPosition();
  end

  if self.trimAStart == true then 
    self:UpdateAlpha(); 
    self.material:SetFloat("_InvisibleAlpha", self.alpha / this.MAX_ALPHA);
  end

  self:ShowUpdate();
end

function EffectLight:Stop()
  self.picId = 0;
  self.orderCount = 0;
  self.isArrive = false;  
end

function EffectLight:SetPage(start, endPage)
  self.startPage = start;
  self.endPage = endPage;
  self.orderCount = 0;
  self:ChangeUV();
end

function EffectLight:SetRaycastTarge(canTouch)
  self.rawImage.raycastTarget = canTouch;
end

function EffectLight:SetShowPos(pos)
  self.showPos = pos;
  self:SetPosition();
end

function EffectLight:SetScale(scale)
  self.rectTransform.localScale = scale;
  self:SetPosition();
end

function EffectLight:SetSize(width, height)
  self.width = width;
  self.height = height;

  self.rectTransform.sizeDelta = Vector2.New(self.width, self.height);  
  self:SetPosition();
end