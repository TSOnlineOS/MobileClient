require "Controller/FurnitureController"

Furniture = {};
local this = Furniture;

this.furnitureRoot = nil;

function Furniture.Destroy()
  poolMgr:DestroyPool("FurnitureMaterial");
  poolMgr:DestroyPool("BaseFurniture");
end

function Furniture.Initialize()
  --家具根物件
  this.furnitureRoot = GameObject.Find("RoleRoot");
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
  --家具用材質球
  CGResourceManager.Load(
    "FurnitureMaterial",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("FurnitureMaterial", asset);
    end
  );
  
  --家具物件
  CGResourceManager.Load(
    "BaseFurniture",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("BaseFurniture", asset);
    end
  );

end