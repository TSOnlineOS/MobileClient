ElementController = {}
ElementController.__index = ElementController;

ElementController.ElementMaterial = nil;

function ElementController.Initialize()
  
  if LuaHelper.CheckDefine("DemoCode") then
    local faith = 0;
    for i = 1, 3 do
      faith = faith + i;
    end
  
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
    
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      human = satan + haven;
    else
      human = satan - haven;
    end
  
    haven = human + faith;
    satan = human - faith;
  end
  
  CGResourceManager.Load(
    "ElementMaterial",
    "",
    function(assetName, asset)
      ElementController.ElementMaterial = asset;
    end
  );
end

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

function ElementController.New(elementInfo, k)
  local wemData = wemDatas[elementInfo.picId];
  if wemData == nil or wemData.alpha == 0 then --alpha���� 0�B�b�����W���X���i��
    return;
  end

  local self = {};
  setmetatable(self, ElementController);

  self.gameObject = poolMgr:Get("BaseElement");
  self.gameObject.name = string.format("Element_%d", elementInfo.picId);
  self.gameObject.transform:SetParent(MapManager.elementRoot.transform);
  
  self.rectTransform = self.gameObject:GetComponent("RectTransform");
  self.rectTransform.localScale = Vector3.one;
  self.rectTransform.anchoredPosition = Vector2.New(elementInfo.position.x + MapManager.GetFixCenterLeft(), -(elementInfo.position.y + MapManager.GetFixCenterTop()));

  self.rawImage = self.gameObject:GetComponent("UIRawImageEx");  
  self.rawImage:StopChangeTexture();
  self.rawImage.uvRect = UI.fullRect;

  self.canvas = self.gameObject:GetComponent("Canvas");

  self.rawImage.material = ElementController.ElementMaterial;
  self.alpha = 255;
  self.material = nil;

  if wemData ~= nil then
    if wemData.frame > 1 then
      self.rectTransform.sizeDelta = Vector2.New(wemData.width, wemData.height / wemData.frame);
      self.rawImage:ContinuedPlay(tostring(elementInfo.picId), 1, wemData.frame, 0.001 * wemData.gapTime, -1);
    else
      TextureManager.SetPng(ETextureUseType.Scene, tostring(elementInfo.picId), self.rawImage);
      self.rectTransform.sizeDelta = Vector2.New(wemData.width, wemData.height);
    end
    
    if wemData.level < 3 then
      self.canvas.sortingOrder = 1;
    elseif wemData.level > 3 then
      self.canvas.sortingOrder = MapManager.mapHeight + k;
    else
      self.canvas.sortingOrder = math.max(1, -self.rectTransform.anchoredPosition.y + (wemData.indexY * MapManager.BLOCK_UNIT));
    end

    if wemData.alpha ~= 255 then
      self.alpha  = wemData.alpha;
      self.material = poolMgr:Get("LightMaterial");
      self.material.shader = UnityEngine.Shader.Find("Custom/LightShader");
      self.rawImage.material = self.material;
      self.material:SetFloat("_InvisibleAlpha", wemData.alpha / EffectLight.MAX_ALPHA); 
    end
  end

  return self;
end

function ElementController.SetMaterial()
  ElementController.ElementMaterial:SetColor("_Color", MapManager.mapData.color);
end

function ElementController.GuessNumber55(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function ElementController.GuessNumber66(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function ElementController:Destroy()
  if self.alpha ~= 255 then
    poolMgr:Release("LightMaterial", self.material);
    self.rawImage.material = nil; 
  end
  poolMgr:Release("BaseElement", self.gameObject);
  
  self.rawImage.texture = nil;
  
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      human = satan + haven;
    else
      human = satan - haven;
    end
  end
end