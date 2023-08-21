
EShadow = {
  None = 0,
  Human = 1,
  Horse = 2,
  Monster = 3,
}

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

ETextureSize = {
  high = 2000,
  middle = 100,
  low = 20,
}

UniversalJmp = {};
local this = UniversalJmp;

local shadowMaterial = nil;

local normalShadowJmp = nil;
local normalShadowTexture = nil;
local normalShadowRects = nil;

local horseShadowJmp = nil;
local horseShadowTexture = nil;
local horseShadowRects = nil;

local monsterShadowJmp = nil;
local monsterShadowTexture = nil;
local monsterShadowRects = nil;

--戰鬥中顯示動圖
local fightJmp = nil;
local fightTexture = nil;
local fightRects = nil;

--海上顯示動圖
local shipJmp = nil;
local shipTexture = nil;
local shipRects = nil;

--攻城戰
local cityPlayers = {};
local cityWeapons = {};

function UniversalJmp.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function UniversalJmp.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function UniversalJmp.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function UniversalJmp.Initialize()
  UISetting.SetDisplay();
  
  CGResourceManager.Load(
    "ShadowMaterial",
    "",
    function(assetName, asset)
      shadowMaterial = asset;
    end
  );

  --超大影子
  TextureManager.GetPngSingleTexture("MonsterShadow",
    function(texture)
      if texture ~= nil then
        monsterShadowJmp = Jmp.New(ERolePart.Shadow, texture, 1);

        JmpAtlasMaker.GenerateAtlas(
          monsterShadowJmp,
          monsterShadowJmp.colorTable,
          function(width, height, format, rawData, atlasRects)
            monsterShadowTexture = TexturePool.Get(monsterShadowTexture, width, height, format);
            monsterShadowTexture:LoadRawTextureData(rawData);
            monsterShadowTexture:Apply();

            monsterShadowRects = atlasRects;
          end
        );
      end
    end
  );

  --座騎影子
  TextureManager.GetPngSingleTexture("HorseShadow",
    function(texture)
      if texture ~= nil then
        horseShadowJmp = Jmp.New(ERolePart.Shadow, texture, 8);

        JmpAtlasMaker.GenerateAtlas(
          horseShadowJmp,
          horseShadowJmp.colorTable,
          function(width, height, format, rawData, atlasRects)
            horseShadowTexture = TexturePool.Get(horseShadowTexture, width, height, format);
            horseShadowTexture:LoadRawTextureData(rawData);
            horseShadowTexture:Apply();

            horseShadowRects = atlasRects;
          end
        );
      end
    end
  );
  
  if LuaHelper.CheckDefine("DemoCode") then
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
    
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
  
  --人物影子
  TextureManager.GetPngSingleTexture("HumanShadow",
    function(texture)
      if texture ~= nil then
        normalShadowJmp = Jmp.New(ERolePart.Shadow, texture, 1);

        JmpAtlasMaker.GenerateAtlas(
          normalShadowJmp,
          normalShadowJmp.colorTable,
          function(width, height, format, rawData, atlasRects)
            normalShadowTexture = TexturePool.Get(normalShadowTexture, width, height, format);
            normalShadowTexture:LoadRawTextureData(rawData);
            normalShadowTexture:Apply();

            normalShadowRects = atlasRects;
          end
        );
      end
    end
  );

  --戰鬥中圖
  fightJmp = RolePicManager.GetJMP(ERolePart.Body, 1020);
  JmpAtlasMaker.GenerateAtlas(
    fightJmp,
    fightJmp.colorTable,
    function(width, height, format, rawData, atlasRects)
      fightTexture = TexturePool.Get(fightTexture, width, height, format);
      fightTexture:LoadRawTextureData(rawData);
      fightTexture:Apply();

      fightRects = atlasRects;
    end
  );
  
  if LuaHelper.CheckDefine("DemoCode") then
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
    
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
  
  --船圖
  shipJmp = RolePicManager.GetJMP(ERolePart.Body, 1016);
  JmpAtlasMaker.GenerateAtlas(
    shipJmp,
    shipJmp.colorTable,
    function(width, height, format, rawData, atlasRects)
      shipTexture = TexturePool.Get(shipTexture, width, height, format);
      shipTexture:LoadRawTextureData(rawData);
      shipTexture:Apply();

      shipRects = atlasRects;
    end
  );

  if LuaHelper.IsEditor and not LuaHelper.IsMacOS then return end
  if not Resource.HaveDownloadResource() then return end
  
  --攻城戰玩家
  for k, camp in pairs(ECamp) do
    cityPlayers[camp] = {};

    local cityPlayerNpcData = npcDatas[City.playerCampNpcId[camp]];
    cityPlayers[camp].jmp = RolePicManager.GetJMP(ERolePart.Body, cityPlayerNpcData.picId, ERolePose.Stand, ERolePose.Walk);

    local cityPlayerColor = TSColor.Copy(cityPlayers[camp].jmp.colorTable, cityPlayerColor);
    for k, colorPart in pairs(EColorPart) do
      cityPlayerColor = TSColor.Tint(cityPlayerColor, cityPlayers[camp].jmp.colorTable, colorPart, cityPlayerNpcData:GetColor(colorPart));
    end

    JmpAtlasMaker.GenerateAtlas(
      cityPlayers[camp].jmp,
      cityPlayerColor,
      function(width, height, format, rawData, atlasRects)
        cityPlayers[camp].texture = TexturePool.Get(cityPlayers[camp].texture, width, height, format);
        cityPlayers[camp].texture:LoadRawTextureData(rawData);
        cityPlayers[camp].texture:Apply();
  
        cityPlayers[camp].rects = atlasRects;
      end,
      ERolePose.Stand,
      ERolePose.Walk
    );
  end
  
  if LuaHelper.CheckDefine("DemoCode") then
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
    
    local faith = 0;
    for i = 1, 3 do
      faith = faith + i;
    end
    
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
  
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      human = satan + haven;
    else
      human = satan - haven;
    end
  end
  
  --攻城戰器械
  for k, weaponNpcId in pairs(City.weaponNpcId) do
    cityWeapons[weaponNpcId] = {};

    local weaponNpcData = npcDatas[weaponNpcId];
    cityWeapons[weaponNpcId].jmp = RolePicManager.GetJMP(ERolePart.Body, weaponNpcData.picId, ERolePose.Stand, ERolePose.Walk, ERolePose.Lie);

    local attackWeaponColor = TSColor.Copy(cityWeapons[weaponNpcId].jmp.colorTable, attackWeaponColor);
    local defendWeaponColor = TSColor.Copy(cityWeapons[weaponNpcId].jmp.colorTable, defendWeaponColor);
    for k, colorPart in pairs(EColorPart) do
      if colorPart == EColorPart.Helm and Contains(weaponNpcId, 37002, 37003, 37004, 37005, 37006, 37017, 37018, 37019, 37020, 37021) then
        attackWeaponColor = TSColor.Tint(attackWeaponColor, cityWeapons[weaponNpcId].jmp.colorTable, colorPart, 9, 1, 0);
      else
        attackWeaponColor = TSColor.Tint(attackWeaponColor, cityWeapons[weaponNpcId].jmp.colorTable, colorPart, weaponNpcData:GetColor(colorPart));
      end
      defendWeaponColor = TSColor.Tint(defendWeaponColor, cityWeapons[weaponNpcId].jmp.colorTable, colorPart, weaponNpcData:GetColor(colorPart));
    end

    cityWeapons[weaponNpcId].texture = {};

    JmpAtlasMaker.GenerateAtlas(
      cityWeapons[weaponNpcId].jmp,
      attackWeaponColor,
      function(width, height, format, rawData, atlasRects)
        cityWeapons[weaponNpcId].texture[ECamp.Attack] = TexturePool.Get(cityWeapons[weaponNpcId].texture[ECamp.Attack], width, height, format);
        cityWeapons[weaponNpcId].texture[ECamp.Attack]:LoadRawTextureData(rawData);
        cityWeapons[weaponNpcId].texture[ECamp.Attack]:Apply();
  
        cityWeapons[weaponNpcId].rects = atlasRects;
      end,
      ERolePose.Stand,
      ERolePose.Walk,
      ERolePose.Lie
    );
  
    if LuaHelper.CheckDefine("DemoCode") then
      local meaningless = 45;
      local shift = 2;
      local result = 0;
      bit.rshift(meaningless, shift)
      bit.lshift(meaningless, shift)
      if bit.band(meaningless,45) == 45 then
        result = meaningless * shift;
      end
    
      local faith = 0;
      for i = 1, 3 do
        faith = faith + i;
      end
    
      if faith > 10 then
        faith = 10;
      else
        faith = faith + 10;
      end
    
      local satan = 666;
      local haven = 999;
      local human = 0;
      if satan ~= haven then
        human = satan + haven;
      else
        human = satan - haven;
      end
    end
    
    JmpAtlasMaker.GenerateAtlas(
      cityWeapons[weaponNpcId].jmp,
      defendWeaponColor,
      function(width, height, format, rawData, atlasRects)
        cityWeapons[weaponNpcId].texture[ECamp.Defend] = TexturePool.Get(cityWeapons[weaponNpcId].texture[ECamp.Defend], width, height, format);
        cityWeapons[weaponNpcId].texture[ECamp.Defend]:LoadRawTextureData(rawData);
        cityWeapons[weaponNpcId].texture[ECamp.Defend]:Apply();
      end,
      ERolePose.Stand,
      ERolePose.Walk,
      ERolePose.Lie
    );
  end
end

function UniversalJmp.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

--shadow
function UniversalJmp.GetShadow(kind)
  if kind == EShadow.Human then
    return normalShadowTexture, normalShadowJmp.width, normalShadowJmp.height, normalShadowRects;
  elseif kind == EShadow.Horse then
    return horseShadowTexture, horseShadowJmp.width, horseShadowJmp.height, horseShadowRects;
  elseif kind == EShadow.Monster then
    return monsterShadowTexture, monsterShadowJmp.width, monsterShadowJmp.height, monsterShadowRects;
  else
    return nil, 0, 0, nil;
  end
end

function UniversalJmp.Trash4()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function UniversalJmp.Trash5()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function UniversalJmp.GetShadowAni(kind, direction, inBattle)
  if kind == EShadow.Human then
    return 0, 0;
  elseif kind == EShadow.Horse then
    if inBattle then
      if direction == 0 then
        return 1, 0;
      else
        return 5, 0;
      end
    else
      return direction, 0;
    end
  elseif kind == EShadow.Monster then
    return 0, 0;
  else
    return 0, 0;
  end
end

function UniversalJmp.GetShadowMatirial()
  return shadowMaterial;
end

function UniversalJmp.Trash6()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function UniversalJmp.Trash7()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function UniversalJmp.Trash8()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function UniversalJmp.GetShadowTexture(kind)
  if kind == EShadow.Human then
    return normalShadowTexture;
  elseif kind == EShadow.Horse then
    return horseShadowTexture;
  elseif kind == EShadow.Monster then
    return monsterShadowTexture;
  else
    return nil;
  end
end

function UniversalJmp.GetShadowOffsetY(kind)
  if kind == EShadow.Human then
    return 32;
  elseif kind == EShadow.Horse then
    return 32;
  elseif kind == EShadow.Monster then
    return 0;
  else
    return 0;
  end
end

--fight
function UniversalJmp.GetFight()
  return fightTexture, fightJmp.width, fightJmp.height, fightRects;
end

function UniversalJmp.GetFightTexture()
  return fightTexture;
end

--ship
function UniversalJmp.GetShip()
  return shipTexture, shipJmp.width, shipJmp.height, shipRects;
end

function UniversalJmp.GetShipTexture()
  return shipTexture;
end

function UniversalJmp.Trash9()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function UniversalJmp.Trash10()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end


function UniversalJmp.Trash11()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

--City
function UniversalJmp.GetCityPlayer(camp)
  return cityPlayers[camp].texture, cityPlayers[camp].jmp.width, cityPlayers[camp].jmp.height, cityPlayers[camp].rects;
end

function UniversalJmp.GetCityWeapon(npcId, camp)
  return cityWeapons[npcId].texture[camp], cityWeapons[npcId].jmp.width, cityWeapons[npcId].jmp.height, cityWeapons[npcId].rects;
end