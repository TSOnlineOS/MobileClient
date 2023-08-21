EJiugongge = {
  Normal = 1, --一般型
  Open = 2, --開服型
  Festival = 3, --慶典型
}

Jiugongge = {}
local this = Jiugongge;

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


this.grid = {};--持有的盤面
this.gridKind = {};--持有的種類
this.missionskindtable = {};--持有任務的種類表
local inited = false;

function Jiugongge.Clear()
  table.Clear(this.grid);
  table.Clear(this.gridKind);
  table.Clear(this.missionskindtable);
end

function Jiugongge.Initialize()
  inited = true;
end

--取得盤面
function Jiugongge.GetJiugonggeGrid(Id) 
  if this.grid[Id] ~= nil then
    return this.grid[Id];
  end

  return;
end

function Jiugongge.Demo()
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

function Jiugongge.Demo1()
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


function Jiugongge.Demo2()
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

--S:091-001 九宮格資料 數量(1) + <<九宮格ID(2)+ 難度(1) +9*<<任務ID(2)+ 任務參數(DWord) +  是否完成(1)[0.否 1.是]>>>>
function Jiugongge.SetJiugongge(data)
  local count = data:ReadByte();

  for i = 1, count do
    local grid = {}
    local result;
    local roleCount;
    grid.Id = data:ReadUInt16();
    grid.difficulty = data:ReadByte();
    grid.missions = {}
    
    for j = 1, 9 do
      if this.grid[grid.Id] ~= nil then
        this.DeleteJiugonggeMissionKindTable(grid.Id, j, this.grid[grid.Id].missions[j].conditions.kind);
      end
      grid.missions[j] = {};
      grid.missions[j] = this.GetJiugonggeMission(data:ReadUInt16());

      roleCount = data:ReadUInt32();
      result = data:ReadByte();

      if grid.missions[j] ~= nil then
        if grid.missions[j].kind ~= 0 then
          grid.missions[j].conditions.kindValue = roleCount;
        end

        if result == 0 then
          grid.missions[j].isCompleted = false;
          this.SetJiugonggeMissionKindTable(grid.Id, j, grid.missions[j].conditions.kind, grid.missions[j]);
        else
          grid.missions[j].isCompleted = true;
        end
      end
    end

    if this.CheckJiugonggeVaild(grid) then 
      this.grid[grid.Id] = {}
      this.grid[grid.Id] = grid;
      this.GetJiugonggeAward(grid.Id);

      if UI.IsVisible(UIJiugongge) and this.CheckSameKind(UIJiugongge.nowId, grid.Id) then
        UIJiugongge.ChangeGrid(this.GetKind(grid.Id))
      end

      this.UpdateState(grid.Id);
    end
  end

  this.CheckMainFunctionRedDot();
end

--S:091-004 九宮格單筆資料 九宮格ID(2)+ 索引(1)+ 任務ID(2 + 任務參數(DWord))+ 是否完成(1)[0.否 1.是]
function Jiugongge.SetJiugonggeSingle(data)
  local Id = data:ReadUInt16();
  local index = data:ReadByte();

  this.DeleteJiugonggeMissionKindTable(Id, index, this.grid[Id].missions[index].conditions.kind)
  this.grid[Id].missions[index] = this.GetJiugonggeMission(data:ReadUInt16());

  local roleCount = data:ReadUInt32();

  if this.grid[Id].missions[index].kind ~= 0 then
    this.grid[Id].missions[index].conditions.kindValue = roleCount;
  end

  if data:ReadByte() == 0 then
    this.grid[Id].missions[index].isCompleted = false;
    this.SetJiugonggeMissionKindTable(Id, index, this.grid[Id].missions[index].conditions.kind, this.grid[Id].missions[index]);
  else
    this.grid[Id].missions[index].isCompleted = true;
  end

  if UI.IsVisible(UIJiugongge) and Id == UIJiugongge.nowId then
    UIJiugongge.SetJiugongge();
  end
end

function Jiugongge.Demo3()
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

function Jiugongge.Demo4()
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

function Jiugongge.Demo5()
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

--判斷盤面是否有效
function Jiugongge.CheckJiugonggeVaild(grid)
  if table.Count(grid.missions) ~= 9 then
    return false;
  end

  for k, v in pairs(jiugonggeInfos) do
    if v.Id == grid.Id then
      return true
    end
  end

  return false
end

function Jiugongge.CheckSameKind(nowId, Id)
  local nowkind, kind
  for k, v in pairs(jiugonggeInfos) do
    if v.Id == nowId then
      nowkind = v.kind;
    end

    if v.Id == Id then
      kind = v.kind;
    end
  end

  if nowkind == kind then
    return true
  else
    return false
  end
end

function Jiugongge.Demo6()
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

function Jiugongge.Demo7()
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
--取得盤面任務
function Jiugongge.GetJiugonggeMission(Id)
  for k, v in pairs(jiugonggeMissions) do 
    if v.Id == Id then
      return v;
    end
  end
end

--取得盤面獎勵與相關資訊
function Jiugongge.GetJiugonggeAward(Id)
  for k, v in pairs(jiugonggeInfos) do
    if v.Id == Id then
      this.grid[Id].awards = {};
      this.grid[Id].awards = v.awards;
      this.grid[Id].reset = v.reset;
      this.gridKind[v.kind] = {};
      this.gridKind[v.kind].Id = Id;
      this.gridKind[v.kind].activityId = v.activityId;--對照活動表ID
      this.gridKind[v.kind].name = string.Get(v.kindName);--盤面名稱
      this.gridKind[v.kind].kindCount = this.GetKindCount(v.kind);
      this.gridKind[v.kind].difficulty = this.grid[Id].difficulty;--盤面當前階段
      return
    end
  end
end

--取得所有的盤面種類
function Jiugongge.GetKinds()
  local kinds = {};
  for k, v in pairs(this.gridKind) do
    if k ~= EJiugongge.Festival then
      table.insert(kinds, k);--用於切換頁面
    end
  end

  return kinds;
end

--取得該ID種類
function Jiugongge.GetKind(Id)
  for k, v in pairs(this.gridKind) do
    if v.Id == Id then
      return k
    end
  end
end

--計算相同種類盤面數
function Jiugongge.GetKindCount(kind)
  local count = 0;
  for k, v in pairs(jiugonggeInfos) do 
    if v.kind == kind then
      count = count + 1;
    end
  end

  return count;
end

function Jiugongge.Demo8()
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

function Jiugongge.Demo9()
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

function Jiugongge.Demo10()
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

--設置種類表
function Jiugongge.SetJiugonggeMissionKindTable(Id, index, kind, mission)
  if kind == nil then return end

  if this.missionskindtable[kind] == nil then
    this.missionskindtable[kind] = {};
  end

  local temp = {};
  temp.mission = mission
  temp.gridId = Id;
  temp.index = index;

  table.insert(this.missionskindtable[kind], temp);
end

--刪除完成任務之任務種類
function Jiugongge.DeleteJiugonggeMissionKindTable(Id, index, kind)
  if kind == nil then return end

  if this.missionskindtable[kind] == nil then return; end

  for k, v in pairs(this.missionskindtable[kind]) do
    if v.gridId == Id and v.index == index then
      this.missionskindtable[kind][k] = nil;
    end
  end

  if table.Count(this.missionskindtable[kind]) == 0 then
    this.missionskindtable[kind] = nil;
  end
end

--檢查任務是否完成
function Jiugongge.CheckCompeleteKind(conditionKind)
  if not inited then return end
  if this.missionskindtable[conditionKind] == nil then return end

  for k, v in pairs(this.missionskindtable[conditionKind]) do
    if v.mission:IsComplete() then
      --C:91-2 完成任務 數量(1) + <<ID(2)+ 索引(1) +任務ID(2)>>
      sendBuffer:Clear();
      sendBuffer:WriteByte(1);
      sendBuffer:WriteUInt16(v.gridId);
      sendBuffer:WriteByte(v.index);
      sendBuffer:WriteUInt16(v.mission.Id);
      Network.Send(91, 2, sendBuffer);
    else
      if UI.IsVisible(UIJiugongge) and v.gridId == UIJiugongge.nowId then
        UIJiugongge.UpdateJiugonggeSprite(v.index);
      end
    end
  end
end

--S:91-2 完成任務回應 結果(1)[0.失敗 1.成功 +九宮格ID(2) +索引(1)]
function Jiugongge.SetJiugonggeMissionCompleted(Id, index) 
  this.grid[Id].missions[index].isCompleted = true;
  this.DeleteJiugonggeMissionKindTable(Id, index, this.grid[Id].missions[index].conditions.kind);
  this.SetJiugonggeState(Id, index);
end

function Jiugongge.Demo11()
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

function Jiugongge.Demo12()
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

function Jiugongge.Demo13()
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

--S:91-3 領取獎勵回應 結果(1)[0.失敗 1.成功 +九宮格ID(2)+索引(1)]
function Jiugongge.SetJiugonggeAwardIsReceived(Id, index)
  this.grid[Id].awards[index].canGetAward = 2;
  this.CheckMainFunctionRedDot();
  this.SetJiugonggeAwardState(index);
end

--設置任務狀態
function Jiugongge.SetJiugonggeState(Id, index)
  if UI.IsVisible(UIJiugongge) and Id == UIJiugongge.nowId then
    UIJiugongge.UpdateJiugonggeSprite(index);
  end

  local awardSet = this.grid[Id].awards;
  local jiugonggeSet = this.grid[Id].missions;
  local raw = (math.floor((index - 1) / 3) + 1) * 3;
  local column = math.fmod(index - 1, 3) + 1;
  
  if BitFlag.Get(awardSet[math.floor(raw / 3)].getFlag) then
    awardSet[math.floor(raw / 3)].canGetAward = 2;
  elseif jiugonggeSet[raw - 2].isCompleted and jiugonggeSet[raw - 1].isCompleted and jiugonggeSet[raw].isCompleted then
    awardSet[math.floor(raw / 3)].canGetAward = 1;
    this.CheckMainFunctionRedDot();
    this.SetJiugonggeAwardState(math.floor(raw / 3));
  end

  if BitFlag.Get(awardSet[column + 3].getFlag) then
    awardSet[column + 3].canGetAward = 2;
  elseif jiugonggeSet[column + 3].isCompleted and jiugonggeSet[column + 6].isCompleted and jiugonggeSet[column].isCompleted then
    awardSet[column + 3].canGetAward = 1;
    this.CheckMainFunctionRedDot();
    this.SetJiugonggeAwardState(column + 3);
  end
end

--設置領獎狀態
function Jiugongge.SetJiugonggeAwardState(index)
  if UI.IsVisible(UIJiugongge) then
    UIJiugongge.UpdateJiugonggeAwardSprite(index);
    UIJiugongge.UpdatePassCount();
  end
end

function Jiugongge.SetJiugonggeAllAwardState(award, passCount)
  if BitFlag.Get(award.getFlag) then
    award.canGetAward = 2;
  elseif passCount == 6 then
    award.canGetAward = 1;
  else
    award.canGetAward = 0;
  end
end

function Jiugongge.Demo14()
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

function Jiugongge.Demo15()
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

function Jiugongge.Demo16()
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

--取得盤面時，更新狀態
function Jiugongge.UpdateState(Id)
  local passCount = 0;
  local jiugonggeSet = this.grid[Id].missions;
  local awardSet = this.grid[Id].awards;

  for i = 1, 3 do
    local raw = 1 + (i - 1) * 3;
    local column = i;

    if BitFlag.Get(awardSet[i].getFlag) then
      awardSet[i].canGetAward = 2;
      passCount = passCount + 1;
    elseif jiugonggeSet[raw].isCompleted and jiugonggeSet[raw + 1].isCompleted and jiugonggeSet[raw + 2].isCompleted then
      awardSet[i].canGetAward = 1;
      passCount = passCount + 1;
    else
      awardSet[i].canGetAward = 0;
    end

    if BitFlag.Get(awardSet[i + 3].getFlag)  then
      awardSet[i + 3].canGetAward = 2;
      passCount = passCount + 1;
    elseif jiugonggeSet[column].isCompleted and jiugonggeSet[column + 3].isCompleted and jiugonggeSet[column + 6].isCompleted then
      awardSet[i + 3].canGetAward = 1;
      passCount = passCount + 1;
    else
      awardSet[i + 3].canGetAward = 0;
    end
  end

  this.SetJiugonggeAllAwardState(awardSet[7], passCount);

  if UI.IsVisible(UIJiugongge) then
    UIJiugongge.UpdateUI();
    UIJiugongge.UpdatePassCount();
  end
end

function Jiugongge.CheckMainFunctionRedDot()
  UIFestival.UpdateRedDot();

  for k, v in pairs(this.gridKind) do
    for kk, vv in pairs(this.grid[v.Id].awards) do
      if vv.canGetAward == 1 then
        if k ~= EJiugongge.Festival then
          RedDot.Add(ERedDot.Jiugongge);
          return
        end
      end
    end
  end

  RedDot.Remove(ERedDot.Jiugongge);
end

function Jiugongge.Demo17()
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

function Jiugongge.Demo18()
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

function Jiugongge.Demo19()
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