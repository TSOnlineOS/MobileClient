UIMine = {}
local this = UIMine;

this.name = "UIMine";
this.uiController = nil;
this.MaxMine = 600000000;

local transform_FrameRect;

local scrollContent_Mine;
local scrollItems_Mine = {};

local text_percent;
local text_stop;

local slider_Percent;

local dropdown_Mine;

--var
local machineData = {}
local isMining = false;
local fullMax = 65535;
local machineIsMine = 0;
local settingTime = 0;
local oldMachineData = {};
local lastingMine = 0;
local dayLimit = false;
local mineType = 0;
local second = 360;

function UIMine.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;
  this.uiController.onClose = this.OnClose;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;

  scrollContent_Mine = uiController:FindScrollContent("ScrollContent_Mine");
  scrollContent_Mine.onInitialize = this.OnInitialize_ScrollContent_Mine;
  scrollContent_Mine.onItemChange = this.OnItemChange_ScrollContent_Mine;
  scrollContent_Mine:Initialize(1);

  text_percent = uiController:FindText("Text_Percent");
  text_stop = uiController:FindText("Text_Stop");

  slider_Percent = uiController:FindSlider("Slider_Percent");

  dropdown_Mine = uiController:FindDropdown("Dropdown_Mine");
  dropdown_Mine:AddListener(this.OnDropChange_MineChange);
end

function UIMine.OnOpen()
  dropdown_Mine:ClearOption();

  CGTimer.AddListener(this.UpdateTimer, second, true);

  for i = 1, 1 do
    dropdown_Mine:AddOption(string.format(string.Get(23894), i));
  end

  dropdown_Mine.value = mineType - 1;

  if lastingMine == 0 then
    ShowCenterMessage(string.Get(23895));
  end

  if dayLimit then
    ShowCenterMessage(string.Get(23901));
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

  return true;
end

function UIMine.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(23792), this.OnClick_Close, this.OnClick_Help);

    this.UpdateUI();
  end
end

function UIMine.OnInitialize_ScrollContent_Mine(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Mine[itemIndex] = {};
    scrollItems_Mine[itemIndex].item = UIItemController.New(scrollItems[itemIndex]:Find("Image_BG"));
    scrollItems_Mine[itemIndex].role = scrollItems[itemIndex]:Find("Transform_Role"):Find("RawImage_Role").gameObject:AddComponent(typeof(JmpDrawer));
    scrollItems_Mine[itemIndex].status = scrollItems[itemIndex]:Find("Text_State"):GetComponent("Text");
    scrollItems_Mine[itemIndex].name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_Mine[itemIndex].full = scrollItems[itemIndex]:Find("Text_Full"):GetComponent("Text");
    scrollItems_Mine[itemIndex].cantUse = scrollItems[itemIndex]:Find("Image_CantUse"):GetComponent("Image");

    local buttonEvent = scrollItems[itemIndex]:Find("Image_Set"):GetComponent("UIEvent");
    buttonEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Set);
    buttonEvent.parameter = 3 - itemIndex;
  end
end

function UIMine.OnItemChange_ScrollContent_Mine(dataIndex, itemIndex)
  local npcData = npcDatas[machineData[itemIndex + 1].skin];

  if machineIsMine > 0 then
    if (itemIndex + 1) == machineIsMine then
      scrollItems_Mine[itemIndex].status.text = string.Get(23889);
      scrollItems_Mine[itemIndex].cantUse.enabled = false;

      if npcData ~= nil then
        scrollItems_Mine[itemIndex].role:GenerateAndDraw(npcData:GetAtlasParams(ERolePose.Prepare + 1));
      end
    else
      scrollItems_Mine[itemIndex].status.text = string.Get(23890);
      scrollItems_Mine[itemIndex].cantUse.enabled = true;

      if npcData ~= nil then
        scrollItems_Mine[itemIndex].role:GenerateAndDraw(npcData:GetAtlasParams(ERolePose.Lie + 1));
      end
    end
  else
    scrollItems_Mine[itemIndex].cantUse.enabled = false;
    scrollItems_Mine[itemIndex].status.text = string.Get(23890);

    if npcData ~= nil then
      scrollItems_Mine[itemIndex].role:GenerateAndDraw(npcData:GetAtlasParams(ERolePose.Lie + 1));
    end
  end

  scrollItems_Mine[itemIndex].name.text = machineData[itemIndex + 1].name;
  scrollItems_Mine[itemIndex].full.text = string.format(string.Get(23898), machineData[itemIndex + 1].full);
  scrollItems_Mine[itemIndex].item:SetItem(machineData[itemIndex + 1].item, Item.GetItemCount(machineData[itemIndex + 1].item));

  return true;
end

function UIMine.OnClose()
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
  machineIsMine = 0;

  CGTimer.RemoveListener(this.UpdateTimer());

  for i = 0, 3 do
    scrollItems_Mine[i].role:Disable();
  end

  if UI.IsVisible(UIMine) then
    UI.Close(UIMine);
  end
end

function UIMine.OnClick_Help(checkShow)
  if checkShow ~= true then
    UI.Open(UITutorialHint, 0, this, string.Get(23792), string.Get(23900));
  end

  return true;
end

function UIMine.OnClick_Close()
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
  UI.Close(UIMine);

  return true;
end

function UIMine.UpdateUI()
  if not isMining then
    CGTimer.RemoveListener(this.UpdateTimer());
  end

  slider_Percent.maxValue = this.MaxMine;
  slider_Percent.value = lastingMine;
  text_percent.text = string.Concat(math.floor(lastingMine / this.MaxMine * 100), "%");

  scrollContent_Mine:Reset(4);
end

function UIMine.OnClick_Set(uiEvent)
  local index = uiEvent.parameter;
  local itemIndex = 4 - index;
  local itemCount = Item.GetItemCount(machineData[itemIndex].item);
  if itemCount <= 0 then
    ShowCenterMessage(string.Get(23950));
    return;
  end

  local count = itemDatas[machineData[itemIndex].item].threshold;

  if machineData[itemIndex].full >= fullMax - count + 1 then
    ShowCenterMessage(string.Get(23893))
    return;
  end

  while machineData[itemIndex].full + itemCount * count > fullMax do
    itemCount = itemCount - 1;
  end

  ShowCountInput(string.Get(23891), 1, itemCount,
    function(text)
      if text == nil then return end
      local quant = tonumber(text);
      if quant == 0 then return end
      local bagIndex = Item.GetItemIndex(machineData[itemIndex].item);

      if bagIndex <= 0 then return end

      local count = itemDatas[machineData[itemIndex].item].threshold;


      if quant == 0 then
        ShowCenterMessage(string.Get(23893))
        return;
      end

      machineData[itemIndex].full = machineData[itemIndex].full + quant * count;

      --C:170-010 <填充礦機耐久> +背包索引(2) +ItemID(2) +使用數量(1) +礦機Indx(1)

      sendBuffer:Clear();
      sendBuffer:WriteUInt16(bagIndex);
      sendBuffer:WriteUInt16(machineData[itemIndex].item);
      sendBuffer:WriteUInt16(quant);
      sendBuffer:WriteByte(index);
      Network.Send(170, 10, sendBuffer);
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
  );
end

function UIMine.OnDropChange_MineChange(step)
  step = step + 1;

  sendBuffer:Clear();
  sendBuffer:WriteByte(step);
  Network.Send(170, 1, sendBuffer);
end

function UIMine.Mining(result)
  if result == 0 then
    logError("失敗")
  elseif result == 1 then
    ShowCenterMessage(string.Get(23799));

    isMining = true;

    CGTimer.RemoveListener(this.UpdateTimer());
    CGTimer.AddListener(this.UpdateTimer, second, true);

    this.UpdateUI();
  elseif result == 255 then
    ShowCenterMessage(string.Get(71336));
  end
end

function UIMine.SetMining(mine)
  if mine == 1 then
    isMining = true;
  elseif mine == 0 then
    isMining = false;
  end
end

function UIMine.SetData(type, lastMining, setTime, machinesData, dateLimit)
  isMining = false;
  table.Clear(machineData);
  table.Clear(oldMachineData);

  mineType = type;
  settingTime = setTime;
  oldMachineData = machinesData;
  lastingMine = lastMining;
  dayLimit = dateLimit;

  for i = 1, 4 do
    machineData[i] = {};
    machineData[i].name = string.Get(23884 + i);
    machineData[i].full = 0;
    machineData[i].item = 55430 + i;
    machineData[i].skin = 22119 + i;
  end

  this.UpdateTimer();
end

function UIMine.UpdateTimer()
  local setTime =  DateTime.FromOADate(settingTime);
  local leftTime = DateTime.Subtract(CGTimer.serverTime, setTime);
  local count = 0;

  if not dayLimit then
    count = math.floor(leftTime.TotalSeconds / second);
  end

  local isAllEmpty = false;
  local isZero = 0;
  machineIsMine = 0;

  for i = 1, 4 do
    if count >= 0 then
      if count >= oldMachineData[i].full then
        machineData[i].full = 0;
        count = count - oldMachineData[i].full;
      else
        if machineIsMine == 0 then
          machineData[i].full = oldMachineData[i].full - count;
          machineIsMine = i;
          count = 0;
        else
          machineData[i].full = oldMachineData[i].full;
        end
      end
    else
      machineData[i].full = oldMachineData[i].full;

      if machineIsMine == 0 and machineData[i].full > 0 then
        machineIsMine = i;
      end
    end

    if machineData[i].full == 0 then
      isZero = isZero + 1;
    end
  end

  isAllEmpty = isZero == 4;

  if isAllEmpty or dayLimit then
    isMining = false;
    machineIsMine = 0;
  else
    isMining = true;
  end

  if scrollContent_Mine == nil then return end

  scrollContent_Mine:Refresh(4);

  if isMining then
    text_stop.text = "";
  else
    text_stop.text = string.Get(23892);
  end
end

function UIMine.IsMining()
  return isMining;
end
