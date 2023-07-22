UIHouseSettingFunction = {}
local this = UIHouseSettingFunction;

this.name = "UIHouseSettingFunction";
this.uiController = nil;

--ui
local gameObject_SetNPC;
local gameObject_ScoreInfo;
local gameObject_Combination;
local transform_SetNPC;
local transform_ScoreInfo;
local transform_Combination;

--scoreInfo
local text_LV;
local text_LVNumber;
local slider_Score;
local text_Score;
local scrollContent_Info;
local scrollItems_Info = {};

--combination
local scrollContent_Combination;
local scrollItems_Combination = {};
local combinationData = {};

--setNpc
local scrollContent_Npc;
local scrollItems_Npc = {};
local npcList = {};
local blockUi = {};
local text_NpcNumber;
local text_Attribute;
local isFull = false;
local exchangeNpcsIndex = 0;

--var
local EOpenType = {
  ScoreInfo = 1,
  Combination = 2,
  SetNPC = 3,
}

local currentTag;
local transform_FrameRect;
local frame_Title;
local chosenBlock;
local isChanged = true;

function UIHouseSettingFunction.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;
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

  gameObject_SetNPC = uiController:FindGameObject("SetNPC");
  gameObject_ScoreInfo = uiController:FindGameObject("ScoreInfo");
  gameObject_Combination = uiController:FindGameObject("Combination");

  transform_SetNPC = gameObject_SetNPC:GetComponent("RectTransform");
  transform_ScoreInfo = gameObject_ScoreInfo:GetComponent("RectTransform");
  transform_Combination = gameObject_Combination:GetComponent("RectTransform");

  --scoreInfo
  slider_Score = uiController:FindSlider("Slider_Score");
  text_LV = uiController:FindText("Text_LV");
  text_LVNumber = uiController:FindText("Text_LVNumber");
  text_Score = uiController:FindText("Text_Score");

  scrollContent_Info = uiController:FindScrollContent("ScrollContent_Info");
  scrollContent_Info.onInitialize = this.OnInitialize_ScrollContent_Info;
  scrollContent_Info.onItemChange = this.OnItemChange_ScrollContent_Info;
  scrollContent_Info:Initialize(1);

  --combination
  scrollContent_Combination = uiController:FindScrollContent("ScrollContent_Combination");
  scrollContent_Combination.onInitialize = this.OnInitialize_ScrollContent_Combination;
  scrollContent_Combination.onItemChange = this.OnItemChange_ScrollContent_Combination;
  scrollContent_Combination:Initialize(1);

  --setNpc
  scrollContent_Npc = uiController:FindScrollContent("ScrollContent_Npc");
  scrollContent_Npc.onInitialize = this.OnInitialize_ScrollContent_Npc;
  scrollContent_Npc.onItemChange = this.OnItemChange_ScrollContent_Npc;
  scrollContent_Npc:Initialize(1);

  text_NpcNumber = uiController:FindText("Text_NpcNumber");
  text_Attribute = uiController:FindText("Text_Attribute");

  local gameObjectHouse = uiController:FindGameObject("Image_HouseBG");
  local count = 4;

  blockUi.uiCareer = {};
  blockUi.text_Name = {};
  blockUi.text_LV = {};
  blockUi.text_Hp = {};
  blockUi.text_Take = {};
  blockUi.text_Hint = {};
  blockUi.image_Empty = {};
  blockUi.image_Lock = {};
  blockUi.image_Take = {};
  blockUi.event_Take = {};

  for i = 1, count do
    local root = gameObjectHouse.transform:GetChild(i - 1).transform;
    blockUi.uiCareer[i] = UICareerController.New(root:Find("GameObject_Career"));
    blockUi.text_Name[i] = root:Find("Text_Name"):GetComponent("Text");
    blockUi.text_LV[i] = root:Find("Text_Lv"):GetComponent("Text");
    blockUi.text_Hp[i] = root:Find("Text_Hp"):GetComponent("Text");
    blockUi.text_Hint[i] = root:Find("Text_Hint"):GetComponent("Text");
    blockUi.text_Take[i] = root:Find("Image_Take").transform:Find("Text_"):GetComponent("Text");
    blockUi.image_Empty[i] = root:Find("Image_Empty"):GetComponent("Image");
    blockUi.image_Lock[i] = root:Find("Image_Lock"):GetComponent("Image");
    blockUi.image_Take[i] = root:Find("Image_Take"):GetComponent("Image");
    blockUi.event_Take[i] = root:Find("Image_Take"):GetComponent("UIEvent");
    blockUi.event_Take[i]:SetListener(EventTriggerType.PointerClick, this.OnClick_Take);
   end

  local tempEvent = uiController:FindEvent("Image_Change");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Change);

end

function OpenScoreInfo()
  UI.Open(UIHouseSettingFunction, EOpenType.ScoreInfo);
end

function OpenSetNPC(block)
  WarriorInHouse.GetAllNpc();
  UI.Open(UIHouseSettingFunction, EOpenType.SetNPC, block);
end

function OpenCombination()
  UI.Open(UIHouseSettingFunction, EOpenType.Combination);
end

function UIHouseSettingFunction.OnOpen(type, block)
  gameObject_ScoreInfo:SetActive(type == EOpenType.ScoreInfo);
  gameObject_SetNPC:SetActive(type == EOpenType.SetNPC);
  gameObject_Combination:SetActive(type == EOpenType.Combination);

  if type == EOpenType.ScoreInfo then
    transform_FrameRect = transform_ScoreInfo;
    frame_Title = string.Get(23537);

  elseif type == EOpenType.Combination then
    transform_FrameRect = transform_Combination;
    frame_Title = "";

  elseif type == EOpenType.SetNPC then
    if block == nil then return end
    transform_FrameRect = transform_SetNPC;
    chosenBlock = block;
    this.SetNpcData();
    local house, floor = WarriorInHouse.TransformBlockToHouse(chosenBlock);
    WarriorInHouse.OpenEditor(chosenBlock);

    frame_Title = string.format(string.Get(23528), house, floor);
  end

  currentTag = type;

  return true;
end

function UIHouseSettingFunction.OnVisible(visible)
  if visible then
    UIFrame.Active(transform_FrameRect, frame_Title, this.OnClick_Close, nil);
    this.UpdateUI();
  end
end

function UIHouseSettingFunction.OnClick_Close()
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
  isChanged = false;

  if currentTag == EOpenType.SetNPC then
    WarriorInHouse.CloseEditor(chosenBlock, isChanged);
  end

  UI.Close(UIHouseSettingFunction);
end

function UIHouseSettingFunction.OnInitialize_ScrollContent_Info(scrollItems)
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
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Info[itemIndex] = {};
    scrollItems_Info[itemIndex].image_Title = scrollItems[itemIndex]:Find("Image_Title"):GetComponent("Image");
    scrollItems_Info[itemIndex].text_LV = scrollItems[itemIndex]:Find("Image_Title"):Find("Text_LV"):GetComponent("Text");
    scrollItems_Info[itemIndex].text_Info = scrollItems[itemIndex]:Find("Text_Attribute"):GetComponent("Text");
  end
end

function UIHouseSettingFunction.OnItemChange_ScrollContent_Info(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local data = furnitureCollectLevelDatas[index];

  scrollItems_Info[itemIndex].text_LV.text = string.Concat(string.Get(22447), data.level);
  scrollItems_Info[itemIndex].text_Info.text = data:GetString();

  if index <= FurnitureCollection.GetCollectAttribute(EFurnitureCollectAttribute.LV) then
    scrollItems_Info[itemIndex].image_Title.color = Color.White;
    scrollItems_Info[itemIndex].text_Info.color = Color.Black;
  else
    scrollItems_Info[itemIndex].image_Title.color = LuaHelper.GetColor(0, 0, 0, 25);
    scrollItems_Info[itemIndex].text_Info.color = Color.Gray;
  end

  return true;
end

function UIHouseSettingFunction.OnInitialize_ScrollContent_Combination(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Combination[itemIndex] = {};
    scrollItems_Combination[itemIndex].text_Npc = scrollItems[itemIndex]:Find("Text_NPC"):GetComponent("Text");
    scrollItems_Combination[itemIndex].text_Info = scrollItems[itemIndex]:Find("Text_Attribute"):GetComponent("Text");
  end
end

function UIHouseSettingFunction.OnItemChange_ScrollContent_Combination(dataIndex, itemIndex)
  local index = dataIndex + 1;
  local warriors = combinationData[index].warriors;
  local npcText = "";

  if warriors ~= nil then
      for i = 1, 4 do
        local data = collectWarriorSortDatas[warriors[i]];
        if data ~= nil then
          local npc = npcDatas[data.ids[1]];
          if npc ~= nil then
            if i == 1 then
              npcText = npc.name;
            else
              npcText = string.Concat(npcText, "、", npc.name);
            end
          end
        end
      end

    scrollItems_Combination[itemIndex].text_Npc.text = npcText;
    scrollItems_Combination[itemIndex].text_Info.text = WarriorInHouse.GetCombinationAttribute(combinationData[index].index);
  end

  if index <= WarriorInHouse.totalCombination then
    scrollItems_Combination[itemIndex].text_Info.color = LuaHelper.GetColor(63, 60, 147, 255);
  else
    scrollItems_Combination[itemIndex].text_Info.color = LuaHelper.GetColor(177, 175, 176, 255);
  end

  return true;
end

function UIHouseSettingFunction.OnInitialize_ScrollContent_Npc(scrollItems)
  for itemIndex = 0, scrollItems.Length - 1 do
    scrollItems_Npc[itemIndex] = {};
    scrollItems_Npc[itemIndex].uiCareer = UICareerController.New(scrollItems[itemIndex]:Find("GameObject_Career"));
    scrollItems_Npc[itemIndex].text_Name = scrollItems[itemIndex]:Find("Text_Name"):GetComponent("Text");
    scrollItems_Npc[itemIndex].text_Hp = scrollItems[itemIndex]:Find("Text_Hp"):GetComponent("Text");
    scrollItems_Npc[itemIndex].text_Lv = scrollItems[itemIndex]:Find("Text_Lv"):GetComponent("Text");
    scrollItems_Npc[itemIndex].image_Empty = scrollItems[itemIndex]:Find("Image_Empty"):GetComponent("Image");

    scrollItems_Npc[itemIndex].image_Save = scrollItems[itemIndex]:Find("Image_Save"):GetComponent("Image");
    scrollItems_Npc[itemIndex].text_Save = scrollItems[itemIndex]:Find("Image_Save").transform:Find("Text_"):GetComponent("Text");

    scrollItems_Npc[itemIndex].event_Save = scrollItems[itemIndex]:Find("Image_Save"):GetComponent("UIEvent");
    scrollItems_Npc[itemIndex].event_Save:SetListener(EventTriggerType.PointerClick, this.OnClick_Save);

  end
end

function UIHouseSettingFunction.OnItemChange_ScrollContent_Npc(dataIndex, itemIndex)
  local npcId = npcList[dataIndex + 1];

  if npcId ~= nil then
    local npcData = WarriorInHouse.GetNpcData(npcId);

    scrollItems_Npc[itemIndex].uiCareer:SetCareer(npcData.turn, npcData.element, ECareer.None, true);
    scrollItems_Npc[itemIndex].text_Name.text = npcData.name;
    scrollItems_Npc[itemIndex].text_Hp.text = npcData.hp;
    scrollItems_Npc[itemIndex].text_Lv.text = npcData.level;
    scrollItems_Npc[itemIndex].image_Empty.enabled = false;
    scrollItems_Npc[itemIndex].image_Save.gameObject:SetActive(true);
    scrollItems_Npc[itemIndex].event_Save.parameter = dataIndex + 1;

    if isFull then
      if dataIndex + 1 == exchangeNpcsIndex then
        scrollItems_Npc[itemIndex].image_Save.sprite = UI.GetSprite("but167D");
      else
        scrollItems_Npc[itemIndex].image_Save.sprite = UI.GetSprite("but064D");
      end

      scrollItems_Npc[itemIndex].text_Save.text = string.Get(21669);
    else
      scrollItems_Npc[itemIndex].image_Save.sprite = UI.GetSprite("but064D");
      scrollItems_Npc[itemIndex].text_Save.text = string.Get(30023);
    end

  else
    scrollItems_Npc[itemIndex].uiCareer:SetCareer();
    scrollItems_Npc[itemIndex].text_Name.text = "";
    scrollItems_Npc[itemIndex].text_Hp.text = "";
    scrollItems_Npc[itemIndex].text_Lv.text = "";
    scrollItems_Npc[itemIndex].image_Empty.enabled = true;
    scrollItems_Npc[itemIndex].image_Save.gameObject:SetActive(false);
    scrollItems_Npc[itemIndex].event_Save.parameter = nil;
  end

  return true;
end

function UIHouseSettingFunction.UpdateUI()
  this.UpdateScoreInfo();
  this.UpdateCombination();
  this.UpdateSetNpc(true);
  
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

function UIHouseSettingFunction.UpdateScoreInfo()
  if currentTag ~= EOpenType.ScoreInfo then return end

  slider_Score.maxValue = FurnitureCollection.GetCollectAttribute(EFurnitureCollectAttribute.LevelScore);
  slider_Score.value = FurnitureCollection.GetCollectAttribute(EFurnitureCollectAttribute.Score);
  text_LV.text = string.Get(22447);
  text_LVNumber.text = FurnitureCollection.GetCollectAttribute(EFurnitureCollectAttribute.LV);
  text_Score.text = string.Concat(FurnitureCollection.GetCollectAttribute(EFurnitureCollectAttribute.Score), "/", FurnitureCollection.GetCollectAttribute(EFurnitureCollectAttribute.LevelScore));

  scrollContent_Info:Reset(table.Count(furnitureCollectLevelDatas));
end

function UIHouseSettingFunction.UpdateCombination()
  if currentTag ~= EOpenType.Combination then return end

  table.Clear(combinationData);
  combinationData = WarriorInHouse.GetSortedCombination();
  scrollContent_Combination:Reset(table.Count(combinationData));
end

function UIHouseSettingFunction.UpdateSetNpc(reset)
  if currentTag ~= EOpenType.SetNPC then return end

  local count = table.Count(npcList);
  if count == 0 then
    count = 1;
  end

  isFull = WarriorInHouse.GetBlockNpcCount(chosenBlock) == WarriorInHouse.GetBlockMaxCount(chosenBlock) and WarriorInHouse.GetBlockMaxCount(chosenBlock) ~= 0;

  this.SortNpcList();

  if reset then
    scrollContent_Npc:Reset(count);
  else
    scrollContent_Npc:Refresh(count);
  end

  count = table.Count(blockUi.uiCareer);
  for i = 1, count do
    local npcId = WarriorInHouse.GetHouseNpcId(chosenBlock, i);
    local npcData;

    if npcId ~= nil and npcId ~= 0 then
      npcData = WarriorInHouse.GetNpcData(npcId);
    end

    if npcData ~= nil then
      blockUi.uiCareer[i]:SetCareer(npcData.turn, npcData.element, ECareer.None, true);
      blockUi.text_Name[i].text = npcData.name;
      blockUi.text_LV[i].text = npcData.level;
      blockUi.text_Hp[i].text = npcData.hp;
      blockUi.text_Hint[i].text = "";
      blockUi.image_Empty[i].enabled = false;
      blockUi.image_Lock[i].enabled = false;
      blockUi.image_Take[i].gameObject:SetActive(true);
      blockUi.event_Take[i].parameter = i;

      if exchangeNpcsIndex ~= 0 then
        blockUi.text_Take[i].text = string.Get(21669);
      else
        blockUi.text_Take[i].text = string.Get(30022);
      end
    else
      if i <= WarriorInHouse.GetBlockMaxCount(chosenBlock) then
        blockUi.image_Lock[i].enabled = false;
        blockUi.text_Hint[i].text = "";
      else
        blockUi.image_Lock[i].enabled = true;
        blockUi.text_Hint[i].text = string.format(string.Get(23589), numberOfHouseWarriorDatas[i].score, "\n");
      end

      blockUi.uiCareer[i]:SetCareer();
      blockUi.text_Name[i].text = "";
      blockUi.text_LV[i].text = "";
      blockUi.text_Hp[i].text = "";
      blockUi.image_Take[i].gameObject:SetActive(false);
      blockUi.image_Empty[i].enabled = true;
    end
  end

  text_NpcNumber.text = string.Concat(WarriorInHouse.GetBlockNpcCount(chosenBlock), "/", WarriorInHouse.GetBlockMaxCount(chosenBlock));
  text_Attribute.text = WarriorInHouse.GetFloorCombinationAttribute(chosenBlock);
end

function UIHouseSettingFunction.OnClick_Save(uiEvent)
  local index = uiEvent.parameter;
  if WarriorInHouse.GetBlockMaxCount(chosenBlock) == 0 then return end

  if isFull then
    if exchangeNpcsIndex == index then
      exchangeNpcsIndex = 0;
    else
      exchangeNpcsIndex = index;
    end
  else
    --存入
    WarriorInHouse.SetNpcInBlock(chosenBlock, npcList[index]);
    table.remove(npcList, index);
  end

  this.UpdateSetNpc();
  
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

function UIHouseSettingFunction.OnClick_Take(uiEvent)
  local index = uiEvent.parameter;

  if exchangeNpcsIndex ~= 0 then
    local npcTemp = npcList[exchangeNpcsIndex];

    table.remove(npcList, exchangeNpcsIndex);
    table.insert(npcList, WarriorInHouse.GetHouseNpcId(chosenBlock, index));

    WarriorInHouse.ExchangeNpc(chosenBlock, npcTemp, index);

    exchangeNpcsIndex = 0;
  else
    --領出
    table.insert(npcList, WarriorInHouse.GetHouseNpcId(chosenBlock, index));
    WarriorInHouse.RemoveNpcFromBlock(chosenBlock, index);
  end

  this.UpdateSetNpc();
end

function UIHouseSettingFunction.OnClick_Change()
  isChanged = true;
  WarriorInHouse.CloseEditor(chosenBlock, isChanged);
end

function UIHouseSettingFunction.SetNpcData()
  table.Clear(npcList);
  local houseNpcId = WarriorInHouse.GetAllNpcInHouse();

  for k, v in pairs(WarriorInHouse.allNpc) do
    local npcId = k;
    local isInHouse = false;

    for i = 1, table.Count(houseNpcId) do
      if houseNpcId[i] == npcId then
        isInHouse = true;
        break;
      end
    end

    if isInHouse == false then
      table.insert(npcList, npcId);
    end
  end

  exchangeNpcsIndex = 0;
end

function UIHouseSettingFunction.SortNpcList()
  if table.Count(npcList) == 0 then return end

  --幾轉>>等級>>ID
  table.sort(npcList,
    function(a, b)
      if npcDatas[a].turn == npcDatas[b].turn then
        if WarriorInHouse.allNpc[a].level == WarriorInHouse.allNpc[b].level then
          return a < b;
        end
          return WarriorInHouse.allNpc[a].level > WarriorInHouse.allNpc[b].level;
      end
        return npcDatas[a].turn > npcDatas[b].turn;
    end
  );
end
