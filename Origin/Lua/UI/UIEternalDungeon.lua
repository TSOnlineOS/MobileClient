UIEternalDungeon = {}
local this = UIEternalDungeon;

this.name = "UIEternalDungeon";
this.uiController = nil;

ERestrictKindTag = 
{
  Npc_Country = 1,    --國家  par:1=魏 2=蜀...
  Npc_Element = 2,    --屬性  (1地 2水 3火 4風  5心)
  Npc_Rebirth = 3,    --轉生  par:幾轉
  Npc_Skill = 4,      --指定技能  par:技能ID
  Npc_NoSkill = 5,    --禁用技能  par:技能ID

  Player_Rebirth = 51,
  Player_Element = 52,
  Player_LvAbove = 53,
  Player_LvBelow = 54,
  Player_HpAbove = 55,
  Player_HpBelow = 56,
  Player_SpAbove = 57,
  Player_SpBelow = 58,
  Player_IntAbove = 59,
  Player_IntBelow = 60,
  Player_AtkAbove = 61;
  Player_AtkBelow = 62;
  Player_DefAbove = 63;
  Player_DefBelow = 64;
  Player_AgiAbove = 65;
  Player_AgiBelow = 66;

  Fight_MaxRound = 101,
  Fight_LimitRound = 102,
}

EEternalDungeonLayerType = 
{
  UnRestricted = 0,
  NextMax = 1,
  CurrentMax = 2,
}

local text_LayerName;
local text_Record;
local text_Effect;
local event_Battle;

local scrollContent_Collection;
local scrollItems_Collection = {};

local currentLayer = 0;
local currentType = EEternalDungeonLayerType.UnRestricted;
local currentScroll = 0;
local infoPrizeItem = {};

function UIEternalDungeon.Initialize(go)
    local uiController = go:GetComponent("UIController");
    this.uiController = uiController;
    this.uiController.onOpen = this.OnOpen;
    this.uiController.onClose = this.OnClose;
    this.uiController.onVisible = this.OnVisible;
  
    this.InitializePage(uiController);
end
  
function UIEternalDungeon.InitializePage(uiController)
    scrollContent_Collection = uiController:FindScrollContent("ScrollContent_Collection");    
    scrollContent_Collection.onInitialize = this.OnInitialize_ScrollContent_Collection;
    scrollContent_Collection.onItemChange = this.OnItemChange_ScrollContent_Collection;

    text_LayerName = uiController:FindText("Text_LayerName");
    text_Record = uiController:FindText("Text_Record");
    text_Effect = uiController:FindText("Text_Effect");

    local infoPrizeObject = uiController:FindGameObject("Prize").gameObject;
    for i = 1, 5 do
      infoPrizeItem[i] = UIItemController.New(infoPrizeObject.transform:Find(string.Concat("Image_Award (", i, ")")).transform);
    end

    local rawImage = uiController:FindRawImage("Image_BackTexture");
    TextureManager.SetPng(ETextureUseType.UI, "common0_com075", rawImage);
    rawImage = uiController:FindRawImage("Image_RoofLeft");
    TextureManager.SetPng(ETextureUseType.UI, "common0_bod146", rawImage);
    rawImage = uiController:FindRawImage("Image_RoofRight");
    TextureManager.SetPng(ETextureUseType.UI, "common0_bod146", rawImage);    
    rawImage = uiController:FindRawImage("Image_BottomLeft");
    TextureManager.SetPng(ETextureUseType.UI, "common0_bod145", rawImage);
    rawImage = uiController:FindRawImage("Image_BottomRight");
    TextureManager.SetPng(ETextureUseType.UI, "common0_bod145", rawImage);
    rawImage = uiController:FindRawImage("Image_BottomDecor");
    TextureManager.SetPng(ETextureUseType.UI, "common0_bod113", rawImage);
    
    event_Battle = uiController:FindEvent("Image_Battle");
    event_Battle:SetListener(EventTriggerType.PointerClick, this.OnClick_Battle); 
    local event = uiController:FindEvent("Image_Close");
    event:SetListener(EventTriggerType.PointerClick, this.OnClick_Close); 
    event = uiController:FindEvent("Image_Help");
    event:SetListener(EventTriggerType.PointerClick, this.OnClick_Help); 
    event = uiController:FindEvent("Image_Mask");
    event:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);
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

function UIEternalDungeon.OnInitialize_ScrollContent_Collection(scrollItems)
  for i = 1, scrollItems.Length do
    if scrollItems_Collection[i] == nil then
      scrollItems_Collection[i] = UIEternalDungeonLayerController.New(scrollItems[i-1]);
    end
  end

  if currentType == EEternalDungeonLayerType.UnRestricted then
    currentScroll = 2;
  elseif currentType == EEternalDungeonLayerType.NextMax then
    currentScroll = 1;
  elseif currentType == EEternalDungeonLayerType.CurrentMax then
    currentScroll = 0;
  end
end

function UIEternalDungeon.OnItemChange_ScrollContent_Collection(dataIndex, itemIndex) 
  dataIndex = this.ReverseIndex(dataIndex);
  itemIndex = itemIndex+1;
  
  if currentType == EEternalDungeonLayerType.UnRestricted then
    dataIndex = dataIndex+2;
  elseif currentType == EEternalDungeonLayerType.NextMax then
    dataIndex = dataIndex+1;
  end
  
  scrollItems_Collection[itemIndex]:SetIndex(dataIndex);
  scrollItems_Collection[itemIndex]:SetEnable(dataIndex);
  local index = {};
  index.dataIndex = dataIndex;
  index.itemIndex = itemIndex;
  scrollItems_Collection[itemIndex]:SetClickEvent(this.OnClick_Layer, index);
  scrollItems_Collection[itemIndex]:SetClick(dataIndex == currentLayer);  
  return true;
end

function UIEternalDungeon.ReverseIndex(idx)
  local rc = this.GetEternalDungeonLayer();
  return rc-idx;
end

function UIEternalDungeon.OnOpen()   
  currentLayer = this.GetEternalDungeonLayer()+1;
  this.SetLayerInfo(this.GetLayerAdjust(currentLayer));
  this.SetPrizes(this.GetLayerAdjust(currentLayer));
  this.RequestInfo();
  this.SetEffect();

  this.UpdateType();
  scrollContent_Collection:Initialize(this.GetEternalDungeonLayer());
  local refreshLayer = currentLayer;
  if currentType == EEternalDungeonLayerType.UnRestricted then
    refreshLayer = refreshLayer + 1;
  elseif currentType == EEternalDungeonLayerType.NextMax then
    refreshLayer = refreshLayer;
  elseif currentType == EEternalDungeonLayerType.CurrentMax then
    refreshLayer = refreshLayer - 1;
  end
  scrollContent_Collection:Refresh(refreshLayer);
  return true;
end

function UIEternalDungeon.OnVisible(visible)
end
function UIEternalDungeon.OnClose()
  this.ClickLayerActive();
  return true;
end

function UIEternalDungeon.OnClick_Equip()
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
  UI.Open(UIStatus, EUIStatusTag.Equip);
end

--C:048-001 <開戰> + 層級(4) + 難度(1)
function UIEternalDungeon.OnClick_Battle()
  sendBuffer:Clear();  
  sendBuffer:WriteInt32(this.GetLayerAdjust(currentLayer));
  Network.Send(48, 1, sendBuffer); 
end

function UIEternalDungeon.OnClick_Close()
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
  UI.Close(this);
  return true;
end

function UIEternalDungeon.OnClick_Help()
  UI.Open(UITutorialHint, 0, this, string.Get(23316), string.Get(23332));
end

function UIEternalDungeon.OnClick_Layer(uiEvent) 
  local index = uiEvent.parameter;
  this.ClickLayerActive(index.dataIndex, index.itemIndex);
end

function UIEternalDungeon.ClickLayerActive(index, scroll)
  if scrollItems_Collection[currentScroll] ~= nil then
    scrollItems_Collection[currentScroll]:SetClick(false);
  end
  if (index ~= nil) then
    scrollItems_Collection[scroll]:SetClick(true);
    currentLayer = index;    
    currentScroll = scroll;
    this.RequestInfo();
    this.SetEffect();
  end
end

--C:048-002 <強化玩家能力> + 類別(1)
function UIEternalDungeon.RequestInfo(idx)
  if idx == nil then
    idx = this.GetLayerAdjust(currentLayer);
  end
  sendBuffer:Clear();    
  sendBuffer:WriteInt32(idx);
  Network.Send(48, 2, sendBuffer); 
end

function UIEternalDungeon.OverBattle(result)
  if result == 1 then
    local layer = this.GetEternalDungeonLayer();
    scrollContent_Collection:Reset(currentLayer+1);
    this.UpdateInfo(layer);
    this.RequestInfo(layer);
  end
end

function UIEternalDungeon.UpdateInfo(layer)  
  this.SetLayerInfo(layer);
  this.SetPrizes(layer);
end

function UIEternalDungeon.UpdateBattleClick(check)
  if check == 0 then 
    event_Battle:SetColor(Color.White);
    event_Battle.enabled = true;
  else
    event_Battle:SetColor(Color.LightGray);
    event_Battle.enabled = false;
  end
end

function UIEternalDungeon.SetLayerInfo(data)
  text_LayerName.text = string.Concat(data, string.Get(23317));
end

function UIEternalDungeon.SetRecord(count, data)
  local aStr = "";
  if count <= 0 then
    aStr = string.Get(23333);
  else
    for i = 1, count do 
      local name = data:ReadString(data:ReadByte());
      local time = data:ReadDouble();
      if (time ~= nil) and (time ~= 0) then
        aStr = string.Concat(aStr, name, this.GetTimeSpanString(System.TimeSpan.FromSeconds(time)));
      end

      if i ~= count then
        aStr = string.Concat(aStr, "\n");
      end
    end
  end
  text_Record.text = aStr;
end

function UIEternalDungeon.GetTimeSpanString(timeSpan)
  local hours = timeSpan.Hours;
  local minutes = timeSpan.Minutes;
  local seconds = timeSpan.Seconds;
  local milliseconds = timeSpan.Milliseconds;
  return string.format("%02d:%02d:%02d.%03d",hours, minutes, seconds, milliseconds);
end

function UIEternalDungeon.SetPrizes(idx)    
  local index = EternalDungeonPrizeData.GetIdx(idx);
  local data = eternalDungeonPrizeDatas[index];

  if data ~= nil then
    for i = 1, 5 do
      infoPrizeItem[i]:SetItem(data.prize[i].itemId, data.prize[i].count);
    end
  end
end

function UIEternalDungeon.SetEffect(layer)  
  if layer == nil then    
    layer = this.GetLayerAdjust(currentLayer);
  end

  local aStr = "";
  local effectList = EternalDungeonLayerData.GetEffect(layer);
  for i = 1, #effectList do 
    local data = fieldEffectDatas[effectList[i]];
    local dataCount = 0;
    if data ~= nil then
      for k,v in pairs(data) do 
        dataCount = dataCount+1;
        aStr = string.Concat(aStr, this.GetEffectStr(v));
        if (i ~= #effectList)
          or ((i == #effectList) and (dataCount ~= #data)) then
          aStr = string.Concat(aStr, "\n");
        end
      end
    end
  end
  text_Effect.text = aStr;
end

function UIEternalDungeon.GetEffectStr(data)
  local aStr = "";
  if data.effectId == 6 then
    aStr = string.Concat(aStr, string.Get(40405)); -- 昏睡
  elseif data.effectId == 62 then
    aStr = string.Concat(aStr, string.Get(20401)); -- HP
    aStr = string.Concat(aStr, this.GetEffectSignStr(data.effectId, data.value)); -- %d%  
  elseif data.effectId == 171 then
    aStr = string.Concat(aStr, string.Get(40406)); -- 中毒
  elseif data.effectId == 175 then
    aStr = string.Concat(aStr, string.Get(23341)); -- 岩怪
  elseif data.effectId == 179 then
    aStr = string.Concat(aStr, string.Get(23329)); -- 燃燒
  elseif data.effectId == 184 then
    aStr = string.Concat(aStr, this.GetEffectKindStr(data.kind));
    aStr = string.Concat(aStr, this.GetEffectSignStr(data.effectId, data.value)); -- %d%
  end
  aStr = string.Concat(aStr, " ", data.round, string.Get(90023)); --回合
  return aStr;
end

function UIEternalDungeon.GetEffectKindStr(data)
  if data == 1 then
    return string.Get(20037); -- 知力
  elseif data == 2 then
    return string.Get(20038); -- 攻擊
  elseif data == 3 then
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
    return string.Get(20039); -- 防禦
  elseif data == 6 then
    return string.Get(20042); -- 敏捷
  end
  return "";
end

function UIEternalDungeon.GetEffectSignStr(kind, value)
  if kind == 59 then
    return string.Concat("+", value);
  elseif kind == 60 then
    return string.Concat("+", value, "%");
  elseif kind == 61 then
    return string.Concat("+", value);
  elseif kind == 62 then
    return string.Concat("+", value, "%");
  elseif kind == 63 then
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
    return string.Concat("+", value, "%");
  elseif kind == 256 then
    return string.Concat("+", value);
  elseif kind == 257 then
    return string.Concat("+", value, "%");
  elseif kind == 184 then
    return string.Concat("-", value, "%");
  elseif kind == 186 then
    return string.Concat("-", value);
  else
    return string.Concat(value, "%");
  end
end

function UIEternalDungeon.UpdateType()
  local isNext = this.IsNextMaxLayer(currentLayer);
  local isCurrent = this.IsMaxLayer(currentLayer);
  if (not isNext) and (not isCurrent) then
    currentType = EEternalDungeonLayerType.UnRestricted;
  elseif (isNext) and (not isCurrent) then
    currentType = EEternalDungeonLayerType.NextMax;
  elseif (isNext) and (isCurrent) then
    currentType = EEternalDungeonLayerType.CurrentMax;
  end
end

function UIEternalDungeon.GetEternalDungeonLayer()
  return RoleCount.Get(ERoleCount.EternalDungeon);
end

function UIEternalDungeon.GetLayerAdjust(layer)
  if layer >= RoleCount.Max(ERoleCount.EternalDungeon) then
    return RoleCount.Max(ERoleCount.EternalDungeon);
  else
    return layer
  end
end


function UIEternalDungeon.IsMaxLayer(idx)
  return (RoleCount.Max(ERoleCount.EternalDungeon) ~= 0) and (idx >= RoleCount.Max(ERoleCount.EternalDungeon)+1);
end

function UIEternalDungeon.IsNextMaxLayer(idx)
  return (RoleCount.Max(ERoleCount.EternalDungeon) ~= 0) and (idx >= (RoleCount.Max(ERoleCount.EternalDungeon)));
end