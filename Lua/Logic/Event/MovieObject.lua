--region MovieObject.lua
--[[
     功能:演出物件
 ]]
require "Logic/Event/Tft_Crunode"
require "Logic/Event/Tft_Efficacy"
require "Logic/Event/Tft_Ground"
require "Logic/Event/Tft_Picture"
require "Logic/Event/Tft_Role"
require "Logic/Event/Tft_Talk"

MovieObject = {};
MovieObject.__index = MovieObject;

--[[
And the Lord said to Noah, Take all your family and go into the ark, for you only in this generation have I seen to be upright.
Of every clean beast you will take seven males and seven females, and of the beasts which are not clean, two, the male and his female;
And of the birds of the air, seven males and seven females, so that their seed may still be living on the face of the earth.
For after seven days I will send rain on the earth for forty days and forty nights, for the destruction of every living thing which I have made on the face of the earth.
And Noah did everything which the Lord said he was to do.
And Noah was six hundred years old when the waters came flowing over all the earth.
And Noah, with his sons and his wife and his sons' wives, went into the ark because of the flowing of the waters.
Of clean beasts, and of beasts which are not clean, and of birds, and of everything which goes on the earth,
In twos, male and female, they went into the ark with Noah, as God had said.
And after the seven days, the waters came over all the earth.
In the six hundredth year of Noah's life, in the second month, on the seventeenth day of the month, all the fountains of the great deep came bursting through, and the windows of heaven were open;
And rain came down on the earth for forty days and forty nights.
On the same day Noah, with Shem, Ham, and Japheth, his sons, and his wife and his sons' wives, went into the ark;
And with them, every sort of beast and cattle, and every sort of thing which goes on the earth, and every sort of bird.
They went with Noah into the ark, two and two of all flesh in which is the breath of life.
Male and female of all flesh went in, as God had said, and the ark was shut by the Lord.
And for forty days the waters were over all the earth; and the waters were increased so that the ark was lifted up high over the earth.
And the waters overcame everything and were increased greatly on the earth, and the ark was resting on the face of the waters.
And the waters overcame everything on the earth; and all the mountains under heaven were covered.
The waters went fifteen cubits higher, till all the mountains were covered.
And destruction came on every living thing moving on the earth, birds and cattle and beasts and everything which went on the earth, and every man.
Everything on the dry land, in which was the breath of life, came to its end.
Every living thing on the face of all the earth, man and cattle and things moving on the face of the earth, and birds of the air, came to destruction: only Noah and those who were with him in the ark, were kept from death.
And the waters were over the earth a hundred and fifty days.
--]]

function MovieObject.Random()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function MovieObject.Random1()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function MovieObject.New(reader)
  local self = {};
  setmetatable(self, MovieObject);

  self.version = reader:ReadByte(); --儲存動畫檔版本
  local playerCount = reader:ReadInt32(); --儲存玩家數量
  local npcCount = reader:ReadInt32(); --儲存NPC數量
  local pictureCount = reader:ReadInt32(); --儲存動畫圖片數量
  local groundCount = reader:ReadInt32(); --儲存背景圖數量
  local talkCount = reader:ReadInt32(); --儲存對話數量
  self.totalPoint = reader:ReadInt32(); --儲存總設置時點數量    

  self.pactor = nil;
  if playerCount > 0 then
    self.pactor = Tft_Role.New(reader);
  end
  
  self.nactor = {};
  for i = 1, npcCount do
    self.nactor[i] = Tft_Role.New(reader);
  end
  
  self.pic = {};
  for i = 1, pictureCount do
    self.pic[i] = Tft_Picture.New(reader);
  end

  self.ground = nil;
  if groundCount > 0 then
    self.ground = Tft_Ground.New(reader);
  end
  
  if self.totalPoint > 0 then
    self.crunNode = Tft_Crunode.New();
    self.crunNode:Init(reader, self.totalPoint);    
     
    self.efficacy = Tft_Efficacy.New();
    self.efficacy:Init(reader, self.totalPoint);    
  end

  self.talk = {};
  for i = 0, talkCount do
    self.talk[i] = Tft_Talk.New(reader);
  end

  return self;
end
--endregion
function MovieObject.Random3()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function MovieObject.Random4()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end
