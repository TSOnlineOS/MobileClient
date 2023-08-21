
UISkill = {}
local this = UISkill;

this.name = "UISkill";
this.uiController = nil;

--ui
local transform_Anchor;

local image_BG;
local transform_Selected;
local image_SkillElement = {};

local text_Point;
local text_Hint;

local scrollContent_Skill;
local scrollItems_Skill = {};

local event_Mask;

--var
local currentRole = nil;
local currentElement = 0;
local currentClickEvent = nil;
local currentShowBaseSkill = false;
local currentShowChildSkill = false;

local skills = {};
local elementSkills = {};
local currentClick = -1;

function UISkill.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;

  transform_Anchor = uiController:FindGameObject("Anchor").transform;

  transform_Selected = uiController:FindGameObject("Image_Selected").transform;

  image_BG = uiController:FindImage("Image_BG");

  text_Point = uiController:FindText("Text_Point");
  text_Hint = uiController:FindText("Text_Hint");
  
  scrollContent_Skill = uiController:FindScrollContent("ScrollContent_Skill");
  scrollContent_Skill.onInitialize = this.OnInitialize_ScrollContent_Skill;
  scrollContent_Skill.onItemChange = this.OnItemChange_ScrollContent_Skill;
  scrollContent_Skill:Initialize(1);
  
  
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 1;
  end
  ---2--------------------------------------------------------------

  local tempEvent;

  event_Mask = uiController:FindEvent("Image_Mask");
  event_Mask:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);

  for i = 0, 5 do
    image_SkillElement[i] = uiController:FindImage(string.Concat("Image_SkillElement (", i, ")"));
    
    tempEvent = image_SkillElement[i].gameObject:GetComponent("UIEvent");
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_SkillElement);
    tempEvent.parameter = i;
  end

  tempEvent = uiController:FindEvent("Image_HotKey");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_HotKey);
end

function UISkill.OnOpen(role, clickEvent, anchorPosition, hint, showBG, showPoint, showBaseSkill, showChildSkill)
  if role == nil then return false end

  this.SelectSkill(-1);

  currentRole = role;
  currentElement = currentRole:GetAttribute(EAttribute.Element);
  currentClickEvent = clickEvent;
  
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 1;
  end
  ---2--------------------------------------------------------------

  if anchorPosition ~= nil then
    transform_Anchor.localPosition = anchorPosition;
  else
    transform_Anchor.localPosition = Vector3.zero;
  end

  if hint ~= nil then
    text_Hint.text = hint;
  else
    text_Hint.text = "";
  end

  image_BG.gameObject:SetActive(showBG ~= false);
  event_Mask.gameObject:SetActive(showBG ~= false);

  text_Point.transform.parent.gameObject:SetActive(showPoint == true);

  if showBaseSkill ~= nil then
    currentShowBaseSkill = showBaseSkill;
  else
    currentShowBaseSkill = false;
  end

  if showChildSkill ~= nil then
    currentShowChildSkill = showChildSkill;
  else
    currentShowChildSkill = false;
  end

  this.UpdateUI();

  return true;
end

function UISkill.OnClose()
  this.Deselected();
  -- if UI.IsVisible(UIHotkey) then
  --   UIHotkey.Deselected();
  -- end
  
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 1;
  end
  ---2--------------------------------------------------------------
end

function UISkill.ClearSkill()
  table.Clear(skills);
end

function UISkill.AddSkill(skillId, skillLv, addChild)
  if skillDatas[skillId] == nil then return end

  if skills[skillId] ~= nil then
    skills[skillId] = math.max(skills[skillId], skillLv);
  else
    skills[skillId] = skillLv;
  end

  if skillLv > 0 and addChild then
    local element, node = Skill.FindTreeNode(skillId);

    if element ~= 0 then
      for k, v in pairs(SkillTree[element][node].childs) do
        this.AddSkill(SkillTree[element][v].skillId, 0);
      end
    end
  end
end

function UISkill.UpdateUI()
  if currentRole == nil then return end

  text_Point.text = currentRole:GetAttribute(EAttribute.SkillPoint);
  local element = currentRole:GetAttribute(EAttribute.Element);

  this.ClearSkill();

  if currentRole.kind == EHuman.Player then
    if currentShowBaseSkill then
      this.AddSkill(10001, 0);
      this.AddSkill(11001, 0);
      this.AddSkill(12001, 0);
      this.AddSkill(13001, 0);
    end

    --這裡讓它把lv傳進去
    for k, v in pairs(currentRole.data.skills) do
      if v.Lv > 0 then
        this.AddSkill(v.Id, v.Lv, currentShowChildSkill);
      end
    end

    --加入光暗技能
    if currentRole.data.turn3Info.skillId ~= 0 then
      this.AddSkill(currentRole.data.turn3Info.skillId, currentRole.data.turn3Info.skillLv, currentShowChildSkill);
    end

  elseif currentRole == Role.childNpc then
    --二代武將
    for i = 1, 9 do
      local skillId = Role.playerData.child.skills[i].Id;

      if skillId ~= 0 then
        if Skill.IsSummonSkill(skillId) then
          if not ItemData.IsSummonItem(currentRole.data.equips[EItemFitType.Equip_Spec]) then --沒裝紋章的話
            skillId = Skill.GetDefaultSummonSkill(element); --強制設定為招換技能
          else
            this.AddSkill(Skill.GetDefaultSummonSkill(element), Role.playerData.child.skills[i].Lv); --除了原來技能多加個招換技能14026 or 14077
          end
        end

        this.AddSkill(skillId, Role.playerData.child.skills[i].Lv);
      end
    end
  else
    --一般武將
    local npcId = currentRole.npcId;

    if npcDatas[currentRole.data.soulId] ~= nil then
      npcId = currentRole.data.soulId;
    end

    for i = 1, Role.maxNpcSkill do
      local skillId = npcDatas[npcId].skills[i];

      if skillId ~= 0 then
        if Skill.IsSummonSkill(skillId) then
          if not ItemData.IsSummonItem(currentRole.data.equips[EItemFitType.Equip_Spec]) then --沒裝紋章的話
            skillId = Skill.GetDefaultSummonSkill(element); --強制設定為招換技能
          else
            this.AddSkill(Skill.GetDefaultSummonSkill(element), currentRole.data.skillLv[i]); --除了原來技能多加個招換技能14026 or 14077
          end
        end

        this.AddSkill(skillId, currentRole.data.skillLv[i]);
      end
    end
  end

  this.UpdateElement();
  
  
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  -- if UI.IsVisible(UIHotkey) then
  --   UIHotkey.ChangeRole(currentRole, EUseSource.UISkillTree);
  -- end
end

function UISkill.UpdateElement()
  if currentRole == nil then return end

  for i = 0, 5 do
    if i == currentElement then
      LuaHelper.SetColor(image_SkillElement[i], Color.White);
    else
      LuaHelper.SetColor(image_SkillElement[i], Color.Gray);
    end
  end
  
  table.Clear(elementSkills);
  for skillId in pairs(skills) do
    if currentElement == 0 or (skillDatas[skillId] ~= nil and skillDatas[skillId].element == currentElement) then
      table.insert(elementSkills, skillId);
    end
  end

  table.sort(elementSkills,
    function(a, b)
      if skillDatas[a].element < skillDatas[b].element then return true end

      return a < b;
    end
  );
  
  scrollContent_Skill:Reset(math.max(math.ceil(table.maxn(elementSkills) / 5) * 5, 25));
end

function UISkill.OnClick_Close()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  UI.Close(UISkill);
end

function UISkill.OnClick_SkillElement(uiEvent)
  if currentElement == uiEvent.parameter then return end

  currentElement = uiEvent.parameter;

  this.UpdateElement();
end

function UISkill.OnClick_Skill(uiEvent)
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  transform_Selected.position = uiEvent.transform.position;
  local clickState = "none";

  if skillDatas[uiEvent.parameter] == nil then return end

  if currentClick ~= -1 and currentClick == uiEvent.parameter then
    clickState = "SecondTouch";
  else
    currentClick = uiEvent.parameter;
    clickState = "FirstTouch";
  end

  if clickState == "FirstTouch" then 
    this.SelectSkill(uiEvent.parameter);
    if(UI.IsVisible(UIHotkey)) then
      if this.IsLearned(skillDatas[uiEvent.parameter].id) then
        UIHotkey.SelectedItem(skillDatas[uiEvent.parameter].id, EHotKeyType.Skill);
      else
        UIHotkey.SelectedItem(-1, EHotKeyType.Skill);
      end
    end
  elseif clickState == "SecondTouch" then
    if currentClickEvent ~= nil then
      currentClickEvent(uiEvent.parameter);
    else
      UI.Open(UISkillHint, uiEvent.parameter, currentRole);
    end
  end
end

function UISkill.OnClick_HotKey(uiEvent)
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end
  
  if currentRole ~= nil then
    if UI.IsVisible(UIHotkey) == false then 
      UI.Open(UIHotkey, currentClick, this.uiController.canvas.sortingOrder);
    else
      UI.Close(UIHotkey);
    end
  end
end

function UISkill.SelectSkill(parameter)
  if parameter > -1 then
    transform_Selected.gameObject:SetActive(true);
  else
    transform_Selected.gameObject:SetActive(false);
  end
end

function UISkill.Deselected()
  currentClick = -1;
  this.SelectSkill(-1);
end

function UISkill.OnInitialize_ScrollContent_Skill(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Skill[itemIndex] = {};
    scrollItems_Skill[itemIndex].rawImage_Skill = scrollItems[itemIndex]:Find("RawImage_Skill"):GetComponent("RawImage");
    scrollItems_Skill[itemIndex].event_Skill = scrollItems[itemIndex]:Find("RawImage_Skill"):GetComponent("UIEvent");
    scrollItems_Skill[itemIndex].event_Skill:SetListener(EventTriggerType.PointerClick, this.OnClick_Skill);
    scrollItems_Skill[itemIndex].image_LevelUp = scrollItems[itemIndex]:Find("Image_LevelUp"):GetComponent("Image");
    scrollItems_Skill[itemIndex].text_Level = scrollItems[itemIndex]:Find("Text_Level"):GetComponent("Text");
  end
end

function UISkill.IsLearned(skillId)
  if skillId ~= nil and skillDatas[skillId] ~= nil then
    if skills[skillId] > 0 then
      return true;
    end
  end
  return false;
end

function UISkill.OnItemChange_ScrollContent_Skill(dataIndex, itemIndex)
  local skillId = elementSkills[dataIndex + 1];
  
  if skillId ~= nil and skillDatas[skillId] ~= nil then
    if skills[skillId] > 0 then
      LuaHelper.SetColor(scrollItems_Skill[itemIndex].rawImage_Skill, Color.White);
    else
      LuaHelper.SetColor(scrollItems_Skill[itemIndex].rawImage_Skill, Color.Gray);
    end

    skillDatas[skillId]:SetIcon(scrollItems_Skill[itemIndex].rawImage_Skill);
    scrollItems_Skill[itemIndex].rawImage_Skill.enabled = true;

    scrollItems_Skill[itemIndex].event_Skill.parameter = skillId;
    
    if skills[skillId] > 0 then
      scrollItems_Skill[itemIndex].image_LevelUp.gameObject:SetActive(skills[skillId] < skillDatas[skillId].maxLv and currentRole:GetAttribute(EAttribute.SkillPoint) >= skillDatas[skillId].levelUpPoint);
      scrollItems_Skill[itemIndex].text_Level.text = skills[skillId];
    else
      scrollItems_Skill[itemIndex].image_LevelUp.gameObject:SetActive(currentRole:GetAttribute(EAttribute.SkillPoint) >= skillDatas[skillId].learnPoint);
      scrollItems_Skill[itemIndex].text_Level.text = "";
    end
  else
    scrollItems_Skill[itemIndex].rawImage_Skill.texture = nil;
    scrollItems_Skill[itemIndex].rawImage_Skill.enabled = false;

    scrollItems_Skill[itemIndex].event_Skill.parameter = 0;

    scrollItems_Skill[itemIndex].image_LevelUp.gameObject:SetActive(false);

    scrollItems_Skill[itemIndex].text_Level.text = "";
  end

  return true;
end