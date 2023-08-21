UIValueBar = {}
local this = UIValueBar;

this.name = "UIValueBar";
this.uiController = nil;

local image_BG;

local text_Name;
local text_Title;
local text_Value;

local currentRole;
local currentFollowIndex;

function UIValueBar.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;

  image_BG = uiController:FindGameObject("Image_BG"):GetComponent("RectTransform");
  text_Name = uiController:FindText("Text_Name");
  text_Title = uiController:FindText("Text_Title");
  text_Value = uiController:FindText("Text_Value");
end

function UIValueBar.OnOpen()
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
  return false;
end

function UIValueBar.Active(parent, restrict, active)
  local isPlayer = false
  local show = false

  image_BG.gameObject:SetActive(active);
  if not active then
    return
  end

  text_Name.text, text_Value.text, isPlayer = UIStatus.GetRoleNameAndBarValue();
  
  show = active and this.ItemForPlayerOrNpc(restrict, isPlayer)

  image_BG.gameObject:SetActive(show);
  image_BG:SetParent(parent);
  image_BG.localPosition = Vector2.New(-251, 160);
end

function UIValueBar.ItemForPlayerOrNpc(restrict, isPlayer)
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  if bit.band(restrict, 64) == 64 and bit.band(restrict, 128) ~= 128 and isPlayer then
    return true
  elseif bit.band(restrict, 128) == 128 and bit.band(restrict, 64) ~= 64 and not isPlayer then
    return true
  elseif bit.band(restrict, 128) ~= 128 and bit.band(restrict, 64) ~= 64 then
    return true
  else
    return false
  end
end