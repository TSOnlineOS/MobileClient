EUIJiugongge = {
  Jiugongge = 1,
  Exchange = 2,
}

EUIJiugonggeOpenWay = {
  Jiugongge = 1, --日常按鈕
  Festival = 2, --節慶按鈕
}

UIJiugongge = {}
local this = UIJiugongge;

this.name = "UIJiugongge";
this.uiController = nil;
this.nowId = 1;
this.MaxItem = 5;

--ui
local text_Name;
local text_Time;
local rawImage_Character;
local rawImage_CloudL;
local rawImage_CloudR;

local event_Next;
local event_Previous;
local event_Close;
local event_Help;
local text_AllAward;
local event_Reset;
local gameObject_Jiugongge;
local gameObject_Exchange;

local image_Jiugongge = {};
local text_Jiugongge = {};
local text_Schedule = {};
local event_Jiugongge = {};
local image_LineRight = {};
local image_LineDown = {};

local image_Award = {};
local animator_Award = {};
local rawImage_Award = {};

local scrollContent_Exchange;
local scrollItems_Exchange = {};
local loginAward = {};

local jiugonggeSet = {};
local awardSet = {};
local grid;
local kinds;
local currentOpenWay;
local currentKind;
local functionKind;
local activityId;
local jiugonggeLineColor = {connected = LuaHelper.GetColor(90, 86, 170, 255), unconnected = LuaHelper.GetColor(223, 231, 234, 255)};
local image_BgGradientColor;

function UIJiugongge.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  this.uiController.onVisible = this.OnVisible;

  text_Name = uiController:FindText("Text_Name"):GetComponent("Text");
  text_Time = uiController:FindText("Text_Time"):GetComponent("Text");
  rawImage_Character = uiController:FindRawImage("RawImage_Character"):GetComponent("RawImage");
  event_Next = uiController:FindEvent("Image_Next");
  event_Next:SetListener(EventTriggerType.PointerClick, this.OnClick_Next);
  event_Previous = uiController:FindEvent("Image_Previous");
  event_Previous:SetListener(EventTriggerType.PointerClick, this.OnClick_Previous);
  event_Close = uiController:FindEvent("Image_Close");
  event_Close:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);
  event_Help = uiController:FindEvent("Image_Help");
  event_Help:SetListener(EventTriggerType.PointerClick, this.OnClick_Help);
  event_Reset = uiController:FindEvent("Image_Reset");
  event_Reset:SetListener(EventTriggerType.PointerClick, this.OnClick_AllReset);
  gameObject_Jiugongge = uiController:FindGameObject("Jiugongge");
  gameObject_Exchange = uiController:FindGameObject("Exchange");
  
  image_BgGradientColor = uiController:FindGameObject("Image_BG"):GetComponent("GradientColor");

  text_AllAward = uiController:FindText("Text_AllAward"):GetComponent("Text");
  
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

  for i = 1, 9 do
    image_Jiugongge[i] = uiController:FindImage(string.Concat("Image_Jiugongge (", i, ")")):GetComponent("Image");
    text_Jiugongge[i] = uiController:FindText(string.Concat("Text_Jiugongge (", i, ")")):GetComponent("Text");
    text_Schedule[i] = uiController:FindText(string.Concat("Text_Schedule (", i, ")")):GetComponent("Text");
    event_Jiugongge[i] = uiController:FindEvent(string.Concat("Image_Jiugongge (", i, ")"));
    event_Jiugongge[i]:SetListener(EventTriggerType.PointerClick, this.OnClick_SingleReset);
    event_Jiugongge[i].parameter = i;
    image_LineRight[i] = uiController:FindImage(string.Concat("Image_LineRight (", i, ")")):GetComponent("Image");
    image_LineDown[i] = uiController:FindImage(string.Concat("Image_LineDown (", i, ")")):GetComponent("Image");
  end  

  for i = 1, 7 do
    rawImage_Award[i] = uiController:FindRawImage(string.Concat("RawImage_Award (", i, ")")):GetComponent("RawImage");
    image_Award[i] = uiController:FindImage(string.Concat("Image_Award (", i, ")")):GetComponent("Image");
    animator_Award[i] = image_Award[i].gameObject:GetComponent("Animator")
    image_Award[i].sprite = UI.GetSprite("bod056");
    awardSet[i] = {}
    awardSet[i].item = UIItemController.New(image_Award[i].gameObject.transform, this.OnClick_GetAward, i);
  end

  rawImage_CloudL = uiController:FindRawImage("RawImage_Cloud (1)"):GetComponent("RawImage");
  rawImage_CloudR = uiController:FindRawImage("RawImage_Cloud (2)"):GetComponent("RawImage");

  scrollContent_Exchange = uiController:FindScrollContent("ScrollContent_Exchange");
  scrollContent_Exchange.onInitialize = this.OnInitialize_ScrollContent_Exchange;
  scrollContent_Exchange.onItemChange = this.OnItemChange_ScrollContent_Exchange;
  scrollContent_Exchange:Initialize(1);
end

function UIJiugongge.OnInitialize_ScrollContent_Exchange(scrollItems)
  
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Exchange[itemIndex] = {};
    scrollItems_Exchange[itemIndex].itemChip = {};
    scrollItems_Exchange[itemIndex].text_Demand = {};
    scrollItems_Exchange[itemIndex].text_Schedule = scrollItems[itemIndex]:Find("Text_Schedule"):GetComponent("Text");
    scrollItems_Exchange[itemIndex].text_ChangeKind = scrollItems[itemIndex]:Find("Text_ChangeKind"):GetComponent("Text");

    for i = 1, this.MaxItem do
      scrollItems_Exchange[itemIndex].itemChip[i] = UIItemController.New(scrollItems[itemIndex]:Find(string.Concat("Image_ItemChip (", i, ")")));
      scrollItems_Exchange[itemIndex].text_Demand[i] = scrollItems[itemIndex]:Find(string.Concat("Image_ItemChip (", i, ")")).transform:Find("Text_Demand"):GetComponent("Text");
    end

    scrollItems_Exchange[itemIndex].itemAward = UIItemController.New(scrollItems[itemIndex]:Find("Image_ItemAward"));
    scrollItems_Exchange[itemIndex].itemAwardName = scrollItems[itemIndex]:Find("Image_ItemAward").transform:Find("Text_ItemName"):GetComponent("Text");
    scrollItems_Exchange[itemIndex].getEvent = scrollItems[itemIndex]:Find("Image_Exchange"):GetComponent("UIEvent");
    scrollItems_Exchange[itemIndex].getEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Change);
  end
end

function UIJiugongge.OnItemChange_ScrollContent_Exchange(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local bagItemCount, demand;
  local simpleItemCount = 0;
  local simpleDemand = 0;
  local itemData, itemId;
  local bag = Item.GetBag(EThings.Bag);

  for i = 1, this.MaxItem do
    itemId = loginAward[index].itemId[i];
    itemData = itemDatas[itemId];
    bagItemCount = 0;
    
    if itemId > 0 then
      scrollItems_Exchange[itemIndex].itemChip[i].transform.parent.gameObject:SetActive(true);
      scrollItems_Exchange[itemIndex].itemChip[i]:SetItem(itemId, 0);
      scrollItems_Exchange[itemIndex].itemChip[i]:SetEvent(this.OnClick_ItemInfo, itemId);

      demand = loginAward[index].quant[i];

      if itemData ~= nil and itemData:IsRoleCountException() then
        bagItemCount = RoleCount.Get(itemData.roleCountIndex);
        simpleItemCount = bagItemCount;
        demand = itemData.roleCountValue * loginAward[index].quant[i];
      else
        if itemId == 65301 then
          bagItemCount = Role.GetPoint();
          simpleItemCount = Item.GetSimpleValue(bagItemCount, true);
        elseif itemId == 65351 then
          bagItemCount = Role.GetPlayerGold();
          simpleItemCount = Item.GetSimpleValue(bagItemCount, true);
        else
          simpleItemCount = 0;
          bagItemCount = 0;

          if bag ~= nil then
            for k, bagInfo in pairs(bag) do
              if bagInfo ~= nil and bagInfo.Id == itemId and bagInfo.quant > 0 then
                bagItemCount = bagItemCount + bagInfo.quant;
                simpleItemCount = bagItemCount;
              end
            end
          end
        end
        demand = loginAward[index].quant[i];
      end

      simpleDemand = demand;
      
      if bagItemCount >= demand then
        scrollItems_Exchange[itemIndex].text_Demand[i].text = string.GetColorText(string.Concat(simpleItemCount, string.Get(30120), simpleDemand), Color.Black);
      else
        scrollItems_Exchange[itemIndex].text_Demand[i].text = string.GetColorText(string.Concat(simpleItemCount, string.Get(30120), simpleDemand), Color.Red);
      end
    else
      scrollItems_Exchange[itemIndex].itemChip[i].transform.parent.gameObject:SetActive(false);
      scrollItems_Exchange[itemIndex].text_Demand[i].text = "";
    end
  end

  local roleCount = RoleCount.Get(loginAward[index].roleCount);
  local limit = loginAward[index].flag;
  if limit > 0 then
    scrollItems_Exchange[itemIndex].text_Schedule.text = string.format(string.Get(21509), roleCount, limit);
  else
    scrollItems_Exchange[itemIndex].text_Schedule.text = "";
  end

  if loginAward[index].changeKind == 1 then
    scrollItems_Exchange[itemIndex].text_ChangeKind.text = string.Get(23191);
  else
    scrollItems_Exchange[itemIndex].text_ChangeKind.text = "";
  end

  scrollItems_Exchange[itemIndex].itemAward:SetItem(loginAward[index].changeItemId, loginAward[index].changeQuant);
  scrollItems_Exchange[itemIndex].itemAwardName.text = itemDatas[loginAward[index].changeItemId]:GetName(true);
  scrollItems_Exchange[itemIndex].itemAward:SetEvent(this.OnClick_ItemInfo, loginAward[index].changeItemId);
  scrollItems_Exchange[itemIndex].getEvent.parameter = index;

  return true;
end

function UIJiugongge.UpdateExchangePage()
  event_Previous.gameObject:SetActive(false);
  event_Next.gameObject:SetActive(false);
  if not CGTimer.ContainsListener(this.UpdateTime) then 
    CGTimer.AddListener(this.UpdateTime, 1);
  end

  scrollContent_Exchange:Reset(table.Count(loginAward));
end

function UIJiugongge.RefreshExchangePage()
  scrollContent_Exchange:Refresh();
end

function UIJiugongge.OnOpen(openWay, festivaldata)
  --開介面時先去要一次Sever時間校正
  Network.Send(1, 16);
  currentOpenWay = openWay
  this.UpdateFunction(openWay, festivaldata)

  return true;
end

function UIJiugongge.OnClick_Help()
  
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  UI.Open(UITutorialHint, 27, this);
end

function UIJiugongge.OnClick_Close()
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  UI.Close(this);

  return true;
end

function UIJiugongge.OnClose()
  CGTimer.RemoveListener(this.UpdateTime);

  return true;
end

function UIJiugongge.OnClick_Next()
  currentKind = currentKind + 1;
  CGTimer.RemoveListener(this.UpdateTime);

  this.ChangeGrid(kinds[currentKind]);
end

function UIJiugongge.OnClick_Previous()
  currentKind = currentKind - 1;
  CGTimer.RemoveListener(this.UpdateTime);

  this.ChangeGrid(kinds[currentKind]);
  
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
end

--換盤面
function UIJiugongge.ChangeGrid(index)
  if table.Count(kinds) == 1 or table.Count(kinds) == 0 or index == EJiugongge.Festival then
    event_Previous.gameObject:SetActive(false);
    event_Next.gameObject:SetActive(false);
  elseif currentKind == 1 then
    event_Previous.gameObject:SetActive(false);
    event_Next.gameObject:SetActive(true);
  elseif currentKind == table.Count(kinds) then
    event_Previous.gameObject:SetActive(true);
    event_Next.gameObject:SetActive(false);
  else
    event_Previous.gameObject:SetActive(true);
    event_Next.gameObject:SetActive(true);
  end

  if Jiugongge.gridKind[index] ~= nil then
    this.nowId = Jiugongge.gridKind[index].Id;

    if Jiugongge.gridKind[index].kindCount == 1 or index == 1 then
      text_Name.text = Jiugongge.gridKind[index].name;
    else
      text_Name.text = string.Concat(Jiugongge.gridKind[index].name, Jiugongge.gridKind[index].difficulty, "/", Jiugongge.gridKind[index].kindCount);
    end
    activityId = Jiugongge.gridKind[index].activityId
    this.SetJiugongge();

    if not CGTimer.ContainsListener(this.UpdateTime) then 
      CGTimer.AddListener(this.UpdateTime, 1);
    end
  else
   this.InvaildSet();
  end
end

function UIJiugongge.UpdateUI()
  for i = 1, 9 do
    this.SetLineUnconnected(i);
    this.UpdateJiugonggeSprite(i);
  end

  for i = 1, 7 do
    this.UpdateJiugonggeAwardSprite(i);
  end

  this.UpdatePassCount();

  TextureManager.SetPng(ETextureUseType.UI, "common0_bod102",  rawImage_CloudL);
  TextureManager.SetPng(ETextureUseType.UI, "common0_bod102",  rawImage_CloudR);
  return true;
end

--計算連線數量
function UIJiugongge.UpdatePassCount()
  local passCount = 0;
  for i = 1, 6 do 
    if awardSet.awards[i].canGetAward > 0 then
      passCount = passCount + 1;
    end
  end

  text_AllAward.text = string.Concat(string.Get(21429), "  ",passCount, "/", 6);
  
  Jiugongge.SetJiugonggeAllAwardState(awardSet.awards[7], passCount);
  this.UpdateJiugonggeAwardSprite(7);
end

function UIJiugongge.UpdateTime()
  if functionKind == EUIJiugongge.Jiugongge then
    if currentKind == 2 then
      text_Time.text = ""
      return
    end

    if DateTime.Compare(CGTimer.serverTime, activityTimes[activityId][1].serverStartTime) < 0 then
      this.InvaildSet();
    elseif DateTime.Compare(CGTimer.serverTime, activityTimes[activityId][1].serverCloseTime) < 0 then
      text_Time.text = string.Concat(string.Get(80098), string.GetSecondText(math.ceil(DateTime.Subtract(activityTimes[activityId][1].serverCloseTime, CGTimer.serverTime).TotalSeconds)));
    else
      this.InvaildSet();
    end
  elseif functionKind == EUIJiugongge.Exchange then
    if DateTime.Compare(CGTimer.serverTime, activityTimes[activityId][1].serverStartTime) < 0 then
      text_Time.text = string.Get(20376);
    elseif DateTime.Compare(CGTimer.serverTime, activityTimes[activityId][1].serverCloseTime) < 0 then
      text_Time.text = string.Concat(string.Get(80098), string.GetSecondText(math.ceil(DateTime.Subtract(activityTimes[activityId][1].serverCloseTime, CGTimer.serverTime).TotalSeconds)));
    else
      text_Time.text = string.Get(20377);
    end
  end
end

function UIJiugongge.OnClick_Help()
  UI.Open(UITutorialHint, 27, this);
  
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  
end

--設置盤面資訊
function UIJiugongge.SetJiugongge()
  grid = Jiugongge.GetJiugonggeGrid(this.nowId);
  jiugonggeSet = grid.missions;
  awardSet.awards = grid.awards;

  for i = 1, 7 do
    awardSet[i].item:SetItem(awardSet.awards[i].Id, awardSet.awards[i].quant);
  end

  --C:91-2 完成任務 數量(1) + <<ID(2)+ 索引(1) +任務ID(2)>>
  sendBuffer:Clear()
  sendBuffer:WriteByte(9);
  for i = 1, 9 do
    sendBuffer:WriteUInt16(this.nowId);
    sendBuffer:WriteByte(i);
    sendBuffer:WriteUInt16(jiugonggeSet[i].Id);
  end
   Network.Send(91, 2, sendBuffer);
  
  if grid.reset == 1 then
    event_Reset.gameObject:SetActive(true);
  else
    event_Reset.gameObject:SetActive(false);
  end

  Jiugongge.UpdateState(this.nowId);
end

--單格重置
function UIJiugongge.OnClick_SingleReset(uiEvent)
  if grid == nil then return end
  if grid.reset == 0 then return end
  if not jiugonggeSet[uiEvent.parameter].isCompleted then
    UISell.Launch(27, nil, this.nowId, uiEvent.parameter, jiugonggeSet[uiEvent.parameter].Id);
  end
end

--盤面重置
function UIJiugongge.OnClick_AllReset()
  if grid == nil then return end
  UISell.Launch(26, nil, this.nowId);
  
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
end

--領獎
function UIJiugongge.OnClick_GetAward(uiEvent)
  if uiEvent.parameter == 7 and awardSet.awards[7].canGetAward == 1 then
    for i = 1, 6 do 
      if awardSet.awards[i].canGetAward ~= 2 then
        ShowCenterMessage(string.Get(21291));
        return
      end
    end
  end

  if awardSet.awards[uiEvent.parameter].canGetAward == 1 then
    this.SendGetAward(uiEvent.parameter, jiugonggeSet[uiEvent.parameter].Id)
  else
    this.ShowAwardInfo(Jiugongge.grid[this.nowId].awards[uiEvent.parameter].Id);
  end
end

function UIJiugongge.ShowAwardInfo(itemId)
  UIItemInfo.Show(itemId);
end

function UIJiugongge.OnClick_ItemInfo(uiEvent)
  UIItemInfo.Show(uiEvent.parameter);
end

function UIJiugongge.SendGetAward(index, Id)
  --C:91-3 領取獎勵 九宮格ID(2)+ 索引(1)[1.橫一, 2.橫二, 3.橫三, 4.直一, 5.直二, 6.直三, 7.全部] +任務ID(2)
  sendBuffer:Clear()
  sendBuffer:WriteUInt16(this.nowId);
  sendBuffer:WriteByte(index);
  sendBuffer:WriteUInt16(Id);
  Network.Send(91, 3, sendBuffer);
  
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
end

function UIJiugongge.UpdateJiugonggeSprite(index)
  text_Jiugongge[index].text = string.Get(jiugonggeSet[index].description);
  if jiugonggeSet[index].isCompleted then
    text_Jiugongge[index].color = LuaHelper.GetColor(55, 51, 110, 255);--完成任務
    image_Jiugongge[index].sprite = UI.GetSprite("bod072");
    text_Schedule[index].text = string.Concat(jiugonggeSet[index].conditions.value, " / ", jiugonggeSet[index].conditions.value);
    text_Schedule[index].color = LuaHelper.GetColor(55, 51, 110, 255);
    this.SetLineConnected(index);
  else
    text_Jiugongge[index].color = LuaHelper.GetColor(120, 150, 160, 255);
    image_Jiugongge[index].sprite = UI.GetSprite("bod071");
    text_Schedule[index].text = jiugonggeSet[index]:GetPogress();
    text_Schedule[index].color = LuaHelper.GetColor(120, 150, 160, 255);
  end
end

function UIJiugongge.UpdateJiugonggeAwardSprite(index)
  local state = awardSet.awards[index].canGetAward;

  if state == 2 then
    rawImage_Award[index].color = jiugonggeLineColor.connected;--已領取
    animator_Award[index].enabled = false
    image_Award[index].gameObject:SetActive(false);
  elseif state == 1 then
    rawImage_Award[index].color = jiugonggeLineColor.connected;--可領取
    animator_Award[index].enabled = true
    image_Award[index].gameObject:SetActive(true);
  elseif state == 0 then
    rawImage_Award[index].color = jiugonggeLineColor.unconnected;--未連線
    animator_Award[index].enabled = false
    image_Award[index].gameObject:SetActive(true);
    image_Award[index].color = LuaHelper.GetColor(255, 255, 255, 255);
  end
end

--連線顯示
function UIJiugongge.SetLineConnected(index)
  --raw
  local raw = math.floor((index - 1) / 3) + 1;
  local isSameRaw =  math.floor((index - 2) / 3) + 1;

  if raw == isSameRaw then
    image_LineRight[index - 1].color = jiugonggeLineColor.connected;
  end
  image_LineRight[index].color = jiugonggeLineColor.connected;

  --column
  local column = math.fmod(index - 1, 3) + 1;

  if column ~= index then
    image_LineDown[index - 3].color = jiugonggeLineColor.connected;
  end
  image_LineDown[index].color = jiugonggeLineColor.connected;
  
end

--清除連線
function UIJiugongge.SetLineUnconnected(index)
  image_LineRight[index].color = jiugonggeLineColor.unconnected;
  image_LineDown[index].color = jiugonggeLineColor.unconnected;
end

--無效盤面設置
function UIJiugongge.InvaildSet()

  if currentKind ~= 1 and currentOpenWay == EUIJiugonggeOpenWay.Jiugongge then
    Jiugongge.gridKind[kinds[currentKind]] = nil
    Jiugongge.CheckMainFunctionRedDot()
    kinds = Jiugongge.GetKinds();
    currentKind = 1;
    this.ChangeGrid(kinds[currentKind]);
    return
  elseif currentOpenWay == EUIJiugonggeOpenWay.Festival then
    UI.Close(this);
    return
  end
  
  if UI.IsVisible(UIJiugongge) then
    ShowCenterMessage(string.Get(24076));
  end

  for i = 1, 9 do
    text_Jiugongge[i].text = "";
    text_Schedule[i].text = "";
    image_Jiugongge[i].sprite = UI.GetSprite("bod071");
    this.SetLineUnconnected(i);
  end

  for i = 1, 7 do 
    rawImage_Award[i].color = jiugonggeLineColor.unconnected;
    image_Award[i].gameObject:SetActive(true);
    awardSet[i].item:SetItem(0);
  end

  CGTimer.RemoveListener(this.UpdateTime);
  grid = nil;
  text_AllAward.text = "";
  text_Time.text = string.Get(20377);
  text_Name.text = "";
  event_Reset.gameObject:SetActive(false);
end

function UIJiugongge.UpdateFunction(openWay, festivaldata)
  gameObject_Jiugongge:SetActive(true)
  gameObject_Exchange:SetActive(false)
  event_Help.gameObject:SetActive(true)
  image_BgGradientColor.enabled = false;

  for i = 1, 7 do
    TextureManager.SetPng(ETextureUseType.UI, "common0_com075",  rawImage_Award[i]);
  end

  if openWay == EUIJiugonggeOpenWay.Jiugongge then
    TextureManager.SetPng(ETextureUseType.UI, "common0_bod103",  rawImage_Character);
    rawImage_Character.gameObject:GetComponent("RectTransform").sizeDelta = Vector3.New(390, 520);
    rawImage_Character.gameObject:GetComponent("RectTransform").localPosition = Vector2.New(-320, 2);
    kinds = Jiugongge.GetKinds();
    functionKind = EUIJiugongge.Jiugongge
    currentKind = this.GetHaveAwardGrid();
    this.ChangeGrid(kinds[currentKind]);
  elseif openWay == EUIJiugonggeOpenWay.Festival then
    TextureManager.SetPng(ETextureUseType.UI, string.Concat("pic_", string.format("%03d", festivaldata.rolePicture)),  rawImage_Character);
    rawImage_Character.gameObject:GetComponent("RectTransform").sizeDelta = Vector3.New(festivaldata.roleW, festivaldata.roleH);
    rawImage_Character.gameObject:GetComponent("RectTransform").localPosition = Vector2.New(festivaldata.roleX, festivaldata.roleY);

    image_BgGradientColor.enabled = true;
    image_BgGradientColor.colorTop = LuaHelper.GetColor( festivaldata.topR, festivaldata.topG, festivaldata.topB, 255 );
    image_BgGradientColor.colorBottom = LuaHelper.GetColor( festivaldata.bottomR, festivaldata.bottomG, festivaldata.bottomB, 255 );

    functionKind = festivaldata.functionkind;
    activityId = festivaldata.activityId;
    currentKind = festivaldata.kind;
  
    ---2--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local area =  DemoCode.CalTriangleArea(100, 100)
      area = area * 1 + 2;
      if area > DemoCode.GetBitxor(20) then  --test avg
        local avg = DemoCode.CalAvg(10, 20, 30);
      end
    end
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------

    if functionKind == EUIJiugongge.Jiugongge then
    --持有的盤面種類
      this.ChangeGrid(currentKind);
    elseif functionKind == EUIJiugongge.Exchange then
      gameObject_Jiugongge:SetActive(false)
      gameObject_Exchange:SetActive(true)
      event_Help.gameObject:SetActive(false)
      this.SetJiugongge()
      this.GetExchangeAward(currentKind)
      this.UpdateExchangePage()
      text_Name.text = string.Get(festivaldata.title)
    end
  end
end

function UIJiugongge.GetExchangeAward(kind)
  loginAward = {} 
  local count = 1
  for k, v in pairs(loginAwardDatas) do
    if v.group == kind then
      loginAward[count] = {};
      loginAward[count] = v;
      loginAward[count].sort = count;
      count = count + 1
    end
  end

--  this.SortLoginAward()
end

function UIJiugongge.SortLoginAward()
  local limit;
  local fresh = false;

  if loginAward == nil then return fresh end

  for k, v in pairs(loginAward) do
    limit = v.flag;
    if limit > 0 then
      if not this.CheckChangeItem(k) and RoleCount.Get(v.roleCount) < limit then
        v.sort = ESortOrder.Available;
        fresh = true;
      elseif v.flag > 0 and RoleCount.Get(v.roleCount) >= limit then
        v.sort = ESortOrder.Complete;
      else
        v.sort = ESortOrder.Processing;
      end
    else
      if not this.CheckChangeItem(k) then
        v.sort = ESortOrder.Available;
        fresh = true;
      else
        v.sort = ESortOrder.Processing;
      end
    end
  end

--  table.sort(loginAward, UILoginAward.Sort);
  return fresh
end

function UIJiugongge.OnClick_Change(uiEvent)
  local index = uiEvent.parameter;

  local checkChange, count = this.CheckChangeItem(index);
  if checkChange then
    ShowCenterMessage(string.Get(20702));
    return;
  end
  
  
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  
  if loginAward[index].flag > 0 and RoleCount.Get(loginAward[index].roleCount) >= loginAward[index].flag then
    ShowCenterMessage(string.Get(20729));
    return;
  end
  
  if loginAward[index].flag > 0 then
    count = math.min(count, loginAward[index].flag - RoleCount.Get(loginAward[index].roleCount));
  end

  UILoginAward.SendGetAward(EAward.Festival, loginAward[index].day, count);
end

function UIJiugongge.CheckChangeItem(index)
  local itemCount, demand;
  local result = false;

  local award = loginAward[index];

  if award == nil then return false end

  local itemData;
  local changeCount = -1;
  local bag = Item.GetBag(EThings.Bag);
  for i = 1, UILoginAward.MaxItem do
    itemData = itemDatas[award.itemId[i]];
    itemCount = 0;

    if itemData ~= nil and award.itemId[i] > 0 then
      if itemData:IsRoleCountException() then
        itemCount = RoleCount.Get(itemData.roleCountIndex);
        demand = itemData.roleCountValue * award.quant[i];
      else
        if award.itemId[i] == 65301 then
          itemCount = Role.GetPoint();
        elseif award.itemId[i] == 65351 then
          itemCount = Role.GetPlayerGold();
        else
          for k, bagInfo in pairs(bag) do
            if bagInfo ~= nil and bagInfo.Id == award.itemId[i] and bagInfo.quant > 0 then
              itemCount = itemCount + bagInfo.quant;
            end
          end
        end
        
        demand = award.quant[i];
      end

      if changeCount < 0 then
        changeCount = math.floor(itemCount / demand);
      else
        changeCount = math.min(math.floor(itemCount / demand), changeCount);
      end

      if itemCount < demand then
        result = true;
        break;
      end
    end
  end

  return result, changeCount;
end

function UIJiugongge.CheckConvertItem(itemId, kind)
  this.GetExchangeAward(kind)

  if loginAward == nil then return false end

  for k, v in pairs(loginAward) do
    if itemId == v.itemId[1] then
      return true;
    end
  end

  return false;
end

function UIJiugongge.GetHaveAwardGrid()
  for k, v in pairs(kinds) do 
    for kk, vv in pairs(Jiugongge.grid[Jiugongge.gridKind[v].Id].awards) do 
      if vv.canGetAward == 1 then
        return k
      end
    end
  end

  return 1
end