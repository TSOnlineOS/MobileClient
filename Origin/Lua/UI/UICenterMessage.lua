UICenterMessage = {}
local this = UICenterMessage;

this.name = "UICenterMessage";
this.uiController = nil;

--const
local maxMessage = 5;
local endTime = 2;
local fadeTime = 2;
local accelerate = 800;

--ui
local messages = {};

local centerMessageList = list:new();
local index = 1;
local canPop = true;
local showCount = 0;
local speed = 0;

local initiated = false;

function UICenterMessage.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;

  for i = 1, maxMessage do
    messages[i] = {};

    messages[i].time = 0;
    messages[i].alpha = 0;
    messages[i].count = 0;

    messages[i].text = uiController:FindText(string.Concat("Text_Message (", i, ")"));
    messages[i].textFitter = messages[i].text:GetComponent("ContentSizeFitter"); 

    messages[i].image = messages[i].text.transform.parent:GetComponent("Image");
    messages[i].imageFitter = messages[i].image:GetComponent("ContentSizeFitter"); 
  end

  initiated = true;
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

end

function UICenterMessage.OnOpen()
  for i = 1, maxMessage do
    messages[i].time = 0;
    messages[i].alpha = 0;
    messages[i].count = 0;
    messages[i].text.gameObject:SetActive(false);
    messages[i].image.gameObject:SetActive(false);
  end
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  
  return true;
end

function UICenterMessage.UpdateUI()
  if not initiated then return end
  
  local delta = CGTimer.deltaTime / fadeTime;
  for i = 1, maxMessage do
    if messages[i].time > 0 then
      if CGTimer.time >= messages[i].time or messages[i].image.gameObject:GetComponent("RectTransform").localPosition.y > 270 then
        messages[i].time = 0;
        messages[i].alpha = 0;
        messages[i].count = 0;

        messages[i].image.gameObject:GetComponent("RectTransform").localPosition = Vector3.New(-1, 150, 0);
        messages[i].text.gameObject:SetActive(false);
        messages[i].image.gameObject:SetActive(false);

        showCount = showCount - 1;
      elseif messages[i].time - CGTimer.time < fadeTime then
        messages[i].alpha = messages[i].alpha - delta;
        
        if messages[i].time - CGTimer.time < fadeTime / 2 then
          messages[i].text:CrossFadeAlpha(messages[i].alpha, 0, true);
          messages[i].image:CrossFadeAlpha(messages[i].alpha, 0, true);
        end

        messages[i].count = messages[i].count + 3 + speed / 20;
        messages[i].image.gameObject:GetComponent("RectTransform").localPosition = Vector3.New(-1, 150 + (80 / 120 * messages[i].count), 0);
      end
    end
  end
 
  if centerMessageList.length ~= 0 and canPop and showCount < 5 then
    if messages[math.fmod(index + maxMessage - 2, maxMessage) + 1].image.gameObject:GetComponent("RectTransform").localPosition.y - messages[index].image.gameObject:GetComponent("RectTransform").localPosition.y >50 then
      canPop = false;
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
  
      HundleCenterMessage(centerMessageList:shift());
    elseif showCount == 0 then
      canPop = false;
      HundleCenterMessage(centerMessageList:shift());
    end
  end

  if showCount == 0 then
    speed = 0;
    CGTimer.RemoveListener(this.UpdateUI);
  end
end

function UICenterMessage.Clear()
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
  centerMessageList:clear();
end

function ShowCenterMessage(message, showTime)
  centerMessageList:push(message);
  if centerMessageList.length > 10 and (speed / 20) < 5 then
    speed = speed + accelerate;
  end

  if not CGTimer.ContainsListener(this.UpdateUI) then 
    CGTimer.AddListener(this.UpdateUI, 0.01);
  end
end

function HundleCenterMessage(message)
  messages[index].time = CGTimer.time + endTime;
  messages[index].alpha = 1;
  messages[index].text.text = message;

  messages[index].text:CrossFadeAlpha(1, 0, true);
  messages[index].image:CrossFadeAlpha(1, 0, true);
  
  messages[index].text.gameObject:SetActive(true);
  messages[index].image.gameObject:SetActive(true);
  
  messages[index].textFitter:SetLayoutHorizontal();
  messages[index].imageFitter:SetLayoutHorizontal();

  showCount = showCount + 1;
  index = math.fmod(index, maxMessage) + 1;
  canPop = true;
end