UIShowSceneEffect = {}
local this = UIShowSceneEffect;

this.name = "UIShowSceneEffect";
this.uiController = nil;
this.gameObject = nil;

function UIShowSceneEffect.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  
  this.gameObject = go;
end

function UIShowSceneEffect.OnOpen()
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 1;
  end
  ---2--------------------------------------------------------------
  return true;
end

function UIShowSceneEffect.OnClose()
  return true;
end

function UIShowSceneEffect.GetUIObject()
  return this.gameObject;
end
