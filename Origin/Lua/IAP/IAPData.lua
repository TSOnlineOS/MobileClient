IAPData = {}

--[[
Googel / IOS
]]--
local productName = {};
function IAPData.GetProductName()

  if LuaHelper.CheckDefine("NFT") then
    return IAPData.GetNFTProduct();
  end

  return {};
end

function IAPData.AviodCov()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function IAPData.AviodCov1()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function IAPData.GetTWProduct()
  local result
  if LuaHelper.IsAndroidPlatform then
    result = {
      "net.chinesegamer.tsm.gold01",
      "net.chinesegamer.tsm.gold02",
      "net.chinesegamer.tsm.gold03",
      "net.chinesegamer.tsm.gold04",
      "net.chinesegamer.tsm.gold05",
      "net.chinesegamer.tsm.gold06",
      "net.chinesegamer.tsm.item01",
      "net.chinesegamer.tsm.item02",
      "net.chinesegamer.tsm.item03",
      "net.chinesegamer.tsm.item04",
      "net.chinesegamer.tsm.item05",
      "net.chinesegamer.tsm.item06",
      "net.chinesegamer.tsm.item07",
      "net.chinesegamer.tsm.item08",
      "net.chinesegamer.tsm.item09",
      "net.chinesegamer.tsm.item10",
      "net.chinesegamer.tsm.item11",
      "net.chinesegamer.tsm.item12",
      "net.chinesegamer.tsm.item13",
      "net.chinesegamer.tsm.item14",
      "net.chinesegamer.tsm.item15",
      "net.chinesegamer.tsm.item16",
      "net.chinesegamer.tsm.item17",
      "net.chinesegamer.tsm.item18",
      "net.chinesegamer.tsm.item19",
      "net.chinesegamer.tsm.item20",
      "net.chinesegamer.tsm.item21",
      "net.chinesegamer.tsm.item22",
      "net.chinesegamer.tsm.item23",
      "net.chinesegamer.tsm.item24",
      "net.chinesegamer.tsm.item25",
      "net.chinesegamer.tsm.item26",
      "net.chinesegamer.tsm.item27",
      "net.chinesegamer.tsm.item28",
    };
  elseif LuaHelper.IsApplePlatform then
    result = {
      "net.chinesegamer.tsm.gold01",
      "net.chinesegamer.tsm.gold02",
      "net.chinesegamer.tsm.gold03",
      "net.chinesegamer.tsm.gold04",
      "net.chinesegamer.tsm.gold05",
      "net.chinesegamer.tsm.gold06",
      "net.chinesegamer.tsm.item01",
      "net.chinesegamer.tsm.item02",
      "net.chinesegamer.tsm.item03",
      "net.chinesegamer.tsm.item04",
      "net.chinesegamer.tsm.item05",
      "net.chinesegamer.tsm.item06",
      "net.chinesegamer.tsm.item07",
      "net.chinesegamer.tsm.item08",
      "net.chinesegamer.tsm.item09",
      "net.chinesegamer.tsm.item10",
      "net.chinesegamer.tsm.item11",
      "net.chinesegamer.tsm.item12",
      "net.chinesegamer.tsm.item13",
      "net.chinesegamer.tsm.item14",
      "net.chinesegamer.tsm.item15",
      "net.chinesegamer.tsm.item16",
      "net.chinesegamer.tsm.item17",
      "net.chinesegamer.tsm.item18",
      "net.chinesegamer.tsm.item19",
      "net.chinesegamer.tsm.item20",
      "net.chinesegamer.tsm.item21",
      "net.chinesegamer.tsm.item22",
      "net.chinesegamer.tsm.item23",
      "net.chinesegamer.tsm.item24",
      "net.chinesegamer.tsm.item25",
      "net.chinesegamer.tsm.item26",
      "net.chinesegamer.tsm.item27",
      "net.chinesegamer.tsm.item28",
    };
  end
  return result;
end

function IAPData.GetHKProduct()
  local result
  if LuaHelper.IsAndroidPlatform then
    result = {
      "hk.chinesegamer.tsmhk.gold01",
      "hk.chinesegamer.tsmhk.gold02",
      "hk.chinesegamer.tsmhk.gold03",
      "hk.chinesegamer.tsmhk.gold04",
      "hk.chinesegamer.tsmhk.gold05",
      "hk.chinesegamer.tsmhk.gold06",
      "hk.chinesegamer.tsmhk.item01",
      "hk.chinesegamer.tsmhk.item02",
      "hk.chinesegamer.tsmhk.item03",
      "hk.chinesegamer.tsmhk.item04",
      "hk.chinesegamer.tsmhk.item05",
      "hk.chinesegamer.tsmhk.item06",
      "hk.chinesegamer.tsmhk.item07",
      "hk.chinesegamer.tsmhk.item08",
      "hk.chinesegamer.tsmhk.item09",
      "hk.chinesegamer.tsmhk.item10",
      "hk.chinesegamer.tsmhk.item11",
      "hk.chinesegamer.tsmhk.item12",
      "hk.chinesegamer.tsmhk.item13",
      "hk.chinesegamer.tsmhk.item14",
      "hk.chinesegamer.tsmhk.item15",
      "hk.chinesegamer.tsmhk.item16",
      "hk.chinesegamer.tsmhk.item17",
      "hk.chinesegamer.tsmhk.item18",
      "hk.chinesegamer.tsmhk.item19",
      "hk.chinesegamer.tsmhk.item20",
      "hk.chinesegamer.tsmhk.item21",
      "hk.chinesegamer.tsmhk.item22",
      "hk.chinesegamer.tsmhk.item23",
      "hk.chinesegamer.tsmhk.item24",
      "hk.chinesegamer.tsmhk.item25",
      "hk.chinesegamer.tsmhk.item26",
      "hk.chinesegamer.tsmhk.item27",
      "hk.chinesegamer.tsmhk.item28",
    };
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
  elseif LuaHelper.IsApplePlatform then
    result = {
      "hk.chinesegamer.tsmhk.gold01",
      "hk.chinesegamer.tsmhk.gold02",
      "hk.chinesegamer.tsmhk.gold03",
      "hk.chinesegamer.tsmhk.gold04",
      "hk.chinesegamer.tsmhk.gold05",
      "hk.chinesegamer.tsmhk.gold06",
      "hk.chinesegamer.tsmhk.item01",
      "hk.chinesegamer.tsmhk.item02",
      "hk.chinesegamer.tsmhk.item03",
      "hk.chinesegamer.tsmhk.item04",
      "hk.chinesegamer.tsmhk.item05",
      "hk.chinesegamer.tsmhk.item06",
      "hk.chinesegamer.tsmhk.item07",
      "hk.chinesegamer.tsmhk.item08",
      "hk.chinesegamer.tsmhk.item09",
      "hk.chinesegamer.tsmhk.item10",
      "hk.chinesegamer.tsmhk.item11",
      "hk.chinesegamer.tsmhk.item12",
      "hk.chinesegamer.tsmhk.item13",
      "hk.chinesegamer.tsmhk.item14",
      "hk.chinesegamer.tsmhk.item15",
      "hk.chinesegamer.tsmhk.item16",
      "hk.chinesegamer.tsmhk.item17",
      "hk.chinesegamer.tsmhk.item18",
      "hk.chinesegamer.tsmhk.item19",
      "hk.chinesegamer.tsmhk.item20",
      "hk.chinesegamer.tsmhk.item21",
      "hk.chinesegamer.tsmhk.item22",
      "hk.chinesegamer.tsmhk.item23",
      "hk.chinesegamer.tsmhk.item24",
      "hk.chinesegamer.tsmhk.item25",
      "hk.chinesegamer.tsmhk.item26",
      "hk.chinesegamer.tsmhk.item27",
      "hk.chinesegamer.tsmhk.item28",
    };
  end
  return result;
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

function IAPData.GetNFTProduct()
  local result
  if LuaHelper.IsAndroidPlatform then
    result = {
      "net.chinesegamer.tsn.gold01",
      "net.chinesegamer.tsn.gold02",
      "net.chinesegamer.tsn.gold03",
      "net.chinesegamer.tsn.gold04",
      "net.chinesegamer.tsn.gold05",
      "net.chinesegamer.tsn.gold06",
      "net.chinesegamer.tsn.item01",
      "net.chinesegamer.tsn.item02",
      "net.chinesegamer.tsn.item03",
      "net.chinesegamer.tsn.item04",
      "net.chinesegamer.tsn.item05",
      "net.chinesegamer.tsn.item06",
      "net.chinesegamer.tsn.item07",
      "net.chinesegamer.tsn.item08",
      "net.chinesegamer.tsn.item09",
      "net.chinesegamer.tsn.item10",
      "net.chinesegamer.tsn.item11",
      "net.chinesegamer.tsn.item12",
      "net.chinesegamer.tsn.item13",
      "net.chinesegamer.tsn.item14",
      "net.chinesegamer.tsn.item15",
      "net.chinesegamer.tsn.item16",
      "net.chinesegamer.tsn.item17",
      "net.chinesegamer.tsn.item18",
      "net.chinesegamer.tsn.item19",
      "net.chinesegamer.tsn.item20",
      "net.chinesegamer.tsn.item21",
      "net.chinesegamer.tsn.item22",
      "net.chinesegamer.tsn.item23",
      "net.chinesegamer.tsn.item24",
      "net.chinesegamer.tsn.eventitem01",
      "net.chinesegamer.tsn.eventitem02",
      "net.chinesegamer.tsn.eventitem03",
      "net.chinesegamer.tsn.eventitem04",
      "net.chinesegamer.tsn.eventitem05",
      "net.chinesegamer.tsn.eventitem06",
      "net.chinesegamer.tsn.eventitem07",
      "net.chinesegamer.tsn.eventitem08",
      "net.chinesegamer.tsn.eventitem09",
      "net.chinesegamer.tsn.eventitem10",
      "net.chinesegamer.tsn.eventitem11",
      "net.chinesegamer.tsn.eventitem12",
      "net.chinesegamer.tsn.eventitem13",
      "net.chinesegamer.tsn.eventitem14",
    };
  elseif LuaHelper.IsApplePlatform then
    result = {
      "net.funbear.tsbadou.gold01",
      "net.funbear.tsbadou.gold02",
      "net.funbear.tsbadou.gold03",
      "net.funbear.tsbadou.gold04",
      "net.funbear.tsbadou.gold05",
      "net.funbear.tsbadou.gold06",
      "net.funbear.tsbadou.item01",
      "net.funbear.tsbadou.item02",
      "net.funbear.tsbadou.item03",
      "net.funbear.tsbadou.item04",
      "net.funbear.tsbadou.item05",
      "net.funbear.tsbadou.item06",
      "net.funbear.tsbadou.item07",
      "net.funbear.tsbadou.item08",
      "net.funbear.tsbadou.item09",
      "net.funbear.tsbadou.item10",
      "net.funbear.tsbadou.item11",
      "net.funbear.tsbadou.item12",
      "net.funbear.tsbadou.item13",
      "net.funbear.tsbadou.item14",
      "net.funbear.tsbadou.item15",
      "net.funbear.tsbadou.item16",
      "net.funbear.tsbadou.item17",
      "net.funbear.tsbadou.item18",
      "net.funbear.tsbadou.item19",
      "net.funbear.tsbadou.item20",
      "net.funbear.tsbadou.item21",
      "net.funbear.tsbadou.item22",
      "net.funbear.tsbadou.item23",
      "net.funbear.tsbadou.item24",
      "net.funbear.tsbadou.eventitem01",
      "net.funbear.tsbadou.eventitem02",
      "net.funbear.tsbadou.eventitem03",
      "net.funbear.tsbadou.eventitem04",
      "net.funbear.tsbadou.eventitem05",
      "net.funbear.tsbadou.eventitem06",
      "net.funbear.tsbadou.eventitem07",
      "net.funbear.tsbadou.eventitem08",
      "net.funbear.tsbadou.eventitem09",
      "net.funbear.tsbadou.eventitem10",
      "net.funbear.tsbadou.eventitem11",
      "net.funbear.tsbadou.eventitem12",
      "net.funbear.tsbadou.eventitem13",
      "net.funbear.tsbadou.eventitem14",
    };
  end
  return result;
end

function IAPData.AviodCov6()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function IAPData.GetProductIndex()
  local result = {};

  if LuaHelper.IsAndroidPlatform then
    result = {
      [1] = 1,
      [2] = 2,
      [3] = 3,
      [4] = 4,
      [5] = 5,
      [6] = 6,
      [7] = 110,
      [8] = 112,
      [9] = 120,
      [10] = 121,
      [11] = 122,
      [12] = 123,
      [13] = 124,
      [14] = 125,
      [15] = 126,
      [16] = 127,
      [17] = 128,
      [18] = 129,
      [19] = 130,
      [20] = 131,
      [21] = 132,
      [22] = 133,
      [23] = 134,
      [24] = 135,
      [25] = 136,
      [26] = 137,
      [27] = 138,
      [28] = 139,
      [29] = 140,
      [30] = 155, --item24
      [31] = 141,
      [32] = 142,
      [33] = 143,
      [34] = 144,
      [35] = 145,
      [36] = 146,
      [37] = 147,
      [38] = 148,
      [39] = 149,
      [40] = 150,
      [41] = 151,
      [42] = 152,
      [43] = 153,
      [44] = 154,
    };
  elseif LuaHelper.IsApplePlatform then
    result = {
      [1] = 1,
      [2] = 2,
      [3] = 3,
      [4] = 4,
      [5] = 5,
      [6] = 6,
      [7] = 110,
      [8] = 112,
      [9] = 120,
      [10] = 121,
      [11] = 122,
      [12] = 123,
      [13] = 124,
      [14] = 125,
      [15] = 126,
      [16] = 127,
      [17] = 128,
      [18] = 129,
      [19] = 130,
      [20] = 131,
      [21] = 132,
      [22] = 133,
      [23] = 134,
      [24] = 135,
      [25] = 136,
      [26] = 137,
      [27] = 138,
      [28] = 139,
      [29] = 140,
      [30] = 155, --item24
      [31] = 141,
      [32] = 142,
      [33] = 143,
      [34] = 144,
      [35] = 145,
      [36] = 146,
      [37] = 147,
      [38] = 148,
      [39] = 149,
      [40] = 150,
      [41] = 151,
      [42] = 152,
      [43] = 153,
      [44] = 154,
    };
  end

  return result;
end

local publicKey = "";

function IAPData.AviodCovA()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function IAPData.AviodCovB()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function IAPData.AviodCovC()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function IAPData.GetPublicKey()
  if LuaHelper.CheckDefine("TW") then
    publicKey = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmXCBKdI14w3us0YyFmVeKPcvaHrQYxTAwylpv6mCYjHVkkKiJZE2Ss9dHE4fJ2jrIQBa4Kz+EpCfvk8T810RD4FI9aEjGdkhaRDOG2nBO6UGOrm/hNgJ4zELa7F0zsW/UZHJw4w+JQRh3mvLOPNMZmcfB9AzlvVNyLlmHrUUylslyh1Z85TJhAE3MUyuIeiQX3O9e+kgSBrvWCkkHYa9G8G2gVcjYABor1IudI1Cwpldnu5LvxkIxHNfVXqB16hpd+qJZJvkocwyPgiOxXVhw+FgPG2V/qhVpSJv0Ualacsn2eNHnrXNeAaa51jBHC/YvEr65piUD7drpa8pghWmwQIDAQAB";
  end

  if LuaHelper.CheckDefine("HK") then
    publicKey = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnR4Zr/QG3a3xMibIR86HDl//7pfG9p+uA67MzRnyDqbbjVo53mHANg6KQHBDmRiaFM8fU6R1qo76ab1ggbm6a2OrS7/qu62vaM/2r140eZvxWQ+gskT9xdEyyWzt+S3bgijiJ+vJkDGU5FBacmuyzS+y+210g+NbFXwDmhru3BO3ImXlTwfe87uAU8B9DGX4dR69bZPm6ub8xVap0m/WbDfiAEaXgV+xKFgtlcU23Ew56O1e1kj5UO0MAd3QrKr/vxmoB80kSIUkO86LG5shso3UMmPsqjHrsDb782tW7kUfy4RfBZaZ+TYdpV1IiaifL/b4jqgB1y/Gh8NThsePCQIDAQAB";
  end
  
  if LuaHelper.CheckDefine("NFT") then
    publicKey = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA7nj9WoyqGEeVM3MqI6mOD9siJGUPXqGVc60fDmU4Bh9qOOEkCNDzGZDisK5Fs9zOrYJfKojRD1Lu+rKcpRzOt0tIe09uhrh6AE2c3SJwQxyg18dSxay7a5Ojz3pBm+nGybDL8zJYCl7oWXDDwErYAV6cLo3FbwOhV6hnzU7LJoA8CC5rgRz+itS6wV9lSvCSLGUiW/g7sPfZAedjgtuOvluMv87QZ+AuGnE4NTRaDX9HXjDHjlkphnty0Wto3DdQKoeJb8J6iK4UYZXiNRvhvev/Q8k3zjc1KXWw+GvQROdztv/mQQyUnKQsmWWShTxjfb3HPab/zJVk8EuJo95uYwIDAQAB";
  end

  return publicKey;
end

function IAPData.AviodCovD()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function IAPData.AviodCovE()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

local reciptSite = "";
function IAPData.GetReciptSite()
  if LuaHelper.IsAndroidPlatform then
    if Define.IsInternal() then
      --測試網址
      reciptSite = "http://googlemoney1.chinesegamer.net/googleaddpoint.aspx";
    elseif LuaHelper.CheckDefine("ReleaseTest") then
      --外部測試網址
      reciptSite = "http://googlemoney2.chinesegamer.net/googleaddpoint.aspx";
    else
      --正式網址
      reciptSite = "http://googlemoney.chinesegamer.net/googleaddpoint.aspx";
    end
  elseif LuaHelper.IsApplePlatform then
    if Define.IsDebugMode() then
      --測試網址
      reciptSite = "http://applemoney1.chinesegamer.net/appleaddpoint.aspx";
    else
      --正式網址
      reciptSite = "https://applemoney.chinesegamer.net/appleaddpoint.aspx";
    end
  end

  return reciptSite;
end

--[[
MyCard
]]--

IAPData.TradeType = 1;
IAPData.Currency = "TWD";
IAPData.ObjName = "MyCardReceiver";

function IAPData.AviodCovF()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function IAPData.AviodCovG()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

local myCardProductName = {};
function IAPData.GetMyCardProductName()

  myCardProductName = {
    [1]=    {30, "mycard.chinesegamer.tsn.gold30"},
    [2]=    {90, "mycard.chinesegamer.tsn.gold90"},
    [3]=    {150,  "mycard.chinesegamer.tsn.gold150"},
    [4]=    {300, "mycard.chinesegamer.tsn.gold300"},
    [5]=    {450, "mycard.chinesegamer.tsn.gold450"},
    [6]=    {750, "mycard.chinesegamer.tsn.gold750"},
    [7]=    {1000, "mycard.chinesegamer.tsn.gold1000"},
    [8]=    {1150, "mycard.chinesegamer.tsn.gold1150"},
    [9]=    {2000, "mycard.chinesegamer.tsn.gold2000"},
    [10] =  {3000, "mycard.chinesegamer.tsn.gold3000"},
    [11] =  {5000, "mycard.chinesegamer.tsn.gold5000"},
    [12] =  {10000, "mycard.chinesegamer.tsn.gold10000"},
    [110] = {330, "mycard.chinesegamer.tsn.item01"},
    [112] = {830, "mycard.chinesegamer.tsn.item02"},
    [120] = {990, "mycard.chinesegamer.tsn.item03"},
    [121] = {1690, "mycard.chinesegamer.tsn.item04"},
    [122] = {3290, "mycard.chinesegamer.tsn.item05"},
    [123] = {33, "mycard.chinesegamer.tsn.item06"},
    [124] = {330, "mycard.chinesegamer.tsn.item07"},
    [125] = {2690, "mycard.chinesegamer.tsn.item08"},
    [126] = {3290, "mycard.chinesegamer.tsn.item09"},
    [127] = {670, "mycard.chinesegamer.tsn.item10"},
    [128] = {33, "mycard.chinesegamer.tsn.item11"},
    [129] = {1690, "mycard.chinesegamer.tsn.item12"},
    [130] = {670, "mycard.chinesegamer.tsn.item13"},
    [131] = {1690, "mycard.chinesegamer.tsn.item14"},
    [132] = {490, "mycard.chinesegamer.tsn.item15"},
    [133] = {670, "mycard.chinesegamer.tsn.item16"},
    [134] = {33, "mycard.chinesegamer.tsn.item17"},
    [135] = {170, "mycard.chinesegamer.tsn.item18"},
    [136] = {490, "mycard.chinesegamer.tsn.item19"},
    [137] = {990, "mycard.chinesegamer.tsn.item20"},
    [138] = {1690, "mycard.chinesegamer.tsn.item21"},
    [139] = {3290, "mycard.chinesegamer.tsn.item22"},
    [140] = {2690, "mycard.chinesegamer.tsn.item23"},
    [141] = {33, "mycard.chinesegamer.tsn.eventitem01"},
    [142] = {170, "mycard.chinesegamer.tsn.eventitem02"},
    [143] = {490, "mycard.chinesegamer.tsn.eventitem03"},
    [144] = {990, "mycard.chinesegamer.tsn.eventitem04"},
    [145] = {1690, "mycard.chinesegamer.tsn.eventitem05"},
    [146] = {2690, "mycard.chinesegamer.tsn.eventitem06"},
    [147] = {3290, "mycard.chinesegamer.tsn.eventitem07"},
    [148] = {33, "mycard.chinesegamer.tsn.eventitem08"},
    [149] = {170, "mycard.chinesegamer.tsn.eventitem09"},
    [150] = {490, "mycard.chinesegamer.tsn.eventitem10"},
    [151] = {990, "mycard.chinesegamer.tsn.eventitem11"},
    [152] = {1690, "mycard.chinesegamer.tsn.eventitem12"},
    [153] = {2690, "mycard.chinesegamer.tsn.eventitem13"},
    [154] = {3290, "mycard.chinesegamer.tsn.eventitem14"},
    [155] = {100, "mycard.chinesegamer.tsn.item24"},
  };

  return myCardProductName;
end

local newebPayProductName = {};
function IAPData.GetNewebPayProductName()
  
  newebPayProductName = {
    [1]=    {30,  "ngold30"},
    [2]=    {90,  "ngold90"},
    [3]=    {150, "ngold150"},
    [4]=    {300, "ngold300"},
    [5]=    {450, "ngold450"},
    [6]=    {750, "ngold750"},
    [7]=    {1000,"ngold1000"},
    [8]=    {1150,"ngold1150"},
    [9]=    {2000,"ngold2000"},
    [10] =  {3000,"ngold3000"},
    [11] =  {5000,"ngold5000"},
    [12] =  {10000,"ngold10000"},
    [110] = {330, "nitem01"},
    [112] = {830, "nitem02"},
    [120] = {990, "nitem03"},
    [121] = {1690,"nitem04"},
    [122] = {3290,"nitem05"},
    [123] = {33,  "nitem06"},
    [124] = {330, "nitem07"},
    [125] = {2690,"nitem08"},
    [126] = {3290,"nitem09"},
    [127] = {670, "nitem10"},
    [128] = {33,  "nitem11"},
    [129] = {1690,"nitem12"},
    [130] = {670, "nitem13"},
    [131] = {1690,"nitem14"},
    [132] = {490, "nitem15"},
    [133] = {670, "nitem16"},
    [134] = {33,  "nitem17"},
    [135] = {170, "nitem18"},
    [136] = {490, "nitem19"},
    [137] = {990, "nitem20"},
    [138] = {1690,"nitem21"},
    [139] = {3290,"nitem22"},
    [140] = {2690,"nitem23"},
    [141] = {33,  "neventitem01"},
    [142] = {170, "neventitem02"},
    [143] = {490, "neventitem03"},
    [144] = {990, "neventitem04"},
    [145] = {1690,"neventitem05"},
    [146] = {2690,"neventitem06"},
    [147] = {3290,"neventitem07"},
    [148] = {33,  "neventitem08"},
    [149] = {170, "neventitem09"},
    [150] = {490, "neventitem10"},
    [151] = {990, "neventitem11"},
    [152] = {1690,"neventitem12"},
    [153] = {2690,"neventitem13"},
    [154] = {3290,"neventitem14"},
    [155] = {100, "nitem24"},
  };
  
  return newebPayProductName;
end


local plateFormName = "";
function IAPData.GetMyCardPlateFormName()
  if LuaHelper.IsApplePlatform then
    plateFormName = "I";
  else
    plateFormName = "A";
  end

  return plateFormName;
end

local myCardAddUrl = "";
function IAPData.GetMyCardAddUrl()
  if Define.IsDebugMode() then
    myCardAddUrl = "https://worldstorebilling1.chinesegamer.net/MyCardWeb/AddPoint.aspx";
  else
    myCardAddUrl = "https://worldstorebilling.chinesegamer.net/MyCardWeb/AddPoint.aspx";
  end

  return myCardAddUrl;
end

local myCardAuthUrl = "";
function IAPData.GetMyCardAuthUrl()
  if Define.IsDebugMode() then
    myCardAuthUrl = "https://worldstorebilling1.chinesegamer.net/MyCardWeb/GetAuthCode.aspx";
  else
    myCardAuthUrl = "https://worldstorebilling.chinesegamer.net/MyCardWeb/GetAuthCode.aspx";
  end

  return myCardAuthUrl;
end

function IAPData.AviodCovH()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function IAPData.AviodCovI()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function IAPData.AviodCovJ()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

local myCardGameType = "";
function IAPData.GetMyCardGameType()
  if LuaHelper.CheckDefine("HK") then
    myCardGameType = "94H";
  elseif LuaHelper.CheckDefine("TW") then
    myCardGameType = "94T";
  elseif LuaHelper.CheckDefine("NFT") then
    myCardGameType = "122";
  end

  return myCardGameType;
end

local myCardCheckCode = ""
function IAPData.GetMyCardCheckCode()
  if LuaHelper.CheckDefine("NFT") then
    if Define.IsDebugMode() then
      myCardCheckCode = "12345678"; --test
    else
      myCardCheckCode = "GJAI#KFNA@";
    end
  end
  return myCardCheckCode;
end

local sandBoxMode = false;
function IAPData.GetMyCardSandBoxMode()
  if Define.IsDebugMode() then 
    sandBoxMode = true;
  else
    sandBoxMode = false;
  end
  return sandBoxMode;
end

--[[
Alipay
]]--

local alipayProductName = {};
function IAPData.GetAlipayProductName()
  if LuaHelper.CheckDefine("NFT") then
    alipayProductName = {
      [1] = {34, "168Point"},
      [2] = {90, "460Point"},
      [3] = {179, "944Point"},
      [4] = {269, "1464Point"},
      [110] = {67, "MonthCard"},
      [112] = {157, "InTimeGift"}
    };
  end

  return alipayProductName;
end

local alipayGameType = "";
function IAPData.GetAlipayGameType()
  if LuaHelper.CheckDefine("NFT") then
    alipayGameType = "94";
  end

  return alipayGameType;
end

local alipayCashUrl = "";
function IAPData.GetAlipayCashUrl()
  if Define.IsDebugMode() then 
    alipayCashUrl = "http://cnmoney1.chinesegamer.net/alipay/AliPay.aspx";
  else
    alipayCashUrl = "http://cnmoney.chinesegamer.net/alipay/AliPay.aspx";
  end

  return alipayCashUrl;
end

local alipayAPPID = "";
function IAPData.GetAlipayAPPID()
  if LuaHelper.CheckDefine("NFT") then
    alipayAPPID = "2088121362660304";
  end

  return alipayAPPID;
end

function IAPData.AviodCov12()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function IAPData.AviodCov13()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

local alipayKey = "";
function IAPData.GetAlipayKey()
  if LuaHelper.CheckDefine("NFT") then
    alipayKey = "MIICXgIBAAKBgQDf/lCAqJljvp6il8VSP2geCudoIx3SpPyEfSXrOe2VjNr0XLoOt/NvMpYSgtuodZyNpaz3E1XaMem8eLkrrTXtjkBWwwjvr8fkqh1h9TmMuX9F2U3HoqpYwhEJxuW9HPIYHdWdVpc9Dunz6VsOyZw4o6UrAtxpLXRTCxz1Lk40YQIDAQABAoGAcsRQJQu9xBCIIVDYJmMcisAVfxL3FdW5GH0y74o3xDdufGQCZMY1sZTetc9ckrzoIN9xdwruIyUN2KaWYd2W0hImeh2Rkgur4lY8rg17bgSBiOGExoC5j++bQBXQ5CC3lQg8RPUZLP1df1qd7inLLQ+sUbm320bC/JRZNtK7BO0CQQD8S/nwt/26SEjP9QnXXr7hVTpDfcUaaTpG7ncuDKZxHduPhgEaMb3l4msp+Kx05bC72z7aXpI3Mxn8kmum6HKfAkEA40f8dMomxmBQH7mJmf9HvAFaoOR+so0AX47ss9BIknGnqgtKtjGIOn3rOyuEZ2GSfQmIVOk8g5cznlPtMgb4/wJBAPbCzLPvEP/4oRacoMKADYvQ0wqd4YEieHhV1kU45DXwsQVgWIWpLwW//XZwnSQ8Xy5tkrz8EGBi38DT6Oy3nxsCQQC7sNHp/Jrizdy9JjJdKzSpLJEUNz3t44VAZL5SjBmyXgtw4JxVMzhl3WCp33kbCre3bGzaejYQEYh+Ip7J5novAkEAjXViRwjS9xcYAXcuZa6IzOoAZVt6RSw0Y0GdJungjKHOXsXRNgxCY61ggg+2+VsTm+qIKnUxAToadwIffcuZdQ==";
  end

  return alipayKey;
end

local alipaySeller = "";
function IAPData.GetAlipaySeller()
  if LuaHelper.CheckDefine("NFT") then
    alipaySeller = "payment@980x.com";
  end
  return alipaySeller;
end

function ActivityInfo.Script33()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function ActivityInfo.Script44()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end