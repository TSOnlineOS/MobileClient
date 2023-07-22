UIMail = {}
local this = UIMail;

this.name = "UIMail";
this.uiController = nil;

--ui
local transform_FrameRect;
local gameObject_Empty;

--list
local scrollContent_List;
local scrollItems_List = {};

--read
local text_Content;
local text_Time;
local text_Take;

local item_Content = {};
local rawImage_Contents = {};
local text_ContentQuants = {};

--var
local currentMailId = 0;
local datas = {};

function UIMail.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;
  gameObject_Empty = uiController:FindGameObject("Empty");

  --list
  scrollContent_List = uiController:FindScrollContent("ScrollContent_List");
  scrollContent_List.onInitialize = this.OnInitialize_ScrollContent_List;
  scrollContent_List.onItemChange = this.OnItemChange_ScrollContent_List;
  scrollContent_List:Initialize(1);

  --read
  text_Content = uiController:FindText("Text_Content");
  text_Time = uiController:FindText("Text_Time");
  text_Take = uiController:FindText("Text_Take");

  local tempEvent;
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

  for i = 1, 5 do
    item_Content[i] = UIItemController.New(uiController:FindGameObject(string.Concat("Image_Item (", i, ")")).transform, this.OnClick_Content, i);
  end

  local tempEvent;

  tempEvent = uiController:FindEvent("Image_TakeAll");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_TakeAll);

  tempEvent = uiController:FindEvent("Image_RemoveEmpty");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_RemoveEmpty);

  tempEvent = uiController:FindEvent("Image_Take");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Take);
end

function UIMail.OnOpen()
  RedDot.Remove(ERedDot.Mail);

  currentMailId = 0;

  return true;
end

function UIMail.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(20283), this.OnClick_Close);

    this.UpdateUI(true);
  end
end

function UIMail.UpdateUI(reset)
  table.Clear(datas);

  for k, v in pairs(Social.mails) do
    if DateTime.Compare(v.time, CGTimer.serverTime) > 0 then
      table.insert(datas, k);
    end
  end

  table.sort(datas,
    function(a, b)
      local aMainInfo = Social.mails[a];
      local bMainInfo = Social.mails[b];

      if aMainInfo.state ~= bMainInfo.state then
        return aMainInfo.state < bMainInfo.state;
      elseif aMainInfo.time ~= bMainInfo.time then
        return DateTime.Compare(aMainInfo.time, bMainInfo.time) < 0;
      else
        return a < b;
      end
    end
  );

  if Social.mails[currentMailId] == nil then
    if table.maxn(datas) > 0 then
      currentMailId = datas[1];
    else
      currentMailId = 0;
    end
  end

  if reset then
    scrollContent_List:Reset(table.maxn(datas));
  else
    scrollContent_List:Refresh(table.maxn(datas));
  end

  gameObject_Empty:SetActive(table.maxn(datas) == 0);

  this.UpdateContent();
end

function UIMail.UpdateContent()
  local mail = Social.mails[currentMailId];

  if mail ~= nil then
    if DateTime.Compare(mail.time, CGTimer.serverTime) <= 0 then
      currentMailId = 0;
      this.UpdateUI();
      return;
    end
    
    text_Content.text = mail.message;
    text_Time.text = string.Concat(string.Get(71268), " ", mail.time:ToString("yyyy/MM/dd HH:mm:ss"));

    if table.maxn(mail.contents) > 0 and mail.state < EMailState.Take then
      text_Take.text = string.Get(99689);
    else
      text_Take.text = string.Get(20980);
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

    for i = 1, 5 do
      item_Content[i]:SetItem(0);

      if mail.state < EMailState.Take then
        local content = mail.contents[i];

        if content ~= nil then
          if content.kind == 1 then
            if itemDatas[content.data.Id] ~= nil then
              item_Content[i]:SetItem(content.data.Id, content.data.quant, content.data);
            end
          elseif content.kind == 2 then
          end
        end
      end
    end

    if mail.state < EMailState.Read then
      --C:083-003 <已讀信件> +數量(4) <<+信件ID(4)>>
      sendBuffer:Clear();
      sendBuffer:WriteUInt32(1);
      sendBuffer:WriteUInt32(currentMailId);
      Network.Send(83, 3, sendBuffer);
    end
  else
    text_Content.text = "";
    text_Time.text = "";
    text_Take.text = string.Get(99689);

    for i = 1, 5 do
      item_Content[i]:SetItem(0);
    end
  end
end

function UIMail.OnClick_Close()
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
  UI.Close(UIMail);

  return true;
end

function UIMail.OnClick_Take()
  if Social.mails[currentMailId] == nil then return end

  if DateTime.Compare(Social.mails[currentMailId].time, CGTimer.serverTime) <= 0 then
    currentMailId = 0;
    this.UpdateUI();
    return;
  end

  if table.maxn(Social.mails[currentMailId].contents) > 0 and Social.mails[currentMailId].state < EMailState.Take then
    --C:083-001 <領取附件> +數量(4) <<+信件ID(4)>>
    sendBuffer:Clear();
    sendBuffer:WriteUInt32(1);
    sendBuffer:WriteUInt32(currentMailId);
    Network.Send(83, 1, sendBuffer);
  else
    --C:083-002 <刪除信件> +數量(4) <<+信件ID(4)>>
    sendBuffer:Clear();
    sendBuffer:WriteUInt32(1);
    sendBuffer:WriteUInt32(currentMailId);
    Network.Send(83, 2, sendBuffer);
  end
end

function UIMail.OnClick_TakeAll()
  local list = {};
  for k, v in pairs(Social.mails) do
    if DateTime.Compare(v.time, CGTimer.serverTime) > 0 then
      if v.state < EMailState.Take and table.maxn(v.contents) > 0 then
        table.insert(list, k);
      end
    end
  end

  local count = table.maxn(list);

  if count == 0 then return end

  --C:083-001 <領取附件> +數量(4) <<+信件ID(4)>>
  sendBuffer:Clear();
  sendBuffer:WriteUInt32(count);
  for k, v in pairs(list) do
    sendBuffer:WriteUInt32(v);
  end
  Network.Send(83, 1, sendBuffer);
end

function UIMail.OnClick_RemoveEmpty()
  local list = {};

  for k, v in pairs(Social.mails) do
    if v.state == EMailState.Take or (v.state == EMailState.Read and table.maxn(v.contents) <= 0) then
      table.insert(list, k);
    end
  end

  local count = table.maxn(list);

  if count == 0 then return end
  
  --C:083-002 <刪除信件> +數量(4) <<+信件ID(4)>>
  sendBuffer:Clear();
  sendBuffer:WriteUInt32(count);
  for k, v in pairs(list) do
    sendBuffer:WriteUInt32(v);
  end
  Network.Send(83, 2, sendBuffer);
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

function UIMail.OnClick_Content(uiEvent)
  local mail = Social.mails[currentMailId];
  if mail == nil then return end

  local content = mail.contents[uiEvent.parameter];
  if content == nil then return end

  if DateTime.Compare(mail.time, CGTimer.serverTime) <= 0 then
    currentMailId = 0;
    this.UpdateUI();
    return;
  end

  if content.kind == 1 then
    UIItemInfo.Show(content.data.Id, content.data);
  elseif content.kind == 2 then
    UI.Open(UINpcInfo, content.data);
  end
end

function UIMail.OnClick_Mail(uiEvent)
  currentMailId = uiEvent.parameter;
  
  this.UpdateContent();

  scrollContent_List:Refresh(table.maxn(datas));
end

function UIMail.OnInitialize_ScrollContent_List(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_List[itemIndex] = {};
    scrollItems_List[itemIndex].event_BG = scrollItems[itemIndex]:GetComponent("UIEvent");
    scrollItems_List[itemIndex].event_BG:SetListener(EventTriggerType.PointerClick, this.OnClick_Mail);
    scrollItems_List[itemIndex].image_Reading = scrollItems[itemIndex]:Find("Image_Reading"):GetComponent("Image");
    scrollItems_List[itemIndex].image_State = scrollItems[itemIndex]:Find("Image_State"):GetComponent("Image");
    scrollItems_List[itemIndex].text_Content = scrollItems[itemIndex]:Find("Text_Content"):GetComponent("Text");
    scrollItems_List[itemIndex].text_Time = scrollItems[itemIndex]:Find("Text_Time"):GetComponent("Text");
  end
end

function UIMail.OnItemChange_ScrollContent_List(dataIndex, itemIndex)
  local mailId = datas[dataIndex + 1];

  if mailId == nil then return false end
  if Social.mails[mailId] == nil then return false end

  scrollItems_List[itemIndex].event_BG.parameter = mailId;

  scrollItems_List[itemIndex].image_Reading.gameObject:SetActive(mailId == currentMailId);

  if Social.mails[mailId].state < EMailState.Read then
    scrollItems_List[itemIndex].image_State.sprite = UI.GetSprite("icon027");
  else
    scrollItems_List[itemIndex].image_State.sprite = UI.GetSprite("icon028");
  end

  scrollItems_List[itemIndex].text_Content.text = Social.mails[mailId].message;
  scrollItems_List[itemIndex].text_Time.text = string.Concat(string.Get(71268), " ", Social.mails[mailId].time:ToString("yyyy/MM/dd HH:mm:ss"));

  return true;
end