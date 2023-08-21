
--未載入字串表前用到的字串
Str_DownloadSize = "本次下載 : %.2f MB\n解壓縮後 : %.2f MB\n請注意自身網路流量及儲存空間"
Str_DiskFull = "儲存空間不足，請檢查儲存空間並重新啟動遊戲"
Str_DownloadResources = "下載遊戲資源 : %.2f MB / %.2f MB";
Str_DecompressResources = "解壓縮遊戲資源 : %d / %d";
Str_DownloadDatas = "下載遊戲演出、檔案 : %d / %d";
Str_DownloadImages = "下載遊戲圖片、檔案 : %.2f MB / %.2f MB";
Str_DecompressImages = "解壓縮遊戲圖片、檔案 : %d / %d";
Str_LoadData = "載入資料";
Str_LoadResource = "載入資源";
Str_NeedDownLoadResource = "後續遊戲內容需更新遊戲資源"

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

--GoogleAnalytics用到的字串
GALabel = {
  OpenUI = "開啟%s介面";
  CloseUI = "關閉%s介面";
  SwitchTag = "%s切換到%s頁籤";
  SwitchMainTag = "%s切換到%s主頁籤";
  SwitchSubTag = "%s切換到%s子頁籤";
  PrevPage = "前一頁";
  NextPage = "下一頁";
  Navigation = "導航";
  Mount = "坐騎";
  Buff = "Buff";
  Organization = "公會";
  Target = "目標";
  SwitchMission = "切換任務顯示";
  GetItem = "領取物品";
  OfficialSite = "官網";
  CustomerService = "客服中心";
  Atlas = "介面樣式";
  LogOut = "登出";
  Quit = "離開";
  PK = "PK";
  PlayOne = "團戰";
  PlayerInfo = "玩家資訊";
  NpcInfo = "武將資訊";
  Music = "音樂";
  Sound = "音效";
  StoredValue = "儲值";
  Action = "動作";
  Emotion = "表情";
  Cancel = "取消";
  Deliver = "快遞";
  Area = "分區";
  Show = "顯示";
  Hide = "隱藏";
  SendMessageboard = "寄送留言";
  Messageboard = "選擇留言";
  SelectItem = "選擇物品";
  AddBank = "擴充銀行";
  Save = "存入";
  Take = "拿出";
  SelectSever = "選擇伺服器";
  Connect = "連線";
  CreateRole = "創角";
  Rand = "隨機%s";
  Attr = "屬性";
  Element = "元素";
  Cancel = "取消";
  UISellSuccess = "介消使用成功";
  UISellFail = "介消使用失敗";
}

function string.IsNullOrEmpty(s)
  return s == nil or s == "";
end

--[[
And these two had a dream on the same night; the chief wine-servant and the chief bread-maker of the king of Egypt, who were in prison, the two of them had dreams with a special sense.
And in the morning when Joseph came to them he saw that they were looking sad.
And he said to the servants of Pharaoh who were in prison with him, Why are you looking so sad?
Then they said to him, We have had a dream, and no one is able to give us the sense. And Joseph said, Does not the sense of dreams come from God? what was your dream?
Then the chief wine-servant gave Joseph an account of his dream, and said, In my dream I saw a vine before me;
And on the vine were three branches; and it seemed as if it put out buds and flowers, and from them came grapes ready for cutting.
And Pharaoh's cup was in my hand, and I took the grapes and crushing them into Pharaoh's cup, gave the cup into Pharaoh's hand.
Then Joseph said, This is the sense of your dream: the three branches are three days;
After three days Pharaoh will give you honour, and put you back into your place, and you will give him his cup as you did before, when you were his wine-servant.
But keep me in mind when things go well for you, and be good to me and say a good word for me to Pharaoh and get me out of this prison:
For truly I was taken by force from the land of the Hebrews; and I have done nothing for which I might be put in prison.
Now when the chief bread-maker saw that the first dream had a good sense, he said to Joseph, I had a dream; and in my dream there were three baskets of white bread on my head;
And in the top basket were all sorts of cooked meats for Pharaoh; and the birds were taking them out of the baskets on my head.
Then Joseph said, This is the sense of your dream: the three baskets are three days;
--]]

--[[
Now at that time, Judah went away from his brothers and became the friend of a man of Adullam named Hirah.
And there he saw the daughter of a certain man of Canaan named Shua, and took her as his wife.
And she gave birth to a son, and he gave him the name Er.
And again she gave birth to a son, and he gave him the name Onan.
Then she had another son, to whom she gave the name Shelah; she was at Chezib when the birth took place.
And Judah took a wife for his first son Er, and her name was Tamar.
Now Er, Judah's first son, did evil in the eyes of the Lord, so that he put him to death.
Then Judah said to Onan, Go in to your brother's wife and do what it is right for a husband's brother to do; make her your wife and get offspring for your brother.
But Onan, seeing that the offspring would not be his, went in to his brother's wife, but let his seed go on to the earth, so that he might not get offspring for his brother.
And what he did was evil in the eyes of the Lord, so that he put him to death, like his brother.
Then Judah said to Tamar, his daughter-in-law, Go back to your father's house and keep yourself as a widow till my son Shelah becomes a man: for he had in his mind the thought that death might come to him as it had come to his brothers. So Tamar went back to her father's house.
And after a time, Bath-shua, Judah's wife, came to her end; and after Judah was comforted for her loss, he went to Timnah, where they were cutting the wool of his sheep, and his friend Hirah of Adullam went with him.
And when Tamar had news that her father-in-law was going up to Timnah to the wool-cutting,
She took off her widow's clothing, and covering herself with her veil, she took her seat near Enaim on the road to Timnah; for she saw that Shelah was now a man, but she had not been made his wife.
--]]

function string.Count(str)
  local len = #str;
  local left = len;
  local cnt = 0;
  local arr = { 0, 0xc0, 0xe0, 0xf0, 0xf8, 0xfc };

  while left ~= 0 do
    local tmp = string.byte(str, -left);
    local i = #arr;

    while arr[i] do
      if tmp >= arr[i] then
        left = left - i;
        break;
      end

      i = i - 1;
    end

    cnt = cnt + 1;
  end

  return cnt;
end

function string.Sub(str, start, len)
  local firstResult = "";
  local strResult = "";
  local maxLen = string.len(str);
  start = start - 1;

  --找到起始位置
  local preSite = 1;

  if start > 0 then
    for i = 1, maxLen do
      local s_dropping = string.byte(str, i);
      if not s_dropping then
        local s_str = string.sub(str, preSite, i - 1);

        preSite = i + 1;
        break;
      end
      
      if s_dropping < 128 or (i + 1 - preSite) == 3 then
        local s_str = string.sub(str, preSite, i);

        preSite = i + 1;
        firstResult = string.Concat(firstResult, s_str);

        local curLen = string.Count(firstResult);
        if curLen == start then
          break;
        end
      end
    end
  end
  
  --截取字符串
  preSite = string.len(firstResult) + 1;
  local startC = preSite;
  for i = startC, maxLen do
    local s_dropping = string.byte(str, i);
    if not s_dropping then
      local s_str = string.sub(str, preSite, i - 1);

      preSite = i;
      strResult = string.Concat(strResult, s_str);

      return strResult
    end
    
    if s_dropping < 128 or (i + 1 - preSite) == 3 then
      local s_str = string.sub(str, preSite, i)

      preSite = i + 1;
      strResult = string.Concat(strResult, s_str);

      local curLen = string.Count(strResult);
      if curLen == len then
        return strResult;
      end
    end
  end

  return strResult;
end

function string.GetLength(s)
  --计算字符串宽度
  --可以计算出字符宽度，用于显示使用
  local lenInByte = #s;
  local width = 0;
  local i = 1;

  while i <= lenInByte do
    local curByte = string.byte(s, i);

    local byteCount = 1;
    if curByte > 0 and curByte <= 127 then
      --1字节字符
      byteCount = 1;
    elseif curByte >= 192 and curByte < 223 then
      --双字节字符
      byteCount = 2;
    elseif curByte >= 224 and curByte < 239 then
      --汉字
      byteCount = 2;  --原本是3  因為delphi一個中文字長度是2所以改2
    elseif curByte >= 240 and curByte <= 247 then
      --4字节字符
      byteCount = 4;
    end

    --重置下一字节的索引
    i = i + byteCount;

    --字符的个数（长度
    width = width + 1;
  end

  return width;
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



--[[
Now in the days of Amraphel, king of Shinar, Arioch, king of Ellasar, Chedorlaomer, king of Elam, and Tidal, king of Goiim,
They made war with Bera, king of Sodom, and with Birsha, king of Gomorrah, Shinab, king of Admah, and Shemeber, king of Zeboiim, and the king of Bela (which is Zoar).
All these came together in the valley of Siddim (which is the Salt Sea).
For twelve years they were under the rule of Chedorlaomer, but in the thirteenth year they put off his control.
And in the fourteenth year, Chedorlaomer and the kings who were on his side, overcame the Rephaim in Ashteroth-karnaim, and the Zuzim in Ham, and the Emim in Shaveh-kiriathaim,
And the Horites in their mountain Seir, driving them as far as El-paran, which is near the waste land.
Then they came back to En-mishpat (which is Kadesh), making waste all the country of the Amalekites and of the Amorites living in Hazazon-tamar.
And the king of Sodom with the king of Gomorrah and the king of Admah and the king of Zeboiim and the king of Bela (that is Zoar), went out, and put their forces in position in the valley of Siddim,
Against Chedorlaomer, king of Elam, and Tidal, king of Goiim, and Amraphel, king of Shinar, and Arioch, king of Ellasar: four kings against the five.
Now the valley of Siddim was full of holes of sticky earth; and the kings of Sodom and Gomorrah were put to flight and came to their end there, but the rest got away to the mountain.
And the four kings took all the goods and food from Sodom and Gomorrah and went on their way.
And in addition they took Lot, Abram's brother's son, who was living in Sodom, and all his goods.
And one who had got away from the fight came and gave word of it to Abram the Hebrew, who was living by the holy tree of Mamre, the Amorite, the brother of Eshcol and Aner, who were friends of Abram.
And Abram, hearing that his brother's son had been made a prisoner, took a band of his trained men, three hundred and eighteen of them, sons of his house, and went after them as far as Dan.
--]]

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

function string.ChangeSymbol(s)
  s = string.gsub(s, ",", "，");
  s = string.gsub(s, "?", "？");
  s = string.gsub(s, "!", "！");
  
  return s;
end

function string.XOR(s, xor, offset)
  if offset == nil then
    offset = 0;
  end

  return string.gsub(
    s,
    ".",
    function(w)
      local result = bit.bxor(string.byte(w), xor) - offset;

      if result < 0 then
        result = result - (math.floor(result / DIV1) * SUBT1);
      end

      return string.char(result);
    end
  );
end

function string.GetChineseNumber(value)
  local result = "";
  local count = 0;
  local currentValue = 0;
  local currentResult = "";
  local extraResult = "";
  local lastIsZero = false;

  if value == 0 then
    return string.Get(22578);
  end
  
  while value ~= 0 do
    count = count + 1;
    currentValue = value % 10;
    value = math.floor(value / 10);
    
    if count % 4 == 1 then
      if count / 4 < 1 then
        extraResult = "";
      elseif count / 4 < 2 then
        extraResult = string.Get(22579);
      elseif count / 4 < 3 then
        extraResult = string.Get(22580);
      elseif count / 4 < 4 then
        extraResult = string.Get(22581);
      end
    elseif count % 4 == 2 then
      extraResult = string.Get(22582);
    elseif count % 4 == 3 then
      extraResult = string.Get(22583);
    elseif count % 4 == 0 then
      extraResult = string.Get(22584);
    end
    
    currentResult = "";
    if currentValue == 0 then
      if count % 4 == 1 then
        currentResult = "";
        lastIsZero = false;
      else
        if not lastIsZero then
          currentResult = string.Get(22578);
        end
        extraResult = "";
        lastIsZero = true;
      end
    elseif currentValue == 1 then
      if count % 4 == 2 and value == 0 then
        currentResult = "";
      else
        currentResult = string.Get(22585);
      end
      lastIsZero = false;
    elseif currentValue == 2 then
      if count == 1 or count % 4 == 2 then
        currentResult = string.Get(22586);
      else
        currentResult = string.Get(22587);
      end
      lastIsZero = false;
    elseif currentValue == 3 then
      currentResult = string.Get(22588);
      lastIsZero = false;
    elseif currentValue == 4 then
      currentResult = string.Get(22589);
      lastIsZero = false;
    elseif currentValue == 5 then
      currentResult = string.Get(22590);
      lastIsZero = false;
    elseif currentValue == 6 then
      currentResult = string.Get(22591);
      lastIsZero = false;
    elseif currentValue == 7 then
      currentResult = string.Get(22592);
      lastIsZero = false;
    elseif currentValue == 8 then
      currentResult = string.Get(22593);
      lastIsZero = false;
    elseif currentValue == 9 then
      currentResult = string.Get(22594);
      lastIsZero = false;
    end
    
    result = string.Concat(currentResult, extraResult, result);
  end
  
  --logError(result);
  return result;
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

function string.GetChineseNumberLower(value)
  if LuaHelper.CheckDefine("TH") then
    return value;
  else
    return string.GetChineseNumber(value);
  end
end

function string.GetSecondText(seconds, shortText)
  local result = "";

  local day = math.floor(seconds / 86400);
  if day > 0 then
    result = string.Concat(result, day, string.Get(49031));
  end

  local hour = math.floor(seconds / 3600) % 24;
  if hour > 0 then
    if day > 0 then
      result = string.Concat(result, string.TenDigits(hour), string.Get(49032));
    else
      result = string.Concat(result, hour, string.Get(49032));
    end
  elseif day > 0 then
    result = string.Concat(result, "00", string.Get(49032));
  end

  local min = math.floor(seconds / 60) % 60;
  if min > 0 then
    if day > 0 or hour > 0 then
      result = string.Concat(result, string.TenDigits(min), string.Get(49033));
    else
      result = string.Concat(result, min, string.Get(49033));
    end
  elseif hour > 0 then
    result = string.Concat(result, "00", string.Get(49033));
  end

  if shortText == true and seconds >= 60 then return result end

  local second = seconds % 60;
  if second > 0 then
    if day > 0 or hour > 0 or min > 0 then
      result = string.Concat(result, string.TenDigits(second), string.Get(40145));
    else
      result = string.Concat(result, second, string.Get(40145));
    end
  elseif min > 0 then
    result = string.Concat(result, "00", string.Get(40145));
  end

  return result;
end

function string.GetSecondSymbol(seconds)
  local result = "";

  local hour = math.floor(seconds / 3600);
  if hour > 0 then 
    result = string.Concat(result, string.TenDigits(hour), ":");
  else
    result = string.Concat(result, "00:");
  end

  local min = math.floor(seconds / 60) % 60;
  if min > 0 then
    result = string.Concat(result, string.TenDigits(min), ":");
  else
    result = string.Concat(result, "00:");
  end

  local second = seconds % 60;
  if second > 0 then
    result = string.Concat(result, string.TenDigits(second));
  else
    result = string.Concat(result, "00");
  end

  return result;
end

--[[
Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: these are the sons which they had after the great flow of waters
The sons of Japheth: Gomer and Magog and Madai and Javan and Tubal and Meshech and Tiras.
And the sons of Gomer: Ashkenaz and Riphath and Togarmah.
And the sons of Javan: Elishah and Tarshish, the Kittim and the Dodanim.
From these came the nations of the sea-lands, with their different families and languages.
And the sons of Ham: Cush and Mizraim and Put and Canaan.
And the sons of Cush: Seba and Havilah and Sabtah and Raamah and Sabteca; and the sons of Raamah: Sheba and Dedan.
And Cush was the father of Nimrod, who was the first of the great men of the earth.
He was a very great bowman, so that there is a saying, Like Nimrod, a very great bowman.
And at the first, his kingdom was Babel and Erech and Accad and Calneh, in the land of Shinar.
From that land he went out into Assyria, building Nineveh with its wide streets and Calah,
And Resen between Nineveh and Calah, which is a very great town.
And Mizraim was the father of the Ludim and Anamim and Lehabim and Naphtuhim;
And Pathrusim and Casluhim and Caphtorim, from whom came the Philistines.
And Canaan was the father of Zidon, who was his oldest son, and Heth,
And the Jebusite and the Amorite and the Girgashite,
And the Hivite and the Arkite and the Sinite,
And the Arvadite and the Zemarite and the Hamathite; after that the families of the Canaanites went far and wide in all directions;
Their country stretching from Zidon to Gaza, in the direction of Gerar; and to Lasha, in the direction of Sodom and Gomorrah and Admah and Zeboiim.
All these, with their different families, languages, lands, and nations, are the offspring of Ham.
And Shem, the older brother of Japheth, the father of the children of Eber, had other sons in addition.
These are the sons of Shem: Elam and Asshur and Arpachshad and Lud and Aram.
And the sons of Aram: Uz and Hul and Gether and Mash.
And Arpachshad became the father of Shelah; and Shelah became the father of Eber.
And Eber had two sons: the name of the one was Peleg, because in his time the peoples of the earth became separate; and his brother's name was Joktan.
And Joktan was the father of Almodad and Sheleph and Hazarmaveth and Jerah
And Hadoram and Uzal and Diklah
And Obal and Abimael and Sheba
And Ophir and Havilah and Jobab; all these were the sons of Joktan.
And their country was from Mesha, in the direction of Sephar, the mountain of the east.
These, with their families and their languages and their lands and their nations, are the offspring of Shem.
--]]

function string.TenDigits(number)
   return string.Concat(math.floor(number / 10), number % 10);
end

function string.GetColorText(s, color)
  return string.format("<color=#%02x%02x%02x%02x>%s</color>", color.r * 255, color.g * 255, color.b * 255, color.a * 255, s);
end

function string.AddBrackets(s)
  return string.Concat("【", s, "】");
end

function string.Trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"));
end

function string.CheckName(s)
  if s == nil or s == "" then
    ShowCenterMessage(string.Get(50021));
    return false;
  end

  if not TextChecker.Check(s, TextChecker.Name, 1, 14) then
    ShowCenterMessage(string.Get(50022));
    return false;
  end

  for k, v in pairs(illegalDatas) do
    if string.match(s, string.GetNocase(v)) ~= nil then
      ShowCenterMessage(string.Get(50022));
      return false;
    end
  end

  if string.GetLength(s) > 14 then
    ShowCenterMessage(string.Get(49005));
    return false;
  end

  return true;
end

function string.ReomveSymbol(str, symbol)  
  local subStr = {}  
  while true do  
    local pos = string.find(str, symbol);
    if not pos then  
      subStr[#subStr+1] = str;
      break  
    end        
    subStr[#subStr+1] = string.sub(str, 1, pos-1);  
    str = string.sub(str, pos+1, #str)  
  end  
  return table.concat(subStr);
end

--[[
Now at that time, Judah went away from his brothers and became the friend of a man of Adullam named Hirah.
And there he saw the daughter of a certain man of Canaan named Shua, and took her as his wife.
And she gave birth to a son, and he gave him the name Er.
And again she gave birth to a son, and he gave him the name Onan.
Then she had another son, to whom she gave the name Shelah; she was at Chezib when the birth took place.
And Judah took a wife for his first son Er, and her name was Tamar.
Now Er, Judah's first son, did evil in the eyes of the Lord, so that he put him to death.
Then Judah said to Onan, Go in to your brother's wife and do what it is right for a husband's brother to do; make her your wife and get offspring for your brother.
But Onan, seeing that the offspring would not be his, went in to his brother's wife, but let his seed go on to the earth, so that he might not get offspring for his brother.
And what he did was evil in the eyes of the Lord, so that he put him to death, like his brother.
Then Judah said to Tamar, his daughter-in-law, Go back to your father's house and keep yourself as a widow till my son Shelah becomes a man: for he had in his mind the thought that death might come to him as it had come to his brothers. So Tamar went back to her father's house.
And after a time, Bath-shua, Judah's wife, came to her end; and after Judah was comforted for her loss, he went to Timnah, where they were cutting the wool of his sheep, and his friend Hirah of Adullam went with him.
And when Tamar had news that her father-in-law was going up to Timnah to the wool-cutting,
She took off her widow's clothing, and covering herself with her veil, she took her seat near Enaim on the road to Timnah; for she saw that Shelah was now a man, but she had not been made his wife.
--]]

--[[
And these two had a dream on the same night; the chief wine-servant and the chief bread-maker of the king of Egypt, who were in prison, the two of them had dreams with a special sense.
And in the morning when Joseph came to them he saw that they were looking sad.
And he said to the servants of Pharaoh who were in prison with him, Why are you looking so sad?
Then they said to him, We have had a dream, and no one is able to give us the sense. And Joseph said, Does not the sense of dreams come from God? what was your dream?
Then the chief wine-servant gave Joseph an account of his dream, and said, In my dream I saw a vine before me;
And on the vine were three branches; and it seemed as if it put out buds and flowers, and from them came grapes ready for cutting.
And Pharaoh's cup was in my hand, and I took the grapes and crushing them into Pharaoh's cup, gave the cup into Pharaoh's hand.
Then Joseph said, This is the sense of your dream: the three branches are three days;
After three days Pharaoh will give you honour, and put you back into your place, and you will give him his cup as you did before, when you were his wine-servant.
But keep me in mind when things go well for you, and be good to me and say a good word for me to Pharaoh and get me out of this prison:
For truly I was taken by force from the land of the Hebrews; and I have done nothing for which I might be put in prison.
Now when the chief bread-maker saw that the first dream had a good sense, he said to Joseph, I had a dream; and in my dream there were three baskets of white bread on my head;
And in the top basket were all sorts of cooked meats for Pharaoh; and the birds were taking them out of the baskets on my head.
Then Joseph said, This is the sense of your dream: the three baskets are three days;
--]]

function string.Concat(...)
  return table.concat({ ... });
end

--字串表
local tempParameter = nil;
local tempText = "";
function string.Get(key, parameter)
  if key == nil or key == 0 then
    return "";
  end
  
  if textDatas == nil or textDatas[key] == nil then
    logWarn(string.Concat("Text[", key, "] is empty !!"));
    return "";
  end
  
  tempParameter = parameter;
  
  tempText = string.gsub(textDatas[key], "<%%(.-)%%>", string.Parse);
  
  return tempText;
end

function string.Parse(text)
  local key = tonumber(string.match(text, "(%d+)"));
  local value = tonumber(string.match(text, "=(%d+)"));
  
  if key == 1 then
    --玩家名稱
    if Role.player ~= nil then
      return Role.player.name;
    else
      return text;
    end
  elseif key == 2 then
    --現實日期
    return CGTimer.serverTime:ToShortDateString();
  elseif key == 3 then
    --現實時間
    return CGTimer.serverTime:ToShortTimeString();
  elseif key == 4 then
    --NPC名稱
    if npcDatas[value] ~= nil then
      return npcDatas[value].name;
    end
  elseif key == 5 then
    --物品名稱
    if itemDatas[value] ~= nil then
      return itemDatas[value]:GetName(true);
    end
  elseif key == 6 then
    --成就名稱
    if achievementDatas[value] ~= nil then
      return achievementDatas[value].name;
    end
  elseif key == 7 then
    --字串
    if textDatas[value] ~= nil then
      return textDatas[value];
    end
  elseif key == 8 then
    --中文數字
    return string.GetChineseNumber(value);
  elseif key == 9 then
    --GS名稱  
    for i = 1, table.Count(Network.servers) do
      if Network.servers[i].id == value then
        return Network.servers[i].name
      end
    end  
  end
  
  return string.Concat("%", text, "%");
end

function string.GetAttribute(kind)
  if kind == 1 then
    return string.Get(20037);
  elseif kind == 2 then
    return string.Get(20038);
  elseif kind == 3 then
    return string.Get(20039);
  elseif kind == 4 then
    return string.Get(20042);
  elseif kind == 5 then
    return string.Get(20040);
  elseif kind == 6 then
    return string.Get(20041);
  end
  
  return "";
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

function string.GetMoral(kind, singleWord)
  if kind == 0 then
    return string.Get(20001);
  elseif kind == 1 then
    return string.Get(10086);
  elseif kind == 2 then
    return string.Get(10087);
  elseif kind == 3 then
    return string.Get(10088);
  elseif kind == 4 then
    if singleWord then
      return string.Get(21485);
    else
      return string.Get(10089);
    end
  elseif kind == 5 then
    if singleWord then
      return string.Get(21486)
    else
      return string.Get(10090);
    end
  end
  
  return "";
end

function string.GetFightWay(kind)
  if kind == 1 then
    return string.Get(20011);
  elseif kind == 2 then
    return string.Get(20012);
  elseif kind == 3 then
    return string.Get(20013);
  elseif kind == 4 then
    return string.Get(20014);
  elseif kind == 5 then
    return string.Get(20015);
  elseif kind == 6 then
    return string.Get(20016);
  elseif kind == 7 then
    return string.Get(20017);
  elseif kind == 8 then
    return string.Get(20018);
  elseif kind == 9 then
    return string.Get(20019);
  elseif kind == 10 then
    return string.Get(20020);
  elseif kind == 11 then
    return string.Get(20021);
  elseif kind == 12 then
    return string.Get(20022);
  elseif kind == 13 then
    return string.Get(20023);
  elseif kind == 14 then
    return string.Get(20024);
  elseif kind == 15 then
    return string.Get(20025);
  elseif kind == 16 then
    return string.Get(20026);
  elseif kind == 17 then
    return string.Get(20027);
  elseif kind == 18 then
    return string.Get(20028);
  elseif kind == 19 then
    return string.Get(20029);
  elseif kind == 20 then
    return string.Get(20030);
  elseif kind == 21 then 
    return string.Get(20011);
  elseif kind == 22 then
    return string.Get(23619);
  end
  
  return "";
end

function string.GetFightArea(kind)
  --1 一人, 2同列二人, 3行三人, 4跳三人, 5十字五人, 6六人, 7同行五人, 8全體 
  if kind == 1 then
    return string.Get(99662);
  elseif kind == 2 then
    return string.Get(99663);
  elseif kind == 3 then
    return string.Get(99664);
  elseif kind == 4 then
    return string.Get(99665);
  elseif kind == 5 then
    return string.Get(99666);
  elseif kind == 6 then
    return string.Get(99667);
  elseif kind == 7 then
    return string.Get(99668);
  elseif kind == 8 or kind == 255 then
    return string.Get(99669);
  end
  return "";
end

function string.GetCurrency(currency)
  if currency == ECurrency.Money then
    return TextParse.GetSpriteText("common0", "common0_icon018", 20, 20, 0, 2);
  elseif currency == ECurrency.Silver then
    return TextParse.GetSpriteText("common0", "common0_icon023", 20, 20, 0, 2);
  elseif currency == ECurrency.Gold then
    return TextParse.GetSpriteText("common0", "common0_icon022", 20, 20, 0, 2);
  elseif currency == ECurrency.OrgGold then
    return TextParse.GetSpriteText("common0", "common0_icon063", 20, 20, 0, 2);
  elseif currency == ECurrency.DataFight then
    return TextParse.GetSpriteText("common0", "common0_icon066", 20, 20, 0, 2);
  elseif currency == ECurrency.furnitureAdvanced then
    return TextParse.GetSpriteText("common0", "common0_icon136", 20, 20, 0, 2);
  elseif currency == ECurrency.furnitureNormal then
    return TextParse.GetSpriteText("common0", "common0_icon137", 20, 20, 0, 2);
  elseif currency == ECurrency.Elf then
    return TextParse.GetSpriteText("common0", "common0_icon155", 20, 20, 0, 2);
  elseif currency == ECurrency.TS then
    return TextParse.GetSpriteText("common0", "common0_icon154", 20, 20, 0, 2);
  elseif currency == ECurrency.Soul then
    return TextParse.GetSpriteText("common0", "common0_icon158", 20, 20, 0, 2);
  elseif currency == ECurrency.ColorSoul then
    return TextParse.GetSpriteText("common0", "common0_icon161", 20, 20, 0, 2);
  elseif currency == ECurrency.WarriorTicket then
    return TextParse.GetSpriteText("common0", "common0_icon165", 20, 20, 0, 2);
  elseif currency == ECurrency.CardTicket then
    return TextParse.GetSpriteText("common0", "common0_icon164", 20, 20, 0, 2);
  elseif currency == ECurrency.ExclusiveWeaponTicket then
    return TextParse.GetSpriteText("common0", "common0_icon163", 20, 20, 0, 2);
  elseif currency == ECurrency.OutfitTicket then
    return TextParse.GetSpriteText("common0", "common0_icon162", 20, 20, 0, 2);
  else
    return "";
  end
end

function string.GetCurrencyName(currency)
  if currency == ECurrency.Money then
    return string.Get(10099);
  elseif currency == ECurrency.Silver then
    return string.Get(10098);
  elseif currency == ECurrency.Gold then
    return string.Get(10097);
  elseif currency == ECurrency.OrgGold then
    return "";
  elseif currency == ECurrency.DataFight then
    return string.Get(22796);
  elseif currency == ECurrency.furnitureAdvanced then
    return string.Get(23572);
  elseif currency == ECurrency.furnitureNormal then
    return string.Get(23573);
  elseif currency == ECurrency.Elf then
    return string.Get(23736);
  elseif currency == ECurrency.TS then
    return string.Get(23737);
  elseif currency == ECurrency.Soul then
    return string.Get(23932);
  elseif currency == ECurrency.ColorSoul then
    return string.Get(23933);
  elseif currency == ECurrency.WarriorTicket then
    return string.Get(23939);
  elseif currency == ECurrency.CardTicket then
    return string.Get(23940);
  elseif currency == ECurrency.ExclusiveWeaponTicket then
    return string.Get(23941);
  elseif currency == ECurrency.OutfitTicket then
    return string.Get(23942);
  else
    return "";
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

function string.GetUiSellFail(sellId, kind, value)
  if kind == 1 then
    return string.Get(10137); --無介消資料
  elseif kind == 2 then
    return string.fromat(string.Get(10138), value); --等級不足
  elseif kind == 3 then
    return string.Get(10139); --RoleCount索引錯誤
  elseif kind == 4 then
    return string.Get(10140); --價格錯誤
  elseif kind == 5 then
    return string.Get(40077); --金錢不足
  elseif kind == 6 then
    return string.Get(10141); --扣金錢失敗
  elseif kind == 7 then
    return string.Get(10143); --扣物品失敗
  elseif kind == 10 then
    return string.Get(10142); --檢查使用物品錯誤
  elseif kind == 11 then
    if Contains(sellId, 1, 3 ,56) then
      return string.Get(20343); --背包介消次數已滿但成就取得物品還可使用的訊息
    elseif uisellDatas[sellId].customString > 0 then
      return string.Get(uisellDatas[sellId].customString);
    else
      return string.Get(40390); --已達最大上限
    end
  elseif kind == 12 then
    return string.Get(80360); --元寶不足
  elseif kind == 13 then
    return string.Get(20128); --綁元不足
  elseif kind == 14 then
    return string.Get(80099); --戰鬥中不可使用介消玩轉轉樂
  elseif kind == 15 then
    return string.Get(21272); --不可使用
  elseif kind == 16 then
    return string.Get(21273); --條件未完成
  elseif kind == 17 then
    return string.Get(21540); --所在場景不可傳送
  elseif kind == 18 then
    ShowCenterMessage(string.Get(22018));
    return string.Concat(string.Get(22006)); --藏龍寶箱時間未到
  elseif kind == 20 then
    return string.Get(22172); --吞食歡樂幣不足
  elseif kind == 21 then
    return string.Get(20763); --投幣達上限
  elseif kind == 26 then 
    return string.Get(22346); --商品已下架
  elseif kind == 35 then      --戳戳樂硬幣已滿
    return string.Get(22459);
  elseif kind == 254 then
    return string.Get(22173); --功能關閉中
  else
    return string.Get(10144); --未知錯誤
  end
end

function string.GetMissionKind(kind)
  if kind == 1 then
    return string.Get(20149);
  elseif kind == 2 then
    return string.Get(20150);
  elseif kind == 3 then
    return string.Get(20151);
  elseif kind == 4 then
    return string.Get(10118);
  elseif kind == 5 then
    return string.Get(10118);
  elseif kind == 6 then
    return string.Get(20066);
  elseif kind == 7 then
    return string.Get(20066);
  elseif kind == 8 then
    return string.Get(20066);
  end

  return "";
end

function string.GetElement(element)
  if element == 0 then
    return string.Get(20001);--無
  elseif element == 1 then
    return string.Get(20002);--地
  elseif element == 2 then
    return string.Get(20003);--水
  elseif element == 3 then
    return string.Get(20004);--火
  elseif element == 4 then
    return string.Get(20005);--風
  elseif element == 5 then
    return string.Get(20006);--心
  elseif element == 7 then
    return string.Get(20922);--光
  elseif element == 8 then
    return string.Get(20923);--暗
  else
    return "";
  end
end

function string.GetElementHint(element)
  if element == 1 then
   return string.Get(20007);
  elseif element == 2 then
    return string.Get(20008);
  elseif element == 3 then
    return string.Get(20009);
  elseif element == 4 then
    return string.Get(20010);
  end
end

function string.GetCareer(career)
  if career == 0 then
    return string.Get(20592); --轉
  elseif career == 1 then
    return string.Get(20962); --俠
  elseif career == 2 then
    return string.Get(20963); --霸
  elseif career == 3 then
    return string.Get(20964); --賢
  elseif career == 4 then
    return string.Get(20965); --仙
  end
end

function string.GetCareerHint(career)
  if career == 1 then
    return string.Get(22555); --俠
  elseif career == 2 then
    return string.Get(22553); --霸
  elseif career == 3 then
    return string.Get(22554); --賢
  elseif career == 4 then
    return string.Get(22556); --仙
  else
    return "";
  end
end

function string.GetDoroName(kind)
  if kind == 1 then
    return string.Get(98035) --武將
  elseif kind == 2 then
    return string.Get(21419) --卡片
  end
end

function string.GetCardName(warriorId)
  return string.Concat(warriorId, "_S");
end

function string.GetServerText(data)
  local result = "";
  
  local textKind = data:ReadByte();
  
  if textKind == 0 then
    result = data:ReadString(data:ReadByte());
  elseif textKind == 1 then
    result = string.Get(data:ReadInt32());
  elseif textKind == 2 then
    result = tostring(data:ReadInt32());
  elseif textKind == 3 then
    result = string.AddBrackets(string.Get(data:ReadInt32()));
  end
  
  local count = data:ReadByte();
  
  local argTexts = {};
  for i = 1, count do
    textKind = data:ReadByte();
    
    if textKind == 0 then
      argTexts[i] = data:ReadString(data:ReadByte());
    elseif textKind == 1 then
      argTexts[i] = string.Get(data:ReadInt32());
    elseif textKind == 2 then
      argTexts[i] = tostring(data:ReadInt32());
    elseif textKind == 3 then
      argTexts[i] = string.AddBrackets(string.Get(data:ReadInt32()));
    end
  end
  
  local currentIndex = 0;
  result = string.gsub(
    result, 
    "%%s", 
    function(text)
      currentIndex = currentIndex + 1;
      return argTexts[currentIndex];
    end,
    count
  );
  
  return result;
end

function string.GetChannelText(channel)
  if channel == EChannel.System then
    return string.Get(20618);
  elseif channel == EChannel.World then
    return string.Get(20796);
  elseif channel == EChannel.Scene then
    return string.Get(20791);
  elseif channel == EChannel.Whisper then
    return string.Get(20792);
  elseif channel == EChannel.GM then
    return "GM";
  elseif channel == EChannel.Team then
    return string.Get(20793);
  elseif channel == EChannel.Organization then
    return string.Get(20794);
  elseif channel == EChannel.Ally then
    return string.Get(20795);
  else
    return "";
  end
end

function string.GetNocase(s)
  s = string.gsub(s, "%a",
    function (c)
      return string.format("[%s%s]", string.lower(c), string.upper(c))
    end
  )
  
  return s
end

--[[In the beginning God created the heaven and the earth.At the first God made the heaven and the earth.
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
And God gave them his blessing, saying, Be fertile and have increase, making all the waters of the seas full, and let the birds be increased in the earth.--]]



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



--[[
Now in the days of Amraphel, king of Shinar, Arioch, king of Ellasar, Chedorlaomer, king of Elam, and Tidal, king of Goiim,
They made war with Bera, king of Sodom, and with Birsha, king of Gomorrah, Shinab, king of Admah, and Shemeber, king of Zeboiim, and the king of Bela (which is Zoar).
All these came together in the valley of Siddim (which is the Salt Sea).
For twelve years they were under the rule of Chedorlaomer, but in the thirteenth year they put off his control.
And in the fourteenth year, Chedorlaomer and the kings who were on his side, overcame the Rephaim in Ashteroth-karnaim, and the Zuzim in Ham, and the Emim in Shaveh-kiriathaim,
And the Horites in their mountain Seir, driving them as far as El-paran, which is near the waste land.
Then they came back to En-mishpat (which is Kadesh), making waste all the country of the Amalekites and of the Amorites living in Hazazon-tamar.
And the king of Sodom with the king of Gomorrah and the king of Admah and the king of Zeboiim and the king of Bela (that is Zoar), went out, and put their forces in position in the valley of Siddim,
Against Chedorlaomer, king of Elam, and Tidal, king of Goiim, and Amraphel, king of Shinar, and Arioch, king of Ellasar: four kings against the five.
Now the valley of Siddim was full of holes of sticky earth; and the kings of Sodom and Gomorrah were put to flight and came to their end there, but the rest got away to the mountain.
And the four kings took all the goods and food from Sodom and Gomorrah and went on their way.
And in addition they took Lot, Abram's brother's son, who was living in Sodom, and all his goods.
And one who had got away from the fight came and gave word of it to Abram the Hebrew, who was living by the holy tree of Mamre, the Amorite, the brother of Eshcol and Aner, who were friends of Abram.
And Abram, hearing that his brother's son had been made a prisoner, took a band of his trained men, three hundred and eighteen of them, sons of his house, and went after them as far as Dan.
--]]

function string.GetRoleKey()
  return string.format("_%d_%s", Network.serverId, Role.playerId);
end

function string.GetCommaValue(amount)
  local formatted = amount
  while true do  
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
    if k == 0 then
      break
    end
  end
  return formatted
end

function string.GetProductionText(kind)
  if kind == EOrgProduction.Weapon then
    return string.Get(40245);
  elseif kind == EOrgProduction.Army then
    return string.Get(40244);
  end

  return "";
end

function string.GetCityLevelText(level)
  if level == 1 then
    return string.Get(40280);
  elseif level == 2 then
    return string.Get(40281);
  elseif level == 3 then
    return string.Get(40282);
  end

  return tostring(level);
end

function string.GetRandomName()
  local fullName;
  local min = 1;
  local max = table.Count(randomNameDatas);

  if math.random(2) == 1 then
    local name1, name2, name3;
    
    name1 = randomNameDatas[math.random(min, max)].firstName;
    if currentSex == 1 then
      name2 = randomNameDatas[math.random(min, max)].boyName;
      name3 = randomNameDatas[math.random(min, max)].boyName;
    else
      name2 = randomNameDatas[math.random(min, max)].girlName;
      name3 = randomNameDatas[math.random(min, max)].girlName;
    end

    fullName = string.Concat(name1, name2, name3);
  else
    local nameSp1, nameSp2;

    nameSp1 = randomNameDatas[math.random(min, max)].spNameA;
    nameSp2 = randomNameDatas[math.random(min, max)].spNameB;

    fullName = string.Concat(nameSp1, nameSp2);
  end

  return fullName;
end

function string.DecodeURI(s)
  s = string.gsub(s, '%%(%x%x)', function(h) return string.char(tonumber(h, 16)) end)
  return s
end

function string.EncodeURI(s)
  s = string.gsub(s, "([^%w%.%- ])", function(c) return string.format("%%%02X", string.byte(c)) end)
  return string.gsub(s, " ", "+")
end
