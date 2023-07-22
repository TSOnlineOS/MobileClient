UIRequiem = {}
local this = UIRequiem;
this.name = "UIRequiem";

local uiController;
local transform_FrameRect;
local gameObject_RedDot;
local scrollContent_RequiemBoss;
local scrollItems_RequiemBoss = {};
local text_SoulPoints;
local text_SacrificePoints;
local event_Sacrifice;
local event_GodSkin;

local fightButtonPos;
local buttonCenter;
local boss = {};
local fightRedDot = {};
local emptyText = {};
local bgImage = {};

local bossSilhouette = {}

--region UI
function UIRequiem.Initialize(go)
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
  uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  this.uiController.onVisible = this.OnVisible;
  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;

  gameObject_RedDot = uiController:FindGameObject("Image_RedDot");

  text_SoulPoints = uiController:FindText("Text_SoulPointsCount");
  text_SacrificePoints = uiController:FindText("Text_SacrificePoints");

  local fightButton = uiController:FindGameObject("Image_FightBoss");
  fightButtonPos = fightButton.transform.localPosition;
  buttonCenter = Vector3.New(0, fightButtonPos.y, fightButtonPos.z);

  scrollContent_RequiemBoss = uiController:FindScrollContent("ScrollContent_RequiemBoss");
  scrollContent_RequiemBoss.onInitialize = this.OnInitialize_ScrollContentRequiemBoss;
  scrollContent_RequiemBoss.onItemChange = this.OnItemChange_ScrollContentRequiemBoss;
  scrollContent_RequiemBoss:Initialize(1);

  event_Sacrifice = uiController:FindEvent("Image_Sacrifice");
  event_Sacrifice:SetListener(EventTriggerType.PointerClick, this.OnClick_Sacrifice);
  event_GodSkin = uiController:FindEvent("Image_GodSkin");
  event_GodSkin:SetListener(EventTriggerType.PointerClick, this.OnClick_GodSkin);

  emptyText[ERequiemBossKind.Normal] = string.Get(23771);
  emptyText[ERequiemBossKind.Sacrifice] = string.Concat(string.Get(23772), "\n", string.Get(23771));
  bgImage[ERequiemBossKind.Normal] = "common0_com075";
  bgImage[ERequiemBossKind.Sacrifice] = "common0_com141";
end

function UIRequiem.OnOpen()
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
  return Requiem.TryOpen(ERequiemFunctionKind.Requiem)
end

function UIRequiem.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, string.Get(23765), this.OnClose, this.OnClick_Help);
  end
  this.UpdateUI();
end

function UIRequiem.UpdateUI()
  boss = Requiem.GetBoss();
  scrollContent_RequiemBoss:Reset(5);
  this.UpdateBossInfo();
  Requiem.SetUIFlag(false);
  Requiem.UpdateSacrificePoints();
  UIRequiem.UpdateSoulPoints(Requiem.GetSoulPoint());
  Requiem.UpdateRedDot();
end

function UIRequiem.OnClick_Help(checkShow)
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
  if checkShow ~= true then
    UI.Open(UITutorialHint, 67, this);
  end
  return true
end

function UIRequiem.OnClose()
  UI.Close(this);
  return true;
end

function UIRequiem.OnInitialize_ScrollContentRequiemBoss(scrollItems)
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
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_RequiemBoss[itemIndex] = {};
    local scrollItem = scrollItems_RequiemBoss[itemIndex];
    scrollItem.boss = scrollItems[itemIndex]:Find("Boss");
    scrollItem.empty = scrollItems[itemIndex]:Find("EmptySlot");
    scrollItem.emptyText = scrollItem.empty:Find("Text_Empty"):GetComponent("Text");
    scrollItem.bgImage = scrollItems[itemIndex]:Find("RawImage_NpcBG"):GetComponent("RawImage");

    scrollItem.bossDrawer = scrollItems[itemIndex]:Find("RawImage_Role").gameObject:AddComponent(typeof(JmpDrawer));
    scrollItem.bossImage = scrollItems[itemIndex]:Find("RawImage_Role"):GetComponent("RawImage");

    scrollItem.career = UICareerController.New(scrollItem.boss:Find("GameObject_Career"));
    scrollItem.career.rectTransform.sizeDelta = Vector2.New(50, 50);
    scrollItem.bossName = scrollItem.boss:Find("Text_BossName"):GetComponent("Text");
    scrollItem.level = scrollItem.boss:Find("Text_Level"):GetComponent("Text");

    local loot = scrollItem.boss:Find("Loot");
    scrollItem.lootStar = loot:Find("LootStar");
    scrollItem.lootRange = loot:Find("LootRange");
    scrollItem.lootStarText = scrollItem.lootStar:Find("Text_StarCount"):GetComponent("Text");
    scrollItem.minStarText = scrollItem.lootRange:Find("MinLoot"):Find("Text_StarCount"):GetComponent("Text");
    scrollItem.maxStarText = scrollItem.lootRange:Find("MaxLoot"):Find("Text_StarCount"):GetComponent("Text");

    scrollItem.refreshButton = scrollItem.boss:Find("Image_NewBoss");
    scrollItem.refreshBossEvent = scrollItem.refreshButton:GetComponent("UIEvent");
    scrollItem.refreshBossEvent:SetListener(EventTriggerType.PointerClick, this.Onclick_RefreshBoss);

    scrollItem.fightBossButton = scrollItem.boss:Find("Image_FightBoss");
    scrollItem.fightBossEvent = scrollItem.fightBossButton:GetComponent("UIEvent");
    scrollItem.fightBossEvent:SetListener(EventTriggerType.PointerClick, this.Onclick_FightBoss);
    scrollItem.fightRedDot = scrollItem.fightBossButton:Find("Image_FightRedDot");
  end
end

function UIRequiem.OnItemChange_ScrollContentRequiemBoss(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local scrollItem = scrollItems_RequiemBoss[itemIndex];
  local data = boss[index];
  local isEmpty = data == nil;
  scrollItem.boss.gameObject:SetActive(not isEmpty);
  scrollItem.empty.gameObject:SetActive(isEmpty);

  if isEmpty then
    if bossSilhouette[index] == nil then
      bossSilhouette[index] = Requiem.RandomBoss();
    end
    data = bossSilhouette[index];
  else
    bossSilhouette[index] = nil;
  end
  this.ShowBoss(scrollItem, data, isEmpty);

  local kind = Requiem.GetSlotKind(index);
  TextureManager.SetPng(ETextureUseType.UI, bgImage[kind], scrollItem.bgImage);

  if isEmpty then
    scrollItem.emptyText.text = emptyText[kind];
    return true
  end

  scrollItem.bossName.text = data.npc:GetName();
  scrollItem.level.text = string.format(string.Get(80488), data.npc.level);
  scrollItem.career:SetCareer(data.npc.turn, data.npc.element, data.npc.career, true);
  this.SetLoot(scrollItem, data.lootStar[1], data.lootStar[2]);

  if data.kind == ERequiemBossKind.Sacrifice then
    scrollItem.refreshButton.gameObject:SetActive(false);
    scrollItem.fightBossButton.localPosition = buttonCenter;
  else
    scrollItem.refreshButton.gameObject:SetActive(true);
    scrollItem.fightBossButton.localPosition = fightButtonPos;
  end

  scrollItem.fightRedDot.gameObject:SetActive(fightRedDot[data.kind]);

  scrollItem.refreshBossEvent.parameter = index;
  scrollItem.fightBossEvent.parameter = index;
  return true
end

function UIRequiem.OnClick_GodSkin()
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
  
  UI.Open(UITutorialHint, 63, this);
end
--endregion

--region Function
function UIRequiem.OnClick_Sacrifice()
  UI.Open(UIExpSlotMachine, ESlotMachineKind.Sacrifice);
end

function UIRequiem.Onclick_RefreshBoss(uiEvent)
  ShowCheckMessage(
          function(result)
            if result then
              Requiem.RefreshBoss(uiEvent.parameter);
            end
          end, string.Get(23770)
  );
end

function UIRequiem.Onclick_FightBoss(uiEvent)
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
  Requiem.FightBoss(uiEvent.parameter);
end
--endregion

--region Update
function UIRequiem.UpdateBossInfo()
  if not UI.IsVisible(UIRequiem) then
    return
  end
  boss = Requiem.GetBoss();
  fightRedDot[ERequiemBossKind.Normal] = Requiem.GetEmptySlot(ERequiemBossKind.Normal) == nil;
  fightRedDot[ERequiemBossKind.Sacrifice] = Requiem.GetEmptySlot(ERequiemBossKind.Sacrifice) == nil;
  scrollContent_RequiemBoss:Refresh();
end

function UIRequiem.UpdateSoulPoints(points)
  if points == nil then
    points = 0;
  end
  points = math.clamp(points, 0, 3000);
  text_SoulPoints.text = string.Concat(points, " / ", 3000);
end

function UIRequiem.UpdateSacrificePoints(points)
  text_SacrificePoints.text = string.format(string.Get(23776), points);
end

function UIRequiem.UpdateRedDot(state)
  gameObject_RedDot:SetActive(state);
end
--endregion

function UIRequiem.SetLoot(scrollItem, min, max)
  if scrollItem == nil or min == nil or max == nil then
    return
  end
  scrollItem.lootStar.gameObject:SetActive(min == max);
  scrollItem.lootRange.gameObject:SetActive(min ~= max);
  if min == max then
    scrollItem.lootStarText.text = min;
  else
    scrollItem.minStarText.text = min;
    scrollItem.maxStarText.text = max;
  end
end

function UIRequiem.ShowBoss(scrollItem, bossData, silhouette)
  local yPos = 0;
  if silhouette then
    LuaHelper.SetColor(scrollItem.bossImage, Color.Black);
    scrollItem.bossImage.transform.localScale = Vector3.one * 1.5;
    yPos = -50;
  else
    LuaHelper.SetColor(scrollItem.bossImage, Color.White);
    scrollItem.bossImage.transform.localScale = Vector3.one * 1.2;
  end
  local _, offsetY = bossData.npc:GetOffset();
  scrollItem.bossDrawer:GenerateAndDraw(bossData.npc:GetAtlasParams(ERolePose.Prepare + 1));
  scrollItem.bossDrawer.offsetY = yPos + offsetY;
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