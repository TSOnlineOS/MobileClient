UIPreviewModel = {};
local this = UIPreviewModel;

this.name = "UIPreviewModel";
this.uiController = nil;

local gameObject_Equip;
local gameObject_Role;

local jmpDrawer_Role;

local text_T6_NpcName;
local uiCareer;

local jmpDrawer_Npc;

local rawImage_EquipBG;
local rawImage_RoleBG;

local image_Item;
local text_T6_ItemName;

local text_HaveItem;

local scrollContent_SkillItem;
local scrollItems_SkillItem = {}

local attribute = {};
local currentSkillData = {};

function UIPreviewModel.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  this.uiController.onVisible = this.OnVisible;

  jmpDrawer_Role = uiController:FindRawImage("RawImage_Role").gameObject:AddComponent(typeof(JmpDrawer));
  jmpDrawer_Role.transform.localScale = Vector3.one * 1.5;

  gameObject_Equip = uiController:FindGameObject("GameObject_Equip");
  gameObject_Role = uiController:FindGameObject("GameObject_Role");

  image_Item = UIItemController.New(uiController:FindImage("Image_Item").transform, function() end);
  text_T6_ItemName = uiController:FindText("Text_T6_ItemName");

  text_HaveItem = uiController:FindText("Text_HaveItem");

  jmpDrawer_Npc = uiController:FindRawImage("RawImage_Npc").gameObject:AddComponent(typeof(JmpDrawer));

  rawImage_EquipBG = uiController:FindRawImage("RawImage_EquipBG");
  rawImage_RoleBG = uiController:FindRawImage("RawImage_RoleBG");

  text_T6_NpcName = uiController:FindText("Text_T6_NpcName");
  uiCareer = UICareerController.New(gameObject_Role.transform:Find("Career"));
  uiCareer.rectTransform:SetSiblingIndex(2);
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------

  local gameObject_Attribute = uiController:FindGameObject("Attribute");
  for i = 1, 8 do 
    attribute[i] = {};
    attribute[i].valueText = gameObject_Attribute.transform:Find(string.Concat("GameObject_Attribute (", i, ")")).transform:Find("Text_Attribute"):GetComponent("Text");
  end

  scrollContent_SkillItem = uiController:FindScrollContent("ScrollContent_SKill");
  scrollContent_SkillItem.onInitialize = this.OnInitialize_ScrollContent_SkillItem;
  scrollContent_SkillItem.onItemChange = this.OnItemChange_ScrollContent_SkillItem;
  scrollContent_SkillItem:Initialize(1);

  local tempEvent = uiController:FindEvent("Image_Mask");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);
end

function UIPreviewModel.OnInitialize_ScrollContent_SkillItem(scrollItems)
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_SkillItem[itemIndex] = {};
    scrollItems_SkillItem[itemIndex].transform = scrollItems[itemIndex];
    scrollItems_SkillItem[itemIndex].rawImage_Skill = scrollItems_SkillItem[itemIndex].transform:Find("RawImage_Skill"):GetComponent("RawImage");
    scrollItems_SkillItem[itemIndex].name = scrollItems_SkillItem[itemIndex].transform:Find("Text_T6_Name"):GetComponent("Text");
    scrollItems_SkillItem[itemIndex].content = scrollItems_SkillItem[itemIndex].transform:Find("Text_Content"):GetComponent("Text");
    scrollItems_SkillItem[itemIndex].sp = scrollItems_SkillItem[itemIndex].transform:Find("Text_SP"):GetComponent("Text");
    scrollItems_SkillItem[itemIndex].specil = scrollItems_SkillItem[itemIndex].transform:Find("Text_Specil"):GetComponent("Text");
    scrollItems_SkillItem[itemIndex].specilBG = scrollItems_SkillItem[itemIndex].transform:Find("Image_SpecilBG"):GetComponent("Image");
  end
end

function UIPreviewModel.OnItemChange_ScrollContent_SkillItem(dataIndex, itemIndex)
  local index = dataIndex + 1;

  if currentSkillData[index] == nil then
    return false;
  end

  local data = skillDatas[currentSkillData[index].id];

  data:SetIcon(scrollItems_SkillItem[itemIndex].rawImage_Skill);

  local skillName = "";

  if data.fightWay == 1 then --合擊技能
    skillName = string.Concat(data.name, "<color=#ff0000> ", string.Get(21596), " </color>");
  else
    skillName = data.name;
  end

  if currentSkillData[index].isSpec then
    skillName = string.Concat(skillName, "<color=#ff0000>(", string.Get(20762), ")</color>");
  end

  scrollItems_SkillItem[itemIndex].name.text = skillName

  scrollItems_SkillItem[itemIndex].content.text = string.Concat(data.description, ",", string.Get(20564), string.GetFightWay(data.fightWay), string.GetFightArea(data:GetFightArea(1)));
  if data.requireSp == 1 then 
    --規則 若填消耗1點SP=消耗全部
    scrollItems_SkillItem[itemIndex].sp.text = string.Get(23285);
  else
    scrollItems_SkillItem[itemIndex].sp.text = string.Concat(string.Get(20565), data.requireSp, string.Get(30077));
  end
  scrollItems_SkillItem[itemIndex].specilBG.gameObject:SetActive(currentSkillData[index].isSpec or currentSkillData[index].isPas);

  if currentSkillData[index].isSpec then
    scrollItems_SkillItem[itemIndex].specil.text = string.Get(71279);
  elseif currentSkillData[index].isStreng then
    scrollItems_SkillItem[itemIndex].specil.text = string.Get(71283);
  elseif currentSkillData[index].isPas then
    scrollItems_SkillItem[itemIndex].specil.text = string.Get(71281);
  else
    scrollItems_SkillItem[itemIndex].specil.text = "";
  end

  return true;
end

function UIPreviewModel.OnOpen(itemId, order)
  if order ~= nil then
    this.uiController.canvas.sortingOrder = order;
  else
    this.uiController.canvas.sortingOrder = UISortingOrder.Hint;
  end

  gameObject_Equip:SetActive(false);
  gameObject_Role:SetActive(false);

  TextureManager.SetPng(ETextureUseType.UI, "common0_com040", rawImage_EquipBG);
  TextureManager.SetPng(ETextureUseType.UI, "common0_com040", rawImage_RoleBG);

  this.UpdateUI(itemId);

  return true;
end

function UIPreviewModel.OnClose()
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
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  
  jmpDrawer_Role:Disable();
  jmpDrawer_Npc:Disable();

  return true;
end

function UIPreviewModel.UpdateUI(itemId)
  local item = itemDatas[itemId];

  image_Item:SetItem(itemId);
  text_T6_ItemName.text = item:GetName();

  if item.kind == EItemKind.Item_68 then --預覽玩家造型
    gameObject_Equip:SetActive(true);

    local playerData = PlayerData.Copy(Role.player.data);
    playerData.equips[item.fitType] = itemId;

    jmpDrawer_Role:GenerateAndDraw(playerData:GetAtlasParams(Role.player.titleId, ERolePose.Prepare + 1));
    jmpDrawer_Role.offsetY = 0;
    
    text_HaveItem.text = "";
  elseif item.kind == EItemKind.SpecialAbility then
    if item.specialAbility == EItemUseKind.NpcPicture then --預覽武將
      local npcData = npcDatas[item.spare3];
      local offsetX, offsetY = npcData:GetOffset();

      gameObject_Role:SetActive(true);

      jmpDrawer_Npc:GenerateAndDraw(npcData:GetAtlasParams(ERolePose.Prepare + 1));
      jmpDrawer_Npc.offsetY = offsetY;
      
      text_T6_NpcName.text = npcData.name;

      uiCareer:SetCareer(npcData.turn, npcData.element, ECareer.None, true);

      for i = 1, 8 do
        if i < 7 then
          attribute[i].valueText.text = npcData.attributes[i];
        elseif i == 7 then
          attribute[i].valueText.text = Calc.GetMaxHp(nil, 1, npcData.attributes[4], 0, 0, npcData.turn, 0, 0, true);
        elseif i == 8 then
          attribute[i].valueText.text = Calc.GetMaxSp(nil, 1, npcData.attributes[5], 0, 0, npcData.turn, 0, 0, true);
        end
      end

      table.Clear(currentSkillData);

      local count = 1;
      for i = 1, Role.maxNpcSkill do
        if npcData.skills[i] ~= 0 then
          currentSkillData[count] = {};
          currentSkillData[count].id = npcData.skills[i];
          currentSkillData[count].isSpec = false;
          currentSkillData[count].isPas = false;
          currentSkillData[count].isStreng = false;
          count = count + 1;
        end
      end

      if npcData.passiveSkill ~= 0 then 
        currentSkillData[count] = {};
        currentSkillData[count].id = npcData.passiveSkill;
        currentSkillData[count].isSpec = false;
        currentSkillData[count].isPas = true;
        currentSkillData[count].isStreng = false;
        count = count + 1;
      end

      if npcData.specialSkill ~= 0 then 
        currentSkillData[count] = {};
        currentSkillData[count].id = npcData.specialSkill;
        currentSkillData[count].isSpec = true;
        currentSkillData[count].isPas = false;
        currentSkillData[count].isStreng = false;
        count = count + 1;
      end

      if npcData.upgradeSkill ~= 0 then 
        currentSkillData[count] = {};
        currentSkillData[count].id = npcData.upgradeSkill;
        currentSkillData[count].isSpec = false;
        currentSkillData[count].isPas = false;
        currentSkillData[count].isStreng = true;
        count = count + 1;
      end

      scrollContent_SkillItem:Reset(table.Count(currentSkillData));
    elseif item.specialAbility == EItemUseKind.Mounts then --預覽坐騎
      local npcData = npcDatas[item.spare3];
      local offsetX, offsetY = npcData:GetOffset();
      
      gameObject_Equip:SetActive(true);

      jmpDrawer_Role:GenerateAndDraw(npcData:GetAtlasParams(ERolePose.Prepare + 1));
      jmpDrawer_Role.offsetY = offsetY;

      if Mounts.HaveCollection(item.spare3) then
        text_HaveItem.text = string.Get(10399);
      else
        text_HaveItem.text = "";
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
  end
end

function UIPreviewModel.OnClick_Close()
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
  UI.Close(this);
  
  return true;
end