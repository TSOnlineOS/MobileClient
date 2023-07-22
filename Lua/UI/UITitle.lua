UITitle = {}
local this = UITitle;

this.name = "UITitle";
this.uiController = nil;

local maxPageShow = 10;

local rawImage_BG;
local rawImage_Name;
local rawImage_RoleGround;
local rawImage_Organization;
local rawImage_Title;

local jmpDrawer_Role;

local listObjects = {};

local text_Page;
local text_TitleName;
local text_Name;
local text_Organization;
local text_Title;
local text_Talk;
local text_Active;

local gradient_Title;
local outline_Title;

local inputField_Search;

local image_Arrow;

local event_Active;

local currentPage = 1;
local currentTitleId = 0;

local bodyEffect = nil;
local datas = {};

function UITitle.Initialize(go)
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;

  rawImage_BG = uiController:FindRawImage("RawImage_BG");
  rawImage_Name = uiController:FindRawImage("RawImage_Name");
  rawImage_RoleGround = uiController:FindRawImage("RawImage_RoleGround");
  rawImage_Organization = uiController:FindRawImage("RawImage_Organization");
  rawImage_Title = uiController:FindRawImage("RawImage_TitleBG");

  jmpDrawer_Role = uiController:FindRawImage("RawImage_Role").gameObject:AddComponent(typeof(JmpDrawer));

  local tempTransform = uiController:FindGameObject("List").transform;
  for i = 1, maxPageShow do
    listObjects[i] = {};
    listObjects[i].rawImage_BG = tempTransform:Find(string.Concat("RawImage_TitleName ", "(", i, ")")):GetComponent("RawImage");

    listObjects[i].event = listObjects[i].rawImage_BG.transform:GetComponent("UIEvent");
    listObjects[i].event:SetListener(EventTriggerType.PointerClick, this.OnClick_Title);
    listObjects[i].event.parameter = 0;

    listObjects[i].text_Title = listObjects[i].rawImage_BG.transform:Find("Text_Title"):GetComponent("Text");
    listObjects[i].image_State = listObjects[i].text_Title.transform:Find("Image_State"):GetComponent("Image");
  end
  
  text_Page = uiController:FindText("Text_Page");
  text_TitleName = uiController:FindText("Text_TitleName");
  text_Name = uiController:FindText("Text_Name");
  text_Organization = uiController:FindText("Text_Organization");
  text_Title = uiController:FindText("Text_Title");
  text_Talk = uiController:FindText("Text_Talk");
  text_Active = uiController:FindText("Text_Active");

  gradient_Title = text_Title.transform:GetComponent("GradientColor");
  outline_Title = text_Title.transform:GetComponent("Outline8");

  inputField_Search = uiController:FindInputField("InputField_Search"):GetComponent("UIInputField");
  inputField_Search:AddListener(this.OnChange_Search);

  image_Arrow = uiController:FindGameObject("Image_Arrow");

  local tempEvent = uiController:FindEvent("Image_Close");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);

  tempEvent = uiController:FindEvent("Image_Prev");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Page);
  tempEvent.parameter = -1;

  tempEvent = uiController:FindEvent("Image_Next");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Page);
  tempEvent.parameter = 1;

  event_Active = uiController:FindEvent("Image_Active");
  event_Active:SetListener(EventTriggerType.PointerClick, this.OnClick_Active);
end

function UITitle.OnOpen(titleId)
  inputField_Search.text = "";

  TextureManager.SetPng(ETextureUseType.UI, "common0_bod051", rawImage_BG);
  -- TextureManager.SetPng(ETextureUseType.UI, "common0_bod067", rawImage_Name);
  TextureManager.SetPng(ETextureUseType.UI, "common0_com040", rawImage_RoleGround);

  for i = 1, 10 do
    TextureManager.SetPng(ETextureUseType.UI, "common0_bod068", listObjects[i].rawImage_BG);

    if i % 2 == 0 then
      listObjects[i].rawImage_BG.color = LuaHelper.GetColor(242, 244, 236, 255);
    else
      listObjects[i].rawImage_BG.color = LuaHelper.GetColor(221, 212, 198, 255);
    end
  end

  text_Name.text = Role.player.name;

  local ensign = Organization.GetEnsign(Organization.Id);
  rawImage_Organization.texture = ensign;
  rawImage_Organization.gameObject:SetActive(ensign ~= nil);

  local orgName = Organization.GetOrgName(Organization.Id)
  text_Organization.text = orgName;
  text_Organization.gameObject:SetActive(not string.IsNullOrEmpty(orgName));
  
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------

  this.UpdateUI(titleId);

  return true;
end

function UITitle.OnClose()
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
  jmpDrawer_Role:Disable();

  if bodyEffect ~= nil then
    bodyEffect:Stop();
  end

  return true;
end

local function SortTitle(a, b)
  local haveTitleA = titleDatas[a].flagId == 0 or BitFlag.Get(titleDatas[a].flagId);
  local haveTitleB = titleDatas[b].flagId == 0 or BitFlag.Get(titleDatas[b].flagId);

  if haveTitleA and not haveTitleB then
    return true;
  elseif haveTitleB and not haveTitleA then
    return false;
  else
    return a < b;
  end
end

function UITitle.UpdateUI(titleId, searchText)
  table.Clear(datas);
  
  for k, v in pairs(titleDatas) do
    table.insert(datas, k);
  end

  table.sort(datas, SortTitle);

  currentPage = 1;
  currentTitleId = datas[1];
  
  if titleId ~= nil and titleDatas[titleId] ~= nil then
    for k, v in pairs(datas) do
      if v == titleId then
        currentPage = math.ceil(k / maxPageShow);
        currentTitleId = titleId;
        break;
      end
    end
  end

  this.UpdatePage();
end

function UITitle.UpdatePage()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  text_Page.text = string.Concat(currentPage, "/", math.ceil(table.maxn(datas) / maxPageShow));

  for i = 1, maxPageShow do
    local titleIndex = (currentPage - 1) * maxPageShow + i;
    if datas[titleIndex] ~= nil and titleDatas[datas[titleIndex]] ~= nil then
      listObjects[i].text_Title.text = string.Get(titleDatas[datas[titleIndex]].name);
      listObjects[i].image_State.enabled = titleDatas[datas[titleIndex]].flagId == 0 or BitFlag.Get(titleDatas[datas[titleIndex]].flagId);
      listObjects[i].event.parameter = datas[titleIndex];

      if currentTitleId == 0 then
        currentTitleId = datas[titleIndex];
      end
    else
      listObjects[i].text_Title.text = "";
      listObjects[i].event.parameter = 0;
      listObjects[i].image_State.enabled = false;
    end
  end

  this.UpdateTitle();
end

function UITitle.UpdateTitle()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  local titleData = titleDatas[currentTitleId];

  if bodyEffect ~= nil then
    bodyEffect:Stop();
  end

  if titleData == nil then
    return;
  end

  for i = 1, maxPageShow do
    if listObjects[i].event.parameter == currentTitleId then
      image_Arrow.transform:SetParent(listObjects[i].text_Title.transform);
      image_Arrow.transform.localPosition = Vector2.New(-50, 0);
      break;
    end
  end

  if Define.IsDebugMode() then
    text_TitleName.text = string.Concat(string.Get(titleData.name), "(", titleData.flagId, ")");
  else
    text_TitleName.text = string.Get(titleData.name);
  end

  if titleData.hudTexture ~= 0 then
    TextureManager.SetPng(ETextureUseType.None, string.format("Title_%03d", titleData.hudTexture), rawImage_Title);
    rawImage_Title.gameObject:SetActive(true);

    if titleData.hudText ~= 0 then
      text_Title.text = string.Get(titleData.hudText);
      gradient_Title.colorTop = titleData.hudTopColor;
      gradient_Title.colorBottom = titleData.hudTopColor;
      outline_Title.effectColor = titleData.hudOutlineColor;
    else
      text_Title.text = "";
    end
  else
    rawImage_Title.gameObject:SetActive(false);
  end

  jmpDrawer_Role:GenerateAndDraw(Role.player.data:GetAtlasParams(currentTitleId, ERolePose.Prepare + 1));
  jmpDrawer_Role.offsetY = 32 * jmpDrawer_Role.transform.localScale.x;

  if titleData.effectId ~= 0 then
    local scale = titleData.effectScale * jmpDrawer_Role.transform.localScale.x;
    bodyEffect = EffectLight.New(titleData.effectId, titleData.effectInterval, titleData.effectStartFrame, titleData.effectEndFrame, titleData.effectTotalFrame, EEffectLightTracer.Child, 0, 0, 32);
    bodyEffect.rectTransform:SetParent(rawImage_RoleGround.transform);
    bodyEffect.rectTransform.localPosition = Vector3.New(-bodyEffect.width * 0.5 * scale, bodyEffect.height * scale + titleData.effectOffset * jmpDrawer_Role.transform.localScale.x);
    bodyEffect.rectTransform.localScale = Vector3.one * scale;
  end

  if titleData.chatText ~= 0 then
    text_Talk.text = string.Concat(string.Get(21927), string.format(string.Get(titleData.chatText), Role.player.name), "：", string.Get(21928));
  else
    text_Talk.text = string.Concat(string.Get(21927), Role.player.name, "：", string.Get(21928));
  end

  if titleData.flagId ~= 0 and not BitFlag.Get(titleData.flagId) then
    text_Active.text = string.Get(20165);
    event_Active:SetColor(Color.LightGray);
  elseif Role.player.titleId == currentTitleId then
    text_Active.text = string.Get(98003);
    event_Active:SetColor(Color.White);
  else
    text_Active.text = string.Get(20165);
    event_Active:SetColor(Color.White);
  end
end

function UITitle.OnClick_Close()
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
  UI.Close(UITitle);
end

function UITitle.OnClick_Title(uiEvent)
  currentTitleId = uiEvent.parameter;

  this.UpdateTitle();
end

function UITitle.OnClick_Page(uiEvent)
  local maxPage = math.ceil(table.maxn(datas) / maxPageShow);
  local nowPage = currentPage + uiEvent.parameter;

  if nowPage < 1 or nowPage > maxPage then return end

  currentTitleId = 0;
  currentPage = nowPage;

  this.UpdatePage(nowPage);
end

function UITitle.OnClick_Active()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  local titleData = titleDatas[currentTitleId];

  if titleData == nil then return end

  if titleData.flagId ~= 0 and not BitFlag.Get(titleData.flagId) then return end
  if Role.player.war ~= EWar.None then return end

  --C:005-012 <更換稱號> +稱號ID(2)
  sendBuffer:Clear();
  if Role.player.titleId ~= currentTitleId then
    sendBuffer:WriteUInt16(currentTitleId);
  else
    sendBuffer:WriteUInt16(0);
  end
  Network.Send(5, 12, sendBuffer);
end

function UITitle.OnChange_Search(text)
  this.UpdateUI(currentTitleId, text);
end