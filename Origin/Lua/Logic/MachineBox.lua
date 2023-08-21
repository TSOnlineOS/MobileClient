local json = require 'cjson'

EMachineBoxSwitch = {
  Hp = 1, --HP道具使用完回村
  Sp = 2, --SP道具使用完回村
  Player = 3, --玩家死亡回村
  Npc = 4, --武將死亡回村
  Exp = 5, --自動補充經驗值道具
  Mineral = 6, --礦怪逃跑
  EcoMode = 7, --省電模式
  Shotput = 8, --自動換鉛錘
  LimitDungeon = 9, --自動補充限時副本時間
  Hoe = 10, --自動補充限時副本時間
  AutoLogin = 11, --自動重連
}

EMachineBoxRole = {
  Player = 1,
  Npc = 2,
}

EMachineBoxFight = {
  Att = 1,      --普攻
  Skill = 2,    --特技
  Def = 3,      --防
  Exit = 4,     --逃跑
}

EMachineBoxSkill = {
  Single = 1, --單體技
  AOE = 2, --範圍技
}

EAutoMoveMode = {
  Bee = 1,
  Chase = 2,
  WithoutTrack = 3,
}

EMachineBoxStats = {
  EndTime = 0,
  StartTime = 1,
  Exp = 2,
  Fight = 3,
  Death = 4,
  GetItem = 5,
  UseItem = 6,
}

--[[
And after a time, when men were increasing on the earth, and had daughters,
The sons of God saw that the daughters of men were fair; and they took wives for themselves from those who were pleasing to them.
And the Lord said, My spirit will not be in man for ever, for he is only flesh; so the days of his life will be a hundred and twenty years.
There were men of great strength and size on the earth in those days; and after that, when the sons of God had connection with the daughters of men, they gave birth to children: these were the great men of old days, the men of great name.
And the Lord saw that the sin of man was great on the earth, and that all the thoughts of his heart were evil.
And the Lord had sorrow because he had made man on the earth, and grief was in his heart.
And the Lord said, I will take away man, whom I have made, from the face of the earth, even man and beast and that which goes on the earth and every bird of the air; for I have sorrow for having made them.
But Noah had grace in the eyes of God.
These are the generations of Noah. Noah was an upright man and without sin in his generation: he went in the ways of God.
And Noah had three sons, Shem, Ham, and Japheth.
And the earth was evil in God's eyes and full of violent ways.
And God, looking on the earth, saw that it was evil: for the way of all flesh had become evil on the earth.
And God said to Noah, The end of all flesh has come; the earth is full of their violent doings, and now I will put an end to them with the earth.
Make for yourself an ark of gopher wood with rooms in it, and make it safe from the water inside and out.
And this is the way you are to make it: it is to be three hundred cubits long, fifty cubits wide, and thirty cubits high.
You are to put a window in the ark, a cubit from the roof, and a door in the side of it, and you are to make it with a lower and second and third floors.
For truly, I will send a great flow of waters over the earth, for the destruction from under the heaven of all flesh in which is the breath of life; everything on the earth will come to an end.
But with you I will make an agreement; and you will come into the ark, you and your sons and your wife and your sons' wives with you.
And you will take with you into the ark two of every sort of living thing, and keep them safe with you; they will be male and female.
Two of every sort of bird and cattle and of every sort of living thing which goes on the earth will you take with you to keep them from destruction.
--]]

FightSetting = {}
FightSetting.__index = FightSetting;

function FightSetting.New(npcId)
  local self = {};
  setmetatable(self, FightSetting);
  
  self.hp = MachineBox.InitHPSP;
  self.sp = MachineBox.InitHPSP;
  self.fightMode = EMachineBoxFight.Att;
  self.exitThreshold = 0;
  self.aoeThreshold = MachineBox.InitMobs;
  self.singleSkill = MachineBox.BasicSkill;
  self.aoeSkill = MachineBox.BasicSkill;

  if npcId ~= nil and npcDatas[npcId] ~= nil then
    local haveSkill = false;
    for i = 1, 2 do
      local skillId = npcDatas[npcId].skills[i];

      if skillId ~= 0 then
        if i == 1 then
          self.singleSkill = skillId;
        else
          self.aoeSkill = skillId;
        end
        haveSkill = true;
      else
        if i == 1 then
          self.singleSkill = MachineBox.BasicSkill;
        else
          self.aoeSkill = MachineBox.BasicSkill;
        end
      end

      if haveSkill then
        self.fightMode = EMachineBoxFight.Skill;
      end
    end
  end

  return self;
end

function FightSetting.EndOfLine()
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

function FightSetting.EndOfLine1()
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

MachineBox = {}
local this = MachineBox;

--const
--this.MachineBoxId = 46164;  --機關盒 ID
this.MaxSparCount = 60000;  --同種類晶石最多可累加的次數
this.MaxSpar = 5;           --最多可同時使用的晶石種類數量
this.MaxSparBase = 3;       --基本可使用晶石數量
this.MaxSparExt = 2;        --最多可擴充晶石數量
this.MaxExpBottle = 8;      --最多可同時使用的經驗瓶
this.BaseExpBottle = 3;     --基本可使用經驗瓶
this.ExtExpBottle = 5;      --最多可擴充的經驗瓶
this.BasicSkill = 10000;
this.InitHPSP = 50;         --初始HP SP
this.InitMobs = 5;          --怪物數

--save
this.client = {};

--general
this.client.moveMode = EAutoMoveMode.Bee; --自動行走模式
this.client.chaseFilter = { true, true, true, true, true, true, true, true }; --追擊篩選

this.client.general = {};
for k, v in pairs(EMachineBoxSwitch) do
  this.client.general[v] = false;
end

this.client.mobs = {};
this.client.exit = {};  --怪LV高於逃跑

this.client.escape = 0; --怪高於X隻逃跑

--player
this.client.playerHp = this.InitHPSP;
this.client.playerSp = this.InitHPSP;
this.client.playerMode = EMachineBoxFight.Att; --玩家攻擊模式
this.client.exit[EMachineBoxRole.Player] = 0;
this.client.mobs[EMachineBoxRole.Player] = this.InitMobs;

this.client.playerSkill = {};
this.client.playerSkill[EMachineBoxSkill.Single] = this.BasicSkill;
this.client.playerSkill[EMachineBoxSkill.AOE] = this.BasicSkill;

--fight
this.fightSettings = {};

--var
this.sparExtendNum = 0;  --可擴充晶石數量
this.spar = {};
this.expExtendNum = 0;   --可擴充經驗瓶數量
this.bottle = {};
this.dueDate = 0;
this.warp = {};
this.priority = 0;

--統計
this.statisticsDatas = {};
this.statisticsDatas[EMachineBoxStats.StartTime] = 0;
this.statisticsDatas[EMachineBoxStats.Exp] = 0;
this.statisticsDatas[EMachineBoxStats.Fight] = 0;
this.statisticsDatas[EMachineBoxStats.Death] = 0;
this.useItems = {};
this.getItems = {};

--Battle
this.autoFight = false;

local function LoadFightSetting(npcId)
  local fightSetting = FightSetting.New(npcId);

  if npcId ~= nil and npcDatas[npcId] ~= nil then
    local jsonText = CGResourceManager.ReadText(string.Concat("MachineBoxNpc", npcId, ".txt"));
    if not string.IsNullOrEmpty(jsonText) then
      local data = json.decode(jsonText);
  
      if data.hp ~= nil then
        fightSetting.hp = data.hp;
      end
      
      if data.sp ~= nil then
        fightSetting.sp = data.sp;
      end
  
      if data.fightMode ~= nil then
        fightSetting.fightMode = data.fightMode;
      end
      
      if data.exitThreshold ~= nil then
        fightSetting.exitThreshold = data.exitThreshold;
      end
      
      if data.aoeThreshold ~= nil then
        fightSetting.aoeThreshold = data.aoeThreshold;
      end
      
      if data.singleSkill ~= nil then
        fightSetting.singleSkill = data.singleSkill;
      end
      
      if data.aoeSkill ~= nil then
        fightSetting.aoeSkill = data.aoeSkill;
      end
    end
  else
    fightSetting.hp = this.client.playerHp;
    fightSetting.sp = this.client.playerSp;
    fightSetting.fightMode = this.client.playerMode;
    fightSetting.exitThreshold = this.client.exit[EMachineBoxRole.Player];
    fightSetting.aoeThreshold = this.client.mobs[EMachineBoxRole.Player];
    fightSetting.singleSkill = this.client.playerSkill[EMachineBoxSkill.Single];
    fightSetting.aoeSkill = this.client.playerSkill[EMachineBoxSkill.AOE];
  end

  return fightSetting;
end

function MachineBox.EndOfLine()
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

function MachineBox.Initialize()
  --general
  this.client.moveMode = EAutoMoveMode.Bee;
  for i = 1, table.Count(this.client.chaseFilter) do
    this.client.chaseFilter[i] = true;
  end

  for k, v in pairs(EMachineBoxSwitch) do
    if Contains(v, EMachineBoxSwitch.Player, EMachineBoxSwitch.Npc, EMachineBoxSwitch.Mineral, EMachineBoxSwitch.LimitDungeon, EMachineBoxSwitch.AutoLogin) then
      this.client.general[v] = true;
    else
      this.client.general[v] = false;
    end
  end

  this.client.escape = 0;

  --player
  this.client.playerHp = this.InitHPSP;
  this.client.playerSp = this.InitHPSP;
  this.client.playerMode = EMachineBoxFight.Att; --玩家攻擊模式
  this.client.exit[EMachineBoxRole.Player] = 0;
  this.client.mobs[EMachineBoxRole.Player] = this.InitMobs;
  this.client.playerSkill[EMachineBoxSkill.Single] = this.BasicSkill;
  this.client.playerSkill[EMachineBoxSkill.AOE] = this.BasicSkill;

  local jsonText = CGResourceManager.ReadText(string.Concat("MachineBox", Role.playerId, ".txt"));

  if not string.IsNullOrEmpty(jsonText) then
    local data = json.decode(jsonText);

    --general
    if data.moveMode ~= nil then
      this.client.moveMode = data.moveMode;
    end

    if data.chaseFilter ~= nil then
      for k, v in pairs(data.chaseFilter) do
        this.client.chaseFilter[tonumber(k)] = v;
      end
    end

    if data.general ~= nil then
      for k, v in pairs(data.general) do
        this.client.general[tonumber(k)] = v;
      end
    end

    if data.escape ~= nil then
      this.client.escape = data.escape;
    end

    --player
    if data.playerHp ~= nil then
      this.client.playerHp = data.playerHp;
    end

    if data.playerSp ~= nil then
      this.client.playerSp = data.playerSp;
    end

    if data.playerMode ~= nil then
      this.client.playerMode = data.playerMode;
    end

    if data.exit ~= nil then
      for k, v in pairs(data.exit) do
        this.client.exit[tonumber(k)] = v;
      end
    end
    
    if data.mobs ~= nil then
      for k, v in pairs(data.mobs) do
        this.client.mobs[tonumber(k)] = v;
      end
    end

    if data.playerSkill ~= nil then
      for k, v in pairs(data.playerSkill) do
        this.client.playerSkill[tonumber(k)] = v;
      end
    end
  end

  this.fightSettings[0] = LoadFightSetting();

  this.ClearStats();
end

function MachineBox.ReloadNpcSetting()
  for npcId, v in pairs(this.fightSettings) do
    if npcId ~= 0 and Role.GetFollowNpc(Role.playerId, npcId) == nil then
      this.fightSettings[npcId] = nil;
    end
  end

  local followNpcs = Role.GetFollowNpcs(Role.playerId);
  for k, v in pairs(followNpcs) do
    if this.fightSettings[v.npcId] == nil then
      this.fightSettings[v.npcId] = LoadFightSetting(v.npcId);
    end
  end
end

function MachineBox.GetFightSetting(npcId)
  if this.fightSettings[npcId] == nil then
    this.fightSettings[npcId] = LoadFightSetting(npcId);
  end

  return this.fightSettings[npcId];
end

function MachineBox.EndOfLine1()
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

function MachineBox.EndOfLine2()
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

function MachineBox.EndOfLine3()
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

function MachineBox.Save()
  if this.autoFight then
    this.SetAutoFight(true, true);
  end

  if Role.fightNpc ~= nil then
    this.client.npcId = Role.fightNpc.npcId;
  else
    this.client.npcId = 0;
  end
  
  local jsonText = json.encode(this.client);

  CGResourceManager.WriteText(string.Concat("MachineBox", Role.playerId, ".txt"), jsonText);
end

function MachineBox.SaveNpcSetting(npcId, fightSetting)
  if fightSetting == nil then return end

  if npcId == 0 then
    this.client.playerHp = fightSetting.hp;
    this.client.playerSp = fightSetting.sp;
    this.client.playerMode = fightSetting.fightMode;
    this.client.exit[EMachineBoxRole.Player] = fightSetting.exitThreshold;
    this.client.mobs[EMachineBoxRole.Player] = fightSetting.aoeThreshold;
    this.client.playerSkill[EMachineBoxSkill.Single] = fightSetting.singleSkill;
    this.client.playerSkill[EMachineBoxSkill.AOE] = fightSetting.aoeSkill;

    local jsonText = json.encode(this.client);
    CGResourceManager.WriteText(string.Concat("MachineBox", Role.playerId, ".txt"), jsonText);
  else
    local jsonText = json.encode(fightSetting);
    CGResourceManager.WriteText(string.Concat("MachineBoxNpc", npcId, ".txt"), jsonText);
  end
end

function MachineBox.SetAutoFight(active, sendMessage)
  if active then
    if SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.NoMachinebox) then
      ShowCenterMessage(string.Get(20340));
      return;
    end

    MachineBox.Statistics(EMachineBoxStats.StartTime);
  else
    MachineBox.Statistics(EMachineBoxStats.EndTime);
  end
  
  this.autoFight = active;

  if sendMessage then
    if active then
      --C:065-001 <啟動機關盒> +玩家HP%下限(1) +玩家SP%下限(1) +武將HP%下限(1) +武將SP%下限(1) +HP補品不足回城(1) +SP補品不足回城(1) +玩家死亡回城(1) +武將死亡回城(1) +自動行走(1) +自動使用經驗物品(1)+出戰武將自動換鉛錘(1)
      sendBuffer:Clear();
      sendBuffer:WriteByte(this.client.playerHp);
      sendBuffer:WriteByte(this.client.playerSp);
      sendBuffer:WriteByte(1);
      sendBuffer:WriteByte(1);
      sendBuffer:WriteBoolean(this.client.general[EMachineBoxSwitch.Hp]);
      sendBuffer:WriteBoolean(this.client.general[EMachineBoxSwitch.Sp]);
      sendBuffer:WriteBoolean(this.client.general[EMachineBoxSwitch.Player]);
      sendBuffer:WriteBoolean(this.client.general[EMachineBoxSwitch.Npc]);
      sendBuffer:WriteBoolean(false);
      sendBuffer:WriteBoolean(this.client.general[EMachineBoxSwitch.Exp]);
      sendBuffer:WriteBoolean(this.client.general[EMachineBoxSwitch.Shotput]);
      Network.Send(65, 1, sendBuffer);
    else
      --C:065-002 <暫停機關盒>
      if Network.loginFinished then
        Network.Send(65, 2);
      end
    end
  end

  Function.UpdateAniBtn();

  if UI.IsVisible(UIFight) and Role.player.war ~= EWar.Guest then
    if active then
      FightField.HandleAutoDig();
    end
  end
end

function MachineBox.EndOfLine4()
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

function MachineBox.EndOfLine5()
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

--C:065-004 <移除晶石> +晶石ID(2) +背包索引(2)
function MachineBox.SendRemoveSpar(sparIndex, bagIndex)
  sendBuffer:Clear();
  sendBuffer:WriteUInt16(this.spar[sparIndex].Id);
  sendBuffer:WriteUInt16(bagIndex);
  Network.Send(65, 4, sendBuffer);

  if UI.IsVisible(UIItemInfo) then
    UI.Close(UIItemInfo);
  end
end

--S:065-006 收到已鑲坎的晶石 <<+索引(1) +晶石ID(2) +數量(2)>>
function MachineBox.RevUseSpar(data)
  while data.length > 0 do
    local idx = data:ReadByte();
    this.spar[idx] = {};
    this.spar[idx].Id = data:ReadUInt16();
    this.spar[idx].count = data:ReadUInt16();
  end

  if UI.IsVisible(UIMachineBox) then
    UIMachineBox.UpdateSparUI();
  end
end

function MachineBox.EndOfLine6()
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

function MachineBox.EndOfLine7()
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

function MachineBox.EndOfLine8()
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

--S:065-011 收到經驗瓶 +優先索引(1)+ <<+索引(1) +經驗瓶ID(2) +經驗值(4)>>
function MachineBox.RevExpBottle(data)
  table.Clear(this.bottle);

  this.priority = data:ReadByte();

  while data.length > 0 do
    local idx = data:ReadByte();

    this.bottle[idx] = {};
    this.bottle[idx].Id = data:ReadUInt16();
    this.bottle[idx].exp = data:ReadInt32();
  end

  if UI.IsVisible(UIMachineBox) then
    UIMachineBox.UpdateExp();
  end

  this.CheckExpBottleRedDot();
end

--S:065-012 更新經驗瓶 +索引(1) +經驗值(4)
function MachineBox.UpdateExpBottle(data)
  local idx = data:ReadByte();
  this.bottle[idx].exp = data:ReadInt32();
  
  if UI.IsVisible(UIMachineBox) then
    UIMachineBox.UpdateExpBottle();
  end

  this.CheckExpBottleRedDot(idx);
end

function MachineBox.CheckExpBottleRedDot(index)
  local itemData;
  local needRemove = false;

  if index ~= nil then
    itemData = itemDatas[this.bottle[index].Id];

    if itemData == nil then return end

    if this.bottle[index].exp >= itemData.threshold then
      RedDot.Add(ERedDot.ExpBottle);
    end
  else
    needRemove = true;

    for k, v in pairs(this.bottle) do
      if v ~= nil and v.Id > 0 then
        itemData = itemDatas[v.Id];
        if itemData ~= nil then
          if v.exp >= itemData.threshold then
            RedDot.Add(ERedDot.ExpBottle);
            needRemove = false;
            break;
          end
        end
      end
    end

    if needRemove then
      RedDot.Remove(ERedDot.ExpBottle);
    end
  end
end

function MachineBox.EndOfLine9()
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

function MachineBox.EndOfLine10()
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

function MachineBox.EndOfLine11()
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

--S:065-013 設定經驗瓶  1:成功 +索引(1)
function MachineBox.SetExpBottle(data)
  this.priority = data:ReadByte();

  if UI.IsVisible(UIMachineBox) then
    UIMachineBox.UpdateExpBottle();
    UIMachineBox.UpdateExpBottleInfo(this.priority);
  end
end

--S:065-014 <機關盒經驗瓶擴充數量> +數量(1) +是否顯示訊息(1)
function MachineBox.RevExpExtendNum(data)
  local num = data:ReadByte();
  local msg = data:ReadByte();

  this.expExtendNum = num;

  if UI.IsVisible(UIMachineBox) then
    UIMachineBox.UpdateExpBottle();
  end

  if msg == 1 then
    --ShowCenterMessage("exp bottle use success");
  end
end

--S:065-008 收到機關盒晶石擴充數量
function MachineBox.RevSparExtendNum(data)
  local num = data:ReadByte();
  local msg = data:ReadByte();

  if not Between(num, 0, Item.MaxSparExtKind) then return end

  this.sparExtendNum = num;

  if UI.IsVisible(UIMachineBox) then
    UIMachineBox.UpdateSparUI();
  end

  if msg == 1 then
    ShowCenterMessage(string.Get(80275));
  end
end

--S:068-001 使用晶石天行異能結果 0.成功
function MachineBox.RecvWarp(data)
  if data:ReadByte() ~= 0 then
    ShowCenterMessage(string.Get(90175), 3);
  end
end

--S:068-002 使用卷軸天行異能結果
function MachineBox.RecvSkyWarp(data)
  logError("S:068-002 使用卷軸天行異能結果");
end

function MachineBox.EndOfLine12()
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

function MachineBox.EndOfLine13()
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

function MachineBox.EndOfLine14()
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

function MachineBox.GetExpBottleCount()
  local count = 0;

  for k, v in pairs(this.bottle) do
    if v ~= nil and v.Id > 0 then
      count = count + 1;
    end
  end

  return count;
end

function MachineBox.GetPetId()
  if Role.player:GetAttribute(EAttribute.Element) == 1 then
    return this.PowerBodo1;
  elseif Role.player:GetAttribute(EAttribute.Element) == 2 then
    return this.PowerBodo2;
  elseif Role.player:GetAttribute(EAttribute.Element) == 3 then
    return this.PowerBodo3;
  elseif Role.player:GetAttribute(EAttribute.Element) == 4 then
    return this.PowerBodo4;
  else
    return this.PowerBodo1;
  end
end

function MachineBox.GetSparCount()
  local count = 0;
  for k, v in pairs(this.spar) do
    if v.Id > 0 then
      count = count + 1;
    end
  end

  return count;
end

function MachineBox.CheckHaveSpar(itemId)
  local result = false;

  for i = 1, this.MaxSparBase + this.sparExtendNum do
    if this.spar[i] ~= nil and (this.spar[i].Id == itemId) then
      result = true;
      break;
    end
  end

  return result;
end

function MachineBox.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MachineBox.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MachineBox.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MachineBox.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

--檢查有無異能晶石
function MachineBox.HaveSkySpar()
  local result = false;
  for i = 1, this.MaxSparBase + this.sparExtendNum do
    if this.spar[i] ~= nil and (this.spar[i].Id == 46162 or this.spar[i].Id == 46456) then
      result = true;
      break;
    end
  end

  return result;
end

function MachineBox.GetFightMode(npcId)
  return this.GetFightSetting(npcId).fightMode;
end

function MachineBox.GetExitThreshold(npcId)
  return this.GetFightSetting(npcId).exitThreshold;
end

function MachineBox.GetAOEThreshold(npcId)
  return this.GetFightSetting(npcId).aoeThreshold;
end

function MachineBox.GetMoveMode()
  return this.client.moveMode;
end

function MachineBox.CheckChaseElement(element)
  return this.client.chaseFilter[element] ~= false;
end

function MachineBox.GetEscape()
  return this.client.escape;
end

function MachineBox.Trash4()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MachineBox.Trash5()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MachineBox.GetSkill(npcId, skillKind)
  local skillId = 0
  if skillKind == EMachineBoxSkill.AOE then
    skillId = this.GetFightSetting(npcId).aoeSkill;
  elseif skillKind == EMachineBoxSkill.Single then
    skillId = this.GetFightSetting(npcId).singleSkill;
  end

  if skillId == nil then
    skillId = this.BasicSkill;
  end

  return skillId;
end

function MachineBox.Clear()
  table.Clear(this.spar);
  table.Clear(this.bottle);
  table.Clear(this.useItems);
  table.Clear(this.getItems);
end

--進行補給
local SortSupplyItem = function(a, b)
  return a[3] < b[3];
end

function MachineBox.ExceptionSupply(itemId)
  return false;
end

function MachineBox.Supply(checkItem)
  local hpItems = {};
  local spItems = {};
  local expItems = {};
  local hammerItems = {};
  local hoeItems = {};
  local expEquipIndex = 0;

  local bag = Item.GetBag(EThings.Bag);
  for k, v in pairs(bag) do
    local itemData = itemDatas[v.Id];

    --補品
    if Contains(itemData.kind, EItemKind.Item_17, EItemKind.Item_18) then
      if not MarkManager.IsMissionItem(v.Id) and not this.ExceptionSupply(v.Id) then
        for kk, vv in pairs(itemData.attribute) do
          if vv.value > 100 then
            if vv.kind == EAttribute.Hp then
              table.insert(hpItems, { k, v.quant, vv.value - 100 });
            elseif vv.kind == EAttribute.Sp then
              table.insert(spItems, { k, v.quant, vv.value - 100 });
            end
          end
        end
      end

    --福神道具
    elseif itemData.kind == EItemKind.SpecialAbility and itemData.specialAbility == EItemUseKind.ExpGod then
      table.insert(expItems, { k, v.quant, itemData.skillLink });

    --福神紋章
    elseif expEquipIndex == 0 and Contains(itemData.specialAbility, EItemUseKind.ExpEquip150Pa, EItemUseKind.ExpEquip200Pa, EItemUseKind.ExpEquipArgPa) then
      expEquipIndex = k;

    --鉛錘
    elseif itemData.kind == EItemKind.DamageEquip and itemData.elementValue == 1 then
      if hammerItems[v.Id] == nil then
        hammerItems[v.Id] = {};
      end
      table.insert(hammerItems[v.Id], k);

      --鋤頭
    elseif itemData.specialAbility == EItemUseKind.ItemUse_8 then
      table.insert(hoeItems, k);
    end
  end

  table.sort(hpItems, SortSupplyItem);
  table.sort(spItems, SortSupplyItem);
  table.sort(expItems, SortSupplyItem);

  if Role.player ~= nil then
    local needHp = math.ceil(Role.player:GetAttribute(EAttribute.MaxHp) * this.client.playerHp * 0.01) - Role.player:GetAttribute(EAttribute.Hp);
    local needSp = math.ceil(Role.player:GetAttribute(EAttribute.MaxSp) * this.client.playerSp * 0.01) - Role.player:GetAttribute(EAttribute.Sp);

    --logError("Player Hp need "..needHp.." Sp need "..needSp);
    for k, hpItem in pairs(hpItems) do
      if needHp <= 0 then
        break;
      end

      local useQuant = math.min(math.ceil(needHp / hpItem[3]), hpItem[2]);
      --logError("Use "..itemDatas[bag[hpItem[1]].Id].name.." * "..useQuant);

      needHp = needHp - (useQuant * hpItem[3]);
      --logError("HP +"..(useQuant * hpItem[3]));

      hpItem[2] = hpItem[2] - useQuant;

      for kk, spItem in pairs(spItems) do
        if spItem[1] == hpItem[1] then
          needSp = needSp - (useQuant * spItem[3]);
          --logError("SP +"..(useQuant * spItem[3]));

          spItem[2] = spItem[2] - useQuant;
        end
      end

      if useQuant > 0 then
        this.SedUseItem(hpItem[1], useQuant, 0, 0);
      end
    end

    for k, spItem in pairs(spItems) do
      if needSp <= 0 then
        break;
      end

      local useQuant = math.min(math.ceil(needSp / spItem[3]), spItem[2]);
      --logError("Use "..itemDatas[bag[spItem[1]].Id].name.." * "..useQuant);

      needSp = needSp - (useQuant * spItem[3]);
      --logError("SP +"..(useQuant * spItem[3]));

      spItem[2] = spItem[2] - useQuant;

      for kk, hpItem in pairs(hpItems) do
        if hpItem[1] == spItem[1] then
          needHp = needHp - (useQuant * hpItem[3]);
          --logError("HP +"..(useQuant * hpItem[3]));

          hpItem[2] = hpItem[2] - useQuant;
        end
      end

      if useQuant > 0 then
        this.SedUseItem(spItem[1], useQuant, 0, 0);
      end
    end
  end
  
  local followNpcs = Role.GetFollowNpcs(Role.playerId);
  for k, v in pairs(followNpcs) do
    local fightSetting = this.GetFightSetting(v.npcId);
    
    local needHp = math.ceil(v:GetAttribute(EAttribute.MaxHp) * fightSetting.hp * 0.01) - v:GetAttribute(EAttribute.Hp);
    local needSp = math.ceil(v:GetAttribute(EAttribute.MaxSp) * fightSetting.sp * 0.01) - v:GetAttribute(EAttribute.Sp);

    --logError("FightNpc Hp need "..needHp.." Sp need "..needSp);
    for k, hpItem in pairs(hpItems) do
      if needHp <= 0 then
        break;
      end

      local useQuant = math.min(math.ceil(needHp / hpItem[3]), hpItem[2]);
      --logError("Use "..itemDatas[bag[hpItem[1]].Id].name.." * "..useQuant);

      needHp = needHp - (useQuant * hpItem[3]);
      --logError("HP +"..(useQuant * hpItem[3]));

      hpItem[2] = hpItem[2] - useQuant;

      for kk, spItem in pairs(spItems) do
        if spItem[1] == hpItem[1] then
          needSp = needSp - (useQuant * spItem[3]);
          --logError("SP +"..(useQuant * spItem[3]));

          spItem[2] = spItem[2] - useQuant;
        end
      end

      if useQuant > 0 then
        this.SedUseItem(hpItem[1], useQuant, v.index, 0);
      end
    end

    for k, spItem in pairs(spItems) do
      if needSp <= 0 then
        break;
      end

      local useQuant = math.min(math.ceil(needSp / spItem[3]), spItem[2]);
      --logError("Use "..itemDatas[bag[spItem[1]].Id].name.." * "..useQuant);

      needSp = needSp - (useQuant * spItem[3]);
      --logError("SP +"..(useQuant * spItem[3]));

      spItem[2] = spItem[2] - useQuant;

      for kk, hpItem in pairs(hpItems) do
        if hpItem[1] == spItem[1] then
          needHp = needHp - (useQuant * hpItem[3]);
          --logError("HP +"..(useQuant * hpItem[3]));

          hpItem[2] = hpItem[2] - useQuant;
        end
      end

      if useQuant > 0 then
        this.SedUseItem(spItem[1], useQuant, v.index, 0);
      end
    end
  end

  --檢查福神
  if this.client.general[EMachineBoxSwitch.Exp] then
    --福神紋章
    local itemSave = Item.GetBagItem(EThings.Equip, EItemFitType.Equip_Spec, 0);
    if itemSave ~= nil and itemSave.damage >= EThingsDurability.Damaged then
      local itemData = itemDatas[itemSave.damagedItemId];
      if itemData ~= nil and Contains(itemData.specialAbility, EItemUseKind.ExpEquip150Pa, EItemUseKind.ExpEquip200Pa, EItemUseKind.ExpEquipArgPa) then
        --C:023-013 <丟棄玩家裝備> +背包索引(1)
        sendBuffer:Clear();
        sendBuffer:WriteByte(EItemFitType.Equip_Spec);
        Network.Send(23, 13, sendBuffer);

        if expEquipIndex ~= 0 then
          Item.SendUseEquip(expEquipIndex);
          this.Statistics(EMachineBoxStats.UseItem, expEquipIndex, 1);
        end
      end
    end

    --福神道具
    if Role.player.data.godMission < 1 then
      if expItems[1] ~= nil and expItems[1][2] > 0 then
        this.SedUseItem(expItems[1][1], 1, 0, 0);
      end
    end
  end
  
  --檢查鉛錘
  if this.client.general[EMachineBoxSwitch.Shotput] then
    for followIndex = 0, Role.maxFollowNpc do
      local itemSave = Item.GetBagItem(EThings.Equip, EItemFitType.Equip_Spec, followIndex);
      if itemSave ~= nil and itemSave.damage >= EThingsDurability.Damaged then
        local itemData = itemDatas[itemSave.damagedItemId];
        if itemData ~= nil and itemData.kind == EItemKind.DamageEquip and itemData.elementValue == 1 then
          if followIndex > 0 then
            --C:023-019 <丟棄武將裝備> +武將索引(1) +裝備位置(1)
            sendBuffer:Clear()
            sendBuffer:WriteByte(followIndex);
            sendBuffer:WriteByte(EItemFitType.Equip_Spec);
            Network.Send(23, 19, sendBuffer);
          else
            --C:023-013 <丟棄玩家裝備> +背包索引(1)
            sendBuffer:Clear()
            sendBuffer:WriteByte(EItemFitType.Equip_Spec);
            Network.Send(23, 13, sendBuffer);
          end

          if hammerItems[itemSave.damagedItemId] ~= nil and table.maxn(hammerItems[itemSave.damagedItemId]) > 0 then
            local hammerIndex = hammerItems[itemSave.damagedItemId][1];
            table.remove(hammerItems[itemSave.damagedItemId], 1);

            Item.SendUseEquip(hammerIndex, followIndex);
            this.Statistics(EMachineBoxStats.UseItem, hammerIndex, 1);
          end
        end
      end
    end
  end

  --檢查鋤頭
  if this.client.general[EMachineBoxSwitch.Hoe] then
    for followIndex = 0, Role.maxFollowNpc do
      local itemSave = Item.GetBagItem(EThings.Equip, EItemFitType.Equip_Hand, followIndex);
      if itemSave ~= nil and itemSave.damage >= EThingsDurability.Damaged then
        local itemData = itemDatas[itemSave.damagedItemId];

        if itemData ~= nil then
          if followIndex > 0 then
            --C:023-019 <丟棄武將裝備> +武將索引(1) +裝備位置(1)
            sendBuffer:Clear()
            sendBuffer:WriteByte(followIndex);
            sendBuffer:WriteByte(EItemFitType.Equip_Hand);
            Network.Send(23, 19, sendBuffer);
          else
            --C:023-013 <丟棄玩家裝備> +背包索引(1)
            sendBuffer:Clear()
            sendBuffer:WriteByte(EItemFitType.Equip_Hand);
            Network.Send(23, 13, sendBuffer);
          end

          if hoeItems[1] ~= nil then
            local itemIndex = hoeItems[1];
            table.remove(hoeItems, 1);
            Item.SendUseEquip(itemIndex, followIndex);
            this.Statistics(EMachineBoxStats.UseItem, itemIndex, 1);
          end
        end
      end
    end
  end

  --檢查異界時間
  if this.client.general[EMachineBoxSwitch.LimitDungeon] then
    for k, v in pairs(limitTimeDungeonDatas) do
      if v.sceneId == SceneManager.sceneId then
        local useMinutes = RoleCount.Get(v.limitIndex);
        if v.limitTime - useMinutes < 10 then
          for bagIndex, itemSave in pairs(bag) do
            local itemData = itemDatas[itemSave.Id];
            if itemData.specialAbility == EItemUseKind.RoleCount and itemData.roleCountIndex == v.limitIndex then
              this.SedUseItem(bagIndex, 1, 0, 0);
              break;
            end
          end
        end
        break;
      end
    end
  end
  
  --檢查補品用完回村
  if checkItem then
    local haveHpItem = false;
    for k, hpItem in pairs(hpItems) do
      if hpItem[2] > 0 then
        haveHpItem = true;
        break;
      end
    end

    local haveSpItem = false;
    for k, spItem in pairs(spItems) do
      if spItem[2] > 0 then
        haveSpItem = true;
        break;
      end
    end

    if (this.client.general[EMachineBoxSwitch.Hp] and not haveHpItem) or
       (this.client.general[EMachineBoxSwitch.Sp] and not haveSpItem) then
      --C:065-005 <飛回紀錄點>
      Network.Send(65, 5);
    end
  end
end

function MachineBox.Trash6()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MachineBox.Trash7()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MachineBox.Trash8()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MachineBox.SedUseItem(useIdx, quant, followIndex, useType)
  Item.SendUseItem(useIdx, quant, followIndex, useType);

  this.Statistics(EMachineBoxStats.UseItem, useIdx, quant);
end

--BeeMove
this.autoMove = false;
this.autoMoving = false;

function MachineBox.SetAutoMove(active)
  --組隊中非隊長強制關閉
  if active and not Team.IsAlone(Role.playerId) and not Team.IsLeader(Role.playerId) then
    ShowCenterMessage(string.Get(20129));
    return;
  end

  if this.autoMove == active then return end

  this.autoMove = active;
  this.autoMoving = false;

  if active then
    Scene.UpdateCamera(Role.player.position, true);
  else
    ShowCenterMessage(string.Get(20129));
  end

  Function.UpdateAniBtn(EFunction.BeeMove);

  if this.client.general[EMachineBoxSwitch.EcoMode] then
    Role.UpdateAllView();
  end
end

function MachineBox.Trash9()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MachineBox.Trash10()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

--統計
function MachineBox.Statistics(kind, param, quant, param2)
  if this.autoFight then
    if kind == EMachineBoxStats.StartTime then
      CGTimer.AddListener(this.UpdateTime, 1, true);

    elseif kind == EMachineBoxStats.EndTime then
      CGTimer.RemoveListener(this.UpdateTime);

    elseif kind == EMachineBoxStats.Exp then
      this.statisticsDatas[EMachineBoxStats.Exp] = this.statisticsDatas[EMachineBoxStats.Exp] + quant;

      UIMachineBox.UpdateStatsExp();

    elseif kind == EMachineBoxStats.Fight then
      this.statisticsDatas[EMachineBoxStats.Fight] = this.statisticsDatas[EMachineBoxStats.Fight] + 1;

      UIMachineBox.UpdateStatsFight();

    elseif kind == EMachineBoxStats.Death then
      this.statisticsDatas[EMachineBoxStats.Death] = this.statisticsDatas[EMachineBoxStats.Death] + 1;

      UIMachineBox.UpdateStatsDeath();

    elseif kind == EMachineBoxStats.UseItem then
      local itemSave = Item.GetBagItem(EThings.Bag, param);
      local name = "";

      if itemSave == nil then return end

      local itemData = itemDatas[itemSave.Id];
      if itemData ~= nil then
        name = itemData:GetName(true);
      end

      this.InsertItems(this.useItems, itemSave.Id, name, quant);

      UIMachineBox.UpdateStatsItem();

    elseif kind == EMachineBoxStats.GetItem then
      if param ~= 23024 then  --損壞的
        this.InsertItems(this.getItems, param, param2, quant);

        UIMachineBox.UpdateStatsItem();
      end
    end
  end
end

function MachineBox.InsertItems(t, itemId, name, quant)
  local needInsert = true;

  for k, v in pairs(t) do
    if v.Id == itemId then
      v.quant = v.quant + quant;
      needInsert = false;
    end
  end

  if needInsert then
    local newItem = {};
    newItem.Id = itemId;
    newItem.name = name;
    newItem.quant = quant;

    t[table.Count(t) + 1] = newItem;
  end
end

function MachineBox.GetStats(kind)
  if Contains(kind, EMachineBoxStats.StartTime, EMachineBoxStats.Fight, EMachineBoxStats.Exp, EMachineBoxStats.Death) then
    return this.statisticsDatas[kind];
  elseif kind == EMachineBoxStats.UseItem then
    return this.useItems;
  elseif kind == EMachineBoxStats.GetItem then
    return this.getItems;
  else
    return nil;
  end
end

function MachineBox.ClearStats()
  this.statisticsDatas[EMachineBoxStats.StartTime] = 0;
  this.statisticsDatas[EMachineBoxStats.Exp] = 0;
  this.statisticsDatas[EMachineBoxStats.Fight] = 0;
  this.statisticsDatas[EMachineBoxStats.Death] = 0;

  table.Clear(this.useItems);
  table.Clear(this.getItems);
end

function MachineBox.UpdateTime()
  this.statisticsDatas[EMachineBoxStats.StartTime] = this.statisticsDatas[EMachineBoxStats.StartTime] + 1;

  UIMachineBox.UpdateStatsTime();
end

--使用異界護符
function MachineBox.CheckLimitTimeDungeonItem()
  local bag = Item.GetBag(EThings.Bag);
  if this.client.general[EMachineBoxSwitch.LimitDungeon] and not FightField.isInBattle then
    for k, v in pairs(limitTimeDungeonDatas) do
      if v.sceneId == SceneManager.sceneId then
        local useMinutes = RoleCount.Get(v.limitIndex);
        if v.limitTime - useMinutes < 10 then
          for bagIndex, itemSave in pairs(bag) do
            local itemData = itemDatas[itemSave.Id];
            if itemData.specialAbility == EItemUseKind.RoleCount and itemData.roleCountIndex == v.limitIndex then
              this.SedUseItem(bagIndex, 1, 0, 0);
              break;
            end
          end
        end
        break;
      end
    end
  end
end

function MachineBox.Trash11()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MachineBox.Trash12()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MachineBox.Trash13()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end