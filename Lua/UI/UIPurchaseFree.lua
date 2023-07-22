UIPurchaseFree = {};
local this = UIPurchaseFree;

this.name = "UIPurchaseFree";
this.uiController = nil;

local gameObject_Info;
local gameObject_Outcome;
local text_Time;
local text_Content;
local text_LeftCount;
local text_Quota;
local text_PostScript;
local text_Outcome;
local event_Close;
local event_OutcomeClose;
local text_Purchase;
local event_Mask;
local rawImage_Used;
local image_LeftCount;
local image_Quota;
local leftCount;
local amount; 
local threshold;
local probability;
local showProb;
local showPrivilege;
local quota;
local maxQuota;
local leftTime;
local eventOpen = false;

function UIPurchaseFree.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  this.uiController.onVisible = this.OnVisible;
  this.InitializePage(uiController);
end

function UIPurchaseFree.InitializePage(uiController)
  gameObject_Info = uiController:FindGameObject("Image_Info");
  gameObject_Outcome = uiController:FindGameObject("Image_Outcome");

  text_Time = uiController:FindText("Text_Time");
  text_Content = uiController:FindText("Text_Content");
  text_LeftCount = uiController:FindText("Text_LeftCount");
  text_Quota = uiController:FindText("Text_Quota");
  text_PostScript = uiController:FindText("Text_PostScript");
  text_Outcome = uiController:FindText("Text_Outcome");
  text_Purchase = uiController:FindText("Text_Purchase");

  image_LeftCount = uiController:FindImage("Image_LeftCount");
  image_Quota = uiController:FindImage("Image_Quota");

  -- 初始化按鈕事件
  event_Mask = uiController:FindEvent("Image_Mask");
  event_Mask:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);  
  event_Close = uiController:FindEvent("Image_Close");
  event_Close:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);  
  event_OutcomeClose = uiController:FindEvent("Image_OutcomeClose");
  event_OutcomeClose:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);  

  rawImage_Used = uiController:FindRawImage("RawImage_Used");
  TextureManager.SetPng(ETextureUseType.UI, "common0_com018", rawImage_Used); 

  local str = string.split(string.Get(22991), "\n");
  text_Purchase.text = string.Concat(string.GetColorText(str[1], Color.Red), "\n", str[2], "\n", str[3]);

  gameObject_Info:SetActive(true);
  gameObject_Outcome:SetActive(false);
end

function UIPurchaseFree.OnOpen()
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  this.UpdateData();
  RedDot.Remove(ERedDot.PurchaseFree);
  if not CGTimer.ContainsListener(this.UpdateActivityTimer) then 
    CGTimer.AddListener(this.UpdateActivityTimer, 1);
  end  
  return true;
end

function UIPurchaseFree.OnVisible(visible)
end

function UIPurchaseFree.OnClick_Close()
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  gameObject_Info:SetActive(true);
  gameObject_Outcome:SetActive(false);
  CGTimer.RemoveListener(this.UpdateActivityTimer);
  UI.Close(UIPurchaseFree);
end

function UIPurchaseFree.UpdateActivityTimer()
  if DateTime.Compare(CGTimer.serverTime, leftTime) < 0 then 
    text_Time.text = string.Concat(string.Get(20644), string.GetSecondText(math.ceil(DateTime.Subtract(leftTime, CGTimer.serverTime).TotalSeconds)));  
  else
    text_Time.text = string.Get(20644);
    CGTimer.RemoveListener(this.UpdateActivityTimer);
  end
end

function UIPurchaseFree.ReceiveData(data)
  --<限時免單> 可免單次數(4) + 總免單額度(4) + 免單觸發金額(4) + 免單觸發機率(4) + 免單金額觸發額度(4) + 免單金額上限(4) + 結束時間(8)
  leftCount = data:ReadUInt32();
  amount = data:ReadUInt32();
  threshold = data:ReadUInt32();
  probability = data:ReadUInt32(); 
  showProb = data:ReadBoolean();
  showPrivilege = data:ReadBoolean();
  quota = data:ReadUInt32();
  maxQuota = data:ReadUInt32();
  leftTime = DateTime.FromOADate(data:ReadDouble());
  eventOpen = true;
  RedDot.Add(ERedDot.PurchaseFree);
  Function.UpdateVisible();
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
end

function UIPurchaseFree.UpdateData()
  if (leftCount - RoleCount.Get(ERoleCount.PurchaseFreeCount) > 0) and (amount - RoleCount.Get(ERoleCount.PurchaseFreeQuota) > 0) then
    text_LeftCount.text = string.format(string.Get(22986), leftCount- RoleCount.Get(ERoleCount.PurchaseFreeCount));
    LuaHelper.SetColor(image_LeftCount, Color.PurchaseFreeBlue);
    text_Quota.text = string.format(string.Get(22988), amount - RoleCount.Get(ERoleCount.PurchaseFreeQuota));
    LuaHelper.SetColor(image_Quota, Color.PurchaseFreeBlue);
  else
    text_LeftCount.text = string.Get(22987);
    LuaHelper.SetColor(image_LeftCount, Color.Gray);
    text_Quota.text = string.Get(22987);
    LuaHelper.SetColor(image_Quota, Color.Gray);
  end
  local prob;
  if showProb then
    prob = string.Concat(tostring(probability), "%");
  else 
    prob = "";
  end
  text_Content.text = string.format(string.Get(22985), threshold, prob, leftCount, amount);
  if showPrivilege then
    text_PostScript.text = string.format(string.Get(22989), quota, maxQuota, RoleCount.Get(ERoleCount.PurchaseFreeAmount));
  else 
    text_PostScript.text = "";
  end
  rawImage_Used.gameObject:SetActive(showPrivilege and BitFlag.Get(7279));
end

function UIPurchaseFree.CloseEvent(data)
  eventOpen = false;
  Function.UpdateVisible();
  if UI.IsVisible(UIPurchaseFree) then
    UI.Close(UIPurchaseFree);
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
      for i = 1, 3 do
        DemoCode.SetColorNum(i);
      end
      local area =  DemoCode.CalTriangleArea(1, 1);
      local currentOptio = area;
      local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
  end
end

function UIPurchaseFree.ReceiveOutcome(data)
  --<限時免單該筆交易免費資訊> 免單金額(4) + 應消費金額(4) + 實際消費金額
  UI.Open(UIPurchaseFree);
  gameObject_Info:SetActive(false);
  gameObject_Outcome:SetActive(true);
  local current = data:ReadInt32();
  local original = data:ReadInt32();
  local real = data:ReadInt32();
  local str = string.split(string.Get(22991), "\n");
  local s1 = string.GetColorText(string.format(str[1], current), Color.Red);
  local s2 = string.format(str[2], original);
  local s3 = string.format(str[3], real);
  text_Purchase.text = string.Concat(s1, "\n", s2, "\n", s3);
end

function UIPurchaseFree.CheckPurchaseFreeMax()
  if eventOpen and showPrivilege and (RoleCount.Get(ERoleCount.PurchaseFreeAmount) >= quota) and (not BitFlag.Get(7279)) then
    return true;
  else
    return false;
  end
end

function UIPurchaseFree.GetPurchaseFreeString()
 return string.format(string.Get(22992), maxQuota, leftTime:ToString("yyyy/MM/dd HH:mm"));
end

function UIPurchaseFree.GetActivityOpen()
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  return eventOpen;
end

function UIPurchaseFree.IsMoneyEnough(sellData, count)
  if maxQuota <= sellData.saleCredit*count then
    if Role.CheckCurrency(sellData.currencyKind, maxQuota - sellData.saleCredit*count) then
      return true;
    else
      return false;
    end
  else
    return false;
  end
end