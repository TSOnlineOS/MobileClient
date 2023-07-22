UIMessageboard = {}
local this = UIMessageboard;

this.name = "UIMessageboard";
this.uiController = nil;

--ui
local transform_FrameRect;

local inputField_Message;

local scrollContent_Message;
local scrollItems_Message = {};

local event_Send;

function UIMessageboard.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;
  this.uiController.onClose = this.OnClose;

  transform_FrameRect = uiController:FindGameObject("FrameRect"):GetComponent("RectTransform");

  inputField_Message = uiController:FindInputField("InputField_Message");

  scrollContent_Message = uiController:FindScrollContent("ScrollContent_Message");
  scrollContent_Message.onInitialize = this.OnInitialize_ScrollContent_Message;
  scrollContent_Message.onItemChange = this.OnItemChange_ScrollContent_Message;
  scrollContent_Message:Initialize(1);

  event_Send = uiController:FindEvent("Image_Send");
  event_Send:SetListener(EventTriggerType.PointerClick, this.OnClick_Send);
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

function UIMessageboard.OnOpen()
  inputField_Message.text = "";

  return true;
end

function UIMessageboard.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(48038), this.OnClick_Close);

    this.UpdateUI(false);
  end
end

function UIMessageboard.OnClose()
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
  EventManager.SetConduct(true);

  return true;
end

function UIMessageboard.UpdateUI(refresh)
  if RoleCount.Get(ERoleCount.Messageboard) >= 3 then
    event_Send:SetColor(Color.LightGray);
  else
    event_Send:SetColor(Color.White);
  end

  if refresh == false then
    scrollContent_Message:Reset(table.maxn(Chat.leaveMessages));
  else
    scrollContent_Message:Refresh(table.maxn(Chat.leaveMessages));
  end
end

function UIMessageboard.OnClick_Close()
  UI.Close(UIMessageboard);
  
  return true;
end

function UIMessageboard.OnClick_Send()
  if RoleCount.Get(13) >= 3 then
    ShowCenterMessage(string.Get(20542));
    return;
  end

  local message = inputField_Message.text;
  local length = string.GetLength(message);
  
  if length <= 0 then return end
  if length > 60 then
    ShowCenterMessage(string.Get(21185));
    return;
  end

  for k, v in pairs(tabooDatas) do
    if string.match(message, string.GetNocase(v)) ~= nil then
      ShowCenterMessage(string.Get(20541));
      return;
    end
  end

  --C:036-001 <留言板新增訊息> +訊息(?)
  sendBuffer:Clear();
  sendBuffer:WriteString(inputField_Message.text);
  Network.Send(36, 1, sendBuffer);

  inputField_Message.text = "";

  --GoogleAnalytics.Call("LogEvent", this.name, GAEventAction.ClickButton, GALabel.SendMessageboard);
end

function UIMessageboard.OnClick_Message(uiEvent)
  UI.Open(UISocialFunction, uiEvent.parameter, ConvertPositionToUIScene(this.uiController.transform, uiEvent.eventData.position, this.uiController.canvas.worldCamera));
end

function UIMessageboard.OnInitialize_ScrollContent_Message(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Message[itemIndex] = {};
    scrollItems_Message[itemIndex].event_BG = scrollItems[itemIndex]:GetComponent("UIEvent");
    scrollItems_Message[itemIndex].event_BG:SetListener(EventTriggerType.PointerClick, this.OnClick_Message);
    
    scrollItems_Message[itemIndex].icon = HeadIconController.New(scrollItems[itemIndex]:Find("Icon"));
    scrollItems_Message[itemIndex].icon:ChangeBaseHeadIconOutlineAlpha();
    scrollItems_Message[itemIndex].text_Index = scrollItems[itemIndex]:Find("Text_Index"):GetComponent("Text");
    scrollItems_Message[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_Message[itemIndex].text_Message = scrollItems[itemIndex]:Find("Text_Message"):GetComponent("Text");
    scrollItems_Message[itemIndex].text_Time = scrollItems[itemIndex]:Find("Text_Time"):GetComponent("Text");
    scrollItems_Message[itemIndex].text_Online = scrollItems[itemIndex]:Find("Text_Online"):GetComponent("Text");
    scrollItems_Message[itemIndex].text_Offline = scrollItems[itemIndex]:Find("Text_Offline"):GetComponent("Text");
  end
end

function UIMessageboard.OnItemChange_ScrollContent_Message(dataIndex, itemIndex)
  local info = Chat.leaveMessages[dataIndex + 1];

  if info == nil then return false end

  scrollItems_Message[itemIndex].event_BG.parameter = info;

  scrollItems_Message[itemIndex].icon:ChangeIcon(info.sex, info.headStyle);
  scrollItems_Message[itemIndex].icon:ChangeIconColor(EHeadIconPart.Hair, info:GetColorTint(EColorPart.Hair));
  scrollItems_Message[itemIndex].icon:ChangeIconColor(EHeadIconPart.Skin, info:GetColorTint(EColorPart.Skin));

  scrollItems_Message[itemIndex].text_Index.text = string.format("#%03d", table.maxn(Chat.leaveMessages) - dataIndex);
  scrollItems_Message[itemIndex].text_Name.text = info.name;
  scrollItems_Message[itemIndex].text_Message.text = info.message;
  scrollItems_Message[itemIndex].text_Time.text = info.time:ToString("yyyy/MM/dd HH:mm:ss");

  scrollItems_Message[itemIndex].text_Online.gameObject:SetActive(false);
  scrollItems_Message[itemIndex].text_Offline.gameObject:SetActive(false);

  return true;
end