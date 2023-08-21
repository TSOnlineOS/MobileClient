UIFurnitureInteractive = {}
local this = UIFurnitureInteractive;

this.name = "UIFurnitureInteractive";
this.uiController = nil;

EFurnitureInteractive = {
  Move = 1, --移動家具，必須放在1
  Check = 2, --確定
  Receive = 3, --收回背包
  ChangeDirection = 4, --換方向
  Cancel = 5, --取消
}

local image_Interactive = {};
local image_InteractiveRoot;
local furnitureController;
local mouseAndGameObjectDistance = Vector2.zero;
local furnitureUpdateTime = 0;
local updateCameraPositionSensitivity = 5;

this.interactiveFunctions = {};

function UIFurnitureInteractive.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;

  local event_Mask = uiController:FindEvent("Image_Mask");
  event_Mask:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);

  image_InteractiveRoot = uiController:FindImage("InteractiveRoot");

  local tempEvent;
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  
  for i = 1, table.Count(EFurnitureInteractive) do
    image_Interactive[i] = uiController:FindImage(string.Concat("Image_Interactive (", i, ")"));
    tempEvent = uiController:FindEvent(string.Concat("Image_Interactive (", i, ")"));

    --移動家具操作方式不一樣，另外處理
    if i == 1 then
      tempEvent:SetListener(EventTriggerType.PointerDown, this.OnPress_Move);
      tempEvent:SetListener(EventTriggerType.PointerUp, this.OnRelease_Move);
      tempEvent.parameter = i;
    elseif tempEvent ~= nil then
      tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Interactive);
      tempEvent.parameter = i;
    end
  end
end

function UIFurnitureInteractive.OnOpen(target)
  if target == nil then
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  
    UI.Close(this);
    return
  end

  furnitureController = target;
  furnitureController:SetOutline(furnitureController:CheckStatus());
  this.UpdateUIPosition();
  HouseEditorManager.SetAreaActive(target.data.type);

  if UI.IsVisible(UIHouseEditor) then
    UIHouseEditor.ShowEditorUI(false);
    UIHouseEditor.ShowFurnitureInfoUIAnimation(true);
  end

  if furnitureController:HasOldBlock() then
    image_Interactive[EFurnitureInteractive.Receive].enabled = true;
  else
    image_Interactive[EFurnitureInteractive.Receive].enabled = false;
  end

  return true
end


function UIFurnitureInteractive.OnClose()
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  CGTimer.RemoveListener(this.OnDrag_Move);
  image_InteractiveRoot.rectTransform.localScale = Vector3.one;
  HouseEditorManager.UpdateAllBlockState();
end

function UIFurnitureInteractive.OnClick_Close()
  if CGTimer.ContainsListener(this.OnDrag_Move) then return end
  this.interactiveFunctions[EFurnitureInteractive.Check]();
end

function UIFurnitureInteractive.UpdateUIPosition()
  if furnitureController == nil then return end

  local targetPosition = furnitureController:GetMiddlePosition();

  --世界座標轉成螢幕座標
  local screenPosition = Scene.sceneCamera:WorldToScreenPoint(targetPosition);

  --螢幕座標轉成UI座標
  image_InteractiveRoot.rectTransform.anchoredPosition = ConvertPositionToUIScene(this.uiController.transform, screenPosition, UI.camera);
  this.UpdateCameraPosition();
end

function UIFurnitureInteractive.UpdateCameraPosition()
  if math.abs(image_InteractiveRoot.rectTransform.anchoredPosition.x) + 100 > Scene.currentSceneHalfWidth or
    math.abs(image_InteractiveRoot.rectTransform.anchoredPosition.y) + 100 > Scene.currentSceneHalfHeight then
    local cameraPosition = Scene.cameraPosition:Clone();
    local direction = image_InteractiveRoot.rectTransform.anchoredPosition.normalized * updateCameraPositionSensitivity;
    local position = Vector2.New(cameraPosition.x+direction.x, cameraPosition.y - direction.y + Scene.playerOffsetY);
    Scene.UpdateCamera(position);
  end
end

function UIFurnitureInteractive.OnClick_Interactive(uiEvent)
  if furnitureController == nil then
    UI.Close(this);
    return
  end

  this.interactiveFunctions[uiEvent.parameter]();
end

function UIFurnitureInteractive.OnPress_Move(uiEvent)
  --紀錄初始按的位置
  mouseAndGameObjectDistance = Scene.ConvertPositionToUIScene(uiEvent.eventData.position) - furnitureController.gameObject.transform.localPosition;

  --隱藏功能按鍵
  image_InteractiveRoot.rectTransform.localScale = Vector3.zero;

  if UI.IsVisible(UIHouseEditor) then
    UIHouseEditor.ShowFurnitureInfoUIAnimation(false);
  end

  if not CGTimer.ContainsListener(this.OnDrag_Move) then
    CGTimer.AddListener(this.OnDrag_Move, furnitureUpdateTime, true);
  end
end

function UIFurnitureInteractive.OnDrag_Move()
  if not Input.GetMouseButton(0) then
    this.OnRelease_Move();
  end

  local position = Scene.ConvertPositionToUIScene(Input.mousePosition);
  local furniturePosition = Vector2.New(position.x - mouseAndGameObjectDistance.x, position.y - mouseAndGameObjectDistance.y);
  local blockX, blockY, blockZ = HouseEditorManager.FindNearestBlock(furniturePosition, furnitureController);

  furnitureController:ChangePosition(blockX, blockY, blockZ);
  furnitureController:SetOutline(furnitureController:CheckStatus());
  furnitureController:SetAlpha(0.5);
  this.UpdateUIPosition();
end

function UIFurnitureInteractive.OnRelease_Move()
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  --顯示功能按鈕
  image_InteractiveRoot.rectTransform.localScale = Vector3.one;
  this.UpdateUIPosition();
  furnitureController:SetAlpha(1);
  CGTimer.RemoveListener(this.OnDrag_Move);

  if UI.IsVisible(UIHouseEditor) then
    UIHouseEditor.ShowFurnitureInfoUIAnimation(true);
  end
end

UIFurnitureInteractive.interactiveFunctions[EFurnitureInteractive.Check] = function()
  local status = furnitureController:CheckStatus();

  if status == EFurnitureStatus.CanNotPlace then
    ShowCenterMessage(string.Get(23584));
  elseif status == EFurnitureStatus.CanChange then
    --取代掉的家具不直接收回背包，場景上生一個
    local replacedFurniture = furnitureController.oldFurniture;
    local furnitureId = replacedFurniture.Id;
    furnitureController:ClearOldFurniture();
    furnitureController:ConfirmPosition();
    UI.Close(this);
    UIHouseEditor.GenerateFurniture(furnitureId);
    UIHouseEditor.UpdateFurnitureInfo(furnitureId);
  elseif status == EFurnitureStatus.CanPlace then
    --如果是新生成的家具，開啟自動生成，自動在場景上再生一個
    local isNewCreate = not furnitureController:HasOldBlock();
    furnitureController:ConfirmPosition();
    UI.Close(this);

    if UIHouseEditor.IsAutoGenerate() and isNewCreate then
      local furnitureID = UIHouseEditor.GetCurrentFurnitureID();

      if FurnitureManager.GetFurnitureAmount(furnitureID) > 0 then
        UIHouseEditor.GenerateFurniture(furnitureID);
      elseif UI.IsVisible(UIHouseEditor) then
        UIHouseEditor.ShowEditorUI(true);
      end
    elseif UI.IsVisible(UIHouseEditor) then
      UIHouseEditor.ShowEditorUI(true);
    end
  end
end

UIFurnitureInteractive.interactiveFunctions[EFurnitureInteractive.Receive] = function()
  FurnitureManager.RemoveFurnitureOnScene(furnitureController);
  furnitureController:ClearOldBlockProperty();
  furnitureController:Destroy();
  furnitureController = nil;

  if UI.IsVisible(UIHouseEditor) then
    UIHouseEditor.ShowEditorUI(true);
  end

  UI.Close(this);
end

UIFurnitureInteractive.interactiveFunctions[EFurnitureInteractive.ChangeDirection] = function()
  --牆上物品沒有轉向功能
  if furnitureController.data.type == EFurnitureType.Wall then return end

  local direction = furnitureController.direction;
  direction = (direction + 1) % furnitureController.data.faceTo;
  furnitureController:ChangeDirection(direction);
  furnitureController:SetOutline(furnitureController:CheckStatus());
  this.UpdateUIPosition();
end

UIFurnitureInteractive.interactiveFunctions[EFurnitureInteractive.Cancel] = function()
  if furnitureController:HasOldBlock() then
    furnitureController:RecoverToOldPosition();
    furnitureController:SetOutline(furnitureController:CheckStatus());
    this.UpdateUIPosition();
  else
    this.interactiveFunctions[EFurnitureInteractive.Receive]();
  end
end