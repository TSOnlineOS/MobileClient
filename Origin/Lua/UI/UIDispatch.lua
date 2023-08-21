UIDispatch = {};
local this = UIDispatch;

this.name = "UIDispatch";
this.uiController = nil;

local transform_FrameRect;

local gameObject_SelectNpc;
local gameObject_AwardRoot;

local text_Title;
local text_Content;
local text_Start;
local text_StartCount
local text_Moral;
local text_Time;
local text_SetNpc;
local text_Award;
local text_Exp;
local text_FullExp;

local image_SetNpc;
local image_SelectNpc;
local image_ChangeNpc;
local image_Start;
local image_RoleState;
local image_Golden;
local image_TimeBG;

local rawImage_SelectNpcBG;
local rawImage_RoleGB;

local slider_Exp;

local jmpDrawer_Npc;

local slider_Tag = {};
local UpdateSliderFunction = {}
local image_Award = {};
local effectComponent = {};
local npcEffectComponent = {};

--Role
local uiCareer;
local text_Name;
local text_Lv;
local jmpDrawer_Role;

--variable
local currentSliderIndex; 
local currentDispatchKind;
local currentInnNpcIndex;
local selectNpcIndex;
local updateProcessData;
local updateSilderProcessData;

function UIDispatch.Initialize(go)
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
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  this.uiController.onVisible = this.OnVisible;

  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;
  
  gameObject_SelectNpc = uiController:FindGameObject("GameObject_SelectNpc");
  gameObject_AwardRoot = uiController:FindGameObject("GameObject_AwardRoot");

  text_Title = uiController:FindText("Text_T8_Title"); 
  text_Content = uiController:FindText("Text_T8_Content");
  text_Start = uiController:FindText("Text_T15_Start");
  text_StartCount = uiController:FindText("Text_T6_StartCount");
  text_Moral = uiController:FindText("Text_Moral");
  text_Time = uiController:FindText("Text_Time");
  text_SetNpc = uiController:FindText("Text_T15_SetNpc");
  text_Award = uiController:FindText("Text_Award");
  text_Exp = uiController:FindText("Text_T5_ExpValue");
  text_FullExp = uiController:FindText("Text_T5_ExpFullValue");

  image_TimeBG = uiController:FindImage("Image_TimeBG");
  image_SetNpc =  uiController:FindImage("Image_SetNpc");
  image_SelectNpc = uiController:FindImage("Image_SelectNpc");
  image_ChangeNpc = uiController:FindImage("Image_ChangeNpc");
  image_Start = uiController:FindImage("Image_Start");
  image_RoleState = uiController:FindImage("Image_RoleState");  
  image_Golden = uiController:FindImage("Image_Golden");

  rawImage_SelectNpcBG = uiController:FindRawImage("RawImage_SelectNpcBG");
  rawImage_RoleGB = uiController:FindRawImage("RawImage_RoleGB");

  slider_Exp = uiController:FindSlider("Slider_Exp");

  jmpDrawer_Npc = uiController:FindRawImage("RawImage_CurrentSelectNpc").gameObject:AddComponent(typeof(JmpDrawer));

  --Role
  uiCareer = UICareerController.New(uiController:FindGameObject("GameObject_Career"));
  text_Name = uiController:FindText("Text_T6_Name");
  text_Lv = uiController:FindText("Text_T14_LvValue");
  jmpDrawer_Role = uiController:FindRawImage("RawImage_Role").gameObject:AddComponent(typeof(JmpDrawer));

  local tempEvent;
  tempEvent = uiController:FindEvent("Image_SelectNpc");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_SelectNpc);

  tempEvent = uiController:FindEvent("RawImage_CurrentSelectNpc");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_CurrentSelectNpc);

  tempEvent = uiController:FindEvent("Image_ChangeNpc");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_CurrentSelectNpc);

  tempEvent = uiController:FindEvent("Image_Start");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Start);

  tempEvent = uiController:FindEvent("Image_SelectNpcMask");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_SelectNpcMask);

  tempEvent = uiController:FindEvent("Image_SetNpc");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_SetNpc);

  tempEvent = uiController:FindEvent("Image_Prev");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Prev);

  tempEvent = uiController:FindEvent("Image_Next");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Next);

  for i = 1, Dispatch.MaxSilderCount do
    slider_Tag[i] = {};
    slider_Tag[i].silderRoot = uiController:FindSlider("Slider_"..i);
    slider_Tag[i].silder = slider_Tag[i].silderRoot.transform:Find("GameObject_Slider");
    slider_Tag[i].lock = slider_Tag[i].silder.transform:Find("Image_Lock");
    slider_Tag[i].horse = slider_Tag[i].silderRoot.transform:Find("GameObject_Horse");
    slider_Tag[i].horseTime = slider_Tag[i].horse.transform:Find("Text_HorseTime"):GetComponent("Text");
    slider_Tag[i].horseText = slider_Tag[i].horse.transform:Find("Text_HorseText"):GetComponent("Text");

    tempEvent = slider_Tag[i].silderRoot.transform:Find("Image_Background"):GetComponent("UIEvent");
    tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Slider);
    tempEvent.parameter = i;
  end

  for i = 1, Dispatch.ConditionCount do
    effectComponent[i] = {};
    effectComponent[i].text_Effect = uiController:FindText(string.Concat("Text_Effect (", i, ")"));
    effectComponent[i].text_EffectMoral = uiController:FindText(string.Concat("Text_EffectMoral (", i, ")"));
    effectComponent[i].career_Effect = UICareerController.New(uiController:FindGameObject(string.Concat("GameObject_Effect (", i, ")")));

    npcEffectComponent[i] = {};
    npcEffectComponent[i].text_Effect = uiController:FindText(string.Concat("Text_NpcEffect (", i, ")"));
    npcEffectComponent[i].text_EffectMoral = uiController:FindText(string.Concat("Text_NpcEffectMoral (", i, ")"));
    npcEffectComponent[i].career_Effect = UICareerController.New(uiController:FindGameObject(string.Concat("GameObject_NpcEffect (", i, ")")));
  end

  for i = 1, CommonAwardData.AwardCount do
    image_Award[i] = {};
    image_Award[i].image = gameObject_AwardRoot.transform:Find( string.Concat("Image_Award (", i, ")") ):GetComponent("Image");
    image_Award[i].item = UIItemController.New(image_Award[i].image.transform);
    image_Award[i].name = image_Award[i].image.transform:Find("Text_4"):GetComponent("Text");
    if i == 1 then
      image_Award[i].value = image_Award[i].image.transform:Find("Text_Value"):GetComponent("Text");
    else
      image_Award[i].value = nil;
    end
  end
end

function UIDispatch.OnOpen(kind)
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
  
  --開介面時先去要一次Sever時間校正
  Network.Send(1, 16);

  Dispatch.AddSliderListener();

  return true;
end

function UIDispatch.OnClose()
  if gameObject_SelectNpc.activeSelf then jmpDrawer_Role:Disable() end
  if jmpDrawer_Npc.gameObject.activeSelf then jmpDrawer_Npc:Disable() end

  return true;
end

function UIDispatch.OnVisible(visible)
  if visible then
    TextureManager.SetPng(ETextureUseType.UI, "common0_com040", rawImage_SelectNpcBG);
    TextureManager.SetPng(ETextureUseType.UI, "common0_com040", rawImage_RoleGB);
    currentInnNpcIndex = 1;
    selectNpcIndex = nil;
    gameObject_SelectNpc:SetActive(false);
    currentDispatchKind = this.GetDefultDispatchKind();
    UIFrame.Active(transform_FrameRect, string.Get(20517), this.OnClick_Close, this.OnClick_Help, this.OnClick_Tag, nil);
    this.UpdateUI();
  end
end

function UIDispatch.GetDefultDispatchKind()
  local kind = nil;

  --找可以領獎的進度調
  local complete = Dispatch.GetCompleteDispatch();
  if complete ~= nil then
    kind = complete.kind;

    currentSliderIndex = complete.index;
  end

  if kind == nil then
    local data = Dispatch.GetProcessDataByIndex(1);   
    if data ~= nil then
    --顯示第一進度調派遣的種類
      kind = data.kind;
    else
    --都沒有派遣，顯示Sever給派遣的種類
      kind = Dispatch.GetDispatchSaveKind();
    end

    currentSliderIndex = 1;
  end

  return kind;
end

function UIDispatch.OnClick_Close()
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
  UI.Close(this);
  this.RemoveSliderListener();
  return true;
end

function UIDispatch.OnClick_Help(checkShow)
  if checkShow ~= true then
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
    UI.Open(UITutorialHint, 26, this);
  end

  return true;
end

function UIDispatch.UpdateRedot(mainPageIndex, subPageIndex)
  local data = Dispatch.GetProcessData(mainPageIndex);

  if data ~= nil then
    return CGTimer.serverTime:CompareTo(data.endTime) >= 0;
  end

  return false;
end

function UIDispatch.AddSliderListener() 
  local haveData;
  for i = 1, Dispatch.MaxSilderCount do
    haveData = Dispatch.IsHaveProcessData(i);
    if haveData then
      CGTimer.AddListener(UpdateSliderFunction[i], Dispatch.ListenerTrick, true);
    end 
    slider_Tag[i].silder.gameObject:SetActive(not haveData);
    slider_Tag[i].horse.gameObject:SetActive(haveData);
  end
end

function UIDispatch.RemoveSliderListener()
  for i = 1, Dispatch.MaxSilderCount do
    CGTimer.RemoveListener(UpdateSliderFunction[i]);
  end
end

UpdateSliderFunction[1] = function ()
  UIDispatch.UpdateSilder(1, slider_Tag[1].silderRoot, slider_Tag[1].horseTime, slider_Tag[1].horseText, UpdateSliderFunction[1]);
  UIDispatch.UpdateCurrentShowTime();
end

UpdateSliderFunction[2] = function ()
  UIDispatch.UpdateSilder(2, slider_Tag[2].silderRoot, slider_Tag[2].horseTime, slider_Tag[2].horseText, UpdateSliderFunction[2]);
  UIDispatch.UpdateCurrentShowTime();
end

UpdateSliderFunction[3] = function ()
  UIDispatch.UpdateSilder(3, slider_Tag[3].silderRoot, slider_Tag[3].horseTime, slider_Tag[3].horseText, UpdateSliderFunction[3]);
  UIDispatch.UpdateCurrentShowTime();
end

UpdateSliderFunction[4] = function ()
  UIDispatch.UpdateSilder(4, slider_Tag[4].silderRoot, slider_Tag[4].horseTime, slider_Tag[4].horseText, UpdateSliderFunction[4]);
  UIDispatch.UpdateCurrentShowTime();
end

function UIDispatch.UpdateSilder(index, silder, showTextTime, textHorse, functionName)
  local processValue = Dispatch.GetProcessValue(index);
  local showValue = 1 - processValue;

  silder.value = 0;

  if showValue >= 0 then
    silder.value = showValue;
  end

  updateSilderProcessData = Dispatch.GetProcessDataByIndex(index);
  if updateSilderProcessData ~= nil then
    if CGTimer.serverTime:CompareTo(updateSilderProcessData.endTime) >= 0 then
      showTextTime.text = "00:00:00";
      textHorse.text = string.Get(21136);
    else
      showTextTime.text = string.GetSecondSymbol(math.ceil((updateSilderProcessData.endTime - CGTimer.serverTime).TotalSeconds), true); 
      textHorse.text = string.Get(20547);
    end
  else
    showTextTime.text = "";
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

  if processValue >= 1 then
    CGTimer.RemoveListener(functionName);
    this.UpdateUI();
  end
end

function UIDispatch.UpdateCurrentShowTime()
  updateProcessData = Dispatch.GetProcessData(currentDispatchKind);
  if updateProcessData ~= nil and text_Time ~= nil then
    if CGTimer.serverTime:CompareTo(updateProcessData.endTime) >= 0 then
      text_Time.text = string.Get(21136);
    else
      text_Time.text = string.Concat(string.Get(20644), " : ", string.GetSecondText(math.ceil((updateProcessData.endTime - CGTimer.serverTime).TotalSeconds), true)); 
    end
  else
    text_Time.text = "";
  end
end

function UIDispatch.UpdateDispatchSucess()
  selectNpcIndex = nil;
  this.UpdateUI();
end

function UIDispatch.UpdateUI()
  local processData = Dispatch.GetProcessData(currentDispatchKind);
  local isDispatch = (selectNpcIndex ~= nil or processData ~= nil);

  --派遣項目內容
  text_Title.text = Dispatch.GetName(currentDispatchKind);
  text_Content.text = Dispatch.GetContent(currentDispatchKind);
  text_StartCount.text = string.format( string.Get(21191), RoleCount.Get(ERoleCount.Dispatch), RoleCount.Max(ERoleCount.Dispatch) );
  for i = 1, Dispatch.MaxSilderCount do
    slider_Tag[i].lock.gameObject:SetActive(Dispatch.GetBarCount() < i);
  end
  
  --設定客棧 Npc資料
  Dispatch.SetShowNpcData();
  --設定物件開關
  this.UpdateShowObject(isDispatch, processData);
  --設定顯示獎勵
  this.UpdateShowAward(isDispatch, processData);
  --設定介面顯示武將
  this.UpdateShowNpc(isDispatch, processData);
end

function UIDispatch.UpdateShowObject(isDispatch, processData)
  if not isDispatch then  --沒有設定派遣武將 or 項目不在派遣序列內 
    this.UpdateNoProcess();
  elseif processData ~= nil then --項目在派遣序列內
    this.UpdateInProcess(processData);
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


  elseif selectNpcIndex ~= nil then --有設定要執行項目武將
    this.UpdateSelect();
  end
end

function UIDispatch.UpdateNoProcess()
  image_SelectNpc.gameObject:SetActive(true);--打開選武將
  image_ChangeNpc.gameObject:SetActive(false);
  jmpDrawer_Npc.gameObject:SetActive(false);--關閉介面上武將
  image_Golden.gameObject:SetActive(RoleCount.Get(ERoleCount.Dispatch) >= RoleCount.Max(ERoleCount.Dispatch));
  image_TimeBG.gameObject:SetActive(false);

  text_Time.text = "";
  text_Start.text = string.Get(20925);

  image_Start.color = Color.Gray;
  text_Start.color = Color.LightGray;

  for i = 1, Dispatch.ConditionCount do
    this.SetEffectUI(i, Dispatch.GetEffect(i), false);
  end
end

function UIDispatch.UpdateInProcess(processData)
  local showNpc = this.GetShowNpc(processData); 
  local npcData = npcDatas[showNpc.data.npcId];

  image_SelectNpc.gameObject:SetActive(false);
  image_ChangeNpc.gameObject:SetActive(false);
  jmpDrawer_Npc.gameObject:SetActive(true);
  
  image_Golden.gameObject:SetActive(false);
  image_TimeBG.gameObject:SetActive(true);

  if Dispatch.IsComplete(processData) then
    text_Start.text = string.Get(99689);
  else
    text_Start.text = string.Get(21192);
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

  image_Start.color = Color.White;
  text_Start.color = Color.White;

  for i = 1, Dispatch.ConditionCount do
    effectComponent[i].text_Effect.text = Dispatch.GetProcessEffectText(processData, i);
    this.SetEffectUI(i, Dispatch.GetEffect(i, processData), Dispatch.IsMeetProcessEffect(processData, i, npcData));
  end
end

function UIDispatch.UpdateSelect()
  local showNpc = this.GetShowNpc(); 
  local npcData = npcDatas[showNpc.data.npcId];

  image_SelectNpc.gameObject:SetActive(false);
  image_ChangeNpc.gameObject:SetActive(true);
  jmpDrawer_Npc.gameObject:SetActive(true);
  image_Golden.gameObject:SetActive(RoleCount.Get(ERoleCount.Dispatch) >= RoleCount.Max(ERoleCount.Dispatch));

  text_Start.text = string.Get(20925);

  image_Start.color = Color.White;
  text_Start.color = Color.White;

  for i = 1, Dispatch.ConditionCount do
    effectComponent[i].text_Effect.text = Dispatch.GetEffectText(i);
    this.SetEffectUI(i, Dispatch.GetEffect(i), Dispatch.IsMeetEffect(i, npcData));
  end
end

function UIDispatch.UpdateShowAward(isDispatch, processData)
  if isDispatch then
    local showNpc = this.GetShowNpc(processData);
    local awardData = Dispatch.GetAwardData(currentDispatchKind, showNpc.data.level);
    text_Award.text = string.format(string.Get(20642), Dispatch.GetAwardLevel(currentDispatchKind, showNpc.data.level));
    for i = 1, CommonAwardData.AwardCount do
      if i == 1 then
        image_Award[i].image.gameObject:SetActive(true);
        image_Award[i].item:SetItem(65392); --固定經驗值
        image_Award[i].item:SetEvent(function() end);
        local expKind, exp = Dispatch.GetAwardExp(currentDispatchKind, showNpc.data.level);
        if expKind == 1 then
          image_Award[i].name.text = string.Concat(exp, "%");
        else
          image_Award[i].name.text = exp;
        end
        image_Award[i].value.text = "";
      else
        if awardData ~= nil and awardData.award[i-1].itemId ~= 0 then
          image_Award[i].image.gameObject:SetActive(true);
          if awardData.award[i-1].awardKind == CommonAwardDataKind.item then
            image_Award[i].item:SetItem(awardData.award[i-1].itemId);
            image_Award[i].item:SetEvent(function() end);

            local item = itemDatas[awardData.award[i-1].itemId];
            if item ~= nil then
              if item.kind == EItemKind.Item_80 and item.attribute[1].kind == 4 then
                image_Award[i].name.text = string.Get(20032);
              elseif item.kind == EItemKind.Item_80 and item.attribute[1].kind == 5 then
                image_Award[i].name.text = string.Get(10097);
              else
                image_Award[i].name.text = item:GetName();
              end
            end
          elseif awardData.award[i-1].awardKind == CommonAwardDataKind.luckyBag then
            local luckuBag = luckyBagDatas[awardData.award[i-1].itemId];
            image_Award[i].item.rawImage_Icon.gameObject:SetActive(true);
            image_Award[i].item:SetIconTexture(luckuBag.icon);
            image_Award[i].item:SetEvent(this.OnClick_LuckyBag, awardData.award[i-1].itemId);
            image_Award[i].name.text = luckuBag:GetName();
          end
        else
          image_Award[i].image.gameObject:SetActive(false);
        end
      end
    end 
  else
    text_Award.text = "";
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
  
    for i = 1, CommonAwardData.AwardCount do
      image_Award[i].image.gameObject:SetActive(false);
    end
  end
end

function UIDispatch.UpdateShowNpc(isDispatch, processData)
  if isDispatch then  --項目有派遣武將、設定顯示 
    local showNpc = this.GetShowNpc(processData)
    local npcData = npcDatas[showNpc.data.npcId];
    local offsetX, offsetY = npcData:GetOffset();

    jmpDrawer_Npc:GenerateAndDraw(npcData:GetAtlasParams(ERolePose.Prepare + 1));
    jmpDrawer_Npc.offsetY = offsetY;
  end
end

function UIDispatch.GetShowNpc(processData)
  if processData ~= nil then --項目在派遣序列內 
    return Dispatch.GetShowNpcDataByInnIndex(processData.innIndex);
  elseif selectNpcIndex ~= nil then --有設定派遣武將
    return Dispatch.GetShowNpcData(selectNpcIndex);
  end

  return nil
end

function UIDispatch.UpdateSelectNpc()
  local showNpc = Dispatch.GetShowNpcData(currentInnNpcIndex);
  if showNpc == nil then logError("showNpc == nil") return end

  local npcData = npcDatas[showNpc.data.npcId];
  local offsetX, offsetY = npcData:GetOffset();

  uiCareer:SetCareer(npcData.turn, npcData.element, ECareer.None, true);
  text_Name.text = showNpc.data.name;
  text_Lv.text = showNpc.data.level;

  text_Moral.text = string.Concat(string.Get(20323), " : ", string.GetMoral(npcData.moral, true));

  jmpDrawer_Role:GenerateAndDraw(npcData:GetAtlasParams(ERolePose.Prepare + 1));
  jmpDrawer_Role.offsetY = offsetY;
  
  image_RoleState.gameObject:SetActive(showNpc.data.status == ENpcInnStatus.Dispatch);

  UIStatus.SetExpSlider(slider_Exp, text_Exp, text_FullExp, showNpc.data.level, showNpc.data.exp, npcData:GetTurn());

  if showNpc.data.status == ENpcInnStatus.Dispatch then
    text_SetNpc.color = Color.Gray;
    image_SetNpc.color = Color.Gray;
  else
    text_SetNpc.color = Color.White;
    image_SetNpc.color = Color.White;
  end
end

function UIDispatch.UpdateSelectNpcEffect()
  local showNpc = Dispatch.GetShowNpcData(currentInnNpcIndex);
  if showNpc == nil then logError("showNpc == nil") return end

  local npcData = npcDatas[showNpc.data.npcId];
  
  for i = 1, Dispatch.ConditionCount do
    npcEffectComponent[i].text_Effect.text = Dispatch.GetEffectText(i);
    this.SetNpcEffectUI(i, Dispatch.GetEffect(i), Dispatch.IsMeetEffect(i, npcData));
  end
end

function UIDispatch.OnClick_SelectNpc()
  Dispatch.SetShowNpcData();

  if Dispatch.GetShowNpcCount() <= 0 then
    ShowCenterMessage(string.Get(20909));
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

  this.UpdateSelectNpc();
  this.UpdateSelectNpcEffect();
  gameObject_SelectNpc:SetActive(true);
end

function UIDispatch.OnClick_CurrentSelectNpc()
  local processData = Dispatch.GetProcessData(currentDispatchKind);

  if processData ~= nil then --項目在派遣中
    return;
  end

  currentInnNpcIndex = selectNpcIndex;

  this.UpdateSelectNpc();
  this.UpdateSelectNpcEffect();
  gameObject_SelectNpc:SetActive(true);
end

function UIDispatch.OnClick_Start()
  local processData = Dispatch.GetProcessData(currentDispatchKind);

  if selectNpcIndex ~= nil then --派遣武將執行項目
    if RoleCount.Get(ERoleCount.Dispatch) >= RoleCount.Max(ERoleCount.Dispatch) then --達每日派遣次數
      if RoleCount.Get(ERoleCount.BuyDispatch) >= RoleCount.Max(ERoleCount.BuyDispatch) then --達每日可購買次數
        ShowCenterMessage(string.format(string.Get(21139), RoleCount.Max(ERoleCount.BuyDispatch)));
      else
        UISell.Launch(6, this.StartDispatch);
      end

      return;
    end

    this.StartDispatch();
  elseif processData ~= nil and Dispatch.IsComplete(processData) then --完成派遣項目
    if Item.CheckBagIsFull() then return end

    this.CompeleteDispatch(processData);
  elseif processData ~= nil and not Dispatch.IsComplete(processData) then --快速完成派遣
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
  
    
    UISell.Launch(9, this.UpdateUI, processData.index);
  end
end

function UIDispatch.StartDispatch()
  Dispatch.SendDispatchStart(currentDispatchKind, selectNpcIndex);
end

function UIDispatch.CompeleteDispatch(processData)
  Dispatch.SendCompelete(processData.index);
end

function UIDispatch.OnClick_SelectNpcMask()
  gameObject_SelectNpc:SetActive(false);
  if selectNpcIndex ~= nil then
    currentInnNpcIndex = selectNpcIndex;
  else
    currentInnNpcIndex = 1;
    selectNpcIndex = nil;
  end
end

function UIDispatch.OnClick_SetNpc()
  local showNpc = Dispatch.GetShowNpcData(currentInnNpcIndex);
  if showNpc == nil then logError("showNpc == nil") return end
  if showNpc.data.status == ENpcInnStatus.Dispatch then return end --派遣中武將不能再派遣

  gameObject_SelectNpc:SetActive(false);
  selectNpcIndex = currentInnNpcIndex;
  currentInnNpcIndex = 1;
  this.UpdateUI();
end

function UIDispatch.OnClick_Prev()
  if currentInnNpcIndex - 1 > 0 then 
    currentInnNpcIndex = currentInnNpcIndex - 1;
  else
    currentInnNpcIndex = Dispatch.GetShowNpcCount()
  end

  this.UpdateSelectNpc();
  this.UpdateSelectNpcEffect();
end

function UIDispatch.OnClick_Next()
  if currentInnNpcIndex + 1 <= Dispatch.GetShowNpcCount() then 
    currentInnNpcIndex = currentInnNpcIndex + 1;
  else
    currentInnNpcIndex = 1;
  end

  this.UpdateSelectNpc();
  this.UpdateSelectNpcEffect();
end

function UIDispatch.OnClick_Slider(uiEvent)
  local sliderIndex = uiEvent.parameter;

  if Dispatch.GetBarCount() < sliderIndex then
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
  
    UISell.Launch(5, this.UpdateUI);
    return;
  end      

  local data = Dispatch.GetProcessDataByIndex(sliderIndex);

  if currentSliderIndex == sliderIndex and data ~= nil then return end

  this.SwitchPage(data);
  currentSliderIndex = sliderIndex;
end

function UIDispatch.SwitchPage(data)
  if data ~= nil then
    currentDispatchKind = data.kind;
  else
    currentDispatchKind = Dispatch.GetDispatchSaveKind();
  end
  selectNpcIndex = nil;
  this.UpdateUI();
  this.UpdateCurrentShowTime();
end

function UIDispatch.OnClick_Tag(mainTag, subTag) 
  return true;
end

function UIDispatch.OnClick_LuckyBag(uiEvent)
  UIItemInfo.ShowLuckyBag(uiEvent.parameter);
end

function UIDispatch.SetEffectUI(index, effect, isMeetEffect)
  if effect == nil then return end

  if effect.conditionKind == EDispatchBonuseKind.Moral then
    if isMeetEffect then
      effectComponent[index].text_Effect.color = Color.Black;
      effectComponent[index].text_EffectMoral.color = Color.Black;
      effectComponent[index].career_Effect.image_Career.sprite = UI.GetSprite("icon037");
      effectComponent[index].career_Effect.image_Career.color = Color.White;
    else
      effectComponent[index].text_Effect.text = string.Get(20702);
      effectComponent[index].text_Effect.color = Color.Gray;
      effectComponent[index].text_EffectMoral.color = LuaHelper.GetColor(188, 190, 187, 255);
      effectComponent[index].career_Effect:SetCareerForDispatch(effect.conditionValue);
    end

  effectComponent[index].career_Effect.image_Frame.gameObject:SetActive(false);
  effectComponent[index].career_Effect.text_Career.text = "";
  effectComponent[index].text_EffectMoral.text = string.GetMoral(effect.conditionValue, true);
  end

  if effect.conditionKind == EDispatchBonuseKind.Element then
    if isMeetEffect then
      effectComponent[index].text_Effect.color = Color.Black;
      effectComponent[index].career_Effect.image_Career.sprite = UI.GetSprite("icon038");
      effectComponent[index].career_Effect.text_Career.color = Color.White;
      effectComponent[index].career_Effect:SetCareer(0, effect.conditionValue, ECareer.None);
      effectComponent[index].career_Effect.image_Frame.gameObject:SetActive(true);
    else
      effectComponent[index].text_Effect.text = string.Get(20702);
      effectComponent[index].text_Effect.color = Color.Gray;
      effectComponent[index].career_Effect:SetCareerForDispatch(effect.conditionValue);
      effectComponent[index].career_Effect.image_Frame.gameObject:SetActive(false);
    end

    effectComponent[index].text_EffectMoral.text = "";
  end
end

function UIDispatch.SetNpcEffectUI(index, effect, isMeetEffect)
  if effect == nil then return end

  if effect.conditionKind == EDispatchBonuseKind.Moral then
    if isMeetEffect then
      npcEffectComponent[index].text_Effect.color = Color.Black;
      npcEffectComponent[index].text_EffectMoral.color = Color.Black;
      npcEffectComponent[index].career_Effect.image_Career.sprite = UI.GetSprite("icon037");
      npcEffectComponent[index].career_Effect.image_Career.color = Color.White;
    else
      npcEffectComponent[index].text_Effect.color = Color.Gray;
      npcEffectComponent[index].text_EffectMoral.color = LuaHelper.GetColor(188, 190, 187, 255);
      npcEffectComponent[index].career_Effect:SetCareerForDispatch(effect.conditionValue);
    end

  npcEffectComponent[index].career_Effect.image_Frame.gameObject:SetActive(false);
  npcEffectComponent[index].career_Effect.text_Career.text = "";
  npcEffectComponent[index].text_EffectMoral.text = string.GetMoral(effect.conditionValue, true);
  end

  if effect.conditionKind == EDispatchBonuseKind.Element then
    if isMeetEffect then
      npcEffectComponent[index].text_Effect.color = Color.Black;
      npcEffectComponent[index].career_Effect.image_Career.sprite = UI.GetSprite("icon038");
      npcEffectComponent[index].career_Effect.text_Career.color = Color.White;
      npcEffectComponent[index].career_Effect:SetCareer(0, effect.conditionValue, ECareer.None);
      npcEffectComponent[index].career_Effect.image_Frame.gameObject:SetActive(true);
    else
      npcEffectComponent[index].text_Effect.color = Color.Gray;
      npcEffectComponent[index].career_Effect:SetCareerForDispatch(effect.conditionValue);
      npcEffectComponent[index].career_Effect.image_Frame.gameObject:SetActive(false);
    end

    npcEffectComponent[index].text_EffectMoral.text = "";
  end
end