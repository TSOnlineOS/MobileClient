Egg = {};
Egg.__index = Egg;

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

local eggNpc;
local eggItemId;
local awardCount;
local bornEggTime = 1.6;
local rollEggTime = 2;
local currentIndex = 1;

function Egg.AddThree(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function Egg.AddThreeD(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function Egg.New(name)
  local self = {};
  setmetatable(self, Egg);

  self.deltaX = 0;
  self.arrive = false;
  self.arriveTickCount = 0;

  self.gameObject = poolMgr:Get("BaseSceneEffect");
  self.gameObject.transform:SetParent(eggNpc.transform);

  self.gameObject.name = string.format("Egg_%s", name);
  self.rectTransform = self.gameObject:GetComponent("RectTransform");

  if name == SceneEffect.EggPicName then
    self.showX = -13;
    self.showY = 80;
  else
    self.showX = -48;
    self.showY = 20;
  end

  self.rectTransform.anchoredPosition = Vector3.New(self.showX, self.showY, 0);
  self.rectTransform.localScale = Vector3.one;
  self.rawImage = self.gameObject:GetComponent("UIRawImage");
  self.rawImage.raycastTarget = false;
  self.rawImage:ShiftUV(1, SceneEffect.EggFrameCount, 0.4, -1);

  TextureManager.SetPngByCallBack(ETextureUseType.Scene, name, self.rawImage,
    function(sucess)
      self.rectTransform.sizeDelta = Vector2.New(self.rawImage.texture.width, self.rawImage.texture.height / SceneEffect.EggFrameCount);
    end
  );

  return self;
end

function Egg:GetPosition()
  SceneEffect.GetPosition(self);
end

local egg = {};
local award = {};

function Egg.AddThreeA(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function Egg.AddThreeB(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

--S:023-106 <轉蛋樂> Count(1)+<<NpcIdx(1)+EggKind(1)+aThingID(2)>>
function Egg.ReciveStartRollEgg(data)
  table.Clear(award);

  awardCount = data:ReadByte();
  for i = 1, awardCount do
    award[i] = {};
    award[i].npcId = data:ReadByte();
    award[i].kind = data:ReadByte();
    award[i].itemId = data:ReadUInt16();
  end

  Egg.StartRoll(award);
end

function Egg.AddThreeC(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

--[[
褐轉蛋   46131
藍轉蛋   46132
紅轉蛋   46133
綠轉蛋   46134
亮銀轉蛋 46135
黃金轉蛋 46136]]
function Egg.StartRoll(award)
  if award == nil then return end

  for k, v in pairs(award) do
    if award[k].npcId ~= nil then
      eggNpc = Role.GetRole(EHuman.MapNpc, award[k].npcId);
      if eggNpc == nil then return end
    end
  end

  Egg.Stop(false);

  egg[SceneEffect.EggPicName] = Egg.New(SceneEffect.EggPicName);
  CGTimer.AddListener(Egg.StopRoll, rollEggTime, false);
  currentIndex = 1;

  AudioManager.PlayOnce("AudioClip_WA0092", 0);
  AudioManager.PlayOnce("AudioClip_WA0093", 0);
end

function Egg.StopRoll()
  Egg.Clear();

  Egg.OpenEgg();

  AudioManager.PlayOnce("AudioClip_WA0093", 0);
end

function Egg.OpenEgg()
  CGTimer.RemoveListener(Egg.StopRoll);

  if award[currentIndex] ~= nil then
    egg[award[currentIndex].itemId] = Egg.New(award[currentIndex].itemId);
  end

  CGTimer.AddListener(Egg.Stop, (bornEggTime / awardCount) * currentIndex, false);
end

function Egg.AddThreeE(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function Egg.AddThreeF(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function Egg.AddThreeG(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function Egg.Stop(sound)
  if sound ~= false then
    AudioManager.PlayOnce("AudioClip_WA0014", 0);
    ShowCenterMessage(string.Concat(string.Get(40049), itemDatas[award[currentIndex].itemId]:GetName(true)));

    CGTimer.RemoveListener(Egg.Stop);
    Egg.Clear();

    if not Egg.IsPlayOver() then
      currentIndex = currentIndex + 1;
      Egg.OpenEgg();
    end
  else
    --強制重新
    CGTimer.RemoveListener(Egg.Stop);
    Egg.Clear();
  end
end

function Egg.Clear()
  for k, v in pairs(egg) do
    poolMgr:Release("BaseSceneEffect", egg[k].gameObject);
    egg[k] = nil;
  end
end

function Egg.IsPlayOver()
  return currentIndex == awardCount;
end

function Egg.AddThree12(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end