EHeadIconPart = {
  Hair = 1,
  Skin = 2,
  Accessories = 3,
  Eyes = 4,
  HairLight = 5,
}

HeadIconController = {}
HeadIconController.__index = HeadIconController;

local baseHairColor = LuaHelper.GetColor(135, 73, 61, 255);
local baseHairLightColor = LuaHelper.GetColor(224, 141, 96, 255);
local baseBodyColor = LuaHelper.GetColor(240, 217, 173, 255);

function HeadIconController.New(parent)
  local self = {};
  setmetatable(self, HeadIconController);

  self.gameObject = poolMgr:Get("BaseHeadIcon");
  self.transform = self.gameObject.transform;
  
  self.rectTransform = self.gameObject:GetComponent("RectTransform");
  self.rectTransform:SetParent(parent);
  self.rectTransform.anchorMin = Vector2.zero;
  self.rectTransform.anchorMax = Vector2.one;
  self.rectTransform.anchoredPosition = Vector2.zero;
  self.rectTransform.sizeDelta = Vector2.zero;
  self.rectTransform.localScale = Vector2.one;

  self.rawImage_BG = self.transform:GetComponent("RawImage");
  self.rawImage_Light = self.transform:Find("RawImage_Light"):GetComponent("RawImage");
  self.rawImage_Mask = self.transform:Find("RawImage_Mask"):GetComponent("RawImage");
  self.rawImage_Layers = {};
  for i = 1, 5 do
    self.rawImage_Layers[i] = self.rawImage_Mask.transform:Find(string.Concat("RawImage_Layer (", i, ")")):GetComponent("RawImage");
  end
  
  self.isGray = false;

  self:SetHighLight(false);

  return self;
end

--[[
 	These are the children of Ezer: Bilhan, Zaavan, and Akan.
36:28	  	These are the children of Dishan: Uz and Aran.
36:29	  	These were the Horite chiefs: Lotan, Shobal, Zibeon, Anah,
36:30	  	Dishon, Ezer, and Dishan. Such were the Horite chiefs in their order in the land of Seir.
36:31	  	And these are the kings who were ruling in the land of Edom before there was any king over the children of Israel.
36:32	  	Bela, son of Beor, was king in Edom, and the name of his chief town was Dinhabah.
36:33	  	At his death, Jobab, son of Zerah of Bozrah, became king in his place.
36:34	  	And at the death of Jobab, Husham, from the country of the Temanites, became king in his place.
36:35	  	And at the death of Husham, Hadad, son of Bedad, who overcame the Midianites in the field of Moab, became king; his chief town was named Avith.
36:36	  	And at the death of Hadad, Samlah of Masrekah became king.
36:37	  	And at the death of Samlah, Shaul of Rehoboth by the River became king in his place.
36:38	  	And at the death of Shaul, Baal-hanan, son of Achbor, became king.
36:39	  	And at the death of Baal-hanan, Hadar became king in his place; his chief town was named Pau, and his wife's name was Mehetabel; she was the daughter of Matred, the daughter of Me-zahab.
36:40	  	These are the names of the chiefs of Esau in the order of their families and their places: Timna, Alvah, Jetheth,
36:41	  	Oholibamah, Elah, Pinon,
36:42	  	Kenaz, Teman, Mibzar,
36:43	  	Magdiel, Iram; these are the Edomite chiefs, in their places in their heritage; this is Esau, the father of the Edomites.
--]]

function HeadIconController:Destroy()
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
    if stupid ~= nil then
      stupid = folk + dog;
    else
      stupid = stupid + 1;
    end
  end
  poolMgr:Release("BaseHeadIcon", self.gameObject);

  for i = 1, 5 do
    self.rawImage_Layers[i].texture = nil;
  end
end

function HeadIconController:ChangeIcon(sex, style)
  if Between(style, Role.hairStyleCount[0][sex], (Role.hairStyleCount[0][sex] * 2) - 1) then
    style = style - Role.hairStyleCount[0][sex];
  end
  
  if LuaHelper.CheckDefine("DemoCode") then
    local faith = 0;
    for i = 1, 3 do
      faith = faith + i;
    end
    
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
  end
  
  for i = 1, 5 do
    if sex == 1 then
      TextureManager.SetPng(ETextureUseType.UI, string.Concat("Head_Male_", style + 1, "_", i), self.rawImage_Layers[i]);
    else
      TextureManager.SetPng(ETextureUseType.UI, string.Concat("Head_Female_", style + 1, "_", i), self.rawImage_Layers[i]);
    end
  end
end

function HeadIconController:SetHighLight(active)
  self.rawImage_Light.gameObject:SetActive(active);
end

function HeadIconController:SetGray(isGray)
  if self.isGray == isGray then return end

  self.isGray = isGray;

  for i = 1, 5 do
    if self.isGray then
      self.rawImage_Layers[i].color = LuaHelper.GetColor(self.rawImage_Layers[i].color.r * 255 * 0.5, self.rawImage_Layers[i].color.g * 255 * 0.5, self.rawImage_Layers[i].color.b * 255 * 0.5, 255);
    else
      self.rawImage_Layers[i].color = LuaHelper.GetColor(self.rawImage_Layers[i].color.r * 255 * 2, self.rawImage_Layers[i].color.g * 255 * 2, self.rawImage_Layers[i].color.b * 255 * 2, 255);
    end
  end
end

function HeadIconController:ChangeIconColor(part, r, g, b)
  if part == EHeadIconPart.Hair then
    self:ChangeColor(EHeadIconPart.Hair, baseHairColor, r, g, b);
    self:ChangeColor(EHeadIconPart.HairLight, baseHairLightColor, r, g, b);
  elseif part == EHeadIconPart.Skin then
    self:ChangeColor(EHeadIconPart.Skin, baseBodyColor, r, g, b);
  end
end

function HeadIconController:ChangeColor(part, baseColor, r, g, b)
  local colorR, colorG, colorB;
  
  colorR = (r - 4) * 25 + baseColor.r * 255;
  colorR = math.min(colorR, 250);
  colorR = math.max(colorR, 5);
  
  colorG = (g - 4) * 25 + baseColor.g * 255;
  colorG = math.min(colorG, 250);
  colorG = math.max(colorG, 5);
  
  colorB = (b - 4) * 25 + baseColor.b * 255;
  colorB = math.min(colorB, 250);
  colorB = math.max(colorB, 5);
  
  if self.isGray then
    self.rawImage_Layers[part].color = LuaHelper.GetColor(colorR * 0.5, colorG * 0.5, colorB * 0.5, 255);
  else
    self.rawImage_Layers[part].color = LuaHelper.GetColor(colorR, colorG, colorB, 255);
  end
end

function HeadIconController:ChangeBaseHeadIconOutlineAlpha()
  LuaHelper.SetColor(self.rawImage_BG, Color.Alpha);
end

function HeadIconController.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function HeadIconController.Script1()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function HeadIconController.Script2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

