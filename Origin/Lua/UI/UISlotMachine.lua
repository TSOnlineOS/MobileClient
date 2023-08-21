
ESlotMachineState = {
  None = 0,
  Wait = 1,
  Run = 2,
  Mask = 3,
}

UISlotMachine = {}
local this = UISlotMachine;
this.name = "UISlotMachine";
this.uiController = nil;

--ui
local maxTextAward = 6;
local slotMachineColor = {yellow = LuaHelper.GetColor(246,244,196,255),
                          blue = LuaHelper.GetColor(162,230,209,255),
                          red = LuaHelper.GetColor(255,133,153,255)};
local rawImage_Light = {};
local uiRawImage_Light = {};
local rawImage_ItemBoard = {};
local rawImage_CloudL;
local rawImage_CloudR;
local slots = {};
local text_Coin;
local text_Award;
local text_Awards = {};
local event_Probability;
local image_Switch;
local image_DontAsk;
local gameObject_Result;
local text_TotalTrun;
local text_TotalCoin;
local text_Detail;
local text_Msg;
local image_Stop;
local gameObject_Msg;
--const
this.maxSlotItem = 16;
this.maxCoin = 999;

--var
this.coin = 0;
this.awards = {};
local results = {};
local state = ESlotMachineState.None;
local nextUpdateTime = 0;
local currentSlot = 1;
local targetSlot = 1;
local breakSlots = 1;
local sendTurnTimes = 1;
local auto = false;
local dontAsk = false;
local stop = false;
local totalTrun = 0;
local totalCoin = 0;
local requireSpace = 0;
local requireCoin = 0;
local protocolSubKind = 0;
local autoCount = 0;

function UISlotMachine.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------

  for i = 1, 24 do
    rawImage_Light[i] = uiController:FindRawImage(string.Concat("Image_Light (", i, ")"));
    uiRawImage_Light[i] = rawImage_Light[i].gameObject:GetComponent("UIRawImage");
  end

  for i = 1, 2 do
    rawImage_ItemBoard[i] = uiController:FindRawImage(string.Concat("Image_ItemBoard (", i, ")"));
  end

  rawImage_CloudL = uiController:FindRawImage("RawImage_CloudL"):GetComponent("RawImage");
  rawImage_CloudR = uiController:FindRawImage("RawImage_CloudR"):GetComponent("RawImage");

  for i = 1, this.maxSlotItem do
    slots[i] = {};
    slots[i].rawImage_Mask = uiController:FindRawImage(string.Concat("Image_Slot (", i, ")"));
    slots[i].image_Frame = uiController:FindGameObject(string.Concat("Image_RedMask (", i, ")")).gameObject:GetComponent("Image");
    slots[i].image_Color = uiController:FindImage(string.Concat("Image_Item (", i, ")"));
    slots[i].text_Count = uiController:FindText(string.Concat("Text_Quant (", i, ")"));
    slots[i].item = UIItemController.New(uiController:FindGameObject(string.Concat("Image_RedMask (", i, ")")).transform);
  end

  text_Coin = uiController:FindText("Text_CoinCount");
  text_Award = uiController:FindText("Text_Get");
  text_TotalTrun = uiController:FindText("Text_Turns");
  text_TotalCoin = uiController:FindText("Text_Count");
  text_Detail = uiController:FindText("Text_Detail");
  text_Msg = uiController:FindText("Text_Msg");

  for i = 1, maxTextAward do
    text_Awards[i] = uiController:FindText(string.Concat("Text_Reward (", i, ")"));
  end

  gameObject_Result = uiController:FindGameObject("Result");
  gameObject_Msg = uiController:FindGameObject("Image_Msg");
  uiController:FindText("Text_Turns");
  uiController:FindText("Text_Count");
  image_Stop = uiController:FindImage("Image_Stop");

  local tempEvent;
  tempEvent = uiController:FindEvent("Image_ChangeReward");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ChangeReward);

  tempEvent = uiController:FindEvent("Image_Turn");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Turn);
  tempEvent.parameter = 1;

  tempEvent = uiController:FindEvent("Image_DoubleTurn");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Turn);
  tempEvent.parameter = 2;

  tempEvent = uiController:FindEvent("Image_TripleTurn");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Turn);
  tempEvent.parameter = 3;
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
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------

  tempEvent = uiController:FindEvent("Image_Coin");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_InsertCoin);

  event_Probability = uiController:FindEvent("Image_ShowPr");
  event_Probability:SetListener(EventTriggerType.PointerClick, this.OnClick_Probability);

  tempEvent = uiController:FindEvent("Image_Close");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);

  tempEvent = uiController:FindEvent("Image_Help");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Help);

  tempEvent = uiController:FindEvent("Image_CloseResult");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_CloseResult);

  tempEvent = uiController:FindEvent("Image_Stop");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Stop);
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

  tempEvent = uiController:FindEvent("Image_Switch");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Switch);
  image_Switch = tempEvent:GetComponent("Image");
  
  tempEvent = uiController:FindEvent("Image_DontAsk");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_DontAsk);
  image_DontAsk = tempEvent:GetComponent("Image");
end

function UISlotMachine.OnOpen()
  gameObject_Result:SetActive(false);

  this.ShowStopMessage();

  stop = true;

  this.ClearTotalSum();

  return true;
end

function UISlotMachine.OnVisible(visible)
  if visible then
    
    for i = 1, 2 do
      TextureManager.SetPng(ETextureUseType.UI, string.Concat("A0", i), rawImage_ItemBoard[i]);
    end

    for i = 1, 24 do
      TextureManager.SetPng(ETextureUseType.UI, "Icon_Bulb1", rawImage_Light[i]);
    end

    for i = 1, this.maxSlotItem do
      TextureManager.SetPng(ETextureUseType.UI, "Icon_Slot", slots[i].rawImage_Mask);
    end

    TextureManager.SetPng(ETextureUseType.UI, "common0_bod102",  rawImage_CloudL);
    TextureManager.SetPng(ETextureUseType.UI, "common0_bod102",  rawImage_CloudR);

    text_Award.text = "";
  
    for i = 1, this.maxSlotItem do
      local slot = slots[i];

      slot.rawImage_Mask.enabled = true;
      slot.image_Frame.enabled = false;
      slot.image_Color.color = slotMachineColor.yellow;
      slot.text_Count.text = "";
      slot.item:SetItem(0);
    end
  
    for i = 1, maxTextAward do
      text_Awards[i].text = "";
    end

    currentSlot = 1;

    --C:072-005 <小瑪莉開介面>
    Network.Send(72, 5);
  end
end

function UISlotMachine.OnClick_Switch()
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
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if not auto and state ~= ESlotMachineState.None then
    ShowCenterMessage(string.Get(71218));  --轉動中請稍候
    return;
  end

  local result = not auto;
  auto = result;
  image_Switch.sprite = UI.GetSwitchSprite(result);
end

function UISlotMachine.OnClick_DontAsk()
  dontAsk = not dontAsk;
  image_DontAsk.sprite = UI.GetSwitchSprite(dontAsk);
  
  UISell.SetAsk(41, dontAsk);
end

function UISlotMachine.OnClick_Stop()
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
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  stop = true;

  this.UpdateUI();
end

function UISlotMachine.OnClick_CloseResult()
  if state ~= ESlotMachineState.None then
    ShowCenterMessage(string.Get(71218));  --轉動中請稍候
    return;
  end

  gameObject_Result:SetActive(false);

  this.ShowStopMessage();

  this.ClearTotalSum();

  autoCount = 0;
end

function UISlotMachine.Update()
  for i = 1, table.Count(rawImage_Light) do
    uiRawImage_Light[i]:ShiftUV(math.random(1, 4), 4, 0.3, 0.3);
  end

  if CGTimer.time < nextUpdateTime then return end

  if state == ESlotMachineState.Run then
    nextUpdateTime = CGTimer.time + 0.01;

    slots[currentSlot].image_Frame.enabled = false;

    currentSlot = currentSlot + 1;
    if currentSlot > this.maxSlotItem then
      currentSlot = currentSlot % this.maxSlotItem;
      targetSlot = targetSlot - this.maxSlotItem;
    end

    --轉完
    if currentSlot == targetSlot then
      AudioManager.PlayOnce("AudioClip_WA0095");
  
      --獲得獎勵資訊
      local awardText = "";
      local awardMessage = "";
      local itemData;
      local count = 0;
      for k, resultInfo in pairs(results) do
        slots[resultInfo.slotIndex].image_Frame.enabled = true;

        --將演出索引校正至最後的獎勵
        currentSlot = resultInfo.slotIndex;
        targetSlot = resultInfo.slotIndex;

        itemData = itemDatas[resultInfo.itemId];

        local itemName = itemData:GetName(true);

        if not string.IsNullOrEmpty(awardText) then
          awardText = string.Concat(awardText, "\n");
        end

        awardText = string.Concat(awardText, itemName);

        if not string.IsNullOrEmpty(awardMessage) then
          awardMessage = string.Concat(awardMessage, "\n");
        end

        if itemData ~= nil and itemData:IsDirectUse() then
          count = itemData.attribute[1].value * resultInfo.count;
        else
          count = resultInfo.count;
        end

        if auto then
          text_Detail.text = string.Concat(text_Detail.text, string.Concat(string.format(string.Get(21179), itemName, count * sendTurnTimes), "\n"));
        end

        if resultInfo.awardIndex <= 3 then
          awardMessage = string.Concat(awardMessage, string.Get(71084), " ", Role.player.name, " ", string.Get(71220), " ", itemName, " ", count * sendTurnTimes, string.Get(40050));
        else
          awardMessage = string.Concat(awardMessage, string.Get(30098), itemName, " ", count * sendTurnTimes, string.Get(40050));
        end
      end

      if string.find(awardText, "\n") ~= nil then
        text_Award.fontSize = 20;
      else
        text_Award.fontSize = 28;
      end

      if not auto then
        text_Award.text = awardText;
      end

      Chat.AddMessage(EChannel.System, awardMessage);

      state = ESlotMachineState.Mask;
      nextUpdateTime = CGTimer.time + 0.15;

    --剎車
    elseif currentSlot > targetSlot - breakSlots then
      AudioManager.PlayChannelOnce("AudioClip_WA0094", 8 + math.fmod(currentSlot, 3), 0.3);
      slots[currentSlot].image_Frame.enabled = true;

      nextUpdateTime = CGTimer.time + 0.15;
    
    --轉動
    else
      AudioManager.PlayChannelOnce("AudioClip_WA0094", 8 + math.fmod(currentSlot, 3), 0.25);
      slots[currentSlot].image_Frame.enabled = true;

      nextUpdateTime = CGTimer.time + 0.04;
    end

  elseif state == ESlotMachineState.Mask then
    currentSlot = currentSlot + 1;
    if currentSlot > this.maxSlotItem then
      currentSlot = currentSlot % this.maxSlotItem;
    end

    local slot = slots[currentSlot];
    slot.rawImage_Mask.enabled = true;
    slot.image_Frame.enabled = false;
    slot.image_Color.color = slotMachineColor.yellow;
    slot.text_Count.text = "";
    slot.item:SetItem(0);

    --蓋完
    if currentSlot == targetSlot then
      state = ESlotMachineState.None;
      nextUpdateTime = 0;

      this.UpdateUI();

      if not stop and autoCount > 1 then
        if this.CheckTurn() then return end

        autoCount = autoCount - 1;
        this.SendStartTurn();
      else
        if autoCount <= 1 then
          this.ShowStopMessage(string.Get(22975));  --已轉完玩家所設定的次數
        end

        stop = true;

        this.UpdateUI();
      end
    --蓋牌
    else
      nextUpdateTime = CGTimer.time + 0.1;
    end
  end
end

function UISlotMachine.Clear()
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
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  table.Clear(this.awards);
end

function UISlotMachine.UpdateCoin()
  text_Coin.text = this.coin;

  this.UpdateUI();
end

function UISlotMachine.UpdateUI()
  if stop then
    image_Stop.color = Color.Gray;
  else
    image_Stop.color = Color.White;
  end

  if state ~= ESlotMachineState.None then return end

  if this.coin == 0 or table.Count(this.awards) == 0 then
    --盤面獎勵
    for i = 1, this.maxSlotItem do
      local slot = slots[i];

      slot.rawImage_Mask.enabled = true;
      slot.image_Frame.enabled = false;
      slot.image_Color.color = slotMachineColor.yellow;
      slot.text_Count.text = "";
      slot.item:SetItem(0);
    end

    --左側獎勵
    for i = 1, maxTextAward do
      text_Awards[i].text = "";
    end

    event_Probability.gameObject:SetActive(false);

  else
    --盤面獎勵
    local itemData;
    for i = 1, this.maxSlotItem do
      local award = this.awards[i];
      local slot = slots[award.slotIndex];

      slot.rawImage_Mask.enabled = false;
      slot.image_Frame.enabled = award.slotIndex == currentSlot;

      if i <= 1 then
        slot.image_Color.color = slotMachineColor.red;
      elseif i <= 3 then
        slot.image_Color.color = slotMachineColor.blue;
      else
        slot.image_Color.color = slotMachineColor.yellow;
      end

      if award.count == 1 then
        slot.text_Count.text = "";
      else
        itemData = itemDatas[award.itemId];

        if itemData ~= nil and itemData:IsDirectUse() then
          slot.text_Count.text = itemData.attribute[1].value * award.count;
        else
          slot.text_Count.text = award.count;
        end
      end

      slot.item:SetItem(award.itemId);
      slot.item.transform:Find("RawImage_Icon").gameObject:GetComponent("RectTransform").offsetMax = slot.item.gameObject:GetComponent("RectTransform").offsetMax;
      slot.item.transform:Find("RawImage_Icon").gameObject:GetComponent("RectTransform").offsetMin = slot.item.gameObject:GetComponent("RectTransform").offsetMin;
    end

    --左側獎勵顯示
    for i = 1, maxTextAward do
      text_Awards[i].text = itemDatas[this.awards[i].itemId]:GetName(true);
    end

    event_Probability.gameObject:SetActive(true);
  end
end

function UISlotMachine.StartTurn(data)
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  text_Award.text = "";

  table.Clear(results);

  local count = data:ReadByte();
  for i = 1, count do
    local resultInfo = {};
    resultInfo.slotIndex = data:ReadByte();
    
    for k, v in pairs(this.awards) do
      if v.slotIndex == resultInfo.slotIndex then
        resultInfo.awardIndex = k;
        resultInfo.itemId = v.itemId;
        resultInfo.count = v.count;
        break;
      end
    end

    table.insert(results, resultInfo);
  end

  table.sort(results,
    function(a, b)
      return a.slotIndex < b.slotIndex;
    end
  );

  targetSlot = this.maxSlotItem * 2 + results[1].slotIndex;
  breakSlots = math.random(4, 7);
  
  state = ESlotMachineState.Run;
  nextUpdateTime = 0;

  this.AddTotal();
end

function UISlotMachine.OnClick_Help()
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
  
  UI.Open(UITutorialHint, 35, this);
end

function UISlotMachine.OnClick_Close()
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
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if state ~= ESlotMachineState.None then
    ShowCenterMessage(string.Get(71218));
    return;
  end

  UI.Close(this);
end

function UISlotMachine.OnClick_Probability()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if  state ~= ESlotMachineState.None then
  ShowCenterMessage(string.Get(71218));  --轉動中請稍候
  return;
  end

  if this.coin == 0 or table.Count(this.awards) == 0 then
    ShowCenterMessage(string.Get(71216));
    return;
  end

  UI.OpenAlwaysUseArgument(UIItemInfo, EThings.SlotMachine, 31171, 0);
end

function UISlotMachine.OnClick_ChangeReward()
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
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  
  if state ~= ESlotMachineState.None then
    ShowCenterMessage(string.Get(71218));
    return;
  end

  if this.coin < 1 then
    ShowCenterMessage(string.Get(71216));
    return;
  end

  --小瑪莉換盤
  UISell.Launch(41);
end

function UISlotMachine.OnClick_InsertCoin()
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
  if state ~= ESlotMachineState.None then
    ShowCenterMessage(string.Get(71218));
    return;
  end

  if this.coin >= this.maxCoin then
    ShowCenterMessage(string.Get(20763));
    return;
  end

  local coinId = 31171 --吞食歡樂幣
  local count = Item.GetItemCount(coinId);
  if count < 1 then
    local max = 0;

    if this.maxCoin - this.coin > math.floor(Role.GetPoint() / 9) then
      max = math.floor(Role.GetPoint() / 9);
    else
      max = this.maxCoin - this.coin;
    end

    if max < 1 then
      ShowCenterMessage(string.Get(80360));
      return;
    end
    
    ShowStoreInput(coinId, max, ECurrency.Gold, -9,
      function(text)
        if text == nil then return end

        AudioManager.PlayOnce("AudioClip_WA0005");
        UISell.Launch(11, nil, 0, text);
      end
    );
  else
    local max = 0;
    if this.maxCoin - this.coin > count then
      max = count;
    else
      max = this.maxCoin - this.coin;
    end

    ShowCountInput(string.Get(20748), 1, max,
      function(text)
        if text == nil then return end

        AudioManager.PlayOnce("AudioClip_WA0005");
        UISell.Launch(11, nil, text);
      end
    );
  end
end

function UISlotMachine.CheckTurn()
  if Item.currentThingGrid - Item.GetBagCount(EThings.Bag, 0) < requireSpace then
    ShowCenterMessage(string.Get(71219));  --請清理一下您的背包後再玩吞食轉轉樂，會有意想不到的收穫喔!
    stop = true;
    this.ShowStopMessage(string.Get(80359));
    this.UpdateUI();
    return true;
  end

  if this.coin < requireCoin then
    ShowCenterMessage(string.Get(71216));  --請投入吞食歡樂幣
    stop = true;
    this.ShowStopMessage(string.Get(22975));
    return true;
  end

  if protocolSubKind == 0 then
    return true;
  end

  return false;
end

function UISlotMachine.ShowStopMessage(msg)
  if msg ~= nil then
    gameObject_Msg:SetActive(true);
    text_Msg.text = msg;
  else
    gameObject_Msg:SetActive(false);
    text_Msg.text = "";
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
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
  end
end

function UISlotMachine.AddTotal()
  totalTrun = totalTrun + 1;
  totalCoin = totalCoin + requireCoin;
  this.UpdateAutoTurnUI();
end

function UISlotMachine.UpdateAutoTurnUI()
  text_TotalTrun.text = string.format(string.Get(22972), totalTrun);
  text_TotalCoin.text = string.format(string.Get(22973), totalCoin);
end

function UISlotMachine.ClearTotalSum()
  totalTrun = 0;
  totalCoin = 0;
  text_Detail.text = "";
end

function UISlotMachine.SendStartTurn()
  Network.Send(72, protocolSubKind);

  state = ESlotMachineState.Wait;
end

function UISlotMachine.OnClick_Turn(uiEvent)
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
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  local kind = uiEvent.parameter;

  if state ~= ESlotMachineState.None then
    ShowCenterMessage(string.Get(71218));  --轉動中請稍候
    return;
  end

  if kind == 1 then  --單抽
    requireSpace = 2;
    requireCoin = 1;
    protocolSubKind = 2;  --C:072-002 <小瑪莉啟動>
    sendTurnTimes = 1;
  elseif kind == 2 then  --獎勵加倍
    requireSpace = 3;
    requireCoin = 2;
    protocolSubKind = 3;  --C:072-003 <小瑪莉加倍啟動>
    sendTurnTimes = 2;
  elseif kind == 3 then  --三連抽
    requireSpace = 4;
    requireCoin = 6;
    protocolSubKind = 4;  --C:072-004 <小瑪莉三連啟動>
    sendTurnTimes = 1;
  end

  if this.CheckTurn() then return end

  if auto then
    this.ShowCoinInput(1, math.floor(this.coin / requireCoin),
      function(text)
        if text == nil then return end

        autoCount = tonumber(text);

        this.SendStartTurn();

        gameObject_Result:SetActive(true);

        this.ShowStopMessage();

        stop = false;
        
        this.ClearTotalSum();
      end
    );
  else
    this.SendStartTurn();
  end
end

function UISlotMachine.ShowCoinInput(min, max, eventHandler)
  UI.Open(UIAlert, EUIAlertType.IntegerNumber,
    eventHandler,
    string.Get(22970),
    "",
    min,
    max
  );
end

--[[ 小瑪莉訊息
S:072-003 <小瑪莉訊息> +種類(1)
  種類 1:告知Client要加物品
  種類 2:換盤次數不足
  種類 3:轉轉幣不足
  種類 4:投幣達上限
  種類 5:扣除轉轉幣失敗
  種類 6:身上空間不足
  種類 10:在無界不能使用
  種類 11:被關
  種類 12:戰鬥中
]]--
function UISlotMachine.RevSlotMessage(data)
  local kind = data:ReadByte();
  if kind == 2 then
    ShowCenterMessage(string.Get(71215));
  elseif kind == 4 then
    ShowCenterMessage(string.Get(20763));
  elseif kind == 5 then
    logError("扣除轉轉幣失敗");
  elseif kind == 10 then
    ShowCenterMessage(string.Get(71223));
  elseif kind == 11 then
    logError("被關");
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
  end

  stop = true;
end