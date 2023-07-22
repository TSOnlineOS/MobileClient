--region TweenPack.lua
TweenPacker = {};
local this = TweenPacker;

function TweenPacker.GetEmptyTween(emptyValue, duration)    
  return TweenPack.GetEmptyTween(emptyValue, duration);
end

function TweenPacker.GetEmptySequence()
  return TweenPack.GetEmptySequence()
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

function TweenPacker.AppendCallback(sequence, func, duration)
  sequence:AppendCallback(func);
  if duration > 0 then
    TweenPacker.CountingTime(sequence, duration, ETweenAddKind.Append);
  end
end

function TweenPacker.PrependCallback(sequence, func, duration)  
  if duration > 0 then
    TweenPacker.CountingTime(sequence, duration, ETweenAddKind.Prepend);
  end
  sequence:PrependCallback(func);    
end   

function TweenPacker.CountingTime(sequence, duration, addKind)  
  TweenPack.DoCountingTime(sequence, duration, 1, addKind);
end
--region TweenAction
function TweenPacker.DoLocalMove(sequence, trans, pos_v3, duration, addKind)
  TweenPack.DoLocalMove(sequence, trans, pos_v3, duration, addKind);
end

function TweenPacker.DoMove(sequence, trans, pos_v3, duration, addKind)
  TweenPack.DoMove(sequence, rectTrans, pos_v3, duration, addKind);
end

function TweenPacker.DoRotate(sequence, trans, eulerAngle_v3, duration, addKind)
  TweenPack.DoRotate(sequence, trans, eulerAngle_v3, duration, addKind);
end

function TweenPacker.DoShake(sequence, trans, duration, strength_v3, vibrato, randomness, addKind)
  TweenPacker.DoShake(sequence, trans, duration, strength_v3, vibrato, randomness, addKind);
end

function TweenPacker.DoLookAt(sequence, trans, pos_v3, duration, addKind)
  TweenPacker.DoLookAt(sequence, trans, pos_v3, duration, addKind);
end
--endregion

--region TweenCustomAction
function TweenPacker.Talk(sequence, callBack, content, roleController, duration, addKind)    
  if addKind == ETweenAddKind.Prepend then                  
    this.PrependCallback(sequence, function() ShowTalkMessage(callBack, content, roleController) end, duration);       
  else
    this.AppendCallback(sequence, function() logError(string.Concat("talk duration: ", duration)); ShowTalkMessage(callBack, content, roleController) end, duration); 
  end         
end

function TweenPacker.Visible(sequence, roleController, visible, duration, addKind)
  if addKind == ETweenAddKind.Prepend then
    this.PrependCallback(sequence, function() roleController:SetVisible(visible, 0); end, duration)
  else
    this.AppendCallback(sequence, function() roleController:SetVisible(visible, 0); end, duration)
  end
end

function TweenPacker.Emoji(sequence, roleController, emojiID, duration, addKind)
  if addKind == ETweenAddKind.Prepend then
    this.PrependCallback(sequence, function() roleController:PlayEmoji(emojiID); end, duration)
  else
    this.AppendCallback(sequence, function() roleController:PlayEmoji(emojiID); end, duration)
  end
end

function TweenPacker.EndOfLine()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function TweenPacker.EndOfLine1()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function TweenPacker.PathMove(sequence, roleController, pos_v2, duration, addKind, callback)
  if addKind == ETweenAddKind.Prepend then
    this.PrependCallback(sequence, function() roleController:Move(pos_v2, callback); end, duration);
  else
    this.AppendCallback(sequence, function() roleController:Move(pos_v2, callback); end, duration);
  end
end

function TweenPacker.Position(sequence, roleController, pos_v2, duration, addKind)
  if addKind == ETweenAddKind.Prepend then
    this.PrependCallback(sequence, function() roleController:SetPosition(pos_v2); end, duration);
  else
    this.AppendCallback(sequence, function() roleController:SetPosition(pos_v2); end, duration);
  end
end
--endregion

--endregion

function TweenPacker.EndOfLine3()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end

function TweenPacker.EndOfLine4()
  if LuaHelper.CheckDefine("DemoCode") then
    local people = 10;
    local gov = 2;
    
    for i = 1, gov do
      people  = people - i * 10
    end
    
    if people > 0 then
      return true
    else
      return false
    end
  end
end