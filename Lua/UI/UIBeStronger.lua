UIBeStronger = {}
local this = UIBeStronger;

this.name = "UIBeStronger";
this.uiController = nil;

local transform_FrameRect;

local scrollContent_Method;
local scrollItems_Method = {};

--var
local currentTag = 1;
local currentSubTag = 1;

local tagDatas = {};

function UIBeStronger.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;

  scrollContent_Method = uiController:FindScrollContent("ScrollContent_Method");
  scrollContent_Method.onInitialize = this.OnInitialize_ScrollContent_Method;
  scrollContent_Method.onItemChange = this.OnItemChange_ScrollContent_Method;
  scrollContent_Method:Initialize(1);
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  --tag
  for k, v in pairs(beStrongerDatas) do
    tagDatas[k] = {};
    tagDatas[k][1] = string.Get(v.name);

    for k1, v1 in pairs(v.subname) do
      if tagDatas[k][2] == nil then
        tagDatas[k][2] = {};
      end

      tagDatas[k][2][k1] = string.Get(v1);
    end
  end
end

function UIBeStronger.OnOpen()
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  currentTag = 1;
  currentSubTag = 1;

  return true;
end

function UIBeStronger.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(21535), this.OnClick_Close, nil, this.OnClick_Tag, tagDatas, currentTag, currentSubTag);

    this.UpdateUI();
  end
end

function UIBeStronger.UpdateUI()
  local num = this.GetPageNum(currentTag, currentSubTag);

  scrollContent_Method:Reset(num);
end

function UIBeStronger.GetPageNum(tag, subtag)
  local count = 0;
  local check = "";

  if tagDatas[tag][2] ~= nil then
    if beStrongerDatas[tag].subname[subtag] ~= nil then

      check = beStrongerDatas[tag].subname[subtag];

      for k, v in pairs(beStrongerDatas[tag].methods) do
        if v.subname == check then
          count = count + 1;
        end
      end
    end
  else
    count = table.maxn(beStrongerDatas[tag].methods);
  end
  
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  return count;
end

function UIBeStronger.OnClick_Close()
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
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  UI.Close(UIBeStronger);

  return true;
end

function UIBeStronger.OnClick_Tag(tag, subTag)
  currentTag = tag;
  currentSubTag = subTag;
  
  this.UpdateUI();

  return true;
end

function UIBeStronger.OnClick_Link(uiEvent)
  local method = beStrongerDatas[currentTag].methods[uiEvent.parameter];

  if method == nil then return end
  
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------

  UI.Close(UIBeStronger);
  Function.Use(method.functionId, method.param1, method.param2);
end

function UIBeStronger.OnInitialize_ScrollContent_Method(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Method[itemIndex] = {};
    scrollItems_Method[itemIndex].text_Tip = scrollItems[itemIndex]:Find("Text_Tip"):GetComponent("Text");

    scrollItems_Method[itemIndex].event_Link = scrollItems[itemIndex]:Find("Image_Link"):GetComponent("UIEvent");
    scrollItems_Method[itemIndex].event_Link:SetListener(EventTriggerType.PointerClick, this.OnClick_Link);
  end
end

function UIBeStronger.OnItemChange_ScrollContent_Method(dataIndex, itemIndex)
  local index = this.GetScrollContent_Method_Index(dataIndex);
  local method = beStrongerDatas[currentTag].methods[index];

  if method == nil then return false end

  local msg = string.Get(method.name);
  local check = MarkManager.GetMissionFlag(method.checkvalue);

  if method.checkvalue ~= 0 and check then
    msg = string.Concat(msg,"(",string.Get(21061),")");
  end

  scrollItems_Method[itemIndex].text_Tip.text = msg;

  scrollItems_Method[itemIndex].event_Link.parameter = index;
  
  return true;
end

function UIBeStronger.GetScrollContent_Method_Index(dataIndex)
  local count = 1;
  
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  
  if tagDatas[currentTag][2] ~= nil then
    for i = 0, currentSubTag - 1, 1 do
      count = count + this.GetPageNum(currentTag, i);
    end
  end

  return dataIndex + count;
end