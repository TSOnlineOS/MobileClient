Eve_NpcData = {}
Eve_NpcData.__index = Eve_NpcData

function Eve_NpcData.Random()
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

function Eve_NpcData.Random1()
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

function Eve_NpcData.Random2()
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

function Eve_NpcData.New(reader) 
  local self = {};
  setmetatable(self, Eve_NpcData);
  
  self.id = reader:ReadUInt16();
  self.npcId = reader:ReadUInt16();
  self.eventCount = reader:ReadUInt16();
  self.events = {};
  for i = 1, self.eventCount do
	  self.events[i] = reader:ReadByte();
  end

  self.saleKindCount = reader:ReadByte();
  self.saleKinds = {};
  for i = 1, self.saleKindCount do
	  self.saleKinds[i] = reader:ReadByte();
  end

  self.motionNodeCount = reader:ReadByte();
  self.motionNodes = {}; --存放每一點的位置 [0]=[MotionWidth, MotionHeight]儲存移動區域的長寬 ex:[1]=[RoleGridX,RoleGridY]
  for i = 0, self.motionNodeCount do
	  self.motionNodes[i] = Vector2.zero;
    self.motionNodes[i].x = reader:ReadInt32(); --座標系統採用Grid
    self.motionNodes[i].y = reader:ReadInt32(); --座標系統採用Grid
  end

  self.motionType = reader:ReadByte(); --1: 原地不動(default) 2: 任意行走 3: 範圍隨機亂走 4: 依序行走
  self.motionBack = reader:ReadByte(); --當motionType=4時才可設定 1: 只行走到終點立即停止(default) 2: Loop
  self.motionCycleNum = reader:ReadByte();

  self.direction = reader:ReadByte(); --NPC起始面朝方向,逆時鐘方向,由0到7

  self.motionSuspendMS = reader:ReadUInt16(); --npc在每個Node停留時間
  self.motionSpeedLv = reader:ReadByte(); --NPC走路速度級數 1:慢 2:中等 3:快

  self.roleGrid = Rect.New();
  self.roleGrid.x = reader:ReadInt32();
  self.roleGrid.y = reader:ReadInt32();
  self.roleGrid.width = reader:ReadInt32();
  self.roleGrid.height = reader:ReadInt32();

  self.moveOffsetGrid = Vector2.zero;
  self.moveOffsetGrid.x = reader:ReadInt32();
  self.moveOffsetGrid.y = reader:ReadInt32();

  self.position = Vector2.zero;
  self.position.x = reader:ReadInt32(); --紀錄每個npc的座落處(x,y pixel),遊戲主程式專用資訊,EventEditor用不
  self.position.y = reader:ReadInt32();

  self.roleStatus = {}; --紀錄Npc的基本狀態
  self.roleStatus.isHide = reader:ReadBoolean(); --npc為隱藏
  self.roleStatus.isVisible = reader:ReadBoolean(); --npc為顯現
  self.roleStatus.rideNpcId = reader:ReadUInt16(); --npc騎某個npc
  self.roleStatus.canGrow = reader:ReadBoolean(); --1: 可成長的npc, 0: 可是攜帶的npc
  self.roleStatus.isLie = reader:ReadBoolean(); --1: 躺下動作

  self.innerNode = Rect.New(); --內部追擊範圍
  self.innerNode.x = reader:ReadInt32();
  self.innerNode.y = reader:ReadInt32();
  self.innerNode.width = reader:ReadInt32();
  self.innerNode.height = reader:ReadInt32();

  self.outerNode = Rect.New(); --外部追擊範圍
  self.outerNode.x = reader:ReadInt32();
  self.outerNode.y = reader:ReadInt32();
  self.outerNode.width = reader:ReadInt32();
  self.outerNode.height = reader:ReadInt32();

  self.traceSpeedLv = reader:ReadByte(); --NPC走路速度級數 1:慢 2:中等 3:快
  self.traceRadius = reader:ReadUInt16(); --npc Server版追擊欄位    
  self.close = reader:ReadBoolean();

  return self;
end

function Eve_NpcData.Random3()
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

function Eve_NpcData.Random5()
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