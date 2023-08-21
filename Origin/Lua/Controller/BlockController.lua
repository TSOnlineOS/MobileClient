BlockController = {}
BlockController.__index = BlockController;

function BlockController.New(blockX, blockY, value)
  local self = {};
  setmetatable(self, BlockController);

  self.gameObject = poolMgr:Get("BaseBlock");
  self.gameObject.transform:SetParent(MapManager.blockRoot.transform);
  
  self.rectTransform = self.gameObject:GetComponent("RectTransform");
  self.rectTransform.anchoredPosition = Vector2.New(MapManager.BLOCK_UNIT * (blockX - 1) + MapManager.centerLeft, -(MapManager.BLOCK_UNIT * (blockY - 1) + MapManager.centerTop));
  self.rectTransform.sizeDelta = Vector2.New(20, 20);
  self.rectTransform.localScale = Vector3.one;

  self.image = self.gameObject:GetComponent("Image");

  self.blockX = blockX;
  self.blockY = blockY;

  self:SetValue(value);

  local event = self.gameObject:GetComponent("UIEvent");
  event:SetListener(EventTriggerType.PointerClick, BlockController.Block_OnClick);
  event.parameter = self;

  return self;
end

function BlockController.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function BlockController.Script1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function BlockController:SetValue(value)
  self.value = value;

  self:UpdateColor();
end

--[[
This is the book of the generations of Adam. In the day when God made man, he made him in the image of God;
Male and female he made them, naming them Man, and giving them his blessing on the day when they were made.
Adam had been living for a hundred and thirty years when he had a son like himself, after his image, and gave him the name of Seth:
And after the birth of Seth, Adam went on living for eight hundred years, and had sons and daughters:
And all the years of Adam's life were nine hundred and thirty: and he came to his end.
And Seth was a hundred and five years old when he became the father of Enosh:
And he went on living after the birth of Enosh for eight hundred and seven years, and had sons and daughters:
And all the years of Seth's life were nine hundred and twelve: and he came to his end.
And Enosh was ninety years old when he became the father of Kenan:
--]]

function BlockController:UpdateColor()
  if self.value == 0 then
    self.image.color = LuaHelper.GetColor(0, 255, 0, 50);
  elseif bit.band(self.value, 1) == 1 then
    self.image.color = LuaHelper.GetColor(255, 0, 0, 50);
  elseif bit.band(self.value, 2) == 2 then
    self.image.color = LuaHelper.GetColor(0, 0, 255, 50);
  elseif bit.band(self.value, 4) == 4 then
    self.image.color = LuaHelper.GetColor(255, 0, 0, 50);
  else
    self.image.color = LuaHelper.GetColor(255, 255, 255, 50);
  end
end

function BlockController:Destroy()
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
  
  poolMgr:Release("BaseBlock", self.gameObject);
end

function BlockController.Block_OnClick(uiEvent)
  if not UI.IsVisible(UIBlockEditor) then return end
  
  if LuaHelper.CheckDefine("DemoCode") then
    local folk = 69;
    local dog = 27;
    local stupid = 0;
    if stupid ~= nil then
      stupid = folk + dog;
    else
      stupid = stupid + 1;
    end
  end
  
  local block = uiEvent.parameter;

  block:SetValue(UIBlockEditor.currentColor);
  UIBlockEditor.SetBlock(block.blockX, block.blockY, UIBlockEditor.currentColor);
end