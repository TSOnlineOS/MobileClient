UIPoke = {};
local this = UIPoke;

this.name = "UIPoke";
this.uiController = nil;

local rewardGroup = {};
local itemGroup = {};

local gameObject_Mask;

local rawImage_Badou;
local rawImage_ItemBG;
local rawImage_LBG;
local rawImage_RBG

local text_Get;
local text_CoinCount;
local text_Cost;

local event_ShowPr;

local max_coin = 999;
local coinItemId = 29507;   --吞食戳戳幣
local changeItemId = 29508; --翻牌令牌
local isPlayingAnimate = false;
local lastItemName = "";
this.coin = 0;    --投幣數資料
this.awards = {}; --顯示機率用獎項資料

function UIPoke.Initialize(go)
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;

  for i = 1, 6 do 
    rewardGroup[i] = {};
    rewardGroup[i].gameObject = uiController:FindGameObject(string.Concat("RewardGroup_", i));
    rewardGroup[i].text_reward = rewardGroup[i].gameObject.transform:Find("Text_Reward").gameObject:GetComponent("Text");
  end
  gameObject_Mask = uiController:FindGameObject("Image_Mask");

  rawImage_Badou = uiController:FindRawImage("RawImage_Badou");
  rawImage_ItemBG = uiController:FindRawImage("RawImage_ItemBG");
  rawImage_LBG = uiController:FindRawImage("RawImage_LBG");
  rawImage_RBG = uiController:FindRawImage("RawImage_RBG");

  text_Get = uiController:FindText("Text_Get");
  text_CoinCount = uiController:FindText("Text_CoinCount");
  text_Cost = uiController:FindText("Text_Cost");

  for i = 1, 25 do 
    itemGroup[i] = {};
    itemGroup[i].image_Item = uiController:FindImage(string.Concat("Image_Item_", i));
    itemGroup[i].event_Item = itemGroup[i].image_Item.gameObject:GetComponent("UIEvent");
    itemGroup[i].event_Item:SetListener(EventTriggerType.PointerClick, this.OnClick_Item);
    itemGroup[i].event_Item.parameter = i;

    itemGroup[i].item = UIItemController.New(itemGroup[i].image_Item.transform:Find("ItemRoot").transform);
  end

  local tempEvent = uiController:FindEvent("Image_Help");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Help);

  tempEvent = uiController:FindEvent("Image_Close");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);

  tempEvent = uiController:FindEvent("Image_Play");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Play);

  tempEvent = uiController:FindEvent("Image_ChangeReward");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_ChangeReward);  

  event_ShowPr = uiController:FindEvent("Image_ShowPr");
  event_ShowPr:SetListener(EventTriggerType.PointerClick, this.OnClick_ShowPr);
end

function UIPoke.Clear()
  this.coin = 0;    
  table.Clear(this.awards);
  isPlayingAnimate = false;
  lastItemName = "";
end

function UIPoke.OnOpen()
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  isPlayingAnimate = false;
  this.LoadTextrue();
  this.UpdateUI();
  return true;
end

function UIPoke.OnClose()
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
--- --1--------------------------------------------------------------
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
--- --1--------------------------------------------------------------
  --  if LuaHelper.CheckDefine("DemoCode") then
  --    local code = DemoCode.GetBitxor(20);
  --    code = code * 10;
  --  end
  --  ---2--------------------------------------------------------------
  AnimationController.Destory(10);
  AnimationController.Destory(11);
  return true;
end

function UIPoke.LoadTextrue()
  local randId = math.random(0, 7);
  TextureManager.SetPng(ETextureUseType.UI, string.Concat("common0_bod", 130 + randId) , rawImage_ItemBG);
  TextureManager.SetPng(ETextureUseType.UI, "A02" , rawImage_Badou);
  TextureManager.SetPng(ETextureUseType.UI, "common0_bod102" , rawImage_LBG);
  TextureManager.SetPng(ETextureUseType.UI, "common0_bod102" , rawImage_RBG);  
end

function UIPoke.UpdateUI()  
  if isPlayingAnimate then 
    return 
  end

  local isAwardData = this.awards[1].itemId ~= 0;
  event_ShowPr.gameObject:SetActive(isAwardData);

  text_Get.text = lastItemName;

  for k, v in pairs(rewardGroup)do     
    v.text_reward.text = "";
  end

  if isAwardData then
    local kind2Idx = 0;
    local kind3Idx = 0;
    for k,v in pairs(this.awards)do 
      if v.kind == 4 then 
        if itemDatas[v.itemId] ~= nil then 
          rewardGroup[1].text_reward.text = itemDatas[v.itemId]:GetName(true);
        end
      elseif v.kind == 3 then 
        if itemDatas[v.itemId] ~= nil then 
          rewardGroup[2 + kind3Idx].text_reward.text = itemDatas[v.itemId]:GetName(true);
          if kind3Idx == 0 then 
            kind3Idx = kind3Idx + 1;
          end
        end
      elseif v.kind == 2 then 
        if itemDatas[v.itemId] ~= nil then 
          rewardGroup[4 + kind2Idx].text_reward.text = itemDatas[v.itemId]:GetName(true);
          if kind2Idx <= 1 then 
            kind2Idx = kind2Idx + 1;
          end
        end
      end
    end
    text_Cost.text = string.format( string.Get(22492), this.GetNowCost());
  else
    text_Cost.text = "";
  end

  text_CoinCount.text = this.coin;

  local openIndex = {};
  for k, v in pairs(this.awards)do 
    if v.index ~= 0 then 
      itemGroup[v.index].image_Item.enabled = true;
      itemGroup[v.index].item:SetItem(v.itemId, v.count);
      itemGroup[v.index].image_Item.sprite = UI.GetSprite("bod129");
      
      table.insert( openIndex, v.index);
    end
  end

  for k, v in pairs(itemGroup)do 
    if not table.Contains(openIndex, k) then 
      --設定全關
      v.item:SetItem(0);
      v.image_Item.sprite = UI.GetSprite("bod128");
    end
  end
end

function UIPoke.UpdatePr() --計算權重
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
--- --1--------------------------------------------------------------
  --  if LuaHelper.CheckDefine("DemoCode") then
  --    local code = DemoCode.GetBitxor(20);
  --    code = code * 10;
  --  end
  --  ---2--------------------------------------------------------------
  local totalWeight = 0;
  for k, v in pairs(this.awards)do 
    if v.index == 0 then --0為沒抽到,不算入機率總權重中
      totalWeight = totalWeight + v.prWeight;
    end
  end

  for k, v in pairs(this.awards)do 
    if v.index == 0 then 
      v.pr = v.prWeight / totalWeight;
    else
      v.pr = 0;
    end
  end
end

function UIPoke.OnClick_Close()
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
--- --1--------------------------------------------------------------
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
  UI.Close(this);
end

function UIPoke.OnClick_Help()
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  ---
  ---
  ---
  ---  -
  ---
  ---
  ---
  -----
---
  UI.Open(UITutorialHint, 42, this);
end

function UIPoke.OnClick_Play()
  if this.coin >= max_coin then
    ShowCenterMessage(string.Get(22459));
    return;
  end

  local coinId = coinItemId; --吞食戳戳幣 
  local count = Item.GetItemCount(coinId);
  if count < 1 then
    local max = 0;

    if max_coin - this.coin > math.floor(Role.GetPoint() / 9) then
      max = math.floor(Role.GetPoint() / 9);
    else
      max = max_coin - this.coin;
    end

    if max < 1 then
      ShowCenterMessage(string.Get(80360));
      return;
    end
    
    ShowStoreInput(coinId, max, ECurrency.Gold, -9,
      function(text)
        if text == nil then return end

        AudioManager.PlayOnce("AudioClip_WA0005");
        
        UISell.Launch(44, nil, 0, text);
      end
    );
  else
    local max = 0;
    if max_coin - this.coin > count then
      max = count;
    else
      max = max_coin - this.coin;
    end

    ShowCountInput(string.Get(20748), 1, max,
      function(text)
        if text == nil then return end

        AudioManager.PlayOnce("AudioClip_WA0005");
        
        UISell.Launch(44, nil, text);
      end
    );
  end
end

function UIPoke.OnClick_ShowPr()
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  if this.coin == 0 or this.awards[1].itemId == 0 then
    ShowCenterMessage(string.Get(22458));
    return;
  end

  UI.OpenAlwaysUseArgument(UIItemInfo, EThings.Poke, coinItemId, 0);
end

function UIPoke.OnClick_ChangeReward()
  if this.awards[1].itemId ~= 0 then 
    UISell.Launch(46);
  else
    ShowCenterMessage(string.Get(22458));
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
end

function UIPoke.GetNowCost()
  local openCount = 0;
  for k, v in pairs(this.awards)do 
    if v.index ~= 0 then 
      openCount = openCount + 1;
    end
  end   
  return openCount * 2 + 1;
end

function UIPoke.OnClick_Item(event)  
  local index = event.parameter;
  if this.awards[1].itemId == 0 then 
    ShowCenterMessage(string.Get(22458));
    return 
  end

  if isPlayingAnimate then
  
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
    return
  end

  local openCount = 0;
  for k, v in pairs(this.awards)do 
    if v.index == index then 
      --已開
      ShowCenterMessage(string.Get(22460));
      ---2--------------------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        local area =  DemoCode.CalTriangleArea(100, 100)
        area = area * 1 + 2;
        if area > DemoCode.GetBitxor(20) then  --test avg
          local avg = DemoCode.CalAvg(10, 20, 30);
        end
      end
      --3----------------------------------------------------
      return;
    elseif v.index ~= 0 then 
      openCount = openCount + 1;
    end
  end
  local costCoint = openCount * 2 + 1;
  if costCoint > this.coin then 
    ShowCenterMessage(string.Get(22458));
    return;
  end

  if Item.currentThingGrid - Item.GetBagCount(EThings.Bag, 0) < 2 then
    ShowCenterMessage(string.Get(80359));
    return;
  end


  sendBuffer:Clear();
  sendBuffer:WriteByte(index);
  Network.Send(92, 3, sendBuffer);
end

function UIPoke.PlayPokeAnimation(id, index)  
  local isBigAward =  this.awards[id] ~= nil and this.awards[id].kind == 4;
  local awardData = this.awards[id];
  local itemName = itemDatas[this.awards[id].itemId]:GetName(true);
  isPlayingAnimate = true;
  
  local transform = nil;
  if itemGroup[index] ~= nil then
    transform = itemGroup[index].item.transform;
  end
  
  AnimationController.Play(11, transform,
    function()
      itemGroup[index].image_Item.enabled = true;
      lastItemName = itemName;
      text_Get.text = lastItemName;
      if isBigAward then
        if itemGroup[index] ~= nil then
          itemGroup[index].image_Item.sprite = UI.GetSprite("bod129");
          itemGroup[index].item:SetItem(awardData.itemId, awardData.count);
        end
        AnimationController.Play(10, gameObject_Mask.transform, this.AnimateDoneUpdate, function()AudioManager.PlayOnce("AudioClip_WA0075") end );
      else
        this.AnimateDoneUpdate();
      end
    end ,
     function()
       if itemGroup[index] ~= nil then
         itemGroup[index].image_Item.enabled = false;
       end
      AudioManager.PlayOnce("AudioClip_WA0060");end  , nil, nil);
end

function UIPoke.AnimateDoneUpdate()
  isPlayingAnimate = false;
  this.UpdateUI();
end