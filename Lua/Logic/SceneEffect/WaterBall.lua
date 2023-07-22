WaterBall = {};
WaterBall.__index = WaterBall;

function WaterBall.Demo()
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

local tempVec = Vector3.New(0, 0, 0);
local creatTickCount = 0;
local root = nil;

local aAllPage = 0;
local bmpName = "";
local tempX = 0;
local tempY = 0;
local aSpeed = 0;

function WaterBall.New(GId, UseID, TargetID, UseX, UseY, TargetX, TargetY, aBallKind)
  local self = {};
  setmetatable(self, WaterBall);

  self.step = 1;
  self.useID = UseID;
  self.targetID = TargetID;
--  WaterBall[idx].tempUsePose = TempUsePose;
--  WaterBall[idx].tempTargetPose = TempTargetPose;
  self.useX  = UseX;
  self.useY  = UseY;
  self.targetX  = TargetX;
  self.targetY  = TargetY;
  self.ballKind  = aBallKind;
  self.waterBall = EffectLight.New(tostring(GId), 500, 1, 1, 1, EEffectLightTracer.Curve, UseX, UseY - SceneEffect.WaterBallBeginY, 255, true, 1, TargetX, TargetY - SceneEffect.WaterBallBeginY, 0.26, nil, true); --預設光影值
  self.waterBall:SetSortingOrder(MapManager.mapHeight);

  return self;
end

local waterBall = {};

function WaterBall.Demo1()
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

function WaterBall.Demo2()
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

function WaterBall.Start()
  CGTimer.AddListener(WaterBall.Update, 0, false);
end

function WaterBall.Create(GID, UseID, TargetID, UseX, UseY, TargetX, TargetY, aBallKind)
  for i = 1, SceneEffect.MaxWaterBall do
    if waterBall[i] == nil then              
      waterBall[i] = WaterBall.New(GID, UseID, TargetID, UseX, UseY, TargetX, TargetY, aBallKind);
      break;
    end
  end

  WaterBall.Start();
end

local bmpName = 0;
local randomNum = 0;

function WaterBall.Demo3()
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

function WaterBall.Demo4()
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

function WaterBall.Update()
  for i = 1, SceneEffect.MaxWaterBall do
    if waterBall[i] ~= nil then
      if waterBall[i].step == 1 then
        if waterBall[i].waterBall.picId == 0 then
          waterBall[i].step = waterBall[i].step + 1;
        end
      elseif waterBall[i].step == 2 then

        if waterBall[i].useID == Role.playerId then
          Role.player:SetAnimationForceId(ERolePose.Stand);--回復使用水球玩家姿勢
        else
          if Role.players[waterBall[i].useID] ~= nil then
            Role.players[waterBall[i].useID]:SetAnimationForceId(ERolePose.Stand);--回復使用水球玩家姿勢
          end
        end

        if waterBall[i].targetID == Role.playerId then
          Role.player:SetAnimationForceId(ERolePose.Hit);
        else
          if Role.players[waterBall[i].targetID] ~= nil then
            Role.players[waterBall[i].targetID]:SetAnimationForceId(ERolePose.Hit);
          end
        end

        if waterBall[i].ballKind == 1 then
          randomNum = math.random(3) + 5; --亂數選要播哪一張水球光影(3選1)
          bmpName = 1004 * 10 + randomNum;
          if randomNum == 6 then
            waterBall[i].waterBall = EffectLight.New(bmpName, 100, 1, 13, 13, EEffectLightTracer.StandAni, waterBall[i].targetX, waterBall[i].targetY,30, true, 0, nil, nil, nil, nil, true); --預設光影值
            waterBall[i].waterBall:SetSortingOrder(MapManager.mapHeight);
          elseif randomNum == 7 then
            waterBall[i].waterBall = EffectLight.New(bmpName, 100, 1, 11, 11, EEffectLightTracer.StandAni, waterBall[i].targetX + 40, waterBall[i].targetY + 120, 30, true, 0, nil, nil, nil, nil, true); --預設光影值
            waterBall[i].waterBall:SetSortingOrder(MapManager.mapHeight);
          elseif randomNum == 8 then
            waterBall[i].waterBall = EffectLight.New(bmpName, 100, 1, 4, 4, EEffectLightTracer.StandAni, waterBall[i].targetX, waterBall[i].targetY, 255, true, 0, nil, nil, nil, nil, true); --預設光影值
            waterBall[i].waterBall:SetSortingOrder(MapManager.mapHeight);
          end
        elseif WaterBall[i].ballKind == 2 then
          randomNum = math.random(2) + 2; --亂數選要播哪一張水球光影(3選1)
          bmpName = 1076 * 10 + randomNum;
          if randomNum == 3 then
            waterBall[i].waterBall = EffectLight.New(bmpName, 100, 1, 13, 13, EEffectLightTracer.StandAni, waterBall[i].targetX, waterBall[i].targetY, 255, true, 0, nil, nil, nil, nil, true); --預設光影值
            waterBall[i].waterBall:SetSortingOrder(MapManager.mapHeight);
          elseif randomNum == 4 then
            waterBall[i].waterBall = EffectLight.New(bmpName, 100, 1, 11, 11, EEffectLightTracer.StandAni, waterBall[i].targetX + 40, waterBall[i].targetY + 120, 255, true, 0, nil, nil, nil, nil, true); --預設光影值
            waterBall[i].waterBall:SetSortingOrder(MapManager.mapHeight);
          end
        end

        waterBall[i].step = waterBall[i].step + 1;
      elseif waterBall[i].step == 3 then
        if waterBall[i].waterBall.picId == 0 then    --如果第三個(水球)光影播放完畢
          if waterBall[i].targetID == Role.playerId then
            Role.player:SetAnimationForceId(ERolePose.Stand);--回復被丟水球玩家姿勢
          else
            if Role.players[waterBall[i].targetID] ~= nil then
              Role.players[waterBall[i].targetID]:SetAnimationForceId(ERolePose.Stand);--回復被丟水球玩家姿勢
            end
          end

          waterBall[i].waterBall:Free(); --釋放水球光影
          waterBall[i] = nil;
        end
      end
    end
  end
end

function WaterBall.Stop()
  CGTimer.RemoveListener(WaterBall.Update);

  for i = 1, SceneEffect.MaxWaterBall do
    if waterBall[i] ~= nil and waterBall[i].gameObject ~= nil then
      poolMgr:Release("BaseSceneEffect", waterBall[i].gameObject);
    end

    waterBall[i] = nil;
  end
end

function WaterBall.Demo5()
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

function WaterBall.Demo6()
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

function WaterBall.Demo7()
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