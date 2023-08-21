GdThing = {}
GdThing.__index = GdThing;

function GdThing.Demo()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function GdThing.Demo1()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function GdThing.New(index, go, parent)
  local self = {};
  setmetatable(self, GdThing);
  
  self.index = index;
  self.kind = 0;
  self.value = 0;
  self.position = Vector2.zero;
  self.isMe = false;
  self.canPickId = 0;

  self.gameObject = go;
  self.gameObject.name = string.format("GdThing_%d", index);
  self.gameObject.transform:SetParent(parent);

  self.rectTransform = go:GetComponent("RectTransform");

  self.rawImage = go:GetComponent("RawImage");
  self.rawImage.enabled = false;

  self.rawImage_blink = go.transform:Find("Image_Blink"):GetComponent("RawImage");
  self.rawImage_blink.enabled = false;

  self.event = go:GetComponent("UIEvent");
  self.event:SetListener(EventTriggerType.PointerClick, GdThing.OnClick);
  self.event.parameter = self;

  self.rectTransform.sizeDelta = Vector2.one * 32;

  return self;
end

function GdThing:UpdateView()
  if self.kind == EGdThing.Money then
    TextureManager.SetPng(ETextureUseType.None, GdThingManager.GetMoneyTexture(self.value), self.rawImage);
    self.rawImage.enabled = true;
  elseif itemDatas[self.value] ~= nil then
    itemDatas[self.value]:SetIcon(self.rawImage, ETextureUseType.Scene);
    self.rawImage.enabled = true;
  end

  if self.kind == EGdThing.Money or self.kind == EGdThing.Item then
    TextureManager.SetPngByCallBack(ETextureUseType.UI, "blink", self.rawImage_blink,
      function(sucess)
        self.rawImage_blink.enabled = true;

        self.rawImage_blink.rectTransform.sizeDelta = Vector2.New(self.rawImage_blink.texture.width, self.rawImage_blink.texture.height / 11);
        self.rawImage_blink:ShiftUV(1, 11, 0.1, -1);
      end
    );
  else
    self.rawImage_blink.texture = nil;
    self.rawImage_blink.enabled = false;
  end

  self.rectTransform.anchoredPosition = Vector2.New(self.position.x - 10, -(self.position.y - 20));
end

function GdThing.Demo2()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function GdThing.Demo3()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function GdThing:Destroy()
  poolMgr:Release("BaseGdThing", self.gameObject);

  self.rawImage.texture = nil;
  self.rawImage_blink.texture = nil;
end

function GdThing.OnClick(uiEvent)
  local self = uiEvent.parameter;

  if (Role.player.position - self.position).sqrMagnitude > GdThingManager.pickItemDistance then
    ShowCenterMessage(string.Get(40007));
    return;
  end

  if self.kind ~= EGdThing.Money and Item.ThingFindId(self.value, false) == 0 and Item.ThingFindEmpty() == 0 then
    ShowCenterMessage(string.Get(80359));
    return;
  end

  --C:023-002 <拾取場景物品> +索引(2) +kind(2) +value(2) + x(2) + y(2))
  sendBuffer:Clear()
  sendBuffer:WriteUInt16(self.index);
  sendBuffer:WriteUInt16(self.kind);
  sendBuffer:WriteUInt16(self.value);
  sendBuffer:WriteUInt16(self.position.x);
  sendBuffer:WriteUInt16(self.position.y);
  Network.Send(23, 2, sendBuffer);
end

function GdThing.RevGetThing(data)
  local result = data:ReadByte();

  if result == 0 then
    local kind = data:ReadUInt16();
    local value = data:ReadUInt16();
    local x = data:ReadUInt16();
    local y = data:ReadUInt16();

    local picName;
    if kind == EGdThing.Money then
      picName = UI.GetMoneyIcon(value);
    else
      picName = tostring(itemDatas[value].iconId);
    end

    local effect = EffectLight.New(picName, 30, 1, 1, 1, EEffectLightTracer.Curve, x, y, 255, true, 0, Role.player.position.x, Role.player.position.y, 0.18, nil, true);
    effect:SetSortingOrder(MapManager.mapHeight);

  elseif result == 1 then
    ShowCenterMessage(string.Get(40108));
  elseif result == 2 then
    ShowCenterMessage(string.Get(40007));
  end
end

function GdThing.Demo4()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function GdThing.Demo5()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function GdThing.Demo6()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end