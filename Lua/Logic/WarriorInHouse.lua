WarriorInHouse = {}
local this = WarriorInHouse;

this.allNpc = {};
this.totalCombination = 0;

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

local npcInHouse = {};
local serHouseWarriors = {};

local npcMaxCount = 4;
local npcLevel = 120;
local npcTurn = 2;

local blockSendData = 1;

function WarriorInHouse.Initialize()
  for i = 1, 8 do
    npcInHouse[i] = {};
    npcInHouse[i].npcIds = {};
    npcInHouse[i].preNPCIds = {};
    npcInHouse[i].maxCount = 0;
    npcInHouse[i].combination = 0;
  end
end

--打開放置武將介面
function WarriorInHouse.OpenEditor(chosenBlock)
  local data = npcInHouse[chosenBlock].npcIds;

  table.Clear(npcInHouse[chosenBlock].preNPCIds);

  for i = 1, table.Count(data) do
    if data[i] == nil then
      npcInHouse[chosenBlock].preNPCIds[i] = 0;
    else
      table.insert(npcInHouse[chosenBlock].preNPCIds, data[i]);
    end
  end
end

--關閉放置武將介面
function WarriorInHouse.CloseEditor(chosenBlock, change)
  blockSendData = chosenBlock;
  if change == false then
    this.SetPreNpcData();
  else
    this.SendHouseWarriorData();
  end
end

function WarriorInHouse.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function WarriorInHouse.Script2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function WarriorInHouse.Script3()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function WarriorInHouse.CheckScore()
  if blockSendData == nil then return end
  local house = HouseManager.GetCurrentBuilding();
  local floor = HouseManager.GetCurrentFloor();
  local chosenBlock = this.TransformHouseToBlock(house, floor);

  if this.GetBlockNpcCount(chosenBlock) > this.GetBlockMaxCount(chosenBlock) then
    for i = this.GetBlockMaxCount(chosenBlock) + 1, npcMaxCount do
      npcInHouse[blockSendData].npcIds[i] = 0;
    end

    this.SendHouseWarriorData();
  end
end

function WarriorInHouse.SendHouseWarriorData()
  if blockSendData == nil then return end
  local house, floor = this.TransformBlockToHouse(blockSendData);

  --C:106-003 <設定小屋武將> +<<武將ID(2)>> * 4 +小屋編號(1) +樓層(1)
  sendBuffer:Clear();
  for i = 1, 4 do
    sendBuffer:WriteUInt16(npcInHouse[blockSendData].npcIds[i] or 0);
  end
  sendBuffer:WriteByte(house);
  sendBuffer:WriteByte(floor);
  Network.Send(106, 3, sendBuffer);
end

function WarriorInHouse.ReceiveHouseWarrior(houseWarriors)
  serHouseWarriors = houseWarriors;
  blockSendData = this.TransformHouseToBlock(HouseManager.GetCurrentBuilding(), HouseManager.GetCurrentFloor());
  npcInHouse[blockSendData].npcIds = houseWarriors;
  this.CreateHouseWarriorByServer();
end

function WarriorInHouse.Script4()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function WarriorInHouse.Script5()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function WarriorInHouse.Script6()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function WarriorInHouse.CreateHouseWarriorByServer()
  for k, v in pairs(Role.houseWarriors) do
    Role.HouseWarriorDisappear(k);
  end

  for k, v in pairs(serHouseWarriors) do
    Role.HouseWarriorAppear(k, v);
  end
end

function WarriorInHouse.Script7()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function WarriorInHouse.GetAllNpc()
  table.Clear(this.allNpc);

  if table.Count(Role.followNpcs[Role.playerId]) ~= 0 then
    for i = 1, Role.maxFollowNpc do

      if Role.followNpcs[Role.playerId] == nil then
        break;
      end

      local roleTemp = Role.followNpcs[Role.playerId][i];

      if roleTemp ~= nil then
        if roleTemp.data.canGrow ~= 0 and roleTemp.data.canGrow ~= 2 then
          local npc = {}
          local npcData = npcDatas[roleTemp.npcId];
          if roleTemp:GetAttribute(EAttribute.Lv) >= npcLevel and roleTemp:GetAttribute(EAttribute.Turn) >= npcTurn then

            npc.npcId = roleTemp.npcId;
            npc.name = roleTemp.name;
            npc.hp = roleTemp:GetAttribute(EAttribute.Hp);
            npc.level = roleTemp:GetAttribute(EAttribute.Lv);
            npc.turn = npcData.turn;
            npc.element = npcData.element;

            this.allNpc[npc.npcId] = npc;
          end
        end
      end
    end
  end

  if table.Count(Inn.npcs) ~= 0 then
    for i = 1, Inn.maxSpace do
      if Inn.npcs[i] ~= nil then
        local npc = Inn.npcs[i];
        local npcData = npcDatas[npc.npcId];

        if npc.level >= npcLevel and npcData.turn >= npcTurn then

          npc.turn = npcData.turn;
          npc.element = npcData.element;
          this.allNpc[npc.npcId] = npc;
        end

      end
    end
  end

  if table.Count(Cart.followNpcs) ~= 0 then
    for i = 1, Cart.GetCartSize() do
      if Cart.followNpcs[i] ~= nil then
        local npc = Cart.followNpcs[i];
        local npcData = npcDatas[npc.npcId];

        if npc.Lv >= npcLevel and npcData.turn >= npcTurn then

          npc.level = npc.Lv;
          npc.turn = npcData.turn;
          npc.element = npcData.element;
          this.allNpc[npc.npcId] = npc;
        end
      end
    end
  end
end

function WarriorInHouse.SetNpcData(house, floor, data)
  local index = this.TransformHouseToBlock(house, floor);

  table.Clear(npcInHouse[index].npcIds);
  table.Clear(npcInHouse[index].preNPCIds);
  npcInHouse[index].maxCount = 0;
  npcInHouse[index].combination = 0;

  for i = 1, 4 do
    local id = data:ReadUInt16();
      npcInHouse[index].npcIds[i] = id;
  end

  this.GetFloorCombinationAttribute(index);
end

--取得放在小屋內的所有武將
function WarriorInHouse.GetAllNpcInHouse()
  local data = {};
  for i = 1, table.Count(npcInHouse) do
    local temp = npcInHouse[i].npcIds;
    for k = 1, this.GetBlockMaxCount(i) do
      if temp[k] ~= 0 or temp[k] ~= nil then
        table.insert(data, temp[k]);
      end
    end
  end

  return data;
end

function WarriorInHouse.SetPreNpcData()
  local data = npcInHouse[blockSendData].preNPCIds;

  table.Clear(npcInHouse[blockSendData].npcIds);

  for i = 1, table.Count(data) do
    table.insert(npcInHouse[blockSendData].npcIds, data[i]);
  end

  UI.Close(UIHouseSettingFunction);

  this.GetFloorCombinationAttribute(blockSendData);
end

function WarriorInHouse.Script8()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function WarriorInHouse.Script9()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end


function WarriorInHouse.Script10()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function WarriorInHouse.TransformHouseToBlock(house, floor)
  if floor % 2 == 0 then
    return floor * house;
  else
    return house * 2 - 1;
  end
end

function WarriorInHouse.TransformBlockToHouse(chosenBlock)
  local house, floor;
  if chosenBlock % 2 == 0 then
    house = chosenBlock / 2;
    floor = 2;
  else
    house = chosenBlock / 2 + 0.5;
    floor = 1;
  end

  return house, floor;
end

function WarriorInHouse.SetNpcInBlock(chosenBlock, npcId)
  for i = 1, this.GetBlockMaxCount(chosenBlock) do
    if npcInHouse[chosenBlock].npcIds[i] == nil or npcInHouse[chosenBlock].npcIds[i] == 0 then
      npcInHouse[chosenBlock].npcIds[i] = npcId;
      break;
    end
  end
end

function WarriorInHouse.RemoveNpcFromBlock(chosenBlock, index)
  npcInHouse[chosenBlock].npcIds[index] = nil;
end

function WarriorInHouse.ExchangeNpc(chosenBlock, npcId, index)
  npcInHouse[chosenBlock].npcIds[index] = npcId;
end

function WarriorInHouse.Script11()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function WarriorInHouse.Script12()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function WarriorInHouse.Script13()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function WarriorInHouse.Script14()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function WarriorInHouse.GetHouseNpcId(chosenBlock, index)
  return npcInHouse[chosenBlock].npcIds[index];
end

function WarriorInHouse.GetNpcData(npcId)
  return this.allNpc[npcId];
end

function WarriorInHouse.GetMaxCount(house, floor)
  return this.GetBlockMaxCount(this.TransformHouseToBlock(house, floor));
end

function WarriorInHouse.GetNpcCount(house, floor)
  return this.GetBlockNpcCount(this.TransformHouseToBlock(house, floor));
end

function WarriorInHouse.Demo()
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

function WarriorInHouse.GetBlockNpcCount(chosenBlock)
  local count = 0;
  for i = 1, npcMaxCount do
    if npcInHouse[chosenBlock].npcIds[i] ~= nil and npcInHouse[chosenBlock].npcIds[i] ~= 0 then
      count = count + 1;
    end
  end

  return count;
end

function WarriorInHouse.Demo2()
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

function WarriorInHouse.GetBlockMaxCount(chosenBlock)
  npcInHouse[chosenBlock].maxCount = 0;

  local house, floor = this.TransformBlockToHouse(chosenBlock);

  for i = 1, npcMaxCount do
    if numberOfHouseWarriorDatas[i].score <= HouseManager.GetFloorScore(house, floor) then
      npcInHouse[chosenBlock].maxCount = numberOfHouseWarriorDatas[i].number;
    end
  end

  return npcInHouse[chosenBlock].maxCount;
end

function WarriorInHouse.CheckCombination(index, chosenBlock)
  local data = warriorCombinationDatas[index];
  local flag = 0;
  local countOfData = 0;

  npcInHouse[chosenBlock].combination = 0;

  for i = 1, npcMaxCount do
    if data.warriors[i] ~= 0 then
      countOfData = countOfData + 1;
    end
  end

  for i = 1, table.Count(npcInHouse[chosenBlock].npcIds) do
    for j = 1, npcMaxCount do
      local sortIndex = collectWarriorSortDatas[data.warriors[j]];
      if sortIndex ~= nil then
        for k = 1, table.Count(sortIndex.ids) do
          if npcInHouse[chosenBlock].npcIds[i] == sortIndex.ids[k] then
            flag = flag + 1;
            break;
          end
        end
      end
    end
  end

  if flag == countOfData then
    npcInHouse[chosenBlock].combination = index;
    return true;
  else
    return false;
  end

end

function WarriorInHouse.Demo3()
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

function WarriorInHouse.Demo4()
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

function WarriorInHouse.Demo5()
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

function WarriorInHouse.GetSortedCombination()
  local data = {};

  local combinationInUsed = {};
  local combinationNotUse = {};

  this.totalCombination = 0;

  for i = 1, table.Count(warriorCombinationDatas) do
    local hasCombination = false;
    for j = 1, table.Count(npcInHouse) do
      if npcInHouse[j].combination == warriorCombinationDatas[i].index then
        table.insert(combinationInUsed, warriorCombinationDatas[i]);
        this.totalCombination = this.totalCombination + 1;
        hasCombination = true;
        break;
      end;
    end

    if hasCombination == false then
      table.insert(combinationNotUse, warriorCombinationDatas[i]);
    end
  end

  for i = 1, table.Count(combinationInUsed) do
    table.insert(data, combinationInUsed[i]);
  end

  for i = 1, table.Count(combinationNotUse) do
    table.insert(data, combinationNotUse[i]);
  end

  return data;
end

function WarriorInHouse.GetCombinationAttribute(index)
  local data = warriorCombinationDatas[index];
  if data == nil then
    return "";
  else
    return string.Concat(ItemData.GetAttrText(data.values.kind), "+", data.values.value);
  end;
end

function WarriorInHouse.Demo6()
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

function WarriorInHouse.Demo7()
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

function WarriorInHouse.GetFloorCombinationAttribute(chosenBlock)
  if this.GetBlockMaxCount(chosenBlock) == 0 then return string.Get(23576) end
  if this.GetBlockNpcCount(chosenBlock) == 0 then return string.Get(23576) end

  for i = 1, table.Count(warriorCombinationDatas) do
    if this.CheckCombination(i, chosenBlock) then
      return this.GetCombinationAttribute(i);
    end
  end

  return string.Get(23576);
end
