UINpcInfo = {}
local this = UINpcInfo;

this.name = "UINpcInfo";
this.uiController = nil;

--ui
local rectTransform_BG;

local uiCareer;

local text_Name;
local text_Lv;
local text_UpgradeLv;
local text_Hp;
local text_Sp;
local text_Attributes = {};

local rawImage_Ground;

local jmpDrawer_Role;

local item_Equips = {};
local skills = {};
local chatNpcIndex = nil;

function UINpcInfo.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;

  rectTransform_BG = uiController:FindGameObject("Image_BG").transform:GetComponent("RectTransform");
  uiCareer = UICareerController.New(uiController:FindGameObject("GameObject_Career"));

  text_Name = uiController:FindText("Text_Name");
  text_Lv = uiController:FindText("Text_Lv");
  text_UpgradeLv = uiController:FindText("Text_UpgradeLv");
  text_Hp = uiController:FindText("Text_Hp");
  text_Sp = uiController:FindText("Text_Sp");

  for i = 1, 6 do
    text_Attributes[i] = uiController:FindText(string.Concat("Text_Attribute (", i, ")"));
  end

  rawImage_Ground = uiController:FindRawImage("RawImage_Ground");

  jmpDrawer_Role = uiController:FindRawImage("RawImage_Role").gameObject:AddComponent(typeof(JmpDrawer));
  jmpDrawer_Role.luaListener = this.OnGenerated;
  
  for i = 1, Role.maxEquip do
    item_Equips[i] = UIItemController.New(uiController:FindGameObject(string.Concat("Image_EquipBG (", i, ")")).transform);
  end

  for i = 1, Role.maxNpcSkill + 3 do
    local tempTransform = uiController:FindGameObject("Right").transform;

    local skill = {};
    skill.gameObject = tempTransform:Find(string.Concat("RawImage_Skill (", i, ")")).gameObject;
    skill.rawImage_Icon = skill.gameObject.transform:GetComponent("RawImage");
    skill.text_Description = skill.rawImage_Icon.transform:Find("Text_Description"):GetComponent("Text");
    skill.text_Name = skill.text_Description.transform:Find("Text_Name"):GetComponent("Text");
    tempTransform = skill.text_Name.transform:Find("Layout");
    skill.text_Lv = tempTransform:Find("Text_Lv"):GetComponent("Text");
    skill.text_LvValue = tempTransform:Find("Text_LvValue"):GetComponent("Text");
    skill.text_Lv0 = tempTransform:Find("Text_Lv0"):GetComponent("Text");
    skill.text_Kind = tempTransform:Find("Text_Kind"):GetComponent("Text");

    skills[i] = skill;
  end

  local tempEvent;

  tempEvent = uiController:FindEvent("Image_Mask");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Mask);

  tempEvent = uiController:FindEvent("Image_SpecialSkillHint");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Hint);
  tempEvent.parameter = 34;
end

function UINpcInfo.OnOpen(npcInfo, showSkill)
  chatNpcIndex = nil;

  local npcData;

  if type(npcInfo) == "number" then
    npcData = npcDatas[npcInfo];
    if npcData == nil then return false end

    npcInfo = NpcInfo.New();
    npcInfo.npcId = npcId;
    npcInfo.level = 1;
  
    npcInfo.turn = npcData.turn;
    npcInfo.element = npcData.element;
  
    npcInfo.int = npcData.attributes[1];
    npcInfo.atk = npcData.attributes[2];
    npcInfo.def = npcData.attributes[3];
    npcInfo.agi = npcData.attributes[6];
    npcInfo.hpx = npcData.attributes[4];
    npcInfo.spx = npcData.attributes[5];
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
  
    npcInfo.hp = Calc.GetMaxHp(nil, 1, npcInfo.hpx, 0, 0, npcInfo.turn, 0, 0, true);
    npcInfo.sp = Calc.GetMaxSp(nil, 1, npcInfo.spx, 0, 0, npcInfo.turn, 0, 0, true);
  else
    chatNpcIndex = npcInfo.chatNpcIndex;

    npcData = npcDatas[npcInfo.npcId];
    if npcData == nil then return false end
  end

  uiCareer:SetCareer(npcInfo.turn, npcInfo.element, npcInfo.career, true);

  text_Name.text = npcData.name;
  text_Lv.text = npcInfo.level;
  text_UpgradeLv.text = npcInfo.upgradeLv;
  text_UpgradeLv.transform.parent.gameObject:SetActive(npcInfo.upgradeLv > 0);

  text_Hp.text = npcInfo.hp;
  text_Sp.text = npcInfo.sp;

  if npcInfo.equipInt == 0 then
    text_Attributes[1].text = npcInfo.int;
  elseif npcInfo.equipInt > 0 then
    text_Attributes[1].text = string.Concat(npcInfo.int, "+", npcInfo.equipInt);
  else
    text_Attributes[1].text = string.Concat(npcInfo.int, "-", math.abs(npcInfo.equipInt));
  end

  if npcInfo.equipAtk == 0 then
    text_Attributes[2].text = npcInfo.atk;
  elseif npcInfo.equipAtk > 0 then
    text_Attributes[2].text = string.Concat(npcInfo.atk, "+", npcInfo.equipAtk);
  else
    text_Attributes[2].text = string.Concat(npcInfo.atk, "-", math.abs(npcInfo.equipAtk));
  end

  if npcInfo.equipDef == 0 then
    text_Attributes[3].text = npcInfo.def;
  elseif npcInfo.equipDef > 0 then
    text_Attributes[3].text = string.Concat(npcInfo.def, "+", npcInfo.equipDef);
  else
    text_Attributes[3].text = string.Concat(npcInfo.def, "-", math.abs(npcInfo.equipDef));
  end

  if npcInfo.equipHpx == 0 then
    text_Attributes[4].text = npcInfo.hpx;
  elseif npcInfo.equipHpx > 0 then
    text_Attributes[4].text = string.Concat(npcInfo.hpx, "+", npcInfo.equipHpx);
  else
    text_Attributes[4].text = string.Concat(npcInfo.hpx, "-", math.abs(npcInfo.equipHpx));
  end

  if npcInfo.equipSpx == 0 then
    text_Attributes[5].text = npcInfo.spx;
  elseif npcInfo.equipSpx > 0 then
    text_Attributes[5].text = string.Concat(npcInfo.spx, "+", npcInfo.equipSpx);
  else
    text_Attributes[5].text = string.Concat(npcInfo.spx, "-", math.abs(npcInfo.equipSpx));
  end

  if npcInfo.equipAgi == 0 then
    text_Attributes[6].text = npcInfo.agi;
  elseif npcInfo.equipAgi > 0 then
    text_Attributes[6].text = string.Concat(npcInfo.agi, "+", npcInfo.equipAgi);
  else
    text_Attributes[6].text = string.Concat(npcInfo.agi, "-", math.abs(npcInfo.equipAgi));
  end

  TextureManager.SetPng(ETextureUseType.UI, "common0_com040", rawImage_Ground);
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

  local offsetX, offsetY = npcData:GetOffset();

  jmpDrawer_Role:GenerateAndDraw(npcData:GetAtlasParams(ERolePose.Prepare + 1));
  jmpDrawer_Role.offsetY = 10 + offsetY;

  if chatNpcIndex ~= nil then
    item_Equips[1].transform.parent.parent.gameObject:SetActive(true);

    local bagItems = Item.GetBag(EThings.ChatNpc, chatNpcIndex);
    for i = 1, Role.maxEquip do
      if bagItems[i] ~= nil then
        item_Equips[i]:SetItem(bagItems[i].Id, bagItems[i].quant, bagItems[i]);
        item_Equips[i]:SetEvent(this.OnClick_Item, bagItems[i]);
      else
        item_Equips[i]:SetItem(0);
        item_Equips[i]:SetEvent(nil);
      end
    end

  else
    item_Equips[1].transform.parent.parent.gameObject:SetActive(false);
  end

  for k, v in pairs(skills) do
    v.gameObject:SetActive(false);
  end
  
  if showSkill == false then
    rectTransform_BG.sizeDelta = Vector2.New(410, 460);
  else
    rectTransform_BG.sizeDelta = Vector2.New(800, 460);
    
    local index = 1;
    local skillData;
    for index = 1, Role.maxNpcSkill do
      skillData = skillDatas[npcData.skills[index]];
      if skillData ~= nil then
        skillData:SetIcon(skills[index].rawImage_Icon);
        skills[index].text_Description.text = skillData.description;
        skills[index].text_Name.text = skillData.name;
        
        skills[index].text_LvValue.text = npcInfo.skillLv[index];

        skills[index].text_Lv.gameObject:SetActive(true);
        skills[index].text_LvValue.gameObject:SetActive(true);
        skills[index].text_Lv0.gameObject:SetActive(false);

        if skillData.fightWay == 1 then
          skills[index].text_Kind.gameObject:SetActive(true);
        else
          skills[index].text_Kind.gameObject:SetActive(false);
        end

        skills[index].gameObject:SetActive(true);
      else
        skills[index].gameObject:SetActive(false);
      end
    end

    index = Role.maxNpcSkill + 1;
    skillData = skillDatas[npcData.passiveSkill];
    if skillData ~= nil then
      skillData:SetIcon(skills[index].rawImage_Icon);
      skills[index].text_Description.text = skillData.description;
      skills[index].text_Name.text = skillData.name;
      
      skills[index].text_LvValue.text = npcData.passiveSkillLv;

      skills[index].text_Lv.gameObject:SetActive(true);
      skills[index].text_LvValue.gameObject:SetActive(true);
      skills[index].text_Lv0.gameObject:SetActive(false);

      if skillData.fightWay == 1 then
        skills[index].text_Kind.gameObject:SetActive(true);
      else
        skills[index].text_Kind.gameObject:SetActive(false);
      end

      skills[index].gameObject:SetActive(true);
    else
      skills[index].gameObject:SetActive(false);
    end

    index = Role.maxNpcSkill + 2;
    skillData = skillDatas[npcData.specialSkill];
    if skillData ~= nil then
      skillData:SetIcon(skills[index].rawImage_Icon);
      skills[index].text_Description.text = skillData.description;
      skills[index].text_Name.text = skillData.name;
      
      if npcInfo.specialSkill then
        skills[index].text_LvValue.text = 1;

        skills[index].text_Lv.gameObject:SetActive(true);
        skills[index].text_LvValue.gameObject:SetActive(true);
        skills[index].text_Lv0.gameObject:SetActive(false);
      else
        skills[index].text_Lv.gameObject:SetActive(false);
        skills[index].text_LvValue.gameObject:SetActive(false);
        skills[index].text_Lv0.gameObject:SetActive(true);
      end

      if skillData.fightWay == 1 then
        skills[index].text_Kind.gameObject:SetActive(true);
      else
        skills[index].text_Kind.gameObject:SetActive(false);
      end

      skills[index].gameObject:SetActive(true);
    else
      skills[index].gameObject:SetActive(false);
    end

    index = Role.maxNpcSkill + 3;
    skillData = skillDatas[npcData.upgradeSkill];
    if skillData ~= nil then
      skillData:SetIcon(skills[index].rawImage_Icon);
      skills[index].text_Description.text = skillData.description;
      skills[index].text_Name.text = skillData.name;

      if npcInfo.upgradeLv > 0 then
        skills[index].text_LvValue.text = 1;

        skills[index].text_Lv.gameObject:SetActive(true);
        skills[index].text_LvValue.gameObject:SetActive(true);
        skills[index].text_Lv0.gameObject:SetActive(false);
      else
        skills[index].text_Lv.gameObject:SetActive(false);
        skills[index].text_LvValue.gameObject:SetActive(false);
        skills[index].text_Lv0.gameObject:SetActive(true);
      end

      if skillData.fightWay == 1 then
        skills[index].text_Kind.gameObject:SetActive(true);
      else
        skills[index].text_Kind.gameObject:SetActive(false);
      end

      skills[index].gameObject:SetActive(true);
    else
      skills[index].gameObject:SetActive(false);
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
  end

  return true;
end

function UINpcInfo.OnGenerated()
  local height = jmpDrawer_Role:GetHeight(ERolePose.Prepare + 1);
  local scale = 1.5;
  if height ~= 0 then
    scale = math.min(250 / height, 1.5);

    jmpDrawer_Role.transform.localScale = Vector3.one * scale;
    jmpDrawer_Role.offsetY = 10 + ((jmpDrawer_Role.offsetY - 10) / (2.5 - scale));
  end
end

function UINpcInfo.OnClose()
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
  jmpDrawer_Role:Disable();

  return true;
end

function UINpcInfo.OnClick_Mask()
  UI.Close(UINpcInfo);
end

function UINpcInfo.OnClick_Hint(uiEvent)
  UI.Open(UITutorialHint, uiEvent.parameter, this);
end

function UINpcInfo.OnClick_Item(uiEvent)
  if chatNpcIndex == nil then return end

  local itemSave = uiEvent.parameter;
  if itemSave == nil then return end

  local itemData = itemDatas[itemSave.Id];
  if itemData == nil then return end

  UIItemInfo.SetSortOrder(this.uiController.canvas.sortingOrder + 1);
  UI.Open(UIItemInfo, EThings.ChatNpc, itemData.fitType, chatNpcIndex);
end