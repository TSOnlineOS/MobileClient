DragonBoat = {};
local this = DragonBoat;

this.inFestival = false;

function DragonBoat.Initialize()
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

function DragonBoat.InRaceScene()
  return Between(SceneManager.sceneId, 49911, 49915) or Between(SceneManager.sceneId, 49963, 49982);
end

function DragonBoat.ShowNextMessage()
  local message = nil;
  
  message = string.Get(80236);

  if string.IsNullOrEmpty(message) then return end

  ShowTalkMessage(nil, message, Role.mapNpcs[1]);
end

function DragonBoat.ActivityStart()
  this.inFestival = true;
end

function DragonBoat.ActivityEnd()
  this.inFestival = false;
end