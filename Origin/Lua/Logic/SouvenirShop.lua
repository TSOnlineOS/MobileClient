SouvenirShop = {};
local this = SouvenirShop;
this.souvenirList = {};
this.giftsList = {};

--[[
All these were the children of Rachel whom Jacob had by her, fourteen persons.
And the son of Dan was Hushim.
And the sons of Naphtali: Jahzeel and Guni and Jezer and Shillem.
These were the children of Bilhah, whom Laban gave to his daughter Rachel, seven persons.
All the persons who came with Jacob into Egypt, the offspring of his body, were sixty-six, without taking into account the wives of Jacob's sons.
And the sons of Joseph whom he had in Egypt were two. Seventy persons of the family of Jacob came into Egypt.
Now he had sent Judah before him to Goshen, to get word from Joseph; and so they came to the land of Goshen.
And Joseph got his carriage ready and went to Goshen for the meeting with his father; and when he came before him, he put his arms round his neck, weeping.
And Israel said to Joseph, Now that I have seen you living again, I am ready for death.
And Joseph said to his brothers and to his father's people, I will go and give the news to Pharaoh, and say to him, My brothers and my father's people, from the land of Canaan, have come to me;
And these men are keepers of sheep and owners of cattle, and have with them their flocks and their herds and all they have.
Now when Pharaoh sends for you and says, What is your business?
You are to say, Your servants have been keepers of cattle from our early days up to now, like our fathers; in this way you will be able to have the land of Goshen for yourselves; because keepers of sheep are unclean in the eyes of the Egyptians.
--]]

function SouvenirShop.SetListOfGiftsInBag()
  table.Clear(this.giftsList);
  local temp = Item.GetBagByCategory(EThingsCategory.Props);

  for i = 1, table.Count(temp) do
    for id in pairs(souvenirDatas) do
      if id == temp[i].Id then
        table.insert(this.giftsList, temp[i]);
      end
    end
  end

  this.SortByQuality(this.giftsList, true);

end

function SouvenirShop.Demo()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function SouvenirShop.Demo1()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function SouvenirShop.SetSouvenirList()
  table.Clear(this.souvenirList);

  for itemId in pairs(souvenirDatas) do
    table.insert(this.souvenirList, souvenirDatas[itemId]);
  end

  this.SortByQuality(this.souvenirList, true);

end

function SouvenirShop.SortByQuality(list, forShop)
  if forShop then
    table.sort(list,
      function(a, b)
        if souvenirDatas[a.Id] == nil then return end;
        if souvenirDatas[a.Id].quality == souvenirDatas[b.Id].quality then
          return souvenirDatas[a.Id].price < souvenirDatas[b.Id].price
        else
          return souvenirDatas[a.Id].quality < souvenirDatas[b.Id].quality
        end
      end
    );
  else
    table.sort(list,
      function(a, b)
        if souvenirDatas[a.Id] == nil then return end;
        if souvenirDatas[a.Id].quality == souvenirDatas[b.Id].quality then
          return souvenirDatas[a.Id].price > souvenirDatas[b.Id].price
        else
          return souvenirDatas[a.Id].quality > souvenirDatas[b.Id].quality
        end
      end
    );
  end
end

function SouvenirShop.Demo2()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function SouvenirShop.Demo3()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end
