PointCard = {}
local this = PointCard;

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

PointCard.Kind = {
  ULong = 1,
  MyCard = 2, 
  NineCard = 3,
  NewebPay = 4,
}

local cardKind;
local cardNo;
local cardPas;

function PointCard.Random()
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

function PointCard.Random1()
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


function PointCard.Buy(kind, no, pas)
  if kind == nil then logError("cardKind == nil") return end

  cardKind = kind;
  cardNo = no;
  cardPas = pas;

  if not PointCard.IsCardLengthValid(cardNo) then
    ShowCenterMessage(string.Get(21603));
    return;
  end

  if not PointCard.IsCardLengthValid(cardPas) then
    ShowCenterMessage(string.Get(21603));
    return;
  end

  this.SendPointCard();
end

function PointCard.Random2()
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

function PointCard.Random3()
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

function PointCard.IsCardLengthValid(text)
  local result = false

  if text == nil or text == "" then
    return result;
  end

  if cardKind == PointCard.Kind.ULong then
    if string.GetLength(text) ~= 10 then
      result = false;
    else
      result = true;
    end 
  elseif cardKind == PointCard.Kind.NineCard or cardKind == PointCard.Kind.MyCard or cardKind == PointCard.Kind.NewebPay then
    result = true;
  end

  return result;
end

function PointCard.Random4()
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

function PointCard.Random5()
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

function PointCard.SendPointCard()
--[[
C:035-005 <卡號儲值> 卡號長度(1)+ 卡號(?) +密碼(?) +種類(1)
  種類 1:遊龍10碼  
  種類 2:mycard 16碼  
  種類 3:980x
]]--
  if cardNo == "" or cardPas == "" then
    return;
  end

  sendBuffer:Clear();
  sendBuffer:WriteByte(string.GetLength(cardNo));
  sendBuffer:WriteString(cardNo);
  sendBuffer:WriteByte(string.GetLength(cardPas));
  sendBuffer:WriteString(cardPas);
  sendBuffer:WriteUInt16(cardKind);
  Network.Send(35, 5, sendBuffer);
end

function PointCard.Random6()
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

function PointCard.Random7()
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