UINewChat = {}
local this = UINewChat;

this.name = "UINewChat";
this.uiController = nil;

--ui
local text_Message;

local image_CurrentChannel;
local image_Channel = {};

local inputField_Name;
local inputField_Message;

local rectTransform_Message;
local rectTransform_ChatDisplay;
local rectTransform_Adjust;

--const
local nextSpeakInterval = 3;
local maxShowMessageCount = 50;

local EChatScope = {
  Max = 1;
  DownMiddle = 2;
  Min = 3;
  UpMiddle = 4;
}

--var
local currentChannel = EChannel.Scene;
local selectChannel = false;
local scrollValue = 0;
local scrollTime = 0;
local nextSpeakTime = 0;

local items = {};
local npcs = {};

function UINewChat.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;

  local tempEvent;

  text_Message = uiController:FindText("Text_Message"):GetComponent("UIText");
  text_Message.raycastFilter = true;

  image_CurrentChannel = uiController:FindImage("Image_CurrentChannel");
  
  for k, channel in pairs(EChannel) do
    image_Channel[channel] = uiController:FindImage(string.Concat("Image_Channel (", channel, ")"));

    if image_Channel[channel] ~= nil then
      tempEvent = image_Channel[channel].gameObject:GetComponent("UIEvent");
      tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Channel);
      tempEvent.parameter = channel;
    end
  end
  
  inputField_Name = uiController:FindInputField("InputField_Name"):GetComponent("UIInputField");
  inputField_Name:AddListener(this.OnChange_Name);

  inputField_Message = uiController:FindInputField("InputField_Message");
  rectTransform_Message = inputField_Message.transform:GetComponent("RectTransform");

  rectTransform_ChatDisplay = uiController:FindGameObject("ScrollRect_Message").transform;
  rectTransform_Adjust = uiController:FindImage("Image_Adjust").gameObject.transform;
  tempEvent = uiController:FindEvent("Image_Adjust");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Adjust);
  tempEvent = uiController:FindEvent("Image_Emoji");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Emoji);

  tempEvent = uiController:FindEvent("Image_Send");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Send);
end

function UINewChat.OnOpen()
  selectChannel = false;
  
  Setting.client.currentChatState = Setting.client.currentChatState - 1;
  if Setting.client.currentChatState < EChatScope.Max then
    Setting.client.currentChatState = EChatScope.UpMiddle;
  end
  
  this.UpdateChatHeight();
  this.UpdateUI();

  return true;
end

function UINewChat.OnClose()
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
  return true;
end

function UINewChat.Update()
  if scrollValue == 0 then return end
  if CGTimer.time < scrollTime then return end

  scrollTime = CGTimer.time + 0.3;

  if scrollValue > 0 then
    if text_Message.transform.localPosition.y >= -1 then return end
  else
    if math.abs(text_Message.transform.localPosition.y) >= text_Message.rectTransform.sizeDelta.y - 150 then return end
  end
  
  text_Message.transform.localPosition = text_Message.transform.localPosition + (Vector3.up * scrollValue * 13.6);
end

function UINewChat.ClearMessage()
  inputField_Message.text = "";

  table.Clear(items);
  table.Clear(npcs);
end

function UINewChat.UpdateMessage()
  local message = "";
  local tempMessage = "";

  local count = 0;
  --for k, messageInfo in pairs(Chat.lastMessages) do
  for i = table.maxn(Chat.lastMessages), 1, -1 do
    local messageInfo = Chat.lastMessages[i];
    if Setting.client.channelEnable[messageInfo.channel] then
      tempMessage = "";
      if Contains(messageInfo.channel, EChannel.World, EChannel.Scene, EChannel.GM, EChannel.Whisper, EChannel.Team, EChannel.Organization, EChannel.Ally) then
        if not string.IsNullOrEmpty(messageInfo.name) then
          if messageInfo.roleId ~= nil and messageInfo.roleId ~= Role.playerId then
            tempMessage = string.Concat("<url=Role_", messageInfo.roleId, ">[", string.Get(Chat.chanelTittle[messageInfo.channel]), "]", messageInfo.name, "</url>：", messageInfo.message);
          else
            tempMessage = string.Concat("[", string.Get(Chat.chanelTittle[messageInfo.channel]), "]", messageInfo.name, "：", messageInfo.message);
          end
        else
          tempMessage = string.Concat("[", string.Get(Chat.chanelTittle[messageInfo.channel]), "]", messageInfo.message);
        end
      else
        tempMessage = messageInfo.message;
      end
      
      tempMessage = string.GetColorText(tempMessage, Color.Channel[Setting.client.channelStyle[messageInfo.channel]]);
      
      if not string.IsNullOrEmpty(message) then
        message = string.Concat(tempMessage, "\n", message);
      else
        message = string.Concat(tempMessage, "", message);
      end

      count = count + 1;
      if count >= maxShowMessageCount then
        break;
      end
    end
  end

  text_Message.text = message;
end

function UINewChat.UpdateUI()
  if selectChannel then
    for k, channel in pairs(EChannel) do
      if image_Channel[channel] ~= nil then
        image_Channel[channel].gameObject:SetActive(true);

        if channel == currentChannel then
          image_CurrentChannel.transform:SetParent(image_Channel[channel].transform);
          image_CurrentChannel.transform.localPosition = Vector3.zero;
          image_CurrentChannel.transform.localScale = Vector3.one * 1.5;
        end
      end
    end

    image_CurrentChannel.gameObject:SetActive(true);
  else
    for k, channel in pairs(EChannel) do
      if image_Channel[channel] ~= nil then
        image_Channel[channel].gameObject:SetActive(channel == currentChannel);
      end
    end

    image_CurrentChannel.gameObject:SetActive(false);
  end

  inputField_Message.interactable = currentChannel ~= EChannel.System;

  if currentChannel == EChannel.Whisper then
    inputField_Name.gameObject:SetActive(true);
    rectTransform_Message.offsetMin = Vector2.New(204, 0);
  else
    inputField_Name.gameObject:SetActive(false);
    rectTransform_Message.offsetMin = Vector2.New(76, 0);
  end
  
  this.UpdateMessage(currentChannel, true);
end

function UINewChat.GetChannel()
  return currentChannel;
end

function UINewChat.ChangeChannel(channel, name)
  currentChannel = channel;

  if currentChannel == EChannel.Whisper and name ~= nil then
    inputField_Name.text = name;
  else
    inputField_Name.text = "";
  end

  this.UpdateUI();
end

function UINewChat.AddItem(itemSave)
  if itemSave == nil then return end
  
  local itemData = itemDatas[itemSave.Id];

  if itemData == nil then return end

  inputField_Message.text = string.Concat(inputField_Message.text, itemData:GetName(false, true));
  
  table.insert(items, itemSave);
end

function UINewChat.AddNpc(npcInfo)
  if npcInfo == nil then return end
  
  local npcData = npcDatas[npcInfo.npcId];

  if npcData == nil then return end

  inputField_Message.text = string.Concat(inputField_Message.text, string.AddBrackets(npcData.name));
  
  table.insert(npcs, npcInfo);
end

function UINewChat.OnChange_Name(text)
  local convertedString = LuaHelper.StringToBytes(DataManager.encoding_Big5, inputField_Name.text);
  if string.len(convertedString) > 14 then
    convertedString = string.sub(convertedString, 1, 14);
    inputField_Name.text = LuaHelper.BytesToString(DataManager.encoding_Big5, convertedString);
  end
end

function UINewChat.OnClick_Channel(uiEvent)
  if selectChannel then
    currentChannel = uiEvent.parameter;
  end

  selectChannel = not selectChannel;
  
  this.UpdateUI();
end

function UINewChat.SaveChatSetting()
  Setting.Save();
end

function UINewChat.OnClick_Adjust()
  this.UpdateChatHeight();
  
  CGTimer.DoCountdown(this.SaveChatSetting, 3);
end

function UINewChat.UpdateChatHeight()
  if Setting.client.currentChatState == EChatScope.Max then
    Setting.client.currentChatState = EChatScope.DownMiddle;
    rectTransform_Adjust.rotation = Quaternion.Euler(0, 0, -90);
    rectTransform_Adjust.anchoredPosition = Vector2.New(32.3, 35);
    rectTransform_ChatDisplay.offsetMax = Vector2.New(0, -128);
  
  elseif Setting.client.currentChatState == EChatScope.DownMiddle then
    Setting.client.currentChatState = EChatScope.Min;
    rectTransform_Adjust.rotation = Quaternion.Euler(0, 0, 90);
    rectTransform_Adjust.anchoredPosition = Vector2.New(32.3, -61);
    rectTransform_ChatDisplay.offsetMax = Vector2.New(0, -221);
  
  elseif Setting.client.currentChatState == EChatScope.Min then
    Setting.client.currentChatState = EChatScope.UpMiddle;
    rectTransform_Adjust.rotation = Quaternion.Euler(0, 0, 90);
    rectTransform_Adjust.anchoredPosition = Vector2.New(32.3, 35);
    rectTransform_ChatDisplay.offsetMax = Vector2.New(0, -128);
  
  elseif Setting.client.currentChatState == EChatScope.UpMiddle then
    Setting.client.currentChatState = EChatScope.Max;
    rectTransform_Adjust.rotation = Quaternion.Euler(0, 0, -90);
    rectTransform_Adjust.anchoredPosition = Vector2.New(32.3, 128);
    rectTransform_ChatDisplay.offsetMax = Vector2.New(0, -32);
  end
end

function UINewChat.OnClick_Emoji()
  UI.Open(UIStatus, EUIStatusTag.ChatPaste);
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

function UINewChat.OnClick_Send()
  if not Chat.CanUseChannel(currentChannel, true) then return end
  if Chat.CheckBan() then return end
  
  if Contains(currentChannel, EChannel.World, EChannel.Scene) then
    if CGTimer.time < nextSpeakTime then
      ShowCenterMessage(string.Get(20499));
      return;
    end
  end

  local message = inputField_Message.text;
  local length = string.GetLength(message);
  
  if length <= 0 then return end
  if length > 60 then
    ShowCenterMessage(string.Get(21185));
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
    return;
  end

  if not TextChecker.Check(message, Chat.chatRegexPattern, 0, 0) then
    ShowCenterMessage(string.Get(40327));
    return;
  end

  sendBuffer:Clear();

  if currentChannel == EChannel.Whisper then
    --密語加送玩家ID名字
    if string.IsNullOrEmpty(inputField_Name.text) then
      ShowCenterMessage(string.Get(20302));
      return;
    end

    if inputField_Name.text == Role.player.name then
      ShowCenterMessage(string.Get(20302));
      return;
    end
    
    local roleId = 0;
    for k, v in pairs(Role.players) do
      if v.name == inputField_Name.text then
        roleId = k;
        break;
      end
    end

    sendBuffer:WriteInt64(roleId);
    sendBuffer:WriteStringWithByteL(inputField_Name.text);
    
  elseif currentChannel == EChannel.World then
    --全頻檢查號角
    if Chat.hornCount <= 0 then
      ShowCenterMessage(string.Get(80466));
      return;
    end
  end

  --貼物品
  for k, itemSave in pairs(items) do
    local findMessage = false;

    local itemName = itemDatas[itemSave.Id]:GetName(false, true);
    itemName = string.gsub(itemName, "%%", function(w) return "%%" end);
    itemName = string.gsub(itemName, "%(", function(w) return "%(" end);
    itemName = string.gsub(itemName, "%)", function(w) return "%)" end);
    itemName = string.gsub(itemName, "% 「", function(w) return "% 「" end);
    itemName = string.gsub(itemName, "%」", function(w) return "%」" end);
    itemName = string.gsub(itemName, "%+", function(w) return "%+" end);

    message = string.gsub(message, itemName,
      function(w)
        findMessage = true;
        return string.Concat("[ITEM_", itemSave.Id, "]");
      end,
      1
    );

    if not findMessage then
      items[k] = nil;
    end
  end

  --貼武將
  for k, npcInfo in pairs(npcs) do
    local findMessage = false;

    local npcName = string.AddBrackets(npcDatas[npcInfo.npcId].name);
    npcName = string.gsub(npcName, "%(", function(w) return "%(" end);
    npcName = string.gsub(npcName, "%)", function(w) return "%)" end);
    
    message = string.gsub(message, npcName,
      function(w)
        findMessage = true;
        return string.Concat("[NPC_", npcInfo.npcId, "]");
      end,
      1
    );

    if not findMessage then
      npcs[k] = nil;
    end
  end
  
  sendBuffer:WriteStringWithByteL(message, DataManager.encoding_Unicode);

  sendBuffer:WriteByte(table.Count(items));
  for k, v in pairs(items) do
    v:WriteBuffer(sendBuffer);
  end

  sendBuffer:WriteByte(table.Count(npcs));
  for k, v in pairs(npcs) do
    v:WriteBuffer(sendBuffer);
  end

  if sendBuffer.length > 500 then
    ShowCenterMessage(string.Get(20507));
    return;
  end

  Network.Send(2, currentChannel, sendBuffer);

  if currentChannel == EChannel.Scene and not Network.InUnbound then
    --輕頻顯示自己訊息
    local name = Role.player.name;
    local titleData = titleDatas[Role.player.titleId];
    if titleData ~= nil and titleData.chatText ~= 0 then
      name = string.format(string.Get(titleData.chatText), name);
    end

    for k, v in pairs(tabooDatas) do
      message = string.gsub(message, string.GetNocase(v),
        function(s)
          local count = string.Count(s);
          local result = "";
          for i = 1, count do
            result = string.Concat(result, "*");
          end
          return result;
        end
      );
    end--檢查禁用字
    
    Chat.AddMessage(currentChannel, message, Role.playerId, name, items, npcs);
  end

  this.ClearMessage();

  if Contains(currentChannel, EChannel.World, EChannel.Scene) then
    nextSpeakTime = CGTimer.time + nextSpeakInterval;
  end
end