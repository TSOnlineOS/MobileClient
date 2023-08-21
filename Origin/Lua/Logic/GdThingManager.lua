require "View/GdThing"

EGdThing = {
  None = 0;
  Item = 1; --地上物為物品
  Money = 2; --地上物為金錢
  BornItem = 3; --地上長出物
  CashGift = 4; --紅包
}

GdThingManager = {};
local this = GdThingManager;

this.gameObject = nil;
this.transform = nil;

this.maxThing = 255;        --某一場景地上物最大數量
this.pickItemDistance = math.pow(150, 2);

local moneyTextures = {};
moneyTextures[1] = "GdMoney1";
moneyTextures[2] = "GdMoney2";
moneyTextures[3] = "GdMoney3";
moneyTextures[4] = "GdMoney4";
moneyTextures[5] = "GdMoney5";

local groundThings = {};

function GdThingManager.Destroy()
  poolMgr:DestroyPool("BaseGdThing");
end

function GdThingManager.Initialize()
  this.gameObject = GameObject.Find("GdThingRoot");
  this.transform = this.gameObject.transform;

  CGResourceManager.Load(
    "BaseGdThing",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("BaseGdThing", asset);
    end
  );
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
  NotifyManager.Register(ENotifyManager.ExitScene, "GdThingManager", this.Clear);
end

function GdThingManager.GetMoneyTexture(value)
  if value <= 99 then
    return moneyTextures[1];
  elseif value <= 999 then
    return moneyTextures[2];
  elseif value <= 9999 then
    return moneyTextures[3];
  elseif value <= 99999 then
    return moneyTextures[4];
  else
    return moneyTextures[5];
  end
end

function GdThingManager.FindThingSlot()
  for i = 1, this.maxThing do
    if groundThings[i] == nil then
      return i;
    end
  end

  return nil;
end

function GdThingManager.AddThing(kind, index, value, x, y, isMe, canPickId)
  if kind == EGdThing.Item and (value == 46074 or value == 46076) then
    kind = EGdThing.CashGift;
  end

  index = index or this.FindThingSlot();

  if index == nil then return end

  if groundThings[index] == nil then
    groundThings[index] = GdThing.New(index, poolMgr:Get("BaseGdThing"), this.transform);
  end

  groundThings[index].kind = kind;
  groundThings[index].value = value;
  groundThings[index].position.x = x;
  groundThings[index].position.y = y;
  groundThings[index].isMe = isMe;
  groundThings[index].canPickId = canPickId;
  groundThings[index].rawImage.material = GridController.SceneMaterial;

  if kind == EGdThing.CashGift then
    Bribe.Create(groundThings[index]);
  else
    groundThings[index]:UpdateView();
  end
end

function GdThingManager.RemoveThing(index)
  if groundThings[index] == nil then return end

  groundThings[index]:Destroy();
  groundThings[index] = nil;
end

function GdThingManager.Clear()
  for k, v in pairs(groundThings) do
    this.RemoveThing(k);
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