UIJoystick = {}
local this = UIJoystick;

this.name = "UIJoystick";
this.uiController = nil;

local image_Joystick;
local image_JoystickBG;

--const
local minTouchMoveValue = 30;
local dragMagnitude = 65.0;
local movementLength = 240;

--var
local joystickDragStart = false;
local joystickStartPosition = Vector2.zero;
local moveDirection = Vector2.zero;

local joystickTouchs = {};

local clickEffect = nil;
local clickEffectPlaying = false;

function UIJoystick.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;

  image_Joystick = uiController:FindImage("Image_Joystick");
  image_Joystick.gameObject:SetActive(false);

  image_JoystickBG = uiController:FindImage("Image_StickBG");
  image_JoystickBG.gameObject:SetActive(false);

  event_Joystick = uiController:FindEvent("Image_Mask");
  event_Joystick:SetPassEvent(EventTriggerType.PointerClick);
  event_Joystick:SetListener(EventTriggerType.PointerDown, this.OnPress_Joystick);
  event_Joystick:SetListener(EventTriggerType.PointerUp, this.OnRelease_Joystick);
end

function UIJoystick.OnOpen()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
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
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
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
  this.Clear();

  return true;
end

function UIJoystick.OnClose()
  
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
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
  this.Clear();

  return true;
end

function UIJoystick.Clear()
  table.Clear(joystickTouchs);

  this.OnDragJoystickEnd();
  this.StopClickEffect();
end

function UIJoystick.IsDrag()
  return joystickDragStart;
end

function UIJoystick.IsClick()
  return clickEffect ~= nil or clickEffectPlaying;
end

function UIJoystick.GetDirectDelta()
  --moveDirection是記錄搖桿的位移 ex. deltaX > 0, deltaY > 0 往第一象限移動 
  return moveDirection.x, moveDirection.y;
end

local joystickPosition = Vector2.zero;
local joystickOnDrag = false;
function UIJoystick.Update()
  joystickPosition.x = joystickStartPosition.x;
  joystickPosition.y = joystickStartPosition.y;

  joystickOnDrag = table.Count(joystickTouchs) == 1;
  
  if joystickOnDrag then
    for k, v in pairs(joystickTouchs) do
      if Input.touchCount > 0 and Input.touchCount >= k + 1 then
        local touch = Input.GetTouch(k);
        joystickPosition.x = touch.position.x;
        joystickPosition.y = touch.position.y;
      elseif Input.GetMouseButton(0) then
        joystickPosition.x = Input.mousePosition.x;
        joystickPosition.y = Input.mousePosition.y;
      end
    end
  --[[
  elseif Input.GetKey(KeyCode.W) or Input.GetKey(KeyCode.S) or Input.GetKey(KeyCode.A) or Input.GetKey(KeyCode.D) then
    if Input.GetKey(KeyCode.S) then joystickPosition.y = -32767 end
    if Input.GetKey(KeyCode.W) then joystickPosition.y = 32767 end
    if Input.GetKey(KeyCode.A) then joystickPosition.x = -32767 end
    if Input.GetKey(KeyCode.D) then joystickPosition.x = 32767 end
    
    joystickStartPosition.x = 0;
    joystickStartPosition.y = 0;

    joystickOnDrag = true;
    
      --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
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
  --]]
  end
  
  if joystickOnDrag then
    this.OnDragJoystick(joystickPosition);
  else
    this.OnDragJoystickEnd();
  end
end

function UIJoystick.OnDragJoystick(touchPosition)
  touchPosition = ConvertPositionToUIScene(this.uiController.transform, touchPosition, this.uiController.canvas.worldCamera);

  if touchPosition == joystickStartPosition then return end

  moveDirection = touchPosition - joystickStartPosition;

  if not joystickDragStart then
    if moveDirection.sqrMagnitude < minTouchMoveValue * minTouchMoveValue then return end

    image_Joystick.gameObject:SetActive(true);
    image_JoystickBG.gameObject:SetActive(true);

    joystickDragStart = true;
  end
  
  image_Joystick.rectTransform.anchoredPosition = Vector2.ClampMagnitude(moveDirection, dragMagnitude);
  
  moveDirection.y = -moveDirection.y;

  this.DoMove(Role.player.position + (moveDirection.normalized * movementLength), true);
end

function UIJoystick.OnDragJoystickEnd()
  if joystickDragStart then
    image_Joystick.gameObject:SetActive(false);
    image_JoystickBG.gameObject:SetActive(false);

    joystickDragStart = false;

    this.DoStopMove();
  end
end

--UI Event
function UIJoystick.OnPress_Joystick(uiEvent)
  if table.Count(joystickTouchs) == 0 then
    joystickStartPosition = ConvertPositionToUIScene(this.uiController.transform, uiEvent.eventData.position, this.uiController.canvas.worldCamera);

    image_JoystickBG.rectTransform.anchoredPosition = joystickStartPosition;
  end

  if uiEvent.eventData.pointerId == -2 then
    if LuaHelper.IsStandalone or LuaHelper.IsAndroidPlatform then
      return
    end
  end

  joystickTouchs[uiEvent.eventData.pointerId] = true;
end

function UIJoystick.OnRelease_Joystick(uiEvent)
  joystickTouchs[uiEvent.eventData.pointerId] = nil;
end

function UIJoystick.OnClick_Scene(uiEvent)
  if joystickDragStart then return end
  if uiEvent.eventData.pointerId == -2 then
    if LuaHelper.IsStandalone or LuaHelper.IsAndroidPlatform then
      return
    end
  end

  local clickPosition = Scene.ConvertPositionToUIScene(uiEvent.eventData.position);
  clickPosition.y = -clickPosition.y;
  
  this.DoMove(clickPosition, false);
end

--Player
function UIJoystick.DoMove(position, dragMove)
  if not Role.CanControl() then return end

  if not dragMove then
    clickEffectPlaying = true;
    DoorManager.ClickDoor(position);
  end

  MarkManager.StopNavigation();
  Role.SetMoveTarget(nil);
  Role.player:Move(position, nil, false, false, dragMove);
end

function UIJoystick.DoStopMove()
  if not Role.CanControl() then return end

  Role.player:StopMove();
end

--Click Effect
function UIJoystick.SetClickEffect(position)
  if position == nil or not clickEffectPlaying or joystickDragStart then return end

  clickEffectPlaying = false;

  if clickEffect ~= nil then
    clickEffect:Free();
    clickEffect = nil;
  end

  local clickX, clickY = MapManager.GetPosition(position);
  clickY = clickY + 32; --動畫位置會扣圖片高全部、寬一半，但是高只要扣這張圖片的一半，所以把高的一半32加回去
  clickEffect = EffectLight.New("ClickEffect", 100, 1, 4, 4, EEffectLightTracer.StandAni, clickX, clickY, 255, true, 0, nil, nil, nil, nil, true);
  clickEffect.endCallback = this.OnClickEffectEnd;
end

function UIJoystick.OnClickEffectEnd(args)
  clickEffect = nil;
end

function UIJoystick.StopClickEffect()
  clickEffectPlaying = false;
  if clickEffect ~= nil then
    clickEffect:Free();
    clickEffect = nil;
  end
end