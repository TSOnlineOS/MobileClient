UIGodskinFilter = {}
local this = UIGodskinFilter;
this.name = "UIGodskinFilter";
this.uiController = nil;

local scrollContent_Equip;
local scrollItems_Equip = {};
local scrollContent_Star;
local scrollItems_Star = {};
local scrollContent_Quality;
local scrollItems_Quality = {};
local scrollContent_Main;
local scrollItems_Main = {};
local scrollContent_Sub;
local scrollItems_Sub = {};
local equipString = { 10453, 10454, 10450, 10455, 10456, 10457 };
local starString = { "1", "2", "3", "4", "5", "6" };
local qualityString = { 22260, 22261, 22262, 24035, 24036 };
local mainString = {};
local subString = {};
local equipSelectAll = false;
local starSelectAll = false;
local qualitySelectAll = false;
local mainSelectAll = false;
local subSelectAll = false;
local image_equipSelectAll;
local image_starSelectAll;
local image_qualitySelectAll;
local image_mainSelectAll;
local image_subSelectAll;

local EFilterKind = {
  Equip = 1,
  Star = 2,
  Quality = 3,
  Main = 4,
  Sub = 5,
}

function UIGodskinFilter.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  
  local tempEvent = uiController:FindEvent("Image_Mask");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);
  
  tempEvent = uiController:FindEvent("Image_FilterClose");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);
  
  tempEvent = uiController:FindEvent("Image_Equip");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_selectAll);
  tempEvent.parameter = EFilterKind.Equip;
  
  tempEvent = uiController:FindEvent("Image_Star");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_selectAll);
  tempEvent.parameter = EFilterKind.Star;
  
  tempEvent = uiController:FindEvent("Image_Quality");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_selectAll);
  tempEvent.parameter = EFilterKind.Quality;
  
  tempEvent = uiController:FindEvent("Image_Main");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_selectAll);
  tempEvent.parameter = EFilterKind.Main;
  
  tempEvent = uiController:FindEvent("Image_Sub");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_selectAll);
  tempEvent.parameter = EFilterKind.Sub;
  
  image_equipSelectAll = uiController:FindImage("Image_Equip");
  image_starSelectAll = uiController:FindImage("Image_Star");
  image_qualitySelectAll = uiController:FindImage("Image_Quality");
  image_mainSelectAll = uiController:FindImage("Image_Main");
  image_subSelectAll = uiController:FindImage("Image_Sub");
  
  scrollContent_Equip = uiController:FindScrollContent("ScrollContent_Equip");
  scrollContent_Equip.onInitialize = this.OnInitialize_Equip;
  scrollContent_Equip.onItemChange = this.OnItemChange_Equip;
  scrollContent_Equip:Initialize(1);
  
  scrollContent_Star = uiController:FindScrollContent("ScrollContent_Star");
  scrollContent_Star.onInitialize = this.OnInitialize_Star;
  scrollContent_Star.onItemChange = this.OnItemChange_Star;
  scrollContent_Star:Initialize(1);
  
  scrollContent_Quality = uiController:FindScrollContent("ScrollContent_Quality");
  scrollContent_Quality.onInitialize = this.OnInitialize_Quality;
  scrollContent_Quality.onItemChange = this.OnItemChange_Quality;
  scrollContent_Quality:Initialize(1);
  
  scrollContent_Main = uiController:FindScrollContent("ScrollContent_Main");
  scrollContent_Main.onInitialize = this.OnInitialize_Main;
  scrollContent_Main.onItemChange = this.OnItemChange_Main;
  scrollContent_Main:Initialize(1);
  
  scrollContent_Sub = uiController:FindScrollContent("ScrollContent_Sub");
  scrollContent_Sub.onInitialize = this.OnInitialize_Sub;
  scrollContent_Sub.onItemChange = this.OnItemChange_Sub;
  scrollContent_Sub:Initialize(1);
end

function UIGodskinFilter.OnOpen()
  image_equipSelectAll.sprite = UI.GetCheckBoxSprite(equipSelectAll);
  image_starSelectAll.sprite = UI.GetCheckBoxSprite(starSelectAll);
  image_qualitySelectAll.sprite = UI.GetCheckBoxSprite(qualitySelectAll);
  image_mainSelectAll.sprite = UI.GetCheckBoxSprite(mainSelectAll);
  image_subSelectAll.sprite = UI.GetCheckBoxSprite(subSelectAll);
  
  this.UpdateUI();
  
  return true;
end

function UIGodskinFilter.OnInitialize_Equip(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Equip[itemIndex] = {};
    scrollItems_Equip[itemIndex].text = scrollItems[itemIndex]:Find("Text_Item"):GetComponent("Text");
    scrollItems_Equip[itemIndex].sprite = scrollItems[itemIndex]:Find("Text_Item"):Find("Image_CheckBox"):GetComponent("Image");
    scrollItems_Equip[itemIndex].event = scrollItems[itemIndex]:Find("Text_Item"):Find("Image_CheckBox"):GetComponent("UIEvent");
    scrollItems_Equip[itemIndex].event:SetListener(EventTriggerType.PointerClick, this.OnClick_CheckBoxEquip);
  end
end

function UIGodskinFilter.OnItemChange_Equip(dataIndex, itemIndex)
  local index = dataIndex + 1;
  scrollItems_Equip[itemIndex].text.text = string.Get(equipString[index]);
  scrollItems_Equip[itemIndex].sprite.sprite = UI.GetCheckBoxSprite(Item.godskin.equip[index]);
  scrollItems_Equip[itemIndex].event.parameter = index;
  
  return true;
end

function UIGodskinFilter.OnInitialize_Star(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Star[itemIndex] = {};
    scrollItems_Star[itemIndex].text = scrollItems[itemIndex]:Find("Text_Item"):GetComponent("Text");
    scrollItems_Star[itemIndex].sprite = scrollItems[itemIndex]:Find("Text_Item"):Find("Image_CheckBox"):GetComponent("Image");
    scrollItems_Star[itemIndex].event = scrollItems[itemIndex]:Find("Text_Item"):Find("Image_CheckBox"):GetComponent("UIEvent");
    scrollItems_Star[itemIndex].event:SetListener(EventTriggerType.PointerClick, this.OnClick_CheckBoxStar);
  end
end

function UIGodskinFilter.OnItemChange_Star(dataIndex, itemIndex)
  local index = dataIndex + 1;
  scrollItems_Star[itemIndex].text.text = starString[index];
  scrollItems_Star[itemIndex].sprite.sprite = UI.GetCheckBoxSprite(Item.godskin.star[index]);
  scrollItems_Star[itemIndex].event.parameter = index;
  
  return true;
end

function UIGodskinFilter.OnInitialize_Quality(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Quality[itemIndex] = {};
    scrollItems_Quality[itemIndex].text = scrollItems[itemIndex]:Find("Text_Item"):GetComponent("Text");
    scrollItems_Quality[itemIndex].sprite = scrollItems[itemIndex]:Find("Text_Item"):Find("Image_CheckBox"):GetComponent("Image");
    scrollItems_Quality[itemIndex].event = scrollItems[itemIndex]:Find("Text_Item"):Find("Image_CheckBox"):GetComponent("UIEvent");
    scrollItems_Quality[itemIndex].event:SetListener(EventTriggerType.PointerClick, this.OnClick_CheckBoxQuality);
  end
end

function UIGodskinFilter.OnItemChange_Quality(dataIndex, itemIndex)
  local index = dataIndex + 1;
  scrollItems_Quality[itemIndex].text.text = string.Get(qualityString[index]);
  scrollItems_Quality[itemIndex].sprite.sprite = UI.GetCheckBoxSprite(Item.godskin.quality[index]);
  scrollItems_Quality[itemIndex].event.parameter = index;
  
  return true;
end

function UIGodskinFilter.OnInitialize_Main(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Main[itemIndex] = {};
    scrollItems_Main[itemIndex].text = scrollItems[itemIndex]:Find("Text_Item"):GetComponent("Text");
    scrollItems_Main[itemIndex].sprite = scrollItems[itemIndex]:Find("Text_Item"):Find("Image_CheckBox"):GetComponent("Image");
    scrollItems_Main[itemIndex].event = scrollItems[itemIndex]:Find("Text_Item"):Find("Image_CheckBox"):GetComponent("UIEvent");
    scrollItems_Main[itemIndex].event:SetListener(EventTriggerType.PointerClick, this.OnClick_CheckBoxMain);
  end
end

function UIGodskinFilter.OnItemChange_Main(dataIndex, itemIndex)
  local index = dataIndex + 1;
  scrollItems_Main[itemIndex].text.text = string.gsub(mainString[index], "[:]", "" );
  scrollItems_Main[itemIndex].sprite.sprite = UI.GetCheckBoxSprite(Item.godskin.main[index]);
  scrollItems_Main[itemIndex].event.parameter = index;
  
  return true;
end

function UIGodskinFilter.OnInitialize_Sub(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Sub[itemIndex] = {};
    scrollItems_Sub[itemIndex].text = scrollItems[itemIndex]:Find("Text_Item"):GetComponent("Text");
    scrollItems_Sub[itemIndex].sprite = scrollItems[itemIndex]:Find("Text_Item"):Find("Image_CheckBox"):GetComponent("Image");
    scrollItems_Sub[itemIndex].event = scrollItems[itemIndex]:Find("Text_Item"):Find("Image_CheckBox"):GetComponent("UIEvent");
    scrollItems_Sub[itemIndex].event:SetListener(EventTriggerType.PointerClick, this.OnClick_CheckBoxSub);
  end
end

function UIGodskinFilter.OnItemChange_Sub(dataIndex, itemIndex)
  local index = dataIndex + 1;
  scrollItems_Sub[itemIndex].text.text = string.gsub(subString[index], "[:]", "" );
  scrollItems_Sub[itemIndex].sprite.sprite = UI.GetCheckBoxSprite(Item.godskin.sub[index]);
  scrollItems_Sub[itemIndex].event.parameter = index;
  
  return true;
end

function UIGodskinFilter.UpdateUI()
  scrollContent_Equip:Refresh(table.maxn(equipString));
  scrollContent_Star:Refresh(table.maxn(starString));
  scrollContent_Quality:Refresh(table.maxn(qualityString));
  table.Clear(mainString)
  table.Clear(subString)
  for k, v in pairs(Item.godskin.att) do
    table.insert(mainString, ItemData.GetAttrText(v));
    table.insert(subString, ItemData.GetAttrText(v));
  end
  scrollContent_Main:Refresh(table.maxn(mainString));
  scrollContent_Sub:Refresh(table.maxn(subString));
end

function UIGodskinFilter.UpdateSelectSprite()
  image_equipSelectAll.sprite = UI.GetCheckBoxSprite(equipSelectAll);
  image_starSelectAll.sprite = UI.GetCheckBoxSprite(starSelectAll);
  image_qualitySelectAll.sprite = UI.GetCheckBoxSprite(qualitySelectAll);
  image_mainSelectAll.sprite = UI.GetCheckBoxSprite(mainSelectAll);
  image_subSelectAll.sprite = UI.GetCheckBoxSprite(subSelectAll);
end

function UIGodskinFilter.OnClick_selectAll(uiEvent)
  local index = uiEvent.parameter;
  
  if index == EFilterKind.Equip then
    equipSelectAll = not equipSelectAll;
    for k, v in pairs(Item.godskin.equip) do
      Item.godskin.equip[k] = equipSelectAll;
    end
    image_equipSelectAll.sprite = UI.GetCheckBoxSprite(equipSelectAll);
    scrollContent_Equip:Refresh(table.maxn(equipString))
  elseif index == EFilterKind.Star then
    starSelectAll = not starSelectAll;
    for k, v in pairs(Item.godskin.star) do
      Item.godskin.star[k] = starSelectAll;
    end
    image_starSelectAll.sprite = UI.GetCheckBoxSprite(starSelectAll);
    scrollContent_Star:Refresh(table.maxn(starString));

  elseif index == EFilterKind.Quality then
    qualitySelectAll = not qualitySelectAll;
    for k, v in pairs(Item.godskin.quality) do
      Item.godskin.quality[k] = qualitySelectAll;
    end
    
    image_qualitySelectAll.sprite = UI.GetCheckBoxSprite(qualitySelectAll);
    scrollContent_Quality:Refresh(table.maxn(qualityString));
  
  elseif index == EFilterKind.Main then
    mainSelectAll = not mainSelectAll;
    for k, v in pairs(Item.godskin.main) do
      Item.godskin.main[k] = mainSelectAll;
    end
    image_mainSelectAll.sprite = UI.GetCheckBoxSprite(mainSelectAll);
    scrollContent_Main:Refresh(table.maxn(mainString));
  
  elseif index == EFilterKind.Sub then
    subSelectAll = not subSelectAll;
    for k, v in pairs(Item.godskin.sub) do
      Item.godskin.sub[k] = subSelectAll;
    end
    image_subSelectAll.sprite = UI.GetCheckBoxSprite(subSelectAll);
    scrollContent_Sub:Refresh(table.maxn(subString));
  end
  
  this.UpdateSelectSprite();
end

function UIGodskinFilter.OnClick_Close()
  UI.Close(UIGodskinFilter);
  UIBag.UpdateUI(true);
  UIBag.SetFilterActive(Item.CheckGodskinFilter());
  
  return true;
end

function UIGodskinFilter.OnClick_CheckBoxEquip(uiEvent)
  local index = uiEvent.parameter;
  Item.godskin.equip[index] = not Item.godskin.equip[index];
  scrollContent_Equip:Refresh(table.maxn(equipString));
  
  local all = true;
  for i, v in pairs(Item.godskin.equip) do
    if not v then
      all = false;
      break;
    end
  end
  equipSelectAll = all;
  image_equipSelectAll.sprite = UI.GetCheckBoxSprite(all);
  this.UpdateSelectSprite();
end

function UIGodskinFilter.OnClick_CheckBoxStar(uiEvent)
  local index = uiEvent.parameter;
  Item.godskin.star[index] = not Item.godskin.star[index];
  scrollContent_Star:Refresh(table.maxn(starString));
  
  local all = true;
  for i, v in pairs(Item.godskin.star) do
    if not v then
      all = false;
      break;
    end
  end
  starSelectAll = all;
  image_starSelectAll.sprite = UI.GetCheckBoxSprite(all);
  this.UpdateSelectSprite();
end

function UIGodskinFilter.OnClick_CheckBoxQuality(uiEvent)
  local index = uiEvent.parameter;
  Item.godskin.quality[index] = not Item.godskin.quality[index];
  scrollContent_Quality:Refresh(table.maxn(qualityString));
  
  local all = true;
  for i, v in pairs(Item.godskin.quality) do
    if not v then
      all = false;
      break;
    end
  end
  qualitySelectAll = all;
  image_qualitySelectAll.sprite = UI.GetCheckBoxSprite(all);
  this.UpdateSelectSprite();
end

function UIGodskinFilter.OnClick_CheckBoxMain(uiEvent)
  local index = uiEvent.parameter;
  Item.godskin.main[index] = not Item.godskin.main[index];
  scrollContent_Main:Refresh(table.maxn(mainString));
  
  local all = true;
  for i, v in pairs(Item.godskin.main) do
    if not v then
      all = false;
      break;
    end
  end
  mainSelectAll = all;
  image_mainSelectAll.sprite = UI.GetCheckBoxSprite(all);
  this.UpdateSelectSprite();
end

function UIGodskinFilter.OnClick_CheckBoxSub(uiEvent)
  local index = uiEvent.parameter;
  Item.godskin.sub[index] = not Item.godskin.sub[index];
  scrollContent_Sub:Refresh(table.maxn(subString));
  
  local all = true;
  for i, v in pairs(Item.godskin.sub) do
    if not v then
      all = false;
      break;
    end
  end
  subSelectAll = all;
  image_subSelectAll.sprite = UI.GetCheckBoxSprite(all);
  this.UpdateSelectSprite();
end