require "Logic/SceneEffect/Leaf"
require "Logic/SceneEffect/Snow"
require "Logic/SceneEffect/Rain"
require "Logic/SceneEffect/Star"
require "Logic/SceneEffect/OnlyRain"
require "Logic/SceneEffect/Bribe"
require "Logic/SceneEffect/FireWork"
require "Logic/SceneEffect/WaterBall"
require "Logic/SceneEffect/Egg"
require "Logic/SceneEffect/Cloud"
require "Logic/SceneEffect/Dragon"

SceneEffect = {};

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

local this = SceneEffect;

this.FT_MaxLeaf     = 15;                     --同場景最多落葉量
this.LeafPicName    = 'SceneEffect_Leave';    --落葉圖檔名
this.LeafCreateTime = 500 * 0.001;            --生成落葉的時間(毫秒)
this.LeafArriveTime = 0;                      --落葉落地停留時間(毫秒)
this.LeafFrameCount = 5;                      --落葉圖檔切換張數

this.FT_MaxSnow     = 100;                    --同場景最多雪花量
this.SnowPicName1   = 'SceneEffect_Snow1';    --雪花圖檔名1(出現機率較高)
this.SnowPicName2   = 'SceneEffect_Snow2';    --雪花圖檔名2(出現機率較低)
this.SnowCreateTime = 500 * 0.001;            --生成雪花的時間(毫秒)
this.SnowArriveTime = 0;                      --雪花落地停留時間(毫秒)
this.SnowFrameCount = 4;                      --雪花圖檔切換張數

this.FT_MaxRain     = 200;                    --同場景最多下雨量
this.RainPicName1   = 'SceneEffect_Rain1';    --下雨圖檔名1(出現機率較高)
this.RainPicName2   = 'SceneEffect_Rain2';    --下雨圖檔名2(出現機率較低)
this.RainCreateTime = 30 * 0.001;             --生成下雨的時間(毫秒)
this.RainArriveTime = 450 * 0.001;            --下雨落地停留時間(毫秒)
this.RainFrameCount = 4;                      --下雨圖檔切換張數

this.FT_MaxStar     = 10;                     --同場景最多星星量
this.StarPicName1   = 'SceneEffect_Star';     --星空圖檔名1(出現機率較高)
this.StarPicName2   = 'SceneEffect_Star';     --星空圖檔名2(出現機率較低)
this.StarCreateTime = 2000 * 0.001;           --生成星空的時間(毫秒)
this.StarArriveTime = 0;                      --星空落地停留時間(毫秒)
this.StarFrameCount = 11;                     --星空圖檔切換張數

this.FT_MaxBribe     = 255;                   --同場景最多落下量
this.BribePicName1   = 'SceneEffect_Bribe1';  --檔名
this.BribePicName2   = 'SceneEffect_Bribe2';  --檔名
this.BribePicName3   = 'SceneEffect_Bribe3';  --檔名
this.BribeCreateTime = 500 * 0.001;           --生成的時間(毫秒)
this.BribeArriveTime = 10 * 0.001 ;           --落地停留時間(毫秒)
this.BribeFrameCount = 6;                     --圖檔切換張數

--純下雨
this.MaxOnlyRain        = 150;                --同場景最多下雨量
this.OnlyRainPicName1   = 'SceneEffect_Rain1';--下雨圖檔名1(出現機率較高)
this.OnlyRainPicName2   = 'SceneEffect_Rain2';--下雨圖檔名2(出現機率較低)
this.OnlyRainCreateTime = 30 * 0.001;         --生成下雨的時間(毫秒)
this.OnlyRainArriveTime = 450 * 0.001;        --下雨落地停留時間(毫秒)
this.OnlyRainFrameCount = 6;                  --下雨圖檔切換張數

--大地圖雲
this.MaxCloud = 4;                             --同場景最多大地圖雲量
this.CloudCreateTime = 4000 * 0.001;           --生成大地圖雲的時間(毫秒)
this.CloudArriveTime = 0;                      --大地圖雲停留時間(毫秒)

--大地圖地獄場景光影
this.MaxDragon = 15;                           --大地圖光影的數量
this.DragonName1 = 'L10579';                   --小型右飛
this.DragonName2 = 'L10578';                   --小型左飛
this.DragonName3 = 'L10581';                   --大型右飛
this.DragonName4 = 'L10580';                   --大型左飛

--煙火
this.MaxFirework = 150;                       --同場景最多煙火量
this.MaxFireNum = 7;                          --歡樂煙火
this.MaxAnniversaryFireNum = 5;               --週年慶煙火

--水球
this.MaxWaterBall = 150;                      --同場景最多水球量
this.WaterBallBeginY = 30;                    --水球丟出的位置修正
this.FireAttackID = 38134;                    --煙火攻擊NPCID

--轉蛋
this.EggPicName = 'L10552';
this.EggFrameCount = 4;                       --egg圖檔張數

--跨年煙火
this.NewYearFireworkCount = 3;

local showEffectKind = {};
local maxNewYearFireworkCount = 0;
local currentNewYearFireworkCount = 0;
local currentNewYearSec = 0;
local setCount = 0;

function SceneEffect.OpenEffect(eSceneEffect)
  table.insert(showEffectKind, tonumber(eSceneEffect));
  this.Start();

  if not UI.IsVisible(UIShowSceneEffect) then
    UI.Open(UIShowSceneEffect);
  end
end

function SceneEffect.CloseEffect()
  UI.Close(UIShowSceneEffect);

  this.Stop();
end

function SceneEffect.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function SceneEffect.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function SceneEffect.Start()
  if table.Contains(showEffectKind, ESceneEffect.Leaf) then
    CGTimer.AddListener(Leaf.Update, 0, false);
  end

  if table.Contains(showEffectKind, ESceneEffect.Snow) then
    CGTimer.AddListener(Snow.Update, 0, false);
  end

  if table.Contains(showEffectKind, ESceneEffect.Rain) then
    CGTimer.AddListener(Rain.Update, 0, false);
  end

  if table.Contains(showEffectKind, ESceneEffect.Dark) then
  end

  if table.Contains(showEffectKind, ESceneEffect.Star) then
    CGTimer.AddListener(Star.Update, 0, false);
  end

  if table.Contains(showEffectKind, ESceneEffect.OnlyRain) then
    CGTimer.AddListener(OnlyRain.Update, 0, false);
  end

  if table.Contains(showEffectKind, ESceneEffect.Cloud) then
    CGTimer.AddListener(Cloud.Update, 0, false);
  end

  if table.Contains(showEffectKind, ESceneEffect.Dragon) then
    CGTimer.AddListener(Dragon.Update, 0, false);
  end
end

function SceneEffect.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function SceneEffect.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function SceneEffect.Stop()
  if table.Contains(showEffectKind, ESceneEffect.Leaf) then
    Leaf.Stop();
  end

  if table.Contains(showEffectKind, ESceneEffect.Snow) then
    Snow.Stop();
  end

  if table.Contains(showEffectKind, ESceneEffect.Rain) then
    Rain.Stop();
  end

  if table.Contains(showEffectKind, ESceneEffect.Dark) then
  end

  if table.Contains(showEffectKind, ESceneEffect.Star) then
    Star.Stop();
  end

  if table.Contains(showEffectKind, ESceneEffect.OnlyRain) then
    OnlyRain.Stop();
  end

  if table.Contains(showEffectKind, ESceneEffect.Cloud) then
    Cloud.Stop();
  end

  if table.Contains(showEffectKind, ESceneEffect.Dragon) then
    Dragon.Stop();
  end

  CGTimer.RemoveListener(this.StartNewYearFirework);
  CGTimer.RemoveListener(this.StartNewYearCountDown);

  Firework.Stop();
  WaterBall.Stop()

  table.Clear(showEffectKind);
end

function SceneEffect.SetShowEffectSW(sceneId, sceneType)
  this.Stop();

  local missioin = nil;

  if aSceneID == 0 then 
    return;
  end
  
  if sceneType == ESceneType.Map then
    if sceneId == 60000 then
      table.insert(showEffectKind, ESceneEffect.Dragon);      
    else
      table.insert(showEffectKind, ESceneEffect.Cloud);
    end
  end

  if sceneDatas[sceneId] ~= nil then
    table.insert(showEffectKind, sceneDatas[sceneId].effect);
  end

  if sceneId == 12005 then
    table.insert(showEffectKind, ESceneEffect.Leaf);

  elseif sceneId == 12421 or (sceneId >= 12815 and sceneId <= 12820) --盧龍口,盧龍雪堆
      or sceneId == 19001 or sceneId == 19002 or sceneId == 19011 or sceneId == 19021 --襄平城門,襄平大街,望平村,烏桓部落
      or sceneId == 10992 or sceneId == 10963 or sceneId == 10964 then --耶誕活動場景
    table.insert(showEffectKind, ESceneEffect.Snow);

  elseif sceneId >= 21861 and sceneId <= 21864 then --華容道
    --如果有11024或11036這兩個標記
    missioin = MarkManager.GetMission(11024);

    if missioin ~= nil and missioin.step > 0 then
      table.insert(showEffectKind, ESceneEffect.OnlyRain); --下雨
    end

    if not table.Contains(showEffectKind, ESceneEffect.OnlyRain) then
      missioin = MarkManager.GetMission(11036); --看有無標記

      if missioin ~= nil and missioin.step > 0 then
        table.insert(showEffectKind, ESceneEffect.OnlyRain); --下雨
      end 
    end

  elseif sceneId == 25453 then
    missioin = MarkManager.GetMission(11400);

    if missioin ~= nil and missioin.step == 2 then --如果有11400這個標記 and 標記=2
      table.insert(showEffectKind, ESceneEffect.OnlyRain); --下雨
    end

  elseif sceneId == 13017 then
    missioin = MarkManager.GetMission(11602);
    
    if missioin ~= nil and missioin.step == 5 then --如果有11602這個標記 and 標記=5
      table.insert(showEffectKind, ESceneEffect.OnlyRain); --下雨
    end
  
  elseif sceneId == 54811 or sceneId == 54812 or sceneId == 49811 then
    table.insert(showEffectKind, ESceneEffect.Dark);
    table.insert(showEffectKind, ESceneEffect.Star);
  end

  if table.Count(showEffectKind) ~= 0 then
    UI.Open(UIShowSceneEffect);  
  end

  this.Start();
end

function SceneEffect.GetRandom(center, shfit)                                                                
  if math.random(100) > 50 then                                    
    center = center + math.random(shfit)
  else
    center = center - math.random(shfit);                      
  end

  return center;
end

function SceneEffect.Trash4()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function SceneEffect.Trash5()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function SceneEffect.Trash6()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function SceneEffect.GetFireworkData(data)
  local kind = data:ReadByte();
  if kind == 1 or kind == 3 then
    local mapX = data:ReadUInt16();
    local mapY = data:ReadUInt16();
    local count = data:ReadByte();
    for i = 1, count do
      Firework.Create(i, kind, mapX, mapY, count);
    end
  elseif kind == 2 then
    SceneEffect.InitNewYearCountDown( data:ReadByte() );
  elseif kind == 4 then
    local mapX = data:ReadUInt16();
    local mapY = data:ReadUInt16();
    local count = data:ReadByte();
    local index = data:ReadUInt16(); 
    if index ~= 0 then
      if Role.mapNpcs[index] ~= nil then
        if Role.mapNpcs[index].npcId == SceneEffect.FireAttackID then
          mapX = Role.mapNpcs[index].position.x;
          mapY = Role.mapNpcs[index].position.y;
        end
      end
    end
    for i = 1, count do
      Firework.Create(i, 1, mapX, mapY, count);
    end
  elseif kind == 5 then
    UIPlayAnimation.Play(UIPlayAnimation.EKind.NewYear);
    SceneEffect.InitNewYearFirework();
  end
end

function SceneEffect.InitNewYearFirework()
  maxNewYearFireworkCount = table.Count(fireWorkPositionDatas);
  setCount = 1;
  local count , time = SceneEffect.GetFireworkCount();
  currentNewYearFireworkCount = count;
  CGTimer.AddListener(this.StartNewYearFirework, time, false);
end

function SceneEffect.StartNewYearFirework()
  if currentNewYearFireworkCount > maxNewYearFireworkCount then
    CGTimer.RemoveListener(this.StartNewYearFirework);
  else
    for i = 1, FireworkPositionData.MaxPosition do
      if fireWorkPositionDatas[currentNewYearFireworkCount] ~= nil and Scene.IsInCurrentView(fireWorkPositionDatas[currentNewYearFireworkCount].position[i].x, fireWorkPositionDatas[currentNewYearFireworkCount].position[i].y) then
        Firework.Create(setCount, 1, fireWorkPositionDatas[currentNewYearFireworkCount].position[i].x, fireWorkPositionDatas[currentNewYearFireworkCount].position[i].y, this.NewYearFireworkCount);
      end
    end
    setCount = setCount + 1;
    if setCount >= this.NewYearFireworkCount then
      setCount = 1;
      currentNewYearFireworkCount = currentNewYearFireworkCount + 1;
    end
  end
end

function SceneEffect.GetFireworkCount()
  local activity = activityTimes[81][1];--跨年煙火
  local startTime = DateTime.New(activity.endYear, activity.endMonth, activity.endDay, 0, 0, 0);
  local endTime = activity:GetEndDate();
  local totalSec = endTime:Subtract(startTime).TotalSeconds
  local leftSec = endTime:Subtract(CGTimer.serverTime).TotalSeconds
  local count = maxNewYearFireworkCount;

  if leftSec > 0 then
    count = maxNewYearFireworkCount - math.floor(leftSec / totalSec * maxNewYearFireworkCount) + 1; --計算剩下的煙火數
  end

  return count, ( totalSec / maxNewYearFireworkCount / this.NewYearFireworkCount ); -- 計算施放間隔時間
end

function SceneEffect.InitNewYearCountDown(count)
  currentNewYearSec = count;
  UIPlayAnimation.Play(UIPlayAnimation.EKind.CountDown, currentNewYearSec);
  CGTimer.AddListener(this.StartNewYearCountDown, 1, false);
end

function SceneEffect.StartNewYearCountDown()
  currentNewYearSec = currentNewYearSec - 1;
  if currentNewYearSec <= 0 then
    CGTimer.RemoveListener(this.StartNewYearCountDown);
  else
    UIPlayAnimation.Play(UIPlayAnimation.EKind.CountDown, currentNewYearSec);
  end
end

function SceneEffect.Trash7()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function SceneEffect.Trash8()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function SceneEffect.GetWaterBallData(data)
  local gID;
  local targetX, targetY, useX, useY;
  local targetID, useID;
  local ballKind;

--  local kind = data:ReadByte();
  useID = data:ReadInt64();         --使用水球的玩家ID 
  targetID = data:ReadInt64();      --被丟水球的玩家ID
  ballKind = data:ReadByte();

  if ballKind == 1 then
    gID = itemDatas[46089].iconId;--水球
  elseif ballKind == 2 then
    gID = itemDatas[46193].iconId;--雪球
  else
    ballKind = 1;
    gID = itemDatas[46089].iconId;--水球
  end

  if targetID == Role.playerId then
    targetX = Role.player.position.x;
    targetY = Role.player.position.y;
  else
    if Role.players[targetID] == nil then
      return;
    end
    targetX = Role.players[targetID].position.x;
    targetY = Role.players[targetID].position.y;
  end

  if useID == Role.playerId then
    useX = Role.player.position.x;
    useY = Role.player.position.y;
    Role.player:SetAnimationForceId(ERolePose.Attack);
  else
    if Role.players[useID] == nil then
      return;
    end
    useX = Role.players[useID].position.x;
    useY = Role.players[useID].position.y;
    Role.players[useID]:SetAnimationForceId(ERolePose.Attack);
  end

  WaterBall.Create(gID, useID, targetID, useX, useY, targetX, targetY, ballKind)
end

local tempVec = Vector3.New(0, 0, 0);

function SceneEffect.GetPosition(data)
  local dx,dy,sx,sy,dsx,dsy;
  local moveDist,vx,vy;  --移動距離

  vx = 0;
  vy = 0;
  moveDist = CGTimer.deltaTime * data.speed;

  dx = math.abs(data.ObjX - data.showX);
  dy = math.abs(data.ObjY - data.showY);

  if (dx < moveDist) and (dy < moveDist) then
    data.showX = data.ObjX;
    data.showY = data.ObjY;
    data.arrive = true;
    return;
  end

  sx = 0;
  sy = 0;
  if dy > dx then
    sx = dy/ (dx + 0.001);
  else
    sy = dx/ (dy + 0.001);
  end

  dsx = moveDist / (sx + 0.001);
  dsy = moveDist / (sy +0.001);

  if dsx > moveDist then dsx = moveDist end
  if dsy > moveDist then dsy = moveDist end

  if data.showX < data.ObjX then
    vx = math.round(dsx)
  elseif (data.showX > data.ObjX) then
    vx = -math.round(dsx);
  end

  if data.showY < data.ObjY then
    vy = math.round(dsy)
  elseif (data.showY > data.ObjY) then
    vy = -math.round(dsy);
  end

  data.showX = data.showX + vx;
  data.showY = data.showY + vy;

  tempVec.x = (data.showX - Scene.cameraPosition.x) * UI.scale * Scene.cameraScale;
  tempVec.y = (Scene.cameraPosition.y - data.showY) * UI.scale * Scene.cameraScale;
  data.rectTransform.anchoredPosition = tempVec;
end

function SceneEffect.TrashA()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function SceneEffect.TrashB()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function SceneEffect.TrashC()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function SceneEffect.TrashD()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end