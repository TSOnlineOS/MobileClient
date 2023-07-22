UIExpSlotMachine = {}
ESlotMachineKind = {
  EXP = 1,
  Sacrifice = 2
}

local this = UIExpSlotMachine;
this.name = "UIExpSlotMachine";
this.uiController = nil;
local currentKind;
local transform_FrameRect;
local transform_Result;
local transform_AwardSet;
local rawImage_Machine;
local rawImage_Drawbar;
local rawImage_SacrificeLever;
local rawImage_SacrificeEyeBlink;
local text_Exp;
local text_FollowNpc;
local event_Stop;
local event_Sacrifice;
local image_AutoSwitch;
local scrollContent_Award;
local scrollItems_Award = {};
local scrollContent_Result;
local scrollItems_Result = {};
local scrollContent_Items = {};
local scrollItems_Items = {};
local slider_Exp;
local text_NpcExp;
local text_FullExp;
local text_LvValue;
local text_Content;
local text_Result;
local text_SacrificeSpend;
local text_SacrificeMultiply;
local text_SacrificePoints;
local text_Congrats;
local text_AwardContent;

local functionGameObject = {};
local gameObject_EXP;
local gameObject_Sacrifice;
local gameObject_Prev;
local gameObject_Next;
local gameObject_AwardBG;
local gameObject_AwardSetBG;

local awardsCount = 0;
local followNpcName = {};
local currentfollowNpcIndex = 1;
local currentSlot = 0;
local startTime = 0;
local stopTime = 0;
local rollingState = false;
local stopRolling = false;
local slotTransforms;
local stopStates = { false, false, false };

local awardsIcon = { "icon015", "icon016", "icon017", "icon018", "icon022", "icon024", "icon025", "icon026", "icon055" };
local lotteryResult = {};
local record = {};
local awardContent;
local sacrificeResultText = {};
local animTime = 2;
local coolDown = 1;
local slotRollOffset = -40;
local slotRollDiff = -3;
local stopReactTime = 0.5;
local stopReactDiff = 0.2;
local autoRoll = false;
local iconPos = Vector3.New(-26, 0, 0);

function UIExpSlotMachine.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;

  gameObject_EXP = uiController:FindGameObject("GameObject_EXP");
  gameObject_Sacrifice = uiController:FindGameObject("GameObject_Sacrifice");

  table.insert(functionGameObject, ESlotMachineKind.EXP, gameObject_EXP);
  table.insert(functionGameObject, ESlotMachineKind.Sacrifice, gameObject_Sacrifice);

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;
  transform_Result = uiController:FindGameObject("Result").transform;

  rawImage_Machine = uiController:FindRawImage("RawImage_Machine");
  rawImage_Drawbar = uiController:FindRawImage("RawImage_Drawbar");
  rawImage_SacrificeEyeBlink = uiController:FindRawImage("RawImage_SacrificeEyeBlink");
  rawImage_SacrificeLever = uiController:FindRawImage("RawImage_SacrificeLever");

  rawImage_Drawbar:SetLoopEndCallBack(this.DrawbarCallBack);
  rawImage_SacrificeLever.shiftCount = 6;
  rawImage_SacrificeLever:SetLoopEndCallBack(this.GetRawImageCallBack(rawImage_SacrificeLever, 6, 5));
  rawImage_SacrificeEyeBlink.shiftCount = 8;
  rawImage_SacrificeEyeBlink:SetLoopEndCallBack(this.GetRawImageCallBack(rawImage_SacrificeEyeBlink, 8, 7));

  transform_AwardSet = uiController:FindGameObject("AwardSet").transform;
  gameObject_AwardSetBG = uiController:FindGameObject("GameObject_AwardSetBG");

  text_Exp = uiController:FindText("Text_Exp");
  text_FollowNpc = uiController:FindText("Text_FollowNpc");
  text_NpcExp = uiController:FindText("Text_T5_ExpValue");
  text_FullExp = uiController:FindText("Text_T5_ExpFullValue");
  text_LvValue = uiController:FindText("Text_LvValue");
  text_Content = uiController:FindText("Text_Content");
  text_Result = uiController:FindText("Text_Result");

  slider_Exp = uiController:FindSlider("Slider_Exp");
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
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
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
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

  event_Stop = uiController:FindEvent("Image_Stop");
  event_Stop:SetListener(EventTriggerType.PointerClick, this.OnClick_Stop);

  local tempEvent;

  tempEvent = uiController:FindEvent("Image_Tenfold");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Tenfold);

  tempEvent = uiController:FindEvent("Image_One");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_One);

  tempEvent = uiController:FindEvent("Image_Left");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Left);

  tempEvent = uiController:FindEvent("Image_Right");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Right);

  tempEvent = uiController:FindEvent("Image_Close");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_CloseResult);

  event_Sacrifice = uiController:FindEvent("Image_NormalButton");
  event_Sacrifice:SetListener(EventTriggerType.PointerClick, this.OnClick_Sacrifice);

  tempEvent = uiController:FindEvent("Image_Auto");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_AutoSwitch);

  tempEvent = uiController:FindEvent("Image_Prev");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ChangeMultiply);
  tempEvent.parameter = -1;

  tempEvent = uiController:FindEvent("Image_Next");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ChangeMultiply);
  tempEvent.parameter = 1;

  scrollContent_Award = uiController:FindScrollContent("ScrollContent_Award");
  scrollContent_Award.onInitialize = this.OnInitialize_ScrollContent_Award;
  scrollContent_Award.onItemChange = this.OnItemChange_ScrollContent_Award;
  scrollContent_Award:Initialize(1);

  scrollContent_Result = uiController:FindScrollContent("ScrollContent_Result");
  scrollContent_Result.onInitialize = this.OnInitialize_ScrollContent_Result;
  scrollContent_Result.onItemChange = this.OnItemChange_ScrollContent_Result;
  scrollContent_Result:Initialize(1);

  for i = 1, 3 do
    currentSlot = i;
    scrollContent_Items[i] = uiController:FindScrollContent(string.Concat("ScrollContent_Item (", i, ")"));
    scrollItems_Items[i] = {};
    scrollContent_Items[i].onInitialize = this.OnInitialize_ScrollContent_Items;
    scrollContent_Items[i].onItemChange = this.GetSlotItemChangeFunction(i);
    scrollContent_Items[i]:Initialize(1);
  end

  text_SacrificeSpend = uiController:FindText("Text_SacrificeSpend");
  text_SacrificeMultiply = uiController:FindText("Text_SacrificeMultiply");
  text_SacrificePoints = uiController:FindText("Text_SacrificePoints");

  gameObject_AwardBG = uiController:FindGameObject("GameObject_AwardBG");
  text_Congrats = uiController:FindText("Text_Congrats");
  text_AwardContent = uiController:FindText("Text_AwardContent");

  gameObject_Prev = uiController:FindGameObject("Image_Prev");
  gameObject_Next = uiController:FindGameObject("Image_Next");

  image_AutoSwitch = uiController:FindImage("Image_Auto");
  image_AutoSwitch.sprite = UI.GetSwitchSprite(false);

end

function UIExpSlotMachine.OnInitialize_ScrollContent_Award(scrollItems)
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
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
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Award[itemIndex] = {};
    scrollItems_Award[itemIndex].items = {}
    for i = 1, 3 do
      scrollItems_Award[itemIndex].items[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")):GetComponent("Image");
    end

    scrollItems_Award[itemIndex].text_Content = scrollItems[itemIndex]:Find("Text_Content"):GetComponent("Text");
  end
end

function UIExpSlotMachine.OnItemChange_ScrollContent_Award(dataIndex, itemIndex)
  local data;
  local content;
  if currentKind == ESlotMachineKind.EXP then
    data = fNpcSlotDatas[dataIndex + 1];
    content = data.exp;
    scrollItems_Award[itemIndex].text_Content.alignment = TextAnchor.MiddleCenter;
  elseif currentKind == ESlotMachineKind.Sacrifice then
    data = sacrificeSlotDatas[dataIndex + 1];
    local award = data:GetAwardText(1);
    if award ~= nil then
      content = award;
    end
    scrollItems_Award[itemIndex].text_Content.alignment = TextAnchor.MiddleLeft;
  end

  for i = 1, 3 do
    scrollItems_Award[itemIndex].items[i].sprite = UI.GetSprite(awardsIcon[data.icons[i]]);
  end

  scrollItems_Award[itemIndex].text_Content.text = content;

  return true;
end

function UIExpSlotMachine.OnInitialize_ScrollContent_Result(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Result[itemIndex] = {};
    scrollItems_Result[itemIndex].items = {};
    for i = 1, 3 do
      scrollItems_Result[itemIndex].items[i] = scrollItems[itemIndex]:Find(string.Concat("Image_Item (", i, ")")):GetComponent("Image");
    end

    scrollItems_Result[itemIndex].text_Content = scrollItems[itemIndex]:Find("Text_Content"):GetComponent("Text");
  end
end

function UIExpSlotMachine.OnItemChange_ScrollContent_Result(dataIndex, itemIndex)
  local content;
  local tempRecord;

  if currentKind == ESlotMachineKind.Sacrifice then
    local sacrificeRecord = Requiem.GetRecord();
    tempRecord = sacrificeRecord[table.Count(sacrificeRecord) - dataIndex];
    if tempRecord == nil then
      return false
    end
    content = tempRecord.awardContent;
    scrollItems_Result[itemIndex].text_Content.alignment = TextAnchor.MiddleLeft;
  elseif currentKind == ESlotMachineKind.EXP then
    tempRecord = record[itemIndex + 1];
    content = tempRecord.exp;
    scrollItems_Result[itemIndex].text_Content.alignment = TextAnchor.MiddleRight;
  end

  for i = 1, 3 do
    scrollItems_Result[itemIndex].items[i].gameObject:SetActive(awardsIcon[tempRecord.icons[i]] ~= nil);
    scrollItems_Result[itemIndex].items[i].sprite = UI.GetSprite(awardsIcon[tempRecord.icons[i]]);
  end

  scrollItems_Result[itemIndex].text_Content.text = content;
  return true;
end

function UIExpSlotMachine.OnInitialize_ScrollContent_Items(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Items[currentSlot][itemIndex] = {};
    scrollItems_Items[currentSlot][itemIndex].items = scrollItems[itemIndex]:Find("Image_Item"):GetComponent("Image");
  end
end

function UIExpSlotMachine.GetSlotItemChangeFunction(slotIndex)
  local resultFunction = function(dataIndex, itemIndex, index)
    if index == nil then
      index = slotIndex;
    end

    dataIndex = math.abs(dataIndex);
    local reactTime = stopReactTime + index * stopReactDiff;
    local count = math.fmod(dataIndex, awardsCount) + 1;
    scrollItems_Items[index][itemIndex].items.sprite = UI.GetSprite(awardsIcon[count]);
    if stopRolling and math.fmod(count + awardsCount - 3, awardsCount) + 1 == lotteryResult[index] and DateTime.Subtract(CGTimer.serverTime, stopTime).TotalSeconds > reactTime then
      stopStates[index] = true;
    end

    return true;
  end
  return resultFunction
end

function UIExpSlotMachine.OnOpen(kind)
  currentKind = kind;
  if currentKind == ESlotMachineKind.EXP then
    TextureManager.SetPng(ETextureUseType.UI, "ExpSlotMachine01", rawImage_Machine);
    TextureManager.SetPng(ETextureUseType.UI, "icon_Pull", rawImage_Drawbar);
    gameObject_AwardSetBG:SetActive(false);
    gameObject_AwardBG:SetActive(false);
    text_Content.text = string.Get(20185);
    text_Result.text = string.Get(21947);
  elseif currentKind == ESlotMachineKind.Sacrifice then
    --local open = Requiem.TryOpen(ERequiemFunctionKind.Sacrifice);
    --if open == false then
    --  return open
    --end
    TextureManager.SetPng(ETextureUseType.UI, "sacrifice01", rawImage_Machine);
    TextureManager.SetPng(ETextureUseType.UI, "sacrifice02", rawImage_SacrificeEyeBlink);
    TextureManager.SetPng(ETextureUseType.UI, "sacrifice03", rawImage_SacrificeLever);
    gameObject_AwardSetBG:SetActive(true);
    text_Content.text = string.Get(23806);
    text_Result.text = string.Get(23807);
  end

  this.SetAutoRoll(false);

  slotTransforms = { scrollContent_Items[1].gameObject.transform, scrollContent_Items[2].gameObject.transform, scrollContent_Items[3].gameObject.transform };

  rawImage_Drawbar.uvRect = Rect.New(0, 0.75, 1, 0.25);
  rawImage_Drawbar:StopShiftUV();

  rawImage_SacrificeEyeBlink.uvRect = Rect.New(0, 7 / 8, 1, 1 / 8);
  rawImage_SacrificeEyeBlink:StopShiftUV();

  rawImage_SacrificeLever.uvRect = Rect.New(0, 0, 1, 1 / 6);
  rawImage_SacrificeLever:StopShiftUV();

  awardsCount = table.Count(awardsIcon);
  this.OnClick_CloseResult();

  for i = 1, table.Count(functionGameObject) do
    functionGameObject[i]:SetActive(i == kind);
  end

  this.UpdateItemsPage();
  this.UpdateAwardPage();

  if kind == ESlotMachineKind.Sacrifice then
    this.UpdateMultiply();
    Requiem.UpdateSacrificePoints();
    this.ShowAwardContent(false);
    return true;
  end

  currentfollowNpcIndex = 1;
  this.GetFollowNpc();
  this.SetFollowNpc(0);
  this.UpdateTotalExp();
  
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
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

  return true;
end

function UIExpSlotMachine.OnVisible(visible)
  if visible then
    if currentKind == ESlotMachineKind.EXP then
      UIFrame.Active(transform_FrameRect, string.Get(21945), this.OnClose, this.OnClick_Help);
    elseif currentKind == ESlotMachineKind.Sacrifice then
      UIFrame.Active(transform_FrameRect, string.Get(23790), this.OnClose, this.OnClick_Help);
    end
  end
end

function UIExpSlotMachine.OnClick_Help(checkShow)
  if checkShow ~= true and currentKind == ESlotMachineKind.EXP then
    UI.Open(UITutorialHint, 53, this);
  end

  if checkShow ~= true and currentKind == ESlotMachineKind.Sacrifice then
    UI.Open(UITutorialHint, 68, this);
  end

  return true;
end

function UIExpSlotMachine.OnClose()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
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
  if rollingState then
    ShowCenterMessage(string.Get(71218));
    return ;
  end

  UI.Close(this);
  return true;
end

function UIExpSlotMachine.OnClick_Tenfold()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
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
  if this.CheckPull() then
    return
  end

  UISell.Launch(38, nil, followNpcName[currentfollowNpcIndex].fIndex, followNpcName[currentfollowNpcIndex].npcId);
end

function UIExpSlotMachine.OnClick_One()
  if this.CheckPull() then
    return
  end

  UISell.Launch(37, nil, followNpcName[currentfollowNpcIndex].fIndex, followNpcName[currentfollowNpcIndex].npcId);
end

function UIExpSlotMachine.CheckPull()
  if rollingState then
    ShowCenterMessage(string.Get(71218));
    return true;
  end

  if followNpcName[currentfollowNpcIndex] == nil then
    ShowCenterMessage(string.Get(80438));
    return true;
  end

  if Role.fightNpc ~= nil then
    --出戰武將不可選取
    if followNpcName[currentfollowNpcIndex].npcId == Role.fightNpc.npcId then
      ShowCenterMessage(string.Get(80434));
      return true;
    end
  end

  if followNpcName[currentfollowNpcIndex].turn >= 2 then
    --二轉武將不可選取
    ShowCenterMessage(string.Get(80435));
    return true;
  end

  if Contains(followNpcName[currentfollowNpcIndex].canGrow, 0, 2) then
    --任務給的NPC不可選取
    ShowCenterMessage(string.Get(80433));
    return true;
  end

  local npcData = npcDatas[followNpcName[currentfollowNpcIndex].npcId];
  if npcData ~= nil and npcData.kind == 53 then
    --養成武將不可選取
    ShowCenterMessage(string.Get(80433));
    return true;
  end

  local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, followNpcName[currentfollowNpcIndex].fIndex);
  local level = followNpc:GetAttribute(EAttribute.Lv);
  if followNpcName[currentfollowNpcIndex].turn <= 1 and level >= 180 then
    --武將等級180以上無法選取
    ShowCenterMessage(string.Get(80432));
    return true;
  end

  return false;
end

function UIExpSlotMachine.OnClick_Left()
  if rollingState then
    ShowCenterMessage(string.Get(71218));
    return ;
  end
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
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

  this.SetFollowNpc(-1);
end

function UIExpSlotMachine.OnClick_Right()
  if rollingState then
    ShowCenterMessage(string.Get(71218));
    return ;
  end

  this.SetFollowNpc(1);
end

function UIExpSlotMachine.OnClick_CloseResult()
  transform_Result.gameObject:SetActive(false);
end

function UIExpSlotMachine.Pull()
  rawImage_Drawbar:ShiftUV(1, 4, 0.1, 0);

  event_Sacrifice.clickScale = false;
  event_Sacrifice:SetColor(Color.LightGray);
  event_Stop.gameObject:SetActive(true);
  startTime = CGTimer.serverTime;
  rollingState = true;
  if currentKind == ESlotMachineKind.Sacrifice then
    this.ShowAwardContent(false);
    rawImage_SacrificeLever:ShiftUV(1, 6, 0.1, 0);
    rawImage_SacrificeEyeBlink:ShiftUV(1, 8, 0.25, 0);
  elseif currentKind == ESlotMachineKind.EXP then
    rawImage_Drawbar:ShiftUV(1, 4, 0.1, 0);
  end

  CGTimer.AddListener(this.Rolling, 0.001);
end

function UIExpSlotMachine.DrawbarCallBack()
  rawImage_Drawbar.enabled = true;
  rawImage_Drawbar.uvRect = Rect.New(0, 0.75, 1, 0.25);
end

function UIExpSlotMachine.GetRawImageCallBack(rawImage, imageCount, default)
  local resultFunction = function()
    local interval = 1 / imageCount;
    rawImage.enabled = true;
    rawImage.uvRect = Rect.New(0, interval * default, 1, interval);
  end
  return resultFunction
end

function UIExpSlotMachine.UpdateAwardPage()
  if currentKind == ESlotMachineKind.EXP then
    scrollContent_Award:Reset(table.Count(fNpcSlotDatas));
  elseif currentKind == ESlotMachineKind.Sacrifice then
    scrollContent_Award:Reset(table.Count(sacrificeSlotDatas));
  end
end

function UIExpSlotMachine.UpdateResultPage()
  if currentKind == ESlotMachineKind.EXP then
    scrollContent_Result:Reset(table.Count(record));
  end
  if currentKind == ESlotMachineKind.Sacrifice then
    scrollContent_Result:Reset(table.Count(Requiem.GetRecord()));
  end
end

function UIExpSlotMachine.UpdateItemsPage()
  for i = 1, 3 do
    currentSlot = i;
    scrollContent_Items[i]:Reset(awardsCount);
  end

  event_Stop.gameObject:SetActive(false);
end

function UIExpSlotMachine.UpdateTotalExp()
  --C:076-005 <拉拉更新彩金>
  Network.Send(76, 5);
end

function UIExpSlotMachine.GetFollowNpc()
  table.Clear(followNpcName);

  local index = 0;
  for i = 1, Role.maxFollowNpc do
    local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, i);

    if followNpc ~= nil then
      index = index + 1;
      followNpcName[index] = { name = followNpc.name,
                               npcId = followNpc.npcId,
                               fIndex = i,
                               canGrow = followNpc.data.canGrow,
                               turn = followNpc:GetAttribute(EAttribute.Turn) };
    end
  end
end

function UIExpSlotMachine.SetFollowNpc(index)
  text_FollowNpc.text = "";
  if followNpcName[currentfollowNpcIndex] == nil then
    return
  end

  if currentfollowNpcIndex + index < 1 then
    currentfollowNpcIndex = table.Count(followNpcName);
  elseif currentfollowNpcIndex + index > table.Count(followNpcName) then
    currentfollowNpcIndex = 1;
  else
    currentfollowNpcIndex = currentfollowNpcIndex + index;
  end

  text_FollowNpc.text = followNpcName[currentfollowNpcIndex].name;

  this.SetExpSlider();
end

function UIExpSlotMachine.OnClick_Stop()
  if stopRolling then
    return
  end
  stopRolling = true;
  stopTime = CGTimer.serverTime;
  event_Stop.clickScale = false;
  
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
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
end

function UIExpSlotMachine.SetStopState(state)
  for i = 1, 3 do
    stopStates[i] = state;
  end
end

function UIExpSlotMachine.Rolling()
  if DateTime.Subtract(CGTimer.serverTime, startTime).TotalSeconds > animTime then
    this.SetStopState(true);
  end

  for i = 1, 3 do
    this.RollSlot(i);
  end

  if stopStates[1] and stopStates[2] and stopStates[3] then
    CGTimer.RemoveListener(this.Rolling);
    this.UpdateResultPage();
    scrollContent_Result:Refresh();
    if currentKind == ESlotMachineKind.Sacrifice then
      this.ShowAwardContent(true);
    end
    transform_Result.gameObject:SetActive(true);
    CGTimer.DoFunctionDelay(coolDown, this.EndRolling);
  end
end

function UIExpSlotMachine.RollSlot(index)
  local yPos;
  if not stopStates[index] then
    yPos = slotTransforms[index].localPosition.y - slotRollOffset + slotRollDiff * index;
  else
    yPos = lotteryResult[index] * 50 - 24;
  end
  slotTransforms[index].localPosition = iconPos + Vector3.New(0, yPos, 0);
end

function UIExpSlotMachine.ReceiveExp(data)
  text_Exp.text = data:ReadInt32();

  this.SetExpSlider();
end

function UIExpSlotMachine.ResetSlider()
  slider_Exp.maxValue = 0;
  slider_Exp.value = 0;
  text_NpcExp.text = "";
  text_FullExp.text = "";
  text_LvValue.text = "";
end

function UIExpSlotMachine.SetExpSlider()
  if followNpcName[currentfollowNpcIndex] == nil then
    this.ResetSlider();
    return ;
  end

  local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, followNpcName[currentfollowNpcIndex].fIndex);

  if followNpc == nil then
    this.ResetSlider();
    return ;
  end

  local turn = followNpc:GetAttribute(EAttribute.Turn);
  local level = followNpc:GetAttribute(EAttribute.Lv);
  local exp = followNpc:GetAttribute(EAttribute.Exp);

  if turn == 2 then
    turn = 1;
  else
    turn = 0;
  end

  if turn >= 3 then
    level = level - Role.playerMaxLv;
    exp = followNpc:GetAttribute(EAttribute.Turn3Exp);
  end

  if level == Role.playerMaxLv then
    slider_Exp.maxValue = 1;
    slider_Exp.value = 1;

    text_NpcExp.text = "100%";
    text_FullExp.text = string.Get(40475);
  else
    slider_Exp.maxValue = Calc.GetUpExp(level + 1, turn);
    slider_Exp.value = exp - Calc.GetNeedTExp(level, turn);

    text_NpcExp.text = string.Concat(math.floor((slider_Exp.value / slider_Exp.maxValue) * 100), "%");
    text_FullExp.text = string.Concat(slider_Exp.value, "/", slider_Exp.maxValue);
  end

  text_LvValue.text = level;
end

function UIExpSlotMachine.OpenLottery(data)
  lotteryResult = {};
  record = {};
  local count = data:ReadByte();
  local maxExp = 0;

  for i = 1, count do
    local award = {};
    award.kind = data:ReadByte();
    award.exp = data:ReadInt32();
    award.icons = {};
    for i = 1, 3 do
      award.icons[i] = data:ReadByte();
    end

    if award.exp >= maxExp then
      for i = 1, 3 do
        lotteryResult[i] = award.icons[i];
      end

      maxExp = award.exp;
    end

    table.insert(record, award);
  end
  this.Pull();
end

function UIExpSlotMachine.OnClick_Sacrifice()
  if rollingState then
    return
  end
  Requiem.Sacrifice();
end

function UIExpSlotMachine.ReceiveSacrifice(result, text)
  if not UI.IsVisible(UIExpSlotMachine) then
    UIExpSlotMachine.ShowAwardContent(true);
    return
  end
  lotteryResult = result.icons;
  awardContent = result.awardContent;
  sacrificeResultText = text;
  this.Pull();
end

function UIExpSlotMachine.OnClick_ChangeMultiply(uiEvent)
  local change;
  if rollingState or autoRoll then
    return
  end
  if uiEvent == nil then
    change = 0;
  else
    change = uiEvent.parameter;
  end

  Requiem.ChangeMultiply(change);
  this.UpdateMultiply();
end

function UIExpSlotMachine.UpdateMultiply()
  local prev, next, outcome = Requiem.GetMultiply();
  gameObject_Prev:SetActive(prev);
  gameObject_Next:SetActive(next);
  text_SacrificeMultiply.text = outcome;
  text_SacrificeSpend.text = outcome;
end

function UIExpSlotMachine.EndRolling()
  rollingState = false;
  this.SetStopState(false);
  stopRolling = false;
  event_Stop.clickScale = true;
  event_Sacrifice:SetColor(Color.White);
  event_Sacrifice.clickScale = false;
  if autoRoll then
    this.OnClick_Sacrifice();
  end
end

function UIExpSlotMachine.OnClick_AutoSwitch(uiEvent)
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
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
  this.SetAutoRoll(uiEvent.parameter);
end

function UIExpSlotMachine.SetAutoRoll(state)
  if state == nil then
    autoRoll = not autoRoll;
  else
    autoRoll = state;
  end
  if rollingState and autoRoll then
    autoRoll = false;
  end
  image_AutoSwitch.sprite = UI.GetSwitchSprite(autoRoll);
end

function UIExpSlotMachine.UpdateSacrificePoints(value)
  if currentKind ~= ESlotMachineKind.Sacrifice then
    return
  end
  text_SacrificePoints.text = string.format(string.Get(23776), value);
end

function UIExpSlotMachine.ShowAwardContent(flag)
  gameObject_AwardBG:SetActive(flag);
  if flag and currentKind == ESlotMachineKind.Sacrifice then
    text_Congrats.text = string.Get(30098);
    text_AwardContent.text = awardContent;
    Requiem.ShowSacrificeMessage(sacrificeResultText);
  else
    text_Congrats.text = "";
    text_AwardContent.text = "";
  end
end

function UIExpSlotMachine.GetCurrentKind()
  return currentKind
end

function UIExpSlotMachine.Sacrificing()
  return UI.IsVisible(this) and currentKind == ESlotMachineKind.Sacrifice
end