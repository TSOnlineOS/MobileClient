
UIPathTest = {};
local this = UIPathTest;

this.name = "UIPathTest";
this.uiController = nil;

local text_Scene;
local InputField_Scene;

local text_Pos;
local inputField_PosX;
local inputField_PosY;

local inputField_Mission;
local inputField_Step;

local text_Idx;
local inputField_Idx;

local inputField_MapID;

function UIPathTest.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  
  text_Scene = uiController:FindText("Text_Scene");
  text_Pos = uiController:FindText("Text_Pos");
  text_Idx = uiController:FindText("Text_Idx");

  inputField_Scene = uiController:FindInputField("InputField_Scene");
  inputField_PosX = uiController:FindInputField("InputField_PosX");
  inputField_PosY = uiController:FindInputField("InputField_PosY");
  inputField_Mission = uiController:FindInputField("InputField_Mission");
  inputField_Step = uiController:FindInputField("InputField_Step");
  inputField_Idx = uiController:FindInputField("InputField_Idx");
  inputField_MapID = uiController:FindInputField("InputField_MapID");
  
  local tempEvent = nil;
  
  tempEvent = uiController:FindEvent("Image_TestAll");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_TestAll);
  
  tempEvent = uiController:FindEvent("Image_StartMission");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_StartMission);
  
  tempEvent = uiController:FindEvent("Image_Scene");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Scene);

  tempEvent = uiController:FindEvent("Image_Pos");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Pos);

  tempEvent = uiController:FindEvent("Image_IdxTest");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_IdxTest);

  tempEvent = uiController:FindEvent("Image_Reset");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Reset);

  tempEvent = uiController:FindEvent("Image_TestGroup");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_TestGroup);

  tempEvent = uiController:FindEvent("Image_TestGroupAll");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_TestGroupAll);  

  tempEvent = uiController:FindEvent("Image_ReadGroup");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ReadGroup);  

  tempEvent = uiController:FindEvent("Image_NSTest");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_NSTest);
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

  tempEvent = uiController:FindEvent("Image_NSRead");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_NSRead);  

  tempEvent = uiController:FindEvent("Image_MarkGroup");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_MarkGroup);  

  tempEvent = uiController:FindEvent("Image_ReadMarkGroup");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ReadMarkGroup);  

  tempEvent = uiController:FindEvent("Image_CreateAll");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_CreateAll);  

  tempEvent = uiController:FindEvent("Image_Close");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);  

  tempEvent = uiController:FindEvent("Image_SceneFight");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_SceneFight); 
end

function UIPathTest.Update()
  text_Scene.text = string.Concat("SceneID:",  MissionPathTest.nowSceneId);
  text_Pos.text = string.Concat("X:",  MissionPathTest.nowSelfPos.x, " Y:", MissionPathTest.nowSelfPos.y);
  text_Idx.text = string.Concat("MissionIDX:", MissionPathTest.markIdx, " MissionID",  MissionPathTest.GetMissionID(MissionPathTest.markIdx));
end

function UIPathTest.OnOpen()
  CGTimer.AddListener(this.Update, 0.03);   
  return true;
end


function UIPathTest.OnClick_TestAll()
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  MissionPathTest.TestAll();
end

function UIPathTest.OnClick_StartMission()
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
  local id = tonumber(inputField_Mission.text);
  local step = tonumber(inputField_Step.text);
  MissionPathTest.Navigation(id, step);
end

function UIPathTest.OnClick_Scene()
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  local sceneId = tonumber(inputField_Scene.text);
  MissionPathTest.SetScene(sceneId);
end

function UIPathTest.OnClick_Pos()
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  local x = tonumber(inputField_PosX.text);
  local y = tonumber(inputField_PosY.text);
  MissionPathTest.SetPos(x, y);
end

function UIPathTest.OnClick_IdxTest()
  local idx = tonumber(inputField_Idx.text);  
  MissionPathTest.IdxTest(idx);
end

function UIPathTest.OnClick_Reset()
  
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  MissionPathTest.ResetPosition();
end

function UIPathTest.OnClick_TestGroup()
  local id = tonumber(inputField_MapID.text);
  MissionPathTest.TestGroup(id);  
end

function UIPathTest.OnClick_TestGroupAll()
  MissionPathTest.CheckAllGroup();
end

function UIPathTest.OnClick_ReadGroup()
  MissionPathTest.ReadSceneGroupData();
end

function UIPathTest.OnClick_NSTest()
  MissionPathTest.NextSceneGroupTest();
end

function UIPathTest.OnClick_NSRead()
  MissionPathTest.ReadNextSceneDoorGroup();
end

function UIPathTest.OnClick_MarkGroup()
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
  MissionPathTest.CreateMarkGroup();
end

function UIPathTest.OnClick_ReadMarkGroup()
  MissionPathTest.ReadMarkGroupData();
end

function UIPathTest.OnClick_CreateAll()
  MissionPathTest.ExportAll();
end

function UIPathTest.OnClick_Close()
  UI.Close(UIPathTest);
end

function UIPathTest.OnClick_SceneFight()
  MissionPathTest.StartCreateSceneFight();
end
