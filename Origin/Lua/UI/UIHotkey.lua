local json = require 'cjson'

UIHotkey = {}
local this = UIHotkey;
this.name = "UIHotkey";
this.uiController = nil;

local scrollContent_Skill;
local scrollItems_Skill = {};

local scrollContent_Item;
local scrollItems_Item = {};
local rectTransform_Root;
local text_Name;
local skillViewData = {};
local itemViewData = {};
local image_SkillOnClear;
local image_ItemOnClear;

local scrollRect_Skill;
local scrollRect_Item;

local root_SkillTree;
local root_ItemInfo;
local root_Skill;
local root_Item;
local mask_Skill;
local mask_Side;
local mask_Item;

function UIHotkey.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;
  this.uiController.onClose = this.OnClose;

  image_SkillOnClear = uiController:FindImage("Image_SkillOnClear");
  image_ItemOnClear = uiController:FindImage("Image_ItemOnClear");
  scrollRect_Skill = uiController:FindGameObject("ScrollRect_Skill"):GetComponent("RectTransform");
  scrollRect_Item = uiController:FindGameObject("ScrollRect_Item"):GetComponent("RectTransform");
  root_SkillTree = uiController:FindGameObject("Root_SkillTree"):GetComponent("RectTransform");
  root_ItemInfo = uiController:FindGameObject("Root_ItemInfo"):GetComponent("RectTransform");
  root_Skill = uiController:FindGameObject("Root_Skill"):GetComponent("RectTransform");
  root_Item = uiController:FindGameObject("Root_Item"):GetComponent("RectTransform");
  mask_Skill = uiController:FindGameObject("Mask_Skill");
  mask_Side = uiController:FindGameObject("Mask_Side");
  mask_Item = uiController:FindGameObject("Mask_Item");

  local event = uiController:FindEvent("Image_SkillOnClear");
  event:SetListener(EventTriggerType.PointerClick, this.OnClickClear);

  event = uiController:FindEvent("Image_ItemOnClear");
  event:SetListener(EventTriggerType.PointerClick, this.OnClickClear);

  scrollContent_Skill = this.uiController:FindScrollContent("ScrollContent_Skill");
  scrollContent_Skill.onInitialize = this.OnInitialize_ScrollContent_Skill;
  scrollContent_Skill.onItemChange = this.OnItemChange_ScrollContent_Skill;
  scrollContent_Skill.onRootChange = this.OnRootChange_ScrollContent_Skill;
  scrollContent_Skill:Initialize(1);
  
  scrollContent_Item = this.uiController:FindScrollContent("ScrollContent_Item");
  scrollContent_Item.onInitialize = this.OnInitialize_ScrollContent_Item;
  scrollContent_Item.onItemChange = this.OnItemChange_ScrollContent_Item;
  scrollContent_Item.onRootChange = this.OnRootChange_ScrollContent_Item;
  scrollContent_Item:Initialize(1);
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

function UIHotkey.OnVisible(visible)
  if visible then
    Hotkey.UseClearMode(false);
  end
end

function UIHotkey.OnInitialize_ScrollContent_Skill(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Skill[itemIndex] = {};
    scrollItems_Skill[itemIndex].btns = {};

    for i = 1, 5 do
      local tempTransform = scrollItems[itemIndex]:Find(string.Concat("Image_Btn (", i, ")"));

      scrollItems_Skill[itemIndex].btns[i] = {};
      scrollItems_Skill[itemIndex].btns[i].text_Name = tempTransform:Find("Text_Name"):GetComponent("Text");
      scrollItems_Skill[itemIndex].btns[i].text_Lv = tempTransform:Find("Text_Lv"):GetComponent("Text");
      scrollItems_Skill[itemIndex].btns[i].rawimgae_Icon = tempTransform:Find("RawImage_Icon"):GetComponent("RawImage");
      scrollItems_Skill[itemIndex].btns[i].image_Select = tempTransform:Find("Image_Select"):GetComponent("Image");
      scrollItems_Skill[itemIndex].btns[i].event_Use = tempTransform:GetComponent("UIEvent");
      local parameter = {};
      parameter.pageIndex = itemIndex + 1;
      parameter.btnIdx = i;
      parameter.type = EHotKeyType.Skill;
      parameter.id = -1;
      scrollItems_Skill[itemIndex].btns[i].event_Use.parameter = parameter;
      scrollItems_Skill[itemIndex].btns[i].event_Use:SetListener(EventTriggerType.PointerClick, this.OnClick_Btn);
    end
  end
end

function UIHotkey.OnItemChange_ScrollContent_Skill(dataIndex, itemIndex)
  local id = -1;
  local canBeSet = Hotkey.CanBeSet(currentSkillId, EHotKeyType.Skill);
  
  for i = 1, skillViewData.maxElements do
    id = skillViewData.ids[itemIndex * skillViewData.maxElements + i];
    -- 招換技能轉換
    id = Hotkey.GetUseSummonSkill(id);

    if skillDatas[id] ~= nil then
      scrollItems_Skill[itemIndex].btns[i].rawimgae_Icon.enabled = true;
      scrollItems_Skill[itemIndex].btns[i].text_Lv.text = Hotkey.GetLv(id);
      scrollItems_Skill[itemIndex].btns[i].event_Use.parameter.id = id;
      skillDatas[id]:SetIcon(scrollItems_Skill[itemIndex].btns[i].rawimgae_Icon);
    else
      scrollItems_Skill[itemIndex].btns[i].rawimgae_Icon.enabled = false;
      scrollItems_Skill[itemIndex].btns[i].text_Lv.text = "";
      scrollItems_Skill[itemIndex].btns[i].event_Use.parameter.id = -1;
    end
    
    scrollItems_Skill[itemIndex].btns[i].image_Select.enabled = canBeSet;

    if canBeSet then
      if Hotkey.isClearMode then
        scrollItems_Skill[itemIndex].btns[i].image_Select.sprite = UI.GetSprite("bod109");
      else
        scrollItems_Skill[itemIndex].btns[i].image_Select.sprite = UI.GetSprite("bod025");
      end
    end
    
    if Hotkey.GetLv(id) > 0 then
      if Hotkey.currentDisplayMode == EHotkeyDisplayMode.SingleSkill then
        if not Hotkey.CheckSkillElement(id, true) then 
          LuaHelper.SetColor(scrollItems_Skill[itemIndex].btns[i].rawimgae_Icon, Color.Gray);
        else
          LuaHelper.SetColor(scrollItems_Skill[itemIndex].btns[i].rawimgae_Icon, Color.White);
        end
      elseif Hotkey.currentDisplayMode == EHotkeyDisplayMode.Both then
        if not Hotkey.CheckSkillElement(id) then 
          LuaHelper.SetColor(scrollItems_Skill[itemIndex].btns[i].rawimgae_Icon, Color.Gray);
        elseif Hotkey.CheckCanUseSkill(id) then
          LuaHelper.SetColor(scrollItems_Skill[itemIndex].btns[i].rawimgae_Icon, Color.White);
        else
          LuaHelper.SetColor(scrollItems_Skill[itemIndex].btns[i].rawimgae_Icon, Color.Gray);
        end
      else
        LuaHelper.SetColor(scrollItems_Skill[itemIndex].btns[i].rawimgae_Icon, Color.White);
      end
    else
      LuaHelper.SetColor(scrollItems_Skill[itemIndex].btns[i].rawimgae_Icon, Color.Gray);
    end
  end

  return true;
end

function UIHotkey.OnRootChange_ScrollContent_Skill(dataIndex)
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
  Hotkey.SetPage(EHotKeyType.Skill, dataIndex);
end

function UIHotkey.OnRootChange_ScrollContent_Item(dataIndex)
  Hotkey.SetPage(EHotKeyType.Item, dataIndex);
end

function UIHotkey.OnInitialize_ScrollContent_Item(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Item[itemIndex] = {};
    scrollItems_Item[itemIndex].btns = {};

    for i = 1, 3 do

      local tempTransform = scrollItems[itemIndex]:Find(string.Concat("Image_Btn (", i, ")"));

      scrollItems_Item[itemIndex].btns[i] = {};
      scrollItems_Item[itemIndex].btns[i].text_Name = tempTransform:Find("Text_Name"):GetComponent("Text");
      scrollItems_Item[itemIndex].btns[i].text_Lv = tempTransform:Find("Text_Lv"):GetComponent("Text");
      scrollItems_Item[itemIndex].btns[i].rawimgae_Icon = tempTransform:Find("RawImage_Icon"):GetComponent("RawImage");
      scrollItems_Item[itemIndex].btns[i].image_Select = tempTransform:Find("Image_Select"):GetComponent("Image");
      scrollItems_Item[itemIndex].btns[i].event_Use = tempTransform:GetComponent("UIEvent");
      scrollItems_Item[itemIndex].btns[i].event_Use:SetListener(EventTriggerType.PointerClick, this.OnClick_Btn);
      local parameter = {};
      parameter.pageIndex = itemIndex + 1;
      parameter.btnIdx = i;
      parameter.type = EHotKeyType.Item;
      parameter.id = -1;
      scrollItems_Item[itemIndex].btns[i].event_Use.parameter = parameter;
    end
  end
end 

function UIHotkey.OnItemChange_ScrollContent_Item(dataIndex, itemIndex)
  local id = -1;
  local canBeSet = Hotkey.CanBeSet(currentItemId, EHotKeyType.Item);

  for i = 1, 3 do
    id = itemViewData.ids[itemIndex * itemViewData.maxElements + i];
    scrollItems_Item[itemIndex].btns[i].image_Select.enabled = canBeSet;

    if canBeSet then
      if Hotkey.isClearMode then
        scrollItems_Item[itemIndex].btns[i].image_Select.sprite = UI.GetSprite("bod109");
      else
        scrollItems_Item[itemIndex].btns[i].image_Select.sprite = UI.GetSprite("bod025");
      end
    end

    if id == nil or id <= 0 then
      scrollItems_Item[itemIndex].btns[i].rawimgae_Icon.texture = nil;
      scrollItems_Item[itemIndex].btns[i].rawimgae_Icon.enabled = false;
      scrollItems_Item[itemIndex].btns[i].text_Lv.text = "";
    else
      scrollItems_Item[itemIndex].btns[i].rawimgae_Icon.enabled = true;
      itemDatas[id]:SetIcon(scrollItems_Item[itemIndex].btns[i].rawimgae_Icon);
      scrollItems_Item[itemIndex].btns[i].text_Lv.text = Item.GetItemCount(id);
      scrollItems_Item[itemIndex].btns[i].event_Use.parameter.id = id;
      
      if Item.GetItemCount(id) > 0 or Hotkey.currentDisplayMode == EHotkeyDisplayMode.SingleItem then
        LuaHelper.SetColor(scrollItems_Item[itemIndex].btns[i].rawimgae_Icon, Color.White);
      else
        LuaHelper.SetColor(scrollItems_Item[itemIndex].btns[i].rawimgae_Icon, Color.Gray);
      end
    end
  end

  return true;
end

function UIHotkey.OnEnable(enabled)
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
  this.uiController.canvas.enabled = enabled;
end

function UIHotkey.OnOpen(defaultId, sortOrderIndex)

  this.SetSortOrder(sortOrderIndex);
  currentSkillId = -1;
  currentItemId = -1;
  Hotkey.UseClearMode(false);

  if Hotkey.currentDisplayMode == EHotkeyDisplayMode.SingleSkill then
    currentSkillId = tonumber(defaultId);
  elseif Hotkey.currentDisplayMode == EHotkeyDisplayMode.SingleItem then
    currentItemId = tonumber(defaultId);
  end

  this.uiController.canvas.enabled = true;
  this.UpdateUI(true);
  return true;
end

function UIHotkey.SelectedItem(id, hotKeyType)
  if hotKeyType == EHotKeyType.Skill then 
    currentSkillId = id;
  else
    currentItemId = id;
    currentBagIndex = bagIndex;
  end
  
  scrollContent_Skill:Refresh(skillViewData.maxPages);
  scrollContent_Item:Refresh(itemViewData.maxPages);
end

function UIHotkey.OnClick_Btn(uiEvent)
  local parameter = uiEvent.parameter;
  if Hotkey.currentDisplayMode == EHotkeyDisplayMode.SingleSkill then
    currentSkillId = UISkillTree.GetCurrentClick();
    Hotkey.OnSettingHotkey(parameter.pageIndex, parameter.btnIdx, currentSkillId, parameter.type);
  elseif Hotkey.currentDisplayMode == EHotkeyDisplayMode.SingleItem then
    Hotkey.OnSettingHotkey(parameter.pageIndex, parameter.btnIdx, currentItemId, parameter.type);
  elseif Hotkey.currentDisplayMode == EHotkeyDisplayMode.Both then
    Hotkey.OnUseHotKey(parameter.id, parameter.type);
  end
end

function UIHotkey.IsCurrentRole(role)
  return this.currentRole == role;
end

function UIHotkey.SetBtn(pageIndex, btnIndex, id, hotKeyType)
  if hotKeyType == EHotKeyType.Skill then
    skillViewData.ids[pageIndex * skillViewData.maxElements + btnIndex] = id;
    scrollContent_Skill:Refresh(skillViewData.maxPages);
  elseif hotKeyType == EHotKeyType.Item then
    itemViewData.ids[pageIndex * itemViewData.maxElements + btnIndex] = id;
    scrollContent_Item:Refresh(itemViewData.maxPages);
  end

  if UI.IsVisible(UIMachineBox) then
    UIMachineBox.UpdateFight();
  end
end

function UIHotkey.SetSortOrder(sortOrder)
  if sortOrder ~= nil then
    this.uiController.canvas.sortingOrder = sortOrder + 1;
  end
end

function UIHotkey.UpdateUI(reset, sortOrder)
  if sortOrder ~= nil then
    this.SetSortOrder(sortOrder);
  end
  
  if Hotkey.currentDisplayMode == EHotkeyDisplayMode.Both then
    scrollRect_Skill:SetParent(root_Skill);
    scrollRect_Item:SetParent(root_Item);

  elseif Hotkey.currentDisplayMode == EHotkeyDisplayMode.SingleItem then
    scrollRect_Item:SetParent(root_ItemInfo);
    if Hotkey.isClearMode then
      image_ItemOnClear.sprite = UI.GetSprite("but168L");
    else
      image_ItemOnClear.sprite = UI.GetSprite("but168D");
    end
    
  elseif Hotkey.currentDisplayMode == EHotkeyDisplayMode.SingleSkill then
    scrollRect_Skill:SetParent(root_SkillTree);
    if Hotkey.isClearMode then
      image_SkillOnClear.sprite = UI.GetSprite("but168L");
    else
      image_SkillOnClear.sprite = UI.GetSprite("but168D");
    end
  end

  this.UpdatePos();

  skillViewData = Hotkey.GetViewData(EHotKeyType.Skill);
  itemViewData = Hotkey.GetViewData(EHotKeyType.Item);

  if reset then
    scrollContent_Skill:Reset(skillViewData.maxPages, Hotkey.GetPage(EHotKeyType.Skill));
    scrollContent_Item:Reset(itemViewData.maxPages, Hotkey.GetPage(EHotKeyType.Item));
  else
    scrollContent_Skill:Refresh(skillViewData.maxPages);
    scrollContent_Item:Refresh(itemViewData.maxPages);
  end
end

function UIHotkey.UpdatePos()
  image_SkillOnClear.gameObject:SetActive(Hotkey.currentDisplayMode == EHotkeyDisplayMode.SingleSkill and Hotkey.IsPlayer());
  image_ItemOnClear.gameObject:SetActive(Hotkey.currentDisplayMode == EHotkeyDisplayMode.SingleItem and Hotkey.IsPlayer());
  root_SkillTree.gameObject:SetActive(Hotkey.currentDisplayMode == EHotkeyDisplayMode.SingleSkill);
  root_ItemInfo.gameObject:SetActive(Hotkey.currentDisplayMode == EHotkeyDisplayMode.SingleItem);
  root_Skill.gameObject:SetActive(Hotkey.currentDisplayMode == EHotkeyDisplayMode.Both);
  root_Item.gameObject:SetActive(Hotkey.currentDisplayMode == EHotkeyDisplayMode.Both);
  mask_Skill:SetActive(Hotkey.currentDisplayMode == EHotkeyDisplayMode.Both);
  mask_Side:SetActive(Hotkey.currentDisplayMode == EHotkeyDisplayMode.Both);
  mask_Item:SetActive(Hotkey.currentDisplayMode == EHotkeyDisplayMode.Both);
  scrollRect_Skill.offsetMin = Vector2.New(5, 5); -- Left, Bottom
  scrollRect_Skill.offsetMax = Vector2.New(-5, -5); -- Right, Top 
  scrollRect_Item.offsetMin = Vector2.New(5, 5); 
  if Hotkey.currentDisplayMode == EHotkeyDisplayMode.Both then
    scrollRect_Item.offsetMax = Vector2.New(-5, -11);
  else
    scrollRect_Item.offsetMax = Vector2.New(-5, -5);
  end
end

function UIHotkey.OnClickClear()
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
  Hotkey.UseClearMode();
  this.UpdateUI(false);
end