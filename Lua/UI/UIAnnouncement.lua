UIAnnouncement = {};
local this = UIAnnouncement;

this.name = "UIAnnouncement";
this.uiController = nil;

local transform_FrameRect;
local rectTransform_VerticalLayout;
local rawImage_Announcement;
local image_Show;
local event;

local currentPic = 1;

function UIAnnouncement.Initialize(go)
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
  this.uiController.onVisible = this.OnVisible;
  this.uiController.onClose = this.OnClose;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;
  rectTransform_VerticalLayout = uiController:FindGameObject("VerticalLayout"):GetComponent("RectTransform");
  rawImage_Announcement = uiController:FindRawImage("Image_Announcement");

  image_Show = uiController:FindImage("Image_Show");

  event = uiController:FindEvent("Image_Show");
  event:SetListener(EventTriggerType.PointerClick, this.OnClick_Show);
end

function UIAnnouncement.OnOpen()
  if table.Count(Announcement.textures) <= 0 then
    return;
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

  this.UpdateUI();

  return true;
end

function UIAnnouncement.UpdateUI()
  if Announcement.client.show[currentPic] then
    this.NextPic();
  end

  if Announcement.textures[currentPic] ~= nil  then
    rawImage_Announcement.texture = Announcement.textures[currentPic];
    rawImage_Announcement.enabled = true;
    image_Show.sprite = UI.GetCheckBoxSprite(Announcement.client.show[currentPic]);
    this.UpdateSize();
  else
    UI.Close(UIAnnouncement);
  end
end

function UIAnnouncement.OnClose()
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
  
  Announcement.Save();

  currentPic = 1;

  --C:033-003 <登入公告> 開關(1)
  sendBuffer:Clear();
  sendBuffer:WriteByte(1);
  Network.Send(33, 3, sendBuffer);
end

function UIAnnouncement.UpdateSize()
  if Announcement.client.show[currentPic] == nil then
    Announcement.client.show[currentPic] = false;
  end

  rawImage_Announcement:SetNativeSize();
  this.uiController:RebuilderRectTransfrom(rectTransform_VerticalLayout);
  local v2 = rectTransform_VerticalLayout.sizeDelta;

  if rectTransform_VerticalLayout.sizeDelta.x % 2 ~= 0 then
    v2.x = rectTransform_VerticalLayout.sizeDelta.x + 1;
  end

  if  rectTransform_VerticalLayout.sizeDelta.y % 2 ~= 0 then
    v2.y = rectTransform_VerticalLayout.sizeDelta.y + 1;
  end

  transform_FrameRect.sizeDelta = v2;
end

function UIAnnouncement.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(10148), this.OnClick_Close);
    this.UpdateSize();
  end
end

function UIAnnouncement.OnClick_Close()
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
  
  this.NextPic();

  return true;
end

function UIAnnouncement.NextPic()
  currentPic = currentPic + 1;

  this.UpdateUI();
end

function UIAnnouncement.OnClick_Show()
  Announcement.client.show[currentPic] = not Announcement.client.show[currentPic];
  image_Show.sprite = UI.GetCheckBoxSprite(Announcement.client.show[currentPic]);

  if Announcement.client.show[currentPic] then
    this.NextPic();
  end

  --GoogleAnalytics.Call("LogEvent", this.name, GAEventAction.ClickButton, GALabel.Show);
end