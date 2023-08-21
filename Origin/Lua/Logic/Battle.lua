
EBattleMode = {
  None = 0, --無(以兩小時為限)
  Check = 1, --殺敵點模式
  Attack = 2, --任務模式
}

EBattleScene = {
  None = 0, --無
  Camp = 1, --軍營
  Fight = 2, --戰役的戰場
  Big = 3, --準備區
}

battleDatas = {};

--戰役
Battle = {}
local this = Battle;

this.battleId = 0; --主角參與的戰役ID
this.killPoint = 0; --主角殺敵點
this.accumulateKillPoint = 0; --主角累計殺敵點
this.enemyKilledCount = 0; --個人單場殺敵數

this.mode = EBattleMode.None;
this.scene = EBattleScene.None;

function Battle.Initialize()
  --======================================大興山之戰========================================
  battleDatas[1] = {};
  battleDatas[1].name = 80182;

  --戰役場景
  battleDatas[1].battleScene = {};

  battleDatas[1].battleScene[1] = {};
  battleDatas[1].battleScene[1].sceneId = 49701; --主戰場
  battleDatas[1].battleScene[1].position = Vector2.New(600, 1650);

  battleDatas[1].battleScene[2] = {};
  battleDatas[1].battleScene[2].sceneId = 49702;
  battleDatas[1].battleScene[2].position = Vector2.New(4010, 310);

  battleDatas[1].battleScene[3] = {};
  battleDatas[1].battleScene[3].sceneId = 49703;
  battleDatas[1].battleScene[3].position = Vector2.New(230, 2430);

  battleDatas[1].battleScene[4] = {};
  battleDatas[1].battleScene[4].sceneId = 49704;
  battleDatas[1].battleScene[4].position = Vector2.New(250, 210);

  battleDatas[1].battleScene[5] = {};
  battleDatas[1].battleScene[5].sceneId = 49705;
  battleDatas[1].battleScene[5].position = Vector2.New(2150, 2430);

  battleDatas[1].battleScene[6] = {};
  battleDatas[1].battleScene[6].sceneId = 49706;
  battleDatas[1].battleScene[6].position = Vector2.New(1290, 1770);

  --軍帳
  battleDatas[1].campSceneInfo = {};
  battleDatas[1].campSceneInfo.sceneId = 49708;
  battleDatas[1].campSceneInfo.position = Vector2.New(800, 600);

  battleDatas[1].mode = EBattleMode.None; --戰役模式
  battleDatas[1].maxJoin = 300; --參加戰役人數
  battleDatas[1].needKillPoint = 40000; --戰役需求殺敵數
  battleDatas[1].maxDestroyed = 2; --被毀壞數
  battleDatas[1].maxKeyDestroyed = 0; --NPC被毀壞數

  --======================================鉅鹿之戰========================================
  battleDatas[2] = {};
  battleDatas[2].name = 80183;

  --戰役場景
  battleDatas[2].battleScene = {};

  battleDatas[2].battleScene[1] = {};
  battleDatas[2].battleScene[1].sceneId = 49711; --主戰場
  battleDatas[2].battleScene[1].position = Vector2.New(600, 1650);

  battleDatas[2].battleScene[2] = {};
  battleDatas[2].battleScene[2].sceneId = 49712;
  battleDatas[2].battleScene[2].position = Vector2.New(262, 275);

  battleDatas[2].battleScene[3] = {};
  battleDatas[2].battleScene[3].sceneId = 49713;
  battleDatas[2].battleScene[3].position = Vector2.New(3062, 355);

  battleDatas[2].battleScene[4] = {};
  battleDatas[2].battleScene[4].sceneId = 49714;
  battleDatas[2].battleScene[4].position = Vector2.New(302, 295);

  battleDatas[2].battleScene[5] = {};
  battleDatas[2].battleScene[5].sceneId = 49715;
  battleDatas[2].battleScene[5].position = Vector2.New(2150, 2430);

  battleDatas[2].battleScene[6] = {};
  battleDatas[2].battleScene[6].sceneId = 49716;
  battleDatas[2].battleScene[6].position = Vector2.New(1290, 1770);

  battleDatas[2].battleScene[7] = {};
  battleDatas[2].battleScene[7].sceneId = 49717;
  battleDatas[2].battleScene[7].position = Vector2.New(1290, 1770);

  battleDatas[2].battleScene[8] = {};
  battleDatas[2].battleScene[8].sceneId = 49718;
  battleDatas[2].battleScene[8].position = Vector2.New(1290, 1770);

  battleDatas[2].battleScene[9] = {};
  battleDatas[2].battleScene[9].sceneId = 49719;
  battleDatas[2].battleScene[9].position = Vector2.New(1290, 1770);

  battleDatas[2].battleScene[10] = {};
  battleDatas[2].battleScene[10].sceneId = 49720;
  battleDatas[2].battleScene[10].position = Vector2.New(1290, 1770);

  --軍帳
  battleDatas[2].campSceneInfo = {};
  battleDatas[2].campSceneInfo.sceneId = 49721;
  battleDatas[2].campSceneInfo.position = Vector2.New(800, 600);

  battleDatas[2].mode = EBattleMode.None; --戰役模式
  battleDatas[2].maxJoin = 300; --參加戰役人數
  battleDatas[2].needKillPoint = 60000; --戰役需求殺敵數
  battleDatas[2].maxDestroyed = 2; --被毀壞數
  battleDatas[2].maxKeyDestroyed = 0; --NPC被毀壞數

  --===================================董卓討伐戰===================================
  battleDatas[3] = {};
  battleDatas[3].name = 80184;

  --戰役場景
  battleDatas[3].battleScene = {};

  battleDatas[3].battleScene[1] = {};
  battleDatas[3].battleScene[1].sceneId = 49731; --主戰場
  battleDatas[3].battleScene[1].position = Vector2.New(600, 1650);

  battleDatas[3].battleScene[2] = {};
  battleDatas[3].battleScene[2].sceneId = 49732;
  battleDatas[3].battleScene[2].position = Vector2.New(4010, 310);

  battleDatas[3].battleScene[3] = {};
  battleDatas[3].battleScene[3].sceneId = 49733;
  battleDatas[3].battleScene[3].position = Vector2.New(4010, 310);

  battleDatas[3].battleScene[4] = {};
  battleDatas[3].battleScene[4].sceneId = 49734;
  battleDatas[3].battleScene[4].position = Vector2.New(4010, 310);

  battleDatas[3].battleScene[5] = {};
  battleDatas[3].battleScene[5].sceneId = 49735;
  battleDatas[3].battleScene[5].position = Vector2.New(4010, 310);

  battleDatas[3].battleScene[6] = {};
  battleDatas[3].battleScene[6].sceneId = 49736;
  battleDatas[3].battleScene[6].position = Vector2.New(4010, 310);

  battleDatas[3].battleScene[7] = {};
  battleDatas[3].battleScene[7].sceneId = 49737;
  battleDatas[3].battleScene[7].position = Vector2.New(4010, 310);

  --軍帳
  battleDatas[3].campSceneInfo = {};
  battleDatas[3].campSceneInfo.sceneId = 49738;
  battleDatas[3].campSceneInfo.position = Vector2.New(800, 600);

  battleDatas[3].mode = EBattleMode.Attack; --戰役模式
  battleDatas[3].maxJoin = 300; --參加戰役人數
  battleDatas[3].needKillPoint = 0; --戰役需求殺敵數
  battleDatas[3].maxDestroyed = 2; --被毀壞數
  battleDatas[3].maxKeyDestroyed = 1; --NPC被毀壞數
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
end

function Battle.GetSceneKind(sceneId)
  --從所有資料裡找出是否是戰場
  for k, v in pairs(battleDatas) do
    --軍營
    if v.campSceneInfo.sceneId == sceneId then
      return EBattleScene.Camp;
    end

    --戰場
    for kk, vv in pairs(v.battleScene) do
      if vv.sceneId == sceneId then
        return EBattleScene.Fight;
      end
    end
  end

  return EBattleMode.None;
end