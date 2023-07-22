UISoulInfo = {}
local this = UISoulInfo;

this.name = "UISoulInfo";
this.uiController = nil;

local rectTransform_BG;

local uiCareer;

local image_Lock;
local image_Rarity;
local image_Star = {};

local text_Name;
local text_Lv;
local text_Button;
local text_ItemInfo;
local text_SoulLv;
local text_Breakthrough;
local text_SN;
local text_TransHint;
local text_Attributes = {};

local jmpDrawer_Role;

local event_Button;

local currentFunc;
local currentItemId;
local currentBagIndex;
local currentSoul;
local npcData;
local covertValue = "(%d)";
local skills = {};

function UISoulInfo.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;

  rectTransform_BG = uiController:FindGameObject("Image_BG").transform:GetComponent("RectTransform");
  uiCareer = UICareerController.New(uiController:FindGameObject("GameObject_Career"));

  image_Lock =  uiController:FindImage("Image_Lock");
  image_Rarity =  uiController:FindImage("Image_Rarity");

  text_Name = uiController:FindText("Text_Name");
  text_Lv = uiController:FindText("Text_Lv");
  text_ItemInfo = uiController:FindText("Text_ItemInfo");
  text_SoulLv = uiController:FindText("Text_SoulLv");
  text_Breakthrough = uiController:FindText("Text_Breakthrough");
  text_Button = uiController:FindText("Text_Button");
  text_SN = uiController:FindText("Text_SN");
  text_TransHint = uiController:FindText("Text_TransHint");

  local gameObject_Star = uiController:FindGameObject("Star");
  for i = 1, 5 do
    image_Star[i] = gameObject_Star.transform:Find(string.Concat("Image_Star (", i, ")")).gameObject;
  end

  for i = 1, 6 do
    text_Attributes[i] = uiController:FindText(string.Concat("Text_Attribute (", i, ")"));
  end

  jmpDrawer_Role = uiController:FindRawImage("RawImage_Role").gameObject:AddComponent(typeof(JmpDrawer));

  for i = 1, Role.maxSoulSkill do
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

    skills[i] = skill;
  end

  local tempEvent;

  tempEvent = uiController:FindEvent("Image_Mask");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Mask);

  tempEvent = uiController:FindEvent("Image_Lock");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Lock);

  event_Button = uiController:FindEvent("Image_Button");
  event_Button:SetListener(EventTriggerType.PointerClick, this.OnClick_Button);
end

function UISoulInfo.OnOpen(itemSave, action, func, bagIndex)
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
  text_ItemInfo.text = "";

  currentSoul = itemSave;
  currentBagIndex = bagIndex;
  currentFunc = func;
  currentItemId = itemSave.Id;

  local npcSoulData = npcSoulDatas[currentItemId];
  npcData = npcDatas[npcSoulData.npcId];

  if npcData == nil then return false end

  local quality = itemSave.quality;

  if quality == ESoulCategory.R then
    image_Rarity.color = Color.Green;
  elseif quality == ESoulCategory.SR then
    image_Rarity.color = LuaHelper.GetColor(38, 38, 255, 255);
  elseif quality == ESoulCategory.SSR then
    image_Rarity.color = LuaHelper.GetColor(153, 13, 255, 255);
  else
    image_Rarity.color = Color.White;
  end

  text_ItemInfo.text = string.GetColorText(itemDatas[currentItemId].description, Color.Coffee2);
  text_SoulLv.text = string.Concat(string.Get(20031), "：", itemSave.lv, "/", itemSave:GetLimitLv());
  text_Breakthrough.text = string.Concat(string.Get(23808), "：", itemSave.starLv, "/", soulDatas[quality].limitBreakthrough);

  if Define.IsDebugMode() and not UIDebug.RecordMode then
    text_SN.text = itemSave.sn;
  else
    text_SN.text = "";
  end

  if itemSave.element ~= 6 then
    uiCareer:SetCareer(0, itemSave.element, 0, true);
  end

  text_Name.text = npcData.name;
  if Define.IsInternal() and UIDebug.RecordMode then
    text_Name.text = string.gsub(text_Name.text, "%d%d%d%d%d", "");
  end
  
  text_Lv.text = itemSave.lv;
  local temp = string.format(string.Get(24056), itemSave:GetConvertPercent());
  text_TransHint.text = string.Concat(temp, string.GetColorText(string.Get(24064), Color.Black));

  for i = 1, 6 do
    temp = string.format(covertValue, itemSave:GetConvertSixAtt(i))
    text_Attributes[i].text = string.Concat(itemSave:GetSixAtt(i), string.GetColorText(temp, Color.Black));
  end

  jmpDrawer_Role:GenerateAndDraw(npcData:GetAtlasParams(ERolePose.Prepare + 1));

  for k, v in pairs(skills) do
    v.gameObject:SetActive(false);
  end

  local skillData;
  for index = 1, Role.maxSoulSkill do
    local id = itemSave.skill[index].id;
    skillData = skillDatas[id];
    if skillData ~= nil then

      skillData:SetIcon(skills[index].rawImage_Icon);
      skills[index].text_Name.text = skillData.name;
      skills[index].text_LvValue.text = itemSave:GetSkillLv(id);

      local lv = itemSave:GetSkillLv(id);
      local fightArea = skillData:GetFightArea(lv);

      if skillData.fightWay > 0 then
        skills[index].text_Description.text = string.Concat(string.Get(20564), string.GetFightWay(skillData.fightWay), string.GetFightArea(fightArea));
      else
        skills[index].text_Description.text = skillData.description;
      end

      if skillData.fightWay == 1 then
        skills[index].text_Lv0.gameObject:SetActive(true);
      else
        skills[index].text_Lv0.gameObject:SetActive(false);
      end

      skills[index].text_Lv.gameObject:SetActive(true);
      skills[index].text_LvValue.gameObject:SetActive(true);

      skills[index].gameObject:SetActive(true);
    else
      skills[index].gameObject:SetActive(false);
    end
  end

  for k, _ in pairs(image_Star) do
    image_Star[k]:SetActive(false);
  end

  if itemSave.starLv > 0 then
    for i = 1, itemSave.starLv do
      if image_Star[i] ~= nil then
        image_Star[i]:SetActive(true);
      end
    end
  end

  if action == nil or UISoul.CheckAff(itemSave) then
    event_Button.gameObject:SetActive(false);
    return true;
  else
    event_Button.gameObject:SetActive(true);
  end

  image_Lock.enabled = true;

  if action == ESoulAction.Equip then
    text_Button.text = string.Get(10452);
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
  elseif action == ESoulAction.Compound then
    text_Button.text = string.Get(20629);
  elseif action == ESoulAction.Intensify then
    text_Button.text = string.Get(20029);
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
  elseif action == ESoulAction.Breakthrough then
    text_Button.text = string.Get(10601);
  elseif action == ESoulAction.SkillLv then
    text_Button.text = string.Get(20461);
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
  elseif action == ESoulAction.Affination then
    text_Button.text = string.Get(23048);
  elseif action == ESoulAction.Takeoff then
    text_Button.text = string.Get(98003);
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
  elseif action == ESoulAction.MoveOut then
    text_Button.text = string.Get(20110);
  elseif action == ESoulAction.Upload then
    text_Button.text = string.Get(30023);
    image_Lock.enabled = false;
  elseif action == ESoulAction.TakeOut then
    text_Button.text = string.Get(21413);
    image_Lock.enabled = false;
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
  elseif action == ESoulAction.Preview then
    text_Button.text = string.Get(21413);
    image_Lock.enabled = false;
  end

  this.UpdateLock();

  return true;
end

function UISoulInfo.UpdateLock()
  if currentSoul.isLock then
    image_Lock.sprite = UI.GetSprite("but176");
  else
    image_Lock.sprite = UI.GetSprite("but177");
  end
end

function UISoulInfo.OnClose()
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
  jmpDrawer_Role:Disable();
  currentFunc = nil;
  currentBagIndex = nil;
  return true;
end

function UISoulInfo.OnClick_Mask()
  UI.Close(UISoulInfo);
end

function UISoulInfo.OnClick_Lock()
  --C:120-7 <鎖頭> Lock(1) + SN(8) Lock = 0不鎖 1.鎖
  sendBuffer:Clear();

  if currentSoul.isLock then
    sendBuffer:WriteByte(0);
  else
    sendBuffer:WriteByte(1);
  end

  sendBuffer:WriteInt64(currentSoul.sn);
  Network.Send(120, 7, sendBuffer);
end

function UISoulInfo.OnClick_Button()
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
  if currentFunc ~= nil then
    currentFunc(currentBagIndex);
  end
end

function UISoulInfo.SetLock(kind, sn)
  if currentSoul.sn ~= sn then
    local bag = Item.GetBag(EThings.Soul);
    for _, v in pairs(bag) do
      if v.sn == sn then
        if bit.band(kind, 1) == 0 then
          v.isLock = false;
        elseif bit.band(kind, 1) == 1 then
          v.isLock = true;
        end

        if bit.band(kind, 2) == 0 then
          v.isMining = false;
        elseif bit.band(kind, 2) == 2 then
          v.isMining = true;
        end

        break;
      end
    end
  else
    if bit.band(kind, 1) == 0 then
      currentSoul.isLock = false;
    elseif bit.band(kind, 1) == 1 then
      currentSoul.isLock = true;
    end

    if bit.band(kind, 2) == 0 then
      currentSoul.isMining = false;
    elseif bit.band(kind, 2) == 2 then
      currentSoul.isMining = true;
    end
  end

  this.UpdateLock();

  if UI.IsVisible(UISoul) then
    UISoul.UpdateUI();
  end
end

