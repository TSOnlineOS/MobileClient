UICreateRole = {}
local this = UICreateRole;

this.name = "UICreateRole";
this.uiController = nil;

ECreateRoleStep = {
  Avartar = 1;
  Attribute = 2;
}

local ColorPart_Name = {"but088H", "but088S", "but088C"};
local Icon_Size = 150;
local Name_Length = 14;

local gameObject_Avatar = nil;
local gameObject_Attribute = nil;
local gameObject_BodyRoot = nil;

local scrollContent_Icon;
local scrollItems_Icon = {};

local image_Career = {};
local gradientColor_Career = {};
local text_Career = {};

local gameObject_InputName;
local image_Element = {};
local image_ColorPart = {};
local image_Sex = {};
local image_ColorBar = {};

local text_Attribute = {};
local text_AttributePoint;
local text_Characteristic;

local rawImage_BG;
local rawImage_FG;
local rawImage_BodyBG;
local rawImage_Mirror;
local rawImage_Body;
local rawImage_BodyBG;
local rawImage_AttributeBG;
local rawImage_ColorBG;

local inputField_Name;
local inputField_Password1;
local inputField_Password2;

local currentStyle = 0;
local currentElement = 1;
local currentColorPart = 1;
local currentSex = 1;
local currentDir = 0;
local currentStep;

local attributePoint = 6;
local attributeValue = { 0, 0, 0, 0, 0, 0 };

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

function UICreateRole.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;

  BaseHairColor = LuaHelper.GetColor(135, 73, 61, 255);
  BaseHairLightColor = LuaHelper.GetColor(224, 141, 96, 255);
  BaseBodyColor = LuaHelper.GetColor(240, 217, 173, 255);

  local tempEvent;
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------

  scrollContent_Icon = uiController:FindScrollContent("ScrollContent_Icon");
  scrollContent_Icon.onInitialize = this.OnInitialize_ScrollContent_Icon;
  scrollContent_Icon.onItemChange = this.OnItemChange_ScrollContent_Icon;
  scrollContent_Icon:Initialize(1);
  scrollContent_Icon:AddOnValueChange(this.OnScrollValueChange);

  tempEvent = uiController:FindEvent("Scroll_IconDrag");
  tempEvent:SetListener(EventTriggerType.EndDrag, this.OnScrollEndDrag);

  rawImage_BG = uiController:FindRawImage("RawImage_BG");
  --rawImage_FG = uiController:FindRawImage("RawImage_FG");
  rawImage_Mirror = uiController:FindRawImage("RawImage_Mirror");
  rawImage_Body = uiController:FindRawImage("RawImage_Body");
  rawImage_BodyBG = uiController:FindRawImage("RawImage_BodyBG");
  rawImage_AttributeBG = uiController:FindRawImage("RawImage_AttributeBG");
  --rawImage_ColorBG = uiController:FindRawImage("RawImage_ColorBG");
  
  for i = 1, 4 do
    image_CurrentElement = uiController:FindImage("Image_CurrentElement");
    image_Career[i] = uiController:FindImage(string.Concat("Image_Career (", i, ")"));
    text_Career[i] = uiController:FindText(string.Concat("Text_Career (", i, ")"));
    gradientColor_Career[i] = text_Career[i]:GetComponent("GradientColor");
    tempEvent = uiController:FindEvent(string.Concat("Image_Career (", i, ")"));
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Element);
    tempEvent.parameter = i;
  end

  for i = 1, 3 do
    image_ColorPart[i] = uiController:FindImage(string.Concat("Image_ColorPart (", i, ")"));
    tempEvent = uiController:FindEvent(string.Concat("Image_ColorPart (", i, ")"));
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ColorPart);
    tempEvent.parameter = i;
  end

  for i = 1, 2 do
    image_Sex[i] = uiController:FindRawImage(string.Concat("Image_Sex (", i, ")"));
    tempEvent = uiController:FindEvent(string.Concat("Image_Sex (", i, ")"));
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Sex);
    tempEvent.parameter = i;
  end

  text_AttributePoint = uiController:FindText("Text_AttributePoint");
  text_Characteristic = uiController:FindText("Text_Characteristic");
  
  inputField_Name = uiController:FindInputField("InputField_Name");
  inputField_Name:AddListener(this.OnChange_Name);

  inputField_Password1 = uiController:FindInputField("InputField_Password (1)");
  inputField_Password2 = uiController:FindInputField("InputField_Password (2)");

  for i = 1, 3 do
    image_ColorBar[i] = uiController:FindImage(string.Concat("Image_Bar (", i, ")"));
    tempEvent = uiController:FindEvent(string.Concat("Image_ColorAdd(", i, ")"));
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ColorAdd);
    tempEvent.parameter = i;

    tempEvent = uiController:FindEvent(string.Concat("Image_ColorSub(", i, ")"));
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ColorSub);
    tempEvent.parameter = i;
  end

  for i = 1, 6 do
    text_Attribute[i] = uiController:FindText(string.Concat("Text_Attribute(", i, ")"));
    tempEvent = uiController:FindEvent(string.Concat("Image_AttributeAdd(", i, ")"));
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_AttributeAdd);
    tempEvent.parameter = i;

    tempEvent = uiController:FindEvent(string.Concat("Image_AttributeSub(", i, ")"));
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_AttributeSub);
    tempEvent.parameter = i;
  end

  tempEvent = uiController:FindEvent("Image_DirPrev");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_DirChange);
  tempEvent.parameter = -1;

  tempEvent = uiController:FindEvent("Image_DirNext");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_DirChange);
  tempEvent.parameter = 1;

  tempEvent = uiController:FindEvent("Image_Next");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Next);

  tempEvent = uiController:FindEvent("Image_Previous");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Previous);

  tempEvent = uiController:FindEvent("Image_RandomName");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_RandomName);

  tempEvent = uiController:FindEvent("Image_RandomAvatar");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_RandomAvatar);

  tempEvent = uiController:FindEvent("Image_ResetAvatar");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ResetAvatar);

  gameObject_Avatar = uiController:FindGameObject("GameObject_Avatar");
  gameObject_Attribute = uiController:FindGameObject("GameObject_Attribute");
  gameObject_BodyRoot = uiController:FindGameObject("GameObject_BodyRoot");
  gameObject_InputName = uiController:FindGameObject("GameObject_InputName");
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
end

function UICreateRole.OnOpen()
  UILoading.FadeIn();

  attributePoint = 6;
  for i = 1, 6 do
    attributeValue[i] = 0;
  end

  inputField_Name.text = "";

  currentElement = 1;
  currentColorPart = 1;
  currentSex = 1;
  currentStep = ECreateRoleStep.Avartar;

  this.UpdateUI();
  this.OnClick_ResetAvatar();

  return true;
end

function UICreateRole.OnClose()
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if bodyTexture ~= nil then
    TexturePool.Recycle(bodyTexture);
    bodyTexture = nil;
  end
  
  return true;
end

function UICreateRole.Update()
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

function UICreateRole.UpdateUI()
  TextureManager.SetPng(ETextureUseType.UI, "common0_bod040", rawImage_BG);
  --TextureManager.SetPng(ETextureUseType.UI, "common0_bod041", rawImage_FG);
  TextureManager.SetPng(ETextureUseType.UI, "common0_bod042", rawImage_Mirror);
  TextureManager.SetPng(ETextureUseType.UI, "common0_com040", rawImage_BodyBG);

  gameObject_Avatar:SetActive(currentStep == ECreateRoleStep.Avartar);
  gameObject_Attribute:SetActive(currentStep == ECreateRoleStep.Attribute);

  if currentStep == ECreateRoleStep.Avartar then
    --TextureManager.SetPng(ETextureUseType.UI, "common0_bod044", rawImage_ColorBG);

    gameObject_BodyRoot.transform.localPosition = Vector3.New(-75, -70, 0);
    rawImage_Mirror.transform.localPosition = Vector3.New(-75, 10, 0);

    this.UpdateSexUI();
    this.UpdateColorPartUI();
  else
    TextureManager.SetPng(ETextureUseType.UI, "common0_bod043", rawImage_AttributeBG);

    gameObject_BodyRoot.transform.localPosition = Vector3.New(-270, -10, 0);
    rawImage_Mirror.transform.localPosition = Vector3.New(-270, 70, 0);
  
    this.UpdateElementUI();
    this.UpdateAttributeUI();
  end
end

function UICreateRole.UpdateSexUI()
  for i = 1, 2 do
    if i == currentSex then
      if i == 1 then
        TextureManager.SetPng(ETextureUseType.UI, "common0_kin003ML", image_Sex[i]);
      elseif i == 2 then
        TextureManager.SetPng(ETextureUseType.UI, "common0_kin003FL", image_Sex[i]);
      end
    else
      if i == 1 then
        TextureManager.SetPng(ETextureUseType.UI, "common0_kin003MD", image_Sex[i]);
      elseif i == 2 then
        TextureManager.SetPng(ETextureUseType.UI, "common0_kin003FD", image_Sex[i]);
      end
    end
  end
end

function UICreateRole.UpdateColorPartUI()
  for i = 1, 3 do
    if i == currentColorPart then
      image_ColorPart[i].sprite = UI.GetSprite(string.Concat(ColorPart_Name[i], "L"));
    else
      image_ColorPart[i].sprite = UI.GetSprite(string.Concat(ColorPart_Name[i], "D"));
    end
  end

  this.UpdateColorUI();
end

function UICreateRole.UpdateColorUI()
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

    image_ColorBar[i].fillAmount = (index - 1) / 9;
  end
  
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
end

function UICreateRole.UpdateElementUI()
  for i = 1, 4 do
    text_Career[i].text = string.GetElement(i);
    if i == currentElement then
      image_Career[i].color = Color.CareerKind[i][4];
      gradientColor_Career[i].colorBottom = Color.CareerKind[i][5];
      gradientColor_Career[i]:Refresh();
    else
      image_Career[i].color = Color.CareerKind[0][4];
      gradientColor_Career[i].colorBottom = Color.CareerKind[0][3];
      gradientColor_Career[i]:Refresh();
    end
  end

  text_Characteristic.text = string.Concat(
    "<size=26>", 
    string.GetColorText(string.GetElement(currentElement), Color.CareerKind[currentElement][5]),
    "</size>",
    string.Get(20006 + currentElement)
  );
end

function UICreateRole.UpdateAttributeUI()
  text_AttributePoint.text = string.Concat(string.Get(20750), " ", attributePoint);

  for i = 1, 6 do
    text_Attribute[i].text = attributeValue[i];
  end
end

function UICreateRole.SelectStyle(style)
  currentStyle = style;

  scrollContent_Icon.gameObject:GetComponent("RectTransform").anchoredPosition = Vector2.New(0, -1 * Icon_Size + currentStyle * Icon_Size);
  scrollContent_Icon:Refresh(Role.hairStyleCount[0][currentSex]);

  this.OnScrollValueChange();
  
  local scale = 1;
  jmp, scale = Role.GetPlayerJmpHD(currentSex, currentStyle);

  if jmp ~= nil then
    bodyColorTable = TSColor.Copy(jmp.colorTable, bodyColorTable);
    bodyTexture = TexturePool.Get(bodyTexture, jmp.width, jmp.height, TextureFormat.RGB24);

    rawImage_Body.rectTransform.sizeDelta = Vector2.New(jmp.width, jmp.height) * scale;
    rawImage_Body.texture = bodyTexture;

    this.UpdateBodyColor(bodyColorTable, jmp.colorTable, colors);
  end

  rawImage_Body.enabled = false;

  animationTime = 0;
end

function UICreateRole.UpdateBodyColor(currentColor, defaultColor, colorTint)
  currentColor = TSColor.Tint(currentColor, defaultColor, EColorPart.Hair, colorTint[2].r, colorTint[2].g, colorTint[2].b);
  currentColor = TSColor.Tint(currentColor, defaultColor, EColorPart.Skin, colorTint[3].r, colorTint[3].g, colorTint[3].b);
  currentColor = TSColor.Tint(currentColor, defaultColor, EColorPart.Clothes, colorTint[4].r, colorTint[4].g, colorTint[4].b);
  currentColor = TSColor.Tint(currentColor, defaultColor, EColorPart.Orna1, colorTint[5].r, colorTint[5].g, colorTint[5].b);
  currentColor = TSColor.Tint(currentColor, defaultColor, EColorPart.Boots, colorTint[6].r, colorTint[6].g, colorTint[6].b);

  scrollContent_Icon:Refresh();

  this.UpdateColorUI();
end

function UICreateRole.OnClick_DirChange(uiEvent)
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  currentDir = currentDir + uiEvent.parameter;
  if currentDir == 4 then
    currentDir = -4;
  elseif currentDir == -5 then
    currentDir = 3;
  end
  
  animationTime = 0;
end

function UICreateRole.OnClick_Element(uiEvent)
  if currentElement == uiEvent.parameter then return end

  currentElement = uiEvent.parameter;

  this.UpdateElementUI();
end

function UICreateRole.OnClick_AttributeAdd(uiEvent)
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if attributePoint < 1 then return end
  
  attributePoint = attributePoint - 1;
  attributeValue[uiEvent.parameter] = attributeValue[uiEvent.parameter] + 1;
  
  this.UpdateAttributeUI();
end

function UICreateRole.OnClick_AttributeSub(uiEvent)
  if attributeValue[uiEvent.parameter] < 1 then return end
  
  attributePoint = attributePoint + 1;
  attributeValue[uiEvent.parameter] = attributeValue[uiEvent.parameter] - 1;
  
  this.UpdateAttributeUI();
end

function UICreateRole.OnClick_ColorPart(uiEvent)
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if currentColorPart == uiEvent.parameter then return end

  currentColorPart = uiEvent.parameter;

  this.UpdateColorPartUI();
end

function UICreateRole.OnClick_ColorAdd(uiEvent)
  if jmp == nil then return end

  if uiEvent.parameter == 1 then
    colors[currentColorPart + 1].r = math.min(colors[currentColorPart + 1].r + 1, 9);  
  elseif uiEvent.parameter == 2 then
    colors[currentColorPart + 1].g = math.min(colors[currentColorPart + 1].g + 1, 9);  
  else
    colors[currentColorPart + 1].b = math.min(colors[currentColorPart + 1].b + 1, 9);  
  end

  this.UpdateBodyColor(bodyColorTable, jmp.colorTable, colors);
end

function UICreateRole.OnClick_ColorSub(uiEvent)
  if jmp == nil then return end

  if uiEvent.parameter == 1 then
    colors[currentColorPart + 1].r = math.max(colors[currentColorPart + 1].r - 1, 0);  
  elseif uiEvent.parameter == 2 then
    colors[currentColorPart + 1].g = math.max(colors[currentColorPart + 1].g - 1, 0);  
  else
    colors[currentColorPart + 1].b = math.max(colors[currentColorPart + 1].b - 1, 0);  
  end

  this.UpdateBodyColor(bodyColorTable, jmp.colorTable, colors);
end

function UICreateRole.OnClick_Sex(uiEvent)
  if currentSex == uiEvent.parameter then return end

  currentSex = uiEvent.parameter;

  this.UpdateSexUI();
  this.OnClick_ResetAvatar();
end

function UICreateRole.OnClick_Previous()
  if currentStep == ECreateRoleStep.Avartar then
    Game.Logout();

  elseif currentStep == ECreateRoleStep.Attribute then
    currentStep = ECreateRoleStep.Avartar;

    this.UpdateUI();
  end
end

--C:009-001 <創角> +性別(1) +臉圖(1) +頭型(1) +體型(1) +調色盤1(4) +調色盤5(4) +屬性(1) +數值(1)*6 +密碼L(1) +密碼(密碼L) +暗碼L(1) +暗碼(暗碼L)
function UICreateRole.OnClick_Next()
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if currentStep == ECreateRoleStep.Avartar then
    currentStep = ECreateRoleStep.Attribute;

    this.UpdateUI();

  elseif currentStep == ECreateRoleStep.Attribute then
    if not string.CheckName(inputField_Name.text) then return end

    sendBuffer:Clear();
    sendBuffer:WriteStringWithByteL(inputField_Name.text);
  
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
  
    sendBuffer:WriteByte(currentSex);
    sendBuffer:WriteByte(0);
    sendBuffer:WriteByte(currentStyle);
    sendBuffer:WriteByte(0);
    sendBuffer:WriteInt32(color1);
    sendBuffer:WriteInt32(color2);
    sendBuffer:WriteByte(currentElement);
  
    for i = 1, 6 do
      sendBuffer:WriteByte(attributeValue[i]);
    end
  
    sendBuffer:WriteByte(0);
    Network.Send(9, 1, sendBuffer);
  
    --NFT版不跳過新手教學，改用事件處理
    --ShowCheckMessage(
    --  function(result)
    --    if result then
    --      sendBuffer:WriteByte(1);
    --    else
    --      sendBuffer:WriteByte(0);
    --    end
    --    Network.Send(9, 1, sendBuffer);
    --  end,
    --  string.Get(23185),
    --  nil
    --);
  end
end

function UICreateRole.OnScrollValueChange()
  local posY = scrollContent_Icon.gameObject:GetComponent("RectTransform").anchoredPosition.y;
  local check = 0;
  local largePos = -1 * (Icon_Size + Icon_Size / 2);

  for k, v in pairs(scrollItems_Icon) do
    check = v.image_BG.rectTransform.anchoredPosition.y + posY;
    if check < -1 * Icon_Size and check > -2 * Icon_Size then
      v.image_BG.rectTransform.sizeDelta = Vector2.New(Icon_Size, Icon_Size);

      v.headIcon:SetHighLight(true);
      v.headIcon:SetGray(false);
    else
      v.image_BG.rectTransform.sizeDelta = Vector2.New(Icon_Size, Icon_Size);

      v.headIcon:SetHighLight(false);
      v.headIcon:SetGray(true);
    end
  end
end

function UICreateRole.OnScrollEndDrag(eventData)
  local posY = scrollContent_Icon.gameObject:GetComponent("RectTransform").anchoredPosition.y;
  local check = 0;
  local largePos = -1 * (Icon_Size + Icon_Size / 2);

  for k, v in pairs(scrollItems_Icon) do
    check = v.image_BG.rectTransform.anchoredPosition.y + posY;
    if check < -1 * Icon_Size and check > -2 * Icon_Size then
      this.SelectStyle(v.event_BG.parameter);
      return;
    end
  end
end

function UICreateRole.OnClick_Icon(uiEvent)
  if currentStyle == uiEvent.parameter then return end
  
  this.SelectStyle(uiEvent.parameter);
end

function UICreateRole.OnInitialize_ScrollContent_Icon(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Icon[itemIndex] = {};
    scrollItems_Icon[itemIndex].image_BG = scrollItems[itemIndex]:GetComponent("Image");
    scrollItems_Icon[itemIndex].event_BG = scrollItems[itemIndex]:GetComponent("UIEvent");
    scrollItems_Icon[itemIndex].event_BG:SetListener(EventTriggerType.PointerClick, this.OnClick_Icon);
    scrollItems_Icon[itemIndex].headIcon = HeadIconController.New(scrollItems_Icon[itemIndex].image_BG.transform);
  end
end

function UICreateRole.OnItemChange_ScrollContent_Icon(dataIndex, itemIndex)
  dataIndex = math.fmod(dataIndex, Role.hairStyleCount[0][currentSex]);
  if dataIndex < 0 then
    dataIndex = dataIndex + Role.hairStyleCount[0][currentSex];
  end
  
  scrollItems_Icon[itemIndex].event_BG.parameter = dataIndex;
  
  scrollItems_Icon[itemIndex].headIcon:ChangeIcon(currentSex, dataIndex);
  scrollItems_Icon[itemIndex].headIcon:ChangeIconColor(EHeadIconPart.Hair, colors[EHeadIconPart.Hair + 1].r, colors[EHeadIconPart.Hair + 1].g, colors[EHeadIconPart.Hair + 1].b);
  scrollItems_Icon[itemIndex].headIcon:ChangeIconColor(EHeadIconPart.Skin, colors[EHeadIconPart.Skin + 1].r, colors[EHeadIconPart.Skin + 1].g, colors[EHeadIconPart.Skin + 1].b);

  return true;
end

function UICreateRole.OnClick_ResetAvatar()
  Role.SetColorTint(colors, 444444444, 444444444);
  this.SelectStyle(0);
  
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
end

function UICreateRole.OnClick_RandomAvatar()
  Role.SetColorRandom(colors, currentSex);
  this.SelectStyle(math.random(0, Role.hairStyleCount[0][currentSex] - 1));
end

function UICreateRole.OnClick_RandomName()
  inputField_Name.text = string.GetRandomName();
end

function UICreateRole.OnChange_Name()
  local convertedString = LuaHelper.StringToBytes(DataManager.encoding_Big5, inputField_Name.text);
  if string.len(convertedString) > Name_Length then
    convertedString = string.sub(convertedString, 1, Name_Length);
    inputField_Name.text = LuaHelper.BytesToString(DataManager.encoding_Big5, convertedString);
  end
  
  gameObject_InputName:SetActive(inputField_Name.text == "");
end