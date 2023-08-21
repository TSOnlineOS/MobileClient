
UISkillHint = {}
local this = UISkillHint;

this.name = "UISkillHint";
this.uiController = nil;
local gameObject_Lv = nil;

local uiCareer;

local rawImage_Skill;

local text_Name;
local text_Lv;
local text_Level0;
local text_Description;

local currentRole = nil;
local currentSkillId = 0;
local WithoutCondition = nil;

function UISkillHint.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  
  gameObject_Lv = uiController:FindGameObject("GameObject_Lv");

  uiCareer = UICareerController.New(uiController:FindGameObject("GameObject_Element"));

  rawImage_Skill = uiController:FindRawImage("RawImage_Skill");
 
  text_Name = uiController:FindText("Text_T6_Name");
  text_Lv = uiController:FindText("Text_T14_LvValue");
  text_Level0 = uiController:FindText("Text_Level0");
  text_Description = uiController:FindText("Text_Description");

  local tempEvent;

  tempEvent = uiController:FindEvent("Image_Mask");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);
  
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
end

function UISkillHint.OnOpen(skillId, role, withoutCondition)
  if skillDatas[skillId] == nil then return false end

  currentSkillId = skillId;
  currentRole = role;
  WithoutCondition = withoutCondition;

  this.UpdateUI();

  return true;
end

function UISkillHint.IsCurrentRole(role)
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  return role == currentRole;
end

function UISkillHint.UpdateUI()
  local skillData = skillDatas[currentSkillId];

  local skillLv = 1;
  local pointRate = 1;
  local canLevelUp = false;

  if currentRole ~= nil then
    skillLv = currentRole:GetSkillLv(currentSkillId);

    if skillData.element ~= currentRole:GetAttribute(EAttribute.Element) then
      pointRate = 2;
    end

    canLevelUp = skillLv < skillData.maxLv;
  end
  
  uiCareer:SetCareer(0, skillData.element, ECareer.None);

  skillData:SetIcon(rawImage_Skill);
 
  text_Name.text = skillData.name;
  
  gameObject_Lv:SetActive(skillLv > 0);

  text_Lv.text = skillLv;

  text_Level0.gameObject:SetActive(skillLv == 0);

  text_Description.text = skillData:GetDescription(currentRole, WithoutCondition);
end

function UISkillHint.OnClick_Close()
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  UI.Close(UISkillHint);
end

function UISkillHint.OnClick_LevelUp()
  if currentRole == nil then return end

  if currentRole:GetSkillLv(currentSkillId) > 0 then
    --升級
    if currentRole:GetAttribute(EAttribute.SkillPoint) < skillDatas[currentSkillId].levelUpPoint then
      ShowCenterMessage(string.Get(20465), 1.2);
      return;
    end

    ShowCheckMessage(
      function(result)
        if result then
          if currentRole.kind == EHuman.Player then
            --C:028-001 <玩家技能升級> <<+技能ID(2) +技能等級(1)>>
            sendBuffer:Clear()
            sendBuffer:WriteUInt16(currentSkillId);
            sendBuffer:WriteByte(currentRole:GetSkillLv(currentSkillId) + 1);
            Network.Send(28, 1, sendBuffer);
          elseif currentRole.kind == EHuman.FollowNpc then
            --C:028-002 <武將技能升級> +武將索引(1) +技能ID(2) +技能等級(1)
            sendBuffer:Clear()
            sendBuffer:WriteByte(currentRole.index);
            sendBuffer:WriteUInt16(currentSkillId);
            sendBuffer:WriteByte(currentRole:GetSkillLv(currentSkillId) + 1);
            Network.Send(28, 2, sendBuffer);
          end
        end
      end,
      string.format(string.Get(20463), skillDatas[currentSkillId].levelUpPoint),
      currentRole
    );
  else
    --學習
    local pointRate = 1;
    if skillDatas[currentSkillId].element ~= currentRole:GetAttribute(EAttribute.Element) then
      pointRate = 2;
    end

    if currentRole:GetAttribute(EAttribute.SkillPoint) < skillDatas[currentSkillId].learnPoint * pointRate then
      ShowCenterMessage(string.Get(20465), 1.2);
      return;
    end

    ShowCheckMessage(
      function(result)
        if result then
          if currentRole.kind == EHuman.Player then
            --C:028-001 <玩家技能升級> <<+技能ID(2) +技能等級(1)>>
            sendBuffer:Clear()
            sendBuffer:WriteUInt16(currentSkillId);
            sendBuffer:WriteByte(currentRole:GetSkillLv(currentSkillId) + 1);
            Network.Send(28, 1, sendBuffer);
          elseif currentRole.kind == EHuman.FollowNpc then
            --C:028-002 <武將技能升級> +武將索引(1) +技能ID(2) +技能等級(1)
            sendBuffer:Clear()
            sendBuffer:WriteByte(currentRole.index);
            sendBuffer:WriteUInt16(currentSkillId);
            sendBuffer:WriteByte(currentRole:GetSkillLv(currentSkillId) + 1);
            Network.Send(28, 2, sendBuffer);
          end
        end
      end,
      string.format(string.Get(20464), skillDatas[currentSkillId].learnPoint * pointRate),
      currentRole
    );
  end
end