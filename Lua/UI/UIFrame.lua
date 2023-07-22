UIFrame = {}
local this = UIFrame;

this.name = "UIFrame";
this.uiController = nil;

local rectTransform_Frame;
local rectTransform_BG;
local rectTransform_mainTabGroup;

local text_Name;

local mainTabs = {};
local mainTabGroup;

local event_Help;
local event_Close;

local currentMainTab = 1;
local currentSubTab = 1;

local clickTabEvent = nil;
local clickHelpEvent = nil;
local clickCloseEvent = nil;
local redDotEvent = nil;

function UIFrame.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;

  rectTransform_Frame = uiController:FindGameObject("FrameRect"):GetComponent("RectTransform");
  rectTransform_BG = uiController:FindGameObject("Image_BG"):GetComponent("RectTransform");

  text_Name = uiController:FindText("Text_T1_Name");

  mainTabGroup = uiController:FindGameObject("MainTabGroup"):GetComponent("UIScaleTabGroup");
  rectTransform_mainTabGroup = uiController:FindGameObject("MainTabGroup"):GetComponent("RectTransform");
  local tabObjects = mainTabGroup:SetTabCount(UI.maxMainTab);
  for i = 0, tabObjects.Length - 1 do
    local mainTab = {};

    mainTab.image_Tab = tabObjects[i].transform:Find("Image_Tab"):GetComponent("Image");
    mainTab.event_Tab = tabObjects[i].transform:Find("Image_Tab"):GetComponent("UIEvent");
    mainTab.event_Tab:SetListener(EventTriggerType.PointerClick, this.OnClick_MainTab);
    mainTab.event_Tab.parameter = i + 1;

    mainTab.text_Name = mainTab.image_Tab.transform:Find("Text_T2_Name"):GetComponent("Text");
    mainTab.color_Name = mainTab.text_Name:GetComponent("GradientColor");
    
    mainTab.redDot = mainTab.text_Name.transform:Find("Image_RedDot"):GetComponent("Image");

    mainTab.subTabs = {};
    mainTab.subTabGroup = tabObjects[i].transform:Find("SubTabGroup"):GetComponent("UIScaleTabGroup");
    local subTabObjects = mainTab.subTabGroup:SetTabCount(UI.maxSubTab);
    for j = 0, subTabObjects.Length - 1 do
      local subTab = {};

      subTab.image_Tab = subTabObjects[j].transform:Find("Image_SubTab"):GetComponent("Image");
      subTab.event_Tab = subTabObjects[j].transform:Find("Image_SubTab"):GetComponent("UIEvent");
      subTab.event_Tab:SetListener(EventTriggerType.PointerClick, this.OnClick_SubTab);
      subTab.event_Tab.parameter = j + 1;

      subTab.text_Name = subTab.image_Tab.transform:Find("Text_T3_Name"):GetComponent("Text");

      subTab.redDot = subTab.text_Name.transform:Find("Image_RedDot"):GetComponent("Image");

      mainTab.subTabs[j + 1] = subTab;
    end

    mainTabs[i + 1] = mainTab;
  end

  event_Help = uiController:FindEvent("Image_Help");
  event_Help:SetListener(EventTriggerType.PointerClick, this.OnClick_Help);

  event_Close = uiController:FindEvent("Image_Close");
  event_Close:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);
end

function UIFrame.OnOpen()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
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
  return false;
end

function UIFrame.Active(anchor, uiName, closeEvent, helpEvent, tabEvent, tabDatas, defaultMainTab, defaultSubTab, redDotChecker)
  rectTransform_Frame:SetParent(anchor);
  rectTransform_Frame:SetSiblingIndex(1);
  rectTransform_Frame.anchorMin = Vector2.zero;
  rectTransform_Frame.anchorMax = Vector2.one;
  rectTransform_Frame.anchoredPosition = Vector2.zero;
  rectTransform_Frame.sizeDelta = Vector2.zero;
  
  text_Name.text = uiName;

  clickTabEvent = tabEvent;
  clickHelpEvent = helpEvent;
  clickCloseEvent = closeEvent;
  redDotEvent = redDotChecker;

  event_Close.gameObject:SetActive(clickCloseEvent ~= nil);

  this.SetTab(tabDatas, defaultMainTab, defaultSubTab);
  rectTransform_mainTabGroup.anchoredPosition = Vector2.zero;
end

function UIFrame.SetCloseEvent(closeEvent)
  clickCloseEvent = closeEvent;
  event_Close.gameObject:SetActive(clickCloseEvent ~= nil);
end

function UIFrame.SwitchTab(mainTab, subTab, trigEvent)
  mainTab = mainTab or 1;
  subTab = subTab or 1;

  local mainTabChanged = mainTab ~= currentMainTab;
  local subTabChanged = subTab ~= currentSubTab;
  
  if not mainTabChanged and not subTabChanged then return end
  if trigEvent ~= false and clickTabEvent ~= nil and not clickTabEvent(mainTab, subTab) then return end

  currentMainTab = mainTab;
  currentSubTab = subTab;

  if mainTabChanged then
    this.UpdateMainTab(false);
  else
    this.UpdateSubTab();
  end
end

function UIFrame.SetTab(tabDatas, defaultMainTab, defaultSubTab)
  currentMainTab = math.max(defaultMainTab or 1, 1);
  currentSubTab = math.max(defaultSubTab or 1, 1);
  
  if tabDatas ~= nil and table.maxn(tabDatas) > 0 then
    rectTransform_BG.offsetMin = Vector2.New(-130, -10);
    rectTransform_BG.offsetMax = Vector2.New(10, 58);
  else
    rectTransform_BG.offsetMin = Vector2.New(-10, -10);
    rectTransform_BG.offsetMax = Vector2.New(10, 58);
  end

  if tabDatas ~= nil then    
    mainTabGroup:SetTabCount(table.maxn(tabDatas));
    mainTabGroup:ShowDirect();
    
    for i = 1, table.maxn(tabDatas) do
      if tabDatas[i] ~= nil then
        mainTabs[i].text_Name.text = tabDatas[i][1];
        
        if tabDatas[i][2] ~= nil then
          mainTabs[i].subTabGroup:SetTabCount(table.maxn(tabDatas[i][2]));
          
          for j = 1, table.maxn(tabDatas[i][2]) do
            mainTabs[i].subTabs[j].text_Name.text = tabDatas[i][2][j];
          end
        else
          mainTabs[i].subTabGroup:SetTabCount(0);
        end
      else
        mainTabs[i].text_Name.text = "";
        mainTabs[i].subTabGroup:SetTabCount(0);
      end
    end
  else
    mainTabGroup:SetTabCount(0);
  end

  this.UpdateMainTab(true);
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
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

function UIFrame.UpdateMainTab(showDirect)
  for k, v in pairs(mainTabs) do
    if k == currentMainTab then
      v.image_Tab.sprite = UI.GetTagSprite(true);
      v.color_Name.enabled = true;
    else
      v.image_Tab.sprite = UI.GetTagSprite(false);
      v.color_Name.enabled = false;
    end
  end

  if showDirect then
    mainTabs[currentMainTab].subTabGroup:ShowDirect();
  else
    mainTabs[currentMainTab].subTabGroup:Show();
  end

  this.UpdateSubTab();
end

function UIFrame.UpdateSubTab()
  for k, v in pairs(mainTabs[currentMainTab].subTabs) do
    v.image_Tab.sprite = UI.GetSubTagSprite(k == currentSubTab);
  end

  this.UpdateRedDot();
  this.UpdateHelp();
end

function UIFrame.UpdateRedDot()
  if not CGTimer.ContainsListener(this.DOUpdateRedDot) then
    CGTimer.AddListener(this.DOUpdateRedDot, 1, true);
  end
end

function UIFrame.DOUpdateRedDot()
  for k, v in pairs(mainTabs) do
    if redDotEvent ~= nil then
      v.redDot.gameObject:SetActive(redDotEvent(k));
    else
      v.redDot.gameObject:SetActive(false);
    end
  end

  for k, v in pairs(mainTabs[currentMainTab].subTabs) do
    if redDotEvent ~= nil then
      v.redDot.gameObject:SetActive(redDotEvent(currentMainTab, k));
    else
      v.redDot.gameObject:SetActive(false);
    end
  end
end

function UIFrame.UpdateHelp()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
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
  event_Help.gameObject:SetActive(clickHelpEvent ~= nil and clickHelpEvent(true));
end

function UIFrame.OnClick_Help()
  if clickHelpEvent == nil then return end
  
  clickHelpEvent();
end

function UIFrame.OnClick_Close()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
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
  CGTimer.RemoveListener(this.DOUpdateRedDot);
  redDotEvent = nil;
  if not clickCloseEvent() then return end
end

function UIFrame.OnClick_MainTab(uiEvent)
  if currentMainTab == uiEvent.parameter then return end
  if not clickTabEvent(uiEvent.parameter, 1) then return end

  currentMainTab = uiEvent.parameter;
  currentSubTab = 1;
  
  this.UpdateMainTab(false);
end

function UIFrame.OnClick_SubTab(uiEvent)
  if currentSubTab == uiEvent.parameter then return end  
  if not clickTabEvent(currentMainTab, uiEvent.parameter) then return end

  currentSubTab = uiEvent.parameter;

  this.UpdateSubTab();
end