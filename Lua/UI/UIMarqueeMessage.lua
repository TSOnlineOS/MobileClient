UIMarqueeMessage = {}
local this = UIMarqueeMessage;

this.name = "UIMarqueeMessage";
this.uiController = nil;

--const
local scrollSpeed = 100;

--ui
local rectTransform_Message;
local text_Message;

--var
local messages = {};
local currentPosition = Vector2.zero;

function UIMarqueeMessage.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;

  rectTransform_ScrollRect = uiController:FindGameObject("ScrollRect"):GetComponent("RectTransform");
  rectTransform_Message = uiController:FindText("Text_Message"):GetComponent("RectTransform");
  text_Message = uiController:FindText("Text_Message");
  text_Message.color = Color.Red;
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

function UIMarqueeMessage.OnOpen()
  currentPosition.x = 0;

  text_Message.text = "";

  return true;
end

function UIMarqueeMessage.Update()
  if currentPosition.x + rectTransform_ScrollRect.sizeDelta.x + rectTransform_Message.sizeDelta.x > 0 then
    currentPosition.x = currentPosition.x - (CGTimer.deltaTime * scrollSpeed);

    rectTransform_Message.anchoredPosition = currentPosition;
  elseif table.maxn(messages) > 0 then
    text_Message.text = messages[1];

    table.remove(messages, 1);

    currentPosition.x = 0;

    rectTransform_Message.anchoredPosition = currentPosition;
  else
    if rectTransform_ScrollRect.gameObject.activeSelf then
      rectTransform_ScrollRect.gameObject:SetActive(false);
    end
  end
end

function ShowMarqueeMessage(message)
  rectTransform_ScrollRect.gameObject:SetActive(true);
  
  message = string.gsub(message, "\n", "      ");

  table.insert(messages, message);
end

function ClearMarqueeMessage()
  table.Clear(messages);
end

