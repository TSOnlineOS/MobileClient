
UITutorial = {}
local this = UITutorial;

this.name = "UITutorial";
this.uiController = nil;

--ui
local transform_FrameRect;

local text_Content;

local event_Guide;

--var
local datas = {};
local tagDatas = {};

local currentTutorialId = 0;
local currentMainTag = 1;
local currentSubTag = 1;

function UITutorial.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;

  text_Content = uiController:FindText("Text_Content");

  event_Guide = uiController:FindEvent("Image_Guide");
  event_Guide:SetListener(EventTriggerType.PointerClick, this.OnClick_Guide);
  
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
end

function UITutorial.OnOpen(tutorialId)
  table.Clear(datas);
  for k, v in pairs(tutorialDatas) do
    if v.subKind ~= 0 then
      if v.guideId == 0 or BitFlag.Get(v.flagId) then
        local mainIndex = 0;

        for kk, vv in pairs(datas) do
          if tutorialDatas[vv[1]].mainKind == v.mainKind then
            mainIndex = kk;
            break;
          end
        end

        if mainIndex == 0 then
          table.insert(datas, { k });
        else
          table.insert(datas[mainIndex], k);
        end
      end
    end
  end

  currentTutorialId = datas[1][1];
  currentMainTag = 1;
  currentSubTag = 1;

  table.Clear(tagDatas);
  for k, v in pairs(datas) do
    for kk, vv in pairs(v) do
      if tagDatas[k] == nil then
        for kkk, vvv in pairs(tutorialDatas) do
          if vvv.subKind == 0 and vvv.mainKind == tutorialDatas[vv].mainKind then
            tagDatas[k] = { string.Get(vvv.name) };
            break;
          end
        end
      end

      if tagDatas[k] ~= nil then
        if tagDatas[k][2] == nil then
          tagDatas[k][2] = {};
        end

        tagDatas[k][2][kk] = string.Get(tutorialDatas[vv].name);

        if tutorialId ~= nil and vv == tutorialId then
          currentTutorialId = tutorialId;
          currentMainTag = k;
          currentSubTag = kk;
        end
      end
    end
  end

  return true;
end

function UITutorial.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(20379), this.OnClick_Close, nil, this.OnClick_Tag, tagDatas, currentMainTag, currentSubTag);

    this.UpdateUI();
  end
end

function UITutorial.UpdateUI()
  text_Content.text = string.Concat("\n", string.Get(tutorialDatas[currentTutorialId].name), "\n\n", string.Get(tutorialDatas[currentTutorialId].content));

  event_Guide.gameObject:SetActive(tutorialDatas[currentTutorialId].guideId ~= 0)
end

function UITutorial.OnClick_Close()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  
  UI.Close(UITutorial);

  return true;
end

function UITutorial.OnClick_Tag(mainTag, subTag)
  if datas[mainTag] == nil then return false end
  if datas[mainTag][subTag] == nil then return false end

  currentTutorialId = datas[mainTag][subTag];
  currentMainTag = mainTag;
  currentSubTag = subTag;

  this.UpdateUI();
  
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  
  return true;
end

function UITutorial.OnClick_Guide()
  if tutorialDatas[currentTutorialId].guideId == 0 then return end

  UI.CloseAllPreviousUI();
  UITeach.Guide(tutorialDatas[currentTutorialId].guideId);
end