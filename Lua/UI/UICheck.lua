UICheck = {}
local this = UICheck;

this.name = "UICheck";
this.uiController = nil;

--ui
local gameObject_View;
local gameObjcet_Check;

local image_Mask;

local text_Message;
local text_RoleName;
local text_Tip;

local jmpDrawer_Role;

local scrollContent_Choose;
local scrollItems_Choose = {};

local event_Close;
local event_Yes;
local event_No;
local event_BG;

local sizeFitter_BG;
local sizeFitter_Message;

--var
local chooses;
local callback = nil;

function UICheck.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;

  this.uiController:SetFadeIn(0.1, this.FadeIn);
  this.uiController:SetFadeOut(0.1, this.FadeOut);

  gameObject_View = uiController:FindGameObject("View");
  gameObjcet_Check = uiController:FindGameObject("Check");

  sizeFitter_BG = gameObject_View.transform:Find("Image_BG"):GetComponent("ContentSizeFitter");
  
  image_Mask = uiController:FindImage("Image_Mask");

  text_Message = uiController:FindText("Text_Message");
  sizeFitter_Message = text_Message.transform:GetComponent("ContentSizeFitter");

  text_RoleName = uiController:FindText("Text_RoleName");
  text_Tip = uiController:FindText("Text_Tip");

  jmpDrawer_Role = uiController:FindRawImage("RawImage_Role").gameObject:AddComponent(typeof(JmpDrawer));
  jmpDrawer_Role.luaListener = this.OnGenerated;

  scrollContent_Choose = uiController:FindScrollContent("ScrollContent_Choose");
  scrollContent_Choose.onInitialize = this.OnInitialize_ScrollContent_Choose;
  scrollContent_Choose.onItemChange = this.OnItemChange_ScrollContent_Choose;
  scrollContent_Choose:Initialize(1);

  local tempEvent = uiController:FindEvent("Image_Mask");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Next);

  event_Close = uiController:FindEvent("Image_Close");
  event_Close:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);

  event_BG = uiController:FindEvent("Image_BG");
  event_BG:SetListener(EventTriggerType.PointerClick, this.OnClick_Next);

  event_Yes = uiController:FindEvent("Image_Yes");
  event_Yes:SetListener(EventTriggerType.PointerClick, this.OnClick_Check);
  event_Yes.parameter = true;

  event_No = uiController:FindEvent("Image_No");
  event_No:SetListener(EventTriggerType.PointerClick, this.OnClick_Check);
  event_No.parameter = false;
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
end

function ShowTalkMessage(callback, message, showRole, showIcon)
  UI.Close(UICheck);
  UI.Open(UICheck,
    callback,
    message,
    nil,
    showRole,
    showIcon,
    false,
    false,
    false
  );
end

function ShowNotifyMessage(callback, message, showRole, showIcon)
  UI.Close(UICheck);
  UI.Open(UICheck,
    callback,
    message,
    nil,
    showRole,
    showIcon,
    true,
    false,
    false
  );
end

function ShowCheckMessage(callback, message, showRole, showIcon)
  UI.Close(UICheck);
  UI.Open(UICheck,
    callback,
    message,
    nil,
    showRole,
    showIcon,
    true,
    true,
    false
  );
end

function ShowOptionMessage(callback, message, chooses, showRole, showIcon)
  UI.Close(UICheck);
  UI.Open(UICheck,
    callback,
    message,
    chooses,
    showRole,
    showIcon,
    false,
    false,
    true
  );
end

function UICheck.OnOpen(callbackFunction, message, showChooses, showRole, showIcon, showYes, showCancel, showClose)
  message = string.ChangeSymbol(message);

  text_Message.text = message;

  chooses = showChooses;
  callback = callbackFunction;
  
  --轉換npcId
  if showRole ~= nil and type(showRole) == "number" then
    if npcDatas[showRole] ~= nil then
      local npcId = showRole;

      showRole = {};
      showRole.npcId = npcId;
      showRole.name = npcDatas[npcId].name;
    else
      showRole = nil;
    end
  end

  --沒有圖的不顯示
  if showRole ~= nil and npcDatas[showRole.npcId] ~= nil and npcDatas[showRole.npcId].picId == 0 then
    showRole = nil;
  end

  if showRole ~= nil then
    text_RoleName.text = showRole.name;

    local npcData = npcDatas[showRole.npcId];
    if npcData ~= nil then
      local offsetX, offsetY = npcData:GetOffset();
      
      jmpDrawer_Role:GenerateAndDraw(npcData:GetAtlasParams(ERolePose.Stand + 5));
      jmpDrawer_Role.offsetY = offsetY;
    else
      jmpDrawer_Role:GenerateAndDraw(showRole.data:GetAtlasParams(showRole.picId, ERolePose.Stand + 5));
      jmpDrawer_Role.offsetY = 0;
    end
  else
    text_RoleName.text = "";
    
    jmpDrawer_Role:Disable();
  end

  scrollContent_Choose.transform.parent.gameObject:SetActive(chooses ~= nil);
  if chooses ~= nil then
    scrollContent_Choose:Reset(table.maxn(chooses));

    text_Tip.text = ""; --"點擊空白處:關閉";
    event_Close.gameObject:SetActive(true);
  else
    if showYes == true then
      text_Tip.text = "";
      event_Close.gameObject:SetActive(showClose);
    else
      text_Tip.text = string.Get(99671); --"點擊空白處:下一步";
      event_Close.gameObject:SetActive(false);
    end
  end

  --Button
  event_Yes.gameObject:SetActive(chooses == nil and showYes);
  event_No.gameObject:SetActive(chooses == nil and showCancel);
  event_BG.enabled = not (chooses == nil and showYes or chooses == nil and showCancel);
  text_Message.gameObject:GetComponent("UIText").raycastTarget = (chooses == nil and showYes or chooses == nil and showCancel);

  gameObjcet_Check:SetActive(chooses == nil and showYes or chooses == nil and showCancel);

  sizeFitter_Message:SetLayoutVertical();
  sizeFitter_BG:SetLayoutVertical();

  return true;
end

function UICheck.OnClose(result)
  jmpDrawer_Role:Disable();

  if callback ~= nil then
    if chooses ~= nil and result == nil then
      result = 0;
    end
    
    local tempCallback = callback;
    CGTimer.DoFunctionDelay(0, function() tempCallback(result) end);
  end
  
  return true;
end

function UICheck.FadeIn(progress)
  gameObject_View.transform.localScale = Vector3.one * progress;
  image_Mask:CrossFadeAlpha(progress, 0, true);
end

function UICheck.FadeOut(progress)
  gameObject_View.transform.localScale = Vector3.one * (1 - progress);
  image_Mask:CrossFadeAlpha(1 - progress, 0, true);
end

function UICheck.OnClick_Close()
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  
  UI.Close(UICheck);
end

function UICheck.OnClick_Next()
  if event_Yes.gameObject.activeSelf then return end
  if chooses ~= nil then return end
  
  UI.Close(UICheck);
end

function UICheck.OnClick_Check(uiEvent)
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  UI.Close(UICheck, uiEvent.parameter);
end

function UICheck.OnClick_Choose(uiEvent)
  UI.Close(UICheck, uiEvent.parameter);
end

function UICheck.OnGenerated()
  local height = jmpDrawer_Role:GetHeight(ERolePose.Stand + 5);
  local scale = 1;
  if height ~= 0 then
    scale = math.min(128 / height, 1);

    jmpDrawer_Role.transform.localScale = Vector3.one * scale;
    jmpDrawer_Role.offsetY = jmpDrawer_Role.offsetY * scale;
  end
end

function UICheck.OnInitialize_ScrollContent_Choose(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Choose[itemIndex] = {};
    scrollItems_Choose[itemIndex].image_BG = scrollItems[itemIndex]:GetComponent("Image");
    scrollItems_Choose[itemIndex].event_BG = scrollItems[itemIndex]:GetComponent("UIEvent");
    scrollItems_Choose[itemIndex].event_BG:SetListener(EventTriggerType.PointerClick, this.OnClick_Choose);
    scrollItems_Choose[itemIndex].text_Option = scrollItems[itemIndex]:Find("Text_Option"):GetComponent("Text");
  end
end

function UICheck.OnItemChange_ScrollContent_Choose(dataIndex, itemIndex)
  if chooses[dataIndex + 1] == nil then return false end

  scrollItems_Choose[itemIndex].event_BG.parameter = dataIndex + 1;
  scrollItems_Choose[itemIndex].text_Option.text = chooses[dataIndex + 1];

  return true;
end