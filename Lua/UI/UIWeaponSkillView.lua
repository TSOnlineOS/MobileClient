
UIWeaponSkillView = {}
local this = UIWeaponSkillView;

this.name = "UIWeaponSkillView";
this.uiController = nil;
local gameObject_Lv = nil;

local uiCareer;

local rawImage_Skill;

local text_Name;
local text_Lv;
local text_Level0;
local text_Description;
local text_Botton;

local currentSkillId = 0;
local currentLv = 1;
local bottonMsg = nil;


function UIWeaponSkillView.Initialize(go)
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
  text_Botton = uiController:FindText("Text_Botton");

  local tempEvent;

  tempEvent = uiController:FindEvent("Image_Mask");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
end

function UIWeaponSkillView.OnOpen(skillId, lv, msg)
  if skillDatas[skillId] == nil then return false end
  if lv == nil then 
    lv = 1
  end
  currentLv = lv;

  currentSkillId = skillId;

  if msg == nil then 
    bottonMsg = "";
  else      
    bottonMsg = msg;
  end

  this.UpdateUI();
  
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

  return true;
end

function UIWeaponSkillView.UpdateUI()
  local skillData = skillDatas[currentSkillId];
  
  uiCareer:SetCareer(0, skillData.element, ECareer.None);

  skillData:SetIcon(rawImage_Skill);
 
  text_Name.text = skillData.name;
  
  gameObject_Lv:SetActive(currentLv > 0);

  text_Lv.text = currentLv;

  text_Level0.gameObject:SetActive(currentLv == 0);

  text_Description.text = skillData:GetDescription(nil, true);

  text_Botton.text = bottonMsg;
end

function UIWeaponSkillView.OnClick_Close()
  UI.Close(UIWeaponSkillView);
end