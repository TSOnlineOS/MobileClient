local json = require 'cjson'

Announcement = {}
local this = Announcement;

this.client = {};
this.client.dontShowToday = false;
this.client.saveTime = 0;
this.client.show = {};

this.maxPic = 5;
this.textures = {};
this.response = {};
this.loadComplete = false;  --完成載圖
this.haveTextFile = false;  --json存檔
this.openUI = false;

this.picName = "NoticePic/NoticePic_";

function Announcement.Initialize()
  local jsonText = CGResourceManager.ReadText("Announcement.txt");

  if not string.IsNullOrEmpty(jsonText) then
    local data = json.decode(jsonText);

    if data.dontShowToday ~= nil then
      this.client.dontShowToday = data.dontShowToday;
    end

    if data.saveTime ~= nil then
      this.client.saveTime = data.saveTime;
    end

    if data.show ~= nil then
      for k, v in pairs(data.show) do
        this.client.show[tonumber(k)] = v;
      end
    end
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
  this.haveTextFile = not string.IsNullOrEmpty(jsonText);
end

function Announcement.Save()
  local jsonText = json.encode(this.client);

  CGResourceManager.WriteText("Announcement.txt", jsonText);
end

--load 公告圖
function Announcement.CheckHaveAnnouncement()
  if not BitFlag.Get(EBitFlag.Announcement) then
    if Announcement.client.show ~= nil then
      for k, v in pairs(Announcement.client.show) do
        Announcement.client.show[k] = false;
      end
    end
  end

  if this.loadComplete then
    for k, v in pairs(this.response) do
      if this.client.show[k] ~= nil and this.client.show[k] == false and v then
        this.openUI = true;
        break;
      end
    end
  else
    if this.haveTextFile then
      if this.CheckShowPic() then
        this.DownTexture();
      end
    else
      this.DownTexture();
    end
  end
end

function Announcement.DownTexture()
  CGTimer.AddListener(this.CheckResponse, 1, true);

  for i = 1, this.maxPic do
    CGResourceManager.LoadTextureByCoroutine(string.Concat(this.picName, i, ".png"), i, this.LoadComplete, this.Exception);
  end
end

function Announcement.LoadComplete(texture, index)
  this.textures[index] = texture;
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
  this.response[index] = true;
end

function Announcement.Exception(index)
  this.textures[index] = nil;

  this.response[index] = false;
end

function Announcement.CheckResponse()
  if table.Count(this.response) == this.maxPic then

    CGTimer.RemoveListener(this.CheckResponse);

    for k, v in pairs(this.response) do
      if v then
        this.loadComplete = true;
        break;
      end
    end

    for k, v in pairs(this.response) do
      if this.haveTextFile then
        if this.client.show[k]~= nil and this.client.show[k] == false and v then
          this.openUI = true;
          break;
        end
      else
        if v then
          this.openUI = true;
          break;
        end
      end
    end
  end
end

function Announcement.CheckShowPic()
  local result = false;

  for k, v in pairs(this.client.show) do
    if v == false then
      result = true;
      break;
    end
  end

  return result;
end

function Announcement.CheckOpenUI()
  if this.openUI then
    UI.Open(UIAnnouncement);
    this.openUI = false;
  end
end