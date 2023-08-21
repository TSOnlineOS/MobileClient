EUIBattlePassPage = {
  Pass = 1,
  Mission = 2,
}

UIBattlePass = {}
local this = UIBattlePass;
local uiController;

this.name = "UIBattlePass";
this.uiController = nil;
local text_Lv;
local text_ExpPercentage;
local text_ExpValue;
local text_Time;
local text_SpotlightText;
local text_Switch;
local text_BuyPass;
local image_PaidBlockMask;
local image_WithdrawRedDot;
local image_SwitchRedDot;
local slider_Exp;
local gameObject_BattlePass;
local gameObject_Mission;
local gameObject_Warning;
local scrollContent_BattleReward;
local scrollItems_BattleReward = {};
local scrollContent_MissionAward;
local scrollItems_MissionAward = {};
local scrollContent_Warning;
local scrollItems_Warning = {};

--var
local currentPage = EUIBattlePassPage.Pass;
local paidFlagId = 6060;

local currentSpotLightLv = 1;
local spotlightLvMultiplier = 10;
local lowestLvInView = 1;
local highestLvInView = 6;
local cannotTakeColor = LuaHelper.GetColor(102, 102, 102, 255);
local canTakeColor = LuaHelper.GetColor(255, 255, 255, 255);
local canTakeImage = "but136L";
local tookImage = "but136D";

local spotlightItem = {};
local missionList = {};
local warningItem = {};

function UIBattlePass.Initialize(go)
  uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  
  gameObject_BattlePass = uiController:FindGameObject("BattlePass");
  gameObject_Mission = uiController:FindGameObject("Mission");
  gameObject_Warning = uiController:FindGameObject("Warning");
  
  text_Time = uiController:FindText("Text_Time");
  text_Lv = uiController:FindText("Text_Lv");
  text_ExpPercentage = uiController:FindText("Text_ExpPercentage");
  text_ExpValue = uiController:FindText("Text_ExpValue");
  text_SpotlightText = uiController:FindText("Text_SpotlightText");
  text_Switch = uiController:FindText("Text_Switch");
  text_BuyPass = uiController:FindText("Text_BuyPass");
  image_PaidBlockMask = uiController:FindImage("Image_PaidBlockMask");
  image_WithdrawRedDot = uiController:FindImage("Image_WithdrawRedDot");
  image_SwitchRedDot = uiController:FindImage("Image_SwitchRedDot");
  slider_Exp = uiController:FindSlider("Slider_Exp");
  
  scrollContent_BattleReward = uiController:FindScrollContent("ScrollContent_BattleReward");
  scrollContent_BattleReward.onInitialize = this.OnInitialize_ScrollContent_BattleReward;
  scrollContent_BattleReward.onItemChange = this.OnItemChange_ScrollContent_BattleReward
  scrollContent_BattleReward:Initialize(1);
  
  spotlightItem.ItemSlot_1 = uiController:FindImage("ItemSlot_Spotlight_1");
  spotlightItem.SpotlightBlock_1 = uiController:FindImage("ItemSlot_SpotlightBlock_1");
  spotlightItem.Item_1 = UIItemController.New(spotlightItem.ItemSlot_1.transform);

  spotlightItem.Item_1:SetBaseUIItemSizeDelta(-10, -10);
  spotlightItem.ItemSlot_2 = uiController:FindImage("ItemSlot_Spotlight_2");
  spotlightItem.SpotlightBlock_2 = uiController:FindImage("ItemSlot_SpotlightBlock_2");
  spotlightItem.Item_2 = UIItemController.New(spotlightItem.ItemSlot_2.transform);
  spotlightItem.Item_2:SetBaseUIItemSizeDelta(-10, -10);
  
  
  local tempEvent;
  tempEvent = uiController:FindEvent("Image_WithdrawAll");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_WithdrawAll);
  
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
  tempEvent = uiController:FindEvent("Image_BuyPass");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_BuyPass);
  
  tempEvent = uiController:FindEvent("Image_Switch");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Switch);
  
  tempEvent = uiController:FindEvent("Image_Help");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Help);
  tempEvent = uiController:FindEvent("Image_Close");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);
  
  --mission
  scrollContent_MissionAward = uiController:FindScrollContent("ScrollContent_MissionAward");
  scrollContent_MissionAward.onInitialize = this.OnInitialize_ScrollContent_MissionAward;
  scrollContent_MissionAward.onItemChange = this.OnItemChange_ScrollContent_MissionAward;
  scrollContent_MissionAward:Initialize(1);
  
  --warning
  scrollContent_Warning = uiController:FindScrollContent("ScrollContent_WarningSlot");
  scrollContent_Warning.onInitialize = this.OnInitialize_ScrollContent_Warning;
  scrollContent_Warning.onItemChange = this.OnItemChange_ScrollContent_Warning
  scrollContent_Warning:Initialize(1);
  
  tempEvent = uiController:FindEvent("Image_Checked");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Checked);
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

function UIBattlePass.OnOpen()
  gameObject_Warning:SetActive(false);
  BattlePass.SetPassData();
  if BattlePass.CheckHavePass() then
    BattlePass.UpdateAwardTake();
    CGTimer.AddListener(this.UpdateTime, 1);
  else
    text_Time.text = string.Get(20377);
  end
  
  this.UpdateUI(true);
  return true;
end

function UIBattlePass.OnClose()
  CGTimer.RemoveListener(this.UpdateTime);
  BattlePass.Clear();
  currentPage = EUIBattlePassPage.Pass;
  
  return true;
end

function UIBattlePass.UpdateUI(reset)
  gameObject_BattlePass:SetActive(currentPage == EUIBattlePassPage.Pass);
  gameObject_Mission:SetActive(currentPage == EUIBattlePassPage.Mission);

  if currentPage == EUIBattlePassPage.Pass then
    text_Switch.text = string.Get(23851);
  else
    text_Switch.text = string.Get(23852);
  end
  
  this.UpdateBattlePass(reset);
  this.UpdateMission();
end

function UIBattlePass.UpdateBattlePass(reset)
  if currentPage ~= EUIBattlePassPage.Pass then return end;
  local currentPassLv = BattlePass.GetCurrentPassLv();
  local currentPassExp = BattlePass.GetCurrentPassExp();
  local expLimit = BattlePass.GetCurrentExpLimit();
  text_ExpValue.text = string.Concat(currentPassExp, "/", expLimit);
  text_Lv.text = currentPassLv;
  slider_Exp.maxValue = expLimit;
  slider_Exp.value = currentPassExp;
  
  if not BattlePass.CheckHavePass() then
    text_ExpPercentage.text = string.Concat(0, "%");
    text_BuyPass.text = string.Get(23855);
    scrollContent_BattleReward:Reset(50);
    image_PaidBlockMask.gameObject:SetActive(true);
    image_SwitchRedDot.gameObject:SetActive(false);
    image_WithdrawRedDot.gameObject:SetActive(false);
  else
    local sellData = BattlePass.GetSellData();
    local storeValueData = BattlePass.GetStoreValueData(sellData);
    image_PaidBlockMask.gameObject:SetActive(not BitFlag.Get(paidFlagId));
    text_ExpPercentage.text = string.Concat(math.floor((currentPassExp / expLimit) * 100), "%");
    if storeValueData ~= nil then
      text_BuyPass.text = string.Concat(string.format( string.Get( storeValueData.showText ), storeValueData.showPrice * 0.01 ), string.Get(23855))
    else
      text_BuyPass.text = string.Get(23855);
    end
    local totalLv = BattlePass.GetTotalLv();
    local maxShowInScreen = 5;
    if reset then
      if currentPassLv > totalLv - maxShowInScreen then
        scrollContent_BattleReward:Reset(totalLv,totalLv - 4);
      elseif currentPassLv > 1 then
        scrollContent_BattleReward:Reset(totalLv,currentPassLv - 1);
      else
        scrollContent_BattleReward:Reset(totalLv);
      end
    else
      scrollContent_BattleReward:Refresh();
    end
  end
  
  this.UpdateSpotlight();
end

function UIBattlePass.UpdateMission()
  if currentPage ~= EUIBattlePassPage.Mission then return end;
  image_SwitchRedDot.gameObject:SetActive(false);
  if not BattlePass.CheckHavePass() then return end;
  scrollContent_MissionAward:Reset(MissionAward.GetMissionCountById(BattlePass.GetCurrentPassId()));
  this.UpdateMissionPage();
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

function UIBattlePass.UpdateTime()
  local currentPassId = BattlePass.GetCurrentPassId();
  if activityTimes[currentPassId] == nil then return end
  if activityTimes[currentPassId][1].serverStartTime ~= 0 and DateTime.Compare(CGTimer.serverTime, activityTimes[currentPassId][1].serverStartTime) >= 0
    and DateTime.Compare(CGTimer.serverTime, activityTimes[currentPassId][1].serverCloseTime) < 0 then
    local leftTime = DateTime.Subtract(activityTimes[currentPassId][1].serverCloseTime, CGTimer.serverTime);
    text_Time.text = string.Concat(string.Get(80098), string.GetSecondText(math.ceil(leftTime.TotalSeconds)));
  else
    text_Time.text = string.Get(20377);
    if currentPage == EUIBattlePassPage.Mission then
      this.OnClick_Switch();
    end
    BattlePass.SetPassData();
    UI.Close(this);
  end
end

function UIBattlePass.UpdateFromReddot(missionAwardRedDot, awardTookRedDot)
  scrollContent_BattleReward:Refresh();
  
  if currentPage == EUIBattlePassPage.Pass then
    image_SwitchRedDot.gameObject:SetActive(missionAwardRedDot);
    image_WithdrawRedDot.gameObject:SetActive(awardTookRedDot);
  end
end

--region Spotlight
function UIBattlePass.UpdateSpotlight()
  local awardData;
  local currentId;
  local currentPassLv;
  if BattlePass.CheckHavePass() then
    currentId = BattlePass.GetCurrentPassId();
    awardData = PassAwardData.GetData(currentId, (currentSpotLightLv * spotlightLvMultiplier));
    currentPassLv = BattlePass.GetCurrentPassLv();
  else
    awardData = nil;
  end
  
  spotlightItem.ItemSlot_1.sprite = UI.GetSprite(tookImage);
  spotlightItem.ItemSlot_2.sprite = UI.GetSprite(tookImage);
  spotlightItem.ItemSlot_1.color = canTakeColor;
  spotlightItem.ItemSlot_2.color = canTakeColor;
  spotlightItem.SpotlightBlock_1.gameObject:SetActive(false);
  spotlightItem.SpotlightBlock_2.gameObject:SetActive(false);
  
  if awardData ~= nil then
    local itemSave_1 = itemDatas[awardData.itemId[2]];
    local itemSave_2 = itemDatas[awardData.itemId[3]];
    itemSave_1.enhanceLv = 0;
    itemSave_1.styleLv = nil;
    itemSave_2.enhanceLv = 0;
    itemSave_2.styleLv = nil;
    spotlightItem.Item_1:SetItem(awardData.itemId[2], awardData.itemQuantity[2], itemSave_1);
    spotlightItem.Item_2:SetItem(awardData.itemId[3], awardData.itemQuantity[3], itemSave_2);
    spotlightItem.Item_1:SetImageBG(false);
    spotlightItem.Item_2:SetImageBG(false);
    if (currentSpotLightLv * spotlightLvMultiplier) <= currentPassLv and BitFlag.Get(paidFlagId) then
      if awardData.isTook[2] or awardData.isTook[3] then
        spotlightItem.ItemSlot_1.color = cannotTakeColor;
        spotlightItem.ItemSlot_2.color = cannotTakeColor;
        spotlightItem.SpotlightBlock_1.gameObject:SetActive(true);
        spotlightItem.SpotlightBlock_2.gameObject:SetActive(true);
      else
        spotlightItem.ItemSlot_1.sprite = UI.GetSprite(canTakeImage);
        spotlightItem.ItemSlot_2.sprite = UI.GetSprite(canTakeImage);
      end
    end
    
    text_SpotlightText.text = string.format(string.Get(23856), currentSpotLightLv * spotlightLvMultiplier);
  else
    spotlightItem.Item_1:SetItem(0);
    spotlightItem.Item_2:SetItem(0);
    text_SpotlightText.text = "";
  end
end

function UIBattlePass.SetSpotlight(lv)
  if not BattlePass.CheckHavePass() then return end;
  local totalLv = BattlePass.GetTotalLv();
  if lv >= lowestLvInView and lv < (highestLvInView + 1) then return end;
  
  if lv <= totalLv and lv > (totalLv - spotlightLvMultiplier) then
    currentSpotLightLv = math.ceil(totalLv / spotlightLvMultiplier);
    this.UpdateSpotlight();
  elseif lv < lowestLvInView then
    highestLvInView = highestLvInView - (lowestLvInView - lv);
    lowestLvInView = lv;
    
    if (currentSpotLightLv * spotlightLvMultiplier) < highestLvInView then
      currentSpotLightLv = currentSpotLightLv + 1;
      this.UpdateSpotlight();
    elseif ((currentSpotLightLv - 1) * spotlightLvMultiplier) >= highestLvInView then
      currentSpotLightLv = currentSpotLightLv - 1;
      this.UpdateSpotlight();
    end
  else
    lowestLvInView = lowestLvInView + (lv - highestLvInView);
    highestLvInView = lv;
  
    if (currentSpotLightLv * spotlightLvMultiplier) < highestLvInView then
      currentSpotLightLv = currentSpotLightLv + 1;
      this.UpdateSpotlight();
    elseif ((currentSpotLightLv - 1) * spotlightLvMultiplier) >= highestLvInView then
      currentSpotLightLv = currentSpotLightLv - 1;
      this.UpdateSpotlight();
    end
  end
end
--endregion

--region ButtonFunction
function UIBattlePass.OnClick_WithdrawAll()
  if not BattlePass.CheckHavePass() or not BattlePass.IsInTime() then
    ShowCenterMessage(string.Get(20377));
    UI.Close(this);
    return
  end
  
  if not BattlePass.UpdateAwardTookRedDot() then
    ShowCenterMessage(string.Get(24063));
    return
  end
  --C:077-011<活動協定> 活動種類(1) 種類128 <通行證相關> + 種類(1)
  --                        種類 0:詢問通行證功能開啟
  --                        種類 1:一鍵領通行證獎勵
  sendBuffer:Clear();
  sendBuffer:WriteByte(BattlePass.GetPassActivityKind());
  sendBuffer:WriteByte(1);
  Network.Send(77, 11, sendBuffer);
end

function UIBattlePass.OnClick_BuyPass()
  if not BattlePass.CheckHavePass() or not BattlePass.IsInTime() then
    ShowCenterMessage(string.Get(20377));
    UI.Close(this);
    return
  end
  
  local sellData = BattlePass.GetSellData();

  if sellData  == nil then
    logError("沒有sellData")
    return
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
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  local storeValueData = BattlePass.GetStoreValueData(sellData);

  if storeValueData  == nil then
    logError("沒有storeValueData")
    return
  end
  
  BattlePass.RequireCheckBattlePassFunction(EBattlePassReuireState.BuyPass, storeValueData.cashIndex);
end

function UIBattlePass.OnClick_Switch()
  if currentPage == EUIBattlePassPage.Pass then
    if not BattlePass.CheckHavePass() or not BattlePass.IsInTime() then
      ShowCenterMessage(string.Get(20377));
      UI.Close(this);
      return
    end
    image_SwitchRedDot.gameObject:SetActive(false);
    currentPage = EUIBattlePassPage.Mission;
  else
    currentPage = EUIBattlePassPage.Pass;
  end
  this.UpdateUI();
  BattlePass.UpdateRedDot();
end

function UIBattlePass.OnClick_Help()
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
  UI.Open(UITutorialHint, 70, this);
  
  return true;
end

function UIBattlePass.OnClick_Close()
  UI.Close(UIBattlePass);
  
  return true;
end

--endregion

--region BattlePassContent
function UIBattlePass.OnInitialize_ScrollContent_BattleReward(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_BattleReward[itemIndex] = {};
    scrollItems_BattleReward[itemIndex].text_RewardLv = scrollItems[itemIndex]:Find("Image_RewardLv"):Find("Text_RewardLv"):GetComponent("Text");
    scrollItems_BattleReward[itemIndex].itemSlotImage = {};
    scrollItems_BattleReward[itemIndex].itemSlot = {};
    scrollItems_BattleReward[itemIndex].itemSlotBlockImage = {};
    for i = 1, 3 do
      scrollItems_BattleReward[itemIndex].itemSlotImage[i] = scrollItems[itemIndex]:Find(string.Concat("ItemSlot_", tostring(i))):GetComponent("Image");
      scrollItems_BattleReward[itemIndex].itemSlot[i] = UIItemController.New(scrollItems[itemIndex]:Find(string.Concat("ItemSlot_", tostring(i))));
      scrollItems_BattleReward[itemIndex].itemSlot[i]:SetBaseUIItemSizeDelta(-10, -10);
      scrollItems_BattleReward[itemIndex].itemSlotBlockImage[i] = scrollItems[itemIndex]:Find(string.Concat("ItemSlotBlock_", tostring(i))):GetComponent("Image");
    end
  end
end

function UIBattlePass.OnItemChange_ScrollContent_BattleReward(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local awardDatas = BattlePass.GetAwardData();
  local passAward = awardDatas[index];
  local currentPassLv = BattlePass.GetCurrentPassLv();
  this.SetSpotlight(index);
  
  scrollItems_BattleReward[itemIndex].text_RewardLv.text = index;
 
  if passAward == nil then
    for i = 1, 3 do
      scrollItems_BattleReward[itemIndex].itemSlot[i]:SetItem(0);
      scrollItems_BattleReward[itemIndex].itemSlot[i]:SetEvent(this.OnClick_BattlePassItem);
    end
  else
    local itemSave;
    for i = 1, 3 do
      itemSave = itemDatas[passAward.itemId[i]];
      scrollItems_BattleReward[itemIndex].itemSlotBlockImage[i].gameObject:SetActive(false);
      if itemSave ~= nil then
        itemSave.enhanceLv = 0;
        itemSave.styleLv = nil;
        scrollItems_BattleReward[itemIndex].itemSlotImage[i].gameObject:SetActive(true);
        scrollItems_BattleReward[itemIndex].itemSlot[i]:SetItem(passAward.itemId[i], passAward.itemQuantity[i], itemSave);
        scrollItems_BattleReward[itemIndex].itemSlot[i]:SetImageBG(false);
        scrollItems_BattleReward[itemIndex].itemSlot[i]:SetEvent(this.OnClick_BattlePassItem, itemSave);
        scrollItems_BattleReward[itemIndex].itemSlotImage[i].sprite = UI.GetSprite(tookImage);
        scrollItems_BattleReward[itemIndex].itemSlotImage[i].color = canTakeColor;
        if index <= currentPassLv then
          if i == 1 or BitFlag.Get(paidFlagId) then
            if passAward.isTook[i] then
              scrollItems_BattleReward[itemIndex].itemSlotImage[i].color = cannotTakeColor;
              scrollItems_BattleReward[itemIndex].itemSlotBlockImage[i].gameObject:SetActive(true);
            else
              scrollItems_BattleReward[itemIndex].itemSlotImage[i].sprite = UI.GetSprite(canTakeImage);
            end
          end
        end
      else
        scrollItems_BattleReward[itemIndex].itemSlotImage[i].gameObject:SetActive(false);
        scrollItems_BattleReward[itemIndex].itemSlot[i]:SetItem(0);
        scrollItems_BattleReward[itemIndex].itemSlot[i]:SetEvent(this.OnClick_BattlePassItem);
      end
    end
  end
  
  return true;
end

function UIBattlePass.OnClick_BattlePassItem(uiEvent)
  local itemData = uiEvent.parameter;
  if itemData == nil then return end;
  UIItemInfo.Show(itemData.Id, itemData)
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
--endregion

--region Mission
function UIBattlePass.OnInitialize_ScrollContent_MissionAward(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_MissionAward[itemIndex] = {};
    scrollItems_MissionAward[itemIndex].missionContent = scrollItems[itemIndex]:Find("Text_MissionContent"):GetComponent("Text");
    scrollItems_MissionAward[itemIndex].schedule = scrollItems[itemIndex]:Find("Text_Schedule"):GetComponent("Text");
    scrollItems_MissionAward[itemIndex].itemAward = UIItemController.New(scrollItems[itemIndex]:Find("Image_ItemAward"));
    scrollItems_MissionAward[itemIndex].missionStatus = scrollItems[itemIndex]:Find("Text_MissionStatus"):GetComponent("Text");
    scrollItems_MissionAward[itemIndex].collectAwardButton = scrollItems[itemIndex]:Find("Image_CollectAward"):GetComponent("Image");
    scrollItems_MissionAward[itemIndex].collectAwardEvent = scrollItems[itemIndex]:Find("Image_CollectAward"):GetComponent("UIEvent");
    scrollItems_MissionAward[itemIndex].collectAwardEvent:SetListener(EventTriggerType.PointerClick, this.OnClickCollectAward);
  end
end

function UIBattlePass.OnItemChange_ScrollContent_MissionAward(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local mission = missionList[index];
  if mission == nil then return false end
  scrollItems_MissionAward[itemIndex].missionContent.text = mission:GetContent();
  scrollItems_MissionAward[itemIndex].schedule.text = mission:GetSchedule();
  scrollItems_MissionAward[itemIndex].itemAward:SetItem(mission.itemId, mission.itemCount);
  scrollItems_MissionAward[itemIndex].itemAward:SetEvent();
  scrollItems_MissionAward[itemIndex].collectAwardEvent.parameter = mission;
  this.UpdateMissionStatus(scrollItems_MissionAward[itemIndex], mission);
  return true
end

function UIBattlePass.UpdateMissionStatus(scrollItem, mission)
  local collectable = mission:IsComplete() and not mission:HaveGetFlag();
  scrollItem.collectAwardButton.gameObject:SetActive(collectable);
  scrollItem.missionStatus.gameObject:SetActive(not collectable);
  if collectable then
    return
  end
  if mission:HaveGetFlag() then
    scrollItem.missionStatus.text = string.Get(98017);
  else
    scrollItem.missionStatus.text = string.Get(21060);
  end
end

function UIBattlePass.OnClickCollectAward(uiEvent)
  local mission = uiEvent.parameter;
  this.SendCompleteMission(mission.Id);
end

function UIBattlePass.UpdateMissionPage()
  missionList = MissionAward.GetMissionOrderByStatus(BattlePass.GetCurrentPassId());
  scrollContent_MissionAward:Refresh();
end

--C:077-011<活動協定> 活動種類(1) 種類129 <領通行證任務獎勵> +任務ID(2)
function UIBattlePass.SendCompleteMission(missionID)
  if missionID == nil then return end
  if Item.GetBagLeftCount(EThings.Bag) < 1 then
    ShowCenterMessage(string.Get(80359));
    return
  end
  sendBuffer:Clear();
  sendBuffer:WriteByte(129);
  sendBuffer:WriteUInt16(missionID);
  Network.Send(77, 11, sendBuffer);
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
--endregion

--region Warning
function UIBattlePass.OpenWarning()
  this.GetWarrningContent();
  scrollContent_Warning:Reset(table.Count(warningItem));
  gameObject_Warning:SetActive(true);
end

function UIBattlePass.GetWarrningContent()
  table.Clear(warningItem)
  local itemSave;
  local awardDatas = BattlePass.GetAwardData();
  for _, v in ipairs(awardDatas) do
    for i = 2, 3 do
      if v.itemId[i] ~= 0 then
        if this.CheckStack(v.itemId[i]) then
          this.AddQuantity(v.itemId[i], v.itemQuantity[i]);
        else
          itemSave = itemDatas[v.itemId[i]];
          itemSave.quant = v.itemQuantity[i];
          itemSave.enhanceLv = 0;
          itemSave.styleLv = nil;
          table.insert(warningItem, itemSave)
        end
      end
    end
  end
end

function UIBattlePass.CheckStack(itemId)
  if table.Count(warningItem) == 0 then return false end;
  for _, v in ipairs(warningItem) do
    if v.Id == itemId then
      return true;
    end
  end
  return false;
end

function UIBattlePass.AddQuantity(itemId, quant)
  if table.Count(warningItem) == 0 then return false end;
  for _, v in ipairs(warningItem) do
    if v.Id == itemId then
      v.quant = v.quant + quant;
    end
  end
end

function UIBattlePass.OnInitialize_ScrollContent_Warning(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Warning[itemIndex] = UIItemController.New(scrollItems[itemIndex]);
  end
end

function UIBattlePass.OnItemChange_ScrollContent_Warning(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local itemSave = warningItem[index];
  if itemSave ~= nil then
    scrollItems_Warning[itemIndex]:SetItem(itemSave.Id, itemSave.quant, itemSave);
    scrollItems_Warning[itemIndex]:SetEvent(this.OnClickWarningItem, itemSave);
  end
 
  return true;
end

function UIBattlePass.OnClickWarningItem(uiEvent)
  local itemData = uiEvent.parameter;
  if itemData == nil then return end;
  UIItemInfo.Show(itemData.Id, itemData)
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

function UIBattlePass.OnClick_Checked()
  gameObject_Warning:SetActive(false);
end

function UIBattlePass.CheckShowWarning()
  local freeAwardStage = RoleCount.Get(ERoleCount.BattleFreeLv);
  if freeAwardStage == BattlePass.GetTotalLv() and not BitFlag.Get(paidFlagId) then
    this.OpenWarning();
  end
end
--endregion

