local json = require 'cjson'

--軍團標記
EOrgFlag = {
  Summon = 1, --團長召喚
  OrgWarRigistered = 2, --軍團戰報名
}

--軍團資源
EOrgResource = {
  Gold = 1, --金
  Grain = 2, --糧
  Mineral = 3, --礦
  Wood = 4, --木材
  Cloth = 5, --布料
  Army = 6, --部隊
  Weapon = 7, --器械
}

--軍團職責
EOrgDuty = {
  None = 0,
  Maker = 1, --生產(兵種,軍備)權限
  WalkerArmy = 2, --援軍(輕步兵)權限
  CrackArmy = 3, --援軍(勁裝兵)權限
  WeightArmy = 4, --援軍(重鎧兵)權限
  StrongArmy = 5, --援軍(強甲兵)權限
  WalkerOfficer = 6, --援軍(輕裝小將)權限
  CrackOfficer = 7, --援軍(勁裝小將)權限
  WeightOfficer = 8, --援軍(重鎧小將)權限
  StrongOfficer = 9, --援軍(強甲小將)權限
  OrgWar = 10, --軍團戰出戰權限
}

--軍團製造
EOrgProduction = {
  Weapon = 1,
  Army = 2,
}

OrganizationInfo = {}
OrganizationInfo.__index = OrganizationInfo;

function OrganizationInfo.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function OrganizationInfo.New()
  local self = {};
  setmetatable(self, OrganizationInfo);

  self.name = "";

  self.chiefName = "";
  self.chiefOnline = false;

  self.allyId = 0;

  self.memberCount = 0;

  self.askVersion = 0;
  self.ensignVersion = 0;
  self.ensignData = {};
  for i = 1, Organization.ensignDataSize do
    self.ensignData[i] = 255;
  end

  self.ensignTexture = TexturePool.Get(self.ensignTexture, 24, 24, TextureFormat.RGBA4444);
  for x = 0, 23 do
    for y = 0, 23 do
      self.ensignTexture:SetPixel(x, 24 - (y + 1), Organization.ensignColor[15]);
    end
  end
  self.ensignTexture:Apply();

  return self;
end

function OrganizationInfo:Destroy()
  if self.ensignTexture ~= nil then
    TexturePool.Recycle(self.ensignTexture);
    self.ensignTexture = nil;
  end
end

function OrganizationInfo.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function OrganizationInfo.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

Organization = {}
local this = Organization;

--const
this.requireLv = 10; --開放等級
this.createMoney = 10000; --創立金幣
this.maxMember = 99; --最大團員數量
this.maxSubChief = 2; --最大副團長數量
this.maxResource = 7; --資源最大種類
this.ensignDataSize = 24 * 24 * 0.5; --團徽資料大小
this.bossFightMaxTimes = 3; --軍團BOSS每日可打次數
this.orderScore_Elite = 5000; --精英團員貢獻度門檻
this.orderScore_Senior = 1000; --資深團員貢獻度門檻
this.sampleEnsignMax = 17; --團徽範例數量

--團徽色表
this.ensignColor = {}
this.ensignColor[0] = LuaHelper.GetColor(128, 0, 0, 255);
this.ensignColor[1] = LuaHelper.GetColor(248, 0, 0, 255);
this.ensignColor[2] = LuaHelper.GetColor(248, 128, 0, 255);
this.ensignColor[3] = LuaHelper.GetColor(248, 252, 0, 255);
this.ensignColor[4] = LuaHelper.GetColor(0, 252, 0, 255);
this.ensignColor[5] = LuaHelper.GetColor(0, 128, 0, 255);
this.ensignColor[6] = LuaHelper.GetColor(0, 128, 248, 255);
this.ensignColor[7] = LuaHelper.GetColor(128, 128, 248, 255);
this.ensignColor[8] = LuaHelper.GetColor(0, 0, 160, 255);
this.ensignColor[9] = LuaHelper.GetColor(128, 0, 128, 255);
this.ensignColor[10] = LuaHelper.GetColor(248, 0, 128, 255);
this.ensignColor[11] = LuaHelper.GetColor(248, 128, 192, 255);
this.ensignColor[12] = LuaHelper.GetColor(0, 4, 0, 255);
this.ensignColor[13] = LuaHelper.GetColor(128, 128, 128, 255);
this.ensignColor[14] = LuaHelper.GetColor(248, 252, 248, 255);
this.ensignColor[15] = LuaHelper.GetColor(0, 0, 0, 0);

--資源對應物品材質
this.resourceItemMaterial = {}
this.resourceItemMaterial[1] = {}; --金
this.resourceItemMaterial[2] = { 7, 22, 36 }; --糧
this.resourceItemMaterial[3] = { 1, 2, 8, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35 }; --礦
this.resourceItemMaterial[4] = { 3, 4, 20, 21 }; --木
this.resourceItemMaterial[5] = { 5, 6, 24, 25 }; --布
this.resourceItemMaterial[6] = {}; --兵
this.resourceItemMaterial[7] = {}; --器

--var
this.orgs = {};

--本地團徽
this.sampleEnsigns = {};
this.customEnsigns = {};
this.ensigns = {};
table.insert(this.ensigns, 0, { version = 0, rawData = {} });

--主角軍團資料
this.Id = 0; --軍團ID
this.level = 0; --軍團等級
this.createDate = nil; --創立時間
this.allySwitch = true; --同盟開關
this.fireInfo = nil; --罷免資訊
this.info = ""; --軍團介紹
this.declaration = ""; --軍團規章
this.flag = 0; --通用標記 bit 1:召集令 2:軍團戰報名
this.score = 0; --活躍值
this.weekScore = 0; --活躍值
this.weekScoreLv = 0; --活躍等級
this.ensignEditTime = 0; --團徽編輯時間

--成員
this.chiefs = { 0, 0, 0, 0 }; --團長副團長ID
this.members = {}; --成員資料

--資源
this.resources = {}; --物資
this.armys = {}; --部隊
this.weapons = {}; --器械

--軍團BOSS
this.bossCount = 0; --擊殺數
this.bossDamage = 0; --已造成傷害
this.bossCooldownTime = nil; --攻擊冷卻時間

--製造
this.productions = {};
this.productions[EOrgProduction.Weapon] = { unit = 0, doneTime = nil };
this.productions[EOrgProduction.Army] = { unit = 0, doneTime = nil };

function Organization.Initialize()
  if LuaHelper.CheckDefine("DemoCode") then
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
  
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
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
  
  this.LoadSampleEnsign();
  this.LoadCustomEnsign();
end

--所有軍團
function Organization.SetOrgInfo(orgId, orgName, chiefName, allyId, memberCount, chiefOnline, updateOther)
  if this.orgs[orgId] == nil then
    this.orgs[orgId] = OrganizationInfo.New();
  end

  this.orgs[orgId].name = orgName;

  this.orgs[orgId].chiefName = chiefName;
  this.orgs[orgId].chiefOnline = chiefOnline;

  this.orgs[orgId].allyId = allyId;
  this.orgs[orgId].memberCount = memberCount;

  if updateOther == false then return end

  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end
end

function Organization.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Organization.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Organization.Trash4()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Organization.SetChiefOnline(orgId, chiefOnline, updateOther)
  if this.orgs[orgId] == nil then return end

  this.orgs[orgId].chiefOnline = chiefOnline;

  if updateOther == false then return end

  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end
end

function Organization.GetOrgName(orgId)
  if this.orgs[orgId] == nil then return "" end

  return this.orgs[orgId].name;
end

function Organization.SetOrgName(orgId, name)
  if orgId == 0 then return end

  if this.orgs[orgId] == nil then
    this.orgs[orgId] = OrganizationInfo.New();
  end

  this.orgs[orgId].name = name;
end

--團徽
function Organization.LoadSampleEnsign()
  for i = 1, this.sampleEnsignMax do
    DataManager.ReadData(string.format("Ensign/Ensign%02d.ens", i),
      function(file)
        local ensignData = {};
        local reader = DatReader.New(file);
        while reader:CanRead() do
          table.insert(ensignData, reader:ReadByte());
        end
        
        this.SetSampleEnsign(i, ensignData)
      end
    );
  end
end

function Organization.Trash5()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Organization.Trash6()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end
function Organization.Trash7()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end


function Organization.SetSampleEnsign(key, ensignData)
  if ensignData ~= nil then
    local sampleEnsign = {};
    sampleEnsign.data = {};
    if this.sampleEnsigns[key] ~= nil then
      sampleEnsign.texture = TexturePool.Get(this.sampleEnsigns[key].texture, 24, 24, TextureFormat.RGBA4444);
    else
      sampleEnsign.texture = TexturePool.Get(nil, 24, 24, TextureFormat.RGBA4444);
    end

    for i = 1, this.ensignDataSize do
      sampleEnsign.data[i] = ensignData[i];
    end

    for x = 0, 23 do
      for y = 0, 23 do
        local pixelIndex = math.floor((x * 24 + y) / 2) + 1;
        local colorIndex = 0;
        
        if (x * 24 + y) % 2 == 0 then
          colorIndex = bit.band(bit.rshift(sampleEnsign.data[pixelIndex], 4), 15);
        else
          colorIndex = bit.band(sampleEnsign.data[pixelIndex], 15);
        end

        sampleEnsign.texture:SetPixel(x, 24 - (y + 1), this.ensignColor[colorIndex]);
      end
    end
    sampleEnsign.texture:Apply();
    
    this.sampleEnsigns[key] = sampleEnsign;
  else
    table.remove(this.sampleEnsigns, key);
  end
end

function Organization.LoadCustomEnsign()
  local jsonText = CGResourceManager.ReadText("CustomEnsign.txt");

  if string.IsNullOrEmpty(jsonText) then return end

  this.customEnsigns = json.decode(jsonText);

  for k, v in pairs(this.customEnsigns) do
    this.SetSampleEnsign(this.sampleEnsignMax + k, v);
  end
end

function Organization.AddCustomEnsign(ensignData)
  local saveEnsign = {};
  
  for i = 1, this.ensignDataSize do
    saveEnsign[i] = ensignData[i];
  end

  table.insert(this.customEnsigns, saveEnsign);
  this.SaveCustomEnsign();

  this.SetSampleEnsign(this.sampleEnsignMax + table.maxn(this.customEnsigns), ensignData);

  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateEnsign();
  end
end

function Organization.RemoveCustomEnsign(key)
  if this.customEnsigns[key] == nil then return end

  table.remove(this.customEnsigns, key);
  this.SaveCustomEnsign();

  this.SetSampleEnsign(this.sampleEnsignMax + key, nil);

  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateEnsign();
  end
end

function Organization.SaveCustomEnsign()
  CGResourceManager.WriteText("CustomEnsign.txt", json.encode(this.customEnsigns));
end

function Organization.Trash8()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Organization.Trash9()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Organization.Trash10()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Organization.Trash11()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function Organization.GetEnsign(orgId)
  if this.orgs[orgId] == nil then return nil end
  
  if LuaHelper.CheckDefine("DemoCode") then
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
    
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
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
  
  local ensignData = this.ensigns[tostring(orgId)];
  if ensignData == nil or ensignData.version ~= this.orgs[orgId].ensignVersion then
    if this.orgs[orgId].askVersion ~= this.orgs[orgId].ensignVersion then
      --[[
      if ensignData ~= nil then
        logError("Ask Ensign "..orgId.." Local Version "..ensignData.version.." Server Version "..this.orgs[orgId].ensignVersion);
      else
        logError("Ask Ensign "..orgId.." Local Version Nil Server Version "..this.orgs[orgId].ensignVersion);
      end
      --]]

      this.orgs[orgId].askVersion = this.orgs[orgId].ensignVersion;
      
      --C:039-019 <要求軍團團徽> <<+軍團ID(4)>>
      sendBuffer:Clear();
      sendBuffer:WriteUInt32(orgId);
      Network.Send(39, 19, sendBuffer);
    end
  end

  return this.orgs[orgId].ensignTexture;
end

function Organization.SetEnsign(orgId, version, rawData)
  if this.orgs[orgId] == nil then
    this.orgs[orgId] = OrganizationInfo.New();
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
    
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
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
  
  this.orgs[orgId].ensignVersion = version;

  local ensignData = this.ensigns[tostring(orgId)];

  --檢查本地資料
  if rawData ~= nil and (ensignData == nil or ensignData.version ~= version) then
    --logError("Get Ensign "..orgId.." Version "..version);
    if ensignData == nil then
      ensignData = { version = 0, rawData = {} };

      this.ensigns[tostring(orgId)] = ensignData;
    end

    ensignData.version = version;
    
    for i = 1, string.len(rawData) do
      ensignData.rawData[i] = string.byte(rawData, i);
    end
  end

  if ensignData ~= nil then
    for i = 1, this.ensignDataSize do
      this.orgs[orgId].ensignData[i] = ensignData.rawData[i];
    end

    for x = 0, 23 do
      for y = 0, 23 do
        local pixelIndex = math.floor((x * 24 + y) / 2) + 1;
        local colorIndex = 0;
        
        if (x * 24 + y) % 2 == 0 then
          colorIndex = bit.band(bit.rshift(ensignData.rawData[pixelIndex], 4), 15);
        else
          colorIndex = bit.band(ensignData.rawData[pixelIndex], 15);
        end

        this.orgs[orgId].ensignTexture:SetPixel(x, 24 - (y + 1), this.ensignColor[colorIndex]);
      end
    end

    this.orgs[orgId].ensignTexture:Apply();
  end
  
  if orgId == this.Id then
    if rawData ~= nil then
      ShowCenterMessage(string.Get(20918), 3);
    end

    if UI.IsVisible(UIArmy) then
      UIArmy.UpdateUI();
    end
  end
end

function Organization.SetDefaultEnsign(orgId, style)
  local rawData = nil;
  --[[
  local fileName = string.format("sample%02d.ens", style);

  LoadPaintGridFromData(filePath, FindOrgEnsign(iSerialID)^.Ensign);
  ]]--

  this.SetEnsign(orgId, this.orgs[orgId].ensignVersion, rawData);
  this.SaveEnsign();

  ShowCenterMessage(string.Get(20919), 3);
end

function Organization.SaveEnsign()
  if LuaHelper.CheckDefine("DemoCode") then
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
    
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
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
  --logError(string.Concat("Save Ensign ", Network.serverId));
  CGResourceManager.WriteText(string.format("Ensign_%d_%d.txt", Network.dbId, Network.serverId), json.encode(this.ensigns));
end

function Organization.LoadEnsign()
  if LuaHelper.CheckDefine("DemoCode") then
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
    
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
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
  --logError(string.Concat("Load Ensign ", Network.serverId));
  local jsonText = CGResourceManager.ReadText(string.format("Ensign_%d_%d.txt", Network.dbId, Network.serverId));

  if string.IsNullOrEmpty(jsonText) then return end
  
  this.ensigns = json.decode(jsonText);
end

--玩家軍團
function Organization.SetData(data)
  --S:039-002 <軍團資料> +L(1) +名稱(L) +副團長數(1) +成員數(1) <<+軍團成員資料(?)>> +L(1) +軍團規章(L) +解散時間(8) +創立時間(8) +同盟開關(1) +標記(1) +周活躍度(4) +累積活躍度(4) +BOSS等級(2) +BOSS傷害量(4) +L(1) +同盟軍團名稱(L)
  name = data:ReadString(data:ReadByte());
  subChiefCount = data:ReadByte();
  memberCount = data:ReadByte();
  
  for i = 1, 1 + subChiefCount + memberCount do
    local roleId = data:ReadInt64();
    this.AddMember(roleId, data, false);

    if i == 1 then
      this.SetChief(nil, roleId);
    elseif i <= 1 + subChiefCount then
      this.AddSubChief(roleId, false);
    end
  end

  this.SetDeclaration(data:ReadString(data:ReadByte()), false);
  this.SetDismissDate(data:ReadDouble());

  this.createDate = DateTime.FromOADate(data:ReadDouble());
  this.SetAllySwitch(not data:ReadBoolean(), false);
  this.SetFlag(data:ReadByte());
  this.weekScore = data:ReadUInt32();
  this.score = data:ReadUInt32();

  this.bossCount = data:ReadUInt16();
  this.bossDamage = data:ReadUInt32();
  this.bossCooldownTime = nil;

  this.allyName = data:ReadString(data:ReadByte());

  this.UpdateLv(false);
  this.UpdateScoreLv(false);
  
  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end
end

function Organization.Demo()
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

function Organization.Demo1()
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

function Organization.Demo2()
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

function Organization.SetInfo(value, updateOther)
  this.info = value;

  if updateOther == false then return end

  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end
end

function Organization.SetAllySwitch(value, showMessage)
  this.allySwitch = value;
  
  if showMessage ~= false then
    if this.allySwitch then
      ShowCenterMessage(string.Get(20878));
    else
      ShowCenterMessage(string.Get(20877));
    end
  end

  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end
end

function Organization.SetAllyName(name)
  this.allyName = name;
  
  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end
end

function Organization.Demo3()
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

function Organization.Demo4()
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

function Organization.Demo5()
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

function Organization.SetDeclaration(value, updateOther)
  this.declaration = value;

  if updateOther == false then return end

  if UI.IsVisible(UIArmy) then
    UIArmy.OnClick_CloseFunction();
    UIArmy.UpdateUI();
  end
end

function Organization.SetFlag(value, updateOther)
  this.flag = value;

  if updateOther == false then return end

  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end

  if UI.IsVisible(UIActivity) then
    UIActivity.UpdateUI();
  end
end

function Organization.CheckFlag(flagIndex)
  return CheckFlag(this.flag, flagIndex);
end

function Organization.SetDismissDate(date)
  if date ~= 0 then
    Chat.AddMessage(EChannel.System, string.Concat(string.Get(20801), DateTime.FromOADate(date):ToString("yyyy/MM/dd"), string.Get(20802)));
  else
    Chat.AddMessage(EChannel.System, string.Get(20803));
  end
end

function Organization.Demo6()
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

function Organization.Demo7()
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

function Organization.SetChief(oldChiefRank, roleId)
  this.RemoveSubChief(roleId);

  local oldChiefId = this.chiefs[1];

  if oldChiefRank == 0 then
    this.RemoveMember(oldChiefId, false);
  elseif oldChiefRank == 1 then
    if this.members[oldChiefId] ~= nil then
      Chat.AddMessage(EChannel.Organization, string.Concat(this.members[oldChiefId].name, string.Get(21229)));
    end
  elseif oldChiefRank == 2 then
    this.AddSubChief(oldChiefId);
  end

  this.chiefs[1] = roleId;
  
  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end
end

function Organization.UpdateLv(updateOther)
  local oriLv = this.level;

  this.level = 1;
  for k, v in pairs(armyArchitectureDatas) do
    if this.score >= v.buildings[1].upExp then
      this.level = k;
    else
      break;
    end
  end

  if oriLv > 0 and this.level > oriLv then
    Chat.AddMessage(EChannel.Organization, string.format(string.Get(21193), this.level));
  end

  if updateOther == false then return end

  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end
end

function Organization.UpdateScoreLv(updateOther)
  this.weekScoreLv = 0;
  for k, v in pairs(armyAwardDatas) do
    if this.weekScore >= v.requireScore then
      this.weekScoreLv = k;
    else
      break;
    end
  end

  if updateOther == false then return end
  
  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end
end

function Organization.Demo8()
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

function Organization.Demo9()
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

function Organization.Demo10()
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

function Organization.WeeklyClear()
  this.weekScore = 0;
  this.bossCount = 0;
  this.bossDamage = 0;

  this.bossCooldownTime = nil;
  CGTimer.RemoveFunctionDelay(this.UpdateBossRedDot);
  
  this.UpdateScoreLv(false);

  for k, v in pairs(this.members) do
    v.weekScore = 0;
    v.bossDamage = 0;
  end

  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end
end

function Organization.Clear()
  for k in pairs(this.orgs) do
    this.orgs[k]:Destroy();
    this.orgs[k] = nil;
  end

  this.ClearMyOrganization();
  this.LoadEnsign();
end

function Organization.ClearMyOrganization()
  this.Id = 0;
  this.level = 0;
  this.createDate = nil;
  this.allySwitch = true;
  this.fireInfo = nil;
  this.info = "";
  this.declaration = "";
  this.flag = 0;
  this.score = 0;
  this.weekScore = 0;
  this.weekScoreLv = 0;
  this.ensignEditTime = 0;

  --成員
  for i = 1, this.maxSubChief + 1 do
    this.chiefs[i] = 0;
  end

  for k in pairs(this.members) do
    this.members[k] = nil;
  end

  --資源
  for i = 1, this.maxResource do
    this.resources[i] = 0;
  end

  for i = 1, City.maxArmy do
    this.armys[i] = 0;
  end

  for i = 1, City.maxWeapon do
    this.weapons[i] = 0;
  end

  --軍團BOSS
  this.bossCount = 0;
  this.bossDamage = 0;

  --製造
  for k, v in pairs(this.productions) do
    v.unit = 0;
    v.doneTime = nil;
  end
  CGTimer.RemoveFunctionDelay(this.UpdateProductionRedDot);

  --城池資料
  City.ClearMyOrganization();
end

function Organization.IsChief(roleId)
  return roleId == this.chiefs[1];
end

function Organization.IsSubChief(roleId)
  for i = 2, this.maxSubChief + 1 do
    if this.chiefs[i] == roleId then
      return true;
    end
  end

  return false;
end

function Organization.Demo11()
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

function Organization.Demo12()
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

function Organization.IsMember(roleId)
  return this.members[roleId] ~= nil;
end

function Organization.Dismiss()
  this.ClearMyOrganization();

  UI.Close(UIArmy);
  UI.Close(UIMail);

  ArmyLuckyBag.RemoveArmy();
end

function Organization.Demo13()
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

function Organization.Invite(roleId, name)
  if Role.player == nil then return end
  
  --攻城戰觀戰中
  if Role.player.data.isWatching then return false end
  
  --C:039-002 <邀請加入軍團> +L(1) +名字(L)
  sendBuffer:Clear()
  sendBuffer:WriteStringWithByteL(name);
  Network.Send(39, 2, sendBuffer);
end

function Organization.AddSubChief(roleId, showMessage)
  for i = 2, this.maxSubChief + 1 do
    if this.chiefs[i] == 0 then
      this.chiefs[i] = roleId;
      break;
    end
  end

  if showMessage ~= false and this.members[roleId] ~= nil then
    Chat.AddMessage(EChannel.Organization, string.Concat(this.members[roleId].name, string.Get(21228)));
  end
  
  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end
end

function Organization.RemoveSubChief(roleId)
  local find = false;
  for i = 2, this.maxSubChief + 1 do
    if this.chiefs[i] == roleId then
      find = true;
    end

    if find then
      if i + 1 <= this.maxSubChief + 1 then
        this.chiefs[i] = this.chiefs[i + 1];
      else
        this.chiefs[i] = 0;
      end
    end
  end
  
  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end
end

function Organization.AddMember(roleId, data, showMessage)
  if data == nil then return end
  
  this.members[roleId] = PlayerInfo.New(roleId, data, true);

  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end
end

function Organization.RemoveMember(roleId, showMessage)
  if this.members[roleId] == nil then return end

  local name = this.members[roleId].name;

  this.RemoveSubChief(roleId);

  this.members[roleId] = nil;

  if roleId == Role.playerId then
    UI.Close(UIArmy);
    UI.Close(UIArmyList);
  else
    if showMessage ~= false then
      Chat.AddMessage(EChannel.Organization, string.format(string.Get(21227), name));
    end

    if UI.IsVisible(UIArmy) then
      UIArmy.UpdateUI();
    end
  end
end

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

function Organization.UpdateMemberName(roleId, name)
  if this.members[roleId] == nil then return end

  this.members[roleId].name = name;

  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end
end

--軍團BOSS
function Organization.SetBossInfo(count, damage)
  this.bossCount = count;
  this.bossDamage = damage;

  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end
end

function Organization.SetMemberBossInfo(roleId, damage)
  if this.members[roleId] == nil then return end

  this.members[roleId].bossDamage = damage;

  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end
end

function Organization.SetBossCooldown(time)
  this.bossCooldownTime = time;
  CGTimer.RemoveFunctionDelay(this.UpdateBossRedDot);
  
  if time ~= nil and DateTime.Compare(CGTimer.serverTime, time) < 0 then
    local timeSpan = time - CGTimer.serverTime;
    CGTimer.DoFunctionDelay(timeSpan.TotalSeconds + 1, this.UpdateBossRedDot);
  end

  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateBossTime();
  end

  this.UpdateBossRedDot();
end

function Organization.Random()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Organization.Random1()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Organization.Random2()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Organization.GetBossHp(level)
  if level == nil then
    level = this.bossCount + 1;
  end

  return level * 150000;
end

function Organization.OnBossTimesChanged()
  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateBoss();
  end

  this.UpdateBossRedDot();
end

function Organization.UpdateBossRedDot()
  if RoleCount.Get(ERoleCount.OrgBoss) < this.bossFightMaxTimes and (this.bossCooldownTime == nil or DateTime.Compare(Organization.bossCooldownTime, CGTimer.serverTime) < 0) then
    RedDot.Add(ERedDot.OrgBoss);
  else
    RedDot.Remove(ERedDot.OrgBoss);
  end
end

--貢獻度
function Organization.SetScore(score)
  this.score = score;

  this.UpdateLv();
end

function Organization.SetWeekScore(score)
  this.weekScore = score;

  this.UpdateScoreLv();
end

function Organization.Random3()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Organization.Random4()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Organization.Random5()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Organization.SetMemberScore(roleId, score, weekScore)
  if this.members[roleId] == nil then return end

  this.members[roleId].score = score;
  this.members[roleId].weekScore = weekScore;

  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end
end

function Organization.GetSignLv()
  local result = 1;
  
  for k, v in pairs(armySignDatas) do
    if this.level < v.requireArmyLv then break end
    if this.members[Role.playerId].score < v.requireScore then break end
    if not Role.CheckPlayerLv(v.requireLv) then break end
    
    result = k;
  end

  return result;
end

function Organization.UpdateSignRedDot()
  if this.Id == 0 or BitFlag.Get(14) then
    RedDot.Remove(ERedDot.OrgSign);
  else
    RedDot.Add(ERedDot.OrgSign);
  end
end

--職責
function Organization.SetDutyFlag(flagIndex, roleId, flagValue)
  if this.members[roleId] == nil then return end

  this.members[roleId].dutyFlags = SetFlag(this.members[roleId].dutyFlags, flagIndex, flagValue);

  if roleId == Role.playerId then
    if not Contains(roleId, unpack(this.chiefs)) then
      if flagValue then
        if flagIndex == EOrgDuty.Maker then
          ShowCenterMessage(string.Get(20810));
        elseif flagIndex == EOrgDuty.WalkerArmy then
          ShowCenterMessage(string.Get(20812));
        elseif flagIndex == EOrgDuty.CrackArmy then
          ShowCenterMessage(string.Get(20813));
        elseif flagIndex == EOrgDuty.WeightArmy then
          ShowCenterMessage(string.Get(20814));
        elseif flagIndex == EOrgDuty.StrongArmy then
          ShowCenterMessage(string.Get(20815));
        elseif flagIndex == EOrgDuty.WalkerOfficer then
          ShowCenterMessage(string.Get(80142));
        elseif flagIndex == EOrgDuty.CrackOfficer then
          ShowCenterMessage(string.Get(80143));
        elseif flagIndex == EOrgDuty.WeightOfficer then
          ShowCenterMessage(string.Get(80144));
        elseif flagIndex == EOrgDuty.StrongOfficer then
          ShowCenterMessage(string.Get(80145));
        elseif flagIndex == EOrgDuty.OrgWar then
          ShowCenterMessage(string.Get(21805));
        end
      else
        if flagIndex == EOrgDuty.Maker then
          ShowCenterMessage(string.Get(20811));
        elseif flagIndex == EOrgDuty.WalkerArmy then
          ShowCenterMessage(string.Get(20816));
        elseif flagIndex == EOrgDuty.CrackArmy then
          ShowCenterMessage(string.Get(20816));
        elseif flagIndex == EOrgDuty.WeightArmy then
          ShowCenterMessage(string.Get(20816));
        elseif flagIndex == EOrgDuty.StrongArmy then
          ShowCenterMessage(string.Get(20816));
        elseif flagIndex == EOrgDuty.WalkerOfficer then
          ShowCenterMessage(string.Get(80146));
        elseif flagIndex == EOrgDuty.CrackOfficer then
          ShowCenterMessage(string.Get(80146));
        elseif flagIndex == EOrgDuty.WeightOfficer then
          ShowCenterMessage(string.Get(80146));
        elseif flagIndex == EOrgDuty.StrongOfficer then
          ShowCenterMessage(string.Get(80146));
        elseif flagIndex == EOrgDuty.OrgWar then
        end
      end
    end

    if flagIndex == EOrgDuty.OrgWar then
      if UI.IsVisible(UIMain) then
        UIMain.UpdateBuff();
      end
    end
  end

  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end
end

function Organization.Random6()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Organization.Random7()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Organization.GetDutyFlag(flagIndex, roleId)
  if this.members[roleId] == nil then return false end

  return CheckFlag(this.members[roleId].dutyFlags, flagIndex);
end

--資源
function Organization.SetResource(kind, value)
  this.resources[kind] = value;

  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end
end

function Organization.SetArmy(kind, value)
  this.armys[kind] = value;

  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end
end

function Organization.SetWeapon(kind, value)
  this.weapons[kind] = value;

  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end
end

--製造
function Organization.SetProduction(kind, unit, doneOADate)
  if this.productions[kind] == nil then return end

  local doneDateTime = nil;
  if doneOADate ~= 0 then
    doneDateTime = DateTime.FromOADate(doneOADate);
  end

  this.productions[kind].unit = unit;
  this.productions[kind].doneTime = doneDateTime;
  
  for k, productionState in pairs(this.productions) do
    if doneDateTime == nil or (productionState.doneTime ~= nil and DateTime.Compare(productionState.doneTime, doneDateTime) < 0) then
      doneDateTime = productionState.doneTime;
    end
  end

  CGTimer.RemoveFunctionDelay(this.UpdateProductionRedDot);
  if doneDateTime ~= nil and DateTime.Compare(CGTimer.serverTime, doneDateTime) < 0 then
    local timeSpan = doneDateTime - CGTimer.serverTime;
    CGTimer.DoFunctionDelay(timeSpan.TotalSeconds + 1, this.UpdateProductionRedDot);
  end

  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end

  this.UpdateProductionRedDot();
end

function Organization.UpdateProductionRedDot()
  local showRedDot = false;
  for k, productionState in pairs(this.productions) do
    if productionState.unit ~= 0 then
      if productionState.doneTime ~= nil and DateTime.Compare(productionState.doneTime, CGTimer.serverTime) < 0 then
        showRedDot = true;
        break;
      end
    end
  end

  if showRedDot then
    RedDot.Add(ERedDot.OrgProduction);
  else
    RedDot.Remove(ERedDot.OrgProduction);
  end
end

function Organization.Random8()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Organization.Random9()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Organization.Random10()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function Organization.Random11()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end