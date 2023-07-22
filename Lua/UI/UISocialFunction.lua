UISocialFunction = {}
local this = UISocialFunction;

this.name = "UISocialFunction";
this.uiController = nil;

--ui
local image_Mask;

--info
local image_InfoBG;
local image_Marriage;
local uiCareer;

local text_Level;
local text_Name;
local text_Hp;
local text_Sp;
local text_Int;
local text_Atk;
local text_Def;
local text_Agi;
local text_Hpx;
local text_Spx;
local text_Title;
local text_Marriage;

local rawImage_Title;

local gradient_Title;
local outline_Title;

local jmpDrawer_Role;

local item_Equips = {};

--function
local image_FunctionBG;

local event_Info;
local event_Whisper;
local event_AddFriend;
local event_RemoveFriend;
local event_AddBlack;
local event_RemoveBlack;
local event_GoSendGift;
local event_GoToHouse;
local image_RedDot;

--var
local isDirty = 0;
local currentPlayerInfo = nil;
local bodyEffect = nil;

function UISocialFunction.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onClose = this.OnClose;
  this.uiController.onVisible = this.OnVisible;

  image_Mask = uiController:FindImage("Image_Mask");

  --info
  image_InfoBG = uiController:FindImage("Image_InfoBG");
  image_Marriage = uiController:FindImage("Image_Marriage");
  uiCareer = UICareerController.New(uiController:FindGameObject("Career"));
  
  text_Level = uiController:FindText("Text_T14_Level");
  text_Name = uiController:FindText("Text_T6_Name");
  text_Hp = uiController:FindText("Text_T5_Hp");
  text_Sp = uiController:FindText("Text_T5_Sp");
  text_Int = uiController:FindText("Text_Int");
  text_Atk = uiController:FindText("Text_Atk");
  text_Def = uiController:FindText("Text_Def");
  text_Agi = uiController:FindText("Text_Agi");
  text_Hpx = uiController:FindText("Text_Hpx");
  text_Spx = uiController:FindText("Text_Spx");
  text_Title = uiController:FindText("Text_Title");
  text_Marriage = uiController:FindText("Text_Marriage");

  rawImage_Title = uiController:FindRawImage("RawImage_TitleBG");

  gradient_Title = text_Title.transform:GetComponent("GradientColor");
  outline_Title = text_Title.transform:GetComponent("Outline8");

  jmpDrawer_Role = uiController:FindRawImage("RawImage_Role").gameObject:AddComponent(typeof(JmpDrawer));

  for i = 1, 6 do
    item_Equips[i] = UIItemController.New(uiController:FindGameObject(string.Concat("Image_EquipBG (", i, ")")).transform);
  end

  --function
  image_FunctionBG = uiController:FindImage("Image_FunctionBG");

  local tempEvent = uiController:FindEvent("Image_Mask");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Close);

  event_Info = uiController:FindEvent("Image_Info");
  event_Info:SetListener(EventTriggerType.PointerClick, this.OnClick_Info);

  event_Whisper = uiController:FindEvent("Image_Whisper");
  event_Whisper:SetListener(EventTriggerType.PointerClick, this.OnClick_Whisper);
  
  event_AddFriend = uiController:FindEvent("Image_AddFriend");
  event_AddFriend:SetListener(EventTriggerType.PointerClick, this.OnClick_AddFriend);
  
  event_RemoveFriend = uiController:FindEvent("Image_RemoveFriend");
  event_RemoveFriend:SetListener(EventTriggerType.PointerClick, this.OnClick_RemoveFriend);
  
  event_AddBlack = uiController:FindEvent("Image_AddBlack");
  event_AddBlack:SetListener(EventTriggerType.PointerClick, this.OnClick_AddBlack);
  
  event_RemoveBlack = uiController:FindEvent("Image_RemoveBlack");
  event_RemoveBlack:SetListener(EventTriggerType.PointerClick, this.OnClick_RemoveBlack);

  event_GoSendGift = uiController:FindEvent("Image_SendGift");
  event_GoSendGift:SetListener(EventTriggerType.PointerClick, this.OnClick_GoSendGift);

  event_GoToHouse = uiController:FindEvent("Image_GoHouse");
  event_GoToHouse:SetListener(EventTriggerType.PointerClick, this.OnClick_GoToHouse);
  image_RedDot = event_GoToHouse.gameObject.transform:Find("Image_Dot"):GetComponent("Image");
  image_RedDot.gameObject:SetActive(false);

  event_OrgCheif = uiController:FindEvent("Image_OrgCheif");
  event_OrgCheif:SetListener(EventTriggerType.PointerClick, this.OnClick_OrgCheif);

  event_OrgSubCheif = uiController:FindEvent("Image_OrgSubCheif");
  event_OrgSubCheif:SetListener(EventTriggerType.PointerClick, this.OnClick_OrgSubCheif);
  
  event_OrgMember = uiController:FindEvent("Image_OrgMember");
  event_OrgMember:SetListener(EventTriggerType.PointerClick, this.OnClick_OrgMember);
  
  event_OrgKick = uiController:FindEvent("Image_OrgKick");
  event_OrgKick:SetListener(EventTriggerType.PointerClick, this.OnClick_OrgKick);
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

function UISocialFunction.OnOpen(playerInfo, position, orgFunction, detailInfo)
  if Role.playerId == playerInfo.roleId then return false end

  if bodyEffect ~= nil then
    bodyEffect:Stop();
  end

  rawImage_Title.gameObject:SetActive(false);

  if detailInfo ~= nil then
    position = Vector2.New(340, 200);

    image_Mask:CrossFadeAlpha(0.5, 0, true);
    image_InfoBG.gameObject:SetActive(true);
    image_Marriage.gameObject:SetActive(false);

    uiCareer:SetCareer(playerInfo.turn, playerInfo.element, playerInfo.career, false, playerInfo.turn3Info.element);
  
    text_Level.text = playerInfo.level;
    text_Name.text = playerInfo.name;
    text_Hp.text = detailInfo.hp;
    text_Sp.text = detailInfo.sp;
    text_Int.text = detailInfo.int;
    text_Atk.text = detailInfo.atk;
    text_Def.text = detailInfo.def;
    text_Agi.text = detailInfo.agi;
    text_Hpx.text = detailInfo.hpx;
    text_Spx.text = detailInfo.spx;
    text_Marriage.text = HouseBoard.MarriageText(detailInfo.marriage);

    local playerData = PlayerData.New();
    
    playerData.roleId = playerInfo.roleId;
    playerData.sex = playerInfo.sex;
    playerData.headStyle = playerInfo.headStyle;
    
    playerData.colorTints[1] = playerInfo.colorTints[1];
    playerData.colorTints[2] = playerInfo.colorTints[2];
  
    playerData.equips = {};
    for i = 1, Role.maxEquip + Role.maxStyle + Role.maxOutfitStyle do
      if detailInfo.equips[i] ~= nil then
        playerData.equips[i] = detailInfo.equips[i].Id;
      end
    end
    
    jmpDrawer_Role:GenerateAndDraw(playerData:GetAtlasParams(detailInfo.titleId, ERolePose.Prepare + 1));
    jmpDrawer_Role.offsetY = -15;

    local titleData = titleDatas[detailInfo.titleId];
    if titleData ~= nil then
      if titleData.hudTexture ~= 0 and titleData.hudText ~= 0 then
        TextureManager.SetPng(ETextureUseType.None, string.format("Title_%03d", titleData.hudTexture), rawImage_Title);
        text_Title.text = string.Get(titleData.hudText);
        gradient_Title.colorTop = titleData.hudTopColor;
        gradient_Title.colorBottom = titleData.hudTopColor;
        outline_Title.effectColor = titleData.hudOutlineColor;

        rawImage_Title.gameObject:SetActive(true);
      end

      if titleData.effectId ~= 0 then
        local scale = titleData.effectScale * jmpDrawer_Role.transform.localScale.x;
        bodyEffect = EffectLight.New(titleData.effectId, titleData.effectInterval, titleData.effectStartFrame, titleData.effectEndFrame, titleData.effectTotalFrame, EEffectLightTracer.Child, 0, 0, 32);
        bodyEffect.rectTransform:SetParent(jmpDrawer_Role.transform.parent);
        bodyEffect.rectTransform.localPosition = Vector3.New(-bodyEffect.width * 0.5 * scale, bodyEffect.height * scale + titleData.effectOffset * jmpDrawer_Role.transform.localScale.x - 15);
        bodyEffect.rectTransform.localScale = Vector3.one * scale;
      end
    end

    for i = 1, Role.maxEquip do
      if detailInfo.equips[i] ~= nil then
        item_Equips[i]:SetItem(detailInfo.equips[i].Id, 1, detailInfo.equips[i]);
      else
        item_Equips[i]:SetItem(0);
      end
    end
  else
    image_Mask:CrossFadeAlpha(0, 0, true);
    image_InfoBG.gameObject:SetActive(false);
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

  currentPlayerInfo = playerInfo;

  image_FunctionBG.rectTransform.anchoredPosition = position;

  event_Info.gameObject:SetActive(detailInfo == nil);

  event_Whisper.gameObject:SetActive(not Social.IsBlack(currentPlayerInfo.roleId));

  --friend
  event_AddFriend.gameObject:SetActive(false);
  event_RemoveFriend.gameObject:SetActive(false);

  if Social.IsFriend(currentPlayerInfo.roleId) then
    event_RemoveFriend.gameObject:SetActive(true);
  else
    event_AddFriend.gameObject:SetActive(true);
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
  end

  --black
  event_AddBlack.gameObject:SetActive(false);
  event_RemoveBlack.gameObject:SetActive(false);

  if Social.IsBlack(currentPlayerInfo.roleId) then
    event_RemoveBlack.gameObject:SetActive(true);
  else
    event_AddBlack.gameObject:SetActive(true);
  end

  --org
  event_OrgCheif.gameObject:SetActive(false);
  event_OrgSubCheif.gameObject:SetActive(false);
  event_OrgMember.gameObject:SetActive(false);
  event_OrgKick.gameObject:SetActive(false);

  if orgFunction == true then
    if Organization.IsChief(Role.playerId) then
      if Organization.IsSubChief(currentPlayerInfo.roleId) then
        event_OrgCheif.gameObject:SetActive(true);
        event_OrgMember.gameObject:SetActive(true);
      else
        event_OrgSubCheif.gameObject:SetActive(true);
        event_OrgKick.gameObject:SetActive(true);
      end
    elseif Organization.IsSubChief(Role.playerId) then
      if not Organization.IsChief(currentPlayerInfo.roleId) and not Organization.IsSubChief(currentPlayerInfo.roleId) then
        event_OrgKick.gameObject:SetActive(true);
      end
    end
  end

  isDirty = 0;

  --贈禮版
  event_GoSendGift.gameObject:SetActive(HouseBoard.FeatureIsOpen() and Social.IsFriend(currentPlayerInfo.roleId) and not Social.IsBlack(currentPlayerInfo.roleId) and Social.CheckTurnStatus(currentPlayerInfo.level, currentPlayerInfo.turn));
  --進入小屋
  local id = Function.FindId(EFunction.House, 3);

  if currentPlayerInfo.turn ~= nil and Function.CheckShow(id) then
    event_GoToHouse.gameObject:SetActive(not Social.IsBlack(currentPlayerInfo.roleId) and Social.CheckTurnStatus(currentPlayerInfo.level, currentPlayerInfo.turn));
    image_RedDot.gameObject:SetActive(Social.CheckVisitedFriendRedDot(currentPlayerInfo));
  else
    event_GoToHouse.gameObject:SetActive(false);
  end

  return true;
end

function UISocialFunction.OnClose()
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
  jmpDrawer_Role:Disable();

  if bodyEffect ~= nil then
    bodyEffect:Stop();
  end

  return true;
end

function UISocialFunction.Update()
  if isDirty < 2 then
    isDirty = isDirty + 1;

    if isDirty == 2 then
      image_FunctionBG:SetLayoutDirty();
      image_FunctionBG.rectTransform.anchoredPosition = Vector2.New(image_FunctionBG.rectTransform.anchoredPosition.x, math.max(image_FunctionBG.rectTransform.anchoredPosition.y, image_FunctionBG.rectTransform.sizeDelta.y - UI.height * 0.5));
    end
  end
end

function UISocialFunction.OnClick_Close()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  UI.Close(UISocialFunction);
end

function UISocialFunction.OnClick_Info()
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
  UI.Close(UISocialFunction);
  
  --C:014-009 <查詢玩家資訊> +玩家ID(8) +L(1) +名字(L)
  sendBuffer:Clear();
  sendBuffer:WriteInt64(currentPlayerInfo.roleId);
  sendBuffer:WriteByte(0);
  Network.Send(14, 9, sendBuffer);
end

function UISocialFunction.OnClick_Whisper()
  UI.Close(UISocialFunction);
  UI.CloseAllPreviousUI();

  UINewChat.ChangeChannel(EChannel.Whisper, currentPlayerInfo.name);
end

function UISocialFunction.OnClick_AddFriend()
  UI.Close(UISocialFunction);

  Social.Invite(currentPlayerInfo.roleId, currentPlayerInfo.name);
end

function UISocialFunction.OnClick_RemoveFriend()
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
  if Social.friends[currentPlayerInfo.roleId] == nil then
    ShowCenterMessage("Player Not Friend !!");
    return;
  end

  UI.Close(UISocialFunction);
  
  ShowCheckMessage(
    function(result)
      if result then
        --C:014-004 <刪除好友> +玩家ID(8)
        sendBuffer:Clear()
        sendBuffer:WriteInt64(currentPlayerInfo.roleId);
        Network.Send(14, 4, sendBuffer);
      end
    end,
    string.Get(20505)
  );
end

function UISocialFunction.OnClick_AddBlack()
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
  
  UI.Close(UISocialFunction);

  Social.AddBlack(currentPlayerInfo.roleId, currentPlayerInfo.name);
end

function UISocialFunction.OnClick_RemoveBlack()
  UI.Close(UISocialFunction);

  Social.RemoveBlack(currentPlayerInfo.roleId);
end

function UISocialFunction.OnClick_OrgCheif()
  UI.Close(UISocialFunction);

  local memberInfo = Organization.members[currentPlayerInfo.roleId];

  if memberInfo == nil then return end

  if not memberInfo.online then
    ShowCenterMessage(string.Get(40172), 2);
    return;
  end

  ShowCheckMessage(
    function(result)
      if result then
        --C:039-012 <團長讓位> +玩家ID(8)
        sendBuffer:Clear();
        sendBuffer:WriteInt64(currentPlayerInfo.roleId);
        Network.Send(39, 12, sendBuffer);
      end
    end,
    string.Concat(string.Get(40201), memberInfo.name, string.Get(40202)),
    Role.player
  );
end

function UISocialFunction.OnClick_OrgSubCheif()
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
  UI.Close(UISocialFunction);
  
  local memberInfo = Organization.members[currentPlayerInfo.roleId];

  if memberInfo == nil then return end

  if not memberInfo.online then
    ShowCenterMessage(string.Get(40172), 2);
    return;
  end
  
  local haveSlot = false;
  for i = 2, Organization.maxSubChief + 1 do
    if Organization.chiefs[i] == 0 then
      haveSlot = true;
      break;
    end
  end

  if not haveSlot then
    ShowCenterMessage(string.Get(20800), 2);
    return;
  end

  ShowCheckMessage(
    function(result)
      if result then
        --C:039-010 <設定副團長> +玩家ID(8)
        sendBuffer:Clear();
        sendBuffer:WriteInt64(currentPlayerInfo.roleId);
        Network.Send(39, 10, sendBuffer);
      end
    end,
    string.Concat(string.Get(40203), memberInfo.name, string.Get(40204)),
    Role.player
  );
end

function UISocialFunction.OnClick_OrgMember()
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
  
  UI.Close(UISocialFunction);
  
  local memberInfo = Organization.members[currentPlayerInfo.roleId];

  if memberInfo == nil then return end

  ShowCheckMessage(
    function(result)
      if result then
        --C:039-011 <解除副團長> +玩家ID(8)
        sendBuffer:Clear();
        sendBuffer:WriteInt64(currentPlayerInfo.roleId);
        Network.Send(39, 11, sendBuffer);
      end
    end,
    string.Get(40174),
    Role.player
  );
end

function UISocialFunction.OnClick_OrgKick()
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
  
  UI.Close(UISocialFunction);
  
  local memberInfo = Organization.members[currentPlayerInfo.roleId];

  if memberInfo == nil then return end

  ShowCheckMessage(
    function(result)
      if result then
        --C:039-007 <踢出軍團> +玩家ID(8)
        sendBuffer:Clear();
        sendBuffer:WriteInt64(currentPlayerInfo.roleId);
        Network.Send(39, 7, sendBuffer);
      end
    end,
    string.Get(40173),
    Role.player
  );
end

function UISocialFunction.OnClick_GoSendGift()
  HouseBoard.SendOpenBoardRequest(currentPlayerInfo.roleId, currentPlayerInfo);
end

function UISocialFunction.OnClick_GoToHouse()
  if FightField.isInBattle then return end;
  HouseManager.SendEnterHouse(currentPlayerInfo.roleId, EHouseBuilding.FirstBuilding, EHouseFloor.FirstFloor);
  UI.Close(UISocial);
end
