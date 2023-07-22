UITurn = {}
local this = UITurn;

this.name = "UITurn";
this.uiController = nil;

--const
ETrunMode = {
  Reincarnation = 1, 
  Skin = 2,
  HairStyle = 3,
  HairColor = 4,
  Element = 5, --屬性
  Career = 6 -- 職業
}

local iconSize = 150;

local frameSize = {};
frameSize[ETrunMode.Reincarnation] = Vector2.New(800, 450);
frameSize[ETrunMode.Skin] = Vector2.New(620, 450);
frameSize[ETrunMode.HairStyle] = Vector2.New(600, 450);
frameSize[ETrunMode.HairColor] = Vector2.New(620, 450);
frameSize[ETrunMode.Element] = Vector2.New(460, 370);
frameSize[ETrunMode.Career] = Vector2.New(460, 370);

--ui
local transform_FrameRect;

local gameObject_Avatar = nil;
local gameObject_BodyRoot = nil;
local gameObject_ScrollIconDrag = nil;
local gameObject_Career = nil;
local gameOjbect_RandomAvatar = nil;
local gameOjbect_ResetAvatar = nil;

local scrollContent_Icon;
local scrollItems_Icon = {};

local image_Career = {};
local image_ColorPart = {};
local slider_ColorBar = {};

local rawImage_Body;
local rawImage_BG;

local image_Yes;
local image_NO;

local text_Characteristic = nil;
local text_Tittle = nil;
local text_Tip = nil;

--var
local currentTurnMode = ETrunMode.Reincarnation;
local currentTurn = 1;
local currentCareer = 0;
local currentElement = 0;
local currentStyleIndex = 0;
local currentColorPart = 1;
local currentSex = 1;
local currentDir = 0;
local currentBagIndex = -1;

local defaultStyleIndex = 0;
local defaultColor1 = 0;
local defaultColor2 = 0;

local colors = {};
colors[1] = { r = 0, g = 0, b = 0 } --帽
colors[2] = { r = 0, g = 0, b = 0 } --髮
colors[3] = { r = 0, g = 0, b = 0 } --膚
colors[4] = { r = 0, g = 0, b = 0 } --衣
colors[5] = { r = 0, g = 0, b = 0 } --褲
colors[6] = { r = 0, g = 0, b = 0 } --鞋

local jmp = nil;
local bodyColorTable = nil;
local bodyTexture = nil;

local animationTime = 0;
local animationId = 12;
local animationFrame = 0;

function UITurn.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  this.uiController.onVisible = this.OnVisible;

  transform_FrameRect = uiController:FindGameObject("FrameRect"):GetComponent("RectTransform");

  BaseHairColor = LuaHelper.GetColor(135, 73, 61, 255);
  BaseHairLightColor = LuaHelper.GetColor(224, 141, 96, 255);
  BaseBodyColor = LuaHelper.GetColor(240, 217, 173, 255);
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
  

  local tempEvent;

  scrollContent_Icon = uiController:FindScrollContent("ScrollContent_Icon");
  scrollContent_Icon.onInitialize = this.OnInitialize_ScrollContent_Icon;
  scrollContent_Icon.onItemChange = this.OnItemChange_ScrollContent_Icon;
  scrollContent_Icon:Initialize(1);
  scrollContent_Icon:AddOnValueChange(this.OnScrollValueChange);

  tempEvent = uiController:FindEvent("Scroll_IconDrag");
  tempEvent:SetListener(EventTriggerType.EndDrag, this.OnScrollEndDrag);

  for i = 1, 3 do
    image_ColorPart[i] = uiController:FindImage(string.Concat("Image_ColorPart (", i, ")"));
    tempEvent = uiController:FindEvent(string.Concat("Image_ColorPart (", i, ")"));
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ColorPart);
    tempEvent.parameter = i;
  end

  rawImage_Body = uiController:FindRawImage("RawImage_Body");
  rawImage_BG = uiController:FindRawImage("RawImage_BG");

  for i = 1, 3 do
    slider_ColorBar[i] = uiController:FindSlider(string.Concat("Slider_ColorBar (", i, ")"));
    tempEvent = uiController:FindEvent(string.Concat("Image_ColorAdd(", i, ")"));
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ColorAdd);
    tempEvent.parameter = i;

    tempEvent = uiController:FindEvent(string.Concat("Image_ColorSub(", i, ")"));
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ColorSub);
    tempEvent.parameter = i;
  end

  text_Characteristic = uiController:FindText("Text_Characteristic");
  text_Tittle = uiController:FindText("Text_Tittle");
  text_Tip = uiController:FindText("Text_Tip");

  for i = 1, 4 do 
    image_Career[i] = UICareerController.New(uiController:FindGameObject(string.Concat("GameObject_Career (", i, ")")));
    tempEvent = uiController:FindEvent(string.Concat("GameObject_Career (", i, ")"));
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Element);
    tempEvent.parameter = i;
  end

  image_Yes = uiController:FindEvent("Image_Yes");
  image_Yes:SetListener(EventTriggerType.PointerClick, this.OnClick_Yes);

  image_NO = uiController:FindEvent("Image_No");
  image_NO:SetListener(EventTriggerType.PointerClick, this.OnClick_No);

  tempEvent = uiController:FindEvent("Image_DirPrev");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_DirChange);
  tempEvent.parameter = -1;

  tempEvent = uiController:FindEvent("Image_DirNext");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_DirChange);
  tempEvent.parameter = 1;

  tempEvent = uiController:FindEvent("Image_RandomAvatar");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_RandomAvatar);

  tempEvent = uiController:FindEvent("Image_ResetAvatar");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ResetAvatar);

  gameObject_Avatar = uiController:FindGameObject("GameObject_Avatar");
  gameObject_BodyRoot = uiController:FindGameObject("GameObject_BodyRoot");

  gameOjbect_RandomAvatar = uiController:FindGameObject("Image_RandomAvatar");
  gameOjbect_ResetAvatar = uiController:FindGameObject("Image_ResetAvatar");
  gameObject_ScrollIconDrag = uiController:FindGameObject("Scroll_IconDrag");
  gameObject_ColorTab = uiController:FindGameObject("ColorTab");
  gameObject_Career = uiController:FindGameObject("GameObject_Career");
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
  
end

function UITurn.OnVisible(visible)
  if visible then
    text_Tip.text = string.Get(21694);
    if currentTurnMode == ETrunMode.Reincarnation then
      text_Tittle.text = string.Get(90108); --"轉生"
      text_Tittle.rectTransform.anchoredPosition = Vector2.New(260, 158);
    elseif currentTurnMode == ETrunMode.Skin then
      text_Tittle.text = string.Get(21678); --"換膚面膜"
      text_Tittle.rectTransform.anchoredPosition = Vector2.New(100, 158);
    elseif currentTurnMode == ETrunMode.HairStyle then
      text_Tittle.text = string.Get(21679); --"造型髮膠"
      text_Tittle.rectTransform.anchoredPosition = Vector2.New(262, 158);
    elseif currentTurnMode == ETrunMode.HairColor then
      text_Tittle.text = string.Get(21677); --"染髮劑";
      text_Tittle.rectTransform.anchoredPosition = Vector2.New(100, 158);
    elseif currentTurnMode == ETrunMode.Element then
      text_Tittle.text = string.Get(21680); --"屬性轉換"
      text_Tittle.rectTransform.anchoredPosition = Vector2.New(206, 120);
      text_Tip.text = string.Get(21695);
    elseif currentTurnMode == ETrunMode.Career then
      text_Tittle.text = string.Get(21693); --"職業轉換"
      text_Tittle.rectTransform.anchoredPosition = Vector2.New(206, 120);
      text_Tip.text = string.Get(21696);
    end      
  end
end

function UITurn.OnOpen(mode, turn, career, bagIndex)
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
  
  currentTurnMode = mode;
  currentColorPart = 1;
  currentDir = 0;
  
  if currentTurnMode == ETrunMode.Skin then
    currentColorPart = 2;
  elseif currentTurnMode == ETrunMode.HairColor then
    currentColorPart = 1;
  end

  currentTurn = turn;
  if currentTurn == nil then
    currentTurn = Role.player:GetAttribute(EAttribute.Turn);
  end

  currentCareer = career;
  if currentCareer == nil then
    currentCareer = Role.player:GetAttribute(EAttribute.Career);
  end

  currentBagIndex = bagIndex;
  currentSex = Role.player.data.sex;
  currentElement = Role.player:GetAttribute(EAttribute.Element);
  
  defaultStyleIndex = Role.player.data.headStyle;
  if Role.player:GetAttribute(EAttribute.Turn) > 0 then
    defaultStyleIndex = defaultStyleIndex - Role.hairStyleCount[0][currentSex];
  end

  defaultColor1 = Role.player.data.colorTints[1];
  defaultColor2 = Role.player.data.colorTints[2];

  this.UpdateUI();
  this.OnClick_ResetAvatar();

  return true;
end

function UITurn.OnClose()
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
  
  
  if bodyTexture ~= nil then
    TexturePool.Recycle(bodyTexture);
    bodyTexture = nil;
  end
  
  EventManager.SetConduct(true);

  return true;
end

function UITurn.Update()
  if CGTimer.time < animationTime then return end

  animationTime = CGTimer.time + 0.2;

  if jmp ~= nil then
    if jmp:Draw(bodyTexture, bodyColorTable, animationId + currentDir, animationFrame) then
      if not rawImage_Body.enabled then
        rawImage_Body.enabled = true;
      end
    end

    animationFrame = animationFrame + 1;

    if animationFrame >= jmp:GetAnimationFrameCount(animationId) then
      animationFrame = 0;
    end
  end
end

function UITurn.UpdateUI()
  if currentTurnMode == ETrunMode.Skin then
    currentColorPart = 2;
  elseif currentTurnMode == ETrunMode.HairColor then
    currentColorPart = 1;
  end

  transform_FrameRect.sizeDelta = frameSize[currentTurnMode];
  
  TextureManager.SetPng(ETextureUseType.UI, "common0_com075", rawImage_BG);

  gameObject_ScrollIconDrag:SetActive(currentTurnMode == ETrunMode.Reincarnation or currentTurnMode == ETrunMode.HairStyle);
  gameObject_Career:SetActive(currentTurnMode == ETrunMode.Element or currentTurnMode == ETrunMode.Career);
  gameObject_BodyRoot:SetActive(currentTurnMode ~= ETrunMode.Element and currentTurnMode ~= ETrunMode.Career);
  gameOjbect_RandomAvatar:SetActive(currentTurnMode == ETrunMode.Reincarnation);
  gameOjbect_ResetAvatar:SetActive(currentTurnMode == ETrunMode.Reincarnation);
  gameObject_Avatar:SetActive(Contains(currentTurnMode, ETrunMode.Reincarnation, ETrunMode.HairColor, ETrunMode.Skin));

  this.UpdateColorPartUI();
  this.UpdateElementUI();
end

function UITurn.UpdateColorPartUI()
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  
  for i = 1, 3 do
    image_ColorPart[i].raycastTarget = currentTurnMode == ETrunMode.Reincarnation;
    if i == currentColorPart then
      image_ColorPart[i].sprite = UI.GetSprite("kin005L");
    else
      image_ColorPart[i].sprite = UI.GetSprite("kin005D");
    end
  end

  this.UpdateColorUI();
end

function UITurn.UpdateColorUI()
  local value = 0;
  local index = 0;
  for i = 1, 3 do
    if i == 1 then
      index = colors[currentColorPart + 1].r + 1;
      value = 255 / 10 * index;
    elseif i == 2 then 
      index = colors[currentColorPart + 1].g + 1;
      value = 255 / 10 * index;
    else 
      index = colors[currentColorPart + 1].b + 1;
      value = 255 / 10 * index;
    end

    slider_ColorBar[i].value = (index - 1) / 9;
  end
end

function UITurn.UpdateElementUI()
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  if currentTurnMode == ETrunMode.Element then
    for i = 1, 4 do
      image_Career[i]:SetCareer(0, i, ECareer.None);

      if i ~= currentElement then
        image_Career[i]:SetGray();
      end
    end

    text_Characteristic.text = string.Concat(
      "<size=26>", 
      string.GetColorText(string.GetElement(currentElement), Color.ElementHint[currentElement]),
      "</size>",
      string.GetElementHint(currentElement)
    );

  elseif currentTurnMode == ETrunMode.Career then
    for i = 1, 4 do
      image_Career[i]:SetCareer(currentTurn, currentElement, i);

      if i ~= currentCareer then
        image_Career[i]:SetGray();
      end
    end

    text_Characteristic.text = string.Concat(
      "<size=26>", 
      string.GetColorText(string.GetCareer(currentCareer), Color.ElementHint[currentElement]),
      "</size>",
      string.GetCareerHint(currentCareer)
    );
  end
end

function UITurn.SelectStyle(styleIndex)
  currentStyleIndex = styleIndex;

  scrollContent_Icon.gameObject:GetComponent("RectTransform").anchoredPosition = Vector2.New(-16, -1 * iconSize + currentStyleIndex * iconSize);
  scrollContent_Icon:Refresh(Role.hairStyleCount[currentTurn][currentSex]);

  this.OnScrollValueChange();

  local showStyle = currentStyleIndex;
  if currentTurn > 0 then
    showStyle = showStyle + Role.hairStyleCount[0][currentSex];
  end

  local scale = 1;
  jmp, scale = Role.GetPlayerJmpHD(currentSex, showStyle);

  if jmp ~= nil then
    bodyColorTable = TSColor.Copy(jmp.colorTable, bodyColorTable);
    bodyTexture = TexturePool.Get(bodyTexture, jmp.width, jmp.height, TextureFormat.RGB24);

    rawImage_Body.rectTransform.sizeDelta = Vector2.New(jmp.width, jmp.height) * scale;
    rawImage_Body.texture = bodyTexture;

    this.UpdateBodyColor(bodyColorTable, jmp.colorTable, colors);
  end

  rawImage_Body.enabled = false;

  animationTime = 0;
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


end

function UITurn.UpdateBodyColor(currentColor, defaultColor, colorTint)
  currentColor = TSColor.Tint(currentColor, defaultColor, EColorPart.Hair, colorTint[2].r, colorTint[2].g, colorTint[2].b);
  currentColor = TSColor.Tint(currentColor, defaultColor, EColorPart.Skin, colorTint[3].r, colorTint[3].g, colorTint[3].b);
  currentColor = TSColor.Tint(currentColor, defaultColor, EColorPart.Clothes, colorTint[4].r, colorTint[4].g, colorTint[4].b);
  currentColor = TSColor.Tint(currentColor, defaultColor, EColorPart.Orna1, colorTint[5].r, colorTint[5].g, colorTint[5].b);
  currentColor = TSColor.Tint(currentColor, defaultColor, EColorPart.Boots, colorTint[6].r, colorTint[6].g, colorTint[6].b);

  scrollContent_Icon:Refresh();

  this.UpdateColorUI();
end

function UITurn.OnClick_DirChange(uiEvent)
  currentDir = currentDir + uiEvent.parameter;
  if currentDir == 4 then
    currentDir = -4;
  elseif currentDir == -5 then
    currentDir = 3;
  end

  animationTime = 0;
end

function UITurn.OnClick_ColorPart(uiEvent)
  if currentColorPart == uiEvent.parameter then return end

  currentColorPart = uiEvent.parameter;

  this.UpdateColorPartUI();
end

function UITurn.OnClick_ColorAdd(uiEvent)
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
  
  
  if uiEvent.parameter == 1 then
    colors[currentColorPart + 1].r = math.min(colors[currentColorPart + 1].r + 1, 9);  
  elseif uiEvent.parameter == 2 then
    colors[currentColorPart + 1].g = math.min(colors[currentColorPart + 1].g + 1, 9);  
  else
    colors[currentColorPart + 1].b = math.min(colors[currentColorPart + 1].b + 1, 9);  
  end

  this.UpdateBodyColor(bodyColorTable, jmp.colorTable, colors);
end

function UITurn.OnClick_ColorSub(uiEvent)
  if uiEvent.parameter == 1 then
    colors[currentColorPart + 1].r = math.max(colors[currentColorPart + 1].r - 1, 0);  
  elseif uiEvent.parameter == 2 then
    colors[currentColorPart + 1].g = math.max(colors[currentColorPart + 1].g - 1, 0);  
  else
    colors[currentColorPart + 1].b = math.max(colors[currentColorPart + 1].b - 1, 0);  
  end

  this.UpdateBodyColor(bodyColorTable, jmp.colorTable, colors);
end

function UITurn.OnClick_Element(uiEvent)
  if currentTurnMode == ETrunMode.Element then
    currentElement = uiEvent.parameter;
  elseif currentTurnMode == ETrunMode.Career then
    currentCareer = uiEvent.parameter;
  end
  
  this.UpdateElementUI();
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    ---2--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local area =  DemoCode.CalTriangleArea(100, 100)
      area = area * 1 + 2;
      if area > DemoCode.GetBitxor(20) then  --test avg
        local avg = DemoCode.CalAvg(10, 20, 30);
      end
    end
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
    
    end
  end
end

function UITurn.OnScrollValueChange()
  local posY = scrollContent_Icon.gameObject:GetComponent("RectTransform").anchoredPosition.y;
  local check = 0;
  local largePos = -1 * (iconSize + iconSize / 2);

  for k, v in pairs(scrollItems_Icon) do
    check = v.image_BG.rectTransform.anchoredPosition.y + posY;
    if check < -1 * iconSize and check > -2 * iconSize then
      if check >= largePos then
        v.image_BG.rectTransform.sizeDelta = Vector2.New(iconSize + (50 * check / largePos), iconSize + (50 * check / largePos));
      else
        check = largePos - (check - largePos);
        v.image_BG.rectTransform.sizeDelta = Vector2.New(iconSize + (50 * check / largePos), iconSize + (50 * check / largePos));
      end
      
      v.headIcon:SetHighLight(true);
      v.headIcon:SetGray(false);
    else
      v.image_BG.rectTransform.sizeDelta = Vector2.New(iconSize, iconSize);

      v.headIcon:SetHighLight(false);
      v.headIcon:SetGray(true);
    end
  end
end

function UITurn.OnScrollEndDrag(eventData)
  local posY = scrollContent_Icon.gameObject:GetComponent("RectTransform").anchoredPosition.y;
  local check = 0;
  local largePos = -1 * (iconSize + iconSize / 2);

  for k, v in pairs(scrollItems_Icon) do
    check = v.image_BG.rectTransform.anchoredPosition.y + posY;
    if check < -1 * iconSize and check > -2 * iconSize then
      this.SelectStyle(v.event_BG.parameter);
      return;
    end
  end
end

function UITurn.OnClick_Icon(uiEvent)
  if currentStyleIndex == uiEvent.parameter then return end
  
  this.SelectStyle(uiEvent.parameter);
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
end

function UITurn.OnInitialize_ScrollContent_Icon(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Icon[itemIndex] = {};
    scrollItems_Icon[itemIndex].image_BG = scrollItems[itemIndex]:GetComponent("Image");
    scrollItems_Icon[itemIndex].event_BG = scrollItems[itemIndex]:GetComponent("UIEvent");
    scrollItems_Icon[itemIndex].event_BG:SetListener(EventTriggerType.PointerClick, this.OnClick_Icon);
    scrollItems_Icon[itemIndex].headIcon = HeadIconController.New(scrollItems_Icon[itemIndex].image_BG.transform);
  end
end

function UITurn.OnItemChange_ScrollContent_Icon(dataIndex, itemIndex)
  dataIndex = math.fmod(dataIndex, Role.hairStyleCount[currentTurn][currentSex]);
  if dataIndex < 0 then
    dataIndex = dataIndex + Role.hairStyleCount[currentTurn][currentSex];
  end

  scrollItems_Icon[itemIndex].event_BG.parameter = dataIndex;

  local style = dataIndex;
  if currentTurn > 0 then
    style = style + Role.hairStyleCount[0][currentSex];
  end

  scrollItems_Icon[itemIndex].headIcon:ChangeIcon(currentSex, style);
  scrollItems_Icon[itemIndex].headIcon:ChangeIconColor(EHeadIconPart.Hair, colors[EHeadIconPart.Hair + 1].r, colors[EHeadIconPart.Hair + 1].g, colors[EHeadIconPart.Hair + 1].b);
  scrollItems_Icon[itemIndex].headIcon:ChangeIconColor(EHeadIconPart.Skin, colors[EHeadIconPart.Skin + 1].r, colors[EHeadIconPart.Skin + 1].g, colors[EHeadIconPart.Skin + 1].b);

  return true;
end

function UITurn.OnClick_ResetAvatar()
  Role.SetColorTint(colors, defaultColor1, defaultColor2);
  this.SelectStyle(defaultStyleIndex);
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  
end

function UITurn.OnClick_RandomAvatar()
  Role.SetColorRandom(colors, currentSex);
  this.SelectStyle(math.random(0, Role.hairStyleCount[currentTurn][currentSex] - 1));
end

function UITurn.OnClick_Yes()
  local color1 = 0;
  local color2 = 0;

  for i = 1, 3 do
    color1 = color1 + ((colors[i].r * 100) * math.pow(1000, 3 - i));
    color1 = color1 + ((colors[i].g * 10) * math.pow(1000, 3 - i));
    color1 = color1 + ((colors[i].b * 1) * math.pow(1000, 3 - i));
  end

  for i = 4, 6 do
    color2 = color2 + ((colors[i].r * 100) * math.pow(1000, 6 - i));
    color2 = color2 + ((colors[i].g * 10) * math.pow(1000, 6 - i));
    color2 = color2 + ((colors[i].b * 1) * math.pow(1000, 6 - i));
  end

  local style = currentStyleIndex;
  if currentTurn > 0 then
    style = style + Role.hairStyleCount[0][currentSex];
  end

  if currentTurnMode == ETrunMode.Reincarnation then
    if currentTurn == 1 then
      --C:023-046 <第一次轉生> +頭型(1) +調色盤1(4) +調色盤5(4)
      sendBuffer:Clear();
      sendBuffer:WriteByte(style);
      sendBuffer:WriteInt32(color1);
      sendBuffer:WriteInt32(color2);
      Network.Send(23, 46, sendBuffer);

      UI.Close(UITurn);

    elseif currentTurn == 2 then
      --C:023-054 <第二次轉生> +頭型(1) +調色盤1(4) +調色盤5(4) +職業(1)
      sendBuffer:Clear();
      sendBuffer:WriteByte(style);
      sendBuffer:WriteInt32(color1);
      sendBuffer:WriteInt32(color2);
      sendBuffer:WriteByte(currentCareer);
      Network.Send(23, 54, sendBuffer);

      UI.Close(UITurn);

    elseif currentTurn == 3 then
      --C:023-081 <第三次轉生> +頭型(1) +調色盤1(4) +調色盤5(4) +職業(1)
      sendBuffer:Clear();
      sendBuffer:WriteByte(style);
      sendBuffer:WriteInt32(color1);
      sendBuffer:WriteInt32(color2);
      sendBuffer:WriteByte(currentCareer);
      Network.Send(23, 81, sendBuffer);

      UI.Close(UITurn);
    end
  elseif currentTurnMode == ETrunMode.Skin then
    -- C:023-038 <變換髮色 or 膚色> +背包索引(2) +顏色R(1) +顏色G(1) +顏色B(1)
    sendBuffer:Clear();
    sendBuffer:WriteUInt16(currentBagIndex);
    sendBuffer:WriteByte(colors[3].r)
    sendBuffer:WriteByte(colors[3].g)
    sendBuffer:WriteByte(colors[3].b)
    Network.Send(23, 38, sendBuffer);

    UI.Close(UITurn);
    
  elseif currentTurnMode == ETrunMode.HairStyle then
    if style == Role.player.data.headStyle then
      ShowCenterMessage(string.Get(21855));
      return;
    end
    
    -- C:023-047 <變換頭型> +背包索引(2) +頭型(1)
    sendBuffer:Clear();
    sendBuffer:WriteUInt16(currentBagIndex);
    sendBuffer:WriteByte(style);
    Network.Send(23, 47, sendBuffer);

    UI.Close(UITurn);

  elseif currentTurnMode == ETrunMode.HairColor then
    -- C:023-038 <變換髮色 or 膚色> +背包索引(2) +顏色R(1) +顏色G(1) +顏色B(1)
    sendBuffer:Clear();
    sendBuffer:WriteUInt16(currentBagIndex);
    sendBuffer:WriteByte(colors[2].r);
    sendBuffer:WriteByte(colors[2].g);
    sendBuffer:WriteByte(colors[2].b);
    Network.Send(23, 38, sendBuffer);

    UI.Close(UITurn);
    ---2--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local area =  DemoCode.CalTriangleArea(100, 100)
      area = area * 1 + 2;
      if area > DemoCode.GetBitxor(20) then  --test avg
        local avg = DemoCode.CalAvg(10, 20, 30);
      end
    end
    --3----------------------------------------------------
    
  elseif currentTurnMode == ETrunMode.Element then
    if currentElement == Role.player:GetAttribute(EAttribute.Element) then
      ShowCenterMessage(string.Get(71263));
      return;
    end

    -- C:023-075 <屬性轉換符> +背包索引(2) +屬性(1)
    sendBuffer:Clear();
    sendBuffer:WriteUInt16(currentBagIndex);
    sendBuffer:WriteByte(currentElement);
    Network.Send(23, 75, sendBuffer);

    UI.Close(UITurn);

  elseif currentTurnMode == ETrunMode.Career then
    if currentCareer == Role.player:GetAttribute(EAttribute.Career) then
      ShowCenterMessage(string.Get(80304));
      return;
    end

    local careerText = "";
    if currentCareer == ECareer.XiaKe then
      if not MarkManager.GetMissionFlag(11487) then
        ShowCenterMessage(string.Get(80301));
        return;
      end

      careerText = string.Get(40452);

    elseif currentCareer == ECareer.BaWang then
      if not MarkManager.GetMissionFlag(11463) then
        ShowCenterMessage(string.Get(80300));
        return;
      end

      careerText = string.Get(40453);

    elseif currentCareer == ECareer.XianShi then
      if not MarkManager.GetMissionFlag(11491) then
        ShowCenterMessage(string.Get(80302));
        return;
      end

      careerText = string.Get(40454);

    elseif currentCareer == ECareer.DiXian then
      if not MarkManager.GetMissionFlag(11489) then
        ShowCenterMessage(string.Get(80303));
        return;
      end

      careerText = string.Get(40455);
    end

    ShowCheckMessage(
      function(result)
        if result then
          -- C:023-076 <職業轉換符> +背包索引(2) +職業(1)
          sendBuffer:Clear();
          sendBuffer:WriteUInt16(currentBagIndex);
          sendBuffer:WriteByte(currentCareer);
          Network.Send(23, 76, sendBuffer);

          UI.Close(UITurn);
        end
      end,
      string.format(string.Get(22559), careerText),
      Role.player
    );
  end
end

function UITurn.OnClick_No()
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  UI.Close(UITurn);
end