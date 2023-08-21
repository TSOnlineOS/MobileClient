EUIMachineBoxTag = {
  General = 1,     --一般
  Fight = 2,       --戰鬥
  Statistics = 3,  --統計
  Exp = 4,         --經驗瓶
}

UIMachineBox = {}
local this = UIMachineBox;

this.name = "UIMachineBox";
this.uiController = nil;

--ui
local transform_FrameRect;

local gameObject_General;
local gameObject_Fight;
local gameObject_Skill;
local gameObject_ChaseFilter;
local gameObject_Statistics;
local gameObject_Exp;
local gameObject_ExpInfo;

local dropdown_Exit;
local dropdown_Att;
local dropdown_Count;
local dropdown_MoveMode;
local dropdown_Escape;

local slider_Hp;
local slider_Sp;

local text_Hp;
local text_Sp;
local text_Time;
local text_Exp;
local text_Fight;
local text_Death;
local text_ExpBottle;

local scrollContent_Message;
local scrollItems_Message = {};

local career_ChaseFilters = {};

local image_Switch = {};
local sparUI = {};
local expBottleUI = {};
local expBottlInfo = {};
local skillUI = {};
local slider_exp;

--var
local currentTag = EUIMachineBoxTag.General;
local currentNpcId = 0;
local currentRole = nil;
local currentFightSetting = nil;
local currentExpBottle = 0;

local rectTransform_General;
local tagDatas = {};
local followNpcIds = {};
local message = {};
local mainTag;

local EExpBottle = {
  Free = 1,    --免費
  Money = 2,   --遊戲幣
  Gold = 3,    --元寶
}

function UIMachineBox.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  this.uiController.onVisible = this.OnVisible;

  local tempEvent;
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

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;

  gameObject_General = uiController:FindGameObject("General");
  gameObject_Fight = uiController:FindGameObject("Fight");
  gameObject_Skill = uiController:FindGameObject("Skill");
  gameObject_ChaseFilter = uiController:FindGameObject("ChaseFilter");
  gameObject_Statistics = uiController:FindGameObject("Statistics");
  gameObject_Exp = uiController:FindGameObject("Exp");

  slider_Hp = uiController:FindSlider("Slider_PHp");
  slider_Hp:AddListener(this.OnChange_SliderHp);

  slider_Sp = uiController:FindSlider("Slider_PSp");
  slider_Sp:AddListener(this.OnChange_SliderSp);

  text_Hp = uiController:FindText("Text_PHp");
  text_Sp = uiController:FindText("Text_PSp");

  --逃跑設定
  dropdown_Exit = uiController:FindDropdown("Dropdown_Exit");

  --戰鬥模式
  dropdown_Att = uiController:FindDropdown("Dropdown_Att");
  dropdown_Att:AddOption(string.Get(98039));
  dropdown_Att:AddOption(string.Get(98040));
  dropdown_Att:AddOption(string.Get(98041));
  dropdown_Att:AddListener(this.OnDropChange_FightMode);

  --敵人數量
  dropdown_Count = uiController:FindDropdown("Dropdown_Count");
  for i = 1, math.modf(MaxFightHum / 2) do
    dropdown_Count:AddOption(tostring(i));
  end
  dropdown_Count:AddListener(this.OnDropChange_Count);

  --自動行走模式
  dropdown_MoveMode = uiController:FindDropdown("Dropdown_MoveMode");
  dropdown_MoveMode:AddOption( string.Get(21627) );
  dropdown_MoveMode:AddOption( string.Get(21628) );
  dropdown_MoveMode:AddOption( string.Get(23639) );
  dropdown_MoveMode:AddListener(this.OnDropChange_MoveMode);

  --怪高於X隻逃跑
  dropdown_Escape = uiController:FindDropdown("Dropdown_Escape");
  for i = 0, 9 do
    if i == 0 then
      dropdown_Escape:AddOption(string.Get(20324));
    else
      dropdown_Escape:AddOption(tostring(i));
    end
  end
  dropdown_Escape:AddListener(this.OnDropChange_Escape);

  for i = 0, 10 do
    if i == 0 then
      dropdown_Exit:AddOption(string.Get(20324));
    else
      dropdown_Exit:AddOption(tostring(i));
    end
  end
  dropdown_Exit:AddListener(this.OnDropChange_Exit);

  local tempTransform = uiController:FindGameObject("Areas").transform;
  rectTransform_General = tempTransform.gameObject:GetComponent("RectTransform");

  for k, v in pairs(EMachineBoxSwitch) do
    image_Switch[v] = tempTransform:Find(string.Concat("Image_Switch (", v, ")")):GetComponent("Image");

    tempEvent = image_Switch[v].transform:GetComponent("UIEvent");
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Switch);
    tempEvent.parameter = v;
  end

  tempTransform = uiController:FindGameObject("Spar").transform;
  for i = 1, MachineBox.MaxSpar do
    tempEvent = tempTransform:Find(string.Concat("Image_Item (", i, ")")).transform:GetComponent("UIEvent");
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Spar);
    tempEvent.parameter = i;

    sparUI[i] = {};
    sparUI[i].item = UIItemController.New(tempEvent.transform, this.OnClick_Spar, i);
    sparUI[i].text_Description = tempEvent.transform:Find("Text_Description"):GetComponent("Text");
    sparUI[i].text_Name = sparUI[i].text_Description.transform:Find("Text_Name"):GetComponent("Text");
    
    sparUI[i].event_Remove = tempEvent.transform:Find("Image_Close"):GetComponent("UIEvent");
    sparUI[i].event_Remove:SetListener(EventTriggerType.PointerClick, this.OnClick_RemoveSpar);
    sparUI[i].event_Remove.parameter = i;
  end

  for i = 1, 2 do
    tempTransform = gameObject_Skill.transform:Find(string.Concat("Image_Skill (", i, ")"));
    tempEvent = tempTransform:GetComponent("UIEvent");
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Skill);
    tempEvent.parameter = i;
    
    skillUI[i] = {};
    skillUI[i].rawImage_Icon = tempTransform:Find("RawImage_Icon"):GetComponent("RawImage");
    skillUI[i].text_Description = tempTransform:Find("Text_Description"):GetComponent("Text");
    skillUI[i].rectTransform_LayOut = uiController:FindGameObject(string.Concat("Layout_", i)):GetComponent("RectTransform");
    skillUI[i].text_Name = skillUI[i].rectTransform_LayOut.transform:Find("Text_Name"):GetComponent("Text");
    skillUI[i].text_Lv = skillUI[i].rectTransform_LayOut.transform:Find("Text_Lv"):GetComponent("Text");
    skillUI[i].text_FightWay = skillUI[i].rectTransform_LayOut.transform:Find("Text_FightWay"):GetComponent("Text");

    skillUI[i].event_Remove = tempEvent.transform:Find("Image_Close"):GetComponent("UIEvent");
    skillUI[i].event_Remove:SetListener(EventTriggerType.PointerClick, this.OnClick_RemoveSkill);
    skillUI[i].event_Remove.parameter = i;
  end

  tempTransform = uiController:FindGameObject("ExpAreas").transform;
  for i = 1, MachineBox.MaxExpBottle do
    tempEvent = tempTransform:Find(string.Concat("Image (", i, ")")).transform:GetComponent("UIEvent");
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ExpBottle);
    tempEvent.parameter = i;

    tempEvent = tempTransform:Find(string.Concat("Image (", i, ")")):Find(string.Concat("Image_Item (", i, ")")).transform:GetComponent("UIEvent");
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ExpBottle);
    tempEvent.parameter = i;

    expBottleUI[i] = {};
    expBottleUI[i].item = UIItemController.New(tempEvent.transform, this.OnClick_ExpBottle, i);
    expBottleUI[i].text_Name = tempTransform:Find(string.Concat("Image (", i, ")")):Find("Text_Name"):GetComponent("Text");

    expBottleUI[i].event_Use = tempTransform:Find(string.Concat("Image (", i, ")")):Find("Image_Use"):GetComponent("UIEvent");
    expBottleUI[i].event_Use:SetListener(EventTriggerType.PointerClick, this.OnClick_UseExpBottle);
    expBottleUI[i].event_Use.parameter = i;

    expBottleUI[i].useImage = tempTransform:Find(string.Concat("Image (", i, ")")):Find("Image_Use"):GetComponent("Image");
    expBottleUI[i].bg = tempTransform:Find(string.Concat("Image (", i, ")")).transform:GetComponent("Image");
  end

  gameObject_ExpInfo = uiController:FindGameObject("Info").transform;

  expBottlInfo.item = UIItemController.New(gameObject_ExpInfo:Find("Image_Item"));
  expBottlInfo.text_Name = gameObject_ExpInfo:Find("Image_Item"):Find("Text_Name"):GetComponent("Text");
  expBottlInfo.event_Remove = gameObject_ExpInfo:Find("Image_Item"):Find("Image_Close"):GetComponent("UIEvent");
  expBottlInfo.event_Remove:SetListener(EventTriggerType.PointerClick, this.OnClick_RemoveExpBottle);

  slider_exp = uiController:FindSlider("Slider_Exp");

  tempEvent = uiController:FindEvent("Image_PHpHigh");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Hp);
  tempEvent.parameter = 1;

  tempEvent = uiController:FindEvent("Image_PHpLow");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Hp);
  tempEvent.parameter = -1;

  tempEvent = uiController:FindEvent("Image_PSpHigh");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Sp);
  tempEvent.parameter = 1;

  tempEvent = uiController:FindEvent("Image_PSpLow");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Sp);
  tempEvent.parameter = -1;

  tempEvent = uiController:FindEvent("Image_Clear");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ClearStsts);

  tempEvent = uiController:FindEvent("Image_Exp_Free");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_GetExp);
  tempEvent.parameter = EExpBottle.Free;

  tempEvent = uiController:FindEvent("Image_Exp_Money");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_GetExp);
  tempEvent.parameter = EExpBottle.Money;

  tempEvent = uiController:FindEvent("Image_Exp_Gold");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_GetExp);
  tempEvent.parameter = EExpBottle.Gold;

  text_Time = uiController:FindText("Text_Time");
  text_Exp = uiController:FindText("Text_Exp");
  text_Fight = uiController:FindText("Text_Fight");
  text_Death = uiController:FindText("Text_Death");
  text_ExpBottle = uiController:FindText("Text_ExpBottle");

  scrollContent_Message = uiController:FindScrollContent("ScrollContent_Message");
  scrollContent_Message.onInitialize = this.OnInitialize_scrollContent_Message;
  scrollContent_Message.onItemChange = this.OnItemChange_scrollContent_Message;
  scrollContent_Message:Initialize(1);

  for i = 1, 6 do
    tempEvent = uiController:FindEvent(string.Concat("ChaseElement (", i, ")"));
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ChaseElement);
    tempEvent.parameter = this.ConvertElementIndex(i);

    career_ChaseFilters[i] = UICareerController.New(tempEvent.transform);
    career_ChaseFilters[i]:SetCareer(0, this.ConvertElementIndex(i), ECareer.None, true);
  end

  --tag
  tagDatas[1] = {};
  tagDatas[1][1] = string.Get(10094);
  tagDatas[2] = {};
  tagDatas[2][1] = string.Get(10095);
  tagDatas[2][2] = {};
  tagDatas[2][2][1] = string.Get(98034);
  tagDatas[3] = {};
  tagDatas[3][1] = string.Get(21901);
  tagDatas[4] = {};
  tagDatas[4][1] = string.Get(22561);
end

function UIMachineBox.OnOpen(tag)
  --開介面時先去要一次Sever時間校正
  Network.Send(1, 16);

  if tag ~= nil then
    currentTag = tag;
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
  else
    currentTag = EUIMachineBoxTag.General;
  end

  currentNpcId = 0;

  return true;
end

function UIMachineBox.OnClose()
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
  MachineBox.Save();

  if currentTag == EUIMachineBoxTag.Fight then
    MachineBox.SaveNpcSetting(currentNpcId, currentFightSetting);
  end

  UI.Close(UIBag);

  return true;
end

function UIMachineBox.OnVisible(visible)
  if visible then
    table.Clear(followNpcIds);
    while tagDatas[2][2][2] ~= nil do
      table.remove(tagDatas[2][2], 2);
    end

    local followNpcs = Role.GetFollowNpcs(Role.playerId);
    for k, v in pairs(followNpcs) do
      table.insert(followNpcIds, v.npcId);
      table.insert(tagDatas[2][2], npcDatas[v.npcId].name);
    end
  
    UIFrame.Active(transform_FrameRect, string.Get(98029), this.OnClick_Close, nil, this.OnClick_Tag, tagDatas, currentTag, 1, this.CheckRedDot);
    
    this.UpdateUI();
  end
end

function UIMachineBox.CheckRedDot(mTag, subTag)
  if mainTag == mTag then
    return false;
  else
    mainTag = mTag;
  end
  
  if mainTag == EUIMachineBoxTag.Exp then
    return RedDot.Check(ERedDot.ExpBottle);
  end

  return false;
end

function UIMachineBox.OnInitialize_scrollContent_Message(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Message[itemIndex] = {};
    scrollItems_Message[itemIndex].text = scrollItems[itemIndex]:Find("Text_Message"):GetComponent("Text");
  end
end

function UIMachineBox.OnItemChange_scrollContent_Message(dataIndex, itemIndex)
  local index = dataIndex + 1;

  scrollItems_Message[itemIndex].text.text = message[index];
  return true;
end

--update view
function UIMachineBox.UpdateUI()
  gameObject_General:SetActive(currentTag == EUIMachineBoxTag.General);
  gameObject_Fight:SetActive(currentTag == EUIMachineBoxTag.Fight);
  gameObject_Statistics:SetActive(currentTag == EUIMachineBoxTag.Statistics);
  gameObject_Exp:SetActive(currentTag == EUIMachineBoxTag.Exp);

  rectTransform_General.anchoredPosition = Vector2.zero;

  if currentNpcId == 0 then
    currentRole = Role.player;
  else
    currentRole = Role.GetFollowNpc(Role.playerId, currentNpcId);
  end

  currentFightSetting = MachineBox.GetFightSetting(currentNpcId);

  this.UpdateGeneral();
  this.UpdateFight();
  this.UpdateStatistics();
  this.UpdateExp();
end

function UIMachineBox.UpdateGeneral()
  if currentTag ~= EUIMachineBoxTag.General then return end

  for k, v in pairs(MachineBox.client.general) do
    if image_Switch[k] ~= nil then
      image_Switch[k].sprite = UI.GetSwitchSprite(v);
    end
  end

  dropdown_MoveMode.value = MachineBox.client.moveMode - 1;
  for i = 1, 6 do
    if MachineBox.CheckChaseElement(this.ConvertElementIndex(i)) then
      career_ChaseFilters[i]:SetColor(this.ConvertElementIndex(i));
    else
      career_ChaseFilters[i]:SetColor(0);
    end
  end

  dropdown_Escape.value = MachineBox.client.escape - 1;

  this.UpdateSparUI();
end

function UIMachineBox.UpdateFight()
  if currentTag ~= EUIMachineBoxTag.Fight then return end

  slider_Hp.value = currentFightSetting.hp;
  slider_Sp.value = currentFightSetting.sp;

  dropdown_Att.value = currentFightSetting.fightMode - 1;
  dropdown_Count.value = currentFightSetting.aoeThreshold - 1;
  dropdown_Exit.value =  currentFightSetting.exitThreshold;

  if currentFightSetting.singleSkill ~= nil and currentRole:GetSkillLv(currentFightSetting.singleSkill, true) > 0 then
    this.SetSkillIcon(1, currentFightSetting.singleSkill, currentRole:GetSkillLv(currentFightSetting.singleSkill, true));
  else
    this.SetSkillIcon(1);
  end

  if currentFightSetting.aoeSkill ~= nil and currentRole:GetSkillLv(currentFightSetting.aoeSkill, true) > 0 then
    this.SetSkillIcon(2, currentFightSetting.aoeSkill, currentRole:GetSkillLv(currentFightSetting.aoeSkill, true));
  else
    this.SetSkillIcon(2);
  end

  this.UpdateHp();
  this.UpdateSp();
end

function UIMachineBox.UpdateStatistics()
  if currentTag ~= EUIMachineBoxTag.Statistics then return end

  this.UpdateStatsTime();
  this.UpdateStatsExp();
  this.UpdateStatsFight();
  this.UpdateStatsDeath();
  this.UpdateStatsItem();
end

function UIMachineBox.UpdateStatsTime()
  if not UI.IsVisible(UIMachineBox) then return end

  local totalSec = MachineBox.GetStats(EMachineBoxStats.StartTime);
  local hours = math.floor(totalSec / 3600);
  totalSec = totalSec - 3600 * hours;
  local minute = math.floor(totalSec / 60);
  totalSec = totalSec - 60 * minute;
  local sec = totalSec;

  if text_Time ~= nil then
    text_Time.text = string.format(string.Get(21895), hours, minute, sec);
  end
end

function UIMachineBox.UpdateStatsExp()
  if not UI.IsVisible(UIMachineBox) then return end

  if text_Exp ~= nil then
    text_Exp.text = string.format(string.Get(21896),MachineBox.GetStats(EMachineBoxStats.Exp));
  end
end

function UIMachineBox.UpdateStatsFight()
  if not UI.IsVisible(UIMachineBox) then return end

  if text_Fight ~= nil then
    text_Fight.text = string.format(string.Get(21897), MachineBox.GetStats(EMachineBoxStats.Fight));
  end
end

function UIMachineBox.UpdateStatsDeath()
  if not UI.IsVisible(UIMachineBox) then return end

  if text_Death ~= nil then
    text_Death.text = string.format(string.Get(21898), MachineBox.GetStats(EMachineBoxStats.Death));
  end
end

function UIMachineBox.UpdateStatsItem()
  if not UI.IsVisible(UIMachineBox) then return end

  table.Clear(message);

  local getItems = MachineBox.GetStats(EMachineBoxStats.GetItem);
  for k, v in pairs(getItems) do
    table.insert(message, string.format(string.Get(21179), v.name, v.quant));
  end

  local useItems = MachineBox.GetStats(EMachineBoxStats.UseItem);
  for k, v in pairs(useItems) do
    table.insert(message, string.format(string.Get(21904), v.name, v.quant));
  end

  if scrollContent_Message ~= nil then
    scrollContent_Message:Reset(table.maxn(message), table.maxn(message) - 1);
  end
end

function UIMachineBox.OnClick_ClearStsts()
  MachineBox.ClearStats();

  this.UpdateStatistics();
end

function UIMachineBox.UpdateHp()
  text_Hp.text = string.Concat(math.modf(currentRole:GetAttribute(EAttribute.MaxHp) * (currentFightSetting.hp / 100)), "(", currentFightSetting.hp, "%)");
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

function UIMachineBox.UpdateSp()
  text_Sp.text = string.Concat(math.modf(currentRole:GetAttribute(EAttribute.MaxSp) * (currentFightSetting.sp / 100)), "(", currentFightSetting.sp, "%)");
end

function UIMachineBox.GetSkillFightWay(skillId)
  local data = skillDatas[skillId];

  if data ~= nil and data.fightWay == 1 then --合擊技能
    return string.Get(21596);
  end

  return "";
end

function UIMachineBox.SetSkillIcon(index, skillId, skillLv)
  if skillId ~= nil and skillDatas[skillId] ~= nil then
    skillDatas[skillId]:SetIcon(skillUI[index].rawImage_Icon);
    skillUI[index].rawImage_Icon.enabled = true;
    skillUI[index].event_Remove.gameObject:SetActive(true);
    skillUI[index].text_Description.text = skillDatas[skillId]:GetDescription(currentRole, true);
    skillUI[index].rectTransform_LayOut.gameObject:SetActive(true);
    skillUI[index].text_Name.text = skillDatas[skillId].name;
    skillUI[index].text_Lv.text = skillLv;
    skillUI[index].text_FightWay.text = this.GetSkillFightWay(skillId);
  else
    skillUI[index].rawImage_Icon.texture = nil;
    skillUI[index].rawImage_Icon.enabled = false;
    skillUI[index].event_Remove.gameObject:SetActive(false);
    skillUI[index].text_Description.text = string.Get(21398);
    skillUI[index].rectTransform_LayOut.gameObject:SetActive(false);
  end

  this.uiController:RebuilderRectTransfrom(skillUI[index].rectTransform_LayOut);
end

function UIMachineBox.UpdateSparUI()
  for i = 1, MachineBox.MaxSpar do
    if MachineBox.spar[i] ~= nil and MachineBox.spar[i].Id > 0 then
      sparUI[i].event_Remove.gameObject:SetActive(true);
    else
      sparUI[i].event_Remove.gameObject:SetActive(false);
    end
  end

  for i = 1, MachineBox.MaxSpar do
    if i > MachineBox.MaxSparBase + MachineBox.sparExtendNum then
      sparUI[i].item:SetLock(true);
      sparUI[i].text_Name.text = "";
      sparUI[i].text_Description.text = string.Concat(string.Get(21504), "\n");
    else
      if MachineBox.spar[i] ~= nil and itemDatas[MachineBox.spar[i].Id] ~= nil then
        if MachineBox.spar[i].count <= 0 then
          sparUI[i].item:SetItem(23024, 0, nil); --損壞的
        else
          sparUI[i].item:SetItem(MachineBox.spar[i].Id, MachineBox.spar[i].count, nil);
        end
        sparUI[i].text_Name.text = itemDatas[MachineBox.spar[i].Id]:GetName(true);
        sparUI[i].text_Description.text = itemDatas[MachineBox.spar[i].Id].description;
      else
        sparUI[i].item:SetItem(0);
        sparUI[i].text_Name.text = "";
        sparUI[i].text_Description.text = string.Concat(string.Get(21504), "\n");
      end
    end
  end
end

--click event
function UIMachineBox.OnClick_Close()
  UI.Close(UIMachineBox);

  return true;
end

function UIMachineBox.OnClick_Tag(mainTag, subTag)
  if currentTag == EUIMachineBoxTag.Fight then
    MachineBox.SaveNpcSetting(currentNpcId, currentFightSetting);
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

  currentTag = mainTag;
  currentNpcId = 0;

  if currentTag == EUIMachineBoxTag.Fight and subTag ~= 1 then
    currentNpcId = followNpcIds[subTag - 1];
  end

  UI.Close(UIBag);

  this.UpdateUI();

  return true;
end

function UIMachineBox.OnDropChange_FightMode()
  if currentTag ~= EUIMachineBoxTag.Fight then return end

  gameObject_Skill:SetActive(dropdown_Att.value + 1 == EMachineBoxFight.Skill);

  currentFightSetting.fightMode = dropdown_Att.value + 1;
end

function UIMachineBox.OnDropChange_MoveMode()
  MachineBox.client.moveMode = dropdown_MoveMode.value + 1;

  gameObject_ChaseFilter:SetActive(MachineBox.client.moveMode == EAutoMoveMode.Chase);
end

function UIMachineBox.OnClick_ChaseElement(uiEvent)
  if MachineBox.CheckChaseElement(uiEvent.parameter) then
    local selectCount = 0;
    for i = 1, 8 do
      if MachineBox.CheckChaseElement(i) then
        selectCount = selectCount + 1;
      end
    end

    if selectCount <= 1 then
      ShowCenterMessage(string.Get(21866));
      return;
    end

    MachineBox.client.chaseFilter[uiEvent.parameter] = false;
  else
    MachineBox.client.chaseFilter[uiEvent.parameter] = true;
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

  this.UpdateGeneral();
end

function UIMachineBox.OnDropChange_Escape()
  MachineBox.client.escape = dropdown_Escape.value + 1;
end

function UIMachineBox.OnDropChange_Exit()
  if currentTag ~= EUIMachineBoxTag.Fight then return end

  currentFightSetting.exitThreshold = dropdown_Exit.value;
end

function UIMachineBox.OnDropChange_Count()
  if currentTag ~= EUIMachineBoxTag.Fight then return end
  
  currentFightSetting.aoeThreshold = dropdown_Count.value + 1;
end

function UIMachineBox.OnChange_SliderHp(sliderHp)
  currentFightSetting.hp = sliderHp.value;

  this.UpdateHp();
end

function UIMachineBox.OnChange_SliderSp(sliderSp)
  currentFightSetting.sp = sliderSp.value;

  this.UpdateSp();
end

function UIMachineBox.OnClick_Hp(uiEvent)
  if uiEvent.parameter > 0 and currentFightSetting.hp >= slider_Hp.maxValue then return end
  if uiEvent.parameter < 0 and currentFightSetting.hp <= slider_Hp.minValue then return end

  currentFightSetting.hp = slider_Hp.value + uiEvent.parameter;
  
  
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
  this.UpdateFight();
end

function UIMachineBox.OnClick_Sp(uiEvent)
  if uiEvent.parameter > 0 and currentFightSetting.sp >= slider_Sp.maxValue then return end
  if uiEvent.parameter < 0 and currentFightSetting.sp <= slider_Sp.minValue then return end

  currentFightSetting.sp = slider_Sp.value + uiEvent.parameter;

  this.UpdateFight();
end

function UIMachineBox.OnClick_Switch(uiEvent)
  local result = not MachineBox.client.general[uiEvent.parameter];

  MachineBox.client.general[uiEvent.parameter] = result;

  image_Switch[uiEvent.parameter].sprite = UI.GetSwitchSprite(result);

  if MachineBox.autoMove and uiEvent.parameter == EMachineBoxSwitch.EcoMode then
    Role.UpdateAllView();
  end
end

function UIMachineBox.OnClick_Spar(uiEvent)
  local idx = uiEvent.parameter;

  if idx > MachineBox.MaxSpar then return end

  if idx > MachineBox.MaxSparBase + MachineBox.sparExtendNum then
    UISell.Launch(4, this.UpdateSparUI);
    return;
  end

  if MachineBox.spar[idx] ~= nil and MachineBox.spar[idx].Id > 0 then
    UI.Open(UIItemInfo, EThings.None, MachineBox.spar[idx].Id, MachineBox.spar[idx].count,
      string.Get(20109),
      function(bagKind, bagIndex, followIndex)
        local bagIndex = Item.GetItemIndex(MachineBox.spar[idx].Id);

        if bagIndex > 0 then
          Item.UseItem(EThings.Bag, bagIndex, 0);
        else
          ShowCenterMessage(string.Get(20606)); --無此晶石可補充
        end
      end
      );
  else
    UI.Open(UIBag,
      function(bagIndex, itemId)
        UI.Open(UIItemInfo, EThings.Bag, bagIndex, 0,
          string.Get(98047),
          function(bagKind, bagIndex, followIndex)
            local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
            if itemSave == nil then return end

            Item.UseItem(EThings.Bag, bagIndex, 0);

            UI.Close(UIItemInfo);
            UI.Close(UIBag);
          end
        );
      end,
      Vector2.zero,
      true,
      nil,
      function(itemSave)
        if itemDatas[itemSave.Id] == nil then return false end
        if itemSave.isVender then return false end
        if itemSave.isDeliver then return false end
        if itemDatas[itemSave.Id].specialAbility ~= 192 then return false end
        return true;
      end,
      false
    );
  end
end

function UIMachineBox.OnClick_RemoveSpar(uiEvent)
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
  UISell.Launch(14, this.UpdateSparUI, MachineBox.spar[uiEvent.parameter].Id);
end

function UIMachineBox.OnClick_Skill(uiEvent)
  local index = uiEvent.parameter;

  UI.Open(UISkillPick,
    this.name,
    function(skillId)
      if skillId < 0 then return end

      local skillData = skillDatas[skillId];

      if skillData == nil then return end

      if skillData.fightWay == 19 and skillData:Except() then --強化技能不可設定
        ShowCenterMessage(string.Get(21972));
        return;
      end

      if index == 1 then
        currentFightSetting.singleSkill = skillId;
      else
        currentFightSetting.aoeSkill = skillId
      end

      if UI.IsVisible(UISkillPick) then
        UI.Close(UISkillPick);
      end

      this.UpdateFight();
    end,
    currentNpcId
  );
end

function UIMachineBox.OnClick_RemoveSkill(uiEvent)
  if currentTag ~= EUIMachineBoxTag.Fight then return end

  local index = uiEvent.parameter;

  if index == 1 then
    currentFightSetting.singleSkill = MachineBox.BasicSkill;
  else
    currentFightSetting.aoeSkill = MachineBox.BasicSkill;
  end

  this.UpdateFight();
end

function UIMachineBox.UpdateExp()
  if currentTag ~= EUIMachineBoxTag.Exp then return end

  this.UpdateExpBottle();

  this.UpdateBag();
end

function UIMachineBox.UpdateExpBottle()
  for i = 1, MachineBox.MaxExpBottle do
    if MachineBox.bottle[i] ~= nil and MachineBox.bottle[i].Id > 0 then
      expBottleUI[i].event_Use.gameObject:SetActive(true);
    else
      expBottleUI[i].event_Use.gameObject:SetActive(false);
    end
  end

  for i = 1, MachineBox.MaxExpBottle do
    if i > MachineBox.BaseExpBottle + MachineBox.expExtendNum then
      expBottleUI[i].item:SetLock(true);
      expBottleUI[i].text_Name.text =  string.GetColorText(string.Get(22728), Color.Gray);

      expBottleUI[i].useImage.gameObject:SetActive(false);
    else
      expBottleUI[i].useImage.gameObject:SetActive(true);

      if MachineBox.bottle[i] ~= nil and itemDatas[MachineBox.bottle[i].Id] ~= nil then
        expBottleUI[i].item:SetItem(MachineBox.bottle[i].Id, MachineBox.bottle[i].count, nil);
        this.SetExpBottleItemRedDot(i);
        expBottleUI[i].text_Name.text = itemDatas[MachineBox.bottle[i].Id]:GetName(true);
      else
        expBottleUI[i].item:SetItem(0);

        if Item.CheckExpBottle() then
          expBottleUI[i].text_Name.text =  string.GetColorText(string.Get(22720), Color.DarkBlue);
        else
          expBottleUI[i].text_Name.text =  string.GetColorText(string.Get(22729), Color.Gray);
        end
      end

      expBottleUI[i].useImage.sprite = UI.GetCheckBoxSprite(false);

      expBottleUI[i].bg.sprite = UI.GetExpBottleBgSprite(false);
      expBottleUI[i].bg.color = Color.Alpha;
    end
  end

  if MachineBox.priority > 0 and MachineBox.priority <= MachineBox.MaxExpBottle then
    if MachineBox.bottle[MachineBox.priority] ~= nil then
      local itemData = itemDatas[MachineBox.bottle[MachineBox.priority].Id];

      if itemData ~= nil and MachineBox.bottle[MachineBox.priority].exp < itemData.threshold then
        expBottleUI[MachineBox.priority].useImage.sprite = UI.GetCheckBoxSprite(true);
      end
    end
  end
end

function UIMachineBox.SetExpBottleItemRedDot(index)
  if MachineBox.bottle[index] == nil then return end

  if expBottleUI[index] == nil then return end

  local itemData = itemDatas[MachineBox.bottle[index].Id];

  if itemData == nil then return end

  if MachineBox.bottle[index].exp >= itemData.threshold then
    expBottleUI[index].item:SetRedDot(true);
  else
    expBottleUI[index].item:SetRedDot(false);
  end
end

function UIMachineBox.UpdateBag()
  gameObject_ExpInfo.gameObject:SetActive(false);

  UI.Open(UIBag,
    function(bagIndex, itemId)
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, 0,
        string.Get(98047),
        function(bagKind, bagIndex, followIndex)
          local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
          if itemSave == nil then return end

          Item.UseItem(EThings.Bag, bagIndex, 0);

          
        end
      );
    end,
    Vector2.New(240, -20),
    false,
    nil,
    function(itemSave)
      if itemDatas[itemSave.Id] == nil then return false end
      if itemSave.isVender then return false end
      if itemSave.isDeliver then return false end
      if itemDatas[itemSave.Id].specialAbility ~= EItemUseKind.ExpBottle then return false end
      return true;
    end,
    false
  );
end

function UIMachineBox.UpdateExpBottleInfo(index)
  if index <= 0 or index > MachineBox.MaxExpBottle then return end

  UI.Close(UIBag);

  gameObject_ExpInfo.gameObject:SetActive(true);

  if MachineBox.bottle[index] == nil then return end

  local itemData = itemDatas[MachineBox.bottle[index].Id];

  if itemData == nil then return end

  slider_exp.value = math.floor((MachineBox.bottle[index].exp / itemData.threshold) * 100);
  text_ExpBottle.text = string.format(string.Get(22563), string.Concat(MachineBox.bottle[index].exp, "/", itemData.threshold));

  expBottlInfo.item:SetItem(itemData.Id);
  expBottlInfo.text_Name.text = itemData:GetName(true);

  for k, v in pairs(expBottleUI) do
    v.bg.sprite = UI.GetExpBottleBgSprite(false);
    v.bg.color = Color.Alpha;
  end

  expBottleUI[index].bg.sprite = UI.GetExpBottleBgSprite(true);
  expBottleUI[index].bg.color = Color.White;
end

function UIMachineBox.OnClick_ExpBottle(uiEvent)
  currentExpBottle = uiEvent.parameter;

  if currentExpBottle <= 0 and currentExpBottle > MachineBox.MaxExpBottle then return end

  if currentExpBottle > MachineBox.BaseExpBottle + MachineBox.expExtendNum then
    UISell.Launch(52, this.UpdateExpBottle);
    return;
  end

  if MachineBox.bottle[currentExpBottle] ~= nil then
    if MachineBox.bottle[currentExpBottle].Id > 0 then
      UI.Close(UIBag);

      this.UpdateExpBottleInfo(currentExpBottle);
    end
  else
    this.UpdateBag();
  end
end

--C:065-006 <移除經驗瓶> +索引(1)
function UIMachineBox.OnClick_RemoveExpBottle()
  if currentExpBottle <= 0  and currentExpBottle > MachineBox.MaxExpBottle then return end

  if MachineBox.bottle[currentExpBottle] == nil then return end
  
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
  ShowCheckMessage(
  function(result)
    if result then
      this.SendRemoveExpBottle();
    end
  end,
  string.Get(22568),
  Role.player
  );
end

--C:065-006 <移除經驗瓶> +索引(1)
function UIMachineBox.SendRemoveExpBottle()
  sendBuffer:Clear();
  sendBuffer:WriteByte(currentExpBottle);
  Network.Send(65, 6, sendBuffer);
end

--C:065-007 <設定經驗瓶順序> +索引(1)
function UIMachineBox.OnClick_UseExpBottle(uiEvent)
  local idx = uiEvent.parameter;

  if MachineBox.bottle[idx] == nil then
    ShowCenterMessage(string.Get(22575));
    this.UpdateBag();
    return;
  end

  local itemData = itemDatas[MachineBox.bottle[idx].Id];

  if itemData == nil then return end

  if MachineBox.bottle[idx].exp >= itemData.threshold then
    ShowCenterMessage(string.Get(22736));
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
    return;
  end

  if idx == MachineBox.priority then return end

  sendBuffer:Clear();
  sendBuffer:WriteByte(idx);
  Network.Send(65, 7, sendBuffer);
end

function UIMachineBox.ReciveUISell()
  this.UpdateExp();

  MachineBox.CheckExpBottleRedDot();
end

function UIMachineBox.OnClick_GetExp(uiEvent)
  local itemData = itemDatas[MachineBox.bottle[currentExpBottle].Id];

  if itemData == nil then return end

  if MachineBox.bottle[currentExpBottle].exp < itemData.threshold then
    ShowCenterMessage(string.Get(22735));
    return;
  end

  if Item.CheckBagIsFull() then return end

  if uiEvent.parameter == EExpBottle.Free then
    UISell.Launch(51, this.ReciveUISell, currentExpBottle);
  elseif uiEvent.parameter == EExpBottle.Money then
    UISell.Launch(49, this.ReciveUISell, currentExpBottle);
  elseif uiEvent.parameter == EExpBottle.Gold then
    UISell.Launch(50,  this.ReciveUISell, currentExpBottle);
  end
end

function UIMachineBox.ConvertElementIndex(idx)
  local value = idx;
  
  if idx == 5 then
    value = 7;  --光
  elseif idx == 6 then
    value = 8;  --暗
  end

  return value;
end