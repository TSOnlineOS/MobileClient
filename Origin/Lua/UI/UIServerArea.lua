UIServerArea = {}
local this = UIServerArea;

EAeraStatus = {
  Good = 1,
  Crowded = 2,
  Full = 3
}

this.name = "UIServerArea";
this.uiController = nil;

local transform_FrameRect;
local area_button;
local gameObject_Area;
local area_RectTransform;
local wrapButon = {};

this.instances = {};

function UIServerArea.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;
  area_button = uiController:FindGameObject("Image_warp");
  gameObject_Area = uiController:FindGameObject("Areas");
  area_RectTransform = gameObject_Area.gameObject:GetComponent("RectTransform");
end

function UIServerArea.OnOpen(tag)
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
---
  return true;
end

function UIServerArea.OnVisible(visible)
  if visible then
    --1--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local code = DemoCode.GetBitxor(20);
      code = code * 10;
    end
    ---2--------------------------------------------------------------
    UIFrame.Active(transform_FrameRect, string.Get(10127), this.OnClick_Close, nil, this.OnClick_Tag, nil, nil);

    this.UpdateUI();
  end
end

function UIServerArea.UpdateUI()
  if this.instances == nil then return end

  for k, v in pairs(wrapButon) do
    wrapButon[k].go:SetActive(false);
  end
  
  for k, v in pairs(this.instances) do
      if wrapButon[k] == nil then
        wrapButon[k] = {};
        wrapButon[k].go = GameObject.Instantiate(area_button);
        wrapButon[k].go.transform:SetParent(gameObject_Area.transform);
        wrapButon[k].go:GetComponent("RectTransform").localScale = Vector3.one;

        wrapButon[k].event = wrapButon[k].go:GetComponent("UIEvent");
        wrapButon[k].event:SetListener(EventTriggerType.PointerClick, this.OnClick_Area);

        wrapButon[k].text = wrapButon[k].go.transform:Find("Text_1"):GetComponent("Text");
        wrapButon[k].imgae = wrapButon[k].go.transform:Find("Image_1"):GetComponent("Image");
      end
      wrapButon[k].event.parameter = v.index;
      wrapButon[k].text.text = string.Concat(string.Get(10126), v.index);
      
      -- 分區狀態
      if v.currentPlayers ~= nil and v.maxPlayers ~= nil then 
        local x  =  (v.currentPlayers / v.maxPlayers) * 100 ;
        if x > 80 then  
          wrapButon[k].imgae.sprite = UI.GetSeverLight(EAeraStatus.Full);
        elseif x <= 80 and x > 60 then
          wrapButon[k].imgae.sprite = UI.GetSeverLight(EAeraStatus.Crowded);
        else
          wrapButon[k].imgae.sprite = UI.GetSeverLight(EAeraStatus.Good);
        end
      else
        wrapButon[k].imgae.sprite = UI.GetSeverLight(EAeraStatus.Good);
      end

      if SceneManager.instanceId ~= v.index then
        wrapButon[k].go:SetActive(true);
      else
        wrapButon[k].go:SetActive(false);
      end
  end

  area_button:SetActive(false);
  area_RectTransform.sizeDelta = Vector2.New(300, table.Count(this.instances) * 60);
  area_RectTransform.transform.localPosition = Vector3.New(0, (table.Count(this.instances) * -50) / 2, 0);
end

function UIServerArea.OnClick_Area(uiEvent)
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if SceneManager.instanceId == uiEvent.parameter then return end

  if not Team.IsAlone(Role.playerId) then
    ShowCenterMessage(string.Get(20728));
    return;
  end

  --C:007-002 <切換分區> +分區(2)
  sendBuffer:Clear();
  sendBuffer:WriteUInt16(uiEvent.parameter);
  Network.Send(7, 2, sendBuffer);
end

function UIServerArea.OnClick_Close()
  UI.Close(UIServerArea);

  return true;
end
