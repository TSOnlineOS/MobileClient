--region MovieObjectManager.lua
--[[
    功能: 演出物件管理器，讀檔，管理檔案。
]]
require "Logic/Event/MovieObject"
require "Common/Queue"

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


MovieList = 
{
   --"001", 檔案有誤
   "17",
   "18",
   "19",
   "10965",
   "10997",
   "11502",
   "11509",
   "11569",
   "11811",
   --"12003",檔案有誤
   "12014",
   "12031",
   "12091",
   "12093",
   "12096",
   "12403",
   "12508",
   "12589",
   "12841",
   "12861",
   "12882",
   "12921",
   "12934",
   "12939",
   "13004",
   "13014",
   "13431",
   "13444",
   "13472",
   "13483",
   "13496",
   "13513",
   "13519",
   "13821",
   "13832",
   "13885",
   "13886", 
   "14102",
   "14506",
   "14697",
   "14802",
   "14831",
   "15025",
   "15031",
   "15135",
   "15435",
   "15456",
   "15524",
   "15543",
   "15702",
   "15845",
   "15863",
   "15893",
   --"16412",  377458 Not Found
   "16551",
   "18304",
   "18405",
   "18435",
   "18506", 
   "18513",
   "18705",
   "18802",
   "18819",
   "18856",
   "18990",
   "19506",
   "19509",
   "19512",
   "19525",
   "19528",
   "19851",
   "20413",
   "20831",
   "21001",
   "21021",
   "21411",
   "21717",
   "21727",
   "21742",
   "21749",
   "21757",
   "21762",
   "21763",
   "21802",
   "21814",
   "21819",
   "21833",
   "21847",
   "21864",
   "21871",
   "21884",
   "21896",
   "23423",
   "23812",
   "24816",
   "25052",
   "25139",
   "25179",
   "25413",
   "25419",
   "25435",
   "25437",
   "25601",
   "25731",
   "25802",
   "25807",
   "25812",
   "25821",
   "25828",
   "25833",
   "26531",
   "27171",
   "28002",
   "30483",
   --"30912",   Get Jpg Fail !! 10073 Not Found
   "31001",
   "48001",
   "48005",
   "48007",
   --"48020",  Get Jpg Fail !! 50298 Not Found
   "49911",
   "49912",
   "49913",
   "49914",
   --"54825", Get Jpg Fail !! 51089 Not Found
   "56517",
   "56528",
   "57511",
   "57536",
   "59422",
   "59432",
   --"59811",  Error
   "59841",
   "60012",
   "61002",
   "61012",
   "61031",
   "61041",
   "61411",
   "61431",
   "61528",
   "61535",
   "113741",
   --"113742",   000858
   "113761",
   "120311",
   "120912",
   "130141",
   "144411",
   "144412",
   "144413",
   "154511",
   "154512",
   "154561",
   "157022",
   "184051",
   "184052",
   "210001",
   "210002",
   "217170",
   "217561",
   "217562",
   "218140",
   "218471",
   "248211",
   "248212",
   "254151",
   "254152",
   "255231",
   "257061",
   "257062",
   "257311",
   "309032",
   "594541",
   "594542",
   "598421",
   "598422",
   "604311",
   "604312",
   "1343102",
}

MovieObjectManager = {};
local this = MovieObjectManager;

local movieObjectTable = {};
local isLoadingFinish = false;

local endloadCallBack = nil;
local waitLoadMovieQ = nil;
local loadCount = 0;
local loadlist = nil;

function MovieObjectManager.Initialize() 
  waitLoadMovieQ = Queue.New();
end

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

function MovieObjectManager.LoadAllMovie()  
  Tlog("MovieObjectManager", "Start Loading");

  loadingMovieObject.Count = 0;
  for k, v in pairs(MovieList) do
    waitLoadMovieQ:Enqueue(v);
  end

  this.Load();
end

function MovieObjectManager.Demo()
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

function MovieObjectManager.Dem1o()
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

function MovieObjectManager.GetMovie(id, callback)
  TlogError("MovieObjectManager", string.Concat("GetMovie: ", tostring(id)));

  if movieObjectTable[movieID] ~= nil then
    if callback ~= nil then
      callback(movieObjectTable[movieID]);
    end
  else
    endloadCallBack = callback;
    waitLoadMovieQ:Enqueue(id);
    this.Load();
  end
end

function MovieObjectManager.Load()
  local count = waitLoadMovieQ.Count;
  loadCount = count;
  for i = 1, count do
    local movieID = waitLoadMovieQ:Dequeue();
    
    DataManager.ReadData(string.format("Sty/%s.sty", movieID),
      function(file)
        local reader = DatReader.New(file);

        movieObjectTable[movieID] = MovieObject.New(reader);
        
        loadCount = loadCount - 1;
        if loadCount <= 0 then
          if endloadCallBack ~= nil then
            endloadCallBack(movieObjectTable[movieID]);
            endloadCallBack = nil;
          end      
        end
      end
    );
  end
end
--endregion

function MovieObjectManager.Demo5()
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
function MovieObjectManager.Demo6()
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

function MovieObjectManager.Demo7()
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