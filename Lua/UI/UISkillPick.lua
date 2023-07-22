UISkillPick = {}
local this = UISkillPick;

this.name = "UISkillPick";
this.uiController = nil;

--const
local MaxSkillsBtn = 8;

--ui
local transform_Anchor;
local rectTransform_Anchor;
local event_Mask;

local gameObject_Skill;
local gameObject_RootElement;
local image_Elements = {};
local gameObject_RootSkills;
local image_SkillBtns = {};
local image_Previous;
local image_Next;

--var
local currentNpcId = 0;
local currentNpcExtraSkills = nil;

local nowPage = 0;
local currentElementKind = 0;
local event;
local playerSkills = {};
local npcSkills = {};
local currentClickEvent;
local openUI;

function UISkillPick.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;

  transform_Anchor = uiController:FindGameObject("Anchor").transform;
  rectTransform_Anchor = uiController:FindGameObject("Anchor"):GetComponent("RectTransform");

  gameObject_Skill = uiController:FindGameObject("Root_Skill");
  -- image_Skill = uiController:FindImage("Image_Skill");
  -- image_Skill.gameObject:GetComponent("UIEvent"):SetListener(EventTriggerType.PointerClick, this.OnClickSkillRoot);

  -- rawImage_NowSkill = uiController:FindRawImage("Image_NowSkill");

  gameObject_RootElement = uiController:FindGameObject("Root_Element");
  
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------

  for i = 1, 8 do
    if i ~= 6 then 
      image_Elements[i] = {};
      image_Elements[i].gameObject = gameObject_RootElement.transform:Find(string.Concat("Image_Element", i)).gameObject;
      image_Elements[i].image = image_Elements[i].gameObject.transform:Find("Image").gameObject:GetComponent("Image");
      image_Elements[i].uiCareer = UICareerController.New(image_Elements[i].gameObject);

      event = image_Elements[i].gameObject:GetComponent("UIEvent");
      event:SetListener(EventTriggerType.PointerClick, this.OnClickElementBtn);
      event.parameter = i;
    end
  end

  gameObject_RootSkills = uiController:FindGameObject("Root_Skills");
  for i = 1, MaxSkillsBtn do
    image_SkillBtns[i] = uiController:FindRawImage(string.Concat("Image_Btn", i));
    event = image_SkillBtns[i].gameObject:GetComponent("UIEvent");
    event:SetListener(EventTriggerType.PointerClick, this.OnClickSkillBtn);
    event.parameter = i;
  end

  image_Previous = uiController:FindImage("Image_Previous");
  event = image_Previous.gameObject:GetComponent("UIEvent");
  event:SetListener(EventTriggerType.PointerClick, this.OnClickPreviousPage);

  image_Next = uiController:FindImage("Image_Next");
  event = image_Next.gameObject:GetComponent("UIEvent");
  event:SetListener(EventTriggerType.PointerClick, this.OnClickNextPage);

  event_Mask = uiController:FindEvent("Image_Mask");
  event_Mask:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);
end

function UISkillPick.OnOpen(uiName, clickEvent, npcId, extraSkills)
  openUI = uiName;

  currentClickEvent = clickEvent;
  currentNpcId = npcId;
  currentNpcExtraSkills = extraSkills;

  if openUI == "UIFight" then
    rectTransform_Anchor.anchorMin = Vector2.New(0.5, 0);
    rectTransform_Anchor.anchorMax = Vector2.New(0.5, 0);
    rectTransform_Anchor.anchoredPosition = Vector2.New(0, 200);

    this.InitPlayerSkill();

    this.EnableSkillUI(true);
    this.ShowSkills();
  else
    rectTransform_Anchor.anchorMin = Vector2.New(0.5, 0.5);    
    rectTransform_Anchor.anchorMax = Vector2.New(0.5, 0.5);
    rectTransform_Anchor.anchoredPosition = Vector2.zero;

    this.EnableSkillUI(true);
    this.ShowSkills();
  end

  return true;
end

function UISkillPick.OnClose()
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  return true;
end

function UISkillPick.OnClick_Close()
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  UI.Close(UISkillPick);
end

--Skill--
function UISkillPick.EnableSkillUI(enable)
  gameObject_RootElement:SetActive(enable);
  gameObject_RootSkills:SetActive(enable)
end

function UISkillPick.SetCurrentElementKind(kind)
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  currentElementKind = kind;
  this.UpdateElementColor();
  this.UpdateSkillBtn();
end

function UISkillPick.ShowSkills()
  if openUI == "UIFight" then
    if FightField.conIdx == FightField.GetPlayerIdx() then
      currentNpcId = 0;      
      gameObject_RootElement:SetActive(true);
      this.UpdateElements();
      this.SetCurrentElementKind(Role.player:GetAttribute(EAttribute.Element));
    else
      --顯示武將/分身 技能
      local nowFHum = FightField.fightHum[FightField.conIdx];
      local nowKind = nowFHum.kind;
      if Contains(nowKind, EHuman.Player, EHuman.Players, EHuman.Divide) then
        currentNpcId = 0;
        gameObject_RootElement:SetActive(true);
        this.UpdateElements();
        this.UpdateSkillBtn();
      elseif nowKind == EHuman.FollowNpc then
        --一般武將
        if this.childNpc == nil or this.childNpc ~= Role.GetFollowNpc(Role.playerId, nowFHum.npcId) then -- todo Enum:Child_None
          currentNpcId = nowFHum.npcId;
          gameObject_RootElement:SetActive(false);
          this.InitNPCSkill(Role.GetFollowNpc(Role.playerId, nowFHum.npcId));
          this.UpdateSkillBtn();
        end
      else
        gameObject_RootElement:SetActive(false);
        currentNpcId = -1; --不顯示
        this.UpdateSkillBtn();
      end
    end
  else
    if currentNpcId == 0 then
      gameObject_RootElement:SetActive(true);
      this.InitPlayerSkill();
      this.UpdateElements();
      this.SetCurrentElementKind(Role.player:GetAttribute(EAttribute.Element));            
    else
      gameObject_RootElement:SetActive(false);
      this.InitNPCSkill(Role.GetFollowNpc(Role.playerId, currentNpcId));
      this.UpdateSkillBtn();
    end
  end
end

-- function UISkillPick.OnClickSkillRoot()
-- if gameObject_RootElement.activeInHierarchy or gameObject_RootSkills.activeInHierarchy then
--   this.EnableSkillUI(false);
-- else
-- this.EnableSkillUI(true);
-- this.ShowSkills();
-- end
-- end

function UISkillPick.UpdateElements()
  for i = 1, 8 do
    if i ~= 6 then       
      image_Elements[i].gameObject:SetActive(true);
      image_Elements[i].uiCareer:SetCareer(0, i, ECareer.None);
    end
  end

  if Role.player:GetAttribute(EAttribute.Element) == 1 then
    image_Elements[3].gameObject:SetActive(false);
  elseif Role.player:GetAttribute(EAttribute.Element) == 2 then
    image_Elements[4].gameObject:SetActive(false);
  elseif Role.player:GetAttribute(EAttribute.Element) == 3 then
    image_Elements[1].gameObject:SetActive(false);
  elseif Role.player:GetAttribute(EAttribute.Element) == 4 then
    image_Elements[2].gameObject:SetActive(false);
  end
  local turn3 = Role.player:GetAttribute(EAttribute.Turn) >= 3;
  if not turn3 then 
    image_Elements[7].gameObject:SetActive(false);
    image_Elements[8].gameObject:SetActive(false)
  elseif Role.player:GetAttribute(EAttribute.Turn3Element) == 7 then 
    image_Elements[8].gameObject:SetActive(false)
  else
    image_Elements[7].gameObject:SetActive(false)
  end
end

function UISkillPick.InitPlayerSkill()  --玩家技能分類
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  table.Clear(playerSkills);
  for i = 1, 5 do
    playerSkills[i] = Role.player:GetElementSkill(i);
    table.sort(playerSkills[i], this.SortSkill);
  end

  --光暗技能抽離各自有按鈕  
  for i = 7, 8 do 
    playerSkills[i] = Role.player:GetElementSkill(i);
    table.sort(playerSkills[i], this.SortSkill);
  end  

  --把戰鬥中不能使用的剃除
  local cantUseList = {};

  for i = 1, 8 do 
    if i ~= 6 then 
      for k, v in pairs(playerSkills[i])do 
        if not skillDatas[v.Id]:CanUse() then 
          local skillInfo = {};
          skillInfo.kind = i;
          skillInfo.id = v;
          table.insert(cantUseList, skillInfo);
        end

        if openUI ~= "UIFight" and skillDatas[v.Id].fightWay == 19 then
          local skillInfo = {};
          skillInfo.kind = i;
          skillInfo.id = v;
          table.insert(cantUseList, skillInfo);
        end
      end
    end
  end

  for k, v in pairs(cantUseList)do
    table.RemoveByValue(playerSkills[v.kind], v.id);
  end  
end

function UISkillPick.InitNPCSkill(role)
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  local npcData;
  if role ~= nil then
    if role.data ~= nil and role.data.soulId ~= 0 then
      npcData = npcDatas[role.data.soulId];
    else
      npcData = npcDatas[role.npcId];
    end
  else
    npcData = npcDatas[currentNpcId];
  end

  if npcData == nil then
    this.SetNPCSkillUI(false);
    return;
  end

  table.Clear(npcSkills);

  for i = 0, 2 do
    local skillId = npcData.skills[i + 1];
    this.AddNPCSkill(skillId);
  end
  
  if role ~= nil then
    --特有技
    if role.data ~= nil and role.data.specialSkillLearned then
      this.AddNPCSkill(npcData.specialSkill);
    end
  
    --強化技
    if role.data ~= nil and role.data.upgradeLv > 0 then
      this.AddNPCSkill(npcData.upgradeSkill);
    end

    --專武技
    local weaponSkill, weaponSkillLv = 0;
    local itemSave = Item.GetBagItem(EThings.Equip, EItemFitType.Equip_Hand, role.index);
    if itemSave ~= nil and ExclusiveWeapon.CheckExclusiveWarrior(itemSave.Id, role) then 
      if itemSave ~= nil and itemDatas[itemSave.Id] ~= nil then   
        weaponSkill, weaponSkillLv = ExclusiveWeapon.GetSkill(itemSave.Id, itemSave.enhanceLv)
      end

      if skillDatas[weaponSkill] ~= nil and skillDatas[weaponSkill]:CanUse() then 
        this.AddNPCSkill(weaponSkill);      
      end
    end

    --靈魂技
    local soulData = UISoul.GetEquipNpc(currentNpcId);
    if soulData ~= nil then
      for i = 1, Role.maxSoulSkill do
        if skillDatas[soulData.skill[i].id] ~= nil then
          this.AddNPCSkill(soulData.skill[i].id);
        end
      end
    end
  end

  --額外技能
  if currentNpcExtraSkills ~= nil then
    for k, v in pairs(currentNpcExtraSkills) do
      this.AddNPCSkill(v);
    end
  end
end

function UISkillPick.AddNPCSkill(skillId)
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  if skillId == 0 then return end
  if table.Contains(npcSkills, skillId) then return end

  table.insert(npcSkills, skillId);
end

function UISkillPick.UpdateSkillBtn()
  local pageCount = 8;

  for i = 1, pageCount do
    local skillData;
    if currentNpcId == 0 then
      if playerSkills[currentElementKind] ~= nil and playerSkills[currentElementKind][i + nowPage * pageCount] ~= nil then
        skillData = skillDatas[playerSkills[currentElementKind][i + nowPage * pageCount].Id];
      end
    else
      skillData = skillDatas[npcSkills[i]];
    end

    local role = this.GetRole();

    if skillData ~= nil then
      image_SkillBtns[i].gameObject:SetActive(true);
      skillData:SetIcon(image_SkillBtns[i]);
      if image_SkillBtns[i].texture == nil then
        --暫代
        TextureManager.SetPng(ETextureUseType.UI, "icon_sk10001", image_SkillBtns[i]);
      end

      if openUI == "UIFight" then
        if skillData.requireSp > role:GetAttribute(EAttribute.Sp) then
          LuaHelper.SetColor(image_SkillBtns[i], Color.Gray);
        else
          LuaHelper.SetColor(image_SkillBtns[i], Color.White);
        end

        if Skill.IsSummonSkill(skillData.id) then
          if not Item.CheckSummonEquip(skillData.id, role) then
            LuaHelper.SetColor(image_SkillBtns[i], Color.Gray);
          end
        end
      else
        LuaHelper.SetColor(image_SkillBtns[i], Color.White);
      end
    else
      image_SkillBtns[i].gameObject:SetActive(false);
    end
  end
  if currentNpcId == 0 then
    if playerSkills[currentElementKind] ~= nil then
      this.UpdatePageBtn(math.max(#playerSkills[currentElementKind] - 1, 0) / pageCount > 0)
    else
      this.UpdatePageBtn(false);
    end
  else
    this.UpdatePageBtn(false);
  end
end

function UISkillPick.UpdateElementColor()
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  for k, v in pairs(image_Elements)do
    if k == currentElementKind then 
      v.image.color = LuaHelper.GetColor(255, 255, 255, 0);
    else
      v.image.color = LuaHelper.GetColor(0, 0, 0, 125);
    end
  end
end

function UISkillPick.OnClickElementBtn(event)
  local element = event.parameter;
  if currentElementKind == element then
    return;
  end

  nowPage = 0;
  this.SetCurrentElementKind(element);    
end

function UISkillPick.OnClickSkillBtn(event)
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  local idx = event.parameter;
  local pageCount = 8;
  local skillData;

  if currentNpcId == 0 then
    skillData = skillDatas[playerSkills[currentElementKind][idx + nowPage * pageCount].Id];
  else
    skillData = skillDatas[npcSkills[idx]];
  end

  local role = this.GetRole();

  if openUI == "UIFight" then
    local role = this.GetRole();
    currentClickEvent(skillData, role);
  else
    currentClickEvent(skillData.id);
  end
end

function UISkillPick.UpdatePageBtn(enable)
  image_Previous.gameObject:SetActive(enable);
  image_Next.gameObject:SetActive(enable);
end

function UISkillPick.OnClickPreviousPage()
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  if nowPage - 1 >= 0 then
    nowPage = nowPage - 1;
    this.UpdateSkillBtn();
  end
end

function UISkillPick.OnClickNextPage()
  if currentNpcId ~= 0 then return end

  local pageCount = 8;
  if math.max(#playerSkills[currentElementKind] - 1, 0) / pageCount >= nowPage + 1 then
    nowPage = nowPage + 1;
    this.UpdateSkillBtn();
  end
end

function UISkillPick.SortSkill(a, b)
  if skillDatas[a.Id].element < skillDatas[b.Id].element then
    return true;
  end

  return a.Id < b.Id;
end

function UISkillPick.GetRole()
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  local role;

  if openUI == "UIFight" then
    local fightRole = FightField.fightHum[FightField.conIdx];
    if currentNpcId == 0 then
      if fightRole.kind == EHuman.Player then
        role = Role.player;
      else
        --分身
        role = fightRole.roleController;
      end
    elseif fightRole.kind == EHuman.FollowNpc then
      role = Role.GetFollowNpc(Role.playerId, fightRole.npcId);
    else
      role = fightRole.roleController;
    end
  else
    if currentNpcId == 0 then
      role = Role.player;
    else
      role = Role.GetFollowNpc(Role.playerId, currentNpcId);
    end
  end

  return role;
end