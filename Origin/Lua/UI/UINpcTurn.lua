
UINpcTurn = {}
local this = UINpcTurn;

this.name = "UINpcTurn";
this.uiController = nil;

--ui
local transform_FrameRect;
local gameObject_Turn;

local text_Submit;

--current
local uiCareer;

local text_Name;
local text_Lv;
local text_Hp;
local text_Sp;
local text_Faith;
local text_Attributes = {};

local jmpDrawer_Role;
local rawImage_Skills = {};
local event_Skills = {};

--turn
local turnUICareer;

local text_TurnName;
local text_TurnLv;
local text_TurnHp;
local text_TurnSp;
local text_TurnFaith;
local text_TurnAttributes = {};

local jmpDrawer_TurnRole;
local rawImage_TurnSkills = {};
local event_TurnSkills = {};

--var
local currentFollowIndex = 1;
local currentTurn = 1;
local currentRole = nil;
local learnNpcs = nil;

function UINpcTurn.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  this.uiController.onVisible = this.OnVisible;

  transform_FrameRect = uiController:FindGameObject("FrameRect"):GetComponent("RectTransform");
  gameObject_Turn = uiController:FindGameObject("Turn");

  text_Submit = uiController:FindText("Text_Submit");

  --current
  uiCareer = UICareerController.New(uiController:FindGameObject("GameObject_Career"));

  text_Name = uiController:FindText("Text_Name");
  text_Lv = uiController:FindText("Text_Lv");
  text_Hp = uiController:FindText("Text_Hp");
  text_Sp = uiController:FindText("Text_Sp");
  text_Faith = uiController:FindText("Text_Faith");

  for i = 1, 6 do
    text_Attributes[i] = uiController:FindText(string.Concat("Text_Attribute (", i, ")"));
  end

  jmpDrawer_Role = uiController:FindRawImage("RawImage_Role").gameObject:AddComponent(typeof(JmpDrawer));

  for i = 1, Role.maxNpcSkill + 1 do
    rawImage_Skills[i] = uiController:FindRawImage(string.Concat("RawImage_Skill (", i, ")"));
    event_Skills[i] = uiController:FindEvent(string.Concat("RawImage_Skill (", i, ")"));
    event_Skills[i]:SetListener(EventTriggerType.PointerClick, this.OnClick_Skill);
  end

  --turn
  turnUICareer = UICareerController.New(uiController:FindGameObject("GameObject_TurnCareer"));

  text_TurnName = uiController:FindText("Text_TurnName");
  text_TurnLv = uiController:FindText("Text_TurnLv");
  text_TurnHp = uiController:FindText("Text_TurnHp");
  text_TurnSp = uiController:FindText("Text_TurnSp");
  text_TurnFaith = uiController:FindText("Text_TurnFaith");

  for i = 1, 6 do
    text_TurnAttributes[i] = uiController:FindText(string.Concat("Text_TurnAttribute (", i, ")"));
  end

  jmpDrawer_TurnRole = uiController:FindRawImage("RawImage_TurnRole").gameObject:AddComponent(typeof(JmpDrawer));

  for i = 1, Role.maxNpcSkill do
    rawImage_TurnSkills[i] = uiController:FindRawImage(string.Concat("RawImage_TurnSkill (", i, ")"));
    event_TurnSkills[i] = uiController:FindEvent(string.Concat("RawImage_TurnSkill (", i, ")"));
    event_TurnSkills[i]:SetListener(EventTriggerType.PointerClick, this.OnClick_Skill);
  end

  local tempEvent;

  tempEvent = uiController:FindEvent("Image_Submit");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Submit);

  tempEvent = uiController:FindEvent("Image_Prev");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Switch);
  tempEvent.parameter = -1;

  tempEvent = uiController:FindEvent("Image_Next");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Switch);
  tempEvent.parameter = 1;
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
end

function UINpcTurn.OnVisible(visible)
  if visible then
    if currentTurn == 1 or currentTurn == 2 then
      transform_FrameRect.sizeDelta = Vector2.New(660, 475);
      UIFrame.Active(transform_FrameRect, string.Get(90108), this.OnClick_Close, this.OnClick_Help);
    else
      transform_FrameRect.sizeDelta = Vector2.New(340, 475);
      UIFrame.Active(transform_FrameRect, string.Get(71279), this.OnClick_Close, this.OnClick_Help);
    end

    this.UpdateUI();
  end
end

function UINpcTurn.OnOpen(turn, followIndexs)
  currentTurn = turn;
  learnNpcs = followIndexs;

  for i = 1, Role.maxFollowNpc do
    currentRole = Role.GetRole(EHuman.FollowNpc, Role.playerId, i);

    if this.CheckTurn(currentRole) then
      currentFollowIndex = i;
      break;
    end
  end

  this.UpdateUI();

  return true;
end

function UINpcTurn.OnClose()
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  EventManager.SetConduct(true);

  jmpDrawer_Role:Disable();
  jmpDrawer_TurnRole:Disable();
  
  return true;
end

function UINpcTurn.UpdateUI()
  if currentTurn == 1 or currentTurn == 2 then
    gameObject_Turn:SetActive(true);

    text_Submit.text = string.Get(90108);
  else
    gameObject_Turn:SetActive(false);

    text_Submit.text = string.Get(21138);
    ---2--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local area =  DemoCode.CalTriangleArea(100, 100)
      area = area * 1 + 2;
      if area > DemoCode.GetBitxor(20) then  --test avg
        local avg = DemoCode.CalAvg(10, 20, 30);
      end
    end
    --3----------------------------------------------------
    ---2--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local area =  DemoCode.CalTriangleArea(100, 100)
      area = area * 1 + 2;
      if area > DemoCode.GetBitxor(20) then  --test avg
        local avg = DemoCode.CalAvg(10, 20, 30);
      end
    end
    --3----------------------------------------------------
    ---2--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local area =  DemoCode.CalTriangleArea(100, 100)
      area = area * 1 + 2;
      if area > DemoCode.GetBitxor(20) then  --test avg
        local avg = DemoCode.CalAvg(10, 20, 30);
      end
    end
    --3----------------------------------------------------
  end

  --current
  local npcData = npcDatas[currentRole.npcId];
  local offsetX, offsetY = npcData:GetOffset();

  uiCareer:SetCareer(currentRole:GetAttribute(EAttribute.Turn), currentRole:GetAttribute(EAttribute.Element), currentRole:GetAttribute(EAttribute.Career), true);

  text_Name.text = currentRole.name;
  text_Lv.text = currentRole:GetAttribute(EAttribute.Lv);
  text_Hp.text = currentRole:GetAttribute(EAttribute.MaxHp);
  text_Sp.text = currentRole:GetAttribute(EAttribute.MaxSp);
  text_Faith.text = currentRole:GetAttribute(EAttribute.Faith);

  text_Attributes[1].text = currentRole:GetAttribute(EAttribute.Int);
  text_Attributes[2].text = currentRole:GetAttribute(EAttribute.Atk);
  text_Attributes[3].text = currentRole:GetAttribute(EAttribute.Def);
  text_Attributes[4].text = currentRole:GetAttribute(EAttribute.Hpx);
  text_Attributes[5].text = currentRole:GetAttribute(EAttribute.Spx);
  text_Attributes[6].text = currentRole:GetAttribute(EAttribute.Agi);

  for i = 1, Role.maxNpcSkill do
    if skillDatas[npcData.skills[i]] ~= nil then
      skillDatas[npcData.skills[i]]:SetIcon(rawImage_Skills[i]);
      rawImage_Skills[i].gameObject:SetActive(true);
      event_Skills[i].parameter = npcData.skills[i];
    else
      rawImage_Skills[i].texture = nil;
      rawImage_Skills[i].gameObject:SetActive(false);
    end
  end

  if currentTurn == nil or (skillDatas[npcData.specialSkill] ~= nil and currentRole.data.specialSkillLearned) then
    skillDatas[npcData.specialSkill]:SetIcon(rawImage_Skills[Role.maxNpcSkill + 1]);
    rawImage_Skills[Role.maxNpcSkill + 1].gameObject:SetActive(true);
    event_Skills[Role.maxNpcSkill + 1].parameter = npcData.specialSkill;
  else
    rawImage_Skills[Role.maxNpcSkill + 1].texture = nil;
    rawImage_Skills[Role.maxNpcSkill + 1].gameObject:SetActive(false);
  end

  jmpDrawer_Role:GenerateAndDraw(npcData:GetAtlasParams(ERolePose.Prepare + 1));
  jmpDrawer_Role.offsetY = offsetY;

  --turn
  if currentTurn == 1 or currentTurn == 2 then
    local turnNpcId = 0;
    local bag = Item.GetBag(EThings.Bag);

    if currentTurn == 1 then
      for k, v in pairs(bag) do
        if itemDatas[v.Id] ~= nil and
          itemDatas[v.Id].kind == 37 and
          itemDatas[v.Id].attribute[1].kind == 65 and
          itemDatas[v.Id].attribute[1].value == currentRole.npcId and
          itemDatas[v.Id].attribute[2].kind == 65 then
          turnNpcId = itemDatas[v.Id].attribute[2].value;
          break;
        end
      end
    elseif currentTurn == 2 then
      for k, v in pairs(bag) do
        if itemDatas[v.Id] ~= nil and
          itemDatas[v.Id].kind == 51 and
          itemDatas[v.Id].attribute[1].kind == 67 and
          itemDatas[v.Id].attribute[1].value == currentRole.npcId and
          itemDatas[v.Id].attribute[2].kind == 67 then
          turnNpcId = itemDatas[v.Id].attribute[2].value;
          break;
        end
      end
    end

    local turnNpcData = npcDatas[turnNpcId];
    offsetX, offsetY = turnNpcData:GetOffset();

    turnUICareer:SetCareer(turnNpcData.turn, turnNpcData.element, ECareer.None, true);

    text_TurnName.text = turnNpcData.name;
    text_TurnLv.text = 1;
    text_TurnHp.text = Calc.GetMaxHp(nil, 1, turnNpcData.attributes[4], 0, 0, turnNpcData.turn, 0, 0, true);
    text_TurnSp.text = Calc.GetMaxSp(nil, 1, turnNpcData.attributes[5], 0, 0, turnNpcData.turn, 0, 0, true);
    text_TurnFaith.text = 60;

    text_TurnAttributes[1].text = turnNpcData.attributes[1];
    text_TurnAttributes[2].text = turnNpcData.attributes[2];
    text_TurnAttributes[3].text = turnNpcData.attributes[3];
    text_TurnAttributes[4].text = turnNpcData.attributes[4];
    text_TurnAttributes[5].text = turnNpcData.attributes[5];
    text_TurnAttributes[6].text = turnNpcData.attributes[6];

    for i = 1, Role.maxNpcSkill do
      if skillDatas[turnNpcData.skills[i]] ~= nil then
        skillDatas[turnNpcData.skills[i]]:SetIcon(rawImage_TurnSkills[i]);
        rawImage_TurnSkills[i].gameObject:SetActive(true);
        event_TurnSkills[i].parameter = turnNpcData.skills[i];
      else
        rawImage_TurnSkills[i].texture = nil;
        rawImage_TurnSkills[i].gameObject:SetActive(false);
      end
    end

    jmpDrawer_TurnRole:GenerateAndDraw(turnNpcData:GetAtlasParams(ERolePose.Prepare + 1));
    jmpDrawer_TurnRole.offsetY = offsetY;
  end
  
  return true;
end

function UINpcTurn.CheckTurn(role)
  if role == nil then return false end

  if currentTurn == 1 then
    ---2--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local area =  DemoCode.CalTriangleArea(100, 100)
      area = area * 1 + 2;
      if area > DemoCode.GetBitxor(20) then  --test avg
        local avg = DemoCode.CalAvg(10, 20, 30);
      end
    end
    --3----------------------------------------------------
    ---2--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local area =  DemoCode.CalTriangleArea(100, 100)
      area = area * 1 + 2;
      if area > DemoCode.GetBitxor(20) then  --test avg
        local avg = DemoCode.CalAvg(10, 20, 30);
      end
    end
    --3----------------------------------------------------
    ---2--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local area =  DemoCode.CalTriangleArea(100, 100)
      area = area * 1 + 2;
      if area > DemoCode.GetBitxor(20) then  --test avg
        local avg = DemoCode.CalAvg(10, 20, 30);
      end
    end
    --3----------------------------------------------------
    --一轉
    if role:GetAttribute(EAttribute.Lv) < 30 then return false end
    if role:GetAttribute(EAttribute.Faith) < 60 then return false end
    
    local bag = Item.GetBag(EThings.Bag);
    for k, v in pairs(bag) do
      if itemDatas[v.Id] ~= nil and
         itemDatas[v.Id].kind == 37 and
         itemDatas[v.Id].attribute[1].kind == 65 and
         itemDatas[v.Id].attribute[1].value == role.npcId and
         itemDatas[v.Id].attribute[2].kind == 65 then
        return true;
      end
    end

  elseif currentTurn == 2 then
    --二轉
    if role:GetAttribute(EAttribute.Lv) < 60 then return false end
    if role:GetAttribute(EAttribute.Faith) < 100 then return false end
    
    local bag = Item.GetBag(EThings.Bag);
    for k, v in pairs(bag) do
      if itemDatas[v.Id] ~= nil and
         itemDatas[v.Id].kind == 51 and
         itemDatas[v.Id].attribute[1].kind == 67 and
         itemDatas[v.Id].attribute[1].value == role.npcId and
         itemDatas[v.Id].attribute[2].kind == 67 then
        return true;
      end
    end

  else
    --特殊技
    if table.Contains(learnNpcs, role.index) then
      return true;
    end
  end
  
  return false;
end

function UINpcTurn.OnClick_Help(checkShow)
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if currentTurn == 1 then
    if checkShow ~= true then
      UI.Open(UITutorialHint, 23, this);
    end
  elseif currentTurn == 2 then
    if checkShow ~= true then
      UI.Open(UITutorialHint, 24, this);
    end
  else
    if checkShow ~= true then
      UI.Open(UITutorialHint, 34, this);
    end
  end

  return true;
end

function UINpcTurn.OnClick_Close()
  UI.Close(UINpcTurn);

  return true;
end

function UINpcTurn.OnClick_Skill(uiEvent)
  UI.Open(UISkillHint, uiEvent.parameter);
end

function UINpcTurn.OnClick_Submit()
  if currentTurn == 1 then
    if Role.rebornNpcId == currentRole.npcId then
      if Role.rebornKind == 1 then
        ShowCenterMessage(string.Get(21188));
      elseif Role.rebornKind == 2 then
        ShowCenterMessage(string.Get(71291));
      end
      
      return;
    end

    --C:044-001 <武將轉生> +武將索引(1)
    sendBuffer:Clear();
    sendBuffer:WriteByte(currentFollowIndex);
    Network.Send(44, 1, sendBuffer);
  elseif currentTurn == 2 then
    if Role.rebornNpcId == currentRole.npcId then
      if Role.rebornKind == 1 then
        ShowCenterMessage(string.Get(21188));
      elseif Role.rebornKind == 2 then
        ShowCenterMessage(string.Get(71291));
      end

      return;
    end

    --C:044-003 <武將二轉> +武將索引(1)
    sendBuffer:Clear();
    sendBuffer:WriteByte(currentFollowIndex);
    Network.Send(44, 3, sendBuffer);
  else
    --C:044-002 <學習特有技> +武將索引(1)
    sendBuffer:Clear();
    sendBuffer:WriteByte(currentFollowIndex);
    Network.Send(44, 2, sendBuffer);
  end

  UI.Close(UINpcTurn);
end

function UINpcTurn.OnClick_Switch(uiEvent)
  this.Switch(uiEvent.parameter);
end

function UINpcTurn.Switch(offset)
  for i = 1, Role.maxFollowNpc do
    local followIndex = ((Role.maxFollowNpc + currentFollowIndex + (i * offset)) % (Role.maxFollowNpc));
    if followIndex == 0 then
      followIndex = Role.maxFollowNpc;
    end
    
    currentRole = Role.GetRole(EHuman.FollowNpc, Role.playerId, followIndex);

    if this.CheckTurn(currentRole) then
      currentFollowIndex = followIndex;
      break;
    end
  end
  
  this.UpdateUI();
end