--region MovieSound.lua

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

local SoundList = 
{
  "Audio/AudioClip_10.mp3",
  "Audio/AudioClip_20.mp3",
  "Audio/AudioClip_21.mp3",
  "Audio/AudioClip_30.mp3",
  "Audio/AudioClip_31.mp3",
  "Audio/AudioClip_32.mp3",
  "Audio/AudioClip_40.mp3",
  "Audio/AudioClip_41.mp3",
  "Audio/AudioClip_42.mp3",
  "Audio/AudioClip_43.mp3",
  "Audio/AudioClip_50.mp3",
  "Audio/AudioClip_51.mp3",
  "Audio/AudioClip_52.mp3",
  "Audio/AudioClip_004.mp3",
  "Audio/AudioClip_WA0001.mp3",
  "Audio/AudioClip_WA0002.mp3",
  "Audio/AudioClip_WA0003.mp3",
  "Audio/AudioClip_WA0004.mp3",
  "Audio/AudioClip_WA0005.mp3",
  "Audio/AudioClip_WA0006.mp3",
  "Audio/AudioClip_WA0007.mp3",
  "Audio/AudioClip_WA0008.mp3",
  "Audio/AudioClip_WA0009.mp3",
  "Audio/AudioClip_WA0010.mp3",
  "Audio/AudioClip_WA0011.mp3",
  "Audio/AudioClip_WA0012.mp3",
  "Audio/AudioClip_WA0013.mp3",
  "Audio/AudioClip_WA0014.mp3",
  "Audio/AudioClip_WA0017.mp3",
  "Audio/AudioClip_WA0018.mp3",
  "Audio/AudioClip_WA0019.mp3",
  "Audio/AudioClip_WA0020.mp3",
  "Audio/AudioClip_WA0021.mp3",
  "Audio/AudioClip_WA0022.mp3",
  "Audio/AudioClip_WA0023.mp3",
  "Audio/AudioClip_WA0024.mp3",
  "Audio/AudioClip_WA0025.mp3",
  "Audio/AudioClip_WA0026.mp3",
  "Audio/AudioClip_WA0027.mp3",
  "Audio/AudioClip_WA0028.mp3",
  "Audio/AudioClip_WA0029.mp3",
  "Audio/AudioClip_WA0030.mp3",
  "Audio/AudioClip_WA0031.mp3",
  "Audio/AudioClip_WA0032.mp3",
  "Audio/AudioClip_WA0033.mp3",
  "Audio/AudioClip_WA0034.mp3",
  "Audio/AudioClip_WA0035.mp3",
  "Audio/AudioClip_WA0036.mp3",
  "Audio/AudioClip_WA0037.mp3",
  "Audio/AudioClip_WA0038.mp3",
  "Audio/AudioClip_WA0040.mp3",
  "Audio/AudioClip_WA0041.mp3",
  "Audio/AudioClip_WA0042.mp3",
  "Audio/AudioClip_WA0043.mp3",
  "Audio/AudioClip_WA0044.mp3",
  "Audio/AudioClip_WA0045.mp3",
  "Audio/AudioClip_WA0046.mp3",
  "Audio/AudioClip_WA0047.mp3",
  "Audio/AudioClip_WA0048.mp3",
  "Audio/AudioClip_WA0049.mp3",
  "Audio/AudioClip_WA0051.mp3",
  "Audio/AudioClip_WA0052.mp3",
  "Audio/AudioClip_WA0053.mp3",
  "Audio/AudioClip_WA0054.mp3",
  "Audio/AudioClip_WA0055.mp3",
  "Audio/AudioClip_WA0056.mp3",
  "Audio/AudioClip_WA0057.mp3",
  "Audio/AudioClip_WA0058.mp3",
  "Audio/AudioClip_WA0059.mp3",
  "Audio/AudioClip_WA0060.mp3",
  "Audio/AudioClip_WA0061.mp3",
  "Audio/AudioClip_WA0062.mp3",
  "Audio/AudioClip_WA0063.mp3",
  "Audio/AudioClip_WA0064.mp3",
  --資料片二
  "Audio/AudioClip_WA0065.mp3",--龍吼
  "Audio/AudioClip_WA0066.mp3",--擊地
  "Audio/AudioClip_WA0067.mp3",--鳳叫
  "Audio/AudioClip_WA0068.mp3",--拍翅
  "Audio/AudioClip_WA0069.mp3",--集氣
  "Audio/AudioClip_WB0002.mp3",
  "Audio/AudioClip_WB0003.mp3",
  "Audio/AudioClip_WB0004.mp3",
  "Audio/AudioClip_WB0005.mp3",
  "Audio/AudioClip_WB0006.mp3",
  "Audio/AudioClip_WB0007.mp3",
  "Audio/AudioClip_WB0008.mp3",
  "Audio/AudioClip_WB0009.mp3",
  "Audio/AudioClip_WB0010.mp3",
  "Audio/AudioClip_WB0011.mp3",
  "Audio/AudioClip_WB0012.mp3",
  "Audio/AudioClip_WB0013.mp3",
  "Audio/AudioClip_WB0014.mp3",
  "Audio/AudioClip_WB0015.mp3",
  "Audio/AudioClip_WB0016.mp3",
  "Audio/AudioClip_WB0017.mp3",
  "Audio/AudioClip_WB0018.mp3",
  "Audio/AudioClip_WB0019.mp3",
  "Audio/AudioClip_WB0020.mp3",
  "Audio/AudioClip_WC0001.mp3",
  "Audio/AudioClip_WC0002.mp3",
  "Audio/AudioClip_WC0003.mp3",
  "Audio/AudioClip_WC0004.mp3",
  "Audio/AudioClip_WC0005.mp3",
  "Audio/AudioClip_WC0006.mp3",
  "Audio/AudioClip_WC0007.mp3",
  "Audio/AudioClip_WC0008.mp3",
  "Audio/AudioClip_WC0009.mp3",
  "Audio/AudioClip_WC0010.mp3",
  "Audio/AudioClip_WC0012.mp3",  --109
  "Audio/AudioClip_Wd0001.mp3",  --110
  "Audio/AudioClip_Wd0002.mp3",  --111
  "Audio/AudioClip_WM0001.mp3",   --112
  "Audio/AudioClip_WM0002.mp3",   --113
  "Audio/AudioClip_WM0003.mp3",   --114
  "Audio/AudioClip_WM0004.mp3",   --115
  "Audio/AudioClip_WM0005.mp3",   --116
  "Audio/AudioClip_WM0006.mp3",   --117
  "Audio/AudioClip_WM0007.mp3",   --118
  --2004/11/29
  "Audio/AudioClip_WM0008.mp3",   --119
  "Audio/AudioClip_WM0009.mp3",   --120
  "Audio/AudioClip_WM00010.mp3",  --121
  "Audio/AudioClip_WM00011.mp3",  --122
  "Audio/AudioClip_WA0070.mp3",  --123
  "Audio/AudioClip_WA0071.mp3",  --124
  "Audio/AudioClip_WA0072.mp3",  --125
  "Audio/AudioClip_WA0073.mp3",  --126
  "Audio/AudioClip_WA0074.mp3",  --127
  "Audio/AudioClip_WA0075.mp3",  --128
  "Audio/AudioClip_WC0013.mp3",  --129
  "Audio/AudioClip_WC0014.mp3",  --130
  "Audio/AudioClip_WC0015.mp3",  --131
  "Audio/AudioClip_WC0016.mp3"
}

MovieSound = {};
local this = MovieSound;

function MovieSound.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function MovieSound.PlayMovieSound(soundID)
  local path = SoundList[soundID];
  if path ~= nil then
    AudioManager.PlaySlot(path);
  end
end
--endregion

function MovieSound.Script1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end
function MovieSound.Script2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function MovieSound.Script3()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end