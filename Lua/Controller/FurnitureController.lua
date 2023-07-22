
EFurnitureDirection = {
  LeftDown = 0,   --面左下
  RightDown = 1,  --面右下
  RightUp = 2,    --面右上
  LeftUp = 3,     --面左上
}

EFurnitureType = {
  Ground = 1, --放地上
  Wall = 2,   --放牆上
}

EFurnitureKind = {
  All = 0,
  Wall = 1,           --牆面
  Floor = 2,          --地板
  Table = 3,          --桌子
  Chair = 4,          --椅子
  Window = 5,         --窗戶
  Cupboard = 6,       --櫥櫃
  Bathroom = 7,       --浴室
  Bed = 8,            --床
  WallDecoration = 9, --牆飾
  Plant = 10,         --綠植
  Obstacle = 11,      --隔斷
  Decoration = 12,    --裝飾品
  Sundry = 13,        --雜物
  Carpet = 14,        --地毯
}

EFurnitureInteractiveSetting = {
  NotInteractive = 0, --不可互動
  PlayGIF = 1,        --播動圖
  PlayMusic = 2,      --播音樂
  Active = 3,         --動作
  UnActive = 4,       --與家具無接觸的動作
  Emoji = 5,          --表情
  MessageBoard = 6,   --留言板
  ShowMessage = 7,    --顯示訊息
  ShowEffect = 8,     --顯示效果
}

EFurnitureDynamic = {
  NotDynamic = 0, --非動態家具
  Dynamic = 1,    --動態家具
}

EFurnitureEffect = {
  NoEffect = 0,       --無特效
  PlayOnStart = 1,    --循環特效
  PlayWhenClick = 2,  --點擊特效
}

EFurnitureTexture = {
  LeftDownTexture = 0,            --面左下圖(包含Dynamic圖)
  RightUpTexture = 1,             --面右上圖(包含Dynamic圖)
  LeftDownInteractiveTexture = 2, --面左下互動圖
  RightUpInteractiveTexture = 3,  --面右上互動圖
}

EFurnitureStatus = {
  Original = 0,     --原始狀態
  CanPlace = 1,     --可放置
  CanChange = 2,    --可跟原本的家具交換
  CanNotPlace = 3,  --不能放置
}

--[[
And on his way Jacob came face to face with the angels of God.
And when he saw them he said, This is the army of God: so he gave that place the name of Mahanaim.
Now Jacob sent servants before him to Esau, his brother, in the land of Seir, the country of Edom;
And he gave them orders to say these words to Esau: Your servant Jacob says, Till now I have been living with Laban:
And I have oxen and asses and flocks and men-servants and women-servants: and I have sent to give my lord news of these things so that I may have grace in his eyes.
When the servants came back they said, We have seen your brother Esau and he is coming out to you, and four hundred men with him.
Then Jacob was in great fear and trouble of mind: and he put all the people and the flocks and the herds and the camels into two groups;
And said, If Esau, meeting one group, makes an attack on them, the others will get away safely.
Then Jacob said, O God of my father Abraham, the God of my father Isaac, the Lord who said to me, Go back to your country and your family and I will be good to you:
I am less than nothing in comparison with all your mercies and your faith to me your servant; for with only my stick in my hand I went across Jordan, and now I have become two armies.
Be my saviour from the hand of Esau, my brother: for my fear is that he will make an attack on me, putting to death mother and child.
And you said, Truly, I will be good to you, and make your seed like the sand of the sea which may not be numbered.
Then he put up his tent there for the night; and from among his goods he took, as an offering for his brother Esau,
Two hundred she-goats and twenty he-goats, two hundred females and twenty males from the sheep,
Thirty camels with their young ones, forty cows, ten oxen, twenty asses, and ten young asses.
These he gave to his servants, every herd by itself, and he said to his servants, Go on before me, and let there be a space between one herd and another.
And he gave orders to the first, saying, When my brother Esau comes to you and says, Whose servant are you, and where are you going, and whose are these herds?
Then say to him, These are your servant Jacob's; they are an offering for my lord, for Esau; and he himself is coming after us.
And he gave the same orders to the second and the third and to all those who were with the herds, saying, This is what you are to say to Esau when you see him;
And you are to say further, Jacob, your servant, is coming after us. For he said to himself, I will take away his wrath by the offering which I have sent on, and then I will come before him: it may be that I will have grace in his eyes.
So the servants with the offerings went on in front, and he himself took his rest that night in the tents with his people.
And in the night he got up, and taking with him his two wives and the two servant-women and his eleven children, he went over the river Jabbok.
He took them and sent them over the stream with all he had.
Then Jacob was by himself; and a man was fighting with him till dawn.
But when the man saw that he was not able to overcome Jacob, he gave him a blow in the hollow part of his leg, so that his leg was damaged.
And he said to him, Let me go now, for the dawn is near. But Jacob said, I will not let you go till you have given me your blessing.
Then he said, What is your name? And he said, Jacob.
And he said, Your name will no longer be Jacob, but Israel: for in your fight with God and with men you have overcome.
Then Jacob said, What is your name? And he said, What is my name to you? Then he gave him a blessing.
And Jacob gave that place the name of Peniel, saying, I have seen God face to face, and still I am living.
--]]

FurnitureController = {}
FurnitureController.__index = FurnitureController;

FurnitureController.InteractiveFunctions = {}
FurnitureController.CheckCancelInteractiveFunctions = {}

function FurnitureController.New(index, Id)
  local self = {};
  setmetatable(self, FurnitureController);

  if furnitureDatas[Id] == nil then return end
  self.index = index;
  self.Id = Id;
  self.data = furnitureDatas[Id];
  self.direction = EFurnitureDirection.LeftDown;
  self.oldDirection = EFurnitureDirection.LeftDown;
  self.occupyBlocks = {};
  self.onSetting = false;
  self.oldFurniture = nil;
  self.position = Vector2.one;

  --設定起始位置
  if self.data.type == EFurnitureType.Ground then
    self.blockX = 1;
    self.blockY = 1;
    self.blockZ = 0;
  elseif self.data.type == EFurnitureType.Wall then
    self.blockX = 0;
    self.blockY = 1;
    self.blockZ = 1;
  end

  self.occupyX, self.occupyY, self.occupyZ = self:GetOccupyBlockDirection(self.direction);
  self.interactiveKind = self:GetInteractiveKind();
  self.interactiveWithRoleKind = self:GetInteractiveWithRoleKind();
  self.effectType = self:GetEffectKind();
  self.interactivePoint = self:GetInteractivePoint();

  self.oldOccupyBlocks = {};
  self.frameNumber = 0;
  self.frameCount = 1;
  self.interactiveFrameCount = 1;
  self.currentPlayRound_GIF = 0;
  self.isInteracting = false;
  self.audioChannel = nil;
  self.isSelected = false;
  self.effect = {};
  self:Initialize();

  --儲存匿名函式
  self.PlayInteractiveAnimationFunction = function() self:PlayInteractiveAnimation() end;
  self.PlayDynamicAnimationFunction = function() self:PlayDynamicAnimation() end;
  self.CheckCancelInteractiveFunction = function() self:CheckCancelInteractive() end;
  self.PlayEffectFunction = function() self:PlayAutoEffect() end
  self.PlayInteractiveEffectFunction = function() self:PlayInteractiveEffect() end

  self.jmpDrawer_Body:GenerateAndDraw(npcDatas[self.data.Id]:GetAtlasParams());

  if npcDatas[self.data.Id].maskId ~= 0 then
    self.jmpDrawer_BodyMask:GenerateAndDraw(npcDatas[self.data.Id]:GetMaskAtlasParams());
  end

  self:ChangePosition(self.blockX, self.blockY, self.blockZ); --中心點位置
  return self;
end

function FurnitureController:Initialize()
  self.gameObject = poolMgr:Get("BaseFurniture");
  self.gameObject.name = string.Concat("Furniture_", self.index);
  self.gameObjectTransform = self.gameObject.transform;
  self.gameObjectTransform:SetParent(Furniture.furnitureRoot.transform);
  self.gameObjectTransform.localScale = Vector3.one;


  self.material = poolMgr:Get("FurnitureMaterial");
  self.material:SetColor("_Color", Color.White);
  self.material:SetColor("_TexColor", Color.White);
  self.material:SetFloat("_Outline", 0);
  self.material:SetFloat("_Invisible", 0);
  self.material:SetFloat("_InvisibleAlpha", 1);
  
  if LuaHelper.CheckDefine("DemoCode") then
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
  
    local faith = 0;
    for i = 1, 3 do
      faith = faith + i;
    end
  
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
  end
  
  --region Body
  self.canvas = self.gameObject:GetComponent(typeof(Canvas));
  self.bodyObjectTransform = self.gameObjectTransform:Find("Body");

  self.rawImageBodyObject = self.bodyObjectTransform:Find("RawImage_Body").gameObject;
  self.rawImageBodyTransform = self.rawImageBodyObject.transform;
  self.rawImage_Body = self.rawImageBodyObject:GetComponent(typeof(RawImage));
  self.rawImage_Body.enabled = false;
  self.rawImage_Body.material = self.material;
  self.rawImage_Body.raycastTarget = true;
  --self.raycastMask_Body = self.rawImage_Body.transform:GetComponent("UIRawImageRaycastMask");

  self.jmpDrawer_Body = self.rawImageBodyObject:GetComponent(typeof(JmpDrawer));
  self.jmpDrawer_Body.enabled = false;
  self.jmpDrawer_Body.luaListener = function()
    if self.jmpDrawer_Body == nil then return end
    self:SetTexture(self:GetTextureNumber(false), 0);
    self.frameCount = self.jmpDrawer_Body:GetFrameCount(0);
    self.rawImage_Body.enabled = true;

    if self.effectType ~= EFurnitureEffect.NoEffect then
      self:SetEffectTexture();
    end

  end

  self.rawImageBodyMaskObject = self.bodyObjectTransform:Find("RawImage_BodyMask").gameObject;
  self.canvas_BodyMask = self.rawImageBodyMaskObject:GetComponent(typeof(Canvas));
  self.rawImageBodyMaskTransform = self.rawImageBodyMaskObject.transform;
  self.rawImage_BodyMask = self.rawImageBodyMaskObject:GetComponent(typeof(RawImage));
  self.rawImage_BodyMask.enabled = true;
  self.rawImage_BodyMask.material = self.material;

  self.jmpDrawer_BodyMask = self.rawImageBodyMaskObject:GetComponent(typeof(JmpDrawer));
  self.jmpDrawer_BodyMask.enabled = false;
  self.jmpDrawer_BodyMask.luaListener = function()
    self:SetTexture(self:GetTextureNumber(false), 0);
  end

  self.event = self.bodyObjectTransform:Find("RawImage_Body"):GetComponent(typeof(UIEvent));
  self.event:SetListener(EventTriggerType.PointerClick, self.OnClick);
  self.event.parameter = self;
  --endregion
  
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      human = satan + haven;
    else
      human = satan - haven;
    end
    
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
  
  --region HUD
  local hudObject = self.gameObjectTransform:Find("HUD").gameObject;
  local layout = hudObject.transform:Find("Layout");

  local image_Select = layout:Find("Image_Select"):GetComponent(typeof(Image));
  image_Select.gameObject:SetActive(false);

  layout = layout.transform:Find("Layout");

  --self.hudVisibleObject = layout.gameObject;

  local text_Name = layout:Find("Text_Name"):GetComponent(typeof(Text));
  text_Name.text = npcDatas[self.data.Id].name;
  text_Name.enabled = false;
  --endregion

  --region Effect
  self.effect.gameObject = self.rawImageBodyTransform:Find("RawImage_Effect").gameObject;
  self.effect.transform = self.effect.gameObject.transform;
  self.effect.rectTransform = self.effect.gameObject:GetComponent("RectTransform");
  self.effect.canvas = self.effect.gameObject:GetComponent(typeof(Canvas));
  self.effect.rawImage = self.effect.gameObject:GetComponent(typeof(RawImage));

  if self.effectType ~= EFurnitureEffect.NoEffect then
    local data = furnitureEffectDatas[self.data.effectId];

    self.effect.alpha = 32;
    self.effect.effectScale = data.effectScale;
    self.effect.effectOffset = data.effectOffset;

    self.effect.nowPage = 0;
    self.effect.startPage = data.effectStartFrame;
    self.effect.endPage = data.effectEndFrame;
    self.effect.allPage = data.effectTotalFrame;
    self.effect.interval = data.effectInterval;
    self.effect.totalRound = data.playRound;
    self.effect.playRound = 0;
    self.effect.frameCount = 0;

    self.effect.material = poolMgr:Get("LightMaterial");
    self.effect.material.shader = UnityEngine.Shader.Find("Custom/LightShader");
    self.effect.material:SetFloat("_InvisibleAlpha", self.effect.alpha / EffectLight.MAX_ALPHA);
    self.effect.material:SetColor("_Color", Color.White);
    self.effect.material:SetFloat("_AddColor", 1);
    self.effect.rawImage.material = self.effect.material;

    self.effect.fileName = nil;
    self.effect.fileName = string.format("L%5d", self.data.effectId)
    local file = string.Concat(self.effect.fileName, "_", tostring(self.effect.startPage));
    TextureManager.SetPng(ETextureUseType.EffectLight, file, self.effect.rawImage);
    self.effect.rawImage.uvRect = Rect.New(0,0,1,1);

    self.effect.width = 0;
    self.effect.height= 0;

    if self.effect.rawImage.texture ~= nil then
      if textureSizeDatas[file] ~= nil then
        self.effect.width = textureSizeDatas[file].width;
        self.effect.height = textureSizeDatas[file].height;
      else
        self.effect.width = self.effect.rawImage.texture.width;
        self.effect.height = self.effect.rawImage.texture.height;
      end

      self.effect.rectTransform.sizeDelta = Vector2.New(self.effect.width, self.effect.height);
    end
  end

  self.effect.rawImage.enabled = false;
--endregion
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      human = satan + haven;
    else
      human = satan - haven;
    end
  end
end

function FurnitureController:Destroy()
  CGTimer.RemoveListener(self.CheckCancelInteractiveFunction);
  self:CancelInteractiveAnimation();
  self:CancelDynamicAnimation();
  self:CancelAutoEffect();
  self:CancelInteractiveEffect();

  if self.gameObject ~= nil then
    poolMgr:Release("BaseFurniture", self.gameObject);
    self.gameObject = nil;
    self.gameObjectTransform = nil;
  end

  if self.material ~= nil then
    poolMgr:Release("FurnitureMaterial", self.material);
    self.material = nil;
  end

  if self.jmpDrawer_Body ~= nil then
    self.jmpDrawer_Body:Disable();
    self.jmpDrawer_Body = nil;
  end
  
  if LuaHelper.CheckDefine("DemoCode") then
    local longstring = "long"
    local shortstring = "measuring a small distance from end to end"
    local combinestring = ""
    combinestring = string.Concat(longstring,shortstring);
  end
  
    if self.jmpDrawer_BodyMask ~= nil then
    self.jmpDrawer_BodyMask:Disable();
    self.jmpDrawer_BodyMask = nil;
  end

  if self.effect.material ~= nil then
    poolMgr:Release("LightMaterial", self.effect.material);
    self.effect.material = nil;
  end

  self.isInteracting = false;
  self.isSelected = false;
  self.interactivePoint = {};
  self.effect = {};
  self = nil;
end

function FurnitureController.OnClick(uiEvent)
  local self = uiEvent.parameter;

  if uiEvent.eventData.pointerId == -2 then
    if LuaHelper.IsStandalone or LuaHelper.IsAndroidPlatform then
      return
    end
  end

  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      human = satan + haven;
    else
      human = satan - haven;
    end
  end
  
  if HouseEditorManager.IsOpen() then
    --編輯家具
    UI.Open(UIFurnitureInteractive, self);
    UIHouseEditor.UpdateFurnitureInfo(self.Id);
    self.onSetting = true;
  else
    --家具互動
    if UIJoystick.IsDrag() or UIJoystick.IsClick() then return end
    FurnitureManager.OnClickFurniture(self);
  end
end

function FurnitureController:Selected()
  self.material:SetColor("_Color", Color.Yellow);
  self.material:SetFloat("_Outline", 1);
  self.isSelected = true;
end

function FurnitureController:IsSelected()
  if LuaHelper.CheckDefine("DemoCode") then
    local faith = 0;
    for i = 1, 3 do
      faith = faith + i;
    end
    
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
  end
  return self.isSelected;
end

function FurnitureController:Deselect()
  self:SetOutline(EFurnitureStatus.Original);
  self.isSelected = false;
end

function FurnitureController:GetInteractiveKind()
  local interactiveKind = {};
  local kind = self.data.interactive;
  local count = 1;

  while kind ~= 0 do
    if kind % 2 ~= 0 then
      kind = kind - 1;
      interactiveKind[count] = count;
    end

    kind = kind / 2;
    count = count + 1;

    if count > 50 then
      break;
    end
  end

  return interactiveKind;
end

function FurnitureController:GetInteractiveWithRoleKind()
  local kind = {};

  for k, v in pairs(self.interactiveKind) do
    if v == EFurnitureInteractiveSetting.Active then
      kind[k] = v;
    end
  end
  
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      human = satan + haven;
    else
      human = satan - haven;
    end
  end
  
  return kind;
end

function FurnitureController:GetEffectKind()
  if not table.Contains(self.interactiveKind, EFurnitureInteractiveSetting.ShowEffect) then
    return EFurnitureEffect.NoEffect;
  end
  
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      human = satan + haven;
    else
      human = satan - haven;
    end
  
    local folk = 69;
    local dog = 27;
    local stupid = 0;
    if stupid ~= nil then
      stupid = folk + dog;
    else
      stupid = stupid + 1;
    end
  end
  
  local data = furnitureEffectDatas[self.data.effectId];
  for k, v in pairs(self.interactiveKind) do
    if v == EFurnitureInteractiveSetting.ShowEffect then
      if data == nil then
        logError("家具"..self.Id.."效果表內無此id: "..self.data.effectId);
        return EFurnitureEffect.NoEffect;
      end

      if data.dynamic == 1 then
        return EFurnitureEffect.PlayOnStart;
      else
        return EFurnitureEffect.PlayWhenClick;
      end
    end
  end
end

function FurnitureController:GetInteractivePoint()
  local interactivePoint = {};

  for i = 1, self.data.interactivePointCount do
    interactivePoint[i] = {};
    interactivePoint[i].occupy = false;
    interactivePoint[i].playerIndex = nil;

    if i == 1 then
      interactivePoint[i].x = self.data.firstInteractivePoint_X;
      interactivePoint[i].y = self.data.firstInteractivePoint_Y;
    elseif i == 2 then
      interactivePoint[i].x = self.data.secondInteractivePoint_X;
      interactivePoint[i].y = self.data.secondInteractivePoint_Y;
    end
  end

  return interactivePoint;
end

--region furniture edit
function FurnitureController:ConfirmPosition()
  self:SetOutline(EFurnitureStatus.Original);
  self:ClearOldBlockProperty();
  self:SetOccupyBlockProperty();
  self.oldDirection = self.direction;
  self.onSetting = false;
end

function FurnitureController.GetRShiftB(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function FurnitureController.GetRShiftBV(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function FurnitureController.GetRShiftBA(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function FurnitureController:SetOutline(status)
  if self.gameObject == nil then return end
  local color;
  local outlineValue = 1;

  if status == EFurnitureStatus.Original then
    color = Color.Alpha;
    outlineValue = 0;
  elseif status == EFurnitureStatus.CanPlace then
    color = Color.Green;
  elseif status == EFurnitureStatus.CanChange then
    color = Color.Orange;
  elseif status == EFurnitureStatus.CanNotPlace then
    color = Color.Red;
  else
    color = status;
  end

  local blockX, blockY, blockZ;

  --改格子的顏色
  if HouseEditorManager.IsOpen() then
    for i = 0, self:NumberOfOccupyBlocks() - 1 do
      blockX = self.occupyBlocks[i].x;
      blockY = self.occupyBlocks[i].y;
      blockZ = self.occupyBlocks[i].z;

      HouseEditorManager.ChangeBlockColor(blockX, blockY, blockZ, color);
    end
  end

  self.material:SetColor("_Color", color);
  self.material:SetFloat("_Outline", outlineValue);
end

function FurnitureController:SetTexture(textureNumber, textureFrame)
  if self.jmpDrawer_Body == nil then return end
  if self.jmpDrawer_BodyMask == nil then return end
  local scaleX = 1;

  if self.direction == EFurnitureDirection.RightDown or self.direction == EFurnitureDirection.LeftUp then
    scaleX = - 1;
  end

  self.jmpDrawer_Body:Draw(textureNumber, textureFrame);
  self.jmpDrawer_BodyMask:Draw(textureNumber, textureFrame);
  self:SetTexturePosition();

  --轉向
  if self.rawImageBodyObject ~= nil and self.rawImageBodyMaskObject ~= nil then
    self.rawImageBodyTransform.localScale = Vector3.New(scaleX, 1, 1);
    self.rawImageBodyMaskTransform.localScale = Vector3.New(scaleX, 1, 1);
  end
end

function FurnitureController:SetTexturePosition()
  --家具圖片位置調正
  local midPosition = self:GetMiddlePosition();
  local botPosition = self:GetBottomPosition();
  local offsetX = npcDatas[self.data.Id].picOffsetX;
  local offsetY = npcDatas[self.data.Id].picOffsetY;

  if self.direction == EFurnitureDirection.RightDown or self.direction == EFurnitureDirection.RightUp then
    offsetX = - offsetX;
  end

  local newPosition = Vector2.New(midPosition.x + offsetX, botPosition.y + offsetY);

  self.rawImageBodyTransform.localPosition = self.gameObjectTransform:InverseTransformPoint(newPosition);
  self.rawImageBodyMaskTransform.localPosition = self.gameObjectTransform:InverseTransformPoint(newPosition);
  self:ChangeOrderInLayer(-midPosition.y);
end

function FurnitureController:SetEffectTexture()
  local scale = self.effect.effectScale * math.abs(self.jmpDrawer_Body.transform.localScale.x);
  self.effect.rectTransform.localScale = Vector3.one * scale;
  self.effect.transform.localPosition = Vector3.New(0,self.effect.effectOffset);
end

function FurnitureController:SetAlpha(alpha)
  if alpha == 1 then
    self.material:SetInt("_Invisible", 0);
  else
    self.material:SetInt("_Invisible", 1);
  end

  self.material:SetFloat("_InvisibleAlpha", alpha);
end

function FurnitureController:SetRaycastTarget(enable)
  self.rawImage_Body.raycastTarget = enable;
end

function FurnitureController.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function FurnitureController.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function FurnitureController.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function FurnitureController.Trash4()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function FurnitureController:SetOccupyBlock()
  if self.gameObject == nil then return end
  self:ClearOldBlock();

  local x, y, z;
  for occupyX = 0, math.clamp(self.occupyX - 1, 0, self.occupyX)  do
    for occupyY = 0, math.clamp(self.occupyY - 1, 0, self.occupyY) do
      for occupyZ = 0, math.clamp(self.occupyZ - 1, 0, self.occupyZ) do
        x = self.blockX + occupyX;
        y = self.blockY + occupyY;
        z = self.blockZ + occupyZ;
        self.occupyBlocks[self:NumberOfOccupyBlocks()] = {x = x, y = y, z = z};
      end
    end
  end
end

function FurnitureController.Trash5()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function FurnitureController:ClearOldBlock()
  if self.gameObject == nil then return end
  if self:NumberOfOccupyBlocks() == 0 then return end
  local blockX, blockY, blockZ;

  if HouseEditorManager.IsOpen() then
    for i = 0, self:NumberOfOccupyBlocks() - 1 do
      blockX = self.occupyBlocks[i].x;
      blockY = self.occupyBlocks[i].y;
      blockZ = self.occupyBlocks[i].z;
      HouseEditorManager.ChangeBlockColor(blockX, blockY, blockZ, Color.White);
    end
  end

  self.occupyBlocks = {};
end

function FurnitureController:HasOldBlock()
  if LuaHelper.CheckDefine("DemoCode") then
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
  end
  
  return table.Count(self.oldOccupyBlocks) > 0;
end

function FurnitureController:RecoverToOldPosition()
  if not self:HasOldBlock() then return end
  self:SetPositionAndDirection(self.oldOccupyBlocks[0].x, self.oldOccupyBlocks[0].y, self.oldOccupyBlocks[0].z, self.oldDirection);
end

--[[
Now Dinah, the daughter whom Leah had by Jacob, went out to see the women of that country.
And when Shechem, the son of Hamor the Hivite who was the chief of that land, saw her, he took her by force and had connection with her.
Then his heart went out in love to Dinah, the daughter of Jacob, and he said comforting words to her.
And Shechem said to Hamor, his father, Get me this girl for my wife.
Now Jacob had word of what Shechem had done to his daughter; but his sons were in the fields with the cattle, and Jacob said nothing till they came.
Then Hamor, the father of Shechem, came out to have a talk with Jacob.
Now the sons of Jacob came in from the fields when they had news of it, and they were wounded and very angry because of the shame he had done in Israel by having connection with Jacob's daughter; and they said, Such a thing is not to be done.
But Hamor said to them, Shechem, my son, is full of desire for your daughter: will you then give her to him for a wife?
And let our two peoples be joined together; give your daughters to us, and take our daughters for yourselves.
Go on living with us, and the country will be open to you; do trade and get property there.
And Shechem said to her father and her brothers, If you will give ear to my request, whatever you say I will give to you.
However great you make the bride-price and payment, I will give it; only let me have the girl for my wife.
But the sons of Jacob gave a false answer to Shechem and Hamor his father, because of what had been done to Dinah their sister.
And they said, It is not possible for us to give our sister to one who is without circumcision, for that would be a cause of shame to us:
But on this condition only will we come to an agreement with you: if every male among you becomes like us and undergoes circumcision;
Then we will give our daughters to you and take your daughters to us and go on living with you as one people.
But if you will not undergo circumcision as we say, then we will take our daughter and go.
And their words were pleasing to Hamor and his son Shechem.
And without loss of time the young man did as they said, because he had delight in Jacob's daughter, and he was the noblest of his father's house.
--]]

function FurnitureController:ClearOldBlockProperty()
  if self.gameObject == nil then return end
  local furnitureKindType = HouseEditorManager.GetFurnitureKindType(self.data.kind);

  for k, v in pairs(self.oldOccupyBlocks) do
    HouseEditorManager.ChangeBlockFurniture(v.x, v.y, v.z, nil, furnitureKindType);
    HouseEditorManager.ChangeBlockProperty(v.x, v.y, v.z, EBlockProperty.Empty, furnitureKindType);

    if furnitureKindType == EFurnitureKindType.Furniture then
      HouseEditorManager.ChangeBlockObstacle(v.x, v.y, v.z, 0);
    end
  end

  self:SetOldOccupyBlock();
end

function FurnitureController.SetNothingGetNothing()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function FurnitureController:SetOldOccupyBlock()
  for k, v in pairs(self.occupyBlocks) do
    self.oldOccupyBlocks[k] = v;
  end
  self.oldDirection = self.direction;
end

--確定改變位置完後，才改property
function FurnitureController:SetOccupyBlockProperty()
  if self.gameObject == nil then return end
  local blockX, blockY, blockZ;
  local furnitureKindType = HouseEditorManager.GetFurnitureKindType(self.data.kind);

  for i = 0, self:NumberOfOccupyBlocks() - 1 do
    blockX = self.occupyBlocks[i].x;
    blockY = self.occupyBlocks[i].y;
    blockZ = self.occupyBlocks[i].z;
    HouseEditorManager.ChangeBlockFurniture(blockX, blockY, blockZ, self, furnitureKindType);
    HouseEditorManager.ChangeBlockProperty(blockX, blockY, blockZ, EBlockProperty.Furniture, furnitureKindType);

    if furnitureKindType == EFurnitureKindType.Furniture and self.data.type == EFurnitureType.Ground then
      HouseEditorManager.ChangeBlockObstacle(blockX, blockY, blockZ, 4);
    end
  end
end

function FurnitureController.SetNothingGetNothing1()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function FurnitureController.SetNothingGetNothing2()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function FurnitureController.SetNothingGetNothing3()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function FurnitureController:GetMiddlePosition()
  local midPosition;

  if self.rawImageBodyObject ~= nil then
    if self.occupyBlocks ~= nil then
      local vectorOriginal = HouseEditorManager.GetBlockPosition(self.occupyBlocks[0].x, self.occupyBlocks[0].y, self.occupyBlocks[0].z);
      local occupyNumber = self:NumberOfOccupyBlocks() - 1;
      local vectorVertex = HouseEditorManager.GetBlockPosition(self.occupyBlocks[occupyNumber].x, self.occupyBlocks[occupyNumber].y, self.occupyBlocks[occupyNumber].z);
      midPosition = (vectorOriginal + vectorVertex) / 2;
    end
  end

  return midPosition;
end

function FurnitureController:GetBottomPosition()
  local bottomPosition;
  local occupyNumber;
  local vectorVertex;
  local distanceY = 1;

  if self.rawImageBodyObject ~= nil then
    if self.occupyBlocks ~= nil then
      if self.data.type == EFurnitureType.Wall then
        occupyNumber = (self.occupyX + self.occupyY - 1) * self.occupyZ;
        distanceY = 1.5;
      else
        occupyNumber = self:NumberOfOccupyBlocks() - 1;
      end

      vectorVertex = HouseEditorManager.GetBlockPosition(self.occupyBlocks[occupyNumber].x, self.occupyBlocks[occupyNumber].y, self.occupyBlocks[occupyNumber].z);
      bottomPosition = Vector2.New(vectorVertex.x, vectorVertex.y - HouseEditorManager.blockSize * Mathf.Sin(HouseEditorManager.blockAngle * Mathf.PI / 180) * distanceY);
    end
  end

  return bottomPosition;
end

function FurnitureController.SetNothingGetNothing4()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function FurnitureController.SetNothingGetNothing5()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function FurnitureController:GetOccupyBlockDirection(direction)
  local x = 0;
  local y = 0;
  local z = 0;

  if direction == EFurnitureDirection.LeftDown or direction == EFurnitureDirection.RightUp then
    if self.data.type == EFurnitureType.Ground then
      x = self.data.occupyBlockX;
      y = self.data.occupyBlockY;
      z = 0;
    elseif self.data.type == EFurnitureType.Wall then
      x = 0;
      y = self.data.occupyBlockY;
      z = self.data.occupyBlockX;
    end
  elseif direction == EFurnitureDirection.RightDown or direction == EFurnitureDirection.LeftUp then
    if self.data.type == EFurnitureType.Ground then
      x = self.data.occupyBlockY;
      y = self.data.occupyBlockX;
      z = 0;
    elseif self.data.type == EFurnitureType.Wall then
      x = self.data.occupyBlockY;
      y = 0;
      z = self.data.occupyBlockX;
    end
  end

  return x, y, z
end

function FurnitureController.SetNothingGetNothing6()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

--獲取圖片編號
function FurnitureController:GetTextureNumber(interactive)
  local textureNumber = EFurnitureTexture.LeftDownTexture;

  if self.direction == EFurnitureDirection.LeftDown then
    textureNumber = EFurnitureTexture.LeftDownTexture;

    if interactive then
      textureNumber = EFurnitureTexture.LeftDownInteractiveTexture;
    end
  elseif self.direction == EFurnitureDirection.LeftUp then
    textureNumber = EFurnitureTexture.RightUpTexture;

    if interactive then
      textureNumber = EFurnitureTexture.RightUpInteractiveTexture;
    end
  elseif self.direction == EFurnitureDirection.RightDown then
    textureNumber = EFurnitureTexture.LeftDownTexture;

    if interactive then
      textureNumber = EFurnitureTexture.LeftDownInteractiveTexture;
    end
  elseif self.direction == EFurnitureDirection.RightUp then
    textureNumber = EFurnitureTexture.RightUpTexture;

    if interactive then
      textureNumber = EFurnitureTexture.RightUpInteractiveTexture;
    end
  end
  
  if LuaHelper.CheckDefine("DemoCode") then
    local folk = 69;
    local dog = 27;
    local stupid = 0;
    if this ~= nil then
      stupid = folk + dog;
    else
      stupid = stupid + 1;
    end
  end
  
  --沒抓到圖
  local frameCount = self.jmpDrawer_Body:GetFrameCount(textureNumber);
  if frameCount == 0 then
    if self.direction == EFurnitureDirection.LeftUp or self.direction == EFurnitureDirection.RightUp then
      textureNumber = EFurnitureTexture.LeftDownTexture;

      if interactive then
        textureNumber = EFurnitureTexture.LeftDownInteractiveTexture;
      end
    end
  end

  return textureNumber
end

function FurnitureController:SetPositionAndDirection(blockX, blockY, blockZ, direction)
  if self.gameObject == nil then return end
  if blockX == nil or blockY == nil or blockZ == nil or direction == nil then return end

  local newPosition = HouseEditorManager.GetBlockPosition(blockX, blockY, blockZ);
  if newPosition == nil then return end
  self.blockX = blockX;
  self.blockY = blockY;
  self.blockZ = blockZ;
  self.direction = direction;
  self.gameObjectTransform.localPosition = newPosition;
  self.occupyX, self.occupyY, self.occupyZ = self:GetOccupyBlockDirection(direction);
  self:SetOccupyBlock();
  self.position = Vector2.New(self:GetMiddlePosition().x , -self:GetMiddlePosition().y);
  self:SetTexture(self:GetTextureNumber(false), 0);
  self:ChangeOrderInLayer(-self:GetMiddlePosition().y);
end

function FurnitureController:ChangePosition(blockX, blockY, blockZ)
  if self.gameObject == nil then return end
  if blockX == nil or blockY == nil or blockZ == nil then return end

  local newPosition = HouseEditorManager.GetBlockPosition(blockX, blockY, blockZ);
  if newPosition == nil then return end
  self.blockX = blockX;
  self.blockY = blockY;
  self.blockZ = blockZ;
  self.gameObjectTransform.localPosition = newPosition;

  --裝潢移動到另一邊的牆自動換方向
  if self.blockZ ~= 0 then
    if self.blockX == 0 then
      self:ChangeDirection(EFurnitureDirection.LeftDown);
    elseif self.blockY == 0 then
      self:ChangeDirection(EFurnitureDirection.RightDown);
    end
  end

  self:SetOccupyBlock();
  self.position = Vector2.New(self:GetMiddlePosition().x , -self:GetMiddlePosition().y);
  self:ChangeOrderInLayer(-self:GetMiddlePosition().y);
end

function FurnitureController:ChangeDirection(direction)
  if self.gameObject == nil then return end
  if self.direction == direction then return end
  if direction == nil then return end
  if not self:CheckDirectionInBlock(direction) then return end

  self.direction = direction;
  self.occupyX, self.occupyY, self.occupyZ = self:GetOccupyBlockDirection(direction);
  self:SetOccupyBlock();
  self:SetTexture(self:GetTextureNumber(false), 0);
end

function FurnitureController.SetNothingGetNothing7()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function FurnitureController.SetNothingGetNothing8()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function FurnitureController.SetNothingGetNothing9()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function FurnitureController.SetNothingGetNothing10()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function FurnitureController:ChangeOrderInLayer(order)
  if order == nil then return end

  local furnitureKindType = HouseEditorManager.GetFurnitureKindType(self.data.kind);

  if self.direction == EFurnitureDirection.LeftDown or self.direction == EFurnitureDirection.RightDown then
    order = order + self.blockX;
  elseif self.direction == EFurnitureDirection.LeftUp or self.direction == EFurnitureDirection.RightUp then
    order = order + self.blockY;
  end

  if furnitureKindType == EFurnitureKindType.Decorate then
    order = 1;
  elseif furnitureKindType == EFurnitureKindType.Carpet then
    order = 100;
  end

  order = order + self.data.addedOrder;
  self.canvas.sortingOrder = order;
  self.canvas_BodyMask.sortingOrder = order + 2;

  if self.effectType ~= EFurnitureEffect.NoEffect then
    self.effect.canvas.sortingOrder = order + 3;
  end

end

--可不可以放置的狀態檢查
function FurnitureController:CheckStatus()
  local status = EFurnitureStatus.CanPlace;
  local occupyFurniture = {};
  local furnitureKindType = HouseEditorManager.GetFurnitureKindType(self.data.kind);

  for i = 0, self:NumberOfOccupyBlocks() - 1 do
    local property;
    local furniture;

    property = HouseEditorManager.GetBlockProperty(self.occupyBlocks[i].x, self.occupyBlocks[i].y, self.occupyBlocks[i].z, furnitureKindType);
    furniture =  HouseEditorManager.GetBlockFurniture(self.occupyBlocks[i].x, self.occupyBlocks[i].y, self.occupyBlocks[i].z, furnitureKindType);

    if property ~= EBlockProperty.Empty and furniture ~= self then
      status = EFurnitureStatus.CanNotPlace;
    end

    if property == EBlockProperty.Furniture and furniture ~= self then
      occupyFurniture[furniture.index] = furniture;
      self.oldFurniture = HouseEditorManager.GetBlockFurniture(self.occupyBlocks[i].x, self.occupyBlocks[i].y, self.occupyBlocks[i].z, furnitureKindType);
    end
  end

  if table.Count(occupyFurniture) == 1 and self.oldFurniture ~= nil then
    if self.blockX + self.occupyX >= self.oldFurniture.blockX + self.oldFurniture.occupyX and
      self.blockY + self.occupyY >= self.oldFurniture.blockY + self.oldFurniture.occupyY and
      self.blockZ + self.occupyZ >= self.oldFurniture.blockZ + self.oldFurniture.occupyZ and
      self.blockX <= self.oldFurniture.blockX and
      self.blockY <= self.oldFurniture.blockY and
      self.blockZ <= self.oldFurniture.blockZ then
      status = EFurnitureStatus.CanChange;
    end
  end

  if status == EFurnitureStatus.CanPlace or status == EFurnitureStatus.CanChange then
    if furnitureKindType == EFurnitureKindType.Furniture and self.data.type == EFurnitureType.Ground and FurnitureManager.CanPlaceOnGround() then
      status = EFurnitureStatus.CanNotPlace;
    end
  end

  return status
end

--確保在牆邊轉向不會超出格子
function FurnitureController:CheckDirectionInBlock(direction)
  if self.direction == direction then return end
  local occupyX, occupyY, occupyZ = self:GetOccupyBlockDirection(direction);

  if self.blockX + occupyX - 1 > HouseEditorManager.sizeX or
    self.blockY + occupyY - 1 > HouseEditorManager.sizeY or
    self.blockZ + occupyZ - 1 > HouseEditorManager.sizeZ then
    ShowCenterMessage(string.Get(22595));
    return false
  end

  return true
end

--[[
And Isaac answering said, But I have made him your master, and have given him all his brothers for servants; I have made him strong with grain and wine: what then am I to do for you, my son?
And Esau said to his father, Is that the only blessing you have, my father? give a blessing to me, even me! And Esau was overcome with weeping.
Then Isaac his father made answer and said to him, Far from the fertile places of the earth, and far from the dew of heaven on high will your living-place be:
By your sword will you get your living and you will be your brother's servant; but when your power is increased his yoke will be broken from off your neck.
So Esau was full of hate for Jacob because of his father's blessing; and he said in his heart, The days of weeping for my father are near; then I will put my brother Jacob to death.
Then Rebekah, hearing what Esau had said, sent for Jacob, her younger son, and said to him, It seems that your brother Esau is purposing to put you to death.
So now, my son, do what I say: go quickly to Haran, to my brother Laban;
And be there with him for a little time, till your brother's wrath is turned away;
Till the memory of what you have done to him is past and he is no longer angry: then I will send word for you to come back; are the two of you to be taken from me in one day?
Then Rebekah said to Isaac, My life is a weariness to me because of the daughters of Heth: if Jacob takes a wife from among the daughters of Heth, such as these, the women of this land, of what use will my life be to me?
--]]

function FurnitureController:ClearOldFurniture()
  if self.oldFurniture == nil then return end
  FurnitureManager.RemoveFurnitureOnScene(self.oldFurniture);
  self.oldFurniture:Destroy();
end

function FurnitureController:NumberOfOccupyBlocks()
  if self.occupyBlocks == nil then return end
  local count = 0;
  for _ in pairs(self.occupyBlocks) do count = count + 1 end
  return count
end

function FurnitureController.SetNothingGetNothing11()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function FurnitureController.SetNothingGetNothing12()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end


function FurnitureController.SetNothingGetNothing13()
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end


function FurnitureController:ResetName()
  self.gameObject.name = string.Concat("Furniture_", self.index);
end
--endregion

--region Interactive
function FurnitureController:Interactive()
  MarkManager.StopNavigation();
  Role.SetMoveTarget(nil);
  Role.player:StopMove();

  if table.Count(self.interactiveKind) > 0 then
    if table.Count(self.interactiveWithRoleKind) > 0 then
      self:TeleportToInteractivePoint();
    else
      self:SendFurnitureInteractive(true);
    end
  end
end

function FurnitureController:InteractiveWithCheckOccupyPoint(interactive, player)
  if player == nil then return end
  if table.Count(self.interactiveKind) == 0 then return end

  if interactive == true then
    if player == Role.player then
      self:AddCheckCancelInteractiveListener();
    end
  else
    if player == Role.player then
      CGTimer.RemoveListener(self.CheckCancelInteractiveFunction);
    end
    self:Deselect();
  end

  if self:CheckInteractivePoint(interactive) then
    for kind in pairs(self.interactiveKind) do
      self.InteractiveFunctions[kind](self, interactive, player);
    end

    self.isInteracting = interactive;

    if table.Count(self.interactiveWithRoleKind) == 0 then
      self:SendFurnitureInteractive(interactive);
    end
  elseif interactive == false then
    --如果位置上還有人，只取消玩家玩家動作
    for kind in pairs(self.interactiveWithRoleKind) do
      self.InteractiveFunctions[kind](self, interactive, player);
    end
  end

  self:PlayerIsInteracting(player, interactive);
end

function FurnitureController.AviodCov()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function FurnitureController.AviodCov1()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function FurnitureController.AviodCov2()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function FurnitureController:CancelInteractive()
  if table.Count(self.interactivePoint) > 0 then
    self:RemoveOccupyPoint(Role.playerId);
    self:InteractiveWithCheckOccupyPoint(false, Role.player);
  else
    for kind in pairs(self.interactiveKind) do
      self.InteractiveFunctions[kind](self, false, Role.player);
    end
    self:Deselect();
    self.isInteracting = false;
    CGTimer.RemoveListener(self.CheckCancelInteractiveFunction);
    self:SendFurnitureInteractive(false);
  end
end

function FurnitureController:CancelAllPlayerInteractive()
  if table.Count(self.interactivePoint) > 0 then
    for k, v in pairs(self.interactivePoint) do
      local index = v.playerIndex;
      self:RemoveOccupyPoint(index);
      self:InteractiveWithCheckOccupyPoint(false, Role.players[index]);
    end
  else
    for kind in pairs(self.interactiveKind) do
      for k, v in pairs(Role.players) do
        self.InteractiveFunctions[kind](self, false, v);
      end
    end
    self.isInteracting = false;
    CGTimer.RemoveListener(self.CheckCancelInteractiveFunction);
  end
end

function FurnitureController.AviodCov3()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end


function FurnitureController.AviodCov4()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end


function FurnitureController.AviodCov5()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function FurnitureController:UpdateCollision()
  if table.Count(self.interactiveWithRoleKind) == 0 then return end

  for k, point in pairs(self.interactivePoint) do
    local noOneOccupyCount = 0;
    local playersCount = table.Count(Role.players);
    local interactivePosition = self:GetInteractivePointPosition(point)

    for kk, player in pairs(Role.players) do
      if (player.position - interactivePosition).magnitude <= 2 then
        if not point.occupy then
          self:InteractiveWithCheckOccupyPoint(true, player);
          FurnitureManager.AddInteractingPlayer(player.index, self);
          point.occupy = true;
          point.playerIndex = player.index;
        else
          --兩人在同一點上，ID大的傳走
          if tonumber(point.playerIndex) > tonumber(player.index) then
            self:SendToEmptyPosition(Role.players[point.playerIndex]);
            point.occupy = false;
            point.playerIndex = nil;
          elseif tonumber(point.playerIndex) < tonumber(player.index) then
            self:SendToEmptyPosition(Role.players[player.index]);
            point.occupy = false;
            point.playerIndex = nil;
          end
        end
      else
        noOneOccupyCount = noOneOccupyCount + 1;
      end
    end

    if noOneOccupyCount >= playersCount then
      point.occupy = false;
      point.playerIndex = nil;
    end
  end
end

function FurnitureController.AviodCov6()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function FurnitureController:CheckInteractivePoint(interacting)
  --取消互動時，確認還有沒有人在位置上
  --開始互動時，確認還有沒有位置
  for k, v in pairs(self.interactivePoint) do
    if v.occupy == not interacting then
      return interacting
    end
  end
  return not interacting
end

function FurnitureController.AviodCov7()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function FurnitureController.AviodCov8()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function FurnitureController:RemoveOccupyPoint(playerIndex)
  if playerIndex == nil then return end
  if table.Count(self.interactiveKind) == 0 then return end

  for k, v in pairs(self.interactivePoint) do
    if v.playerIndex == playerIndex then
      v.playerIndex = nil;
      v.occupy = false;
    end
  end
end

function FurnitureController:TeleportToInteractivePoint()
  local occupyPoint = 0;
  local totalPoint = self.data.interactivePointCount;

  for k, v in pairs(self.interactivePoint) do
    if not v.occupy then
      local newPosition = self:GetInteractivePointPosition(v);
        HouseManager.TeleportPlayer(Role.player, newPosition);
      break
    else
      occupyPoint = occupyPoint + 1;
    end
  end

  if occupyPoint >= totalPoint then
    ShowCenterMessage(string.Get(23582));
    self:Deselect();
  end
end

function FurnitureController:SendToEmptyPosition(player)
  if player == nil then return end
  if player ~= Role.player then return end

  local startX, startY = MapManager.GetBlock(self.position);
  local targetBlockX, targetBlockY = MapManager.GetStartEmptyBlock(startX, startY);

  if not MapManager.IsObstacle(targetBlockX, targetBlockY) then
    local newPosition = Vector2.New(MapManager.GetPosition(Vector2.New(targetBlockX, targetBlockY)));
    player:SetAnimationForceId(ERolePose.None);
    HouseManager.TeleportPlayer(player, newPosition);
  end
end

function FurnitureController:SendFurnitureInteractive(interactive)
  --C:106-010 <家具互動> 房間主人ID(1) +房屋編號(1) +樓層(1) +玩家ID(8) +家具座標X(1) +家具座標Y(1) +家具座標Z(1) +家具類型(1) +是否互動(1)
  sendBuffer:Clear();
  sendBuffer:WriteInt64(HouseManager.GetHouseOwnerId());
  sendBuffer:WriteByte(HouseManager.GetCurrentBuilding());
  sendBuffer:WriteByte(HouseManager.GetCurrentFloor());
  sendBuffer:WriteInt64(Role.playerId);
  sendBuffer:WriteUInt16(self.blockX);
  sendBuffer:WriteUInt16(self.blockY);
  sendBuffer:WriteUInt16(self.blockZ);
  sendBuffer:WriteByte(HouseEditorManager.GetFurnitureKindType(self.data.kind));
  sendBuffer:WriteBoolean(interactive);
  Network.Send(106, 10, sendBuffer);
end

function FurnitureController.AviodCov7()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function FurnitureController.AviodCov8()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function FurnitureController.AviodCov9()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function FurnitureController:ReceiveInteractive(id, interactive)
  if id == nil then return end

  for interactiveKind in pairs(self.interactiveKind) do
    self.InteractiveFunctions[interactiveKind](self, interactive, Role.players[id]);
  end

  self.isInteracting = interactive;

  if interactive then
    self:Selected();
    if id == Role.playerId then
      self:AddCheckCancelInteractiveListener();
    end
  else
    if id == Role.playerId then
      CGTimer.RemoveListener(self.CheckCancelInteractiveFunction);
    end
    self:Deselect();
  end
end

function FurnitureController:AddCheckCancelInteractiveListener()
  if not CGTimer.ContainsListener(self.CheckCancelInteractiveFunction) then
    CGTimer.AddListener(self.CheckCancelInteractiveFunction, 0, false);
  end
end

--[[
Now Abraham was old and far on in years: and the Lord had given him everything in full measure.
And Abraham said to his chief servant, the manager of all his property, Come now, put your hand under my leg:
And take an oath by the Lord, the God of heaven and the God of the earth, that you will not get a wife for my son Isaac from the daughters of the Canaanites among whom I am living;
But that you will go into my country and to my relations and get a wife there for my son Isaac.
And the servant said, If by chance the woman will not come with me into this land, am I to take your son back again to the land from which you came?
And Abraham said, Take care that you do not let my son go back to that land.
The Lord God of heaven, who took me from my father's house and from the land of my birth, and made an oath to me, saying, To your seed I will give this land: he will send his angel before you and give you a wife for my son in that land.
And if the woman will not come with you, then you are free from this oath; only do not take my son back there.
And the servant put his hand under Abraham's leg, and gave him his oath about this thing.
And the servant took ten of his master's camels, and all sorts of good things of his master's, and went to Mesopotamia, to the town of Nahor.
And he made the camels take their rest outside the town by the water-spring in the evening, at the time when the women came to get water.
And he said, O Lord, the God of my master Abraham, let me do well in what I have undertaken this day, and give your mercy to my master Abraham.
See, I am waiting here by the water-spring; and the daughters of the town are coming out to get water:
Now, may the girl to whom I say, Let down your vessel and give me a drink, and who says in answer, Here is a drink for you and let me give water to your camels: may she be the one marked out by you for your servant Isaac: so may I be certain that you have been good to my master Abraham.
And even before his words were ended, Rebekah, the daughter of Bethuel, the son of Milcah, who was the wife of Nahor, Abraham's brother, came out with her water-vessel on her arm.
She was a very beautiful girl, a virgin, who had never been touched by a man: and she went down to the spring to get water in her vessel.
And the servant came running to her and said, Give me a little water from your vessel.
And she said, Take a drink, my lord: and quickly letting down her vessel onto her hand, she gave him a drink.
And having done so, she said, I will get water for your camels till they have had enough.
And after putting the water from her vessel into the animals' drinking-place, she went quickly back to the spring and got water for all the camels.
And the man, looking at her, said nothing, waiting to see if the Lord had given his journey a good outcome.
And when the camels had had enough, the man took a gold nose-ring, half a shekel in weight, and two ornaments for her arms of ten shekels weight of gold;
And said to her, Whose daughter are you? is there room in your father's house for us?
And she said to him, I am the daughter of Bethuel, the son of Milcah, Nahor's wife.
And she said, We have a great store of dry grass and cattle-food, and there is room for you.
And with bent head the man gave worship to the Lord;
And said, Praise be to the Lord, the God of my master Abraham, who has given a sign that he is good and true to my master, by guiding me straight to the house of my master's family.
]]--

--互動時結束條件判斷
function FurnitureController:CheckCancelInteractive()
  for interactiveKind in pairs(self.interactiveKind) do
      if self.CheckCancelInteractiveFunctions[interactiveKind](self) then
        self:CancelInteractive();
      end
  end
end

function FurnitureController:PlayerIsInteracting(player, isInteracting)
  if isInteracting == false then
    FurnitureManager.RemoveInteractingPlayer(player.index);
    if table.Count(self.interactivePoint) > 0 then
      self:SendToEmptyPosition(player);
    end
  else
    player.canvas.sortingOrder = self.canvas.sortingOrder + 1;
  end

  if player == Role.player then
    FurnitureManager.SetPlayerIsInteracting(isInteracting);
  end
end

--[[
In the beginning God created the heaven and the earth.At the first God made the heaven and the earth.
And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of God moved upon the face of the waters.
At the first God made the heaven and the earth.And the earth was waste and without form; and it was dark on the face of the deep: and the Spirit of God was moving on the face of the waters.And God said, Let there be light: and there was light.
And God, looking on the light, saw that it was good: and God made a division between the light and the dark,
Naming the light, Day, and the dark, Night. And there was evening and there was morning, the first day.
And God said, Let there be a solid arch stretching over the waters, parting the waters from the waters.
And God made the arch for a division between the waters which were under the arch and those which were over it: and it was so.
And God gave the arch the name of Heaven. And there was evening and there was morning, the second day.
And God said, Let the waters under the heaven come together in one place, and let the dry land be seen: and it was so.
And God gave the dry land the name of Earth; and the waters together in their place were named Seas: and God saw that it was good.
And God said, Let grass come up on the earth, and plants producing seed, and fruit-trees giving fruit, in which is their seed, after their sort: and it was so.
And grass came up on the earth, and every plant producing seed of its sort, and every tree producing fruit, in which is its seed, of its sort: and God saw that it was good.
And there was evening and there was morning, the third day.
And God said, Let there be lights in the arch of heaven, for a division between the day and the night, and let them be for signs, and for marking the changes of the year, and for days and for years:
And let them be for lights in the arch of heaven to give light on the earth: and it was so.
And God made the two great lights: the greater light to be the ruler of the day, and the smaller light to be the ruler of the night: and he made the stars.
And God put them in the arch of heaven, to give light on the earth;
To have rule over the day and the night, and for a division between the light and the dark: and God saw that it was good.
And there was evening and there was morning, the fourth day.
And God said, Let the waters be full of living things, and let birds be in flight over the earth under the arch of heaven.
And God made great sea-beasts, and every sort of living and moving thing with which the waters were full, and every sort of winged bird: and God saw that it was good.
And God gave them his blessing, saying, Be fertile and have increase, making all the waters of the seas full, and let the birds be increased in the earth.
--]]

function FurnitureController:GetInteractivePointPosition(point)
  local direction_X = point.x;
  local direction_Y = point.y;

  if self.direction == EFurnitureDirection.RightDown then
    direction_X = -direction_X;
  elseif self.direction == EFurnitureDirection.RightUp then
    direction_X = -direction_X;
  end

  return Vector2.New(self.rawImageBodyTransform.position.x + direction_X, -(self.rawImageBodyTransform.position.y + direction_Y))
end

function FurnitureController:GetInteractivePointPositionByPlayer(playerIndex)
  for k, v in pairs(self.interactivePoint) do
    if v.playerIndex == playerIndex then
      return self:GetInteractivePointPosition(v)
    end
  end

  return nil
end

function FurnitureController:TransferDirectionToRoleDirection()
  local roleDirection = 0;
  roleDirection = (self.direction * 2 + 3) % 8;
  return roleDirection
end
--endregion

function FurnitureController.GuessNumberZZ(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function FurnitureController.GuessNumberZZ1(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

--region InteractiveFunctions
FurnitureController.InteractiveFunctions[EFurnitureInteractiveSetting.PlayGIF] = function(self, isPlay, player)
  if isPlay then
    if self.data.dynamic == EFurnitureDynamic.Dynamic then
      self:CancelDynamicAnimation();
    end
    self:AddInteractiveAnimation();
  else
    if self.data.dynamic == EFurnitureDynamic.Dynamic then
      self:AddDynamicAnimation();
    end
    self:CancelInteractiveAnimation();
    self:SetTexture(self:GetTextureNumber(false), 0);
  end
end

FurnitureController.InteractiveFunctions[EFurnitureInteractiveSetting.PlayMusic] = function(self, isPlay)
  if isPlay then
    if self.data.replay_Music == 0 then
      self.audioChannel = AudioManager.PlayFurnitureMusicOnce(self.data.musicName);
    else
      self.audioChannel = AudioManager.PlayFurnitureMusicLoop(self.data.musicName);
    end
    if self.audioChannel == nil then
      ShowCenterMessage(string.Get(23557));
      return
    end
  else
    AudioManager.StopFurnitureMusic(self.audioChannel);
  end
end

FurnitureController.InteractiveFunctions[EFurnitureInteractiveSetting.Active] = function(self, isPlay, player)
  if player == nil then return end

  if self.data.action == 13 then
    player:SetOnTheSea(isPlay);
  elseif isPlay then
    local pose = ERolePose.None;
    local dir = player.direction;

    if self.data.action == 1 then
      dir = self:TransferDirectionToRoleDirection();
      pose = ERolePose.Sit;
    elseif self.data.action == 2 then
      pose = ERolePose.Wave;
    elseif self.data.action == 3 then
      pose = ERolePose.Hit;
    elseif self.data.action == 4 then
      pose = ERolePose.Prepare;
    elseif self.data.action == 5 then
      dir = (self.direction * 2 + 7) % 8;
      pose = ERolePose.Lie;
    elseif self.data.action == 6 then
      pose = ERolePose.Jump;
    elseif self.data.action == 7 then
      pose = ERolePose.Magic;
    elseif self.data.action == 8 then
      pose = ERolePose.Attack;
    elseif self.data.action == 9 then
      pose = ERolePose.Walk;
    elseif self.data.action == 10 then
      pose = ERolePose.Stand;
    elseif self.data.action == 11 then
      pose = ERolePose.Special;
    elseif self.data.action == 12 then
      pose = ERolePose.Archery;
    end

    player:SetDirection(dir);
    player:SetAnimationForceId(pose);
  else
    player:SetAnimationForceId(ERolePose.None);
  end
end

FurnitureController.InteractiveFunctions[EFurnitureInteractiveSetting.UnActive] = function(self, isPlay, player)
  if player == nil then return end;

  local pose = ERolePose.None;

  if isPlay then
    if self.data.action == 1 then
      pose = ERolePose.Sit;
    elseif self.data.action == 2 then
      pose = ERolePose.Wave;
    elseif self.data.action == 3 then
      pose = ERolePose.Hit;
    elseif self.data.action == 4 then
      pose = ERolePose.Prepare;
    elseif self.data.action == 5 then
      pose = ERolePose.Lie;
    elseif self.data.action == 6 then
      pose = ERolePose.Jump;
    elseif self.data.action == 7 then
      pose = ERolePose.Magic;
    elseif self.data.action == 8 then
      pose = ERolePose.Attack;
    elseif self.data.action == 9 then
      pose = ERolePose.Walk;
    elseif self.data.action == 10 then
      pose = ERolePose.Stand;
    elseif self.data.action == 11 then
      pose = ERolePose.Special;
    elseif self.data.action == 12 then
      pose = ERolePose.Archery;
    end
  else
    pose = ERolePose.None;
  end

  player:SetAnimationForceId(pose);
end

FurnitureController.InteractiveFunctions[EFurnitureInteractiveSetting.Emoji] = function(self, isPlay, player)
  if isPlay then
    player:PlayEmoji(99 + self.data.emoji)
  else
    player:StopEmoji();
  end
end

FurnitureController.InteractiveFunctions[EFurnitureInteractiveSetting.MessageBoard] = function(self, isPlay)
  if isPlay then
    UI.Open(UIMessageboard);
  else
    UI.Close(UIMessageboard);
  end
end

FurnitureController.InteractiveFunctions[EFurnitureInteractiveSetting.ShowMessage] = function(self, isPlay)
  if isPlay then
    ShowCenterMessage(self.data.message);
  end
end

FurnitureController.InteractiveFunctions[EFurnitureInteractiveSetting.ShowEffect] = function(self, isPlay)
  if isPlay then
    if self.effectType == EFurnitureEffect.PlayWhenClick then
      self:AddInteractiveEffect();
    end
  else
    if self.effectType == EFurnitureEffect.PlayWhenClick then
      self:CancelInteractiveEffect();
    end
  end
end
--endregion

function FurnitureController.GuessNumberZZ2(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function FurnitureController.GuessNumberZZ3(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function FurnitureController.GuessNumberZZ4(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function FurnitureController.GuessNumberZZ5(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function FurnitureController.GuessNumberZZ6(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end


--region CheckCancelInteractiveFunctions
FurnitureController.CheckCancelInteractiveFunctions[EFurnitureInteractiveSetting.PlayGIF] = function(self)
  if self.data.replay_GIF == 1 then
    return false;
  elseif self.currentPlayRound_GIF >= self.data.playRound_GIF then
    return true;
  end
end

FurnitureController.CheckCancelInteractiveFunctions[EFurnitureInteractiveSetting.PlayMusic] = function(self)
  if self.audioChannel == nil then return true end

  if not AudioManager.GetChannelIsPlaying(self.audioChannel) then
    self.audioChannel = nil;
    return true;
  end
end

FurnitureController.CheckCancelInteractiveFunctions[EFurnitureInteractiveSetting.Active] = function(self)
  if UIJoystick.IsDrag() or UIJoystick.IsClick() then
    UIJoystick.StopClickEffect();
    return true;
  end
end

FurnitureController.CheckCancelInteractiveFunctions[EFurnitureInteractiveSetting.UnActive] = function(self)
  if UIJoystick.IsDrag() or UIJoystick.IsClick() then
    UIJoystick.StopClickEffect();
    return true;
  end
end

FurnitureController.CheckCancelInteractiveFunctions[EFurnitureInteractiveSetting.Emoji] = function(self, player)
  if UIJoystick.IsDrag() or UIJoystick.IsClick() then
    UIJoystick.StopClickEffect();
    return true;
  end
end

FurnitureController.CheckCancelInteractiveFunctions[EFurnitureInteractiveSetting.MessageBoard] = function(self)
  if not UI.IsVisible(UIMessageboard) then
    return true;
  end
end

FurnitureController.CheckCancelInteractiveFunctions[EFurnitureInteractiveSetting.ShowMessage] = function(self)
  if not CGTimer.ContainsListener(UICenterMessage.UpdateUI) then
    if table.Contains(self.interactiveKind, EFurnitureInteractiveSetting.PlayGIF) then
      return false;
    end

    return true;
  end
end

FurnitureController.CheckCancelInteractiveFunctions[EFurnitureInteractiveSetting.ShowEffect] = function(self)
  if self.effectType == EFurnitureEffect.PlayOnStart then
    return false;
  elseif self.effectType == EFurnitureEffect.PlayWhenClick then
    if self.effect.playRound >= self.effect.totalRound then
      return true;
    end
  end
end
--endregion

function FurnitureController.GuessNumberZZ7(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function FurnitureController.GuessNumberZZ8(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

--region Animation
function FurnitureController:AddInteractiveAnimation()
  if self.data.playSpeed_GIF == 0 then return end
  self.frameNumber = 0;
  self.currentPlayRound_GIF = 0;
  self.interactiveFrameCount = self.jmpDrawer_Body:GetFrameCount(self:GetTextureNumber(true));

  local interval = string.format("%.2f", 1 / self.data.playSpeed_GIF);
  
  if LuaHelper.CheckDefine("DemoCode") then
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
  
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
  
  if not CGTimer.ContainsListener(self.PlayInteractiveAnimationFunction) then
    CGTimer.AddListener(self.PlayInteractiveAnimationFunction, interval, false);
  end
end

function FurnitureController:PlayInteractiveAnimation()
  if self == nil then return end

  if self.frameNumber + 1 >= self.interactiveFrameCount then
    self.currentPlayRound_GIF = self.currentPlayRound_GIF + 1;
  end

  self.frameNumber = (self.frameNumber + 1) % self.interactiveFrameCount;
  self:SetTexture(self:GetTextureNumber(true), self.frameNumber);
end

function FurnitureController:CancelInteractiveAnimation()
  CGTimer.RemoveListener(self.PlayInteractiveAnimationFunction);
end

--DynamicAnimation
function FurnitureController:AddDynamicAnimation()
  self.frameNumber = 0;
  
  if LuaHelper.CheckDefine("DemoCode") then
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
    
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
  
  if not CGTimer.ContainsListener(self.PlayDynamicAnimationFunction) then
    CGTimer.AddListener(self.PlayDynamicAnimationFunction, 0.2, false);
  end
end

function FurnitureController:PlayDynamicAnimation()
  if self == nil then return end

  self.frameNumber = (self.frameNumber + 1) % self.frameCount;
  self:SetTexture(self:GetTextureNumber(false), self.frameNumber);
end

function FurnitureController:CancelDynamicAnimation()
  CGTimer.RemoveListener(self.PlayDynamicAnimationFunction);
end

--Effect
function FurnitureController:AddEffectAnimation()
  self.effect.nowPage = 0;
  self.effect.frameCount = 0;
  self.effect.rawImage.enabled = true;
  
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      human = satan + haven;
    else
      human = satan - haven;
    end
  
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
  
  if not CGTimer.ContainsListener(self.PlayEffectFunction) then
    CGTimer.AddListener(self.PlayEffectFunction, self.effect.interval, false);
  end
end

function FurnitureController:PlayAutoEffect()
  if self == nil then return end

  if self.effect.nowPage < self.effect.allPage then
    self.effect.nowPage = self.effect.frameCount + self.effect.startPage;
    TextureManager.SetPng(ETextureUseType.EffectLight, string.Concat(self.effect.fileName, "_", tostring(self.effect.nowPage)), self.effect.rawImage);
    self.effect.frameCount = self.effect.frameCount + 1;
  else
    self.effect.nowPage = 0;
    self.effect.frameCount = 0;
  end
end

function FurnitureController:CancelAutoEffect()
  self.effect.rawImage.enabled = false;
  CGTimer.RemoveListener(self.PlayEffectFunction);
end

function FurnitureController:AddInteractiveEffect()
  self.effect.nowPage = 0;
  self.effect.frameCount = 0;
  self.effect.playRound = 0;
  TextureManager.SetPng(ETextureUseType.EffectLight, string.Concat(self.effect.fileName, "_", tostring(self.effect.startPage)), self.effect.rawImage);
  self.effect.rawImage.enabled = true;
  
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      human = satan + haven;
    else
      human = satan - haven;
    end
    
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
  
  if not CGTimer.ContainsListener(self.PlayInteractiveEffectFunction) then
    CGTimer.AddListener(self.PlayInteractiveEffectFunction, self.effect.interval, false);
  end
end

function FurnitureController:PlayInteractiveEffect()
  if self == nil then return end

  local pageCount = self.effect.allPage;
  if self.effect.endPage < self.effect.allPage then
    pageCount = self.effect.endPage;
  end

  if self.effect.nowPage < pageCount then
    self.effect.nowPage = self.effect.frameCount + self.effect.startPage;
    TextureManager.SetPng(ETextureUseType.EffectLight, string.Concat(self.effect.fileName, "_", tostring(self.effect.nowPage)), self.effect.rawImage);
    self.effect.frameCount = self.effect.frameCount + 1;
  else
    self.effect.nowPage = 0;
    self.effect.frameCount = 0;
    self.effect.playRound = self.effect.playRound + 1;
  end
end

function FurnitureController:CancelInteractiveEffect()
  self.effect.rawImage.enabled = false;
  CGTimer.RemoveListener(self.PlayInteractiveEffectFunction);
end
--endregion
