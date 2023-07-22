
UISkillController = {}
UISkillController.__index = UISkillController;

function UISkillController.TestPas(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function UISkillController.New(parent, eventHandler, eventParameter)
  local self = {};
  setmetatable(self, UISkillController);

  self.skillId = 0;
  self.skillLv = 0;
  self.parameter = eventParameter;

  self.gameObject = poolMgr:Get("BaseUISkill");
  self.transform = self.gameObject.transform;
  
  self.rectTransform = self.gameObject:GetComponent("RectTransform");
  self.rectTransform:SetParent(parent);
  --self.rectTransform:SetSiblingIndex(0);
  --self.rectTransform.anchorMin = Vector2.zero;
  --self.rectTransform.anchorMax = Vector2.one;
  --self.rectTransform.anchoredPosition = Vector2.zero;
  --self.rectTransform.sizeDelta = Vector2.zero;
  self.rectTransform.localScale = Vector2.one;

  self.event = self.transform:GetComponent("UIEvent");

  self.rawImage_Icon = self.transform:Find("RawImage_Icon"):GetComponent("RawImage");
  self.rawImage_Icon.enabled = false;

  self.text_Lv = self.transform:Find("Text_Lv"):GetComponent("Text");

  self.gameObject_Cost = self.transform:Find("Image_Cost").gameObject;
  self.text_Cost = self.gameObject_Cost.transform:Find("Text_Cost"):GetComponent("Text");

  self.gameObject_Lock = self.transform:Find("Image_Lock").gameObject;
  self.event_Lock = self.gameObject_Lock.transform:GetComponent("UIEvent");
  self.gameObject_Lock:SetActive(false);

  self:SetSkill(0);
  self:SetEvent(eventHandler);

  return self;
end

function UISkillController.TestPas1(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function UISkillController.TestPas2(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function UISkillController:Destroy()
  poolMgr:Release("BaseUISkill", self.gameObject);
end

function UISkillController:SetSkill(skillId, skillLv, roleElement)
  self.skillId = skillId;
  
  self:SetLevel(skillLv, roleElement);

  self.rawImage_Icon.enabled = false;

  if skillId == nil then return end

  local skillData = skillDatas[skillId];
  if skillData == nil then return end

  skillData:SetIcon(self.rawImage_Icon);
  self.rawImage_Icon.enabled = true;
end

function UISkillController.TestPas3(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function UISkillController.TestPas4(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function UISkillController:SetLevel(skillLv, roleElement)
  self.skillLv = skillLv;

  self.text_Lv.text = "";

  self.gameObject_Cost:SetActive(false);
  self.text_Cost.text = "";

  local skillData = skillDatas[self.skillId];
  if skillData == nil then return end

  if Contains(skillId, 14026, 14077) or Skill.IsSummonSkill(skillId) then return end --招喚技能不秀

  self.text_Lv.text = self.skillLv;
  
  local cost = 0;
  if self.skillLv > 0 then
    self:SetColor(Color.White);
    cost = skillData.levelUpPoint;
  else
    self:SetColor(Color.Gray);
    cost = skillData.learnPoint;

    if roleElement ~= nil and roleElement ~= 0 and Between(skillData.element, 1, 4) and skillData.element ~= roleElement then
      cost = cost * 2;
    end
  end
  
  self.gameObject_Cost:SetActive(cost > 0);
  self.text_Cost.text = cost;
end

function UISkillController:SetShowCost(visible)
  self.gameObject_Cost:SetActive(visible);
end

function UISkillController.TestPas5(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function UISkillController.TestPas6(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function UISkillController:SetColor(color)
  LuaHelper.SetColor(self.rawImage_Icon, color);
end

function UISkillController:SetLock(isLock, lockEvent)
  self.gameObject_Lock:SetActive(isLock);
  
  self.event_Lock:ClearListener();
  if lockEvent ~= nil then
    self.event_Lock:SetListener(EventTriggerType.PointerClick, lockEvent);
    self.event_Lock.parameter = self;
  end
end

function UISkillController:SetEvent(eventHandler)
  self.event:ClearListener();

  if eventHandler ~= nil then
    self.event:SetListener(EventTriggerType.PointerClick, eventHandler);
    self.event.parameter = self;
  else
    self.event:SetListener(EventTriggerType.PointerClick, UISkillController.OnClick);
    self.event.parameter = self;
  end
end

function UISkillController.TestPas7(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function UISkillController.TestPas8(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end


function UISkillController.TestPas9(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function UISkillController.OnClick(uiEvent)
  local self = uiEvent.parameter;

  if self.skillId == nil then return end
  if skillDatas[self.skillId] == nil then return end

  UI.Open(UISkillHint, self.skillId);
end

function UISkillController:SetSize(size)
  if size == nil then return end
  self.transform.localScale = Vector2.New(size, size);
end

function UISkillController.TestPas10(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end
