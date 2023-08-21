EUIHouseSettingTag = {
  HomePage = 1,
  Furniture = 2,
  NPC = 3,
}

UIHouseSetting = {}
local this = UIHouseSetting;

this.name = "UIHouseSetting";
this.uiController = nil;

--ui
local transform_FrameRect;
local gameObject_HomePage;
local gameObject_Furniture;
local gameObject_NPC;

--HomePage
local text_Name;
local text_Sign;
local scrollContent_House;
local scrollItems_House = {};
local scrollContent_FloorInfo;
local scrollItems_FloorInfo = {};
local slider_Score;
local text_LV;
local text_LVNumber;
local text_Score;

--Furniture
local gameObject_FurnitureInfo;
local rectTransform_scrollContent;
local titleGroup = {};
local titleWidth;
local titleHeight;
local scrollContent_PosX;
local blockHeight = 0;
local spacing = 0;
local text_TotalScore;
local totalScore = 0;
local hasSetData = false;

--NPC
local scrollContent_Block;
local scrollItems_Block = {};
local floorIsOpen = {};

--var
local EEditType = {
  Name = 1,
  Sign = 2,
}
local inputTemp = {};
local initInfo = {};
local tagData = {};
local currentTag = EUIHouseSettingTag.HomePage;
local totalHouseCount = 4;
local totalInfoCount = 2;
local chosenHouse = 1;
local click = -1;
local isOpen = false;
local titleGroupCount = 3;
local animationSpeed = 0.05;
local furnituresData = {};
local hasSendRequest = false;

function UIHouseSetting.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  this.uiController.onVisible = this.OnVisible;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;

  gameObject_HomePage = uiController:FindGameObject("HomePage");
  gameObject_Furniture = uiController:FindGameObject("Furniture");
  gameObject_NPC = uiController:FindGameObject("NPC");

  --HomePage
  scrollContent_House = uiController:FindScrollContent("ScrollContent_House");
  scrollContent_House.onInitialize = this.OnInitialize_ScrollContent_House;
  scrollContent_House.onItemChange = this.OnItemChange_ScrollContent_House;
  scrollContent_House:Initialize(1);

  scrollContent_FloorInfo = uiController:FindScrollContent("ScrollContent_FloorInfo");
  scrollContent_FloorInfo.onInitialize = this.OnInitialize_ScrollContent_FloorInfo;
  scrollContent_FloorInfo.onItemChange = this.OnItemChange_ScrollContent_FloorInfo;
  scrollContent_FloorInfo:Initialize(1);

  slider_Score = uiController:FindSlider("Slider_Score");
  text_LV = uiController:FindText("Text_LV");
  text_LVNumber = uiController:FindText("Text_LVNumber");
  text_Score = uiController:FindText("Text_Score");
  text_Sign = uiController:FindText("Text_Signature");
  text_Name = uiController:FindText("Text_HouseName");

  local tempEvent;
  tempEvent = uiController:FindEvent("Image_ChgName");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_EditName);

  tempEvent = uiController:FindEvent("Image_ChgSignature");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_EditSignature);

  tempEvent = uiController:FindEvent("Image_Info");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_CheckInfo);

  --Furniture
  rectTransform_scrollContent = uiController:FindGameObject("ScrollContent_Furniture"):GetComponent("RectTransform");
  gameObject_FurnitureInfo = uiController:FindGameObject("ScrollContent_Furniture");
  text_TotalScore = uiController:FindText("Text_TotalScore");

  titleWidth = gameObject_FurnitureInfo.transform:Find("ScrollItem").transform:Find("Image_Title"):GetComponent("RectTransform").sizeDelta.x;
  titleHeight = gameObject_FurnitureInfo:GetComponent("RectTransform").sizeDelta.y;

  this.InitializeBlocks();

  --NPC
  scrollContent_Block = uiController:FindScrollContent("ScrollContent_Block");
  scrollContent_Block.onInitialize = this.OnInitialize_ScrollContent_Block;
  scrollContent_Block.onItemChange = this.OnItemChange_ScrollContent_Block;
  scrollContent_Block:Initialize(1);

  tempEvent = uiController:FindEvent("Image_Combination");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Combination);
end

function UIHouseSetting.OnOpen()
  currentTag = EUIHouseSettingTag.HomePage;

  table.Clear(furnituresData);

  furnituresData = FurnitureCollection.GetFurnitureCollectionData();

  this.ResetDataBlock();

  chosenHouse = 1;
  hasSendRequest = false;
  
  return true;
end

function UIHouseSetting.OnClose()
  CGTimer.RemoveListener(this.BlockAnimation);
  CGTimer.RemoveListener(this.CancelBlockAnimation);
  
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
end

function UIHouseSetting.OnVisible(visible)
  if visible then
    table.Clear(tagData);
    tagData[1] = {string.Get(23455), nil};
    tagData[2] = {string.Get(23538), nil};
    tagData[3] = {string.Get(10403), nil};

    UIFrame.Active(transform_FrameRect, string.Get(23455), this.OnClick_Close, this.OnClick_Help, this.OnClick_Tag, tagData, currentTag, nil);

    this.UpdateUI();
  end
end

function UIHouseSetting.OnClick_Tag(tag)
  currentTag = tag;

  this.UpdateUI();
  
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
  
  return true;
end

function UIHouseSetting.OnClick_Help(checkShow)
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
  if checkShow ~= true then
    UI.Open(UITutorialHint, 0, this, string.Get(23455), string.Get(24126));
  end

  return true;
end

function UIHouseSetting.OnClick_Close()
  UI.Close(this);
  hasSetData = false;
end

function UIHouseSetting.OnInitialize_ScrollContent_House(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_House[itemIndex] = {};
    scrollItems_House[itemIndex].item = {};
    scrollItems_House[itemIndex].image = {};
    scrollItems_House[itemIndex].text = {};
    scrollItems_House[itemIndex].event = {};

    for i = 1, totalHouseCount do
      scrollItems_House[itemIndex].text[i] = scrollItems[itemIndex]:Find(string.Concat("Image_House", i)):Find("Text_"):GetComponent("Text");
      scrollItems_House[itemIndex].item[i] = scrollItems[itemIndex]:Find(string.Concat("Image_House", i)).gameObject;
      scrollItems_House[itemIndex].image[i] = scrollItems_House[itemIndex].item[i]:GetComponent("Image");
       scrollItems_House[itemIndex].event[i] = scrollItems_House[itemIndex].item[i]:GetComponent("UIEvent");
      scrollItems_House[itemIndex].event[i]:SetListener(EventTriggerType.PointerClick, this.OnClick_House);
      scrollItems_House[itemIndex].event[i].parameter = i;
    end
  end
end

function UIHouseSetting.OnItemChange_ScrollContent_House(dataIndex, itemIndex)
  for i = 1, totalHouseCount do
    scrollItems_House[itemIndex].text[i].text = string.format(string.Get(23611), i);

    if i == chosenHouse then
      scrollItems_House[itemIndex].image[i].color = Color.White;
      scrollItems_House[itemIndex].text[i]:GetComponent("Outline8").enabled = true;
      scrollItems_House[itemIndex].text[i].color = Color.White;
    else
      scrollItems_House[itemIndex].image[i].color = LuaHelper.GetColor(188, 188, 188, 80);
      scrollItems_House[itemIndex].text[i]:GetComponent("Outline8").enabled = false;
      scrollItems_House[itemIndex].text[i].color = Color.Gray;
    end
  end

  return true;
end

function UIHouseSetting.OnInitialize_ScrollContent_FloorInfo(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_FloorInfo[itemIndex] = {};
    scrollItems_FloorInfo[itemIndex].text_Floor = {};
    scrollItems_FloorInfo[itemIndex].text_House = {};
    scrollItems_FloorInfo[itemIndex].text_Score = {};
    scrollItems_FloorInfo[itemIndex].text_Number = {};

    for i = 1, totalInfoCount do
      scrollItems_FloorInfo[itemIndex].text_House[i] = scrollItems[itemIndex]:Find(string.Concat("Image_F", i)):Find("Image_HF"):Find("Text_House"):GetComponent("Text");
      scrollItems_FloorInfo[itemIndex].text_Score[i] = scrollItems[itemIndex]:Find(string.Concat("Image_F", i)):Find("Text_Score"):GetComponent("Text");
      scrollItems_FloorInfo[itemIndex].text_Number[i] = scrollItems[itemIndex]:Find(string.Concat("Image_F", i)):Find("Text_Number"):GetComponent("Text");
    end
  end
end

function UIHouseSetting.OnItemChange_ScrollContent_FloorInfo(dataIndex, itemIndex)
  for i = 1, totalInfoCount do
    local floorScore = HouseManager.GetFloorScore(chosenHouse, i);
    scrollItems_FloorInfo[itemIndex].text_House[i].text = chosenHouse;
    scrollItems_FloorInfo[itemIndex].text_Score[i].text = floorScore;
    scrollItems_FloorInfo[itemIndex].text_Number[i].text = string.format("%d/%d", WarriorInHouse.GetNpcCount(chosenHouse, i), WarriorInHouse.GetMaxCount(chosenHouse, i));
  end

  return true;
end

function UIHouseSetting.OnInitialize_ScrollContent_Block(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Block[itemIndex] = {};
    scrollItems_Block[itemIndex].image_BG = {};
    scrollItems_Block[itemIndex].image_Lock = {};
    scrollItems_Block[itemIndex].text_Number = {};
    scrollItems_Block[itemIndex].event = {};

    for i = 1, 8 do
      scrollItems_Block[itemIndex].image_BG[i] = scrollItems[itemIndex]:Find(string.Concat("Block (", i, ")")):Find("Image_BG"):GetComponent("Image");
      scrollItems_Block[itemIndex].image_Lock[i] = scrollItems[itemIndex]:Find(string.Concat("Block (", i, ")")):Find("Image_Lock"):GetComponent("Image");
      scrollItems_Block[itemIndex].text_Number[i] = scrollItems[itemIndex]:Find(string.Concat("Block (", i, ")")):Find("Text_Number"):GetComponent("Text");
      scrollItems_Block[itemIndex].event[i] = scrollItems[itemIndex]:Find(string.Concat("Block (", i, ")")):Find("Image_BG"):GetComponent("UIEvent");
      scrollItems_Block[itemIndex].event[i]:SetListener(EventTriggerType.PointerClick, this.OnClick_SetNPC);
      scrollItems_Block[itemIndex].event[i].parameter = i;
    end
  end
end

function UIHouseSetting.OnItemChange_ScrollContent_Block(dataIndex, itemIndex)
  for i = 1, 8 do
    local house, floor = WarriorInHouse.TransformBlockToHouse(i);
    floorIsOpen[i] = HouseManager.FloorIsOpen(house, floor);

    scrollItems_Block[itemIndex].image_Lock[i].enabled = not floorIsOpen[i];
    scrollItems_Block[itemIndex].text_Number[i].enabled = floorIsOpen[i];

    if floorIsOpen[i] then
      scrollItems_Block[itemIndex].image_BG[i].sprite = UI.GetSprite("bod163");
    else
      scrollItems_Block[itemIndex].image_BG[i].sprite = UI.GetSprite("bod162");
    end
    scrollItems_Block[itemIndex].text_Number[i].text = string.format("%d/%d", WarriorInHouse.GetBlockNpcCount(i), WarriorInHouse.GetBlockMaxCount(i));
  end

  return true;
end

function UIHouseSetting.UpdateUI()
  gameObject_HomePage:SetActive(currentTag == EUIHouseSettingTag.HomePage);
  gameObject_Furniture:SetActive(currentTag == EUIHouseSettingTag.Furniture);
  gameObject_NPC:SetActive(currentTag == EUIHouseSettingTag.NPC);

  if currentTag == EUIHouseSettingTag.Furniture and not hasSetData then
    this.SetDataIntoBlock();
  end

  this.UpdateHomePage();
  this.UpdateFurniture();
  this.UpdateSetNPC();
end

function UIHouseSetting.UpdateHomePage()
  if currentTag ~= EUIHouseSettingTag.HomePage then return end
  this.UpdateButtons();
  this.UpdateFloorInfo();
  this.UpdatePictureScore();
  this.UpdateHouseInfo();
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
end

--region HomePage Update
function UIHouseSetting.UpdateButtons()
  scrollContent_House:Refresh();
end

function UIHouseSetting.UpdateFloorInfo()
  scrollContent_FloorInfo:Refresh();
end

function UIHouseSetting.UpdatePictureScore()
  slider_Score.maxValue = FurnitureCollection.GetCollectAttribute(EFurnitureCollectAttribute.LevelScore);
  slider_Score.value = FurnitureCollection.GetCollectAttribute(EFurnitureCollectAttribute.Score);
  text_LV.text = string.Get(22447);
  text_LVNumber.text = FurnitureCollection.GetCollectAttribute(EFurnitureCollectAttribute.LV);
  text_Score.text = string.Concat(FurnitureCollection.GetCollectAttribute(EFurnitureCollectAttribute.Score), "/", FurnitureCollection.GetCollectAttribute(EFurnitureCollectAttribute.LevelScore));
end

function UIHouseSetting.UpdateHouseInfo(result)
  if result == 1 then
    initInfo = inputTemp;
  elseif result == 2 then
    ShowCenterMessage(string.Get(20663));
  end
  inputTemp = {};

  text_Name.text = initInfo.name;
  text_Sign.text = initInfo.sign;
end
--endregion

function UIHouseSetting.UpdateFurniture()
  if currentTag ~= EUIHouseSettingTag.Furniture then return end

  text_TotalScore.text = totalScore;

  if click < 0 then return end

  this.SetBlockPosition(isOpen);
end

function UIHouseSetting.UpdateSetNPC()
  if currentTag ~= EUIHouseSettingTag.NPC then return end
  scrollContent_Block:Reset(1);
end

function UIHouseSetting.SetHouseInfo(name, sign)
  if not string.IsNullOrEmpty(name) then
    initInfo.name = name;
  else
    initInfo.name = Role.player.name;
  end

  if not string.IsNullOrEmpty(sign) then
    initInfo.sign = sign;
  else
    initInfo.sign = string.format(string.Get(23524), Role.player.name);
  end
end

--region OnClick event
function UIHouseSetting.OnClick_House(uiEvent)
  local houseIndex = uiEvent.parameter;
  if houseIndex == chosenHouse then return end

  chosenHouse = houseIndex;

  this.UpdateButtons();
  this.UpdateFloorInfo();
end

function UIHouseSetting.OnClick_EditName()
  ShowHouseInfoInput(string.Get(23540),
    function(text)
      if string.IsNullOrEmpty(text) then return end

      for k, v in pairs(tabooDatas) do
        if string.match(text, string.GetNocase(v)) ~= nil then
          ShowCenterMessage(string.Get(40327));
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
          return;
        end
      end

      this.SendHouseInfo(EEditType.Name, text);
    end,
    8);
end

function UIHouseSetting.OnClick_EditSignature()
  ShowHouseInfoInput(string.Get(23539),
    function(text)
      if string.IsNullOrEmpty(text) then return end

      for k, v in pairs(tabooDatas) do
        if string.match(text, string.GetNocase(v)) ~= nil then
          ShowCenterMessage(string.Get(40327));
          return;
        end
      end

      this.SendHouseInfo(EEditType.Sign, text);
    end,
    12);
end

function UIHouseSetting.OnClick_CheckInfo()
  OpenScoreInfo();
end

function UIHouseSetting.OnClick_Combination()
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
  OpenCombination();
end

function UIHouseSetting.OnClick_SetNPC(uiEvent)
  local block = uiEvent.parameter;

  if floorIsOpen[block] == false then return end

  --協定開UI
  OpenSetNPC(block);
end

function UIHouseSetting.OnClick_Title(uiEvent)
  if this.OtherClickBlockIsPlayingAnimation(uiEvent.parameter) then return end

  click = uiEvent.parameter

  isOpen = not titleGroup[click].isOpen;
  titleGroup[click].isOpen = isOpen;

  this.UpdateFurniture();
end
--endregion

--region Furniture setting
function UIHouseSetting.InitializeBlocks()
  local titleBlock = {};
  this.SetBlock(gameObject_FurnitureInfo, titleBlock, titleGroupCount);

  local topPosition;

  for i = 1, titleGroupCount do
    titleGroup[i] = {};

    --標題區域
    titleGroup[i].root = titleBlock[i].gameObject;
    titleGroup[i].rootRectTransform = titleGroup[i].root:GetComponent("RectTransform");

    if i ~= 1 then
      titleGroup[i].rootRectTransform.anchoredPosition = Vector2.New(topPosition.x, topPosition.y - titleHeight * (i - 1));
    else
      topPosition = titleGroup[i].rootRectTransform.anchoredPosition;
      scrollContent_PosX = topPosition.x;
    end
    titleGroup[i].targetPosition = titleGroup[i].rootRectTransform.anchoredPosition;
    titleGroup[i].spaceY = 0;

    titleGroup[i].text_Title = titleGroup[i].root.transform:Find("Text_Title"):GetComponent("Text");
    titleGroup[i].text_Score = titleGroup[i].root.transform:Find("Text_Score"):GetComponent("Text");
    titleGroup[i].image_OpenClose = titleGroup[i].root.transform:Find("Image_Title").transform:Find("Image_OpenClose"):GetComponent("Image");
    titleGroup[i].image_TitleBG = titleGroup[i].root.transform:Find("Image_Title"):GetComponent("Image");

    --資訊框區域
    titleGroup[i].infoBlocksRoot = titleGroup[i].root.transform:Find("InfoGroup").gameObject;
    titleGroup[i].rectTransform_InfoBlocks = titleGroup[i].infoBlocksRoot:GetComponent("RectTransform");
    titleGroup[i].infoBlocks = {};
    this.SetBlock(titleGroup[i].infoBlocksRoot, titleGroup[i].infoBlocks, FurnitureCollection.GetFurnitureCollectKindMaxCount(i));

    if titleGroup[i].infoBlocksRoot.activeSelf then
      titleGroup[i].rectTransform_InfoBlocks.localScale = Vector3.New(1, 0, 1);
    end

    titleGroup[i].info_TextName = {};
    titleGroup[i].info_TextScore = {};
    titleGroup[i].info_Image = {};
    titleGroup[i].info_transformImage = {};
    titleGroup[i].info_jmpDrawer = {};

    for k,v in pairs(titleGroup[i].infoBlocks) do
      titleGroup[i].info_TextName[k] = v.transform:Find("Text_Name"):GetComponent("Text");
      titleGroup[i].info_TextScore[k] = v.transform:Find("Image_ScoreBG").transform:Find("Text_Score"):GetComponent("Text");
      local BGTemp = v.transform:Find("Image_BG").gameObject;
      titleGroup[i].info_Image[k] = BGTemp.transform:Find("Image_Furniture"):GetComponent("RawImage");
      titleGroup[i].info_transformImage[k] = BGTemp.transform:Find("Image_Furniture"):GetComponent("RectTransform");
      titleGroup[i].info_jmpDrawer[k] = BGTemp.transform:Find("Image_Furniture"):GetComponent(typeof(JmpDrawer));
      titleGroup[i].info_jmpDrawer[k].enabled = false;
      local imageTemp = titleGroup[i].info_Image[k];
      titleGroup[i].info_jmpDrawer[k].luaListener = function()
        titleGroup[i].info_jmpDrawer[k]:Draw(0, 0);
        imageTemp:SetNativeSize();
        UIHouseEditor.SetTextureTransform(titleGroup[i].info_transformImage[k], 60);
      end;
    end

    --var
    titleGroup[i].isOpen = false;
    titleGroup[i].event = titleGroup[i].root.transform:Find("Image_Title"):GetComponent("UIEvent");
    titleGroup[i].minusPlusEvent = titleGroup[i].image_OpenClose:GetComponent("UIEvent");
    titleGroup[i].event.parameter = i;
    titleGroup[i].minusPlusEvent.parameter = i;
    titleGroup[i].event:SetListener(EventTriggerType.PointerClick, this.OnClick_Title);
    titleGroup[i].minusPlusEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Title);
  end

  rectTransform_scrollContent.sizeDelta = Vector2.New(titleWidth, titleHeight * titleGroupCount);

end

function UIHouseSetting.SetBlock(root, blockData, dataCount)
  local block = root.transform:GetChild(0);

  blockData[1] = block;
  for i = 2, dataCount do
    blockData[i] = GameObject.Instantiate(block);
    blockData[i].transform:SetParent(root.transform);
    blockData[i]:GetComponent("RectTransform").localScale = Vector3.one;
    blockData[i]:GetComponent("RectTransform").anchoredPosition = Vector2.zero;
  end

  local height = root:GetComponent("RectTransform").sizeDelta.y;

  if root:GetComponent("GridLayoutGroup") then
    if spacing == 0 then
      spacing = root:GetComponent("GridLayoutGroup").spacing.y;
    end

    if blockHeight == 0 then
      blockHeight = root:GetComponent("GridLayoutGroup").cellSize.y + spacing;
    end
    if dataCount % 2 == 0 then
      height = height * dataCount / 2 + spacing;
    else
      height = height * (dataCount + 1) / 2 + spacing;
    end
  else
    height = height * dataCount;
  end

  root:GetComponent("RectTransform").sizeDelta = Vector2.New(titleWidth, height);

end

function UIHouseSetting.SetBlockPosition(isOpen)
  if animationSpeed == 0 then return end
  local range = 0;
  this.SetBlockGroupTargetPosition();
  this.SetScrollContentSizeDelta();

  if isOpen then
    range = (1 - titleGroup[click].rectTransform_InfoBlocks.localScale.y) / animationSpeed;
    
    if range == 0 then return end

    for i = 1, titleGroupCount do
      titleGroup[i].spaceY = (titleGroup[i].rootRectTransform.anchoredPosition.y - titleGroup[i].targetPosition.y) / range;
    end

    CGTimer.RemoveListener(this.CancelBlockAnimation);
    CGTimer.AddListener(this.BlockAnimation, 0, true);

    titleGroup[click].image_OpenClose.sprite = UI.GetSprite("but253");
    titleGroup[click].image_TitleBG.color = Color.White;
    titleGroup[click].text_Title:GetComponent("Outline8").enabled = true;
    titleGroup[click].text_Title.color = Color.White;
  else
    range = (titleGroup[click].rectTransform_InfoBlocks.localScale.y) / animationSpeed;
    
    if range == 0 then return end

    for i = 1, titleGroupCount do
      titleGroup[i].spaceY = (titleGroup[i].rootRectTransform.anchoredPosition.y - titleGroup[i].targetPosition.y) / range;
    end

    CGTimer.RemoveListener(this.BlockAnimation);
    CGTimer.AddListener(this.CancelBlockAnimation, 0, true);

    titleGroup[click].image_OpenClose.sprite = UI.GetSprite("but252");
    titleGroup[click].image_TitleBG.color = LuaHelper.GetColor(188, 188, 188, 80);
    titleGroup[click].text_Title:GetComponent("Outline8").enabled = false;
    titleGroup[click].text_Title.color = LuaHelper.GetColor(63, 60, 147, 255);
  end
end

function UIHouseSetting.SetBlockGroupTargetPosition()
  local baseY = titleGroup[1].rootRectTransform.anchoredPosition.y;

   for i = 2, titleGroupCount do
    titleGroup[i].targetPosition.y = baseY - titleHeight * (i - 1);
    for j = 1, i - 1 do
      if titleGroup[j].isOpen then
        titleGroup[i].targetPosition.y = titleGroup[i].targetPosition.y - titleGroup[j].rectTransform_InfoBlocks.sizeDelta.y;
      end
    end
  end
end

function UIHouseSetting.SetScrollContentSizeDelta()
  local height = -titleGroup[1].rootRectTransform.anchoredPosition.y;

  for i = 1, titleGroupCount do
    height = height + titleHeight;
    if titleGroup[i].isOpen then
      height = height + titleGroup[i].rectTransform_InfoBlocks.sizeDelta.y;
    end
  end

  rectTransform_scrollContent.sizeDelta = Vector2.New(titleWidth, height);
end

function UIHouseSetting.BlockAnimation()
  titleGroup[click].rectTransform_InfoBlocks.localScale = Vector3.New(1, titleGroup[click].rectTransform_InfoBlocks.localScale.y + animationSpeed, 1);

  for i = 1, titleGroupCount do
    titleGroup[i].rootRectTransform.anchoredPosition = Vector2.New(scrollContent_PosX, titleGroup[i].rootRectTransform.anchoredPosition.y - titleGroup[i].spaceY);
  end

  if 1 - titleGroup[click].rectTransform_InfoBlocks.localScale.y < animationSpeed then
    titleGroup[click].rectTransform_InfoBlocks.localScale = Vector3.New(1, 1, 1);
    for i = 1, titleGroupCount do
      titleGroup[i].rootRectTransform.anchoredPosition = Vector2.New(scrollContent_PosX, titleGroup[i].targetPosition.y);
    end
    CGTimer.RemoveListener(this.BlockAnimation);
  end
end

function UIHouseSetting.CancelBlockAnimation()
  titleGroup[click].rectTransform_InfoBlocks.localScale = Vector3.New(1, titleGroup[click].rectTransform_InfoBlocks.localScale.y - animationSpeed, 1);

  for i = 1, titleGroupCount do
    titleGroup[i].rootRectTransform.anchoredPosition = Vector2.New(scrollContent_PosX, titleGroup[i].rootRectTransform.anchoredPosition.y - titleGroup[i].spaceY);
  end

  if titleGroup[click].rectTransform_InfoBlocks.localScale.y < animationSpeed then
    titleGroup[click].rectTransform_InfoBlocks.localScale = Vector3.New(1, 0, 1);
    for i = 1, titleGroupCount do
      titleGroup[i].rootRectTransform.anchoredPosition = Vector2.New(scrollContent_PosX, titleGroup[i].targetPosition.y);
    end
    CGTimer.RemoveListener(this.CancelBlockAnimation);
  end
end

function UIHouseSetting.OtherClickBlockIsPlayingAnimation(currentClick)
  if click == currentClick then
    return false;
  end
  if CGTimer.ContainsListener(this.BlockAnimation) or CGTimer.ContainsListener(this.CancelBlockAnimation) then
    return true;
  end
end

function UIHouseSetting.ResetDataBlock()
  isOpen = false;

  for i = 1, titleGroupCount do
    titleGroup[i].isOpen = isOpen;
    titleGroup[i].rectTransform_InfoBlocks.localScale = Vector3.New(1, 0, 1);
    titleGroup[i].image_OpenClose.sprite = UI.GetSprite("but252");
    titleGroup[i].image_TitleBG.color = LuaHelper.GetColor(188, 188, 188, 80);
    titleGroup[i].text_Title:GetComponent("Outline8").enabled = false;
    titleGroup[i].text_Title.color = LuaHelper.GetColor(63, 60, 147, 255);
    if i + 1 <= titleGroupCount then
      local height = titleGroup[i].rootRectTransform.anchoredPosition.y - titleHeight;
      titleGroup[i + 1].rootRectTransform.anchoredPosition = Vector2.New(scrollContent_PosX, height);
    end
  end

  this.SetScrollContentSizeDelta();
  rectTransform_scrollContent.anchoredPosition = Vector2.zero;

  click = -1;
end

function UIHouseSetting.SetDataIntoBlock()
  totalScore = 0;

  for i = 1, titleGroupCount do
    local maxDataCount = table.Count(furnituresData[i].furniture);
    local blockTotalScore = 0;
    titleGroup[i].text_Title.text = furnituresData[i].title;

    for k = 1,table.Count(titleGroup[i].infoBlocks) do
      local furnitureKindId = furnituresData[i].furniture[k];
      local furnitureInfo = furnitureDatas[furnitureKindId];
      if k > maxDataCount then
        titleGroup[i].infoBlocks[k].gameObject:SetActive(false);
      else
        titleGroup[i].infoBlocks[k].gameObject:SetActive(true);

        titleGroup[i].info_TextName[k].text = npcDatas[furnitureInfo.Id]:GetName();
        titleGroup[i].info_TextScore[k].text = string.Concat("+", furnitureInfo.decorateScore);
        blockTotalScore = blockTotalScore + furnitureInfo.decorateScore;
        totalScore = totalScore + furnitureInfo.decorateScore;
        titleGroup[i].info_Image[k] = Color.White;
        titleGroup[i].info_jmpDrawer[k]:Disable();
        titleGroup[i].info_jmpDrawer[k]:GenerateAndDraw(npcDatas[furnitureKindId]:GetAtlasParams());
      end
      titleGroup[i].text_Score.text = blockTotalScore;
    end
    this.SetDataGroupSize(titleGroup[i].infoBlocksRoot, maxDataCount, blockHeight);
  end

  hasSetData = true;
end

function UIHouseSetting.SetDataGroupSize(root, dataCount, height)
  if dataCount % 2 == 0 then
    height = height * dataCount / 2 + spacing;
  else
    height = height * (dataCount + 1) / 2 + spacing;
  end

  root:GetComponent("RectTransform").sizeDelta = Vector2.New(titleWidth, height);
end
--endregion

function UIHouseSetting.SendHouseInfo(editType, text)
  local name, sign = "";

  if editType == EEditType.Name then
    name = text;
    sign = text_Sign.text;
  elseif editType == EEditType.Sign then
    name = text_Name.text;
    sign = text;
  end

  --C:106-005 <設定小屋資料> +名稱字串長度(1) +名稱(?) +簽名字串長度(1) +簽名(?)
  sendBuffer:Clear();
  sendBuffer:WriteByte(string.GetLength(name));
  sendBuffer:WriteString(name);
  sendBuffer:WriteByte(string.GetLength(sign));
  sendBuffer:WriteString(sign);
  Network.Send(106, 5, sendBuffer);
  
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

  inputTemp.name = name;
  inputTemp.sign = sign;
end

function UIHouseSetting.SendRequest()
  --C:106-007 <要求小屋分數資料>
  Network.Send(106, 7);
  hasSendRequest = true;
end

function UIHouseSetting.HasSendRequest()
  return hasSendRequest;
end
