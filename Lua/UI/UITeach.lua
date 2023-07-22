UITeach = {}
local this = UITeach;

this.name = "UITeach";
this.uiController = nil;

local text_Step;
local text_Title;

local rawImage_Pic;

local transform_TipRoot;
local gameObject_Tips = {};

local currentId = 0;
local currentStep = 0;

local gameObject_Next;
local gameObject_Back;

--var
local timeoutTime = 0;
local anchoredTransform = nil;
local image_focusEffect;

local guideQueue = {};
function UITeach.Guide(guideId)
  if guideId == nil then return end
  if guideDatas[guideId] == nil then return end
  if BitFlag.Get(guideDatas[guideId][table.maxn(guideDatas[guideId])].bitFlagId) then return end

  table.insert(guideQueue, guideId);
  
  if not UI.showMainUI then
    UIMiniMap.UpdateVisible(true);
  end

  if not UI.IsVisible(UITeach) then
    UI.Open(UITeach);
  end
end

function UITeach.Initialize(go)
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;

  text_Step = uiController:FindText("Text_T2_Step");
  text_Title = uiController:FindText("Text_T2_Title");

  rawImage_Pic = uiController:FindRawImage("RawImage_Pic");
  image_focusEffect = uiController:FindImage("Image_FocusEffect"):GetComponent("UIFocusEffect");
  
  for i = 1, 5 do
    local tempObject = uiController:FindGameObject(string.Concat("Image_Tip (", i, ")"));
    tempObject:SetActive(false);
    poolMgr:CreatePool(string.Concat("GuideTip_", i), tempObject);

    if transform_TipRoot == nil then
      transform_TipRoot = tempObject.transform.parent;
    end
  end

  gameObject_Next = uiController:FindGameObject("Image_Next");
  gameObject_Back = uiController:FindGameObject("Image_Back");
  gameObject_Mask = uiController:FindGameObject("Image_Mask");

  local tempEvent = uiController:FindEvent("Image_Next");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Next);

  local tempEvent = uiController:FindEvent("Image_Back");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Back);
end

function UITeach.OnOpen()
  if table.Count(guideQueue) <= 0 then return false end
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  currentId = guideQueue[1];
  currentStep = 1;

  table.remove(guideQueue, 1);

  if guideDatas[currentId] == nil then return false end
  if guideDatas[currentId][currentStep] == nil then return false end

  this.UpdateUI();

  return true;
end

function UITeach.OnClose()
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  timeoutTime = 0;
  anchoredTransform = nil;
  image_focusEffect:Reset();
  return true;
end

function UITeach.Update()
  if timeoutTime == 0 then return end
  if anchoredTransform ~= nil then return end

  local guideData = guideDatas[currentId][currentStep];

  if guideData == nil then return end

  if CGTimer.time > timeoutTime then
    timeoutTime = 0;
    --ShowCenterMessage("Teach Fail !!");
    logError(string.Concat("Teach Fail !! TeachId = ", currentId, " Step = ", currentStep));
    currentStep = 9999;
    this.OnClick_Next();
    return;
  end

  local tagObject = GameObject.FindWithTag(guideData.focus.anchoredTag);
  if tagObject == nil then return end
  
  local uiTransform = tagObject.transform:Find(guideData.focus.anchoredRoot);
  if uiTransform == nil then return end

  local childs = LuaHelper.FindChildsRecursively(uiTransform, guideData.focus.anchoredObject, false);
  if childs ~= nil and childs.Length > 0 then
    if guideData.focus.anchoredParam > 0 then
      for j = 0, childs.Length - 1 do
        local tempEvent = childs[j]:GetComponent("UIEvent");
        if tempEvent ~= nil and tempEvent.parameter == guideData.focus.anchoredParam then
          anchoredTransform = childs[j]:GetComponent("RectTransform");
          break;
        end
      end
    else
      anchoredTransform = childs[0]:GetComponent("RectTransform");
    end
  end
  
  if anchoredTransform == nil then
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    return
  end

  logWarn(string.Concat("Finded ", anchoredTransform:ToString()));
  
  local focusObj = poolMgr:Get(string.Concat("GuideTip_", guideData.focus.style));

  if focusObj == nil then return end
  table.insert(gameObject_Tips, focusObj);

  local position = LuaHelper.GetRectTransformCenter(anchoredTransform);
  if guideData.focus.anchoredTag == "UI" then
    position = UI.camera:WorldToScreenPoint(position);
  else
    position = Scene.sceneCamera:WorldToScreenPoint(position);
  end

  focusObj:SetActive(true);
  focusObj.transform:SetParent(transform_TipRoot);
  focusObj.transform.localScale = Vector3.one;
  focusObj.transform.position = UI.camera:ScreenToWorldPoint(position);

  local rectTansform = focusObj:GetComponent("RectTransform");
  local size = LuaHelper.GetRectTransformSize(anchoredTransform) + Vector2.one * guideData.focus.sizeOffset;

  rectTansform.sizeDelta = size;
  
  image_focusEffect:Play(rectTansform.anchoredPosition, math.max(size.x,size.y));

  local tempEvent = focusObj:GetComponent("UIEvent");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Next);

  if not string.IsNullOrEmpty(guideData.focus.description) then
    if anchoredTransform.position.x < 0 then
      local descriptionObj = poolMgr:Get(string.Concat("GuideTip_", 2));

      if descriptionObj ~= nil then
        table.insert(gameObject_Tips, descriptionObj);
        
        descriptionObj:SetActive(true);
        descriptionObj.transform:SetParent(transform_TipRoot);
        descriptionObj.transform.localScale = Vector3.one;
        descriptionObj.transform.localPosition = focusObj.transform.localPosition + (Vector3.right * ((size.x * 0.5) + 5));

        descriptionObj.transform:Find("Text"):GetComponent("Text").text = guideData.focus.description;
        CGTimer.DoFunctionDelay(0, function() descriptionObj.transform:GetComponent("Image"):SetLayoutDirty(); end);
      end
    else
      local descriptionObj = poolMgr:Get(string.Concat("GuideTip_", 3));

      if descriptionObj ~= nil then
        table.insert(gameObject_Tips, descriptionObj);
        
        descriptionObj:SetActive(true);
        descriptionObj.transform:SetParent(transform_TipRoot);
        descriptionObj.transform.localScale = Vector3.one;
        descriptionObj.transform.localPosition = focusObj.transform.localPosition + (Vector3.left * ((size.x * 0.5) + 5));

        descriptionObj.transform:Find("Text"):GetComponent("Text").text = guideData.focus.description;
        CGTimer.DoFunctionDelay(0, function() descriptionObj.transform:GetComponent("Image"):SetLayoutDirty(); end);
      end
    end
  end
end

function UITeach.UpdateUI()
  --清資料
  timeoutTime = 0;
  anchoredTransform = nil;

  for k, v in pairs(gameObject_Tips) do
    poolMgr:Release(v.name, gameObject_Tips[k]);
    gameObject_Tips[k] = nil;
  end
  table.Clear(gameObject_Tips);

  --開始教學
  local guideData = guideDatas[currentId][currentStep];

  if guideData == nil then return end

  if guideData.closeUI then
    UI.CloseAllPreviousUI();

    if UI.IsVisible(UIMainFunction) then
      UIMainFunction.SetShowAll(false);
    end
  end
  
  if not string.IsNullOrEmpty(string.Get(guideData.title)) then
    text_Step.text = currentStep;
    text_Title.text = string.Get(guideData.title);
    
    text_Title.transform.parent.gameObject:SetActive(true);
  else
    text_Title.transform.parent.gameObject:SetActive(false);
  end

  if string.IsNullOrEmpty(guideData.focus.anchoredTag) or string.IsNullOrEmpty(guideData.focus.anchoredRoot) or string.IsNullOrEmpty(guideData.focus.anchoredObject) then
    TextureManager.SetPng(ETextureUseType.UI, string.format("Guide_%03d", guideData.picId), rawImage_Pic);
  
    gameObject_Next:SetActive(currentStep >= 1);
    gameObject_Back:SetActive(currentStep > 1);
    gameObject_Mask:SetActive(true);
  else
    gameObject_Mask:SetActive(false);

    CGTimer.DoFunctionDelay(0.1, function() timeoutTime = CGTimer.time + 3 end);
  end
end

function UITeach.OnClick_Next(uiEvent)
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  image_focusEffect:Reset();
  
  if anchoredTransform ~= nil then
    local tempEvent = anchoredTransform:GetComponent("UIEvent");
    if tempEvent ~= nil and tempEvent.enabled then
      tempEvent:OnPointerClick(uiEvent.eventData);
    end
  end

  currentStep = currentStep + 1;

  if guideDatas[currentId] == nil or guideDatas[currentId][currentStep] == nil then
    if currentId > 0 then
      --C:005-008 <看完新手教學> +教學編號(1)
      sendBuffer:Clear();
      sendBuffer:WriteByte(currentId);
      Network.Send(5, 8, sendBuffer);
    end

    --下一個教學
    if table.Count(guideQueue) > 0 then
      currentId = guideQueue[1];
      currentStep = 1;

      table.remove(guideQueue, 1);
    end
  end

  if guideDatas[currentId] ~= nil and guideDatas[currentId][currentStep] ~= nil then
    this.UpdateUI();
  else
    UI.Close(UITeach);
  end
end

function UITeach.OnClick_Back()
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  currentStep = currentStep - 1;

  if guideDatas[currentId] ~= nil and guideDatas[currentId][currentStep] ~= nil then
    this.UpdateUI();
  else
    currentStep = 1;
  end
end