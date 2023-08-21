RewardItem = {};
function RewardItem.New(title, itemId, iconId, content)
  local self = {};
  setmetatable(self, RewardItem);
  self.title = title;
  self.itemId = itemId;
  self.iconId = iconId;
  self.content = content;
  return self;
end

UIResult = {};
local this = UIResult;

this.name = "UIResult";
this.uiController = nil;

local text_Title;
local text_SubTitle;

local text_fun1;
local event_fun1;
local delegate_fun1;

local showRole;
local transform_Role;
local jmpDrawer_Role;
local text_Lv;
local text_Name;
local text_None;
local gameObject_Success;
local gameObject_Fail;
local rawImage_BG;
local rawImage_RoleBG;
local rawImage_Result;

local rewards = {};

function UIResult.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;

  text_Title = uiController:FindText("Text_T2_Title");
  text_SubTitle = uiController:FindText("Text_SubTitle");

  text_fun1 = uiController:FindText("Text_T2_fun1");
  event_fun1 = uiController:FindEvent("Image_fun1");
  event_fun1:SetListener(EventTriggerType.PointerClick, this.OnClickfun1);

  transform_Role = uiController:FindGameObject("Role");
  jmpDrawer_Role = uiController:FindRawImage("RawImage_Role").gameObject:AddComponent(typeof(JmpDrawer));
  text_Lv = uiController:FindText("Text_T14_Lv");
  text_Name = uiController:FindText("Text_Name");
  text_None = uiController:FindText("Text_None");
  gameObject_Success = uiController:FindGameObject("Text_Success");
  gameObject_Fail = uiController:FindGameObject("Text_Fail");
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  for i = 1, 2 do
    local temp = {};
    temp.gameObject = uiController:FindGameObject(string.Concat("Image_IconBG", i));
    temp.text_Title = temp.gameObject.transform:Find("Text").gameObject:GetComponent("Text");
    temp.item = UIItemController.New(temp.gameObject.transform);
    rewards[i] = temp;
  end
  rawImage_BG = uiController:FindRawImage("RawImage_BG");
  rawImage_RoleBG = uiController:FindRawImage("RawImage_RoleBG");
  rawImage_Result = uiController:FindRawImage("RawImage_Result");
  return true;
end

function UIResult.OnClickfun1(evnetData)
  if delegate_fun1 ~= nil then 
    delegate_fun1();
    delegate_fun1 = nil;
  end
  UI.Close(UIResult);
  
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 1;
  end
  ---2--------------------------------------------------------------
end

function UIResult.LoadBG()
  TextureManager.SetPng(ETextureUseType.UI, "common0_com075", rawImage_BG);
  TextureManager.SetPng(ETextureUseType.UI, "common0_com040", rawImage_RoleBG);    
end

function UIResult.OnOpen(roleController, title, subTitle, rewardItems, delegate, isSuccess)
  showRole = roleController;
  this.UpdateRole();
  text_Title.text = title;
  text_SubTitle.text = subTitle;
  delegate_fun1 = delegate;
  this.UpdateItem(rewardItems);
  gameObject_Success:SetActive(isSuccess);
  gameObject_Fail:SetActive(not isSuccess);  
  if isSuccess then 
    TextureManager.SetPng(ETextureUseType.UI, "common0_com018", rawImage_Result);        
  else
    TextureManager.SetPng(ETextureUseType.UI, "common0_com120", rawImage_Result);        
  end
  this.LoadBG();
  
  return true;
end

function UIResult.OnClose()
  jmpDrawer_Role:Disable();
  
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(1);
    code = code * 1;
  end
  ---2--------------------------------------------------------------
  
  return true;
end

function UIResult.UpdateRole()
  if showRole ~= nil then
    jmpDrawer_Role:GenerateAndDraw(showRole.data:GetAtlasParams(showRole.titleId, ERolePose.Prepare + 1));
    jmpDrawer_Role.offsetY = 0;

    text_Name.text = showRole.name
    text_Lv.text = showRole:GetAttribute(EAttribute.Lv);
  else
    jmpDrawer_Role:Disable();
  end
end

function UIResult.UpdateItem(rewardItems)
  for i = 1, 2 do
    rewards[i].gameObject:SetActive(false);
  end
  text_None.gameObject:SetActive(table.Count(rewardItems) == 0);
  for i = 1, table.Count(rewardItems) do
    rewards[i].gameObject:SetActive(true);
    rewards[i].data = rewardItems[i];
    rewards[i].text_Title.text = rewardItems[i].title;
    rewards[i].item:SetItem(rewardItems[i].itemId, rewardItems[i].content);
    rewards[i].item:SetEvent(this.OnClickReward, i);          
  end
end

function UIResult.OnClickReward(event)
  UIItemInfo.Show(rewards[event.parameter].data.itemId);
end
