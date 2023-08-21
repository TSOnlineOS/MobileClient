EUIStatusTag = {
  Status = 1,
  Moral = 2,
  Equip = 3,
  Style = 4,
  Astrolabe = 5,
  Profile = 6,
  Breakthrough = 7,
  Sell = 8,
  ChatPaste = 9,
  FightEquip = 10,
  FightStyle = 11,
  OutfitStyle = 12,
}

local EUIStatusGameObject =
{
  Role = 1,
  Bar = 2,
  Status = 3,
  Equip = 4,
  Moral = 5,
  Detail = 6,
  BarValue = 7,
  Astrolabe = 8,
  Breakthrough = 9,
  OutfitStyle = 10,
  DetailGameobject = 11,
}


UIStatus = {}
local this = UIStatus;

this.name = "UIStatus";
this.uiController = nil;

--ui
local transform_FrameRect;

local UIStatusGameObject = {}


local gameObject_UpgradeLvs = {};
local gameObject_UpgradeItem;
local gameObject_UpgradeSkill;

--Role
local uiCareer;

local jmpDrawer_Role;

local text_Name;
local text_Lv;
local image_UpgradeLv;
local text_UpgradeLv;
local image_Prev;
local image_Next;

local text_Hp;
local text_Sp;
local text_Exp;
local text_FullExp;
local text_FullHp;
local text_FullSp;

local slider_Hp;
local slider_Sp;
local slider_Exp;

local event_Share;
local event_ChgName;

--Status
local text_Point;
local text_AttributePoint;
local text_AttributeSubmit;
local text_AttributeReset;
local image_CurrentUpgradeLv;
local text_CurrentUpgradeLv;
local image_NextUpgradeLv;
local text_NextUpgradeLv;
local text_UpgradePoint;
local text_UpgradeMoney;
local text_UpgradeItems = {};
local text_CurrentUpgradeSkill;
local text_NextUpgradeSkill;
local text_BarValue;

local rawImage_CurrentUpgradeSkill;
local rawImage_NextUpgradeSkill;

local item_Upgrades = {};

local attComponents = {};

local event_AttributeSubmit;
local event_AttributeReset;

--Breakthrough
local event_ResetBreakthrough;
local scrollContent_Breakthrough;
local scrollItems_Breakthrough = {};
local text_BreakthroughLevel;

--Moral
local text_Morals = {};

--Equip
local item_Equips = {};

--OutfitStyle
local image_SwitchRedDot;
local image_CategoryHead;
local image_CategoryBody;
local image_CategoryWrist;
local image_CategoryFoot;
local image_CategoryHand;
local image_SwitchOutfitStyle;
local event_switchOutfitStyle;
local switchOutfitStyle;
local text_collectTitle;
local gameObject_styleTagInfo;
local text_styleTagInfo;
local gameObject_switchOutfitStyleButText;
local text_switchOutfitStyleButText;

--Detail
local detailArrow;

--Astrolabe
local text_AstrolabePoint;
local text_AstrolabeMoney;
local text_AstrolabeAttribute = {};
local text_AstrolabeNextAttribute = {};

local image_AstrolabeMask;
local rawImage_AstrolabeBG;
local rawImage_AstrolabePoint;
local rawImage_AstrolabeStar = {};
local rawImage_AstrolabeBall = {};

local event_AstrolabeUp;

--var
local showDetail = false;
local tagOffset = 0;
local currentTag = EUIStatusTag.Status;
local currentFollowIndex = 0;
local currentRole = nil;
local upgradeNpcId = 0;
local astrolabeShowTimer = 0;
local mainTag;
local attributeFastPoint = 100;
local currentOutfitSyleCategory = 0;
local outfitStyleIdTempSave = 0;

local tagDatas = {};

function UIStatus.Initialize(go)
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  ---
-----1--------------------------------------------------------------
  --  if LuaHelper.CheckDefine("DemoCode") then
  --    local code = DemoCode.GetBitxor(20);
  --    code = code * 10;
  --  end
  --  ---2--------------------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
-----1--------------------------------------------------------------
  --  if LuaHelper.CheckDefine("DemoCode") then
  --    local code = DemoCode.GetBitxor(20);
  --    code = code * 10;
  --  end
  --  ---2--------------------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
-----1--------------------------------------------------------------
  --  if LuaHelper.CheckDefine("DemoCode") then
  --    local code = DemoCode.GetBitxor(20);
  --    code = code * 10;
  --  end
  --  ---2--------------------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
-----1--------------------------------------------------------------
  --  if LuaHelper.CheckDefine("DemoCode") then
  --    local code = DemoCode.GetBitxor(20);
  --    code = code * 10;
  --  end
  --  ---2--------------------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;
  this.uiController.onClose = this.OnClose;

  local tempEvent;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;

  UIStatusGameObject[EUIStatusGameObject.Role] = uiController:FindGameObject("Role");
  UIStatusGameObject[EUIStatusGameObject.Bar] = uiController:FindGameObject("Bar");
  UIStatusGameObject[EUIStatusGameObject.Status] = uiController:FindGameObject("Status");
  UIStatusGameObject[EUIStatusGameObject.Equip] = uiController:FindGameObject("Equip");
  UIStatusGameObject[EUIStatusGameObject.Moral] = uiController:FindGameObject("Moral");
  UIStatusGameObject[EUIStatusGameObject.DetailGameobject] = uiController:FindGameObject("Image_DetailBG");
  UIStatusGameObject[EUIStatusGameObject.Detail] = UIStatusDetail.New(uiController:FindGameObject("Image_DetailBG"));
  UIStatusGameObject[EUIStatusGameObject.BarValue] = uiController:FindGameObject("BarValue");
  UIStatusGameObject[EUIStatusGameObject.Astrolabe] = uiController:FindGameObject("Astrolabe");
  UIStatusGameObject[EUIStatusGameObject.Breakthrough] = uiController:FindGameObject("GameObject_Breakthrough");
  UIStatusGameObject[EUIStatusGameObject.OutfitStyle] = uiController:FindGameObject("OutfitStyle");

  for i = 1, 2 do
    gameObject_UpgradeLvs[i] = uiController:FindGameObject(string.Concat("UpgradeLv (", i, ")"));
  end
  gameObject_UpgradeItem = uiController:FindGameObject("UpgradeItem");
  gameObject_UpgradeSkill = uiController:FindGameObject("UpgradeSkill");

  --Role
  uiCareer = UICareerController.New(uiController:FindGameObject("GameObject_Career"));

  jmpDrawer_Role = uiController:FindRawImage("RawImage_Role").gameObject:AddComponent(typeof(JmpDrawer));

  text_Name = uiController:FindText("Text_T6_Name");
  text_Lv = uiController:FindText("Text_T14_LvValue");
  image_UpgradeLv = uiController:FindImage("Image_UpgradeLv");
  text_UpgradeLv = uiController:FindText("Text_UpgradeLv");
  text_Hp = uiController:FindText("Text_T5_HpValue");
  text_Sp = uiController:FindText("Text_T5_SpValue");
  text_Exp = uiController:FindText("Text_T5_ExpValue");
  text_FullHp = uiController:FindText("Text_T5_HpFullValue");
  text_FullSp = uiController:FindText("Text_T5_SpFullValue");
  text_FullExp = uiController:FindText("Text_T5_ExpFullValue");

  slider_Hp = uiController:FindSlider("Slider_Hp");
  slider_Sp = uiController:FindSlider("Slider_Sp");
  slider_Exp = uiController:FindSlider("Slider_Exp");
  
  image_Prev =  uiController:FindGameObject("Image_Prev");
  tempEvent = uiController:FindEvent("Image_Prev");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_SwitchRole);
  tempEvent.parameter = -1;
  
  image_Next =  uiController:FindGameObject("Image_Next");
  tempEvent = uiController:FindEvent("Image_Next");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_SwitchRole);
  tempEvent.parameter = 1;

  event_Share = uiController:FindEvent("Image_Share");
  event_Share:SetListener(EventTriggerType.PointerClick, this.OnClick_Share);

  event_ChgName = uiController:FindEvent("Image_ChgName");
  event_ChgName:SetListener(EventTriggerType.PointerClick, this.OnClick_ChgName);

  --Status
  text_Point = uiController:FindText("Text_Point");
  text_AttributePoint = uiController:FindText("Text_AttributePoint");
  text_AttributeSubmit = uiController:FindText("Text_AttributeSubmit");
  text_AttributeReset = uiController:FindText("Text_AttributeReset");
  image_CurrentUpgradeLv = uiController:FindImage("Image_CurrentUpgradeLv");
  text_CurrentUpgradeLv = uiController:FindText("Text_CurrentUpgradeLv");
  image_NextUpgradeLv = uiController:FindImage("Image_NextUpgradeLv");
  text_NextUpgradeLv = uiController:FindText("Text_NextUpgradeLv");
  text_UpgradePoint = uiController:FindText("Text_UpgradePoint");
  text_UpgradeMoney = uiController:FindText("Text_UpgradeMoney");
  text_CurrentUpgradeSkill = uiController:FindText("Text_CurrentUpgradeSkill");
  text_NextUpgradeSkill = uiController:FindText("Text_NextUpgradeSkill");

  rawImage_CurrentUpgradeSkill = uiController:FindRawImage("RawImage_CurrentUpgradeSkill");
  rawImage_NextUpgradeSkill = uiController:FindRawImage("RawImage_NextUpgradeSkill");

  for i = 1, 2 do
    text_UpgradeItems[i] = uiController:FindText(string.Concat("Text_UpgradeItem (", i, ")"));
    item_Upgrades[i] = UIItemController.New(uiController:FindGameObject(string.Concat("Image_UpgradeItemBG (", i, ")")).transform, this.OnClick_UpgradeItem, i);
  end

  local attributeRoot = uiController:FindGameObject("Attribute");
  for i = 1, 6 do
    local tempParent = attributeRoot.transform:Find(string.Concat("Image_AttributeBG (", i, ")"));

    attComponents[i] = {};
    attComponents[i].add = 0;

    attComponents[i].text_Attribute = tempParent:Find("Text_Attribute"):GetComponent("Text");

    --lock
    attComponents[i].image_Lock = tempParent:Find("Image_Lock"):GetComponent("Image");

    attComponents[i].image_SetLock = tempParent:Find("Image_SetLock"):GetComponent("Image");

    attComponents[i].event_SetLock = tempParent:Find("Image_SetLock"):GetComponent("UIEvent");
    attComponents[i].event_SetLock:SetListener(EventTriggerType.PointerClick, this.OnClick_AttributeLock);
    attComponents[i].event_SetLock.parameter = i;

    --reborn
    attComponents[i].text_Reborn = tempParent:Find("Text_Reborn"):GetComponent("Text");

    --add
    attComponents[i].image_PointBG = tempParent:Find("Image_PointBG"):GetComponent("Image");
    attComponents[i].event_Enter = attComponents[i].image_PointBG:GetComponent("UIEvent");
    attComponents[i].event_Enter:SetListener(EventTriggerType.PointerClick, this.OnClick_AttributeEnter);
    attComponents[i].event_Enter.parameter = i;

    tempParent = attComponents[i].image_PointBG.transform;

    attComponents[i].text_Add = tempParent:Find("Text_Add"):GetComponent("Text");

    attComponents[i].event_Add = tempParent:Find("Image_Add"):GetComponent("UIEvent");
    attComponents[i].event_Add:SetListener(EventTriggerType.PointerClick, this.OnClick_AttributeAdd);
    attComponents[i].event_Add.parameter = i;

    attComponents[i].event_Dec = tempParent:Find("Image_Dec"):GetComponent("UIEvent");
    attComponents[i].event_Dec:SetListener(EventTriggerType.PointerClick, this.OnClick_AttributeDec);
    attComponents[i].event_Dec.parameter = i;

    attComponents[i].event_Add = tempParent:Find("Image_FastAdd"):GetComponent("UIEvent");
    attComponents[i].event_Add:SetListener(EventTriggerType.PointerClick, this.OnClick_AttributeFastAdd);
    attComponents[i].event_Add.parameter = i;

    attComponents[i].event_Dec = tempParent:Find("Image_FastDec"):GetComponent("UIEvent");
    attComponents[i].event_Dec:SetListener(EventTriggerType.PointerClick, this.OnClick_AttributeFastDec);
    attComponents[i].event_Dec.parameter = i;

  end

  event_AttributeSubmit = uiController:FindEvent("Image_AttributeSubmit");
  event_AttributeSubmit:SetListener(EventTriggerType.PointerClick, this.OnClick_AttributeSubmit);

  event_AttributeReset = uiController:FindEvent("Image_AttributeReset");
  event_AttributeReset:SetListener(EventTriggerType.PointerClick, this.OnClick_AttributeReset);

  --Moral
  for i = 1, 5 do
    text_Morals[i] = uiController:FindText(string.Concat("Text_Moral (", i, ")"));
  end

  radar_Moral = UIStatusGameObject[EUIStatusGameObject.Moral].transform:Find("Radar"):GetComponent("UIPolygon");

  --Equip
  for i = 1, Role.maxEquip do
    item_Equips[i] = UIItemController.New(uiController:FindGameObject(string.Concat("Image_EquipBG (", i, ")")).transform, this.OnClick_Equip, i);
  end

  text_BarValue = uiController:FindText("Text_BarValue");
  event_switchOutfitStyle = uiController:FindEvent("Image_Switch");
  event_switchOutfitStyle:SetListener(EventTriggerType.PointerClick, this.OnClick_SwitchOutfitStyle);
  switchOutfitStyle = uiController:FindGameObject("Image_Switch");
  image_SwitchOutfitStyle = uiController:FindImage("Image_Switch");
  
  --Detail
  detailArrow = uiController:FindGameObject("DetailArrow");

  tempEvent = uiController:FindEvent("Image_Detail");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Detail);

  tempEvent = uiController:FindEvent("Image_DetailPrev");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_SwitchRole);
  tempEvent.parameter = -1;

  tempEvent = uiController:FindEvent("Image_DetailNext");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_SwitchRole);
  tempEvent.parameter = 1;
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------

  --Astrolabe
  this.InitAstrolabe(uiController);

  --OutfitStyle
  this.InitOutfitStyle(uiController);
  
  --Breakthrough
  event_ResetBreakthrough = uiController:FindEvent("Image_ResetBreakthrough");
  event_ResetBreakthrough:SetListener(EventTriggerType.PointerClick, this.OnClick_ResetBreakthrough);
  text_BreakthroughLevel = uiController:FindText("Text_BreakthroughLevel");
  scrollContent_Breakthrough = uiController:FindScrollContent("ScrollContent_Breakthrough");
  scrollContent_Breakthrough.onInitialize = this.OnInitialize_BreakthroughScrollContent;
  scrollContent_Breakthrough.onItemChange = this.OnItemChange_BreakthroughScrollContent;
  scrollContent_Breakthrough:Initialize(Breakthrough.GetBreakthroughLevel());
end

function UIStatus.InitAstrolabe(uiController)
  local tempTransform = UIStatusGameObject[EUIStatusGameObject.Astrolabe].transform:Find("Attribute");
  text_AstrolabePoint = tempTransform:Find("Function"):Find("GameObject"):Find("Text_AstrolabePoint"):GetComponent("Text");
  text_AstrolabeMoney = tempTransform:Find("Function"):Find("GameObject"):Find("Text_AstrolabeMoney"):GetComponent("Text");

  for i = 1, Astrolabe.maxAstrolabe do
    text_AstrolabeAttribute[i] = tempTransform:Find(string.Concat("Image_AttributeBG (", i , ")")):Find("Text_Attribute"):GetComponent("Text");
    text_AstrolabeNextAttribute[i] = tempTransform:Find(string.Concat("Image_AttributeBG (", i , ")")):Find("Text_Reborn"):GetComponent("Text");
  end

  image_AstrolabeMask = uiController:FindImage("Image_AstrolabeMask");
  rawImage_AstrolabeBG = uiController:FindRawImage("RawImage_AstrolabeBG");
  rawImage_AstrolabePoint = uiController:FindRawImage("RawImage_AstrolabePoint");

  tempTransform = rawImage_AstrolabeBG.transform;
  for i = 1, Astrolabe.maxAstrolabe do
    rawImage_AstrolabeStar[i] = tempTransform:Find(string.Concat("RawImage_AstrolabeStar (", i , ")")):GetComponent("RawImage");
    rawImage_AstrolabeBall[i] = tempTransform:Find(string.Concat("RawImage_AstrolabeBall (", i , ")")):GetComponent("UIRawImage");
  end

  event_AstrolabeUp = uiController:FindEvent("Image_AstrolabeUp");
  event_AstrolabeUp:SetListener(EventTriggerType.PointerClick, this.OnClick_AstrolabeUp);
end

function UIStatus.InitOutfitStyle(uiController)
  gameObject_styleTagInfo = uiController:FindGameObject("Text_StyleTagInfo");
  text_styleTagInfo = uiController:FindText("Text_StyleTagInfo");
  gameObject_switchOutfitStyleButText = uiController:FindGameObject("Text_SwitchOutfitStyleButText");
  text_switchOutfitStyleButText = uiController:FindText("Text_SwitchOutfitStyleButText");
  
  image_SwitchRedDot = uiController:FindImage("Image_SwitchRedDot");
  image_CategoryHead = uiController:FindImage("Image_Head");
  image_CategoryBody = uiController:FindImage("Image_Body");
  image_CategoryWrist = uiController:FindImage("Image_Wrist");
  image_CategoryFoot = uiController:FindImage("Image_Foot");
  image_CategoryHand = uiController:FindImage("Image_Hand");
  
  local tempEvent;
  tempEvent = uiController:FindEvent("Image_Head");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ChangeCategory);
  tempEvent.parameter = EItemFitType.Style_Head;
  tempEvent = uiController:FindEvent("Image_Body");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ChangeCategory);
  tempEvent.parameter = EItemFitType.Style_Body;
  tempEvent = uiController:FindEvent("Image_Wrist");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ChangeCategory);
  tempEvent.parameter = EItemFitType.Style_Wrist;
  tempEvent = uiController:FindEvent("Image_Foot");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ChangeCategory);
  tempEvent.parameter = EItemFitType.Style_Boots;
  tempEvent = uiController:FindEvent("Image_Hand");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ChangeCategory);
  tempEvent.parameter = EItemFitType.Style_Hand;
  
  text_collectTitle = uiController:FindText("Text_CollectTitle");
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
end

function UIStatus.OnOpen(tag, role)
  if tag ~= nil then
    currentTag = tag;
  else
    currentTag = EUIStatusTag.Status;
  end

  if role == nil or role.kind == EHuman.Player then
    currentFollowIndex = 0;
    currentRole = Role.player;
  elseif role.kind == EHuman.FollowNpc then
    currentRole = role;
    for i = 1, Role.maxFollowNpc do
      if currentRole == Role.GetRole(EHuman.FollowNpc, Role.playerId, i) then
        currentFollowIndex = i;
        break;
      end
    end
  end
  showDetail = false;
  upgradeNpcId = 0;
  return true;
end

function UIStatus.OnVisible(visible)
  if visible then
    table.Clear(tagDatas);
    tagDatas[EUIStatusTag.Status] = { string.Get(20262), nil };
    tagDatas[EUIStatusTag.Moral] = { string.Get(20323), nil };
    tagDatas[EUIStatusTag.Equip] = { string.Get(50331), nil };
    tagDatas[EUIStatusTag.Style] = { string.Get(99685), nil };
  
    if not Contains(SceneManager.sceneId, 10821, 10853) then
      tagDatas[EUIStatusTag.Astrolabe] = { string.Get(22602), nil };
    end

    local featureOffset = 1;
    if HouseBoard.FeatureIsOpen() then
      if not Contains(SceneManager.sceneId, 10821, 10853) then
        featureOffset = 0;
        tagDatas[EUIStatusTag.Profile] = { string.Get(23355), nil };
      end
    end

    if Breakthrough.CheckBreakthrough() then
      EUIStatusTag.Breakthrough = 7;
      EUIStatusTag.Breakthrough = EUIStatusTag.Breakthrough - featureOffset;
      tagDatas[EUIStatusTag.Breakthrough] = { string.Get(23571), nil };
    else
      tagDatas[EUIStatusTag.Breakthrough] = nil;
      if currentTag == EUIStatusTag.Breakthrough then
        currentTag = EUIStatusTag.Status;
      end
    end

    tagOffset = 0;
    if currentTag == EUIStatusTag.Sell then
      tagOffset = EUIStatusTag.Sell - EUIStatusTag.Equip;
    elseif currentTag == EUIStatusTag.ChatPaste then
      tagOffset = EUIStatusTag.ChatPaste - EUIStatusTag.Equip;
    elseif currentTag == EUIStatusTag.FightEquip then
      tagOffset = EUIStatusTag.FightEquip - EUIStatusTag.Equip;
    elseif currentTag == EUIStatusTag.FightStyle then
      tagOffset = EUIStatusTag.FightStyle - EUIStatusTag.Style;
    end

    UIFrame.Active(transform_FrameRect, string.Get(20262), this.OnClick_Close, this.OnClick_Help, this.OnClick_Tag, tagDatas, currentTag - tagOffset, 1, this.CheckRedDot);

    if currentFollowIndex == 0 then
      currentRole = Role.player;
    else
      currentRole = Role.GetRole(EHuman.FollowNpc, Role.playerId, currentFollowIndex);
    end

    astrolabeShowTimer = 0;
    LuaHelper.SetColor(image_AstrolabeMask, Color.Alpha);

    this.UpdateUI(true, true);
  end
end

function UIStatus.OnClose()
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
-----1--------------------------------------------------------------
  --  if LuaHelper.CheckDefine("DemoCode") then
  --    local code = DemoCode.GetBitxor(20);
  --    code = code * 10;
  --  end
  --  ---2--------------------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  ---
--- --5-----------------------------------------------------
  --  if LuaHelper.CheckDefine("DemoCode") then
  --   --
  --  end
  --  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  jmpDrawer_Role:Disable();
  outfitStyleIdTempSave = 0;
  
  if Contains(currentTag, EUIStatusTag.Equip, EUIStatusTag.Style, EUIStatusTag.ChatPaste, EUIStatusTag.FightEquip, EUIStatusTag.FightStyle, EUIStatusTag.Breakthrough) then
    UI.Close(UIBag);
  elseif currentTag == EUIStatusTag.Sell then
    UI.Close(UIBag);
    EventManager.SetConduct(true);
  elseif currentTag == EUIStatusTag.OutfitStyle then
    UI.Close(UIBag);
    currentOutfitSyleCategory = 0;
  end

  if HouseBoard.FeatureIsOpen() then
    if currentTag == EUIStatusTag.Profile then
      UI.Close(UIHouseBoard, true);
    end
  end

  Hotkey.Close(EUseSource.UIItemInfo);

  if UI.IsVisible(UIAlert) then
    UI.Close(UIAlert);
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
  end
end

function UIStatus.Update()
  if astrolabeShowTimer > 0 then
    astrolabeShowTimer = astrolabeShowTimer - CGTimer.deltaTime;

    if astrolabeShowTimer > 0 then
      LuaHelper.SetColor(image_AstrolabeMask, LuaHelper.GetColor(255, 255, 255, 255 * ((Astrolabe.levelUpShowTime - astrolabeShowTimer) / Astrolabe.levelUpShowTime)));
    else
      astrolabeShowTimer = 0;
      LuaHelper.SetColor(image_AstrolabeMask, Color.Alpha);

      ShowCenterMessage(string.Get(71331));
      this.UpdateAstrolabe();
    end
  end
end

function UIStatus.CheckRedDot(mTag, subTag)
  if mainTag == mTag then
    return false;
  else
    mainTag = mTag;
  end
  
  if mainTag == EUIStatusTag.Status then
    return RedDot.Check(ERedDot.AttributePoint);
  elseif mainTag == EUIStatusTag.Equip then
    return RedDot.Check(ERedDot.Bag);
  elseif mainTag == EUIStatusTag.Breakthrough then
    return RedDot.Check(ERedDot.Breakthrough);
  elseif mainTag == EUIStatusTag.Style then
    return RedDot.Check(ERedDot.OutfitStyle);
  end

  if HouseBoard.FeatureIsOpen() then
    if mainTag == EUIStatusTag.Profile then
      return RedDot.Check(ERedDot.FriendGift, ERedDot.CharmReward, ERedDot.GiftFeedback);
    end
  end

  return false;
end

function UIStatus.IsCurrentTag(tag)
  return tag == currentTag;
end

function UIStatus.IsCurrentRole(role)
  return role == currentRole;
end

function UIStatus.UpdateUI(reopenBag, reset)
  if HouseBoard.FeatureIsOpen() then
    UIStatusGameObject[EUIStatusGameObject.Role]:SetActive(currentTag ~= EUIStatusTag.Astrolabe and currentTag ~=EUIStatusTag.Profile);
  else
    UIStatusGameObject[EUIStatusGameObject.Role]:SetActive(currentTag ~= EUIStatusTag.Astrolabe);
  end

  UIStatusGameObject[EUIStatusGameObject.Bar]:SetActive(not showDetail and Contains(currentTag, EUIStatusTag.Status, EUIStatusTag.Moral))
  UIStatusGameObject[EUIStatusGameObject.Status]:SetActive(currentTag == EUIStatusTag.Status);
  UIStatusGameObject[EUIStatusGameObject.Moral]:SetActive(currentTag == EUIStatusTag.Moral);
  UIStatusGameObject[EUIStatusGameObject.Equip]:SetActive(not showDetail and Contains(currentTag, EUIStatusTag.Equip, EUIStatusTag.Style,EUIStatusTag.OutfitStyle, EUIStatusTag.Sell, EUIStatusTag.ChatPaste, EUIStatusTag.FightEquip, EUIStatusTag.FightStyle));
  UIStatusGameObject[EUIStatusGameObject.DetailGameobject].gameObject:SetActive(showDetail);
  UIStatusGameObject[EUIStatusGameObject.BarValue]:SetActive(Contains(currentTag, EUIStatusTag.Equip, EUIStatusTag.Style, EUIStatusTag.FightEquip, EUIStatusTag.FightStyle));
  UIStatusGameObject[EUIStatusGameObject.Astrolabe]:SetActive(currentTag == EUIStatusTag.Astrolabe);
  UIStatusGameObject[EUIStatusGameObject.Breakthrough]:SetActive(currentTag == EUIStatusTag.Breakthrough and Breakthrough.CheckBreakthrough());
  UIStatusGameObject[EUIStatusGameObject.OutfitStyle]:SetActive(not showDetail and Contains(currentTag, EUIStatusTag.OutfitStyle));
  switchOutfitStyle:SetActive(not showDetail and Contains(currentTag, EUIStatusTag.Style, EUIStatusTag.OutfitStyle));
  image_Prev:SetActive(not Contains(currentTag, EUIStatusTag.Style, EUIStatusTag.OutfitStyle));
  image_Next:SetActive(not Contains(currentTag, EUIStatusTag.Style, EUIStatusTag.OutfitStyle));
  gameObject_styleTagInfo:SetActive(not showDetail and Contains(currentTag, EUIStatusTag.Style, EUIStatusTag.OutfitStyle));
  gameObject_switchOutfitStyleButText:SetActive(not showDetail and Contains(currentTag, EUIStatusTag.Style, EUIStatusTag.OutfitStyle));
  image_SwitchRedDot.gameObject:SetActive(RedDot.Check(ERedDot.OutfitStyle));
  
  
  if reopenBag == true then
    UI.Close(UIBag);
  end

  this.UpdateRole();
  this.UpdateStatus(reset);
  this.UpdateMoral();
  this.UpdateEquip(reopenBag);
  this.UpdateStyle(reopenBag);
  this.UpdateOutfitStyle(reopenBag);
  this.UpdateOutfitStyleHintAndIcon();
  this.UpdateSell();
  this.UpdateChatPaste();
  this.UpdateFightEquip(reopenBag);
  this.UpdateFightStyle(reopenBag);
  this.UpdateDetail();
  this.UpdateAstrolabe();
  this.UpdateHomePage();
  this.UpdateBreakthrough(reopenBag);
end

function UIStatus.UpdateRole()
  if currentRole == nil then return end

  uiCareer:SetCareer(currentRole:GetAttribute(EAttribute.Turn), currentRole:GetAttribute(EAttribute.Element), currentRole:GetAttribute(EAttribute.Career), currentRole.kind == EHuman.FollowNpc, currentRole:GetAttribute(EAttribute.Turn3Element));

  local npcData = npcDatas[currentRole.npcId]
  if npcData ~= nil then
    local offsetX, offsetY = npcData:GetOffset();

    jmpDrawer_Role:GenerateAndDraw(npcData:GetAtlasParams(ERolePose.Prepare + 1));
    jmpDrawer_Role.offsetY = offsetY;
  else
    jmpDrawer_Role:GenerateAndDraw(currentRole.data:GetAtlasParams(currentRole.titleId, ERolePose.Prepare + 1));
    jmpDrawer_Role.offsetY = 0;
  end
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
  
  
  if currentRole.kind == EHuman.FollowNpc then
    if currentRole.data.canGrow == 0 then
      text_Name.text = string.GetColorText(currentRole.name, Color.Orange);
    elseif currentRole.data.canGrow == 2 then
      text_Name.text = string.GetColorText(currentRole.name, Color.MissionNPC);
    else
      text_Name.text = currentRole.name;
    end
  else
    text_Name.text = currentRole.name;
  end

  text_Lv.text = currentRole:GetAttribute(EAttribute.Lv);

  if currentRole.kind == EHuman.FollowNpc and currentRole.data.upgradeLv > 0 then
    text_UpgradeLv.transform.parent.gameObject:SetActive(true);
    text_UpgradeLv.text = currentRole.data.upgradeLv;
    image_UpgradeLv.sprite = UI.GetUpgradeLvIcon(this.CheckDataGetUpgradeLvIcon(currentRole.data.upgradeLv));
  else
    text_UpgradeLv.transform.parent.gameObject:SetActive(false);
  end

  event_Share.gameObject:SetActive(currentRole.kind == EHuman.FollowNpc and currentTag == EUIStatusTag.ChatPaste);
  event_ChgName.gameObject:SetActive(not showDetail and currentTag ~= EUIStatusTag.Breakthrough and currentFollowIndex == 0);

  this.UpdateBar();
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
  
end

function UIStatus.UpdateBar()
  slider_Hp.maxValue = currentRole:GetAttribute(EAttribute.MaxHp);
  slider_Hp.value = currentRole:GetAttribute(EAttribute.Hp);

  text_Hp.text = string.Concat(math.floor((slider_Hp.value / slider_Hp.maxValue) * 100), "%");
  text_FullHp.text = string.Concat(slider_Hp.value, "/", slider_Hp.maxValue);

  slider_Sp.maxValue = currentRole:GetAttribute(EAttribute.MaxSp);
  slider_Sp.value = currentRole:GetAttribute(EAttribute.Sp);
  text_Sp.text = string.Concat(math.floor((slider_Sp.value / slider_Sp.maxValue) * 100), "%");
  text_FullSp.text = string.Concat(slider_Sp.value, "/", slider_Sp.maxValue);

  local turn = currentRole:GetAttribute(EAttribute.Turn);
  local level = currentRole:GetAttribute(EAttribute.Lv);
  local exp = currentRole:GetAttribute(EAttribute.Exp);

  if currentRole ~= Role.player then
    if turn == 2 then
      turn = 1;
    else
      turn = 0;
    end
  end

  if turn >= 3 then
    level = level - Role.playerMaxLv;
    exp = currentRole:GetAttribute(EAttribute.Turn3Exp);
  end

  this.SetExpSlider(slider_Exp, text_Exp, text_FullExp, level, exp, turn);

  text_BarValue.text = string.Concat(text_FullHp.text, "\n", text_FullSp.text, "\n", text_Exp.text);
end

function UIStatus.SetExpSlider(sliderExp, textExp, textFullExp, level, exp, turn)
  if (turn >= 3 and level >= Role.playerMaxLv + Role.playerTurn3MaxLv) or (turn < 3 and level == Role.playerMaxLv) then
    sliderExp.maxValue = 1;
    sliderExp.value = 1;
    textExp.text = "100%";
    textFullExp.text = string.Get(40475);
  else
    sliderExp.maxValue = Calc.GetUpExp(level + 1, turn);
    sliderExp.value = exp - Calc.GetNeedTExp(level, turn);
    textExp.text = string.Concat(math.floor((sliderExp.value / sliderExp.maxValue) * 100), "%");
    textFullExp.text = string.Concat(sliderExp.value, "/", sliderExp.maxValue);
  end
end

function UIStatus.UpdateStatus(reset)

  if currentTag ~= EUIStatusTag.Status then return end
  if currentRole == nil then return end
  RedDot.Remove(ERedDot.AttributePoint);
  local equipAdd = 0;
  local otherAdd = 0;
  local percentValue = 0;
  local shineAtts = Calc.GetCollectNFT();

  --Int
  equipAdd = currentRole:GetAttribute(EAttribute.EquipInt);
  otherAdd = 0;
  if currentRole == Role.player then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Int);
    otherAdd = otherAdd + DrugBuff.timeBuffs[ETimeBuff.IntUp].value;
    otherAdd = otherAdd + Astrolabe.GetAttribute(EAstrolabeAttribute.Int);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.Int);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Turn3Int);
    otherAdd = otherAdd + math.floor((Mounts.GetAttribute(EAttribute.Int) + Mounts.GetAttribute(EAttribute.EquipInt)) * Mounts.collectionBonus);
    --NFT收集加成
    if shineAtts[EAttribute.Int] ~= nil then
      otherAdd = otherAdd + shineAtts[EAttribute.Int];
    end
  elseif currentRole == Role.fightNpc then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Int);
  end
  otherAdd = otherAdd + CollectStyle.GetAttribute(EAttribute.Int);
  otherAdd = otherAdd + CollectCard.GetAttribute(EAttribute.Int);
  
  percentValue = math.round(currentRole:GetAttribute(EAttribute.Int) * (100 + currentRole:GetAttribute(EAttribute.IntPercent)) * 0.01);
  attComponents[1].text_Attribute.text = percentValue + equipAdd + otherAdd;
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
  
  --Atk
  equipAdd = currentRole:GetAttribute(EAttribute.EquipAtk);
  otherAdd = 0;
  if currentRole == Role.player then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Atk);
    otherAdd = otherAdd + DrugBuff.timeBuffs[ETimeBuff.AtkUp].value;
    otherAdd = otherAdd + Astrolabe.GetAttribute(EAstrolabeAttribute.Atk);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.Atk);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Turn3Atk);
    otherAdd = otherAdd + math.floor((Mounts.GetAttribute(EAttribute.Atk) + Mounts.GetAttribute(EAttribute.EquipAtk)) * Mounts.collectionBonus);
    --NFT收集加成
    if shineAtts[EAttribute.Atk] ~= nil then
      otherAdd = otherAdd + shineAtts[EAttribute.Atk];
    end
  elseif currentRole == Role.fightNpc then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Atk);
  end
  otherAdd = otherAdd + CollectStyle.GetAttribute(EAttribute.Atk);
  otherAdd = otherAdd + CollectCard.GetAttribute(EAttribute.Atk);
  
  percentValue = math.round(currentRole:GetAttribute(EAttribute.Atk) * (100 + currentRole:GetAttribute(EAttribute.AtkPercent)) * 0.01);
  attComponents[2].text_Attribute.text = percentValue + equipAdd + otherAdd;

  --Def
  equipAdd = currentRole:GetAttribute(EAttribute.EquipDef);
  otherAdd = 0;
  if currentRole == Role.player then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Def);
    otherAdd = otherAdd + DrugBuff.timeBuffs[ETimeBuff.DefUp].value;
    otherAdd = otherAdd + Astrolabe.GetAttribute(EAstrolabeAttribute.Def);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.Def);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Turn3Def);
    otherAdd = otherAdd + math.floor((Mounts.GetAttribute(EAttribute.Def) + Mounts.GetAttribute(EAttribute.EquipDef)) * Mounts.collectionBonus);
    --NFT收集加成
    if shineAtts[EAttribute.Def] ~= nil then
      otherAdd = otherAdd + shineAtts[EAttribute.Def];
    end
  elseif currentRole == Role.fightNpc then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Def);
  end
  otherAdd = otherAdd + CollectStyle.GetAttribute(EAttribute.Def);
  otherAdd = otherAdd + CollectCard.GetAttribute(EAttribute.Def);
  
  percentValue = math.round(currentRole:GetAttribute(EAttribute.Def) * (100 + currentRole:GetAttribute(EAttribute.DefPercent)) * 0.01);
  attComponents[3].text_Attribute.text = percentValue + equipAdd + otherAdd;

  --Hpx
  equipAdd = currentRole:GetAttribute(EAttribute.EquipHpx);
  otherAdd = 0;
  if currentRole == Role.player then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Hpx);
    otherAdd = otherAdd + DrugBuff.timeBuffs[ETimeBuff.HpxUp].value;
    otherAdd = otherAdd + Astrolabe.GetAttribute(EAstrolabeAttribute.Hpx);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.Hpx);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Turn3Hpx);
    --NFT收集加成
    if shineAtts[EAttribute.Hpx] ~= nil then
      otherAdd = otherAdd + shineAtts[EAttribute.Hpx];
    end
  elseif currentRole == Role.fightNpc then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Hpx);
  end
  otherAdd = otherAdd + CollectStyle.GetAttribute(EAttribute.Hpx);
  otherAdd = otherAdd + CollectCard.GetAttribute(EAttribute.Hpx);

  attComponents[4].text_Attribute.text = currentRole:GetAttribute(EAttribute.Hpx) + equipAdd + otherAdd;

  --Spx
  equipAdd = currentRole:GetAttribute(EAttribute.EquipSpx);
  otherAdd = 0;
  if currentRole == Role.player then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Spx);
    otherAdd = otherAdd + DrugBuff.timeBuffs[ETimeBuff.SpxUp].value;
    otherAdd = otherAdd + Astrolabe.GetAttribute(EAstrolabeAttribute.Spx);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.Spx);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Turn3Spx);
    --NFT收集加成
    if shineAtts[EAttribute.Spx] ~= nil then
      otherAdd = otherAdd + shineAtts[EAttribute.Spx];
    end
  elseif currentRole == Role.fightNpc then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Spx);
  end
  otherAdd = otherAdd + CollectStyle.GetAttribute(EAttribute.Spx);
  otherAdd = otherAdd + CollectCard.GetAttribute(EAttribute.Spx);

  attComponents[5].text_Attribute.text = currentRole:GetAttribute(EAttribute.Spx) + equipAdd + otherAdd;
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
  
  --Agi
  equipAdd = currentRole:GetAttribute(EAttribute.EquipAgi);
  otherAdd = 0;
  if currentRole == Role.player then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Agi);
    otherAdd = otherAdd + DrugBuff.timeBuffs[ETimeBuff.AgiUp].value;
    otherAdd = otherAdd + Astrolabe.GetAttribute(EAstrolabeAttribute.Agi);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.Agi);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Turn3Agi);
    --NFT收集加成
    if shineAtts[EAttribute.Agi] ~= nil then
      otherAdd = otherAdd + shineAtts[EAttribute.Agi];
    end
  elseif currentRole == Role.fightNpc then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Agi);
  end
  otherAdd = otherAdd + CollectStyle.GetAttribute(EAttribute.Agi);
  otherAdd = otherAdd + CollectCard.GetAttribute(EAttribute.Agi);

  attComponents[6].text_Attribute.text = currentRole:GetAttribute(EAttribute.Agi) + equipAdd + otherAdd;

  if reset then
    for i = 1, 6 do
      attComponents[i].add = 0;
    end
  end

  this.UpdateStatusAdd();
end

function UIStatus.UpdateStatusAdd()
  event_AttributeReset:SetColor(Color.White);

  for i = 1, 2 do
    gameObject_UpgradeLvs[i]:SetActive(false);
  end
  gameObject_UpgradeItem:SetActive(false);
  gameObject_UpgradeSkill:SetActive(false);

  local turn = currentRole:GetAttribute(EAttribute.Turn);
  local level = currentRole:GetAttribute(EAttribute.Lv);
  local exp = currentRole:GetAttribute(EAttribute.Exp);

  if currentRole ~= Role.player then
    if turn == 2 then
      turn = 1;
    else
      turn = 0;
    end
  end

  if turn >= 3 then
    level = level - Role.playerMaxLv;
    exp = currentRole:GetAttribute(EAttribute.Turn3Exp);
  end

  if currentRole.kind == EHuman.Player then
    local point = currentRole:GetAttribute(EAttribute.AttrPoint);
    local count = 0;
    for i = 1, 6 do
      --lock
      attComponents[i].image_Lock.gameObject:SetActive(false);
      attComponents[i].image_SetLock.gameObject:SetActive(false);

      --reborn
      attComponents[i].text_Reborn.gameObject:SetActive(false);

      --add
      attComponents[i].image_PointBG.gameObject:SetActive(true);
      attComponents[i].text_Add.text = attComponents[i].add;

      count = count + attComponents[i].add;
    end

    --point
   -- text_Point.text = "POINT";
    text_Point.text = string.Get(22450);
    text_AttributePoint.text = point - count;

    --submit
    if count > 0 then
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
  
      event_AttributeSubmit.gameObject:SetActive(true);
      event_AttributeSubmit:SetColor(Color.White);

      text_AttributeSubmit.text = string.Get(20990);
      text_AttributeReset.text = string.Get(20073);
    else
      event_AttributeSubmit.gameObject:SetActive(false);

      text_AttributeReset.text = string.Get(20254);

      count = 0;
      count = count + currentRole:GetAttribute(EAttribute.Int);
      count = count + currentRole:GetAttribute(EAttribute.Atk);
      count = count + currentRole:GetAttribute(EAttribute.Def);
      count = count + currentRole:GetAttribute(EAttribute.Hpx);
      count = count + currentRole:GetAttribute(EAttribute.Spx);
      count = count + currentRole:GetAttribute(EAttribute.Agi);

      if count == 0 then
        event_AttributeReset:SetColor(Color.LightGray);
      end
    end
  else
    --local shineAtts = Calc.GetCollectNFT();
    
    for i = 1, 6 do
      --lock
      attComponents[i].image_Lock.gameObject:SetActive(i == currentRole.data.graspPill.index);

      if currentRole.data.graspPill.index == 0 and level < Role.playerMaxLv and currentRole.data.graspPill.count < Role.npcMaxGraspPill then
        attComponents[i].image_SetLock.gameObject:SetActive(true);

        if Item.GetItemCount(46184 + i) > 0 then
          attComponents[i].image_SetLock.sprite = UI.GetSprite("but062L");
        else
          attComponents[i].image_SetLock.sprite = UI.GetSprite("but063D");
        end
      else
        attComponents[i].image_SetLock.gameObject:SetActive(false);
      end

      --reborn
      attComponents[i].text_Reborn.gameObject:SetActive(currentRole.npcId == Role.rebornNpcId);

      local oriValue = 0;
      local equipAdd = 0;
      local otherAdd = 0;
      local rebornValue = 0;

      if i == 1 then
        oriValue = currentRole:GetAttribute(EAttribute.Int);
        equipAdd = currentRole:GetAttribute(EAttribute.EquipInt) + math.round(currentRole:GetAttribute(EAttribute.Int) * (currentRole:GetAttribute(EAttribute.IntPercent) * 0.01));
        if currentRole == Role.fightNpc then
          otherAdd = DrugBuff.GetAttribute(EDrugAttribute.Int);
        end
        otherAdd = otherAdd + CollectCard.GetAttribute(EAttribute.Int);
        otherAdd = otherAdd + CollectStyle.GetAttribute(EAttribute.Int);
        --NFT收集加成
        --if shineAtts[EAttribute.Int] ~= nil then
        --  otherAdd = otherAdd + shineAtts[EAttribute.Int];
        --end
      elseif i == 2 then
        oriValue = currentRole:GetAttribute(EAttribute.Atk);
        equipAdd = currentRole:GetAttribute(EAttribute.EquipAtk) + math.round(currentRole:GetAttribute(EAttribute.Atk) * (currentRole:GetAttribute(EAttribute.AtkPercent) * 0.01));
        if currentRole == Role.fightNpc then
          otherAdd = DrugBuff.GetAttribute(EDrugAttribute.Atk);
        end
        otherAdd = otherAdd + CollectCard.GetAttribute(EAttribute.Atk);
        otherAdd = otherAdd + CollectStyle.GetAttribute(EAttribute.Atk);
        --NFT收集加成
        --if shineAtts[EAttribute.Atk] ~= nil then
        --  otherAdd = otherAdd + shineAtts[EAttribute.Atk];
        --end
      elseif i == 3 then
        oriValue = currentRole:GetAttribute(EAttribute.Def);
        equipAdd = currentRole:GetAttribute(EAttribute.EquipDef) + math.round(currentRole:GetAttribute(EAttribute.Def) * (currentRole:GetAttribute(EAttribute.DefPercent) * 0.01));
        if currentRole == Role.fightNpc then
          otherAdd = DrugBuff.GetAttribute(EDrugAttribute.Def);
        end
        otherAdd = otherAdd + CollectCard.GetAttribute(EAttribute.Def);
        otherAdd = otherAdd + CollectStyle.GetAttribute(EAttribute.Def);
        --NFT收集加成
        --if shineAtts[EAttribute.Def] ~= nil then
        --  otherAdd = otherAdd + shineAtts[EAttribute.Def];
        --end
      elseif i == 4 then
        oriValue = currentRole:GetAttribute(EAttribute.Hpx);
        equipAdd = currentRole:GetAttribute(EAttribute.EquipHpx);
        if currentRole == Role.fightNpc then
          otherAdd = DrugBuff.GetAttribute(EDrugAttribute.Hpx);
        end
        otherAdd = otherAdd + CollectCard.GetAttribute(EAttribute.Hpx);
        otherAdd = otherAdd + CollectStyle.GetAttribute(EAttribute.Hpx);
        --NFT收集加成
        --if shineAtts[EAttribute.Hpx] ~= nil then
        --  otherAdd = otherAdd + shineAtts[EAttribute.Hpx];
        --end
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

      elseif i == 5 then
        oriValue = currentRole:GetAttribute(EAttribute.Spx);
        equipAdd = currentRole:GetAttribute(EAttribute.EquipSpx);
        if currentRole == Role.fightNpc then
          otherAdd = DrugBuff.GetAttribute(EDrugAttribute.Spx);
        end
        otherAdd = otherAdd + CollectCard.GetAttribute(EAttribute.Spx);
        otherAdd = otherAdd + CollectStyle.GetAttribute(EAttribute.Spx);
        --NFT收集加成
        --if shineAtts[EAttribute.Spx] ~= nil then
        --  otherAdd = otherAdd + shineAtts[EAttribute.Spx];
        --end
      elseif i == 6 then
        oriValue = currentRole:GetAttribute(EAttribute.Agi);
        equipAdd = currentRole:GetAttribute(EAttribute.EquipAgi);
        if currentRole == Role.fightNpc then
          otherAdd = DrugBuff.GetAttribute(EDrugAttribute.Agi);
        end
        otherAdd = otherAdd + CollectCard.GetAttribute(EAttribute.Agi);
        otherAdd = otherAdd + CollectStyle.GetAttribute(EAttribute.Agi);
        --NFT收集加成
        --if shineAtts[EAttribute.Agi] ~= nil then
        --  otherAdd = otherAdd + shineAtts[EAttribute.Agi];
        --end
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

        
      end

      if Role.rebornKind == 1 then
        rebornValue = oriValue + Role.rebornAttributes[i];
        if oriValue > rebornValue then
          attComponents[i].text_Reborn.text = string.GetColorText(tostring(attComponents[i].text_Attribute.text + Role.rebornAttributes[i]), Color.Red);
        elseif oriValue < rebornValue then
          attComponents[i].text_Reborn.text = string.GetColorText(tostring(attComponents[i].text_Attribute.text + Role.rebornAttributes[i]), Color.DarkGreen);
        else
          attComponents[i].text_Reborn.text = string.GetColorText(tostring(attComponents[i].text_Attribute.text + Role.rebornAttributes[i]), Color.Black);
        end
      elseif Role.rebornKind == 2 then
        rebornValue = npcDatas[currentRole.npcId].attributes[i] + Role.rebornAttributes[i];
        if oriValue > rebornValue then
          attComponents[i].text_Reborn.text = string.GetColorText(tostring(rebornValue + equipAdd + otherAdd), Color.Red);
        elseif oriValue < rebornValue then
          attComponents[i].text_Reborn.text = string.GetColorText(tostring(rebornValue + equipAdd + otherAdd), Color.DarkGreen);
        else
          attComponents[i].text_Reborn.text = string.GetColorText(tostring(rebornValue + equipAdd + otherAdd), Color.Black);
        end
      end

      --add
      attComponents[i].image_PointBG.gameObject:SetActive(false);
    end

    --faith
    text_Point.text = string.Get(20043);
    text_AttributePoint.text = currentRole:GetAttribute(EAttribute.Faith);

    --submit
    if currentRole.npcId == Role.rebornNpcId then
      event_AttributeSubmit.gameObject:SetActive(true);
      event_AttributeSubmit:SetColor(Color.White);

      if Role.rebornKind == 1 then
        for i = 1, 2 do
          gameObject_UpgradeLvs[i]:SetActive(true);
        end
        gameObject_UpgradeItem:SetActive(true);
        gameObject_UpgradeSkill:SetActive(true);


        text_UpgradeMoney.transform.parent.gameObject:SetActive(false);
        for i = 1, 2 do
          text_UpgradeItems[i].transform.parent.gameObject:SetActive(false);
        end

        rawImage_CurrentUpgradeSkill.transform.parent.gameObject:SetActive(true);
        if npcUpgradeDatas[currentRole.data.upgradeLv] ~= nil and skillDatas[npcDatas[currentRole.npcId].upgradeSkill] ~= nil then
          skillDatas[npcDatas[currentRole.npcId].upgradeSkill]:SetIcon(rawImage_CurrentUpgradeSkill);
          rawImage_CurrentUpgradeSkill.enabled = true;

          text_CurrentUpgradeSkill.text = npcUpgradeDatas[currentRole.data.upgradeLv].skillLv;
        else
          rawImage_CurrentUpgradeSkill.texture = nil;
          rawImage_CurrentUpgradeSkill.enabled = false;

          text_CurrentUpgradeSkill.text = "";
        end

        rawImage_NextUpgradeSkill.transform.parent.gameObject:SetActive(true);
        if npcUpgradeDatas[currentRole.data.upgradeLv + 1] ~= nil and skillDatas[npcDatas[currentRole.npcId].upgradeSkill] ~= nil then
          skillDatas[npcDatas[currentRole.npcId].upgradeSkill]:SetIcon(rawImage_NextUpgradeSkill);
          rawImage_NextUpgradeSkill.enabled = true;

          text_NextUpgradeSkill.text = npcUpgradeDatas[currentRole.data.upgradeLv + 1].skillLv;
        else
          rawImage_NextUpgradeSkill.texture = nil;
          rawImage_NextUpgradeSkill.enabled = false;

          text_NextUpgradeSkill.text = "";
        end

        text_CurrentUpgradeLv.text = currentRole.data.upgradeLv;
        text_NextUpgradeLv.text = currentRole.data.upgradeLv + 1;
        text_UpgradePoint.text = "";

        text_Point.text = "";
        text_AttributePoint.text = "";

        text_AttributeSubmit.text = string.Get(20990);
        text_AttributeReset.text = string.Get(20991);
      elseif Role.rebornKind == 2 then
        text_AttributeSubmit.text = string.Get(20990);
        text_AttributeReset.text = string.Get(20073);
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

      end

    else
      if npcDatas[currentRole.npcId].upgradeItemId ~= 0 then
        if currentRole.npcId == upgradeNpcId then
          for i = 1, 2 do
            gameObject_UpgradeLvs[i]:SetActive(true);
          end
          gameObject_UpgradeItem:SetActive(true);
          gameObject_UpgradeSkill:SetActive(true);

          rawImage_CurrentUpgradeSkill.transform.parent.gameObject:SetActive(false);
          rawImage_NextUpgradeSkill.transform.parent.gameObject:SetActive(false);

          if npcUpgradeDatas[currentRole.data.upgradeLv + 1].requireMoney > 0 then
            text_UpgradeMoney.transform.parent.gameObject:SetActive(true);
            text_UpgradeMoney.text = npcUpgradeDatas[currentRole.data.upgradeLv + 1].requireMoney;
          else
            text_UpgradeMoney.transform.parent.gameObject:SetActive(false);
          end

          if npcUpgradeDatas[currentRole.data.upgradeLv + 1].requireDebris > 0 then
            text_UpgradeItems[1].transform.parent.gameObject:SetActive(true);
            text_UpgradeItems[1].text = string.Concat(RoleCount.Get(ERoleCount.NpcDebris), "/", npcUpgradeDatas[currentRole.data.upgradeLv + 1].requireDebris);
            item_Upgrades[1]:SetItem(65411);
          else
            text_UpgradeItems[1].transform.parent.gameObject:SetActive(false);
            item_Upgrades[1]:SetItem(0);
          end

          if npcUpgradeDatas[currentRole.data.upgradeLv + 1].requirePicture > 0 then
            text_UpgradeItems[2].transform.parent.gameObject:SetActive(true);
            text_UpgradeItems[2].text = string.Concat(Item.GetItemCount(npcDatas[currentRole.npcId].upgradeItemId), "/", npcUpgradeDatas[currentRole.data.upgradeLv + 1].requirePicture);
            item_Upgrades[2]:SetItem(npcDatas[currentRole.npcId].upgradeItemId);
          else
            text_UpgradeItems[2].transform.parent.gameObject:SetActive(false);
            item_Upgrades[2]:SetItem(0);
          end

          text_CurrentUpgradeLv.text = currentRole.data.upgradeLv;
          image_CurrentUpgradeLv.sprite = UI.GetUpgradeLvIcon(this.CheckDataGetUpgradeLvIcon(currentRole.data.upgradeLv));
          text_NextUpgradeLv.text = currentRole.data.upgradeLv + 1;
          image_NextUpgradeLv.sprite = UI.GetUpgradeLvIcon(this.CheckDataGetUpgradeLvIcon(currentRole.data.upgradeLv + 1));
          text_UpgradePoint.text = string.format(string.Get(21135), npcUpgradeDatas[currentRole.data.upgradeLv + 1].attributeAdd);

          text_Point.text = "";
          text_AttributePoint.text = "";

          event_AttributeSubmit.gameObject:SetActive(true);
          event_AttributeSubmit:SetColor(Color.White);

          text_AttributeSubmit.text = string.Get(21133);
          text_AttributeReset.text = string.Get(20991);
        else
          event_AttributeSubmit.gameObject:SetActive(true);
          --檢查強化升階、強化等級&二轉
          if npcUpgradeDatas[currentRole.data.upgradeLv + 1] == nil or
                  (currentRole.data.upgradeLv >= 10 and currentRole:GetAttribute(EAttribute.Turn) < 2) then
            event_AttributeSubmit:SetColor(Color.LightGray);
          else
            event_AttributeSubmit:SetColor(Color.White);
          end

          if currentRole:GetAttribute(EAttribute.Lv) <= 1 then
            event_AttributeReset:SetColor(Color.LightGray);
          end

          text_AttributeSubmit.text = string.Get(10409);
          text_AttributeReset.text = string.Get(71293);
        end
      else
        event_AttributeSubmit.gameObject:SetActive(false);

        if currentRole:GetAttribute(EAttribute.Lv) <= 1 then
          event_AttributeReset:SetColor(Color.LightGray);
        end

        text_AttributeReset.text = string.Get(71293);
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

      end
    end
  end
end

function UIStatus.UpdateMoral()
  if currentTag ~= EUIStatusTag.Moral then return end
  if currentRole == nil then return end

  radar_Moral.gameObject:SetActive(false);
  for i = 1, 5 do
    local value = currentRole:GetAttribute(EAttribute.Moral, i);

    if currentRole ~= Role.player then
      value = math.max(value, 500);
    end

    text_Morals[i].text = value;
    radar_Moral.VerticesDistances[i - 1] = 0.2 + (value / 5000) * 1;
  end
  radar_Moral.gameObject:SetActive(true);
end

function UIStatus.UpdateEquip(reopenBag)
  if currentTag ~= EUIStatusTag.Equip then return end

  if reopenBag == true then
    UI.Open(UIBag,
      function(bagIndex, itemId)
        this.OpenItemInfo(itemId, bagIndex);
      end,
      Vector2.New(260, -25),
      false,
      nil,
      nil,
      true,
      false,
      nil,
      true
    );
  end

  item_Equips[EItemFitType.Equip_Spec].transform.parent.gameObject:SetActive(true);

  if currentRole == nil then return end

  for i = 1, Role.maxEquip do
    this.ShowRoleEquips(Item.GetBagItem(EThings.Equip, i, currentFollowIndex), i);
  end
end

function UIStatus.OpenLauncherBar(bagKind, bagIndex, followIndex)
  if not Contains(Role.player.war, EWar.None, EWar.Guest) then
    ShowCenterMessage(string.Get(80099));
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
  
    return;
  end

  local itemSave = Item.GetBagItem(bagKind, bagIndex);
  if itemSave == nil then return end

  Hotkey.Show(Role.player, EHotkeyDisplayMode.SingleItem, itemSave.Id);
end

function UIStatus.UpdateStyle(reopenBag)
  if currentTag ~= EUIStatusTag.Style then return end

  if reopenBag == true then
    UI.Open(UIBag,
      function(bagIndex, itemId)
        this.OpenItemInfo(itemId, bagIndex);
      end,
      Vector2.New(260, -25),
      false,
      nil,
      function(itemSave)
        if itemDatas[itemSave.Id] == nil then return false end
        if itemSave.isVender then return false end
        if itemSave.isDeliver then return false end
        if fashionStressDatas[itemSave.Id] ~= nil then return true end
      
        return false;
      end,
      true,
      false
    );
  end

  item_Equips[EItemFitType.Equip_Spec].transform.parent.gameObject:SetActive(false);

  if currentRole == nil then return end

  for i = EItemFitType.Style_Head, EItemFitType.Style_Boots do
    this.ShowRoleEquips(Item.GetBagItem(EThings.Equip, i, 0), i - EItemFitType.Equip_Spec);
  end
end

function UIStatus.UpdateOutfitStyle(reopenbag)
  if currentTag ~= EUIStatusTag.OutfitStyle then return end
  --outfit背包
  
  if reopenbag == true then
    UI.Open(UIBag,
      function(bagIndex, itemId)
        this.OpenOutfitStyleInfo(itemId, bagIndex);
      end,
      Vector2.New(260, -25),
      false,
      nil,
      function(itemSave)
        if itemDatas[itemSave.Id] == nil then return false end
        if not Item.IsStyle(itemDatas[itemSave.Id].fitType) then return false end
        if currentOutfitSyleCategory ~= 0 then
          if not Contains(itemDatas[itemSave.Id].fitType,currentOutfitSyleCategory) then return false end
        end
        if this.CheckOutfitStyleEquiped(itemSave.Id) then return false end
        return true;
      end,
      false,
      false,
      EThings.OutfitStyleInCollection
    );
  end
  
  --身上裝備
  item_Equips[EItemFitType.Equip_Spec].transform.parent.gameObject:SetActive(false);
  
  if currentRole == nil then return end
  
  for i = EItemFitType.OutfitStyle_Head, EItemFitType.OutfitStyle_Boots do
    this.ShowRoleEquips(Item.GetBagItem(EThings.Equip, i, 0),i - EItemFitType.Equip_Spec - Role.maxOutfitStyle);
  end
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


end

function UIStatus.UpdateOutfitStyleHintAndIcon()
  if not Contains(currentTag, EUIStatusTag.Style, EUIStatusTag.OutfitStyle) then return end
  
  if currentTag == EUIStatusTag.Style then
    image_SwitchOutfitStyle.sprite = UI.GetSprite("but261D");
    text_switchOutfitStyleButText.text = string.Get(23643);
    text_styleTagInfo.text = string.Get(23640);
  elseif  currentTag == EUIStatusTag.OutfitStyle then
    image_SwitchOutfitStyle.sprite = UI.GetSprite("but261L");
    image_CategoryHead.sprite = UI.GetSprite("but263D");
    image_CategoryBody.sprite = UI.GetSprite("but060D");
    image_CategoryWrist.sprite = UI.GetSprite("but262D");
    image_CategoryFoot.sprite = UI.GetSprite("but264D");
    image_CategoryHand.sprite = UI.GetSprite("but265D");
    if currentOutfitSyleCategory == EItemFitType.Style_Head then
      image_CategoryHead.sprite = UI.GetSprite("but263L");
    elseif currentOutfitSyleCategory == EItemFitType.Style_Body then
      image_CategoryBody.sprite = UI.GetSprite("but060L");
    elseif currentOutfitSyleCategory == EItemFitType.Style_Wrist then
      image_CategoryWrist.sprite = UI.GetSprite("but262L");
    elseif currentOutfitSyleCategory == EItemFitType.Style_Boots then
      image_CategoryFoot.sprite = UI.GetSprite("but264L");
    elseif currentOutfitSyleCategory == EItemFitType.Style_Hand then
      image_CategoryHand.sprite = UI.GetSprite("but265L");
    end
    text_switchOutfitStyleButText.text = string.Get(23642);
    text_styleTagInfo.text = string.Get(23641);
  end
end

function UIStatus.OpenItemInfo(itemId, bagIndex)
  local itemData = itemDatas[itemId];

  if Item.CheckItemUseState(itemId) then
    if Item.CheckHotKeyItemID(itemId) then
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, currentFollowIndex, string.Get(98025), Item.DropItem, string.Get(98026), this.OpenLauncherBar);
    elseif itemData.kind == EItemKind.CityWeapon then
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, currentFollowIndex, string.Get(22120), Item.DropItem);
    else
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, currentFollowIndex, string.Get(98025), Item.DropItem);
    end
  elseif BlissBagData.IsBlissBag(itemId) then
    if itemData.specialAbility  ==  EItemUseKind.LockBlissBag then
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, currentFollowIndex, string.Get(98025), Item.DropItem, string.Get(22005), this.ShowLockBlissBag);
    elseif itemData.specialAbility == EItemUseKind.ArmyBlissBag then
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, currentFollowIndex, string.Get(98025), Item.DropItem, string.Get(22885), Item.UseItem);
    else
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, currentFollowIndex, string.Get(98025), Item.DropItem, string.Get(40314), Item.UseItem);
    end
  elseif Item.CheckHotKeyItemID(itemId) then
    UI.Open(UIItemInfo, EThings.Bag, bagIndex, currentFollowIndex, string.Get(98025), Item.DropItem, string.Get(40314), Item.UseItem, string.Get(98026), this.OpenLauncherBar);
  elseif itemData.specialAbility == EItemUseKind.Exchange and exchangeDatas[itemId] ~= nil then
    UI.Open(UIItemInfo, EThings.Bag, bagIndex, currentFollowIndex, string.Get(98025), Item.DropItem, string.Get(20253), Item.UseItem);
  elseif itemData.specialAbility == EItemUseKind.WeaponRecipe and exchangeDatas[itemId] ~= nil then
    UI.Open(UIItemInfo, EThings.Bag, bagIndex, currentFollowIndex, string.Get(98025), Item.DropItem, string.Get(20253), Item.UseItem);
  elseif itemData.kind == EItemKind.ExclusiveWeapon then
    if ExclusiveWeapon.CheckIsSkill(itemId) then
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, currentFollowIndex, string.Get(98025), Item.DropItem, string.Get(21026), Item.Dismantle,string.Get(20165), Item.UseItem, string.Get(20869), ExclusiveWeapon.ViewSkill);
    else
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, currentFollowIndex, string.Get(98025), Item.DropItem, string.Get(20165), Item.UseItem);
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

    end
  elseif Item.IsTypeOfEquips(itemData.fitType) then
    local styleFinded = false;
    local styleText = nil;
    local styleFunc = nil;
    local outfitStylefunction = nil;
    if Item.IsStyle(itemData.fitType) and fashionStressDatas[itemId] == nil then
      for k, v in pairs(collectStyleDatas) do
        for i = 1, 5 do
          if v.itemId[i] == itemId then
              styleFinded = true;
            if not CollectStyle.CheckEquiped(k, i) then
              styleText = string.Concat(string.Get(21408), string.Get(10607));
              styleFunc = function(bagKind, bagIndex, followIndex)
                CollectStyle.SendStoreStyle(k, i);
              end
            end
            outfitStylefunction = function(bagKind, bagIndex, followIndex)
              this.SendEquipOutfitStyleFromBag(k, i, itemId)
            end
            break;
          end
        end
        
        if styleFinded then
          break;
        end
      end
      if Item.IsDismantle(itemData) then
        UI.Open(UIItemInfo, EThings.Bag, bagIndex, currentFollowIndex, string.Get(98025), Item.DropItem, string.Get(21026), Item.Dismantle, string.Get(20165), outfitStylefunction, styleText, styleFunc);
      else
        UI.Open(UIItemInfo, EThings.Bag, bagIndex, currentFollowIndex, string.Get(98025), Item.DropItem, string.Get(20165), outfitStylefunction, styleText, styleFunc);
      end
    else
      if Item.IsDismantle(itemData) then
        UI.Open(UIItemInfo, EThings.Bag, bagIndex, currentFollowIndex, string.Get(98025), Item.DropItem, string.Get(21026), Item.Dismantle, string.Get(20165), Item.UseItem);
      else
        UI.Open(UIItemInfo, EThings.Bag, bagIndex, currentFollowIndex, string.Get(98025), Item.DropItem, string.Get(20165), Item.UseItem);
      end
    end
  else
    if Item.IsDismantle(itemData) then
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, currentFollowIndex, string.Get(98025), Item.DropItem, string.Get(21026), Item.Dismantle, string.Get(40314), Item.UseItem);
    else
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, currentFollowIndex, string.Get(98025), Item.DropItem, string.Get(40314), Item.UseItem);
    end
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

  end
end

function UIStatus.ShowLockBlissBag(bagKind, bagIndex, followIndex)
  UIItemInfo.ShowLockBlissBag(bagIndex, followIndex);
end

function UIStatus.ShowRoleEquips(itemSave, i)
  if itemSave ~= nil and itemDatas[itemSave.Id] ~= nil then
    item_Equips[i]:SetItem(itemSave.Id, itemSave.quant, itemSave);
  else
    item_Equips[i]:SetItem(0);
  end
end

function UIStatus.UpdateSell()
  if currentTag ~= EUIStatusTag.Sell then return end
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
  
  UI.Open(UIBag,
    function(bagIndex, itemId)
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, 0,
        string.Get(30114),
        function(bagKind, bagIndex, followIndex)
          if not Contains(Role.player.war, EWar.None, EWar.Guest) then
            ShowCenterMessage(string.Get(80099));
            return;
          end

          UI.Close(UIItemInfo);

          local itemSave = Item.GetBagItem(EThings.Bag, bagIndex);
          if itemSave.quant > 1 then
            ShowStoreInput(itemSave.Id, itemSave.quant, ECurrency.Money, itemDatas[itemSave.Id].sellPrice,
              function(value)
                if value == nil or tonumber(value) <= 0 then return end

                --C:027-002 <賣東西> +背包索引(2) +數量(4)
                sendBuffer:Clear();
                sendBuffer:WriteUInt16(bagIndex);
                sendBuffer:WriteInt32(math.min(itemSave.quant, tonumber(value)));
                Network.Send(27, 2, sendBuffer);
              end
            );
          else
            --C:027-002 <賣東西> +背包索引(2) +數量(4)
            sendBuffer:Clear();
            sendBuffer:WriteUInt16(bagIndex);
            sendBuffer:WriteInt32(1);
            Network.Send(27, 2, sendBuffer);
          end
        end
      );
    end,
    Vector2.New(260, -25),
    false,
    nil,
    function(itemSave)
      if itemDatas[itemSave.Id] == nil then return false end
      if itemSave.isVender then return false end
      if itemSave.isDeliver then return false end
      if itemSave.isLock then return false end
      if bit.band(itemDatas[itemSave.Id].restrict, 16) >= 16 then return false end
      if itemDatas[itemSave.Id].sellPrice <= 0 then return false end

      return true;
    end,
    true,
    false
  );

  item_Equips[EItemFitType.Equip_Spec].transform.parent.gameObject:SetActive(true);

  if currentRole == nil then return end

  for i = 1, Role.maxEquip do
    this.ShowRoleEquips(Item.GetBagItem(EThings.Equip, i, currentFollowIndex), i);
  end
end

function UIStatus.UpdateChatPaste()
  if currentTag ~= EUIStatusTag.ChatPaste then return end

  UI.Open(UIBag,
    function(bagIndex, itemId)
      UI.Open(UIItemInfo, EThings.Bag, bagIndex, 0, string.Get(10093), Chat.AddItemMessage);
    end,
    Vector2.New(260, -25),
    false,
    nil,
    nil,
    true,
    false
  );

  item_Equips[EItemFitType.Equip_Spec].transform.parent.gameObject:SetActive(true);

  if currentRole == nil then return end

  for i = 1, Role.maxEquip do
    this.ShowRoleEquips(Item.GetBagItem(EThings.Equip, i, currentFollowIndex), i);
  end
end

function UIStatus.UpdateFightEquip(reopenBag)
  if currentTag ~= EUIStatusTag.FightEquip then return end

  if reopenBag == true then
    UI.Open(UIBag,
      function(bagIndex, itemId)
        local funName;
        if Item.IsTypeOfEquips(itemDatas[itemId].fitType) then
          funName = string.Get(20165); --裝備
        else
          funName = string.Get(40314); --使用
        end

        UI.Open(UIItemInfo, EThings.Bag, bagIndex, currentFollowIndex, funName, Item.UseItem);
      end,
      Vector2.New(260, -25),
      false,
      nil,
      function(itemSave)
        if itemSave.isVender then return false end
        if itemSave.isDeliver then return false end

        local itemData = itemDatas[itemSave.Id];
        if itemData == nil then return false end
        if itemData.openUsed == 1 then return false end
        if itemData.btnState > 0 and itemData.btnState ~= 11 then return false end

        if Contains(itemData.kind, EItemKind.Item_16, EItemKind.Item_17, EItemKind.Item_18, EItemKind.Item_50) then return true end
        if Item.IsEquip(itemData.fitType) then return true end
        if Contains(itemData.specialAbility, EItemUseKind.ItemUse_25, EItemUseKind.ItemUse_54, EItemUseKind.ItemUse_165) then return true end
        if bit.band(itemData.restrict2, 2) == 2 then return true end

        return false;
      end,
      true,
      false
    );
  end

  item_Equips[EItemFitType.Equip_Spec].transform.parent.gameObject:SetActive(true);

  if currentRole == nil then return end

  for i = 1, Role.maxEquip do
    this.ShowRoleEquips(Item.GetBagItem(EThings.Equip, i, currentFollowIndex), i);
  end
end

function UIStatus.UpdateFightStyle(reopenBag)
  if currentTag ~= EUIStatusTag.FightStyle then return end

  if reopenBag == true then
    UI.Open(UIBag,
      function(bagIndex, itemId)
        local funName;
        if Item.IsTypeOfEquips(itemDatas[itemId].fitType) then
          funName = string.Get(20165); --裝備
        else
          funName = string.Get(40314); --使用
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

        end

        UI.Open(UIItemInfo, EThings.Bag, bagIndex, currentFollowIndex, funName, Item.UseItem);
      end,
      Vector2.New(260, -25),
      false,
      nil,
      function(itemSave)
        if itemSave.isVender then return false end
        if itemSave.isDeliver then return false end

        local itemData = itemDatas[itemSave.Id];
        if itemData == nil then return false end
        if itemData.openUsed == 1 then return false end
        if itemData.btnState > 0 and itemData.btnState ~= 11 then return false end

        if Item.IsStyle(itemData.fitType) and currentRole.kind == EHuman.Player then return true end

        return false;
      end,
      true,
      false
    );
  end

  item_Equips[EItemFitType.Equip_Spec].transform.parent.gameObject:SetActive(false);

  if currentRole == nil then return end

  for i = EItemFitType.Style_Head, EItemFitType.Style_Boots do
    this.ShowRoleEquips(Item.GetBagItem(EThings.Equip, i, 0), i - EItemFitType.Equip_Spec);
  end
end

function UIStatus.UpdateDetail()
  if not showDetail then return end
  UIStatusGameObject[EUIStatusGameObject.Detail]:ShowInfo(currentRole, attComponents);
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

end

function UIStatus.UpdateAstrolabe()
  if currentTag ~= EUIStatusTag.Astrolabe then return end

  local nextStar = Astrolabe.FindNextStar();

  local needPoint = 0;
  local needMoney = 0;
  if Astrolabe.starLv[nextStar] < Astrolabe.maxAstrolabeLv then
    needPoint = astrolabeDatas[nextStar].attributes[Astrolabe.starLv[nextStar] + 1].needPoint;
    needMoney = math.pow(Astrolabe.starLv[nextStar] + 1, 2) * 10000;
  end

  if Astrolabe.natalPoint >= needPoint then
    text_AstrolabePoint.text = string.Concat(Astrolabe.natalPoint, "/", needPoint);
  else
    text_AstrolabePoint.text = string.GetColorText(string.Concat(Astrolabe.natalPoint, "/", needPoint), Color.Red);
  end

  if Role.GetPlayerGold() >= needMoney then
    text_AstrolabeMoney.text = needMoney;
  else
    text_AstrolabeMoney.text = string.GetColorText(needMoney, Color.Red);
  end

  for i = 1, Astrolabe.maxAstrolabe do
    text_AstrolabeAttribute[i].text = string.Concat("+", Astrolabe.GetAttribute(i));

    if i == nextStar and Astrolabe.starLv[nextStar] < Astrolabe.maxAstrolabeLv then
      text_AstrolabeNextAttribute[i].gameObject:SetActive(true);
      text_AstrolabeNextAttribute[i].text = string.Concat("+", Astrolabe.GetAttribute(i, Astrolabe.starLv[nextStar] + 1));
    else
      text_AstrolabeNextAttribute[i].gameObject:SetActive(false);
    end
  end

  TextureManager.SetPng(ETextureUseType.UI, "Astrolabe_BG", rawImage_AstrolabeBG);
  TextureManager.SetPng(ETextureUseType.UI, "Astrolabe_BadoB07", rawImage_AstrolabePoint);
  for i = 1, Astrolabe.maxAstrolabe do
    TextureManager.SetPng(ETextureUseType.UI, "Astrolabe_Ball", rawImage_AstrolabeBall[i]);

    if nextStar > i or astrolabeShowTimer > 0 or Astrolabe.starLv[i] == Astrolabe.maxAstrolabeLv then
      TextureManager.SetPng(ETextureUseType.UI, string.format("Astrolabe_BadoB%02d", i), rawImage_AstrolabeStar[i]);
      rawImage_AstrolabeBall[i].gameObject:SetActive(true);
    else
      TextureManager.SetPng(ETextureUseType.UI, string.format("Astrolabe_BadoA%02d", i), rawImage_AstrolabeStar[i]);
      rawImage_AstrolabeBall[i].gameObject:SetActive(false);
    end
  end
end

function UIStatus.UpdateHomePage()
  if not HouseBoard.FeatureIsOpen() then return end
  if currentTag == EUIStatusTag.Profile then

    HouseBoard.SendOpenBoardRequest(Role.playerId);
  else
    UI.Close(UIHouseBoard, true);
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

  end
end

function UIStatus.UpdateBreakthrough(reopenBag)
  if currentTag ~= EUIStatusTag.Breakthrough then return end
  RedDot.Remove(ERedDot.Breakthrough);
  if currentRole ~= Role.player then
    currentRole = Role.player;
    text_Name.text = currentRole.name;
    text_Lv.text = currentRole:GetAttribute(EAttribute.Lv);
    uiCareer:SetCareer(currentRole:GetAttribute(EAttribute.Turn), currentRole:GetAttribute(EAttribute.Element), currentRole:GetAttribute(EAttribute.Career), currentRole.kind == EHuman.FollowNpc, currentRole:GetAttribute(EAttribute.Turn3Element));
  end

  if reopenBag == true then
    UI.Open(UIBag,
      function(bagIndex, itemId)
        this.OpenItemInfo(itemId, bagIndex);
      end,
      Vector2.New(260, -25),
      false,
      nil,
      nil,
      true,
      false
    );
  end

  Breakthrough.UpdateBreakthroughBar();
  UIStatus.RefreshBreakthrough();
  text_BreakthroughLevel.text = Breakthrough.GetBreakthroughLevelText();
end

function UIStatus.AstrolabeLevelUp()
  astrolabeShowTimer = Astrolabe.levelUpShowTime;
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

end

function UIStatus.OnClick_Close()
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
  
  UI.Close(UIStatus);

  return true;
end

function UIStatus.OnClick_Help(checkShow)
  if currentTag == EUIStatusTag.Status then
    if checkShow ~= true then
      UI.Open(UITutorialHint, 11, this);
    end
  elseif currentTag == EUIStatusTag.Moral then
    if checkShow ~= true then
      UI.Open(UITutorialHint, 12, this);
    end
  elseif currentTag == EUIStatusTag.Astrolabe then
    if checkShow ~= true then
      UI.Open(UITutorialHint, 44, this);
    end
  elseif HouseBoard.FeatureIsOpen() and currentTag == EUIStatusTag.Profile then
    if checkShow ~= true then
      UI.Open(UITutorialHint, 0, this, string.Get(23356), string.Get(24127));
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

    end
  elseif currentTag == EUIStatusTag.Style or currentTag == EUIStatusTag.OutfitStyle then
    if checkShow ~= true then
      UI.Open(UITutorialHint, 59, this);
    end
  else
    return false;
  end

  return true;
end

function UIStatus.OnClick_Tag(mainTag, subTag)
  if Contains(currentTag, EUIStatusTag.Sell, EUIStatusTag.ChatPaste) then return false end

  if Contains(currentTag, EUIStatusTag.FightEquip, EUIStatusTag.FightStyle) then
    if FightField.GetConFightRoleKind() == EHuman.FollowNpc then
      if not Contains(mainTag + tagOffset, EUIStatusTag.FightEquip) then
        return false;
      end
    else
      if not Contains(mainTag + tagOffset, EUIStatusTag.FightEquip, EUIStatusTag.FightStyle) then
        return false;
      end
    end
  end

  currentTag = mainTag + tagOffset;

  if Contains(currentTag, EUIStatusTag.Style,EUIStatusTag.OutfitStyle, EUIStatusTag.FightStyle) then
    currentFollowIndex = 0;
    currentRole = Role.player;
  end

  upgradeNpcId = 0;

  this.UpdateUI(true, true);

  return true;
end

function UIStatus.OnClick_Equip(uiEvent)
  if currentTag == EUIStatusTag.Sell then return end
  if not Contains(currentTag, EUIStatusTag.Equip, EUIStatusTag.Style, EUIStatusTag.OutfitStyle, EUIStatusTag.ChatPaste, EUIStatusTag.FightEquip, EUIStatusTag.FightStyle) then return end
  if currentRole == nil then return end

  local fitType = uiEvent.parameter;

  if Contains(currentTag, EUIStatusTag.Style, EUIStatusTag.FightStyle) then
    fitType = fitType + EItemFitType.Equip_Spec;
  elseif currentTag == EUIStatusTag.OutfitStyle then
    fitType = fitType + EItemFitType.Equip_Spec + Role.maxOutfitStyle;
  end
  
  local  itemSave;
  if currentTag ~= EUIStatusTag.OutfitStyle then
     itemSave = Item.GetBagItem(EThings.Equip, fitType, currentFollowIndex);
  end

  if currentTag == EUIStatusTag.ChatPaste then
    UI.Open(UIItemInfo, EThings.Equip, fitType, currentFollowIndex, string.Get(10093), Chat.AddItemMessage);
  elseif Contains(currentTag, EUIStatusTag.FightEquip, EUIStatusTag.FightStyle) then
    -- 判斷戰鬥是否為天空競技場，禁止天空競技場NPC卸下裝備
    if Role.player.war == EWar.ChaosGod then
      local fightRole = FightField.fightHum[FightField.conIdx];
      if fightRole ~= nil and fightRole.kind == EHuman.ChaosGod then
        ShowCenterMessage(string.Get(22493));
      end
    else
      if itemSave ~= nil and itemDatas[itemSave.Id] ~= nil and itemDatas[itemSave.Id].kind == EItemKind.ExclusiveWeapon then
        UI.Open(UIItemInfo, EThings.Equip, fitType, currentFollowIndex, string.Get(98003), Item.UnEquip, string.Get(20869), ExclusiveWeapon.ViewSkill);
      else
        UI.Open(UIItemInfo, EThings.Equip, fitType, currentFollowIndex, string.Get(98003), Item.UnEquip);
      end
    end
  elseif currentTag == EUIStatusTag.OutfitStyle then
    UI.Open(UIItemInfo, EThings.Equip, fitType, 0, string.Get(98003), this.SendUnEquipOutfitStyle);
  else
    if itemSave ~= nil and itemDatas[itemSave.Id] ~= nil and itemDatas[itemSave.Id].kind == EItemKind.ExclusiveWeapon then
      UI.Open(UIItemInfo, EThings.Equip, fitType, currentFollowIndex, string.Get(98025), Item.DropEquip, string.Get(98003), Item.UnEquip, string.Get(20869), ExclusiveWeapon.ViewSkill);
    else
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
  
      UI.Open(UIItemInfo, EThings.Equip, fitType, currentFollowIndex, string.Get(98025), Item.DropEquip, string.Get(98003), Item.UnEquip);
    end
  end
end

function UIStatus.OnClick_SwitchRole(uiEvent)
  if Contains(currentTag, EUIStatusTag.Style,EUIStatusTag.OutfitStyle, EUIStatusTag.Sell) then return end
  if Contains(currentTag, EUIStatusTag.FightEquip, EUIStatusTag.FightStyle) then
    ShowCenterMessage(string.Get(20590));
    return;
  end

  currentRole = nil;

  if uiEvent.parameter > 0 then
    for i = currentFollowIndex + 1, Role.maxFollowNpc do
      currentRole = Role.GetRole(EHuman.FollowNpc, Role.playerId, i);

      if currentRole ~= nil then
        currentFollowIndex = i;
        break;
      end
    end
  else
    if currentFollowIndex == 0 then
      currentFollowIndex = Role.maxFollowNpc + 1;
    end

    for i = currentFollowIndex - 1, 1, -1 do
      currentRole = Role.GetRole(EHuman.FollowNpc, Role.playerId, i);

      if currentRole ~= nil then
        currentFollowIndex = i;
        break;
      end
    end
  end

  if currentRole == nil then
    currentFollowIndex = 0;
    currentRole = Role.player;
  end

  upgradeNpcId = 0;

  this.UpdateUI(nil, true);
end

function UIStatus.OnClick_Share(uiEvent)
  Chat.AddNpcMessage(currentRole);
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

end

function UIStatus.OnClick_AttributeEnter(uiEvent)
  local index = uiEvent.parameter;

  if tonumber(text_AttributePoint.text) < 1 and attComponents[index].add < 1 then return end

  ShowCountInput(string.Get(21280), 0, tonumber(text_AttributePoint.text) + attComponents[index].add,
    function(text)
      if text == nil then return end
      attComponents[index].add = tonumber(text);
      this.UpdateStatusAdd();
      this.UpdateDetail();
    end
  );
end

function UIStatus.OnClick_AttributeAdd(uiEvent)
  local index = uiEvent.parameter;

  if tonumber(text_AttributePoint.text) < 1 then return end

  attComponents[index].add = attComponents[index].add + 1;

  this.UpdateStatusAdd();
  this.UpdateDetail();
end

function UIStatus.OnClick_AttributeDec(uiEvent)
  local index = uiEvent.parameter;

  if attComponents[index].add < 1 then return end

  attComponents[index].add = attComponents[index].add - 1;

  this.UpdateStatusAdd();
  this.UpdateDetail();
end

function UIStatus.OnClick_AttributeFastAdd(uiEvent)
  local index = uiEvent.parameter;
  local attributePoint = tonumber(text_AttributePoint.text);
  if attributePoint < 1 then return end
  local addPoint;
  if attributePoint < attributeFastPoint then
    addPoint = attributePoint;
  else
    addPoint = attributeFastPoint;
  end
  attComponents[index].add = attComponents[index].add + addPoint;

  this.UpdateStatusAdd();
  this.UpdateDetail();
end

function UIStatus.OnClick_AttributeFastDec(uiEvent)
  local index = uiEvent.parameter;
  local decreasePoint;
  if attComponents[index].add < 1 then return end
  if attComponents[index].add < attributeFastPoint then
    decreasePoint = attComponents[index].add;
  else
    decreasePoint = attributeFastPoint;
  end

  attComponents[index].add = attComponents[index].add - decreasePoint;

  this.UpdateStatusAdd();
  this.UpdateDetail();

end

function UIStatus.OnClick_AttributeLock(uiEvent)
  if currentRole.kind == EHuman.Player then
  else
    --領悟丹
    if Contains(currentRole.data.canGrow, 0, 2) then
      ShowCenterMessage(string.Get(40333));
      return;
    end

    if currentRole.data.graspPill.index ~= 0 then
      ShowCenterMessage("GraspPill is locked !!");
      return;
    end

    if currentRole.data.graspPill.count >= Role.npcMaxGraspPill then
      ShowCenterMessage("GraspPill can't use any more !!");
      return;
    end

    if uiEvent.parameter == 1 then
      UISell.Launch(18, nil, currentRole.index);
    elseif uiEvent.parameter == 2 then
      UISell.Launch(19, nil, currentRole.index);
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

    elseif uiEvent.parameter == 3 then
      UISell.Launch(20, nil, currentRole.index);
    elseif uiEvent.parameter == 4 then
      UISell.Launch(21, nil, currentRole.index);
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

    elseif uiEvent.parameter == 5 then
      UISell.Launch(22, nil, currentRole.index);
    elseif uiEvent.parameter == 6 then
      UISell.Launch(23, nil, currentRole.index);
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

    end
  end
end

function UIStatus.OnClick_AttributeSubmit()
  if currentRole.kind == EHuman.Player then
    --確認投點
    if not Contains(Role.player.war, EWar.None, EWar.Guest) then
      ShowCenterMessage(string.Get(80099));
      return;
    end

    --檢查是否被關監
    if SceneManager.sceneId == 10701 then
      ShowCenterMessage(string.Get(40097), 1.2);
      return;
    end

    for i = 1, 6 do
      if attComponents[i].add > 0 then
        --C:008-001 <設定屬性> +武將索引(2) +種類(1) +數值(4) +參數(1)
        sendBuffer:Clear();
        if currentRole == Role.player then
          sendBuffer:WriteUInt16(0);
        else
          sendBuffer:WriteUInt16(currentRole.index);
        end

        if i == 1 then
          sendBuffer:WriteByte(EAttribute.Int);
        elseif i == 2 then
          sendBuffer:WriteByte(EAttribute.Atk);
        elseif i == 3 then
          sendBuffer:WriteByte(EAttribute.Def);
        elseif i == 4 then
          sendBuffer:WriteByte(EAttribute.Hpx);
        elseif i == 5 then
          sendBuffer:WriteByte(EAttribute.Spx);
        elseif i == 6 then
          sendBuffer:WriteByte(EAttribute.Agi);
        end

        sendBuffer:WriteInt32(attComponents[i].add);
        sendBuffer:WriteByte(0);
        Network.Send(8, 1, sendBuffer);
      end
    end
    this.UpdateStatus();

  else
    if currentRole.npcId == Role.rebornNpcId then
      if Role.rebornKind == 1 then
        --C:074-002 <武將確定強化>
        Network.Send(74, 2);
      elseif Role.rebornKind == 2 then
        --C:008-011 <脫胎換骨確認> +武將索引(1) +結果(1)
        sendBuffer:Clear();
        sendBuffer:WriteByte(currentRole.index);
        sendBuffer:WriteByte(1);
        Network.Send(8, 11, sendBuffer);
      end
    else
      if npcDatas[Role.rebornNpcId] ~= nil then
        if Role.rebornKind == 1 then
          ShowCenterMessage(string.format(string.Get(71288), npcDatas[Role.rebornNpcId].name, string.Get(71290), string.Get(71292)));
        elseif Role.rebornKind == 2 then
          ShowCenterMessage(string.format(string.Get(71288), npcDatas[Role.rebornNpcId].name, string.Get(71291), string.Get(71292)));
        end

        return;
      end

      if currentRole.npcId == upgradeNpcId then
        if npcDatas[currentRole.npcId].upgradeItemId == 0 then
          ShowCenterMessage("picture not found !!");
          return;
        end

        if npcUpgradeDatas[currentRole.data.upgradeLv + 1] == nil then
          return;
        end

        if Role.GetPlayerGold() < npcUpgradeDatas[currentRole.data.upgradeLv + 1].requireMoney then
          ShowCenterMessage(string.Get(80401));
          return;
        end

        if RoleCount.Get(ERoleCount.NpcDebris) < npcUpgradeDatas[currentRole.data.upgradeLv + 1].requireDebris then
          ShowCenterMessage(string.Get(21086));
          return;
        end

        if Item.GetItemCount(npcDatas[currentRole.npcId].upgradeItemId) < npcUpgradeDatas[currentRole.data.upgradeLv + 1].requirePicture then
          ShowCenterMessage(string.Get(21086));
          return;
        end

        upgradeNpcId = 0;

        --C:074-001 <武將強化> +武將索引(1) +NPCID(2)
        sendBuffer:Clear();
        sendBuffer:WriteByte(currentRole.index);
        sendBuffer:WriteUInt16(currentRole.npcId);
        Network.Send(74, 1, sendBuffer);
      else
        if npcUpgradeDatas[currentRole.data.upgradeLv + 1] == nil then
          return;
        end
        --2轉後才能升11-15
        if currentRole.data.upgradeLv >= 10 and currentRole:GetAttribute(EAttribute.Turn) < 2 then
          return;
        end

        if Contains(currentRole.data.canGrow, 0, 2) then
          ShowCenterMessage(string.Get(40333));
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
  
          return;
        end

        upgradeNpcId = currentRole.npcId;
        this.UpdateStatus();
      end
    end
  end
end

function UIStatus.OnClick_AttributeReset()
  if not Contains(Role.player.war, EWar.None, EWar.Guest) then
    ShowCenterMessage(string.Get(80099));
    return;
  end
  if currentRole.kind == EHuman.Player then
    if tonumber(text_AttributePoint.text) < currentRole:GetAttribute(EAttribute.AttrPoint) then
      --取消投點
      for i = 1, 6 do
        attComponents[i].add = 0;
      end

      this.UpdateStatusAdd();
      this.UpdateDetail();
    else
      --重置點數
      local count = 0;
      count = count + currentRole:GetAttribute(EAttribute.Int);
      count = count + currentRole:GetAttribute(EAttribute.Atk);
      count = count + currentRole:GetAttribute(EAttribute.Def);
      count = count + currentRole:GetAttribute(EAttribute.Hpx);
      count = count + currentRole:GetAttribute(EAttribute.Spx);
      count = count + currentRole:GetAttribute(EAttribute.Agi);

      if count == 0 then return end

      UISell.Launch(15);
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

    end
  else
    if currentRole.npcId == Role.rebornNpcId then
      if Role.rebornKind == 1 then
        ShowCheckMessage(
          function(result)
            if result then
              --C:074-003 <武將取消強化>
              Network.Send(74, 3);
            end
          end,
          string.Get(21085),
          Role.player
        )
      elseif Role.rebornKind == 2 then
        --C:008-011 <脫胎換骨確認> +武將索引(1) +結果(1)
        sendBuffer:Clear();
        sendBuffer:WriteByte(currentRole.index);
        sendBuffer:WriteByte(2);
        Network.Send(8, 11, sendBuffer);
      end
    else
      if currentRole.npcId == upgradeNpcId then
        upgradeNpcId = 0;
        this.UpdateStatus();
      else
        if currentRole:GetAttribute(EAttribute.Lv) <= 1 then return end

        if npcDatas[Role.rebornNpcId] ~= nil then
          if Role.rebornKind == 1 then
            ShowCenterMessage(string.format(string.Get(71288), npcDatas[Role.rebornNpcId].name, string.Get(71290), string.Get(71293)));
          elseif Role.rebornKind == 2 then
            ShowCenterMessage(string.format(string.Get(71288), npcDatas[Role.rebornNpcId].name, string.Get(71291), string.Get(71293)));
          end

          return;
        end

        if Contains(currentRole.data.canGrow, 0, 2) then
          ShowCenterMessage(string.Get(40333));
          return;
        end

        --脫胎換骨
        UISell.Launch(16, nil, currentRole.index);
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

      end
    end
  end
end

function UIStatus.OnClick_Detail()
  if currentTag == EUIStatusTag.Sell then return end

  showDetail = not showDetail;

  this.UpdateUI();
end

function UIStatus.OnClick_ChgName()
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end

  ShowNameInput("",
    function(text)
      if string.IsNullOrEmpty(text) then return end
      if not string.CheckName(text) then return end
      if Role.player.war ~= EWar.None then
        ShowCenterMessage(string.Get(80099));
        return;
      end
  
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
  
      --C:067-001 <檢查名字> +L(1) +名字(L)
      sendBuffer:Clear();
      sendBuffer:WriteStringWithByteL(text);
      Network.Send(67, 1, sendBuffer);
    end
  );

  this.UpdateUI();
end

function UIStatus.OnClick_AstrolabeUp()
  if not Contains(Role.player.war, EWar.None, EWar.Guest) then
    ShowCenterMessage(string.Get(80099));
    return;
  end
  if astrolabeShowTimer > 0 then return end

  if Astrolabe.starLv[Astrolabe.maxAstrolabe] >= Astrolabe.maxAstrolabeLv then
    ShowCenterMessage(string.Get(71332));
    return;
  end

  local nextStar = Astrolabe.FindNextStar();
  local nextLv = Astrolabe.starLv[nextStar] + 1;
  local needPoint = 0
  if Astrolabe.starLv[nextStar] < Astrolabe.maxAstrolabeLv then
    needPoint = astrolabeDatas[nextStar].attributes[nextLv].needPoint;
  end

  if Astrolabe.natalPoint < needPoint then
    ShowCenterMessage(string.Get(71333));
    return;
  end

  if Role.GetPlayerGold() < nextLv * nextLv * 10000 then
    ShowCenterMessage(string.Get(71334));
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
  
    return;
  end

  --C:078-001 <命盤升級> +等級(1)
  sendBuffer:Clear();
  sendBuffer:WriteByte(nextStar);
  Network.Send(78, 1, sendBuffer);
end

function UIStatus.OpenOutfitStyleInfo(itemId, bagIndex)
  if currentTag ~= EUIStatusTag.OutfitStyle then return end
  local outfitFunction;
  for k, v in pairs(collectStyleDatas) do
    for i = 1, 5 do
      if v.itemId[i] == itemId then
        outfitFunction = function()
          this.SendEquipOutfitStyle(k,i);
        end
        break;
      end
    end
  end
  UI.Open(UIItemInfo, EThings.None, itemId, itemDatas[itemId], string.Get(20165),outfitFunction);
end

function UIStatus.OnClick_ChangeCategory(uiEvent)
  if currentOutfitSyleCategory ~= uiEvent.parameter then
    currentOutfitSyleCategory = uiEvent.parameter;
  else
    currentOutfitSyleCategory = 0;
  end
  this.UpdateUI(true);
end

function UIStatus.OnClick_SwitchOutfitStyle()
  if currentTag == EUIStatusTag.Style then
    currentTag = EUIStatusTag.OutfitStyle;
    ShowCenterMessage(string.Get(23637));
    RedDot.Remove(ERedDot.OutfitStyle);
  else
    currentOutfitSyleCategory = 0;
    currentTag = EUIStatusTag.Style;
    ShowCenterMessage(string.Get(23638));
  end
  this.UpdateUI(true);
end

function UIStatus.SendEquipOutfitStyle(id, index) --收集冊ID, 部位
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end
  
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
  
  
  --C:023-124 <穿顯示時裝外觀>+ 收集冊ID(2) + 部位索引(1)
  sendBuffer:Clear();
  sendBuffer:WriteUInt16(id);
  sendBuffer:WriteByte(index);
  Network.Send(23, 124, sendBuffer);
end

function UIStatus.SendUnEquipOutfitStyle(bagKind, bagIndex, followIndex) --
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end
  
  local index = bagIndex - EItemFitType.Equip_Spec  - Role.maxOutfitStyle
  
  --C:023-125 <脫顯示時裝外觀>+ 部位索引(1)
  sendBuffer:Clear();
  sendBuffer:WriteByte(index);
  Network.Send(23, 125, sendBuffer);
end

function UIStatus.SendEquipOutfitStyleFromBag(id, index, itemId) --時裝id, 部位
  if Role.player.war ~= EWar.None then
    ShowCenterMessage(string.Get(80099));
    return;
  end
  
  outfitStyleIdTempSave = itemId;
  
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
  
  --C:023-126 <從背包直接穿顯示時裝外觀>+ 收集冊ID(2) + 部位索引(1)
  sendBuffer:Clear();
  sendBuffer:WriteUInt16(id);
  sendBuffer:WriteByte(index);
  Network.Send(23, 126, sendBuffer);
end

function UIStatus.StoreOutfitStyleFromBag(data) --穿時裝成功或失敗
  local result = data:ReadByte();
  if result == 1 then
    Item.SetBagItem(EThings.OutfitStyleInCollection, Item.GetBagCount(EThings.OutfitStyleInCollection) + 1,  itemDatas[outfitStyleIdTempSave], true);
    ShowCenterMessage(string.Concat(itemDatas[outfitStyleIdTempSave]:GetName(true), string.Get(50023)));
    outfitStyleIdTempSave = 0;
    RedDot.Add(ERedDot.OutfitStyle);
  end
  
  this.UpdateUI();
end

function UIStatus.CheckOutfitStyleEquiped(itemId)
  local itemSave;
  for i = EItemFitType.OutfitStyle_Head, EItemFitType.OutfitStyle_Boots do
    itemSave = Item.GetBagItem(EThings.Equip, i, 0);
    if itemSave ~= nil and itemDatas[itemSave.Id] ~= nil then
      if itemId == itemSave.Id then
        return true;
      end
    end
  end
  return false;
end

function UIStatus.OnInitialize_BreakthroughScrollContent(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Breakthrough[itemIndex] = {};
    scrollItems_Breakthrough[itemIndex].item = UIItemController.New(scrollItems[itemIndex]:Find("Image_Item"));
    scrollItems_Breakthrough[itemIndex].slider = scrollItems[itemIndex]:Find("Slider_BreakthroughExp"):GetComponent("UISlider");
    scrollItems_Breakthrough[itemIndex].value = scrollItems[itemIndex]:Find("Text_BreakthroughExpValue"):GetComponent("Text");
    scrollItems_Breakthrough[itemIndex].fullValue = scrollItems[itemIndex]:Find("Text_BreakthroughExpFullValue"):GetComponent("Text");
  end
end

function UIStatus.OnItemChange_BreakthroughScrollContent(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local data = Breakthrough.GetBreakthrough(index);
  if data == nil then return false end
  scrollItems_Breakthrough[itemIndex].item:SetItem(data.itemID, data.itemCount);
  scrollItems_Breakthrough[itemIndex].item:SetCheckMark(data.complete);
  local slider = scrollItems_Breakthrough[itemIndex].slider;
  slider.value = data.currentExp;
  slider.maxValue = data.exp;
  scrollItems_Breakthrough[itemIndex].value.text = data.expValueText;
  scrollItems_Breakthrough[itemIndex].fullValue.text = data.expFullValueText;
  return true
end

function UIStatus.RefreshBreakthrough()
  if scrollContent_Breakthrough == nil then return end
  if currentTag ~= EUIStatusTag.Breakthrough then return end
  text_BreakthroughLevel.text = Breakthrough.GetBreakthroughLevelText();
  scrollContent_Breakthrough:Refresh();
end

function UIStatus.OnClick_ResetBreakthrough()
  UISell.Launch(62);
end

function UIStatus.SetBreakthroughRedDot()
  if not UI.IsVisible(UIStatus) then
    RedDot.Add(ERedDot.Breakthrough);
  end
end

function UIStatus.GetCurrentTag()
  return currentTag;
end

function UIStatus.GetRoleNameAndBarValue()
  return currentRole.name, string.Concat(text_FullHp.text, "\n", text_FullSp.text, "\n", text_Exp.text), currentRole == Role.player;
end

function UIStatus.CheckDataGetUpgradeLvIcon(lv)
  if npcUpgradeDatas[lv] ~= nil then
    return npcUpgradeDatas[lv].UpgradeLvIcon;
  else
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
  
    return 0;
  end
end

function UIStatus.OpenProfile()
  if currentTag == EUIStatusTag.Profile then
    UI.Open(UIHouseBoard);
  end
end