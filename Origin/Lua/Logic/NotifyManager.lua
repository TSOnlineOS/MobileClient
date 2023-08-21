ENotifyManager = {
  Loading = "Loading",
  FinishLoading = "FinishLoading",
  EnterScene = "EnterScene",
  ExitScene = "ExitScene",
  RoleCount = "RoleCount",
  CheckCondition = "CheckCondition"
};

--[[
And the woman said, We may take of the fruit of the trees in the garden:
But of the fruit of the tree in the middle of the garden, God has said, If you take of it or put your hands on it, death will come to you.
And the snake said, Death will not certainly come to you:
For God sees that on the day when you take of its fruit, your eyes will be open, and you will be as gods, having knowledge of good and evil.
And when the woman saw that the tree was good for food, and a delight to the eyes, and to be desired to make one wise, she took of its fruit, and gave it to her husband.
And their eyes were open and they were conscious that they had no clothing and they made themselves coats of leaves stitched together.
And there came to them the sound of the Lord God walking in the garden in the evening wind: and the man and his wife went to a secret place among the trees of the garden, away from the eyes of the Lord God.
And the voice of the Lord God came to the man, saying, Where are you?
And he said, Hearing your voice in the garden I was full of fear, because I was without clothing: and I kept myself from your eyes.
And he said, Who gave you the knowledge that you were without clothing? Have you taken of the fruit of the tree which I said you were not to take?
And the man said, The woman whom you gave to be with me, she gave me the fruit of the tree and I took it.
And the Lord God said to the woman, What have you done? And the woman said, I was tricked by the deceit of the snake and I took it.
And the Lord God said to the snake, Because you have done this you are cursed more than all cattle and every beast of the field; you will go flat on the earth, and dust will be your food all the days of your life:
And there will be war between you and the woman and between your seed and her seed: by him will your head be crushed and by you his foot will be wounded.
To the woman he said, Great will be your pain in childbirth; in sorrow will your children come to birth; still your desire will be for your husband, but he will be your master.
And to Adam he said, Because you gave ear to the voice of your wife and took of the fruit of the tree which I said you were not to take, the earth is cursed on your account; in pain you will get your food from it all your life.
Thorns and waste plants will come up, and the plants of the field will be your food;
With the hard work of your hands you will get your bread till you go back to the earth from which you were taken: for dust you are and to the dust you will go back.
And the man gave his wife the name of Eve because she was the mother of all who have life.
And the Lord God made for Adam and for his wife coats of skins for their clothing.
And the Lord God said, Now the man has become like one of us, having knowledge of good and evil; and now if he puts out his hand and takes of the fruit of the tree of life, he will go on living for ever.
So the Lord God sent him out of the garden of Eden to be a worker on the earth from which he was taken.
--]]

NotifyManager = {};
local this = NotifyManager;

this.NotifyTB = {};

function NotifyManager.EndOfLine()
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

function NotifyManager.EndOfLine1()
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

function NotifyManager.Register(subjectName, id, notifyFunc)
  if this.NotifyTB[subjectName] ~= nil and this.NotifyTB[subjectName][id] ~= nil then  
    return;
  end
  
  log(string.Concat("subjectName: ", subjectName));
  
  if this.NotifyTB[subjectName] == nil then
    this.NotifyTB[subjectName] = {};
  end
  
  this.NotifyTB[subjectName][id] = notifyFunc;
end

function NotifyManager.UnRegister(subjectName, id)
  if this.NotifyTB[subjectName] ~= nil then
    this.NotifyTB[subjectName][id] = nil;
  end
end

function NotifyManager.EndOfLine2()
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

function NotifyManager.EndOfLine3()
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

function NotifyManager.Notify(subjectName, data)	
--  log(string.Concat("Notify Subject: ", subjectName));
  
  if this.NotifyTB[subjectName] ~= nil then
    for k, callbackFunc in pairs(this.NotifyTB[subjectName]) do
      callbackFunc(data);
    end
  end
end

function NotifyManager.EndOfLine4()
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