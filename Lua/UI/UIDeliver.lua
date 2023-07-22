UIDeliver = {}
local this = UIDeliver;

this.name = "UIDeliver";
this.uiController = nil;

local things = {};

local image_Send;
local image_Cancel;

local text_Send;
local text_Cancel;

local rawImage_BaDoYao;
local rawImage_Item;

local dropdown_Friend;

local slider_Progress;

--var
local currentNpcId = 0;
local currentItems = {};

function UIDeliver.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;

  local tempTransform = uiController:FindGameObject("Image_ItemBG").transform;
  local tempEvent;

  for i = 1, 5 do
    things[i] = UIItemController.New(tempTransform:Find(string.Concat("Image_Item (", i, ")")));
  end

  image_Send = uiController:FindImage("Image_Send");
  image_Cancel = uiController:FindImage("Image_Cancel");

  text_Send = uiController:FindText("Text_Send");
  text_Cancel = uiController:FindText("Text_Cancel");

  rawImage_BaDoYao = uiController:FindRawImage("RawImage_BaDoYao");
  rawImage_Item = uiController:FindRawImage("RawImage_Item");

  dropdown_Friend = uiController:FindDropdown("Dropdown_Friend");

  slider_Progress = uiController:FindSlider("Slider_Progress");

  tempEvent = uiController:FindEvent("Image_Close");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);

  tempEvent = uiController:FindEvent("Image_Send");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Send);

  tempEvent = uiController:FindEvent("Image_Cancel");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Cancel);
end

function UIDeliver.OnOpen(npcId)
  currentNpcId = npcId;

  if Social.deliverNpcId ~= 0 then
    currentNpcId = Social.deliverNpcId;
  end

  local baDoYaoIndex = NpcData.GetBaDoYaoIndex(currentNpcId);

  if baDoYaoIndex < 1 then
    return false;
  elseif baDoYaoIndex <= 7 then
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
    TextureManager.SetPng(ETextureUseType.UI, string.Concat("icon_BaDoYao", baDoYaoIndex), rawImage_BaDoYao);
  elseif baDoYaoIndex <= 11 then
    TextureManager.SetPng(ETextureUseType.UI, string.Concat("icon_BaDoYao", baDoYaoIndex - 7), rawImage_BaDoYao);
  elseif baDoYaoIndex <= 15 then
    TextureManager.SetPng(ETextureUseType.UI, string.Concat("icon_BaDoYao", baDoYaoIndex - 11), rawImage_BaDoYao);
  elseif baDoYaoIndex <= 18 then
    TextureManager.SetPng(ETextureUseType.UI, string.Concat("icon_BaDoYao", baDoYaoIndex - 8), rawImage_BaDoYao);
  else
    return false;
  end

  UI.Open(UIBag,
    this.UpdateSelection,
    Vector2.New(115, -5),
    false,
    5,
    function(itemSave)
      if itemSave.isVender then return false end
      if itemSave.isDeliver then return false end
      if itemSave.isLock then return false end
      if itemDatas[itemSave.Id] == nil then return false end
      if bit.band(itemDatas[itemSave.Id].restrict, 2) == 2 and bit.band(itemSave.specialKind, 1) ~= 1 then return false end
      if (itemDatas[itemSave.Id].kind == 53 or bit.band(itemDatas[itemSave.Id].restrict2, 1) == 1) and Role.player.data.orgId ~= tradeRole.data.orgId then return false end
      
      return true;
    end
  );

  dropdown_Friend:ClearOption();
  for roleId, playerInfo in pairs(Social.friends) do
    if not Role.IsGM(roleId) then
      dropdown_Friend:AddOption(playerInfo.name);
    end
  end

  this.UpdateUI();

  return true;
end

function UIDeliver.OnClose()
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
  UI.Close(UIBag);
end

function UIDeliver.Update()
  if Social.deliverNpcId == 0 then return end

  this.UpdateProgress();
end

function UIDeliver.UpdateUI()
  if Social.deliverNpcId ~= 0 then
    UIBag.SetInteractable(false);

    dropdown_Friend.interactable = false;

    if things[Social.deliverIndex] ~= nil then
      rawImage_Item.texture = things[Social.deliverIndex].rawImage_Icon.texture;
      rawImage_Item.enabled = true;
    else
      rawImage_Item.texture = nil;
      rawImage_Item.enabled = false;
    end

    LuaHelper.SetColor(image_Send, Color.Gray);
    LuaHelper.SetColor(text_Send, Color.Gray);
    LuaHelper.SetColor(image_Cancel, Color.White);
    LuaHelper.SetColor(text_Cancel, Color.White);
  else
    UIBag.SetInteractable(true);

    dropdown_Friend.interactable = true;

    rawImage_Item.texture = nil;
    rawImage_Item.enabled = false;

    LuaHelper.SetColor(image_Send, Color.White);
    LuaHelper.SetColor(text_Send, Color.White);
    LuaHelper.SetColor(image_Cancel, Color.Gray);
    LuaHelper.SetColor(text_Cancel, Color.Gray);
  end

  this.UpdateSelection();
  this.UpdateProgress();
end

function UIDeliver.UpdateSelection(selections)
  for i = 1, 5 do
    things[i]:SetItem(0);
  end
  
  if Social.deliverNpcId ~= 0 then
    for i = 1, 5 do
      local itemSave = Item.GetBagItem(EThings.Bag, Social.deliverItems[i]);
      if itemSave ~= nil and itemDatas[itemSave.Id] ~= nil then
        things[i]:SetItem(itemSave.Id, itemSave.quant, itemSave);
      end
    end
  else
    if selections ~= nil then
      local count = 0;
      for i = 1, Item.MaxThingGrid do
        if selections[i] then
          count = count + 1;

          local itemSave = Item.GetBagItem(EThings.Bag, i);

          things[i]:SetItem(itemSave.Id, itemSave.quant, itemSave);

          if count >= 5 then
            break;
          end
        end
      end
    end
  end
end

function UIDeliver.UpdateProgress()
  if Social.deliverNpcId ~= 0 then
    slider_Progress.gameObject:SetActive(true);

    if Social.deliverMaxTime ~= 0 then
      slider_Progress.value = math.floor(((CGTimer.time - Social.deliverTime) / Social.deliverMaxTime) * 9);
    else
      slider_Progress.value = 0;
    end
  else
    slider_Progress.gameObject:SetActive(false);
    slider_Progress.value = 0;
  end
end

function UIDeliver.OnClick_Close()
  UI.Close(UIDeliver);
end

function UIDeliver.OnClick_Send()
  if Social.deliverNpcId ~= 0 then return end

  local selections = UIBag.GetSelect();

  for roleId, playerInfo in pairs(Social.friends) do
    if dropdown_Friend.captionText.text == playerInfo.name then
      --C:025-020 <發送快遞> +快遞ID(4) +玩家ID(8) <<+索引(1) +數量(1)>>*5
      sendBuffer:Clear();
      sendBuffer:WriteInt32(currentNpcId);
      sendBuffer:WriteInt64(roleId);

      local count = 0;
      for i = 1, Item.MaxThingGrid do
        if selections[i] then
          count = count + 1;

          Social.deliverItems[count] = i;

          sendBuffer:WriteByte(i);
          sendBuffer:WriteByte(Item.GetBagItem(EThings.Bag, i).quant);
        end
      end

      Network.Send(25, 20, sendBuffer);

      --GoogleAnalytics.Call("LogEvent", this.name, GAEventAction.ClickButton, GALabel.Deliver);
      break;
    end
  end

  UIBag.ClearSelect();
end

function UIDeliver.OnClick_Cancel()
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
  if Social.deliverNpcId == 0 then return end

  --C:025-021 <取消快遞>
  Network.Send(25, 21);

  --GoogleAnalytics.Call("LogEvent", this.name, GAEventAction.ClickButton, GALabel.Cancel);
end