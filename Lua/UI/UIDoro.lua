UIDoro = {};
local this = UIDoro;

this.name = "UIDoro";
this.uiController = nil;

this.dependenciesResourceName = "Egg"
this.OneEgg = 1;
this.MaxEgg = 10;
this.DelayOpenTime = 0.2;
this.roleScale = 2.8;

this.cardScale = 1.6;
this.cardHeight = 140;
this.cardWidth = 110;
this.quickBuyMore = false;
this.ChangeImage = {};

local gameObject_OpenAnimation;
local gameObject_TenEgg;
local gameObject_OneEgg

local currentPage;
local maxPage;
local canvas_UI;

local image_OpenAll;
local image_Close;
local image_BuyMore;

local rawImage_BG;
local rawImage_LeftTop;

local event_Prev;
local event_Next;

local text_BuyMore;
local text_Message;

local hint;

local eggOpenFlag = {};
local eggs = {};

local eggAnimationPlaying;
local bagItemId = 0;

function UIDoro.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;

  gameObject_OpenAnimation = uiController:FindGameObject("GameObject_OpenAnimation");
  gameObject_TenEgg = uiController:FindGameObject("GameObject_TenEgg");
  gameObject_OneEgg = uiController:FindGameObject("GameObject_OneEgg");

  canvas_UI = uiController:GetComponent("Canvas");

  image_OpenAll = uiController:FindImage("Image_OpenAll");
  image_Close = uiController:FindImage("Image_Close");
  image_BuyMore = uiController:FindImage("Image_BuyMore");

  rawImage_BG = uiController:FindRawImage("RawImage_BG");
  rawImage_LeftTop = uiController:FindRawImage("RawImage_LeftTop");

  text_BuyMore = uiController:FindText("Text_BuyMore");
  text_Message = uiController:FindText("Text_Message");

  local tempEvent;

  tempEvent = uiController:FindEvent("Image_Close");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);

  tempEvent = uiController:FindEvent("Image_OpenAll");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_OpenAll);

  tempEvent = uiController:FindEvent("Image_BuyMore");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_BuyMore);

  tempEvent = uiController:FindEvent("Image_Mask");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Mask);

  event_Prev = uiController:FindEvent("Image_Prev");
  event_Prev:SetListener(EventTriggerType.PointerClick, this.OnClick_ChangePage);
  event_Prev.parameter = -1;

  event_Next = uiController:FindEvent("Image_Next");
  event_Next:SetListener(EventTriggerType.PointerClick, this.OnClick_ChangePage);
  event_Next.parameter = 1;

  this.InitializeChangeImageFunc();
end

function UIDoro.OnOpen()
  this.OpenUI();

  return true;
end

function UIDoro.OnClose()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  this.ClearEgg();
  AnimationController.Destory(2);
  AnimationController.Destory(3);

  --卸載抽卡圖資源
  CGResourceManager.Unload(this.dependenciesResourceName);
  return true;
end

function UIDoro.OpenUI()
  canvas_UI.sortingOrder = 401;

  gameObject_TenEgg:SetActive(false);
  gameObject_OneEgg:SetActive(false);
  image_OpenAll.gameObject:SetActive(false);
  image_Close.gameObject:SetActive(false);
  image_BuyMore.gameObject:SetActive(false);
  text_Message.gameObject:SetActive(false);
  event_Prev.gameObject:SetActive(false);
  event_Next.gameObject:SetActive(false);

  TextureManager.SetPng(ETextureUseType.UI, "common0_bod106", rawImage_BG);
  TextureManager.SetPng(ETextureUseType.UI, "common0_bod107", rawImage_LeftTop);

  AnimationController.Play(1, gameObject_OpenAnimation.transform, this.PlayOpenAnimationEnd, this.LoadAssetBack, this.dependenciesResourceName);
end

function UIDoro.PlayOpenAnimationEnd()
  if this.IsTenEgg() then
    AnimationController.Play(2, gameObject_TenEgg.transform, this.PlayEggAnimationEnd, this.LoadAssetBack, this.dependenciesResourceName);
  elseif this.IsOneEgg() then
    AnimationController.Play(3, gameObject_OneEgg.transform, this.PlayEggAnimationEnd, this.LoadAssetBack, this.dependenciesResourceName);
  end
end

function UIDoro.OnClick_Mask()
end

function UIDoro.PlayEggAnimationEnd()
  if UIDoro.IsTenEgg() and maxPage == 1 and not this.IsEggAllOpen() then
    image_OpenAll.gameObject:SetActive(true);
  end

  eggAnimationPlaying = false;
end

function UIDoro.LoadAssetBack(animationController)
  if animationController.animationId == 1 then
    this.InitializeOpenAnimation(animationController);
    gameObject_OpenAnimation:SetActive(true);
  elseif animationController.animationId == 2 then
    this.InitializeHint(animationController);
    this.InitializeTenEgg(animationController);
    currentPage = 1;
    this.SetEggsShow();
    animationController:SetDontDestory();
    gameObject_TenEgg:SetActive(true);
    if maxPage > 1 then
      this.OnClick_OpenAll();
    end
  elseif animationController.animationId == 3 then
    this.InitializeHint(animationController);
    this.InitializeEgg(animationController, 1);
    currentPage = 1;
    this.SetEggsShow();
    animationController:SetDontDestory();
    gameObject_OneEgg:SetActive(true);
  end
end

function UIDoro.InitializeOpenAnimation(animationController)
  if Mall.GetDoroKind() == Mall.EDoroKind.Empty then --預設抽卡圖片
    Mall.SetDoroKind(Mall.EDoroKind.Card);
  end

  animationController.object.transform:Find("UI_Egg01_A").gameObject.transform:Find("Egg01").gameObject.transform:Find("04_1").gameObject:SetActive(Mall.GetDoroKind() == Mall.EDoroKind.Warrior);
  animationController.object.transform:Find("UI_Egg01_A").gameObject.transform:Find("Egg01").gameObject.transform:Find("05_1").gameObject:SetActive(Mall.GetDoroKind() == Mall.EDoroKind.Card);
  animationController.object.transform:Find("UI_Egg01_A").gameObject.transform:Find("Egg01").gameObject.transform:Find("05_2").gameObject:SetActive(Mall.GetDoroKind() == Mall.EDoroKind.Warrior);
  animationController.object.transform:Find("UI_Egg01_A").gameObject.transform:Find("Egg01").gameObject.transform:Find("05_3").gameObject:SetActive(Mall.GetDoroKind() == Mall.EDoroKind.furnitureAdvanced);
  animationController.object.transform:Find("UI_Egg01_A").gameObject.transform:Find("Egg01").gameObject.transform:Find("05_4").gameObject:SetActive(Mall.GetDoroKind() == Mall.EDoroKind.furnitureNormal);
  animationController.object.transform:Find("UI_Egg01_A").gameObject.transform:Find("Egg01").gameObject.transform:Find("05_5").gameObject:SetActive(Mall.GetDoroKind() == Mall.EDoroKind.furnitureGold);
  animationController.object.transform:Find("UI_Egg01_A").gameObject.transform:Find("Egg01").gameObject.transform:Find("05_6").gameObject:SetActive(Mall.GetDoroKind() == Mall.EDoroKind.Elf);
  animationController.object.transform:Find("UI_Egg01_A").gameObject.transform:Find("Egg01").gameObject.transform:Find("05_7").gameObject:SetActive(Mall.GetDoroKind() == Mall.EDoroKind.Soul);
  animationController.object.transform:Find("UI_Egg01_A").gameObject.transform:Find("Egg01").gameObject.transform:Find("05_8").gameObject:SetActive(Mall.GetDoroKind() == Mall.EDoroKind.ExclusiveWeapon);
  animationController.object.transform:Find("UI_Egg01_A").gameObject.transform:Find("Egg01").gameObject.transform:Find("05_9").gameObject:SetActive(Mall.GetDoroKind() == Mall.EDoroKind.Outfit);

  local eggObject = animationController.object.transform:Find("UI_Egg01_A").gameObject.transform:Find("Egg04");
  local career;
  local item;
  local npcData;

  for i = 1, this.MaxEgg do
    item = Mall.GetDoroItem(i);
    eggObject.transform:Find( string.format("E%02d", i)).gameObject:SetActive(item ~= nil);

    if item ~= nil then
      career = eggObject.transform:Find( string.format("E%02d", i)).transform:Find("Image_Career"):GetComponent("RawImage");
      if this.CheckShowNpcItem(item) then
        npcData = npcDatas[item.spare3];
        UI.SetIcon (Mall.GetEggCareerName(npcData.element), career );
      else
        UI.SetIcon( Mall.GetEggCareerName(0), career );
      end
    end
  end
end

function UIDoro.InitializeHint(animationController)
  hint = animationController.object.transform:Find("Text_Hint"):GetComponent("Text");
  hint.text = string.Get(21448);
end

function UIDoro.InitializeTenEgg(animationController)
  for i = 1, this.MaxEgg do
    this.InitializeEgg(animationController, i);
  end
end

function UIDoro.InitializeEgg(animationController, i)
  local effectObject = animationController.object.transform:Find( string.format("UI_Egg03_%02d", i) ).gameObject.transform:Find("E01").gameObject;

  eggs[i] = {};
  eggs[i].gameObject = effectObject;
  eggs[i].openAnimation = effectObject:GetComponent("Animation")
  eggs[i].event = effectObject:GetComponent("UIEvent")
  eggs[i].event:SetListener(EventTriggerType.PointerClick, this.OnClick_Egg);
  eggs[i].event.parameter = i;

  eggs[i].career = effectObject.transform:Find("Egg").gameObject.transform:Find("Image_Career"):GetComponent("RawImage");
  eggs[i].rare = effectObject.transform:Find("Egg").gameObject.transform:Find("Image_StarLv"):GetComponent("RawImage");

  eggs[i].openEffectZero = effectObject.transform:Find("EFOpen").gameObject.transform:Find("EFOpenLv_0");
  eggs[i].openEffectOne = effectObject.transform:Find("EFOpen").gameObject.transform:Find("EFOpenLv_1");
  eggs[i].openEffectTwo = effectObject.transform:Find("EFOpen").gameObject.transform:Find("EFOpenLv_2");

  eggs[i].imageRoot = effectObject.transform:Find("Image_Prize");
  eggs[i].itemRoot = eggs[i].imageRoot.gameObject.transform:Find("ItemRoot");
  eggs[i].rawImage_Role = eggs[i].imageRoot.gameObject.transform:Find("RawImage_Role"):GetComponent("RawImage");
  eggs[i].rawImage_Fram = eggs[i].imageRoot.gameObject.transform:Find("RawImage_Fram"):GetComponent("RawImage");
  eggs[i].rawImage_Disappear = eggs[i].imageRoot.gameObject.transform:Find("RawImage_Disappear"):GetComponent("UIRawImage");
  eggs[i].rawImage_Disappear:SetLoopEndCallBack(this.ChangeImage[i]);
  eggs[i].name = eggs[i].imageRoot.gameObject.transform:Find("Image_NameBG"):Find("Text_Name"):GetComponent("Text");
  eggs[i].bg = eggs[i].imageRoot.gameObject.transform:Find("Image_NameBG")
  eggs[i].message = eggs[i].imageRoot.gameObject.transform:Find("Text_Message"):GetComponent("Text");
  eggs[i].item = UIItemController.New(eggs[i].itemRoot);
end

function UIDoro.InitializeChangeImageFunc()
  for i = 1, this.MaxEgg do
    UIDoro.ChangeImage[i] = function()
      this.FurnitureExceed(i);
    end
  end
end

function UIDoro.SetEggsShow()
  local count = table.Count(eggs);
  local npcData;
  local item;
  for i = 1 ,count do
    item = Mall.GetDoroItem(this.GetDataIndex(i));
    eggs[i].openAnimation:Stop();
    eggs[i].gameObject:SetActive(item ~= nil);
    if item ~= nil then
      if this.CheckShowNpcItem(item) then
        npcData = npcDatas[item.spare3];
        UI.SetIcon( Mall.GetEggCareerName(npcData.element), eggs[i].career );
        UI.SetIcon( Mall.GetEggRareName(npcData), eggs[i].rare );
      else
        UI.SetIcon( Mall.GetEggCareerName(0), eggs[i].career );
        UI.SetIcon( Mall.GetItemRareName(item), eggs[i].rare );
      end
    end
  end
end

function UIDoro.ClearEgg()
  for i = 1, this.MaxEgg do
    if eggs[i] ~= nil and eggs[i].jmpDrawerRole ~= nil and eggs[i].jmpDrawerRole.gameObject.activeInHierarchy then
      eggs[i].jmpDrawerRole:Disable() 
    end   
  end

  eggs = {};
end

function UIDoro.IsTenEgg()
  return Mall.GetDoroCount() > this.OneEgg;
end

function UIDoro.IsOneEgg()
  return Mall.GetDoroCount() == this.OneEgg;
end

function UIDoro.OnClick_Egg(uiEvent)
  if eggAnimationPlaying then return end

  hint.text = "";
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  local index = uiEvent.parameter;
  if eggs[index] == nil or eggOpenFlag[this.GetDataIndex(index)] then
    return;
  end

  this.OpendEgg(index);

  this.UpdateUI();
end

function UIDoro.OpendEgg(index)
  local npcData;
  local dataIndex = this.GetDataIndex(index);

  local item = Mall.GetDoroItem(dataIndex);

  eggs[index].gameObject:SetActive(Mall.GetDoroItem(dataIndex) ~= nil);
  if Mall.GetDoroItem(dataIndex) == nil then
    return
  end

  if Mall.GetDoroItem(dataIndex).kind ~= EItemKind.DoroCard and eggs[index].jmpDrawerRole == nil then
    eggs[index].jmpDrawerRole = eggs[index].rawImage_Role.gameObject:AddComponent(typeof(JmpDrawer));
  end

  if Mall.GetDoroItem(dataIndex).kind == EItemKind.SpecialAbility or Mall.GetDoroItem(dataIndex).kind == EItemKind.Furniture then
    if Mall.GetDoroItem(index).kind == EItemKind.Furniture then
      eggs[index].jmpDrawerRole.luaListener = function()
        eggs[index].jmpDrawerRole:Draw(0, 0);
        eggs[index].rawImage_Role:SetNativeSize();
        this.SetFurnitureTexture(index);
      end
    end
  end

  if this.CheckShowNpcItem(item) then
    npcData = npcDatas[item.spare3];
    eggs[index].name.text = npcData.name;
    if item.kind == EItemKind.Furniture then
      eggs[index].jmpDrawerRole:GenerateAndDraw( npcData:GetAtlasParams());
    elseif item.kind == EItemKind.DoroCard then
      UI.SetIcon( string.GetCardName( item.spare3 ), eggs[index].rawImage_Role );
      UI.SetIcon( Mall.GetCardRareName( npcData ), eggs[index].rawImage_Fram );
      eggs[index].rawImage_Role.gameObject.transform.sizeDelta = Vector2.New(this.cardWidth, this.cardHeight);
      eggs[index].rawImage_Role.gameObject.transform.localScale = Vector3.New(this.cardScale, this.cardScale, this.cardScale);
      eggs[index].rawImage_Role.gameObject:SetActive(true);
      eggs[index].name.text = npcData.name.." X "..Mall.GetDoroItemCount(dataIndex);
    elseif item.kind == EItemKind.SpecialAbility then
      if item.kind == EItemKind.SpecialAbility then
        eggs[index].rawImage_Role.gameObject:SetActive(true);
      else
        eggs[index].rawImage_Role.gameObject:SetActive(false);
      end
      
      eggs[index].jmpDrawerRole:GenerateAndDraw( npcData:GetAtlasParams(ERolePose.Prepare + 1) );
      eggs[index].jmpDrawerRole.gameObject.transform.localScale = Vector3.one * this.roleScale;
    end
    eggs[index].item:SetItem(0);
    eggs[index].bg.gameObject:SetActive(true);
  else
    eggs[index].item:SetItem(item.Id);
    eggs[index].item:SetImageBG(false);

    local itemName = item:GetName(true);

    if item.kind == EItemKind.ExclusiveWeapon then
      local npcName = npcDatas[item.spare3];
      if npcName ~= nil then
        npcName = string.Concat(" 「", npcName:GetName(), "」");
        itemName = string.gsub(itemName, npcName, string.Concat("\n".. npcName));
      end
    end

    eggs[index].name.text = itemName.."X"..Mall.GetDoroItemCount(dataIndex);
    eggs[index].rawImage_Role.gameObject:SetActive(false);
  end

  if npcData ~= nil and item.kind ~= EItemKind.DoroCard then
    local _, offsetY = npcData:GetOffset();
    eggs[index].jmpDrawerRole.offsetY = offsetY;
  end

  eggs[index].rawImage_Fram.gameObject:SetActive( item.kind == EItemKind.DoroCard );
  eggs[index].rawImage_Disappear.gameObject:SetActive(false);

  if not eggOpenFlag[dataIndex] then
    eggs[index].openAnimation:Play();
  end

  eggs[index].imageRoot.gameObject:SetActive(true);

  if item.kind == EItemKind.ExclusiveWeapon then
    npcData = ExclusiveWeapon.GetExclusiveWarrior(item.Id);
  end

  if npcData ~= nil then
    eggs[index].openEffectZero.gameObject:SetActive( Mall.IsCuRare(npcData) );
    eggs[index].openEffectOne.gameObject:SetActive( Mall.IsAgRare(npcData) );
    eggs[index].openEffectTwo.gameObject:SetActive( Mall.IsAuRare(npcData) );
  else
    eggs[index].openEffectZero.gameObject:SetActive( Mall.IsCuItemRare(item) );
    eggs[index].openEffectOne.gameObject:SetActive( Mall.IsAgItemRare(item) );
    eggs[index].openEffectTwo.gameObject:SetActive( Mall.IsAuItemRare(item) );
  end

  if item.kind == EItemKind.Furniture and Mall.GetDoroItemCount(dataIndex) > 1 then
    eggs[index].message.text = string.Concat(string.Get(23624), "255");
    eggs[index].rawImage_Disappear.gameObject:SetActive(true);
    eggs[index].rawImage_Disappear:ShiftUV(1, 8, 0.2, 1);
  end
  
  if item.kind == EItemKind.Elf then
    if UIElf.CheckExpIsFull(item.spare3) then
      eggs[index].message.text = string.Get(23756);
      eggs[index].rawImage_Disappear.gameObject:SetActive(true);
      eggs[index].rawImage_Disappear:ShiftUV(1, 8, 0.2, 1);
    end
  end

  eggOpenFlag[dataIndex] = true;
end

function UIDoro.UpdateUI()
  if this.IsEggAllOpen() then
    image_Close.gameObject:SetActive(true);
    image_BuyMore.gameObject:SetActive(true);
    image_OpenAll.gameObject:SetActive(false);
    text_BuyMore.text = string.format( string.Get(21451), UIMall.GetCurrentBuyValue() );
    canvas_UI.sortingOrder = 399;
  end

  event_Prev.gameObject:SetActive(currentPage ~= 1);
  event_Next.gameObject:SetActive(currentPage ~= maxPage);
  if maxPage > 1 then
    image_OpenAll.gameObject:SetActive(false);
  end
end

function UIDoro.GetDataIndex(index)
  return index + (currentPage - 1) * this.MaxEgg;
end

function UIDoro.IsEggAllOpen()
  local count = table.Count(eggs);
  for i = 1, count do
    if not eggOpenFlag[i] and Mall.GetDoroItem(this.GetDataIndex(i)) ~= nil then
      return false;
    end
  end
  
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  return true;
end

function UIDoro.OnClick_OpenAll()
  if eggAnimationPlaying then return end

  hint.text = "";
  image_OpenAll.gameObject:SetActive(false);
  CGTimer.AddListener(this.DelayOpenAll, this.DelayOpenTime, true);
end

function UIDoro.DelayOpenAll()
  for i = 1, this.MaxEgg do
    if not eggOpenFlag[this.GetDataIndex(i)] then
      this.OpendEgg(i);
      break;
    end
  end

  if this.IsEggAllOpen() then
    CGTimer.RemoveListener(this.DelayOpenAll);
    this.UpdateUI();
  end
end

function UIDoro.OnClick_BuyMore()
  if Mall.IsMallDoro() then return end
  
  this.quickBuyMore = true;
  
  local count = 1;
  if this.IsTenEgg() then
    count = 10;
  end
  for i = 1, count do
    if eggs[i] ~= nil then
      eggs[i].openAnimation:Stop();
    end
  end
  
  image_BuyMore.gameObject:SetActive(false);
  UIMall.Buy(false);
end

function UIDoro.ReopenBuyMore()
  if this.quickBuyMore then
    image_BuyMore.gameObject:SetActive(true);
  end
end

function UIDoro.UpdateQuickBuyMore()
  if not this.quickBuyMore then return end
  currentPage = 1;
  local count = 1;
  if this.IsTenEgg() then
    count = 10;
  end
  for i = 1, count do
    this.OpendEgg(i);
  end
  
  this.UpdateUI();
end

function UIDoro.OnClick_More()
  local bagIndex = Item.GetItemIndex(bagItemId);
  if bagIndex <= 0 then return end

  Item.UseItem(EThings.Bag, bagIndex, 0);
end

function UIDoro.OnClick_Close()
  this.quickBuyMore = false;
  Mall.ClearDoro();
  UI.Close(this);
end

function UIDoro.SetEggCount(count)
  eggOpenFlag = {}
  for i = 1, count do
    eggOpenFlag[i] = false;
  end
  maxPage = math.ceil(count / this.MaxEgg);
end

function UIDoro.OnClick_ChangePage(uiEvent)
  if eggAnimationPlaying then return end
  for i = 1, this.MaxEgg do
    if eggs[i].openAnimation.isPlaying then
      return
    end
  end
  currentPage = math.clamp(currentPage + uiEvent.parameter, 1, maxPage);
  this.SetEggsShow();
  for i = 1, this.MaxEgg do
    this.OpendEgg(i);
  end
  this.UpdateUI();
end

function UIDoro.SetFurnitureTexture(index)
  --家具圖片依比例縮小
  if index == nil or eggs[index] == nil then return end

  local width = eggs[index].jmpDrawerRole.gameObject:GetComponent("RectTransform").rect.width;
  local height = eggs[index].jmpDrawerRole.gameObject:GetComponent("RectTransform").rect.height;
  local scale = math.min(this.cardHeight / height, this.cardHeight / width);
  eggs[index].jmpDrawerRole.gameObject.transform.localScale = Vector3.one * scale * this.cardScale;
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
end

function UIDoro.FurnitureExceed(index)
  this.SetFurnitureCoinIcon(index);
end

function UIDoro.SetFurnitureCoinIcon(index)
  local item = Mall.GetDoroItem(this.GetDataIndex(index));
  
  if item.kind == EItemKind.Furniture then
    text_Message.gameObject:SetActive(true);
    local furniture = furnitureDatas[item.spare3];
    if furniture == nil then return end
  
    eggs[index].jmpDrawerRole:GetComponent(typeof(JmpDrawer)).enabled = false;
  
    if furniture.level == 1 or furniture.level == 2 then
      UI.SetIcon("common0_icon137", eggs[index].rawImage_Role);
      eggs[index].name.text = string.Get(23572);
    elseif furniture.level == 3 or furniture.level == 4 then
      UI.SetIcon("common0_icon136", eggs[index].rawImage_Role);
      eggs[index].name.text = string.Get(23573);
    else
      UI.SetIcon("common0_icon137", eggs[index].rawImage_Role);
      eggs[index].name.text = string.Get(23572);
    end
  
  elseif item.kind == EItemKind.Elf then
    text_Message.gameObject:SetActive(false);
    UI.SetIcon("common0_icon136", eggs[index].rawImage_Role);
    eggs[index].name.text = "elf coins";
    eggs[index].rawImage_Role.gameObject:SetActive(true);
    eggs[index].itemRoot.gameObject:SetActive(false);
  end

  eggs[index].rawImage_Role.uvRect = UI.fullRect;
  eggs[index].rawImage_Role:SetNativeSize();
  local rectTransform = eggs[index].rawImage_Role.gameObject:GetComponent("RectTransform");
  rectTransform.localScale = Vector3.one;
  rectTransform.localPosition = Vector3.zero;
  rectTransform.sizeDelta = Vector2.New(100, 100);
end

function UIDoro.CheckShowNpcItem(item)
  if item == nil then return false end
  
  if item.kind == EItemKind.SpecialAbility and Contains(item.specialAbility, EItemUseKind.NpcPicture ,EItemUseKind.Mounts) then
    return true;
  end
  
  if  Contains(item.kind, EItemKind.DoroCard, EItemKind.Furniture) then
    return true;
  end
  
  return false;
end