UICityScrambleGroundController = {}
UICityScrambleGroundController.__index = UICityScrambleGroundController;

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

BoundarySprite = {
  [0] = "icon088";  --000000
  [1] = "icon099";  --100000
  [2] = "icon094";  --000011
  [3] = "icon100";  --000101
  [4] = "icon098";  --001001
  [5] = "icon091";  --000111
  [6] = "icon095";  --001011
  [7] = "icon097";  --010101
  [8] = "icon093";  --011110
  [9] = "icon096";  --011011
  [10] = "icon090"; --111010
  [11] = "icon089"; --110111
  [12] = "icon092"; --111111
}

BoundaryMap = { --圖片編號, Z軸順時鐘轉60度的次數, Y軸轉180的次數
  [0] = {0, 0, 0};

  [1] = {1, 1, 0};
  [2] = {1, 2, 0};
  [3] = {2, 0, 0};
  [4] = {1, 3, 0};
  [5] = {3, 0, 0};
  [6] = {2, 1, 0};
  
  [7] = {5, 0, 0};
  [8] = {1, 4, 0};
  [9] = {4, 0, 0};
  [10] = {3, 1, 0};
  [11] = {6, 0, 0};
  [12] = {2, 2, 0};

  [13] = {6, 4, 1};
  [14] = {5, 1, 0};
  [15] = {8, 5, 0};
  [16] = {1, 5, 0};
  [17] = {3, 4, 0};
  [18] = {4, 1, 0};

  [19] = {6, 2, 1};
  [20] = {3, 2, 0};
  [21] = {7, 0, 0};
  [22] = {6, 1, 0};
  [23] = {10, 3, 0};
  [24] = {2, 3, 0};

  [25] = {6, 3, 0};
  [26] = {6, 5, 1};
  [27] = {9, 0, 0};
  [28] = {5, 2, 0};
  [29] = {10, 5, 0};
  [30] = {8, 0, 0};

  [31] = {11, 2, 0};
  [32] = {1, 0, 0};
  [33] = {2, 5, 0};
  [34] = {3, 5, 0};
  [35] = {5, 5, 0};
  [36] = {4, 2, 0};

  [37] = {6, 5, 0};
  [38] = {6, 3, 1};
  [39] = {8, 4, 0};
  [40] = {3, 3, 0};
  [41] = {6, 1, 1};
  [42] = {7, 1, 0};

  [43] = {10, 2, 0};
  [44] = {6, 2, 0};
  [45] = {9, 2, 0};
  [46] = {10, 4, 0};
  [47] = {11, 1, 0};
  [48] = {2, 4, 0};

  [49] = {5, 4, 0};
  [50] = {6, 4, 0};
  [51] = {8, 3, 0};
  [52] = {6, 0, 1};
  [53] = {10, 1, 0};
  [54] = {9, 1, 0};

  [55] = {11, 0, 0};
  [56] = {5, 3, 0};
  [57] = {8, 2, 0};
  [58] = {10, 0, 0};
  [59] = {11, 5, 0};
  [60] = {8, 1, 0};

  [61] = {11, 4, 0};
  [62] = {11, 3, 0};
  [63] = {12, 0, 0};
}

IconSprite = {
  [1] = {"but195","but196","but194"};
  [2] = {"but197","but199","but198"};
  [3] = {"but192","but193","but191"};
  [4] = {""};
  [5] = {"but200"};
  [6] = {"but190"};
}

function UICityScrambleGroundController.New(parent, pos, index)
  local self = {};
  setmetatable(self, UICityScrambleGroundController);

  self.gameObject = poolMgr:Get("BaseUICityGround");
  self.transform = self.gameObject.transform;
  self.gameObject.name = "Ground ("..index..")";
  self.index = index;
  self.boundaryType = 0;
  self.boundaryFraction = 0;
  self.rectTransform = self.gameObject:GetComponent("RectTransform");
  self.rectTransform:SetParent(parent);
  self.rectTransform.anchorMin = Vector2.zero;
  self.rectTransform.anchorMax = Vector2.one;
  self.rectTransform.sizeDelta = Vector2.zero;
  self.rectTransform.localScale = Vector2.one;
  self.rectTransform.anchoredPosition = pos;
  self.rectTransform:SetSiblingIndex(index);
  self.grassImage = self.transform:Find("Image_Grass"):GetComponent("Image");
  self.iconObject = self.transform:Find("Image_Ground").gameObject;
  self.iconImage = self.iconObject:GetComponent("Image");
  self.boundaryObject = self.transform:Find("Image_Boundary").gameObject;
  self.boundaryObject:SetActive(false);
  self.boundaryImage = self.boundaryObject:GetComponent("Image");
  self.restrictObject = self.transform:Find("Image_Restrict").gameObject;
  self.restrictObject:SetActive(false);
  self.restrictImage = self.restrictObject:GetComponent("Image");
  self.restrictImage.sprite = UI.GetSprite("icon083");
  self.cityTextObject = self.transform:Find("Text_CityName"); 
  self.cityText = self.cityTextObject:GetComponent("Text");
  self.pieObject = self.transform:Find("PieObject").gameObject;
  self.pieObject:SetActive(false);
  self.clickObject = self.transform:Find("Image_Click").gameObject;
  self.clickObject:SetActive(true);

  if (cityScrambleGroundDatas[index] ~= nil) then
    if (cityScrambleGroundDatas[index].icon ~= '0') then
      self.iconObject:SetActive(true);
      self.iconImage.sprite = UI.GetSprite(cityScrambleGroundDatas[index].icon);
    else
      self.iconObject:SetActive(false);
    end
  else
    self.iconObject:SetActive(true);
    self.iconImage.sprite = UI.GetSprite("but190");
  end
  self.grassImage.sprite = UI.GetSprite("but189");

  return self;
end

function UICityScrambleGroundController:Destroy()
  poolMgr:Release("BaseUICityGround", self.gameObject);
end

function UICityScrambleGroundController.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function UICityScrambleGroundController.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function UICityScrambleGroundController.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function UICityScrambleGroundController:SetBoundary(num, fraction, id)
  if (fraction >= 1) and (fraction <= 3) then
    if (num < 0) or (num >= 64) then
      self.boundaryObject:SetActive(false);
      self.boundaryType = 0;
      self.boundaryFraction = 0;
    else
      self.boundaryType = num;
      self.boundaryFraction = fraction;
      local info = BoundaryMap[num];
      self.boundaryImage.sprite = UI.GetSprite(BoundarySprite[info[1]]);
      if info[3] == 0 then
        self.boundaryObject.transform.rotation = Quaternion.Euler(0, 0, -info[2]*60);
      else
        self.boundaryObject.transform.rotation = Quaternion.Euler(0, info[3]*180, info[2]*60);
      end
      self.boundaryImage.color = Color.CityScramble[fraction];
      self.boundaryObject:SetActive(true);
    end
  else    
    self.boundaryType = -1;
    self.boundaryFraction = 0;
  end
end

function UICityScrambleGroundController:SetClick(onClick)
  if onClick then
    self.boundaryObject:SetActive(true);
    self.boundaryImage.sprite = UI.GetSprite("icon085");
    self.boundaryImage.color = Color.White;
  else
    if (self.boundaryType >= 0) and (self.boundaryType < 64) then
      self.boundaryImage.sprite = UI.GetSprite(BoundarySprite[BoundaryMap[self.boundaryType][1]]);
    else
      self.boundaryObject:SetActive(false);
    end

    if self.boundaryFraction ~= 0 then
      self.boundaryImage.color = Color.CityScramble[self.boundaryFraction];
    else
      self.boundaryImage.color = Color.White;
    end
  end
end

function UICityScrambleGroundController.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function UICityScrambleGroundController.Trash4()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function UICityScrambleGroundController:SetRestrict()  
  self.restrictImage.color = Color.White;
  self.restrictObject:SetActive(true);
end

function UICityScrambleGroundController:ClearRestrict()   
  self.restrictObject:SetActive(false);
end

function UICityScrambleGroundController.Trash5()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function UICityScrambleGroundController:SetIcon(fraction, iconType)
  local info = IconSprite[iconType];
  if info ~= nil then
    if (iconType > 3) or (fraction == 0) then
      if (iconType == 4) then
        self.iconObject:SetActive(false);
      else
        self.iconImage.sprite = UI.GetSprite(info[1]);
      end
    else
      self.iconImage.sprite = UI.GetSprite(info[fraction]);
    end
  end
end

function UICityScrambleGroundController.Trash6()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end

function UICityScrambleGroundController.Trash7()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end


function UICityScrambleGroundController.Trash8()
  if LuaHelper.CheckDefine("DemoCode") then
    local TS = 85;
    local ST = 54;
    local STT = 5;
    local BS = DemoFunction.GetRShift3(TS, ST, STT);
    
    return BS;
  end
end