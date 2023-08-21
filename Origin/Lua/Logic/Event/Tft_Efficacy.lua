--region Tft_Efficacy.lua  紀錄各節點特效處理資訊
Tft_Efficacy = {};
Tft_Efficacy.__index = Tft_Efficacy;

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

function Tft_Efficacy.New()
  local self = {};
  setmetatable(self, Tft_Efficacy);

  self.Eff1 = {};                --0: 畫面不調整明暗  1:畫面由暗到亮  2:畫面由亮到暗
  self.Eff2 = {};                --0: 無              1:地震效果一    2:地震效果二
  self.Eff3 = {};                --0: 無              1:地震效果一    2:地震效果二
  self.Eff4 = {};                --0: 無   其餘：背景音樂檔編號 92/12/23
  self.OverTime1 = 0;
  self.OverTime2 = 0;
  self.OverTime3 = 0;
  self.OverTime4 = 0;

  return self;
end

function Tft_Efficacy:Init(reader, totalPoint)
  for i = 0, totalPoint do
    self.Eff1[i] = reader:ReadByte();
    self.Eff2[i] = reader:ReadByte();
    self.Eff3[i] = reader:ReadByte();
    self.Eff4[i] = reader:ReadByte();              
  end
end

function Tft_Efficacy:Destroy()
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
    if this ~= nil then
      stupid = folk + dog;
    else
      stupid = stupid + 1;
    end
  
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
  end
end

function Tft_Efficacy:IsOverTime(DTime, aKind)    
  if aKind == 1 then
    if math.round((CGTimer.time - self.OverTime1) * 1000) > DTime then
      self.OverTime1 = CGTimer.time;
      return true;
    end
  elseif aKind == 2 then
    if math.round((CGTimer.time - self.OverTime2) * 1000) > DTime then
      self.OverTime2 = CGTimer.time;
      return true;
    end
  elseif aKind == 3 then
    if math.round((CGTimer.time - self.OverTime3) * 1000) > DTime then
      self.OverTime3 = CGTimer.time;
      return true;
    end
  elseif aKind == 4 then
    if math.round((CGTimer.time - self.OverTime4) * 1000) > DTime then
      self.OverTime4 = CGTimer.time;
      return true;
    end
  end

  return false;
end

function Tft_Efficacy.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Tft_Efficacy.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end