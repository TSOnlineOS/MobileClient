UILoading = {}
local this = UILoading;

this.name = "UILoading";
this.uiController = nil;

local gameObject_sliderLoading;
local slider_Loading;
local text_Loading;

local rawImage_Transition;
local rawImage_LoadingBG;
local rawImage_Right;
local rawImage_Left;

local sliderValue = 0;
local OrgSortingOrder = 0;

this.ScreenTransitionMaterial = nil;

local pointCount = 1;
local nextUpdateTime;

function UILoading.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;

  slider_Loading = uiController:FindSlider("Slider_Loading");
  gameObject_sliderLoading = uiController:FindGameObject("Slider_Loading");
  text_Loading = uiController:FindText("Text_Loading");

  rawImage_Transition = uiController:FindRawImage("RawImage_Transition");
  rawImage_LoadingBG = uiController:FindRawImage("RawImage_LoadingBG");
  rawImage_Right = uiController:FindRawImage("RawImage_Right");
  rawImage_Left = uiController:FindRawImage("RawImage_Left");

  this.ForIphoneXScreen();
  OrgSortingOrder = this.uiController.canvas.sortingOrder;
end

function UILoading.LoadMaterial()
  CGResourceManager.Load(
    "ScreenTransitionMaterial",
    "",
    function(assetName, asset)
      this.ScreenTransitionMaterial = asset;
    end
  );
end

function UILoading.OnOpen()
  rawImage_Transition.material = this.ScreenTransitionMaterial;
  return true;
end

function UILoading.OnClose()
  UILoading.CloseAll();
  return true;
end

function UILoading.CloseAll()
  gameObject_sliderLoading:SetActive(false);
  text_Loading.gameObject:SetActive(false);
  rawImage_Transition.gameObject:SetActive(false);
  rawImage_LoadingBG.gameObject:SetActive(false);
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

function UILoading.StartLoadAsset()
  gameObject_sliderLoading:SetActive(true);
  text_Loading.gameObject:SetActive(true);
  rawImage_LoadingBG.gameObject:SetActive(true);
  text_Loading.text = "";
end

function UILoading.CorrectionSliderValue(showValue)
  if tostring(showValue) == "nan" or showValue == 0 then
    --
  else
    sliderValue = showValue;
  end
end

function UILoading.ShowAssetProgress()
  if not CGResourceManager.downloadDone then
    local value = (CGResourceManager.downloadedSize / CGResourceManager.totalDownloadSize);
    local showValue = value * (Resource.GetRmsSizePercent() * 0.5);

    showValue = showValue * 0.8; --(0.8是總計80%)

    UILoading.CorrectionSliderValue(showValue);

--    this.SetSliderText(string.Concat(string.format(Str_DownloadResources, math.floor(value * 100)), "%"));
    this.SetSliderText( string.format(Str_DownloadResources, CGResourceManager.downloadedSize * 0.000001 , CGResourceManager.totalDownloadSize* 0.000001 ) );
    this.SetSliderValue(sliderValue);
  else
    local value = CGResourceManager.decompressedCount / CGResourceManager.totalDecompressCount;
    local showValue = value * (Resource.GetRmsSizePercent() * 0.5 ) + (Resource.GetRmsSizePercent() * 0.5);

    showValue = showValue * 0.8; --(0.8是總計80%)

    UILoading.CorrectionSliderValue(showValue);

--    this.SetSliderText(string.Concat(string.format(Str_DecompressResources, math.floor(value * 100)), "%"));
    this.SetSliderText( string.format(Str_DecompressResources, CGResourceManager.decompressedCount, CGResourceManager.totalDecompressCount) );
    this.SetSliderValue(sliderValue);
  end
end

function UILoading.ShowDataProgress()
  local value = CGResourceManager.dataPackedCount / CGResourceManager.dataPackedDownloadCount;
  local showValue = value * Resource.GetDataSizePercent() + Resource.GetRmsSizePercent();

  showValue = showValue * 0.8; --(0.8是總計80%)

  UILoading.CorrectionSliderValue(showValue);

--  this.SetSliderText(string.Concat(string.format(Str_DownloadDatas, math.floor(value * 100)), "%"));
  this.SetSliderText( string.format(Str_DownloadDatas, CGResourceManager.dataPackedCount, CGResourceManager.dataPackedDownloadCount) );
  this.SetSliderValue(sliderValue);
end

function UILoading.ShowImageProgress()
  if not CGResourceManager.imageDownloadDone then
    local value = CGResourceManager.imageDownloadSize / CGResourceManager.imageTotalDownloadSize;
    local showValue = value * Resource.GetImageSizePercent() + Resource.GetDataSizePercent() + Resource.GetRmsSizePercent();

    showValue = showValue * 0.8; --(0.8是總計80%)

    UILoading.CorrectionSliderValue(showValue);

--    this.SetSliderText(string.Concat(string.format(Str_DownloadImages, math.floor(value * 100)), "%"));
    this.SetSliderText( string.format(Str_DownloadImages, CGResourceManager.imageDownloadSize * 0.000001, CGResourceManager.imageTotalDownloadSize * 0.000001) );
    this.SetSliderValue(sliderValue);
  else
    local value = CGResourceManager.imageDecompressedCount / CGResourceManager.imageTotalDecompressCount;
    local showValue = value * Resource.GetImageSizePercent() + Resource.GetDataSizePercent() + Resource.GetRmsSizePercent();

    showValue = showValue * 0.8; --(0.8是總計80%)

    UILoading.CorrectionSliderValue(showValue);

--    this.SetSliderText(string.Concat(string.format(Str_DecompressImages, math.floor(value * 100)), "%"));
    this.SetSliderText( string.format(Str_DecompressImages, CGResourceManager.imageDecompressedCount, CGResourceManager.imageTotalDecompressCount) );
    this.SetSliderValue(sliderValue);
  end
end

function UILoading.SetSliderValue(value)
  slider_Loading.value = value;
end

function UILoading.SetSliderText(text)
  if nextUpdateTime == nil or os.clock() > nextUpdateTime then
    nextUpdateTime = tonumber(os.clock() + 1);
    text_Loading.text = string.Concat(text, this.GetPointText());

    pointCount = pointCount + 1;

    if pointCount > 6 then pointCount = 1 end
  else
    text_Loading.text = string.Concat(text, this.GetPointText());
  end
end

function UILoading.GetPointText()
  if pointCount == 1 then
    return "."
  elseif pointCount == 2 then
    return ".."
  elseif pointCount == 3 then
    return "..."
  elseif pointCount == 4 then
    return "...."
  elseif pointCount == 5 then
    return "....."
  elseif pointCount == 6 then
    return "......"
  end

  return "";
end

function UILoading.ClearLoadingBG()
  rawImage_LoadingBG.gameObject:SetActive(false);
--  rawImage_LoadingBG.texture = nil;
--  rawImage_Right.texture = nil
--  rawImage_Left.texture = nil
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

-- Screen Effect--
local transitionAlpha = 0;
local transitionTime = 0;
local transitionWaitTime = 0;
local fadeInDelegate = {}; 
local fadeOutDelegate = {}; 
local isNeedFadeIn = false;
local isNeedFadeOut = false;

function UILoading.ImmediateIn()
  UI.Close(UILoading);

  if CGTimer.ContainsListener(this.UpdateFadeOut) then
    isNeedFadeIn = true; --正在FadeOut要跑FadeIn
  end
end

function UILoading.ImmediateOut()
  UI.Open(UILoading);

  if this.ScreenTransitionMaterial ~= nil then
    this.ScreenTransitionMaterial:SetFloat("_MaskValue", 0);
  end

  rawImage_Transition.gameObject:SetActive(true);

  if CGTimer.ContainsListener(this.UpdateFadeIn) then
    isNeedFadeOut = true; --正在FadeIn要跑FadeOut
    CGTimer.RemoveListener(this.UpdateFadeIn);
  end
end

function UILoading.FadeIn(waitTime, delegate, sortingOrder)
  UI.Open(UILoading);

  local temp = {};
  temp.waitTime = waitTime;
  temp.delegate = delegate;
  table.insert(fadeInDelegate, temp);

  if CGTimer.ContainsListener(this.UpdateFadeOut) then
    isNeedFadeIn = true; --正在FadeOut要跑FadeIn
    return;
  end
  
  if sortingOrder ~= nil then
    this.uiController.canvas.sortingOrder = sortingOrder;
  end

  this.StartFadeIn(waitTime);
end

function UILoading.StartFadeIn(waitTime)
  transitionAlpha = 0;
  this.ResetFadeState(waitTime);

  CGTimer.AddListener(this.UpdateFadeIn, 0.02)
end

function UILoading.FadeOut(waitTime, delegate)
  UI.Open(UILoading);

  local temp = {};
  temp.waitTime = waitTime;
  temp.delegate = delegate;
  table.insert(fadeOutDelegate, temp);

  if CGTimer.ContainsListener(this.UpdateFadeIn) then
    isNeedFadeOut = true; --正在FadeIn要跑FadeOut
    CGTimer.RemoveListener(this.UpdateFadeIn);
  end

  this.StartFadeOut(waitTime);
end

function UILoading.StartFadeOut(waitTime)
  transitionAlpha = 1;  
  UILoading.ResetFadeState(waitTime);
  CGTimer.AddListener(this.UpdateFadeOut, 0.02);
end

function UILoading.ResetFadeState(waitTime)
  if waitTime == nil then 
    waitTime = 0.6;
  end
  this.LoadTexture();

  if this.ScreenTransitionMaterial ~= nil then
    this.ScreenTransitionMaterial:SetFloat("_MaskValue", transitionAlpha);
  end
  
  transitionWaitTime = waitTime;
  transitionTime = CGTimer.time;
  rawImage_Transition.gameObject:SetActive(true);
end

function UILoading.LoadTexture()
  TextureManager.SetPng(ETextureUseType.None, string.Concat("Mask", math.random(1, 10)), rawImage_Transition);
end

function UILoading.UpdateFadeIn()
  if (CGTimer.time - transitionTime) >= transitionWaitTime then 
    if transitionAlpha >= 1 then 
      CGTimer.RemoveListener(this.UpdateFadeIn);

      if fadeInDelegate ~= nil then
        for k,v in pairs(fadeInDelegate)do
          if v.delegate ~= nil then
            v.delegate();
          end
        end

        table.Clear(fadeInDelegate);
      end

      UI.Close(UILoading); --淡入完關掉黑色遮罩
      this.uiController.canvas.sortingOrder = OrgSortingOrder;
      return;
    end

    transitionAlpha = transitionAlpha + CGTimer.deltaTime * 2.5;
  end

  if this.ScreenTransitionMaterial ~= nil then
    this.ScreenTransitionMaterial:SetFloat("_MaskValue", transitionAlpha);
  end
end

function UILoading.UpdateFadeOut()
  if (CGTimer.time - transitionTime) >= transitionWaitTime then 
    if transitionAlpha <= 0 then 
      CGTimer.RemoveListener(this.UpdateFadeOut);

      if fadeOutDelegate ~= nil then 
        for k, v in pairs(fadeOutDelegate)do
          if v.delegate ~= nil then
            v.delegate();
          end
        end

        table.Clear(fadeOutDelegate);     
      end
      
      if isNeedFadeOut then
        if fadeInDelegate ~= nil then
          for k,v in pairs(fadeInDelegate)do
            v.delegate();
          end

          table.Clear(fadeInDelegate);
        end

        isNeedFadeOut = false;
      end
  --      UI.Close(UILoading); 淡出要等全部事情做完才能關掉黑色遮罩
      return;
    end

    transitionAlpha = transitionAlpha - CGTimer.deltaTime * 2.5;
  end

  if this.ScreenTransitionMaterial ~= nil then
    this.ScreenTransitionMaterial:SetFloat("_MaskValue", transitionAlpha);
  end
end

function UILoading.FadeOutClouseUI()
  if isNeedFadeIn and table.Count(fadeInDelegate) > 0 then
    this.StartFadeIn(fadeInDelegate[#fadeInDelegate].waitTime, fadeInDelegate[#fadeInDelegate].delegate);
  else
    UI.Close(UILoading);
  end
  isNeedFadeIn = false;
end
-- Screen Effect--

function UILoading.ForIphoneXScreen()
  if not table.Contains(UIInsetScreen, SystemInfo.deviceModel) then
    return
  end

  text_Loading.transform.localPosition = Vector3.New(-606, text_Loading.transform.localPosition.y, text_Loading.transform.localPosition.z);
end