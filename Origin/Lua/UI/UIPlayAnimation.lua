UIPlayAnimation = {}
local this = UIPlayAnimation;

this.name = "UIPlayAnimation";
this.uiController = nil;

local gameObject_AnimationRoot;
local image_Mask;

this.hintBGTop = -134;
this.hintBGBottom = -191;
this.fontHeight = 23.3;

this.EKind = {
  LevelUp = 4,
  CountDown = 6, 
  NewYear = 7,
}

function UIPlayAnimation.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;

  gameObject_AnimationRoot = uiController:FindGameObject("GameObject_Root");

  image_Mask = uiController:FindImage("Image_Mask");

  local tempEvent = uiController:FindEvent("Image_Mask");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);
end

function UIPlayAnimation.OnOpen(kind)
  return true;
end

function UIPlayAnimation.OnClick_Close()
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
  CGTimer.RemoveListener(this.OnClick_Close);

  AnimationController.Destory(this.EKind.LevelUp);
  AnimationController.Destory(this.EKind.CountDown);
  AnimationController.Destory(this.EKind.NewYear);

  UI.Close(this);
end

function UIPlayAnimation.Play(kind, value)
  AnimationController.Destory(kind);

  if not UI.IsVisible(UIPlayAnimation) then
    UI.Open(UIPlayAnimation);
  end

  AnimationController.Play(kind, gameObject_AnimationRoot.transform, this.PlayAnimationEnd, this.LoadAssetBack, nil, value);
end

function UIPlayAnimation.LoadAssetBack(animationController)
  image_Mask.gameObject:SetActive(animationController.animationId == this.EKind.LevelUp);

  if animationController.animationId == this.EKind.LevelUp then
    this.SetLevelUpInfo(animationController);
    CGTimer.AddListener(this.OnClick_Close, 30, false);
  elseif animationController.animationId == this.EKind.CountDown then
    this.SetCountDownInfo(animationController);
  end
end

function UIPlayAnimation.PlayAnimationEnd()
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
end

function UIPlayAnimation.SetLevelUpInfo(animationController)
  animationController.object.transform.localPosition = Vector3.New(0, 122, 0);

  local text_Lv = animationController.object.transform:Find("UP1_01_A").gameObject.transform:Find("Text_Lv"):GetComponent("Text");
  local text_Hint = animationController.object.transform:Find("UP1_05_A").gameObject.transform:Find("Image_HintBG").gameObject.transform:Find("Text_Hint"):GetComponent("Text"); 
  local imageHintBGRectTransform = animationController.object.transform:Find("UP1_05_A").gameObject.transform:Find("Image_HintBG"):GetComponent("RectTransform");
  if Role.player:GetAttribute(EAttribute.Turn) >= 3 then
    imageHintBGRectTransform.gameObject:SetActive(false);
    text_Lv.text = Role.player:GetAttribute(EAttribute.Lv);
  else
    imageHintBGRectTransform.gameObject:SetActive(true);
    text_Lv.text = Role.player:GetAttribute(EAttribute.Lv);

    local text = "";
    text = string.Concat(string.Get(20046), "\n", string.Get(20047), "\n", string.Get(20048));

    local count = 0;
    if lvUpDatas[Role.player:GetAttribute(EAttribute.Lv)] ~= nil  then
      text = string.Concat(text, "\n");
      count = count + 1;   
      text = string.Concat(text, "\n");
      count = count + 1;
      text = string.Concat(text, string.Get(20059));  
      text = string.Concat(text, "\n");
      count = count + 1;
      text = string.Concat(text, string.Get(lvUpDatas[Role.player:GetAttribute(EAttribute.Lv)].stringId));  
    end

    text_Hint.text = text;

    imageHintBGRectTransform.offsetMax = Vector2.New(imageHintBGRectTransform.offsetMax.x, this.hintBGTop);    
    imageHintBGRectTransform.offsetMin = Vector2.New(imageHintBGRectTransform.offsetMin.x, this.hintBGBottom - count * this.fontHeight);
  end
end

function UIPlayAnimation.SetCountDownInfo(animationController)
  local textNumber = animationController.object.transform:Find("Particle_00003_01"):GetComponent("Text");
  textNumber.text = animationController.parameter
end